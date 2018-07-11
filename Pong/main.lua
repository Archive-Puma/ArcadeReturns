function love.load()
  Object = require("lib/classic")

  require("src/Pad")
  require("src/GameEngine")

  Game = GameEngine()
end

function love.update(dt)
  Game:update(dt)
end

function love.draw()
  Game:draw()
end
