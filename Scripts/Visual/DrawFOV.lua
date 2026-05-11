-- DrawFOV.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("ESP")
    local fovCircle = nil
    local fovRadius = 200
    local toggle = Tab:CreateToggle({Name = "Enabled",CurrentValue = false,Flag = "drawfov_enabled",Callback = function(v) if v then fovCircle = Drawing.new("Circle"); fovCircle.Visible = true; fovCircle.Thickness = 2; fovCircle.Color = Color3.new(1,1,1); fovCircle.NumSides = 60; fovCircle.Radius = fovRadius; fovCircle.Position = workspace.CurrentCamera.ViewportSize/2 else if fovCircle then fovCircle:Remove(); fovCircle = nil end end end})
    local slider = Tab:CreateSlider({Name = "Radius",Range = {50,500},Increment = 10,CurrentValue = 200,Flag = "drawfov_radius",Callback = function(v) fovRadius = v; if fovCircle then fovCircle.Radius = v end end})
    return {toggle = toggle, slider = slider}
end