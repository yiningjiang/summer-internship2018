



%��ͼ
%roe
bar(data2.ROEsumm(:,[44,48,52,53]),'hist')
legend('2015','2016','2017','2018Q1')
title('ROE����仯')
xticklabels({'����','�ɷ�','����'})
ylabel('roe')

summ2017(:,1)=data2.ROEsumm(:,52).*[5;8;3]/sum(data2.ROEsumm(:,52).*[5;8;3]);
summ2017(:,2)=data2.NetProfitsumm(:,52).*[5;8;3]/sum(data2.NetProfitsumm(:,52).*[5;8;3]);
summ2017(:,3)=data2.TotalDepositsumm(:,52).*[5;8;3]/sum(data2.TotalDepositsumm(:,52).*[5;8;3]);
summ2017(:,4)=data2.TotalLoansumm(:,52).*[5;8;3]/sum(data2.TotalLoansumm(:,52).*[5;8;3]);
summ2017(:,5)=data2.ProvisionCoveragesumm(:,52).*[5;8;3]/sum(data2.ProvisionCoveragesumm(:,52).*[5;8;3]);
summ2017(:,6)=data2.RejectRatiosumm(:,52).*[5;8;3]/sum(data2.RejectRatiosumm(:,52).*[5;8;3]);
summ2017(:,7)=data2.OverdueLoansumm(:,52).*[5;8;3]/sum(data2.OverdueLoansumm(:,52).*[5;8;3]);
summ2017(:,8)=data2.NIMsumm(:,52).*[5;8;3]/sum(data2.NIMsumm(:,52).*[5;8;3]);
bar(summ2017(:,2:4),'hist')
%bar(data2.RejectRatiosumm(:,52),'hist')
%bar(data2.OverdueLoansumm(:,52),'hist')
%hold off
legend('������','�ܴ��','�ܴ���')
title('2017���ָ��ռ��')
xticklabels({'����','�ɷ�','����'})

summ2018(:,1)=data2.ROEsumm(:,53)/sum(data2.ROEsumm(:,53));
summ2018(:,2)=data2.NetProfitsumm(:,53)/sum(data2.NetProfitsumm(:,53));
summ2018(:,3)=data2.ProvisionCoveragesumm(:,53)/sum(data2.ProvisionCoveragesumm(:,53));
summ2018(:,4)=data2.RejectRatiosumm(:,53)/sum(data2.RejectRatiosumm(:,53));
summ2018(:,5)=data2.NIMsumm(:,53)/sum(data2.NIMsumm(:,53));
bar(summ2018(:,1:5),'hist')
%bar(data2.RejectRatiosumm(:,52),'hist')
%bar(data2.OverdueLoansumm(:,52),'hist')
%hold off
legend('ROE','������','����������','������','��Ϣ��')
title('2018��һ����ָ��ռ��')
xticklabels({'����','�ɷ�','����'})

roe=cell2mat(data2.ROE);
npr=cell2mat(data2.NetProfiteIncreaseRate);
rr=cell2mat(data2.RejectRatio);
nim=cell2mat(data2.NIM);


scatter(data2.pb(:,53),roe(:,52))
hold on
scatter(data2.pb(:,49),roe(:,48))
legend('2017','2016')
title('roe-pb')
xlabel('pb')
ylabel('roe')


scatter(data2.pb(:,53),rr(:,52))
hold on
scatter(data2.pb(:,49),rr(:,48))
legend('2017','2016')
title('������-pb')
xlabel('pb')
ylabel('rejectratio')


scatter(data2.pb(:,53),npr(:,52))
hold on
scatter(data2.pb(:,49),npr(:,48))
legend('2017','2016')
title('����������-pb')
xlabel('pb')
ylabel('����������')

scatter(data2.pb(:,53),nim(:,52))
hold on 
scatter(data2.pb(:,49),nim(:,48))
legend('2017','2016')
title('��Ϣ��-pb')
xlabel('pb')
ylabel('��Ϣ��')


%������Ӱ��
scatter(bb(:,1),roe(:,52))
hold on
scatter(bb(:,3),roe(:,52))
legend('���벦��ǰ','���벦����')
title('roe-pb')
xlabel('pb')
ylabel('roe')


scatter(bb(:,1),rr(:,52))
hold on
scatter(bb(:,3),rr(:,52))
legend('���벦��ǰ','���벦����')
title('������-pb')
xlabel('pb')
ylabel('rejectratio')


scatter(bb(:,1),bb(:,2))
hold on
scatter(bb(:,3),bb(:,4))
legend('���벦��ǰ','���벦����')
title('����������-pb')
xlabel('pb')
ylabel('����������')

scatter(bb(:,1),nim(:,52))
hold on 
scatter(bb(:,3),nim(:,52))
legend('���벦��ǰ','���벦����')
title('��Ϣ��-pb')
xlabel('pb')
ylabel('��Ϣ��')
