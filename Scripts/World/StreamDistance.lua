-- StreamDistance.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Performance")
    local slider = Tab:CreateSlider({Name = "Stream Distance",Range = {100,10000},Increment = 100,CurrentValue = 1000,Flag = "streamdistance_value",Callback = function(v) workspace.StreamingMinRadius = v; workspace.StreamingTargetRadius = v end})
    return {slider = slider}
end