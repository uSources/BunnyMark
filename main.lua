require "assets"
local Bunny = require "Bunny"
local Pool = {}
local batch = love.graphics.newSpriteBatch(bunny_sprite)

function love.load()
end
function love.draw()
  love.graphics.print("Bunnies:" .. #Pool, 10, 10)
  love.graphics.print("FPS:" .. love.timer.getFPS(), 10, 20)
  love.graphics.draw(batch, x, y)
  print(#Pool)
end

function love.update(dt)
  batch:clear()
  for i, bunny in ipairs(Pool) do
    bunny:update(dt)
    batch:add(bunny.x, bunny.y)
  end

  if love.mouse.isDown(1) then
    local x, y = love.mouse.getPosition()
    table.insert(Pool, Bunny:create(x, y, 300))
  end
end
