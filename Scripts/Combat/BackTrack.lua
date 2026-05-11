-- BackTrack.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Combat")
    local running = false
    local positionHistory = {}
    local trackDelay = 200

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "backtrack_enabled",
        Callback = function(value)
            running = value
            if running then
                task.spawn(function()
                    while running do
                        task.wait(0.05)
                        local currentTime = tick()
                        local delayInSeconds = trackDelay / 1000

                        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                            if player ~= game:GetService("Players").LocalPlayer and player.Character then
                                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                                if rootPart then
                                    table.insert(positionHistory, {
                                        player = player,
                                        position = rootPart.Position,
                                        timestamp = currentTime
                                    })
                                end
                            end
                        end

                        local cutoffTime = currentTime - 5
                        local newHistory = {}
                        for _, entry in ipairs(positionHistory) do
                            if entry.timestamp >= cutoffTime then
                                table.insert(newHistory, entry)
                            end
                        end
                        positionHistory = newHistory
                    end
                end)
            end
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Delay",
        Range = {0, 1000},
        Increment = 10,
        Suffix = " ms",
        CurrentValue = 200,
        Flag = "backtrack_delay",
        Callback = function(value)
            trackDelay = value
        end
    })

    return {toggle = toggle, slider = slider}
end
