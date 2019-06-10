class Mundo
{
  Frontera f;

  ZonaColor zC;
  BolitaReactiva b;
  // int cantBoli;

  int  tamBoli= 40;
  int    cantBoli=5;
  BolitaReactiva [] bb22= new BolitaReactiva[cantBoli];

  //  int tamBoli;

  boolean cambiaComp[]= new boolean[cantBoli];
  Mundo()
  {



    f= new Frontera(tamBoli*3);
    zC=new ZonaColor(f.getA()[0], f.getB()[0], width, height);
    //    b= new BolitaReactiva(random(tamBoli, f.getPuertas()[0][0]-tamBoli), random(tamBoli, height-tamBoli), random (10, tamBoli),0, 0, f.getPuertas()[0][0], height);
    // b= new BolitaReactiva(tamBoli, random(tamBoli, height-tamBoli), int(random (10, tamBoli)), 0, 0, f.getA()[0], height);
    for (int i=0; i< bb22.length; i++ )
    {
      bb22[i]= new BolitaReactiva(tamBoli, random(tamBoli, height-tamBoli), int(random (tamBoli, tamBoli*2)), 0, 0, f.getA()[0], height);
      bb22[i].setNum(int (random( bb22[0].getFarbeSize())));
      cambiaComp[i]=false;
    }
  }


  void dibuja()
  {
    //    f.dibuja();
    zC.dibuja();
    //    compBolita();
    //    b.dibuja();
    compBolitaCompleja();
    for (int i=0; i< bb22.length; i++ )
    {
      bb22[i].dibuja();
    }
  }

  void compBolitaCompleja()
  {
    comportamientoConfort();

    for (int i=0; i< bb22.length; i++ )
    {

      bb22[i].comportamientoB();

      if (bb22[i].getLugar()==false && zC.getInicio()==false)
      {
        f.evaluaIngresante(bb22[i].getPosXY()[0], bb22[i].getPosXY()[1], getCondicionColorCompleja()[i]);
      }    
      for (int h=0; h< f.getA().length; h++ )
      {
        if (f.getPermitePaso()[h] && bb22[i].getLugar()==false )
        {
          bb22[i].setLimitesNuevos(0, 0, zC.getPosTam()[2], zC.getPosTam()[3]);
        }
      }
      if (bb22[i].getPosXY()[0]>zC.getPosTam()[0]+bb22[i].getTam()*2)
      {
        bb22[i].setLimitesNuevos(zC.getPosTam()[0], zC.getPosTam()[1], zC.getPosTam()[2], zC.getPosTam()[3]);
        bb22[i].setLugar(true);
      }
    }
  }

  void comportamientoConfort()
  {

    for (int i=0; i< bb22.length; i++ )
    {
      if (bb22[i].getLugar() && cambiaComp[i]==false)
      {
        bb22[i].setMovXY(  2, 1);
        cambiaComp[i]=true;
      }
    }
  }


  ////////////////////////////////
  //R E I N I C I O  G E N E R A L
  ////////////////////////////////
  void reinicioGeneral()
  {
    // f.reinicio();
    for (int i=0; i< bb22.length; i++ )
    {
      if (!getCondicionColorCompleja()[i] && bb22[i].getLugar()==true ) {
        bb22[i].reinicio();
      }
      cambiaComp[i]=false;
    }
  }
  //--------------------------------------------v    _G e t t e r s

  boolean getCondicionColor()

  {
    boolean condicionColor_= (b.getFarbe() == zC.getFarbe()? true:false);
    return condicionColor_;
  }

  boolean []getCondicionColorCompleja()

  {
    boolean [] condicionColor_= new boolean [bb22.length];
    for (int i=0; i< bb22.length; i++ )
    {
      condicionColor_[i]= (bb22[i].getFarbe() == zC.getFarbe()? true:false);
    }
    return condicionColor_;
  }


  void mousePressed ()
  {
    zC.mousePressed();
    if (zC.getInicio()==false)
    {   
      reinicioGeneral();
    }
  }
}//cierra class Mundo
