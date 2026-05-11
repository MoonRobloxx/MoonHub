-- RemoveSkybox.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Cleanup")
    local button = Tab:CreateButton({Name = "Remove Skybox",Callback = function() local sky = game:GetService("Lighting"):FindFirstChildOfClass("Sky"); if sky then sky:Destroy() end end})
    return {button = button}
end