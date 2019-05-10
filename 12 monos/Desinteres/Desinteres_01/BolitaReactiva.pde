class BolitaReactiva
{

  float px, py, tam;
  float vel, disty,dir;
  BolitaReactiva()
  {
    px=random(0, width);
    py=random(0, height);
    vel=0.1;
    tam= random(20, 80);
    disty=0;
    noStroke();
  }


  BolitaReactiva(float px_, float py_, float tam_)
  {
    px= px_;
    py= py_;
    vel=0.2;
    tam=tam_;
    disty=0;
    noStroke();
  }


  void dibuja()

  {
    fill(0);
    ellipse(px, py, tam, tam);
  }



  void setPosicion(float px_, float py_)
  {
    px= px_;
    py=py_;
  }

void acciona()
{
     px = vel * cos( dir );
    py = vel * sin( dir ); 
}

  void evaluaDistancia(float p1_, float p2_)

  {
   disty= dist(p1_, p2_, px, py);
      dir = atan2( p2_-py, p1_-px );
    if (disty> tam)
    {
      px+--;
      py--;
    }
    
    
       px = px + dx;
    py = py + dy;
  }
}
