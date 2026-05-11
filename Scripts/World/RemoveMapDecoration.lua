-- RemoveMapDecoration.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Cleanup")
    local button = Tab:CreateButton({Name = "Remove Decorations",Callback = function() pcall(function() for _,obj in ipairs(workspace:GetDescendants()) do if obj:IsA("Model") and (obj.Name:lower():find("grass") or obj.Name:lower():find("bush") or obj.Name:lower():find("flower") or obj.Name:lower():find("rock") or obj.Name:lower():find("plant")) then obj:Destroy() end end end) end})
    return {button = button}
end