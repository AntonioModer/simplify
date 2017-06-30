
local util = require("simplify/Utility")
local class = require("MiddleClass")

--BaseClass for every GuiElement
local BaseGuiElement = class("BaseGuiElement")


function BaseGuiElement:initialize(width, height)
    --print(type(width), type(height))
    assert( type(width) == 'number' or width==nil and type(height)=='number' or height==nil, 'Width and height must be number values!')
    self.Size = {X = width or 100,Y = height or 100}
    self.Position = {X = 0 , Y = 0}
    self.Rotation = 0 
    self.BackgroundColor = {r = 255, g = 255, b = 255}
    self.Transparency = 100
    self.Visible = true
    self.ZIndex = 1
    self["Changed"] = util.CreateSignal()
end 



function BaseGuiElement:SetBackgroundColor(r,g,b)
    self.BackgroundColor.r = r
    self.BackgroundColor.g = g
    self.BackgroundColor.b = b
    self["Changed"]:Fire("BackgroundColor")
end


function BaseGuiElement:SetBackgroundTransparency(val)
    assert(type(val) == "number", "BackgroundTransparency value must be Number value!")
    self.Transparency = math.min(100, val)
    self["Changed"]:Fire("BackgroundTransparency")
end


function BaseGuiElement:SetSize(width, height)
    self.Size.X = width
    self.Size.Y = height
    self["Changed"]:Fire("Size")
end


function BaseGuiElement:SetPosition(x,y)
    self.Position.X = x
    self.Position.Y = y
    self["Changed"]:Fire("Position")
end


function BaseGuiElement:SetRotation(value)
    assert(type(value)=="number", error("Rotation of GuiElement should be NumberValue and in radians!"))
    self.Rotation = value
    self["Changed"]:Fire("Rotation")
end


function BaseGuiElement:SetVisible(boolValue)
    assert(type(bool) ~="bool", "Visible property can only be BoolValue!")
    self.Visible = boolValue
    self["Changed"]:Fire("Visible")
end


function BaseGuiElement:Destroy()
    self = nil
end

return BaseGuiElement