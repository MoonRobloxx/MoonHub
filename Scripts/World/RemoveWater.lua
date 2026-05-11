-- RemoveWater.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Cleanup")
    local button = Tab:CreateButton({Name = "Remove Water",Callback = function() pcall(function() for _,v in ipairs(workspace:GetDescendants()) do if v:IsA("Terrain") then v.WaterTransparency = 1; v.WaterColor = Color3.new(0,0,0); v.WaterWaveSize = 0; v.WaterWaveSpeed = 0 end end end) end})
    return {button = button}
end