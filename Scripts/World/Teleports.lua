-- Teleports.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Teleports")
    local saved = {}
    local saveInput = Tab:CreateInput({Name = "Position Name",PlaceholderText = "Enter name...",RemoveTextAfterFocusLost = true,Callback = function(t) if t and t ~= "" then pcall(function() local hrp = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"); if hrp then saved[t] = hrp.CFrame end end) end end})
    local tpInput = Tab:CreateInput({Name = "Teleport to Name",PlaceholderText = "Enter saved name...",RemoveTextAfterFocusLost = true,Callback = function(t) if t and saved[t] then pcall(function() local hrp = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"); if hrp then hrp.CFrame = saved[t] end end) end end})
    local saveBtn = Tab:CreateButton({Name = "Save Current Position",Callback = function() pcall(function() local hrp = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"); if hrp then saved["Pos"..os.time()] = hrp.CFrame end end) end})
    local clearBtn = Tab:CreateButton({Name = "Clear All",Callback = function() saved = {} end})
    return {saveInput = saveInput, tpInput = tpInput, saveBtn = saveBtn, clearBtn = clearBtn}
end