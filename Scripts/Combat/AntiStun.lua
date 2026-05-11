-- AntiStun.lua
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
        Flag = "antistun_enabled",
        Callback = function(value)
            running = value
            if running then
                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    pcall(function()
                        local character = game:GetService("Players").LocalPlayer.Character
                        local humanoid = character and character:FindFirstChild("Humanoid")
                        if humanoid and humanoid.Health > 0 then
                            humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
                            humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
                            humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
                            humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                            humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
                            humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
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
                        humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
                        humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
                        humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
                        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
                        humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
                        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                    end
                end)
            end
        end
    })

    return {toggle = toggle}
end
