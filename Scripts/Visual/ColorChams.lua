-- ColorChams.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Visual")
    local running = false
    local chamColor = Color3.new(1, 0, 0)
    local toggle = Tab:CreateToggle({Name = "Enabled",CurrentValue = false,Flag = "colorchams_enabled",Callback = function(v) running = v; if v then task.spawn(function() while running do task.wait(0.1) for _,p in ipairs(game:GetService("Players"):GetPlayers()) do if p ~= game:GetService("Players").LocalPlayer and p.Character then for _,part in ipairs(p.Character:GetDescendants()) do if part:IsA("BasePart") then part.Color = chamColor end end end end end end) end end})
    local colorPicker = Tab:CreateColorPicker({Name = "Color",Color = Color3.new(1,0,0),Flag = "colorchams_color",Callback = function(c) chamColor = c end})
    return {toggle = toggle, colorPicker = colorPicker}
end