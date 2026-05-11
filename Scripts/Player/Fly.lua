-- Fly.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Movement")
    local running = false
    local connection = nil
    local bodyGyro = nil
    local bodyVelocity = nil
    local flySpeed = 50

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "fly_enabled",
        Callback = function(value)
            running = value
            local player = game:GetService("Players").LocalPlayer

            if running then
                local character = player.Character or player.CharacterAdded:Wait()
                local rootPart = character:WaitForChild("HumanoidRootPart", 5)
                local humanoid = character:WaitForChild("Humanoid", 5)

                if rootPart then
                    if humanoid then
                        humanoid.PlatformStand = true
                    end

                    bodyGyro = Instance.new("BodyGyro")
                    bodyGyro.Name = "MoonHub_FlyGyro"
                    bodyGyro.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyGyro.P = 10000
                    bodyGyro.D = 100
                    bodyGyro.CFrame = rootPart.CFrame
                    bodyGyro.Parent = rootPart

                    bodyVelocity = Instance.new("BodyVelocity")
                    bodyVelocity.Name = "MoonHub_FlyVelocity"
                    bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyVelocity.P = 50000
                    bodyVelocity.Velocity = Vector3.zero
                    bodyVelocity.Parent = rootPart
                end

                local userInput = game:GetService("UserInputService")
                local runService = game:GetService("RunService")
                local camera = workspace.CurrentCamera

                connection = runService.Heartbeat:Connect(function()
                    pcall(function()
                        if not running then
                            return
                        end
                        if bodyGyro and bodyGyro.Parent and bodyVelocity and bodyVelocity.Parent and rootPart and rootPart.Parent then
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

                            if moveDirection.Magnitude > 1 then
                                moveDirection = moveDirection.Unit
                            end

                            bodyVelocity.Velocity = moveDirection * flySpeed
                            bodyGyro.CFrame = camera.CFrame
                        end
                    end)
                end)
            else
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
                if bodyGyro then
                    bodyGyro:Destroy()
                    bodyGyro = nil
                end
                if bodyVelocity then
                    bodyVelocity:Destroy()
                    bodyVelocity = nil
                end
                pcall(function()
                    local character = player.Character
                    local humanoid = character and character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.PlatformStand = false
                    end
                end)
            end
        end
    })

    local keybind = Tab:CreateKeybind({
        Name = "Toggle Key",
        CurrentKeybind = "F",
        HoldToInteract = false,
        Flag = "fly_key",
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
        Flag = "fly_speed",
        Callback = function(value)
            flySpeed = value
        end
    })

    return {toggle = toggle, keybind = keybind, slider = slider}
end
