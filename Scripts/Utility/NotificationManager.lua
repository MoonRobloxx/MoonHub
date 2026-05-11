-- NotificationManager.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Notifications")
    local notifEnabled = true
    local notifDuration = 3
    local toggle = Tab:CreateToggle({Name = "Enabled",CurrentValue = true,Flag = "notif_enabled",Callback = function(v) notifEnabled = v end})
    local slider = Tab:CreateSlider({Name = "Duration",Range = {1,10},Increment = 1,CurrentValue = 3,Flag = "notif_duration",Callback = function(v) notifDuration = v end})
    local testBtn = Tab:CreateButton({Name = "Test Notification",Callback = function() if notifEnabled then Rayfield:LoadNotification({Title = "Test",Content = "This is a test notification!",Duration = notifDuration}) end end})
    return {toggle = toggle, slider = slider, testBtn = testBtn}
end