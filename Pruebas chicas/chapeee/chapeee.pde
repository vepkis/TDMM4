
void setup ()

{
  size(600, 600);
  smooth();
  //  strokeWeight(20);
}

void draw ()

{

  beginShape();
  vertex(20, 20);
  vertex(40, 20);
  vertex(40, 40);
  vertex(60, 40);
  vertex(60, 60);
  vertex(20, 60);
  endShape(CLOSE);

  noFill();
  strokeWeight(4);
  beginShape();
  vertex(0, height/2);
  quadraticVertex(80, height/2, 0, 0);
  // quadraticVertex(20, 80, 80, 80);
  vertex(350, 60);
  endShape();
}
