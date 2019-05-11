class BolitaReactiva
{

  float posX, posY, tam, prevPosX, prePosY;
  float angulo;
  float vel, disty, dir, umbral;


  BolitaReactiva()
  {
    posX=random(0, width);
    posY=random(0, height);
    vel=4;
    tam= random(20, 80);
    disty=0;

    umbral=5;

    noStroke();
  }


  BolitaReactiva(float px_, float py_, float tam_)
  {
    posX= px_;
    posY= py_;
    vel=0.2;
    tam=tam_;
    disty=0;

    umbral=5;

    noStroke();
  }


  void dibuja()

  {
    fill(0);
    ellipse(posX, posY, tam, tam);

    println(posX);
  }



  void setPosicion(float posX_, float posY_)
  {
    posX= posX_;
    posY=posY_;
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
  void evaluaDistancia(float p1_, float p2_)

  {
    disty= dist(p1_, p2_, posX, posY);


    angulo = atan2( p2_-posY, p1_-posX );
    sumaPunto();
  }
}
