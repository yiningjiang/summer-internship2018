%len:条款总数
len=length(ConvertibleNotesList.Info);

%初步提取出条款中包含关键字的语句
%三个structure：sh:赎回 hs：回售 xia：下修
%初步提取出条款中包含关键字的语句 （形式为：在XX期内，xx个交易日中xx个交易日 高/低于 xx%）
%存放在strcture.con中
[sh.con,sh.ccon]=createcon(len,ConvertibleNotesList,10);
[hs.con,hs.ccon]=createcon(len,ConvertibleNotesList,11);
[xia.con,xia.ccon]=createcon(len,ConvertibleNotesList,12);

%对.con中的段落进行语句分割
%部分条款存在多个符合条件的语段 分开处理
%.con11.con12.con13存放包含起始时间信息的语句
%.con21.con22.con23存放包含数字信息的语句
[sh.con11,sh.con21]=split(sh,len,ConvertibleNotesList,1);
[sh.con12,sh.con22]=split(sh,len,ConvertibleNotesList,2);
[sh.con13,sh.con23]=split(sh,len,ConvertibleNotesList,3);
[hs.con11,hs.con21]=split(hs,len,ConvertibleNotesList,1);
[hs.con12,hs.con22]=split(hs,len,ConvertibleNotesList,2);
[hs.con13,hs.con23]=split(hs,len,ConvertibleNotesList,3);
[xia.con11,xia.con21]=split(xia,len,ConvertibleNotesList,1);
[xia.con12,xia.con22]=split(xia,len,ConvertibleNotesList,2);

%将.ccon中的特殊段落用相同方式分割 存放入.con11 .con21相应行中
%赎回
for i=1:len
    %判断是否是con中不存在 ccon中存在的特殊句式段落，是的话再进行匹配
    if isempty(sh.con{i,1}) & (isempty(sh.ccon{i,1})==0)
        %日期信息直接保存整个段落
        sh.con11{i,1}=sh.ccon{i,1};
        %数字信息从固定句式中提取
        xx=sh.ccon{i,1};
        m2=regexpi(xx,'[二三四五六七八九十1-9][二三四五六七八九十0-9]*[个连续]*交易[^:]+','match');
        sh.con21{i,1}= m2{1,1};
    end;
end;
%回售
for i=1:len
    if isempty(hs.con{i,1}) & (isempty(hs.ccon{i,1})==0)
        hs.con11{i,1}=hs.ccon{i,1};
        hs.con21{i,1}=hs.ccon{i,1};
    end;
end;
%下修
for i=1:len
    if isempty(xia.con{i,1}) & (isempty(xia.ccon{i,1})==0)
        xia.con11{i,1}=xia.ccon{i,1};
        xx=xia.ccon{i,1};
        m2=regexpi(xx,'[二三四五六七八九十1-9][二三四五六七八九十0-9]*[个连续]*交易[^:]+','match');
        xia.con21{i,1}= m2{1,1};
    end;
end;

%在之前的段落提取中，有部分百分数代表票面面值比，不是我们需要的信息，因此进行识别删去
hs.con21=mianzhi(hs.con21,len);
hs.con22=mianzhi(hs.con22,len);
hs.con23=mianzhi(hs.con23,len);
sh.con21=mianzhi(sh.con21,len);
sh.con22=mianzhi(sh.con22,len);
sh.con23=mianzhi(sh.con23,len);
xia.con21=mianzhi(xia.con21,len);
xia.con22=mianzhi(xia.con22,len);

%部分带有 “（1）”标记的语句在提取时会多余提取到括号中的无关数字，也删去
%回售
for i=1:len 
  xx=hs.con21(i,1);
  m2=regexpi(xx,'[)）].+','match') ;
  a=length(m2{1,1});
  if a>0
     hs.con21(i,1)=m2{1,1};
  end;
end;
%下修条款1
for i=1:len 
  xx=xia.con21(i,1);
  m2=regexpi(xx,'[)）].+','match') ;
  a=length(m2{1,1});
  if a>0
     xia.con21(i,1)=m2{1,1};
  end;
end;
%下修条款1
for i=1:len 
  xx=xia.con22(i,1);
  m2=regexpi(xx,'[)）].+','match') ;
  a=length(m2{1,1});
  if a>0
     xia.con22(i,1)=m2{1,1};
  end;
end;

%从分割得到的语句中提取数字信息
%num1提取con21中的数字信息，num2提取con22中的数字信息，num3提取con23中的数字信息
sh.num1=numtq(sh,len,ConvertibleNotesList,sh.con21);
disp('已完成赎回条款1/3数字信息提取')
sh.num2=numtq(sh,len,ConvertibleNotesList,sh.con22);
disp('已完成赎回条款2/3数字信息提取')
sh.num3=numtq(sh,len,ConvertibleNotesList,sh.con23);
disp('已完成赎回条款3/3数字信息提取')
hs.num1=numtq(hs,len,ConvertibleNotesList,hs.con21);
disp('已完成回售条款1/3数字信息提取')
hs.num2=numtq(hs,len,ConvertibleNotesList,hs.con22);
disp('已完成回售条款2/3数字信息提取')
hs.num3=numtq(hs,len,ConvertibleNotesList,hs.con23);
disp('已完成回售条款3/3数字信息提取')
xia.num1=numtq(xia,len,ConvertibleNotesList,xia.con21);
xia.num2=numtq(xia,len,ConvertibleNotesList,xia.con22);
disp('已完成下修条款1/1数字信息提取')
%下修条款中存在10%代表 价格变动幅度大于10% 
%因此对应的股价百分比为（100%-10%=90%）对此记录进行转换
for i=1:len
   a=length(xia.num1{i,3});
   if a==2 & xia.num1{i,3}(1)== '1' & xia.num1{i,3}(2)== '0'
        xia.num1{i,3}(1)='9';
   end;
end;

%%初始时间信息计算
%用date存放时间信息 第一列为起息日期 第二列为期限 第三列为计算出的到期日期
date(:,1)=ConvertibleNotesList.Info(:,6);
date(:,2)=ConvertibleNotesList.Info(:,5);
%计算到期日期
for i=1:len
    date{i,1}=str2num(date{i,1});
    date{i,3}=date{i,1}+date{i,2}*10000;
end;

%起始日期计算
%对之前提取的包含日期信息的语句 再进行关键词提取
%依据不同的关键词 计算出相对应的时间
sh.date1=datetq(sh,len,ConvertibleNotesList,sh.con11,date);
disp('已完成赎回条款1/3日期信息提取')
sh.date2=datetq(sh,len,ConvertibleNotesList,sh.con12,date);
disp('已完成赎回条款2/3日期信息提取')
sh.date3=datetq(sh,len,ConvertibleNotesList,sh.con13,date);
disp('已完成赎回条款3/3日期信息提取')
hs.date1=datetq(hs,len,ConvertibleNotesList,hs.con11,date);
disp('已完成回售条款1/3日期信息提取')
hs.date2=datetq(hs,len,ConvertibleNotesList,hs.con12,date);
disp('已完成回售条款2/3日期信息提取')
hs.date3=datetq(hs,len,ConvertibleNotesList,hs.con13,date);
disp('已完成回售条款3/3日期信息提取')
xia.date1=datetq(xia,len,ConvertibleNotesList,xia.con11,date);
disp('已完成下修条款1/1日期信息提取')
%提取的信息合并 条款1在1-4列 条款2在5-8列 条款3在9-12列 
%第一列为条款的起始日期，后三列为提取的数字
huishou(:,1)=hs.date1(:,1);
huishou(:,2:4)=hs.num1(:,1:3);
huishou(:,5)=hs.date2(:,1);
huishou(:,6:8)=hs.num2(:,1:3);
huishou(:,9)=hs.date3(:,1);
huishou(:,10:12)=hs.num3(:,1:3);
disp('已完成回售条款数据提取,数据保存在huishou中')
shuhui(:,1)=sh.date1(:,1);
shuhui(:,2:4)=sh.num1(:,1:3);
shuhui(:,5)=sh.date2(:,1);
shuhui(:,6:8)=sh.num2(:,1:3);
shuhui(:,9)=sh.date3(:,1);
shuhui(:,10:12)=sh.num3(:,1:3);
disp('已完成赎回条款数据提取,数据保存在shuhui中')
xiaxiu(:,1)=xia.date1(:,1);
xiaxiu(:,2:4)=xia.num1(:,1:3);
disp('已完成下修条款数据提取,数据保存在xiaxiu中')
%存在前四列为空 调整后四列的信息前移
for i=1:len
   if isempty(shuhui{i,1}) & isempty(shuhui{i,2}) & isempty(shuhui{i,3}) & isempty(shuhui{i,4}) & (isempty(shuhui{i,5})==0)
       shuhui(i,1:4)=shuhui(i,5:8);
       shuhui{i,5}=[];shuhui{i,6}=[];shuhui{i,7}=[];shuhui{i,8}=[];
   end;
end;

clear a;clear d;clear dd;clear i;clear j;clear len;clear m2;clear xx;clear hs;clear sh;clear xia; clear date;clear i;
