-- SilentAim.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Aimbot")
    local running = false
    local hitChance = 100

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "silentaim_enabled",
        Callback = function(value)
            running = value
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Hit Chance",
        Range = {1, 100},
        Increment = 1,
        Suffix = "%",
        CurrentValue = 100,
        Flag = "silentaim_chance",
        Callback = function(value)
            hitChance = value
        end
    })

    local oldNamecall
    local mt = getrawmetatable(game)
    if mt then
        oldNamecall = mt.__namecall
        setreadonly(mt, false)

        mt.__namecall = newcclosure(function(self, ...)
            local args = {...}
            local method = getnamecallmethod()

            if running and method == "FireServer" and #args >= 1 then
                local randomChance = math.random(1, 100)
                if randomChance <= hitChance then
                    local camera = workspace.CurrentCamera
                    local closestTarget = nil
                    local closestDistance = math.huge

                    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer and player.Character then
                            local head = player.Character:FindFirstChild("Head")
                            if head then
                                local screenPos = camera:WorldToScreenPoint(head.Position)
                                local distance = (Vector2.new(screenPos.X, screenPos.Y) - camera.ViewportSize / 2).Magnitude
                                if distance < closestDistance then
                                    closestDistance = distance
                                    closestTarget = head
                                end
                            end
                        end
                    end

                    if closestTarget then
                        if typeof(args[1]) == "Vector3" then
                            args[1] = closestTarget.Position
                        end
                    end
                end
            end

            return oldNamecall(self, unpack(args))
        end)
    end

    return {toggle = toggle, slider = slider}
end
