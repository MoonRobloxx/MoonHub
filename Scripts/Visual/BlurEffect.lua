-- BlurEffect.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Effects")
    local toggle = Tab:CreateToggle({Name = "Blur",CurrentValue = false,Flag = "blur_enabled",Callback = function(v) local b = game:GetService("Lighting"):FindFirstChild("Blur"); if not b then b = Instance.new("BlurEffect"); b.Parent = game:GetService("Lighting") end; b.Enabled = v end})
    return {toggle = toggle}
end