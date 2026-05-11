-- ScreenShotter.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Screenshot")
    local keybind = Tab:CreateKeybind({Name = "Screenshot Key",CurrentKeybind = "F12",HoldToInteract = false,Flag = "screenshot_key",Callback = function() pcall(function() writefile("MoonHub_Screenshot_"..os.time()..".png", game:GetService("CoreGui"):TakeScreenshot()) end) end})
    return {keybind = keybind}
end