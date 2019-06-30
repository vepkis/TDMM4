class ZonaColor
{
  color [] farbe= new color []{
    color(255, 100, 5), 
    color(140, 12, 0), 
    color(80, 80, 80), 
    color(1, 153, 150), 

  };


  color cFondo= 238;

  float alpha;
  float pw, px, py, pz;
  float disty, umbralIngreso;
  boolean permitePaso;

  int num;

  boolean inicio= true;

  ZonaColor()
  {
    rectMode(CORNERS);
  }

  ZonaColor(float pw_, float px_, float py_, float pz_, float umbralIngreso_)
  {
    rectMode(CORNERS);
    pw=pw_;
    px=px_;
    py=py_;
    pz=pz_;

    num=0;
    alpha= 10;


    umbralIngreso=umbralIngreso_;
  }  

  ZonaColor(float pw_, float px_, float py_, float pz_)
  {
    rectMode(CORNERS);
    pw=pw_;
    px=px_;
    py=py_;
    pz=pz_;

    num=0;
    alpha= 80;
  } 
  void dibuja()
  {

    fondo();

    pushStyle();
    condicionInicial();
    popStyle();
  }

  void dibujaFrontera(boolean inicio_)
  {
    if (inicio_==false)
    { 
      pushStyle();

      fill (farbe[num], alpha);
      rect(pw, px, py, pz);
      popStyle();
    }
  }
  void fondo()
  {
    pushStyle();
    fill(238, 10);
    rect(0, 0, width, height);
    popStyle();
  }


  void condicionInicial()
  {
    if (inicio)
    {
      pushStyle();

      fill (30, 30, 30, alpha);
      rect(pw, px, py, pz);
      popStyle();
    } else
    {

      pushStyle();
      fill (farbe[num], alpha);
      rect(pw, px, py, pz);
      popStyle();
    }
  }

  void evaluaIngresante(float evaX_, float evaY_, boolean condicionColor)
  {


    if (condicionColor)
    {
      permitePaso=true;
    } else
    {
      permitePaso=false;
    }
  }

  void setZonaColor(int num_)
  {
    num=num_;
  }

  void setAlpha(float alpha_)

  {
    alpha= alpha_;
  }


  void setPosTam(float pw_, float px_, float py_, float pz_)
  {
    pw=pw_;
    px=px_;
    py=py_;
    pz=pz_;
  }

  float []  getPosTam()
  {
    float [] zona= new float[4];
    zona[0]=pw;
    zona[1]=px;
    zona[2]=py;
    zona[3]=pz;
    return zona;
  }

  color getFarbe()
  {
    return farbe[num];
  }

  int getNum()
  {
    return num;
  }

  boolean getInicio()
  {
    return inicio;
  }

  boolean getPermitePaso()
  {
    return permitePaso;
  }

  float getDisty()
  {
    return disty;
  }


  float  getEvaluaDistyNEW(float evaX_, float evaY_, float destinoY_)
  {
    float distyNEW= dist(evaX_, evaY_, pw, destinoY_);
    return distyNEW;
  }

  void mousePressed ()
  {    
    if (mousePressed && mouseX<py && mouseX>pw)
    {

      if (inicio==true)
      {
        inicio=false;
      }
      if (inicio==false)
      {

        num= ( num<farbe.length-1? num+=1 : 0 );
      }
    }
  }
}//cierra class ZonaColor
