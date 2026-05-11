-- ChatSpammer.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Chat")
    local running = false
    local message = "."
    local spamDelay = 3
    local input = Tab:CreateInput({Name = "Message",PlaceholderText = "Enter message to spam...",RemoveTextAfterFocusLost = false,Flag = "chatspam_message",Callback = function(t) message = t or "." end})
    local toggle = Tab:CreateToggle({Name = "Spam Enabled",CurrentValue = false,Flag = "chatspam_enabled",Callback = function(v) running = v; if v then task.spawn(function() while running do task.wait(spamDelay); pcall(function() game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message) end) end end) end end})
    local slider = Tab:CreateSlider({Name = "Interval",Range = {1,10},Increment = 0.5,CurrentValue = 3,Flag = "chatspam_interval",Callback = function(v) spamDelay = v end})
    return {input = input, toggle = toggle, slider = slider}
end