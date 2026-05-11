-- ThirdPerson.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Camera")
    local running = false
    local thirdPersonDistance = 10

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "thirdperson_enabled",
        Callback = function(value)
            running = value
            local player = game:GetService("Players").LocalPlayer
            if running then
                player.CameraMode = Enum.CameraMode.Classic
                player.CameraMaxZoomDistance = thirdPersonDistance
                player.CharacterAdded:Connect(function(char)
                    if running then
                        task.wait(0.1)
                        player.CameraMode = Enum.CameraMode.Classic
                    end
                end)
            else
                player.CameraMode = Enum.CameraMode.LockFirstPerson
                player.CameraMaxZoomDistance = 5
            end
        end
    })

    local slider = Tab:CreateSlider({
        Name = "Distance",
        Range = {5, 30},
        Increment = 1,
        Suffix = " studs",
        CurrentValue = 10,
        Flag = "thirdperson_distance",
        Callback = function(value)
            thirdPersonDistance = value
            if running then
                game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = value
            end
        end
    })

    return {toggle = toggle, slider = slider}
end
