function y=lilvnumtq(len,ConvertibleNotesList,k,date)
%��������������ȡ �����num1��
y(:,1)=ConvertibleNotesList.Info(:,1);
y(:,1)=[];
for i=1:len
  xx=k(i,1);
  %ƥ������
  m2=regexpi(xx,'[.0-9]+[%��]','match');
  a=length(m2{1,1});
  if a<= date{i,2}
    m3=regexpi(xx,'����','match');
    a3=length(m3{1,1});
    m3=regexpi(xx,'��1%,����','match');
    a4=length(m3{1,1});
    %�����ʽ ���� ǰ�İٷ���ɾȥ
    if a4>0
      y{i,1}=date{i,3};
      y{i,2}=m2{1,1}(2);
    %����ؼ����� �������߰ٷ���
    elseif a3>0
      y{i,1}=date{i,3};
      y{i,2}=m2{1,1}(1);
    %ͨ������� ����������ȡ�İٷ���
    else
      %�ϲ�ʱ��Ͷ�Ӧ������ 
      y(i,1:2:(2*a-1))=date(i,3:a+2); 
      y(i,2:2:(2*a))=m2{1,1};
    end;
  elseif a>date{i,2}  
    n=date{i,2};
    %�ùؼ����� ǰ������ȡ�İٷֱ��ظ� ֻ�����ڶ�����ʼ�İٷֱ�
    m3=regexpi(xx,'�Ժ�ÿ������','match');
    a3=length(m3{1,1});
    if a3>0
      y(i,1:2:(2*n-1))=date(i,3:n+2);
      y(i,2:2:(2*n))=m2{1,1}(2:n+1);
    else
      y(i,1:2:(2*n-1))=date(i,3:n+2);
      y(i,2:2:(2*n))=m2{1,1}(1:n);
    end;
  end;
end;    
