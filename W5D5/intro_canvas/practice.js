document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("myCanvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "black";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(250, 250, 50, 0, 2*Math.PI, true);
  ctx.strokeStyle = "grey";
  ctx.lineWidth = 25;
  ctx.stroke();
  ctx.fillStyle = "white";
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(100, 100);
  ctx.lineTo(250, 400);
  ctx.lineTo(400, 100);
  ctx.closePath();
  ctx.stroke();
});
