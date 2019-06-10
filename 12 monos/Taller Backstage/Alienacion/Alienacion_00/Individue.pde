class Individue
{
  float px, py, tam;
  float paso, topeMin, topeMax;
  color c=color(0,0,0,0);

  Individue ()
  {
    px=width/2;
    py= height/2;
    tam= 100;
    paso=1;
    topeMax=tam*2;
    topeMin=tam/2;
  }

  Individue (float px_, float py_, float tam_)
  {
    px=px_;
    py=py_;
    tam=tam_;
  }

  void dibuja()
  {
   comportamiento();
    fill(c);
    ellipse(px, py, tam, tam);
  }


  void setPosicion()
  {
  }

  void setColor(float r_, float g_, float b_,float a_)
  {
    c=color(r_, g_, b_,a_);
  }


  void getPosicion()
  {
  }


  void comportamiento()
  {

    if (tam<=topeMax && tam>=topeMin)
    {
      tam+=paso;
    }

    if (tam==topeMax || tam==topeMin)
    {
      paso*=-1;
    }    
    println(tam);
  }
}//class Individue
