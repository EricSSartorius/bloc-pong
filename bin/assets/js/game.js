// Generated by CoffeeScript 1.7.1
(function() {
  window.game = function() {
    var animate, keepScore, move, render, step, update;
    render = function() {};
    context.fillStyle = "#000";
    context.fillRect(0, 0, width, height);
    player.render();
    computer.render();
    ball.render();
    animate = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame || function(callback) {
      return window.setTimeout(callback, 1000 / 60);
    };
    update = function() {
      return computer.update();
    };
    move = function() {
      player.move();
      computer.move();
      return ball.move();
    };
    keepScore = function() {};
    step = function() {
      move();
      render();
      keepScore();
      update();
      return animate(step);
    };
    return window.addEventListener('keydown', function(event) {
      if (event.keyCode === 38) {
        return player.goUp();
      } else if (event.keyCode === 40) {
        return player.goDown();
      }
    });
  };

}).call(this);
