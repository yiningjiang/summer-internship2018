function [y,yy]=split(x,len,ConvertibleNotesList,k)
y(:,1)=ConvertibleNotesList.Info(:,1);
y(:,1)=[];
for i=1:len
  xx=x.con(i,k);
  %��ε�һ�����������Ϣ����ȡ����ǰ������
  m2=regexpi(xx,'.+?[,����]','match');
  a=length(m2{1,1});
  if a>0
     y(i,1:a)=m2{1,1};
  %����û�ж��ŷָ�ʱ ��ȡ��������
  elseif a==0
     y(i,1)=xx;
  end;
end;

yy(:,1)=ConvertibleNotesList.Info(:,1);
yy(:,1)=[];
for i=1:len
  xx=x.con(i,k);
  m2=regexpi(xx,'[�����������߰˾�ʮ1-9][�����������߰˾�ʮ0-9]*[������]*����.+?[%��]','match');
  a=length(m2{1,1});
  if a>0
     yy(i,1:a)=m2{1,1};
  %����û��ƥ���ʱ ��ȡ��������
  elseif a==0
     yy(i,1)=xx;
  end;
end;

