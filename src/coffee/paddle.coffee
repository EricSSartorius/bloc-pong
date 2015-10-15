Paddle = (x, y, width, height) ->
	@x = x
	@y = y
	@width = width
	@height = height
	@y_speed = 0

Paddle::render = ->
	context.fillStyle = 'white'
	context.fillRect @x, @y, @width, @height

Paddle::goUp = ->
	@y_speed -= 1
	if @y_speed < -5
		@y_speed = -5

Paddle::goDown = ->
	@y_speed += 1
	if @y_speed > 5
		@y_speed = 5

Paddle::move = ->
	@y += @y_speed
	if @y < 0 
  		@y = 0
  		@y_speed = 0

  	else if @y > canvas.height - @height
  		@y = canvas.height - @height
  		@y_speed = 0