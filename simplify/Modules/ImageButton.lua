local class = require("simplify/MiddleClass")
local Button = require("simplify/Modules/Button")
local ImageLabel = require("simplify/Modules/ImageLabel")

local ImageButton = class("ImageButton", Button)

function ImageButton:initialize(width, height, img)
    self.ImageLabel = ImageLabel:new(img)
    Button.initialize(self, self.ImageLabel:GetWidth(), self.ImageLabel:GetHeight())
    self.ImageLabel:SetPosition(self.Position.X, self.Position.Y)
end


function ImageButton:SetPosition(x,y)
    self.Position.X = x
    self.Position.Y = y
    self.ImageLabel:SetPosition(x, y)
    self["Changed"]:Fire("Position")
end



function ImageButton:SetFilter(min, mag, anis)
    self.ImageObj:SetFilter(min, mag, anis)
end


function ImageButton:Draw()
        --We draw rectangle underneath main Frame, it acts as borderline
        love.graphics.setColor(self.BorderColor.r, self.BorderColor.g, self.BorderColor.b)
        love.graphics.rectangle("fill",self.Position.X - (self.BorderSizePixel) , self.Position.Y - (self.BorderSizePixel),self.Size.X + (self.BorderSizePixel*2),self.Size.Y + (self.BorderSizePixel*2))
        
        --The main frame
        --love.graphics.setColor(self.BackgroundColor.r,self.BackgroundColor.g,self.BackgroundColor.b)
        --love.graphics.rectangle("fill",self.Position.X, self.Position.Y,self.ImageLabel.Size.X,self.ImageLabel.Size.Y)

        --Drawing Image on top of  the main Frame
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(self.ImageLabel.ImageObj, self.Position.X, self.Position.Y)
end



return ImageButton