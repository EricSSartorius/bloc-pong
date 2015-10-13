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
	@y_speed = 0

Paddle::render = ->
	context.fillStyle = 'white'
	context.fillRect @x, @y, @width, @height

Paddle::goUp = ->
	@y_speed -= 1
	if @y_speed < -5
		@y_speed = -5

Paddle::goDown = ->
	@y_speed += 1
	if @y_speed > 5
		@y_speed = 5

Paddle::move = ->
	@y += @y_speed
	if @y < 0 
  		@y = 0
  		@y_speed = 0

  	else if @y > canvas.height - @height
  		@y = canvas.height - @height
  		@y_speed = 0

Player = ->
	@paddle = new Paddle(10, (canvas.height / 2 - 50), 10, 100)
Computer = ->
	@paddle = new Paddle(620,  (canvas.height / 2 - 50), 10, 100)

Player::render = ->
	@paddle.render()
Computer::render = ->
	@paddle.render()

Ball = (x, y) ->
	@x = x
	@y = y
	@radius = 10
	@x_speed = 3
	@y_speed = Math.floor(Math.random() * (3  + 3 + 1)) + -3

update = ->
  ball.update()
  return

Ball::move = ->
  @x += @x_speed
  @y += @y_speed
  return

Ball::render = ->
	context.beginPath()
	context.arc @x, @y, @radius, 2 * Math.PI, false
	context.fillStyle = 'white'
	context.fill()

player = new Player
computer = new Computer
ball = new Ball((canvas.width / 2), (canvas.height / 2))

render = ->
	context.fillStyle = "#000"
	context.fillRect(0, 0, width, height)
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

animate = window.requestAnimationFrame or window.webkitRequestAnimationFrame or window.mozRequestAnimationFrame or window.oRequestAnimationFrame or window.msRequestAnimationFrame or (callback) ->
 	window.setTimeout callback, 1000 / 60

move= ->
	player.move()
	computer.move()
	ball.move()

step= ->
	move()
	render()
	animate(step)

window.addEventListener 'keydown', (event) ->
	if event.keyCode == 38
		player.goUp()
	else if event.keyCode == 40
		player.goDown()

window.onload = ->
	animate(step)	