int tipo;
boolean abierto=false;
float valor=PI, rota, tope=90;
float  tx, ty;
void setup ()

{
  size(600, 600);

  tx=width/2;
  ty=height/2;

  smooth();
  // strokeWeight(20);
  noStroke();
}

void draw ()

{
  rotador();
  background(200);
  pushMatrix();
  translate(tx, ty);
  rotate(radians(rota));
  fill(0, 0, 200);
  arc(0, 0, 100, 100, 0, valor, CHORD);
  // fill(200);
  // arc(width/2, height/2, 30, 30, valor, valor*2, CHORD);
  popMatrix();

  fill(0);
  ellipse(width/2, height/2, 20, 20);
}

void rotador()
{
  if (mousePressed)
  {
    tx=mouseX;
    ty=mouseY;

    if (rota<tope)
    {
      rota+=2;
    }
  } else {
    if (rota>0)
    {
      rota-=2;
    }
  }
}



void keyPressed()
{

  if (abierto)
  {
    valor=PI;
    abierto=false;
  } else
  {
    valor=PI*2;
    abierto=true;
  }
  println(abierto);
}




void mouseDragged()
{
  tx=mouseX;
  ty=mouseY;

  if (rota<tope)
  {
    rota+=2;
  }
}

void mouseReleased()
{
  if (rota>0)
  {
    rota-=2;
  }
}
