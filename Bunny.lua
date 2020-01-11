require "assets"
Bunny = {}
Bunny.__index = Bunny

function Bunny:create(x, y, speed)
    local o = {}
    setmetatable(o, Bunny)
    o.x = x or 1
    o.y = y or 1
    o.speed = math.random(-250, 250)
    o.color = {}
    o.color.r = math.random(0, 1)
    o.color.g = math.random(0, 1)
    o.color.b = math.random(0, 1)
    o.color.a = 1
    o.dirx = math.random(-1, 1)
    o.diry = math.random(-1, 1)
    return o
end

function Bunny:draw()
end

function Bunny:update(dt)
    if self.x < 0 then
        self.dirx = 1
    end
    if self.x > love.graphics.getWidth() - bunny_sprite:getWidth() then
        self.dirx = -1
    end

    if self.y < 0 then
        self.diry = 1
    end
    if self.y > love.graphics.getHeight() - bunny_sprite:getHeight() then
        self.diry = -1
    end

    self.x = self.x + (self.dirx * self.speed * dt)
    self.y = self.y + (self.diry * self.speed * dt)
end

return Bunny
