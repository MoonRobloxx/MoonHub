-- ColorCorrection.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Effects")
    local toggle = Tab:CreateToggle({Name = "Color Correction",CurrentValue = false,Flag = "colorcor_enabled",Callback = function(v) local cc = game:GetService("Lighting"):FindFirstChild("ColorCorrection"); if not cc then cc = Instance.new("ColorCorrectionEffect"); cc.Parent = game:GetService("Lighting") end; cc.Enabled = v end})
    return {toggle = toggle}
end