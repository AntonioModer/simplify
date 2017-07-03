local class = require("simplify/MiddleClass")
local util = require("simplify/Utility")
local BaseGuiElement = require("simplify/Modules/BaseGuiElement")




local Frame = class("Frame", BaseGuiElement)


function Frame:initialize(width, height)
    self.BorderSizePixel = 0
    self.BorderColor = {r = 255, g = 255, b = 255}
    self.BorderTransparency = 255

    self["MouseButton1Down"] = util.CreateSignal()
    self["MouseButton1Up"] = util.CreateSignal()
    
    self["MouseButton2Up"] = util.CreateSignal()
    self["MouseButton2Down"] = util.CreateSignal()
    
    self["MouseButton3Up"] = util.CreateSignal()
    self["MouseButton3Down"] = util.CreateSignal()
    
    self["MouseEnter"] = util.CreateSignal()
    self["MouseLeave"] = util.CreateSignal()

     BaseGuiElement.initialize(self, width, height)
end


function Frame:Draw()
        --We draw rectangle underneath main Frame, it acts as borderline
        love.graphics.setColor(self.BorderColor.r, self.BorderColor.g, self.BorderColor.b)
        love.graphics.rectangle("fill",self.Position.X - (self.BorderSizePixel) , self.Position.Y - (self.BorderSizePixel),self.Size.X + (self.BorderSizePixel*2),self.Size.Y + (self.BorderSizePixel*2))
        
        love.graphics.setColor(self.BackgroundColor.r,self.BackgroundColor.g,self.BackgroundColor.b)
        love.graphics.rectangle("fill",self.Position.X, self.Position.Y,self.Size.X,self.Size.Y)
end


function Frame:SetBorderSizePixel(numValue)
    assert(type(numValue)=="number",'Property "BorderSizePixel", must be NumberValue!')
    self.BorderSizePixel = numValue
    self["Changed"]:Fire("BorderSizePixel")
end


function Frame:SetBorderColor(r,g,b)
    self.BorderColor.r = r
    self.BorderColor.g = g
    self.BorderColor.b = b
    self["Changed"]:Fire("BorderColor")
end

function Frame:SetBorderTransparency(numValue)
    assert(type(numValue)=="number",'Property "BorderTransparency", must be NumberValue!')
    self.BorderTransparency = numValue
    self["Changed"]:Fire("BorderTransparency")
end


function Frame:SetZIndex(value)
    self.ZIndex = value
end


return Frame
