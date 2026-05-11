-- HitboxExpander.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Combat")
    local running = false
    local connection = nil
    local expandSize = 3

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "hitbox_enabled",
        Callback = function(value)
            running = value
            if running then
                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    local targetSize = Vector3.new(expandSize, expandSize, expandSize)
                    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer and player.Character then
                            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                            if rootPart then
                                rootPart.Size = targetSize
                            end
                            local head = player.Character:FindFirstChild("Head")
                            if head then
                                head.Size = targetSize
                            end
                        end
                    end
                end)
            else
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
                local defaultSize = Vector3.new(2, 2, 1)
                local defaultHeadSize = Vector3.new(2, 1, 1)
                for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                    pcall(function()
                        if player.Character then
                            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                            if rootPart then
                                rootPart.Size = defaultSize
                            end
                            local head = player.Character:FindFirstChild("Head")
                            if head then
                                head.Size = defaultHeadSize
                            end
                        end
                    end)
                end
            end
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Size",
        Range = {1, 10},
        Increment = 0.5,
        Suffix = " studs",
        CurrentValue = 3,
        Flag = "hitbox_size",
        Callback = function(value)
            expandSize = value
        end
    })

    return {toggle = toggle, slider = slider}
end
