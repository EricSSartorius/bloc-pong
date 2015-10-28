describe("Ball", function() {
  it("ball bounces off computer paddle", function() {
    window.canvas = {height:480};
    window.ball = new Ball();
    window.leftScore = 0;
    window.rightScore = 0;
    window.paddle = new Paddle(10, (canvas.height / 2 - 50), 10, 100);
    window.computer = new Computer();

    ball.x = computer.x;
    ball.x_speed = 1;
    ball.y = computer.y + 1;
    ball.move();

    expect(ball.x_speed).toBe(-2);
  });

  it("ball bounces off player paddle", function() {
    window.canvas = {height:480};
    window.ball = new Ball();

    var paddle = new Paddle();

    ball.move();
    paddle.move();

    expect(y_speed).toBe(y_speed*= -1);
  });
});
