class BolitaReactiva
{

  float posX, posY, tam, pPosX, pPosY, vel, pVel;
  float angulo, anguloRegreso;
  float  disty, distyRegreso, dir, umbral;
  int crono, umbralCrono=4;
  boolean despierta= true;

  color [] farbe= new color []{
    color(255, 50, 5), 

    color(80, 80, 80), 
    color(30, 30, 30), 

    color(245, 245, 245), 

  };

  int num;
  float alpha, pAlpha;


  BolitaReactiva()
  {
    tam= random(20, 40);
    posX=random(tam, width-tam);
    posY=random(tam, height-tam);
    vel=4;
    pVel= vel;
    disty=0;

    umbral=10;

    pPosX=posX;
    pPosY=posY;
    noStroke();
    num=1;
    alpha=200;
    pAlpha=alpha;
  }

  BolitaReactiva(float posX_, float posY_)
  {
    tam= random(10, 40);
    posX=posX_;
    posY=posY_;
    vel=2;
    pVel= vel;

    disty=0;

    umbral=5;


    pPosX=posX;
    pPosY=posY;
    noStroke();
    pAlpha=alpha;
  }

  BolitaReactiva(float px_, float py_, float tam_)
  {
    posX= px_;
    posY= py_;
    vel=0.2;
    pVel= vel;

    tam=tam_;
    disty=0;

    umbral=5;

    noStroke();
    pAlpha=alpha;
  }


  BolitaReactiva(float vel_)
  {
    tam= random(10, 40);
    posX=random(tam, width-tam);
    posY=random(tam, height-tam);
    vel=vel_;
    pVel= vel;

    disty=0;

    umbral=9;

    pPosX=posX;
    pPosY=posY;
    noStroke();
    pAlpha=alpha;
  }


  void dibuja()

  {

    if (despierta)
    {
      fill (farbe[num], alpha);
      ellipse(posX, posY, tam+30, tam+30);
    } else {
      tiempoSiesta();
    }
  }



  void setPosXY(float posX_, float posY_)
  {
    posX= posX_;
    posY=posY_;
  }

  void setPosXYPrevia(float pPosX_, float pPosY_)
  {
    pPosX= pPosX_;
    pPosY=pPosY_;
  }
  void setSumaPosXY(float posX_, float posY_)
  {

    posX+= posX_;
    posY+=posY_;
  }
  void sumaPunto()
  {
    if (disty>umbral)
    {
      posX+=vel*cos(angulo);
    }
    if (disty>umbral)
    {
      posY+=vel*sin(angulo);
    }
  }

  void regresaPrevio()
  {

    if (distyRegreso>disty)
    {
      posX-=vel*cos(anguloRegreso);
    }
    if (distyRegreso>disty)
    {
      posY-=vel*sin(anguloRegreso);
    }
  }


  void evaluaDistancia(float p1_, float p2_)

  {
    disty= dist(p1_, p2_, posX, posY);
  }

  void evaluaDistanciaDos(float p1_, float p2_)

  {
    distyRegreso= dist(p1_, p2_, pPosX, pPosY);
  }
  void evaluaAvance(float p1_, float p2_)
  {   
    angulo = atan2( p2_-posY, p1_-posX );
    sumaPunto();
  }

  void evaluaRegreso() 
  {
    anguloRegreso = atan2( posY-pPosY, posX-pPosX );
    regresaPrevio();
  }

  void tiempoSiesta()
  {

    if (frameCount%60 == 0)
    {
      crono+=1;
    }

    if (crono==umbralCrono)
    {
      posX=pPosX;
      posY=pPosY;
      vel=pVel;
      tam= random(10, 20);
      crono=0;
      num=1;
      despierta=true;
      alpha=pAlpha;
    }

    //    return crono;
  }

  //--------------------------------------------v    _S e t t e r s
  void setVel(float vel_)
  {
    vel+=vel_;
  }

  void setTam(float tam_)
  {
    tam=tam_;
  }

  void setTamSuma(float tam_)
  {
    tam+=tam_;
  }

  void setTamResta(float tam_)
  {
    tam-=tam_;
  }

  void setDespierta(boolean despierta_)
  {
    despierta= despierta_;
  }

  void setZonaColor(int num_)
  {
    num=num_;
  }

  void setAlpha(float alpha_)
  {
    alpha= alpha_;
  }

  void setRestaAlpha(float alpha_)
  {
    alpha-= alpha_;
  }

  void setNum(int num_)
  {
    num=num_;
  }
  //--------------------------------------------v    _G e t t e r s


  float [] getPosXY()
  {
    float [] posXY= new float [] {posX, posY};
    return posXY;
  }

  float [] getPPosXY()
  {
    float [] pPosXY= new float [] {pPosX, pPosY};
    return pPosXY;
  }

  float getDisty()
  {
    //   println("distyyy____"+ disty+"distDosss____"+ distyRegreso);

    return disty;
  }

  float getTam()
  {
    return tam;
  }

  float getUmbral()
  {
    return umbral;
  }

  float getVel()
  {
    return vel;
  }

  float getCrono()
  {
    return crono;
  }

  float getUmbralCrono()
  {
    return umbralCrono;
  }

  float getAlpha()
  {
    return alpha;
  }

  boolean getDespierta() {

    return despierta;
  }
}
