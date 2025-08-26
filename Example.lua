local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/screengui/oceanlib/refs/heads/main/Library.lua",true))()

-- Create window
local Window = UILibrary:CreateWindow("My Hub Name")
local Tab = Window:CreateTab("Main")

Tab:AddButton("This is a button!", function()
    print("Button clicked!")
end)

Tab:AddToggle("This is a toggle!", false, function(state)
    print("Toggle is", state and "ON" or "OFF")
end)

Tab:AddTextbox("This is a textbox!", "Default", function(text)
    print("You typed:", text)
end)

local Tab2 = Window:CreateTab("Autofarm")

Tab2:AddSlider("This is a slider!", 0, 100, 50, function(v)
    print(v) 
end)

Tab2:AddDropdown("This is a dropdown!", {"Option 1","Option 2","Option 3"}, function(opt)
    print(opt) 
end)

Tab2:AddLabel("This is a simple label")

Tab2:AddParagraph("This is a paragraph!", "Line1\nLine2\nLine3")
