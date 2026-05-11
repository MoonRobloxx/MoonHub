-- RemoveTerrain.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Cleanup")
    local button = Tab:CreateButton({Name = "Clear Terrain",Callback = function() pcall(function() workspace.Terrain:Clear() end) end})
    return {button = button}
end