int tipo;
boolean abierto=false;
float valor=PI;
void setup ()

{
  size(600, 600);
  smooth();
  // strokeWeight(20);
  noStroke();
}

void draw ()

{
  background(200);
  fill(0, 0, 200);
  arc(width/2, height/2, 100, 100, 0, valor, CHORD);
  fill(200);
  arc(width/2, height/2, 30, 30, valor, valor*2, CHORD);
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
