function [y,yy]=createcon(len,ConvertibleNotesList,k)
%����structure��sh:��� hs������ xia������
%������ȡ�������а����ؼ��ֵ���� ����ʽΪ����XX���ڣ�xx����������xx�������� ��/���� xx%��
%�����strcture.con��
%������������ȡ
%��ʼ��cell��strcture.con
y(:,1)=ConvertibleNotesList.Info(:,1);
y(:,1)=[];
%ͨ��ѭ�����н�����ȡ
for i=1:len
  %xx=ԭ�����������
  xx=ConvertibleNotesList.Info(i,k);
  %m2:match�Ľ��
  m2=regexpi(xx,'[^,.:������]+[,��]*[^,��]+?��[^,��]+?\d+[%��]','match');
  %a:match������������������
  a=length(m2{1,1}) ;
  %������
  y(i,1:a)=m2{1,1};
end;
%������con��û�ܳɹ���ȡ��������䣨��ʽ������֮ǰ�Ĺ��ɣ���������ȡ�����.ccon��
%����������������
yy(:,1)=ConvertibleNotesList.Info(:,1);
yy(:,1)=[];
for i=1:len
  xx=ConvertibleNotesList.Info(i,k);
  m2=regexpi(xx,'[^,.:������]+[,��]*[^,��]+?��[����]*����[^,��]+?[,��][^,����]+?\d+[%��]','match');
  a=length(m2{1,1});
  yy(i,1:a)=m2{1,1};
end;
%��.ccon����ѡ������.con��δ��ʶ�������䣬ɾȥ��ʶ����Ķ�������ظ�
for i=1:len
    %���ccon�д��� ��con��Ҳ���ڣ��ظ���ɾȥccon�Ķ�Ӧ����
    if (isempty(y{i,1})==0) & (isempty(yy{i,1})==0)
        yy{i,1}=[];
    end;
end;