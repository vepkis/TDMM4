package processing.test.enfermedadbb_00;

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

public class EnfermedadBB_00 extends PApplet {

Mundo m;

public void setup ()

{
  
  m= new Mundo();
  
  noStroke();
  // background(0);
}


public void draw ()

{

  background(238);
  m.dibuja();
}


public void mousePressed()
{
  m.mousePressed();
}

public void mouseReleased()
{
  m.mouseReleased();
}
class Cardumen

{


  int cant=4;
  int radio;
  float [] sumaPX= new float[3];
  float [] sumaTam = new float [2];
  float [] sumaVel= new float [3];

  boolean hayMovimiento;
  float disty;


  Remoras [] remmy_0= new Remoras [cant];
  Remoras [] remmy_1= new Remoras [cant];
  Remoras [] remmy_2= new Remoras [cant];
  //  color [] farbe= {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)};
  int [] farbe= {color(255, 100, 0), color(125, 100, 100), color(30, 30, 30)};

  //int []alpha= {200, 200, 200};
  int []alpha= {200, 200, 200};

  Cardumen()
  {

    radio= 20;
    for (int i=0; i< cant; i++) {
      remmy_0[i]= new Remoras(width/2, height/2, radio, 0, radio, (360/cant)*i, farbe[0], alpha[0]);
      remmy_1[i]= new Remoras(width/2, height/2, radio, 0, radio/2, (360/cant)*i, farbe[1], alpha[1]);
      remmy_2[i]= new Remoras(width/2, height/2, radio, 0, radio/3, (360/cant)*i, farbe[2], alpha[2]);
    }
  }


  Cardumen(int cant_, float posX_, float posY_, int tam_)
  {
    cant=cant_;

    for (int i=0; i< cant; i++) {
      remmy_0[i]= new Remoras(posX_, posY_, radio, 0, tam_, (360/cant)*i, farbe[0], alpha[0]);
      remmy_1[i]= new Remoras(posX_, posY_, radio, 0, tam_, (360/cant)*i, farbe[1], alpha[1]);
      remmy_2[i]= new Remoras(posX_, posY_, radio, 0, tam_, (360/cant)*i, farbe[2], alpha[2]);
    } 
    radio= tam_;
  }




  public void dibuja()
  {
    movimiento();
    // blendMode(MULTIPLY);// esto consume muchos recursos
    pushMatrix();
    //   translate(tx, ty);
    pushStyle();

    for (int i=0; i< cant; i++) {

      remmy_0[i].dibuja();  

      remmy_1[i].dibuja();  

      remmy_2[i].dibuja();
    }
    popStyle();
    popMatrix();
  }


  public void movimiento()
  {

    if (hayMovimiento)

    {
      dilatacion();
    }
    if (!hayMovimiento)
    {
      contraccion();
    }

    for (int i=0; i< remmy_0.length; i++) {
      remmy_0[i].setPX(sumaPX[0]);
      remmy_1[i].setPX(sumaPX[1]);
      remmy_2[i].setPX(sumaPX[2]);

      // ______________tamaño
      remmy_1[i].setTam(sumaTam[0]);
      remmy_2[i].setTam(sumaTam[1]);

      // ______________rotacion
      remmy_0[i].setVel(sumaVel[0]);
      remmy_1[i].setVel(sumaVel[1]);
      remmy_2[i].setVel(sumaVel[1]);
    }
  }


  public void dilatacion()
  {
    for (int i=0; i< remmy_0.length; i++) {
      if (remmy_0[i].getPX() < radio)
      {
        sumaPX[0]++;
      }

      if (remmy_1[i].getPX() < radio*2)
      {
        sumaPX[1]++;
      }

      if (remmy_2[i].getPX() < radio*3)
      {
        sumaPX[2]++;
      }

      // ______________tamaño
      if (remmy_1[i].getTam() > radio/2)
      {
        sumaTam[0]--;
      }
      if (remmy_2[i].getTam() > radio/3)
      {
        sumaTam[1]--;
      }

      // ______________VelocidadRotación
      sumaVel[0]+=0.1f;
      sumaVel[1]+=0.2f;
      sumaVel[2]+=0.3f;

      // ______________Posicion

      remmy_0[i].setMovimiento();
      remmy_1[i].setMovimiento();
      remmy_2[i].setMovimiento();
    }
  }

  public void contraccion()
  {
    for (int i=0; i< remmy_0.length; i++) {
      if (remmy_0[i].getPX() > 0)
      {
        sumaPX[0]--;
      }
      if (remmy_1[i].getPX() > 0)
      {
        sumaPX[1]--;
      }
      if (remmy_2[i].getPX() > 0)
      {
        sumaPX[2]--;
      }

      // ______________tamaño
      if (remmy_1[i].getTam() < radio)
      {
        sumaTam[0]++;
      }
      if (remmy_2[i].getTam() < radio)
      {
        sumaTam[1]++;
      }


      // ______________VelocidadRotación
      sumaVel[0]=0;
      sumaVel[1]=0;
      sumaVel[2]=0;
    }
  }


  public void setTxTy()
  {
  }
  public void calculaDistancia()
  {

    disty=dist (mouseX, mouseY, remmy_0[0].getTxTy()[0], remmy_0[0].getTxTy()[1]);

    println(disty);
  }



  public boolean getHayMovimiento() {

    return hayMovimiento;
  }

  public void mousePressed()
  {
    calculaDistancia();
    if (disty< remmy_0[0].getTam())
    {

      hayMovimiento=!hayMovimiento;
    }
  }
}//cierra clase Cardumen
class Mundo
{

  int cant= 50;
  Cardumen [] card= new Cardumen[cant];
  int tam;


  float cambiaTam;
  boolean accionaTam= false;





  Mundo()
  {
    tam=40;

    for (int i=0; i<cant; i++)
    {
      card[i] = new Cardumen (4, random(tam*6, width-(tam*6)), random(tam*6, height-(tam*6)), tam);
      // ellipse.add= new float [][];
    }
  }

  public void dibuja()
  {

    for (int i=0; i<card.length; i++)
    {
      card[i].dibuja();
    }
  }

  public void accionaRota()
  {
  }




  public void mousePressed()

  {
    accionaTam=true;

    for (int i=0; i<card.length; i++)
    {
      card[i].mousePressed();
    }
  }

  public void mouseReleased()
  {
    accionaTam=!accionaTam;
  }
}//cierra clase Mundo
class Remoras 
{

  float tx, ty, tz, vel, px, py, tam, angulo, movSin;
  float tComodin=5;
  float tope=20;

  ArrayList primitivos= new ArrayList();
  int farbe=RGB;
  float alpha;

  Remoras ()
  {
    tx=100; 
    ty=100;
    tz=0;
    px=50;
    py=0;
    tam=100;
  }

  Remoras (float tx_, float ty_, float px_, float py_, float tam_, float angulo_, int farbe_, float alpha_)
  {

    tx=tx_; 
    ty=ty_;
    tz=0;
    px= px_;
    py=py_;
    tam=tam_;
    angulo=angulo_;
    farbe= farbe_;
    alpha=alpha_;
  }


  public void dibuja()

  {
    pushMatrix();
    translate(tx, ty);
    rotate(radians(angulo+vel));
    fill(farbe, alpha);
    ellipse(px, py+movSin, tam, tam);
    popMatrix();
  }

  public void setMovimiento()
  {

    if (tx<width)
    {
      tx+=0.3f;
    } else
    {
      tx=0;
    }
    movSin+=tComodin;

    if (movSin==tope || movSin==-tope)
    {
      tComodin*=-0.5f;
    }
  }

  public void setVel(float vel_)
  {
    vel= vel_;
  }

  public void setPX(float px_)
  {
    px=px_;
  }

  public void setTam(float tam_)
  {
    tam=tam_;
  }


  public void setTxTy(float tx_, float ty_)
  {
    tx=tx_;
    ty=ty_;
  }

  public float getPX()
  {
    return px;
  }

  public float [] getTxTy()
  {
    float [] txy= {tx, ty};
    return txy;
  }

  public float [] getTP()
  {
    float [] tp= {(tx+px), (ty+py)};
    return tp;
  }

  public float getTam()
  {
    return tam;
  }
}//cierra class Remoras
  public void settings() {  size(900, 900);  smooth(); }
}
