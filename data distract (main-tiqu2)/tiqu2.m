%len:��������
len=length(ConvertibleNotesList.Info);

%������ȡ�������а����ؼ��ֵ����
%����structure��sh:��� hs������ xia������
%������ȡ�������а����ؼ��ֵ���� ����ʽΪ����XX���ڣ�xx����������xx�������� ��/���� xx%��
%�����strcture.con��
[sh.con,sh.ccon]=createcon(len,ConvertibleNotesList,10);
[hs.con,hs.ccon]=createcon(len,ConvertibleNotesList,11);
[xia.con,xia.ccon]=createcon(len,ConvertibleNotesList,12);

%��.con�еĶ���������ָ�
%����������ڶ��������������� �ֿ�����
%.con11.con12.con13��Ű�����ʼʱ����Ϣ�����
%.con21.con22.con23��Ű���������Ϣ�����
[sh.con11,sh.con21]=split(sh,len,ConvertibleNotesList,1);
[sh.con12,sh.con22]=split(sh,len,ConvertibleNotesList,2);
[sh.con13,sh.con23]=split(sh,len,ConvertibleNotesList,3);
[hs.con11,hs.con21]=split(hs,len,ConvertibleNotesList,1);
[hs.con12,hs.con22]=split(hs,len,ConvertibleNotesList,2);
[hs.con13,hs.con23]=split(hs,len,ConvertibleNotesList,3);
[xia.con11,xia.con21]=split(xia,len,ConvertibleNotesList,1);
[xia.con12,xia.con22]=split(xia,len,ConvertibleNotesList,2);

%��.ccon�е������������ͬ��ʽ�ָ� �����.con11 .con21��Ӧ����
%���
for i=1:len
    %�ж��Ƿ���con�в����� ccon�д��ڵ������ʽ���䣬�ǵĻ��ٽ���ƥ��
    if isempty(sh.con{i,1}) & (isempty(sh.ccon{i,1})==0)
        %������Ϣֱ�ӱ�����������
        sh.con11{i,1}=sh.ccon{i,1};
        %������Ϣ�ӹ̶���ʽ����ȡ
        xx=sh.ccon{i,1};
        m2=regexpi(xx,'[�����������߰˾�ʮ1-9][�����������߰˾�ʮ0-9]*[������]*����[^:]+','match');
        sh.con21{i,1}= m2{1,1};
    end;
end;
%����
for i=1:len
    if isempty(hs.con{i,1}) & (isempty(hs.ccon{i,1})==0)
        hs.con11{i,1}=hs.ccon{i,1};
        hs.con21{i,1}=hs.ccon{i,1};
    end;
end;
%����
for i=1:len
    if isempty(xia.con{i,1}) & (isempty(xia.ccon{i,1})==0)
        xia.con11{i,1}=xia.ccon{i,1};
        xx=xia.ccon{i,1};
        m2=regexpi(xx,'[�����������߰˾�ʮ1-9][�����������߰˾�ʮ0-9]*[������]*����[^:]+','match');
        xia.con21{i,1}= m2{1,1};
    end;
end;

%��֮ǰ�Ķ�����ȡ�У��в��ְٷ�������Ʊ����ֵ�ȣ�����������Ҫ����Ϣ����˽���ʶ��ɾȥ
hs.con21=mianzhi(hs.con21,len);
hs.con22=mianzhi(hs.con22,len);
hs.con23=mianzhi(hs.con23,len);
sh.con21=mianzhi(sh.con21,len);
sh.con22=mianzhi(sh.con22,len);
sh.con23=mianzhi(sh.con23,len);
xia.con21=mianzhi(xia.con21,len);
xia.con22=mianzhi(xia.con22,len);

%���ִ��� ����1������ǵ��������ȡʱ�������ȡ�������е��޹����֣�Ҳɾȥ
%����
for i=1:len 
  xx=hs.con21(i,1);
  m2=regexpi(xx,'[)��].+','match') ;
  a=length(m2{1,1});
  if a>0
     hs.con21(i,1)=m2{1,1};
  end;
end;
%��������1
for i=1:len 
  xx=xia.con21(i,1);
  m2=regexpi(xx,'[)��].+','match') ;
  a=length(m2{1,1});
  if a>0
     xia.con21(i,1)=m2{1,1};
  end;
end;
%��������1
for i=1:len 
  xx=xia.con22(i,1);
  m2=regexpi(xx,'[)��].+','match') ;
  a=length(m2{1,1});
  if a>0
     xia.con22(i,1)=m2{1,1};
  end;
end;

%�ӷָ�õ����������ȡ������Ϣ
%num1��ȡcon21�е�������Ϣ��num2��ȡcon22�е�������Ϣ��num3��ȡcon23�е�������Ϣ
sh.num1=numtq(sh,len,ConvertibleNotesList,sh.con21);
disp('������������1/3������Ϣ��ȡ')
sh.num2=numtq(sh,len,ConvertibleNotesList,sh.con22);
disp('������������2/3������Ϣ��ȡ')
sh.num3=numtq(sh,len,ConvertibleNotesList,sh.con23);
disp('������������3/3������Ϣ��ȡ')
hs.num1=numtq(hs,len,ConvertibleNotesList,hs.con21);
disp('����ɻ�������1/3������Ϣ��ȡ')
hs.num2=numtq(hs,len,ConvertibleNotesList,hs.con22);
disp('����ɻ�������2/3������Ϣ��ȡ')
hs.num3=numtq(hs,len,ConvertibleNotesList,hs.con23);
disp('����ɻ�������3/3������Ϣ��ȡ')
xia.num1=numtq(xia,len,ConvertibleNotesList,xia.con21);
xia.num2=numtq(xia,len,ConvertibleNotesList,xia.con22);
disp('�������������1/1������Ϣ��ȡ')
%���������д���10%���� �۸�䶯���ȴ���10% 
%��˶�Ӧ�Ĺɼ۰ٷֱ�Ϊ��100%-10%=90%���Դ˼�¼����ת��
for i=1:len
   a=length(xia.num1{i,3});
   if a==2 & xia.num1{i,3}(1)== '1' & xia.num1{i,3}(2)== '0'
        xia.num1{i,3}(1)='9';
   end;
end;

%%��ʼʱ����Ϣ����
%��date���ʱ����Ϣ ��һ��Ϊ��Ϣ���� �ڶ���Ϊ���� ������Ϊ������ĵ�������
date(:,1)=ConvertibleNotesList.Info(:,6);
date(:,2)=ConvertibleNotesList.Info(:,5);
%���㵽������
for i=1:len
    date{i,1}=str2num(date{i,1});
    date{i,3}=date{i,1}+date{i,2}*10000;
end;

%��ʼ���ڼ���
%��֮ǰ��ȡ�İ���������Ϣ����� �ٽ��йؼ�����ȡ
%���ݲ�ͬ�Ĺؼ��� ��������Ӧ��ʱ��
sh.date1=datetq(sh,len,ConvertibleNotesList,sh.con11,date);
disp('������������1/3������Ϣ��ȡ')
sh.date2=datetq(sh,len,ConvertibleNotesList,sh.con12,date);
disp('������������2/3������Ϣ��ȡ')
sh.date3=datetq(sh,len,ConvertibleNotesList,sh.con13,date);
disp('������������3/3������Ϣ��ȡ')
hs.date1=datetq(hs,len,ConvertibleNotesList,hs.con11,date);
disp('����ɻ�������1/3������Ϣ��ȡ')
hs.date2=datetq(hs,len,ConvertibleNotesList,hs.con12,date);
disp('����ɻ�������2/3������Ϣ��ȡ')
hs.date3=datetq(hs,len,ConvertibleNotesList,hs.con13,date);
disp('����ɻ�������3/3������Ϣ��ȡ')
xia.date1=datetq(xia,len,ConvertibleNotesList,xia.con11,date);
disp('�������������1/1������Ϣ��ȡ')
%��ȡ����Ϣ�ϲ� ����1��1-4�� ����2��5-8�� ����3��9-12�� 
%��һ��Ϊ�������ʼ���ڣ�������Ϊ��ȡ������
huishou(:,1)=hs.date1(:,1);
huishou(:,2:4)=hs.num1(:,1:3);
huishou(:,5)=hs.date2(:,1);
huishou(:,6:8)=hs.num2(:,1:3);
huishou(:,9)=hs.date3(:,1);
huishou(:,10:12)=hs.num3(:,1:3);
disp('����ɻ�������������ȡ,���ݱ�����huishou��')
shuhui(:,1)=sh.date1(:,1);
shuhui(:,2:4)=sh.num1(:,1:3);
shuhui(:,5)=sh.date2(:,1);
shuhui(:,6:8)=sh.num2(:,1:3);
shuhui(:,9)=sh.date3(:,1);
shuhui(:,10:12)=sh.num3(:,1:3);
disp('������������������ȡ,���ݱ�����shuhui��')
xiaxiu(:,1)=xia.date1(:,1);
xiaxiu(:,2:4)=xia.num1(:,1:3);
disp('�������������������ȡ,���ݱ�����xiaxiu��')
%����ǰ����Ϊ�� ���������е���Ϣǰ��
for i=1:len
   if isempty(shuhui{i,1}) & isempty(shuhui{i,2}) & isempty(shuhui{i,3}) & isempty(shuhui{i,4}) & (isempty(shuhui{i,5})==0)
       shuhui(i,1:4)=shuhui(i,5:8);
       shuhui{i,5}=[];shuhui{i,6}=[];shuhui{i,7}=[];shuhui{i,8}=[];
   end;
end;

clear a;clear d;clear dd;clear i;clear j;clear len;clear m2;clear xx;clear hs;clear sh;clear xia; clear date;clear i;
