b1=[19,22,17,23,18];
b2=[8,25,5,7,14,20,6,1];
b3=[15,12,2];
b4=[19,22,17,23,18,8,25,5,7,14,20,6,1,15,12,2];

banklist2=banklist(b4,:);%老16家列表
data2.ROE=data.ROE(b4,:);
data2.NetProfit=data.NetProfit(b4,:);
data2.NIM=data.NIM(b4,:);
data2.TotalDeposit=data.TotalDeposit(b4,:);
data2.TotalLoan=data.TotalLoan(b4,:);
data2.TotalAsset=data.TotalAsset(b4,:);
data2.ProvisionCoverage=data.ProvisionCoverage(b4,:);
data2.CAR=data.CAR(b4,:);
data2.OverdueLoan=data.OverdueLoan(b4,:);
data2.DebtAssetRatio=data.DebtAssetRatio(b4,:);
data2.TotalDebt=data.TotalDebt(b4,:);
data2.RejectRatio=data.RejectRatio(b4,:);
data2.ProvisionRatio=data.ProvisionRatio(b4,:);
data2.RejectLoanBalance=data.RejectLoanBalance(b4,:);
data2.Equity=data.Equity(b4,:);
data2.banklist=banklist(b4,:);
data2.NetProfiteIncreaseRate=data.NetProfiteIncreaseRate(b4,:);

%国有 股份 城商 分类汇总
[m,n]=size(data.ROE);
a1=cell2mat(data.ROE);
a=cell2mat(data2.ROE);
for i=1:n
    data2.ROEsumm(1,i)=mean(a1(b1,i));
    data2.ROEsumm(2,i)=mean(a1(b2,i));
    data2.ROEsumm(3,i)=mean(a1(b3,i));
end;
b=data2.ROEsumm;
for i=5:n
    data2.ROEsumriserate(:,i)=(b(:,i)-b(:,i-4))./abs(b(:,i-4));
end;
for i=5:n
    data2.ROEriserate(:,i)=(a(:,i)-a(:,i-4))./abs(a(:,i-4));
end;
for i=2:n
    data2.ROEqriserate(:,i)=a(:,i)-a(:,i-1);
end;
for i=4:2:n
    data2.ROEhriserate(:,i)=a(:,i)-a(:,i-2);
end;

[m,n]=size(data.NetProfit);
a1=cell2mat(data.NetProfit);
a=cell2mat(data2.NetProfit);
for i=1:n
    data2.NetProfitsumm(1,i)=mean(a1(b1,i));
    data2.NetProfitsumm(2,i)=mean(a1(b2,i));
    data2.NetProfitsumm(3,i)=mean(a1(b3,i));
end;
b=data2.NetProfitsumm;
for i=5:n
    data2.NetProfitsumriserate(:,i)=(b(:,i)-b(:,i-4))./abs(b(:,i-4));
end;
for i=5:n
    data2.NetProfitriserate(:,i)=(a(:,i)-a(:,i-4))./abs(a(:,i-4));
end;
for i=2:n
    data2.NetProfitqriserate(:,i)=(a(:,i)-a(:,i-1))./abs(a(:,i-1));
end;
for i=4:2:n
    data2.NetProfithriserate(:,i)=(a(:,i)-a(:,i-2))./abs(a(:,i-2));
end;

[m,n]=size(data.NIM);
a1=cell2mat(data.NIM);
a=cell2mat(data2.NIM);
for i=1:n
    data2.NIMsumm(1,i)=mean(a1(b1,i));
    data2.NIMsumm(2,i)=mean(a1(b2,i));
    data2.NIMsumm(3,i)=mean(a1(b3,i));
end;
b=data2.NIMsumm;
for i=5:n
    data2.NIMsumriserate(:,i)=(b(:,i)-b(:,i-4))./abs(b(:,i-4));
end;
for i=5:n
    data2.NIMriserate(:,i)=a(:,i)-a(:,i-4);
end;
for i=2:n
    data2.NIMqriserate(:,i)=(a(:,i)-a(:,i-1));
end;
for i=4:2:n
    data2.NIMhriserate(:,i)=(a(:,i)-a(:,i-2));
end;


[m,n]=size(data.TotalDeposit);
a1=cell2mat(data.TotalDeposit);
a=cell2mat(data2.TotalDeposit);
for i=1:n
    data2.TotalDepositsumm(1,i)=mean(a1(b1,i));
    data2.TotalDepositsumm(2,i)=mean(a1(b2,i));
    data2.TotalDepositsumm(3,i)=mean(a1(b3,i));
end;
b=data2.TotalDepositsumm;
for i=5:n
    data2.TotalDepositsumriserate(:,i)=(b(:,i)-b(:,i-4))./abs(b(:,i-4));
end;
for i=5:n
    data2.TotalDepositriserate(:,i)=(a(:,i)-a(:,i-4))./abs(a(:,i-4));
end;
for i=2:n
    data2.TotalDepositqriserate(:,i)=(a(:,i)-a(:,i-1))./abs(a(:,i-1));
end;
for i=4:2:n
    data2.TotalDeposithriserate(:,i)=(a(:,i)-a(:,i-2))./abs(a(:,i-2));
end;

[m,n]=size(data.TotalLoan);
a1=cell2mat(data.TotalLoan);
a=cell2mat(data2.TotalLoan);
for i=1:n
    data2.TotalLoansumm(1,i)=mean(a1(b1,i));
    data2.TotalLoansumm(2,i)=mean(a1(b2,i));
    data2.TotalLoansumm(3,i)=mean(a1(b3,i));
end;
b=data2.TotalLoansumm;
for i=5:n
    data2.TotalLoansumriserate(:,i)=(b(:,i)-b(:,i-4))./abs(b(:,i-4));
end;
for i=5:n
    data2.TotalLoanriserate(:,i)=(a(:,i)-a(:,i-4))./abs(a(:,i-4));
end;
for i=2:n
    data2.TotalLoanqriserate(:,i)=(a(:,i)-a(:,i-1))./abs(a(:,i-1));
end;
for i=4:2:n
    data2.TotalLoanhriserate(:,i)=(a(:,i)-a(:,i-2))./abs(a(:,i-2));
end;

[m,n]=size(data.ProvisionCoverage);
a1=cell2mat(data.ProvisionCoverage);
a=cell2mat(data2.ProvisionCoverage);
for i=1:n
    data2.ProvisionCoveragesumm(1,i)=mean(a1(b1,i));
    data2.ProvisionCoveragesumm(2,i)=mean(a1(b2,i));
    data2.ProvisionCoveragesumm(3,i)=mean(a1(b3,i));
end;
b=data2.ProvisionCoveragesumm;
for i=5:n
    data2.ProvisionCoveragesumriserate(:,i)=(b(:,i)-b(:,i-4))./abs(b(:,i-4));
end;
for i=5:n
    data2.ProvisionCoverageriserate(:,i)=(a(:,i)-a(:,i-4))./abs(a(:,i-4));
end;
for i=2:n
    data2.ProvisionCoverageqriserate(:,i)=(a(:,i)-a(:,i-1))./abs(a(:,i-1));
end;
for i=4:2:n
    data2.ProvisionCoveragehriserate(:,i)=(a(:,i)-a(:,i-2))./abs(a(:,i-2));
end;

[m,n]=size(data.RejectRatio);
a1=cell2mat(data.RejectRatio);
a=cell2mat(data2.RejectRatio);
for i=1:n
    data2.RejectRatiosumm(1,i)=mean(a1(b1,i));
    data2.RejectRatiosumm(2,i)=mean(a1(b2,i));
    data2.RejectRatiosumm(3,i)=mean(a1(b3,i));
end;
b=data2.RejectRatiosumm;
for i=5:n
    data2.RejectRatiosumriserate(:,i)=(b(:,i)-b(:,i-4))./abs(b(:,i-4));
end;
for i=5:n
    data2.RejectRatioriserate(:,i)=(a(:,i)-a(:,i-4))./abs(a(:,i-4));
end;
for i=2:n
    data2.RejectRatioqriserate(:,i)=a(:,i)-a(:,i-1);
end;
for i=4:2:n
    data2.RejectRatiohriserate(:,i)=a(:,i)-a(:,i-2);
end;

[m,n]=size(data.CAR);
a1=cell2mat(data.CAR);
a=cell2mat(data2.CAR);
for i=1:n
    data2.CARsumm(1,i)=mean(a1(b1,i));
    data2.CARsumm(2,i)=mean(a1(b2,i));
    data2.CARsumm(3,i)=mean(a1(b3,i));
end;
b=data2.CARsumm;
for i=5:n
    data2.CARsumriserate(:,i)=(b(:,i)-b(:,i-4))./abs(b(:,i-4));
end;
for i=5:n
    data2.CARriserate(:,i)=(a(:,i)-a(:,i-4))./abs(a(:,i-4));
end;
for i=2:n
    data2.CARqriserate(:,i)=(a(:,i)-a(:,i-1))./abs(a(:,i-1));
end;
for i=4:2:n
    data2.CARhriserate(:,i)=(a(:,i)-a(:,i-2))./abs(a(:,i-2));
end;

[m,n]=size(data.OverdueLoan);
a1=cell2mat(data.OverdueLoan);
a=cell2mat(data2.OverdueLoan);
for i=1:n
    data2.OverdueLoansumm(1,i)=mean(a1(b1,i));
    data2.OverdueLoansumm(2,i)=mean(a1(b2,i));
    data2.OverdueLoansumm(3,i)=mean(a1(b3,i));
end;
b=data2.OverdueLoansumm;
for i=5:n
    data2.OverdueLoansumriserate(:,i)=(b(:,i)-b(:,i-4))./abs(b(:,i-4));
end;
for i=5:n
    data2.OverdueLoanriserate(:,i)=(a(:,i)-a(:,i-4))./abs(a(:,i-4));
end;
for i=2:n
    data2.OverdueLoanqriserate(:,i)=(a(:,i)-a(:,i-1))./abs(a(:,i-1));
end;
for i=4:2:n
    data2.OverdueLoanhriserate(:,i)=(a(:,i)-a(:,i-2))./abs(a(:,i-2));
end;

[m,n]=size(data.DebtAssetRatio);
a1=cell2mat(data.DebtAssetRatio);
a=cell2mat(data2.DebtAssetRatio);
for i=1:n
    data2.DebtAssetRatiosumm(1,i)=mean(a1(b1,i));
    data2.DebtAssetRatiosumm(2,i)=mean(a1(b2,i));
    data2.DebtAssetRatiosumm(3,i)=mean(a1(b3,i));
end;
b=data2.DebtAssetRatiosumm;
for i=5:n
    data2.DebtAssetRatiosumriserate(:,i)=(b(:,i)-b(:,i-4))./abs(b(:,i-4));
end;
for i=5:n
    data2.DebtAssetRatioriserate(:,i)=(a(:,i)-a(:,i-4))./abs(a(:,i-4));
end;
for i=2:n
    data2.DebtAssetRatioqriserate(:,i)=(a(:,i)-a(:,i-1))./abs(a(:,i-1));
end;
for i=4:2:n
    data2.DebtAssetRatiohriserate(:,i)=(a(:,i)-a(:,i-2))./abs(a(:,i-2));
end;

[m,n]=size(data.TotalDebt);
a1=cell2mat(data.TotalDebt);
a=cell2mat(data2.TotalDebt);
for i=1:n
    data2.TotalDebtsumm(1,i)=mean(a1(b1,i));
    data2.TotalDebtsumm(2,i)=mean(a1(b2,i));
    data2.TotalDebtsumm(3,i)=mean(a1(b3,i));
end;
b=data2.TotalDebtsumm;
for i=5:n
    data2.TotalDebtsumriserate(:,i)=(b(:,i)-b(:,i-4))./abs(b(:,i-4));
end;
for i=5:n
    data2.TotalDebtriserate(:,i)=(a(:,i)-a(:,i-4))./abs(a(:,i-4));
end;
for i=2:n
    data2.TotalDebtqriserate(:,i)=(a(:,i)-a(:,i-1))./abs(a(:,i-1));
end;
for i=4:2:n
    data2.TotalDebthriserate(:,i)=(a(:,i)-a(:,i-2))./abs(a(:,i-2));
end;



a=cell2mat(data2.TotalLoan);
b=cell2mat(data2.TotalAsset);
for i=1:53
    data2.loan2asset(:,i)=a(:,i)./b(:,i);
end;

a=cell2mat(data2.TotalDeposit);
b=cell2mat(data2.TotalDebt);
for i=1:53
    data2.deposit2debt(:,i)=a(:,i)./b(:,i);
end;

a=cell2mat(data2.OverdueLoan);
b=cell2mat(data2.TotalAsset);
for i=1:53
    data2.overdueloan2asset(:,i)=a(:,i)./b(:,i);
end;

a=cell2mat(data2.RejectRatio);
b=data2.overdueloan2asset;
for i=1:53
    data2.reject2overdue(:,i)=a(:,i)./b(:,i);
end;

clear m;clear n;clear i;clear a;clear b;clear b1;clear b2;clear b3;clear b4;clear a1;
