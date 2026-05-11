-- LowServerHop.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Server")
    local running = false
    local maxPlayers = 5
    local toggle = Tab:CreateToggle({Name = "Auto Low Server Hop",CurrentValue = false,Flag = "lowserverhop_enabled",Callback = function(v) running = v; if v then task.spawn(function() while running do task.wait(30); if #game:GetService("Players"):GetPlayers() > maxPlayers then game:GetService("TeleportService"):Teleport(game.PlaceId) end end end) end end})
    local slider = Tab:CreateSlider({Name = "Max Players",Range = {1,20},Increment = 1,CurrentValue = 5,Flag = "lowserverhop_max",Callback = function(v) maxPlayers = v end})
    return {toggle = toggle, slider = slider}
end