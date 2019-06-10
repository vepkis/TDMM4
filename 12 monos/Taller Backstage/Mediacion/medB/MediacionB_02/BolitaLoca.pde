class BolitaLoca

{
  float px, py, tam, movX, movY, limWInicial, limWFinal, limHInicial, limHFinal;
  color farbe;
  boolean cambiaPlano;

  BolitaLoca()
  {
    tam=20;
    px= random(width-tam); 
    py= random(height-tam); 
    movX=2;
    movY=movX*2;

    limWInicial=0;
    limWFinal=width;

    limHInicial=0;
    limHFinal= height;
    farbe= color(255, 100, 0, 255);
  }

  BolitaLoca(float limWIni_, float limHIni_, float limWFin_, float limHFin_)
  {
    tam=20;
    px= random(tam, limWFin_-tam); 
    py= random(tam, limHFin_-tam); 
    movX=3;
    movY=movX*2;

    limWInicial=limWIni_;
    limWFinal=limWFin_;

    limHInicial=limHIni_;
    limHFinal= limHFin_;
    farbe= color(255, 100, 0, 255);
  }

  void dibuja()
  {
    pushStyle();
    fill(farbe);
    ellipse(px, py, tam, tam);
    popStyle();

    //println("_PX___"+px+"___PY____"+py+"_____movY_"+movY);

    println("__WInicial__"+limWInicial+"__WFinal__"+limWFinal);
  }


  void setLimitesNuevos(float limWIni_, float limHIni_, float limWFin_, float limHFin_)
  {
    limWInicial=limWIni_;
    limWFinal=limWFin_;

    limHInicial=limHIni_;
    limHFinal= limHFin_;
  }

  void comportamiento()

  {
    println(tam+"__px__"+px+"__py__"+py);
    if ((px<=limWFinal-tam/2 && px>=limWInicial+tam/2) && (py <= limHFinal-tam/2 && py>=limHInicial+tam/2))
    {
      px+=movX;
      py+=movY;
    }
    if (px>limWFinal-tam || px<limWInicial+tam)
    {
      movX*=-1;
    }
    if (py>limHFinal-tam || py<limHInicial+tam)
    {
      movY*=-1;
    }
  }

  float [] getPosXY()

  {
    float [] pos= new float []{px, py}; 

    return pos;
  }

  float getTam()
  {
    return tam;
  }
}// cierra clase BolitaLoca
