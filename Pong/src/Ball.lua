Ball = Object:extend()

local sound = {
  ping = love.audio.newSource("audio/ping.wav", "static"),
  pong = love.audio.newSource("audio/pong.wav", "static")
}

function Ball:new(init)
  self.length = 6
  self.isPaused = true
  self.x = ( love.graphics.getWidth() - self.length ) / 2
  self.y = ( love.graphics.getHeight() - self.length ) / 2
  self.speedX = 200
  self.speedY = 80
  if init == "left" then self.speedX = -self.speedX end
end

function Ball:update(dt, padLeft, padRight)
  if not self.isPaused then
    if self.y <= 0 or self.y + self.length >= love.graphics.getHeight() then self.speedY = -self.speedY end
    if self.y >= padLeft.y and self.y <= padLeft.y + padLeft.h and
      self.x >= padLeft.x and self.x <= padLeft.x + padLeft.w then
        self.speedX = math.abs(self.speedX)
        sound.ping:play()
    end
    if self.y >= padRight.y and self.y <= padRight.y + padRight.h and
      self.x + self.length >= padRight.x and self.x + self.length <= padRight.x + padRight.w then
        self.speedX = -math.abs(self.speedX)
        sound.pong:play()
    end
  
    self.speedX = self.speedX
    self.speedY = self.speedY

    self.x = self.x + self.speedX * dt
    self.y = self.y + self.speedY * dt
  end
end

function Ball:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.length, self.length)
end

return Ball
