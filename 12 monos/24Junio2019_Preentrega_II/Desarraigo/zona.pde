class Zona {
  Circulo c1, c2, c3;
  boolean b1, b2;

  int cant1, cant2;

  String estado;
  Zona() {
    b1=false;
    b2=false;
    cant1=0;
    cant2=0;

    c1= new Circulo(width/2, height/2, 40, color(255, 100, 5));
    c2=new Circulo(width/2, height/2, 240, color(80, 80, 80));
    c3=new Circulo(width/2, height/2, 0, color(1, 153, 150));

    estado="inicio";
  }


  void dibujar() {


    c2.dibujar(); 
    c3.dibujar(); 
    c1.dibujar();
  }


  void activar1() {
    b1=true;
  } 
  void activar2() {
    b2=true;
  } 


  void moverC1(int x, int y) {

    //----------------------------------------------estado 1---------------------------------------------------------------
    if (estado.equals("inicio")) {
      if (dist(width/2, height/2, c1.posX(), c1.posY()) < 40) {
        if (c2.radio() > 190) {
          c2.decRadio();
        }
      }

      if (dist(width/2, height/2, c1.posX(), c1.posY()) < c2.radio()-c1.radio()) {
        c1.mover(x, y);
      } else if (dist(width/2, height/2, mouseX, mouseY) < c2.radio()-c1.radio()) {
        c1.mover(x, y);
        if (b1) {
          b1=false;
          cant1++;
          c2.incRadio();
        }
      }
    }
    //----------------------------------------------estado 2---------------------------------------------------------------
    if (estado.equals("segundo")) {     

      if (dist(width/2, height/2, c1.posX(), c1.posY()) < 190) {
        c1.mover(x, y);
      } else if (dist(width/2, height/2, mouseX, mouseY) < c3.radio()-c1.radio()) {
        c1.mover(x, y);
        if (b2) {

          b2=false;
          cant2++;
          c3.incRadio();
        }
      }

      if (dist(width/2, height/2, c1.posX(), c1.posY()) < 40) {
        if (c3.radio() > 190) {
          c3.decRadio();
        }
      }
    }

    //  println(cant2);
    //----------------------------------------------estado 3---------------------------------------------------------------
    //if (estado.equals("tercero")) {
    //}
  }


  void tamanio1() {
    if (cant1 > 4 ) {
      c2.incRadio();
      if (c2.radio>width) {
        estado = "segundo";
        c3.radio=240;
      }
    }
  }

  void tamanio2() {    
    if (cant2 > 5 ) {
      c3.incRadio();
      cant2=0;
    }

    if (c3.radio>width) {
      estado = "inicio";
      c3.radio=240;
    }
  }
}
