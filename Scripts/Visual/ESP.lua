-- ESP.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("ESP")
    local running = false
    local drawings = {}
    local boxEnabled = true
    local nameEnabled = true
    local healthEnabled = true
    local distanceEnabled = true
    local boxColor = Color3.new(1, 1, 1)
    local nameColor = Color3.new(1, 1, 1)
    local textSize = 14

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
        Flag = "esp_enabled",
        Callback = function(value)
            running = value
            if not running then
                clearDrawings()
            end
        end
    })

    local boxToggle = Tab:CreateToggle({
        Name = "Box",
        CurrentValue = true,
        Flag = "esp_box",
        Callback = function(value) boxEnabled = value end
    })

    local boxColorPicker = Tab:CreateColorPicker({
        Name = "Box Color",
        Color = Color3.new(1, 1, 1),
        Flag = "esp_boxcolor",
        Callback = function(color) boxColor = color end
    })

    local nameToggle = Tab:CreateToggle({
        Name = "Name",
        CurrentValue = true,
        Flag = "esp_name",
        Callback = function(value) nameEnabled = value end
    })

    local nameColorPicker = Tab:CreateColorPicker({
        Name = "Name Color",
        Color = Color3.new(1, 1, 1),
        Flag = "esp_namecolor",
        Callback = function(color) nameColor = color end
    })

    local healthToggle = Tab:CreateToggle({
        Name = "Health Bar",
        CurrentValue = true,
        Flag = "esp_health",
        Callback = function(value) healthEnabled = value end
    })

    local distanceToggle = Tab:CreateToggle({
        Name = "Distance",
        CurrentValue = true,
        Flag = "esp_distance",
        Callback = function(value) distanceEnabled = value end
    })

    local textSizeSlider = Tab:CreateSlider({
        Name = "Text Size",
        Range = {12, 24},
        Increment = 1,
        Suffix = "",
        CurrentValue = 14,
        Flag = "esp_textsize",
        Callback = function(value) textSize = value end
    })

    task.spawn(function()
        local runService = game:GetService("RunService")
        local players = game:GetService("Players")
        local camera = workspace.CurrentCamera
        local localPlayer = players.LocalPlayer

        runService.RenderStepped:Connect(function()
            if not running then
                return
            end

            clearDrawings()

            for _, player in ipairs(players:GetPlayers()) do
                if player == localPlayer then continue end
                if not player.Character then continue end

                local character = player.Character
                local head = character:FindFirstChild("Head")
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                local humanoid = character:FindFirstChild("Humanoid")

                if not head or not rootPart then continue end

                local headScreenPos, headOnScreen = camera:WorldToScreenPoint(head.Position)
                local rootScreenPos, rootOnScreen = camera:WorldToScreenPoint(rootPart.Position)

                if not headOnScreen and not rootOnScreen then continue end

                if boxEnabled then
                    local height = (headScreenPos.Y - rootScreenPos.Y) * 1.5
                    local width = height * 0.6

                    local box = Drawing.new("Square")
                    box.Visible = true
                    box.Color = boxColor
                    box.Thickness = 2
                    box.Filled = false
                    box.Size = Vector2.new(width, height)
                    box.Position = Vector2.new(headScreenPos.X - width / 2, headScreenPos.Y - height / 2)
                    table.insert(drawings, box)
                end

                if nameEnabled then
                    local nameText = Drawing.new("Text")
                    nameText.Visible = true
                    nameText.Text = player.Name
                    nameText.Size = textSize
                    nameText.Color = nameColor
                    nameText.Center = true
                    nameText.Outline = true
                    nameText.Position = Vector2.new(headScreenPos.X, headScreenPos.Y - 25)
                    table.insert(drawings, nameText)
                end

                if healthEnabled and humanoid and humanoid.MaxHealth > 0 then
                    local healthPercent = humanoid.Health / humanoid.MaxHealth
                    local barHeight = (headScreenPos.Y - rootScreenPos.Y) * 1.5
                    local barWidth = 4
                    local healthBar = Drawing.new("Square")
                    healthBar.Visible = true
                    healthBar.Color = Color3.new(0, 1, 0):Lerp(Color3.new(1, 0, 0), 1 - healthPercent)
                    healthBar.Filled = true
                    healthBar.Size = Vector2.new(barWidth, barHeight * math.clamp(healthPercent, 0, 1))
                    healthBar.Position = Vector2.new(headScreenPos.X + width / 2 + 5, headScreenPos.Y - barHeight / 2 + barHeight * (1 - healthPercent))
                    table.insert(drawings, healthBar)
                end

                if distanceEnabled then
                    local distance = (rootPart.Position - camera.CFrame.Position).Magnitude
                    local distanceText = Drawing.new("Text")
                    distanceText.Visible = true
                    distanceText.Text = string.format("%.0f m", distance)
                    distanceText.Size = textSize - 2
                    distanceText.Color = Color3.new(1, 1, 1)
                    distanceText.Center = true
                    distanceText.Outline = true
                    distanceText.Position = Vector2.new(rootScreenPos.X, rootScreenPos.Y + 10)
                    table.insert(drawings, distanceText)
                end
            end
        end)
    end)

    return {
        toggle = toggle,
        boxToggle = boxToggle,
        boxColorPicker = boxColorPicker,
        nameToggle = nameToggle,
        nameColorPicker = nameColorPicker,
        healthToggle = healthToggle,
        distanceToggle = distanceToggle,
        textSizeSlider = textSizeSlider
    }
end
