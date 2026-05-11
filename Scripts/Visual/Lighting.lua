-- Lighting.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Lighting Controls")
    local ambientPicker = Tab:CreateColorPicker({Name = "Ambient",Color = Color3.new(0.5,0.5,0.5),Flag = "lighting_ambient",Callback = function(c) game:GetService("Lighting").Ambient = c; game:GetService("Lighting").OutdoorAmbient = c end})
    local outlinesToggle = Tab:CreateToggle({Name = "Outlines",CurrentValue = true,Flag = "lighting_outlines",Callback = function(v) game:GetService("Lighting").Outlines = v end})
    local shadowsToggle = Tab:CreateToggle({Name = "Global Shadows",CurrentValue = true,Flag = "lighting_shadows",Callback = function(v) game:GetService("Lighting").GlobalShadows = v end})
    return {ambientPicker = ambientPicker, outlinesToggle = outlinesToggle, shadowsToggle = shadowsToggle}
end