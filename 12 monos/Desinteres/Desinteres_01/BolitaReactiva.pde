class BolitaReactiva
{

  float px, py, tam;
  float angulo;
  float vel, disty, dir;

  float distyX, distyY, umbral;


  BolitaReactiva()
  {
    px=random(0, width);
    py=random(0, height);
    vel=4;
    tam= random(20, 80);
    disty=0;

    umbral=5;

    noStroke();
  }


  BolitaReactiva(float px_, float py_, float tam_)
  {
    px= px_;
    py= py_;
    vel=0.2;
    tam=tam_;
    disty=0;
    
    umbral=5;
    
    noStroke();
  }


  void dibuja()

  {
    fill(0);
    ellipse(px, py, tam, tam);

    println(px);
  }



  void setPosicion(float px_, float py_)
  {
    px= px_;
    py=py_;
  }


  void sumaPunto()
  {
    if (disty>umbral)
    {
      px+=vel*cos(angulo);
    }
    if (disty>umbral)
    {
      py+=vel*sin(angulo);
    }
  }
  void evaluaDistancia(float p1_, float p2_)

  {
    disty= dist(p1_, p2_, px, py);
    distyX= (p1_-px);
    distyY= (p2_-py);    

    angulo = atan2( p2_-py, p1_-px );
    sumaPunto();
  }
}
