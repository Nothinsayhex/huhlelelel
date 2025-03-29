-- LocalScript GUI Exploit for Roblox Studio with CuteCore Style and Effects
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ExecuteButton = Instance.new("TextButton")
local ClearButton = Instance.new("TextButton")
local AttachButton = Instance.new("TextButton")
local ScriptBox = Instance.new("TextBox")
local UIStroke = Instance.new("UIStroke")
local UICorner = Instance.new("UICorner")
local TweenService = game:GetService("TweenService")
local ImageLabel = Instance.new("ImageLabel")

-- Parent GUI to Player's Screen
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame settings
Frame.Size = UDim2.new(0, 696, 0, 365)
Frame.Position = UDim2.new(0.5, -348, 0.5, -182)
Frame.BackgroundColor3 = Color3.fromRGB(255, 200, 255)
Frame.Parent = ScreenGui

-- CuteCore UI Enhancements
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Frame
UIStroke.Parent = Frame
UIStroke.Thickness = 4
UIStroke.Color = Color3.fromRGB(148, 0, 211) -- Viền màu tím

-- Epic Face Effect
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
ImageLabel.Position = UDim2.new(0, 10, 0, 10) -- Đặt trong góc trái trên UI
ImageLabel.Image = "rbxassetid://101854655" -- Epic Face Image ID chính xác
ImageLabel.Parent = Frame

-- ScriptBox settings
ScriptBox.Size = UDim2.new(0, 676, 0, 200)
ScriptBox.Position = UDim2.new(0, 10, 0, 50)
ScriptBox.Text = "Enter your script here..."
ScriptBox.ClearTextOnFocus = false
ScriptBox.MultiLine = true
ScriptBox.BackgroundColor3 = Color3.fromRGB(255, 182, 193) -- Màu hồng
ScriptBox.TextColor3 = Color3.fromRGB(120, 0, 120)
ScriptBox.Parent = Frame

-- Banner Title
local BannerLabel = Instance.new("TextLabel")
BannerLabel.Size = UDim2.new(0, 696, 0, 30)
BannerLabel.Position = UDim2.new(0, 0, 0, -30)
BannerLabel.BackgroundColor3 = Color3.fromRGB(148, 0, 211)
BannerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BannerLabel.Text = "expdoit-by-nani"
BannerLabel.Font = Enum.Font.SourceSansBold
BannerLabel.TextSize = 20
BannerLabel.Parent = Frame

-- Button Animation Function
local function createButtonEffect(button)
    button.MouseEnter:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 182, 193)})
        tween:Play()
    end)
    button.MouseLeave:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.3), {BackgroundColor3 = button.BackgroundColor3})
        tween:Play()
    end)
end

-- Execute Button
ExecuteButton.Size = UDim2.new(0, 150, 0, 50)
ExecuteButton.Position = UDim2.new(0, 10, 0, 260)
ExecuteButton.Text = "Execute"
ExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ExecuteButton.Parent = Frame
createButtonEffect(ExecuteButton)

ExecuteButton.MouseButton1Click:Connect(function()
    local scriptToRun = ScriptBox.Text
    local success, err = pcall(function()
        local func = loadstring(scriptToRun)
        if func then
            func()
        end
    end)
    if not success then
        warn("Error executing script: " .. err)
    end
end)

-- Clear Button
ClearButton.Size = UDim2.new(0, 150, 0, 50)
ClearButton.Position = UDim2.new(0, 180, 0, 260)
ClearButton.Text = "Clear"
ClearButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
ClearButton.Parent = Frame
createButtonEffect(ClearButton)

ClearButton.MouseButton1Click:Connect(function()
    ScriptBox.Text = ""
end)

-- Attach Button
AttachButton.Size = UDim2.new(0, 150, 0, 50)
AttachButton.Position = UDim2.new(0, 350, 0, 260)
AttachButton.Text = "Attach"
AttachButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
AttachButton.Parent = Frame
createButtonEffect(AttachButton)

AttachButton.MouseButton1Click:Connect(function()
    warn("Exploit attached (simulated)")
end)

print("CuteCore GUI Exploit with Corrected Epic Face Loaded!")
