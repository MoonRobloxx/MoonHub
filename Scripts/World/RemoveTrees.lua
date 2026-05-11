-- RemoveTrees.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Cleanup")
    local button = Tab:CreateButton({Name = "Remove Trees",Callback = function() pcall(function() for _,m in ipairs(workspace:GetDescendants()) do if m:IsA("Model") and m.Name:lower():find("tree") or m.Name:lower():find("pine") then m:Destroy() end end end) end})
    return {button = button}
end