class Cardumen

{


  int cant=4;
  int radio;
  float [] sumaPX= new float[4];
  float [] sumaTam = new float [3];
  float [] sumaVel= new float [4];

  boolean hayMovimiento;
  float disty;


  Remoras [] remmy_0= new Remoras [cant];
  Remoras [] remmy_1= new Remoras [cant];
  Remoras [] remmy_2= new Remoras [cant];
  Remoras [] remmy_3= new Remoras [cant];

  //  color [] farbe= {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)};
  color [] farbe= new color []{
    color(255, 50, 5), 

    //  color(140, 12, 0), 
    color(80, 80, 80), 
    color(30, 30, 30), 
    color(140, 12, 0), 

  };
  //int []alpha= {200, 200, 200};
  int []alpha= {200, 200, 200, 200};

  Cardumen()
  {

    radio= 20;
    for (int i=0; i< cant; i++) {
      remmy_0[i]= new Remoras(width/2, height/2, 0, 0, radio, (360/cant), farbe[0], alpha[0]);
      remmy_1[i]= new Remoras(width/2, height/2, 0, 0, radio/2, (360/cant), farbe[1], alpha[1]);
      remmy_2[i]= new Remoras(width/2, height/2, 0, 0, radio/3, (360/cant), farbe[2], alpha[2]);
      remmy_3[i]= new Remoras(width/2, height/2, 0, 0, radio/4, (360/cant), farbe[3], alpha[3]);
    }
  }


  Cardumen(int cant_, float posX_, float posY_, int tam_)
  {
    cant=cant_;
    radio= tam_;

    for (int i=0; i< cant; i++) {
      remmy_0[i]= new Remoras(posX_, posY_, radio, 0, tam_, (360/cant)*i, farbe[0], alpha[0]);
      remmy_1[i]= new Remoras(posX_, posY_, radio, 0, tam_, (360/cant)*i, farbe[1], alpha[1]);
      remmy_2[i]= new Remoras(posX_, posY_, radio, 0, tam_, (360/cant)*i, farbe[2], alpha[2]);
      remmy_3[i]= new Remoras(posX_, posY_, radio, 0, tam_, (360/cant)*i, farbe[3], alpha[3]);

      //  println(remmy_0[i].getMovSin()+"____"+remmy_1[i].getAngVel()+"____"+remmy_2[i].getAngVel()+"____"+remmy_3[i].getAngVel()+"____");
    }

    //   stroke(0, 200, 100);
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

      //    remmy_3[i].dibuja();
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
      remmy_3[i].setPX(sumaPX[3]);


      // ______________tamaño
      remmy_1[i].setTam(sumaTam[0]);
      remmy_2[i].setTam(sumaTam[1]);
      remmy_3[i].setTam(sumaTam[2]);

      // ______________rotacion
      remmy_0[i].setVel(sumaVel[0]);
      remmy_1[i].setVel(sumaVel[1]);
      remmy_2[i].setVel(sumaVel[1]);
      remmy_3[i].setVel(sumaVel[2]);
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
      if (remmy_3[i].getPX() < radio*4)
      {
        sumaPX[3]++;
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
      if (remmy_3[i].getTam() > radio/4)
      {
        sumaTam[2]--;
      }
      // ______________VelocidadRotación
      sumaVel[0]+=0.1;
      sumaVel[1]+=0.2;
      sumaVel[2]+=0.3;
      sumaVel[3]+=0.4;
      // ______________Posicion

      remmy_0[i].setMovimiento();
      remmy_1[i].setMovimiento();
      remmy_2[i].setMovimiento();
      remmy_3[i].setMovimiento();
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
      if (remmy_3[i].getPX() > 0)
      {
        sumaPX[3]--;
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
      if (remmy_3[i].getTam() < radio)
      {
        sumaTam[2]++;
      }

      // ______________VelocidadRotación
      sumaVel[i]=0;
    }
  }


  void setTxTy()
  {

    remmy_0[0].setTxTy(4, 0);
  }
  void calculaDistancia()
  {

    disty=dist (mouseX, mouseY, remmy_0[0].getTxTy()[0], remmy_0[0].getTxTy()[1]);

    //   println(disty);
  }
  void setHayMovimiento(boolean hayMovimiento_)
  {
    hayMovimiento=hayMovimiento_;
  }

  void setVel()
  {
  }



  float [] getZeroXY()
  {
    float [] zeroXY= {remmy_0[0].getTP()[0], remmy_0[0].getTP()[1]};
    return zeroXY;
  }

  float [] []getZeroCantXY()
  {
    float [] []zeroXY= new float [cant][2];
    for (int i=0; i< cant; i++)
    {
      for (int j=0; j<2; j++)
      {

        zeroXY[i][j] =remmy_0[i].getTP()[j];
      }
    }
    return zeroXY;
  }

  boolean getHayMovimiento() {

    return hayMovimiento;
  }

  void mousePressed()
  {

    for (int i=0; i< remmy_0.length; i++) {

      if (remmy_0[i].getInicio())
      {
        remmy_0[i].setInicio(false);
      }
      if (remmy_1[i].getInicio())
      {
        remmy_1[i].setInicio(false);
      }
      if (remmy_2[i].getInicio())
      {
        remmy_2[i].setInicio(false);
      }
      if (remmy_3[i].getInicio())
      {
        remmy_3[i].setInicio(false);
      }
    }

    calculaDistancia();
    if (disty< remmy_0[0].getTam())
    {

      hayMovimiento=!hayMovimiento;
    }
  }
}//cierra clase Cardumen
