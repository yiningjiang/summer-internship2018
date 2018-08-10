[data2.OverdueLoan90,xx]=xlsread('/Users/jiangyining/Desktop/实习/overdue90.xlsx');
[data2.pb,xx]=xlsread('/Users/jiangyining/Desktop/实习/pb.xlsx');
clear xx;
data2.Overdue90Ratio=data2.OverdueLoan90./cell2mat(data2.TotalLoan);

%%多因子
[rawdata,xx]=xlsread('/Users/jiangyining/Desktop/实习/pbfactor.xlsx');
clear xx;

nrow=161:176;
y=rawdata(nrow,1);x1=rawdata(nrow,3);x2=rawdata(nrow,4);x3=rawdata(nrow,5);
x=[ones(length(y),1),x1,x2,x3];
[b,bint,r,rint,stats]=regress(y,x);
nrownow=177:192;
rawdata(nrownow,7)=b(1)+b(2)*rawdata(nrownow,3)+b(3)*rawdata(nrownow,4)+b(4)*rawdata(nrownow,5);
rawdata(nrownow,8)=rawdata(nrownow,7)-rawdata(nrownow,1);

nrow=177:192;
y=rawdata(nrow,1);x1=rawdata(nrow,3);x2=rawdata(nrow,4);x3=rawdata(nrow,5);
x=[ones(length(y),1),x1,x2,x3];
[b,bint,r,rint,stats]=regress(y,x);
nrownow=193:208;
rawdata(nrownow,7)=b(1)+b(2)*rawdata(nrownow,3)+b(3)*rawdata(nrownow,4)+b(4)*rawdata(nrownow,5);
rawdata(nrownow,8)=rawdata(nrownow,7)-rawdata(nrownow,1);

nrow=193:208;
y=rawdata(nrow,1);x1=rawdata(nrow,3);x2=rawdata(nrow,4);x3=rawdata(nrow,5);
x=[ones(length(y),1),x1,x2,x3];
[b,bint,r,rint,stats]=regress(y,x);
nrownow=209:224;
rawdata(nrownow,7)=b(1)+b(2)*rawdata(nrownow,3)+b(3)*rawdata(nrownow,4)+b(4)*rawdata(nrownow,5);
rawdata(nrownow,8)=rawdata(nrownow,7)-rawdata(nrownow,1);

nrow=145:160;
y=rawdata(nrow,1);x1=rawdata(nrow,3);x2=rawdata(nrow,4);x3=rawdata(nrow,5);
x=[ones(length(y),1),x1,x2,x3];
[b,bint,r,rint,stats]=regress(y,x);
nrownow=161:176;
rawdata(nrownow,7)=b(1)+b(2)*rawdata(nrownow,3)+b(3)*rawdata(nrownow,4)+b(4)*rawdata(nrownow,5);
rawdata(nrownow,8)=rawdata(nrownow,7)-rawdata(nrownow,1);

nrow=129:144;
y=rawdata(nrow,1);x1=rawdata(nrow,3);x2=rawdata(nrow,4);x3=rawdata(nrow,5);
x=[ones(length(y),1),x1,x2,x3];
[b,bint,r,rint,stats]=regress(y,x);
nrownow=145:160;
rawdata(nrownow,7)=b(1)+b(2)*rawdata(nrownow,3)+b(3)*rawdata(nrownow,4)+b(4)*rawdata(nrownow,5);
rawdata(nrownow,8)=rawdata(nrownow,7)-rawdata(nrownow,1);

%%mse=mean(rawdata(161:224,8).*rawdata(161:224,8))
%%mae=mean(abs(rawdata(161:224,8)))


sortrow=145:160;
[xx,rawdata(sortrow,14)]=sort(rawdata(sortrow,8),'descend') ;
sortrow=161:176;
[xx,rawdata(sortrow,14)]=sort(rawdata(sortrow,8),'descend') ;
sortrow=177:192;
[xx,rawdata(sortrow,14)]=sort(rawdata(sortrow,8),'descend') ;
sortrow=193:208;
[xx,rawdata(sortrow,14)]=sort(rawdata(sortrow,8),'descend') ;
sortrow=209:224;
[xx,rawdata(sortrow,14)]=sort(rawdata(sortrow,8),'descend') ;

clear xx;clear nrow;clear nrownow;clear x;clear y;clear b;clear bint;clear r;clear rint;clear stats;
clear sortrow;

rankrow1=rawdata([145,161,177,193,209],14)'+[144,160,176,192,208];
rankrow2=rawdata([146,162,178,194,210],14)'+[144,160,176,192,208];
rankrow3=rawdata([147,163,179,195,211],14)'+[144,160,176,192,208];
rankrow4=rawdata([148,164,180,196,212],14)'+[144,160,176,192,208];
rankrow5=rawdata([149,165,181,197,213],14)'+[144,160,176,192,208];
rankrow15=rawdata([160,176,192,208,224],14)'+[144,160,176,192,208];
rankrow14=rawdata([159,175,191,207,223],14)'+[144,160,176,192,208];
rankrow13=rawdata([158,174,190,206,222],14)'+[144,160,176,192,208];
rankrow12=rawdata([157,173,189,205,221],14)'+[144,160,176,192,208];
rankrow11=rawdata([156,172,188,204,220],14)'+[144,160,176,192,208];

rawdatarank(1:10:42,2:4)=rawdata(rankrow1,[14,2,8]);
rawdatarank(2:10:42,2:4)=rawdata(rankrow2,[14,2,8]);
rawdatarank(3:10:43,2:4)=rawdata(rankrow3,[14,2,8]);
rawdatarank(4:10:44,2:4)=rawdata(rankrow4,[14,2,8]);
rawdatarank(5:10:45,2:4)=rawdata(rankrow5,[14,2,8]);
rawdatarank(6:10:46,2:4)=rawdata(rankrow15,[14,2,8]);
rawdatarank(7:10:47,2:4)=rawdata(rankrow14,[14,2,8]);
rawdatarank(8:10:48,2:4)=rawdata(rankrow13,[14,2,8]);
rawdatarank(9:10:49,2:4)=rawdata(rankrow12,[14,2,8]);
rawdatarank(10:10:50,2:4)=rawdata(rankrow11,[14,2,8]);
rawdatarank=mat2cell(rawdatarank,ones(1,50),ones(1,4));
for i=1:50;
rawdatarank{i,1}=data2.banklist{rawdatarank{i,2},2}
end;
clear rankrow1;clear rankrow2;clear rankrow3;clear rankrow4;clear rankrow5;
clear rankrow11;clear rankrow12;clear rankrow13;clear rankrow14;clear rankrow15;
clear i; clear x2;clear x3;clear x1;




%%单因子
[rawdata2,xx]=xlsread('/Users/jiangyining/Desktop/实习/pbfactor.xlsx');
clear xx;
sortrow=145:160;
[xx,rawdata2(sortrow,7)]=sort(rawdata2(sortrow,3),'descend') ;
sortrow=161:176;
[xx,rawdata2(sortrow,7)]=sort(rawdata2(sortrow,3),'descend') ;
sortrow=177:192;
[xx,rawdata2(sortrow,7)]=sort(rawdata2(sortrow,3),'descend') ;
sortrow=193:208;
[xx,rawdata2(sortrow,7)]=sort(rawdata2(sortrow,3),'descend') ;
sortrow=209:224;
[xx,rawdata2(sortrow,7)]=sort(rawdata2(sortrow,3),'descend') ;

sortrow=145:160;
[xx,rawdata2(sortrow,8)]=sort(rawdata2(sortrow,4),'descend') ;
sortrow=161:176;
[xx,rawdata2(sortrow,8)]=sort(rawdata2(sortrow,4),'descend') ;
sortrow=177:192;
[xx,rawdata2(sortrow,8)]=sort(rawdata2(sortrow,4),'descend') ;
sortrow=193:208;
[xx,rawdata2(sortrow,8)]=sort(rawdata2(sortrow,4),'descend') ;
sortrow=209:224;
[xx,rawdata2(sortrow,8)]=sort(rawdata2(sortrow,4),'descend') ;

sortrow=145:160;
[xx,rawdata2(sortrow,9)]=sort(rawdata2(sortrow,5),'descend') ;
sortrow=161:176;
[xx,rawdata2(sortrow,9)]=sort(rawdata2(sortrow,5),'descend') ;
sortrow=177:192;
[xx,rawdata2(sortrow,9)]=sort(rawdata2(sortrow,5),'descend') ;
sortrow=193:208;
[xx,rawdata2(sortrow,9)]=sort(rawdata2(sortrow,5),'descend') ;
sortrow=209:224;
[xx,rawdata2(sortrow,9)]=sort(rawdata2(sortrow,5),'descend') ;

rankrow1=rawdata2([145,161,177,193,209],7)'+[144,160,176,192,208];
rankrow2=rawdata2([146,162,178,194,210],7)'+[144,160,176,192,208];
rankrow3=rawdata2([147,163,179,195,211],7)'+[144,160,176,192,208];
rankrow4=rawdata2([148,164,180,196,212],7)'+[144,160,176,192,208];
rankrow5=rawdata2([149,165,181,197,213],7)'+[144,160,176,192,208];
rankrow6=rawdata2([150,166,182,198,214],7)'+[144,160,176,192,208];
rankrow7=rawdata2([151,167,183,199,215],7)'+[144,160,176,192,208];
rankrow8=rawdata2([152,168,184,200,216],7)'+[144,160,176,192,208];
rankrow9=rawdata2([153,169,185,201,217],7)'+[144,160,176,192,208];
rankrow10=rawdata2([154,170,186,202,218],7)'+[144,160,176,192,208];
rankrow11=rawdata2([155,171,187,203,219],7)'+[144,160,176,192,208];
rankrow16=rawdata2([160,176,192,208,224],7)'+[144,160,176,192,208];
rankrow15=rawdata2([159,175,191,207,223],7)'+[144,160,176,192,208];
rankrow14=rawdata2([158,174,190,206,222],7)'+[144,160,176,192,208];
rankrow13=rawdata2([157,173,189,205,221],7)'+[144,160,176,192,208];
rankrow12=rawdata2([156,172,188,204,220],7)'+[144,160,176,192,208];

datarank.npr(1:16:80,2:4)=rawdata2(rankrow1,[7,2,3]);
datarank.npr(2:16:80,2:4)=rawdata2(rankrow2,[7,2,3]);
datarank.npr(3:16:80,2:4)=rawdata2(rankrow3,[7,2,3]);
datarank.npr(4:16:80,2:4)=rawdata2(rankrow4,[7,2,3]);
datarank.npr(5:16:80,2:4)=rawdata2(rankrow5,[7,2,3]);
datarank.npr(6:16:80,2:4)=rawdata2(rankrow6,[7,2,3]);
datarank.npr(7:16:80,2:4)=rawdata2(rankrow7,[7,2,3]);
datarank.npr(8:16:80,2:4)=rawdata2(rankrow8,[7,2,3]);
datarank.npr(9:16:80,2:4)=rawdata2(rankrow9,[7,2,3]);
datarank.npr(10:16:80,2:4)=rawdata2(rankrow10,[7,2,3]);
datarank.npr(11:16:80,2:4)=rawdata2(rankrow11,[7,2,3]);
datarank.npr(12:16:80,2:4)=rawdata2(rankrow12,[7,2,3]);
datarank.npr(13:16:80,2:4)=rawdata2(rankrow13,[7,2,3]);
datarank.npr(14:16:80,2:4)=rawdata2(rankrow14,[7,2,3]);
datarank.npr(15:16:80,2:4)=rawdata2(rankrow15,[7,2,3]);
datarank.npr(16:16:80,2:4)=rawdata2(rankrow16,[7,2,3]);
datarank.npr=mat2cell(datarank.npr,ones(1,80),ones(1,4));

rankrow1=rawdata2([145,161,177,193,209],8)'+[144,160,176,192,208];
rankrow2=rawdata2([146,162,178,194,210],8)'+[144,160,176,192,208];
rankrow3=rawdata2([147,163,179,195,211],8)'+[144,160,176,192,208];
rankrow4=rawdata2([148,164,180,196,212],8)'+[144,160,176,192,208];
rankrow5=rawdata2([149,165,181,197,213],8)'+[144,160,176,192,208];
rankrow6=rawdata2([150,166,182,198,214],8)'+[144,160,176,192,208];
rankrow7=rawdata2([151,167,183,199,215],8)'+[144,160,176,192,208];
rankrow8=rawdata2([152,168,184,200,216],8)'+[144,160,176,192,208];
rankrow9=rawdata2([153,169,185,201,217],8)'+[144,160,176,192,208];
rankrow10=rawdata2([154,170,186,202,218],8)'+[144,160,176,192,208];
rankrow11=rawdata2([155,171,187,203,219],8)'+[144,160,176,192,208];
rankrow16=rawdata2([160,176,192,208,224],8)'+[144,160,176,192,208];
rankrow15=rawdata2([159,175,191,207,223],8)'+[144,160,176,192,208];
rankrow14=rawdata2([158,174,190,206,222],8)'+[144,160,176,192,208];
rankrow13=rawdata2([157,173,189,205,221],8)'+[144,160,176,192,208];
rankrow12=rawdata2([156,172,188,204,220],8)'+[144,160,176,192,208];

datarank.roe(1:16:80,2:4)=rawdata2(rankrow1,[8,2,4]);
datarank.roe(2:16:80,2:4)=rawdata2(rankrow2,[8,2,4]);
datarank.roe(3:16:80,2:4)=rawdata2(rankrow3,[8,2,4]);
datarank.roe(4:16:80,2:4)=rawdata2(rankrow4,[8,2,4]);
datarank.roe(5:16:80,2:4)=rawdata2(rankrow5,[8,2,4]);
datarank.roe(6:16:80,2:4)=rawdata2(rankrow6,[8,2,4]);
datarank.roe(7:16:80,2:4)=rawdata2(rankrow7,[8,2,4]);
datarank.roe(8:16:80,2:4)=rawdata2(rankrow8,[8,2,4]);
datarank.roe(9:16:80,2:4)=rawdata2(rankrow9,[8,2,4]);
datarank.roe(10:16:80,2:4)=rawdata2(rankrow10,[8,2,4]);
datarank.roe(11:16:80,2:4)=rawdata2(rankrow11,[8,2,4]);
datarank.roe(12:16:80,2:4)=rawdata2(rankrow12,[8,2,4]);
datarank.roe(13:16:80,2:4)=rawdata2(rankrow13,[8,2,4]);
datarank.roe(14:16:80,2:4)=rawdata2(rankrow14,[8,2,4]);
datarank.roe(15:16:80,2:4)=rawdata2(rankrow15,[8,2,4]);
datarank.roe(16:16:80,2:4)=rawdata2(rankrow16,[8,2,4]);
datarank.roe=mat2cell(datarank.roe,ones(1,80),ones(1,4));

rankrow1=rawdata2([145,161,177,193,209],9)'+[144,160,176,192,208];
rankrow2=rawdata2([146,162,178,194,210],9)'+[144,160,176,192,208];
rankrow3=rawdata2([147,163,179,195,211],9)'+[144,160,176,192,208];
rankrow4=rawdata2([148,164,180,196,212],9)'+[144,160,176,192,208];
rankrow5=rawdata2([149,165,181,197,213],9)'+[144,160,176,192,208];
rankrow6=rawdata2([150,166,182,198,214],9)'+[144,160,176,192,208];
rankrow7=rawdata2([151,167,183,199,215],9)'+[144,160,176,192,208];
rankrow8=rawdata2([152,168,184,200,216],9)'+[144,160,176,192,208];
rankrow9=rawdata2([153,169,185,201,217],9)'+[144,160,176,192,208];
rankrow10=rawdata2([154,170,186,202,218],9)'+[144,160,176,192,208];
rankrow11=rawdata2([155,171,187,203,219],9)'+[144,160,176,192,208];
rankrow16=rawdata2([160,176,192,208,224],9)'+[144,160,176,192,208];
rankrow15=rawdata2([159,175,191,207,223],9)'+[144,160,176,192,208];
rankrow14=rawdata2([158,174,190,206,222],9)'+[144,160,176,192,208];
rankrow13=rawdata2([157,173,189,205,221],9)'+[144,160,176,192,208];
rankrow12=rawdata2([156,172,188,204,220],9)'+[144,160,176,192,208];

datarank.olr(1:16:80,2:4)=rawdata2(rankrow1,[9,2,5]);
datarank.olr(2:16:80,2:4)=rawdata2(rankrow2,[9,2,5]);
datarank.olr(3:16:80,2:4)=rawdata2(rankrow3,[9,2,5]);
datarank.olr(4:16:80,2:4)=rawdata2(rankrow4,[9,2,5]);
datarank.olr(5:16:80,2:4)=rawdata2(rankrow5,[9,2,5]);
datarank.olr(6:16:80,2:4)=rawdata2(rankrow6,[9,2,5]);
datarank.olr(7:16:80,2:4)=rawdata2(rankrow7,[9,2,5]);
datarank.olr(8:16:80,2:4)=rawdata2(rankrow8,[9,2,5]);
datarank.olr(9:16:80,2:4)=rawdata2(rankrow9,[9,2,5]);
datarank.olr(10:16:80,2:4)=rawdata2(rankrow10,[9,2,5]);
datarank.olr(11:16:80,2:4)=rawdata2(rankrow11,[9,2,5]);
datarank.olr(12:16:80,2:4)=rawdata2(rankrow12,[9,2,5]);
datarank.olr(13:16:80,2:4)=rawdata2(rankrow13,[9,2,5]);
datarank.olr(14:16:80,2:4)=rawdata2(rankrow14,[9,2,5]);
datarank.olr(15:16:80,2:4)=rawdata2(rankrow15,[9,2,5]);
datarank.olr(16:16:80,2:4)=rawdata2(rankrow16,[9,2,5]);
datarank.olr=mat2cell(datarank.olr,ones(1,80),ones(1,4));


for i=1:80;
datarank.roe{i,1}=data2.banklist{datarank.roe{i,2},2};
datarank.npr{i,1}=data2.banklist{datarank.npr{i,2},2};
datarank.olr{i,1}=data2.banklist{datarank.olr{i,2},2};
end;
clear rankrow1;clear rankrow2;clear rankrow3;clear rankrow4;clear rankrow5;
clear rankrow6;clear rankrow7;clear rankrow8;clear rankrow9;clear rankrow10;
clear rankrow11;clear rankrow12;clear rankrow13;clear rankrow14;clear rankrow15;clear rankrow16;
clear i; clear x2;clear x3;clear x1;clear sortrow;clear xx;
