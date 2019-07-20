float totalFrames = 250;

float radius = 1;
float radiusTotal = 300;
float radiusStep = 1;

float goldenRatio = 1.61803398875;
float angleStepEnd = 1.625;

float angle = 0;
float angleStep;

void setup () {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw () {
  background(0, 0, 100);

  if (frameCount <= totalFrames/2) {
    angleStep = easings.easeInOutQuart(frameCount, angleStepEnd, goldenRatio - angleStepEnd, totalFrames/2);
  } else {
    angleStep = easings.easeInOutQuart(frameCount-totalFrames/2, goldenRatio, angleStepEnd - goldenRatio, totalFrames/2);
  }
  
  while (radius < radiusTotal) {
    fill(int(1.625 * radius % 8 % 1.0 / .125) * 360/8, 50, 90); // going around the color wheel in 13/8 steps
    ellipse(width/2 + cos(angle * TWO_PI) * radius, height/2 + sin(angle * TWO_PI) * radius, 8, 8);
    angle += angleStep;
    radius += radiusStep;
  }
  angle = 0;
  radius = 1;

  saveFrame("output/sunflower-######.png");
  if (frameCount==totalFrames) exit();
}
