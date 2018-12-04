 function [y,y4,y3]=mianzhitq(len,ConvertibleNotesList)
%赎回价格关键语句提取 
y(:,1)=ConvertibleNotesList.Info(:,1);
y(:,1)=[];
for i=1:len
  xx=ConvertibleNotesList.Info(i,10);
  m2=regexpi(xx,'[^。;；]+?面值[的上浮至]*[0-9.]+[%％][^。;；]*','match');
  a=length(m2{1,1});
  y(i,1:a)=m2{1,1};
end;

%百分比关键词提取
y2(:,1)=ConvertibleNotesList.Info(:,1);
y2(:,1)=[];
for i=1:len
    for j=1:4
      xx=y(i,j);
      m2=regexpi(xx,'面值[的上浮至]*[0-9.]+[%％]','match');
      a=length(m2{1,1});
      y2(i,j:j+a-1)=m2{1,1};
    end;
end;

%将百分比转化为数字
y4(:,1)=ConvertibleNotesList.Info(:,1);
y4(:,1)=[];
  for i=1:len
    for j=1:4
       xx=y2(i,j);
       m2=regexpi(xx,'[0-9.]+','match');
       a=length(m2{1,1});
       y4(i,j:j+a-1)=m2{1,1};
       if (a>0)
           %含上浮的关键词需要在原百分比基础上加上100%
          y4{i,j}=str2num(y4{i,j});
          m2=regexpi(xx,'上浮','match');
          a=length(m2{1,1});
          if a>0
             y4{i,j}=y4{i,j}+100;
          end;
       end;
    end;
end;
 %判断每个百分比是否含利息 含利息标记“含” 不含利息标记“不含”  
y3(:,1)=ConvertibleNotesList.Info(:,1);
y3(:,1)=[];
for i=1:len
    for j=1:4
      xx=y(i,j);
      m2=regexpi(xx,'加[^)）。，,]*?息','match');
      a=length(m2{1,1});
      if a>0
         y3{i,j}='不含';
      end;
      m2=regexpi(xx,'含[^)）。，,]*?利息','match');
      a=length(m2{1,1});
      if a>0
         y3{i,j}='含';
      end;
      m2=regexpi(xx,'[(（]不含','match');
      a=length(m2{1,1});
      if a>0
         y3{i,j}='不含';
      end;   
    end;
    xx=ConvertibleNotesList.Info(i,10);
    %特殊情况：在条款最后说明了均含利息
    m2=regexpi(xx,'均[已]*含','match');
    a=length(m2{1,1});
    if a>0
       for k=1:4
           if (isempty(y4{i,k})==0)
              y3{i,k}='含';
           end;
       end;
    end;  
end;