 function [y,y4,y3]=mianzhitq(len,ConvertibleNotesList)
%��ؼ۸�ؼ������ȡ 
y(:,1)=ConvertibleNotesList.Info(:,1);
y(:,1)=[];
for i=1:len
  xx=ConvertibleNotesList.Info(i,10);
  m2=regexpi(xx,'[^��;��]+?��ֵ[���ϸ���]*[0-9.]+[%��][^��;��]*','match');
  a=length(m2{1,1});
  y(i,1:a)=m2{1,1};
end;

%�ٷֱȹؼ�����ȡ
y2(:,1)=ConvertibleNotesList.Info(:,1);
y2(:,1)=[];
for i=1:len
    for j=1:4
      xx=y(i,j);
      m2=regexpi(xx,'��ֵ[���ϸ���]*[0-9.]+[%��]','match');
      a=length(m2{1,1});
      y2(i,j:j+a-1)=m2{1,1};
    end;
end;

%���ٷֱ�ת��Ϊ����
y4(:,1)=ConvertibleNotesList.Info(:,1);
y4(:,1)=[];
  for i=1:len
    for j=1:4
       xx=y2(i,j);
       m2=regexpi(xx,'[0-9.]+','match');
       a=length(m2{1,1});
       y4(i,j:j+a-1)=m2{1,1};
       if (a>0)
           %���ϸ��Ĺؼ�����Ҫ��ԭ�ٷֱȻ����ϼ���100%
          y4{i,j}=str2num(y4{i,j});
          m2=regexpi(xx,'�ϸ�','match');
          a=length(m2{1,1});
          if a>0
             y4{i,j}=y4{i,j}+100;
          end;
       end;
    end;
end;
 %�ж�ÿ���ٷֱ��Ƿ���Ϣ ����Ϣ��ǡ����� ������Ϣ��ǡ�������  
y3(:,1)=ConvertibleNotesList.Info(:,1);
y3(:,1)=[];
for i=1:len
    for j=1:4
      xx=y(i,j);
      m2=regexpi(xx,'��[^)������,]*?Ϣ','match');
      a=length(m2{1,1});
      if a>0
         y3{i,j}='����';
      end;
      m2=regexpi(xx,'��[^)������,]*?��Ϣ','match');
      a=length(m2{1,1});
      if a>0
         y3{i,j}='��';
      end;
      m2=regexpi(xx,'[(��]����','match');
      a=length(m2{1,1});
      if a>0
         y3{i,j}='����';
      end;   
    end;
    xx=ConvertibleNotesList.Info(i,10);
    %������������������˵���˾�����Ϣ
    m2=regexpi(xx,'��[��]*��','match');
    a=length(m2{1,1});
    if a>0
       for k=1:4
           if (isempty(y4{i,k})==0)
              y3{i,k}='��';
           end;
       end;
    end;  
end;