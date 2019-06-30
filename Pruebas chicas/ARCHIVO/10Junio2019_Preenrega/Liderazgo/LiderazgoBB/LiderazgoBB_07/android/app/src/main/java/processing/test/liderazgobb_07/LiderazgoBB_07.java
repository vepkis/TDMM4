package processing.test.liderazgobb_07;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class LiderazgoBB_07 extends PApplet {

Mundo m;

public void setup()
{
  // size (1000, 600);
  ///---------------------
  
  orientation(LANDSCAPE);
  ///---------------------

  m= new Mundo();
}

public void draw ()

{
  // background(238);
  fill(238, 20);
  rect(0, 0, width, height);

  m.dibuja();
}


public void mousePressed ()
{
  m.mousePressed();
}
public void mouseReleased ()
{
  m.mouseReleased ();
}
class BolitaReactiva
{

  int [] farbe= new int []{
    color (30, 30, 30), 
    color(200, 0, 0), 
    color(0, 200, 0), 
    color(0, 0, 200), 
    color(200, 200, 0), 
    color(200, 0, 200), 
    color(0, 200, 200)
  };
  int num, tam;
  float alpha=255;


  float posX, posY, pPosX, pPosY;
  float movX, movY, movDosX, movDosY;

  float angulo, anguloRegreso;
  float vel, disty, distyRegreso, dir, umbral;
  int crono, umbralCrono=4;
  boolean despierta= true;

  boolean lugar;
  boolean ocupado=false;// boolean reservado para seguidores


  BolitaReactiva()
  {
    tam= PApplet.parseInt (random(20, 40));
    posX=random(tam, width-tam);
    posY=random(tam, height-tam);
    vel=3;
    disty=0;

    umbral=10;

    pPosX=posX;
    pPosY=posY;
    noStroke();
  }

  BolitaReactiva(float posX_, float posY_)
  {
    tam= PApplet.parseInt(random(10, 40));
    posX=posX_;
    posY=posY_;
    vel=4;
    disty=0;

    umbral=5;


    pPosX=posX;
    pPosY=posY;
    noStroke();
  }

  BolitaReactiva(float px_, float py_, int tam_)
  {
    posX= px_;
    posY= py_;
    vel=0.2f;
    tam=tam_;
    disty=0;

    umbral=5;

    pPosX=posX;
    pPosY=posY;
    movX=8;
    movY=6;



    lugar=false;
    noStroke();
  }



  BolitaReactiva(float vel_, int tam_,float umbral_,float alpha_)
  {
    tam= tam_;
    posX=random(tam, width-tam);
    posY=random(tam, height-tam);
    vel=vel_;
    disty=0;

    umbral=umbral_;

    pPosX=posX;
    pPosY=posY;
    
    alpha=alpha_;
    noStroke();
  }


  public void dibuja()

  {
    pushStyle();
    if (despierta)
    {
      fill(farbe[num], alpha);
      ellipse(posX, posY, tam, tam);
    } else {
      tiempoSiesta();
    }
    popStyle();
  }



  public void regresaPrevio()
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


  public void evaluaDistancia(float p1_, float p2_)

  {
    disty= dist(p1_, p2_, posX, posY);
  }

  public void evaluaDistanciaDos(float p1_, float p2_)

  {
    distyRegreso= dist(p1_, p2_, pPosX, pPosY);
  }
  public void evaluaAvance(float p1_, float p2_)
  {   
    angulo = atan2( p2_-posY, p1_-posX );
    sumaPunto();
  }
  public void evaluaAvanceABS(float p1_, float p2_)
  {   
    angulo = atan2( p2_-posY, p1_-posX );
    sumaPuntoABS();
  }

  public void evaluaLugar(float p1_, float p2_)
  {   
    angulo = atan2( p2_-posY, p1_-posX );
    sumaPunto();
  }
  public void evaluaRegreso() 
  {
    anguloRegreso = atan2( posY-pPosY, posX-pPosX );
    regresaPrevio();
  }

  public void sumaPunto()
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

  public void sumaPuntoABS()
  {
    if (abs(disty)>=umbral)
    {
      posX+=vel*cos(angulo);
    }
    if (abs(disty)>=umbral)
    {
      posY+=vel*sin(angulo);
    }
  }

  public void tiempoSiesta()
  {

    if (frameCount%60 == 0)
    {
      crono+=1;
    }

    if (crono==umbralCrono)
    {
      posX=pPosX;
      posY=pPosY;
      vel=1;
      tam= PApplet.parseInt(random(10, 40));
      crono=0;

      despierta=true;
    }

    //    return crono;
  }






  /////////////////
  //R E I N I C I O
  /////////////////
  public void reinicio()
  {
    posX=pPosX;
    posY=pPosY;

  
    movX=PApplet.parseInt(random(5, 10));
    movY=PApplet.parseInt(random(2, 5));

    num=PApplet.parseInt(random(farbe.length));
    lugar=false;
  }


  //--------------------------------------------v    _S e t t e r s



  public void setPosXY(float posX_, float posY_)
  {
    posX= posX_;
    posY=posY_;
  }

  public void setPosXYPrevia(float pPosX_, float pPosY_)
  {
    pPosX= pPosX_;
    pPosY=pPosY_;
  }
  public void setSumaPosXY(float posX_, float posY_)
  {

    posX+= posX_;
    posY+=posY_;
  }

  public void setVel(float vel_)
  {
    vel+=vel_;
  }

  public void setTam(int tam_)
  {
    tam=tam_;
  }

  public void setDespierta(boolean despierta_)
  {
    despierta= despierta_;
  }



  //--------------------------------------------v    _S e t t e r s

  public void setLugar(boolean lugar_)
  {
    lugar=lugar_;
  }

  public void setNum(int num_)
  {
    num=num_;
  }

  public void setMovXY(float movX_, float movY_)
  {
    movX=movX_;
    movY=movY_;
  }

  public void setUmbral(float umbral_)
  {
    umbral=umbral_;
  }

  public void setOcupado(boolean ocupado_)
  {
    ocupado= ocupado_;
  }

  public void setAlpha(int alpha_)
  {
    alpha= alpha_;
  }

  //--------------------------------------------v    _G e t t e r s


  public float [] getPosXY()
  {
    float [] posXY= new float [] {posX, posY};
    return posXY;
  }

  public float [] getPPosXY()
  {
    float [] pPosXY= new float [] {pPosX, pPosY};
    return pPosXY;
  }

  public float getDisty()
  {
    //   println("distyyy____"+ disty+"distDosss____"+ distyRegreso);

    return disty;
  }

  public float getTam()
  {
    return tam;
  }

  public float getUmbral()
  {
    return umbral;
  }

  public float getVel()
  {
    return vel;
  }

  public float getCrono()
  {
    return crono;
  }

  public float getUmbralCrono()
  {
    return umbralCrono;
  }
  public boolean getDespierta() {

    return despierta;
  }

  public boolean getLugar()
  {
    return lugar;
  }

  public int getFarbe()
  {
    return farbe[num];
  }

  public int getFarbeSize()
  {
    return farbe.length;
  }

  public int getNum()
  {
    return num;
  }

  public float [] getMovDosXY()
  {

    float [] movDosXY={movDosX, movDosY}; 
    return  movDosXY;
  }

  public boolean getOcupado ()
  {
    return ocupado;
  }

  public void mouseReleased ()
  {
    lugar= false;
    ocupado= false;
  }
}
class Lider
{ 
  float posX, posY, tam, umbral;
  int c= color(RGB);
  boolean existe= false;

  Lider ()
  {
    posX=width/2;
    posY=height/2;
    tam=8;
    umbral=4;//umbral de tiempo
    //   c=color(200, 5, 5);
    c=color(255, 100, 0);
  }

  public void dibuja()
  {
  }

  public void creaPunktum()
  {
    if (existe)
    {

      fill(c, 20);
      ellipse(posX, posY, tam*4, tam*4);

      fill(c);
      ellipse(posX, posY, tam, tam);
      //    tiempoVida();
    }
  }



  public void setColor (float r_, float g_, float b_, float a_)
  {
    c= color(r_, g_, b_, a_);
  }
  public void setPosXY(float posX_, float posY_)
  {
    posX=posX_;
    posY=posY_;
  }

  public void setTam(float tam_)
  {
    tam= tam_;
  }

  public void setExiste(boolean existe_)
  {
    existe=existe_;
  }

  public boolean getExiste()
  {
    return existe;
  }

  public float [] getPosXY()
  {
    float [] posXY= new float [] {posX, posY};
    return posXY;
  }


  public void mousePressed ()

  {
    existe= true;
  }

  public void mouseReleased ()
  {
    existe= false;
  }
}//cierra cass Lider
class Mundo
{

  Lider l = new Lider ();
  int cantBoli= 5;


  Lider [][]lSeguidores = new Lider[2][5];
  float sumaX, sumaY, comodin;
  int index, cual;

  float movX, movY, velX, velY;

  BolitaReactiva [] bandaUP= new BolitaReactiva[cantBoli];
  BolitaReactiva [] bSeguidoresUP= new BolitaReactiva[cantBoli];

  BolitaReactiva [] bandaDOWN= new BolitaReactiva[cantBoli];
  BolitaReactiva [] bSeguidoresDOWN= new BolitaReactiva[cantBoli];



  Mundo ()

  {
    movX=1;
    movY=1;
    velX=-2;
    velY=1;

    sumaX=20;// es el valor máximo del tam de bolitaReactiva
    sumaY=-sumaX/2;
    comodin=0;

    for (int i=0; i <cantBoli; i++)
    {
      bandaUP[i]= new BolitaReactiva();
      bandaUP[i].setTam(20);
      bandaUP[i].setVel(2*cantBoli-i*2);

      bandaDOWN[i]= new BolitaReactiva();
      bandaDOWN[i].setTam(20);
      bandaDOWN[i].setVel(2*cantBoli-i*2);


      lSeguidores[0][i]= new Lider();
      lSeguidores[1][i]= new Lider();

      //  BolitaReactiva(float vel_, int tam_,float umbral_,float alpha_)
      bSeguidoresUP[i]= new BolitaReactiva(2*cantBoli-i*2, 5, sumaX+(i*sumaX), 100);
      bSeguidoresDOWN[i]= new BolitaReactiva(2*cantBoli-i*2, 5, sumaX+(i*sumaX), 100);
    }
  }

  public void dibuja()
  {

    creaLider();
    comportamientoUP();
    comportamientoDOWN();
    compPrincipal();

    for (int i=0; i <cantBoli; i++)
    {
      bSeguidoresUP[i].dibuja();
      bSeguidoresDOWN[i].dibuja();

      bandaUP[i].dibuja();
      bandaDOWN[i].dibuja();
    }
  }

  public void creaLider()
  {
    l.setPosXY(mouseX, mouseY);
    l.creaPunktum();
    //  println(l.getExiste());
    formacion();
  }


  public void formacion()
  {
    for (int i=0; i <cantBoli; i++)
    {
      lSeguidores[0][i].setPosXY(l.getPosXY()[0]- sumaX-(i*sumaX), l.getPosXY()[1]+sumaY+(sumaY*i));
      lSeguidores[1][i].setPosXY(l.getPosXY()[0]- sumaX-(i*sumaX), l.getPosXY()[1]-sumaY-(sumaY*i));

      //  lSeguidores[0][i].creaPunktum(); 
      // lSeguidores[1][i].creaPunktum();
    }
  }


  public void compPrincipal()
  {    
    for (int i=0; i <cantBoli; i++)
    {
      bSeguidoresUP[i].evaluaDistancia( lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);

      if (      bSeguidoresUP[i].getDisty()>      bSeguidoresUP[i].getUmbral())
      {      
        bSeguidoresUP[i].evaluaAvance(lSeguidores[0][i].getPosXY()[0], lSeguidores[0][i].getPosXY()[1]);
      }

      bSeguidoresDOWN[i].evaluaDistancia( lSeguidores[1][i].getPosXY()[0], lSeguidores[1][i].getPosXY()[1]);

      if (      bSeguidoresDOWN[i].getDisty()>      bSeguidoresDOWN[i].getUmbral())
      {      
        bSeguidoresDOWN[i].evaluaAvance(lSeguidores[1][i].getPosXY()[0], lSeguidores[1][i].getPosXY()[1]);
      }
    }
  }



  public void comportamientoUP()

  {

    for (int i=0; i <cantBoli; i++)
    {

      if ( l.getExiste() )
      {
        
        
        
        if (bandaUP[i].getLugar()==false &&  bSeguidoresUP[i].getOcupado()==false )
        {
          bandaUP[i].evaluaDistancia(bSeguidoresUP[i].getPosXY()[0], bSeguidoresUP[i].getPosXY()[1]);
          if ( bandaUP[i].disty< sumaX*7)    
          {
            bandaUP[i].evaluaAvance(bSeguidoresUP[i].getPosXY()[0], bSeguidoresUP[i].getPosXY()[1]);
            if ( bandaUP[i].disty< sumaX)    
            {
              bandaUP[i].setLugar(true);
              bSeguidoresUP[i].setOcupado(true);
            }
          } else {
            if (bandaUP[i].getPosXY()[0]>=-bandaUP[i].getTam())
            {
              bandaUP[i].setSumaPosXY(velX, 0);
            } 

            if (bandaUP[i].getPosXY()[0]<-bandaUP[i].getTam() )

            {
              bandaUP[i].setPosXY(width+bandaUP[i].getTam(), bandaUP[i].getPosXY()[1]);
            }
          }
        }

        if ( bandaUP[i].getLugar() && bSeguidoresUP[i].getOcupado())
        {
          bandaUP[i].evaluaDistancia(bSeguidoresUP[i].getPosXY()[0], bSeguidoresUP[i].getPosXY()[1]);

          if ( bandaUP[i].disty> sumaX*11)    
          {    
            bandaUP[i].setLugar(false);
            bSeguidoresUP[i].setOcupado(false);
          } else
          {
            bandaUP[i].evaluaLugar(bSeguidoresUP[i].getPosXY()[0], bSeguidoresUP[i].getPosXY()[1]);
          }
        }
      } else
      {
        if (bandaUP[i].getPosXY()[0]>=-bandaUP[i].getTam())
        {

          bandaUP[i].setSumaPosXY(velX, 0);
        } 

        if (bandaUP[i].getPosXY()[0]<-bandaUP[i].getTam() )

        {
          bandaUP[i].setPosXY(width+bandaUP[i].getTam(), bandaUP[i].getPPosXY()[1]);
        }
      }

      //  println("[ "+bSeguidoresUP[i].getOcupado()+" ]");
      //   println("__"+"[ "+bSeguidoresUP[i].getVel()+" ]");
    }
    // println("________"+ cantBoli);
    //  bandaMovimiento();
  }


  public void comportamientoDOWN()

  {

    for (int i=0; i <cantBoli; i++)
    {

      if ( l.getExiste() )
      {
        if (bandaDOWN[i].getLugar()==false &&  bSeguidoresDOWN[i].getOcupado()==false )
        {
          bandaDOWN[i].evaluaDistancia(bSeguidoresDOWN[i].getPosXY()[0], bSeguidoresDOWN[i].getPosXY()[1]);
          if ( bandaDOWN[i].disty< sumaX*7)    
          {
            bandaDOWN[i].evaluaAvance(bSeguidoresDOWN[i].getPosXY()[0], bSeguidoresDOWN[i].getPosXY()[1]);
            if ( bandaDOWN[i].disty< sumaX)    
            {
              bandaDOWN[i].setLugar(true);
              bSeguidoresDOWN[i].setOcupado(true);
            }
          } else {
            if (bandaDOWN[i].getPosXY()[0]>=-bandaDOWN[i].getTam())
            {
              bandaDOWN[i].setSumaPosXY(velX, 0);
            } 

            if (bandaDOWN[i].getPosXY()[0]<-bandaDOWN[i].getTam() )

            {
              bandaDOWN[i].setPosXY(width+bandaDOWN[i].getTam(), bandaDOWN[i].getPosXY()[1]);
            }
          }
        }

        if ( bandaDOWN[i].getLugar() && bSeguidoresDOWN[i].getOcupado())
        {
          bandaDOWN[i].evaluaDistancia(bSeguidoresDOWN[i].getPosXY()[0], bSeguidoresDOWN[i].getPosXY()[1]);

          if ( bandaDOWN[i].disty> sumaX*11)    
          {    
            bandaDOWN[i].setLugar(false);
            bSeguidoresDOWN[i].setOcupado(false);
          } else
          {
            bandaDOWN[i].evaluaLugar(bSeguidoresDOWN[i].getPosXY()[0], bSeguidoresDOWN[i].getPosXY()[1]);
          }
        }
      } else
      {
        if (bandaDOWN[i].getPosXY()[0]>=-bandaDOWN[i].getTam())
        {

          bandaDOWN[i].setSumaPosXY(velX, 0);
        } 

        if (bandaDOWN[i].getPosXY()[0]<-bandaDOWN[i].getTam() )

        {
          bandaDOWN[i].setPosXY(width+bandaDOWN[i].getTam(), bandaDOWN[i].getPPosXY()[1]);
        }
      }

      //  println("[ "+bSeguidoresUP[i].getOcupado()+" ]");
      println("__"+"[ "+bSeguidoresDOWN[i].getVel()+" ]");
    }
    println("________"+ cantBoli);
    //  bandaMovimiento();
  }


  public void mousePressed ()
  {
    l.mousePressed ();
    for (int i=0; i <cantBoli; i++)
    {
      lSeguidores[0][i].mousePressed();
      lSeguidores[1][i].mousePressed();
      //   bSeguidores[i].mousePressed();
    }
  }

  public void mouseReleased ()
  {
    l.mouseReleased ();
    for (int i=0; i <cantBoli; i++)
    {
      bandaUP[i].mouseReleased();
      bandaDOWN[i].mouseReleased();

      lSeguidores[0][i].mouseReleased();
      lSeguidores[1][i].mouseReleased();
      bSeguidoresUP[i].mouseReleased();
      bSeguidoresDOWN[i].mouseReleased();
    }
  }


}//cierra class Mundo
  public void settings() {  fullScreen(); }
}
