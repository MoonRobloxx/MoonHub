-- Sit.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Animation")
    local running = false
    local animationTrack = nil
    local sitAnimationId = "http://www.roblox.com/asset/?id=507768375"

    local toggle = Tab:CreateToggle({
        Name = "Sit",
        CurrentValue = false,
        Flag = "sit_enabled",
        Callback = function(value)
            running = value
            pcall(function()
                local character = game:GetService("Players").LocalPlayer.Character
                local humanoid = character and character:FindFirstChild("Humanoid")
                if not humanoid then
                    return
                end

                if running then
                    local animation = Instance.new("Animation")
                    animation.AnimationId = sitAnimationId
                    animationTrack = humanoid:LoadAnimation(animation)
                    if animationTrack then
                        animationTrack:Play()
                        animationTrack.Looped = true
                    end
                else
                    if animationTrack then
                        animationTrack:Stop()
                        animationTrack:Destroy()
                        animationTrack = nil
                    end
                end
            end)
        end
    })

    return {toggle = toggle}
end
