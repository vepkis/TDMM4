Esferas objeto;
int i =0;



void setup() {


  fullScreen();
  objeto = new Esferas();
  noStroke();
}



void draw() {
 // background(255);
  fondo(); 
  objeto.dibujar();

  objeto.mover(0, mouseX, mouseY);

  if (objeto.tocar(i) >= 0)
    println(objeto.tocar(i));
}
void fondo()
{
 pushStyle();
 fill(238, 100);
 rect(0, 0, width, height);
 popStyle();
}
