-- RemoveShadows.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Cleanup")
    local toggle = Tab:CreateToggle({Name = "Remove Shadows",CurrentValue = false,Flag = "removeshadows_enabled",Callback = function(v) game:GetService("Lighting").GlobalShadows = not v end})
    return {toggle = toggle}
end