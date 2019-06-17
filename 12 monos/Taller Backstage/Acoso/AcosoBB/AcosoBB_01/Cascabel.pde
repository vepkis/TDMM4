class Cascabel
{
  float px, py, prePx, prePy, tam, pZonaX, pZonaY, pZonaTam, disty, distyCirculos;
  float umbral, vel, angulo;
  boolean movPermitido, movZona;
  String dir= null;


  color farbe= RGB;
  float alpha;
  Cascabel()
  {
    pZonaX= width/2;
    pZonaY= height/2;
    pZonaTam= width/4;

    px=width/2;
    py=height/2;
    prePx=px;
    prePy=py;
    tam=pZonaTam/3;
    umbral=pZonaTam-tam;
    vel=1;
    farbe= color(200, 0, 10);
    alpha=255;
  }

  Cascabel(float px_, float py_, float tam_, float alpha_)
  {
    tam= tam_;

    px=px_;
    py= py_;
    farbe= color(200, 0, 10);
    alpha= alpha_;
  }

  void dibuja()
  {
    zona();
    esferita();
    presion();
    detectaDir();
    //  accionaZona();
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
    fill(240, 5, 45);
    ellipse(px, py, tam, tam);
    popStyle();
  }

  void distyDentroZona()
  {
    disty= dist(mouseX, mouseY, pZonaX, pZonaY);
    //  println(disty+"______"+umbral+ "_________"+px);
  }

  void evalua()
  {
    distyDentroZona();
  }

  void sumaPunto()
  {  
    distyDentroZona();

    if (disty<umbral/2 )
    {
      px=mouseX;
      py=mouseY;
    }
  }

  void restaPunto()
  {  
    if (disty>tam/3 && disty<umbral)
    { 
      evaluaRegreso();

      px-=vel*cos(angulo);
      py-=vel*sin(angulo);
    }
  }

  void evaluaRegreso()
  {   
    angulo = atan2( py-prePy, px-prePx );
  }

  void presion()
  {
    if (mousePressed)
    {
      sumaPunto();
    } else
    {
      restaPunto();
      dir=null;
    }
  }

  void detectaDir()
  {
    if (px>prePx)
    {
      dir= "avanza";
    }
    if (px<prePx)
    {
      dir= "retrocede";
    }

    if (distyCirculos<=1)
    {
      dir= null;
    }

    distyCirculos= dist(px, py, pZonaX, pZonaY);

    println(disty+"__"+distyCirculos+"______"+dir);
  }

  /*
  void sumaPunto()
   {  
   distyDentroZona();
   
   if (disty<umbral/2 )
   {
   px=mouseX;
   py=mouseY;
   }
   }
   */

  void accionaZona()
  {
    if (dir== "avanza" && distyCirculos>tam/2 && distyCirculos<pZonaTam)
    {
      pZonaX+=vel*cos(angulo);
      pZonaY+=vel*sin(angulo);
    }

    if (dir== "retrocede" && distyCirculos>tam/2 && distyCirculos<pZonaTam)
    {
      pZonaX-=vel*cos(angulo);
      pZonaY-=vel*sin(angulo);
    }
  }

  void setPxPy(float px_, float py_)
  {

    px= px_;
    py= py_;
  }

  void setPx(float px_)
  {

    px=px_;
  }
  void setPy(float py_)
  {

    py=py_;
  }

  void setTam(float tam_)
  {
    tam=tam_;
  }

  void setFarbe(color farbe_)
  {
    farbe= farbe_;
  }

  void setAlpha(float alpha_)
  {
    alpha= alpha_;
  }


  float getTam()
  {
    return tam;
  }

  float [] getPxPy()
  {
    float [] pxy= new float []{px, py};
    return pxy;
  }

  float getAlpha()
  {
    return alpha;
  }
}//____ cierra class Narciso
