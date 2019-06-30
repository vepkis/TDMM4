var m;

function setup() {
  createCanvas(800, 800);
  m= new Mundo(width/2, height/2, 50, 50);
  noStroke();
  smooth();
}


function draw() {
  background(20);

  fill(200, 0, 0);
  ellipse(mouseX, mouseY, 100, 100);

  m.dibuja();
  text("10", 100, 100);
  text(m.getPx(), 150, 100);
}

function mousePressed()
{
 m.setPx(3); 
}
