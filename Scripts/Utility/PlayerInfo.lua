-- PlayerInfo.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Player Info")
    local userIdBtn = Tab:CreateButton({Name = "Copy User ID",Callback = function() setclipboard(tostring(game:GetService("Players").LocalPlayer.UserId)) end})
    local placeIdBtn = Tab:CreateButton({Name = "Copy Place ID",Callback = function() setclipboard(tostring(game.PlaceId)) end})
    local jobIdBtn = Tab:CreateButton({Name = "Copy Job ID",Callback = function() setclipboard(game.JobId) end})
    return {userIdBtn = userIdBtn, placeIdBtn = placeIdBtn, jobIdBtn = jobIdBtn}
end