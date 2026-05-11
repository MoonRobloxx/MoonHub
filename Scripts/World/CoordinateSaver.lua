-- CoordinateSaver.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Coordinates")
    local copyBtn = Tab:CreateButton({Name = "Copy Coordinates",Callback = function() pcall(function() local hrp = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"); if hrp then setclipboard(string.format("%.1f, %.1f, %.1f", hrp.Position.X, hrp.Position.Y, hrp.Position.Z)) end end) end})
    return {copyBtn = copyBtn}
end