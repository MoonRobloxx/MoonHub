-- Freecam.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Camera")
    local running = false
    local connection = nil
    local cameraPart = nil
    local freecamSpeed = 50

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "freecam_enabled",
        Callback = function(value)
            running = value
            local player = game:GetService("Players").LocalPlayer
            local camera = workspace.CurrentCamera

            if running then
                local character = player.Character
                if character then
                    cameraPart = Instance.new("Part")
                    cameraPart.Name = "MoonHub_FreecamPart"
                    cameraPart.Anchored = true
                    cameraPart.Transparency = 1
                    cameraPart.CanCollide = false
                    cameraPart.Size = Vector3.new(0.5, 0.5, 0.5)
                    cameraPart.CFrame = camera.CFrame
                    cameraPart.Parent = workspace
                    camera.CameraSubject = cameraPart
                end

                local userInput = game:GetService("UserInputService")
                connection = game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
                    pcall(function()
                        if cameraPart and cameraPart.Parent then
                            local moveDirection = Vector3.zero

                            if userInput:IsKeyDown(Enum.KeyCode.W) then
                                moveDirection = moveDirection + camera.CFrame.LookVector
                            end
                            if userInput:IsKeyDown(Enum.KeyCode.S) then
                                moveDirection = moveDirection - camera.CFrame.LookVector
                            end
                            if userInput:IsKeyDown(Enum.KeyCode.A) then
                                moveDirection = moveDirection - camera.CFrame.RightVector
                            end
                            if userInput:IsKeyDown(Enum.KeyCode.D) then
                                moveDirection = moveDirection + camera.CFrame.RightVector
                            end
                            if userInput:IsKeyDown(Enum.KeyCode.E) then
                                moveDirection = moveDirection + Vector3.new(0, 1, 0)
                            end
                            if userInput:IsKeyDown(Enum.KeyCode.Q) then
                                moveDirection = moveDirection - Vector3.new(0, 1, 0)
                            end

                            if moveDirection.Magnitude > 0 then
                                moveDirection = moveDirection.Unit
                            end

                            cameraPart.CFrame = cameraPart.CFrame + moveDirection * freecamSpeed * deltaTime
                            camera.CFrame = cameraPart.CFrame
                        end
                    end)
                end)
            else
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
                if cameraPart then
                    cameraPart:Destroy()
                    cameraPart = nil
                end
                pcall(function()
                    local character = player.Character
                    local humanoid = character and character:FindFirstChild("Humanoid")
                    if humanoid then
                        camera.CameraSubject = humanoid
                    end
                end)
            end
        end
    })

    local keybind = Tab:CreateKeybind({
        Name = "Key",
        CurrentKeybind = "C",
        HoldToInteract = false,
        Flag = "freecam_key",
        Callback = function()
            toggle:Set(not running)
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Speed",
        Range = {20, 200},
        Increment = 5,
        Suffix = " studs/s",
        CurrentValue = 50,
        Flag = "freecam_speed",
        Callback = function(value)
            freecamSpeed = value
        end
    })

    return {toggle = toggle, keybind = keybind, slider = slider}
end
