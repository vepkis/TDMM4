Esferas p1;


int tam1;
int tam2;
int radio1;
int radio2;
color c_;
color c__;
color c___;


void setup() {

  fullScreen(  );
  p1 = new Esferas();
  tam1 = 100;
  tam2 = 50;
  radio1 = tam1/2;
  radio2 = tam2/2;
  c_ = color (238, 100);
  c__= color (238, 100);
  c___= color (238, 100);
}


void draw () {

  fondo();
  p1.dibujar();
  p1.cambiatamA();
  p1.cambiatamB();
}
void fondo() {
  pushStyle();
  fill(c_);
  rect(0, 0, width, height);
  popStyle();
}
