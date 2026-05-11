-- BypassWalkSpeed.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Movement")
    local running = false
    local connection = nil
    local speedValue = 100

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "bypassws_enabled",
        Callback = function(value)
            running = value
            if running then
                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local character = game:GetService("Players").LocalPlayer.Character
                        local humanoid = character and character:FindFirstChild("Humanoid")
                        if humanoid and humanoid.Health > 0 then
                            humanoid.WalkSpeed = speedValue
                            humanoid.UseJumpPower = true
                        end
                    end)
                end)
            else
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
                pcall(function()
                    local character = game:GetService("Players").LocalPlayer.Character
                    local humanoid = character and character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = 16
                    end
                end)
            end
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Speed",
        Range = {16, 1000},
        Increment = 5,
        Suffix = " studs/s",
        CurrentValue = 100,
        Flag = "bypassws_value",
        Callback = function(value)
            speedValue = value
        end
    })

    return {toggle = toggle, slider = slider}
end
