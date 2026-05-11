-- ConfigManager.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Configuration")
    local saveBtn = Tab:CreateButton({Name = "Save Config",Callback = function() pcall(function() Rayfield:SaveConfiguration() end) end})
    local loadBtn = Tab:CreateButton({Name = "Load Config",Callback = function() pcall(function() Rayfield:LoadConfiguration() end) end})
    local deleteBtn = Tab:CreateButton({Name = "Delete Config",Callback = function() pcall(function() Rayfield:DeleteConfiguration() end) end})
    return {saveBtn = saveBtn, loadBtn = loadBtn, deleteBtn = deleteBtn}
end