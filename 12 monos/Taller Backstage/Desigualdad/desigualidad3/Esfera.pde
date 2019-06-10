class Esferas {
  int posXp1, posYp1;
  int posXp2, posYp2;
  color c1;
  color c2;
  color f;
  int umbralmin;


  Esferas () {

    posXp1 = width/2-width/5;
    posYp1 = height/2;
    posXp2 = width/2 + width/5;
    posYp2 = height  /2;
    c1 = color (255, 0, 0,90);
    c2 = color (0, 255, 0,90);
    f = color (255);
    umbralmin = 50;
  }

  void dibujar () {
    background (f);
    noStroke();
    fill (c1);
    ellipse (posXp1, posYp1, tam1, tam1);
    fill (c2);
    ellipse (posXp2, posYp2, tam2, tam2);
  }


  void cambiatamA() {
    float distanciaCentro = dist (posXp2, posYp2, mouseX, mouseY);
    if (distanciaCentro  <=  radio1 && tam2 > umbralmin) {
      tam1 += 1.3;      
      tam2 -=0.4;
      f = color (#F2C4BC,90);
    } else {
      f = color(255);
    }
  }


  void cambiatamB() {
    float distanciaCentro = dist (posXp1, posYp1, mouseX, mouseY);
    if (distanciaCentro  <=  radio2 && tam1 > umbralmin) {
      tam2 += 1.3;
      tam1 -=0.4;
      f = color (#B2EF96,90);
    }
  }
}