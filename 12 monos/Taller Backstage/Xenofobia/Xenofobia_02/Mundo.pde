class Mundo
{
  Frontera f;
  ZonaColor zC;
  //BolitaLoca b;
  BolitaReactiva b;
  float tamBoli= 40;

  Mundo()
  {
    f= new Frontera();
    zC=new ZonaColor(f.getPuertas()[0][2], f.getPuertas()[0][1], width, height);
    //   b= new BolitaLoca(0, 0, f.getPuertas()[0][0], f.getPuertas()[1][3]);
    b= new BolitaReactiva(random(tamBoli, f.getPuertas()[0][0]-tamBoli), random(tamBoli, height-tamBoli), random (10, tamBoli));
    b.setLimitesNuevos(0, 0, f.getPuertas()[0][0], height);
  }


  void dibuja()
  {
    f.evaluaIngresante(b.getPosXY()[0], b.getPosXY()[1]);
    f.dibuja();
    zC.dibuja();
    compBolita();
    b.dibuja();
  }

  void compBolita()
  {
    b.comportamientoB();

    if (f.getDistyApertura()>80 && f.getDisty()<60 && b.getLugar()=="Izq" )
    {
      b.setLimitesNuevos(0, 0, zC.getPosTam()[2], zC.getPosTam()[3]);
    }

    if (b.getPosXY()[0]>zC.getPosTam()[0]+b.getTam()*3)
    {
      b.setLimitesNuevos(zC.getPosTam()[0], zC.getPosTam()[1], zC.getPosTam()[2], zC.getPosTam()[3]);
      b.setLugar("Der");
    }

    println(b.getLugar());
    //    println(evaDistFrontA());
  }
  float evaDistFrontA()
  {
    b.evaluaDistancia (f.getPuertas()[0][2], f.getPuertas()[0][3]);
    return b.getDisty();
  }

  float evaDistFrontB()
  {
    b.evaluaDistancia (f.getPuertas()[0][2], f.getPuertas()[0][3]);
    return b.getDisty();
  }

  /*
  float evaDistanciaFrontera()
   {
   if (b.getPosXY()[0]<f.getPuertas()[0][0])
   {
   }
   
   return dist(f.);
   }
   
   */
  void mousePressed ()
  {
    zC.mousePressed();
  }
}//cierra class Mundo
