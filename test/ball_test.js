describe("Ball", function() {
  it("ball bounces off computer paddle", function() {
    window.canvas = {height:480};
    window.ball = new Ball();

    var computer = new Computer();

    ball.move();
    computer.move();

    expect(y_speed).toBe(y_speed *= -1);
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