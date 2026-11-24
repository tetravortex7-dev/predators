local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["18"] = 2,["19"] = 6,["20"] = 7,["21"] = 9,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 39,["27"] = 40,["28"] = 41,["29"] = 42,["30"] = 43,["31"] = 44,["32"] = 45,["33"] = 47,["34"] = 48,["35"] = 49,["36"] = 50,["37"] = 51,["38"] = 52,["39"] = 53,["40"] = 55,["41"] = 55,["42"] = 55,["43"] = 55,["44"] = 55,["45"] = 55,["46"] = 55,["47"] = 55,["48"] = 64,["49"] = 64,["50"] = 64,["51"] = 74,["52"] = 74,["53"] = 65,["54"] = 66,["55"] = 67,["56"] = 68,["57"] = 69,["58"] = 70,["59"] = 71,["60"] = 72,["61"] = 74,["62"] = 76,["63"] = 77,["64"] = 79,["65"] = 79,["66"] = 79,["67"] = 79,["68"] = 79,["69"] = 80,["70"] = 80,["71"] = 80,["72"] = 80,["73"] = 80,["74"] = 82,["75"] = 82,["76"] = 82,["77"] = 82,["78"] = 82,["79"] = 82,["80"] = 82,["81"] = 83,["82"] = 84,["83"] = 84,["85"] = 82,["86"] = 82,["87"] = 88,["88"] = 88,["89"] = 88,["90"] = 88,["91"] = 88,["92"] = 89,["93"] = 90,["95"] = 88,["96"] = 88,["97"] = 94,["98"] = 94,["99"] = 94,["100"] = 94,["101"] = 94,["102"] = 94,["103"] = 94,["104"] = 95,["105"] = 96,["107"] = 94,["108"] = 94,["109"] = 76,["110"] = 101,["111"] = 102,["112"] = 103,["113"] = 104,["115"] = 101,["116"] = 108,["117"] = 109,["118"] = 110,["120"] = 111,["121"] = 112,["122"] = 112,["124"] = 113,["125"] = 114,["130"] = 117,["131"] = 108,["132"] = 120,["133"] = 121,["134"] = 122,["135"] = 122,["137"] = 123,["138"] = 124,["139"] = 124,["141"] = 126,["142"] = 127,["143"] = 128,["144"] = 130,["145"] = 131,["146"] = 131,["147"] = 131,["148"] = 131,["149"] = 131,["150"] = 131,["151"] = 131,["152"] = 132,["153"] = 133,["155"] = 135,["156"] = 135,["157"] = 136,["158"] = 137,["159"] = 138,["161"] = 135,["165"] = 141,["166"] = 141,["167"] = 142,["168"] = 143,["169"] = 144,["171"] = 141,["174"] = 148,["175"] = 149,["176"] = 150,["177"] = 151,["178"] = 152,["179"] = 120,["180"] = 155,["181"] = 156,["182"] = 157,["185"] = 158,["186"] = 159,["189"] = 161,["190"] = 162,["191"] = 164,["192"] = 165,["193"] = 170,["195"] = 155,["196"] = 174,["197"] = 175,["198"] = 178,["199"] = 178,["200"] = 178,["202"] = 180,["203"] = 180,["205"] = 181,["206"] = 182,["207"] = 183,["208"] = 183,["210"] = 185,["211"] = 186,["212"] = 187,["213"] = 188,["214"] = 190,["215"] = 190,["216"] = 190,["217"] = 190,["218"] = 190,["219"] = 190,["220"] = 190,["221"] = 190,["222"] = 190,["223"] = 190,["224"] = 190,["225"] = 190,["226"] = 190,["227"] = 190,["228"] = 204,["230"] = 207,["231"] = 208,["235"] = 180,["238"] = 212,["239"] = 213,["240"] = 214,["241"] = 214,["242"] = 214,["243"] = 214,["244"] = 214,["246"] = 174,["247"] = 222,["248"] = 223,["249"] = 224,["250"] = 225,["251"] = 225,["254"] = 229,["255"] = 230,["256"] = 231,["257"] = 231,["260"] = 235,["262"] = 236,["263"] = 236,["265"] = 237,["266"] = 238,["267"] = 239,["268"] = 240,["269"] = 241,["270"] = 241,["271"] = 241,["272"] = 241,["273"] = 241,["278"] = 248,["279"] = 249,["280"] = 249,["281"] = 250,["282"] = 250,["283"] = 250,["284"] = 249,["285"] = 251,["286"] = 251,["287"] = 251,["288"] = 249,["289"] = 252,["290"] = 252,["291"] = 252,["292"] = 249,["293"] = 253,["294"] = 253,["295"] = 253,["296"] = 249,["297"] = 249,["299"] = 257,["300"] = 258,["301"] = 259,["302"] = 260,["303"] = 260,["307"] = 264,["308"] = 265,["309"] = 265,["310"] = 265,["311"] = 265,["312"] = 265,["314"] = 222,["315"] = 269,["316"] = 270,["317"] = 270,["318"] = 270,["319"] = 270,["320"] = 271,["321"] = 272,["322"] = 273,["324"] = 276,["325"] = 277,["326"] = 277,["327"] = 276,["328"] = 279,["329"] = 281,["330"] = 281,["331"] = 281,["332"] = 282,["333"] = 282,["334"] = 282,["335"] = 282,["336"] = 282,["337"] = 282,["338"] = 282,["339"] = 282,["340"] = 282,["341"] = 282,["342"] = 282,["343"] = 293,["344"] = 281,["345"] = 281,["346"] = 296,["347"] = 297,["348"] = 298,["349"] = 299,["350"] = 269,["351"] = 302,["352"] = 303,["353"] = 304,["354"] = 307,["355"] = 312,["356"] = 313,["357"] = 314,["358"] = 315,["361"] = 319,["362"] = 319,["363"] = 319,["364"] = 319,["365"] = 319,["366"] = 319,["367"] = 319,["368"] = 326,["369"] = 327,["372"] = 328,["373"] = 319,["374"] = 319,["375"] = 302,["376"] = 333,["377"] = 334,["378"] = 335,["379"] = 335,["381"] = 336,["382"] = 337,["383"] = 337,["385"] = 338,["386"] = 339,["387"] = 339,["388"] = 339,["389"] = 339,["390"] = 340,["391"] = 333,["392"] = 343,["393"] = 344,["394"] = 345,["395"] = 345,["396"] = 345,["397"] = 345,["398"] = 346,["399"] = 343,["400"] = 349,["401"] = 350,["402"] = 350,["404"] = 351,["405"] = 352,["406"] = 349,["407"] = 355,["408"] = 361,["409"] = 362,["410"] = 363,["411"] = 364,["412"] = 365,["413"] = 366,["414"] = 367,["415"] = 368,["416"] = 369,["417"] = 370,["418"] = 370,["419"] = 370,["420"] = 370,["421"] = 371,["422"] = 371,["423"] = 371,["424"] = 371,["425"] = 373,["426"] = 374,["427"] = 375,["428"] = 375,["429"] = 375,["430"] = 375,["432"] = 380,["434"] = 383,["435"] = 384,["436"] = 385,["438"] = 387,["439"] = 388,["440"] = 389,["441"] = 390,["442"] = 391,["444"] = 393,["446"] = 396,["447"] = 397,["449"] = 400,["450"] = 401,["452"] = 404,["453"] = 409,["454"] = 417,["455"] = 418,["456"] = 418,["457"] = 418,["458"] = 418,["459"] = 418,["461"] = 355,["462"] = 426,["463"] = 426,["464"] = 426,["466"] = 427,["467"] = 428,["468"] = 429,["471"] = 432,["472"] = 426,["473"] = 435,["474"] = 436,["475"] = 436,["476"] = 436,["477"] = 436,["478"] = 436,["479"] = 436,["480"] = 436,["481"] = 436,["482"] = 444,["483"] = 445,["484"] = 445,["485"] = 445,["486"] = 445,["487"] = 445,["488"] = 445,["489"] = 445,["491"] = 435,["492"] = 449,["493"] = 450,["494"] = 451,["496"] = 453,["497"] = 453,["498"] = 453,["499"] = 453,["500"] = 449,["501"] = 456,["502"] = 457,["503"] = 459,["504"] = 460,["506"] = 461,["507"] = 462,["508"] = 463,["509"] = 464,["511"] = 466,["512"] = 467,["514"] = 470,["515"] = 476,["516"] = 477,["518"] = 480,["519"] = 481,["520"] = 482,["524"] = 485,["525"] = 456,["526"] = 488,["527"] = 489,["528"] = 490,["531"] = 492,["532"] = 493,["533"] = 495,["534"] = 496,["535"] = 497,["536"] = 498,["539"] = 502,["540"] = 503,["541"] = 504,["542"] = 505,["543"] = 506,["546"] = 508,["547"] = 509,["548"] = 510,["549"] = 511,["550"] = 512,["552"] = 514,["553"] = 515,["556"] = 519,["557"] = 520,["559"] = 523,["560"] = 524,["561"] = 525,["564"] = 528,["566"] = 531,["567"] = 532,["568"] = 533,["571"] = 535,["572"] = 536,["573"] = 537,["574"] = 538,["575"] = 539,["576"] = 539,["577"] = 539,["578"] = 539,["579"] = 539,["582"] = 488,["583"] = 548,["584"] = 549,["585"] = 550,["586"] = 551,["587"] = 552,["588"] = 553,["589"] = 554,["590"] = 555,["593"] = 557,["594"] = 558,["595"] = 559,["598"] = 548,["599"] = 564,["600"] = 569,["602"] = 571,["603"] = 571,["605"] = 572,["606"] = 573,["607"] = 573,["609"] = 574,["610"] = 575,["614"] = 571,["617"] = 579,["618"] = 580,["619"] = 581,["620"] = 582,["623"] = 586,["624"] = 587,["625"] = 588,["626"] = 589,["630"] = 593,["631"] = 593,["633"] = 594,["634"] = 595,["635"] = 595,["637"] = 596,["638"] = 597,["639"] = 597,["641"] = 598,["644"] = 593,["648"] = 601,["649"] = 601,["651"] = 602,["652"] = 603,["653"] = 603,["655"] = 604,["656"] = 604,["657"] = 604,["658"] = 604,["659"] = 605,["663"] = 601,["666"] = 609,["667"] = 564,["668"] = 612,["669"] = 617,["670"] = 617,["672"] = 618,["673"] = 619,["674"] = 619,["676"] = 620,["677"] = 620,["679"] = 621,["680"] = 621,["682"] = 622,["683"] = 622,["685"] = 623,["686"] = 624,["687"] = 625,["689"] = 627,["690"] = 612,["691"] = 630,["692"] = 631,["695"] = 632,["696"] = 633,["697"] = 635,["698"] = 636,["699"] = 637,["701"] = 640,["702"] = 645,["703"] = 653,["704"] = 654,["706"] = 630,["707"] = 662,["708"] = 663,["711"] = 665,["712"] = 666,["715"] = 670,["716"] = 671,["717"] = 672,["718"] = 674,["719"] = 676,["720"] = 677,["721"] = 678,["722"] = 679,["723"] = 680,["724"] = 681,["725"] = 681,["726"] = 681,["727"] = 681,["728"] = 681,["729"] = 681,["733"] = 691,["734"] = 692,["735"] = 693,["736"] = 694,["737"] = 695,["738"] = 696,["739"] = 697,["740"] = 698,["741"] = 699,["744"] = 703,["745"] = 704,["746"] = 704,["747"] = 704,["748"] = 704,["749"] = 704,["750"] = 704,["751"] = 704,["752"] = 704,["753"] = 704,["754"] = 704,["755"] = 704,["756"] = 704,["757"] = 704,["758"] = 704,["759"] = 723,["760"] = 724,["761"] = 725,["762"] = 726,["763"] = 726,["764"] = 726,["765"] = 726,["766"] = 727,["767"] = 728,["772"] = 734,["773"] = 735,["774"] = 736,["776"] = 739,["777"] = 740,["778"] = 741,["779"] = 742,["780"] = 743,["781"] = 743,["782"] = 743,["783"] = 743,["784"] = 743,["785"] = 743,["789"] = 753,["790"] = 754,["791"] = 755,["792"] = 756,["793"] = 757,["794"] = 759,["795"] = 760,["796"] = 762,["797"] = 762,["798"] = 762,["799"] = 762,["800"] = 762,["801"] = 762,["802"] = 762,["803"] = 770,["807"] = 775,["808"] = 776,["810"] = 779,["811"] = 780,["812"] = 781,["813"] = 782,["814"] = 782,["815"] = 782,["816"] = 782,["817"] = 782,["818"] = 782,["821"] = 790,["822"] = 791,["823"] = 792,["824"] = 793,["825"] = 793,["826"] = 793,["827"] = 793,["828"] = 793,["829"] = 793,["833"] = 803,["834"] = 804,["835"] = 805,["836"] = 805,["837"] = 805,["838"] = 805,["839"] = 806,["840"] = 807,["843"] = 810,["844"] = 811,["845"] = 812,["846"] = 812,["847"] = 812,["848"] = 812,["849"] = 812,["850"] = 812,["854"] = 822,["855"] = 822,["856"] = 822,["857"] = 822,["858"] = 822,["859"] = 822,["860"] = 822,["861"] = 822,["862"] = 822,["863"] = 822,["864"] = 822,["865"] = 822,["866"] = 822,["867"] = 822,["868"] = 834,["869"] = 835,["870"] = 836,["871"] = 837,["872"] = 838,["873"] = 839,["874"] = 840,["878"] = 845,["879"] = 846,["880"] = 847,["881"] = 847,["882"] = 847,["883"] = 847,["884"] = 847,["885"] = 847,["889"] = 857,["890"] = 858,["891"] = 859,["893"] = 862,["894"] = 863,["895"] = 864,["896"] = 865,["897"] = 865,["898"] = 865,["899"] = 865,["900"] = 865,["901"] = 865,["903"] = 662,["904"] = 874,["905"] = 879,["906"] = 879,["908"] = 881,["909"] = 882,["910"] = 883,["911"] = 884,["912"] = 884,["913"] = 884,["914"] = 884,["915"] = 885,["916"] = 886,["917"] = 887,["918"] = 888,["919"] = 889,["920"] = 890,["923"] = 893,["924"] = 874,["925"] = 896,["926"] = 897,["927"] = 897,["929"] = 899,["930"] = 900,["931"] = 901,["932"] = 902,["933"] = 902,["934"] = 902,["935"] = 902,["936"] = 903,["937"] = 904,["938"] = 905,["939"] = 906,["940"] = 907,["943"] = 910,["944"] = 896,["945"] = 913,["946"] = 914,["947"] = 915,["948"] = 916,["949"] = 916,["950"] = 916,["951"] = 916,["952"] = 916,["953"] = 916,["955"] = 913,["956"] = 925,["957"] = 926,["958"] = 928,["959"] = 929,["960"] = 930,["961"] = 931,["962"] = 931,["963"] = 931,["964"] = 931,["965"] = 931,["966"] = 931,["967"] = 937,["970"] = 941,["971"] = 942,["972"] = 943,["973"] = 944,["974"] = 944,["975"] = 944,["976"] = 944,["977"] = 944,["978"] = 944,["979"] = 950,["982"] = 954,["983"] = 955,["984"] = 956,["985"] = 957,["986"] = 957,["987"] = 957,["988"] = 957,["989"] = 957,["990"] = 957,["991"] = 963,["994"] = 967,["995"] = 925,["996"] = 970,["997"] = 977,["998"] = 977,["999"] = 977,["1000"] = 977,["1001"] = 979,["1002"] = 980,["1003"] = 981,["1004"] = 981,["1005"] = 981,["1006"] = 981,["1007"] = 981,["1008"] = 981,["1009"] = 981,["1010"] = 988,["1012"] = 991,["1013"] = 992,["1015"] = 995,["1016"] = 995,["1017"] = 995,["1018"] = 995,["1019"] = 995,["1020"] = 995,["1021"] = 995,["1022"] = 970,["1023"] = 998,["1024"] = 1005,["1025"] = 1006,["1026"] = 1006,["1027"] = 1006,["1028"] = 1006,["1029"] = 1007,["1031"] = 1009,["1032"] = 1009,["1034"] = 1010,["1035"] = 1011,["1036"] = 1011,["1038"] = 1013,["1039"] = 1014,["1040"] = 1015,["1041"] = 1018,["1042"] = 1019,["1043"] = 1024,["1044"] = 1024,["1047"] = 1027,["1048"] = 1027,["1049"] = 1027,["1050"] = 1027,["1051"] = 1027,["1052"] = 1027,["1053"] = 1027,["1054"] = 1028,["1058"] = 1009,["1061"] = 1032,["1062"] = 998,["1063"] = 1035,["1064"] = 1041,["1065"] = 1042,["1066"] = 1042,["1067"] = 1042,["1068"] = 1042,["1069"] = 1043,["1070"] = 1043,["1071"] = 1043,["1072"] = 1043,["1073"] = 1044,["1074"] = 1045,["1075"] = 1047,["1077"] = 1048,["1078"] = 1048,["1080"] = 1050,["1081"] = 1051,["1082"] = 1051,["1084"] = 1053,["1085"] = 1054,["1086"] = 1055,["1087"] = 1057,["1088"] = 1057,["1090"] = 1058,["1091"] = 1058,["1093"] = 1060,["1094"] = 1060,["1095"] = 1061,["1096"] = 1061,["1097"] = 1061,["1098"] = 1060,["1099"] = 1060,["1100"] = 1063,["1101"] = 1064,["1102"] = 1064,["1104"] = 1066,["1105"] = 1067,["1106"] = 1068,["1107"] = 1069,["1108"] = 1070,["1109"] = 1071,["1110"] = 1072,["1113"] = 1075,["1114"] = 1076,["1115"] = 1076,["1117"] = 1078,["1118"] = 1078,["1119"] = 1078,["1120"] = 1078,["1121"] = 1078,["1122"] = 1078,["1123"] = 1078,["1124"] = 1079,["1129"] = 1083,["1130"] = 1035,["1131"] = 1086,["1133"] = 1087,["1134"] = 1087,["1136"] = 1088,["1137"] = 1089,["1138"] = 1089,["1140"] = 1090,["1141"] = 1090,["1143"] = 1091,["1144"] = 1092,["1148"] = 1087,["1151"] = 1095,["1152"] = 1086,["1153"] = 1098,["1154"] = 1099,["1155"] = 1099,["1157"] = 1100,["1158"] = 1101,["1159"] = 1101,["1161"] = 1102,["1162"] = 1103,["1164"] = 1105,["1165"] = 1098,["1166"] = 1108,["1167"] = 1109,["1168"] = 1110,["1169"] = 1111,["1172"] = 1114,["1173"] = 1108,["1174"] = 1117,["1175"] = 1124,["1176"] = 1125,["1177"] = 1127,["1178"] = 1128,["1179"] = 1129,["1180"] = 1130,["1181"] = 1130,["1183"] = 1131,["1184"] = 1131,["1185"] = 1131,["1186"] = 1131,["1187"] = 1131,["1188"] = 1131,["1189"] = 1137,["1191"] = 1140,["1192"] = 1141,["1193"] = 1141,["1194"] = 1141,["1195"] = 1141,["1196"] = 1142,["1197"] = 1142,["1199"] = 1143,["1200"] = 1143,["1201"] = 1143,["1202"] = 1143,["1203"] = 1143,["1204"] = 1143,["1205"] = 1143,["1206"] = 1150,["1208"] = 1153,["1209"] = 1154,["1210"] = 1154,["1211"] = 1154,["1212"] = 1154,["1213"] = 1155,["1214"] = 1155,["1216"] = 1156,["1217"] = 1156,["1218"] = 1156,["1219"] = 1156,["1220"] = 1156,["1221"] = 1156,["1222"] = 1156,["1223"] = 1163,["1225"] = 1166,["1226"] = 1117,["1227"] = 1169,["1228"] = 1170,["1229"] = 1171,["1230"] = 1173,["1231"] = 1174,["1232"] = 1175,["1233"] = 1176,["1234"] = 1177,["1235"] = 1178,["1236"] = 1179,["1237"] = 1180,["1239"] = 1182,["1240"] = 1182,["1241"] = 1182,["1242"] = 1182,["1243"] = 1183,["1244"] = 1183,["1245"] = 1183,["1246"] = 1183,["1247"] = 1184,["1252"] = 1190,["1253"] = 1191,["1256"] = 1192,["1257"] = 1194,["1258"] = 1195,["1261"] = 1197,["1262"] = 1198,["1263"] = 1203,["1264"] = 1205,["1265"] = 1206,["1266"] = 1207,["1267"] = 1208,["1268"] = 1209,["1269"] = 1210,["1270"] = 1211,["1271"] = 1212,["1272"] = 1213,["1276"] = 1218,["1277"] = 1219,["1279"] = 1221,["1280"] = 1222,["1281"] = 1223,["1282"] = 1224,["1283"] = 1226,["1284"] = 1226,["1285"] = 1226,["1286"] = 1226,["1287"] = 1226,["1288"] = 1226,["1289"] = 1226,["1290"] = 1233,["1291"] = 1241,["1292"] = 1242,["1294"] = 1169,["1295"] = 1250,["1296"] = 1251,["1297"] = 1252,["1300"] = 1254,["1301"] = 1255,["1302"] = 1256,["1303"] = 1256,["1304"] = 1256,["1305"] = 1256,["1306"] = 1256,["1307"] = 1261,["1308"] = 1261,["1309"] = 1261,["1310"] = 1261,["1311"] = 1261,["1312"] = 1261,["1313"] = 1261,["1314"] = 1250,["1315"] = 1264,["1316"] = 1265,["1317"] = 1265,["1318"] = 1265,["1319"] = 1265,["1320"] = 1265,["1321"] = 1265,["1322"] = 1265,["1324"] = 1266,["1325"] = 1266,["1327"] = 1267,["1328"] = 1268,["1329"] = 1268,["1331"] = 1269,["1332"] = 1269,["1333"] = 1269,["1334"] = 1269,["1335"] = 1270,["1336"] = 1271,["1340"] = 1266,["1343"] = 1264,["1344"] = 1276,["1346"] = 1277,["1347"] = 1277,["1348"] = 1278,["1349"] = 1279,["1350"] = 1280,["1352"] = 1277,["1355"] = 1276,["1356"] = 1285,["1357"] = 1291,["1360"] = 1293,["1363"] = 1300,["1364"] = 1305,["1365"] = 1306,["1366"] = 1306,["1367"] = 1306,["1368"] = 1306,["1369"] = 1306,["1370"] = 1306,["1371"] = 1306,["1374"] = 1316,["1377"] = 1317,["1380"] = 1319,["1381"] = 1320,["1382"] = 1321,["1383"] = 1322,["1384"] = 1324,["1385"] = 1325,["1386"] = 1326,["1387"] = 1327,["1388"] = 1328,["1389"] = 1329,["1391"] = 1332,["1394"] = 1334,["1395"] = 1335,["1396"] = 1336,["1397"] = 1337,["1398"] = 1338,["1399"] = 1338,["1400"] = 1338,["1401"] = 1338,["1402"] = 1338,["1403"] = 1338,["1404"] = 1338,["1406"] = 1285,["1407"] = 1348,["1409"] = 1349,["1410"] = 1349,["1411"] = 1350,["1412"] = 1351,["1413"] = 1351,["1415"] = 1349,["1418"] = 1353,["1419"] = 1348,["1420"] = 1356,["1421"] = 1357,["1422"] = 1358,["1423"] = 1358,["1424"] = 1358,["1425"] = 1358,["1426"] = 1359,["1427"] = 1361,["1428"] = 1362,["1430"] = 1365,["1432"] = 1366,["1433"] = 1366,["1434"] = 1367,["1435"] = 1368,["1436"] = 1369,["1437"] = 1370,["1440"] = 1366,["1443"] = 1374,["1444"] = 1356,["1445"] = 1377,["1446"] = 1378,["1447"] = 1379,["1448"] = 1380,["1449"] = 1381,["1450"] = 1382,["1451"] = 1383,["1452"] = 1384,["1455"] = 1387,["1456"] = 1377,["1457"] = 1390,["1458"] = 1391,["1459"] = 1392,["1461"] = 1394,["1462"] = 1395,["1464"] = 1397,["1465"] = 1397,["1466"] = 1397,["1467"] = 1397,["1468"] = 1397,["1469"] = 1397,["1470"] = 1397,["1471"] = 1390,["1472"] = 1400,["1473"] = 1406,["1476"] = 1409,["1477"] = 1410,["1478"] = 1412,["1481"] = 1421,["1484"] = 1424,["1485"] = 1425,["1486"] = 1426,["1487"] = 1426,["1488"] = 1426,["1489"] = 1426,["1490"] = 1426,["1491"] = 1426,["1492"] = 1400,["1493"] = 1434,["1494"] = 1435,["1495"] = 1436,["1496"] = 1437,["1497"] = 1438,["1499"] = 1439,["1500"] = 1439,["1502"] = 1440,["1503"] = 1440,["1504"] = 1440,["1505"] = 1440,["1506"] = 1441,["1507"] = 1442,["1508"] = 1443,["1513"] = 1446,["1514"] = 1434,["1515"] = 1449,["1516"] = 1454,["1519"] = 1455,["1520"] = 1456,["1521"] = 1458,["1522"] = 1459,["1523"] = 1460,["1524"] = 1461,["1525"] = 1462,["1526"] = 1463,["1527"] = 1464,["1528"] = 1465,["1529"] = 1466,["1530"] = 1467,["1531"] = 1468,["1532"] = 1469,["1533"] = 1470,["1534"] = 1471,["1536"] = 1473,["1538"] = 1476,["1539"] = 1477,["1540"] = 1449,["1541"] = 1480,["1542"] = 1481,["1543"] = 1482,["1544"] = 1483,["1545"] = 1480,["1546"] = 1486,["1547"] = 1487,["1548"] = 1488,["1549"] = 1489,["1550"] = 1490,["1554"] = 1494,["1555"] = 1495,["1556"] = 1495,["1557"] = 1495,["1558"] = 1495,["1559"] = 1495,["1560"] = 1495,["1561"] = 1495,["1562"] = 1496,["1563"] = 1497,["1564"] = 1498,["1565"] = 1499,["1569"] = 1503,["1570"] = 1486});
local ____exports = {}
local ____bosses_catalog = require("data.bosses_catalog")
local EVO_BOSSES_CATALOG = ____bosses_catalog.EVO_BOSSES_CATALOG
local getBossDefinition = ____bosses_catalog.getBossDefinition
local ____game_constants = require("data.game_constants")
local EVO_CONSTANTS = ____game_constants.EVO_CONSTANTS
local EVO_MAP_ENTITIES = ____game_constants.EVO_MAP_ENTITIES
local ____HeroAppearance = require("lib.HeroAppearance")
local HeroAppearance = ____HeroAppearance.HeroAppearance
local BOSS_TEAM = 10
local BOSS_AI_TICK_SECONDS = 0.5
local BOSS_PASSIVE_XP_PER_SEC = 10
local BOSS_PASSIVE_GOLD_PER_SEC = 12
local BOSS_CREEP_XP_MULTIPLIER = 1.25
local BOSS_HERO_KILL_XP = 600
local BOSS_HERO_KILL_GOLD = 350
local DEFAULT_FARM_MANA_RESERVE = 0.45
local RETREAT_HP_THRESHOLD = 0.35
local RECOVER_HP_THRESHOLD = 0.7
local HEAL_POTION_HP_THRESHOLD = 0.65
local HEAL_POTION_COST = 100
local COMBINED_POTION_COST = 350
local HEAL_POTION_BUY_COOLDOWN = 16
local IGNORED_BOSS_ABILITIES = __TS__New(Set, {
    "generic_hidden",
    "ability_capture",
    "ability_lamp_use",
    "twin_gate_portal_warp",
    "abyssal_underlord_portal_warp",
    "ability_pluck_famango"
})
____exports.BossManager = __TS__Class()
local BossManager = ____exports.BossManager
BossManager.name = "BossManager"
function BossManager.prototype.____constructor(self, eventBus)
    self.eventBus = eventBus
    self.bosses = __TS__New(Map)
    self.entIndexToBossId = __TS__New(Map)
    self.patrolWaypoints = {}
    self.bossSpawnPoints = {}
    self.fountainPositions = {}
    self.activeBossIds = {}
    self.thinkerStarted = false
    self.devSpawned = false
end
function BossManager.prototype.init(self)
    self:discoverWaypoints()
    ListenToGameEvent(
        "game_rules_state_change",
        function() return self:onGameStateChange() end,
        nil
    )
    ListenToGameEvent(
        "entity_killed",
        function(event) return self:onEntityKilled(event) end,
        nil
    )
    self.eventBus:on(
        "boss_event",
        function(____, ____bindingPattern0)
            local event
            local bossId
            bossId = ____bindingPattern0.bossId
            event = ____bindingPattern0.event
            if event == "announced" and not __TS__ArrayIncludes(self.activeBossIds, bossId) then
                local ____self_activeBossIds_0 = self.activeBossIds
                ____self_activeBossIds_0[#____self_activeBossIds_0 + 1] = bossId
            end
        end
    )
    self.eventBus:on(
        "phase_changed",
        function(____, ____bindingPattern0)
            local newPhase
            newPhase = ____bindingPattern0.newPhase
            if newPhase == "SURFACE" then
                self:spawnMatchBosses()
            end
        end
    )
    self.eventBus:on(
        "dev_command",
        function(____, ____bindingPattern0)
            local args
            local command
            command = ____bindingPattern0.command
            args = ____bindingPattern0.args
            if command == "-evo_boss" then
                self:onDevBossCommand(args)
            end
        end
    )
end
function BossManager.prototype.onGameStateChange(self)
    if GameRules:State_Get() == 10 and IsInToolsMode() and not self.devSpawned then
        self.devSpawned = true
        self:spawnMatchBosses()
    end
end
function BossManager.prototype.getStrongestAliveBoss(self)
    local best
    for ____, runtime in __TS__Iterator(self.bosses:values()) do
        do
            local unit = runtime.unit
            if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsAlive() then
                goto __continue15
            end
            if not best or runtime.level > best.level then
                best = {bossId = runtime.definition.id, unit = unit, level = runtime.level}
            end
        end
        ::__continue15::
    end
    return best
end
function BossManager.prototype.prepareBossForArena(self, bossId, spawnPos, lookTarget)
    local runtime = self.bosses:get(bossId)
    if not runtime then
        return nil
    end
    local unit = runtime.unit
    if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsAlive() then
        return nil
    end
    local returnPos = unit:GetAbsOrigin()
    runtime.retreating = false
    runtime.retreatPosition = nil
    unit:RemoveModifierByName("modifier_evo_world_pause")
    unit:Purge(
        false,
        true,
        false,
        true,
        true
    )
    unit:SetHealth(unit:GetMaxHealth())
    unit:SetMana(unit:GetMaxMana())
    do
        local i = 0
        while i < unit:GetAbilityCount() do
            local ability = unit:GetAbilityByIndex(i)
            if ability and not ability:IsNull() then
                ability:EndCooldown()
            end
            i = i + 1
        end
    end
    do
        local slot = 0
        while slot < 9 do
            local item = unit:GetItemInSlot(slot)
            if item and not item:IsNull() then
                item:EndCooldown()
            end
            slot = slot + 1
        end
    end
    FindClearSpaceForUnit(unit, spawnPos, true)
    unit:Stop()
    local dir = Vector(lookTarget.x - spawnPos.x, lookTarget.y - spawnPos.y, 0):Normalized()
    unit:SetForwardVector(dir)
    return returnPos
end
function BossManager.prototype.returnBossFromArena(self, bossId, returnPos, bossWon)
    local runtime = self.bosses:get(bossId)
    if not runtime then
        return
    end
    local unit = runtime.unit
    if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsAlive() then
        return
    end
    FindClearSpaceForUnit(unit, returnPos, true)
    unit:Stop()
    if bossWon then
        self:grantBossProgress(runtime, EVO_CONSTANTS.BOSS_DUEL_DEFEAT_BONUS_XP, EVO_CONSTANTS.BOSS_DUEL_DEFEAT_BONUS_GOLD)
        self:triggerCourage(runtime)
    end
end
function BossManager.prototype.spawnMatchBosses(self)
    local idsToSpawn = #self.activeBossIds > 0 and self.activeBossIds or __TS__ArrayMap(
        __TS__ArraySlice(EVO_BOSSES_CATALOG, 0, EVO_CONSTANTS.BOSS_COUNT_PER_MATCH),
        function(____, b) return b.id end
    )
    do
        local i = 0
        while i < #idsToSpawn do
            do
                local bossId = idsToSpawn[i + 1]
                local def = getBossDefinition(nil, bossId)
                if not def then
                    goto __continue32
                end
                local runtime = self.bosses:get(bossId)
                if not runtime then
                    local builds = def.itemBuilds
                    local chosenBuild = #builds > 0 and builds[RandomInt(0, #builds - 1) + 1] or ({})
                    runtime = {
                        definition = def,
                        level = 1,
                        xp = 0,
                        gold = 0,
                        itemBuild = chosenBuild,
                        nextItemIndex = 0,
                        lastHealBuyTime = -999,
                        spawnTime = GameRules:GetDOTATime(false, false),
                        inCourage = false,
                        retreating = false,
                        lastMoveOrderTime = -999,
                        lastAttackOrderTime = -999
                    }
                    self.bosses:set(bossId, runtime)
                end
                if not runtime.unit or runtime.unit:IsNull() or not IsValidEntity(runtime.unit) or not runtime.unit:IsAlive() then
                    self:spawnBossUnit(runtime, i)
                end
            end
            ::__continue32::
            i = i + 1
        end
    end
    if not self.thinkerStarted then
        self.thinkerStarted = true
        GameRules:GetGameModeEntity():SetContextThink(
            "EvoBossManagerThink",
            function() return self:onThink() end,
            BOSS_AI_TICK_SECONDS
        )
    end
end
function BossManager.prototype.discoverWaypoints(self)
    for ____, fountain in ipairs(Entities:FindAllByClassname("ent_dota_fountain")) do
        if fountain and not fountain:IsNull() and IsValidEntity(fountain) then
            local ____self_fountainPositions_1 = self.fountainPositions
            ____self_fountainPositions_1[#____self_fountainPositions_1 + 1] = fountain:GetAbsOrigin()
        end
    end
    for ____, ent in ipairs(Entities:FindAllByName(EVO_MAP_ENTITIES.BOSS_SPAWN_PREFIX .. "*")) do
        if ent and not ent:IsNull() and IsValidEntity(ent) then
            local ____self_bossSpawnPoints_2 = self.bossSpawnPoints
            ____self_bossSpawnPoints_2[#____self_bossSpawnPoints_2 + 1] = ent:GetAbsOrigin()
        end
    end
    for ____, trigger in ipairs(Entities:FindAllByClassname("trigger_multiple")) do
        do
            if not trigger or trigger:IsNull() or not IsValidEntity(trigger) then
                goto __continue45
            end
            local name = trigger:GetName()
            if __TS__StringStartsWith(name, "neutralcamp_") then
                local parts = __TS__StringSplit(name, "_")
                local campSize = parts[2] or "small"
                local ____self_patrolWaypoints_3 = self.patrolWaypoints
                ____self_patrolWaypoints_3[#____self_patrolWaypoints_3 + 1] = {
                    position = trigger:GetAbsOrigin(),
                    campSize = campSize
                }
            end
        end
        ::__continue45::
    end
    if #self.patrolWaypoints == 0 then
        __TS__ArrayPush(
            self.patrolWaypoints,
            {
                position = Vector(-2500, 2500, 128),
                campSize = "small"
            },
            {
                position = Vector(2500, 2500, 128),
                campSize = "small"
            },
            {
                position = Vector(-2500, -2500, 128),
                campSize = "medium"
            },
            {
                position = Vector(2500, -2500, 128),
                campSize = "medium"
            }
        )
    end
    if #self.bossSpawnPoints < 4 then
        for ____, wp in ipairs(self.patrolWaypoints) do
            if not self:isNearAnyFountain(wp.position, 1600) then
                local ____self_bossSpawnPoints_4 = self.bossSpawnPoints
                ____self_bossSpawnPoints_4[#____self_bossSpawnPoints_4 + 1] = wp.position
            end
        end
    end
    if #self.bossSpawnPoints == 0 then
        __TS__ArrayPush(
            self.bossSpawnPoints,
            Vector(-1800, 1800, 128),
            Vector(1800, -1800, 128)
        )
    end
end
function BossManager.prototype.pickRandomBossSpawnOrigin(self, runtime)
    local safePool = __TS__ArrayFilter(
        self.bossSpawnPoints,
        function(____, pos) return not self:isNearAnyFountain(pos, 1600) end
    )
    local basePool = #safePool > 0 and safePool or self.bossSpawnPoints
    if #basePool == 0 then
        return Vector(0, 0, 128)
    end
    local nonRepeat = runtime.lastSpawnPosition and __TS__ArrayFilter(
        basePool,
        function(____, pos) return self:distance2D(pos, runtime.lastSpawnPosition) > 400 end
    ) or basePool
    local candidates = #nonRepeat > 0 and nonRepeat or basePool
    local awayFromHeroes = __TS__ArrayFilter(
        candidates,
        function(____, pos)
            local nearby = FindUnitsInRadius(
                BOSS_TEAM,
                pos,
                nil,
                1100,
                2,
                1,
                0,
                0,
                false
            )
            return #nearby == 0
        end
    )
    local finalPool = #awayFromHeroes > 0 and awayFromHeroes or candidates
    local chosen = finalPool[RandomInt(0, #finalPool - 1) + 1]
    runtime.lastSpawnPosition = chosen
    return chosen
end
function BossManager.prototype.spawnBossUnit(self, runtime, _slotIndex)
    local spawnOrigin = self:pickRandomBossSpawnOrigin(runtime)
    local now = GameRules:GetDOTATime(false, false)
    if runtime.unit and not runtime.unit:IsNull() and IsValidEntity(runtime.unit) and runtime.unit:IsHero() then
        local existingHero = runtime.unit
        existingHero:RespawnHero(false, false)
        FindClearSpaceForUnit(existingHero, spawnOrigin, true)
        self:finalizeSpawnedBoss(runtime, existingHero, now, false)
        return
    end
    CreateUnitByNameAsync(
        runtime.definition.unitName,
        spawnOrigin,
        true,
        nil,
        nil,
        BOSS_TEAM,
        function(unit)
            if not unit or unit:IsNull() or not IsValidEntity(unit) then
                return
            end
            self:finalizeSpawnedBoss(runtime, unit, now, true)
        end
    )
end
function BossManager.prototype.setBossWearables(self, bossId, preset)
    local runtime = self.bosses:get(bossId)
    if not runtime then
        return false
    end
    local unit = runtime.unit
    if not unit or unit:IsNull() or not IsValidEntity(unit) then
        return false
    end
    local scale = self:computeBossScale(runtime.definition, runtime.level)
    HeroAppearance:applyPreset(
        unit,
        __TS__ObjectAssign({}, preset, {scale = scale})
    )
    return true
end
function BossManager.prototype.computeBossScale(self, def, level)
    local denom = math.max(1, EVO_CONSTANTS.BOSS_MAX_LEVEL - 1)
    local t = math.min(
        1,
        math.max(0, (level - 1) / denom)
    )
    return def.modelScaleMin + (def.modelScaleMax - def.modelScaleMin) * t
end
function BossManager.prototype.getBossRequiredXp(self, level)
    if level <= 1 then
        return 0
    end
    local n = level - 1
    return math.floor(n * 280 + n * n * 4.5)
end
function BossManager.prototype.finalizeSpawnedBoss(self, runtime, unit, now, isFreshSpawn)
    runtime.unit = unit
    runtime.entIndex = unit:entindex()
    runtime.spawnTime = now
    runtime.respawnAtTime = nil
    runtime.retreating = false
    runtime.retreatPosition = nil
    runtime.lastMoveOrderTime = -999
    runtime.lastAttackTargetIndex = nil
    runtime.lastAttackOrderTime = -999
    runtime.targetWaypoint = self:pickSmartWaypoint(
        unit:GetAbsOrigin(),
        runtime.level
    )
    self.entIndexToBossId:set(
        unit:entindex(),
        runtime.definition.id
    )
    local targetScale = self:computeBossScale(runtime.definition, runtime.level)
    if runtime.definition.appearance then
        HeroAppearance:applyPreset(
            unit,
            __TS__ObjectAssign({}, runtime.definition.appearance, {scale = targetScale})
        )
    else
        unit:SetModelScale(targetScale)
    end
    if unit:IsHero() then
        while unit:GetLevel() < runtime.level do
            unit:HeroLevelUp(false)
        end
        self:upgradeBossHeroAbilities(unit, runtime.definition)
    elseif unit:IsCreature() then
        local delta = runtime.level - unit:GetLevel()
        if delta > 0 then
            unit:CreatureLevelUp(delta)
        end
        self:syncBossAbilitiesLevel(unit, runtime.level)
    end
    if isFreshSpawn then
        self:equipPurchasedItems(unit, runtime)
    end
    if runtime.inCourage then
        unit:AddNewModifier(unit, nil, "modifier_evo_boss_courage", {})
    end
    self.eventBus:emit("boss_event", {bossId = runtime.definition.id, level = runtime.level, event = "spawned"})
    CustomGameEventManager:Send_ServerToAllClients("evo_boss_announcement", {boss_id = runtime.definition.id, level = runtime.level, event = "spawned"})
    if IsInToolsMode() then
        GameRules:SendCustomMessage(
            ((("[Evo] Third-Party Boss spawned: " .. runtime.definition.id) .. " (Lv.") .. tostring(runtime.level)) .. ")",
            0,
            0
        )
    end
end
function BossManager.prototype.isNearAnyFountain(self, pos, radius)
    if radius == nil then
        radius = 1600
    end
    for ____, fPos in ipairs(self.fountainPositions) do
        if self:distance2D(pos, fPos) <= radius then
            return true
        end
    end
    return false
end
function BossManager.prototype.revealBossOnMinimap(self, origin)
    local playerTeams = {
        2,
        3,
        6,
        7,
        8,
        9
    }
    for ____, team in ipairs(playerTeams) do
        AddFOWViewer(
            team,
            origin,
            220,
            BOSS_AI_TICK_SECONDS + 0.15,
            false
        )
    end
end
function BossManager.prototype.isHeroProtectedByFountain(self, hero)
    if hero:HasModifier("modifier_fountain_buff_lua") or hero:HasModifier("modifier_fountain_aura_buff") then
        return true
    end
    return self:isNearAnyFountain(
        hero:GetAbsOrigin(),
        1600
    )
end
function BossManager.prototype.onThink(self)
    local now = GameRules:GetDOTATime(false, false)
    local slot = 0
    for ____, runtime in __TS__Iterator(self.bosses:values()) do
        do
            local unit = runtime.unit
            if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsAlive() then
                if runtime.respawnAtTime ~= nil and now >= runtime.respawnAtTime then
                    self:spawnBossUnit(runtime, slot)
                end
                slot = slot + 1
                goto __continue90
            end
            self:grantBossProgress(runtime, BOSS_PASSIVE_XP_PER_SEC * BOSS_AI_TICK_SECONDS, BOSS_PASSIVE_GOLD_PER_SEC * BOSS_AI_TICK_SECONDS)
            if not runtime.inCourage and now - runtime.spawnTime >= EVO_CONSTANTS.BOSS_COURAGE_TIME_SECONDS then
                self:triggerCourage(runtime)
            end
            self:revealBossOnMinimap(unit:GetAbsOrigin())
            self:tickBossRoamingAI(runtime, unit, now)
            slot = slot + 1
        end
        ::__continue90::
    end
    return BOSS_AI_TICK_SECONDS
end
function BossManager.prototype.grantBossProgress(self, runtime, xpDelta, goldDelta)
    local unit = runtime.unit
    if not unit or unit:IsNull() or not IsValidEntity(unit) or not unit:IsAlive() then
        return
    end
    runtime.xp = runtime.xp + xpDelta
    runtime.gold = runtime.gold + goldDelta
    if unit:IsHero() then
        local nativeLevel = unit:GetLevel()
        if nativeLevel > runtime.level then
            runtime.level = nativeLevel
        end
    end
    local leveledUp = false
    while runtime.level < EVO_CONSTANTS.BOSS_MAX_LEVEL do
        local nextLevel = runtime.level + 1
        local requiredXp = self:getBossRequiredXp(nextLevel)
        if runtime.xp < requiredXp then
            break
        end
        runtime.level = nextLevel
        leveledUp = true
        if unit:IsHero() then
            while unit:GetLevel() < runtime.level do
                unit:HeroLevelUp(false)
            end
        elseif unit:IsCreature() then
            unit:CreatureLevelUp(1)
        end
    end
    if leveledUp then
        unit:SetModelScale(self:computeBossScale(runtime.definition, runtime.level))
    end
    if unit:IsHero() then
        if unit:GetAbilityPoints() > 0 then
            self:upgradeBossHeroAbilities(unit, runtime.definition)
        end
    else
        self:syncBossAbilitiesLevel(unit, runtime.level)
    end
    while runtime.nextItemIndex < #runtime.itemBuild do
        local nextStep = runtime.itemBuild[runtime.nextItemIndex + 1]
        if runtime.gold < nextStep.goldCost then
            break
        end
        runtime.gold = runtime.gold - nextStep.goldCost
        runtime.nextItemIndex = runtime.nextItemIndex + 1
        unit:AddItemByName(nextStep.itemName)
        if IsInToolsMode() then
            GameRules:SendCustomMessage(
                (((("[Evo] " .. runtime.definition.id) .. " (Lv.") .. tostring(runtime.level)) .. ") bought ") .. nextStep.itemName,
                0,
                0
            )
        end
    end
end
function BossManager.prototype.upgradeBossHeroAbilities(self, hero, definition)
    local skipped = __TS__New(Set)
    local safety = 40
    while hero:GetAbilityPoints() > 0 and safety > 0 do
        safety = safety - 1
        local pointsBefore = hero:GetAbilityPoints()
        local chosen = self:pickNextAbilityToUpgrade(hero, definition, skipped)
        if not chosen then
            break
        end
        hero:UpgradeAbility(chosen)
        if hero:GetAbilityPoints() >= pointsBefore then
            skipped:add(chosen:GetAbilityName())
        end
    end
end
function BossManager.prototype.pickNextAbilityToUpgrade(self, hero, definition, skipped)
    local abilityCount = hero:GetAbilityCount()
    do
        local i = 0
        while i < abilityCount do
            do
                local ability = hero:GetAbilityByIndex(i)
                if not self:canUpgradeBossAbility(hero, ability, skipped) then
                    goto __continue116
                end
                if ability:GetAbilityType() == 1 then
                    return ability
                end
            end
            ::__continue116::
            i = i + 1
        end
    end
    for ____, preferredName in ipairs(definition.abilityUpgradeOrder) do
        local ability = hero:FindAbilityByName(preferredName)
        if self:canUpgradeBossAbility(hero, ability, skipped) and ability:GetLevel() == 0 then
            return ability
        end
    end
    for ____, preferredName in ipairs(definition.abilityUpgradeOrder) do
        local ability = hero:FindAbilityByName(preferredName)
        if self:canUpgradeBossAbility(hero, ability, skipped) then
            return ability
        end
    end
    do
        local i = 0
        while i < abilityCount do
            do
                local ability = hero:GetAbilityByIndex(i)
                if not self:canUpgradeBossAbility(hero, ability, skipped) then
                    goto __continue125
                end
                local name = ability:GetAbilityName()
                if __TS__StringStartsWith(name, "special_bonus_") or ability:IsAttributeBonus() then
                    goto __continue125
                end
                return ability
            end
            ::__continue125::
            i = i + 1
        end
    end
    do
        local i = 0
        while i < abilityCount do
            do
                local ability = hero:GetAbilityByIndex(i)
                if not self:canUpgradeBossAbility(hero, ability, skipped) then
                    goto __continue128
                end
                if __TS__StringStartsWith(
                    ability:GetAbilityName(),
                    "special_bonus_"
                ) then
                    return ability
                end
            end
            ::__continue128::
            i = i + 1
        end
    end
    return nil
end
function BossManager.prototype.canUpgradeBossAbility(self, hero, ability, skipped)
    if not ability or ability:IsNull() then
        return false
    end
    local name = ability:GetAbilityName()
    if skipped:has(name) or IGNORED_BOSS_ABILITIES:has(name) then
        return false
    end
    if ability:IsHidden() then
        return false
    end
    if ability:GetLevel() >= ability:GetMaxLevel() then
        return false
    end
    if hero:GetLevel() < ability:GetHeroLevelRequiredToUpgrade() then
        return false
    end
    local learnResult = ability:CanAbilityBeUpgraded()
    if learnResult == false or type(learnResult) == "number" and learnResult ~= 0 then
        return false
    end
    return true
end
function BossManager.prototype.triggerCourage(self, runtime)
    if runtime.inCourage then
        return
    end
    runtime.inCourage = true
    runtime.retreating = false
    local unit = runtime.unit
    if unit and not unit:IsNull() and IsValidEntity(unit) and unit:IsAlive() then
        unit:AddNewModifier(unit, nil, "modifier_evo_boss_courage", {})
    end
    self.eventBus:emit("boss_event", {bossId = runtime.definition.id, level = runtime.level, event = "courage"})
    CustomGameEventManager:Send_ServerToAllClients("evo_boss_announcement", {boss_id = runtime.definition.id, level = runtime.level, event = "courage"})
    if IsInToolsMode() then
        GameRules:SendCustomMessage(("[Evo] " .. runtime.definition.id) .. " entered COURAGE mode!", 0, 0)
    end
end
function BossManager.prototype.tickBossRoamingAI(self, runtime, unit, now)
    if unit:IsChanneling() or unit:IsStunned() or unit:IsHexed() then
        return
    end
    local activeAbility = unit:GetCurrentActiveAbility()
    if activeAbility and not activeAbility:IsNull() and activeAbility:IsInAbilityPhase() then
        return
    end
    local origin = unit:GetAbsOrigin()
    local hpRatio = unit:GetHealthPercent() / 100
    local attackRange = unit:Script_GetAttackRange()
    self:tryMaintainBossHealth(runtime, unit, hpRatio, now)
    if self:isNearAnyFountain(origin, 1450) then
        local safeWaypoint = self:pickSmartWaypoint(origin, runtime.level)
        runtime.targetWaypoint = safeWaypoint
        if not unit:IsMoving() or now - runtime.lastMoveOrderTime >= 1 then
            runtime.lastMoveOrderTime = now
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 1,
                Position = safeWaypoint,
                Queue = false
            })
        end
        return
    end
    if not runtime.inCourage then
        if not runtime.retreating and hpRatio <= RETREAT_HP_THRESHOLD then
            runtime.retreating = true
            runtime.retreatPosition = self:pickRetreatPosition(origin)
            runtime.lastMoveOrderTime = -999
        elseif runtime.retreating and hpRatio >= RECOVER_HP_THRESHOLD then
            runtime.retreating = false
            runtime.retreatPosition = nil
            runtime.lastMoveOrderTime = -999
        end
    end
    local heroSearchRadius = runtime.inCourage and FIND_UNITS_EVERYWHERE or 800
    local nearbyHeroes = __TS__ArrayFilter(
        FindUnitsInRadius(
            BOSS_TEAM,
            origin,
            nil,
            heroSearchRadius,
            2,
            1,
            256,
            1,
            false
        ),
        function(____, h) return h and not h:IsNull() and IsValidEntity(h) and h:IsAlive() and not self:isHeroProtectedByFountain(h) end
    )
    if runtime.retreating then
        local threat = nearbyHeroes[1]
        if threat and unit:CanEntityBeSeenByMyTeam(threat) then
            local dist = self:distance2D(
                origin,
                threat:GetAbsOrigin()
            )
            if not unit:IsSilenced() and dist <= 650 then
                if self:tryCastDefensiveItem(unit, #nearbyHeroes, dist) then
                    return
                end
            end
        end
        if not runtime.retreatPosition or self:distance2D(origin, runtime.retreatPosition) <= 220 then
            runtime.retreatPosition = self:pickRetreatPosition(origin)
            runtime.lastMoveOrderTime = -999
        end
        if not unit:IsMoving() or now - runtime.lastMoveOrderTime >= 1.5 then
            runtime.lastMoveOrderTime = now
            runtime.lastAttackTargetIndex = nil
            self:tryUseMobilityItem(unit)
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 1,
                Position = runtime.retreatPosition,
                Queue = false
            })
        end
        return
    end
    local targetHero = self:selectPriorityHeroTarget(origin, unit, nearbyHeroes)
    if targetHero then
        local canSee = unit:CanEntityBeSeenByMyTeam(targetHero)
        local heroPos = targetHero:GetAbsOrigin()
        local dist = self:distance2D(origin, heroPos)
        if canSee then
            if not unit:IsSilenced() and not unit:IsAttacking() and dist <= 900 then
                if self:tryCastHeroCombatKit(
                    unit,
                    runtime.definition,
                    targetHero,
                    #nearbyHeroes,
                    runtime.inCourage
                ) then
                    runtime.lastMoveOrderTime = now
                    return
                end
            end
            if dist > attackRange + 120 then
                self:tryUseMobilityItem(unit)
            end
            if not unit:IsAttacking() and (dist > attackRange + 80 or not unit:IsMoving()) then
                if now - runtime.lastMoveOrderTime >= 1.2 or not unit:IsMoving() then
                    runtime.lastMoveOrderTime = now
                    ExecuteOrderFromTable({
                        UnitIndex = unit:entindex(),
                        OrderType = 3,
                        Position = heroPos,
                        Queue = false
                    })
                end
            end
        elseif not unit:IsAttacking() and (not unit:IsMoving() or now - runtime.lastMoveOrderTime >= 1.5) then
            runtime.lastMoveOrderTime = now
            self:tryUseMobilityItem(unit)
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 3,
                Position = heroPos,
                Queue = false
            })
        end
        return
    end
    local nearbyRune = self:findNearbyRune(origin, 650)
    if nearbyRune then
        local runeDist = self:distance2D(
            origin,
            nearbyRune:GetAbsOrigin()
        )
        if runeDist <= 140 then
            self:consumeRuneForBoss(runtime, unit, nearbyRune)
            return
        end
        if not unit:IsAttacking() and (not unit:IsMoving() or now - runtime.lastMoveOrderTime >= 1.2) then
            runtime.lastMoveOrderTime = now
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 15,
                TargetIndex = nearbyRune:entindex(),
                Queue = false
            })
        end
        return
    end
    local nearbyCreeps = __TS__ArrayFilter(
        FindUnitsInRadius(
            BOSS_TEAM,
            origin,
            nil,
            750,
            2,
            18,
            128,
            1,
            false
        ),
        function(____, c) return c and not c:IsNull() and IsValidEntity(c) and c:IsAlive() end
    )
    local targetCreep = self:selectPriorityCreepTarget(origin, nearbyCreeps)
    if targetCreep then
        local creepPos = targetCreep:GetAbsOrigin()
        local dist = self:distance2D(origin, creepPos)
        if not unit:IsSilenced() and not unit:IsAttacking() and dist <= 420 then
            if self:tryCastFarmAbilities(unit, runtime.definition, targetCreep, nearbyCreeps) then
                runtime.lastMoveOrderTime = now
                return
            end
        end
        if not unit:IsAttacking() and not unit:IsMoving() then
            runtime.lastMoveOrderTime = now
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 3,
                Position = creepPos,
                Queue = false
            })
        end
        return
    end
    if not runtime.targetWaypoint or self:distance2D(origin, runtime.targetWaypoint) <= 280 then
        runtime.targetWaypoint = self:pickSmartWaypoint(origin, runtime.level)
        runtime.lastMoveOrderTime = -999
    end
    if not unit:IsAttacking() and not unit:IsMoving() then
        runtime.lastMoveOrderTime = now
        self:tryUseMobilityItem(unit)
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 3,
            Position = runtime.targetWaypoint,
            Queue = false
        })
    end
end
function BossManager.prototype.selectPriorityHeroTarget(self, origin, unit, heroes)
    if #heroes == 0 then
        return nil
    end
    local best
    local bestScore = -999999
    for ____, hero in ipairs(heroes) do
        local dist = self:distance2D(
            origin,
            hero:GetAbsOrigin()
        )
        local visibleBonus = unit:CanEntityBeSeenByMyTeam(hero) and 400 or 0
        local lowHpBonus = (100 - hero:GetHealthPercent()) * 6
        local score = visibleBonus + lowHpBonus - dist * 0.5
        if score > bestScore then
            bestScore = score
            best = hero
        end
    end
    return best
end
function BossManager.prototype.selectPriorityCreepTarget(self, origin, creeps)
    if #creeps == 0 then
        return nil
    end
    local best = creeps[1]
    local bestScore = -999999
    for ____, creep in ipairs(creeps) do
        local dist = self:distance2D(
            origin,
            creep:GetAbsOrigin()
        )
        local finishBonus = creep:GetHealthPercent() <= 35 and 250 or 0
        local score = finishBonus - dist
        if score > bestScore then
            bestScore = score
            best = creep
        end
    end
    return best
end
function BossManager.prototype.tryUseMobilityItem(self, unit)
    local phase = unit:FindItemInInventory("item_phase_boots")
    if phase and phase:IsFullyCastable() then
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 8,
            AbilityIndex = phase:entindex(),
            Queue = false
        })
    end
end
function BossManager.prototype.tryCastDefensiveItem(self, unit, enemyHeroCount, dist)
    local hpRatio = unit:GetHealthPercent() / 100
    if hpRatio <= 0.85 or enemyHeroCount >= 2 then
        local bkb = unit:FindItemInInventory("item_black_king_bar")
        if bkb and bkb:IsFullyCastable() and dist <= 700 then
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 8,
                AbilityIndex = bkb:entindex(),
                Queue = false
            })
            return true
        end
    end
    if hpRatio <= 0.9 and dist <= 550 then
        local bladeMail = unit:FindItemInInventory("item_blade_mail")
        if bladeMail and bladeMail:IsFullyCastable() then
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 8,
                AbilityIndex = bladeMail:entindex(),
                Queue = false
            })
            return true
        end
    end
    if dist <= 750 then
        local shiva = unit:FindItemInInventory("item_shivas_guard")
        if shiva and shiva:IsFullyCastable() then
            ExecuteOrderFromTable({
                UnitIndex = unit:entindex(),
                OrderType = 8,
                AbilityIndex = shiva:entindex(),
                Queue = false
            })
            return true
        end
    end
    return false
end
function BossManager.prototype.tryCastHeroCombatKit(self, unit, definition, target, nearbyHeroCount, inCourage)
    local dist = self:distance2D(
        unit:GetAbsOrigin(),
        target:GetAbsOrigin()
    )
    local abyssal = unit:FindItemInInventory("item_abyssal_blade")
    if abyssal and abyssal:IsFullyCastable() and dist <= 300 then
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 6,
            TargetIndex = target:entindex(),
            AbilityIndex = abyssal:entindex(),
            Queue = false
        })
        return true
    end
    if self:tryCastDefensiveItem(unit, nearbyHeroCount, dist) then
        return true
    end
    return self:tryCastBossHeroAbilities(
        unit,
        definition,
        target,
        nearbyHeroCount,
        inCourage
    )
end
function BossManager.prototype.tryCastBossHeroAbilities(self, unit, definition, target, nearbyHeroCount, inCourage)
    local origin = unit:GetAbsOrigin()
    local dist = self:distance2D(
        origin,
        target:GetAbsOrigin()
    )
    local hpRatio = unit:GetHealthPercent() / 100
    do
        local i = 0
        while i < unit:GetAbilityCount() do
            do
                local ability = unit:GetAbilityByIndex(i)
                if not self:isCastableCombatAbility(ability) then
                    goto __continue198
                end
                local name = ability:GetAbilityName()
                local rule = self:findAbilityRule(definition, name)
                local isUltimate = ability:GetAbilityType() == 1 or (rule and rule.usage) == "ULTIMATE_COMBAT"
                if isUltimate then
                    local worthUltimate = inCourage or nearbyHeroCount >= 2 or hpRatio <= 0.75 or target:GetHealthPercent() <= 70
                    if not worthUltimate then
                        goto __continue198
                    end
                end
                if self:castAbilityAtTarget(
                    unit,
                    ability,
                    target,
                    dist,
                    rule and rule.maxCastDistance
                ) then
                    return true
                end
            end
            ::__continue198::
            i = i + 1
        end
    end
    return false
end
function BossManager.prototype.tryCastFarmAbilities(self, unit, definition, targetCreep, nearbyCreeps)
    local origin = unit:GetAbsOrigin()
    local dist = self:distance2D(
        origin,
        targetCreep:GetAbsOrigin()
    )
    local maxMana = math.max(
        1,
        unit:GetMaxMana()
    )
    local currentMana = unit:GetMana()
    local reservedUltMana = self:getReadyUltimateManaCost(unit)
    for ____, rule in ipairs(definition.abilityRules) do
        do
            if rule.usage ~= "FARM_AND_HERO" then
                goto __continue204
            end
            local ability = unit:FindAbilityByName(rule.abilityName)
            if not self:isCastableCombatAbility(ability) then
                goto __continue204
            end
            local manaCost = ability:GetManaCost(ability:GetLevel() - 1)
            local manaAfterCast = currentMana - manaCost
            local minReserveRatio = rule.minManaRatioForFarm or DEFAULT_FARM_MANA_RESERVE
            if manaAfterCast / maxMana < minReserveRatio then
                goto __continue204
            end
            if reservedUltMana > 0 and manaAfterCast < reservedUltMana then
                goto __continue204
            end
            local closeCreeps = __TS__ArrayFilter(
                nearbyCreeps,
                function(____, c) return self:distance2D(
                    origin,
                    c:GetAbsOrigin()
                ) <= (rule.maxCastDistance or 380) end
            )
            local minTargets = rule.minFarmTargets or 2
            if #closeCreeps < minTargets then
                goto __continue204
            end
            local fullHpCount = 0
            local totalHpPct = 0
            for ____, c in ipairs(closeCreeps) do
                local hpPct = c:GetHealthPercent()
                totalHpPct = totalHpPct + hpPct
                if hpPct >= 85 then
                    fullHpCount = fullHpCount + 1
                end
            end
            local avgHpPct = totalHpPct / #closeCreeps
            if fullHpCount < minTargets or avgHpPct < 80 then
                goto __continue204
            end
            if self:castAbilityAtTarget(
                unit,
                ability,
                targetCreep,
                dist,
                rule.maxCastDistance
            ) then
                return true
            end
        end
        ::__continue204::
    end
    return false
end
function BossManager.prototype.getReadyUltimateManaCost(self, unit)
    do
        local i = 0
        while i < unit:GetAbilityCount() do
            do
                local ability = unit:GetAbilityByIndex(i)
                if not ability or ability:IsNull() or ability:GetLevel() <= 0 then
                    goto __continue218
                end
                if ability:GetAbilityType() ~= 1 then
                    goto __continue218
                end
                if ability:GetCooldownTimeRemaining() <= 10 then
                    return ability:GetManaCost(ability:GetLevel() - 1)
                end
            end
            ::__continue218::
            i = i + 1
        end
    end
    return 0
end
function BossManager.prototype.isCastableCombatAbility(self, ability)
    if not ability or ability:IsNull() or ability:GetLevel() <= 0 then
        return false
    end
    local name = ability:GetAbilityName()
    if IGNORED_BOSS_ABILITIES:has(name) or __TS__StringStartsWith(name, "special_bonus_") then
        return false
    end
    if ability:IsHidden() or ability:IsPassive() or ability:IsToggle() or ability:IsAttributeBonus() then
        return false
    end
    return ability:IsFullyCastable()
end
function BossManager.prototype.findAbilityRule(self, definition, abilityName)
    for ____, rule in ipairs(definition.abilityRules) do
        if rule.abilityName == abilityName then
            return rule
        end
    end
    return nil
end
function BossManager.prototype.castAbilityAtTarget(self, unit, ability, target, dist, customMaxDistance)
    local origin = unit:GetAbsOrigin()
    local behavior = ability:GetBehaviorInt()
    if bit.band(behavior, 4) ~= 0 then
        local isUltimate = ability:GetAbilityType() == 1
        local maxRange = customMaxDistance or (isUltimate and 800 or 380)
        if dist > maxRange then
            return false
        end
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 8,
            AbilityIndex = ability:entindex(),
            Queue = false
        })
        return true
    end
    if bit.band(behavior, 8) ~= 0 then
        local castRange = customMaxDistance or math.max(
            300,
            ability:GetCastRange(origin, target)
        )
        if dist > castRange then
            return false
        end
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 6,
            TargetIndex = target:entindex(),
            AbilityIndex = ability:entindex(),
            Queue = false
        })
        return true
    end
    if bit.band(behavior, 16) ~= 0 then
        local castRange = customMaxDistance or math.max(
            300,
            ability:GetCastRange(origin, target)
        )
        if dist > castRange then
            return false
        end
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 5,
            Position = target:GetAbsOrigin(),
            AbilityIndex = ability:entindex(),
            Queue = false
        })
        return true
    end
    return false
end
function BossManager.prototype.onEntityKilled(self, event)
    local killedIndex = event.entindex_killed
    local killerIndex = event.entindex_attacker
    if killerIndex ~= nil then
        local killerBossId = self.entIndexToBossId:get(killerIndex)
        if killerBossId ~= nil then
            local killerBoss = self.bosses:get(killerBossId)
            local victim = EntIndexToHScript(killedIndex)
            if killerBoss and victim and not victim:IsNull() and IsValidEntity(victim) and victim:IsBaseNPC() then
                if victim:IsRealHero() then
                    self:grantBossProgress(killerBoss, BOSS_HERO_KILL_XP, BOSS_HERO_KILL_GOLD)
                else
                    local creepXp = math.max(
                        15,
                        math.floor(victim:GetDeathXP() * BOSS_CREEP_XP_MULTIPLIER)
                    )
                    local creepGold = math.max(
                        15,
                        victim:GetGoldBounty()
                    )
                    self:grantBossProgress(killerBoss, creepXp, creepGold)
                end
            end
        end
    end
    local deadBossId = self.entIndexToBossId:get(killedIndex)
    if deadBossId == nil then
        return
    end
    self.entIndexToBossId:delete(killedIndex)
    local runtime = self.bosses:get(deadBossId)
    if not runtime then
        return
    end
    local deadUnit = EntIndexToHScript(killedIndex)
    local dropOrigin = deadUnit and not deadUnit:IsNull() and IsValidEntity(deadUnit) and deadUnit:GetAbsOrigin() or Vector(0, 0, 128)
    self:dropBossCore(runtime.definition, dropOrigin)
    local killerTeam
    local killerPlayerId
    if killerIndex ~= nil then
        local attacker = EntIndexToHScript(killerIndex)
        if attacker and not attacker:IsNull() and IsValidEntity(attacker) and attacker:IsBaseNPC() then
            killerTeam = attacker:GetTeamNumber()
            local ownerId = attacker:GetPlayerOwnerID()
            if PlayerResource:IsValidPlayerID(ownerId) then
                killerPlayerId = ownerId
            end
        end
    end
    if not deadUnit or deadUnit:IsNull() or not IsValidEntity(deadUnit) or not deadUnit:IsBaseNPC() or not deadUnit:IsHero() then
        runtime.unit = nil
    end
    runtime.entIndex = nil
    runtime.retreating = false
    runtime.retreatPosition = nil
    runtime.respawnAtTime = GameRules:GetDOTATime(false, false) + EVO_CONSTANTS.BOSS_RESPAWN_SECONDS
    self.eventBus:emit("boss_event", {
        bossId = runtime.definition.id,
        level = runtime.level,
        event = "killed",
        killerTeam = killerTeam,
        killerPlayerId = killerPlayerId
    })
    CustomGameEventManager:Send_ServerToAllClients("evo_boss_announcement", {boss_id = runtime.definition.id, level = runtime.level, event = "killed"})
    if IsInToolsMode() then
        GameRules:SendCustomMessage(("[Evo] Boss " .. runtime.definition.id) .. " slain! Aghanim's Shard dropped!", 0, 0)
    end
end
function BossManager.prototype.dropBossCore(self, _definition, origin)
    local item = CreateItem("item_aghanims_shard_roshan", nil, nil)
    if not item then
        return
    end
    item:SetPurchaseTime(0)
    CreateItemOnPositionSync(origin, item)
    local destination = Vector(
        origin.x + RandomFloat(-140, 140),
        origin.y + RandomFloat(-140, 140),
        origin.z
    )
    item:LaunchLoot(
        false,
        280,
        0.7,
        destination,
        nil
    )
end
function BossManager.prototype.syncBossAbilitiesLevel(self, unit, bossLevel)
    local targetAbilityLevel = math.min(
        15,
        math.max(
            1,
            math.floor((bossLevel - 1) / 10) + 1
        )
    )
    do
        local i = 0
        while i < unit:GetAbilityCount() do
            do
                local ability = unit:GetAbilityByIndex(i)
                if not ability or ability:IsNull() then
                    goto __continue253
                end
                local capped = math.min(
                    ability:GetMaxLevel(),
                    targetAbilityLevel
                )
                if ability:GetLevel() < capped then
                    ability:SetLevel(capped)
                end
            end
            ::__continue253::
            i = i + 1
        end
    end
end
function BossManager.prototype.equipPurchasedItems(self, unit, runtime)
    do
        local i = 0
        while i < runtime.nextItemIndex do
            local step = runtime.itemBuild[i + 1]
            if step ~= nil then
                unit:AddItemByName(step.itemName)
            end
            i = i + 1
        end
    end
end
function BossManager.prototype.tryMaintainBossHealth(self, runtime, unit, hpRatio, now)
    if hpRatio > HEAL_POTION_HP_THRESHOLD then
        return
    end
    if unit:HasModifier("modifier_heal_potion_active") or unit:HasModifier("modifier_combined_potion_active") or unit:HasModifier("modifier_flask_healing") then
        return
    end
    local existing = unit:FindItemInInventory("item_combined_potion") or unit:FindItemInInventory("item_heal_potion") or unit:FindItemInInventory("item_flask")
    if existing and not existing:IsNull() and existing:IsFullyCastable() then
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 6,
            TargetIndex = unit:entindex(),
            AbilityIndex = existing:entindex(),
            Queue = false
        })
        return
    end
    if now - runtime.lastHealBuyTime < HEAL_POTION_BUY_COOLDOWN then
        return
    end
    if not self:hasFreeInventorySlot(unit) then
        return
    end
    local maxMana = unit:GetMaxMana()
    local lowMana = maxMana > 0 and unit:GetMana() / maxMana < 0.55
    local potionName
    local potionCost = 0
    if lowMana and runtime.gold >= COMBINED_POTION_COST then
        potionName = "item_combined_potion"
        potionCost = COMBINED_POTION_COST
    elseif runtime.gold >= HEAL_POTION_COST then
        potionName = "item_heal_potion"
        potionCost = HEAL_POTION_COST
    end
    if not potionName then
        return
    end
    runtime.gold = runtime.gold - potionCost
    runtime.lastHealBuyTime = now
    local bought = unit:AddItemByName(potionName)
    if bought and not bought:IsNull() then
        ExecuteOrderFromTable({
            UnitIndex = unit:entindex(),
            OrderType = 6,
            TargetIndex = unit:entindex(),
            AbilityIndex = bought:entindex(),
            Queue = false
        })
    end
end
function BossManager.prototype.hasFreeInventorySlot(self, unit)
    do
        local slot = 0
        while slot < 6 do
            local item = unit:GetItemInSlot(slot)
            if not item or item:IsNull() then
                return true
            end
            slot = slot + 1
        end
    end
    return false
end
function BossManager.prototype.pickSmartWaypoint(self, currentPos, bossLevel)
    local allowedSizes = self:getAllowedCampSizes(bossLevel)
    local preferred = __TS__ArrayFilter(
        self.patrolWaypoints,
        function(____, w) return allowedSizes:has(w.campSize) end
    )
    local pool = #preferred > 0 and preferred or self.patrolWaypoints
    if #pool == 1 then
        return pool[1].position
    end
    local best = pool[RandomInt(0, #pool - 1) + 1].position
    do
        local attempt = 0
        while attempt < 6 do
            local candidate = pool[RandomInt(0, #pool - 1) + 1].position
            local dist = self:distance2D(currentPos, candidate)
            if dist >= 900 and dist <= 4500 then
                best = candidate
                break
            end
            attempt = attempt + 1
        end
    end
    return best
end
function BossManager.prototype.pickRetreatPosition(self, currentPos)
    local best = self.bossSpawnPoints[1] or Vector(0, 0, 128)
    local bestDist = -1
    for ____, wp in ipairs(self.patrolWaypoints) do
        local dist = self:distance2D(currentPos, wp.position)
        if dist >= 1200 and dist <= 2600 and dist > bestDist then
            bestDist = dist
            best = wp.position
        end
    end
    return best
end
function BossManager.prototype.getAllowedCampSizes(self, bossLevel)
    if bossLevel <= 15 then
        return __TS__New(Set, {"small", "medium"})
    end
    if bossLevel <= 40 then
        return __TS__New(Set, {"small", "medium", "hard"})
    end
    return __TS__New(Set, {
        "small",
        "medium",
        "hard",
        "strong",
        "random"
    })
end
function BossManager.prototype.issueAttackOrderIfNeeded(self, runtime, unit, target, now)
    if unit:IsAttacking() then
        return
    end
    local targetIndex = target:entindex()
    local currentAggro = unit:GetAggroTarget()
    if currentAggro and not currentAggro:IsNull() and IsValidEntity(currentAggro) and currentAggro:IsAlive() and currentAggro:GetTeamNumber() ~= BOSS_TEAM and currentAggro:entindex() == targetIndex then
        return
    end
    if runtime.lastAttackTargetIndex == targetIndex and now - runtime.lastAttackOrderTime < 2 then
        return
    end
    runtime.lastAttackTargetIndex = targetIndex
    runtime.lastAttackOrderTime = now
    ExecuteOrderFromTable({
        UnitIndex = unit:entindex(),
        OrderType = 4,
        TargetIndex = targetIndex,
        Queue = false
    })
end
function BossManager.prototype.findNearbyRune(self, origin, radius)
    local runes = Entities:FindAllByClassnameWithin("dota_item_rune", origin, radius)
    local closest
    local closestDist = radius + 1
    for ____, ent in ipairs(runes) do
        do
            if not ent or ent:IsNull() or not IsValidEntity(ent) then
                goto __continue289
            end
            local dist = self:distance2D(
                origin,
                ent:GetAbsOrigin()
            )
            if dist < closestDist then
                closestDist = dist
                closest = ent
            end
        end
        ::__continue289::
    end
    return closest
end
function BossManager.prototype.consumeRuneForBoss(self, runtime, unit, rune)
    if not rune or rune:IsNull() or not IsValidEntity(rune) then
        return
    end
    local runeApi = rune
    local runeType = runeApi.GetRuneType ~= nil and runeApi:GetRuneType() or 5
    if runeType == 5 then
        self:grantBossProgress(runtime, 200, 220)
    elseif runeType == 0 then
        unit:AddNewModifier(unit, nil, "modifier_rune_doubledamage", {duration = 45})
    elseif runeType == 1 then
        unit:AddNewModifier(unit, nil, "modifier_rune_haste", {duration = 22})
    elseif runeType == 4 then
        unit:AddNewModifier(unit, nil, "modifier_rune_regen", {duration = 30})
    elseif runeType == 6 then
        unit:AddNewModifier(unit, nil, "modifier_rune_arcane", {duration = 50})
    elseif runeType == 3 then
        unit:AddNewModifier(unit, nil, "modifier_rune_invis", {duration = 45})
    elseif runeType == 9 then
        unit:AddNewModifier(unit, nil, "modifier_rune_shield", {duration = 75})
    else
        self:grantBossProgress(runtime, 150, 150)
    end
    unit:EmitSound("General.RunePickUp")
    UTIL_Remove(rune)
end
function BossManager.prototype.distance2D(self, a, b)
    local dx = a.x - b.x
    local dy = a.y - b.y
    return math.sqrt(dx * dx + dy * dy)
end
function BossManager.prototype.onDevBossCommand(self, args)
    local sub = string.lower(args[1] or "")
    if sub == "courage" then
        for ____, runtime in __TS__Iterator(self.bosses:values()) do
            self:triggerCourage(runtime)
        end
        return
    end
    if sub == "lvl" then
        local targetLvl = math.min(
            EVO_CONSTANTS.BOSS_MAX_LEVEL,
            math.max(
                1,
                tonumber(args[2]) or 50
            )
        )
        local targetXp = self:getBossRequiredXp(targetLvl)
        for ____, runtime in __TS__Iterator(self.bosses:values()) do
            local neededXp = math.max(0, targetXp - runtime.xp)
            self:grantBossProgress(runtime, neededXp, 5000)
        end
        return
    end
    self:spawnMatchBosses()
end
return ____exports
