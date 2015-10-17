class window.Computer extends Paddle
  constructor: -> super(620,  (canvas.height / 2 - 50), 10, 100)

Computer::update =  ->
	if ball.y > @y + @height
		@goDown()
	else if ball.y < @y
		@goUp()
	else if ball.y > @y and ball.y < @y + @height
		@y_speed = 0

