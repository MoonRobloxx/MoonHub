-- TimeChanger.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("World")

    local slider = Tab:CreateSlider({
        Name = "Time",
        Range = {0, 24},
        Increment = 0.5,
        Suffix = " hours",
        CurrentValue = 12,
        Flag = "timechanger_value",
        Callback = function(value)
            game:GetService("Lighting").ClockTime = value
        end
    })

    return {slider = slider}
end
