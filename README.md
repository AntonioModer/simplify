# simplify
Simple Event-driven GUI toolkit for Löve2D.

## Documentation and Installation
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

    testbutton.MouseEnter:connect(function(x,y)
        print("Mouse Enteres at X: "..x.." Y:"..y)
    end)

end
```
