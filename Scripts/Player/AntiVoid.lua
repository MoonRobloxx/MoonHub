-- AntiVoid.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Defense")
    local running = false
    local connection = nil

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "antivoid_enabled",
        Callback = function(value)
            running = value
            if running then
                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local character = game:GetService("Players").LocalPlayer.Character
                        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                        if rootPart and rootPart.Position.Y < -500 then
                            rootPart.CFrame = CFrame.new(rootPart.Position.X, 100, rootPart.Position.Z)
                            rootPart.Velocity = Vector3.zero
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

    return {toggle = toggle}
end
