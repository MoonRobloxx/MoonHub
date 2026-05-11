-- TinyArms.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Character")
    local armParts = {
        "Left Arm",
        "Right Arm",
        "LeftUpperArm",
        "RightUpperArm",
        "LeftLowerArm",
        "RightLowerArm",
        "LeftHand",
        "RightHand"
    }

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "tinyarms_enabled",
        Callback = function(value)
            pcall(function()
                local character = game:GetService("Players").LocalPlayer.Character
                if not character then
                    return
                end

                local targetSize = Vector3.new(1, 1, 1)
                if value then
                    targetSize = Vector3.new(0.2, 0.2, 0.2)
                end

                for _, partName in ipairs(armParts) do
                    local part = character:FindFirstChild(partName)
                    if part and part:IsA("BasePart") then
                        part.Size = targetSize
                    end
                end
            end)
        end
    })

    return {toggle = toggle}
end
