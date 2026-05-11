-- DestroyMap.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Cleanup")
    local button = Tab:CreateButton({Name = "Destroy Map",Callback = function() pcall(function() for _,c in ipairs(workspace:GetChildren()) do if c ~= workspace.Terrain and not c:IsA("Camera") then pcall(function() c:Destroy() end) end end end) end})
    return {button = button}
end