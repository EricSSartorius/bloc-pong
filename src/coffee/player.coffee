Player = ->
	@paddle1 = new Paddle(10, (canvas.height / 2 - 50), 10, 100)

Player::render = ->
	@paddle1.render()