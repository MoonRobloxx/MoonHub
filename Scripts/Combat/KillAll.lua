-- KillAll.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Combat")
    local killRange = 200

    local slider = Tab:CreateSlider({
        Name = "Range",
        Range = {50, 500},
        Increment = 10,
        Suffix = " studs",
        CurrentValue = 200,
        Flag = "killall_range",
        Callback = function(value)
            killRange = value
        end
    })

    local button = Tab:CreateButton({
        Name = "Kill All",
        Callback = function()
            pcall(function()
                local localPlayer = game:GetService("Players").LocalPlayer
                local character = localPlayer.Character
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")

                if not rootPart then
                    return
                end

                for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= localPlayer and player.Character then
                        local otherRoot = player.Character:FindFirstChild("HumanoidRootPart")
                        if otherRoot then
                            local distance = (otherRoot.Position - rootPart.Position).Magnitude
                            if distance <= killRange then
                                local humanoid = player.Character:FindFirstChild("Humanoid")
                                if humanoid and humanoid.Health > 0 then
                                    humanoid.Health = 0
                                end
                            end
                        end
                    end
                end
            end)
        end
    })

    return {slider = slider, button = button}
end
