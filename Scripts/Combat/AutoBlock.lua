-- AutoBlock.lua
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
        Flag = "autoblock_enabled",
        Callback = function(value)
            running = value
            if running then
                local localPlayer = game:GetService("Players").LocalPlayer

                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local character = localPlayer.Character
                        if not character then
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
                                    if distance < 20 then
                                        local humanoid = character:FindFirstChild("Humanoid")
                                        if humanoid then
                                            humanoid.AutoRotate = false
                                        end
                                        rootPart.CFrame = CFrame.new(rootPart.Position, enemyRoot.Position)
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
                pcall(function()
                    local character = game:GetService("Players").LocalPlayer.Character
                    local humanoid = character and character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.AutoRotate = true
                    end
                end)
            end
        end
    })

    return {toggle = toggle}
end
