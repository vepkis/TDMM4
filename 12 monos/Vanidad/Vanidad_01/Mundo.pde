class Mundo
{

  // Espejo e= new Espejo();
  Espacio esp;
  color[] farbeLerp= new color [2];

  Narciso nar;
  Narciso reflejoNar;
  float tamNar;

  Mundo()
  {
    tamNar=40;
    farbeLerp[0]= color(240, 240, 240);  
    farbeLerp[1]= color(200, 0, 10);
    nar= new Narciso();
    reflejoNar= new  Narciso(tamNar*2, height/2, tamNar*2, 0);
    reflejoNar.setFarbe(color(200, 0, 10));
    // recibe (float zrPosX_, float zrPosY_, float zrTamAncho_, float zrTamAlto_, float zpPosX_, float zpPosY_, float zpTamAncho_, float zpTamAlto_)
    esp= new Espacio(0, 0, (width/3)-nar.getTam()+10, height, (width/3)-nar.getTam()+10, 0, width, height);
  }


  void dibuja()
  {
    esp.dibuja();
    nar.dibuja();
    reflejoNar.dibuja();
    // funcionEvaluadora();
    // e.dibuja();
  }

  /*
  void funcionEvaluadora()
   
   {
   if (  p.getMovPelotita()< p.getTam()*2.5)
   {
   e.setTam("crece");
   } else
   {
   e.setTam("nada");
   }
   }
   
   */

  void setMovReflejo()
  {

    float mappy= map(nar.getPxPy()[0], width-nar.getTam()*2, width/3+nar.getTam(), reflejoNar.getTam(), width/3- reflejoNar.getTam() );

    float mappyAlpha= map(nar.getPxPy()[0], width-nar.getTam()*2, width/3+nar.getTam(), 0, 50 );

    float mappyTam= map(nar.getPxPy()[0], width-nar.getTam()*2, width/3+nar.getTam(), 0, tamNar*3 );

    float mappylerpColor= map(nar.getPxPy()[0], width-nar.getTam(), width/3, 0, 99 );

    reflejoNar.setAlpha(mappyAlpha);
    reflejoNar.setPxPy(mappy, nar.getPxPy()[1]);
    reflejoNar.setTam(mappyTam);

    color interZpFarbe = lerpColor(farbeLerp[0], farbeLerp[1], mappylerpColor/100);
    color interNarFarbe=lerpColor(farbeLerp[1], farbeLerp[0], mappylerpColor/100);
    esp.setZpFarbe(interZpFarbe);
    nar.setFarbe(interNarFarbe);


    println(mappylerpColor/100);
  }

  void mouseDragged()
  {
    if (mouseX>width/3 && mouseX<width-nar.getTam())
    {
      nar.setPx(mouseX);
    }
    nar.setPy(mouseY);

    setMovReflejo();
  }

  void keyPressed()
  {
    //  e.keyPressed();
  }
}// cierra class mundo
