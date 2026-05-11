-- CloneCharacter.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Fun")

    local button = Tab:CreateButton({
        Name = "Clone",
        Callback = function()
            pcall(function()
                local character = game:GetService("Players").LocalPlayer.Character
                if not character then
                    return
                end

                local clone = character:Clone()
                clone.Name = "MoonHub_Clone"
                clone.Parent = workspace
                clone:MakeJoints()

                local cloneRoot = clone:FindFirstChild("HumanoidRootPart")
                local originalRoot = character:FindFirstChild("HumanoidRootPart")

                if cloneRoot and originalRoot then
                    cloneRoot.CFrame = originalRoot.CFrame * CFrame.new(2, 0, 0)
                end
            end)
        end
    })

    return {button = button}
end
