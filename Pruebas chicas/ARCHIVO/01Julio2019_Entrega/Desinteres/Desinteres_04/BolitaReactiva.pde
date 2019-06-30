class BolitaReactiva
{

  color [] farbe= new color []{
    color(255, 100, 5), 
    color(140, 12, 0), 
    color(80, 80, 80), 
    color(1, 153, 150), 

  };
  int num;
  float alpha;


  float posX, posY, tam, pPosX, pPosY;
  float angulo, anguloRegreso;
  float vel, disty, distyRegreso, distyComodin, dir, umbral;

  boolean llego=false, llegoComodin;

  BolitaReactiva()
  {
    num= int (random(1, farbe.length));
    alpha=200;
    tam= random(50, 60);
    posX=random(tam, width-tam);
    posY=random(tam, height-tam);
    vel=4;
    disty=0;

    umbral=10;

    pPosX=posX;
    pPosY=posY;
    llegoComodin=false;

    noStroke();
  }

  BolitaReactiva(float posX_, float posY_)
  {
    num= int (random(1, farbe.length));
    alpha=200;
    tam= random(50, 60);
    posX=posX_;
    posY=posY_;
    vel=4;
    disty=0;

    umbral=5;


    pPosX=posX;
    pPosY=posY;
    llegoComodin=false;

    noStroke();
  }

  BolitaReactiva(float px_, float py_, float tam_)
  {
    num= int (random(1, farbe.length));
    alpha=200;

    posX= px_;
    posY= py_;
    vel=0.2;
    tam=tam_;
    disty=0;
    distyComodin=disty;
    umbral=5;

    llegoComodin=false;

    noStroke();
  }


  void dibuja()

  {
    pushStyle();
    fill (farbe[num], alpha);
    ellipse(posX, posY, tam+30, tam+30);
    popStyle();
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
    if (disty>=umbral)
    {
      posX+=vel*cos(angulo);
    }
    if (disty>=umbral)
    {
      posY+=vel*sin(angulo);
    }
    if (disty<umbral && llego!=llegoComodin)
    {
      llego=true;
      rect(100, 100, 400, 50);
    }
  }

  void regresaPrevio()
  {

    if (distyRegreso>1.5)
    {
      posX-=vel*cos(anguloRegreso);
    }
    if (distyRegreso>1.5)
    {
      posY-=vel*sin(anguloRegreso);
    }
  }


  void evaluaDistancia(float p1_, float p2_)

  {
    disty= dist(p1_, p2_, posX, posY);
  }

  void guardaDistyComodin()
  {
    distyComodin=disty;
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

  void setLlegoComodin(boolean llegoComodin_)
  {
    llegoComodin=llegoComodin_;
  }

  void setZonaColor(int num_)
  {
    num=num_;
  }

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


  float getDistyComodin()
  {
    return distyComodin;
  }

  boolean getLlego()
  {
    return llego;
  }

  boolean getLlegoComodin()
  {
    return llegoComodin;
  }

  float getUmbral()
  {
    return umbral;
  }
}