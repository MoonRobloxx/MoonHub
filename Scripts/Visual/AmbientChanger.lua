-- AmbientChanger.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("World")
    local ambientPicker = Tab:CreateColorPicker({Name = "Ambient",Color = Color3.new(0.5,0.5,0.5),Flag = "ambient_color",Callback = function(c) game:GetService("Lighting").Ambient = c end})
    local outdoorPicker = Tab:CreateColorPicker({Name = "Outdoor Ambient",Color = Color3.new(0.5,0.5,0.5),Flag = "outdoorambient_color",Callback = function(c) game:GetService("Lighting").OutdoorAmbient = c end})
    return {ambientPicker = ambientPicker, outdoorPicker = outdoorPicker}
end