// Generated by CoffeeScript 1.7.1
(function() {
  window.Player = function() {
    return this.paddle1 = new Paddle(10, canvas.height / 2 - 50, 10, 100);
  };

  Player.prototype.render = function() {
    return this.paddle1.render();
  };

}).call(this);
