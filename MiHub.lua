
if game.PlaceId \~= 10449761463 then
    return
end

local MAIN_SCRIPT_URL = "https://raw.githubusercontent.com/H4T0-debug/MiHub/refs/heads/main/Main.lua"

local function safeLoad(url)
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)

    if not success or not result or result == "" then
        warn("[Loader] Failed to fetch script")
        return
    end

    local func, err = loadstring(result)
    if not func then
        warn("[Loader] loadstring failed:", err)
        return
    end

    local ok, runtimeErr = pcall(func)
    if not ok then
        warn("[Loader] Script error:", runtimeErr)
    end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SimpleLoader"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 80)
Frame.Position = UDim2.new(0.5, -150, 0.5, -40)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(180, 30, 30)
Stroke.Thickness = 1.5
Stroke.Parent = Frame

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "Loading script..."
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 16
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Parent = Frame

safeLoad(MAIN_SCRIPT_URL)

task.delay(1.5, function()
    if ScreenGui then
        ScreenGui:Destroy()
    end
end)