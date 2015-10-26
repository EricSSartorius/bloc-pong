canvas = document.getElementById("canvas")
window.context = canvas.getContext("2d")
window.leftScore = 0
window.rightScore = 0
window.scoreBoard = document.getElementById('score')
scoreBoard.innerText = "#{leftScore} - #{rightScore}"

window.player = new Paddle(10, (canvas.height / 2 - 50), 10, 100)
window.computer = new Computer
window.ball = new Ball((canvas.width / 2), (canvas.height / 2))

window.addEventListener 'keydown', (event) ->
	if event.keyCode == 38
		player.goUp()
	else if event.keyCode == 40
		player.goDown()

window.onload = ->
	game = new Game
	game.start()
