-- Freeze.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Character")
    local running = false

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "freeze_enabled",
        Callback = function(value)
            running = value
            pcall(function()
                local character = game:GetService("Players").LocalPlayer.Character
                if character then
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Anchored = running
                        end
                    end
                end
            end)
        end
    })

    return {toggle = toggle}
end
