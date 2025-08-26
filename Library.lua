local UIS = game:GetService("UserInputService")

local UILibrary = {}
UILibrary.__index = UILibrary

function UILibrary:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 500, 0, 300)
    Main.Position = UDim2.new(0.3, 0, 0.3, 0)
    Main.BackgroundColor3 = Color3.fromRGB(40, 80, 240)
    Main.Active = true
    Main.Parent = ScreenGui

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 10)
    mainCorner.Parent = Main

    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 35)
    TitleBar.BackgroundColor3 = Color3.fromRGB(25, 50, 180)
    TitleBar.Parent = Main
    TitleBar.ZIndex = 3

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -10, 1, 0)
    TitleLabel.Position = UDim2.new(0, 5, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.new(1,1,1)
    TitleLabel.TextSize = 20
    TitleLabel.Font = Enum.Font.Nunito
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar
    TitleLabel.ZIndex = 3

    local TitleFiller = Instance.new("Frame")
    TitleFiller.Size = UDim2.new(1, 0, 0, 10)
    TitleFiller.Position = UDim2.new(0, 0, 0, 30)
    TitleFiller.BackgroundColor3 = TitleBar.BackgroundColor3
    TitleFiller.BorderSizePixel = 0
    TitleFiller.ZIndex = 2
    TitleFiller.Parent = TitleBar

    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 10)
    titleCorner.Parent = TitleBar
    
    local BtnFrame = Instance.new("Frame")
    BtnFrame.Size = UDim2.new(0, 70, 0, 30)
    BtnFrame.Position = UDim2.new(1, -75, 0.5, -15)
    BtnFrame.BackgroundTransparency = 1
    BtnFrame.Parent = TitleBar
    BtnFrame.ZIndex = 4

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = BtnFrame
    
    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0.5, -2, 1, 0)
    MinBtn.Position = UDim2.new(0, 0, 0, 0)
    MinBtn.Text = "-"
    MinBtn.Font = Enum.Font.Nunito
    MinBtn.TextScaled = true
    MinBtn.TextColor3 = Color3.new(255,255,255)
    MinBtn.BackgroundTransparency = 1
    MinBtn.Parent = BtnFrame
    MinBtn.ZIndex = 5
    
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0.5, -2, 1, 0)
    CloseBtn.Position = UDim2.new(0.5, 2, 0, 0)
    CloseBtn.Text = "X"
    CloseBtn.Font = Enum.Font.Nunito
    CloseBtn.TextScaled = true
    CloseBtn.TextColor3 = Color3.new(1,1,1)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Parent = BtnFrame
    CloseBtn.ZIndex = 5

    local ReopenBtn = Instance.new("TextButton")
    ReopenBtn.Size = UDim2.new(0, 100, 0, 30)
    ReopenBtn.Position = UDim2.new(0.5, -50, 0, 0)
    ReopenBtn.Text = "Open GUI"
    ReopenBtn.Font = Enum.Font.Nunito
    ReopenBtn.BackgroundColor3 = Color3.fromRGB(40, 80, 240)
    ReopenBtn.TextSize = 20
    ReopenBtn.TextColor3 = Color3.new(1,1,1)
    ReopenBtn.Visible = false
    ReopenBtn.Parent = ScreenGui

    local reopenCorner = Instance.new("UICorner")
    reopenCorner.CornerRadius = UDim.new(1, 0)
    reopenCorner.Parent = ReopenBtn

    local ConfirmFrame = Instance.new("Frame")
    ConfirmFrame.Size = UDim2.new(0, 250, 0, 120)
    ConfirmFrame.Position = UDim2.new(0.5, -125, 0.5, -60)
    ConfirmFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ConfirmFrame.Visible = false
    ConfirmFrame.Parent = Main
    ConfirmFrame.ZIndex = 4
    
    local cfCorner = Instance.new("UICorner")
    cfCorner.CornerRadius = UDim.new(0, 10)
    cfCorner.Parent = ConfirmFrame

    local ConfirmLabel = Instance.new("TextLabel")
    ConfirmLabel.Size = UDim2.new(1, -20, 0, 40)
    ConfirmLabel.Position = UDim2.new(0, 10, 0, 10)
    ConfirmLabel.Text = "Do you really want to close?"
    ConfirmLabel.Font = Enum.Font.Nunito
    ConfirmLabel.TextScaled = true
    ConfirmLabel.TextColor3 = Color3.new(1,1,1)
    ConfirmLabel.TextWrapped = true
    ConfirmLabel.BackgroundTransparency = 1
    ConfirmLabel.Parent = ConfirmFrame
    ConfirmLabel.ZIndex = 4

    local YesBtn = Instance.new("TextButton")
    YesBtn.Size = UDim2.new(0.5, -15, 0, 30)
    YesBtn.Position = UDim2.new(0, 10, 1, -40)
    YesBtn.Text = "Yes"
    YesBtn.Font = Enum.Font.Nunito
    YesBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    YesBtn.TextScaled = true
    YesBtn.TextColor3 = Color3.new(1,1,1)
    YesBtn.Parent = ConfirmFrame
    YesBtn.ZIndex = 4

    local YesBtnCorner = Instance.new("UICorner")
    YesBtnCorner.CornerRadius = UDim.new(0, 8)
    YesBtnCorner.Parent = YesBtn
    
    local NoBtn = Instance.new("TextButton")
    NoBtn.Size = UDim2.new(0.5, -15, 0, 30)
    NoBtn.Position = UDim2.new(0.5, 5, 1, -40)
    NoBtn.Text = "No"
    NoBtn.Font = Enum.Font.Nunito
    NoBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
    NoBtn.TextScaled = true
    NoBtn.TextColor3 = Color3.new(1,1,1)
    NoBtn.Parent = ConfirmFrame
    NoBtn.ZIndex = 4

    local NoBtnCorner = Instance.new("UICorner")
    NoBtnCorner.CornerRadius = UDim.new(0, 8)
    NoBtnCorner.Parent = NoBtn
    
    MinBtn.MouseButton1Click:Connect(function()
        Main.Visible = false
        ReopenBtn.Visible = true
    end)

    ReopenBtn.MouseButton1Click:Connect(function()
        Main.Visible = true
        ReopenBtn.Visible = false
    end)

    CloseBtn.MouseButton1Click:Connect(function()
        ConfirmFrame.Visible = true
    end)

    YesBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    NoBtn.MouseButton1Click:Connect(function()
        ConfirmFrame.Visible = false
    end)
    
    local function makeDraggable(dragger, target)
        local dragging, dragInput, dragStart, startPos

        dragger.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = target.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        dragger.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UIS.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                target.Position = UDim2.new(
                    startPos.X.Scale, startPos.X.Offset + delta.X,
                    startPos.Y.Scale, startPos.Y.Offset + delta.Y
                )
            end
        end)
    end  
    
    local TabListWrapper = Instance.new("Frame")
    TabListWrapper.Size = UDim2.new(0, 120, 1, -35)
    TabListWrapper.Position = UDim2.new(0, 0, 0, 35)
    TabListWrapper.BackgroundTransparency = 1
    TabListWrapper.BorderSizePixel = 0
    TabListWrapper.Parent = Main

    local TabList = Instance.new("ScrollingFrame")
    TabList.Size = UDim2.new(1, 0, 1, 0)
    TabList.BackgroundColor3 = Color3.fromRGB(20, 40, 120)
    TabList.ScrollBarThickness = 5
    TabList.CanvasSize = UDim2.new(0,0,0,0)
    TabList.Parent = TabListWrapper
    TabList.CanvasSize = UDim2.new(0, 0, 0, #TabList:GetChildren() * 30)

    local tabListCorner = Instance.new("UICorner")
    tabListCorner.CornerRadius = UDim.new(0, 8)
    tabListCorner.Parent = TabList
    
    local TabContentWrapper = Instance.new("Frame")
    TabContentWrapper.Size = UDim2.new(1, -120, 1, -35)
    TabContentWrapper.Position = UDim2.new(0, 120, 0, 35)
    TabContentWrapper.BackgroundTransparency = 1
    TabContentWrapper.BorderSizePixel = 0
    TabContentWrapper.Parent = Main

    local TabContent = Instance.new("ScrollingFrame")
    TabContent.Size = UDim2.new(1, 0, 1, 0)
    TabContent.BackgroundColor3 = Color3.fromRGB(40, 80, 240)
    TabContent.ScrollBarThickness = 5
    TabContent.CanvasSize = UDim2.new(0,0,0,0)
    TabContent.Parent = TabContentWrapper

    local tabContentCorner = Instance.new("UICorner")
    tabContentCorner.CornerRadius = UDim.new(0, 8)
    tabContentCorner.Parent = TabContent

    local tabContentWrapperCorner = Instance.new("UICorner")
    tabContentWrapperCorner.CornerRadius = UDim.new(0, 8)
    tabContentWrapperCorner.Parent = TabContentWrapper

    makeDraggable(Main, Main)
    makeDraggable(TitleBar, Main)
    makeDraggable(TabList, Main)
    makeDraggable(TabListWrapper, Main)
    makeDraggable(TabContent, Main)
    makeDraggable(TabContentWrapper, Main)

    local Window = setmetatable({
        Main = Main,
        TabList = TabList,
        TabContent = TabContent,
        Tabs = {}
    }, UILibrary)

    return Window
end

function UILibrary:CreateTab(name)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1, -10, 0, 30)
    TabButton.Position = UDim2.new(0, 5, 0, (#self.Tabs) * 35 + 15)
    TabButton.Text = name
    TabButton.Font = Enum.Font.Nunito
    TabButton.BackgroundColor3 = Color3.fromRGB(70, 100, 220)
    TabButton.TextScaled = true
    TabButton.TextColor3 = Color3.new(1,1,1)
    TabButton.Parent = self.TabList

    local TabButtonCorner = Instance.new("UICorner")
    TabButtonCorner.CornerRadius = UDim.new(0, 8)
    TabButtonCorner.Parent = TabButton

    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, 0, 1, 0)
    ContentFrame.Visible = false
    ContentFrame.BackgroundColor3 = Color3.fromRGB(40, 80, 240)
    ContentFrame.Parent = self.TabContent

    local Tab = {
        Button = TabButton,
        Content = ContentFrame,
        Elements = {}
    }

    table.insert(self.Tabs, Tab)
    
    TabButton.MouseButton1Click:Connect(function()
        for _,t in pairs(self.Tabs) do
            t.Content.Visible = false
        end
        ContentFrame.Visible = true
    end)
    
    local TabAPI = {}
    function TabAPI:AddButton(text, callback)
        local BtnFrame = Instance.new("Frame")
        BtnFrame.Size = UDim2.new(1, -20, 0, 30)
        BtnFrame.Position = UDim2.new(0, 10, 0, #Tab.Elements * 40 + 10)
        BtnFrame.BackgroundColor3 = Color3.fromRGB(90, 120, 240)
        BtnFrame.Parent = ContentFrame
        
        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 8)
        BtnCorner.Parent = BtnFrame
        
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(1, -10, 1, 0)
        Label.Position = UDim2.new(0, 10, 0, 0)
        Label.Text = text
        Label.Font = Enum.Font.Nunito
        Label.TextScaled = true
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.BackgroundTransparency = 1
        Label.TextColor3 = Color3.new(1,1,1)
        Label.Parent = BtnFrame
        
        BtnFrame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                callback()
            end
        end)
        
        table.insert(Tab.Elements, BtnFrame)
    end

    function TabAPI:AddToggle(text, default, callback)
        local ToggleFrame = Instance.new("Frame")
        ToggleFrame.Size = UDim2.new(1, -20, 0, 30)
        ToggleFrame.Position = UDim2.new(0, 10, 0, #Tab.Elements * 40 + 10)
        ToggleFrame.BackgroundColor3 = Color3.fromRGB(90, 120, 240)
        ToggleFrame.Parent = ContentFrame
        
        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(0, 8)
        ToggleCorner.Parent = ToggleFrame
        
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(1, -40, 1, 0)
        Label.Position = UDim2.new(0, 10, 0, 0)
        Label.Text = text
        Label.Font = Enum.Font.Nunito
        Label.TextScaled = true
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.BackgroundTransparency = 1
        Label.TextColor3 = Color3.new(1,1,1)
        Label.Parent = ToggleFrame
        
        local ToggleBtn = Instance.new("TextButton")
        ToggleBtn.Size = UDim2.new(0, 20, 0, 20)
        ToggleBtn.Position = UDim2.new(1, -25, 0.5, -10)
        ToggleBtn.Text = default and "✔" or ""
        ToggleBtn.Font = Enum.Font.Nunito
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(70, 100, 220)
        ToggleBtn.TextColor3 = Color3.new(1,1,1)
        ToggleBtn.Parent = ToggleFrame

        local ToggleBtnCorner = Instance.new("UICorner")
        ToggleBtnCorner.CornerRadius = UDim.new(0, 8)
        ToggleBtnCorner.Parent = ToggleBtn
        
        local state = default
        ToggleBtn.MouseButton1Click:Connect(function()
            state = not state
            ToggleBtn.Text = state and "✔" or ""
                callback(state)
            end)
        table.insert(Tab.Elements, ToggleFrame)
    end
        
    function TabAPI:AddTextbox(labelText, default, callback)
        local BoxFrame = Instance.new("Frame")
        BoxFrame.Size = UDim2.new(1, -20, 0, 30)
        BoxFrame.Position = UDim2.new(0, 10, 0, #Tab.Elements * 40 + 10)
        BoxFrame.BackgroundColor3 = Color3.fromRGB(90, 120, 240)
        BoxFrame.Parent = ContentFrame
        
        local BoxCorner = Instance.new("UICorner")
        BoxCorner.CornerRadius = UDim.new(0, 8)
        BoxCorner.Parent = BoxFrame
        
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(0.5, -10, 1, 0)
        Label.Position = UDim2.new(0, 10, 0, 0)
        Label.Text = labelText
        Label.Font = Enum.Font.Nunito
        Label.TextScaled = true
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.BackgroundTransparency = 1
        Label.TextColor3 = Color3.new(1,1,1)
        Label.Parent = BoxFrame
        
        local Box = Instance.new("TextBox")
        Box.Size = UDim2.new(0.5, -20, 0.8, 0)
        Box.Position = UDim2.new(0.5, 10, 0.1, 0)
        Box.Text = default or ""
        Box.PlaceholderText = "Enter..."
        Box.Font = Enum.Font.Nunito
        Box.BackgroundColor3 = Color3.fromRGB(70, 100, 220)
        Box.TextColor3 = Color3.new(1,1,1)
        Box.Parent = BoxFrame

        local BoxCorner = Instance.new("UICorner")
        BoxCorner.CornerRadius = UDim.new(0, 8)
        BoxCorner.Parent = Box
        
        Box.FocusLost:Connect(function(enter)
            if enter then
                callback(Box.Text)
            end
        end)
        
        table.insert(Tab.Elements, BoxFrame)
    end
        
    function TabAPI:AddSlider(name, min, max, default, callback)
        local sliderFrame = Instance.new("Frame")
        sliderFrame.Size = UDim2.new(1, -10, 0, 40)
        sliderFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        sliderFrame.BorderSizePixel = 0
        sliderFrame.Parent = tabContent
        
        local title = Instance.new("TextLabel")
        title.Text = name .. " (" .. tostring(default) .. ")"
        title.Size = UDim2.new(1, -10, 0, 20)
        title.Position = UDim2.new(0, 5, 0, 0)
        title.BackgroundTransparency = 1
        title.TextColor3 = Color3.fromRGB(255,255,255)
        title.Font = Enum.Font.Gotham
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.Parent = sliderFrame
        
        local bar = Instance.new("Frame")
        bar.Size = UDim2.new(1, -10, 0, 5)
        bar.Position = UDim2.new(0, 5, 0, 25)
        bar.BackgroundColor3 = Color3.fromRGB(60,60,60)
        bar.BorderSizePixel = 0
        bar.Parent = sliderFrame
        
        local fill = Instance.new("Frame")
        fill.Size = UDim2.new((default-min)/(max-min), 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(0,120,255)
        fill.BorderSizePixel = 0
        fill.Parent = bar
        
        local dragging2 = false
        bar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging2 = true
            end
        end)
        UIS.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging2 = false
            end
        end)
        
        uis.InputChanged:Connect(function(input)
            if dragging2 and input.UserInputType == Enum.UserInputType.MouseMovement then
                local rel = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                fill.Size = UDim2.new(rel, 0, 1, 0)
                local value = math.floor(min + (max-min)*rel)
                title.Text = name .. " (" .. value .. ")"
                callback(value)
            end
        end)
    end
        
    function TabAPI:AddDropdown(name, options, callback)
        local dropdown = Instance.new("TextButton")
        dropdown.Size = UDim2.new(1, -10, 0, 30)
        dropdown.BackgroundColor3 = Color3.fromRGB(40,40,40)
        dropdown.Text = name
        dropdown.TextColor3 = Color3.new(1,1,1)
        dropdown.Font = Enum.Font.Gotham
        dropdown.Parent = tabContent
        
        local listFrame = Instance.new("Frame")
        listFrame.Size = UDim2.new(1, -10, 0, 0)
        listFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
        listFrame.BorderSizePixel = 0
        listFrame.ClipsDescendants = true
        listFrame.Visible = false
        listFrame.Parent = tabContent
        
        local layout = Instance.new("UIListLayout")
        layout.Parent = listFrame

        local expanded = false
        dropdown.MouseButton1Click:Connect(function()
            expanded = not expanded
            listFrame.Visible = expanded
            listFrame.Size = UDim2.new(1, -10, 0, expanded and (#options * 25) or 0)
        end)
        
        for _,opt in ipairs(options) do
            local optBtn = Instance.new("TextButton")
            optBtn.Size = UDim2.new(1, 0, 0, 25)
            optBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
            optBtn.Text = opt
            optBtn.TextColor3 = Color3.new(1,1,1)
            optBtn.Font = Enum.Font.Gotham
            optBtn.Parent = listFrame
            optBtn.MouseButton1Click:Connect(function()
                dropdown.Text = name .. ": " .. opt
                callback(opt)
                expanded = false
                listFrame.Visible = false
            end)
        end
    end
        
    function TabAPI:AddLabel(text)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -10, 0, 25)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(255,255,255)
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = tabContent
    end

    function TabAPI:AddParagraph(header, content)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -10, 0, 80)
        frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
        frame.BorderSizePixel = 0
        frame.Parent = tabContent

        local headerLbl = Instance.new("TextLabel")
        headerLbl.Size = UDim2.new(1, -10, 0, 25)
        headerLbl.Position = UDim2.new(0,5,0,5)
        headerLbl.BackgroundTransparency = 1
        headerLbl.Text = header
        headerLbl.TextScaled = true
        headerLbl.TextColor3 = Color3.fromRGB(0,170,255)
        headerLbl.Font = Enum.Font.GothamBold
        headerLbl.Parent = frame

        local contentLbl = Instance.new("TextLabel")
        contentLbl.Size = UDim2.new(1, -10, 0, 50)
        contentLbl.Position = UDim2.new(0,5,0,30)
        contentLbl.BackgroundTransparency = 1
        contentLbl.Text = content
        contentLbl.TextWrapped = true
        contentLbl.TextYAlignment = Enum.TextYAlignment.Top
        contentLbl.Font = Enum.Font.Gotham
        contentLbl.TextColor3 = Color3.fromRGB(220,220,220)
        contentLbl.TextSize = 14
        contentLbl.Parent = frame
    end

    return TabAPI
end

return UILibrary
