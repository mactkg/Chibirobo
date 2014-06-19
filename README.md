# Chibirobo
tested on Processing 2.1.2

## Document
### コンストラクタ
```java
Chibirobo(PApplet that, String port, int baud);
// ex: Chibirobo robo = new Chibirobo(this, "/dev/cu.FireFly-A399-SPP", 9600);
```
- that: 通常、thisを入れれば良い
- port: 接続先
- baud: 通信速度

### 移動
```java
Chibirobo.move(int pulseHzL, int distanceL, int pulseHzR, int distanceR);
```
- pulseHzX: (多分)送ってるパルスの幅
  - speed = 1/pulseHzX
  - マイナスで後退
- distanceX: 進む量

### 停止
```java
Chibirobo.stop();
```

### 接続の解除
```java
Chibirobo.exit();
```
