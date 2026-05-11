-- HealthESP.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("ESP")
    local running = false
    local drawings = {}
    local highlights = {}

    local function clearAll()
        for _, d in pairs(drawings) do
            pcall(function() d.Visible = false; d:Remove() end)
        end
        drawings = {}
        for _, h in pairs(highlights) do
            pcall(function() h:Destroy() end)
        end
        highlights = {}
    end

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "healthesp_enabled",
        Callback = function(value)
            running = value
            if not running then clearAll() end
        end
    })

    task.spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if not running then return end
            clearAll()
            local camera = workspace.CurrentCamera
            local localPlayer = game:GetService("Players").LocalPlayer
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                if player == localPlayer or not player.Character then continue end
                local head = player.Character:FindFirstChild("Head")
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                local humanoid = player.Character:FindFirstChild("Humanoid")
                if not head or not rootPart or not humanoid then continue end
                local headPos = camera:WorldToScreenPoint(head.Position)
                local rootPos = camera:WorldToScreenPoint(rootPart.Position)
                local height = (headPos.Y - rootPos.Y) * 1.5
                local healthPct = humanoid.Health / humanoid.MaxHealth
                local bar = Drawing.new("Square")
                bar.Visible = true
                bar.Color = Color3.new(0, 1, 0):Lerp(Color3.new(1, 0, 0), 1 - healthPct)
                bar.Filled = true
                bar.Size = Vector2.new(4, height * healthPct)
                bar.Position = Vector2.new(headPos.X + 30, headPos.Y - height / 2 + height * (1 - healthPct))
                table.insert(drawings, bar)
            end
        end)
    end)

    return {toggle = toggle}
end
