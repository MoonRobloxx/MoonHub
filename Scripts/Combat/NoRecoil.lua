-- NoRecoil.lua
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
        Flag = "norecoil_enabled",
        Callback = function(value)
            running = value
            if running then
                local camera = workspace.CurrentCamera
                local lastCameraCFrame = camera.CFrame

                connection = game:GetService("RunService").RenderStepped:Connect(function()
                    pcall(function()
                        if running then
                            local currentCFrame = camera.CFrame
                            local rotationDiff = lastCameraCFrame:ToObjectSpace(currentCFrame)

                            if math.abs(rotationDiff.X) > 0.001 or math.abs(rotationDiff.Y) > 0.001 then
                                camera.CFrame = CFrame.new(camera.CFrame.Position) * CFrame.Angles(0, camera.CFrame:ToEulerAnglesYXZ(), 0)
                            end

                            lastCameraCFrame = camera.CFrame
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

    return {toggle = toggle}
end
