window.Ball = (x, y) ->
	@x = x
	@y = y
	@radius = 7
	@x_speed = -3
	@y_speed = Math.floor(Math.random() * 7) + -3

Ball::reset = ->
	ball.x = canvas.width / 2
	ball.y = canvas.height / 2
	ball.x_speed = 3
	ball.y_speed = Math.floor(Math.random() * 7) + -3

Ball::move = ->
	@x += @x_speed
	@y += @y_speed
	top_wall = @y - @radius
	bottom_wall = @y + @radius

	if top_wall < 0
		@y = @radius
		@y_speed = -@y_speed
	else if bottom_wall > canvas.height
		@y = canvas.height - @radius
		@y_speed = -@y_speed

	if ball.x_speed < 0 and ball.x - @radius < paddle.x + paddle.width and ball.y > paddle.y and ball.y < paddle.y + paddle.height
	  @x_speed = Math.abs(@x_speed)
	  if @y_speed > 0
	    @y_speed++
	  else
	    ball.y_speed--
	else if ball.x_speed > 0 and ball.x + @radius > computer.x and ball.y > computer.y and ball.y < computer.y + computer.height
	  @x_speed = -Math.abs(@x_speed)
	  @x_speed--	

Ball::render = ->
	context.beginPath()
	context.arc @x, @y, @radius, 2 * Math.PI, false
	context.fillStyle = 'white'
	context.fill()
