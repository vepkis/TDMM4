class Cardumen

{
  int cant=4;
  int radio;
  float [] sumaPX= new float[3];
  boolean hayMovimiento;

  Remoras rem;
  Remoras [] remmy_0= new Remoras [cant];
  Remoras [] remmy_1= new Remoras [cant];
  Remoras [] remmy_2= new Remoras [cant];
  color [] farbe= {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)};
  int []alpha= {255, 255, 255};
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
      remmy_1[i]= new Remoras(posX_, posY_, radio, 0, tam_/2, (360/cant)*i, farbe[1], alpha[1]);
      remmy_2[i]= new Remoras(posX_, posY_, radio, 0, tam_/3, (360/cant)*i, farbe[2], alpha[2]);
    } 
    radio= tam_;
  }




  void dibuja()
  {
    ellipse(width/2, height/2, 10, 10);
    if (hayMovimiento)
    {
      movimiento();
    }
    for (int i=0; i< cant; i++) {

      remmy_0[i].dibuja();  
      remmy_1[i].dibuja();  
      remmy_2[i].dibuja();
    }
    println(remmy_0[0].getPX()+"_______"+remmy_2[0].getPX());
  }


  void movimiento()
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

      //   remmy_0[i].setPX(sumaPX[0]);
      remmy_1[i].setPX(sumaPX[1]);
      remmy_2[i].setPX(sumaPX[2]);
    }
  }

  void mousePressed()
  {
    hayMovimiento=!hayMovimiento;
  }
}//cierra clase Cardumen
