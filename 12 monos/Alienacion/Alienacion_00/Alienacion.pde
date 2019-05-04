Individue indi;

void setup ()
{
  size(800, 800);
  indi= new Individue();

  background(255); 
  noStroke();
}

void draw ()

{
  pushStyle();
  fill(255, 40);
  rect(0, 0, width, height);
  noFill();
  popStyle();
  indi.dibuja();
}

void keyPressed()
{
  indi.setColor(random(200), 0, random(100), 20);
}
