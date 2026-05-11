-- AutoReconnect.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Connection")
    local running = false
    local toggle = Tab:CreateToggle({Name = "Auto Reconnect",CurrentValue = false,Flag = "autoreconnect_enabled",Callback = function(v) running = v; if v then game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(s) if s == Enum.TeleportState.InProgress then task.wait(2); if running then game:GetService("TeleportService"):Teleport(game.PlaceId) end end end) end end})
    return {toggle = toggle}
end