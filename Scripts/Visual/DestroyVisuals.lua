-- DestroyVisuals.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Cleanup")
    local button = Tab:CreateButton({Name = "Destroy All Visuals",Callback = function() pcall(function() for _,v in ipairs(workspace:GetDescendants()) do if v:IsA("Highlight") or v:IsA("BillboardGui") or v:IsA("SelectionBox") or v:IsA("Beam") or v:IsA("Trail") then v:Destroy() end end end) end})
    return {button = button}
end