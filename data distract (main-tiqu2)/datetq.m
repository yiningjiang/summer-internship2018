function y=datetq(x,len,ConvertibleNotesList,k,date)
%���ڼ���
%��֮ǰ��ȡ�İ���������Ϣ����� �ٽ��йؼ�����ȡ
%���ݲ�ͬ�Ĺؼ��� ��������Ӧ��ʱ��
%���������������ʼ����
y(:,1)=ConvertibleNotesList.Info(:,6);
y(:,1)=[] ;
for i=1:len
  xx=k(i,1);
  m2=regexpi(xx,'������','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1};  %������=��Ϣ��
  end;
  m2=regexpi(xx,'������','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1};
  end;
  m2=regexpi(xx,'����','match');  %����=��Ϣ��
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1};
  end;
  m2=regexpi(xx,'����','match') ;%����=��Ϣ��
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1};
  end;
  m2=regexpi(xx,'[ת��]����','match'); %ת����=6���º�
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100); 
     %dd=ԭ�·�+6
     %ԭ�·�+6�������12 ��Ҫת��Ϊ��һ����·�
     if(dd>12) 
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'ת����','match'); 
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'����֮ǰ','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1};
  end;
  m2=regexpi(xx,'�����','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'һ��','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+10000;  
  end;
  m2=regexpi(xx,'����','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'�ڶ�','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+10000;  
  end;
  m2=regexpi(xx,'48����','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+40000;  
  end;
  m2=regexpi(xx,'36����','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+30000;  
  end;
  m2=regexpi(xx,'24����','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'��ʮ�ĸ���','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'12����','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+10000;  
  end;
  m2=regexpi(xx,'ʮ������','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'[^3]6����','match'); %6������36��������
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'[^ʮ]������','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'���к��6��','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'����֮��','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'�����','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'������Ϣ','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'������Ϣ','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+30000;  
  end;
  m2=regexpi(xx,'��[5��]��','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+40000;  
  end;
  m2=regexpi(xx,'��ʮ�ĸ���[֮]*��','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'24����[֮]*��','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'12����[֮]*��','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+10000;  
  end;
  m2=regexpi(xx,'[^3]6����[֮]*��','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'[^ʮ]������[֮]*��','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  %ǰxx��������ǰ��Ӧʱ�� �õ������ڼ�ȥ��Ӧ�·�/���
  m2=regexpi(xx,'ǰһ��','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,3}-10000;  
  end;
  m2=regexpi(xx,'ǰһ��','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,3}-10000;  
  end;
  m2=regexpi(xx,'ǰ2��','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,3}-20000;  
  end;
  m2=regexpi(xx,'ǰ24����','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,3}-20000;  
  end;
  m2=regexpi(xx,'���[2��][����]','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,3}-20000;  
  end;
  m2=regexpi(xx,'���һ','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,3}-10000;  
  end;
  m2=regexpi(xx,'��[��3][��]*','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'��[��2]��','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+10000;  
  end;
  m2=regexpi(xx,'����','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,3}-600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,3}-9400;
     elseif dd==0
         y{i,1}=date{i,3}-8800;
     else
         y{i,1}=date{i,3}-600;
     end;   
  end;
  m2=regexpi(xx,'ǰ����','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,3}-600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,3}-9400;
     elseif dd==0
         y{i,1}=date{i,3}-8800;
     else
         y{i,1}=date{i,3}-600;
     end;   
  end;
  m2=regexpi(xx,'ǰ[6��]����','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,3}-600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,3}-9400;
     elseif dd==0
         y{i,1}=date{i,3}-8800;
     else
         y{i,1}=date{i,3}-600;
     end;   
  end;
  m2=regexpi(xx,'ǰ180','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,3}-600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,3}-9400;
     elseif dd==0
         y{i,1}=date{i,3}-8800;
     else
         y{i,1}=date{i,3}-600;
     end;   
  end;
end;

