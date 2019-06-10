class Fantasmas
{
  float px, py, prePx, prePy, tam, pZonaX, pZonaY, pZonaTam, disty;
  float umbral, vel, angulo;
  boolean movPermitido;
  Fantasmas()
  {
    pZonaTam= 50;
    pZonaX=random(pZonaTam, width-pZonaTam);
    pZonaY= random(pZonaTam, height-pZonaTam);
  }
  Fantasmas(float pZonaX_,float pZonaY_, float pZonaTam_)
  {
    pZonaTam= pZonaTam_/4;
    pZonaX=pZonaX_;
    pZonaY= pZonaY_;
  }

  void dibuja()
  {
    nucleo();
  }

  void nucleo ()
  {
    ellipse(pZonaX, pZonaY, pZonaTam, pZonaTam);
  }
  
  
    float [] getPZonaXY()
  {
    float [] pZonaXY= new float [] {pZonaX, pZonaY};
    return pZonaXY;
  }
  
  
  float getpZonaTam ()
 {
  return pZonaTam; 
 }
  
  
  
}// cierra clase Fantasmas
