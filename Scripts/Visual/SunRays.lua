-- SunRays.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("World")
    local toggle = Tab:CreateToggle({Name = "Sun Rays",CurrentValue = true,Flag = "sunrays_enabled",Callback = function(v) local sr = game:GetService("Lighting"):FindFirstChild("SunRays"); if sr then sr.Enabled = v end end})
    return {toggle = toggle}
end