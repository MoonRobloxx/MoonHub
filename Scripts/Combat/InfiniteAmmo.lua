-- InfiniteAmmo.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Weapon")
    local running = false

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "infammo_enabled",
        Callback = function(value)
            running = value
            if running then
                task.spawn(function()
                    while running do
                        task.wait(0.1)
                        pcall(function()
                            local character = game:GetService("Players").LocalPlayer.Character
                            if character then
                                local tool = character:FindFirstChildWhichIsA("Tool")
                                if tool then
                                    local ammo = tool:FindFirstChild("Ammo")
                                    if ammo then
                                        if ammo:IsA("IntValue") then
                                            ammo.Value = 9999
                                        elseif ammo:IsA("NumberValue") then
                                            ammo.Value = 9999
                                        end
                                    end
                                    local maxAmmo = tool:FindFirstChild("MaxAmmo")
                                    if maxAmmo then
                                        if maxAmmo:IsA("IntValue") then
                                            maxAmmo.Value = 9999
                                        elseif maxAmmo:IsA("NumberValue") then
                                            maxAmmo.Value = 9999
                                        end
                                    end
                                    local clipSize = tool:FindFirstChild("ClipSize")
                                    if clipSize then
                                        if clipSize:IsA("IntValue") then
                                            clipSize.Value = 9999
                                        elseif clipSize:IsA("NumberValue") then
                                            clipSize.Value = 9999
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

    return {toggle = toggle}
end
