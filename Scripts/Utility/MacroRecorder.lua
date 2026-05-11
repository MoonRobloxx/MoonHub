-- MacroRecorder.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Macro")
    local recording = false
    local recorded = {}
    local connection = nil
    local startBtn = Tab:CreateButton({Name = "Start Recording",Callback = function() recording = true; recorded = {}; local UIS = game:GetService("UserInputService"); connection = UIS.InputBegan:Connect(function(i) if recording then table.insert(recorded, {input = i, time = tick()}) end end) end})
    local stopBtn = Tab:CreateButton({Name = "Stop Recording",Callback = function() recording = false; if connection then connection:Disconnect(); connection = nil end end})
    local playBtn = Tab:CreateButton({Name = "Play Macro",Callback = function() local vim = game:GetService("VirtualInputManager"); local st = tick(); for _,d in ipairs(recorded) do task.wait(math.max(0, d.time - st)); pcall(function() if d.input.UserInputType == Enum.UserInputType.Keyboard then vim:SendKeyEvent(true, d.input.KeyCode, false, nil) elseif d.input.UserInputType == Enum.UserInputType.MouseButton1 then vim:SendMouseButtonEvent(0,0,0,true,nil,0) end end) end end})
    return {startBtn = startBtn, stopBtn = stopBtn, playBtn = playBtn}
end