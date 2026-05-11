-- MaterialChams.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Visual")
    local running = false
    local chamMat = "ForceField"
    local toggle = Tab:CreateToggle({Name = "Enabled",CurrentValue = false,Flag = "materialchams_enabled",Callback = function(v) running = v; if v then task.spawn(function() while running do task.wait(0.1) for _,p in ipairs(game:GetService("Players"):GetPlayers()) do if p ~= game:GetService("Players").LocalPlayer and p.Character then for _,part in ipairs(p.Character:GetDescendants()) do if part:IsA("BasePart") then part.Material = Enum.Material[chamMat] end end end end end end) end end})
    local dropdown = Tab:CreateDropdown({Name = "Material",Options = {"ForceField","Neon","Glass","Metal"},CurrentOption = "ForceField",Flag = "materialchams_mat",Callback = function(v) chamMat = v end})
    return {toggle = toggle, dropdown = dropdown}
end