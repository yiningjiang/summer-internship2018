function y=numtq(x,len,ConvertibleNotesList,k)
%从分割得到的语句中提取数字信息
%num1提取con21中的数字信息，num2提取con22中的数字信息，num3提取con23中的数字信息
%赎回条款数字提取 存放在num1中
y(:,1)=ConvertibleNotesList.Info(:,1);
y(:,1)=[];
for i=1:len
  xx=k(i,1);
  %匹配数字
  m2=regexpi(xx,'[二三四五六七八九十1-9][二三四五六七八九十0-9]*','match');
  a=length(m2{1,1});
  %匹配长度为4时，2、3项重复出现，删去第3项
  if a==4
    y(i,1:3)=m2{1,1}([1,2,4]);
  %匹配长度为2时 第1项为连续交易日天数 第2项为百分数
  elseif a==2
    y(i,1)=m2{1,1}(1);
    y(i,2:3)=m2{1,1};
  %匹配长度为3时 直接保存提取结果
  else 
    y(i,1:a)=m2{1,1};
  end;    
end;

%提取的数字信息中存在汉字形式的数字 将它们转换为阿拉伯数字
for i=1:len
    for j=1:3
        a=length(y{i,j});
        %三十转为30 二十变为20 十五变为15
        if(a==2)
          if y{i,j}(1)== '三' & y{i,j}(2)== '十'
            y{i,j}(1)='3';
            y{i,j}(2)='0';
          elseif y{i,j}(1)== '二' & y{i,j}(2)== '十'
            y{i,j}(1)='2';
            y{i,j}(2)='0';
          elseif y{i,j}(1)== '十' & y{i,j}(2)== '五'
            y{i,j}(1)='1';
            y{i,j}(2)='5';
          end;
        %十变为10
        elseif a==1
           if y{i,j}(1)== '十'
            y{i,j}(1)='1';
            y{i,j}(2)='0';
           elseif y{i,j}(1)== '1'
            y{i,j}(1)='3';
            y{i,j}(2)='0';
           end;
        end;
    end;
end;