-- AutoExecute.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Auto Execute")
    local input = Tab:CreateInput({Name = "Script URL",PlaceholderText = "Paste URL here...",RemoveTextAfterFocusLost = false,Flag = "autoexecute_url",Callback = function(t) if t and t ~= "" then writefile("MoonHub_AutoExec.txt", t) end end})
    local toggle = Tab:CreateToggle({Name = "Auto Execute on Spawn",CurrentValue = false,Flag = "autoexecute_enabled",Callback = function(v) if v then task.spawn(function() pcall(function() local url = readfile("MoonHub_AutoExec.txt"); loadstring(game:HttpGet(url))() end) end) end end})
    return {input = input, toggle = toggle}
end