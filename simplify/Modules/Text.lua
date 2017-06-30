local class = require("simplify/MiddleClass")


--In Future Text class should inherit Position/Size/Events, Properties from BaseGuiElement class

local Text = class("Text")

function Text:initialize(Font, FontSize)
    self.Value = "Set text with :SetText(string) method"
    self.FontSize = 16
    self.FontFile = "simplify/Fonts/coolvetica rg.ttf"
    self.Font = love.graphics.newFont(self.FontFile, self.FontSize)
    self.Position = {X = 0 , Y = 0}
    self.TextColor = {r = 102, g = 204, b = 0}
    self.TextTransparency = 100
    self.BackgroundColor = {r = 102, g = 204, b = 0}
    self.BackgroundTransparency = 100
    self.Visible = true
    self.TextBounds = {X = self.Font:getWidth(self.Value), Y = self.Font:getHeight()}
    self.TextXAlignment = "Center"
    self.TextYAlignment = "Center"
end


function Text:Draw()
    if self.Visible == true then
        love.graphics.setColor(self.TextColor.r,self.TextColor.g,self.TextColor.b)
        love.graphics.setFont(self.Font)
        love.graphics.print(self.Value, self.Position.X, self.Position.Y)
    end
end


function Text:SetText(value)
    self.Value = tostring(value)
    self.TextBounds.X = self.Font:getWidth(self.Value)
    self.TextBounds.Y = self.Font:getHeight()
end


function Text:SetTextColor(r, g, b)
    self.TextColor.r = r
    self.TextColor.g = g
    self.TextColor.b = b
end


function Text:SetPosition(x, y)
    self.Position.X = x
    self.Position.Y = y
end


function Text:SetFontSize(value)
    assert(type(value)=="number", 'Property "FontSize", must be number value!')
    self.FontSize = value
    self.Font = love.graphics.newFont(self.FontFile, self.FontSize)
    --It's important to also update the TextBounds properties after we set new FontSize
    self.TextBounds.X, self.TextBounds.Y = self.Font:getWidth(self.Value), self.Font:getHeight()
end


function Text:SetNewFont(FontFile)
    self.Font = love.graphics.newFont(FontFile, self.FontSize)
    --Updating TextBounds after creating new font, cause different Fonts are scaled differently
    self.TextBounds.X, self.TextBounds.Y = self.Font:getWidth(self.Value), self.Font:getHeight()
end


function Text:GetTextBounds()
    return self.TextBounds.X, self.TextBounds.Y
end

return Text