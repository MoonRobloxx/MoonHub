-- FullBright.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("World")
    local running = false
    local brightnessValue = 5

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "fullbright_enabled",
        Callback = function(value)
            running = value
            local lighting = game:GetService("Lighting")
            if running then
                lighting.Ambient = Color3.new(1, 1, 1)
                lighting.OutdoorAmbient = Color3.new(1, 1, 1)
                lighting.Brightness = brightnessValue
                lighting.GlobalShadows = false
                lighting.FogEnd = 100000
                lighting.EnvironmentDiffuseScale = 1
                lighting.EnvironmentSpecularScale = 0
            else
                lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
                lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
                lighting.Brightness = 2
                lighting.GlobalShadows = true
                lighting.FogEnd = 5000
                lighting.EnvironmentDiffuseScale = 1
                lighting.EnvironmentSpecularScale = 1
            end
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Brightness",
        Range = {1, 10},
        Increment = 1,
        Suffix = "",
        CurrentValue = 5,
        Flag = "fullbright_value",
        Callback = function(value)
            brightnessValue = value
            if running then
                game:GetService("Lighting").Brightness = value
            end
        end
    })

    return {toggle = toggle, slider = slider}
end
