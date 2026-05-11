-- PlayerChams.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Visual")
    local running = false
    local chamColor = Color3.new(0,1,0)
    local chamMat = "ForceField"
    local toggle = Tab:CreateToggle({Name = "Enabled",CurrentValue = false,Flag = "playerchams_enabled",Callback = function(v) running = v; if v then task.spawn(function() while running do task.wait(0.1) local char = game:GetService("Players").LocalPlayer.Character; if char then for _,part in ipairs(char:GetDescendants()) do if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then part.Color = chamColor; part.Material = Enum.Material[chamMat] end end end end end) end end})
    local colorPicker = Tab:CreateColorPicker({Name = "Color",Color = Color3.new(0,1,0),Flag = "playerchams_color",Callback = function(c) chamColor = c end})
    local dropdown = Tab:CreateDropdown({Name = "Material",Options = {"ForceField","Neon","Glass","Metal"},CurrentOption = "ForceField",Flag = "playerchams_mat",Callback = function(v) chamMat = v end})
    return {toggle = toggle, colorPicker = colorPicker, dropdown = dropdown}
end