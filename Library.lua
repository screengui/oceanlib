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
    TitleLabel.Font = Enum.Font.SourceSansBold
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

    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0, 30, 0, 30)
    MinBtn.Position = UDim2.new(1, -65, 0.5, -15)
    MinBtn.Text = "_"
    MinBtn.BackgroundColor3 = Color3.fromRGB(200, 180, 50)
    MinBtn.TextColor3 = Color3.new(0,0,0)
    MinBtn.Parent = TitleBar
    MinBtn.ZIndex = 4

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
    CloseBtn.Text = "X"
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseBtn.TextColor3 = Color3.new(1,1,1)
    CloseBtn.Parent = TitleBar
    CloseBtn.ZIndex = 4

    local ReopenBtn = Instance.new("TextButton")
    ReopenBtn.Size = UDim2.new(0, 100, 0, 30)
    ReopenBtn.Position = UDim2.new(0.5, -50, 0, 0)
    ReopenBtn.Text = "Open GUI"
    ReopenBtn.BackgroundColor3 = Color3.fromRGB(40, 80, 240)
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
    local cfCorner = Instance.new("UICorner")
    cfCorner.CornerRadius = UDim.new(0, 10)
    cfCorner.Parent = ConfirmFrame

    local ConfirmLabel = Instance.new("TextLabel")
    ConfirmLabel.Size = UDim2.new(1, -20, 0, 40)
    ConfirmLabel.Position = UDim2.new(0, 10, 0, 10)
    ConfirmLabel.Text = "Do you really want to close?"
    ConfirmLabel.TextColor3 = Color3.new(1,1,1)
    ConfirmLabel.TextWrapped = true
    ConfirmLabel.BackgroundTransparency = 1
    ConfirmLabel.Parent = ConfirmFrame

    local YesBtn = Instance.new("TextButton")
    YesBtn.Size = UDim2.new(0.5, -15, 0, 30)
    YesBtn.Position = UDim2.new(0, 10, 1, -40)
    YesBtn.Text = "Yes"
    YesBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    YesBtn.TextColor3 = Color3.new(1,1,1)
    YesBtn.Parent = ConfirmFrame

    local NoBtn = Instance.new("TextButton")
    NoBtn.Size = UDim2.new(0.5, -15, 0, 30)
    NoBtn.Position = UDim2.new(0.5, 5, 1, -40)
    NoBtn.Text = "No"
    NoBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
    NoBtn.TextColor3 = Color3.new(1,1,1)
    NoBtn.Parent = ConfirmFrame

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

-- Create Tab
function UILibrary:CreateTab(name)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1, -10, 0, 30)
    TabButton.Position = UDim2.new(0, 5, 0, (#self.Tabs) * 35 + 15)
    TabButton.Text = name
    TabButton.BackgroundColor3 = Color3.fromRGB(70, 100, 220)
    TabButton.TextColor3 = Color3.new(1,1,1)
    TabButton.Parent = self.TabList

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

    -- Switching tabs
    TabButton.MouseButton1Click:Connect(function()
        for _,t in pairs(self.Tabs) do
            t.Content.Visible = false
        end
        ContentFrame.Visible = true
    end)

    -- Metatable for functions
    local TabAPI = {}
    function TabAPI:AddButton(text, callback)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(0, 200, 0, 30)
        Btn.Position = UDim2.new(0, 10, 0, #Tab.Elements * 35 + 10)
        Btn.Text = text
        Btn.BackgroundColor3 = Color3.fromRGB(90, 120, 240)
        Btn.TextColor3 = Color3.new(1,1,1)
        Btn.Parent = ContentFrame
        Btn.MouseButton1Click:Connect(callback)
        table.insert(Tab.Elements, Btn)
    end

    function TabAPI:AddToggle(text, default, callback)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(0, 200, 0, 30)
        Btn.Position = UDim2.new(0, 10, 0, #Tab.Elements * 35 + 10)
        Btn.Text = text .. ": " .. tostring(default)
        Btn.BackgroundColor3 = Color3.fromRGB(90, 120, 240)
        Btn.TextColor3 = Color3.new(1,1,1)
        Btn.Parent = ContentFrame
        local state = default
        Btn.MouseButton1Click:Connect(function()
            state = not state
            Btn.Text = text .. ": " .. tostring(state)
            callback(state)
        end)
        table.insert(Tab.Elements, Btn)
    end

    function TabAPI:AddTextbox(placeholder, default, callback)
        local Box = Instance.new("TextBox")
        Box.Size = UDim2.new(0, 200, 0, 30)
        Box.Position = UDim2.new(0, 10, 0, #Tab.Elements * 35 + 10)
        Box.PlaceholderText = placeholder
        Box.Text = default or ""
        Box.BackgroundColor3 = Color3.fromRGB(90, 120, 240)
        Box.TextColor3 = Color3.new(1,1,1)
        Box.Parent = ContentFrame
        Box.FocusLost:Connect(function(enter)
            if enter then
                callback(Box.Text)
            end
        end)
        table.insert(Tab.Elements, Box)
    end

    return TabAPI
end

return UILibrary
