require "assets"

local MAX_BUNNYES = 8000
local BUNNY_COUNT = 0
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
    batch:setColor(bunny.color.r, bunny.color.g, bunny.color.b, bunny.color.a)
    batch:add(bunny.x, bunny.y)
  end
end

function love.mousepressed(x, y, button, istouch)
  if button == 1 and MAX_BUNNYES > BUNNY_COUNT then
    for i = 1, 100 do
      BUNNY_COUNT = BUNNY_COUNT + 1
      local x, y = love.mouse.getPosition()
      table.insert(Pool, Bunny:create(x, y, 300))
    end
  end
end
