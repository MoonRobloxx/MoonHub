-- NoClip.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Movement")
    local running = false
    local connection = nil
    local noclipSpeed = 32

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "noclip_enabled",
        Callback = function(value)
            running = value
            if running then
                local camera = workspace.CurrentCamera
                connection = game:GetService("RunService").Stepped:Connect(function(_, deltaTime)
                    pcall(function()
                        local player = game:GetService("Players").LocalPlayer
                        local character = player.Character
                        if not character then
                            return
                        end

                        for _, part in ipairs(character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end

                        local humanoid = character:FindFirstChild("Humanoid")
                        local rootPart = character:FindFirstChild("HumanoidRootPart")

                        if humanoid and rootPart then
                            local moveDirection = humanoid.MoveDirection
                            if moveDirection.Magnitude > 0 then
                                local forward = camera.CFrame.LookVector
                                local right = camera.CFrame.RightVector
                                local direction = (forward * moveDirection.Z + right * moveDirection.X).Unit
                                rootPart.CFrame = rootPart.CFrame + direction * noclipSpeed * deltaTime
                            end
                        end
                    end)
                end)
            else
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
                pcall(function()
                    local character = game:GetService("Players").LocalPlayer.Character
                    if character then
                        for _, part in ipairs(character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = true
                            end
                        end
                    end
                end)
            end
        end
    })

    local keybind = Tab:CreateKeybind({
        Name = "Key",
        CurrentKeybind = "N",
        HoldToInteract = false,
        Flag = "noclip_key",
        Callback = function()
            toggle:Set(not running)
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Speed",
        Range = {16, 100},
        Increment = 2,
        Suffix = " studs/s",
        CurrentValue = 32,
        Flag = "noclip_speed",
        Callback = function(value)
            noclipSpeed = value
        end
    })

    return {toggle = toggle, keybind = keybind, slider = slider}
end
