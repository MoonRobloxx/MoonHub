-- RainbowCharacter.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Visual")
    local running = false
    local connection = nil
    local hueOffset = 0
    local rainbowSpeed = 3

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "rainbow_enabled",
        Callback = function(value)
            running = value
            if running then
                connection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
                    hueOffset = (hueOffset + deltaTime * rainbowSpeed) % 1
                    pcall(function()
                        local character = game:GetService("Players").LocalPlayer.Character
                        if character then
                            local color = Color3.fromHSV(hueOffset, 1, 1)
                            for _, part in ipairs(character:GetDescendants()) do
                                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                                    part.Color = color
                                end
                            end
                        end
                    end)
                end)
            else
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
            end
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Speed",
        Range = {1, 10},
        Increment = 1,
        Suffix = "x",
        CurrentValue = 3,
        Flag = "rainbow_speed",
        Callback = function(value)
            rainbowSpeed = value
        end
    })

    return {toggle = toggle, slider = slider}
end
