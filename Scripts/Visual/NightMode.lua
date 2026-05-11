-- NightMode.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("World")
    local running = false
    local darknessLevel = 0.8

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "nightmode_enabled",
        Callback = function(value)
            running = value
            local lighting = game:GetService("Lighting")
            if running then
                lighting.Ambient = Color3.new(0.05, 0.05, 0.1)
                lighting.OutdoorAmbient = Color3.new(0.05, 0.05, 0.1)
                lighting.Brightness = 1 - darknessLevel
                lighting.ClockTime = 0
                lighting.FogColor = Color3.new(0, 0, 0)
                lighting.FogEnd = 80
                lighting.EnvironmentDiffuseScale = 0.2
                lighting.EnvironmentSpecularScale = 0.1
            else
                lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
                lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
                lighting.Brightness = 2
                lighting.ClockTime = 14
                lighting.FogEnd = 5000
                lighting.EnvironmentDiffuseScale = 1
                lighting.EnvironmentSpecularScale = 1
            end
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Darkness",
        Range = {0, 1},
        Increment = 0.05,
        Suffix = "",
        CurrentValue = 0.8,
        Flag = "nightmode_darkness",
        Callback = function(value)
            darknessLevel = value
            if running then
                game:GetService("Lighting").Brightness = 1 - value
            end
        end
    })

    return {toggle = toggle, slider = slider}
end
