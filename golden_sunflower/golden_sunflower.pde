float totalFrames = 400;

float radiusTotal = 150;
float radiusStep = 1;

float start = .5;
float goldenRatio = .61803398875;

void setup () {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw () {
  background(0, 0, 100);

  float angleStep;
  if (frameCount <= totalFrames/2) {
    angleStep = easings.easeInOutQuart(frameCount, start, goldenRatio - start, totalFrames/2);
  } else {
    angleStep = easings.easeInOutQuart(frameCount-totalFrames/2, goldenRatio, start - goldenRatio, totalFrames/2);
  }
  
  float radius = 1;
  float angle = 0;
  while (radius < radiusTotal) {
    fill(radius % 2 == 0 ? 0 : 0 + 180, 100, 70);
    ellipse(width/2 + cos(angle * TWO_PI) * radius, height/2 + sin(angle * TWO_PI) * radius, 10, 10);
    angle += angleStep;
    radius += radiusStep;
  }

  saveFrame("output/sunflower-######.png");
  if (frameCount==totalFrames) exit();
}
