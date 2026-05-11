-- ScriptExecutor.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Script Executor")
    local input = Tab:CreateInput({Name = "Script URL",PlaceholderText = "Paste script URL...",RemoveTextAfterFocusLost = true,Callback = function(t) if t and t ~= "" then local s,e = pcall(function() loadstring(game:HttpGet(t))() end); if not s then Rayfield:LoadNotification({Title = "Error",Content = tostring(e),Duration = 3}) end end end})
    local button = Tab:CreateButton({Name = "Execute from Clipboard",Callback = function() local t = getclipboard(); if t and t ~= "" then pcall(function() loadstring(game:HttpGet(t))() end) end end})
    return {input = input, button = button}
end