class Esferita
{
  color [] farbe= new color []{
    color(255, 50, 5), 

    //  color(140, 12, 0), 
    color(80, 80, 80), 
    color(30, 30, 30), 

    color(245, 245, 245), 
    //  color(140, 12, 0), 

  };

  int num;

  float px, py, tam, disty;
  float umbral, vel, angulo;
  //  color farbe= RGB;
  float alpha;
  Esferita()
  {

    //   farbe= color(255, 100, 0);
    alpha=255;
    px=width/2;
    py=height/2;
    tam=40;
    umbral=tam*2;
    vel=1;
  }

  Esferita(float tam_, float alpha_)
  {

    //   farbe= color(255, 100, 0);
    alpha=alpha_;
    px=width/2;
    py=height/2;
    tam=tam_;
    umbral=tam*2;
    vel=1;
  }

  Esferita(float px_, float py_, float tam_, float alpha_)
  {

    num= int (random(1, farbe.length));
    alpha=alpha_;
    px=px_;
    py=py_;
    tam=tam_;
    umbral=tam*2;
    vel=1;
  }

  void dibuja()
  {
    esferita();
  }


  void sumaPunto()
  {
    if (disty<umbral)
    {
      px-=vel*cos(angulo);
      py-=vel*sin(angulo);
    }
  }

  void evaluaAvance(float otherX, float otherY)
  {   
    angulo = atan2( otherY-py, otherX-px );
    sumaPunto();
  }



  void esferita() 
  {
    pushStyle();
    fill (farbe[num], alpha);
    ellipse(px, py, tam+30, tam+30);
    popStyle();
  }


  float  disty(float otherX, float otherY)
  {
    disty= dist(px, py, otherX, otherY);
    //   println(disty);
    return disty;
  }

  void setPxy(float px_, float py_)
  {

    px= px_;
    py= py_;
  }

  void setUmbral(float umbral_)
  {
    umbral=umbral_;
  }


  void setVel(float vel_)
  {
    vel= vel_;
  }

  void setSumaVel(float vel_)
  {
    vel+= vel_;
  }

  void setZonaColor(int num_)
  {
    num=num_;
  }

  void setTam(float tam_)
  {
    tam=tam_;
  }

  float [] getPxy()

  {
    float []pXY= new float []{px, py};
    return pXY;
  }
  float getTam()
  {
    return tam;
  }

  float getDisty()

  {
    return disty;
  }


  float getUmbral()
  {
    return umbral;
  }
}//cierra class Esferita
