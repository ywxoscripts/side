for _,v in pairs(game.CoreGui:GetChildren()) do if v.Name == "dark_UI" then v:Destroy() end end
local dark_UI = Instance.new("ScreenGui")
dark_UI.Name = "dark_UI"
dark_UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
dark_UI.Parent = game.CoreGui
local Library = {}
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function Library:Create(table)
local main = Instance.new("Frame")
main.BackgroundColor3 = Color3.fromRGB(28,28,28)
main.Position = UDim2.fromScale(0.5,0.5)
main.AnchorPoint = Vector2.new(0.5,0.5)
main.Size = UDim2.fromOffset(488,299)
main.Parent = dark_UI
Instance.new("UICorner",main)

local title = Instance.new("TextLabel")
title.Font = Enum.Font.Gotham
title.Text = table.Name
title.TextColor3 = Color3.fromRGB(168,168,168)
title.TextSize = 20
title.BackgroundTransparency = 1
title.Size = UDim2.fromOffset(300,30)
title.Position = UDim2.fromOffset(10,5)
title.Parent = main

local tabContainer = Instance.new("Frame")
tabContainer.BackgroundColor3 = Color3.fromRGB(33,33,33)
tabContainer.Position = UDim2.fromOffset(10,45)
tabContainer.Size = UDim2.fromOffset(468,30)
tabContainer.Parent = main
Instance.new("UICorner",tabContainer)

local tabLayout = Instance.new("UIListLayout",tabContainer)
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0,6)

local tabHandler = {}

function tabHandler:Tab(name)
local tabBtn = Instance.new("TextButton")
tabBtn.Text = name
tabBtn.Font = Enum.Font.Gotham
tabBtn.TextSize = 13
tabBtn.TextColor3 = Color3.fromRGB(195,195,195)
tabBtn.BackgroundTransparency = 1
tabBtn.Size = UDim2.fromOffset(60,30)
tabBtn.Parent = tabContainer

local container = Instance.new("ScrollingFrame")
container.BackgroundColor3 = Color3.fromRGB(33,33,33)
container.Position = UDim2.fromOffset(10,85)
container.Size = UDim2.fromOffset(468,200)
container.CanvasSize = UDim2.new(0,0,0,0)
container.ScrollBarThickness = 2
container.Visible = false
container.Parent = main
Instance.new("UICorner",container)

local layout = Instance.new("UIListLayout",container)
layout.Padding = UDim.new(0,5)

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
container.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y+10)
end)

tabBtn.MouseButton1Click:Connect(function()
for _,v in pairs(main:GetChildren()) do
if v:IsA("ScrollingFrame") then v.Visible = false end
end
container.Visible = true
end)

local elements = {}

function elements:Toggle(text, default, callback)
local toggle = Instance.new("TextButton")
toggle.Size = UDim2.fromOffset(450,32)
toggle.BackgroundColor3 = Color3.fromRGB(38,38,38)
toggle.Text = ""
toggle.AutoButtonColor = false
toggle.Parent = container
Instance.new("UICorner",toggle)

local label = Instance.new("TextLabel")
label.Text = text
label.Font = Enum.Font.Gotham
label.TextSize = 13
label.TextColor3 = Color3.fromRGB(195,195,195)
label.BackgroundTransparency = 1
label.Position = UDim2.fromOffset(10,0)
label.Size = UDim2.fromScale(1,1)
label.TextXAlignment = Enum.TextXAlignment.Left
label.Parent = toggle

local indicator = Instance.new("Frame")
indicator.Size = UDim2.fromOffset(18,18)
indicator.Position = UDim2.fromScale(0.95,0.22)
indicator.Parent = toggle
Instance.new("UICorner",indicator)

local stroke = Instance.new("UIStroke",indicator)
stroke.Thickness = 1

local state = default == true

local function apply()
indicator.BackgroundColor3 = state and Color3.fromRGB(23,143,75) or Color3.fromRGB(45,45,45)
stroke.Color = state and Color3.fromRGB(32,202,106) or Color3.fromRGB(76,76,76)
end

apply()

toggle.MouseButton1Click:Connect(function()
state = not state
apply()
if type(callback) == "function" then callback(state) end
end)
end

function elements:Slider(text, default, min, max, callback)
local slider = Instance.new("Frame")
slider.Size = UDim2.fromOffset(450,32)
slider.BackgroundColor3 = Color3.fromRGB(38,38,38)
slider.Parent = container
Instance.new("UICorner",slider)

local label = Instance.new("TextLabel")
label.Text = text
label.Font = Enum.Font.Gotham
label.TextSize = 13
label.TextColor3 = Color3.fromRGB(195,195,195)
label.BackgroundTransparency = 1
label.Position = UDim2.fromOffset(10,0)
label.Size = UDim2.fromOffset(200,32)
label.TextXAlignment = Enum.TextXAlignment.Left
label.Parent = slider

local valueLabel = Instance.new("TextLabel")
valueLabel.Text = tostring(default)
valueLabel.Font = Enum.Font.Gotham
valueLabel.TextSize = 13
valueLabel.TextColor3 = Color3.fromRGB(195,195,195)
valueLabel.BackgroundTransparency = 1
valueLabel.Position = UDim2.fromScale(0.75,0)
valueLabel.Size = UDim2.fromOffset(60,32)
valueLabel.Parent = slider

local back = Instance.new("Frame")
back.Size = UDim2.fromOffset(120,6)
back.Position = UDim2.fromScale(0.55,0.6)
back.BackgroundColor3 = Color3.fromRGB(33,33,33)
back.Parent = slider
Instance.new("UICorner",back)

local fill = Instance.new("Frame")
fill.Size = UDim2.fromScale((default-min)/(max-min),1)
fill.BackgroundColor3 = Color3.fromRGB(45,45,45)
fill.Parent = back
Instance.new("UICorner",fill)

local dragging = false

local function update()
local pos = math.clamp((UserInputService:GetMouseLocation().X-back.AbsolutePosition.X)/back.AbsoluteSize.X,0,1)
local val = math.floor(min + (max-min)*pos)
valueLabel.Text = tostring(val)
fill.Size = UDim2.fromScale(pos,1)
if type(callback) == "function" then callback(val) end
end

back.InputBegan:Connect(function(i)
if i.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = true
update()
end
end)

UserInputService.InputEnded:Connect(function(i)
if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

RunService.RenderStepped:Connect(function()
if dragging then update() end
end)
end

return elements
end

return tabHandler
end

return Library
