proc import datafile = "/home/harshithreddyv0/Capstone/telecomsample-3.csv"
dbms=csv
out=Cs.telecom;
run;

proc contents data=cs.telecom;
run;

proc means data=cs.telecom
n nmiss max min mean;
run;

proc freq data=cs.telecom;
tables actvsubs adjmou adjqty adjrev age1 age2 
avg3mou avg3qty avg6mou avg6qty avgmou avgqty avgrev blck_dat_Mean callwait_Mean callwait_Range 
ccrndmou_Range change_mou churn comp_vce_Mean custcare_Mean Customer_ID da_Mean da_Range
datovr_Mean datovr_Range drop_blk_Mean drop_dat_Mean drop_vce_Mean drop_vce_Range
eqpdays forgntvl hnd_price iwylis_vce_Mean models months mou_Mean
mou_opkv_Range mou_pead_Mean mou_Range mtrcycle opk_dat_Mean ovrmou_Mean ovrrev_Mean owylis_vce_Range 
plcd_vce_Mean recv_sms_Mean rev_Mean rev_Range roam_Mean totcalls totmrc_Mean
totrev truck uniqsubs
run;

data cs.telecom1 (drop=selected income numbcars);
set cs.telecom;
income_new=input(income,8.);
numbcars_new=input(numbcars,8.);
run;

proc contents data=cs.telecom1;
run;

Proc freq data=cs.telecom1;
tables area asl_flag car_buy cartype children crclscod csa div_type dwllsize dwlltype ethnic forgntvl hnd_webcap
mailordr mailresp marital mtrcycle occu1 prizm_social_one proptype refurb_new truck;
run;

proc means data=cs.telecom1 n nmiss mean min max std;
run;

data cs.telecom1;
set cs.telecom1;
if income_new= . then income_new=5;
run;

proc univariate data=cs.telecom1;
run;

proc freq data=cs.telecom1;
tables crclscod;
run;

data cs.telecom2 (drop=crclscod);
set cs.telecom1;
if crclscod="A" or crclscod="A2" or crclscod="A3" or crclscod="AA" then topcrdtscore=1; else topcrdtscore=0;
if crclscod="B" or crclscod="B2" or crclscod="BA" then goodcrdtscore=1; else goodcrdtscore=0;
if crclscod="C" or crclscod="C2" or crclscod="C5" or crclscod="CA" or crclscod="CC" or crclscod="CY" or crclscod="D" 
or crclscod="D2" or crclscod="D4" or crclscod="D5" or crclscod="DA" or crclscod="E" or crclscod="E2" or crclscod="E4" 
or crclscod="EA" or crclscod="EC" or crclscod="EF" or crclscod="EM" or crclscod="G" or crclscod="GA" or crclscod="GY"
or crclscod="H" or crclscod="I" or crclscod="IF" or crclscod="J" or crclscod="JF" or crclscod="K" or crclscod="L" 
or crclscod="M" or crclscod="O" or crclscod="P1" then avgcrdtscore=1; else avgcrdtscore=0;
if crclscod="S" or crclscod="TP" or crclscod="U" or crclscod="u1" or crclscod="V1" or crclscod="W" or crclscod="Y" 
or crclscod="Z" or crclscod="Z1" or crclscod="Z2" or crclscod="Z4" or crclscod="Z5" or crclscod="ZA" or crclscod="ZF"
or crclscod="ZY" THEN badcrdtscore=1; else badcrdtscore=0;
run;

proc freq data=cs.telecom2;
tables topcrdtscore goodcrdtscore avgcrdtscore badcrdtscore;
run;

data cs.telecom3 (drop=area cartype children csa div_type dwllsize dwlltype ethnic hnd_webcap mailordr mailresp marital
mtrcycle occu1 prizm_social_one proptype refurb_new truck asl_flag forgntvl);
set cs.telecom2;
if area="ATLANTIC SOUTH AREA" then Atlantic_south=1; else Atlantic_south=0;
if area="CALIFORNIA NORTH AREA" then California_north=1; else California_north=0;
if area="CENTRAL/SOUTH TEXAS AREA" then central_south_texas=1; else central_south_texas=0;
if area="CHICAGO AREA" then chicago=1; else chicago=0;
if area="DALLAS AREA" then dallas=1; else dallas=0;
if area="DC/MARYLAND/VIRGINIA AREA" then DC_ML_virginia=1; else DC_ML_virginia=0;
if area="GREAT LAKES AREA" then great_lakes=1; else great_lakes=-0;
if area="HOUSTON AREA" then houston=1; else houston=0;
if area="LOS ANGELES AREA" then los_angeles=1; else los_angeles=0;
if area="MIDWEST AREA" then midwest=1; else midwest=0;
if area="NEW ENGLAND AREA" then new_england=1; else new_england=0;
if area="NEW YORK CITY AREA" then new_york=1; else new_york=0;
if area="NORTH FLORIDA AREA" then north_florida=1; else north_florida=0;
if area="NORTHWEST/ROCKY MOUNTAIN" then NW_rockymountain=1; else NW_rockymountain=0;
if area="OHIO AREA" then ohio=1; else ohio=0;
if area="PHILADELPHIA AREA" then philadelphia=1; else philadelphia=0;
if area="SOUTH FLORIDA AREA" then south_florida=1; else south_florida=0;
if area="SOUTHWEST AREA" then southwest=1; else southwest=0;
if asl_flag="Y" then Asl_flag_y=1; else Asl_flag_y=0;
if dwlltype="M" then multiple_family=1; else multiple_family=0;
if dwlltype="S" then single_family=1; else single_family=0;
if dwlltype="NA" then Unknown_family=1; else unknown_family=0;
if ethnic="B" then Asian_Non=1; else Asian_non=0;
if ethnic="D" then South_european=1; else South_european=0;
if ethnic="F" then French=1; else French=0;
if ethnic="G" then German=1; else German=0;
if ethnic="H" then Hispanic=1; else Hispanic=0;
if ethnic="I" then Italian=1; else Italian=0;
if ethnic="J" then Jewish=1; else Jewish=0;
if ethnic="M" then Misc=1; else Misc=0;
if ethnic="N" then North_european=1; else North_european=0;
if ethnic="O" then Asian=1; else Asian=0;
if ethnic="P" then Polynesian=1; else Polynesian=0;
if ethnic="R" then Arab=1; else Arab=0;
if ethnic="S" then Scottish_Irish=1; else Scottish_Irish=0;
if ethnic="U" then ethnic_Unkw=1; else ethnic_Unkw=0;
if ethnic="Z" then AfroAmerican=1; else AfroAmerican=0;
if forgntvl="1" then foreign=1; else foreign="0";
if forgntvl="0" or forgntvl="NA" then nonforeign=1; else nonforeign=0;
if hnd_webcap="WCMB" then hndwebcap_wcmb=1; else hndwebcap_wcmb=0;
if hnd_webcap="WC" then hndwebcap_wc=1; else hndwebcap_wc=0;
if hnd_webcap="NA" or hnd_webcap="UNKW" then hndwebcap_unkw=1; else hndwebcap_unkw=0;
if mailresp="R" then mailresp_new=1; else mailresp_new=0;
if marital="A" or marital="M" then married=1; else married=0;
if marital="S" or marital="B" then single=1; else single=0;
if marital="U" or marital="NA" then married_unkw=1; else married_unkw=0;
if mtrcycle="0" then mtrcycle_new=1; else mtrcycle_new=0;
if prizm_social_one="C" then city=1; else city=0;
if prizm_social_one="R" then rural=1; else rural=0;
if prizm_social_one="S" then suburban=1; else suburban=0;
if prizm_social_one="T" then town=1; else town=0;
if prizm_social_one="U" then urban=1; else urban=0;
if refurb_new="N" then new_hndset=1; else new_hndset=0;
if refurb_new="R" then refurb_hndset=1; else refurb_hndset=0;
if truck="1" then truck_new=1; else truck_new=0;
run;

proc means data=cs.telecom3 n nmiss mean;
run;

data cs.telecom4(drop=numbcars_new);
set cs.telecom3;
if da_mean=. then delete;
if age1=. then age1=31;
if age2=. then age2=21;
if avg6mou=. then avg6mou=522;
if avg6qty=. then avg6qty=181;
if hnd_price=. then hnd_price=105;
if change_mou=. then change_mou=-6.6;
Nonop_rateplan = ((ovrrev_Mean/totrev)*100);
run;

proc univariate data=cs.telecom4;
var totmrc_mean rev_mean eqpdays;
run;

proc means data=cs.telecom4 n nmiss max min mean;
run;

data cs.telecom5;
set cs.telecom4;

if avgrev <30 then avgrev_30=1; else avgrev_30=0;
if 30< avgrev <50 then avgrev_50=1; else avgrev_50=0;
if 50< avgrev <70 then avgrev_70=1; else avgrev_70=0;
if 70< avgrev <100 then avgrev_100=1; else avgrev_100=0;
if avgrev >= 100 then avgrev_101=1; else avgrev_101=0;

if age1 <25then age25_bkt=1; else age25_bkt=0;
if 25<age1 <40 then age40_bkt=1; else age40_bkt=0;
if 40<age1 <60 then age60_bkt=1; else age60_bkt=0;
if age1 >= 60 then agegr60_bkt=1; else agegr60_bkt=0;

if age2 <40 then age2_40=1; else age2_40=0;
if 40<age2<60 then age2_60=1; else age2_60=0;
if age2 >= 60 then age2_61=1; else age2_61=0;

if hnd_price <60 then hnd_price_60=1; else hnd_price_60=0; 
if 60< hnd_price <100 then hnd_price_100=1;else hnd_price_100=0; 
if 100< hnd_price <150 then hnd_price_150=1;else hnd_price_150=0;
if 150< hnd_price <200 then hnd_price_200=1;else hnd_price_200=0;
if hnd_price >= 200 then hnd_price_201=1; else hnd_price_201=0;

if income_new=1 then income1=1; else income1 = 0;
if income_new=2 then income2=1; else income2 = 0;
if income_new=3 then income3=1; else income3 = 0;
if income_new=4 then income4=1; else income4 = 0;
if income_new=5 then income5=1; else income5 = 0;
if income_new=6 then income6=1; else income6 = 0;
if income_new=7 then income7=1; else income7 = 0;
if income_new=8 then income8=1; else income8 = 0;
if income_new=9 then income9=1; else income9 = 0;

if actvsubs=1 then actvsubs_1=1; else actvsubs_1=0;
if actvsubs=2 then actvsubs_2=1; else actvsubs_2=0;
if actvsubs=3 then actvsubs_3=1; else actvsubs_3=0;
if actvsubs=4 then actvsubs_4=1; else actvsubs_4=0;
if actvsubs=5 then actvsubs_5=1; else actvsubs_5=0;
if actvsubs=6 then actvsubs_6=1; else actvsubs_6=0;
if actvsubs=7 then actvsubs_7=1; else actvsubs_7=0;
if actvsubs=8 then actvsubs_8=1; else actvsubs_8=0;
if actvsubs>8 then actvsubs_gr8=1; else actvsubs_gr8=0;
run;

proc means data=cs.telecom5 n nmiss max min mean;
run;

proc sort data=cs.telecom5;
by customer_id;
run;

proc freq data=cs.telecom5;
tables churn;
run;

proc surveyselect data=cs.telecom5 method =srs samprate=0.5 out=cs.telecomtrain1;
run;

data cs.telecomvalidation1;
merge cs.telecom5 (in=a) cs.telecomtrain (in=b);
if a and not b;
run;

proc logistic data=cs.telecomtrain1 descending;
model churn = mou_mean totmrc_Mean rev_Range mou_Range change_mou drop_blk_Mean drop_vce_Range owylis_vce_Range
mou_opkv_Range months totcalls eqpdays custcare_Mean callwait_Mean iwylis_vce_Mean callwait_Range ccrndmou_Range 
adjqty ovrrev_Mean rev_Mean ovrmou_Mean comp_vce_Mean plcd_vce_Mean avg3mou avgmou avg3qty avgqty avg6mou avg6qty
  models uniqsubs opk_dat_Mean roam_Mean topcrdtscore goodcrdtscore avgcrdtscore
recv_sms_Mean blck_dat_Mean mou_pead_Mean da_Mean da_Range datovr_Mean datovr_Range drop_dat_Mean drop_vce_Mean adjmou 
totrev adjrev Atlantic_south California_north  central_south_texas chicago dallas DC_ML_virginia great_lakes 
houston los_angeles midwest new_england new_york north_florida NW_rockymountain ohio philadelphia south_florida 
southwest Asl_flag_y multiple_family single_family Unknown_family Asian_Non South_european French German Hispanic 
Italian Jewish Misc North_european Asian Polynesian Arab Scottish_Irish ethnic_Unkw AfroAmerican foreign nonforeign
 hndwebcap_wcmb hndwebcap_wc hndwebcap_unkw mailresp_new married single married_unkw mtrcycle_new city rural suburban town urban
 new_hndset refurb_hndset truck_new avgrev_30 avgrev_50 avgrev_70 avgrev_100 avgrev_101 age25_bkt age40_bkt age60_bkt agegr60_bkt 
 age2_40 age2_60 age2_61 hnd_price_60 hnd_price_100 hnd_price_150 hnd_price_200 hnd_price_201 income1 income2 income3 income4 
 income5 income6 income7 income8 income9 actvsubs_1 actvsubs_2 actvsubs_3 actvsubs_4 actvsubs_5 actvsubs_6 actvsubs_7 actvsubs_8 
actvsubs_gr8 Nonop_rateplan/selection=forward ctable lackfit stb;
run;

proc logistic data=cs.telecomtrain1 descending outmodel= cs.tcmodel;
model churn = mou_mean totmrc_Mean rev_Range mou_Range change_mou drop_blk_Mean drop_vce_Range owylis_vce_Range
mou_opkv_Range months totcalls eqpdays custcare_Mean callwait_Mean iwylis_vce_Mean callwait_Range ccrndmou_Range 
adjqty ovrrev_Mean rev_Mean ovrmou_Mean comp_vce_Mean plcd_vce_Mean avg3mou avgmou avg3qty avgqty avg6mou avg6qty
  models uniqsubs opk_dat_Mean roam_Mean topcrdtscore goodcrdtscore avgcrdtscore
recv_sms_Mean blck_dat_Mean mou_pead_Mean da_Mean da_Range datovr_Mean datovr_Range drop_dat_Mean drop_vce_Mean adjmou 
totrev adjrev Atlantic_south California_north  central_south_texas chicago dallas DC_ML_virginia great_lakes 
houston los_angeles midwest new_england new_york north_florida NW_rockymountain ohio philadelphia south_florida 
southwest Asl_flag_y multiple_family single_family Unknown_family Asian_Non South_european French German Hispanic 
Italian Jewish Misc North_european Asian Polynesian Arab Scottish_Irish ethnic_Unkw AfroAmerican foreign nonforeign
 hndwebcap_wcmb hndwebcap_wc hndwebcap_unkw mailresp_new married single married_unkw mtrcycle_new city rural suburban town urban
 new_hndset refurb_hndset truck_new avgrev_30 avgrev_50 avgrev_70 avgrev_100 avgrev_101 age25_bkt age40_bkt age60_bkt agegr60_bkt 
 age2_40 age2_60 age2_61 hnd_price_60 hnd_price_100 hnd_price_150 hnd_price_200 hnd_price_201 income1 income2 income3 income4 
 income5 income6 income7 income8 income9 actvsubs_1 actvsubs_2 actvsubs_3 actvsubs_4 actvsubs_5 actvsubs_6 actvsubs_7 actvsubs_8 
actvsubs_gr8 Nonop_rateplan/selection=forward ctable lackfit stb;
score out=cs.tctrainmodel;
run;

Proc rank data=cs.tctrainmodel out=cs.tctraindecile groups=10 ties=mean;
var p_1;
ranks decile;
run;

proc sort data=cs.tctraindecile;
by descending p_1;
run;

proc export
data=cs.tctraindecile
DBMS=xls
outfile="/home/harshithreddyv0/Capstone/TCTRAIN.XLS";
run;

proc logistic data=cs.telecomvalidation1 descending outmodel= cs.tcmodel;
model churn = mou_mean totmrc_Mean rev_Range mou_Range change_mou drop_blk_Mean drop_vce_Range owylis_vce_Range
mou_opkv_Range months totcalls eqpdays custcare_Mean callwait_Mean iwylis_vce_Mean callwait_Range ccrndmou_Range 
adjqty ovrrev_Mean rev_Mean ovrmou_Mean comp_vce_Mean plcd_vce_Mean avg3mou avgmou avg3qty avgqty avg6mou avg6qty
  models uniqsubs opk_dat_Mean roam_Mean topcrdtscore goodcrdtscore avgcrdtscore
recv_sms_Mean blck_dat_Mean mou_pead_Mean da_Mean da_Range datovr_Mean datovr_Range drop_dat_Mean drop_vce_Mean adjmou 
totrev adjrev Atlantic_south California_north  central_south_texas chicago dallas DC_ML_virginia great_lakes 
houston los_angeles midwest new_england new_york north_florida NW_rockymountain ohio philadelphia south_florida 
southwest Asl_flag_y multiple_family single_family Unknown_family Asian_Non South_european French German Hispanic 
Italian Jewish Misc North_european Asian Polynesian Arab Scottish_Irish ethnic_Unkw AfroAmerican foreign nonforeign
 hndwebcap_wcmb hndwebcap_wc hndwebcap_unkw mailresp_new married single married_unkw mtrcycle_new city rural suburban town urban
 new_hndset refurb_hndset truck_new avgrev_30 avgrev_50 avgrev_70 avgrev_100 avgrev_101 age25_bkt age40_bkt age60_bkt agegr60_bkt 
 age2_40 age2_60 age2_61 hnd_price_60 hnd_price_100 hnd_price_150 hnd_price_200 hnd_price_201 income1 income2 income3 income4 
 income5 income6 income7 income8 income9 actvsubs_1 actvsubs_2 actvsubs_3 actvsubs_4 actvsubs_5 actvsubs_6 actvsubs_7 actvsubs_8 
actvsubs_gr8 Nonop_rateplan/selection=forward ctable lackfit stb;
score out=cs.tcvalidmodel;
run;


data cs.tcvalidfinal;
set cs.tcvalidmodel;
if F_Churn=0 and I_Churn=0 then out="true negative";
if F_Churn=0 and I_Churn=1 then out="false positive";
if F_Churn=1 and I_Churn=1 then out="true positive";
if F_Churn=1 and I_Churn=0 then out="false negative";
run;

proc freq data=cs.tcvalidfinal;
table out;
run;

Proc rank data=cs.tcvalidmodel out=cs.tcvaliddecile groups=10 ties=mean;
var p_1;
ranks decile;
run;

proc sort data=cs.tcvaliddecile;
by descending p_1;
run;

proc export
data=cs.tcvaliddecile
DBMS=xls
outfile="/home/harshithreddyv0/Capstone/TCvalid.XLS";
run;

proc logistic data=cs.telecom5 descending outmodel= cs.tcmodel;
model churn = mou_mean totmrc_Mean rev_Range mou_Range change_mou drop_blk_Mean drop_vce_Range owylis_vce_Range
mou_opkv_Range months totcalls eqpdays custcare_Mean callwait_Mean iwylis_vce_Mean callwait_Range ccrndmou_Range 
adjqty ovrrev_Mean rev_Mean ovrmou_Mean comp_vce_Mean plcd_vce_Mean avg3mou avgmou avg3qty avgqty avg6mou avg6qty
  models uniqsubs opk_dat_Mean roam_Mean topcrdtscore goodcrdtscore avgcrdtscore
recv_sms_Mean blck_dat_Mean mou_pead_Mean da_Mean da_Range datovr_Mean datovr_Range drop_dat_Mean drop_vce_Mean adjmou 
totrev adjrev Atlantic_south California_north  central_south_texas chicago dallas DC_ML_virginia great_lakes 
houston los_angeles midwest new_england new_york north_florida NW_rockymountain ohio philadelphia south_florida 
southwest Asl_flag_y multiple_family single_family Unknown_family Asian_Non South_european French German Hispanic 
Italian Jewish Misc North_european Asian Polynesian Arab Scottish_Irish ethnic_Unkw AfroAmerican foreign nonforeign
 hndwebcap_wcmb hndwebcap_wc hndwebcap_unkw mailresp_new married single married_unkw mtrcycle_new city rural suburban town urban
 new_hndset refurb_hndset truck_new avgrev_30 avgrev_50 avgrev_70 avgrev_100 avgrev_101 age25_bkt age40_bkt age60_bkt agegr60_bkt 
 age2_40 age2_60 age2_61 hnd_price_60 hnd_price_100 hnd_price_150 hnd_price_200 hnd_price_201 income1 income2 income3 income4 
 income5 income6 income7 income8 income9 actvsubs_1 actvsubs_2 actvsubs_3 actvsubs_4 actvsubs_5 actvsubs_6 actvsubs_7 actvsubs_8 
actvsubs_gr8 Nonop_rateplan/selection=forward ctable lackfit stb;
score out=cs.tcoverallmodel;
run;

data cs.tcoverallfinal;
set cs.tcoverallmodel;
if F_Churn=0 and I_Churn=0 then out="true negative";
if F_Churn=0 and I_Churn=1 then out="false positive";
if F_Churn=1 and I_Churn=1 then out="true positive";
if F_Churn=1 and I_Churn=0 then out="false negative";
run;

proc freq data=cs.tcoverallfinal;
table out;
run;

Proc rank data=cs.tcoverallmodel out=cs.tcoveralldecile groups=10 ties=mean;
var p_1;
ranks decile;
run;

proc sort data=cs.tcoveralldecile;
by descending p_1;
run;

proc export
data=cs.tcoveralldecile
DBMS=xls
outfile="/home/harshithreddyv0/Capstone/TCoverall.XLS";
run;

proc surveyselect data=cs.telecom5 method=srs samprate=0.2 out=cs.telecomq5;
run;

proc logistic data=cs.telecomq5 descending outmodel=cs.tcmodel;
model churn = mou_mean totmrc_Mean rev_Range mou_Range change_mou drop_blk_Mean drop_vce_Range owylis_vce_Range
mou_opkv_Range months totcalls eqpdays custcare_Mean callwait_Mean iwylis_vce_Mean callwait_Range ccrndmou_Range 
adjqty ovrrev_Mean rev_Mean ovrmou_Mean comp_vce_Mean plcd_vce_Mean avg3mou avgmou avg3qty avgqty avg6mou avg6qty
  models uniqsubs opk_dat_Mean roam_Mean topcrdtscore goodcrdtscore avgcrdtscore
recv_sms_Mean blck_dat_Mean mou_pead_Mean da_Mean da_Range datovr_Mean datovr_Range drop_dat_Mean drop_vce_Mean adjmou 
totrev adjrev Atlantic_south California_north  central_south_texas chicago dallas DC_ML_virginia great_lakes 
houston los_angeles midwest new_england new_york north_florida NW_rockymountain ohio philadelphia south_florida 
southwest Asl_flag_y multiple_family single_family Unknown_family Asian_Non South_european French German Hispanic 
Italian Jewish Misc North_european Asian Polynesian Arab Scottish_Irish ethnic_Unkw AfroAmerican foreign nonforeign
 hndwebcap_wcmb hndwebcap_wc hndwebcap_unkw mailresp_new married single married_unkw mtrcycle_new city rural suburban town urban
 new_hndset refurb_hndset truck_new avgrev_30 avgrev_50 avgrev_70 avgrev_100 avgrev_101 age25_bkt age40_bkt age60_bkt agegr60_bkt 
 age2_40 age2_60 age2_61 hnd_price_60 hnd_price_100 hnd_price_150 hnd_price_200 hnd_price_201 income1 income2 income3 income4 
 income5 income6 income7 income8 income9 actvsubs_1 actvsubs_2 actvsubs_3 actvsubs_4 actvsubs_5 actvsubs_6 actvsubs_7 actvsubs_8 
actvsubs_gr8 Nonop_rateplan/selection=forward ctable lackfit stb;
run;





