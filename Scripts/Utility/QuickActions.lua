-- QuickActions.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Quick Actions")
    local resetBtn = Tab:CreateButton({Name = "Reset Character",Callback = function() game:GetService("Players").LocalPlayer:LoadCharacter() end})
    local rejoinBtn = Tab:CreateButton({Name = "Rejoin",Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end})
    local consoleBtn = Tab:CreateButton({Name = "Open Console",Callback = function() setscriptable(Enum.ScriptContext.Error, true) end})
    return {resetBtn = resetBtn, rejoinBtn = rejoinBtn, consoleBtn = consoleBtn}
end