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
local HTTPService = game:GetService("HttpService")

function Library:Create(table)
    local windowName = table.Name

    local main = Instance.new("Frame")
    main.Name = "main"
    main.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    main.Position = UDim2.fromScale(0.244, 0.292)
    main.Size = UDim2.fromOffset(488, 299)

    local title = Instance.new("TextLabel")
    title.Name = "title"
    title.Font = Enum.Font.Gotham
    title.Text = windowName
    title.TextColor3 = Color3.fromRGB(168, 168, 168)
    title.TextSize = 20
    title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Position = UDim2.fromScale(0.41, 0.0543)
    title.Size = UDim2.fromOffset(83, 28)
    title.Parent = main

    local uICorner = Instance.new("UICorner")
    uICorner.Name = "uICorner"
    uICorner.Parent = main

    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "tabContainer"
    tabContainer.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    tabContainer.Position = UDim2.fromScale(0.0342, 0.188)
    tabContainer.Size = UDim2.fromOffset(454, 30)

    local uICorner1 = Instance.new("UICorner")
    uICorner1.Name = "uICorner1"
    uICorner1.CornerRadius = UDim.new(0, 6)
    uICorner1.Parent = tabContainer

    local uIListLayout = Instance.new("UIListLayout")
    uIListLayout.Name = "uIListLayout"
    uIListLayout.Padding = UDim.new(0, 8)
    uIListLayout.FillDirection = Enum.FillDirection.Horizontal
    uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uIListLayout.Parent = tabContainer

    local uIPadding = Instance.new("UIPadding")
    uIPadding.Name = "uIPadding"
    uIPadding.PaddingLeft = UDim.new(0, 7)
    uIPadding.PaddingTop = UDim.new(0, 4)
    uIPadding.Parent = tabContainer

    local shadow = Instance.new("ImageLabel")
    shadow.Name = "shadow"
    shadow.Image = "rbxassetid://297774371"
    shadow.ImageColor3 = Color3.fromRGB(15, 15, 15)
    shadow.ImageTransparency = 0.3
    shadow.SliceCenter = Rect.new(20, 20, 280, 280)
    shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    shadow.BackgroundTransparency = 1
    shadow.Position = UDim2.fromScale(0.224, 0.272)
    shadow.Selectable = true
    shadow.Size = UDim2.fromOffset(529, 331)
    shadow.ZIndex = -1
    shadow.Parent = dark_UI

    tabContainer.Parent = main
    main.Parent = dark_UI
    main.AnchorPoint = Vector2.new(0.5,0.5)
    shadow.AnchorPoint = Vector2.new(0.5,0.5)

    main.Position = UDim2.new(0.5,0,0.5,0)
    shadow.Position = UDim2.new(0.5,0,0.5,0)

    local tabHandler = {}

    function tabHandler:Exit()
        dark_UI:Destroy()
    end

    function tabHandler:Tab(name)
        local main1 = Instance.new("TextButton")
        main1.Name = name
        main1.Font = Enum.Font.Gotham
        main1.Text = name
        main1.TextColor3 = Color3.fromRGB(195, 195, 195)
        main1.TextSize = 13
        main1.TextTransparency = 0.5
        main1.AutomaticSize = Enum.AutomaticSize.X
        main1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        main1.BackgroundTransparency = 1
        main1.Size = UDim2.fromOffset(10, 24)
        main1.Parent = tabContainer

        local container = Instance.new("Frame")
        container.Name = "container"
        container.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
        container.Position = UDim2.fromScale(0.0342, 0.31)
        container.Size = UDim2.fromOffset(454, 183)
        
        local uICorner2 = Instance.new("UICorner")
        uICorner2.Name = "uICorner2"
        uICorner2.CornerRadius = UDim.new(0, 6)
        uICorner2.Parent = container
        
        local holder = Instance.new("ScrollingFrame")
        holder.Name = "holder"
        holder.ScrollBarImageColor3 = Color3.fromRGB(76, 76, 76)
        holder.ScrollBarThickness = 2
        holder.ScrollingDirection = Enum.ScrollingDirection.Y
        holder.Active = true
        holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        holder.BackgroundTransparency = 1
        holder.BorderColor3 = Color3.fromRGB(33, 33, 33)
        holder.Position = UDim2.fromScale(0.0022, 0.00404)
        holder.Size = UDim2.fromOffset(452, 182)

        local uIPadding1 = Instance.new("UIPadding")
        uIPadding1.Name = "uIPadding1"
        uIPadding1.PaddingLeft = UDim.new(0, 5)
        uIPadding1.PaddingTop = UDim.new(0, 7)
        uIPadding1.Parent = holder

        local uIListLayout1 = Instance.new("UIListLayout")
        uIListLayout1.Name = "uIListLayout1"
        uIListLayout1.Padding = UDim.new(0, 3)
        uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
        uIListLayout1.Parent = holder

        local uICorner11 = Instance.new("UICorner")
        uICorner11.Name = "uICorner11"
        uICorner11.CornerRadius = UDim.new(0, 6)
        uICorner11.Parent = holder

        holder.Parent = container
        container.Parent = main
        container.Visible = false

        main1.MouseButton1Click:Connect(function()
            for _,v in pairs(main:GetChildren()) do
                if v.Name == "container" then
                    v.Visible = false
                end
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

        function ElementHandler:Label(text)
            local label = Instance.new("Frame")
            label.Name = "label"
            label.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
            label.Size = UDim2.fromOffset(441, 32)
            label.Parent = holder
    
            local uICorner3 = Instance.new("UICorner")
            uICorner3.Name = "uICorner3"
            uICorner3.CornerRadius = UDim.new(0, 6)
            uICorner3.Parent = label

            local textLabel = Instance.new("TextLabel")
            textLabel.Name = "textLabel"
            textLabel.Font = Enum.Font.Gotham
            textLabel.Text = text
            textLabel.TextColor3 = Color3.fromRGB(195, 195, 195)
            textLabel.TextSize = 13
            textLabel.TextXAlignment = Enum.TextXAlignment.Left
            textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            textLabel.BackgroundTransparency = 1
            textLabel.Position = UDim2.fromScale(0.0181, 0)
            textLabel.Size = UDim2.fromOffset(1, 32)
            textLabel.Parent = label
        end

        function ElementHandler:Button(text, callback)
            text = text or "Button"
            callback = callback or function() end

            local button = Instance.new("TextButton")
            button.Name = "button"
            button.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
            button.Size = UDim2.fromOffset(441, 32)
            button.Text = ""
            button.AutoButtonColor = false

            local uICorner12 = Instance.new("UICorner")
            uICorner12.Parent = button

            local textLabel5 = Instance.new("TextLabel")
            textLabel5.Font = Enum.Font.Gotham
            textLabel5.Text = text
            textLabel5.TextColor3 = Color3.fromRGB(195, 195, 195)
            textLabel5.TextSize = 13
            textLabel5.TextXAlignment = Enum.TextXAlignment.Left
            textLabel5.BackgroundTransparency = 1
            textLabel5.Position = UDim2.fromScale(0.0181, 0)
            textLabel5.Size = UDim2.fromOffset(1, 32)
            textLabel5.Parent = button

            button.Parent = holder
            button.MouseEnter:Connect(function()
                TweenService:Create(button, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(43,43,43)}):Play()
            end)
            button.MouseLeave:Connect(function()
                TweenService:Create(button, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(38,38,38)}):Play()
            end)
            button.MouseButton1Click:Connect(function() callback() end)
        end

        function ElementHandler:Slider(text, default, min, max, callback)
            text = text or "Slider"
            callback = callback or function() end

            local slider = Instance.new("TextButton")
            slider.Name = "slider"
            slider.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
            slider.Size = UDim2.fromOffset(441, 32)
            slider.Text = ""
            slider.AutoButtonColor = false

            local uICorner4 = Instance.new("UICorner")
            uICorner4.CornerRadius = UDim.new(0, 6)
            uICorner4.Parent = slider

            local textLabel1 = Instance.new("TextLabel")
            textLabel1.Font = Enum.Font.Gotham
            textLabel1.Text = text
            textLabel1.TextColor3 = Color3.fromRGB(195, 195, 195)
            textLabel1.TextSize = 13
            textLabel1.TextXAlignment = Enum.TextXAlignment.Left
            textLabel1.BackgroundTransparency = 1
            textLabel1.Position = UDim2.fromScale(0.0181, 0)
            textLabel1.Size = UDim2.fromOffset(1, 32)
            textLabel1.Parent = slider

            local sliderBG = Instance.new("Frame")
            sliderBG.Name = "SliderBG"
            sliderBG.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            sliderBG.Position = UDim2.fromScale(0.753, 0.375)
            sliderBG.Size = UDim2.fromOffset(102, 8)
            sliderBG.Parent = slider

            local uICorner5 = Instance.new("UICorner")
            uICorner5.CornerRadius = UDim.new(0, 3)
            uICorner5.Parent = sliderBG

            local sliderFill = Instance.new("Frame")
            sliderFill.Name = "SliderFill"
            sliderFill.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            sliderFill.Size = UDim2.fromScale(math.clamp((default - min) / (max - min), 0, 1), 1)
            sliderFill.Parent = sliderBG

            local uICorner6 = Instance.new("UICorner")
            uICorner6.CornerRadius = UDim.new(0, 3)
            uICorner6.Parent = sliderFill

            local valueDisplay = Instance.new("TextLabel")
            valueDisplay.Font = Enum.Font.Gotham
            valueDisplay.Text = tostring(default)
            valueDisplay.TextColor3 = Color3.fromRGB(195, 195, 195)
            valueDisplay.TextSize = 13
            valueDisplay.BackgroundTransparency = 1
            valueDisplay.Position = UDim2.fromScale(0.653, 0)
            valueDisplay.Size = UDim2.fromOffset(44, 32)
            valueDisplay.Parent = slider

            slider.Parent = holder

            local dragging = false

            local function updateSlider()
                local mousePos = UserInputService:GetMouseLocation().X
                local bgPos = sliderBG.AbsolutePosition.X
                local bgSize = sliderBG.AbsoluteSize.X
                local relativePos = math.clamp((mousePos - bgPos) / bgSize, 0, 1)
                
                local value = math.floor(min + (max - min) * relativePos)
                valueDisplay.Text = tostring(value)
                
                TweenService:Create(sliderFill, TweenInfo.new(0.06, Enum.EasingStyle.Sine), {Size = UDim2.fromScale(relativePos, 1)}):Play()
                callback(value)
            end

            slider.MouseButton1Down:Connect(function()
                dragging = true
                TweenService:Create(slider, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(47,47,47)}):Play()
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                    TweenService:Create(slider, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(38,38,38)}):Play()
                end
            end)

            RunService.RenderStepped:Connect(function()
                if dragging then
                    updateSlider()
                end
            end)

            slider.MouseEnter:Connect(function()
                TweenService:Create(slider, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(43,43,43)}):Play()
            end)
            slider.MouseLeave:Connect(function()
                if not dragging then
                    TweenService:Create(slider, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(38,38,38)}):Play()
                end
            end)
        end

        function ElementHandler:Toggle(text, callback)
            text = text or "Toggle"
            callback = callback or function() end
            local tog = false

            local toggle1 = Instance.new("TextButton")
            toggle1.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
            toggle1.Size = UDim2.fromOffset(441, 32)
            toggle1.Text = ""
            toggle1.AutoButtonColor = false

            local uICorner9 = Instance.new("UICorner")
            uICorner9.Parent = toggle1

            local textLabel4 = Instance.new("TextLabel")
            textLabel4.Font = Enum.Font.Gotham
            textLabel4.Text = text
            textLabel4.TextColor3 = Color3.fromRGB(195, 195, 195)
            textLabel4.TextSize = 13
            textLabel4.TextXAlignment = Enum.TextXAlignment.Left
            textLabel4.BackgroundTransparency = 1
            textLabel4.Position = UDim2.fromScale(0.0181, 0)
            textLabel4.Size = UDim2.fromOffset(1, 32)
            textLabel4.Parent = toggle1

            local frame3 = Instance.new("Frame")
            frame3.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            frame3.Position = UDim2.fromScale(0.943, 0.219)
            frame3.Size = UDim2.fromOffset(18, 18)
            frame3.Parent = toggle1

            local uICorner10 = Instance.new("UICorner")
            uICorner10.CornerRadius = UDim.new(0, 3)
            uICorner10.Parent = frame3

            local uIStroke1 = Instance.new("UIStroke")
            uIStroke1.Color = Color3.fromRGB(76, 76, 76)
            uIStroke1.Parent = frame3

            toggle1.Parent = holder

            toggle1.MouseButton1Click:Connect(function()
                tog = not tog
                callback(tog)
                if tog then
                    TweenService:Create(frame3, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(23, 143, 75)}):Play()
                    TweenService:Create(uIStroke1, TweenInfo.new(0.2), {Color = Color3.fromRGB(32, 202, 106)}):Play()
                else
                    TweenService:Create(frame3, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
                    TweenService:Create(uIStroke1, TweenInfo.new(0.2), {Color = Color3.fromRGB(76, 76, 76)}):Play()
                end
            end)
        end

        function ElementHandler:Textbox(text, callback)
            text = text or "Textbox"
            callback = callback or function() end

            local textbox = Instance.new("Frame")
            textbox.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
            textbox.Size = UDim2.fromOffset(441, 32)

            local uICorner13 = Instance.new("UICorner")
            uICorner13.Parent = textbox

            local textLabel6 = Instance.new("TextLabel")
            textLabel6.Font = Enum.Font.Gotham
            textLabel6.Text = text
            textLabel6.TextColor3 = Color3.fromRGB(195, 195, 195)
            textLabel6.TextSize = 13
            textLabel6.TextXAlignment = Enum.TextXAlignment.Left
            textLabel6.BackgroundTransparency = 1
            textLabel6.Position = UDim2.fromScale(0.0181, 0)
            textLabel6.Size = UDim2.fromOffset(1, 32)
            textLabel6.Parent = textbox

            local textBox = Instance.new("TextBox")
            textBox.Font = Enum.Font.SourceSans
            textBox.Text = ""
            textBox.TextColor3 = Color3.fromRGB(195, 195, 195)
            textBox.TextSize = 12
            textBox.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            textBox.Position = UDim2.fromScale(0.864, 0.188)
            textBox.Size = UDim2.fromOffset(52, 19)
            textBox.Parent = textbox

            local uICorner14 = Instance.new("UICorner")
            uICorner14.Parent = textBox
            textbox.Parent = holder

            textBox.FocusLost:Connect(function() callback(textBox.Text) end)
        end

        return ElementHandler
    end

    --// Dragging Logic
    local dragging, dragInput, dragStart, startPos

    main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
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

    --// Startup Sound
    task.spawn(function()
        if table.StartupSound and table.StartupSound.Toggle and table.StartupSound.SoundID ~= nil then
            local sound = Instance.new('Sound', game.CoreGui)
            sound.SoundId = "rbxassetid://" .. tostring(table.StartupSound.SoundID)
            sound.Volume = 1.5
            sound:Play()
            sound.Ended:Wait()
            sound:Destroy()
        end
    end)

    return tabHandler
end

return Library
