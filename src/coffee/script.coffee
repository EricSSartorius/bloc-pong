canvas = document.getElementById("canvas")
width = 640
height = 480
canvas.width = width
canvas.height = height
context = canvas.getContext("2d")

Paddle = (x, y, width, height) ->
  @x = x
  @y = y
  @width = width
  @height = height

Paddle::render = ->
	context.fillStyle = 'white'
	context.fillRect @x, @y, @width, @height

Player = ->
	@paddle = new Paddle(10, 30, 10, 100)

Computer = ->
	@paddle = new Paddle(620, 30, 10, 100)

Player::render = ->
	@paddle.render()

Computer::render = ->
	@paddle.render()

Ball = (x, y) ->
	@x = x
	@y = y
	@radius = 10

Ball::render = ->
	context.beginPath()
	context.arc @x, @y, @radius, 2 * Math.PI, false
	context.fillStyle = 'white'
	context.fill()

player = new Player
computer = new Computer
ball = new Ball((canvas.width / 4), (canvas.height / 3))

render = ->
	context.fillStyle = "#000"
	context.fillRect(0, 0, width, height)
	#grid
	x = 0.5
	while x < 640
	  context.moveTo x, 0
	  context.lineTo x, 480
	  x += 10
	y = 0.5
	while y < 480
	  context.moveTo 0, y
	  context.lineTo 640, y
	  y += 10
	context.strokeStyle = "#666"
	context.stroke()
	#mid-line
	context.beginPath()
	context.moveTo(320, 0)
	context.lineTo(320, 480)
	context.lineWidth = 4
	context.strokeStyle = "#fff"
	context.stroke()

	player.render()
	computer.render()
	ball.render()

window.onload = ->
	render()