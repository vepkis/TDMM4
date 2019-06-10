class Cardumen

{


  int cant=4;
  int radio;
  float [] sumaPX= new float[3];
  float [] sumaTam = new float [2];
  float [] sumaVel= new float [3];

  boolean hayMovimiento;
  float disty;


  Remoras [] remmy_0= new Remoras [cant];
  Remoras [] remmy_1= new Remoras [cant];
  Remoras [] remmy_2= new Remoras [cant];
  //  color [] farbe= {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)};
  color [] farbe= {color(255, 100, 0), color(125, 100, 100), color(30, 30, 30)};

  //int []alpha= {200, 200, 200};
  int []alpha= {200, 200, 200};

  Cardumen()
  {

    radio= 20;
    for (int i=0; i< cant; i++) {
      remmy_0[i]= new Remoras(width/2, height/2, radio, 0, radio, (360/cant)*i, farbe[0], alpha[0]);
      remmy_1[i]= new Remoras(width/2, height/2, radio, 0, radio/2, (360/cant)*i, farbe[1], alpha[1]);
      remmy_2[i]= new Remoras(width/2, height/2, radio, 0, radio/3, (360/cant)*i, farbe[2], alpha[2]);
    }
  }


  Cardumen(int cant_, float posX_, float posY_, int tam_)
  {
    cant=cant_;

    for (int i=0; i< cant; i++) {
      remmy_0[i]= new Remoras(posX_, posY_, radio, 0, tam_, (360/cant)*i, farbe[0], alpha[0]);
      remmy_1[i]= new Remoras(posX_, posY_, radio, 0, tam_, (360/cant)*i, farbe[1], alpha[1]);
      remmy_2[i]= new Remoras(posX_, posY_, radio, 0, tam_, (360/cant)*i, farbe[2], alpha[2]);
    } 
    radio= tam_;
  }




  void dibuja()
  {
    movimiento();
    // blendMode(MULTIPLY);// esto consume muchos recursos
    pushMatrix();
    //   translate(tx, ty);
    pushStyle();

    for (int i=0; i< cant; i++) {

      remmy_0[i].dibuja();  

      remmy_1[i].dibuja();  

      remmy_2[i].dibuja();
    }
    popStyle();
    popMatrix();
  }


  void movimiento()
  {

    if (hayMovimiento)

    {
      dilatacion();
    }
    if (!hayMovimiento)
    {
      contraccion();
    }

    for (int i=0; i< remmy_0.length; i++) {
      remmy_0[i].setPX(sumaPX[0]);
      remmy_1[i].setPX(sumaPX[1]);
      remmy_2[i].setPX(sumaPX[2]);

      // ______________tamaño
      remmy_1[i].setTam(sumaTam[0]);
      remmy_2[i].setTam(sumaTam[1]);

      // ______________rotacion
      remmy_0[i].setVel(sumaVel[0]);
      remmy_1[i].setVel(sumaVel[1]);
      remmy_2[i].setVel(sumaVel[1]);
    }
  }


  void dilatacion()
  {
    for (int i=0; i< remmy_0.length; i++) {
      if (remmy_0[i].getPX() < radio)
      {
        sumaPX[0]++;
      }

      if (remmy_1[i].getPX() < radio*2)
      {
        sumaPX[1]++;
      }

      if (remmy_2[i].getPX() < radio*3)
      {
        sumaPX[2]++;
      }

      // ______________tamaño
      if (remmy_1[i].getTam() > radio/2)
      {
        sumaTam[0]--;
      }
      if (remmy_2[i].getTam() > radio/3)
      {
        sumaTam[1]--;
      }

      // ______________VelocidadRotación
      sumaVel[0]+=0.1;
      sumaVel[1]+=0.2;
      sumaVel[2]+=0.3;

      // ______________Posicion

      remmy_0[i].setMovimiento();
      remmy_1[i].setMovimiento();
      remmy_2[i].setMovimiento();
    }
  }

  void contraccion()
  {
    for (int i=0; i< remmy_0.length; i++) {
      if (remmy_0[i].getPX() > 0)
      {
        sumaPX[0]--;
      }
      if (remmy_1[i].getPX() > 0)
      {
        sumaPX[1]--;
      }
      if (remmy_2[i].getPX() > 0)
      {
        sumaPX[2]--;
      }

      // ______________tamaño
      if (remmy_1[i].getTam() < radio)
      {
        sumaTam[0]++;
      }
      if (remmy_2[i].getTam() < radio)
      {
        sumaTam[1]++;
      }


      // ______________VelocidadRotación
      sumaVel[0]=0;
      sumaVel[1]=0;
      sumaVel[2]=0;
    }
  }


  void setTxTy()
  {
  }
  void calculaDistancia()
  {

    disty=dist (mouseX, mouseY, remmy_0[0].getTxTy()[0], remmy_0[0].getTxTy()[1]);

    println(disty);
  }



  boolean getHayMovimiento() {

    return hayMovimiento;
  }

  void mousePressed()
  {
    calculaDistancia();
    if (disty< remmy_0[0].getTam())
    {

      hayMovimiento=!hayMovimiento;
    }
  }
}//cierra clase Cardumen
