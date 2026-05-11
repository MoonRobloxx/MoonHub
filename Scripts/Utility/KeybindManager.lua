-- KeybindManager.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Keybinds")
    local listBtn = Tab:CreateButton({Name = "List Active Keybinds",Callback = function() print("Check Rayfield config for keybinds") end})
    local resetBtn = Tab:CreateButton({Name = "Reset All Keybinds",Callback = function() pcall(function() Rayfield:DeleteConfiguration() end) end})
    return {listBtn = listBtn, resetBtn = resetBtn}
end