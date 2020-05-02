pragma solidity >=0.5.0 <0.6.0;

import "./Storage.sol";

/*
    Note: this entire contract is embarassing
    All of this nonsense is an attempt to get around the various limitations of the underlying technology.
    Contract length limitations, gas cost per transaction limitations
    
    IMPORTANT:
        1) You must update storageContractAddress by calling _setStorageContract if necessary
        2) You will need to copy/paste functions f1-f9 individually such that you are deploying only one of these functions at a time
        Otherwise you will exceed contract length and transaction limitations.
        3) The contract at 0x7AF30bdddBD23EFbe533d27e89c4b8c6eC5D149B has historical data through 4/28.
        PLEASE DO NOT ADD TO IT UNLESS ADDING NEW DAYS. Otherwise we will need to deploy 9 versions of this contract to rebuild the dataset on chain.
    
    Data Source: Johns Hopkins School of Public Health
    https://data.humdata.org/dataset/novel-coronavirus-2019-ncov-cases
*/

contract massEntry {

    Storage storageContract;
    address storageContractAddress; // You probably want to initialize this here rather than calling _setStorageContract for every deployment...

    constructor() public{
        storageContract = Storage(storageContractAddress);
    }

    function _setStorageContract(address _newStorageContractAddress) public {
        storageContractAddress = _newStorageContractAddress;
        storageContract = Storage(storageContractAddress);
    }

    function f1() public {
        require(storageContractAddress != address(0), "You have to set the storage contract address first.");

        storageContract.addHistoricalRecord("COVID-19","Afghanistan","33,65",1531);
        storageContract.addHistoricalRecord("COVID-19","Albania","41.1533,20.1683",726);
        storageContract.addHistoricalRecord("COVID-19","Algeria","28.0339,1.6596",3382);
        storageContract.addHistoricalRecord("COVID-19","Andorra","42.5063,1.5218",738);
        storageContract.addHistoricalRecord("COVID-19","Angola","-11.2027,17.8739",26);
        storageContract.addHistoricalRecord("COVID-19","Antigua and Barbuda","17.0608,-61.7964",24);
        storageContract.addHistoricalRecord("COVID-19","Argentina","-38.4161,-63.6167",3892);
        storageContract.addHistoricalRecord("COVID-19","Armenia","40.0691,45.0382",1746);
        storageContract.addHistoricalRecord("COVID-19","Australia","-35.4735,149.0124",106);
        storageContract.addHistoricalRecord("COVID-19","Australia","-33.8688,151.2093",3002);
        storageContract.addHistoricalRecord("COVID-19","Australia","-12.4634,130.8456",28);
        storageContract.addHistoricalRecord("COVID-19","Australia","-28.0167,153.4",1030);
        storageContract.addHistoricalRecord("COVID-19","Australia","-34.9285,138.6007",438);
        storageContract.addHistoricalRecord("COVID-19","Australia","-41.4545,145.9707",212);
        storageContract.addHistoricalRecord("COVID-19","Australia","-37.8136,144.9631",1349);
        storageContract.addHistoricalRecord("COVID-19","Australia","-31.9505,115.8605",549);
        storageContract.addHistoricalRecord("COVID-19","Austria","47.5162,14.5501",15225);
        storageContract.addHistoricalRecord("COVID-19","Azerbaijan","40.1431,47.5769",1645);
        storageContract.addHistoricalRecord("COVID-19","Bahamas","25.0343,-77.3963",80);
        storageContract.addHistoricalRecord("COVID-19","Bahrain","26.0275,50.55",2647);
        storageContract.addHistoricalRecord("COVID-19","Bangladesh","23.685,90.3563",5416);
        storageContract.addHistoricalRecord("COVID-19","Barbados","13.1939,-59.5432",79);
        storageContract.addHistoricalRecord("COVID-19","Belarus","53.7098,27.9534",10463);
        storageContract.addHistoricalRecord("COVID-19","Belgium","50.8333,4",46134);
        storageContract.addHistoricalRecord("COVID-19","Benin","9.3077,2.3158",64);
        storageContract.addHistoricalRecord("COVID-19","Bhutan","27.5142,90.4336",7);
        storageContract.addHistoricalRecord("COVID-19","Bolivia","-16.2902,-63.5887",950);
        storageContract.addHistoricalRecord("COVID-19","Bosnia and Herzegovina","43.9159,17.6791",1516);
    }

    function f2() public {
        require(storageContractAddress != address(0), "You have to set the storage contract address first.");

        storageContract.addHistoricalRecord("COVID-19","Brazil","-14.235,-51.9253",63100);
        storageContract.addHistoricalRecord("COVID-19","Brunei","4.5353,114.7277",138);
        storageContract.addHistoricalRecord("COVID-19","Bulgaria","42.7339,25.4858",1300);
        storageContract.addHistoricalRecord("COVID-19","Burkina Faso","12.2383,-1.5616",632);
        storageContract.addHistoricalRecord("COVID-19","Cabo Verde","16.5388,-23.0418",106);
        storageContract.addHistoricalRecord("COVID-19","Cambodia","11.55,104.9167",122);
        storageContract.addHistoricalRecord("COVID-19","Cameroon","3.848,11.5021",1621);
        storageContract.addHistoricalRecord("COVID-19","Canada","53.9333,-116.5765",4480);
        storageContract.addHistoricalRecord("COVID-19","Canada","49.2827,-123.1207",1948);
        storageContract.addHistoricalRecord("COVID-19","Canada","37.6489,-122.6655",13);
        storageContract.addHistoricalRecord("COVID-19","Canada","53.7609,-98.8139",271);
        storageContract.addHistoricalRecord("COVID-19","Canada","46.5653,-66.4619",118);
        storageContract.addHistoricalRecord("COVID-19","Canada","53.1355,-57.6604",258);
        storageContract.addHistoricalRecord("COVID-19","Canada","44.682,-63.7443",873);
        storageContract.addHistoricalRecord("COVID-19","Canada","51.2538,-85.3232",15568);
        storageContract.addHistoricalRecord("COVID-19","Canada","46.5107,-63.4168",26);
        storageContract.addHistoricalRecord("COVID-19","Canada","52.9399,-73.5491",24109);
        storageContract.addHistoricalRecord("COVID-19","Canada","52.9399,-106.4509",353);
        storageContract.addHistoricalRecord("COVID-19","Central African Republic","6.6111,20.9394",19);
        storageContract.addHistoricalRecord("COVID-19","Chad","15.4542,18.7322",46);
        storageContract.addHistoricalRecord("COVID-19","Chile","-35.6751,-71.543",13331);
        storageContract.addHistoricalRecord("COVID-19","China","31.8257,117.2264",991);
        storageContract.addHistoricalRecord("COVID-19","China","40.1824,116.4142",593);
        storageContract.addHistoricalRecord("COVID-19","China","30.0572,107.874",579);
        storageContract.addHistoricalRecord("COVID-19","China","26.0789,117.9874",355);
        storageContract.addHistoricalRecord("COVID-19","China","37.8099,101.0583",139);
        storageContract.addHistoricalRecord("COVID-19","China","23.3417,113.4244",1587);
        storageContract.addHistoricalRecord("COVID-19","China","23.8298,108.7881",254);
        storageContract.addHistoricalRecord("COVID-19","China","26.8154,106.8748",147);
        storageContract.addHistoricalRecord("COVID-19","China","19.1959,109.7453",168);
        storageContract.addHistoricalRecord("COVID-19","China","39.549,116.1306",328);
    }

    function f3() public {
        require(storageContractAddress != address(0), "You have to set the storage contract address first.");

        storageContract.addHistoricalRecord("COVID-19","China","47.862,127.7615",936);
        storageContract.addHistoricalRecord("COVID-19","China","33.882,113.614",1276);
        storageContract.addHistoricalRecord("COVID-19","China","22.3,114.2",1037);
        storageContract.addHistoricalRecord("COVID-19","China","30.9756,112.2707",68128);
        storageContract.addHistoricalRecord("COVID-19","China","27.6104,111.7088",1019);
        storageContract.addHistoricalRecord("COVID-19","China","44.0935,113.9448",198);
        storageContract.addHistoricalRecord("COVID-19","China","32.9711,119.455",653);
        storageContract.addHistoricalRecord("COVID-19","China","27.614,115.7221",937);
        storageContract.addHistoricalRecord("COVID-19","China","43.6661,126.1923",110);
        storageContract.addHistoricalRecord("COVID-19","China","41.2956,122.6085",146);
        storageContract.addHistoricalRecord("COVID-19","China","22.1667,113.55",45);
        storageContract.addHistoricalRecord("COVID-19","China","37.2692,106.1655",75);
        storageContract.addHistoricalRecord("COVID-19","China","35.7452,95.9956",18);
        storageContract.addHistoricalRecord("COVID-19","China","35.1917,108.8701",286);
        storageContract.addHistoricalRecord("COVID-19","China","36.3427,118.1498",787);
        storageContract.addHistoricalRecord("COVID-19","China","31.202,121.4491",642);
        storageContract.addHistoricalRecord("COVID-19","China","37.5777,112.2922",197);
        storageContract.addHistoricalRecord("COVID-19","China","30.6171,102.7103",561);
        storageContract.addHistoricalRecord("COVID-19","China","39.3054,117.323",190);
        storageContract.addHistoricalRecord("COVID-19","China","31.6927,88.0924",1);
        storageContract.addHistoricalRecord("COVID-19","China","41.1129,85.2401",76);
        storageContract.addHistoricalRecord("COVID-19","China","24.974,101.487",185);
        storageContract.addHistoricalRecord("COVID-19","China","29.1832,120.0934",1268);
        storageContract.addHistoricalRecord("COVID-19","Colombia","4.5709,-74.2973",5379);
        storageContract.addHistoricalRecord("COVID-19","Congo (Brazzaville)","-4.0383,21.7587",200);
        storageContract.addHistoricalRecord("COVID-19","Congo (Kinshasa)","-4.0383,21.7587",442);
        storageContract.addHistoricalRecord("COVID-19","Costa Rica","9.7489,-83.7534",695);
        storageContract.addHistoricalRecord("COVID-19","Cote d'Ivoire","7.54,-5.5471",1150);
        storageContract.addHistoricalRecord("COVID-19","Croatia","45.1,15.2",2030);
        storageContract.addHistoricalRecord("COVID-19","Diamond Princess","0,0",712);
        storageContract.addHistoricalRecord("COVID-19","Cuba","22,-80",1369);
    }

    function f4() public {
        require(storageContractAddress != address(0), "You have to set the storage contract address first.");

        storageContract.addHistoricalRecord("COVID-19","Cyprus","35.1264,33.4299",817);
        storageContract.addHistoricalRecord("COVID-19","Czechia","49.8175,15.473",7404);
        storageContract.addHistoricalRecord("COVID-19","Denmark","61.8926,-6.9118",187);
        storageContract.addHistoricalRecord("COVID-19","Denmark","71.7069,-42.6043",11);
        storageContract.addHistoricalRecord("COVID-19","Denmark","56.2639,9.5018",8575);
        storageContract.addHistoricalRecord("COVID-19","Djibouti","11.8251,42.5903",1023);
        storageContract.addHistoricalRecord("COVID-19","Dominican Republic","18.7357,-70.1627",6135);
        storageContract.addHistoricalRecord("COVID-19","Ecuador","-1.8312,-78.1834",22719);
        storageContract.addHistoricalRecord("COVID-19","Egypt","26,30",4534);
        storageContract.addHistoricalRecord("COVID-19","El Salvador","13.7942,-88.8965",298);
        storageContract.addHistoricalRecord("COVID-19","Equatorial Guinea","1.5,10",258);
        storageContract.addHistoricalRecord("COVID-19","Eritrea","15.1794,39.7823",39);
        storageContract.addHistoricalRecord("COVID-19","Estonia","58.5953,25.0136",1643);
        storageContract.addHistoricalRecord("COVID-19","Eswatini","-26.5225,31.4659",59);
        storageContract.addHistoricalRecord("COVID-19","Ethiopia","9.145,40.4897",123);
        storageContract.addHistoricalRecord("COVID-19","Fiji","-17.7134,178.065",18);
        storageContract.addHistoricalRecord("COVID-19","Finland","64,26",4576);
        storageContract.addHistoricalRecord("COVID-19","France","3.9339,-53.1258",111);
        storageContract.addHistoricalRecord("COVID-19","France","-17.6797,149.4068",57);
        storageContract.addHistoricalRecord("COVID-19","France","16.25,-61.5833",149);
        storageContract.addHistoricalRecord("COVID-19","France","-12.8275,45.1662",401);
        storageContract.addHistoricalRecord("COVID-19","France","-20.9043,165.618",18);
        storageContract.addHistoricalRecord("COVID-19","France","-21.1351,55.2471",417);
        storageContract.addHistoricalRecord("COVID-19","France","17.9,-62.8333",6);
        storageContract.addHistoricalRecord("COVID-19","France","18.0708,-63.0501",38);
        storageContract.addHistoricalRecord("COVID-19","France","14.6415,-61.0242",175);
        storageContract.addHistoricalRecord("COVID-19","France","46.2276,2.2137",160847);
        storageContract.addHistoricalRecord("COVID-19","Gabon","-0.8037,11.6094",176);
        storageContract.addHistoricalRecord("COVID-19","Gambia","13.4432,-15.3101",10);
        storageContract.addHistoricalRecord("COVID-19","Georgia","42.3154,43.3569",486);
        storageContract.addHistoricalRecord("COVID-19","Germany","51,9",157770);
    }

    function f5() public {
        require(storageContractAddress != address(0), "You have to set the storage contract address first.");

        storageContract.addHistoricalRecord("COVID-19","Ghana","7.9465,-1.0232",1550);
        storageContract.addHistoricalRecord("COVID-19","Greece","39.0742,21.8243",2517);
        storageContract.addHistoricalRecord("COVID-19","Guatemala","15.7835,-90.2308",500);
        storageContract.addHistoricalRecord("COVID-19","Guinea","9.9456,-9.6966",996);
        storageContract.addHistoricalRecord("COVID-19","Guyana","5,-58.75",74);
        storageContract.addHistoricalRecord("COVID-19","Haiti","18.9712,-72.2852",74);
        storageContract.addHistoricalRecord("COVID-19","Holy See","41.9029,12.4534",9);
        storageContract.addHistoricalRecord("COVID-19","Honduras","15.2,-86.2419",627);
        storageContract.addHistoricalRecord("COVID-19","Hungary","47.1625,19.5033",2500);
        storageContract.addHistoricalRecord("COVID-19","Iceland","64.9631,-19.0208",1792);
        storageContract.addHistoricalRecord("COVID-19","India","21,78",27890);
        storageContract.addHistoricalRecord("COVID-19","Indonesia","-0.7893,113.9213",8882);
        storageContract.addHistoricalRecord("COVID-19","Iran","32,53",90481);
        storageContract.addHistoricalRecord("COVID-19","Iraq","33,44",1820);
        storageContract.addHistoricalRecord("COVID-19","Ireland","53.1424,-7.6921",19262);
        storageContract.addHistoricalRecord("COVID-19","Israel","31,35",15443);
        storageContract.addHistoricalRecord("COVID-19","Italy","43,12",197675);
        storageContract.addHistoricalRecord("COVID-19","Jamaica","18.1096,-77.2975",350);
        storageContract.addHistoricalRecord("COVID-19","Japan","36,138",13441);
        storageContract.addHistoricalRecord("COVID-19","Jordan","31.24,36.51",447);
        storageContract.addHistoricalRecord("COVID-19","Kazakhstan","48.0196,66.9237",2717);
        storageContract.addHistoricalRecord("COVID-19","Kenya","-0.0236,37.9062",355);
        storageContract.addHistoricalRecord("COVID-19","Korea, South","36,128",10738);
        storageContract.addHistoricalRecord("COVID-19","Kuwait","29.5,47.75",3075);
        storageContract.addHistoricalRecord("COVID-19","Kyrgyzstan","41.2044,74.7661",682);
        storageContract.addHistoricalRecord("COVID-19","Latvia","56.8796,24.6032",812);
        storageContract.addHistoricalRecord("COVID-19","Lebanon","33.8547,35.8623",707);
        storageContract.addHistoricalRecord("COVID-19","Liberia","6.4281,-9.4295",124);
        storageContract.addHistoricalRecord("COVID-19","Liechtenstein","47.14,9.55",82);
        storageContract.addHistoricalRecord("COVID-19","Lithuania","55.1694,23.8813",1438);
        storageContract.addHistoricalRecord("COVID-19","Luxembourg","49.8153,6.1296",3723);
    }

    function f6() public {
        require(storageContractAddress != address(0), "You have to set the storage contract address first.");

        storageContract.addHistoricalRecord("COVID-19","Madagascar","-18.7669,46.8691",124);
        storageContract.addHistoricalRecord("COVID-19","Malaysia","2.5,112.5",5780);
        storageContract.addHistoricalRecord("COVID-19","Maldives","3.2028,73.2207",214);
        storageContract.addHistoricalRecord("COVID-19","Malta","35.9375,14.3754",448);
        storageContract.addHistoricalRecord("COVID-19","Mauritania","21.0079,10.9408",7);
        storageContract.addHistoricalRecord("COVID-19","Mauritius","-20.2,57.5",332);
        storageContract.addHistoricalRecord("COVID-19","Mexico","23.6345,-102.5528",14677);
        storageContract.addHistoricalRecord("COVID-19","Moldova","47.4116,28.3699",3408);
        storageContract.addHistoricalRecord("COVID-19","Monaco","43.7333,7.4167",94);
        storageContract.addHistoricalRecord("COVID-19","Mongolia","46.8625,103.8467",38);
        storageContract.addHistoricalRecord("COVID-19","Montenegro","42.5,19.3",321);
        storageContract.addHistoricalRecord("COVID-19","Morocco","31.7917,-7.0926",4065);
        storageContract.addHistoricalRecord("COVID-19","Namibia","-22.9576,18.4904",16);
        storageContract.addHistoricalRecord("COVID-19","Nepal","28.1667,84.25",52);
        storageContract.addHistoricalRecord("COVID-19","Netherlands","12.5186,-70.0358",100);
        storageContract.addHistoricalRecord("COVID-19","Netherlands","12.1696,-68.99",16);
        storageContract.addHistoricalRecord("COVID-19","Netherlands","18.0425,-63.0548",74);
        storageContract.addHistoricalRecord("COVID-19","Netherlands","52.1326,5.2913",37845);
        storageContract.addHistoricalRecord("COVID-19","New Zealand","-40.9006,174.886",1469);
        storageContract.addHistoricalRecord("COVID-19","Nicaragua","12.8654,-85.2072",13);
        storageContract.addHistoricalRecord("COVID-19","Niger","17.6078,8.0817",696);
        storageContract.addHistoricalRecord("COVID-19","Nigeria","9.082,8.6753",1273);
        storageContract.addHistoricalRecord("COVID-19","North Macedonia","41.6086,21.7453",1386);
        storageContract.addHistoricalRecord("COVID-19","Norway","60.472,8.4689",7527);
        storageContract.addHistoricalRecord("COVID-19","Oman","21,57",1998);
        storageContract.addHistoricalRecord("COVID-19","Pakistan","30.3753,69.3451",13328);
        storageContract.addHistoricalRecord("COVID-19","Panama","8.538,-80.7821",5779);
        storageContract.addHistoricalRecord("COVID-19","Papua New Guinea","-6.315,143.9555",8);
        storageContract.addHistoricalRecord("COVID-19","Paraguay","-23.4425,-58.4438",228);
        storageContract.addHistoricalRecord("COVID-19","Peru","-9.19,-75.0152",27517);
        storageContract.addHistoricalRecord("COVID-19","Philippines","13,122",7579);
    }

    function f7() public {
        require(storageContractAddress != address(0), "You have to set the storage contract address first.");

        storageContract.addHistoricalRecord("COVID-19","Poland","51.9194,19.1451",11617);
        storageContract.addHistoricalRecord("COVID-19","Portugal","39.3999,-8.2245",23864);
        storageContract.addHistoricalRecord("COVID-19","Qatar","25.3548,51.1839",10287);
        storageContract.addHistoricalRecord("COVID-19","Romania","45.9432,24.9668",11036);
        storageContract.addHistoricalRecord("COVID-19","Russia","60,90",80949);
        storageContract.addHistoricalRecord("COVID-19","Rwanda","-1.9403,29.8739",191);
        storageContract.addHistoricalRecord("COVID-19","Saint Lucia","13.9094,-60.9789",15);
        storageContract.addHistoricalRecord("COVID-19","Saint Vincent and the Grenadines","12.9843,-61.2872",14);
        storageContract.addHistoricalRecord("COVID-19","San Marino","43.9424,12.4578",538);
        storageContract.addHistoricalRecord("COVID-19","Saudi Arabia","24,45",17522);
        storageContract.addHistoricalRecord("COVID-19","Senegal","14.4974,-14.4524",671);
        storageContract.addHistoricalRecord("COVID-19","Serbia","44.0165,21.0059",6630);
        storageContract.addHistoricalRecord("COVID-19","Seychelles","-4.6796,55.492",11);
        storageContract.addHistoricalRecord("COVID-19","Singapore","1.2833,103.8333",13624);
        storageContract.addHistoricalRecord("COVID-19","Slovakia","48.669,19.699",1379);
        storageContract.addHistoricalRecord("COVID-19","Slovenia","46.1512,14.9955",1396);
        storageContract.addHistoricalRecord("COVID-19","Somalia","5.1521,46.1996",436);
        storageContract.addHistoricalRecord("COVID-19","South Africa","-30.5595,22.9375",4546);
        storageContract.addHistoricalRecord("COVID-19","Spain","40,-4",226629);
        storageContract.addHistoricalRecord("COVID-19","Sri Lanka","7,81",523);
        storageContract.addHistoricalRecord("COVID-19","Sudan","12.8628,30.2176",237);
        storageContract.addHistoricalRecord("COVID-19","Suriname","3.9193,-56.0278",10);
        storageContract.addHistoricalRecord("COVID-19","Sweden","63,16",18640);
        storageContract.addHistoricalRecord("COVID-19","Switzerland","46.8182,8.2275",29061);
        storageContract.addHistoricalRecord("COVID-19","Taiwan*","23.7,121",429);
        storageContract.addHistoricalRecord("COVID-19","Tanzania","-6.369,34.8888",299);
        storageContract.addHistoricalRecord("COVID-19","Thailand","15,101",2922);
        storageContract.addHistoricalRecord("COVID-19","Togo","8.6195,0.8248",98);
        storageContract.addHistoricalRecord("COVID-19","Trinidad and Tobago","10.6918,-61.2225",115);
        storageContract.addHistoricalRecord("COVID-19","Tunisia","34,9",949);
        storageContract.addHistoricalRecord("COVID-19","Turkey","38.9637,35.2433",110130);
    }

    function f8() public {
        require(storageContractAddress != address(0), "You have to set the storage contract address first.");

        storageContract.addHistoricalRecord("COVID-19","Uganda","1,32",79);
        storageContract.addHistoricalRecord("COVID-19","Ukraine","48.3794,31.1656",8617);
        storageContract.addHistoricalRecord("COVID-19","United Arab Emirates","24,54",10349);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","32.3078,-64.7505",109);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","19.3133,-81.2546",70);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","49.3723,-2.3644",525);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","36.1408,-5.3536",141);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","54.2361,-4.5481",308);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","16.7425,-62.1874",11);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","55.3781,-3.436",152840);
        storageContract.addHistoricalRecord("COVID-19","Uruguay","-32.5228,-55.7658",606);
        storageContract.addHistoricalRecord("COVID-19","US","37.0902,-95.7129",965785);
        storageContract.addHistoricalRecord("COVID-19","Uzbekistan","41.3775,64.5853",1869);
        storageContract.addHistoricalRecord("COVID-19","Venezuela","6.4238,-66.5897",325);
        storageContract.addHistoricalRecord("COVID-19","Vietnam","16,108",270);
        storageContract.addHistoricalRecord("COVID-19","Zambia","-15.4167,28.2833",88);
        storageContract.addHistoricalRecord("COVID-19","Zimbabwe","-20,30",31);
        storageContract.addHistoricalRecord("COVID-19","Canada","0,0",0);
        storageContract.addHistoricalRecord("COVID-19","Dominica","15.415,-61.371",16);
        storageContract.addHistoricalRecord("COVID-19","Grenada","12.1165,-61.679",18);
        storageContract.addHistoricalRecord("COVID-19","Mozambique","-18.665695,35.529562",76);
        storageContract.addHistoricalRecord("COVID-19","Syria","34.802075,38.996815",43);
        storageContract.addHistoricalRecord("COVID-19","Timor-Leste","-8.874217,125.727539",24);
        storageContract.addHistoricalRecord("COVID-19","Belize","13.1939,-59.5432",18);
        storageContract.addHistoricalRecord("COVID-19","Canada","0,0",0);
        storageContract.addHistoricalRecord("COVID-19","Laos","19.85627,102.495496",19);
        storageContract.addHistoricalRecord("COVID-19","Libya","26.3351,17.228331",61);
        storageContract.addHistoricalRecord("COVID-19","West Bank and Gaza","31.9522,35.2332",342);
        storageContract.addHistoricalRecord("COVID-19","Guinea-Bissau","11.8037,-15.1804",53);
        storageContract.addHistoricalRecord("COVID-19","Mali","17.570692,-3.996166",389);
        storageContract.addHistoricalRecord("COVID-19","Saint Kitts and Nevis","17.357822,-62.782998",15);
    }

    function f9() public {
        require(storageContractAddress != address(0), "You have to set the storage contract address first.");

        storageContract.addHistoricalRecord("COVID-19","Canada","64.8255,-124.8457",5);
        storageContract.addHistoricalRecord("COVID-19","Canada","64.2823,-135",11);
        storageContract.addHistoricalRecord("COVID-19","Kosovo","42.602636,20.902977",510);
        storageContract.addHistoricalRecord("COVID-19","Burma","21.9162,95.956",146);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","18.2206,-63.0686",3);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","18.4207,-64.64",6);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","21.694,-71.7979",11);
        storageContract.addHistoricalRecord("COVID-19","MS Zaandam","0,0",9);
        storageContract.addHistoricalRecord("COVID-19","Botswana","-22.3285,24.6849",22);
        storageContract.addHistoricalRecord("COVID-19","Burundi","-3.3731,29.9189",11);
        storageContract.addHistoricalRecord("COVID-19","Sierra Leone","8.460555,-11.779889",93);
        storageContract.addHistoricalRecord("COVID-19","Netherlands","12.1784,-68.2385",5);
        storageContract.addHistoricalRecord("COVID-19","Malawi","-13.254308,34.301525",34);
        storageContract.addHistoricalRecord("COVID-19","United Kingdom","-51.7963,-59.5236",13);
        storageContract.addHistoricalRecord("COVID-19","France","46.8852,-56.3159",1);
        storageContract.addHistoricalRecord("COVID-19","South Sudan","6.877,31.307",6);
        storageContract.addHistoricalRecord("COVID-19","Western Sahara","24.2155,-12.8858",6);
        storageContract.addHistoricalRecord("COVID-19","Sao Tome and Principe","0.18636,6.613081",4);
        storageContract.addHistoricalRecord("COVID-19","Yemen","15.552727,48.516388",1);
    }
}