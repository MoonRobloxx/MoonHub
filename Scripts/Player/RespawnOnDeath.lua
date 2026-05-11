-- RespawnOnDeath.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Automation")
    local running = false

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "respawndeath_enabled",
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
                            if running then
                                player:LoadCharacter()
                            end
                        end)
                    end
                end)
            end
        end
    })

    return {toggle = toggle}
end
