-- Headless.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Character")

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "headless_enabled",
        Callback = function(value)
            pcall(function()
                local character = game:GetService("Players").LocalPlayer.Character
                if character then
                    local head = character:FindFirstChild("Head")
                    if head then
                        head.Transparency = 0
                        if value then
                            head.Transparency = 1
                        end
                    end
                end
            end)
        end
    })

    return {toggle = toggle}
end
