GameEngine = Object:extend()

function GameEngine:new()
  self.player1 = Pad(20, 10, 20)
end

function GameEngine:update(dt)
  self.player1:update(dt)
end

function GameEngine:draw()
  self.player1:draw()
end

return GameEngine