local class = require("simplify/MiddleClass")
local Button = require("simplify/Modules/Button")
local Text = require("simplify/Modules/Text")


--Inherits from Button

local TextButton = class("TextButton", Button)

function TextButton:initialize(width, height)
    self.Text = Text:new("simplify/Fonts/coolvetica rg.ttf", self.FontSize)
    self.ClipsDescendants = true --Not really working atm, will be useful in future
    Button.initialize(self, width, height)
end


local function UpdateTextPosition(button)
    local TextBoundX, TextBoundY = button:GetTextBounds()
    local text = button.Text
    

--TextXAlignment code
    if text.TextXAlignment == "Left" then
        text:SetPosition(button.Position.X, text.Position.Y)
    elseif text.TextXAlignment == "Center" then
            text:SetPosition( (button.Position.X + (button.Size.X/2)) - (TextBoundX/2)  , button.Position.Y) 
    elseif text.TextXAlignment == "Right" then
            text:SetPosition( (button.Position.X + button.Size.X) - TextBoundX, button.Position.Y)
    end

--TextYAlignment code
    if text.TextYAlignment == "Top" then
        text:SetPosition(text.Position.X, button.Position.Y)
        elseif text.TextYAlignment == "Center" then
                text:SetPosition(text.Position.X, (button.Position.Y + (button.Size.Y/2)- (TextBoundY/2)))
        elseif text.TextYAlignment == "Bottom" then
                text:SetPosition(text.Position.X, (button.Position.Y + button.Size.Y) - TextBoundY)
    end
end

--we need to overwrite the SetPosition method, cause we also have to update text position
function TextButton:SetPosition(x,y)
    self.Position.X = x
    self.Position.Y = y
    self["Changed"]:Fire("Position")
    UpdateTextPosition(self)
end


function TextButton:Draw()
         --We draw rectangle underneath main Frame, it acts as borderline
        love.graphics.setColor(self.BorderColor.r, self.BorderColor.g, self.BorderColor.b)
        love.graphics.rectangle("fill",self.Position.X - (self.BorderSizePixel) , self.Position.Y - (self.BorderSizePixel),self.Size.X + (self.BorderSizePixel*2),self.Size.Y + (self.BorderSizePixel*2))

        love.graphics.setColor(self.BackgroundColor.r,self.BackgroundColor.g,self.BackgroundColor.b)
        love.graphics.rectangle("fill",self.Position.X, self.Position.Y,self.Size.X,self.Size.Y)
        --Drawing text always after drawing Button so the text, is on top of Buttons
        self.Text:Draw()
end


function TextButton:GetTextBounds()
    return self.Text:GetTextBounds()
end


function TextButton:SetText(stringValue)
    self.Text:SetText(stringValue)
    UpdateTextPosition(self)
end


function TextButton:SetTextSize(numValue)
    if numValue > self.Size.Y then
        warn("TextSize cant be bigger than height of TextButton!")
        self.Text:SetTextSize(numValue)
    else
        self.Text:SetFontSize(numValue)
    end
    UpdateTextPosition(self) -- We need to re-position text according to it's new size and Alignment's
end


function TextButton:SetTextColor(r,g,b)
    self.Text:SetTextColor(r,g,b)
end


function TextButton:SetTextXAlignment(stringValue)
    --assert(string.lower(stringValue)~= ("left" or "center" or "right"), 'Property: "TextXAlignment" could only be: "left","center,"right" !')
    self.Text.TextXAlignment = stringValue
    UpdateTextPosition(self)
    self["Changed"]:Fire("TextXAlignment")
end


function TextButton:SetTextYAlignment(stringValue)
   -- assert(string.lower(stringValue)~= ("top" or "center" or "bottom"), 'Property: "TextYAlignment" could only be: "top","center,"bottom" !')
    self.Text.TextYAlignment = stringValue
    UpdateTextPosition(self)
    self["Changed"]:Fire("TextYAlignment") 
end



function TextButton:SetFont(font, fontSize)
    assert(type(fontName)~= "string", 'Property "Font", must be string value!')
    self.Text:SetNewFont(font~= nil and font or "simplify/Fonts/coolvetica rg.ttf", fontSize or self.Text.FontSize) 
end


--Fpr some weird reason we have to override this Metohd in this class
--When this Method was in "Frame" Class using :SetBorderColor seemed to effect other TextButton instances

function TextButton:SetBorderColor(r,g,b)
    self.BorderColor.r = r
    self.BorderColor.g = g
    self.BorderColor.b = b
    self["Changed"]:Fire("BorderColor")
end

return TextButton