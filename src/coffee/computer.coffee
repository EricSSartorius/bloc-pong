window.Computer = ->
	@paddle2 = new Paddle(620,  (canvas.height / 2 - 50), 10, 100)

Computer::update =  ->
	if ball.y > computer.y + computer.height
		computer.goUp()
	else if ball.y < computer.y
		computer.goDown()
	else if ball.y > computer.y and ball.y < computer.y + computer.height
		computer.y_speed = 0

Computer::render = ->
	@paddle2.render()

