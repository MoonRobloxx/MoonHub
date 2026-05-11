-- SkyboxChanger.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("World")
    local skyboxes = {
        Default = "",
        Moon = "rbxassetid://6444320592",
        Night = "rbxassetid://6412445330",
        Nebula = "rbxassetid://6465842439",
        Storm = "rbxassetid://6465847281",
        Heaven = "rbxassetid://6465843250",
        Space = "rbxassetid://6444321596"
    }

    local dropdown = Tab:CreateDropdown({
        Name = "Skybox",
        Options = {"Default", "Moon", "Night", "Nebula", "Storm", "Heaven", "Space"},
        CurrentOption = "Default",
        Flag = "skybox_name",
        Callback = function() end
    })

    local button = Tab:CreateButton({
        Name = "Apply",
        Callback = function()
            local selected = dropdown.CurrentOption or "Default"
            local skyboxId = skyboxes[selected] or ""
            local lighting = game:GetService("Lighting")

            local existingSky = lighting:FindFirstChildOfClass("Sky")
            if existingSky then
                existingSky:Destroy()
            end

            if skyboxId ~= "" then
                local sky = Instance.new("Sky")
                sky.SkyboxBk = skyboxId
                sky.SkyboxDn = skyboxId
                sky.SkyboxFt = skyboxId
                sky.SkyboxLf = skyboxId
                sky.SkyboxRt = skyboxId
                sky.SkyboxUp = skyboxId
                sky.Parent = lighting
            end
        end
    })

    return {dropdown = dropdown, button = button}
end
