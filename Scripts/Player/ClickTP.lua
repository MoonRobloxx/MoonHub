-- ClickTP.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Teleport")
    local running = false
    local connection = nil

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "clicktp_enabled",
        Callback = function(value)
            running = value
            if running then
                local player = game:GetService("Players").LocalPlayer
                local mouse = player:GetMouse()
                connection = mouse.Button1Down:Connect(function()
                    if not running then
                        return
                    end
                    pcall(function()
                        local character = player.Character
                        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                        if rootPart and mouse.Hit then
                            local targetPosition = mouse.Hit.Position
                            rootPart.CFrame = CFrame.new(targetPosition.X, targetPosition.Y + 3, targetPosition.Z)
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

    local keybind = Tab:CreateKeybind({
        Name = "Key",
        CurrentKeybind = "T",
        HoldToInteract = false,
        Flag = "clicktp_key",
        Callback = function()
            toggle:Set(not running)
        end
    })

    return {toggle = toggle, keybind = keybind}
end
