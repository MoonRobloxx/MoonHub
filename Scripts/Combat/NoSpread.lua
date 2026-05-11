-- NoSpread.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Weapon")
    local running = false

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "nospread_enabled",
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
                                    local gunModule = tool:FindFirstChild("Gun")
                                    if gunModule then
                                        pcall(function()
                                            gunModule.Spread = 0
                                            gunModule.MaxSpread = 0
                                            gunModule.MinSpread = 0
                                        end)
                                    end
                                    local config = tool:FindFirstChild("Configuration")
                                    if config then
                                        pcall(function()
                                            config.Spread = 0
                                            config.MaxSpread = 0
                                            config.MinSpread = 0
                                        end)
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
