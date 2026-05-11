-- KillAura.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Combat")
    local running = false
    local auraRange = 20

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "killaura_enabled",
        Callback = function(value)
            running = value
            if running then
                task.spawn(function()
                    while running do
                        task.wait(0.2)
                        pcall(function()
                            local localPlayer = game:GetService("Players").LocalPlayer
                            local character = localPlayer.Character
                            if not character then
                                return
                            end

                            local tool = character:FindFirstChildWhichIsA("Tool")
                            if not tool then
                                return
                            end

                            local rootPart = character:FindFirstChild("HumanoidRootPart")
                            if not rootPart then
                                return
                            end

                            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                                if player ~= localPlayer and player.Character then
                                    local enemyRoot = player.Character:FindFirstChild("HumanoidRootPart")
                                    if enemyRoot then
                                        local distance = (enemyRoot.Position - rootPart.Position).Magnitude
                                        if distance <= auraRange then
                                            local humanoid = player.Character:FindFirstChild("Humanoid")
                                            if humanoid and humanoid.Health > 0 then
                                                tool:Activate()
                                                task.wait(0.05)
                                                if tool.Parent then
                                                    tool:Deactivate()
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end)
                    end
                end)
            end
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Range",
        Range = {10, 50},
        Increment = 5,
        Suffix = " studs",
        CurrentValue = 20,
        Flag = "killaura_range",
        Callback = function(value)
            auraRange = value
        end
    })

    return {toggle = toggle, slider = slider}
end
