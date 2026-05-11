-- FavoriteScripts.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Favorites")
    local favorites = {}
    local addInput = Tab:CreateInput({Name = "Add Script URL",PlaceholderText = "Paste script URL...",RemoveTextAfterFocusLost = true,Callback = function(t) if t and t ~= "" then table.insert(favorites, t); writefile("MoonHub_Favorites.txt", table.concat(favorites, "\n")) end end})
    local runBtn = Tab:CreateButton({Name = "Run All Favorites",Callback = function() pcall(function() local d = readfile("MoonHub_Favorites.txt"); for url in d:gmatch("[^\n]+") do task.spawn(function() pcall(function() loadstring(game:HttpGet(url))() end) end) end end) end})
    return {addInput = addInput, runBtn = runBtn}
end