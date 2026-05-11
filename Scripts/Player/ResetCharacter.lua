-- ResetCharacter.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Character")

    local button = Tab:CreateButton({
        Name = "Reset",
        Callback = function()
            local player = game:GetService("Players").LocalPlayer
            player:LoadCharacter()
        end
    })

    return {button = button}
end
