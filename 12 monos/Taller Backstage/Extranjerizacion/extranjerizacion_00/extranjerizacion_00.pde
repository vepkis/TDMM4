Esferas objeto;
int i =2;



void setup() {

  //  fullScreen();
  ///---------------------
  fullScreen();
  orientation(PORTRAIT);
  ///---------------------
  objeto = new Esferas();
  noStroke();
}



void draw() {
  background(238);
  objeto.dibujar();


  if (objeto.tocar(i) >= 0)
    println(objeto.tocar(i));
}

void mouseDragged()
{
  objeto.mover(i, mouseX, mouseY);
}
