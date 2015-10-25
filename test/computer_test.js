describe("Computer", function() {
  it("moves up when ball is up", function() {
    window.canvas = {height:480};
    window.ball = new Ball();

    var computer = new Computer();
    var y = computer.y;
    ball.y = computer.y - 5;

    computer.update();
    computer.move();

    expect(computer.y).toBe(y-1);
  });

  it("moves down when ball is down", function() {
    window.canvas = {height:480};
    window.ball = new Ball();

    var computer = new Computer();
    var y = computer.y;
    ball.y = computer.y + 110;

    computer.update();
    computer.move();

    expect(computer.y).toBe(y+1);
  });
});
