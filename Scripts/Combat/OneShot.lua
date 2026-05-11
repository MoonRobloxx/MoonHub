-- OneShot.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Combat")
    local running = false

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "oneshot_enabled",
        Callback = function(value)
            running = value
            if running then
                task.spawn(function()
                    while running do
                        task.wait(0.1)
                        pcall(function()
                            local character = game:GetService("Players").LocalPlayer.Character
                            if not character then
                                continue
                            end
                            local tool = character:FindFirstChildWhichIsA("Tool")
                            if tool then
                                for _, child in ipairs(tool:GetDescendants()) do
                                    if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
                                        for i = 1, 10 do
                                            pcall(function()
                                                child:FireServer(999999, 999999, 999999)
                                            end)
                                        end
                                    end
                                end
                            end
                        end)
                    end
                end)
            end
        end
    })

    return {toggle = toggle}
end
