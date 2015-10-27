describe("Paddle", function() {
  it("moves up when up is pushed", function() {
    var paddle = new Paddle();
    var y = paddle.y;

    paddle.goUp();

    expect(paddle.y).toBe(y-1);
  });

  it("moves down when down is pushed", function() {
    var paddle = new Paddle();
    var y = paddle.y;

    paddle.goDown();

    expect(paddle.y).toBe(y+1);
  });
});