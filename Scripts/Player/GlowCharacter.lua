-- GlowCharacter.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Visual")
    local running = false
    local highlight = nil

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "glow_enabled",
        Callback = function(value)
            running = value
            pcall(function()
                local character = game:GetService("Players").LocalPlayer.Character
                if not character then
                    return
                end

                if running then
                    if highlight then
                        highlight:Destroy()
                    end
                    highlight = Instance.new("Highlight")
                    highlight.Name = "MoonHub_Glow"
                    highlight.Parent = character
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0.3
                    highlight.OutlineColor = elements.ColorPicker.CurrentValue or Color3.new(1, 1, 1)
                    highlight.FillColor = elements.ColorPicker.CurrentValue or Color3.new(1, 1, 1)
                else
                    if highlight then
                        highlight:Destroy()
                        highlight = nil
                    end
                end
            end)
        end
    })

    local colorPicker = Tab:CreateColorPicker({
        Name = "Color",
        Color = Color3.new(1, 1, 1),
        Flag = "glow_color",
        Callback = function(color)
            if highlight then
                highlight.OutlineColor = color
                highlight.FillColor = color
            end
        end
    })

    return {toggle = toggle, ColorPicker = colorPicker}
end
