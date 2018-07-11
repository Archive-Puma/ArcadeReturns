Pad = Object:extend()

function Pad:new(x, w, h)
  self.x = x
  self.y = (love.graphics.getHeight() - h) / 2
  self.w = w
  self.h = h
  self.speed = 100
end

function Pad:update(dt)
  if love.keyboard.isDown("s") and self.y < love.graphics.getHeight() - self.h then
    self.y = self.y + self.speed * dt
  end
  if love.keyboard.isDown("w") and self.y > 0 then
    self.y = self.y - self.speed * dt
  end
end

function Pad:draw()
  love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end

return Pad