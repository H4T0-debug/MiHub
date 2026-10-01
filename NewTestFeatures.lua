-- STREAMING_CHUNK:Initializing core Roblox services and GUI containers...
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
​local LocalPlayer = Players.LocalPlayer
​-- ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MiHubGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui
​-- Fullscreen No-Render Black Overlay
local NoRenderOverlay = Instance.new("ImageLabel")
NoRenderOverlay.Name = "NoRenderOverlay"
NoRenderOverlay.Size = UDim2.new(1, 0, 1, 0)
NoRenderOverlay.Position = UDim2.new(0, 0, 0, 0)
NoRenderOverlay.Image = "rbxassetid://151881923"
NoRenderOverlay.ScaleType = Enum.ScaleType.Tile
NoRenderOverlay.TileSize = UDim2.new(0, 256, 0, 256)
NoRenderOverlay.BackgroundTransparency = 0
NoRenderOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NoRenderOverlay.Visible = false
NoRenderOverlay.ZIndex = 1
NoRenderOverlay.Parent = ScreenGui
​-- STREAMING_CHUNK:Constructing main frame and header controls...
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 300)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.ZIndex = 10
MainFrame.Parent = ScreenGui
​local UICornerMain = Instance.new("UICorner")
UICornerMain.CornerRadius = UDim.new(0, 8)
UICornerMain.Parent = MainFrame
​local UIStrokeGlow = Instance.new("UIStroke")
UIStrokeGlow.Thickness = 2.5
UIStrokeGlow.Color = Color3.fromRGB(255, 0, 40)
UIStrokeGlow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStrokeGlow.Parent = MainFrame
​-- Header Construction
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
Header.BorderSizePixel = 0
Header.ZIndex = 11
Header.Parent = MainFrame
​local UICornerHeader = Instance.new("UICorner")
UICornerHeader.CornerRadius = UDim.new(0, 8)
UICornerHeader.Parent = Header
​local HeaderCover = Instance.new("Frame")
HeaderCover.Size = UDim2.new(1, 0, 0, 10)
HeaderCover.Position = UDim2.new(0, 0, 1, -10)
HeaderCover.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
HeaderCover.BorderSizePixel = 0
HeaderCover.ZIndex = 11
HeaderCover.Parent = Header
​local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Mi Hub"
Title.TextColor3 = Color3.fromRGB(255, 0, 40)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 12
Title.Parent = Header
​-- STREAMING_CHUNK:Configuring window buttons and animation helpers...
local ControlsFrame = Instance.new("Frame")
ControlsFrame.Name = "ControlsFrame"
ControlsFrame.Size = UDim2.new(0, 70, 1, 0)
ControlsFrame.Position = UDim2.new(1, -70, 0, 0)
ControlsFrame.BackgroundTransparency = 1
ControlsFrame.ZIndex = 12
ControlsFrame.Parent = Header
​local ControlsList = Instance.new("UIListLayout")
ControlsList.FillDirection = Enum.FillDirection.Horizontal
ControlsList.HorizontalAlignment = Enum.HorizontalAlignment.Right
ControlsList.VerticalAlignment = Enum.VerticalAlignment.Center
ControlsList.Padding = UDim.new(0, 5)
ControlsList.Parent = ControlsFrame
​local ControlsPadding = Instance.new("UIPadding")
ControlsPadding.PaddingRight = UDim.new(0, 8)
ControlsPadding.Parent = ControlsFrame
​local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Size = UDim2.new(0, 26, 0, 26)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
MinimizeBtn.TextSize = 18
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.ZIndex = 13
MinimizeBtn.Parent = ControlsFrame
​local UICornerMin = Instance.new("UICorner")
UICornerMin.CornerRadius = UDim.new(0, 6)
UICornerMin.Parent = MinimizeBtn
​local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
CloseBtn.Text = "x"
CloseBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.ZIndex = 13
CloseBtn.Parent = ControlsFrame
​local UICornerClose = Instance.new("UICorner")
UICornerClose.CornerRadius = UDim.new(0, 6)
UICornerClose.Parent = CloseBtn
​-- Button Animation Utility
local function AddButtonAnimation(btn, hoverColor, clickColor)
local originalColor = btn.BackgroundColor3
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
btn.MouseEnter:Connect(function()
TweenService:Create(btn, tweenInfo, {BackgroundColor3 = hoverColor}):Play()
end)
btn.MouseLeave:Connect(function()
TweenService:Create(btn, tweenInfo, {BackgroundColor3 = originalColor}):Play()
end)
btn.MouseButton1Down:Connect(function()
TweenService:Create(btn, tweenInfo, {BackgroundColor3 = clickColor}):Play()
end)
btn.MouseButton1Up:Connect(function()
TweenService:Create(btn, tweenInfo, {BackgroundColor3 = hoverColor}):Play()
end)
end
​AddButtonAnimation(MinimizeBtn, Color3.fromRGB(50, 50, 65), Color3.fromRGB(255, 170, 0))
AddButtonAnimation(CloseBtn, Color3.fromRGB(200, 40, 50), Color3.fromRGB(150, 20, 30))
​-- STREAMING_CHUNK:Building sidebar navigation and container tabs...
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 120, 1, -40)
Sidebar.Position = UDim2.new(0, 0, 0, 40)
Sidebar.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 11
Sidebar.Parent = MainFrame
​local SidebarList = Instance.new("UIListLayout")
SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
SidebarList.Padding = UDim.new(0, 5)
SidebarList.Parent = Sidebar
​local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.PaddingTop = UDim.new(0, 10)
SidebarPadding.PaddingLeft = UDim.new(0, 8)
SidebarPadding.PaddingRight = UDim.new(0, 8)
SidebarPadding.Parent = Sidebar
​local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Size = UDim2.new(1, -120, 1, -40)
Container.Position = UDim2.new(0, 120, 0, 40)
Container.BackgroundTransparency = 1
Container.ZIndex = 11
Container.Parent = MainFrame
​local isMinimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
isMinimized = not isMinimized
Sidebar.Visible = not isMinimized
Container.Visible = not isMinimized
local targetSize = isMinimized and UDim2.new(0, 520, 0, 40) or UDim2.new(0, 520, 0, 300)
TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = targetSize}):Play()
end)
​CloseBtn.MouseButton1Click:Connect(function()
local tween = TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 520, 0, 0), BackgroundTransparency = 1})
tween:Play()
tween.Completed:Connect(function()
ScreenGui:Destroy()
end)
end)
​-- STREAMING_CHUNK:Setting up scrolling frames for tab contents...
-- FPS Tab Setup
local FPSTab = Instance.new("ImageLabel")
FPSTab.Name = "FPSTab"
FPSTab.Size = UDim2.new(1, 0, 1, 0)
FPSTab.BackgroundTransparency = 1
FPSTab.Image = "rbxassetid://6521912809"
FPSTab.ScaleType = Enum.ScaleType.Crop
FPSTab.Visible = true
FPSTab.ZIndex = 11
FPSTab.Parent = Container
​local FPSScroll = Instance.new("ScrollingFrame")
FPSScroll.Name = "FPSScroll"
FPSScroll.Size = UDim2.new(1, 0, 1, 0)
FPSScroll.BackgroundTransparency = 1
FPSScroll.BorderSizePixel = 0
FPSScroll.ScrollBarThickness = 4
FPSScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 40)
FPSScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
FPSScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
FPSScroll.ZIndex = 11
FPSScroll.Parent = FPSTab
​local FPSPadding = Instance.new("UIPadding")
FPSPadding.PaddingTop = UDim.new(0, 10)
FPSPadding.PaddingLeft = UDim.new(0, 15)
FPSPadding.PaddingRight = UDim.new(0, 15)
FPSPadding.Parent = FPSScroll
​local FPSList = Instance.new("UIListLayout")
FPSList.SortOrder = Enum.SortOrder.LayoutOrder
FPSList.Padding = UDim.new(0, 6)
FPSList.Parent = FPSScroll
​local BoostFPSBtn = Instance.new("TextButton")
BoostFPSBtn.Name = "BoostFPSBtn"
BoostFPSBtn.Size = UDim2.new(1, 0, 0, 36)
BoostFPSBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
BoostFPSBtn.Text = "Boost FPS"
BoostFPSBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BoostFPSBtn.TextSize = 14
BoostFPSBtn.Font = Enum.Font.GothamSemibold
BoostFPSBtn.TextXAlignment = Enum.TextXAlignment.Left
BoostFPSBtn.BorderSizePixel = 0
BoostFPSBtn.LayoutOrder = 1
BoostFPSBtn.ZIndex = 12
BoostFPSBtn.Parent = FPSScroll
​local UICornerBoost = Instance.new("UICorner")
UICornerBoost.CornerRadius = UDim.new(0, 6)
UICornerBoost.Parent = BoostFPSBtn
​local BoostPadding = Instance.new("UIPadding")
BoostPadding.PaddingLeft = UDim.new(0, 12)
BoostPadding.Parent = BoostFPSBtn
​local BoostIcon = Instance.new("ImageLabel")
BoostIcon.Name = "TextureIcon"
BoostIcon.Size = UDim2.new(0, 20, 0, 20)
BoostIcon.Position = UDim2.new(1, -28, 0.5, -10)
BoostIcon.BackgroundTransparency = 1
BoostIcon.Image = "rbxassetid://12804017021"
BoostIcon.ZIndex = 13
BoostIcon.Parent = BoostFPSBtn
​local FPSSubtext = Instance.new("TextLabel")
FPSSubtext.Name = "FPSSubtext"
FPSSubtext.Size = UDim2.new(1, 0, 0, 16)
FPSSubtext.BackgroundTransparency = 1
FPSSubtext.Text = "This will permanently disable in-game VFX to boost FPS"
FPSSubtext.TextColor3 = Color3.fromRGB(150, 150, 150)
FPSSubtext.TextSize = 11
FPSSubtext.Font = Enum.Font.Gotham
FPSSubtext.TextXAlignment = Enum.TextXAlignment.Left
FPSSubtext.LayoutOrder = 2
FPSSubtext.ZIndex = 12
FPSSubtext.Parent = FPSScroll
​local AntiLagBtn = Instance.new("TextButton")
AntiLagBtn.Name = "AntiLagBtn"
AntiLagBtn.Size = UDim2.new(1, 0, 0, 36)
AntiLagBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
AntiLagBtn.Text = "Anti Lag"
AntiLagBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiLagBtn.TextSize = 14
AntiLagBtn.Font = Enum.Font.GothamSemibold
AntiLagBtn.TextXAlignment = Enum.TextXAlignment.Left
AntiLagBtn.BorderSizePixel = 0
AntiLagBtn.LayoutOrder = 3
AntiLagBtn.ZIndex = 12
AntiLagBtn.Parent = FPSScroll
​local UICornerAntiLag = Instance.new("UICorner")
UICornerAntiLag.CornerRadius = UDim.new(0, 6)
UICornerAntiLag.Parent = AntiLagBtn
​local AntiLagPadding = Instance.new("UIPadding")
AntiLagPadding.PaddingLeft = UDim.new(0, 12)
AntiLagPadding.Parent = AntiLagBtn
​local AntiLagIcon = Instance.new("ImageLabel")
AntiLagIcon.Name = "AntiLagIcon"
AntiLagIcon.Size = UDim2.new(0, 20, 0, 20)
AntiLagIcon.Position = UDim2.new(1, -28, 0.5, -10)
AntiLagIcon.BackgroundTransparency = 1
AntiLagIcon.Image = "rbxassetid://12804017021"
AntiLagIcon.ZIndex = 13
AntiLagIcon.Parent = AntiLagBtn
​local AntiLagSubtextFrame = Instance.new("Frame")
AntiLagSubtextFrame.Name = "AntiLagSubtextFrame"
AntiLagSubtextFrame.Size = UDim2.new(1, 0, 0, 16)
AntiLagSubtextFrame.BackgroundTransparency = 1
AntiLagSubtextFrame.LayoutOrder = 4
AntiLagSubtextFrame.ZIndex = 12
AntiLagSubtextFrame.Parent = FPSScroll
​local WarningIcon = Instance.new("ImageLabel")
WarningIcon.Name = "WarningIcon"
WarningIcon.Size = UDim2.new(0, 14, 0, 14)
WarningIcon.Position = UDim2.new(0, 0, 0.5, -7)
WarningIcon.BackgroundTransparency = 1
WarningIcon.Image = "rbxassetid://99624144590072"
WarningIcon.ZIndex = 12
WarningIcon.Parent = AntiLagSubtextFrame
​local AntiLagSubtext = Instance.new("TextLabel")
AntiLagSubtext.Name = "AntiLagSubtext"
AntiLagSubtext.Size = UDim2.new(1, -18, 1, 0)
AntiLagSubtext.Position = UDim2.new(0, 18, 0, 0)
AntiLagSubtext.BackgroundTransparency = 1
AntiLagSubtext.Text = "Requires a good wifi to work perfectly"
AntiLagSubtext.TextColor3 = Color3.fromRGB(150, 150, 150)
AntiLagSubtext.TextSize = 11
AntiLagSubtext.Font = Enum.Font.Gotham
AntiLagSubtext.TextXAlignment = Enum.TextXAlignment.Left
AntiLagSubtext.ZIndex = 12
AntiLagSubtext.Parent = AntiLagSubtextFrame
​-- Auto Tab Setup
local AutoTab = Instance.new("ImageLabel")
AutoTab.Name = "AutoTab"
AutoTab.Size = UDim2.new(1, 0, 1, 0)
AutoTab.BackgroundTransparency = 1
AutoTab.Image = "rbxassetid://6521912809"
AutoTab.ScaleType = Enum.ScaleType.Crop
AutoTab.Visible = false
AutoTab.ZIndex = 11
AutoTab.Parent = Container
​local AutoScroll = Instance.new("ScrollingFrame")
AutoScroll.Name = "AutoScroll"
AutoScroll.Size = UDim2.new(1, 0, 1, 0)
AutoScroll.BackgroundTransparency = 1
AutoScroll.BorderSizePixel = 0
AutoScroll.ScrollBarThickness = 4
AutoScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 40)
AutoScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
AutoScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
AutoScroll.ZIndex = 11
AutoScroll.Parent = AutoTab
​local AutoPadding = Instance.new("UIPadding")
AutoPadding.PaddingTop = UDim.new(0, 10)
AutoPadding.PaddingLeft = UDim.new(0, 15)
AutoPadding.PaddingRight = UDim.new(0, 15)
AutoPadding.Parent = AutoScroll
​local AutoList = Instance.new("UIListLayout")
AutoList.SortOrder = Enum.SortOrder.LayoutOrder
AutoList.Padding = UDim.new(0, 2)
AutoList.Parent = AutoScroll
​-- Misc Tab Setup
local MiscTab = Instance.new("ImageLabel")
MiscTab.Name = "MiscTab"
MiscTab.Size = UDim2.new(1, 0, 1, 0)
MiscTab.BackgroundTransparency = 1
MiscTab.Image = "rbxassetid://6521912809"
MiscTab.ScaleType = Enum.ScaleType.Crop
MiscTab.Visible = false
MiscTab.ZIndex = 11
MiscTab.Parent = Container
​local MiscScroll = Instance.new("ScrollingFrame")
MiscScroll.Name = "MiscScroll"
MiscScroll.Size = UDim2.new(1, 0, 1, 0)
MiscScroll.BackgroundTransparency = 1
MiscScroll.BorderSizePixel = 0
MiscScroll.ScrollBarThickness = 4
MiscScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 40)
MiscScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
MiscScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
MiscScroll.ZIndex = 11
MiscScroll.Parent = MiscTab
​local MiscPadding = Instance.new("UIPadding")
MiscPadding.PaddingTop = UDim.new(0, 10)
MiscPadding.PaddingLeft = UDim.new(0, 15)
MiscPadding.PaddingRight = UDim.new(0, 15)
MiscPadding.Parent = MiscScroll
​local MiscList = Instance.new("UIListLayout")
MiscList.SortOrder = Enum.SortOrder.LayoutOrder
MiscList.Padding = UDim.new(0, 2)
MiscList.Parent = MiscScroll
​-- Aim Tab Setup
local AimTab = Instance.new("ImageLabel")
AimTab.Name = "AimTab"
AimTab.Size = UDim2.new(1, 0, 1, 0)
AimTab.BackgroundTransparency = 1
AimTab.Image = "rbxassetid://6521912809"
AimTab.ScaleType = Enum.ScaleType.Crop
AimTab.Visible = false
AimTab.ZIndex = 11
AimTab.Parent = Container
​local AimScroll = Instance.new("ScrollingFrame")
AimScroll.Name = "AimScroll"
AimScroll.Size = UDim2.new(1, 0, 1, 0)
AimScroll.BackgroundTransparency = 1
AimScroll.BorderSizePixel = 0
AimScroll.ScrollBarThickness = 4
AimScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 40)
AimScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
AimScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
AimScroll.ZIndex = 11
AimScroll.Parent = AimTab
​local AimPadding = Instance.new("UIPadding")
AimPadding.PaddingTop = UDim.new(0, 10)
AimPadding.PaddingLeft = UDim.new(0, 15)
AimPadding.PaddingRight = UDim.new(0, 15)
AimPadding.Parent = AimScroll
​local AimList = Instance.new("UIListLayout")
AimList.SortOrder = Enum.SortOrder.LayoutOrder
AimList.Padding = UDim.new(0, 2)
AimList.Parent = AimScroll
​-- Ranked Tab Setup
local RankedTab = Instance.new("ImageLabel")
RankedTab.Name = "RankedTab"
RankedTab.Size = UDim2.new(1, 0, 1, 0)
RankedTab.BackgroundTransparency = 1
RankedTab.Image = "rbxassetid://6521912809"
RankedTab.ScaleType = Enum.ScaleType.Crop
RankedTab.Visible = false
RankedTab.ZIndex = 11
RankedTab.Parent = Container
​local RankedScroll = Instance.new("ScrollingFrame")
RankedScroll.Name = "RankedScroll"
RankedScroll.Size = UDim2.new(1, 0, 1, 0)
RankedScroll.BackgroundTransparency = 1
RankedScroll.BorderSizePixel = 0
RankedScroll.ScrollBarThickness = 4
RankedScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 40)
RankedScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
RankedScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
RankedScroll.ZIndex = 11
RankedScroll.Parent = RankedTab
​local RankedPadding = Instance.new("UIPadding")
RankedPadding.PaddingTop = UDim.new(0, 10)
RankedPadding.PaddingLeft = UDim.new(0, 15)
RankedPadding.PaddingRight = UDim.new(0, 15)
RankedPadding.Parent = RankedScroll
​local RankedList = Instance.new("UIListLayout")
RankedList.SortOrder = Enum.SortOrder.LayoutOrder
RankedList.Padding = UDim.new(0, 2)
RankedList.Parent = RankedScroll
​-- Themes Tab Setup
local ThemesTab = Instance.new("ImageLabel")
ThemesTab.Name = "ThemesTab"
ThemesTab.Size = UDim2.new(1, 0, 1, 0)
ThemesTab.BackgroundTransparency = 1
ThemesTab.Image = "rbxassetid://6521912809"
ThemesTab.ScaleType = Enum.ScaleType.Crop
ThemesTab.Visible = false
ThemesTab.ZIndex = 11
ThemesTab.Parent = Container
​local ThemesScroll = Instance.new("ScrollingFrame")
ThemesScroll.Name = "ThemesScroll"
ThemesScroll.Size = UDim2.new(1, 0, 1, 0)
ThemesScroll.BackgroundTransparency = 1
ThemesScroll.BorderSizePixel = 0
ThemesScroll.ScrollBarThickness = 4
ThemesScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 40)
ThemesScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
ThemesScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
ThemesScroll.ZIndex = 11
ThemesScroll.Parent = ThemesTab
​local ThemesPadding = Instance.new("UIPadding")
ThemesPadding.PaddingTop = UDim.new(0, 10)
ThemesPadding.PaddingLeft = UDim.new(0, 15)
ThemesPadding.PaddingRight = UDim.new(0, 15)
ThemesPadding.Parent = ThemesScroll
​local ThemesList = Instance.new("UIListLayout")
ThemesList.SortOrder = Enum.SortOrder.LayoutOrder
ThemesList.Padding = UDim.new(0, 2)
ThemesList.Parent = ThemesScroll
​-- STREAMING_CHUNK:Defining dynamic toggle creation utility...
local function CreateToggle(name, text, subtext, layoutOrder, parentFrame)
parentFrame = parentFrame or AutoScroll
local Frame = Instance.new("Frame")
Frame.Name = name .. "Frame"
Frame.Size = UDim2.new(1, 0, 0, 42)
Frame.BackgroundTransparency = 1
Frame.LayoutOrder = layoutOrder
Frame.ZIndex = 12
Frame.Parent = parentFrame
​local Btn = Instance.new("TextButton")
Btn.Name = name .. "Btn"
Btn.Size = UDim2.new(1, 0, 0, 22)
Btn.BackgroundTransparency = 1
Btn.Text = text
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.TextSize = 13
Btn.Font = Enum.Font.GothamSemibold
Btn.TextXAlignment = Enum.TextXAlignment.Left
Btn.ZIndex = 13
Btn.Parent = Frame
​local ToggleBox = Instance.new("Frame")
ToggleBox.Name = "ToggleBox"
ToggleBox.Size = UDim2.new(0, 40, 0, 20)
ToggleBox.Position = UDim2.new(1, -40, 0, 1)
ToggleBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ToggleBox.BorderSizePixel = 0
ToggleBox.ZIndex = 13
ToggleBox.Parent = Btn
​local UICornerBox = Instance.new("UICorner")
UICornerBox.CornerRadius = UDim.new(1, 0)
UICornerBox.Parent = ToggleBox
​local Indicator = Instance.new("Frame")
Indicator.Name = "Indicator"
Indicator.Size = UDim2.new(0, 14, 0, 14)
Indicator.Position = UDim2.new(0, 3, 0.5, -7)
Indicator.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
Indicator.BorderSizePixel = 0
Indicator.ZIndex = 14
Indicator.Parent = ToggleBox
​local UICornerInd = Instance.new("UICorner")
UICornerInd.CornerRadius = UDim.new(1, 0)
UICornerInd.Parent = Indicator
​local Sub = Instance.new("TextLabel")
Sub.Name = "Subtext"
Sub.Size = UDim2.new(1, 0, 0, 16)
Sub.Position = UDim2.new(0, 0, 0, 20)
Sub.BackgroundTransparency = 1
Sub.Text = subtext
Sub.TextColor3 = Color3.fromRGB(150, 150, 150)
Sub.TextSize = 11
Sub.Font = Enum.Font.Gotham
Sub.TextXAlignment = Enum.TextXAlignment.Left
Sub.ZIndex = 13
Sub.Parent = Frame
​local toggled = false
local callback = nil
​Btn.MouseButton1Click:Connect(function()
toggled = not toggled
local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
if toggled then
TweenService:Create(ToggleBox, tweenInfo, {BackgroundColor3 = Color3.fromRGB(255, 0, 40)}):Play()
TweenService:Create(Indicator, tweenInfo, {Position = UDim2.new(1, -17, 0.5, -7)}):Play()
else
TweenService:Create(ToggleBox, tweenInfo, {BackgroundColor3 = Color3.fromRGB(40, 40, 50)}):Play()
TweenService:Create(Indicator, tweenInfo, {Position = UDim2.new(0, 3, 0.5, -7)}):Play()
end
if callback then
callback(toggled)
end
end)
​return {
SetCallback = function(fn)
callback = fn
end,
GetState = function()
return toggled
end
}
end
​-- Creating Toggles
local MuteSoundToggle = CreateToggle("MuteSound", "Mute Sound", "Mutes all in-game audio", 5, FPSScroll)
local NoRenderToggle = CreateToggle("NoRender", "No Render", "Covers screen with black texture", 6, FPSScroll)
​local storedVolume = UserGameSettings.MasterVolume
MuteSoundToggle.SetCallback(function(state)
if state then
storedVolume = UserGameSettings.MasterVolume
UserGameSettings.MasterVolume = 0
else
UserGameSettings.MasterVolume = storedVolume or 1
end
end)
​NoRenderToggle.SetCallback(function(state)
NoRenderOverlay.Visible = state
end)
​local AutoNearestToggle = CreateToggle("AutoNearest", "Auto Kill Nearest", "This kills the nearest player", 1, AutoScroll)
local AutoLowestToggle = CreateToggle("AutoLowest", "Auto Kill Lowest", "This kills a low health player", 2, AutoScroll)
local BypassDeathCounterToggle = CreateToggle("BypassDeathCounter", "Bypass Death Counter", "Bypasses death counter on specific animations", 1, MiscScroll)
local NoDashCooldownToggle = CreateToggle("NoDashCooldown", "No dash cooldown", "Removes dash cooldown", 2, MiscScroll)
local DodgeSaitamaToggle = CreateToggle("DodgeSaitama", "Dodge Saitama moves", "Dodges specific Saitama moves", 3, MiscScroll)
local AntiVoidToggle = CreateToggle("AntiVoid", "Anti void", "Prevents falling into the void", 4, MiscScroll)
local InvisibleToggle = CreateToggle("Invisible", "Invisible", "Makes player character invisible", 5, MiscScroll)
​local InvisibleSubtextFrame = Instance.new("Frame")
InvisibleSubtextFrame.Name = "InvisibleSubtextFrame"
InvisibleSubtextFrame.Size = UDim2.new(1, 0, 0, 16)
InvisibleSubtextFrame.BackgroundTransparency = 1
InvisibleSubtextFrame.LayoutOrder = 6
InvisibleSubtextFrame.ZIndex = 12
InvisibleSubtextFrame.Parent = MiscScroll
​local InvisibleWarningIcon = Instance.new("ImageLabel")
InvisibleWarningIcon.Name = "InvisibleWarningIcon"
InvisibleWarningIcon.Size = UDim2.new(0, 14, 0, 14)
InvisibleWarningIcon.Position = UDim2.new(0, 0, 0.5, -7)
InvisibleWarningIcon.BackgroundTransparency = 1
InvisibleWarningIcon.Image = "rbxassetid://99624144590072"
InvisibleWarningIcon.ZIndex = 12
InvisibleWarningIcon.Parent = InvisibleSubtextFrame
​local InvisibleSubtext = Instance.new("TextLabel")
InvisibleSubtext.Name = "InvisibleSubtext"
InvisibleSubtext.Size = UDim2.new(1, -18, 1, 0)
InvisibleSubtext.Position = UDim2.new(0, 18, 0, 0)
InvisibleSubtext.BackgroundTransparency = 1
InvisibleSubtext.Text = "It's currently client-side only"
InvisibleSubtext.TextColor3 = Color3.fromRGB(150, 150, 150)
InvisibleSubtext.TextSize = 11
InvisibleSubtext.Font = Enum.Font.Gotham
InvisibleSubtext.TextXAlignment = Enum.TextXAlignment.Left
InvisibleSubtext.ZIndex = 12
InvisibleSubtext.Parent = InvisibleSubtextFrame
​local AntiRagdollToggle = CreateToggle("AntiRagdoll", "Anti Ragdoll", "Prevents ragdoll state", 7, MiscScroll)
local AntiStunToggle = CreateToggle("AntiStun", "Anti Stun", "Prevents stun effects", 8, MiscScroll)
​local FixCameraBtn = Instance.new("TextButton")
FixCameraBtn.Name = "FixCameraBtn"
FixCameraBtn.Size = UDim2.new(1, 0, 0, 36)
FixCameraBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
FixCameraBtn.Text = "Fix camera"
FixCameraBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FixCameraBtn.TextSize = 14
FixCameraBtn.Font = Enum.Font.GothamSemibold
FixCameraBtn.TextXAlignment = Enum.TextXAlignment.Left
FixCameraBtn.BorderSizePixel = 0
FixCameraBtn.LayoutOrder = 9
FixCameraBtn.ZIndex = 12
FixCameraBtn.Parent = MiscScroll
​local UICornerFixCamera = Instance.new("UICorner")
UICornerFixCamera.CornerRadius = UDim.new(0, 6)
UICornerFixCamera.Parent = FixCameraBtn
​local FixCameraPadding = Instance.new("UIPadding")
FixCameraPadding.PaddingLeft = UDim.new(0, 12)
FixCameraPadding.Parent = FixCameraBtn
​local AimBotToggle = CreateToggle("AimBot", "Aim bot", "Locks camera to nearest enemy", 1, AimScroll)
local RankedFarmToggle = CreateToggle("RankedFarm", "Ranked farm", "Farms ranked matches automatically", 1, RankedScroll)
​-- STREAMING_CHUNK:Configuring themes tab and dropdown selector...
local ThemesFrame = Instance.new("Frame")
ThemesFrame.Name = "ThemesFrame"
ThemesFrame.Size = UDim2.new(1, 0, 0, 30)
ThemesFrame.BackgroundTransparency = 1
ThemesFrame.LayoutOrder = 1
ThemesFrame.ZIndex = 12
ThemesFrame.Parent = ThemesScroll
​local ThemesLabel = Instance.new("TextLabel")
ThemesLabel.Size = UDim2.new(0, 100, 1, 0)
ThemesLabel.BackgroundTransparency = 1
ThemesLabel.Text = "Themes"
ThemesLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
ThemesLabel.TextSize = 12
ThemesLabel.Font = Enum.Font.GothamSemibold
ThemesLabel.TextXAlignment = Enum.TextXAlignment.Left
ThemesLabel.ZIndex = 13
ThemesLabel.Parent = ThemesFrame
​local ThemesDropdownBtn = Instance.new("TextButton")
ThemesDropdownBtn.Name = "ThemesDropdownBtn"
ThemesDropdownBtn.Size = UDim2.new(0, 160, 0, 24)
ThemesDropdownBtn.Position = UDim2.new(0, 105, 0.5, -12)
ThemesDropdownBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
ThemesDropdownBtn.BorderSizePixel = 0
ThemesDropdownBtn.Text = "Sukuna v"
ThemesDropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ThemesDropdownBtn.TextSize = 12
ThemesDropdownBtn.Font = Enum.Font.Gotham
ThemesDropdownBtn.ZIndex = 13
ThemesDropdownBtn.Parent = ThemesFrame
​local UICornerThemes = Instance.new("UICorner")
UICornerThemes.CornerRadius = UDim.new(0, 5)
UICornerThemes.Parent = ThemesDropdownBtn
​local ThemesMenu = Instance.new("ScrollingFrame")
ThemesMenu.Name = "ThemesMenu"
ThemesMenu.Size = UDim2.new(0, 160, 0, 0)
ThemesMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
ThemesMenu.BorderSizePixel = 0
ThemesMenu.Visible = false
ThemesMenu.ClipsDescendants = true
ThemesMenu.ScrollBarThickness = 3
ThemesMenu.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 40)
ThemesMenu.CanvasSize = UDim2.new(0, 0, 0, 0)
ThemesMenu.AutomaticCanvasSize = Enum.AutomaticSize.Y
ThemesMenu.ZIndex = 100
ThemesMenu.Parent = ScreenGui
​local UICornerThemesMenu = Instance.new("UICorner")
UICornerThemesMenu.CornerRadius = UDim.new(0, 5)
UICornerThemesMenu.Parent = ThemesMenu
​local UIStrokeThemesMenu = Instance.new("UIStroke")
UIStrokeThemesMenu.Thickness = 1
UIStrokeThemesMenu.Color = Color3.fromRGB(50, 50, 60)
UIStrokeThemesMenu.Parent = ThemesMenu
​local UIListThemesMenu = Instance.new("UIListLayout")
UIListThemesMenu.SortOrder = Enum.SortOrder.LayoutOrder
UIListThemesMenu.Padding = UDim.new(0, 2)
UIListThemesMenu.Parent = ThemesMenu
​local UIPaddingThemesMenu = Instance.new("UIPadding")
UIPaddingThemesMenu.PaddingTop = UDim.new(0, 2)
UIPaddingThemesMenu.PaddingBottom = UDim.new(0, 2)
UIPaddingThemesMenu.Parent = ThemesMenu
​local ThemeOptions = {
{Name = "Sukuna", Id = "rbxassetid://6521912809"},
{Name = "Gojo & Sukuna", Id = "rbxassetid://88600377162464"},
{Name = "Sukuna's Domain", Id = "rbxassetid://72371065739097"},
{Name = "Gojo's Domain", Id = "rbxassetid://72201053913853"}
}
​local ThemesMenuOpen = false
local ThemesMenuTween = nil
​local function ApplyTheme(assetId)
FPSTab.Image = assetId
AutoTab.Image = assetId
MiscTab.Image = assetId
AimTab.Image = assetId
RankedTab.Image = assetId
ThemesTab.Image = assetId
end
​local function ToggleThemesMenu()
if ThemesMenuTween then
ThemesMenuTween:Cancel()
ThemesMenuTween = nil
end
local absPos = ThemesDropdownBtn.AbsolutePosition
local absSize = ThemesDropdownBtn.AbsoluteSize
ThemesMenu.Position = UDim2.new(0, absPos.X, 0, absPos.Y + absSize.Y + 2)
if ThemesMenuOpen then
ThemesMenuOpen = false
ThemesMenuTween = TweenService:Create(ThemesMenu, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Size = UDim2.new(0, 160, 0, 0)
})
ThemesMenuTween:Play()
ThemesMenuTween.Completed:Connect(function()
if not ThemesMenuOpen then
ThemesMenu.Visible = false
end
end)
else
ThemesMenuOpen = true
ThemesMenu.Visible = true
ThemesMenu.Size = UDim2.new(0, 160, 0, 0)
ThemesMenuTween = TweenService:Create(ThemesMenu, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Size = UDim2.new(0, 160, 0, 110)
})
ThemesMenuTween:Play()
end
end
​for _, opt in ipairs(ThemeOptions) do
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(1, 0, 0, 24)
btn.BackgroundTransparency = 1
btn.Text = opt.Name
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 12
btn.Font = Enum.Font.Gotham
btn.ZIndex = 101
btn.Parent = ThemesMenu
btn.MouseButton1Click:Connect(function()
ThemesDropdownBtn.Text = opt.Name .. " v"
ApplyTheme(opt.Id)
if ThemesMenuOpen then
ToggleThemesMenu()
end
end)
end
​ThemesDropdownBtn.MouseButton1Click:Connect(function()
ToggleThemesMenu()
end)
​UserInputService.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if ThemesMenuOpen and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
local mousePos = UserInputService:GetMouseLocation()
local menuPos = ThemesMenu.AbsolutePosition
local menuSize = ThemesMenu.AbsoluteSize
local btnPos = ThemesDropdownBtn.AbsolutePosition
local btnSize = ThemesDropdownBtn.AbsoluteSize
local insideMenu = mousePos.X >= menuPos.X and mousePos.X <= menuPos.X + menuSize.X and mousePos.Y >= menuPos.Y and mousePos.Y <= menuPos.Y + menuSize.Y
local insideBtn = mousePos.X >= btnPos.X and mousePos.X <= btnPos.X + btnSize.X and mousePos.Y >= btnPos.Y and mousePos.Y <= btnPos.Y + btnSize.Y
if not insideMenu and not insideBtn then
ToggleThemesMenu()
end
end
end)
​-- STREAMING_CHUNK:Setting up target user input fields...
local TargetInputFrame = Instance.new("Frame")
TargetInputFrame.Name = "TargetInputFrame"
TargetInputFrame.Size = UDim2.new(1, 0, 0, 30)
TargetInputFrame.BackgroundTransparency = 1
TargetInputFrame.LayoutOrder = 2
TargetInputFrame.ZIndex = 12
TargetInputFrame.Parent = AimScroll
​local TargetLabel = Instance.new("TextLabel")
TargetLabel.Size = UDim2.new(0, 100, 1, 0)
TargetLabel.BackgroundTransparency = 1
TargetLabel.Text = "Target"
TargetLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
TargetLabel.TextSize = 12
TargetLabel.Font = Enum.Font.GothamSemibold
TargetLabel.TextXAlignment = Enum.TextXAlignment.Left
TargetLabel.ZIndex = 13
TargetLabel.Parent = TargetInputFrame
​local TargetTextBox = Instance.new("TextBox")
TargetTextBox.Size = UDim2.new(0, 120, 0, 24)
TargetTextBox.Position = UDim2.new(0, 105, 0.5, -12)
TargetTextBox.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
TargetTextBox.BorderSizePixel = 0
TargetTextBox.Text = ""
TargetTextBox.PlaceholderText = "Username/Display..."
TargetTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetTextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
TargetTextBox.TextSize = 11
TargetTextBox.Font = Enum.Font.Gotham
TargetTextBox.ZIndex = 13
TargetTextBox.Parent = TargetInputFrame
​local UICornerTargetInput = Instance.new("UICorner")
UICornerTargetInput.CornerRadius = UDim.new(0, 5)
UICornerTargetInput.Parent = TargetTextBox
​-- STREAMING_CHUNK:Implementing player invisibility and anti-void logic...
local function ToggleInvisibility(state)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local function setInvisible(enabled)
local transparency = enabled and 1 or 0
for _, v in ipairs(character:GetDescendants()) do
if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
v.Transparency = transparency
elseif v:IsA("Decal") or v:IsA("Texture") then
v.Transparency = transparency
elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
v.Enabled = not enabled
end
end
for _, acc in ipairs(character:GetChildren()) do
if acc:IsA("Accessory") then
local handle = acc:FindFirstChild("Handle")
if handle then
handle.Transparency = transparency
end
end
end
end
setInvisible(state)
if state then
player.CharacterAdded:Connect(function(newChar)
task.wait(0.5)
character = newChar
setInvisible(true)
end)
end
end
​InvisibleToggle.SetCallback(function(state)
ToggleInvisibility(state)
end)
​local AntiVoidConnection = nil
AntiVoidToggle.SetCallback(function(state)
if AntiVoidConnection then
AntiVoidConnection:Disconnect()
AntiVoidConnection = nil
end
if state then
AntiVoidConnection = RunService.Stepped:Connect(function()
workspace.FallenPartsDestroyHeight = 0 / 0
end)
end
end)
​-- STREAMING_CHUNK:Implementing Saitama move dodging logic...
local DodgeDistance = 200
local DodgeEnabled = false
local IsDodging = false
local OmniAnims = {
"rbxassetid://13927612951",
"rbxassetid://12447707844",
"rbxassetid://12983333733",
}
local TableAnims = {
"rbxassetid://11365563255",
}
​local function isDangerousAnim(track)
local id = track.Animation and track.Animation.AnimationId
if not id then return false end
for _, v in ipairs(OmniAnims) do
if id == v then return "Omni" end
end
for _, v in ipairs(TableAnims) do
if id == v then return "Table" end
end
return false
end
​local function dodgeAway(fromPosition)
local char = LocalPlayer.Character
if not char or not char:FindFirstChild("HumanoidRootPart") then return end
local hrp = char.HumanoidRootPart
local direction = (hrp.Position - fromPosition).Unit
local newPos = hrp.Position + direction * 25 + Vector3.new(0, 5, 0)
hrp.CFrame = CFrame.new(newPos)
end
​local dodgeConnection
local function SetDodgeSaitama(state)
DodgeEnabled = state
if dodgeConnection then
dodgeConnection:Disconnect()
dodgeConnection = nil
end
if state then
dodgeConnection = RunService.Heartbeat:Connect(function()
if not DodgeEnabled then return end
local myChar = LocalPlayer.Character
if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end
local detectedDanger = false
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
if hum and hrp then
local dist = (myChar.HumanoidRootPart.Position - hrp.Position).Magnitude
if dist <= DodgeDistance then
for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
local danger = isDangerousAnim(track)
if danger then
detectedDanger = true
IsDodging = true
dodgeAway(hrp.Position)
break
end
end
end
end
end
end
if not detectedDanger then
IsDodging = false
end
end)
else
IsDodging = false
end
end
​DodgeSaitamaToggle.SetCallback(function(state)
SetDodgeSaitama(state)
end)
​-- STREAMING_CHUNK:Configuring death counter bypass and dash cooldowns...
local ByPassCounterEnabled = false
local ByPassLoop = nil
​local function StartByPassCounter()
local animations = {
["rbxassetid://11343250001"] = 0
}
local function ifind(t, a)
for i, _ in pairs(t) do
if i == a then return i end
end
return false
end
local plr = game.Players.LocalPlayer
ByPassLoop = task.spawn(function()
local dothetech = false
local startPosition
local targetPosition = Vector3.new(0, -499, 0)
local Camera = workspace.CurrentCamera
while ByPassCounterEnabled do
if not IsDodging then
local character = plr.Character
if character and character:FindFirstChild("Humanoid") then
local animate = character.Humanoid:FindFirstChild("Animator")
if animate then
for _, v in pairs(animate:GetPlayingAnimationTracks()) do
if ifind(animations, v.Animation.AnimationId) and not dothetech then
task.wait(animations[v.Animation.AnimationId])
dothetech = true
startPosition = character.HumanoidRootPart.Position
v.Stopped:Connect(function()
dothetech = false
end)
repeat
task.wait()
character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
task.wait(8)
character.HumanoidRootPart.CFrame = CFrame.new(startPosition)
task.wait(0.1)
Camera.CameraType = Enum.CameraType.Custom
plr.CameraMode = Enum.CameraMode.Classic
until not dothetech
task.wait(10)
end
end
end
end
end
task.wait()
end
end)
end
​local function SetByPassCounter(state)
ByPassCounterEnabled = state
if state then
StartByPassCounter()
end
end
​BypassDeathCounterToggle.SetCallback(function(state)
SetByPassCounter(state)
end)
​local function SetNoDashCD(state)
if state then
workspace:SetAttribute("EffectAffects", 1)
workspace:SetAttribute("NoDashCooldown", true)
else
workspace:SetAttribute("EffectAffects", 0)
workspace:SetAttribute("NoDashCooldown", false)
end
end
​NoDashCooldownToggle.SetCallback(function(state)
SetNoDashCD(state)
end)
​-- STREAMING_CHUNK:Configuring auto-kill input settings and execution modes...
local InputFrame = Instance.new("Frame")
InputFrame.Name = "InputFrame"
InputFrame.Size = UDim2.new(1, 0, 0, 30)
InputFrame.BackgroundTransparency = 1
InputFrame.LayoutOrder = 3
InputFrame.ZIndex = 12
InputFrame.Parent = AutoScroll
​local InputLabel = Instance.new("TextLabel")
InputLabel.Size = UDim2.new(0, 100, 1, 0)
InputLabel.BackgroundTransparency = 1
InputLabel.Text = "Lowest health:"
InputLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
InputLabel.TextSize = 12
InputLabel.Font = Enum.Font.GothamSemibold
InputLabel.TextXAlignment = Enum.TextXAlignment.Left
InputLabel.ZIndex = 13
InputLabel.Parent = InputFrame
​local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0, 120, 0, 24)
TextBox.Position = UDim2.new(0, 105, 0.5, -12)
TextBox.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
TextBox.BorderSizePixel = 0
TextBox.Text = "35"
TextBox.PlaceholderText = "Amount..."
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
TextBox.TextSize = 12
TextBox.Font = Enum.Font.Gotham
TextBox.ZIndex = 13
TextBox.Parent = InputFrame
​local UICornerInput = Instance.new("UICorner")
UICornerInput.CornerRadius = UDim.new(0, 5)
UICornerInput.Parent = TextBox
​TextBox:GetPropertyChangedSignal("Text"):Connect(function()
local text = TextBox.Text
if text == "" then return end
local cleaned = text:gsub("%D", "")
if #cleaned > 2 then
cleaned = cleaned:sub(1, 2)
end
local num = tonumber(cleaned)
if num and num > 99 then
cleaned = "99"
end
if TextBox.Text ~= cleaned then
TextBox.Text = cleaned
end
end)
​local AutoTargetToggle = CreateToggle("AutoTarget", "Auto Kill Player", "Target a specific player by name", 4, AutoScroll)
​local TargetInputFrameAuto = Instance.new("Frame")
TargetInputFrameAuto.Name = "TargetInputFrame"
TargetInputFrameAuto.Size = UDim2.new(1, 0, 0, 30)
TargetInputFrameAuto.BackgroundTransparency = 1
TargetInputFrameAuto.LayoutOrder = 5
TargetInputFrameAuto.ZIndex = 12
TargetInputFrameAuto.Parent = AutoScroll
​local TargetLabelAuto = Instance.new("TextLabel")
TargetLabelAuto.Size = UDim2.new(0, 100, 1, 0)
TargetLabelAuto.BackgroundTransparency = 1
TargetLabelAuto.Text = "Target player:"
TargetLabelAuto.TextColor3 = Color3.fromRGB(220, 220, 220)
TargetLabelAuto.TextSize = 12
TargetLabelAuto.Font = Enum.Font.GothamSemibold
TargetLabelAuto.TextXAlignment = Enum.TextXAlignment.Left
TargetLabelAuto.ZIndex = 13
TargetLabelAuto.Parent = TargetInputFrameAuto
​local TargetTextBoxAuto = Instance.new("TextBox")
TargetTextBoxAuto.Size = UDim2.new(0, 120, 0, 24)
TargetTextBoxAuto.Position = UDim2.new(0, 105, 0.5, -12)
TargetTextBoxAuto.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
TargetTextBoxAuto.BorderSizePixel = 0
TargetTextBoxAuto.Text = ""
TargetTextBoxAuto.PlaceholderText = "Username/Display..."
TargetTextBoxAuto.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetTextBoxAuto.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
TargetTextBoxAuto.TextSize = 11
TargetTextBoxAuto.Font = Enum.Font.Gotham
TargetTextBoxAuto.ZIndex = 13
TargetTextBoxAuto.Parent = TargetInputFrameAuto
​local UICornerTargetInputAuto = Instance.new("UICorner")
UICornerTargetInputAuto.CornerRadius = UDim.new(0, 5)
UICornerTargetInputAuto.Parent = TargetTextBoxAuto
​TargetTextBoxAuto.FocusLost:Connect(function()
getgenv().TargetPlayerName = TargetTextBoxAuto.Text
end)
​-- STREAMING_CHUNK:Setting up mode selection dropdown menu...
local ModeFrame = Instance.new("Frame")
ModeFrame.Name = "ModeFrame"
ModeFrame.Size = UDim2.new(1, 0, 0, 30)
ModeFrame.BackgroundTransparency = 1
ModeFrame.LayoutOrder = 6
ModeFrame.ZIndex = 12
ModeFrame.Parent = AutoScroll
​local ModeLabel = Instance.new("TextLabel")
ModeLabel.Size = UDim2.new(0, 100, 1, 0)
ModeLabel.BackgroundTransparency = 1
ModeLabel.Text = "Mode:"
ModeLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
ModeLabel.TextSize = 12
ModeLabel.Font = Enum.Font.GothamSemibold
ModeLabel.TextXAlignment = Enum.TextXAlignment.Left
ModeLabel.ZIndex = 13
ModeLabel.Parent = ModeFrame
​local ModeDropdownBtn = Instance.new("TextButton")
ModeDropdownBtn.Name = "ModeDropdownBtn"
ModeDropdownBtn.Size = UDim2.new(0, 120, 0, 24)
ModeDropdownBtn.Position = UDim2.new(0, 105, 0.5, -12)
ModeDropdownBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
ModeDropdownBtn.BorderSizePixel = 0
ModeDropdownBtn.Text = "Auto v"
ModeDropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ModeDropdownBtn.TextSize = 12
ModeDropdownBtn.Font = Enum.Font.Gotham
ModeDropdownBtn.ZIndex = 13
ModeDropdownBtn.Parent = ModeFrame
​local UICornerMode = Instance.new("UICorner")
UICornerMode.CornerRadius = UDim.new(0, 5)
UICornerMode.Parent = ModeDropdownBtn
​local ModeMenu = Instance.new("ScrollingFrame")
ModeMenu.Name = "ModeMenu"
ModeMenu.Size = UDim2.new(0, 120, 0, 0)
ModeMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
ModeMenu.BorderSizePixel = 0
ModeMenu.Visible = false
ModeMenu.ClipsDescendants = true
ModeMenu.ScrollBarThickness = 3
ModeMenu.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 40)
ModeMenu.CanvasSize = UDim2.new(0, 0, 0, 0)
ModeMenu.AutomaticCanvasSize = Enum.AutomaticSize.Y
ModeMenu.ZIndex = 100
ModeMenu.Parent = ScreenGui
​local UICornerMenu = Instance.new("UICorner")
UICornerMenu.CornerRadius = UDim.new(0, 5)
UICornerMenu.Parent = ModeMenu
​local UIStrokeMenu = Instance.new("UIStroke")
UIStrokeMenu.Thickness = 1
UIStrokeMenu.Color = Color3.fromRGB(50, 50, 60)
UIStrokeMenu.Parent = ModeMenu
​local UIListMenu = Instance.new("UIListLayout")
UIListMenu.SortOrder = Enum.SortOrder.LayoutOrder
UIListMenu.Padding = UDim.new(0, 2)
UIListMenu.Parent = ModeMenu
​local UIPaddingMenu = Instance.new("UIPadding")
UIPaddingMenu.PaddingTop = UDim.new(0, 2)
UIPaddingMenu.PaddingBottom = UDim.new(0, 2)
UIPaddingMenu.Parent = ModeMenu
​local AutoModeBtn = Instance.new("TextButton")
AutoModeBtn.Size = UDim2.new(1, 0, 0, 24)
AutoModeBtn.BackgroundTransparency = 1
AutoModeBtn.Text = "Auto"
AutoModeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoModeBtn.TextSize = 12
AutoModeBtn.Font = Enum.Font.Gotham
AutoModeBtn.ZIndex = 101
AutoModeBtn.Parent = ModeMenu
​local ManualModeBtn = Instance.new("TextButton")
ManualModeBtn.Size = UDim2.new(1, 0, 0, 24)
ManualModeBtn.BackgroundTransparency = 1
ManualModeBtn.Text = "Manual"
ManualModeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ManualModeBtn.TextSize = 12
ManualModeBtn.Font = Enum.Font.Gotham
ManualModeBtn.ZIndex = 101
ManualModeBtn.Parent = ModeMenu
​local ModeMenuOpen = false
local ModeMenuTween = nil
​local function ToggleModeMenu()
if ModeMenuTween then
ModeMenuTween:Cancel()
ModeMenuTween = nil
end
​local absPos = ModeDropdownBtn.AbsolutePosition
local absSize = ModeDropdownBtn.AbsoluteSize
​ModeMenu.Position = UDim2.new(0, absPos.X, 0, absPos.Y + absSize.Y + 2)
​if ModeMenuOpen then
ModeMenuOpen = false
ModeMenuTween = TweenService:Create(ModeMenu, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Size = UDim2.new(0, 120, 0, 0)
})
ModeMenuTween:Play()
ModeMenuTween.Completed:Connect(function()
if not ModeMenuOpen then
ModeMenu.Visible = false
end
end)
else
ModeMenuOpen = true
ModeMenu.Visible = true
ModeMenu.Size = UDim2.new(0, 120, 0, 0)
ModeMenuTween = TweenService:Create(ModeMenu, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Size = UDim2.new(0, 120, 0, 56)
})
ModeMenuTween:Play()
end
end
​ModeDropdownBtn.MouseButton1Click:Connect(function()
ToggleModeMenu()
end)
​AutoModeBtn.MouseButton1Click:Connect(function()
getgenv().AutoKillMode = "Auto"
ModeDropdownBtn.Text = "Auto v"
if ModeMenuOpen then
ToggleModeMenu()
end
end)
​ManualModeBtn.MouseButton1Click:Connect(function()
getgenv().AutoKillMode = "Manual"
ModeDropdownBtn.Text = "Manual v"
if ModeMenuOpen then
ToggleModeMenu()
end
end)
​UserInputService.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if ModeMenuOpen and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
local mousePos = UserInputService:GetMouseLocation()
local menuPos = ModeMenu.AbsolutePosition
local menuSize = ModeMenu.AbsoluteSize
local btnPos = ModeDropdownBtn.AbsolutePosition
local btnSize = ModeDropdownBtn.AbsoluteSize
​local insideMenu = mousePos.X >= menuPos.X and mousePos.X <= menuPos.X + menuSize.X and mousePos.Y >= menuPos.Y and mousePos.Y <= menuPos.Y + menuSize.Y
local insideBtn = mousePos.X >= btnPos.X and mousePos.X <= btnPos.X + btnSize.X and mousePos.Y >= btnPos.Y and mousePos.Y <= btnPos.Y + btnSize.Y
​if not insideMenu and not insideBtn then
ToggleModeMenu()
end
end
end)
​-- STREAMING_CHUNK:Binding sidebar tab navigation events...
local FPSTabBtn = Instance.new("TextButton")
FPSTabBtn.Name = "FPSTabBtn"
FPSTabBtn.Size = UDim2.new(1, 0, 0, 32)
FPSTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
FPSTabBtn.Text = "FPS"
FPSTabBtn.TextColor3 = Color3.fromRGB(255, 0, 40)
FPSTabBtn.TextSize = 13
FPSTabBtn.Font = Enum.Font.GothamBold
FPSTabBtn.BorderSizePixel = 0
FPSTabBtn.ZIndex = 12
FPSTabBtn.Parent = Sidebar
​local UICornerFPSTab = Instance.new("UICorner")
UICornerFPSTab.CornerRadius = UDim.new(0, 5)
UICornerFPSTab.Parent = FPSTabBtn
​local AutoTabBtn = Instance.new("TextButton")
AutoTabBtn.Name = "AutoTabBtn"
AutoTabBtn.Size = UDim2.new(1, 0, 0, 32)
AutoTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
AutoTabBtn.Text = "Auto"
AutoTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
AutoTabBtn.TextSize = 13
AutoTabBtn.Font = Enum.Font.GothamBold
AutoTabBtn.BorderSizePixel = 0
AutoTabBtn.ZIndex = 12
AutoTabBtn.Parent = Sidebar
​local UICornerAutoTab = Instance.new("UICorner")
UICornerAutoTab.CornerRadius = UDim.new(0, 5)
UICornerAutoTab.Parent = AutoTabBtn
​local AimTabBtn = Instance.new("TextButton")
AimTabBtn.Name = "AimTabBtn"
AimTabBtn.Size = UDim2.new(1, 0, 0, 32)
AimTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
AimTabBtn.Text = "Aim"
AimTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
AimTabBtn.TextSize = 13
AimTabBtn.Font = Enum.Font.GothamBold
AimTabBtn.BorderSizePixel = 0
AimTabBtn.ZIndex = 12
AimTabBtn.Parent = Sidebar
​local UICornerAimTab = Instance.new("UICorner")
UICornerAimTab.CornerRadius = UDim.new(0, 5)
UICornerAimTab.Parent = AimTabBtn
​local RankedTabBtn = Instance.new("TextButton")
RankedTabBtn.Name = "RankedTabBtn"
RankedTabBtn.Size = UDim2.new(1, 0, 0, 32)
RankedTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
RankedTabBtn.Text = "Ranked"
RankedTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
RankedTabBtn.TextSize = 13
RankedTabBtn.Font = Enum.Font.GothamBold
RankedTabBtn.BorderSizePixel = 0
RankedTabBtn.ZIndex = 12
RankedTabBtn.Parent = Sidebar
​local UICornerRankedTab = Instance.new("UICorner")
UICornerRankedTab.CornerRadius = UDim.new(0, 5)
UICornerRankedTab.Parent = RankedTabBtn
​local ThemesTabBtn = Instance.new("TextButton")
ThemesTabBtn.Name = "ThemesTabBtn"
ThemesTabBtn.Size = UDim2.new(1, 0, 0, 32)
ThemesTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
ThemesTabBtn.Text = "Themes"
ThemesTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
ThemesTabBtn.TextSize = 13
ThemesTabBtn.Font = Enum.Font.GothamBold
ThemesTabBtn.BorderSizePixel = 0
ThemesTabBtn.ZIndex = 12
ThemesTabBtn.Parent = Sidebar
​local UICornerThemesTab = Instance.new("UICorner")
UICornerThemesTab.CornerRadius = UDim.new(0, 5)
UICornerThemesTab.Parent = ThemesTabBtn
​local MiscTabBtn = Instance.new("TextButton")
MiscTabBtn.Name = "MiscTabBtn"
MiscTabBtn.Size = UDim2.new(1, 0, 0, 32)
MiscTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
MiscTabBtn.Text = "Misc"
MiscTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
MiscTabBtn.TextSize = 13
MiscTabBtn.Font = Enum.Font.GothamBold
MiscTabBtn.BorderSizePixel = 0
MiscTabBtn.ZIndex = 12
MiscTabBtn.Parent = Sidebar
​local UICornerMiscTab = Instance.new("UICorner")
UICornerMiscTab.CornerRadius = UDim.new(0, 5)
UICornerMiscTab.Parent = MiscTabBtn
​FPSTabBtn.MouseButton1Click:Connect(function()
if ModeMenuOpen then ToggleModeMenu() end
if ThemesMenuOpen then ToggleThemesMenu() end
FPSTab.Visible = true
AutoTab.Visible = false
AimTab.Visible = false
RankedTab.Visible = false
ThemesTab.Visible = false
MiscTab.Visible = false
FPSTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
FPSTabBtn.TextColor3 = Color3.fromRGB(255, 0, 40)
AutoTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
AutoTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
AimTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
AimTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
RankedTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
RankedTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
ThemesTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
ThemesTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
MiscTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
MiscTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)
​AutoTabBtn.MouseButton1Click:Connect(function()
if ModeMenuOpen then ToggleModeMenu() end
if ThemesMenuOpen then ToggleThemesMenu() end
FPSTab.Visible = false
AutoTab.Visible = true
AimTab.Visible = false
RankedTab.Visible = false
ThemesTab.Visible = false
MiscTab.Visible = false
AutoTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
AutoTabBtn.TextColor3 = Color3.fromRGB(255, 0, 40)
FPSTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
FPSTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
AimTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
AimTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
RankedTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
RankedTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
ThemesTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
ThemesTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
MiscTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
MiscTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)
​AimTabBtn.MouseButton1Click:Connect(function()
if ModeMenuOpen then ToggleModeMenu() end
if ThemesMenuOpen then ToggleThemesMenu() end
FPSTab.Visible = false
AutoTab.Visible = false
AimTab.Visible = true
RankedTab.Visible = false
ThemesTab.Visible = false
MiscTab.Visible = false
AimTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
AimTabBtn.TextColor3 = Color3.fromRGB(255, 0, 40)
FPSTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
FPSTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
AutoTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
AutoTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
RankedTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
RankedTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
ThemesTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
ThemesTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
MiscTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
MiscTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)
​RankedTabBtn.MouseButton1Click:Connect(function()
if ModeMenuOpen then ToggleModeMenu() end
if ThemesMenuOpen then ToggleThemesMenu() end
FPSTab.Visible = false
AutoTab.Visible = false
AimTab.Visible = false
RankedTab.Visible = true
ThemesTab.Visible = false
MiscTab.Visible = false
RankedTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
RankedTabBtn.TextColor3 = Color3.fromRGB(255, 0, 40)
FPSTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
FPSTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
AutoTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
AutoTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
AimTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
AimTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
ThemesTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
ThemesTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
MiscTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
MiscTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)
​ThemesTabBtn.MouseButton1Click:Connect(function()
if ModeMenuOpen then ToggleModeMenu() end
if ThemesMenuOpen then ToggleThemesMenu() end
FPSTab.Visible = false
AutoTab.Visible = false
AimTab.Visible = false
RankedTab.Visible = false
ThemesTab.Visible = true
MiscTab.Visible = false
ThemesTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
ThemesTabBtn.TextColor3 = Color3.fromRGB(255, 0, 40)
FPSTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
FPSTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
AutoTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
AutoTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
AimTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
AimTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
RankedTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
RankedTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
MiscTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
MiscTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)
​MiscTabBtn.MouseButton1Click:Connect(function()
if ModeMenuOpen then ToggleModeMenu() end
if ThemesMenuOpen then ToggleThemesMenu() end
FPSTab.Visible = false
AutoTab.Visible = false
AimTab.Visible = false
RankedTab.Visible = false
ThemesTab.Visible = false
MiscTab.Visible = true
MiscTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
MiscTabBtn.TextColor3 = Color3.fromRGB(255, 0, 40)
FPSTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
FPSTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
AutoTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
AutoTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
AimTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
AimTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
RankedTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
RankedTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
ThemesTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
ThemesTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)
​-- STREAMING_CHUNK:Integrating FPS booster and performance scripts...
BoostFPSBtn.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/stormzdev/the-strongest-battlegrounds/refs/heads/main/fps-boost.lua"))()
end)
​-- STREAMING_CHUNK:Configuring Mambo anti-lag engine and FFlags...
AntiLagBtn.MouseButton1Click:Connect(function()
if _G.MAMBO_ANTILAG_LOCKED then return end
local ALLOWED_IDS = {10449761463, 131048399685555}
local valid = false
for _, id in ipairs(ALLOWED_IDS) do
if game.PlaceId == id then valid = true; break end
end
if not valid then return end
​if not _G.MAMBO_ANTILAG_LOADED then
_G.MAMBO_ANTILAG_LOADED = true
local clk = os.clock
local mfloor = math.floor
local mmax = math.max
​local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
​Lighting.GlobalShadows = false
Lighting.EnvironmentDiffuseScale = 0
Lighting.EnvironmentSpecularScale = 0
Lighting.Brightness = 1.5
Lighting.ClockTime = 14
Lighting.FogEnd = 100000
Lighting.OutdoorAmbient = Color3.new(0.8, 0.8, 0.8)
Lighting.Ambient = Color3.new(0.6, 0.6, 0.6)
​for _, name in ipairs({"Atmosphere", "Clouds", "Sky"}) do
local obj = Lighting:FindFirstChild(name) or Workspace:FindFirstChild(name)
if obj then pcall(function() obj:Destroy() end) end
end
​for _, v in ipairs(Workspace:GetChildren()) do
if v.Name:lower():find("cloud") then pcall(function() v:Destroy() end) end
end
​local WhitelistParts = {
Ring = true, Debris2g = true, Projectile = true, TornadoMain = true,
Spiral = true, MiddleSpin = true, MiddleSpinEmit = true
}
local WhitelistModels = {
Flash = true, Slash_Teleport = true, ShurikenProj = true, TParticles2 = true,
Proj = true, NadoSmoke = true, SmokeRing = true, Adjusted = true,
General = true, Up = true, Up2 = true, Go2 = true, Dotted = true,
Clone_Rig = true, Afterimage_Clone = true, Dragon = true, KingCrab = true,
Model = true, preload = true, Trashcan = true, Weboom = true
}
local EffectClasses = {
ParticleEmitter = true, Trail = true, Beam = true,
Smoke = true, Fire = true, PointLight = true,
SpotLight = true, SurfaceLight = true
}
local CRITICAL_SKILLS = {
["Sky Ripping Fist"] = true,
SkyRippingFist = true,
["Fourfold Flashstrike"] = true,
FourfoldFlashstrike = true
}
​local criticalMode = false
local criticalEnd = 0
local queue = {}
local qHead = 1
local qTail = 0
local QueueSet = {}
local currentFps = 60
local V4Size = Vector3.new(4, 4, 4)
local overloadFactor = 1.0
local lastMode = 0
local modeChangeCooldown = 0
​local function updateOverloadMode()
local now = clk()
if now - modeChangeCooldown < 1.5 then return end
local newMode
if currentFps >= 45 then
newMode = 0
elseif currentFps >= 25 then
newMode = 1
else
newMode = 2
end
if newMode ~= lastMode then
lastMode = newMode
modeChangeCooldown = now
if newMode == 0 then
overloadFactor = 1.0
elseif newMode == 1 then
overloadFactor = 0.75
else
overloadFactor = 0.40
end
end
end
​local function activateCriticalMode()
criticalMode = true
criticalEnd = clk() + 6
end
​local function checkForCriticalSkill(obj)
if not obj then return end
if CRITICAL_SKILLS[obj.Name] then
activateCriticalMode()
return
end
local kids = obj:GetChildren()
for i = 1, #kids do
if CRITICAL_SKILLS[kids[i].Name] then
activateCriticalMode()
return
end
end
end
​Workspace.ChildAdded:Connect(checkForCriticalSkill)
Workspace.DescendantAdded:Connect(checkForCriticalSkill)
​for _, obj in ipairs(Workspace:GetDescendants()) do
if CRITICAL_SKILLS[obj.Name] then
activateCriticalMode()
break
end
end
​local function InstantDisable(child)
if not child then return end
local cClass = child.ClassName
if EffectClasses[cClass] then
pcall(function() child.Enabled = false end)
elseif (cClass == "Part" or cClass == "MeshPart") and not WhitelistParts[child.Name] and not (child.Name == "Part" and child.Size == V4Size) then
pcall(function()
child.Transparency = 1
child.CastShadow = false
child.CanCollide = false
end)
end
end
​local function QueueGarbage(child)
if not child or QueueSet[child] then return end
QueueSet[child] = true
InstantDisable(child)
local kids = child:GetChildren()
for i = 1, #kids do InstantDisable(kids[i]) end
qTail = qTail + 1
queue[qTail] = child
end
​RunService.Heartbeat:Connect(function()
if clk() >= criticalEnd then criticalMode = false end
updateOverloadMode()
if qHead > qTail then qHead = 1; qTail = 0; return end
if criticalMode then return end
local startTime = clk()
local baseLimit = 0.003375
local baseCap = 20
if currentFps >= 55 then
baseLimit = 0.003375
baseCap = 20
elseif currentFps >= 40 then
baseLimit = 0.00253125
baseCap = 16
elseif currentFps >= 25 then
baseLimit = 0.0016875
baseCap = 12
else
baseLimit = 0.00084375
baseCap = 7
end
local timeLimit = baseLimit * overloadFactor
local processedCap = mmax(3, mfloor(baseCap * overloadFactor))
local processed = 0
while qHead <= qTail do
local child = queue[qHead]
queue[qHead] = nil
qHead = qHead + 1
if child then
QueueSet[child] = nil
if child.Parent then
local cClass = child.ClassName
if cClass == "Part" or cClass == "MeshPart" then
if not WhitelistParts[child.Name] and not (child.Name == "Part" and child.Size == V4Size) then
pcall(function() child:Destroy() end)
end
elseif cClass == "Model" then
if not WhitelistModels[child.Name] then
pcall(function() child:Destroy() end)
end
elseif EffectClasses[cClass] then
pcall(function() child:Destroy() end)
end
end
end
processed = processed + 1
if clk() - startTime >= timeLimit or processed >= processedCap then break end
end
end)
​local Thing = Workspace:FindFirstChild("Thrown")
if not Thing then
Thing = Instance.new("Folder")
Thing.Name = "Thrown"
Thing.Parent = Workspace
end
for _, child in ipairs(Thing:GetChildren()) do QueueGarbage(child) end
Thing.ChildAdded:Connect(QueueGarbage)
​task.spawn(function()
while true do
task.wait(10)
if currentFps > 40 and not criticalMode then
pcall(function()
local items = Workspace:GetDescendants()
local count = 0
for i = 1, #items do
local v = items[i]
if v and EffectClasses[v.ClassName] then
pcall(function() v.Enabled = false; v:Destroy() end)
end
count = count + 1
if count % 300 == 0 then RunService.Heartbeat:Wait() end
end
end)
end
end
end)
​local fpsCounter = 0
local lastFpsUpdate = clk()
​RunService.RenderStepped:Connect(function()
fpsCounter = fpsCounter + 1
local now = clk()
if now - lastFpsUpdate >= 1 then
currentFps = fpsCounter
fpsCounter = 0
lastFpsUpdate = now
end
end)
end
​if not _G.MAMBO_FFLAGS_APPLIED then
local flagtables = {
["DFIntTaskSchedulerTargetFps"] = "9999",
["FIntTaskSchedulerAutoThreadLimit"] = "6",
["FIntTaskSchedulerAsyncTasksMinimumThreadCount"] = "2",
["FIntTaskSchedulerMaxNumOfJobs"] = "86",
["FIntTaskSchedulerThreadMin"] = "1",
["DFFlagBrowserTrackerIdTelemetryEnabled"] = "False",
["DFFlagPreloadAsyncSupportTexturePack"] = "True",
["DFFlagTextureQualityOverrideEnabled"] = "True",
["DFFlagVideoCaptureServiceEnabled"] = "False",
["DFFlagSampleAndRefreshRakPing"] = "True",
["DFFlagRakNetUseSlidingWindow4"] = "True",
["DFFlagCoreScriptTelemetry2"] = "False",
["DFFlagEnableSoundPreloading"] = "True",
["DFFlagOptimizePartsInPart"] = "True",
["DFFlagDisableDPIScale"] = "True",
["DFFlagDebugPerfMode"] = "True",
["DFIntRaknetBandwidthInfluxHundredthsPercentageV2"] = "10000",
["DFIntRakNetClockDriftAdjustmentPerPingMillisecond"] = "100",
["DFIntRaknetBandwidthPingSendEveryXSeconds"] = "1",
["DFIntRakNetNakResendDelayRttPercent"] = "50",
["DFIntRakNetNakResendDelayMsMax"] = "100",
["DFIntRakNetNakResendDelayMs"] = "10",
["DFIntRakNetResendRttMultiple"] = "1",
["DFIntRakNetSelectTimeoutMs"] = "1",
["DFIntRakNetLoopMs"] = "1",
["DFIntRakNetMinAckGrowthPercent"] = "0",
["DFIntRakNetMtuValue1InBytes"] = "1280",
["DFIntRakNetMtuValue2InBytes"] = "1240",
["DFIntRakNetMtuValue3InBytes"] = "1200",
["DFIntConnectionMTUSize"] = "1260",
["DFIntMaxReceiveToDeserializeLatencyMilliseconds"] = "15",
["DFIntNetworkInDeserializeLimitGameplayMsClient"] = "6",
["DFIntNetworkInProcessLimitGameplayMsClient"] = "6",
["DFIntClientPacketHealthyAllocationPercent"] = "20",
["DFIntClientPacketMaxFrameMicroseconds"] = "200",
["DFIntClientPacketExcessMicroseconds"] = "1000",
["DFIntClientPacketMinMicroseconds"] = "1",
["DFIntClientPacketMaxDelayMs"] = "11",
["DFIntMaxWaitTimeBeforeForcePacketProcessMS"] = "1.5",
["DFIntMaxProcessPacketsStepsPerCyclic"] = "5000",
["DFIntMaxProcessPacketsStepsAccumulated"] = "0",
["DFIntMaxProcessPacketsJobScaling"] = "10000",
["DFIntLargePacketQueueSizeCutoffMB"] = "1000",
["DFIntDataSenderRate"] = "1000",
["DFIntDataSenderMaxBandwidthBps"] = "2147483647",
["DFIntDataSenderMaxJoinBandwidthBps"] = "2147483647",
["DFIntS2PhysicsSenderRate"] = "1000",
["DFIntS2NumPhysicsPacketsPerStep"] = "100",
["DFIntPhysicsSenderMaxBandwidthBps"] = "2147483647",
["DFIntPhysicsSenderMaxBandwidthBpsScaling"] = "1000",
["FIntPGSAngularDampingPermilPersecond"] = "0",
["DFFlagPhysicsSkipNonRealTimeHumanoidForceCalc2"] = "True",
["DFIntSignalRHubConnectionHeartbeatTimerRateMs"] = "1000",
["DFIntSignalRHubConnectionBaseRetryTimeMs"] = "100",
["DFIntSignalRCoreKeepAlivePingPeriodMs"] = "250",
["DFIntSignalRCoreServerTimeoutMs"] = "11100",
["DFIntSignalRCoreTimerMs"] = "750",
["DFIntSignalRCoreRpcQueueSize"] = "256",
["DFIntAnimationLodFacsVisibilityDenominator"] = "0",
["DFIntAnimationLodFacsDistanceMin"] = "0",
["DFIntAnimationLodFacsDistanceMax"] = "0",
["DFIntDebugFRMQualityLevelOverride"] = "1",
["DFIntDebugDynamicRenderKiloPixels"] = "1100",
["DFIntDebugRestrictGCDistance"] = "1",
["DFIntWaitOnUpdateNetworkLoopEndedMS"] = "100",
["DFIntWaitOnRecvFromLoopEndedMS"] = "100",
["FIntRenderMaxShadowAtlasUsageBeforeDownscale"] = "80",
["FIntRenderShadowMapDepthCacheMemLimit"] = "192",
["FIntUITextureMaxRenderTextureSize"] = "1024",
["FIntRakNetResendBufferArrayLength"] = "128",
["FIntTerrainOTAMaxTextureSize"] = "1024",
["FIntOcclusionWorkerThreadCount"] = "5",
["FIntDefaultMeshCacheSizeMB"] = "256",
["FIntRobloxGuiBlurIntensity"] = "0",
["FIntTerrainArraySliceSize"] = "0",
["FIntDebugForceMSAASamples"] = "1",
["FIntRenderShadowmapBias"] = "0",
["FIntFRMMaxGrassDistance"] = "0",
["FIntFRMMinGrassDistance"] = "0",
["FIntGrassMovementReducedMotionFactor"] = "0",
["FIntDebugTextureManagerSkipMips"] = "7",
["FIntPerformanceTelemetryQueueProcessLimit"] = "0",
["FIntTelemetryProfilerFrequency"] = "0",
["FIntRenderLocalLightFadeInMs"] = "0",
["FIntReportDeviceInfoRollout"] = "0",
["FFlagRenderAllocateShadowMapResourcesOnDemand"] = "True",
["FFlagSpecifyNetworkReplicatorScopeForItems"] = "True",
["FFlagTaskSchedulerLimitTargetFpsTo2402"] = "False",
["FFlagHandleAltEnterFullscreenManually"] = "False",
["FFlagGameBasicSettingsFramerateCap5"] = "False",
["FFlagSpecifyNetworkReplicatorScope"] = "True",
["FFlagSendRenderFidelityTelemetry2"] = "False",
["FFlagRenderGpuTextureCompressor"] = "True",
["FFlagBaseThreadPoolUseRuntime2"] = "True",
["FFlagCacheTextBoundsInGuiText"] = "True",
["FFlagEnableTelemetryService1"] = "False",
["FFlagDebugGraphicsPreferD3D11"] = "True",
["FFlagPerfDataOnTelemetryV2"] = "False",
["FFlagOpenTelemetryEnabled2"] = "False",
["FFlagRbxStorageUseMemCache"] = "True",
["FFlagDebugForceGenerateHSR"] = "True",
["FFlagRenderInitShadowmaps"] = "True",
["FFlagFastGPULightCulling3"] = "True",
["FFlagDebugSkyGray"] = "True",
["FFlagDebugRenderingSetDeterministic"] = "True",
["FLogNetwork"] = "7"
}
​local function formatFlag(z)
z = z:gsub("^DFInt", "")
z = z:gsub("^DFFlag", "")
z = z:gsub("^FFlag", "")
z = z:gsub("^FInt", "")
z = z:gsub("FString", "")
z = z:gsub("FLog", "")
return z
end
​local function applyCombatFFlags()
if not (setfflag and getfflag) then return end
task.spawn(function()
for k, v in pairs(flagtables) do
for _ = 1, 3 do RunService.RenderStepped:Wait() end
pcall(function()
local formatted = formatFlag(k)
if getfflag(formatted) then
setfflag(formatted, v)
elseif getfflag(k) then
setfflag(k, v)
end
end)
end
_G.MAMBO_FFLAGS_APPLIED = true
_G.MAMBO_ANTILAG_LOCKED = true
end)
end
applyCombatFFlags()
end
end)
​-- STREAMING_CHUNK:Implementing automated combat and targeting functions...
getgenv().AutoKillNearestPlr = false
getgenv().AutoKillLowestHealthPlr = false
getgenv().AutoKillTargetPlr = false
getgenv().AutoKillMode = "Auto"
getgenv().TargetPlayerName = ""
getgenv().TeleportDistance = 5
getgenv().LowestHealthThreshold = 35
​local function PerformAttack(targetRoot)
if getgenv().AutoKillMode == "Auto" then
local targetModel = workspace.Live:FindFirstChild(targetRoot.Parent.Name)
if targetModel and not targetModel:FindFirstChild("RagdollSim") and not targetModel:FindFirstChild("AbsoluteImmortal") then
task.spawn(function()
local args = {[1] = {["Goal"] = "LeftClick", ["Mobile"] = true}}
game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
local args2 = {[1] = {["Goal"] = "LeftClickRelease", ["Mobile"] = true}}
game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args2))
end)
for _, x in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if x:IsA("Tool") and x.Name ~= "Prey's Peril" and x.Name ~= "Split Second Counter" then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(x)
x:Activate()
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
end
end
end
end
end
​-- STREAMING_CHUNK:Defining nearest and lowest health auto-kill logic...
local function StartAutoKillNearest()
local LPlayer = game.Players.LocalPlayer
local CRoot
local function UpdateCRoot()
local LChar = LPlayer.Character
if LChar then
CRoot = LChar:FindFirstChild("HumanoidRootPart")
if not CRoot then
LChar.ChildAdded:Wait()
CRoot = LChar:WaitForChild("HumanoidRootPart")
end
end
end
​local function isPlayer(X)
return game.Players:GetPlayerFromCharacter(X) ~= nil
end
​local function FindNearest()
local Dist = math.huge
local NearestPlr = nil
for _, v in pairs(game.Workspace.Live:GetChildren()) do
if isPlayer(v) then
local Humanoid = v:FindFirstChildOfClass("Humanoid")
local HumanoidRoot = v:FindFirstChild("HumanoidRootPart")
if Humanoid and HumanoidRoot and v ~= LPlayer.Character then
if Humanoid.Health > 0 then
local Mag = (CRoot.Position - HumanoidRoot.Position).Magnitude
if Mag < Dist then
Dist = Mag
NearestPlr = HumanoidRoot
end
end
end
end
end
return NearestPlr
end
​task.spawn(function()
while getgenv().AutoKillNearestPlr do
if not IsDodging then
pcall(function()
UpdateCRoot()
if CRoot then
local Found = FindNearest()
if Found then
LPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Found.Position - Vector3.new(0, Found.Size.Y/2, 0) - Found.CFrame.LookVector * getgenv().TeleportDistance + Vector3.new(0, -6, 0), Found.Position - Vector3.new(0, Found.Size.Y/2, 0)))
PerformAttack(Found)
end
end
end)
end
task.wait(0.015)
end
end)
​LPlayer.CharacterAdded:Connect(function()
task.wait(1.5)
UpdateCRoot()
end)
end
​local function StartAutoKillLowest()
local LPlayer = game.Players.LocalPlayer
local CRoot
local function UpdateCRoot()
local LChar = LPlayer.Character
if LChar then
CRoot = LChar:FindFirstChild("HumanoidRootPart")
if not CRoot then
LChar.ChildAdded:Wait()
CRoot = LChar:WaitForChild("HumanoidRootPart")
end
end
end
​local function isPlayer(X)
return game.Players:GetPlayerFromCharacter(X) ~= nil
end
​local function FindLowestHealth()
local NearestPlr = nil
local threshold = getgenv().LowestHealthThreshold or 35
for _, v in pairs(game.Workspace.Live:GetChildren()) do
if isPlayer(v) then
local Humanoid = v:FindFirstChildOfClass("Humanoid")
local HumanoidRoot = v:FindFirstChild("HumanoidRootPart")
if Humanoid and HumanoidRoot and v ~= LPlayer.Character then
if Humanoid.Health > 0 and Humanoid.Health <= threshold then
NearestPlr = HumanoidRoot
end
end
end
end
return NearestPlr
end
​task.spawn(function()
while getgenv().AutoKillLowestHealthPlr do
if not IsDodging then
pcall(function()
UpdateCRoot()
if CRoot then
local Found = FindLowestHealth()
if Found then
LPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Found.Position - Vector3.new(0, Found.Size.Y/2, 0) - Found.CFrame.LookVector * getgenv().TeleportDistance + Vector3.new(0, -6, 0), Found.Position - Vector3.new(0, Found.Size.Y/2, 0)))
PerformAttack(Found)
else
if LPlayer.Character and LPlayer.Character:FindFirstChild("HumanoidRootPart") then
LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(150, 705, 30)
end
end
end
end)
end
task.wait(0.015)
end
end)
​LPlayer.CharacterAdded:Connect(function()
task.wait(1.5)
UpdateCRoot()
end)
end
​-- STREAMING_CHUNK:Defining player target auto-kill logic...
local function StartAutoKillTarget()
local LPlayer = game.Players.LocalPlayer
local CRoot
local function UpdateCRoot()
local LChar = LPlayer.Character
if LChar then
CRoot = LChar:FindFirstChild("HumanoidRootPart")
if not CRoot then
LChar.ChildAdded:Wait()
CRoot = LChar:WaitForChild("HumanoidRootPart")
end
end
end
​local function FindTarget()
local query = string.lower(getgenv().TargetPlayerName or "")
if query == "" then return nil end
for _, v in pairs(game.Workspace.Live:GetChildren()) do
local plr = game.Players:GetPlayerFromCharacter(v)
if plr and v ~= LPlayer.Character then
local nameMatch = string.lower(plr.Name):find(query, 1, true)
local displayMatch = string.lower(plr.DisplayName):find(query, 1, true)
if nameMatch or displayMatch then
local Humanoid = v:FindFirstChildOfClass("Humanoid")
local HumanoidRoot = v:FindFirstChild("HumanoidRootPart")
if Humanoid and HumanoidRoot and Humanoid.Health > 0 then
return HumanoidRoot
end
end
end
end
return nil
end
​task.spawn(function()
while getgenv().AutoKillTargetPlr do
if not IsDodging then
pcall(function()
UpdateCRoot()
if CRoot then
local Found = FindTarget()
if Found then
LPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Found.Position - Vector3.new(0, Found.Size.Y/2, 0) - Found.CFrame.LookVector * getgenv().TeleportDistance + Vector3.new(0, -6, 0), Found.Position - Vector3.new(0, Found.Size.Y/2, 0)))
PerformAttack(Found)
end
end
end)
end
task.wait(0.015)
end
end)
​LPlayer.CharacterAdded:Connect(function()
task.wait(1.5)
UpdateCRoot()
end)
end
​AutoNearestToggle.SetCallback(function(state)
getgenv().AutoKillNearestPlr = state
if state then
StartAutoKillNearest()
end
end)
​AutoLowestToggle.SetCallback(function(state)
getgenv().AutoKillLowestHealthPlr = state
local val = tonumber(TextBox.Text)
if val and val >= 1 and val <= 99 then
getgenv().LowestHealthThreshold = val
else
getgenv().LowestHealthThreshold = 35
end
if state then
StartAutoKillLowest()
end
end)
​AutoTargetToggle.SetCallback(function(state)
getgenv().AutoKillTargetPlr = state
getgenv().TargetPlayerName = TargetTextBoxAuto.Text
if state then
StartAutoKillTarget()
end
end)
​TextBox.FocusLost:Connect(function()
local val = tonumber(TextBox.Text)
if val and val >= 1 and val <= 99 then
getgenv().LowestHealthThreshold = val
else
TextBox.Text = "35"
getgenv().LowestHealthThreshold = 35
end
end)
​-- STREAMING_CHUNK:Implementing ranked farm automation logic...
getgenv().RankedFarmEnabled = false
​local function isEnemy(player, character)
if not player or not character then return false end
local playerCount = #Players:GetPlayers()
if playerCount == 2 then
return true
end
if character:FindFirstChild("TeammateHighlight") or character:FindFirstChild("AllyHighlight") or (character:FindFirstChildWhichIsA("Highlight") and character:FindFirstChildWhichIsA("Highlight").FillColor == Color3.fromRGB(0, 255, 0)) then
return false
end
if player:GetAttribute("Team") == LocalPlayer:GetAttribute("Team") and player:GetAttribute("Team") ~= nil then
return false
end
if character:GetAttribute("IsTeammate") == true or character:GetAttribute("Ally") == true then
return false
end
return true
end
​local function StartRankedFarm()
local LPlayer = game.Players.LocalPlayer
local CRoot
local function UpdateCRoot()
local LChar = LPlayer.Character
if LChar then
CRoot = LChar:FindFirstChild("HumanoidRootPart")
if not CRoot then
LChar.ChildAdded:Wait()
CRoot = LChar:WaitForChild("HumanoidRootPart")
end
end
end
​local function FindRankedTarget()
local Dist = math.huge
local NearestPlr = nil
for _, v in pairs(game.Workspace.Live:GetChildren()) do
local plr = game.Players:GetPlayerFromCharacter(v)
if plr and v ~= LPlayer.Character then
local Humanoid = v:FindFirstChildOfClass("Humanoid")
local HumanoidRoot = v:FindFirstChild("HumanoidRootPart")
if Humanoid and HumanoidRoot and Humanoid.Health > 0 then
if isEnemy(plr, v) then
local Mag = (CRoot.Position - HumanoidRoot.Position).Magnitude
if Mag < Dist then
Dist = Mag
NearestPlr = HumanoidRoot
end
end
end
end
end
return NearestPlr
end
​task.spawn(function()
while getgenv().RankedFarmEnabled do
if not IsDodging then
pcall(function()
UpdateCRoot()
if CRoot then
local Found = FindRankedTarget()
if Found then
LPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Found.Position - Vector3.new(0, Found.Size.Y/2, 0) - Found.CFrame.LookVector * getgenv().TeleportDistance + Vector3.new(0, -6, 0), Found.Position - Vector3.new(0, Found.Size.Y/2, 0)))
PerformAttack(Found)
end
end
end)
end
task.wait(0.015)
end
end)
​LPlayer.CharacterAdded:Connect(function()
task.wait(1.5)
UpdateCRoot()
end)
end
​RankedFarmToggle.SetCallback(function(state)
getgenv().RankedFarmEnabled = state
if state then
StartRankedFarm()
end
end)
​-- STREAMING_CHUNK:Configuring camera lock and aimbot systems...
local CamlockState = false
local Prediction = 0.16
local Locked = true
getgenv().Key = "c"
​local function FindNearestEnemy()
local ClosestDistance, ClosestPlayer = math.huge, nil
local CenterPosition = Vector2.new(
game:GetService("GuiService"):GetScreenResolution().X / 2,
game:GetService("GuiService"):GetScreenResolution().Y / 2
)
for _, Player in ipairs(Players:GetPlayers()) do
if Player ~= LocalPlayer then
local Character = Player.Character
if Character and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChildOfClass("Humanoid") and Character.Humanoid.Health > 0 then
local Position, IsVisibleOnViewport = workspace.CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart.Position)
if IsVisibleOnViewport then
local Distance = (CenterPosition - Vector2.new(Position.X, Position.Y)).Magnitude
if Distance < ClosestDistance then
ClosestPlayer = Character.HumanoidRootPart
ClosestDistance = Distance
end
end
end
end
end
return ClosestPlayer
end
​local enemy = nil
​RunService.Heartbeat:Connect(function()
if CamlockState == true and enemy then
local camera = workspace.CurrentCamera
camera.CFrame = CFrame.new(camera.CFrame.p, enemy.Position + enemy.Velocity * Prediction)
end
end)
​local Mouse = LocalPlayer:GetMouse()
Mouse.KeyDown:Connect(function(k)
if k == getgenv().Key then
Locked = not Locked
if Locked then
enemy = FindNearestEnemy()
CamlockState = true
else
if enemy ~= nil then
enemy = nil
CamlockState = false
end
end
end
end)
​local function SetAimBot(state)
if state then
CamlockState = true
enemy = FindNearestEnemy()
else
CamlockState = false
enemy = nil
end
end
​AimBotToggle.SetCallback(function(state)
SetAimBot(state)
end)
​-- STREAMING_CHUNK:Implementing anti-ragdoll and anti-stun handlers...
local AntiRagdollEnabled = false
local AntiStunEnabled = false
local connections = {}
​local function cleanup()
for _, conn in pairs(connections) do
if typeof(conn) == "RBXScriptConnection" then
conn:Disconnect()
end
end
table.clear(connections)
end
​local function applyAntiRagdoll(character)
if not character then return end
local humanoid = character:FindFirstChildOfClass("Humanoid")
if not humanoid then return end
​local conn1 = RunService.Heartbeat:Connect(function()
if not AntiRagdollEnabled then return end
if humanoid:GetState() == Enum.HumanoidStateType.Physics or
humanoid:GetState() == Enum.HumanoidStateType.Ragdoll or
humanoid:GetState() == Enum.HumanoidStateType.FallingDown then
humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
humanoid:ChangeState(Enum.HumanoidStateType.Running)
end
end)
table.insert(connections, conn1)
​local conn2 = character.DescendantAdded:Connect(function(desc)
if not AntiRagdollEnabled then return end
if desc:IsA("BallSocketConstraint") or desc:IsA("HingeConstraint") or desc.Name:lower():find("ragdoll") then
task.defer(function()
if desc and desc.Parent then
desc:Destroy()
end
end)
end
end)
table.insert(connections, conn2)
end
​local function applyAntiStun(character)
if not character then return end
local humanoid = character:FindFirstChildOfClass("Humanoid")
if not humanoid then return end
​local conn = RunService.Heartbeat:Connect(function()
if not AntiStunEnabled then return end
​if humanoid:GetAttribute("Stunned") then
humanoid:SetAttribute("Stunned", false)
end
if humanoid:GetAttribute("Stun") then
humanoid:SetAttribute("Stun", false)
end
if character:GetAttribute("Stunned") then
character:SetAttribute("Stunned", false)
end
​if humanoid.WalkSpeed < 8 then
humanoid.WalkSpeed = 16
end
if humanoid.JumpPower < 40 then
humanoid.JumpPower = 50
end
end)
table.insert(connections, conn)
end
​local function onCharacterAdded(character)
task.wait(0.4)
if AntiRagdollEnabled then
applyAntiRagdoll(character)
end
if AntiStunEnabled then
applyAntiStun(character)
end
end
​local function SetAntiRagdoll(state)
AntiRagdollEnabled = state
cleanup()
​local char = LocalPlayer.Character
if state and char then
applyAntiRagdoll(char)
if AntiStunEnabled then
applyAntiStun(char)
end
elseif AntiStunEnabled and char then
applyAntiStun(char)
end
end
​local function SetAntiStun(state)
AntiStunEnabled = state
cleanup()
​local char = LocalPlayer.Character
if state and char then
applyAntiStun(char)
if AntiRagdollEnabled then
applyAntiRagdoll(char)
end
elseif AntiRagdollEnabled and char then
applyAntiRagdoll(char)
end
end
​LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
​if LocalPlayer.Character then
onCharacterAdded(LocalPlayer.Character)
end
​AntiRagdollToggle.SetCallback(function(state)
SetAntiRagdoll(state)
end)
​AntiStunToggle.SetCallback(function(state)
SetAntiStun(state)
end)
​-- STREAMING_CHUNK:Finalizing camera reset utility and initialization listeners...
local function FixCamera()
local character = LocalPlayer.Character
if not character then return end
​local humanoid = character:FindFirstChildOfClass("Humanoid")
if not humanoid then return end
​local Camera = workspace.CurrentCamera
Camera.CameraType = Enum.CameraType.Custom
Camera.CameraSubject = humanoid
​LocalPlayer.CameraMode = Enum.CameraMode.Classic
LocalPlayer.CameraMaxZoomDistance = 128
LocalPlayer.CameraMinZoomDistance = 0.5
​local hrp = character:FindFirstChild("HumanoidRootPart")
if hrp then
Camera.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 5, 10), hrp.Position)
end
end
​FixCameraBtn.MouseButton1Click:Connect(function()
FixCamera()
end)