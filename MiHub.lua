local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

if game.PlaceId \~= 10449761463 then
    return
end

local MAIN_SCRIPT_URL = "loadstring(game:HttpGet("https://raw.githubusercontent.com/H4T0-debug/MiHub/refs/heads/main/Main.lua"))()"

local Colors = {
    Primary = Color3.fromRGB(180, 20, 20),
    Dark = Color3.fromRGB(15, 15, 15),
    Text = Color3.fromRGB(255, 255, 255)
}

local function HttpGet(url)
    local ok, result = pcall(function()
        return game:HttpGet(url)
    end)
    if ok and type(result) == "string" and #result > 10 then
        return result
    end
    return nil
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Loader"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 360, 0, 120)
Frame.Position = UDim2.new(0.5, -180, 0.5, -60)
Frame.BackgroundColor3 = Colors.Dark
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = Frame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Colors.Primary
Stroke.Thickness = 1.5
Stroke.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -20, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 20)
Title.BackgroundTransparency = 1
Title.Text = "Loading..."
Title.TextColor3 = Colors.Text
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -20, 0, 25)
Status.Position = UDim2.new(0, 10, 0, 60)
Status.BackgroundTransparency = 1
Status.Text = "Please wait"
Status.TextColor3 = Color3.fromRGB(160, 160, 160)
Status.TextSize = 14
Status.Font = Enum.Font.Gotham
Status.Parent = Frame


local source = HttpGet(MAIN_SCRIPT_URL)

if not source then
    Title.Text = "Failed to fetch"
    Title.TextColor3 = Color3.fromRGB(255, 70, 70)
    Status.Text = "HttpGet returned nil"
    return
end

Title.Text = "Executing..."
Status.Text = "Running main script"

local func, err = loadstring(source)

if not func then
    Title.Text = "Compile failed"
    Title.TextColor3 = Color3.fromRGB(255, 70, 70)
    Status.Text = tostring(err)
    return
end


ScreenGui:Destroy()


local success, runErr = pcall(func)

if not success then
    warn("[Loader] Runtime error:", runErr)
end