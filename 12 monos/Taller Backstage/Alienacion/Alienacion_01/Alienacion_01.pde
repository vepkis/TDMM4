Individue indi;
Individue indiPG;
void setup ()
{
  size(800, 800);
  indi= new Individue();

  background(5); 
  noStroke();
  indiPG= new Individue(width, height, 0, width/2, height/2, 200, color(200));
}

void draw ()

{
   pushStyle();
   fill(255);
   rect(0, 0, width, height);
   noFill();
   popStyle();
  //  indi.dibuja();
  indiPG.dibujaDos();
}

void keyPressed()
{
  // indi.setColor(random(200), 0, random(100), 20);
  indiPG.setColor(random(200), 0, random(100), 20);
}

void mouseDragged()
{
  indiPG.setPosicion(mouseX,mouseY);
}
