-- Reach.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Combat")
    local running = false
    local reachDistance = 20

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "reach_enabled",
        Callback = function(value)
            running = value
            if running then
                task.spawn(function()
                    while running do
                        task.wait(0.1)
                        pcall(function()
                            local character = game:GetService("Players").LocalPlayer.Character
                            if not character then
                                return
                            end
                            local tool = character:FindFirstChildWhichIsA("Tool")
                            if tool then
                                local handle = tool:FindFirstChild("Handle")
                                if handle and handle:IsA("BasePart") then
                                    handle.Massless = true
                                    handle.Size = Vector3.new(reachDistance, reachDistance / 2, reachDistance / 2)
                                    handle.Transparency = 1
                                end
                            end
                        end)
                    end
                end)
            else
                pcall(function()
                    local character = game:GetService("Players").LocalPlayer.Character
                    if character then
                        local tool = character:FindFirstChildWhichIsA("Tool")
                        if tool then
                            local handle = tool:FindFirstChild("Handle")
                            if handle and handle:IsA("BasePart") then
                                handle.Size = Vector3.new(1, 1, 1)
                                handle.Transparency = 0
                            end
                        end
                    end
                end)
            end
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Distance",
        Range = {10, 50},
        Increment = 5,
        Suffix = " studs",
        CurrentValue = 20,
        Flag = "reach_distance",
        Callback = function(value)
            reachDistance = value
        end
    })

    return {toggle = toggle, slider = slider}
end
