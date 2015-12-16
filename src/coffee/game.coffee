class window.Game

	width = 640
	height = 480
	canvas.width = width
	canvas.height = height

	render: ->
		context.fillStyle = "#000"
		context.fillRect(0, 0, width, height)
		paddle.render()
		computer.render()
		ball.render()

	animate: ->
		window.requestAnimationFrame or window.webkitRequestAnimationFrame or window.mozRequestAnimationFrame or window.oRequestAnimationFrame or window.msRequestAnimationFrame or (callback) ->
	 	window.setTimeout callback, 1000 / 60

	update: ->
 		computer.update()

	move: ->
		paddle.move()
		computer.move()
		ball.move()

	start: ->
    	@animate()(@step.bind(@))

	keepScore: ->
    left_wall = ball.x - ball.radius
    right_wall = ball.x + ball.radius

    if left_wall < 0
      rightScore += 1
      scoreBoard.innerText = "#{leftScore} - #{rightScore}"
      ball.reset()
      if rightScore >= 11
      	document.getElementById('winner').innerText = "Computer wins! Refresh to play again."
      	ball.x_speed = 0
      	ball.y_speed = 0
    else if right_wall > canvas.width
      leftScore += 1
      scoreBoard.innerText = "#{leftScore} - #{rightScore}"
      ball.reset()
      if leftScore >= 11
      	document.getElementById('winner').innerText = "Player 1 wins! Refresh to play again."
      	ball.x_speed = 0
      	ball.y_speed = 0

	# if @leftScore >= 11
	# 	document.getElementById('winner').innerText = "Player 1 wins! Refresh to play again."
	# 	@x_speed = 0
	# 	@y_speed = 0
	# else if @rightScore >= 11
	# 	document.getElementById('winner').innerText = "Computer wins! Refresh to play again."
	# 	@x_speed = 0
	# 	@y_speed = 0

	step: ->
		@move()
		@render()
		@keepScore()
		@update()
		@animate()(@step.bind(@))
