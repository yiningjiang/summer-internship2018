function y=lilvnumtq(len,ConvertibleNotesList,k,date)
%利率条款数字提取 存放在num1中
y(:,1)=ConvertibleNotesList.Info(:,1);
y(:,1)=[];
for i=1:len
  xx=k(i,1);
  %匹配数字
  m2=regexpi(xx,'[.0-9]+[%％]','match');
  a=length(m2{1,1});
  if a<= date{i,2}
    m3=regexpi(xx,'区间','match');
    a3=length(m3{1,1});
    m3=regexpi(xx,'由1%,增至','match');
    a4=length(m3{1,1});
    %特殊句式 增至 前的百分数删去
    if a4>0
      y{i,1}=date{i,3};
      y{i,2}=m2{1,1}(2);
    %区间关键词下 保留底线百分数
    elseif a3>0
      y{i,1}=date{i,3};
      y{i,2}=m2{1,1}(1);
    %通常情况下 保留所有提取的百分数
    else
      %合并时间和对应的利率 
      y(i,1:2:(2*a-1))=date(i,3:a+2); 
      y(i,2:2:(2*a))=m2{1,1};
    end;
  elseif a>date{i,2}  
    n=date{i,2};
    %该关键词下 前两个提取的百分比重复 只保留第二个开始的百分比
    m3=regexpi(xx,'以后每年增加','match');
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
