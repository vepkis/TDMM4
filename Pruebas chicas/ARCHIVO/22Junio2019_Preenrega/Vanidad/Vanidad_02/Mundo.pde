class Mundo
{

  // Espejo e= new Espejo();
  Espacio esp;
  color[] farbeLerp= {color(240, 240, 240), color(255, 100, 5) };

  Narciso nar;
  Narciso reflejoNar;
  float tamNar;

  Mundo()
  {
    tamNar=40;

    nar= new Narciso();
    reflejoNar= new  Narciso(tamNar*2, height/2, tamNar*2, 0);
    reflejoNar.setFarbe(farbeLerp[1]);
    // esp= new Espacio(0, 0, (width/3)-nar.getTam()+10, height, (width/3)-nar.getTam()+10, 0, width, height);
    esp= new Espacio(0, 0, (width/3)-nar.getTam()+10, height, (width/3)-nar.getTam()+10, 0, width, height, color(255, 255, 255), farbeLerp[0]);
    background(240);
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
