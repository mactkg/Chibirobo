import processing.serial.*;

class Chibirobo {
  Serial robo;
  
  Chibirobo(PApplet that, String port, int baud) {
    robo = new Serial(that, port, baud);
  }
  
  void move(CHIBIROBO_WAY forwardL, int pulseHzL, int distanceL,
            CHIBIROBO_WAY forwardR, int pulseHzR, int distanceR) {
    int wayL = 0;
    int wayR = 0;
    wayL = forwardL == CHIBIROBO_WAY_FORWARD ? 0 : 1;
    wayR = forwardR == CHIBIROBO_WAY_FORWARD ? 0 : 1;
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