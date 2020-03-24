function rightEdge = findRightEdge(i,j,img_d2)
  rightEdge = -1;
  for pos = j:size(img_d2,2)
    if(pos==size(img_d2,2))
      rightEdge = pos;
      break;
    end
    
    if(img_d2(i,pos)>0 && img_d2(i, pos+1)<=0)
      rightEdge = pos;
      break
    end
  
 end
  
end