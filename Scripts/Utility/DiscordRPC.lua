-- DiscordRPC.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Discord")
    local toggle = Tab:CreateToggle({Name = "Enable Discord RPC",CurrentValue = false,Flag = "discordrpc_enabled",Callback = function(v) if v then pcall(function() local RPC = loadstring(game:HttpGet("https://raw.githubusercontent.com/richardgrac/discord-rpc/main/discordrpc.lua"))(); RPC:SetRP("Moon Hub", {details = "Playing Roblox", state = "Moon Hub v1.0 by MoonRobloxx"}) end) end end})
    return {toggle = toggle}
end