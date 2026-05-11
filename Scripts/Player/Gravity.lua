-- Gravity.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("World")

    local slider = Tab:CreateSlider({
        Name = "Gravity",
        Range = {0, 196},
        Increment = 1,
        Suffix = " studs/s2",
        CurrentValue = 196,
        Flag = "gravity_value",
        Callback = function(value)
            workspace.Gravity = value
        end
    })

    local button = Tab:CreateButton({
        Name = "Reset Gravity",
        Callback = function()
            workspace.Gravity = 196.2
            slider:Set(196)
        end
    })

    return {slider = slider, button = button}
end
