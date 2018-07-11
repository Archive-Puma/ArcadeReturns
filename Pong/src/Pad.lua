Pad = Object:extend()

function Pad:new(align)
  local padding = 20
  self.w = 10
  self.h = 70
  self.x = align == "left" and self.w + padding or love.graphics.getWidth() - self.w * 2 - padding
  self.y = (love.graphics.getHeight() - self.h) / 2
  self.speed = 100
  self.keybind = align == "left" and { up = "w", down = "s" } or { up = "up", down = "down" }
end

function Pad:update(dt)
  if love.keyboard.isDown(self.keybind.down) and self.y < love.graphics.getHeight() - self.h then
    self.y = self.y + self.speed * dt
  end
  if love.keyboard.isDown(self.keybind.up) and self.y > 0 then
    self.y = self.y - self.speed * dt
  end
end

function Pad:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

return Pad