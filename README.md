# simplify
Simple Event-driven GUI toolkit for Löve2D.

## Install
Simply download the folder, that i have provided and drop it into your root game directory.

## How to use, (Put this code below into you "main.lua" file)

```lua
function love.load()
  simplify = require("simplify")
end

function love.draw()
  simplify.engine.draw()
end

function love.mousemoved(x, y)
    simplify.engine.mousemoved(x, y)
end

function love.mousepressed(x,y,button,isTouch)
    simplify.engine.mousepressed(x, y, button, isTOuch)
end


function love.keypressed(key, scancode, isRepeat)
    simplify.engine.keypressed(key, scancode, isRepeat)
end

```

### Example's and what can this library do?

Supported GUI elements:Frame, TextButton, ImageButton

Also, every GUI element has "ZIndex" property, the default value is 1, you can change it with :SetZIndex(numberValue) method.


## Documentation
(https://github.com/mastermarkus/simplify/wiki)
