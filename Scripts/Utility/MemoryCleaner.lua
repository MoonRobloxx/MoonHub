-- MemoryCleaner.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Performance")
    local button = Tab:CreateButton({Name = "Clean Memory",Callback = function() pcall(function() local c = 0; for _,o in ipairs(workspace:GetDescendants()) do if not o.Parent and not o:IsA("Player") then pcall(function() o:Destroy() end); c = c + 1 end end; collectgarbage("collect") end) end})
    return {button = button}
end