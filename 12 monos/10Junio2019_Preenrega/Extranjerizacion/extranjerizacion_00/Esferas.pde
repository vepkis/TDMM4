class Esferas {
  Esfera[] esf;
  int i, e=-1;
  color aux; 
  color esf0;
  color esf1;
  color esf2;
  color esf3;
  color esf4;
  color esf5;
  color esf6;
  color esf7;
  color esf8;
  color esf9;



  Esferas() { 
    esf0 = color (#33FFF0, 90);
    esf1 = color (#FF4C33, 90);
    esf2 = color (#000000, 90);
    esf3 = color (#E333FF, 90);
    esf4 = color (#FFBE33, 90);
    esf5 = color (#FF339F, 90);
    esf6 = color (#3383FF, 90);
    esf7 = color (#FF8D33, 90);
    esf8 = color (#FFF633, 90);
    

    esf = new Esfera[9];   

    // IZQUIERDA SUPERIOR
    esf[0] = new Esfera(100, width/5, height/5, esf0);  

    // DERECHA SUPERIOR
    esf[1] = new Esfera(60, width/2 + width/3, height/5, esf1);   
    

    //MOUSE X MOUSE Y PUNTERO)
    esf[2] = new Esfera(50, width/2, height/2, esf2 );


    // IZQUIERDA INFERIOR
    esf[3] = new Esfera(40, width/5, height/2+height/4, esf3);

    // DERECHA INFERIOR
    esf[4] = new Esfera(20, width/2 + width/5, height/2+height/4, esf4);    

    //IZQUIERDA INFERIOR
    esf[5] = new Esfera(80, width/8, height/2+height/4, esf5);    

    // IZQUIERDA SUPERIOR
    esf[6] = new Esfera(80, width/11, height/5, esf6);


    // DERECHA SUPERIOR     
    esf[7] = new Esfera(70, width/2+ width/4, height/5, esf7);

    // DERECHA INFERIOR
    esf[8] = new Esfera(150, width/2 + width/3, height/2+height/4, esf8);
  }


  void dibujar() {

    for (i=0; i<9; i++)
      esf[i].dibujar();
  }   



  void mover(int i_, int px_, int py_) {

    esf[i_].mover(px_, py_);
  } 


  int tocar(int i_) {
    int retorno=-1;

    for (i=0; i<9; i++) {
      if (i != i_)
        if (dist(esf[i_].PosX(), esf[i_].PosY(), esf[i].PosX(), esf[i].PosY()) < esf[i_].Radio() + esf[i].Radio()) {
          retorno=i;  
          if (e != i) {
            e=i;

            aux= esf[i].col();
            esf[i].setColor(esf[i_].col());
            esf[i_].setColor(aux);
          }
        }
    }

    return retorno;
  }
}         
