local class = require("simplify/MiddleClass")
local Frame = require("simplify/Modules/Frame")
local util = require("simplify/Utility")

local ImageLabel = class("ImageLabel", Frame)


function ImageLabel:initialize(img)
    --if passed image is not nil then set the passed in image, else set default image from library
    self.ImageObj = love.graphics.newImage(util.IsValidImage(img) and img or "simplify/images/rectangle.png")
    self.ImageColor = {r = 255, g = 255, b = 255}
    Frame.initialize(self, self.ImageObj:getWidth(), self.ImageObj:getHeight())
    
end


function ImageLabel:Draw()
        --We draw rectangle underneath main Frame, it acts as borderline
        love.graphics.setColor(self.BorderColor.r, self.BorderColor.g, self.BorderColor.b, self.Visible == true and self.BorderTransparency or 0)
        love.graphics.rectangle("fill",self.Position.X - (self.BorderSizePixel) , self.Position.Y - (self.BorderSizePixel),self.Size.X + (self.BorderSizePixel*2),self.Size.Y + (self.BorderSizePixel*2))
        
        love.graphics.setColor(self.BackgroundColor.r,self.BackgroundColor.g,self.BackgroundColor.b)
        love.graphics.rectangle("fill",self.Position.X, self.Position.Y,self.Size.X,self.Size.Y)

        love.graphics.setColor(self.ImageColor.r, self.ImageColor.g, self.ImageColor.b, 255)
        love.graphics.draw(self.ImageObj, self.Position.X, self.Position.Y)
end


function ImageLabel:SetImage(img)
    self.Image = img
end


function ImageLabel:SetImageColor(r, g, b)
    self.ImageColor.r = r
    self.ImageColor.g = g
    self.ImageColor.b = g
end


function ImageLabel:SetFilter(min, mag, anis)
    self.Image:setFilter(min, mag, anis)
end


function ImageLabel:GetWidth()
    return self.ImageObj:getWidth()
end


function ImageLabel:GetHeight()
    return self.ImageObj:getHeight()
end


function ImageLabel:GetDimensions()
    return self.ImageObj:getDimensions()
end


return ImageLabel