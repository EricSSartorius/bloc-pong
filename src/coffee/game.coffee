window.game = ->
	render = ->
	context.fillStyle = "#000"
	context.fillRect(0, 0, width, height)
	player.render()
	computer.render()
	ball.render()

	animate = window.requestAnimationFrame or window.webkitRequestAnimationFrame or window.mozRequestAnimationFrame or window.oRequestAnimationFrame or window.msRequestAnimationFrame or (callback) ->
	 	window.setTimeout callback, 1000 / 60

	move= ->
		player.move()
		computer.move()
		ball.move()

	step= ->
		move()
		render()
		#scoreboard here
		animate(step)

	window.addEventListener 'keydown', (event) ->
		if event.keyCode == 38
			player.goUp()
		else if event.keyCode == 40
			player.goDown()