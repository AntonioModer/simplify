local util = require("simplify/Utility")
local Frame = require("simplify/Modules/Frame")
local class = require("simplify/MiddleClass")

--Inherits from Frame class
local Button = class("Button", Frame)

function Button:initialize(width, height)
    Frame.initialize(self, width, height)
end

function Button:GetDimensions()
    return self.Size.X, self.Size.Y
end

return Button
