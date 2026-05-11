-- SpeedrunTimer.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Timer")
    local startTime = 0
    local elapsed = 0
    local isRunning = false
    local startBtn = Tab:CreateButton({Name = "Start",Callback = function() if not isRunning then startTime = tick(); isRunning = true end end})
    local stopBtn = Tab:CreateButton({Name = "Stop",Callback = function() if isRunning then elapsed = tick() - startTime; isRunning = false end end})
    local resetBtn = Tab:CreateButton({Name = "Reset",Callback = function() startTime = 0; elapsed = 0; isRunning = false end})
    return {startBtn = startBtn, stopBtn = stopBtn, resetBtn = resetBtn}
end