class ZonaColor
{
  color [] farbe= new color []{
    color(200, 0, 0), 
    color(0, 200, 0), 
    color(0, 0, 200), 
    color(200, 200, 0), 
    color(200, 0, 200), 
    color(0, 200, 200)
  };

  float alpha;
  float pw, px, py, pz;
  int num;

  boolean inicio= true;

  ZonaColor()
  {
    rectMode(CORNERS);
  }

  ZonaColor(float pw_, float px_, float py_, float pz_)
  {
    rectMode(CORNERS);
    pw=pw_;
    px=px_;
    py=py_;
    pz=pz_;

    num=0;
    alpha= 150;
  }  
  void dibuja()
  {

    pushStyle();
    condicionInicial();
    popStyle();
  }

  void condicionInicial()
  {
    if (inicio)
    {
      fill (0, alpha);
      rect(pw, px, py, pz);
    } else
    {
      fill (farbe[num], alpha);
      rect(pw, px, py, pz);
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

  boolean getInicio()
  {
    return inicio;
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
