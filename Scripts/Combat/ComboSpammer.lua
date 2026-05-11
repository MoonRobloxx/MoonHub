-- ComboSpammer.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Combat")
    local running = false
    local comboDelay = 0.3
    local comboKeys = {Enum.KeyCode.Z, Enum.KeyCode.X, Enum.KeyCode.C}

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "combospam_enabled",
        Callback = function(value)
            running = value
            if running then
                task.spawn(function()
                    while running do
                        pcall(function()
                            local virtualInput = game:GetService("VirtualInputManager")
                            for _, key in ipairs(comboKeys) do
                                if not running then
                                    break
                                end
                                virtualInput:SendKeyEvent(true, key, false, nil)
                                task.wait(comboDelay)
                                virtualInput:SendKeyEvent(false, key, false, nil)
                                task.wait(comboDelay)
                            end
                        end)
                    end
                end)
            end
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Delay",
        Range = {0.1, 1},
        Increment = 0.05,
        Suffix = " seconds",
        CurrentValue = 0.3,
        Flag = "combo_delay",
        Callback = function(value)
            comboDelay = value
        end
    })

    return {toggle = toggle, slider = slider}
end
