-- DodgeBot.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Defense")
    local running = false
    local connection = nil

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "dodgebot_enabled",
        Callback = function(value)
            running = value
            if running then
                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local character = game:GetService("Players").LocalPlayer.Character
                        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                        if not rootPart then
                            return
                        end

                        for _, object in ipairs(workspace:GetDescendants()) do
                            if object:IsA("BasePart") then
                                local velocity = object.Velocity
                                if velocity and velocity.Magnitude > 10 then
                                    local distance = (object.Position - rootPart.Position).Magnitude
                                    if distance < 15 then
                                        local dodgeDirection = Vector3.new(math.random(-5, 5), 2, math.random(-5, 5))
                                        rootPart.CFrame = rootPart.CFrame + dodgeDirection
                                        break
                                    end
                                end
                            end
                        end
                    end)
                end)
            else
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
            end
        end
    })

    return {toggle = toggle}
end
