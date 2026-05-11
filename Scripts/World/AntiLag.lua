-- AntiLag.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Performance")
    local running = false
    local toggle = Tab:CreateToggle({Name = "Enabled",CurrentValue = false,Flag = "antilag_enabled",Callback = function(v) running = v; local l = game:GetService("Lighting"); if v then l.GlobalShadows = false; l.FogEnd = 100; l.Brightness = 1; settings().Rendering.QualityLevel = 1; for _,e in ipairs(l:GetChildren()) do if e:IsA("PostEffect") then e.Enabled = false end end else l.GlobalShadows = true; l.FogEnd = 5000; l.Brightness = 2; settings().Rendering.QualityLevel = 7 end end})
    return {toggle = toggle}
end