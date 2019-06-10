class Esferita
{
  float tx, ty, px, py, tam, pZonaX, pZonaY, pZonaTam, disty;
  float umbral, vel, angulo;
  color farbe= RGB;
  float alpha;
  Esferita()
  {
    pZonaX= width/2;
    pZonaY= height/2;
    pZonaTam= 100;
    farbe= color(255, 0, 0);
    alpha=255;
    px=width/2;
    py=height/2;
    tam=20;
    umbral=pZonaTam-tam;
    vel=1;
  }
  void dibuja()
  {
    distyDentroZona();
    pushMatrix();
    zona();
    esferita();
    popMatrix();
  }

  void zona()
  {
    pushStyle();
    fill(0);
    ellipse(pZonaX, pZonaY, pZonaTam, pZonaTam);
    popStyle();
  }
  void esferita() 
  {
    pushStyle();
    fill(farbe, alpha);
    ellipse(px, py, tam, tam);
    popStyle();
  }


  void distyDentroZona()
  {
    disty= dist(px, py, pZonaX, pZonaY);
    println(disty);
  }

  void sumaPunto()
  {
    if (disty<umbral)
    {
      pZonaX+=vel*cos(angulo);
      pZonaY+=vel*sin(angulo);
    }
  }

  void evaluaAvance()
  {   
    angulo = atan2( pZonaY-py, pZonaX-px );
    sumaPunto();
  }

  void setPxPy(float px_, float py_)
  {

    px= px_;
    py= py_;
  }

  void setpZonaXY(float pZonaX_, float pZonaY_)
  {
    pZonaX= pZonaX_;
    pZonaY= pZonaY_;
  }
}//cierra class Esferita
