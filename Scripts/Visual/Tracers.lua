-- Tracers.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("ESP")
    local running = false
    local drawings = {}
    local tracerColor = Color3.new(1, 1, 1)
    local tracerThickness = 2
    local tracerOrigin = "Bottom"

    local function clearDrawings()
        for _, drawing in pairs(drawings) do
            pcall(function()
                drawing.Visible = false
                drawing:Remove()
            end)
        end
        drawings = {}
    end

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "tracers_enabled",
        Callback = function(value)
            running = value
            if not running then
                clearDrawings()
            end
        end
    })

    local colorPicker = Tab:CreateColorPicker({
        Name = "Color",
        Color = Color3.new(1, 1, 1),
        Flag = "tracers_color",
        Callback = function(color) tracerColor = color end
    })

    local thicknessSlider = Tab:CreateSlider({
        Name = "Thickness",
        Range = {1, 5},
        Increment = 1,
        Suffix = " px",
        CurrentValue = 2,
        Flag = "tracers_thickness",
        Callback = function(value) tracerThickness = value end
    })

    local originDropdown = Tab:CreateDropdown({
        Name = "Origin",
        Options = {"Bottom", "Middle", "Top"},
        CurrentOption = "Bottom",
        Flag = "tracers_origin",
        Callback = function(value) tracerOrigin = value end
    })

    task.spawn(function()
        local runService = game:GetService("RunService")
        local players = game:GetService("Players")
        local camera = workspace.CurrentCamera

        runService.RenderStepped:Connect(function()
            if not running then
                return
            end

            clearDrawings()

            local viewportSize = camera.ViewportSize
            local originY = viewportSize.Y
            if tracerOrigin == "Middle" then
                originY = viewportSize.Y / 2
            elseif tracerOrigin == "Top" then
                originY = 0
            end

            for _, player in ipairs(players:GetPlayers()) do
                if player == players.LocalPlayer then continue end
                if not player.Character then continue end

                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if not rootPart then continue end

                local screenPos, onScreen = camera:WorldToScreenPoint(rootPart.Position)
                if not onScreen then continue end

                local line = Drawing.new("Line")
                line.Visible = true
                line.Color = tracerColor
                line.Thickness = tracerThickness
                line.From = Vector2.new(viewportSize.X / 2, originY)
                line.To = Vector2.new(screenPos.X, screenPos.Y)
                table.insert(drawings, line)
            end
        end)
    end)

    return {toggle = toggle, colorPicker = colorPicker, thicknessSlider = thicknessSlider, originDropdown = originDropdown}
end
