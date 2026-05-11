-- Chams.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Visual")
    local running = false
    local chamColor = Color3.new(1, 0, 0)
    local chamMaterial = "ForceField"
    local chamTransparency = 0.3

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "chams_enabled",
        Callback = function(value)
            running = value
            if not running then
                for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= game:GetService("Players").LocalPlayer and player.Character then
                        for _, part in ipairs(player.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Transparency = 0
                            end
                        end
                    end
                end
            end
            if running then
                task.spawn(function()
                    while running do
                        task.wait(0.1)
                        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                            if player ~= game:GetService("Players").LocalPlayer and player.Character then
                                for _, part in ipairs(player.Character:GetDescendants()) do
                                    if part:IsA("BasePart") then
                                        part.Color = chamColor
                                        part.Material = Enum.Material[chamMaterial]
                                        part.Transparency = chamTransparency
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    })

    local colorPicker = Tab:CreateColorPicker({
        Name = "Color",
        Color = Color3.new(1, 0, 0),
        Flag = "chams_color",
        Callback = function(color) chamColor = color end
    })

    local materialDropdown = Tab:CreateDropdown({
        Name = "Material",
        Options = {"ForceField", "Neon", "Glass", "Metal", "SmoothPlastic"},
        CurrentOption = "ForceField",
        Flag = "chams_material",
        Callback = function(value) chamMaterial = value end
    })

    local transparencySlider = Tab:CreateSlider({
        Name = "Transparency",
        Range = {0, 1},
        Increment = 0.05,
        Suffix = "",
        CurrentValue = 0.3,
        Flag = "chams_transparency",
        Callback = function(value) chamTransparency = value end
    })

    return {toggle = toggle, colorPicker = colorPicker, materialDropdown = materialDropdown, transparencySlider = transparencySlider}
end
