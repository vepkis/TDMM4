class Mundo
{


  Figuritas f;
  Figuritas [] ff= new Figuritas [3];

  int cambiaNum;
  float cambiaTam;
  boolean accionaTam= false;

  Mundo()
  {
    f= new Figuritas ();
    f.setPXPY(width/2, height/2);
    cambiaTam=f.getTam();

    for (int i=0; i< ff.length; i++)
    {
      //  ff[i]=new Figuritas(random(50, width-50), random(50, height-50), 100);
      //    ff[i]=new Figuritas(width/2-10, height/2, 200);
    }

    ff[0]=new Figuritas(width/2, height/2, 200);
    ff[1]=new Figuritas(width/2+10, height/2, 200);
    ff[2]=new Figuritas(width/2-10, height/2, 200);
  }

  void dibuja()
  {
    accionRandom();
    pushStyle();
    //  tint(204, 10, 10, 200);
    f.dibuja();
    popStyle();

    pushStyle();

    tint(204, 10, 10, 80);
    ff[0].dibuja();
    //   blend(ff[0].dibuja(), 0, width, height, 0, 0, width/2, height/2, LIGHTEST);


    tint(10, 204, 10, 80);
    ff[1].dibuja();


    tint(10, 10, 204, 80);
    ff[2].dibuja();

    popStyle();
    println(accionaTam);
  }

  void accionRandom()
  {
    if (accionaTam)
    {
      if (f.getTam() < 800)
      {
        cambiaTam++;
      }
    } else
    {
      cambiaTam=f.getTamClon();
    }

    f.setTam(cambiaTam);
  }


  /*
  void accionRandom()
   {
   if (accionaTam)
   {
   if (cambiaNum < f.getFiguritaSize()-1)
   {
   cambiaNum++;
   } else
   {
   cambiaNum=0;
   }
   
   f.setNum(cambiaNum);
   }
   }
   */

  void mousePressed()

  {
    accionaTam=true;
  }

  void mouseReleased()
  {
    accionaTam=!accionaTam;
  }
}//cierra clase Mundo
