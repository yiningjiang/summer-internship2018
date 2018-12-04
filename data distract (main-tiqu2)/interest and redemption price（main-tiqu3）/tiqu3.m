%len:条款总数
len=length(ConvertibleNotesList.Info);
%将利率条款内容存在lil.con中
lil.con(:,1)=ConvertibleNotesList.Info(:,8);

%日期计算
date(:,1)=ConvertibleNotesList.Info(:,6);
date(:,2)=ConvertibleNotesList.Info(:,5);
%计算从起息至到期的每一个计息年起始日期
for i=1:len
    date{i,1}=str2num(date{i,1});
    for j=3:(date{i,2}+2)
      date{i,j}=(j-3)*10000+date{i,1};
    end;
end;

%提取利率信息
lilv=lilvnumtq(len,ConvertibleNotesList,lil.con,date);

%赎回价格信息提取
%mz.con存放赎回条款，mz.num存放提取出的百分数，mz.han判断每个百分数是否含有利息
[mz.con,mz.num,mz.han]=mianzhitq(len,ConvertibleNotesList);

%shuhuijia存放合并后的赎回价格
[m,wid1]=size(mz.num);
[m,wid2]=size(mz.han);
for i=1:wid1
   shuhuijia(:,2*i-1)=mz.num(:,i);
end;
for i=1:wid2
   shuhuijia(:,2*i)=mz.han(:,i);
end;

clear date;clear i;clear j;clear len;clear lil;clear m;clear mz;clear shuhuijia;clear wid1;clear wid2;
