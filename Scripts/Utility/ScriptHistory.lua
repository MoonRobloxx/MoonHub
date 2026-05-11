-- ScriptHistory.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("History")
    local history = {}
    local input = Tab:CreateInput({Name = "Log Script",PlaceholderText = "Name or URL...",RemoveTextAfterFocusLost = true,Callback = function(t) if t and t ~= "" then table.insert(history, t); writefile("MoonHub_History.txt", table.concat(history, "\n")) end end})
    local showBtn = Tab:CreateButton({Name = "Print History",Callback = function() pcall(function() print(readfile("MoonHub_History.txt")) end) end})
    return {input = input, showBtn = showBtn}
end