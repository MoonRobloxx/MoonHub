-- Invisible.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Character")
    local running = false

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "invisible_enabled",
        Callback = function(value)
            running = value
            pcall(function()
                local character = game:GetService("Players").LocalPlayer.Character
                if character then
                    local transparency = 0
                    if running then
                        transparency = 1
                    end
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Transparency = transparency
                        end
                    end
                end
            end)
        end
    })

    return {toggle = toggle}
end
