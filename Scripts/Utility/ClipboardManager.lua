-- ClipboardManager.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Clipboard")
    local history = {}
    local saveBtn = Tab:CreateButton({Name = "Save Clipboard",Callback = function() local t = getclipboard(); table.insert(history, t) end})
    local pasteBtn = Tab:CreateButton({Name = "Paste Last",Callback = function() if #history > 0 then setclipboard(history[#history]) end end})
    local clearBtn = Tab:CreateButton({Name = "Clear History",Callback = function() history = {} end})
    return {saveBtn = saveBtn, pasteBtn = pasteBtn, clearBtn = clearBtn}
end