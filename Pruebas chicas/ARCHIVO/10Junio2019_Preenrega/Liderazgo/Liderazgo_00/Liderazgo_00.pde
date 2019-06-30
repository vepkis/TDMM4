float px, py, tam, movX, movY, vel, comodin;

void setup()
{
  size(900, 400);

  px=40;
  py= height/2;
  tam=30;

  vel= 1;
  movX=1;
  movY= PI;
}
void draw ()
{
  background(200);
  movimiento();
  ellipse(px, py, tam, tam);
  println(py);
}


void movimiento()
{
  px+=movX;
  py+=sin(comodin)*3;

  comodin+=0.1;
}
