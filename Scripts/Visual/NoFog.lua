-- NoFog.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("World")

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "nofog_enabled",
        Callback = function(value)
            if value then
                game:GetService("Lighting").FogEnd = 100000
                game:GetService("Lighting").FogStart = 0
            else
                game:GetService("Lighting").FogEnd = 5000
                game:GetService("Lighting").FogStart = 0
            end
        end
    })

    return {toggle = toggle}
end
