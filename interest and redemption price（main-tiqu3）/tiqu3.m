%len:��������
len=length(ConvertibleNotesList.Info);
%�������������ݴ���lil.con��
lil.con(:,1)=ConvertibleNotesList.Info(:,8);

%���ڼ���
date(:,1)=ConvertibleNotesList.Info(:,6);
date(:,2)=ConvertibleNotesList.Info(:,5);
%�������Ϣ�����ڵ�ÿһ����Ϣ����ʼ����
for i=1:len
    date{i,1}=str2num(date{i,1});
    for j=3:(date{i,2}+2)
      date{i,j}=(j-3)*10000+date{i,1};
    end;
end;

%��ȡ������Ϣ
lilv=lilvnumtq(len,ConvertibleNotesList,lil.con,date);

%��ؼ۸���Ϣ��ȡ
%mz.con���������mz.num�����ȡ���İٷ�����mz.han�ж�ÿ���ٷ����Ƿ�����Ϣ
[mz.con,mz.num,mz.han]=mianzhitq(len,ConvertibleNotesList);

%shuhuijia��źϲ������ؼ۸�
[m,wid1]=size(mz.num);
[m,wid2]=size(mz.han);
for i=1:wid1
   shuhuijia(:,2*i-1)=mz.num(:,i);
end;
for i=1:wid2
   shuhuijia(:,2*i)=mz.han(:,i);
end;

clear date;clear i;clear j;clear len;clear lil;clear m;clear mz;clear shuhuijia;clear wid1;clear wid2;
