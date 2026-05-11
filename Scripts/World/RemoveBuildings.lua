-- RemoveBuildings.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Cleanup")
    local button = Tab:CreateButton({Name = "Remove Buildings",Callback = function() pcall(function() for _,m in ipairs(workspace:GetDescendants()) do if m:IsA("Model") and #m:GetChildren() > 20 then local partCount = 0; for _,c in ipairs(m:GetDescendants()) do if c:IsA("BasePart") then partCount = partCount + 1 end end; if partCount > 50 then m:Destroy() end end end end) end})
    return {button = button}
end