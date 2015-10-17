window.game = ->

	render = ->
	context.fillStyle = "#000"
	context.fillRect(0, 0, width, height)
	player.render()
	computer.render()
	ball.render()

	animate = window.requestAnimationFrame or window.webkitRequestAnimationFrame or window.mozRequestAnimationFrame or window.oRequestAnimationFrame or window.msRequestAnimationFrame or (callback) ->
	 	window.setTimeout callback, 1000 / 60

	update = ->
 		computer.update()

	move = ->
		player.move()
		computer.move()
		ball.move()

	keepScore = ->
		# if left_wall < 0
		# 	rightScore += 1
		# 	scoreBoard.innerText = "#{leftScore} - #{rightScore}"
		# 	@x = canvas.width / 2
		# 	@y = canvas.height / 2
		# 	@x_speed = 3
		# 	@y_speed = Math.floor(Math.random() * 7) + -3
		# else if right_wall > canvas.width
		# 	leftScore += 1
		# 	scoreBoard.innerText = "#{leftScore} - #{rightScore}"
		# 	@x = canvas.width / 2
		# 	@y = canvas.height / 2
		# 	@x_speed = -3
		# 	@y_speed = Math.floor(Math.random() * 7) + -3

	step = ->
		move()
		render()
		keepScore()
		update()
		animate(step)

	window.addEventListener 'keydown', (event) ->
		if event.keyCode == 38
			player.goUp()
		else if event.keyCode == 40
			player.goDown()