-- BulletTP.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Weapon")
    local running = false
    local connection = nil

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "bullettpp_enabled",
        Callback = function(value)
            running = value
            if running then
                connection = workspace.ChildAdded:Connect(function(child)
                    if not running then
                        return
                    end
                    if child:IsA("BasePart") and (child.Name == "Bullet" or child.Name == "Projectile") then
                        task.spawn(function()
                            while child and child.Parent and running do
                                task.wait(0.01)
                                pcall(function()
                                    local camera = workspace.CurrentCamera
                                    local closestTarget = nil
                                    local closestDistance = math.huge

                                    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                                        if player ~= game:GetService("Players").LocalPlayer and player.Character then
                                            local head = player.Character:FindFirstChild("Head")
                                            if head then
                                                local distance = (head.Position - child.Position).Magnitude
                                                if distance < closestDistance and distance < 1000 then
                                                    closestDistance = distance
                                                    closestTarget = head
                                                end
                                            end
                                        end
                                    end

                                    if closestTarget then
                                        child.Velocity = (closestTarget.Position - child.Position).Unit * child.Velocity.Magnitude
                                        child.CFrame = CFrame.new(child.Position, closestTarget.Position)
                                    end
                                end)
                            end
                        end)
                    end
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
