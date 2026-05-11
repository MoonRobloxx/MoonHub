-- WeaponMods.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Weapon")

    local rapidFireToggle = Tab:CreateToggle({
        Name = "Rapid Fire",
        CurrentValue = false,
        Flag = "wmod_rapidfire",
        Callback = function(value)
            if value then
                task.spawn(function()
                    while value do
                        task.wait(0.02)
                        pcall(function()
                            local tool = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                            if tool then
                                tool:Activate()
                                task.wait(0.01)
                                tool:Deactivate()
                            end
                        end)
                    end
                end)
            end
        end
    })

    local noRecoilToggle = Tab:CreateToggle({
        Name = "No Recoil",
        CurrentValue = false,
        Flag = "wmod_norecoil",
        Callback = function(value)
            if value then
                task.spawn(function()
                    while value do
                        task.wait(0.01)
                        pcall(function()
                            local camera = workspace.CurrentCamera
                            camera.CFrame = CFrame.new(camera.CFrame.Position) * CFrame.Angles(0, camera.CFrame:ToEulerAnglesYXZ(), 0)
                        end)
                    end
                end)
            end
        end
    })

    local noSpreadToggle = Tab:CreateToggle({
        Name = "No Spread",
        CurrentValue = false,
        Flag = "wmod_nospread",
        Callback = function(value)
            if value then
                task.spawn(function()
                    while value do
                        task.wait(0.1)
                        pcall(function()
                            local tool = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                            if tool then
                                local gunModule = tool:FindFirstChild("Gun")
                                if gunModule then
                                    gunModule.Spread = 0
                                end
                            end
                        end)
                    end
                end)
            end
        end
    })

    local infiniteAmmoToggle = Tab:CreateToggle({
        Name = "Infinite Ammo",
        CurrentValue = false,
        Flag = "wmod_infammo",
        Callback = function(value)
            if value then
                task.spawn(function()
                    while value do
                        task.wait(0.1)
                        pcall(function()
                            local tool = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                            if tool then
                                local ammo = tool:FindFirstChild("Ammo")
                                if ammo and ammo:IsA("IntValue") then
                                    ammo.Value = 9999
                                end
                            end
                        end)
                    end
                end)
            end
        end
    })

    return {
        rapidFireToggle = rapidFireToggle,
        noRecoilToggle = noRecoilToggle,
        noSpreadToggle = noSpreadToggle,
        infiniteAmmoToggle = infiniteAmmoToggle
    }
end
