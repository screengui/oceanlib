# Ocean Library Documentary!
Hello! Welcome to Ocean Library

### What is Ocean Library?
- Ocean Library is a Lightweight, mobile-friendly ui library that has all the necessary components for scripts.
- While it may not be much, more features would come in the future as Ocean Library is still in early development.

With that being said, let's get started on how to use the library.

### Booting up the Library
- This is necessary for the UI Library to work. It should be placed before anything else.

```lua
local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/screengui/oceanlib/refs/heads/main/Library.lua",true))()
local Window = UILibrary:CreateWindow("My Hub Name")
```

### Elements
- These are the core components of the library

- ### Tabs
  ```lua
  local Tab = Window:CreateTab("My Tab Name")
  ```
- These are the sections of the script. Tabs help organize the layout of the script.

- ### Buttons
  ```lua
  Tab:AddButton("Button Name", function()
    -- your function here
  end)
  ```
- Buttons execute whatever you put in them when you click them

- ### Toggles
  ```lua
  Tab:AddToggle("This is a toggle!", default <boolean>, function(state)
    print("Hello World!")
  end)
  ```
- These toggle whatever the function is inside them on and off.

- ### TextBoxes
  ```lua
  Tab:AddTextbox("This is a textbox!", "Default" <string>, function(text)
    print("You typed:", text)
  end)
  ```
- Used for storing strings

- ### Sliders
  ```lua
  Tab2:AddSlider("This is a slider!", min <num>, max <num>, default <boolean>, function(v)
    print(v)
  end)
  ```

- ### Dropdowns
  ```lua
  Tab2:AddDropdown("This is a dropdown!", {"Option 1","Option 2","Option 3"}, function(opt)
    print(opt)
  end)
  ```

- ### Labels
  ```lua
  Tab2:AddLabel("This is a simple label")
  ```

- ### Paragraphs

  ```lua
  Tab2:AddParagraph("This is a paragraph!", "Line1\nLine2\nLine3")
  ```
  
