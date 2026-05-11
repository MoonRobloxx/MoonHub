-- SpinBot.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Fun")
    local running = false
    local connection = nil
    local spinSpeed = 10

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "spinbot_enabled",
        Callback = function(value)
            running = value
            if running then
                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local character = game:GetService("Players").LocalPlayer.Character
                        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
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
        Range = {1, 50},
        Increment = 1,
        Suffix = " deg/s",
        CurrentValue = 10,
        Flag = "spinbot_speed",
        Callback = function(value)
            spinSpeed = value
        end
    })

    return {toggle = toggle, slider = slider}
end
