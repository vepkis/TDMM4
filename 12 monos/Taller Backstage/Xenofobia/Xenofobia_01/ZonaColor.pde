class ZonaColor
{
  color [] zonaExclusiva= new color []{
    color(255, 0, 0), 
    color(0, 255, 0), 
    color(0, 0, 255), 
    color(255, 255, 0), 
    color(255, 0, 255), 
    color(0, 255, 255)
  };

  float alpha;
  float pw, px, py, pz;
  int num;

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
    alpha= 100;
  }  
  void dibuja()
  {
    pushStyle();
    fill (zonaExclusiva[num], alpha);
    rect(pw, px, py, pz);
    popStyle();
  }
  void setZonaColor(int num_)
  {
    num=num_;
  }

  void setAlpha(float alpha_)

  {
    alpha= alpha_;
  }


  void mousePressed ()
  {    
    if (mousePressed && mouseX<py && mouseX>pw)
    {
      num= ( num<zonaExclusiva.length-1? num+=1 : 0 );
    }
  }
}//cierra class ZonaColor
