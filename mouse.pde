void mousePressed(){
  anchorx = anchorx + (mouseX - (width/2))/(100*zoom);
  anchory = anchory + ((height/2) - mouseY)/(100*zoom);
  println(anchorx,anchory);
}

void keyPressed(){
  if(key == 'm'){
    zoom*=2;
  }else if(key == 'n'){
    zoom/=2;
  }
  if(key == 'd'){
    detail = !detail;
  }
}