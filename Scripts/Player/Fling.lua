-- Fling.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Fun")

    local button = Tab:CreateButton({
        Name = "Fling",
        Callback = function()
            pcall(function()
                local character = game:GetService("Players").LocalPlayer.Character
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    local randomX = math.random(-5000, 5000)
                    local randomY = math.random(2000, 5000)
                    local randomZ = math.random(-5000, 5000)
                    rootPart.Velocity = Vector3.new(randomX, randomY, randomZ)
                    rootPart.RotVelocity = Vector3.new(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
                end
            end)
        end
    })

    return {button = button}
end
