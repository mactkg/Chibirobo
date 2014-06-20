import processing.serial.*;
Chibirobo robo;

void setup() {
  size(400, 400);
  robo = new Chibirobo(this, "/dev/cu.FireFly-A399-SPP", 9600);
}

void draw() {
  line(width/2-100, 0, width/2-100, height);
  line(width/2+100, 0, width/2+100, height);
  line(0, height/2-100, width, height/2-100);
  line(0, height/2+100, width, height/2+100);
  
}

void mousePressed() {
  if(mouseX < width/2-100 && mouseY < height/2-100) { // top-left
    println("top-left");
    robo.move(3000, 10000, 1000, 10000);
  } else if(mouseX < width/2-100 && mouseY > height/2-100 && mouseY < height/2+100) { // center-left
    println("center-left");
    robo.move(-3000, 10000, 3000, 10000);
  } else if(mouseX > width/2+100 && mouseY < height/2-100) { // top-right
    println("top-right");
    robo.move(1000, 10000, 3000, 10000);
  } else if(mouseX > width/2+100 && mouseY > height/2-100 && mouseY < height/2+100) { // center-right
    println("center-right");
    robo.move(3000, 10000, -3000, 10000);
  } else if(mouseX < width/2-100 && mouseY > height/2+100) { // bottom-left
    println("bottom-left");
    robo.move(-3000, 10000, -1000, 10000);
  } else if(mouseX > width/2+100 && mouseY > height/2+100) { // bottom-right
    println("bottom-right");
    robo.move(-1000, 10000, -3000, 10000);
  } else if(mouseX > width/2-100 && mouseX < width/2+100 && mouseY < width/2-100) { // top-center
    println("top-center");
    robo.move(3000, 10000, 3000, 10000);
  } else if(mouseX > width/2-100 && mouseX < width/2+100 && mouseY > width/2+100) {// bottom-center
    println("bottom-center");
    robo.move(-3000, 10000, -3000, 10000);
  }
}

void mouseReleased(){
  println("stop");
  robo.stop();
}

void exit() {
  robo.stop();
  super.exit();
}
