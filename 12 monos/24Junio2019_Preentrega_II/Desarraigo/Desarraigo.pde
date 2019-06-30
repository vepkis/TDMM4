Zona ob;

void setup() {

  fullScreen(); 

  ob=new Zona();
}



void draw() {
  fondo();
  ob.dibujar(); 
  noStroke();

  if (mousePressed) {
    ob.activar1(); 
    ob.activar2();
    ob.moverC1(mouseX, mouseY);
    ob.tamanio1();
    ob.tamanio2();
  }
}
void fondo() {
  pushStyle();
  fill(238, 100);
  rect(0, 0, width, height);
  popStyle();
}
