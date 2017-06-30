local util = {}

function util.CreateSignal()
    local signal = {}
    signal.CallBack = nil

    function signal:connect(func)
        assert(type(func)=="function", ":connect callback must be function!")
        self.CallBack = func
    end

    function signal:Fire(...)
        if signal.CallBack ~= nil then
            signal.CallBack(...)
        end
    end

    return signal
end


function util.InBounds(mouseX,mouseY, UIElement)
     if (mouseX >= UIElement.Position.X and mouseX <= UIElement.Position.X + UIElement.Size.X) and (mouseY >= UIElement.Position.Y and mouseY <= UIElement.Position.Y + UIElement.Size.Y) then
        return true
    else 
        return false
    end
end


function util.GetMousePositionOnUI(mouseX,mouseY, GuiElement)
    local MouseXOnElement, MouseYOnElement = (mouseX - GuiElement.Position.X), (mouseY - GuiElement.Position.Y)
    return MouseXOnElement, MouseYOnElement
end


function util.IsValidImage(img)
    local success, message = pcall(function() love.graphics.newImage(img)end)
    return success
end


function util.spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end


return util