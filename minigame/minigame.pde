
Spring2D s1, s2;
int asesino=0,heroe=0;
int valor = 0, personasActivas = 0,contadorsalvados=0,contadormuertes=0;
int hecho2=0,rand, timer =300, contadorpizzas=0,timer2 =700,contadorfuego=0,timerPersonas=100;
int activadoRandom=0;
PFont fuente;
int randomnum =0;
float distancia;
static int rand3;
int contador=2;
int moving = 0, movingSpeed;
float gravity = 2.0;
float mass = 17;
int release =0,IZQ, DER;
PImage spider, edificio, avion;
PImage [] pizza = new PImage[5];
PImage [] fuego = new PImage[60];
PImage [] personas = new PImage[10];
int Visible =0;
int hecho=0;
int estado [];
int velocidad [];
int nuevo [];
int posx [];
void setup() {
  fuente = loadFont("Munro-48.vlw");
 nuevo = new int[4];
 estado = new int[4];
 posx = new int[4];
 velocidad = new int[4];
   for(int i= 0;i<5;i++){
    pizza[i]=loadImage("pizza.png");
    fuego[i]=loadImage("fuego"+i+".png");
  }
   for(int i= 0;i<4;i++){
    personas[i]=loadImage("persona"+i+".png");
    estado[i]=0;
    velocidad[i]=0;
    posx[i]=0;
    nuevo[i]=1;
  }
 spider =  loadImage("spider.png");
  edificio =  loadImage("edificio.png");
  avion =  loadImage("avion.png");
  size(640, 600);
  fill(255, 126);
  // Inputs: x, y, mass, gravity
  s1 = new Spring2D(0.0, width/2, mass, gravity);
  s2 = new Spring2D(0.0, width/2, mass, gravity);
}

void draw() {
  timer -= 1;
  if(timer<=0){
    hecho2 =0;
    timer = 800;
  }
  timer2 -= 1;
  if(timer2<=0){
    contadorpizzas=0;
    timer2 = 700;
  }
    timerPersonas -= 1;
  if(timerPersonas<=0){
    timerPersonas = numeroRandom(600);
    //timerPersonas = 600;
    movingSpeed = 0;
    //
    personasActivas+=1;
  }
  moving = moving -2;
  for(int i= 0;i<4;i++){
    if(estado[i]==1){
      velocidad[i] -= 2;
          if(velocidad[i]<=-600&&heroe==0){
            contadormuertes+=1;
            velocidad[i] = 0;
            nuevo[i]= 1;
            activadoRandom =0;
          }
       }
    }
  movingSpeed = movingSpeed - numeroRandom(3);
  background(0);
  if(release==1){
    //s2.update(s1.x, s1.y);
    s1.update(s1.x, s1.y-moving);
  }else{
    
    s1.update(DER, IZQ);
  //s2.update(mouseX, mouseY);
  }
  //s2.display(s1.x, s1.y);
  
  if(mousePressed==false){
    release = 1;
    hecho =0;
    s1.display(DER,IZQ-moving);
    Visible=0;
    
  }
  if(mousePressed==true){
    s1.display(DER,IZQ);
    if(mouseX<=83||mouseX>=563||(mouseX>=83&&mouseX<=287&&mouseY>=58&&mouseY<=93)){
      if(asesino==0){
    Visible=1;
    moving=0;
    release = 0;
    guardarPos();
      }
    }
  }
 crearPizza();
   if(activadoRandom==0){
     randomnum = numeroRandom(3);
     for(int i= 0;i<4;i++){
         if(estado[i]==1&&nuevo[i]==1){
          posx[i] = numeroRandom(600);
          nuevo[i] =0;
          if(randomnum==i){
            if(randomnum+1>4){
           randomnum -=1;
          }
          if(randomnum+1<0){
           randomnum +=1;
          }
          }
        }
      }
      activadoRandom = 1;
     }
  crearPersonas(randomnum);
}


 public void guardarPos(){
    if(hecho==0){
    IZQ = mouseY;
    DER=mouseX;
    hecho=1;
    }
  }
  
class Spring2D {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity;
  float mass;
  float radius = 5;
  float stiffness = 0.09;
  float damping = 0.94;
  
  Spring2D(float xpos, float ypos, float m, float g) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
  }
  
  void update(float targetX, float targetY) {
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }

  void display(float nx, float ny) {  
textFont(fuente,50);
  text("Salvados: "+contadorsalvados,100,350);
  text("Muertes: "+contadormuertes,100,450);
  if(contadormuertes>=3){
    fill(#ff0000);
textFont(fuente,150);
    text("ASESINO: ",100,280);
    asesino =1;
  }
  if(contadorsalvados>=20){
    fill(#0057a8);
textFont(fuente,150);
    text("HEROE: ",100,280);
    heroe =1;
  }
    noStroke();
    image(edificio, -150,0);
    image(edificio, -150,300);
    image(edificio, 540,0);
    image(edificio, 540,300);
    image(fuego[contadorfuego], 10,-40);
     fuego[contadorfuego].resize(0, 150);
    contadorfuego+=1;
    if(contadorfuego>=4){
      contadorfuego=0;
    }
    image(avion, 0,0);
    edificio.resize(0, 300);
    avion.resize(0, 100);
    image(spider, x,y);
    spider.resize(0, 50);
    ellipse(x, y, radius*2, radius*2);
    stroke(255);
    if(Visible==1){
    line(x, y, nx, ny);
    }
    
   for(int i= 0;i<4;i++){
     distancia = dist(x, y, posx[i], velocidad[i]*-1);
  if(distancia<30){
    estado[i]=0;
    velocidad[i]=0;
    nuevo[i]=1;
    posx[i]=numeroRandom(600);
    activadoRandom =0;
    contadorsalvados += 1;
      println("salvados: "+contadorsalvados);
   }
   }
  }
 
}

  void crearPizza(){
    if(hecho2==0){
      rand = int(random(100,600));
     hecho2 =1;
     contadorpizzas += 1;
    }
    image(pizza[0], rand,0-movingSpeed);
     pizza[0].resize(0, 50);
  }
   void crearPersonas( int randomnum){
     estado[randomnum]=1;
   for(int i= 0;i<4;i++){
    if(estado[i]==1){
    image(personas[i],posx[i],0-velocidad[i]);
    personas[randomnum].resize(0, 50);
    }
   }
  }
  public static int numeroRandom (int rango){
    double numR;
    numR  = Math.floor(Math.random()*rango+1);
    int intValue = (int) numR;
    return intValue;
  }
  
