-- ShadowRemover.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("World")
    local toggle = Tab:CreateToggle({Name = "Enabled",CurrentValue = false,Flag = "shadowremover_enabled",Callback = function(v) game:GetService("Lighting").GlobalShadows = not v end})
    return {toggle = toggle}
end