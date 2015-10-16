canvas = document.getElementById("canvas")
width = 640
height = 480
canvas.width = width
canvas.height = height
window.context = canvas.getContext("2d")
window.leftScore = 0
window.rightScore = 0
window.scoreBoard = document.getElementById('score')
scoreBoard.innerText = "#{leftScore} - #{rightScore}"

window.player = new Player
window.computer = new Computer
window.ball = new Ball((canvas.width / 2), (canvas.height / 2))

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
	#
	animate(step)

window.addEventListener 'keydown', (event) ->
	if event.keyCode == 38
		player.goUp()
	else if event.keyCode == 40
		player.goDown()

window.onload = ->
	animate(step)	