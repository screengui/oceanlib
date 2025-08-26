-- ModuleScript: UILibrary
local UIS = game:GetService("UserInputService")

local UILibrary = {}
UILibrary.__index = UILibrary


-- Create window
function UILibrary:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 500, 0, 300)
    Main.Position = UDim2.new(0.3, 0, 0.3, 0)
    Main.BackgroundColor3 = Color3.fromRGB(30, 60, 200)
    Main.Active = true
    Main.Parent = ScreenGui
    
    local DragBar = Instance.new("Frame")
    DragBar.Size = UDim2.new(1, 0, 0, 30) -- only top 30 pixels
    DragBar.BackgroundTransparency = 1 -- invisible
    DragBar.Parent = Main
    DragBar.Active = true
    DragBar.Draggable = true
    
    local dragging = false
    local dragInput, dragStart, startPos

    Main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    Main.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
                Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
    end)

    -- Tab list (scrollable)
    local TabList = Instance.new("ScrollingFrame")
    TabList.Size = UDim2.new(0, 120, 1, 0)
    TabList.BackgroundColor3 = Color3.fromRGB(20, 40, 120)
    TabList.ScrollBarThickness = 5
    TabList.CanvasSize = UDim2.new(0,0,0,0)
    TabList.Parent = Main

    -- Tab contents (scrollable)
    local TabContent = Instance.new("ScrollingFrame")
    TabContent.Size = UDim2.new(1, -120, 1, 0)
    TabContent.Position = UDim2.new(0, 120, 0, 0)
    TabContent.BackgroundColor3 = Color3.fromRGB(40, 80, 240)
    TabContent.ScrollBarThickness = 5
    TabContent.CanvasSize = UDim2.new(0,0,0,0)
    TabContent.Parent = Main

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
    TabButton.Position = UDim2.new(0, 5, 0, (#self.Tabs) * 35 + 5)
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
