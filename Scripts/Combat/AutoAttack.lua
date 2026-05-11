-- AutoAttack.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Combat")
    local running = false
    local attackRange = 50
    local attackRate = 0.5

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "autoattack_enabled",
        Callback = function(value)
            running = value
            if running then
                task.spawn(function()
                    while running do
                        task.wait(attackRate)
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

                            local nearestEnemy = nil
                            local nearestDistance = math.huge

                            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                                if player ~= localPlayer and player.Character then
                                    local enemyRoot = player.Character:FindFirstChild("HumanoidRootPart")
                                    if enemyRoot then
                                        local distance = (enemyRoot.Position - rootPart.Position).Magnitude
                                        if distance <= attackRange and distance < nearestDistance then
                                            nearestDistance = distance
                                            nearestEnemy = player
                                        end
                                    end
                                end
                            end

                            if nearestEnemy and nearestEnemy.Character then
                                tool:Activate()
                                task.wait(0.1)
                                if tool.Parent then
                                    tool:Deactivate()
                                end
                            end
                        end)
                    end
                end)
            end
        end
    })

    local rangeSlider = Tab:CreateSlider({
        Name = "Range",
        Range = {10, 100},
        Increment = 5,
        Suffix = " studs",
        CurrentValue = 50,
        Flag = "autoattack_range",
        Callback = function(value)
            attackRange = value
        end
    })

    local rateSlider = Tab:CreateSlider({
        Name = "Rate",
        Range = {0.1, 2},
        Increment = 0.1,
        Suffix = " seconds",
        CurrentValue = 0.5,
        Flag = "autoattack_rate",
        Callback = function(value)
            attackRate = value
        end
    })

    return {toggle = toggle, rangeSlider = rangeSlider, rateSlider = rateSlider}
end
