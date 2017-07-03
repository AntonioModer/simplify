--Requiering All the GuiElements and other utility modules
--Right now the elements are registered to engine, when their construtors are called,
--but they should do the registering in BaseGuiElement class


local util = require("simplify/Utility")
local Frame = require("simplify/Modules/Frame")
local Button = require("simplify/Modules/Button") 
local TextButton = require("simplify/Modules/TextButton")
local ImageLabel = require("simplify/Modules/ImageLabel")
local ImageButton = require("simplify/Modules/ImageButton")

local engine = {}
engine.Elements = {}
engine.__index = engine

engine["LastMouseEnter"] = nil


function engine:RegisterElement(element)
    table.insert(self.Elements, element)
    --print('Number of gui elements in render list: '..#self.Elements)
end


function engine:UnregisterElement()
    for i,GuiElement in pairs(self.Elements) do
        table.remove(self.Elements, i)
    end
end


function engine:OnElementCreated(element)
    self:RegisterElement(element)
end



function engine.draw()
    --The Gui Elements are draw by ZIndex order from lowest to highest, because 
    --higher ones will be drawn on lower priority ones
    for k,v in util.spairs(engine.Elements, function(t,a,b) return t[b].ZIndex > t[a].ZIndex end) do
        if v.Visible then
            v:Draw()
        end
    end
end


function engine.keypressed(key, scancode, isRepeat)
    --print(tostring(key, print(isRepeat)))
end


function engine.mousepressed(x,y,button,isTOuch)
    for i,element in pairs(engine.Elements)do
        --Checking if mouse Inside UI Element
        if util.InBounds(x,y,element) then
            --print('mouse clicked gui object')
            local mousePosOnElementX, mousePosOnElementY = util.GetMousePositionOnUI(x,y, element)
            if button == 1 then
                element.MouseButton1Down:Fire(mousePosOnElementX, mousePosOnElementY)
                elseif button == 2 then
                element.MouseButton2Down:Fire(mousePosOnElementX, mousePosOnElementY)
                elseif button == 3 then
                element.MouseButton3Down:Fire(mousePosOnElementX, mousePosOnElementY)
            end
        end

    end
end


function engine.mousereleased( x, y, button, isTouch )
    for i,element in pairs(engine.Elements)do
        --Checking if mouse Inside UI Element
        if util.InBounds(x,y,element) then
            local mousePosOnElementX, mousePosOnElementY = util.GetMousePositionOnUI(x,y, element)
            if button == 1  then
                element.MouseButton1Up:Fire(mousePosOnElementX, mousePosOnElementY)
                elseif button == 2 then
                element.MouseButton2Up:Fire(mousePosOnElementX, mousePosOnElementY)
                elseif button == 3 then
                element.MouseButton3Up:Fire(mousePosOnElementX, mousePosOnElementY)
            end
            
        end
    end
end


function engine.mousemoved(x,y)
    for i,element in pairs(engine.Elements)do
        --Checking if mouse Inside UI Element
        if util.InBounds(x,y,element)then
            local mousePosOnElementX, mousePosOnElementY = util.GetMousePositionOnUI(x,y, element)
            --This acts like debounce, so we dont spam MouseEnter event while we are moving mouse inside ui element
            if element ~= engine["LastMouseEnter"] then
                element.MouseEnter:Fire(mousePosOnElementX, mousePosOnElementY)
                engine["LastMouseEnter"] = element
            end
            elseif engine["LastMouseEnter"] ~= nil and engine["LastMouseEnter"] == element then
                element["MouseLeave"]:Fire(x,y)
                engine["LastMouseEnter"] = nil
        end
    end
end



local library = {}
library.engine = setmetatable({},engine)

function library:Frame(width, height)
    local frame = Frame:new(width, height)
    self.engine:RegisterElement(frame)
    return frame
end


function library:TextButton(width, height)
    local textbutton = TextButton:new(width, height)
    self.engine:RegisterElement(textbutton)
    return textbutton
end


function library:ImageLabel(image)
    local imagelabel = ImageLabel:new(image)
    self.engine:RegisterElement(imagelabel)
    return imagelabel
end


function library:ImageButton(width, height, img)
    local imagebutton = ImageButton:new(width, height, img)
    self.engine:RegisterElement(imagebutton)
    return imagebutton
end


return library
