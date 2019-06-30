class Mundo
{

  ZonaColor zC;
  ZonaColor zCReact;
  BolitaReactiva b;

  int  tamBoli= 100;
  int    cantBoli=24;
  BolitaReactiva [] bb22= new BolitaReactiva[cantBoli];

  boolean cambiaComp[]= new boolean[cantBoli];

  float limA=width/2+width/3;
  float limB=0;
  float limC=width;
  float limD=height;


  Mundo()
  {
    zC=new ZonaColor(limA, limB, limC, limD, tamBoli*3);
    zCReact=new ZonaColor(limA-10, limB, limA, limD, tamBoli*3);

    for (int i=0; i< bb22.length; i++ )
    {
      bb22[i]= new BolitaReactiva(tamBoli/2, random(tamBoli, height-tamBoli), int(random (tamBoli/2, tamBoli)), 0, 0, limA, limD);
      bb22[i].setNum(int (random( bb22[0].getFarbeSize())));
      cambiaComp[i]=false;
    }
  }


  void dibuja()
  {
    zC.dibuja();
    setColorReactivo();
    zCReact.dibujaFrontera(zC.getInicio());

    compBolitaCompleja();
    comportamientoRechazo();
    for (int i=0; i< bb22.length; i++ )
    {
      bb22[i].dibuja();
    }

    println(zC.getInicio());
  }

  void compBolitaCompleja()
  {
    comportamientoConfort();

    for (int i=0; i< bb22.length; i++ )
    {

      bb22[i].comportamientoB();

      if (bb22[i].getLugar()==false && zC.getInicio()==false)
      {
        zC.evaluaIngresante(bb22[i].getPosXY()[0], bb22[i].getPosXY()[1], getCondicionColorCompleja()[i]);
      }
      if (zC.getPermitePaso() && bb22[i].getLugar()==false )
      {
        bb22[i].setLimitesNuevos(0, 0, zC.getPosTam()[2], zC.getPosTam()[3]);
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

  void comportamientoRechazo()
  {
    for (int i=0; i< bb22.length; i++ )
    {
      //   println (bb22[i].getTam()+"_____"+zC.getEvaluaDistyNEW(bb22[i].getPosXY()[0]+(bb22[i].getTam()/2), bb22[i].getPosXY()[1], bb22[i].getPosXY()[1]));
      if (getCondicionColorCompleja()[i]==false && bb22[i].getLugar()==false)
      {
        if (zC.getEvaluaDistyNEW(bb22[i].getPosXY()[0]+(bb22[i].getTam()/2), bb22[i].getPosXY()[1], bb22[i].getPosXY()[1])<bb22[i].getTam()/3)
        {
          bb22[i].comportamientoTam(true);
        } else
        {
          bb22[i].comportamientoTam(false);
        }
      }
    }
  }

  void setColorReactivo()
  {
    zCReact.setZonaColor(zC.getNum());
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
    zCReact.setAlpha(200);
  }

  void mouseReleased()
  {
    zCReact.setAlpha(40);
  }
}//cierra class Mundo
