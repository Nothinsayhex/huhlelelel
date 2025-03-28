local Library = loadstring(game:HttpGet("https://pastebin.com/raw/6m9U5B3L"))() -- Load UI Library
local Window = Library.CreateLib("Super GUI Executor", "DarkTheme")

-- Tạo hình nền UI
local Background = Instance.new("ImageLabel")
Background.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Position = UDim2.new(0, 0, 0, 0)
Background.Image = "rbxassetid://IMAGE_ID"  -- Thay IMAGE_ID bằng ID ảnh
Background.ImageTransparency = 0.2  -- Điều chỉnh độ trong suốt (0.0 = rõ, 1.0 = ẩn)
Background.ZIndex = -1  -- Đưa hình nền xuống dưới tất cả UI

-- Tạo tab chính
local Main = Window:NewTab("Executor")
local MainSection = Main:NewSection("Script Execution")

-- Hộp nhập code
local scriptBox = MainSection:NewTextBox("Enter Lua Script", "Paste script here", function(txt)
    scriptToExecute = txt
end)

-- Loadstring (Chạy script từ TextBox)
MainSection:NewButton("Execute", "Run the script", function()
    local success, err = pcall(function()
        loadstring(scriptToExecute)()
    end)
    if not success then
        print("Execution Error:", err)
    end
end)

-- Require Module
MainSection:NewButton("Require (Module ID)", "Run module script", function()
    local success, err = pcall(function()
        require(tonumber(scriptToExecute))
    end)
    if not success then
        print("Require Error:", err)
    end
end)

-- Loadstring từ URL
MainSection:NewTextBox("Enter Script URL", "Paste URL here", function(url)
    scriptURL = url
end)

MainSection:NewButton("Loadstring URL", "Fetch script from URL", function()
    local success, err = pcall(function()
        local scriptContent = game:HttpGet(scriptURL, true)
        loadstring(scriptContent)()
    end)
    if not success then
        print("Loadstring Error:", err)
    end
end)