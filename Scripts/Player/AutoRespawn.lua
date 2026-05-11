-- AutoRespawn.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Automation")
    local running = false
    local respawnDelay = 3

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "autorespawn_enabled",
        Callback = function(value)
            running = value
            if running then
                local player = game:GetService("Players").LocalPlayer
                player.CharacterAdded:Connect(function(character)
                    if not running then
                        return
                    end
                    local humanoid = character:WaitForChild("Humanoid", 5)
                    if humanoid then
                        humanoid.Died:Connect(function()
                            if not running then
                                return
                            end
                            task.wait(respawnDelay)
                            if running then
                                player:LoadCharacter()
                            end
                        end)
                    end
                end)
            end
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Delay",
        Range = {0, 10},
        Increment = 0.5,
        Suffix = " seconds",
        CurrentValue = 3,
        Flag = "autorespawn_delay",
        Callback = function(value)
            respawnDelay = value
        end
    })

    return {toggle = toggle, slider = slider}
end
