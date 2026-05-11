-- LoopTP.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Teleport")
    local running = false
    local connection = nil
    local tpSpeed = 0.5

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "looptp_enabled",
        Callback = function(value)
            running = value
            if running then
                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local character = game:GetService("Players").LocalPlayer.Character
                        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.CFrame = rootPart.CFrame + Vector3.new(0, 0, tpSpeed)
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
        Range = {0.1, 2},
        Increment = 0.1,
        Suffix = " studs",
        CurrentValue = 0.5,
        Flag = "looptp_speed",
        Callback = function(value)
            tpSpeed = value
        end
    })

    return {toggle = toggle, slider = slider}
end
