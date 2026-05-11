-- Zoom.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Camera")
    local running = false
    local zoomFov = 30
    local defaultFov = 70

    local toggle = Tab:CreateToggle({
        Name = "Enabled",
        CurrentValue = false,
        Flag = "zoom_enabled",
        Callback = function(value) running = value end
    })

    local keybind = Tab:CreateKeybind({
        Name = "Key",
        CurrentKeybind = "Z",
        HoldToInteract = true,
        Flag = "zoom_key",
        Callback = function(value)
            if running then
                if value then
                    workspace.CurrentCamera.FieldOfView = zoomFov
                else
                    workspace.CurrentCamera.FieldOfView = defaultFov
                end
            end
        end
    })

    local slider = Tab:CreateSlider({
        Name = "FOV",
        Range = {10, 70},
        Increment = 2,
        Suffix = "",
        CurrentValue = 30,
        Flag = "zoom_fov",
        Callback = function(value) zoomFov = value end
    })

    return {toggle = toggle, keybind = keybind, slider = slider}
end
