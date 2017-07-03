# Simplify
**Simplify** is a simple Event-driven GUI library for Löve2D. With this library you can simply create GUI elements and listen for mouse and keyboard input. This library also support's ZIndex drawing order system, where you can specify the display order of GUI elements.

## Installation
Simply download the folder, that i have provided and drop it into your root game directory.


## Documentation
(https://github.com/mastermarkus/simplify/wiki)


## Quick example:

```lua
function love.load()

    local testbutton = simplify:TextButton(200,100)--size paramters
    --testbutton:SetSize(500,500) you can also set size at any time with :SetSize()
    testbutton:SetTextXAlignment("Center")-- "Left", "Center", "Right"
    testbutton:SetTextYAlignment("Center")-- "Top", "Center", "Bottom"
    testbutton:SetPosition(300,300)
    testbutton:SetText("Hello world!")
    testbutton:SetTextColor(0,0,255)--Blue text ,you cant set alpha with this method directly
    testbutton:SetBorderSizePixel(5)
    testbutton:SetBorderColor(255,0,0)
    testbutton:SetBackgroundColor(70,70,70) -- grey background
    

 
    testbutton.MouseButton1Down:connect(function(x,y)--return where mouse clicked on button
        print("Mouse Clicked at X: "..x.." Y:"..y)
    end)

    testbutton.MouseEnter:connect(function(x,y)--return where mouse entered on button
        print("Mouse Entered at X: "..x.." Y:"..y)
    end)

end
```
