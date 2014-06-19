import processing.serial.*;

class Chibirobo {
  Serial robo;
  
  Chibirobo(PApplet that, String port, int baud) {
    robo = new Serial(that, port, baud);
  }
  
  void move(int pulseHzL, int distanceL, int pulseHzR, int distanceR) {
    int wayL = 0;
    int wayR = 0;
    wayL = pulseHzL > 0 ? 0 : 1;
    wayR = pulseHzR > 0 ? 0 : 1;
    robo.write(str(wayL)+","+str(pulseHzL)+","+str(distanceL)+","+
               str(wayR)+","+str(pulseHzR)+","+str(distanceR)+"\r");
  }
  
  void stop() {
    robo.write("\r");
  }
  
  void exit() {
    robo.stop();
  }
}


// implementation of virtual enum
class CHIBIROBO_WAY {
  CHIBIROBO_WAY() {}
}

final CHIBIROBO_WAY CHIBIROBO_WAY_FORWARD = new CHIBIROBO_WAY();
final CHIBIROBO_WAY CHIBIROBO_WAY_BACKWARD = new CHIBIROBO_WAY();
