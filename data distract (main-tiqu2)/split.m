function [y,yy]=split(x,len,ConvertibleNotesList,k)
y(:,1)=ConvertibleNotesList.Info(:,1);
y(:,1)=[];
for i=1:len
  xx=x.con(i,k);
  %语段第一句包含日期信息，提取逗号前的内容
  m2=regexpi(xx,'.+?[,，。]','match');
  a=length(m2{1,1});
  if a>0
     y(i,1:a)=m2{1,1};
  %段落没有逗号分隔时 提取整个段落
  elseif a==0
     y(i,1)=xx;
  end;
end;

yy(:,1)=ConvertibleNotesList.Info(:,1);
yy(:,1)=[];
for i=1:len
  xx=x.con(i,k);
  m2=regexpi(xx,'[二三四五六七八九十1-9][二三四五六七八九十0-9]*[个连续]*交易.+?[%％]','match');
  a=length(m2{1,1});
  if a>0
     yy(i,1:a)=m2{1,1};
  %段落没有匹配句时 提取整个段落
  elseif a==0
     yy(i,1)=xx;
  end;
end;

