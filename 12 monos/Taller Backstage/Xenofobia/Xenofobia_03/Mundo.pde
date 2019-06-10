class Mundo
{
  Frontera f;
  ZonaColor zC;
  BolitaReactiva b;
  int cantBoli=2;

  BolitaReactiva [] bb22= new BolitaReactiva[cantBoli];

  float tamBoli= 40;

  Mundo()
  {

    f= new Frontera();
    zC=new ZonaColor(f.getPuertas()[0][2], f.getPuertas()[0][1], width, height);
    //    b= new BolitaReactiva(random(tamBoli, f.getPuertas()[0][0]-tamBoli), random(tamBoli, height-tamBoli), random (10, tamBoli),0, 0, f.getPuertas()[0][0], height);
    b= new BolitaReactiva(tamBoli, random(tamBoli, height-tamBoli), random (10, tamBoli), 0, 0, f.getPuertas()[0][0], height);
    for (int i=0; i< bb22.length; i++ )
    {
      bb22[i]= new BolitaReactiva(tamBoli, random(tamBoli, height-tamBoli), random (10, tamBoli), 0, 0, f.getPuertas()[0][0], height);
      bb22[i].setNum(int (random( b.getFarbeSize())));
    }
  }


  void dibuja()
  {
    f.dibuja();
    zC.dibuja();
    //    compBolita();
    //    b.dibuja();
    compBolitaCompleja();
    for (int i=0; i< bb22.length; i++ )
    {
      bb22[i].dibuja();
    }
  }

  void compBolita()
  {
    b.comportamientoB();
    if (b.getLugar()==false )
    {
      f.evaluaIngresante(b.getPosXY()[0], b.getPosXY()[1], getCondicionColor());
    }    
    if (f.getPermitePaso() && b.getLugar()==false )
    {
      b.setLimitesNuevos(0, 0, zC.getPosTam()[2], zC.getPosTam()[3]);
    }

    if (b.getPosXY()[0]>zC.getPosTam()[0]+b.getTam()*3)
    {
      b.setLimitesNuevos(zC.getPosTam()[0], zC.getPosTam()[1], zC.getPosTam()[2], zC.getPosTam()[3]);
      b.setLugar(true);
    }

    println(f.getPermitePaso() +"____"+b.getLugar());
  }

  void compBolitaCompleja()
  {
    for (int i=0; i< bb22.length; i++ )
    {
      bb22[i].comportamientoB();
      if (bb22[i].getLugar()==false )
      {
        f.evaluaIngresante(bb22[i].getPosXY()[0], bb22[i].getPosXY()[1], getCondicionColorCompleja()[i]);
      }    
      if (f.getPermitePaso() && bb22[i].getLugar()==false )
      {
        bb22[i].setLimitesNuevos(0, 0, zC.getPosTam()[2], zC.getPosTam()[3]);
      }

      if (bb22[i].getPosXY()[0]>zC.getPosTam()[0]+bb22[i].getTam()*3)
      {
        bb22[i].setLimitesNuevos(zC.getPosTam()[0], zC.getPosTam()[1], zC.getPosTam()[2], zC.getPosTam()[3]);
        bb22[i].setLugar(true);
      }
    }
    //    println(f.getPermitePaso() +"____"+b.getLugar());
  }




  ////////////////////////////////
  //R E I N I C I O  G E N E R A L
  ////////////////////////////////
  void reinicioGeneral()
  {
    f.reinicio();
    b.reinicio();
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
    reinicioGeneral();
  }
}//cierra class Mundo
