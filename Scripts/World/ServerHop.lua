-- ServerHop.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Server")
    local button = Tab:CreateButton({Name = "Server Hop",Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end})
    return {button = button}
end