-- TeleportToNearest.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Teleport")

    local button = Tab:CreateButton({
        Name = "TP to Nearest",
        Callback = function()
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")

                if not rootPart then
                    return
                end

                local nearestPlayer = nil
                local nearestDistance = math.huge

                for _, otherPlayer in ipairs(game:GetService("Players"):GetPlayers()) do
                    if otherPlayer ~= player and otherPlayer.Character then
                        local otherRoot = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if otherRoot then
                            local distance = (otherRoot.Position - rootPart.Position).Magnitude
                            if distance < nearestDistance then
                                nearestDistance = distance
                                nearestPlayer = otherPlayer
                            end
                        end
                    end
                end

                if nearestPlayer and nearestPlayer.Character then
                    local targetRoot = nearestPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if targetRoot then
                        rootPart.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 5)
                    end
                end
            end)
        end
    })

    return {button = button}
end
