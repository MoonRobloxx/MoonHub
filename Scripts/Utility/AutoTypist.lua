-- AutoTypist.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Chat")
    local input = Tab:CreateInput({Name = "Text to Type",PlaceholderText = "Enter text...",RemoveTextAfterFocusLost = true,Callback = function(t) if t then local vim = game:GetService("VirtualInputManager"); for c in t:gmatch(".") do local k = Enum.KeyCode[c:upper()]; if k then vim:SendKeyEvent(true, k, false, nil); task.wait(0.05) end end end end})
    return {input = input}
end