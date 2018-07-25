%step1 从数据库提取数据
startdate='20050101';
conn=database('winddb','windquery','wind2010query','oracle.jdbc.driver.OracleDriver','jdbc:oracle:thin:@ 10.2.89.132:1521:winddb');
curs = exec(conn,['select distinct F2_1454 from TB_OBJECT_1454 where mod(to_char(to_date(F2_1454,''yyyymmdd''),''MM''),3)=0 and F2_1454>''' startdate ''' order by F2_1454 asc']);
curs = fetch(curs);
dateinfo =  curs.Data;

cmd = ['select distinct f4_0001 代码',...
    ' from wind.tb_object_1454,wind.tb_object_0001  ', ...
'where F1_1454=F17_0001 and F12_0001=''A'' and f54_1454=''408001000'' ', ...
' and f2_1454>= ''' dateinfo{1} '''and f2_1454<= ''' dateinfo{end} '''  order by f4_0001']; %%
curs = exec(conn,cmd);
curs = fetch(curs);
bankinfo = curs.Data;

cmd = ['select f16_1090 代码,f2_1853 日期,f4_1853 报表类型,f47_1853,f48_1853,f50_1853,f10_1853,f52_1853,f53_1853,f26_1853,f29_1853,f155_1853,f31_1853,f41_1853,f70_1853,f104_1853,f106_1853,f108_1853,f109_1853,f80_1853,f81_1853,f95_1853,f111_1853,f128_1853',...
    ' from wind.tb_object_1853,wind.tb_object_1090  ', ...
'where F1_1853=OB_REVISIONS_1090  and f4_1090=''A'' and f4_1853=''合并报表'' and f5_1853=''2''', ...
' and f2_1853>= ''' dateinfo{1} ''' and f2_1853<= ''' dateinfo{end} '''  order by f2_1853']; %%
curs = exec(conn,cmd);
curs = fetch(curs);
f1853raw = curs.Data;

cmd = ['select f16_1090 代码,f2_1854 日期,f4_1854 报表类型,f16_1854,f9_1854,f48_1854,f18_1854,f21_1854,f15_1854,f49_1854,f61_1854',...
    ' from wind.tb_object_1854,wind.tb_object_1090  ', ...
'where F1_1854=OB_REVISIONS_1090  and f4_1090=''A'' and f4_1854=''合并报表'' and f5_1854=''2''', ...
' and f2_1854>= ''' dateinfo{1} '''and f2_1854<= ''' dateinfo{end} '''  order by f2_1854']; %%
curs = exec(conn,cmd);
curs = fetch(curs);
f1854raw = curs.Data;


cmd = ['select f4_0001 代码,f2_1454 日期,f54_1454,f29_1454,f35_1454,f42_1454,f38_1454,f43_1454,f35_1454,f57_1454,f44_1454,f5_1454,f50_1454,f26_1454,f27_1454,f3_1454,f4_1454,f24_1454,f23_1454',...
    ' from wind.tb_object_1454,wind.tb_object_0001  ', ...
'where F1_1454=F17_0001 and F12_0001=''A'' and f54_1454=''408001000'' ', ...
' and f2_1454>= ''' dateinfo{1} '''and f2_1454<= ''' dateinfo{end} '''  order by f2_1454']; %%
curs = exec(conn,cmd);
curs = fetch(curs);
f1454raw = curs.Data;


cmd = ['select f16_1090 代码,f3_5034 日期,f4_5034 报表类型,f154_5034,f161_5034,f52_5034,f70_5034,f149_5034,f59_5034',...
    ' from wind.tb_object_5034,wind.tb_object_1090 ', ...
'where F1_5034=OB_REVISIONS_1090 and f4_1090=''A'' and f4_5034=''合并报表'' ',...
'and f3_5034>= ''' dateinfo{1} '''and f3_5034<= ''' dateinfo{end} '''  order by f3_5034']; %%
curs = exec(conn,cmd);
curs = fetch(curs);
f5034raw = curs.Data;

%%step2 筛选出26家上市银行相关数据
a=1;f1853={};
for i=1:length(f1853raw)
    ss=str2double(f1853raw(i,1));
    if ss==000001 || ss==002142|| ss==002807|| ss==002839|| ss==600000|| ss==600015|| ss==600016|| ss==600036|| ss==600908|| ss==600919|| ss==600926|| ss==601009|| ss==601128|| ss==601166|| ss==601169|| ss==601229|| ss==601288|| ss==601328|| ss==601398|| ss==601818|| ss==601838|| ss==601939|| ss==601988|| ss==601997|| ss==601998|| ss==603323
        f1853(a,1:24)=f1853raw(i,1:24);
        a=a+1;
    end
end;
;

a=1;f1854={};
for i=1:length(f1854raw)
    ss=str2double(f1854raw(i,1));
    if ss==000001 || ss==002142|| ss==002807|| ss==002839|| ss==600000|| ss==600015|| ss==600016|| ss==600036|| ss==600908|| ss==600919|| ss==600926|| ss==601009|| ss==601128|| ss==601166|| ss==601169|| ss==601229|| ss==601288|| ss==601328|| ss==601398|| ss==601818|| ss==601838|| ss==601939|| ss==601988|| ss==601997|| ss==601998|| ss==603323
        f1854(a,1:11)=f1854raw(i,1:11);
        a=a+1;
    end
end;
;
a=1;f1454={};
for i=1:length(f1454raw)
    ss=str2double(f1454raw(i,1));
    if ss==000001 || ss==002142|| ss==002807|| ss==002839|| ss==600000|| ss==600015|| ss==600016|| ss==600036|| ss==600908|| ss==600919|| ss==600926|| ss==601009|| ss==601128|| ss==601166|| ss==601169|| ss==601229|| ss==601288|| ss==601328|| ss==601398|| ss==601818|| ss==601838|| ss==601939|| ss==601988|| ss==601997|| ss==601998|| ss==603323
        f1454(a,1:19)=f1454raw(i,1:19);
        a=a+1;
    end
end;
;
a=1;f5034={};
for i=1:length(f5034raw)
    ss=str2double(f5034raw(i,1));
    if ss==000001 || ss==002142|| ss==002807|| ss==002839|| ss==600000|| ss==600015|| ss==600016|| ss==600036|| ss==600908|| ss==600919|| ss==600926|| ss==601009|| ss==601128|| ss==601166|| ss==601169|| ss==601229|| ss==601288|| ss==601328|| ss==601398|| ss==601818|| ss==601838|| ss==601939|| ss==601988|| ss==601997|| ss==601998|| ss==603323
        f5034(a,1:9)=f5034raw(i,1:9);
        a=a+1;
    end
end;
;


[data1,banklist]= xlsread('/Users/jiangyining/Desktop/banklist.xlsx');
[data,factorinfo]=xlsread('/Users/jiangyining/Desktop/factorinfo.xlsx');
clear data;
clear data1;
clear ss;
clear a;
clear i;
clear f5034raw;clear f1454raw;clear f1853raw;clear f1854raw;
clear curs;
clear cmd;
clear conn;
%%step 3 整理归类命名
    for i=1:length(f1853)
        [bool,a]=ismember(f1853{i,1},bankinfo);
        [bool,b]=ismember(f1853{i,2},dateinfo);
        data.Cash{a,b}=f1853{i,4};
        data.DueFrBanksAndOthers{a,b}=f1853{i,5};
        data.LendToBank{a,b}=f1853{i,6};
        data.TradableFinancialAssets{a,b}=f1853{i,7};
        data.BBSAsset{a,b}=f1853{i,8};
        data.LoanAndAdvance{a,b}=f1853{i,9};
        data.AFSAsset{a,b}=f1853{i,10};
        data.LongtermInvest{a,b}=f1853{i,11};
        data.AccountReceivableInvest{a,b}=f1853{i,12};
        data.FixCapital{a,b}=f1853{i,13};
        data.DeferredTaxAsset{a,b}=f1853{i,14};
        data.OtherAsset{a,b}=f1853{i,15};
        data.DueFrBankAndOthers{a,b}=f1853{i,16};
        data.LoanFrBank{a,b}=f1853{i,17};
        data.SoldForRepurchaseAsset{a,b}=f1853{i,18};
        data.AcceptMoneyDeposit{a,b}=f1853{i,19};
        data.StaffSalary{a,b}=f1853{i,20};
        data.TaxPay{a,b}=f1853{i,21};   
        data.BondPay{a,b}=f1853{i,22};
        data.OtherLiability{a,b}=f1853{i,23};
        data.TotalDebt{a,b}=f1853{i,24};  
    end;
    
    
    for i=1:length(f1854)
        [bool,a]=ismember(f1854{i,1},bankinfo);
        [bool,b]=ismember(f1854{i,2},dateinfo);
        data.FairValueAsset{a,b}=f1854{i,4};
        data.OperatingIncome{a,b}=f1854{i,5};
        data.OperatingProfit{a,b}=f1854{i,6};
        data.NetInterestIncome{a,b}=f1854{i,7};
        data.NetCommissionIncome{a,b}=f1854{i,8}; 
        data.AssetImpairmentLoss{a,b}=f1854{i,9};
        data.OutofOperationProfit{a,b}=f1854{i,10};
        data.NetProfit{a,b}=f1854{i,11};
    end;


    for i=1:length(f1454)
        [bool,a]=ismember(f1454{i,1},bankinfo);
        [bool,b]=ismember(f1454{i,2},dateinfo);
        data.CostIncomeRatio{a,b}=f1454{i,4};
        data.TotalInterestBearingAsset{a,b}=f1454{i,5};
        data.NoInterestBearingAsset{a,b}=f1454{i,6};
        data.TotalInterestBearingLiability{a,b}=f1454{i,7};
        data.NoInterestBearingLiability{a,b}=f1454{i,8};
        data.InterestBearingAsset{a,b}=f1454{i,9};
        data.MeanInterestBearingAsset{a,b}=f1454{i,10};
        data.NIM{a,b}=f1454{i,11};
        data.RejectRatio{a,b}=f1454{i,12};
        data.OverdueLoan{a,b}=f1454{i,13};
        data.RejectLoanBalance{a,b}=f1454{i,14};
        data.ProvisionCoverage{a,b}=f1454{i,15};
        data.CAR{a,b}=f1454{i,16};
        data.CCAR{a,b}=f1454{i,17};
        data.TotalDeposit{a,b}=f1454{i,18};
        data.TotalLoan{a,b}=f1454{i,19};
    end;


    for i=1:length(f5034)
        [bool,a]=ismember(f5034{i,1},bankinfo);
        [bool,b]=ismember(f5034{i,2},dateinfo);
        data.OperationSaleIncreaseRate{a,b}=f5034{i,4};
        data.NetProfiteIncreaseRate{a,b}=f5034{i,5};
        data.ROE{a,b}=f5034{i,6};
        data.EquityMultiplier{a,b}=f5034{i,7};
        data.MeanNetAssetChange{a,b}=f5034{i,8};
        data.MeanNetAssetProfitRatio{a,b}=f5034{i,9};
    end;


clear bankinfo;clear a;clear b;clear i;clear bool;clear f1853;clear f1854;clear f1454;clear f5034;clear startdate;





