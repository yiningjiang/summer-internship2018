function y=mianzhi(yy,len)
%在之前的段落提取中，有部分百分数代表票面面值比，不是我们需要的信息，因此进行识别删去
for i=1:len
  xx=yy(i,1);
  m2=regexpi(xx,'[^券]面值','match'); 
  a=length(m2{1,1});
  if a>0
     yy(i,1)={'面'};
  end;
  xx=yy(i,1);
  m2=regexpi(xx,'票面','match') ;
  a=length(m2{1,1});
  if a>0
     yy(i,1)={'面'};
  end;  
end; 
y=yy;