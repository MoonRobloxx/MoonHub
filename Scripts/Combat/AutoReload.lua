-- AutoReload.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Weapon")
    local running = false

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "autoreload_enabled",
        Callback = function(value)
            running = value
            if running then
                task.spawn(function()
                    while running do
                        task.wait(0.5)
                        pcall(function()
                            local character = game:GetService("Players").LocalPlayer.Character
                            if not character then
                                return
                            end
                            local tool = character:FindFirstChildWhichIsA("Tool")
                            if tool then
                                local ammo = tool:FindFirstChild("Ammo")
                                if ammo then
                                    local ammoValue = 0
                                    if ammo:IsA("IntValue") then
                                        ammoValue = ammo.Value
                                    elseif ammo:IsA("NumberValue") then
                                        ammoValue = ammo.Value
                                    end
                                    if ammoValue <= 0 then
                                        local virtualInput = game:GetService("VirtualInputManager")
                                        virtualInput:SendKeyEvent(true, Enum.KeyCode.R, false, nil)
                                        task.wait(0.1)
                                        virtualInput:SendKeyEvent(false, Enum.KeyCode.R, false, nil)
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
