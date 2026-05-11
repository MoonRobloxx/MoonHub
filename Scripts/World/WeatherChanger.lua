-- WeatherChanger.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("World")
    local dropdown = Tab:CreateDropdown({Name = "Weather",Options = {"Clear","Rain","Snow","Fog","Thunder"},CurrentOption = "Clear",Flag = "weather_type",Callback = function(o) pcall(function() local l = game:GetService("Lighting"); for _,v in ipairs(l:GetChildren()) do if v:IsA("ParticleEmitter") or v:IsA("Sky") then v:Destroy() end end; if o == "Rain" then l.FogEnd = 200; l.FogColor = Color3.new(0.4,0.4,0.5) elseif o == "Fog" then l.FogEnd = 50; l.FogColor = Color3.new(0.7,0.7,0.7) elseif o == "Clear" then l.FogEnd = 5000 end end) end})
    return {dropdown = dropdown}
end