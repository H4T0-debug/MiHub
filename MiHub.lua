local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

if game.PlaceId \~= 10449761463 then
    return
end

local MAIN_SCRIPT_URL = "loadstring(game:HttpGet("https://raw.githubusercontent.com/H4T0-debug/MiHub/refs/heads/main/Main.lua"))() "

local Colors = {
    Primary = Color3.fromRGB(180, 20, 20),
    Dark = Color3.fromRGB(15, 15, 15),
    Darker = Color3.fromRGB(25, 25, 25),
    Text = Color3.fromRGB(255, 255, 255)
}

local function _RandomString(length)
    length = length or 16
    local result = ""
    for i = 1, length do
        result = result .. string.char(math.random(97, 122))
    end
    return result
end

local function HttpGet(url)
    local success, result = pcall(function()
        if game and game.HttpGet then
            return game:HttpGet(url)
        elseif http_request then
            local response = http_request({Url = url, Method = "GET"})
            return response.Body
        elseif syn and syn.request then
            local response = syn.request({Url = url, Method = "GET"})
            return response.Body
        elseif request then
            local response = request({Url = url, Method = "GET"})
            return response.Body
        elseif http and http.request then
            local response = http.request({Url = url, Method = "GET"})
            return response.Body
        else
            error("No working HttpGet method found")
        end
    end)

    if success and result and #result > 0 then
        return result
    end
    return nil
end

local function CreateLoader()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = _RandomString()
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    ScreenGui.Parent = PlayerGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 380, 0, 140)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Colors.Dark
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = MainFrame

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Colors.Primary
    Stroke.Thickness = 1.5
    Stroke.Parent = MainFrame

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -30, 0, 28)
    Title.Position = UDim2.new(0, 15, 0, 18)
    Title.BackgroundTransparency = 1
    Title.Text = "Initializing..."
    Title.TextColor3 = Colors.Text
    Title.TextSize = 17
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = MainFrame

    local BarBG = Instance.new("Frame")
    BarBG.Size = UDim2.new(1, -30, 0, 12)
    BarBG.Position = UDim2.new(0, 15, 0, 65)
    BarBG.BackgroundColor3 = Colors.Darker
    BarBG.BorderSizePixel = 0
    BarBG.Parent = MainFrame

    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = BarBG

    local BarFill = Instance.new("Frame")
    BarFill.Size = UDim2.new(0, 0, 1, 0)
    BarFill.BackgroundColor3 = Colors.Primary
    BarFill.BorderSizePixel = 0
    BarFill.Parent = BarBG

    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = BarFill

    local Status = Instance.new("TextLabel")
    Status.Size = UDim2.new(1, -30, 0, 20)
    Status.Position = UDim2.new(0, 15, 0, 95)
    Status.BackgroundTransparency = 1
    Status.Text = "Please wait"
    Status.TextColor3 = Color3.fromRGB(160, 160, 160)
    Status.TextSize = 13
    Status.Font = Enum.Font.Gotham
    Status.TextXAlignment = Enum.TextXAlignment.Left
    Status.Parent = MainFrame

    return {
        ScreenGui = ScreenGui,
        Title = Title,
        Status = Status,
        BarFill = BarFill
    }
end

local function AnimateProgress(bar, goal, duration)
    local tween = TweenService:Create(bar, TweenInfo.new(duration, Enum.EasingStyle.Quint), {
        Size = UDim2.new(goal, 0, 1, 0)
    })
    tween:Play()
    return tween
end

local function FadeOut(gui)
    for _, obj in ipairs(gui:GetDescendants()) do
        if obj:IsA("Frame") then
            TweenService:Create(obj, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
        elseif obj:IsA("TextLabel") then
            TweenService:Create(obj, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
        elseif obj:IsA("UIStroke") then
            TweenService:Create(obj, TweenInfo.new(0.4), {Transparency = 1}):Play()
        end
    end
    task.delay(0.5, function()
        if gui and gui.Parent then
            gui:Destroy()
        end
    end)
end

local function StartLoader()
    local ui = CreateLoader()

    task.spawn(function()
        ui.Title.Text = "Initializing..."
        ui.Status.Text = "Checking environment"
        AnimateProgress(ui.BarFill, 0.25, 0.7)
        task.wait(0.9)

        ui.Title.Text = "Loading modules..."
        ui.Status.Text = "Fetching script"
        AnimateProgress(ui.BarFill, 0.6, 0.9)
        task.wait(1)

        -- Fetch the script
        local source = HttpGet(MAIN_SCRIPT_URL)

        if not source then
            ui.Title.Text = "Failed to load"
            ui.Status.Text = "HttpGet returned nil"
            ui.Title.TextColor3 = Color3.fromRGB(255, 80, 80)
            return
        end

        ui.Title.Text = "Almost ready..."
        ui.Status.Text = "Executing"
        AnimateProgress(ui.BarFill, 1, 0.5)
        task.wait(0.6)

        local func, err = loadstring(source)
        if not func then
            ui.Title.Text = "Loadstring failed"
            ui.Status.Text = tostring(err)
            ui.Title.TextColor3 = Color3.fromRGB(255, 80, 80)
            return
        end

        FadeOut(ui.ScreenGui)

        local success, runErr = pcall(func)
        if not success then
            warn("[Loader] Script error:", runErr)
        end
    end)
end

StartLoader()