-- Swim.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Movement")
    local running = false
    local connection = nil
    local bodyVelocity = nil

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "swim_enabled",
        Callback = function(value)
            running = value
            local player = game:GetService("Players").LocalPlayer

            if running then
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid", 5)
                local rootPart = character:WaitForChild("HumanoidRootPart", 5)

                if humanoid and rootPart then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
                    humanoid.State = Enum.HumanoidStateType.Swimming

                    bodyVelocity = Instance.new("BodyVelocity")
                    bodyVelocity.Name = "MoonHub_SwimVelocity"
                    bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
                    bodyVelocity.P = 50000
                    bodyVelocity.Velocity = Vector3.new(0, 2, 0)
                    bodyVelocity.Parent = rootPart
                end

                local userInput = game:GetService("UserInputService")
                local camera = workspace.CurrentCamera

                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        if not running then
                            return
                        end
                        if bodyVelocity and bodyVelocity.Parent then
                            local moveDirection = Vector3.new(0, 2, 0)

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

                            bodyVelocity.Velocity = moveDirection * 30
                        end
                    end)
                end)
            else
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
                if bodyVelocity then
                    bodyVelocity:Destroy()
                    bodyVelocity = nil
                end
                pcall(function()
                    local character = player.Character
                    local humanoid = character and character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.State = Enum.HumanoidStateType.Running
                    end
                end)
            end
        end
    })

    return {toggle = toggle}
end
