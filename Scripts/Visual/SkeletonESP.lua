-- SkeletonESP.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("ESP")
    local running = false
    local drawings = {}
    local connections = {{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"}}
    local toggle = Tab:CreateToggle({Name = "Enabled",CurrentValue = false,Flag = "skeletonesp_enabled",Callback = function(v) running = v end})
    task.spawn(function() game:GetService("RunService").RenderStepped:Connect(function() if not running then for _,d in pairs(drawings) do d:Remove() end; drawings = {}; return end; for _,d in pairs(drawings) do d:Remove() end; drawings = {}; local cam = workspace.CurrentCamera; for _,p in ipairs(game:GetService("Players"):GetPlayers()) do if p ~= game:GetService("Players").LocalPlayer and p.Character then for _,conn in ipairs(connections) do local p1 = p.Character:FindFirstChild(conn[1]); local p2 = p.Character:FindFirstChild(conn[2]); if p1 and p2 then local s1 = cam:WorldToScreenPoint(p1.Position); local s2 = cam:WorldToScreenPoint(p2.Position); local line = Drawing.new("Line"); line.Visible = true; line.Color = Color3.new(1,1,1); line.Thickness = 1; line.From = Vector2.new(s1.X,s1.Y); line.To = Vector2.new(s2.X,s2.Y); table.insert(drawings, line) end end end end end end) end)
    return {toggle = toggle}
end