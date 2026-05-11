-- TriggerBot.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Combat")
    local running = false
    local connection = nil

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "triggerbot_enabled",
        Callback = function(value)
            running = value
            if running then
                local localPlayer = game:GetService("Players").LocalPlayer
                local userInput = game:GetService("UserInputService")
                local camera = workspace.CurrentCamera
                local players = game:GetService("Players")

                connection = userInput.InputBegan:Connect(function(input, gameProcessed)
                    if gameProcessed then
                        return
                    end
                    if not running then
                        return
                    end
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        pcall(function()
                            local mouseLocation = userInput:GetMouseLocation()
                            local ray = camera:ViewportPointToRay(mouseLocation.X, mouseLocation.Y)
                            local raycastParams = RaycastParams.new()
                            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                            raycastParams.FilterDescendantsInstances = {localPlayer.Character}

                            local raycastResult = workspace:Raycast(ray.Origin, ray.Direction * 10000, raycastParams)

                            if raycastResult and raycastResult.Instance then
                                for _, player in ipairs(players:GetPlayers()) do
                                    if player ~= localPlayer and player.Character then
                                        if raycastResult.Instance:IsDescendantOf(player.Character) then
                                            local tool = localPlayer.Character and localPlayer.Character:FindFirstChildWhichIsA("Tool")
                                            if tool then
                                                tool:Activate()
                                            end
                                            break
                                        end
                                    end
                                end
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
