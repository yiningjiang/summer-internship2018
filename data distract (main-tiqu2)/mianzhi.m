function y=mianzhi(yy,len)
%��֮ǰ�Ķ�����ȡ�У��в��ְٷ�������Ʊ����ֵ�ȣ�����������Ҫ����Ϣ����˽���ʶ��ɾȥ
for i=1:len
  xx=yy(i,1);
  m2=regexpi(xx,'[^ȯ]��ֵ','match'); 
  a=length(m2{1,1});
  if a>0
     yy(i,1)={'��'};
  end;
  xx=yy(i,1);
  m2=regexpi(xx,'Ʊ��','match') ;
  a=length(m2{1,1});
  if a>0
     yy(i,1)={'��'};
  end;  
end; 
y=yy;