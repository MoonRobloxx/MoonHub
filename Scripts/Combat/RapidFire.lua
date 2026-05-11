-- RapidFire.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Weapon")
    local running = false
    local connection = nil

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "rapidfire_enabled",
        Callback = function(value)
            running = value
            if running then
                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local character = game:GetService("Players").LocalPlayer.Character
                        if not character then
                            return
                        end
                        local tool = character:FindFirstChildWhichIsA("Tool")
                        if tool then
                            tool:Activate()
                            task.wait(0.02)
                            if tool.Parent then
                                tool:Deactivate()
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
