local Teams = game:GetService("Teams")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MiHubGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

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

local UICornerMain = Instance.new("UICorner")
UICornerMain.CornerRadius = UDim.new(0, 8)
UICornerMain.Parent = MainFrame

local UIStrokeGlow = Instance.new("UIStroke")
UIStrokeGlow.Thickness = 2.5
UIStrokeGlow.Color = Color3.fromRGB(255, 0, 40)
UIStrokeGlow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStrokeGlow.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
Header.BorderSizePixel = 0
Header.ZIndex = 11
Header.Parent = MainFrame

local UICornerHeader = Instance.new("UICorner")
UICornerHeader.CornerRadius = UDim.new(0, 8)
UICornerHeader.Parent = Header

local HeaderCover = Instance.new("Frame")
HeaderCover.Size = UDim2.new(1, 0, 0, 10)
HeaderCover.Position = UDim2.new(0, 0, 1, -10)
HeaderCover.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
HeaderCover.BorderSizePixel = 0
HeaderCover.ZIndex = 11
HeaderCover.Parent = Header

local Title = Instance.new("TextLabel")
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

local ControlsFrame = Instance.new("Frame")
ControlsFrame.Name = "ControlsFrame"
ControlsFrame.Size = UDim2.new(0, 70, 1, 0)
ControlsFrame.Position = UDim2.new(1, -70, 0, 0)
ControlsFrame.BackgroundTransparency = 1
ControlsFrame.ZIndex = 12
ControlsFrame.Parent = Header

local ControlsList = Instance.new("UIListLayout")
ControlsList.FillDirection = Enum.FillDirection.Horizontal
ControlsList.HorizontalAlignment = Enum.HorizontalAlignment.Right
ControlsList.VerticalAlignment = Enum.VerticalAlignment.Center
ControlsList.Padding = UDim.new(0, 5)
ControlsList.Parent = ControlsFrame

local ControlsPadding = Instance.new("UIPadding")
ControlsPadding.PaddingRight = UDim.new(0, 8)
ControlsPadding.Parent = ControlsFrame

local MinimizeBtn = Instance.new("TextButton")
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

local UICornerMin = Instance.new("UICorner")
UICornerMin.CornerRadius = UDim.new(0, 6)
UICornerMin.Parent = MinimizeBtn

local CloseBtn = Instance.new("TextButton")
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

local UICornerClose = Instance.new("UICorner")
UICornerClose.CornerRadius = UDim.new(0, 6)
UICornerClose.Parent = CloseBtn

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
AddButtonAnimation(MinimizeBtn, Color3.fromRGB(50, 50, 65), Color3.fromRGB(255, 170, 0))
AddButtonAnimation(CloseBtn, Color3.fromRGB(200, 40, 50), Color3.fromRGB(150, 20, 30))

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 120, 1, -40)
Sidebar.Position = UDim2.new(0, 0, 0, 40)
Sidebar.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 11
Sidebar.Parent = MainFrame

local SidebarList = Instance.new("UIListLayout")
SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
SidebarList.Padding = UDim.new(0, 5)
SidebarList.Parent = Sidebar

local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.PaddingTop = UDim.new(0, 10)
SidebarPadding.PaddingLeft = UDim.new(0, 8)
SidebarPadding.PaddingRight = UDim.new(0, 8)
SidebarPadding.Parent = Sidebar

local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Size = UDim2.new(1, -120, 1, -40)
Container.Position = UDim2.new(0, 120, 0, 40)
Container.BackgroundTransparency = 1
Container.ZIndex = 11
Container.Parent = MainFrame

local isMinimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        Sidebar.Visible = not isMinimized
        Container.Visible = not isMinimized
        local targetSize = isMinimized and UDim2.new(0, 520, 0, 40) or UDim2.new(0, 520, 0, 300)
        TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = targetSize}):Play()
end)

CloseBtn.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 520, 0, 0), BackgroundTransparency = 1})
        tween:Play()
        tween.Completed:Connect(function()
                ScreenGui:Destroy()
        end)
end)

-- FPS Tab
local FPSTab = Instance.new("ImageLabel")
FPSTab.Name = "FPSTab"
FPSTab.Size = UDim2.new(1, 0, 1, 0)
FPSTab.BackgroundTransparency = 1
FPSTab.Image = "rbxassetid://6521912809"
FPSTab.ScaleType = Enum.ScaleType.Crop
FPSTab.Visible = true
FPSTab.ZIndex = 11
FPSTab.Parent = Container

local FPSScroll = Instance.new("ScrollingFrame")
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

local FPSPadding = Instance.new("UIPadding")
FPSPadding.PaddingTop = UDim.new(0, 10)
FPSPadding.PaddingLeft = UDim.new(0, 15)
FPSPadding.PaddingRight = UDim.new(0, 15)
FPSPadding.Parent = FPSScroll

local FPSList = Instance.new("UIListLayout")
FPSList.SortOrder = Enum.SortOrder.LayoutOrder
FPSList.Padding = UDim.new(0, 6)
FPSList.Parent = FPSScroll

local BoostFPSBtn = Instance.new("TextButton")
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

local UICornerBoost = Instance.new("UICorner")
UICornerBoost.CornerRadius = UDim.new(0, 6)
UICornerBoost.Parent = BoostFPSBtn

local BoostPadding = Instance.new("UIPadding")
BoostPadding.PaddingLeft = UDim.new(0, 12)
BoostPadding.Parent = BoostFPSBtn

local FPSSubtext = Instance.new("TextLabel")
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

local AntiLagBtn = Instance.new("TextButton")
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

local UICornerAntiLag = Instance.new("UICorner")
UICornerAntiLag.CornerRadius = UDim.new(0, 6)
UICornerAntiLag.Parent = AntiLagBtn

local AntiLagPadding = Instance.new("UIPadding")
AntiLagPadding.PaddingLeft = UDim.new(0, 12)
AntiLagPadding.Parent = AntiLagBtn

-- Auto Tab
local AutoTab = Instance.new("ImageLabel")
AutoTab.Name = "AutoTab"
AutoTab.Size = UDim2.new(1, 0, 1, 0)
AutoTab.BackgroundTransparency = 1
AutoTab.Image = "rbxassetid://6521912809"
AutoTab.ScaleType = Enum.ScaleType.Crop
AutoTab.Visible = false
AutoTab.ZIndex = 11
AutoTab.Parent = Container

local AutoScroll = Instance.new("ScrollingFrame")
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

local AutoPadding = Instance.new("UIPadding")
AutoPadding.PaddingTop = UDim.new(0, 10)
AutoPadding.PaddingLeft = UDim.new(0, 15)
AutoPadding.PaddingRight = UDim.new(0, 15)
AutoPadding.Parent = AutoScroll

local AutoList = Instance.new("UIListLayout")
AutoList.SortOrder = Enum.SortOrder.LayoutOrder
AutoList.Padding = UDim.new(0, 2)
AutoList.Parent = AutoScroll

-- Ranked Tab
local RankedTab = Instance.new("ImageLabel")
RankedTab.Name = "RankedTab"
RankedTab.Size = UDim2.new(1, 0, 1, 0)
RankedTab.BackgroundTransparency = 1
RankedTab.Image = "rbxassetid://6521912809"
RankedTab.ScaleType = Enum.ScaleType.Crop
RankedTab.Visible = false
RankedTab.ZIndex = 11
RankedTab.Parent = Container

local RankedScroll = Instance.new("ScrollingFrame")
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

local RankedPadding = Instance.new("UIPadding")
RankedPadding.PaddingTop = UDim.new(0, 10)
RankedPadding.PaddingLeft = UDim.new(0, 15)
RankedPadding.PaddingRight = UDim.new(0, 15)
RankedPadding.Parent = RankedScroll

local RankedList = Instance.new("UIListLayout")
RankedList.SortOrder = Enum.SortOrder.LayoutOrder
RankedList.Padding = UDim.new(0, 2)
RankedList.Parent = RankedScroll

-- Config Tab
local ConfigTab = Instance.new("ImageLabel")
ConfigTab.Name = "ConfigTab"
ConfigTab.Size = UDim2.new(1, 0, 1, 0)
ConfigTab.BackgroundTransparency = 1
ConfigTab.Image = "rbxassetid://6521912809"
ConfigTab.ScaleType = Enum.ScaleType.Crop
ConfigTab.Visible = false
ConfigTab.ZIndex = 11
ConfigTab.Parent = Container

local ConfigScroll = Instance.new("ScrollingFrame")
ConfigScroll.Name = "ConfigScroll"
ConfigScroll.Size = UDim2.new(1, 0, 1, 0)
ConfigScroll.BackgroundTransparency = 1
ConfigScroll.BorderSizePixel = 0
ConfigScroll.ScrollBarThickness = 4
ConfigScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 40)
ConfigScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
ConfigScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
ConfigScroll.ZIndex = 11
ConfigScroll.Parent = ConfigTab

local ConfigPadding = Instance.new("UIPadding")
ConfigPadding.PaddingTop = UDim.new(0, 10)
ConfigPadding.PaddingLeft = UDim.new(0, 15)
ConfigPadding.PaddingRight = UDim.new(0, 15)
ConfigPadding.Parent = ConfigScroll

local ConfigList = Instance.new("UIListLayout")
ConfigList.SortOrder = Enum.SortOrder.LayoutOrder
ConfigList.Padding = UDim.new(0, 6)
ConfigList.Parent = ConfigScroll

-- Aim Tab
local AimTab = Instance.new("ImageLabel")
AimTab.Name = "AimTab"
AimTab.Size = UDim2.new(1, 0, 1, 0)
AimTab.BackgroundTransparency = 1
AimTab.Image = "rbxassetid://6521912809"
AimTab.ScaleType = Enum.ScaleType.Crop
AimTab.Visible = false
AimTab.ZIndex = 11
AimTab.Parent = Container

local AimScroll = Instance.new("ScrollingFrame")
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

local AimPadding = Instance.new("UIPadding")
AimPadding.PaddingTop = UDim.new(0, 10)
AimPadding.PaddingLeft = UDim.new(0, 15)
AimPadding.PaddingRight = UDim.new(0, 15)
AimPadding.Parent = AimScroll

local AimList = Instance.new("UIListLayout")
AimList.SortOrder = Enum.SortOrder.LayoutOrder
AimList.Padding = UDim.new(0, 2)
AimList.Parent = AimScroll

-- Misc Tab
local MiscTab = Instance.new("ImageLabel")
MiscTab.Name = "MiscTab"
MiscTab.Size = UDim2.new(1, 0, 1, 0)
MiscTab.BackgroundTransparency = 1
MiscTab.Image = "rbxassetid://6521912809"
MiscTab.ScaleType = Enum.ScaleType.Crop
MiscTab.Visible = false
MiscTab.ZIndex = 11
MiscTab.Parent = Container

local MiscScroll = Instance.new("ScrollingFrame")
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

local MiscPadding = Instance.new("UIPadding")
MiscPadding.PaddingTop = UDim.new(0, 10)
MiscPadding.PaddingLeft = UDim.new(0, 15)
MiscPadding.PaddingRight = UDim.new(0, 15)
MiscPadding.Parent = MiscScroll

local MiscList = Instance.new("UIListLayout")
MiscList.SortOrder = Enum.SortOrder.LayoutOrder
MiscList.Padding = UDim.new(0, 2)
MiscList.Parent = MiscScroll

local function CreateToggle(name, text, subtext, layoutOrder, parentFrame)
        parentFrame = parentFrame or AutoScroll
        local Frame = Instance.new("Frame")
        Frame.Name = name .. "Frame"
        Frame.Size = UDim2.new(1, 0, 0, 42)
        Frame.BackgroundTransparency = 1
        Frame.LayoutOrder = layoutOrder
        Frame.ZIndex = 12
        Frame.Parent = parentFrame

        local Btn = Instance.new("TextButton")
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

        local ToggleBox = Instance.new("Frame")
        ToggleBox.Name = "ToggleBox"
        ToggleBox.Size = UDim2.new(0, 40, 0, 20)
        ToggleBox.Position = UDim2.new(1, -40, 0, 1)
        ToggleBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        ToggleBox.BorderSizePixel = 0
        ToggleBox.ZIndex = 13
        ToggleBox.Parent = Btn

        local UICornerBox = Instance.new("UICorner")
        UICornerBox.CornerRadius = UDim.new(1, 0)
        UICornerBox.Parent = ToggleBox

        local Indicator = Instance.new("Frame")
        Indicator.Name = "Indicator"
        Indicator.Size = UDim2.new(0, 14, 0, 14)
        Indicator.Position = UDim2.new(0, 3, 0.5, -7)
        Indicator.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        Indicator.BorderSizePixel = 0
        Indicator.ZIndex = 14
        Indicator.Parent = ToggleBox

        local UICornerInd = Instance.new("UICorner")
        UICornerInd.CornerRadius = UDim.new(1, 0)
        UICornerInd.Parent = Indicator

        local Sub = Instance.new("TextLabel")
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

        local toggled = false
        local callback = nil

        Btn.MouseButton1Click:Connect(function()
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

        return {
                SetCallback = function(fn) callback = fn end,
                GetState = function() return toggled end,
                SetState = function(val)
                        toggled = val
                        local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                        if toggled then
                                TweenService:Create(ToggleBox, tweenInfo, {BackgroundColor3 = Color3.fromRGB(255, 0, 40)}):Play()
                                TweenService:Create(Indicator, tweenInfo, {Position = UDim2.new(1, -17, 0.5, -7)}):Play()
                        else
                                TweenService:Create(ToggleBox, tweenInfo, {BackgroundColor3 = Color3.fromRGB(40, 40, 50)}):Play()
                                TweenService:Create(Indicator, tweenInfo, {Position = UDim2.new(0, 3, 0.5, -7)}):Play()
                        end
                end
        }
end

-- --- CONFIG SYSTEM SETUP ---
getgenv().SelectedConfigMode = "1vs1"

local CreateConfigBtn = Instance.new("TextButton")
CreateConfigBtn.Name = "CreateConfigBtn"
CreateConfigBtn.Size = UDim2.new(1, 0, 0, 36)
CreateConfigBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
CreateConfigBtn.Text = "Create Config"
CreateConfigBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CreateConfigBtn.TextSize = 14
CreateConfigBtn.Font = Enum.Font.GothamSemibold
CreateConfigBtn.TextXAlignment = Enum.TextXAlignment.Left
CreateConfigBtn.BorderSizePixel = 0
CreateConfigBtn.LayoutOrder = 1
CreateConfigBtn.ZIndex = 12
CreateConfigBtn.Parent = ConfigScroll

local UICornerCreateCfg = Instance.new("UICorner")
UICornerCreateCfg.CornerRadius = UDim.new(0, 6)
UICornerCreateCfg.Parent = CreateConfigBtn

local CreateCfgPadding = Instance.new("UIPadding")
CreateCfgPadding.PaddingLeft = UDim.new(0, 12)
CreateCfgPadding.Parent = CreateConfigBtn

local ConfigSubtext = Instance.new("TextLabel")
ConfigSubtext.Name = "ConfigSubtext"
ConfigSubtext.Size = UDim2.new(1, 0, 0, 16)
ConfigSubtext.BackgroundTransparency = 1
ConfigSubtext.Text = "Creates MiHub folder & saves configuration JSON file"
ConfigSubtext.TextColor3 = Color3.fromRGB(150, 150, 150)
ConfigSubtext.TextSize = 11
ConfigSubtext.Font = Enum.Font.Gotham
ConfigSubtext.TextXAlignment = Enum.TextXAlignment.Left
ConfigSubtext.LayoutOrder = 2
ConfigSubtext.ZIndex = 12
ConfigSubtext.Parent = ConfigScroll

local CfgModeFrame = Instance.new("Frame")
CfgModeFrame.Name = "CfgModeFrame"
CfgModeFrame.Size = UDim2.new(1, 0, 0, 30)
CfgModeFrame.BackgroundTransparency = 1
CfgModeFrame.LayoutOrder = 3
CfgModeFrame.ZIndex = 12
CfgModeFrame.Parent = ConfigScroll

local CfgModeLabel = Instance.new("TextLabel")
CfgModeLabel.Size = UDim2.new(0, 100, 1, 0)
CfgModeLabel.BackgroundTransparency = 1
CfgModeLabel.Text = "Mode:"
CfgModeLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
CfgModeLabel.TextSize = 12
CfgModeLabel.Font = Enum.Font.GothamSemibold
CfgModeLabel.TextXAlignment = Enum.TextXAlignment.Left
CfgModeLabel.ZIndex = 13
CfgModeLabel.Parent = CfgModeFrame

local CfgModeDropdownBtn = Instance.new("TextButton")
CfgModeDropdownBtn.Name = "CfgModeDropdownBtn"
CfgModeDropdownBtn.Size = UDim2.new(0, 120, 0, 24)
CfgModeDropdownBtn.Position = UDim2.new(0, 105, 0.5, -12)
CfgModeDropdownBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
CfgModeDropdownBtn.BorderSizePixel = 0
CfgModeDropdownBtn.Text = "1vs1 v"
CfgModeDropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CfgModeDropdownBtn.TextSize = 12
CfgModeDropdownBtn.Font = Enum.Font.Gotham
CfgModeDropdownBtn.ZIndex = 13
CfgModeDropdownBtn.Parent = CfgModeFrame

local UICornerCfgMode = Instance.new("UICorner")
UICornerCfgMode.CornerRadius = UDim.new(0, 5)
UICornerCfgMode.Parent = CfgModeDropdownBtn

local CfgModeMenu = Instance.new("Frame")
CfgModeMenu.Name = "CfgModeMenu"
CfgModeMenu.Size = UDim2.new(0, 120, 0, 0)
CfgModeMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
CfgModeMenu.BorderSizePixel = 0
CfgModeMenu.Visible = false
CfgModeMenu.ClipsDescendants = true
CfgModeMenu.ZIndex = 100
CfgModeMenu.Parent = MainFrame

local UICornerCfgMenu = Instance.new("UICorner")
UICornerCfgMenu.CornerRadius = UDim.new(0, 5)
UICornerCfgMenu.Parent = CfgModeMenu

local UIStrokeCfgMenu = Instance.new("UIStroke")
UIStrokeCfgMenu.Thickness = 1
UIStrokeCfgMenu.Color = Color3.fromRGB(50, 50, 60)
UIStrokeCfgMenu.Parent = CfgModeMenu

local UIListCfgMenu = Instance.new("UIListLayout")
UIListCfgMenu.SortOrder = Enum.SortOrder.LayoutOrder
UIListCfgMenu.Padding = UDim.new(0, 2)
UIListCfgMenu.Parent = CfgModeMenu

local UIPaddingCfgMenu = Instance.new("UIPadding")
UIPaddingCfgMenu.PaddingTop = UDim.new(0, 2)
UIPaddingCfgMenu.PaddingBottom = UDim.new(0, 2)
UIPaddingCfgMenu.Parent = CfgModeMenu

local Mode1v1Btn = Instance.new("TextButton")
Mode1v1Btn.Size = UDim2.new(1, 0, 0, 24)
Mode1v1Btn.BackgroundTransparency = 1
Mode1v1Btn.Text = "1vs1"
Mode1v1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Mode1v1Btn.TextSize = 12
Mode1v1Btn.Font = Enum.Font.Gotham
Mode1v1Btn.ZIndex = 101
Mode1v1Btn.Parent = CfgModeMenu

local Mode2v2Btn = Instance.new("TextButton")
Mode2v2Btn.Size = UDim2.new(1, 0, 0, 24)
Mode2v2Btn.BackgroundTransparency = 1
Mode2v2Btn.Text = "2vs2"
Mode2v2Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Mode2v2Btn.TextSize = 12
Mode2v2Btn.Font = Enum.Font.Gotham
Mode2v2Btn.ZIndex = 101
Mode2v2Btn.Parent = CfgModeMenu

local Mode3v3Btn = Instance.new("TextButton")
Mode3v3Btn.Size = UDim2.new(1, 0, 0, 24)
Mode3v3Btn.BackgroundTransparency = 1
Mode3v3Btn.Text = "3vs3"
Mode3v3Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Mode3v3Btn.TextSize = 12
Mode3v3Btn.Font = Enum.Font.Gotham
Mode3v3Btn.ZIndex = 101
Mode3v3Btn.Parent = CfgModeMenu

local CfgModeMenuOpen = false
local CfgModeMenuTween = nil

local function ToggleCfgModeMenu()
        if CfgModeMenuTween then
                CfgModeMenuTween:Cancel()
                CfgModeMenuTween = nil
        end

        local absPos = CfgModeDropdownBtn.AbsolutePosition
        local absSize = CfgModeDropdownBtn.AbsoluteSize
        local mainAbsPos = MainFrame.AbsolutePosition

        local targetX = absPos.X - mainAbsPos.X
        local targetY = absPos.Y - mainAbsPos.Y + absSize.Y + 2

        CfgModeMenu.Position = UDim2.new(0, targetX, 0, targetY)

        if CfgModeMenuOpen then
                CfgModeMenuOpen = false
                CfgModeMenuTween = TweenService:Create(CfgModeMenu, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        Size = UDim2.new(0, 120, 0, 0)
                })
                CfgModeMenuTween:Play()
                CfgModeMenuTween.Completed:Connect(function()
                        if not CfgModeMenuOpen then CfgModeMenu.Visible = false end
                end)
        else
                CfgModeMenuOpen = true
                CfgModeMenu.Visible = true
                CfgModeMenu.Size = UDim2.new(0, 120, 0, 0)
                CfgModeMenuTween = TweenService:Create(CfgModeMenu, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 120, 0, 80)
                })
                CfgModeMenuTween:Play()
        end
end

CfgModeDropdownBtn.MouseButton1Click:Connect(function()
        ToggleCfgModeMenu()
end)

local function UpdateCfgSelection(modeStr)
        getgenv().SelectedConfigMode = modeStr
        CfgModeDropdownBtn.Text = modeStr .. " v"
        if CfgModeMenuOpen then ToggleCfgModeMenu() end
        
        -- Update Ranked Enemy targets UI availability if dropdown exists
        if getgenv().UpdateEnemyTargetsMenuUI then
                getgenv().UpdateEnemyTargetsMenuUI()
        end
end

Mode1v1Btn.MouseButton1Click:Connect(function() UpdateCfgSelection("1vs1") end)
Mode2v2Btn.MouseButton1Click:Connect(function() UpdateCfgSelection("2vs2") end)
Mode3v3Btn.MouseButton1Click:Connect(function() UpdateCfgSelection("3vs3") end)

CreateConfigBtn.MouseButton1Click:Connect(function()
        if not isfolder("MiHub") then
                makefolder("MiHub")
        end
        local cfgData = {
                Mode = getgenv().SelectedConfigMode or "1vs1",
                Created = os.time()
        }
        writefile("MiHub/config.json", HttpService:JSONEncode(cfgData))
        CreateConfigBtn.Text = "Config Created!"
        task.delay(1.5, function()
                CreateConfigBtn.Text = "Create Config"
        end)
end)

-- --- RANKED TAB IMPLEMENTATION ---
local RankedModeToggle = CreateToggle("RankedMode", "Ranked Mode", "Auto attacks opponents in 1v1, 2v2, 3v3", 1, RankedScroll)

-- Check Config Validation for Ranked Mode
RankedModeToggle.SetCallback(function(state)
        if state then
                if not isfolder("MiHub") or not isfile("MiHub/config.json") then
                        RankedModeToggle.SetState(false)
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                                Title = "Mi Hub Error",
                                Text = "Config file missing! Please create a config in the Config tab.",
                                Duration = 4
                        })
                        return
                end
                
                -- Validate config contents
                local success, result = pcall(function()
                        return HttpService:JSONDecode(readfile("MiHub/config.json"))
                end)
                if not success or not result or not result.Mode then
                        RankedModeToggle.SetState(false)
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                                Title = "Mi Hub Error",
                                Text = "Invalid config format! Re-create it in the Config tab.",
                                Duration = 4
                        })
                        return
                end
                getgenv().RankedModeEnabled = true
        else
                getgenv().RankedModeEnabled = false
        end
end)

-- Enemy Targets Menu Frame
local EnemyTargetsFrame = Instance.new("Frame")
EnemyTargetsFrame.Name = "EnemyTargetsFrame"
EnemyTargetsFrame.Size = UDim2.new(1, 0, 0, 30)
EnemyTargetsFrame.BackgroundTransparency = 1
EnemyTargetsFrame.LayoutOrder = 2
EnemyTargetsFrame.ZIndex = 12
EnemyTargetsFrame.Parent = RankedScroll

local EnemyTargetsLabel = Instance.new("TextLabel")
EnemyTargetsLabel.Size = UDim2.new(0, 100, 1, 0)
EnemyTargetsLabel.BackgroundTransparency = 1
EnemyTargetsLabel.Text = "Enemy targets:"
EnemyTargetsLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
EnemyTargetsLabel.TextSize = 12
EnemyTargetsLabel.Font = Enum.Font.GothamSemibold
EnemyTargetsLabel.TextXAlignment = Enum.TextXAlignment.Left
EnemyTargetsLabel.ZIndex = 13
EnemyTargetsLabel.Parent = EnemyTargetsFrame

local EnemyTargetsDropdownBtn = Instance.new("TextButton")
EnemyTargetsDropdownBtn.Name = "EnemyTargetsDropdownBtn"
EnemyTargetsDropdownBtn.Size = UDim2.new(0, 140, 0, 24)
EnemyTargetsDropdownBtn.Position = UDim2.new(0, 105, 0.5, -12)
EnemyTargetsDropdownBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
EnemyTargetsDropdownBtn.BorderSizePixel = 0
EnemyTargetsDropdownBtn.Text = "Select Enemies v"
EnemyTargetsDropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnemyTargetsDropdownBtn.TextSize = 11
EnemyTargetsDropdownBtn.Font = Enum.Font.Gotham
EnemyTargetsDropdownBtn.ZIndex = 13
EnemyTargetsDropdownBtn.Parent = EnemyTargetsFrame

local UICornerEnemyDropdown = Instance.new("UICorner")
UICornerEnemyDropdown.CornerRadius = UDim.new(0, 5)
UICornerEnemyDropdown.Parent = EnemyTargetsDropdownBtn

local EnemyTargetsMenu = Instance.new("Frame")
EnemyTargetsMenu.Name = "EnemyTargetsMenu"
EnemyTargetsMenu.Size = UDim2.new(0, 140, 0, 0)
EnemyTargetsMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
EnemyTargetsMenu.BorderSizePixel = 0
EnemyTargetsMenu.Visible = false
EnemyTargetsMenu.ClipsDescendants = true
EnemyTargetsMenu.ZIndex = 100
EnemyTargetsMenu.Parent = MainFrame

local UICornerEnemyMenu = Instance.new("UICorner")
UICornerEnemyMenu.CornerRadius = UDim.new(0, 5)
UICornerEnemyMenu.Parent = EnemyTargetsMenu

local UIStrokeEnemyMenu = Instance.new("UIStroke")
UIStrokeEnemyMenu.Thickness = 1
UIStrokeEnemyMenu.Color = Color3.fromRGB(50, 50, 60)
UIStrokeEnemyMenu.Parent = EnemyTargetsMenu

local EnemyScrollMenu = Instance.new("ScrollingFrame")
EnemyScrollMenu.Size = UDim2.new(1, 0, 1, 0)
EnemyScrollMenu.BackgroundTransparency = 1
EnemyScrollMenu.BorderSizePixel = 0
EnemyScrollMenu.ScrollBarThickness = 3
EnemyScrollMenu.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 40)
EnemyScrollMenu.CanvasSize = UDim2.new(0, 0, 0, 0)
EnemyScrollMenu.AutomaticCanvasSize = Enum.AutomaticSize.Y
EnemyScrollMenu.ZIndex = 101
EnemyScrollMenu.Parent = EnemyTargetsMenu

local UIListEnemyMenu = Instance.new("UIListLayout")
UIListEnemyMenu.SortOrder = Enum.SortOrder.LayoutOrder
UIListEnemyMenu.Padding = UDim.new(0, 2)
UIListEnemyMenu.Parent = EnemyScrollMenu

local UIPaddingEnemyMenu = Instance.new("UIPadding")
UIPaddingEnemyMenu.PaddingTop = UDim.new(0, 2)
UIPaddingEnemyMenu.PaddingBottom = UDim.new(0, 2)
UIPaddingEnemyMenu.Parent = EnemyScrollMenu

getgenv().SelectedEnemyTargets = {}
local EnemyTargetsMenuOpen = false
local EnemyTargetsMenuTween = nil

local function ToggleEnemyTargetsMenu()
        if getgenv().SelectedConfigMode == "1vs1" then return end
        
        if EnemyTargetsMenuTween then
                EnemyTargetsMenuTween:Cancel()
                EnemyTargetsMenuTween = nil
        end

        local absPos = EnemyTargetsDropdownBtn.AbsolutePosition
        local absSize = EnemyTargetsDropdownBtn.AbsoluteSize
        local mainAbsPos = MainFrame.AbsolutePosition

        local targetX = absPos.X - mainAbsPos.X
        local targetY = absPos.Y - mainAbsPos.Y + absSize.Y + 2

        EnemyTargetsMenu.Position = UDim2.new(0, targetX, 0, targetY)

        if EnemyTargetsMenuOpen then
                EnemyTargetsMenuOpen = false
                EnemyTargetsMenuTween = TweenService:Create(EnemyTargetsMenu, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        Size = UDim2.new(0, 140, 0, 0)
                })
                EnemyTargetsMenuTween:Play()
                EnemyTargetsMenuTween.Completed:Connect(function()
                        if not EnemyTargetsMenuOpen then EnemyTargetsMenu.Visible = false end
                end)
        else
                EnemyTargetsMenuOpen = true
                EnemyTargetsMenu.Visible = true
                EnemyTargetsMenu.Size = UDim2.new(0, 140, 0, 0)
                local itemCount = #EnemyScrollMenu:GetChildren() - 2
                local targetHeight = math.min(120, math.max(30, itemCount * 24 + 6))
                EnemyTargetsMenuTween = TweenService:Create(EnemyTargetsMenu, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 140, 0, targetHeight)
                })
                EnemyTargetsMenuTween:Play()
        end
end

EnemyTargetsDropdownBtn.MouseButton1Click:Connect(function()
        ToggleEnemyTargetsMenu()
end)

local function RefreshEnemyTargetsList()
        for _, child in ipairs(EnemyScrollMenu:GetChildren()) do
                if child:IsA("TextButton") then
                        child:Destroy()
                end
        end

        local maxAllowed = (getgenv().SelectedConfigMode == "3vs3") and 3 or 2
        
        for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer then
                        local btn = Instance.new("TextButton")
                        btn.Size = UDim2.new(1, 0, 0, 22)
                        btn.BackgroundTransparency = 1
                        
                        local isSelected = table.find(getgenv().SelectedEnemyTargets, plr.Name) ~= nil
                        btn.Text = (isSelected and "[X] " or "[  ] ") .. plr.DisplayName
                        btn.TextColor3 = isSelected and Color3.fromRGB(255, 0, 40) or Color3.fromRGB(200, 200, 200)
                        btn.TextSize = 11
                        btn.Font = Enum.Font.Gotham
                        btn.ZIndex = 102
                        btn.Parent = EnemyScrollMenu

                        btn.MouseButton1Click:Connect(function()
                                local idx = table.find(getgenv().SelectedEnemyTargets, plr.Name)
                                if idx then
                                        table.remove(getgenv().SelectedEnemyTargets, idx)
                                else
                                        if #getgenv().SelectedEnemyTargets < maxAllowed then
                                                table.insert(getgenv().SelectedEnemyTargets, plr.Name)
                                        end
                                end
                                RefreshEnemyTargetsList()
                        end)
                end
        end
        
        if #getgenv().SelectedEnemyTargets == 0 then
                EnemyTargetsDropdownBtn.Text = "Select Enemies v"
        else
                EnemyTargetsDropdownBtn.Text = tostring(#getgenv().SelectedEnemyTargets) .. " Selected v"
        end
end

getgenv().UpdateEnemyTargetsMenuUI = function()
        if getgenv().SelectedConfigMode == "1vs1" then
                EnemyTargetsDropdownBtn.Text = "N/A (1v1)"
                EnemyTargetsDropdownBtn.AutoButtonColor = false
                EnemyTargetsDropdownBtn.TextColor3 = Color3.fromRGB(120, 120, 120)
                if EnemyTargetsMenuOpen then ToggleEnemyTargetsMenu() end
        else
                EnemyTargetsDropdownBtn.AutoButtonColor = true
                EnemyTargetsDropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                RefreshEnemyTargetsList()
        end
end

Players.PlayerAdded:Connect(RefreshEnemyTargetsList)
Players.PlayerRemoving:Connect(function(plr)
        local idx = table.find(getgenv().SelectedEnemyTargets, plr.Name)
        if idx then table.remove(getgenv().SelectedEnemyTargets, idx) end
        RefreshEnemyTargetsList()
end)

getgenv().UpdateEnemyTargetsMenuUI()

-- Standard UI Toggles & Controls Setup
local MuteSoundToggle = CreateToggle("MuteSound", "Mute Sound", "Mutes all in-game audio", 5, FPSScroll)
local NoRenderToggle = CreateToggle("NoRender", "No Render", "Covers screen with black texture", 6, FPSScroll)
local storedVolume = UserGameSettings.MasterVolume

MuteSoundToggle.SetCallback(function(state)
        if state then
                storedVolume = UserGameSettings.MasterVolume
                UserGameSettings.MasterVolume = 0
        else
                UserGameSettings.MasterVolume = storedVolume or 1
        end
end)

NoRenderToggle.SetCallback(function(state)
        NoRenderOverlay.Visible = state
end)

local AutoNearestToggle = CreateToggle("AutoNearest", "Auto Kill Nearest", "This kills the nearest player", 1, AutoScroll)
local AutoLowestToggle = CreateToggle("AutoLowest", "Auto Kill Lowest", "This kills a low health player", 2, AutoScroll)

local BypassDeathCounterToggle = CreateToggle("BypassDeathCounter", "Bypass Death Counter", "Bypasses death counter on specific animations", 1, MiscScroll)
local NoDashCooldownToggle = CreateToggle("NoDashCooldown", "No dash cooldown", "Removes dash cooldown", 2, MiscScroll)
local DodgeSaitamaToggle = CreateToggle("DodgeSaitama", "Dodge Saitama moves", "Dodges specific Saitama moves", 3, MiscScroll)
local AntiVoidToggle = CreateToggle("AntiVoid", "Anti void", "Prevents falling into the void", 4, MiscScroll)
local InvisibleToggle = CreateToggle("Invisible", "Invisible", "Makes player character invisible", 5, MiscScroll)

local InvisibleSubtextFrame = Instance.new("Frame")
InvisibleSubtextFrame.Name = "InvisibleSubtextFrame"
InvisibleSubtextFrame.Size = UDim2.new(1, 0, 0, 16)
InvisibleSubtextFrame.BackgroundTransparency = 1
InvisibleSubtextFrame.LayoutOrder = 6
InvisibleSubtextFrame.ZIndex = 12
InvisibleSubtextFrame.Parent = MiscScroll

local InvisibleWarningIcon = Instance.new("ImageLabel")
InvisibleWarningIcon.Name = "InvisibleWarningIcon"
InvisibleWarningIcon.Size = UDim2.new(0, 14, 0, 14)
InvisibleWarningIcon.Position = UDim2.new(0, 0, 0.5, -7)
InvisibleWarningIcon.BackgroundTransparency = 1
InvisibleWarningIcon.Image = "rbxassetid://99624144590072"
InvisibleWarningIcon.ZIndex = 12
InvisibleWarningIcon.Parent = InvisibleSubtextFrame

local InvisibleSubtext = Instance.new("TextLabel")
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

local AntiRagdollToggle = CreateToggle("AntiRagdoll", "Anti Ragdoll", "Prevents ragdoll state", 7, MiscScroll)
local AntiStunToggle = CreateToggle("AntiStun", "Anti Stun", "Prevents stun effects", 8, MiscScroll)

local FixCameraBtn = Instance.new("TextButton")
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

local UICornerFixCamera = Instance.new("UICorner")
UICornerFixCamera.CornerRadius = UDim.new(0, 6)
UICornerFixCamera.Parent = FixCameraBtn

local FixCameraPadding = Instance.new("UIPadding")
FixCameraPadding.PaddingLeft = UDim.new(0, 12)
FixCameraPadding.Parent = FixCameraBtn

local AimBotToggle = CreateToggle("AimBot", "Aim bot", "Locks camera to nearest enemy", 1, AimScroll)

local TargetInputFrame = Instance.new("Frame")
TargetInputFrame.Name = "TargetInputFrame"
TargetInputFrame.Size = UDim2.new(1, 0, 0, 30)
TargetInputFrame.BackgroundTransparency = 1
TargetInputFrame.LayoutOrder = 2
TargetInputFrame.ZIndex = 12
TargetInputFrame.Parent = AimScroll

local TargetLabel = Instance.new("TextLabel")
TargetLabel.Size = UDim2.new(0, 100, 1, 0)
TargetLabel.BackgroundTransparency = 1
TargetLabel.Text = "Target"
TargetLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
TargetLabel.TextSize = 12
TargetLabel.Font = Enum.Font.GothamSemibold
TargetLabel.TextXAlignment = Enum.TextXAlignment.Left
TargetLabel.ZIndex = 13
TargetLabel.Parent = TargetInputFrame

local TargetTextBox = Instance.new("TextBox")
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

local UICornerTargetInput = Instance.new("UICorner")
UICornerTargetInput.CornerRadius = UDim.new(0, 5)
UICornerTargetInput.Parent = TargetTextBox

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
                                if handle then handle.Transparency = transparency end
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

InvisibleToggle.SetCallback(function(state) ToggleInvisibility(state) end)

local AntiVoidConnection = nil
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

local function isDangerousAnim(track)
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

local function dodgeAway(fromPosition)
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local hrp = char.HumanoidRootPart
        local direction = (hrp.Position - fromPosition).Unit
        local newPos = hrp.Position + direction * 25 + Vector3.new(0, 5, 0)
        hrp.CFrame = CFrame.new(newPos)
end

local connection
local function SetDodgeSaitama(state)
        DodgeEnabled = state
        if connection then
                connection:Disconnect()
                connection = nil
        end
        if state then
                connection = RunService.Heartbeat:Connect(function()
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
                        if not detectedDanger then IsDodging = false end
                end)
        else
                IsDodging = false
        end
end

DodgeSaitamaToggle.SetCallback(function(state) SetDodgeSaitama(state) end)

local ByPassCounterEnabled = false
local ByPassLoop = nil
local function StartByPassCounter()
        local animations = { ["rbxassetid://11343250001"] = 0 }
        local function ifind(t, a)
                for i, v in pairs(t) do
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
                                                                v.Stopped:Connect(function() dothetech = false end)
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

local function SetByPassCounter(state)
        ByPassCounterEnabled = state
        if state then StartByPassCounter() end
end

BypassDeathCounterToggle.SetCallback(function(state) SetByPassCounter(state) end)

local function SetNoDashCD(state)
        if state then
                workspace:SetAttribute("EffectAffects", 1)
                workspace:SetAttribute("NoDashCooldown", true)
        else
                workspace:SetAttribute("EffectAffects", 0)
                workspace:SetAttribute("NoDashCooldown", false)
        end
end

NoDashCooldownToggle.SetCallback(function(state) SetNoDashCD(state) end)

local InputFrame = Instance.new("Frame")
InputFrame.Name = "InputFrame"
InputFrame.Size = UDim2.new(1, 0, 0, 30)
InputFrame.BackgroundTransparency = 1
InputFrame.LayoutOrder = 3
InputFrame.ZIndex = 12
InputFrame.Parent = AutoScroll

local InputLabel = Instance.new("TextLabel")
InputLabel.Size = UDim2.new(0, 100, 1, 0)
InputLabel.BackgroundTransparency = 1
InputLabel.Text = "Lowest health:"
InputLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
InputLabel.TextSize = 12
InputLabel.Font = Enum.Font.GothamSemibold
InputLabel.TextXAlignment = Enum.TextXAlignment.Left
InputLabel.ZIndex = 13
InputLabel.Parent = InputFrame

local TextBox = Instance.new("TextBox")
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

local UICornerInput = Instance.new("UICorner")
UICornerInput.CornerRadius = UDim.new(0, 5)
UICornerInput.Parent = TextBox

TextBox:GetPropertyChangedSignal("Text"):Connect(function()
        local text = TextBox.Text
        if text == "" then return end
        local cleaned = text:gsub("%D", "")
        if #cleaned > 2 then cleaned = cleaned:sub(1, 2) end
        local num = tonumber(cleaned)
        if num and num > 99 then cleaned = "99" end
        if TextBox.Text ~= cleaned then TextBox.Text = cleaned end
end)

local AutoTargetToggle = CreateToggle("AutoTarget", "Auto Kill Player", "Target a specific player by name", 4, AutoScroll)

local TargetInputFrameAuto = Instance.new("Frame")
TargetInputFrameAuto.Name = "TargetInputFrame"
TargetInputFrameAuto.Size = UDim2.new(1, 0, 0, 30)
TargetInputFrameAuto.BackgroundTransparency = 1
TargetInputFrameAuto.LayoutOrder = 5
TargetInputFrameAuto.ZIndex = 12
TargetInputFrameAuto.Parent = AutoScroll

local TargetLabelAuto = Instance.new("TextLabel")
TargetLabelAuto.Size = UDim2.new(0, 100, 1, 0)
TargetLabelAuto.BackgroundTransparency = 1
TargetLabelAuto.Text = "Target player:"
TargetLabelAuto.TextColor3 = Color3.fromRGB(220, 220, 220)
TargetLabelAuto.TextSize = 12
TargetLabelAuto.Font = Enum.Font.GothamSemibold
TargetLabelAuto.TextXAlignment = Enum.TextXAlignment.Left
TargetLabelAuto.ZIndex = 13
TargetLabelAuto.Parent = TargetInputFrameAuto

local TargetTextBoxAuto = Instance.new("TextBox")
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

local UICornerTargetInputAuto = Instance.new("UICorner")
UICornerTargetInputAuto.CornerRadius = UDim.new(0, 5)
UICornerTargetInputAuto.Parent = TargetTextBoxAuto

TargetTextBoxAuto.FocusLost:Connect(function()
        getgenv().TargetPlayerName = TargetTextBoxAuto.Text
end)

local ModeFrame = Instance.new("Frame")
ModeFrame.Name = "ModeFrame"
ModeFrame.Size = UDim2.new(1, 0, 0, 30)
ModeFrame.BackgroundTransparency = 1
ModeFrame.LayoutOrder = 6
ModeFrame.ZIndex = 12
ModeFrame.Parent = AutoScroll

local ModeLabel = Instance.new("TextLabel")
ModeLabel.Size = UDim2.new(0, 100, 1, 0)
ModeLabel.BackgroundTransparency = 1
ModeLabel.Text = "Mode:"
ModeLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
ModeLabel.TextSize = 12
ModeLabel.Font = Enum.Font.GothamSemibold
ModeLabel.TextXAlignment = Enum.TextXAlignment.Left
ModeLabel.ZIndex = 13
ModeLabel.Parent = ModeFrame

local ModeDropdownBtn = Instance.new("TextButton")
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

local UICornerMode = Instance.new("UICorner")
UICornerMode.CornerRadius = UDim.new(0, 5)
UICornerMode.Parent = ModeDropdownBtn

local ModeMenu = Instance.new("Frame")
ModeMenu.Name = "ModeMenu"
ModeMenu.Size = UDim2.new(0, 120, 0, 0)
ModeMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
ModeMenu.BorderSizePixel = 0
ModeMenu.Visible = false
ModeMenu.ClipsDescendants = true
ModeMenu.ZIndex = 100
ModeMenu.Parent = MainFrame

local UICornerMenu = Instance.new("UICorner")
UICornerMenu.CornerRadius = UDim.new(0, 5)
UICornerMenu.Parent = ModeMenu

local UIStrokeMenu = Instance.new("UIStroke")
UIStrokeMenu.Thickness = 1
UIStrokeMenu.Color = Color3.fromRGB(50, 50, 60)
UIStrokeMenu.Parent = ModeMenu

local UIListMenu = Instance.new("UIListLayout")
UIListMenu.SortOrder = Enum.SortOrder.LayoutOrder
UIListMenu.Padding = UDim.new(0, 2)
UIListMenu.Parent = ModeMenu

local UIPaddingMenu = Instance.new("UIPadding")
UIPaddingMenu.PaddingTop = UDim.new(0, 2)
UIPaddingMenu.PaddingBottom = UDim.new(0, 2)
UIPaddingMenu.Parent = ModeMenu

local AutoModeBtn = Instance.new("TextButton")
AutoModeBtn.Size = UDim2.new(1, 0, 0, 24)
AutoModeBtn.BackgroundTransparency = 1
AutoModeBtn.Text = "Auto"
AutoModeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoModeBtn.TextSize = 12
AutoModeBtn.Font = Enum.Font.Gotham
AutoModeBtn.ZIndex = 101
AutoModeBtn.Parent = ModeMenu

local ManualModeBtn = Instance.new("TextButton")
ManualModeBtn.Size = UDim2.new(1, 0, 0, 24)
ManualModeBtn.BackgroundTransparency = 1
ManualModeBtn.Text = "Manual"
ManualModeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ManualModeBtn.TextSize = 12
ManualModeBtn.Font = Enum.Font.Gotham
ManualModeBtn.ZIndex = 101
ManualModeBtn.Parent = ModeMenu

local ModeMenuOpen = false
local ModeMenuTween = nil

local function ToggleModeMenu()
        if ModeMenuTween then
                ModeMenuTween:Cancel()
                ModeMenuTween = nil
        end

        local absPos = ModeDropdownBtn.AbsolutePosition
        local absSize = ModeDropdownBtn.AbsoluteSize
        local mainAbsPos = MainFrame.AbsolutePosition

        local targetX = absPos.X - mainAbsPos.X
        local targetY = absPos.Y - mainAbsPos.Y + absSize.Y + 2

        ModeMenu.Position = UDim2.new(0, targetX, 0, targetY)

        if ModeMenuOpen then
                ModeMenuOpen = false
                ModeMenuTween = TweenService:Create(ModeMenu, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        Size = UDim2.new(0, 120, 0, 0)
                })
                ModeMenuTween:Play()
                ModeMenuTween.Completed:Connect(function()
                        if not ModeMenuOpen then ModeMenu.Visible = false end
                end)
        else
                ModeMenuOpen = true
                ModeMenu.Visible = true
                ModeMenu.Size = UDim2.new(0, 120, 0, 0)
                ModeMenuTween = TweenService:Create(ModeMenu, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 120, 0, 54)
                })
                ModeMenuTween:Play()
        end
end

ModeDropdownBtn.MouseButton1Click:Connect(function() ToggleModeMenu() end)

AutoModeBtn.MouseButton1Click:Connect(function()
        getgenv().AutoKillMode = "Auto"
        ModeDropdownBtn.Text = "Auto v"
        if ModeMenuOpen then ToggleModeMenu() end
end)

ManualModeBtn.MouseButton1Click:Connect(function()
        getgenv().AutoKillMode = "Manual"
        ModeDropdownBtn.Text = "Manual v"
        if ModeMenuOpen then ToggleModeMenu() end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                local mousePos = UserInputService:GetMouseLocation()
                
                if ModeMenuOpen then
                        local menuPos = ModeMenu.AbsolutePosition
                        local menuSize = ModeMenu.AbsoluteSize
                        local btnPos = ModeDropdownBtn.AbsolutePosition
                        local btnSize = ModeDropdownBtn.AbsoluteSize
                        local insideMenu = mousePos.X >= menuPos.X and mousePos.X <= menuPos.X + menuSize.X and mousePos.Y >= menuPos.Y and mousePos.Y <= menuPos.Y + menuSize.Y
                        local insideBtn = mousePos.X >= btnPos.X and mousePos.X <= btnPos.X + btnSize.X and mousePos.Y >= btnPos.Y and mousePos.Y <= btnPos.Y + btnSize.Y
                        if not insideMenu and not insideBtn then ToggleModeMenu() end
                end
                
                if CfgModeMenuOpen then
                        local menuPos = CfgModeMenu.AbsolutePosition
                        local menuSize = CfgModeMenu.AbsoluteSize
                        local btnPos = CfgModeDropdownBtn.AbsolutePosition
                        local btnSize = CfgModeDropdownBtn.AbsoluteSize
                        local insideMenu = mousePos.X >= menuPos.X and mousePos.X <= menuPos.X + menuSize.X and mousePos.Y >= menuPos.Y and mousePos.Y <= menuPos.Y + menuSize.Y
                        local insideBtn = mousePos.X >= btnPos.X and mousePos.X <= btnPos.X + btnSize.X and mousePos.Y >= btnPos.Y and mousePos.Y <= btnPos.Y + btnSize.Y
                        if not insideMenu and not insideBtn then ToggleCfgModeMenu() end
                end

                if EnemyTargetsMenuOpen then
                        local menuPos = EnemyTargetsMenu.AbsolutePosition
                        local menuSize = EnemyTargetsMenu.AbsoluteSize
                        local btnPos = EnemyTargetsDropdownBtn.AbsolutePosition
                        local btnSize = EnemyTargetsDropdownBtn.AbsoluteSize
                        local insideMenu = mousePos.X >= menuPos.X and mousePos.X <= menuPos.X + menuSize.X and mousePos.Y >= menuPos.Y and mousePos.Y <= menuPos.Y + menuSize.Y
                        local insideBtn = mousePos.X >= btnPos.X and mousePos.X <= btnPos.X + btnSize.X and mousePos.Y >= btnPos.Y and mousePos.Y <= btnPos.Y + btnSize.Y
                        if not insideMenu and not insideBtn then ToggleEnemyTargetsMenu() end
                end
        end
end)

-- Sidebar Buttons setup
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

local UICornerFPSTab = Instance.new("UICorner")
UICornerFPSTab.CornerRadius = UDim.new(0, 5)
UICornerFPSTab.Parent = FPSTabBtn

local AutoTabBtn = Instance.new("TextButton")
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

local UICornerAutoTab = Instance.new("UICorner")
UICornerAutoTab.CornerRadius = UDim.new(0, 5)
UICornerAutoTab.Parent = AutoTabBtn

local RankedTabBtn = Instance.new("TextButton")
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

local UICornerRankedTab = Instance.new("UICorner")
UICornerRankedTab.CornerRadius = UDim.new(0, 5)
UICornerRankedTab.Parent = RankedTabBtn

local ConfigTabBtn = Instance.new("TextButton")
ConfigTabBtn.Name = "ConfigTabBtn"
ConfigTabBtn.Size = UDim2.new(1, 0, 0, 32)
ConfigTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
ConfigTabBtn.Text = "Config"
ConfigTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
ConfigTabBtn.TextSize = 13
ConfigTabBtn.Font = Enum.Font.GothamBold
ConfigTabBtn.BorderSizePixel = 0
ConfigTabBtn.ZIndex = 12
ConfigTabBtn.Parent = Sidebar

local UICornerConfigTab = Instance.new("UICorner")
UICornerConfigTab.CornerRadius = UDim.new(0, 5)
UICornerConfigTab.Parent = ConfigTabBtn

local AimTabBtn = Instance.new("TextButton")
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

local UICornerAimTab = Instance.new("UICorner")
UICornerAimTab.CornerRadius = UDim.new(0, 5)
UICornerAimTab.Parent = AimTabBtn

local MiscTabBtn = Instance.new("TextButton")
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

local UICornerMiscTab = Instance.new("UICorner")
UICornerMiscTab.CornerRadius = UDim.new(0, 5)
UICornerMiscTab.Parent = MiscTabBtn

local function CloseAllMenus()
        if ModeMenuOpen then ToggleModeMenu() end
        if CfgModeMenuOpen then ToggleCfgModeMenu() end
        if EnemyTargetsMenuOpen then ToggleEnemyTargetsMenu() end
end

FPSTabBtn.MouseButton1Click:Connect(function()
        CloseAllMenus()
        FPSTab.Visible = true; AutoTab.Visible = false; RankedTab.Visible = false; ConfigTab.Visible = false; AimTab.Visible = false; MiscTab.Visible = false
        FPSTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45); FPSTabBtn.TextColor3 = Color3.fromRGB(255, 0, 40)
        AutoTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); AutoTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        RankedTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); RankedTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        ConfigTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); ConfigTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        AimTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); AimTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        MiscTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); MiscTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)

AutoTabBtn.MouseButton1Click:Connect(function()
        CloseAllMenus()
        FPSTab.Visible = false; AutoTab.Visible = true; RankedTab.Visible = false; ConfigTab.Visible = false; AimTab.Visible = false; MiscTab.Visible = false
        AutoTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45); AutoTabBtn.TextColor3 = Color3.fromRGB(255, 0, 40)
        FPSTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); FPSTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        RankedTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); RankedTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        ConfigTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); ConfigTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        AimTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); AimTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        MiscTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); MiscTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)

RankedTabBtn.MouseButton1Click:Connect(function()
        CloseAllMenus()
        FPSTab.Visible = false; AutoTab.Visible = false; RankedTab.Visible = true; ConfigTab.Visible = false; AimTab.Visible = false; MiscTab.Visible = false
        RankedTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45); RankedTabBtn.TextColor3 = Color3.fromRGB(255, 0, 40)
        FPSTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); FPSTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        AutoTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); AutoTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        ConfigTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); ConfigTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        AimTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); AimTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        MiscTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); MiscTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)

ConfigTabBtn.MouseButton1Click:Connect(function()
        CloseAllMenus()
        FPSTab.Visible = false; AutoTab.Visible = false; RankedTab.Visible = false; ConfigTab.Visible = true; AimTab.Visible = false; MiscTab.Visible = false
        ConfigTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45); ConfigTabBtn.TextColor3 = Color3.fromRGB(255, 0, 40)
        FPSTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); FPSTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        AutoTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); AutoTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        RankedTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); RankedTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        AimTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); AimTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        MiscTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); MiscTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)

AimTabBtn.MouseButton1Click:Connect(function()
        CloseAllMenus()
        FPSTab.Visible = false; AutoTab.Visible = false; RankedTab.Visible = false; ConfigTab.Visible = false; AimTab.Visible = true; MiscTab.Visible = false
        AimTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45); AimTabBtn.TextColor3 = Color3.fromRGB(255, 0, 40)
        FPSTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); FPSTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        AutoTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); AutoTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        RankedTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); RankedTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        ConfigTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); ConfigTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        MiscTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); MiscTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)

MiscTabBtn.MouseButton1Click:Connect(function()
        CloseAllMenus()
        FPSTab.Visible = false; AutoTab.Visible = false; RankedTab.Visible = false; ConfigTab.Visible = false; AimTab.Visible = false; MiscTab.Visible = true
        MiscTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45); MiscTabBtn.TextColor3 = Color3.fromRGB(255, 0, 40)
        FPSTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); FPSTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        AutoTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); AutoTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        RankedTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); RankedTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        ConfigTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); ConfigTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        AimTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35); AimTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)

BoostFPSBtn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/stormzdev/the-strongest-battlegrounds/refs/heads/main/fps-boost.lua"))()
end)

AntiLagBtn.MouseButton1Click:Connect(function()
        if _G.MAMBO_ANTILAG_LOCKED then return end
        local ALLOWED_IDS = {10449761463, 131048399685555, 10449761463}
        local valid = false
        for _, id in ipairs(ALLOWED_IDS) do
                if game.PlaceId == id then valid = true; break end
        end
        if not valid then return end
        if not _G.MAMBO_ANTILAG_LOADED then
                _G.MAMBO_ANTILAG_LOADED = true
                local clk = os.clock
                local mround = math.round
                local mfloor = math.floor
                local mmax = math.max
                local Players = game:GetService("Players")
                local RunService = game:GetService("RunService")
                local Lighting = game:GetService("Lighting")
                local Workspace = game:GetService("Workspace")

                Lighting.GlobalShadows = false
                Lighting.EnvironmentDiffuseScale = 0
                Lighting.EnvironmentSpecularScale = 0
                Lighting.Brightness = 1.5
                Lighting.ClockTime = 14
                Lighting.FogEnd = 100000
                Lighting.OutdoorAmbient = Color3.new(0.8, 0.8, 0.8)
                Lighting.Ambient = Color3.new(0.6, 0.6, 0.6)

                for _, name in ipairs({"Atmosphere", "Clouds", "Sky"}) do
                        local obj = Lighting:FindFirstChild(name) or Workspace:FindFirstChild(name)
                        if obj then pcall(function() obj:Destroy() end) end
                end
                for _, v in ipairs(Workspace:GetChildren()) do
                        if v.Name:lower():find("cloud") then pcall(function() v:Destroy() end) end
                end
        end
end)

getgenv().AutoKillNearestPlr = false
getgenv().AutoKillLowestHealthPlr = false
getgenv().AutoKillTargetPlr = false
getgenv().RankedModeEnabled = false
getgenv().AutoKillMode = "Auto"
getgenv().TargetPlayerName = ""
getgenv().TeleportDistance = 5
getgenv().LowestHealthThreshold = 35

local function PerformAttack(targetRoot)
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

local function FindRankedEnemy()
        local myChar = LocalPlayer.Character
        if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return nil end
        local myPos = myChar.HumanoidRootPart.Position

        -- Mode Selection Logic:
        -- In 1v1: Attack the closest non-local player in the server
        -- In 2v2/3v3: Attack selected target enemy players from Enemy Targets menu
        local mode = getgenv().SelectedConfigMode
        local closestEnemy = nil
        local closestDist = math.huge

        if mode == "1vs1" then
                for _, plr in pairs(Players:GetPlayers()) do
                        if plr ~= LocalPlayer and plr.Character then
                                local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                                if hum and hrp and hum.Health > 0 then
                                        local dist = (myPos - hrp.Position).Magnitude
                                        if dist < closestDist then
                                                closestDist = dist
                                                closestEnemy = hrp
                                        end
                                end
                        end
                end
        else
                -- 2v2 or 3v3 mode
                for _, targetName in ipairs(getgenv().SelectedEnemyTargets) do
                        local plr = Players:FindFirstChild(targetName)
                        if plr and plr.Character then
                                local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                                if hum and hrp and hum.Health > 0 then
                                        local dist = (myPos - hrp.Position).Magnitude
                                        if dist < closestDist then
                                                closestDist = dist
                                                closestEnemy = hrp
                                        end
                                end
                        end
                end
        end

        return closestEnemy
end

-- Main Heartbeat Attack Loop
RunService.Heartbeat:Connect(function()
        if getgenv().RankedModeEnabled then
                local targetHrp = FindRankedEnemy()
                if targetHrp and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local myHrp = LocalPlayer.Character.HumanoidRootPart
                        myHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, getgenv().TeleportDistance)
                        PerformAttack(targetHrp)
                end
        end
end)