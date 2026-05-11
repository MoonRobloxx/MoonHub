-- FPSUnlocker.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("FPS")
    local slider = Tab:CreateSlider({Name = "FPS Cap",Range = {30,240},Increment = 10,CurrentValue = 240,Flag = "fpsunlocker_value",Callback = function(v) setfpscap(v) end})
    local toggle = Tab:CreateToggle({Name = "Unlimited FPS",CurrentValue = false,Flag = "fpsunlocker_unlimited",Callback = function(v) if v then setfpscap(9999) else setfpscap(slider.CurrentValue or 240) end end})
    return {slider = slider, toggle = toggle}
end