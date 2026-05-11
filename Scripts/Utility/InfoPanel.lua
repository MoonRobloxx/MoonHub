-- InfoPanel.lua
-- Moon Hub v1.0
-- Created by MoonRobloxx
-- github.com/MoonRobloxx/MoonHub

return function(Tab, Window)
    local section = Tab:CreateSection("Information")
    local label = Tab:CreateLabel("Moon Hub v1.0")
    local paragraph = Tab:CreateParagraph({Title = "Info",Content = "Moon Hub by MoonRobloxx\nGitHub: MoonRobloxx/MoonHub\nTheme: Amethyst\nAll scripts are open source."})
    return {label = label, paragraph = paragraph}
end