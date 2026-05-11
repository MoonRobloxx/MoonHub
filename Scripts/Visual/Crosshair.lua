-- Crosshair.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Visual")
    local drawings = {}
    local crosshairColor = Color3.new(0, 1, 0)
    local crosshairSize = 30
    local crosshairThickness = 2
    local crosshairStyle = "Cross"

    local function clearDrawings()
        for _, d in pairs(drawings) do
            pcall(function() d.Visible = false; d:Remove() end)
        end
        drawings = {}
    end

    local function createCrosshair()
        clearDrawings()
        local center = workspace.CurrentCamera.ViewportSize / 2

        if crosshairStyle == "Cross" then
            local hLine = Drawing.new("Line")
            hLine.Visible = true
            hLine.Color = crosshairColor
            hLine.Thickness = crosshairThickness
            hLine.From = Vector2.new(center.X - crosshairSize, center.Y)
            hLine.To = Vector2.new(center.X + crosshairSize, center.Y)
            table.insert(drawings, hLine)

            local vLine = Drawing.new("Line")
            vLine.Visible = true
            vLine.Color = crosshairColor
            vLine.Thickness = crosshairThickness
            vLine.From = Vector2.new(center.X, center.Y - crosshairSize)
            vLine.To = Vector2.new(center.X, center.Y + crosshairSize)
            table.insert(drawings, vLine)
        elseif crosshairStyle == "Circle" then
            local circle = Drawing.new("Circle")
            circle.Visible = true
            circle.Color = crosshairColor
            circle.Thickness = crosshairThickness
            circle.Radius = crosshairSize
            circle.Position = center
            circle.NumSides = 60
            table.insert(drawings, circle)
        elseif crosshairStyle == "Dot" then
            local dot = Drawing.new("Circle")
            dot.Visible = true
            dot.Color = crosshairColor
            dot.Filled = true
            dot.Radius = crosshairSize / 4
            dot.Position = center
            dot.NumSides = 30
            table.insert(drawings, dot)
        elseif crosshairStyle == "Square" then
            local sq = Drawing.new("Square")
            sq.Visible = true
            sq.Color = crosshairColor
            sq.Thickness = crosshairThickness
            sq.Size = Vector2.new(crosshairSize, crosshairSize)
            sq.Position = Vector2.new(center.X - crosshairSize / 2, center.Y - crosshairSize / 2)
            table.insert(drawings, sq)
        end
    end

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "crosshair_enabled",
        Callback = function(value)
            if value then
                createCrosshair()
            else
                clearDrawings()
            end
        end
    })

    local colorPicker = Tab:CreateColorPicker({
        Name = "Color",
        Color = Color3.new(0, 1, 0),
        Flag = "crosshair_color",
        Callback = function(color) crosshairColor = color end
    })

    local sizeSlider = Tab:CreateSlider({
        Name = "Size",
        Range = {10, 100},
        Increment = 2,
        Suffix = " px",
        CurrentValue = 30,
        Flag = "crosshair_size",
        Callback = function(value) crosshairSize = value end
    })

    local thicknessSlider = Tab:CreateSlider({
        Name = "Thickness",
        Range = {1, 5},
        Increment = 1,
        Suffix = " px",
        CurrentValue = 2,
        Flag = "crosshair_thickness",
        Callback = function(value) crosshairThickness = value end
    })

    local styleDropdown = Tab:CreateDropdown({
        Name = "Style",
        Options = {"Cross", "Circle", "Dot", "Square"},
        CurrentOption = "Cross",
        Flag = "crosshair_style",
        Callback = function(value) crosshairStyle = value end
    })

    return {toggle = toggle, colorPicker = colorPicker, sizeSlider = sizeSlider, thicknessSlider = thicknessSlider, styleDropdown = styleDropdown}
end
