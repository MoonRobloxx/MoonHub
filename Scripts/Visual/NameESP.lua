-- NameESP.lua
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
        Flag = "nameespesp_enabled",
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
                if not head then continue end
                local headPos = camera:WorldToScreenPoint(head.Position)
                local txt = Drawing.new("Text")
                txt.Visible = true
                txt.Size = 14
                txt.Center = true
                txt.Color = Color3.new(1, 1, 1)
                txt.Outline = true
                txt.Text = player.Name
                txt.Position = Vector2.new(headPos.X, headPos.Y - 25)
                table.insert(drawings, txt)
            end
        end)
    end)

    return {toggle = toggle}
end
