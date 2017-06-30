
local Path = (...):gsub("%.", "/")


local Simplify = require("simplify/Simplify")

package.loaded["simplify"] = Simplify
--package.preload["simplify/Utility"] = assert(require("simplify/Utility"))
--package.preload["simplify/MiddleClass"] = assert(require("simplify/MiddleClass"))
--package.preload["simplify/Modules/BaseGuiElement"] = assert(require("simplify/Modules/BaseGuiElement"))
--package.preload["simplify/Modules/Frame"] = assert(require("simplify/Modules/Frame"))
--package.preload["simplify/Modules/Button"] = assert(require("simplify/Modules/Button"))
