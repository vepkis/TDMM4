Esferas objeto;
int i =2;



void setup() {

  fullScreen();
  objeto = new Esferas();
  noStroke();
}



void draw() {
  background(255);
  objeto.dibujar();

  objeto.mover(i, mouseX, mouseY);

  if (objeto.tocar(i) >= 0)
    println(objeto.tocar(i));
}
