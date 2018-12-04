function [y,yy]=createcon(len,ConvertibleNotesList,k)
%三个structure：sh:赎回 hs：回售 xia：下修
%初步提取出条款中包含关键字的语句 （形式为：在XX期内，xx个交易日中xx个交易日 高/低于 xx%）
%存放在strcture.con中
%赎回条款初步提取
%初始化cell：strcture.con
y(:,1)=ConvertibleNotesList.Info(:,1);
y(:,1)=[];
%通过循环逐行进行提取
for i=1:len
  %xx=原赎回条款内容
  xx=ConvertibleNotesList.Info(i,k);
  %m2:match的结果
  m2=regexpi(xx,'[^,.:，：。]+[,，]*[^,，]+?个[^,，]+?\d+[%％]','match');
  %a:match出符合条件的语句个数
  a=length(m2{1,1}) ;
  %保存结果
  y(i,1:a)=m2{1,1};
end;
%部分在con中没能成功提取的特殊语句（形式不符合之前的规律），单独提取存放在.ccon中
%赎回条款中特殊语句
yy(:,1)=ConvertibleNotesList.Info(:,1);
yy(:,1)=[];
for i=1:len
  xx=ConvertibleNotesList.Info(i,k);
  m2=regexpi(xx,'[^,.:，：。]+[,，]*[^,，]+?个[连续]*交易[^,，]+?[,，][^,，─]+?\d+[%％]','match');
  a=length(m2{1,1});
  yy(i,1:a)=m2{1,1};
end;
%在.ccon中挑选保留下.con中未能识别出的语句，删去已识别出的段落避免重复
for i=1:len
    %如果ccon中存在 而con中也存在，重复，删去ccon的对应内容
    if (isempty(y{i,1})==0) & (isempty(yy{i,1})==0)
        yy{i,1}=[];
    end;
end;