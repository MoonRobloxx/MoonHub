-- JumpPower.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Movement")
    local running = false
    local connection = nil
    local powerValue = 50

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "jumppower_enabled",
        Callback = function(value)
            running = value
            if running then
                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local character = game:GetService("Players").LocalPlayer.Character
                        local humanoid = character and character:FindFirstChild("Humanoid")
                        if humanoid and humanoid.Health > 0 then
                            humanoid.JumpPower = powerValue
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
                        humanoid.JumpPower = 50
                    end
                end)
            end
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Power",
        Range = {50, 500},
        Increment = 5,
        Suffix = " studs",
        CurrentValue = 50,
        Flag = "jumppower_value",
        Callback = function(value)
            powerValue = value
        end
    })

    return {toggle = toggle, slider = slider}
end
