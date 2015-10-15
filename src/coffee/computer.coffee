Computer = ->
	@paddle2 = new Paddle(620,  (canvas.height / 2 - 50), 10, 100)

Computer::render = ->
	@paddle2.render()

window.player = new Player
window.computer = new Computer
window.ball = new Ball((canvas.width / 2), (canvas.height / 2))