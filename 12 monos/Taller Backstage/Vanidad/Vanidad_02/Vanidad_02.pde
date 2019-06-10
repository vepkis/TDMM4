Mundo m;

void setup ()
{
  //  size(800, 800, P3D);
  ///---------------------
  fullScreen();
  orientation(PORTRAIT);
  ///---------------------  
  m= new Mundo();
  noStroke();
  //  noCursor();
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
