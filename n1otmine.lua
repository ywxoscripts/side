--// Destroy other instances
for _,v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "dark_UI" then
        v:Destroy()
    end
end

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
local Mouse = LocalPlayer:GetMouse()

function Library:Create(table_cfg)
    local windowName = table_cfg.Name
    local firstTab = true -- Variable um den ersten Tab zu identifizieren

    local main = Instance.new("Frame")
    main.Name = "main"
    main.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    main.Position = UDim2.fromScale(0.5, 0.5)
    main.AnchorPoint = Vector2.new(0.5, 0.5)
    main.Size = UDim2.fromOffset(488, 299)

    local title = Instance.new("TextLabel")
    title.Name = "title"
    title.Font = Enum.Font.Gotham
    title.Text = windowName
    title.TextColor3 = Color3.fromRGB(168, 168, 168)
    title.TextSize = 20
    title.BackgroundTransparency = 1
    title.Position = UDim2.fromScale(0, 0.05)
    title.Size = UDim2.fromScale(1, 0.1)
    title.Parent = main

    local uICorner = Instance.new("UICorner")
    uICorner.Parent = main

    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "tabContainer"
    tabContainer.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    tabContainer.Position = UDim2.fromScale(0.0342, 0.188)
    tabContainer.Size = UDim2.fromOffset(454, 30)
    tabContainer.Parent = main

    local uICorner1 = Instance.new("UICorner")
    uICorner1.CornerRadius = UDim.new(0, 6)
    uICorner1.Parent = tabContainer

    local uIListLayout = Instance.new("UIListLayout")
    uIListLayout.Padding = UDim.new(0, 8)
    uIListLayout.FillDirection = Enum.FillDirection.Horizontal
    uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uIListLayout.Parent = tabContainer

    local uIPadding = Instance.new("UIPadding")
    uIPadding.PaddingLeft = UDim.new(0, 7)
    uIPadding.PaddingTop = UDim.new(0, 4)
    uIPadding.Parent = tabContainer

    local shadow = Instance.new("ImageLabel")
    shadow.Name = "shadow"
    shadow.Image = "rbxassetid://297774371"
    shadow.ImageColor3 = Color3.fromRGB(15, 15, 15)
    shadow.ImageTransparency = 0.3
    shadow.SliceCenter = Rect.new(20, 20, 280, 280)
    shadow.BackgroundTransparency = 1
    shadow.Position = UDim2.fromScale(0.5, 0.5)
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.Size = UDim2.fromOffset(529, 331)
    shadow.ZIndex = -1
    shadow.Parent = dark_UI

    main.Parent = dark_UI

    local tabHandler = {}

    function tabHandler:Tab(name)
        local main1 = Instance.new("TextButton")
        main1.Name = name
        main1.Font = Enum.Font.Gotham
        main1.Text = name
        main1.TextColor3 = Color3.fromRGB(195, 195, 195)
        main1.TextSize = 13
        main1.TextTransparency = firstTab and 0 or 0.5 -- Erster Tab ist hell
        main1.AutomaticSize = Enum.AutomaticSize.X
        main1.BackgroundTransparency = 1
        main1.Size = UDim2.fromOffset(10, 24)
        main1.Parent = tabContainer

        local container = Instance.new("Frame")
        container.Name = "container"
        container.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
        container.Position = UDim2.fromScale(0.0342, 0.31)
        container.Size = UDim2.fromOffset(454, 183)
        container.Visible = firstTab -- Erster Container ist sichtbar
        container.Parent = main
        
        local uICorner2 = Instance.new("UICorner")
        uICorner2.CornerRadius = UDim.new(0, 6)
        uICorner2.Parent = container
        
        local holder = Instance.new("ScrollingFrame")
        holder.Name = "holder"
        holder.ScrollBarImageColor3 = Color3.fromRGB(76, 76, 76)
        holder.ScrollBarThickness = 2
        holder.BackgroundTransparency = 1
        holder.Size = UDim2.fromScale(1, 1)
        holder.CanvasSize = UDim2.new(0,0,0,0)
        holder.AutomaticCanvasSize = Enum.AutomaticSize.Y
        holder.Parent = container

        local uIListLayout1 = Instance.new("UIListLayout")
        uIListLayout1.Padding = UDim.new(0, 5)
        uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
        uIListLayout1.Parent = holder

        local uIPadding1 = Instance.new("UIPadding")
        uIPadding1.PaddingLeft = UDim.new(0, 5)
        uIPadding1.PaddingTop = UDim.new(0, 7)
        uIPadding1.Parent = holder

        -- Wenn dies der erste Tab war, setzen wir die Variable für die nächsten Tabs auf false
        if firstTab then
            firstTab = false
        end

        main1.MouseButton1Click:Connect(function()
            for _,v in pairs(main:GetChildren()) do
                if v.Name == "container" then v.Visible = false end
            end
            for _,v in pairs(tabContainer:GetChildren()) do
                if v:IsA('TextButton') then
                    TweenService:Create(v, TweenInfo.new(0.3), {TextTransparency = 0.5}):Play()
                end
            end
            container.Visible = true
            TweenService:Create(main1, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
        end)

        local ElementHandler = {}

        -- Verbessertes Slider-Dragging
        function ElementHandler:Slider(text, default, min, max, callback)
            local slider = Instance.new("TextButton")
            slider.Name = "slider"
            slider.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
            slider.Size = UDim2.fromOffset(441, 32)
            slider.Text = ""
            slider.AutoButtonColor = false
            slider.Parent = holder
            Instance.new("UICorner", slider).CornerRadius = UDim.new(0, 6)

            local textLabel1 = Instance.new("TextLabel")
            textLabel1.Font = Enum.Font.Gotham
            textLabel1.Text = text
            textLabel1.TextColor3 = Color3.fromRGB(195, 195, 195)
            textLabel1.TextSize = 13
            textLabel1.TextXAlignment = Enum.TextXAlignment.Left
            textLabel1.BackgroundTransparency = 1
            textLabel1.Position = UDim2.fromOffset(8, 0)
            textLabel1.Size = UDim2.fromOffset(200, 32)
            textLabel1.Parent = slider

            local sliderBack = Instance.new("Frame")
            sliderBack.Name = "sliderBack"
            sliderBack.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            sliderBack.Position = UDim2.fromScale(0.75, 0.375)
            sliderBack.Size = UDim2.fromOffset(100, 8)
            sliderBack.Parent = slider
            Instance.new("UICorner", sliderBack).CornerRadius = UDim.new(0, 3)

            local sliderFill = Instance.new("Frame")
            sliderFill.Name = "sliderFill"
            sliderFill.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            sliderFill.Size = UDim2.fromScale(math.clamp((default - min) / (max - min), 0, 1), 1)
            sliderFill.Parent = sliderBack
            Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(0, 3)

            local valueLabel = Instance.new("TextLabel")
            valueLabel.Font = Enum.Font.Gotham
            valueLabel.Text = tostring(default)
            valueLabel.TextColor3 = Color3.fromRGB(195, 195, 195)
            valueLabel.TextSize = 13
            valueLabel.BackgroundTransparency = 1
            valueLabel.Position = UDim2.fromScale(0.63, 0)
            valueLabel.Size = UDim2.fromOffset(44, 32)
            valueLabel.Parent = slider

            local dragging = false

            local function updateSlider()
                -- Nutzt MouseLocation für präzise Berechnung relativ zum Slider-Hintergrund
                local mousePos = UserInputService:GetMouseLocation()
                local relativeX = mousePos.X - sliderBack.AbsolutePosition.X
                local pos = math.clamp(relativeX / sliderBack.AbsoluteSize.X, 0, 1)
                local val = math.floor(((max - min) * pos) + min)
                
                valueLabel.Text = tostring(val)
                TweenService:Create(sliderFill, TweenInfo.new(0.08, Enum.EasingStyle.Quint), {Size = UDim2.fromScale(pos, 1)}):Play()
                callback(val)
            end

            slider.MouseButton1Down:Connect(function()
                dragging = true
                updateSlider()
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)

            RunService.RenderStepped:Connect(function()
                if dragging then
                    updateSlider()
                end
            end)
        end

        -- Hier können Button, Toggle, Textbox etc. wieder eingefügt werden (analog zum Slider-Stil)
        function ElementHandler:Button(text, callback)
            local button = Instance.new("TextButton")
            button.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
            button.Size = UDim2.fromOffset(441, 32)
            button.Text = ""
            button.AutoButtonColor = false
            button.Parent = holder
            Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)
            local t = Instance.new("TextLabel", button)
            t.Font = Enum.Font.Gotham; t.Text = text; t.TextColor3 = Color3.fromRGB(195,195,195); t.Size = UDim2.fromScale(1,1); t.BackgroundTransparency = 1; t.Position = UDim2.fromOffset(8,0); t.TextXAlignment = "Left"
            button.MouseButton1Click:Connect(callback)
        end

        return ElementHandler
    end

    -- Fenster Dragging
    local dragging, dragStart, startPos
    main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = main.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            local delta = input.Position - dragStart
            local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            main.Position = newPos
            shadow.Position = newPos
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)

    return tabHandler
end

return Library
