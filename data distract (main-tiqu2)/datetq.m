function y=datetq(x,len,ConvertibleNotesList,k,date)
%日期计算
%对之前提取的包含日期信息的语句 再进行关键词提取
%依据不同的关键词 计算出相对应的时间
%计算下修条款的起始日期
y(:,1)=ConvertibleNotesList.Info(:,6);
y(:,1)=[] ;
for i=1:len
  xx=k(i,1);
  m2=regexpi(xx,'存续期','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1};  %存续期=起息日
  end;
  m2=regexpi(xx,'回售期','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1};
  end;
  m2=regexpi(xx,'任意','match');  %任意=起息日
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1};
  end;
  m2=regexpi(xx,'修正','match') ;%修正=起息日
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1};
  end;
  m2=regexpi(xx,'[转换]股期','match'); %转股期=6个月后
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100); 
     %dd=原月份+6
     %原月份+6如果大于12 需要转换为下一年的月份
     if(dd>12) 
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'转换期','match'); 
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'到期之前','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1};
  end;
  m2=regexpi(xx,'赎回期','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'一年','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+10000;  
  end;
  m2=regexpi(xx,'两年','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'第二','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+10000;  
  end;
  m2=regexpi(xx,'48个月','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+40000;  
  end;
  m2=regexpi(xx,'36个月','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+30000;  
  end;
  m2=regexpi(xx,'24个月','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'二十四个月','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'12个月','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+10000;  
  end;
  m2=regexpi(xx,'十二个月','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'[^3]6个月','match'); %6个月与36个月区别开
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'[^十]六个月','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'发行后的6个','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'两年之后','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'两年后','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'两个计息','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'三个计息','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+30000;  
  end;
  m2=regexpi(xx,'第[5五]个','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+40000;  
  end;
  m2=regexpi(xx,'二十四个月[之]*后','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'24个月[之]*后','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'12个月[之]*后','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+10000;  
  end;
  m2=regexpi(xx,'[^3]6个月[之]*后','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  m2=regexpi(xx,'[^十]六个月[之]*后','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,1}+600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,1}+9400;
     else
         y{i,1}=date{i,1}+600;
     end;   
  end;
  %前xx：到期日前对应时间 用到期日期减去相应月份/年份
  m2=regexpi(xx,'前一个','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,3}-10000;  
  end;
  m2=regexpi(xx,'前一年','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,3}-10000;  
  end;
  m2=regexpi(xx,'前2年','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,3}-20000;  
  end;
  m2=regexpi(xx,'前24个月','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,3}-20000;  
  end;
  m2=regexpi(xx,'最后[2两][个年]','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,3}-20000;  
  end;
  m2=regexpi(xx,'最后一','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,3}-10000;  
  end;
  m2=regexpi(xx,'第[三3][个]*','match'); 
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+20000;  
  end;
  m2=regexpi(xx,'第[二2]个','match') ;
  a=length(m2{1,1});
  if a>0
     y{i,1}=date{i,1}+10000;  
  end;
  m2=regexpi(xx,'最后半','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,3}-600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,3}-9400;
     elseif dd==0
         y{i,1}=date{i,3}-8800;
     else
         y{i,1}=date{i,3}-600;
     end;   
  end;
  m2=regexpi(xx,'前半年','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,3}-600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,3}-9400;
     elseif dd==0
         y{i,1}=date{i,3}-8800;
     else
         y{i,1}=date{i,3}-600;
     end;   
  end;
  m2=regexpi(xx,'前[6六]个月','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,3}-600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,3}-9400;
     elseif dd==0
         y{i,1}=date{i,3}-8800;
     else
         y{i,1}=date{i,3}-600;
     end;   
  end;
  m2=regexpi(xx,'前180','match') ;
  a=length(m2{1,1});
  if a>0
     d=date{i,3}-600;
     dd=fix((d-fix(d/10000)*10000)/100);
     if(dd>12)
         y{i,1}=date{i,3}-9400;
     elseif dd==0
         y{i,1}=date{i,3}-8800;
     else
         y{i,1}=date{i,3}-600;
     end;   
  end;
end;

