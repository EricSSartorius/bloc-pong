// Generated by CoffeeScript 1.7.1
(function() {
  window.Game = (function() {
    var height, width;

    function Game() {}

    width = 640;

    height = 480;

    canvas.width = width;

    canvas.height = height;

    Game.prototype.render = function() {
      context.fillStyle = "#000";
      context.fillRect(0, 0, width, height);
      paddle.render();
      computer.render();
      return ball.render();
    };

    Game.prototype.animate = function() {
      return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame || function(callback) {
        return window.setTimeout(callback, 1000 / 60);
      };
    };

    Game.prototype.update = function() {
      return computer.update();
    };

    Game.prototype.move = function() {
      paddle.move();
      computer.move();
      return ball.move();
    };

    Game.prototype.start = function() {
      return this.animate()(this.step.bind(this));
    };

    Game.prototype.keepScore = function() {
      var left_wall, right_wall;
      left_wall = ball.x - ball.radius;
      right_wall = ball.x + ball.radius;
      if (left_wall < 0) {
        rightScore += 1;
        scoreBoard.innerText = "" + leftScore + " - " + rightScore;
        return ball.reset();
      } else if (right_wall > canvas.width) {
        leftScore += 1;
        scoreBoard.innerText = "" + leftScore + " - " + rightScore;
        return ball.reset();
      }
    };

    if (Game.leftScore === 11) {
      document.getElementById('winner').innerText = "Player 1 wins! Refresh to play again.";
      Game.x_speed = 0;
      Game.y_speed = 0;
    } else if (Game.rightScore === 11) {
      document.getElementById('winner').innerText = "Computer wins! Refresh to play again.";
      Game.x_speed = 0;
      Game.y_speed = 0;
    }

    Game.prototype.step = function() {
      this.move();
      this.render();
      this.keepScore();
      this.update();
      return this.animate()(this.step.bind(this));
    };

    return Game;

  })();

}).call(this);
