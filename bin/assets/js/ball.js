// Generated by CoffeeScript 1.7.1
(function() {
  window.Ball = function(x, y) {
    this.x = x;
    this.y = y;
    this.radius = 7;
    this.x_speed = -3;
    return this.y_speed = Math.floor(Math.random() * 7) + -3;
  };

  Ball.prototype.move = function() {
    var bottom_wall, left_wall, right_wall, top_wall;
    console.log("Player x,y: " + player.x + "," + player.y);
    console.log("Computer x,y: " + computer.x + "," + computer.y);
    this.x += this.x_speed;
    this.y += this.y_speed;
    left_wall = this.x - this.radius;
    right_wall = this.x + this.radius;
    top_wall = this.y - this.radius;
    bottom_wall = this.y + this.radius;
    if (top_wall < 0) {
      this.y = this.radius;
      this.y_speed = -this.y_speed;
    } else if (bottom_wall > canvas.height) {
      this.y = canvas.height - this.radius;
      this.y_speed = -this.y_speed;
    } else if (left_wall < 0) {
      rightScore += 1;
      scoreBoard.innerText = "" + leftScore + " - " + rightScore;
      this.x = canvas.width / 2;
      this.y = canvas.height / 2;
      this.x_speed = 3;
      this.y_speed = Math.floor(Math.random() * 7) + -3;
    } else if (right_wall > canvas.width) {
      leftScore += 1;
      scoreBoard.innerText = "" + leftScore + " - " + rightScore;
      this.x = canvas.width / 2;
      this.y = canvas.height / 2;
      this.x_speed = -3;
      this.y_speed = Math.floor(Math.random() * 7) + -3;
    }
    if (ball.x - this.radius < player.x + player.width) {
      if (ball.y > player.y && ball.y < player.y + player.height) {
        console.log("player paddle hit");
      }
    } else if (ball.x > computer.x) {
      if (ball.y > computer.y && ball.y < computer.y + computer.height) {
        console.log("computer paddle hit");
        this.x_speed = -this.x_speed;
      }
    }
    if (leftScore === 11) {
      document.getElementById('winner').innerText = "Player 1 wins! Refresh to play again.";
      this.x_speed = 0;
      return this.y_speed = 0;
    } else if (rightScore === 11) {
      document.getElementById('winner').innerText = "Computer wins! Refresh to play again.";
      this.x_speed = 0;
      return this.y_speed = 0;
    }
  };

  Ball.prototype.render = function() {
    context.beginPath();
    context.arc(this.x, this.y, this.radius, 2 * Math.PI, false);
    context.fillStyle = 'white';
    return context.fill();
  };

}).call(this);