-- BoxESP.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("ESP")
    local running = false
    local drawings = {}
    local boxColor = Color3.new(1, 1, 1)

    local function clearDrawings()
        for _, d in pairs(drawings) do
            pcall(function() d.Visible = false; d:Remove() end)
        end
        drawings = {}
    end

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "boxesp_enabled",
        Callback = function(value)
            running = value
            if not running then clearDrawings() end
        end
    })

    local colorPicker = Tab:CreateColorPicker({
        Name = "Color",
        Color = Color3.new(1, 1, 1),
        Flag = "boxesp_color",
        Callback = function(color) boxColor = color end
    })

    task.spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if not running then return end
            clearDrawings()
            local camera = workspace.CurrentCamera
            local localPlayer = game:GetService("Players").LocalPlayer
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                if player == localPlayer or not player.Character then continue end
                local head = player.Character:FindFirstChild("Head")
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if not head or not rootPart then continue end
                local headPos = camera:WorldToScreenPoint(head.Position)
                local rootPos = camera:WorldToScreenPoint(rootPart.Position)
                local height = (headPos.Y - rootPos.Y) * 1.5
                local width = height * 0.6
                local box = Drawing.new("Square")
                box.Visible = true
                box.Color = boxColor
                box.Thickness = 2
                box.Filled = false
                box.Size = Vector2.new(width, height)
                box.Position = Vector2.new(headPos.X - width / 2, headPos.Y - height / 2)
                table.insert(drawings, box)
            end
        end)
    end)

    return {toggle = toggle, colorPicker = colorPicker}
end
