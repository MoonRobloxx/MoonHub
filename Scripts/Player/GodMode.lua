-- GodMode.lua
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
        Flag = "godmode_enabled",
        Callback = function(value)
            running = value
            local player = game:GetService("Players").LocalPlayer

            if running then
                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local character = player.Character
                        local humanoid = character and character:FindFirstChild("Humanoid")
                        if humanoid and humanoid.MaxHealth > 0 then
                            humanoid.Health = humanoid.MaxHealth
                            humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                        end
                    end)
                end)

                player.CharacterAdded:Connect(function(character)
                    if not running then
                        return
                    end
                    task.wait(0.1)
                    local humanoid = character:WaitForChild("Humanoid", 5)
                    if humanoid then
                        task.spawn(function()
                            while running and humanoid and humanoid.Parent do
                                task.wait(0.1)
                                pcall(function()
                                    if humanoid.MaxHealth > 0 then
                                        humanoid.Health = humanoid.MaxHealth
                                        humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                                    end
                                end)
                            end
                        end)
                    end
                end)
            else
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
                pcall(function()
                    local character = player.Character
                    local humanoid = character and character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
                    end
                end)
            end
        end
    })

    return {toggle = toggle}
end
