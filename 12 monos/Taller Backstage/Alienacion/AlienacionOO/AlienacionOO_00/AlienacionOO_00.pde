Zona z;
int tam;
color col;

void setup () {
  // size (800,800);
  // fullScreen();
  ///---------------------
  fullScreen();
  orientation(PORTRAIT);
  ///---------------------

  ellipseMode (CENTER); 
  rectMode (CENTER); 
  z  = new Zona ();
  tam = 160;
  noStroke();
}

void draw () { 

  z.dibujar ();
  z.mover (); 
  z.actualizarC();
  z.actualizarB(); 
  z.actualizarA();
}

void mousePressed () { 
  if (mouseX <= width/2+ tam/2 && mouseY <= height/2+tam/2 && mouseX >= width/2 - tam/2 && mouseY >= height/2 - tam/2 ) {
    z.cambiaColorA();
    z.cambiaColorC();
    z.cambiaColorB();
  }
}
