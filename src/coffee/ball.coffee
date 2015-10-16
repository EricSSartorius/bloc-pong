window.Ball = (x, y) ->
	@x = x
	@y = y
	@radius = 7
	@x_speed = -3
	@y_speed = Math.floor(Math.random() * 7) + -3

Ball::move = ->
	console.log "Player x,y: #{player.x},#{player.y}"
	console.log "Computer x,y: #{computer.x},#{computer.y}"
	@x += @x_speed
	@y += @y_speed
	left_wall = @x - @radius
	right_wall = @x + @radius
	top_wall = @y - @radius
	bottom_wall = @y + @radius

	if top_wall < 0
		@y = @radius
		@y_speed = -@y_speed
	else if bottom_wall > canvas.height
		@y = canvas.height - @radius
		@y_speed = -@y_speed

	else if left_wall < 0
		rightScore += 1
		scoreBoard.innerText = "#{leftScore} - #{rightScore}"
		@x = canvas.width / 2
		@y = canvas.height / 2
		@x_speed = 3
		@y_speed = Math.floor(Math.random() * 7) + -3
	else if right_wall > canvas.width
		leftScore += 1
		scoreBoard.innerText = "#{leftScore} - #{rightScore}"
		@x = canvas.width / 2
		@y = canvas.height / 2
		@x_speed = -3
		@y_speed = Math.floor(Math.random() * 7) + -3

	if ball.x - @radius < player.x + player.width
		if ball.y > player.y and ball.y < player.y + player.height 
			console.log("player paddle hit")
	else if ball.x > computer.x
		if ball.y > computer.y and ball.y < computer.y + computer.height 
			console.log("computer paddle hit")
			#@x_speed = -3
			#@y_speed += (player.y_speed / 2)
			@x_speed = -@x_speed
	
	if leftScore == 11
		document.getElementById('winner').innerText = "Player 1 wins! Refresh to play again."
		@x_speed = 0
		@y_speed = 0
	else if rightScore == 11
		document.getElementById('winner').innerText = "Computer wins! Refresh to play again."
		@x_speed = 0
		@y_speed = 0

Ball::render = ->
	context.beginPath()
	context.arc @x, @y, @radius, 2 * Math.PI, false
	context.fillStyle = 'white'
	context.fill()