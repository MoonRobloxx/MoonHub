-- NameTags.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("ESP")
    local running = false
    local billboardGuis = {}
    local toggle = Tab:CreateToggle({Name = "Enabled",CurrentValue = false,Flag = "nametags_enabled",Callback = function(v) running = v; if v then task.spawn(function() while running do task.wait(0.5) for _,p in ipairs(game:GetService("Players"):GetPlayers()) do if p ~= game:GetService("Players").LocalPlayer and p.Character and not billboardGuis[p.UserId] and p.Character:FindFirstChild("Head") then local bg = Instance.new("BillboardGui"); bg.Name = "MoonHub_NameTag"; bg.Size = UDim2.new(0,100,0,30); bg.AlwaysOnTop = true; bg.Parent = p.Character.Head; local label = Instance.new("TextLabel"); label.Text = p.Name; label.Size = UDim2.new(1,0,1,0); label.BackgroundTransparency = 1; label.TextColor3 = Color3.new(1,1,1); label.Font = Enum.Font.SourceSansBold; label.TextSize = 14; label.TextStrokeTransparency = 0; label.Parent = bg; billboardGuis[p.UserId] = bg end end end end) else for _,b in pairs(billboardGuis) do b:Destroy() end; billboardGuis = {} end end})
    return {toggle = toggle}
end