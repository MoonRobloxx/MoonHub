-- InfiniteJump.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Movement")
    local running = false
    local connection = nil

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "infjump_enabled",
        Callback = function(value)
            running = value
            if running then
                local userInputService = game:GetService("UserInputService")
                connection = userInputService.JumpRequest:Connect(function()
                    if not running then
                        return
                    end
                    pcall(function()
                        local character = game:GetService("Players").LocalPlayer.Character
                        local humanoid = character and character:FindFirstChild("Humanoid")
                        if humanoid and humanoid.Health > 0 then
                            humanoid.Jump = true
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
        CurrentKeybind = "J",
        HoldToInteract = false,
        Flag = "infjump_key",
        Callback = function()
            toggle:Set(not running)
        end
    })

    return {toggle = toggle, keybind = keybind}
end
