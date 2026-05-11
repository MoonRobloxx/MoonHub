-- OutlineESP.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("ESP")
    local running = false
    local highlights = {}
    local outlineColor = Color3.new(1,1,1)
    local toggle = Tab:CreateToggle({Name = "Enabled",CurrentValue = false,Flag = "outlineesp_enabled",Callback = function(v) running = v; if v then task.spawn(function() while running do task.wait(0.2) for _,p in ipairs(game:GetService("Players"):GetPlayers()) do if p ~= game:GetService("Players").LocalPlayer and p.Character and not highlights[p.UserId] then local hl = Instance.new("Highlight");hl.Parent = p.Character;hl.FillTransparency = 1;hl.OutlineColor = outlineColor;highlights[p.UserId] = hl end end end end) else for _,h in pairs(highlights) do h:Destroy() end; highlights = {} end end})
    local colorPicker = Tab:CreateColorPicker({Name = "Color",Color = Color3.new(1,1,1),Flag = "outlineesp_color",Callback = function(c) outlineColor = c; for _,h in pairs(highlights) do h.OutlineColor = c end end})
    return {toggle = toggle, colorPicker = colorPicker}
end