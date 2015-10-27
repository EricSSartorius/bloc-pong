describe("Paddle", function() {
  it("moves up when up key is pushed", function() {
    var paddle = new Paddle();
    var y_speed = paddle.y_speed;

    paddle.goUp();

    expect(paddle.y_speed).toBe(y_speed-1);
  });

  it("moves down when down key is pushed", function() {
    var paddle = new Paddle();
    var y_speed = paddle.y_speed; 

    paddle.goDown();

    expect(paddle.y_speed).toBe(y_speed+1);
  });
});