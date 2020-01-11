require "assets"

local MAX_BUNNYES = 8000
local BUNNY_COUNT = 0
local Bunny = require "Bunny"
local Pool = {}
local stats = love.graphics.getStats()
local batch = love.graphics.newSpriteBatch(bunny_sprite)

function love.load()
end
function love.draw()
  love.graphics.draw(batch, x, y)
  love.graphics.print("Bunnies:" .. #Pool, 10, 10)
  love.graphics.print("FPS:" .. love.timer.getFPS(), 10, 25)
  love.graphics.print("MEMORY:" .. stats.texturememory, 10, 40)
  love.graphics.print("CALLBACKS:" .. stats.drawcalls, 10, 55)
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
