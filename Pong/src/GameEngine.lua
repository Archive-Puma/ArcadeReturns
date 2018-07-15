GameEngine = Object:extend()

local sound
local text = {}
local chunks = 27
local leftScore = 0
local rightScore = 0

function GameEngine:new()
  self.ball = Ball("left")
  self.player1 = Pad("left")
  self.player2 = Pad("right")

  text.size = 55
  text.font = love.graphics.newFont("font/ca.ttf", text.size)

  sound = love.audio.newSource("audio/point.wav", "static")
end

function drawField(chunks, h)
  local w = love.graphics.getHeight() / chunks
  for i = 0, love.graphics.getHeight(), 2 * w
  do
    love.graphics.rectangle("line", love.graphics.getWidth() / 2 - h / 2, i, h, w)
  end
end

function check(self)
  if self.ball.isPaused and love.keyboard.isDown("space") then
    self.ball.isPaused = false
  elseif self.ball.x <= 0 then
    rightScore = rightScore + 1
    self.ball = Ball("left")
    sound:play()
  elseif self.ball.x + self.ball.length >= love.graphics.getWidth() then
    leftScore = leftScore + 1
    self.ball = Ball("right")
    sound:play()
  end
end

function GameEngine:update(dt)
  self.player1:update(dt)
  self.player2:update(dt)
  self.ball:update(dt, self.player1, self.player2)
  check(self)
end

function GameEngine:draw()
  drawField(chunks, 2)
  love.graphics.setFont(text.font)
  love.graphics.setColor(255, 255, 255)
  love.graphics.print(leftScore, love.graphics.getWidth() / 4  - text.size / 2, text.size / 2)
  love.graphics.print(rightScore, love.graphics.getWidth() / 4 * 3 - text.size / 2, text.size / 2)
  self.player1:draw()
  self.player2:draw()
  self.ball:draw()
end

return GameEngine