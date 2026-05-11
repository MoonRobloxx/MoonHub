-- AutoScreenshot.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Screenshot")
    local running = false
    local interval = 60
    local toggle = Tab:CreateToggle({Name = "Auto Screenshot",CurrentValue = false,Flag = "autoscreenshot_enabled",Callback = function(v) running = v; if v then task.spawn(function() while running do task.wait(interval); pcall(function() writefile("MoonHub_Auto_"..os.time()..".png", game:GetService("CoreGui"):TakeScreenshot()) end) end end) end end})
    local slider = Tab:CreateSlider({Name = "Interval",Range = {5,300},Increment = 5,CurrentValue = 60,Flag = "autoscreenshot_interval",Callback = function(v) interval = v end})
    return {toggle = toggle, slider = slider}
end