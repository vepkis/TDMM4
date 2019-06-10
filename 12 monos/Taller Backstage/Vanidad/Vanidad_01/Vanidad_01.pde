Mundo m;

void setup ()
{
  size(800, 800, P3D);

  m= new Mundo();
  noStroke();
//  noCursor();
  background(240);
  frameRate(75);
  smooth();
}


void draw ()

{

  m.dibuja();
}


void mouseDragged()
{
  m. mouseDragged();
}

void keyPressed()
{
  m.keyPressed();
}
