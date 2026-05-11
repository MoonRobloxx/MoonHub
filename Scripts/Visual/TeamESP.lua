-- TeamESP.lua
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
        Flag = "teamesp_enabled",
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
                if player.Team == localPlayer.Team and not highlights[player.UserId] then
                    local hl = Instance.new("Highlight")
                    hl.Parent = player.Character
                    hl.FillTransparency = 0.5
                    hl.OutlineColor = Color3.new(0, 1, 0)
                    hl.FillColor = Color3.new(0, 1, 0)
                    highlights[player.UserId] = hl
                end
            end
        end)
    end)

    return {toggle = toggle}
end
