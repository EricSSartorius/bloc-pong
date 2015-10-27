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
      player.render();
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
      player.move();
      computer.move();
      return ball.move();
    };

    Game.prototype.start = function() {
      return this.animate()(this.step.bind(this));
    };

    Game.prototype.keepScore = function() {
      if (this.left_wall < 0) {
        rightScore += 1;
        return scoreBoard.innerText = "" + leftScore + " - " + rightScore;
      } else if (this.right_wall > canvas.width) {
        leftScore += 1;
        return scoreBoard.innerText = "" + leftScore + " - " + rightScore;
      }
    };

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
