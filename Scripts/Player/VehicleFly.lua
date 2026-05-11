-- VehicleFly.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Movement")
    local running = false
    local connection = nil
    local bodyVelocity = nil
    local bodyGyro = nil

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "vehiclefly_enabled",
        Callback = function(value)
            running = value
            if running then
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                task.wait(0.5)

                local seat = character and character:FindFirstChildWhichIsA("Seat", true)
                local vehicle = seat and seat.Parent
                local vehicleRoot = vehicle and vehicle:FindFirstChildWhichIsA("BasePart")

                if vehicleRoot then
                    bodyGyro = Instance.new("BodyGyro")
                    bodyGyro.Name = "MoonHub_VehicleGyro"
                    bodyGyro.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyGyro.P = 10000
                    bodyGyro.D = 100
                    bodyGyro.CFrame = vehicleRoot.CFrame
                    bodyGyro.Parent = vehicleRoot

                    bodyVelocity = Instance.new("BodyVelocity")
                    bodyVelocity.Name = "MoonHub_VehicleVelocity"
                    bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyVelocity.P = 50000
                    bodyVelocity.Velocity = Vector3.zero
                    bodyVelocity.Parent = vehicleRoot
                end

                local userInput = game:GetService("UserInputService")
                local camera = workspace.CurrentCamera

                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        if not running then
                            return
                        end
                        if bodyVelocity and bodyVelocity.Parent and bodyGyro and bodyGyro.Parent then
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

                            bodyVelocity.Velocity = moveDirection * 60
                            bodyGyro.CFrame = CFrame.new(bodyGyro.Parent.Position, bodyGyro.Parent.Position + camera.CFrame.LookVector)
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
            end
        end
    })

    return {toggle = toggle}
end
