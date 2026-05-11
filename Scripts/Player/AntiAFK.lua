-- AntiAFK.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Automation")
    local running = false
    local afkThread = nil

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "antiafk_enabled",
        Callback = function(value)
            running = value
            if running then
                afkThread = task.spawn(function()
                    while running do
                        task.wait(60)
                        if not running then
                            break
                        end
                        pcall(function()
                            local player = game:GetService("Players").LocalPlayer
                            local character = player.Character
                            local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                            if rootPart then
                                rootPart.CFrame = rootPart.CFrame * CFrame.new(0.1, 0, 0)
                            end
                        end)
                    end
                end)
            end
        end
    })

    return {toggle = toggle}
end
