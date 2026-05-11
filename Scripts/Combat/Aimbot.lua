-- Aimbot.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Aimbot")
    local running = false
    local connection = nil
    local fovCircle = nil
    local aimFov = 200
    local aimSmoothness = 5
    local aimTarget = "Head"
    local teamCheck = true
    local drawFov = true

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "aimbot_enabled",
        Callback = function(value)
            running = value
            if running then
                if drawFov then
                    fovCircle = Drawing.new("Circle")
                    fovCircle.Visible = true
                    fovCircle.Thickness = 2
                    fovCircle.Color = Color3.new(1, 1, 1)
                    fovCircle.NumSides = 60
                    fovCircle.Radius = aimFov
                    fovCircle.Position = workspace.CurrentCamera.ViewportSize / 2
                end

                local runService = game:GetService("RunService")
                local userInput = game:GetService("UserInputService")
                local players = game:GetService("Players")
                local camera = workspace.CurrentCamera
                local localPlayer = players.LocalPlayer

                connection = runService.RenderStepped:Connect(function()
                    pcall(function()
                        if fovCircle then
                            fovCircle.Position = camera.ViewportSize / 2
                            fovCircle.Radius = aimFov
                        end

                        local isKeyDown = userInput:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
                        if not isKeyDown then
                            return
                        end

                        local closestTarget = nil
                        local closestDistance = math.huge

                        for _, player in ipairs(players:GetPlayers()) do
                            if player == localPlayer then
                                continue
                            end
                            if not player.Character then
                                continue
                            end
                            if teamCheck and player.Team == localPlayer.Team then
                                continue
                            end

                            local targetPart = player.Character:FindFirstChild(aimTarget)
                            if not targetPart then
                                targetPart = player.Character:FindFirstChild("Head")
                            end
                            if not targetPart then
                                continue
                            end

                            local screenPosition, onScreen = camera:WorldToScreenPoint(targetPart.Position)
                            if not onScreen then
                                continue
                            end

                            local mousePosition = camera.ViewportSize / 2
                            local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - mousePosition).Magnitude

                            if distance < aimFov and distance < closestDistance then
                                closestDistance = distance
                                closestTarget = targetPart
                            end
                        end

                        if closestTarget then
                            local targetCFrame = CFrame.new(camera.CFrame.Position, closestTarget.Position)
                            local smoothFactor = math.clamp(aimSmoothness / 10, 0.1, 1)
                            camera.CFrame = camera.CFrame:Lerp(targetCFrame, smoothFactor)
                        end
                    end)
                end)
            else
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
                if fovCircle then
                    fovCircle:Remove()
                    fovCircle = nil
                end
            end
        end
    })

    local fovSlider = Tab:CreateSlider({
        Name = "FOV",
        Range = {50, 500},
        Increment = 10,
        Suffix = " px",
        CurrentValue = 200,
        Flag = "aimbot_fov",
        Callback = function(value)
            aimFov = value
        end
    })

    local targetDropdown = Tab:CreateDropdown({
        Name = "Target",
        Options = {"Head", "HumanoidRootPart", "Torso", "UpperTorso", "LowerTorso"},
        CurrentOption = "Head",
        Flag = "aimbot_part",
        Callback = function(value)
            aimTarget = value
        end
    })

    local smoothnessSlider = Tab:CreateSlider({
        Name = "Smoothness",
        Range = {1, 20},
        Increment = 1,
        Suffix = "",
        CurrentValue = 5,
        Flag = "aimbot_smooth",
        Callback = function(value)
            aimSmoothness = value
        end
    })

    local teamCheckToggle = Tab:CreateToggle({
        Name = "Team Check",
        CurrentValue = true,
        Flag = "aimbot_team",
        Callback = function(value)
            teamCheck = value
        end
    })

    local drawFovToggle = Tab:CreateToggle({
        Name = "Draw FOV",
        CurrentValue = true,
        Flag = "aimbot_drawfov",
        Callback = function(value)
            drawFov = value
            if running then
                if value and not fovCircle then
                    fovCircle = Drawing.new("Circle")
                    fovCircle.Visible = true
                    fovCircle.Thickness = 2
                    fovCircle.Color = Color3.new(1, 1, 1)
                    fovCircle.NumSides = 60
                    fovCircle.Radius = aimFov
                    fovCircle.Position = workspace.CurrentCamera.ViewportSize / 2
                elseif not value and fovCircle then
                    fovCircle:Remove()
                    fovCircle = nil
                end
            end
        end
    })

    return {
        toggle = toggle,
        fovSlider = fovSlider,
        targetDropdown = targetDropdown,
        smoothnessSlider = smoothnessSlider,
        teamCheckToggle = teamCheckToggle,
        drawFovToggle = drawFovToggle
    }
end
