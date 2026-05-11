-- FPSBooster.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Performance")
    local button = Tab:CreateButton({Name = "Boost FPS",Callback = function() pcall(function() local l = game:GetService("Lighting"); l.GlobalShadows = false; l.Brightness = 1; l.FogEnd = 50; l.FogStart = 0; for _,e in ipairs(l:GetChildren()) do if e:IsA("PostEffect") then e.Enabled = false end end; for _,d in ipairs(workspace:GetDescendants()) do if d:IsA("Decal") or d:IsA("Texture") then d:Destroy() elseif d:IsA("ParticleEmitter") then d.Enabled = false end end; settings().Rendering.QualityLevel = 1; settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.DistanceBased end) end})
    return {button = button}
end