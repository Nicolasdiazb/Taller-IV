



void setup(){
  size(370,320); // tamaño del canvas / compilador
  background(#000000);
}
void draw (){
  noStroke();
  fill(#d3d3c5); //cafeColor
 rect(0, 21, 156, 124);
  rect(209, 21, 140, 124);//cafe2
  rect(179, 153, 143, 168);//cafe3
  fill(#d83547); //rojoColor
  rect(21, 153, 105, 143);//rojo
  rect(209, 21, 58, 124); //rojo2 dentro de cafe2
  rect(323, 21, 26, 124); //rojo3 dentro de cafe2
  fill(#006eb7); //azulColor
  rect(127, 21, 30, 124); //azul dentro de cafe
  arc(267, 114.5, 58, 61, radians(270), radians(450));
  fill(#d3d3c5); //cafeColor
  arc(179, 114.5, 58, 61, radians(270), radians(450));
  arc(209, 114.5, 58, 61, radians(270), radians(450));
  arc(157, 114.5, 58, 61, radians(90), radians(270));
  fill(#000000); //negroColor
  arc(127, 114.5, 58, 61, radians(90), radians(270));
  arc(267, 114.5, 58, 61, radians(90), radians(270));
  
  
   fill(#006eb7); //azulColor
  arc(267, 184, 58, 61, radians(90), radians(270));
  fill(#d83547); //rojoColor
  arc(179, 184, 58, 61, radians(270), radians(450));
  arc(209, 184, 58, 61, radians(270), radians(450));
  arc(157, 184, 58, 61, radians(90), radians(270));
  fill(#006eb7); //azulColor
  arc(127, 184, 58, 61, radians(90), radians(270));
}
