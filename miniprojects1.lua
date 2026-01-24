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

function Library:Create(tbl)
local main = Instance.new("Frame")
main.BackgroundColor3 = Color3.fromRGB(28,28,28)
main.Position = UDim2.fromScale(0.5,0.5)
main.AnchorPoint = Vector2.new(0.5,0.5)
main.Size = UDim2.fromOffset(488,299)

local title = Instance.new("TextLabel")
title.Font = Enum.Font.Gotham
title.Text = tbl.Name
title.TextColor3 = Color3.fromRGB(168,168,168)
title.TextSize = 20
title.BackgroundTransparency = 1
title.Position = UDim2.fromScale(0.41,0.0543)
title.Size = UDim2.fromOffset(83,28)
title.Parent = main

Instance.new("UICorner",main)

local tabContainer = Instance.new("Frame")
tabContainer.BackgroundColor3 = Color3.fromRGB(33,33,33)
tabContainer.Position = UDim2.fromScale(0.0342,0.188)
tabContainer.Size = UDim2.fromOffset(454,30)
tabContainer.Parent = main
Instance.new("UICorner",tabContainer).CornerRadius = UDim.new(0,6)

local layout = Instance.new("UIListLayout",tabContainer)
layout.FillDirection = Enum.FillDirection.Horizontal
layout.Padding = UDim.new(0,8)

local pad = Instance.new("UIPadding",tabContainer)
pad.PaddingLeft = UDim.new(0,7)
pad.PaddingTop = UDim.new(0,4)

local shadow = Instance.new("ImageLabel")
shadow.Image = "rbxassetid://297774371"
shadow.ImageTransparency = 0.3
shadow.BackgroundTransparency = 1
shadow.AnchorPoint = Vector2.new(0.5,0.5)
shadow.Position = main.Position
shadow.Size = UDim2.fromOffset(529,331)
shadow.ZIndex = -1
shadow.Parent = dark_UI

main.Parent = dark_UI

local tabHandler = {}

function tabHandler:Tab(name)
local tab = Instance.new("TextButton")
tab.Text = name
tab.Font = Enum.Font.Gotham
tab.TextSize = 13
tab.TextTransparency = 0.5
tab.TextColor3 = Color3.fromRGB(195,195,195)
tab.BackgroundTransparency = 1
tab.AutomaticSize = Enum.AutomaticSize.X
tab.Parent = tabContainer

local container = Instance.new("Frame")
container.BackgroundColor3 = Color3.fromRGB(33,33,33)
container.Position = UDim2.fromScale(0.0342,0.31)
container.Size = UDim2.fromOffset(454,183)
container.Visible = false
container.Parent = main
Instance.new("UICorner",container).CornerRadius = UDim.new(0,6)

local holder = Instance.new("ScrollingFrame")
holder.Size = UDim2.fromOffset(452,182)
holder.ScrollBarThickness = 2
holder.BackgroundTransparency = 1
holder.Parent = container

local l = Instance.new("UIListLayout",holder)
l.Padding = UDim.new(0,3)

local p = Instance.new("UIPadding",holder)
p.PaddingLeft = UDim.new(0,5)
p.PaddingTop = UDim.new(0,7)

tab.MouseButton1Click:Connect(function()
for _,v in pairs(main:GetChildren()) do if v.Name=="Frame" and v~=container then end end
for _,v in pairs(tabContainer:GetChildren()) do if v:IsA("TextButton") then TweenService:Create(v,TweenInfo.new(0.3),{TextTransparency=0.5}):Play() end end
container.Visible = true
TweenService:Create(tab,TweenInfo.new(0.3),{TextTransparency=0}):Play()
end)

local elements = {}

function elements:Slider(text,default,min,max,callback)
local slider = Instance.new("TextButton")
slider.Size = UDim2.fromOffset(441,32)
slider.BackgroundColor3 = Color3.fromRGB(38,38,38)
slider.Text = ""
slider.Parent = holder
Instance.new("UICorner",slider).CornerRadius = UDim.new(0,6)

local label = Instance.new("TextLabel",slider)
label.Text = text
label.Font = Enum.Font.Gotham
label.TextSize = 13
label.TextColor3 = Color3.fromRGB(195,195,195)
label.BackgroundTransparency = 1
label.Position = UDim2.fromOffset(8,0)
label.Size = UDim2.fromOffset(200,32)
label.TextXAlignment = Left

local bar = Instance.new("Frame",slider)
bar.BackgroundColor3 = Color3.fromRGB(33,33,33)
bar.Position = UDim2.fromScale(0.75,0.375)
bar.Size = UDim2.fromOffset(100,8)
Instance.new("UICorner",bar).CornerRadius = UDim.new(0,3)

local fill = Instance.new("Frame",bar)
fill.BackgroundColor3 = Color3.fromRGB(45,45,45)
fill.Size = UDim2.fromScale((default-min)/(max-min),1)
Instance.new("UICorner",fill).CornerRadius = UDim.new(0,3)

local value = Instance.new("TextLabel",slider)
value.Text = tostring(default)
value.Font = Enum.Font.Gotham
value.TextSize = 13
value.TextColor3 = Color3.fromRGB(195,195,195)
value.BackgroundTransparency = 1
value.Position = UDim2.fromScale(0.63,0)
value.Size = UDim2.fromOffset(44,32)

local dragging=false
local function update()
local pos = math.clamp((UserInputService:GetMouseLocation().X-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
local val = math.floor(min+(max-min)*pos)
value.Text = tostring(val)
TweenService:Create(fill,TweenInfo.new(0.05),{Size=UDim2.fromScale(pos,1)}):Play()
if type(callback)=="function" then callback(val) end
end

slider.MouseButton1Down:Connect(function() dragging=true update() end)
UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end end)
RunService.RenderStepped:Connect(function() if dragging then update() end end)
end

function elements:Toggle(text,default,callback)
if type(default)~="boolean" then callback=default default=false end
local toggle = Instance.new("TextButton")
toggle.Size = UDim2.fromOffset(441,32)
toggle.BackgroundColor3 = Color3.fromRGB(38,38,38)
toggle.Text = ""
toggle.Parent = holder
Instance.new("UICorner",toggle).CornerRadius = UDim.new(0,6)

local label = Instance.new("TextLabel",toggle)
label.Text = text
label.Font = Enum.Font.Gotham
label.TextSize = 13
label.TextColor3 = Color3.fromRGB(195,195,195)
label.BackgroundTransparency = 1
label.Position = UDim2.fromOffset(8,0)
label.Size = UDim2.fromScale(1,1)
label.TextXAlignment = Left

local indicator = Instance.new("Frame",toggle)
indicator.Position = UDim2.fromScale(0.94,0.22)
indicator.Size = UDim2.fromOffset(18,18)
Instance.new("UICorner",indicator).CornerRadius = UDim.new(0,3)

local stroke = Instance.new("UIStroke",indicator)

local state = default
indicator.BackgroundColor3 = state and Color3.fromRGB(23,143,75) or Color3.fromRGB(45,45,45)
stroke.Color = state and Color3.fromRGB(32,202,106) or Color3.fromRGB(76,76,76)

toggle.MouseButton1Click:Connect(function()
state = not state
TweenService:Create(indicator,TweenInfo.new(0.2),{BackgroundColor3 = state and Color3.fromRGB(23,143,75) or Color3.fromRGB(45,45,45)}):Play()
TweenService:Create(stroke,TweenInfo.new(0.2),{Color = state and Color3.fromRGB(32,202,106) or Color3.fromRGB(76,76,76)}):Play()
if type(callback)=="function" then callback(state) end
end)
end

return elements
end

return tabHandler
end

return Library
