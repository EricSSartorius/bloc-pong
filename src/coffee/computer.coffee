window.Computer = ->
	@paddle2 = new Paddle(620,  (canvas.height / 2 - 50), 10, 100)

Computer::render = ->
	@paddle2.render()