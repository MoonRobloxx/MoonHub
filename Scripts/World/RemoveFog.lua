-- RemoveFog.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Cleanup")
    local button = Tab:CreateButton({Name = "Remove Fog",Callback = function() game:GetService("Lighting").FogEnd = 100000; game:GetService("Lighting").FogStart = 0 end})
    return {button = button}
end