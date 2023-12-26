// PIEZO_BGMUSIC.sv

// C    16.35   32.70   65.41   130.81  261.63  523.25  1046.50 2093.00  4186.01
parameter C0 = 61162; // 16.35 Hz
parameter C1 = 30581; // 32.70 Hz
parameter C2 = 15288; // 65.41 Hz
parameter C3 = 7645; // 130.81 Hz
parameter C4 = 3822; // 261.63 Hz
parameter C5 = 1911; // 523.25 Hz
parameter C6 = 956; // 1046.50 Hz
parameter C7 = 478; // 2093.00 Hz
parameter C8 = 239; // 4186.01 Hz
// C#   17.32   34.65   69.30   138.59  277.18  554.37  1108.73 2217.46  4434.92
parameter C_s0 = 57737; // 17.32 Hz
parameter C_s1 = 28860; // 34.65 Hz
parameter C_s2 = 14430; // 69.30 Hz
parameter C_s3 = 7216; // 138.59 Hz
parameter C_s4 = 3608; // 277.18 Hz
parameter C_s5 = 1804; // 554.37 Hz
parameter C_s6 = 902; // 1108.73 Hz
parameter C_s7 = 451; // 2217.46 Hz
parameter C_s8 = 225; // 4434.92 Hz
// D    18.35   36.71   73.42   146.83  293.66  587.33  1174.66 2349.32  4698.64
parameter D0 = 54496; // 18.35 Hz
parameter D1 = 27241; // 36.71 Hz
parameter D2 = 13620; // 73.42 Hz
parameter D3 = 6811; // 146.83 Hz
parameter D4 = 3405; // 293.66 Hz
parameter D5 = 1703; // 587.33 Hz
parameter D6 = 851; // 1174.66 Hz
parameter D7 = 426; // 2349.32 Hz
parameter D8 = 213; // 4698.64 Hz
// D#   19.45   38.89   77.78   155.56  311.13  622.25  1244.51 2489.02  4978.03
parameter D_s0 = 51414; // 19.45 Hz
parameter D_s1 = 25714; // 38.89 Hz
parameter D_s2 = 12857; // 77.78 Hz
parameter D_s3 = 6428; // 155.56 Hz
parameter D_s4 = 3214; // 311.13 Hz
parameter D_s5 = 1607; // 622.25 Hz
parameter D_s6 = 804; // 1244.51 Hz
parameter D_s7 = 402; // 2489.02 Hz
parameter D_s8 = 201; // 4978.03 Hz
// E    20.60   41.20   82.41   164.81  329.63  659.26  1318.51 2637.02  5274.04
parameter E0 = 48544; // 20.60 Hz
parameter E1 = 24272; // 41.20 Hz
parameter E2 = 12134; // 82.41 Hz
parameter E3 = 6068; // 164.81 Hz
parameter E4 = 3034; // 329.63 Hz
parameter E5 = 1517; // 659.26 Hz
parameter E6 = 758; // 1318.51 Hz
parameter E7 = 379; // 2637.02 Hz
parameter E8 = 190; // 5274.04 Hz
// F    21.83   43.65   87.31   174.61  349.23  698.46  1396.91 2793.83  5587.65
parameter F0 = 45809; // 21.83 Hz
parameter F1 = 22910; // 43.65 Hz
parameter F2 = 11453; // 87.31 Hz
parameter F3 = 5727; // 174.61 Hz
parameter F4 = 2863; // 349.23 Hz
parameter F5 = 1432; // 698.46 Hz
parameter F6 = 716; // 1396.91 Hz
parameter F7 = 358; // 2793.83 Hz
parameter F8 = 179; // 5587.65 Hz
// F#   23.12   46.25   92.50   185.00  369.99  739.99  1479.98 2959.96  5919.91
parameter F_s0 = 43253; // 23.12 Hz
parameter F_s1 = 21622; // 46.25 Hz
parameter F_s2 = 10811; // 92.50 Hz
parameter F_s3 = 5405; // 185.00 Hz
parameter F_s4 = 2703; // 369.99 Hz
parameter F_s5 = 1351; // 739.99 Hz
parameter F_s6 = 676; // 1479.98 Hz
parameter F_s7 = 338; // 2959.96 Hz
parameter F_s8 = 169; // 5919.91 Hz
// G    24.50   49.00   98.00   196.00  392.00  783.99  1567.98 3135.96  6271.93
parameter G0 = 40816; // 24.50 Hz
parameter G1 = 20408; // 49.00 Hz
parameter G2 = 10204; // 98.00 Hz
parameter G3 = 5102; // 196.00 Hz
parameter G4 = 2551; // 392.00 Hz
parameter G5 = 1276; // 783.99 Hz
parameter G6 = 638; // 1567.98 Hz
parameter G7 = 319; // 3135.96 Hz
parameter G8 = 159; // 6271.93 Hz
// G#   25.96   51.91   103.83  207.65  415.30  830.61  1661.22 3322.44  6644.88
parameter G_s0 = 38521; // 25.96 Hz
parameter G_s1 = 19264; // 51.91 Hz
parameter G_s2 = 9631; // 103.83 Hz
parameter G_s3 = 4816; // 207.65 Hz
parameter G_s4 = 2408; // 415.30 Hz
parameter G_s5 = 1204; // 830.61 Hz
parameter G_s6 = 602; // 1661.22 Hz
parameter G_s7 = 301; // 3322.44 Hz
parameter G_s8 = 150; // 6644.88 Hz
// A    27.50   55.00   110.00  220.00  440.00  880.00  1760.00 3520.00  7040.00
parameter A0 = 36364; // 27.50 Hz
parameter A1 = 18182; // 55.00 Hz
parameter A2 = 9091; // 110.00 Hz
parameter A3 = 4545; // 220.00 Hz
parameter A4 = 2273; // 440.00 Hz
parameter A5 = 1136; // 880.00 Hz
parameter A6 = 568; // 1760.00 Hz
parameter A7 = 284; // 3520.00 Hz
parameter A8 = 142; // 7040.00 Hz
// A#   29.14   58.27   116.54  233.08  466.16  932.33  1864.66 3729.31  7458.62
parameter A_s0 = 34317; // 29.14 Hz
parameter A_s1 = 17161; // 58.27 Hz
parameter A_s2 = 8581; // 116.54 Hz
parameter A_s3 = 4290; // 233.08 Hz
parameter A_s4 = 2145; // 466.16 Hz
parameter A_s5 = 1073; // 932.33 Hz
parameter A_s6 = 536; // 1864.66 Hz
parameter A_s7 = 268; // 3729.31 Hz
parameter A_s8 = 134; // 7458.62 Hz
// B    30.87   61.74   123.47  246.94  493.88  987.77  1975.53 3951.07  7902.13
parameter B0 = 32394; // 30.87 Hz
parameter B1 = 16197; // 61.74 Hz
parameter B2 = 8099; // 123.47 Hz
parameter B3 = 4050; // 246.94 Hz
parameter B4 = 2025; // 493.88 Hz
parameter B5 = 1012; // 987.77 Hz
parameter B6 = 506; // 1975.53 Hz
parameter B7 = 253; // 3951.07 Hz
parameter B8 = 127; // 7902.13 Hz

parameter PAUSE = -10;
parameter ENDL = -1;

typedef struct {
    int tone;
    int sstart;
    int llast;
} note;

parameter length_of_ballgame = 239;
parameter length_of_dearX = 108;
parameter length_of_narco = 280;

parameter note ballgame[238:0] = {'{C4, 0, 242718}, '{PAUSE, 242719, 582523}, '{C5, 582524, 825242}, '{PAUSE, 825243, 873785}, '{A4, 873786, 1116504}, '{PAUSE, 1116505, 1165047}, '{G4, 1165048, 1407766}, '{PAUSE, 1407767, 1456309}, '{E4, 1456310, 1699028}, '{PAUSE, 1699029, 1747571}, '{G4, 1747572, 2548542}, '{PAUSE, 2548543, 2621357}, '{D4, 2621358, 3422328}, '{PAUSE, 3422329, 3495143}, '{C4, 3495144, 3737862}, '{PAUSE, 3737863, 4077667}, '{C5, 4077668, 4320386}, '{PAUSE, 4320387, 4368929}, '{A4, 4368930, 4611648}, '{PAUSE, 4611649, 4660191}, '{G4, 4660192, 4902910}, '{PAUSE, 4902911, 4951453}, '{E4, 4951454, 5194172}, '{PAUSE, 
5194173, 5242715}, '{G4, 5242716, 6626210}, '{PAUSE, 6626211, 6990287}, '{A4, 6990288, 7233006}, '{PAUSE, 7233007, 7281549}, '{G_s4, 7281550, 7524268}, '{PAUSE, 7524269, 7572811}, '{A4, 7572812, 7815530}, '{PAUSE, 7815531, 7864073}, '{E4, 7864074, 8106792}, '{PAUSE, 8106793, 8155335}, '{F4, 8155336, 8398054}, '{PAUSE, 8398055, 8446597}, '{G4, 8446598, 8689316}, '{PAUSE, 8689317, 8737859}, '{A4, 8737860, 8980578}, '{PAUSE, 8980579, 9320383}, '{F4, 9320384, 9563102}, '{PAUSE, 9563103, 9611645}, '{D4, 9611646, 10412616}, '{PAUSE, 10412617, 10485431}, '{A4, 10485432, 10728150}, '{PAUSE, 10728151, 11067955}, '{A4, 11067956, 11310674}, '{PAUSE, 11310675, 11359217}, '{A4, 11359218, 11601936}, '{PAUSE, 11601937, 11650479}, '{B4, 11650480, 11893198}, '{PAUSE, 11893199, 11941741}, '{C5, 11941742, 12184460}, '{PAUSE, 12184461, 12233003}, '{D5, 12233004, 12475722}, '{PAUSE, 12475723, 12524265}, '{B4, 12524266, 12766984}, '{PAUSE, 12766985, 12815527}, '{A4, 12815528, 13058246}, '{PAUSE, 13058247, 13106789}, '{G4, 13106790, 13349508}, '{PAUSE, 13349509, 13398051}, '{F4, 13398052, 13640770}, '{PAUSE, 13640771, 13689313}, '{D4, 13689314, 13932032}, '{PAUSE, 13932033, 13980575}, '{C4, 13980576, 14223294}, '{PAUSE, 14223295, 14563099}, '{C5, 14563100, 14805818}, '{PAUSE, 14805819, 14854361}, '{A4, 14854362, 15097080}, '{PAUSE, 15097081, 15145623}, '{G4, 15145624, 15388342}, '{PAUSE, 15388343, 15436885}, '{E4, 15436886, 15679604}, '{PAUSE, 15679605, 15728147}, '{G4, 15728148, 16529118}, '{PAUSE, 16529119, 16601933}, '{D4, 16601934, 17402904}, '{PAUSE, 17402905, 17475719}, '{C4, 17475720, 17718438}, '{PAUSE, 17718439, 18058243}, '{D4, 18058244, 18300962}, '{PAUSE, 18300963, 18349505}, '{E4, 18349506, 18592224}, '{PAUSE, 18592225, 18640767}, '{F4, 18640768, 18883486}, '{PAUSE, 18883487, 18932029}, '{G4, 18932030, 19174748}, '{PAUSE, 19174749, 19223291}, '{A4, 19223292, 20339796}, '{PAUSE, 20339797, 20388339}, '{A4, 20388340, 20631058}, '{PAUSE, 20631059, 20679601}, '{B4, 20679602, 20922320}, '{PAUSE, 20922321, 20970863}, '{C5, 20970864, 21213582}, '{PAUSE, 21213583, 21844649}, '{C5, 21844650, 22087368}, '{PAUSE, 22087369, 22718435}, '{C5, 22718436, 22961154}, '{PAUSE, 22961155, 23009697}, '{B4, 23009698, 23252416}, '{PAUSE, 23252417, 23300959}, '{A4, 23300960, 23543678}, '{PAUSE, 23543679, 23592221}, '{G4, 23592222, 23834940}, '{PAUSE, 23834941, 23883483}, '{F_s4, 23883484, 24126202}, '{PAUSE, 24126203, 24174745}, '{G4, 24174746, 24417464}, '{PAUSE, 24417465, 24466007}, '{A4, 24466008, 25266978}, '{PAUSE, 25266979, 25339793}, '{B4, 25339794, 26140764}, '{PAUSE, 26140765, 26213579}, '{C5, 26213580, 27888336}, '{PAUSE, 27888337, 27961151}, '{C4, 27961152, 28203870}, '{PAUSE, 28203871, 28543675}, '{C5, 28543676, 28786394}, '{PAUSE, 28786395, 28834937}, '{A4, 28834938, 29077656}, '{PAUSE, 29077657, 29126199}, '{G4, 29126200, 29368918}, '{PAUSE, 29368919, 29417461}, '{E4, 29417462, 29660180}, '{PAUSE, 29660181, 29708723}, '{G4, 29708724, 30509694}, '{PAUSE, 30509695, 30582509}, '{D4, 30582510, 31383480}, '{PAUSE, 31383481, 31456295}, '{C4, 31456296, 31699014}, '{PAUSE, 31699015, 32038819}, '{C5, 32038820, 32281538}, '{PAUSE, 32281539, 32330081}, '{A4, 32330082, 32572800}, '{PAUSE, 32572801, 32621343}, '{G4, 32621344, 32864062}, '{PAUSE, 32864063, 32912605}, '{E4, 32912606, 33155324}, '{PAUSE, 33155325, 33203867}, '{G4, 33203868, 34587362}, '{PAUSE, 34587363, 34660177}, '{G_s4, 34660178, 34902896}, '{PAUSE, 34902897, 34951439}, '{A4, 34951440, 35194158}, '{PAUSE, 35194159, 35242701}, '{G_s4, 35242702, 35485420}, '{PAUSE, 35485421, 35533963}, '{A4, 35533964, 35776682}, '{PAUSE, 35776683, 35825225}, '{E4, 35825226, 36067944}, '{PAUSE, 36067945, 36116487}, '{F4, 36116488, 36359206}, '{PAUSE, 36359207, 36407749}, '{G4, 36407750, 36650468}, '{PAUSE, 36650469, 36699011}, '{A4, 36699012, 36941730}, '{PAUSE, 36941731, 37281535}, '{F4, 37281536, 37524254}, '{PAUSE, 37524255, 37572797}, '{D4, 37572798, 38082506}, '{PAUSE, 38082507, 38446583}, '{A4, 38446584, 38956292}, '{PAUSE, 38956293, 39029107}, '{A4, 39029108, 39271826}, '{PAUSE, 39271827, 39320369}, '{A4, 39320370, 39563088}, '{PAUSE, 39563089, 39611631}, '{B4, 39611632, 39854350}, '{PAUSE, 39854351, 39902893}, '{C5, 39902894, 40145612}, '{PAUSE, 40145613, 40194155}, '{D5, 40194156, 40436874}, '{PAUSE, 40436875, 40485417}, '{B4, 40485418, 40728136}, '{PAUSE, 40728137, 40776679}, '{A4, 40776680, 41019398}, '{PAUSE, 41019399, 41067941}, '{G4, 41067942, 41310660}, '{PAUSE, 41310661, 41359203}, '{F4, 41359204, 41601922}, '{PAUSE, 41601923, 41650465}, '{D4, 41650466, 41893184}, '{PAUSE, 41893185, 41941727}, '{C4, 41941728, 
42184446}, '{PAUSE, 42184447, 42524251}, '{C5, 42524252, 42766970}, '{PAUSE, 42766971, 42815513}, '{A4, 42815514, 43058232}, '{PAUSE, 43058233, 43106775}, '{G4, 43106776, 43349494}, '{PAUSE, 43349495, 
43398037}, '{E4, 43398038, 43640756}, '{PAUSE, 43640757, 43689299}, '{G4, 43689300, 44490270}, '{PAUSE, 44490271, 44563085}, '{D4, 44563086, 45364056}, '{PAUSE, 45364057, 45436871}, '{C4, 45436872, 45946580}, '{PAUSE, 45946581, 46019395}, '{D4, 46019396, 46262114}, '{PAUSE, 46262115, 46310657}, '{E4, 46310658, 46553376}, '{PAUSE, 46553377, 46601919}, '{F4, 46601920, 46844638}, '{PAUSE, 46844639, 46893181}, '{G4, 46893182, 47135900}, '{PAUSE, 47135901, 47184443}, '{A4, 47184444, 48300948}, '{PAUSE, 48300949, 48349491}, '{A4, 48349492, 48592210}, '{PAUSE, 48592211, 48640753}, '{B4, 48640754, 48883472}, '{PAUSE, 48883473, 48932015}, '{C5, 48932016, 49174734}, '{PAUSE, 49174735, 49805801}, '{C5, 49805802, 50048520}, '{PAUSE, 50048521, 50679587}, '{C5, 50679588, 50922306}, '{PAUSE, 50922307, 50970849}, '{B4, 50970850, 51213568}, '{PAUSE, 51213569, 51262111}, '{A4, 51262112, 51504830}, '{PAUSE, 51504831, 51553373}, '{G4, 51553374, 51796092}, '{PAUSE, 51796093, 51844635}, '{F_s4, 51844636, 52087354}, '{PAUSE, 52087355, 52135897}, '{G4, 52135898, 52378616}, '{PAUSE, 52378617, 52427159}, '{A4, 52427160, 53228130}, '{PAUSE, 53228131, 53300945}, '{B4, 53300946, 54101916}, '{PAUSE, 54101917, 54174731}, '{C5, 54174732, 55291236}, '{PAUSE, 55291237, 57291237}, '{ENDL, 57291238, 57291248}};


parameter note dearX[107:0] = {'{A5, 0, 312500}, '{PAUSE, 312501, 319148}, '{G5, 319149, 631648}, '{PAUSE, 631649, 638296}, '{F_s5, 638297, 950797}, '{PAUSE, 950798, 957444}, '{A5, 957445, 1110371}, '{PAUSE, 1110372, 1117019}, '{A5, 1117020, 1429519}, '{PAUSE, 1429520, 1436167}, '{F_s5, 1436168, 1589094}, '{PAUSE, 1589095, 1595741}, '{F_s5, 1595742, 1908242}, '{PAUSE, 1908243, 1914890}, '{E5, 1914891, 2446805}, '{PAUSE, 2446806, 2553187}, '{A5, 2553188, 3085102}, '{PAUSE, 3085103, 3191484}, '{D6, 3191485, 3503985}, '{PAUSE, 3503986, 3510632}, '{C_s6, 3510633, 3663559}, '{PAUSE, 3663560, 3670207}, '{B5, 3670208, 4142282}, '{PAUSE, 4142283, 4148930}, '{A5, 4148931, 4301856}, '{PAUSE, 4301857, 4308504}, '{F_s5, 4308505, 4461430}, '{PAUSE, 4461431, 4468078}, '{F_s5, 4468079, 4999993}, '{PAUSE, 4999994, 5744672}, '{D5, 5744673, 6216747}, '{PAUSE, 6216748, 6223395}, '{E5, 6223396, 6695470}, '{PAUSE, 
6695471, 6702118}, '{F_s5, 6702119, 7014618}, '{PAUSE, 7014619, 7021266}, '{E5, 7021267, 7333767}, '{PAUSE, 7333768, 7340414}, '{D5, 7340415, 7493341}, '{PAUSE, 7493342, 7499989}, '{D5, 7499990, 8191478}, '{PAUSE, 8191479, 8297860}, '{G5, 8297861, 8610361}, '{PAUSE, 8610362, 8617008}, '{F_s5, 8617009, 8929509}, '{PAUSE, 8929510, 8936157}, '{G5, 8936158, 9089083}, '{PAUSE, 9089084, 9095731}, '{A5, 9095732, 9408232}, '{PAUSE, 9408233, 9414880}, '{E5, 9414881, 10106369}, '{PAUSE, 10106370, 10212751}, '{A5, 10212752, 10525252}, '{PAUSE, 10525253, 10531900}, '{G5, 10531901, 10844400}, '{PAUSE, 10844401, 10851048}, '{F_s5, 10851049, 11163549}, '{PAUSE, 11163550, 11170196}, '{A5, 11170197, 11323123}, '{PAUSE, 11323124, 11329771}, '{A5, 11329772, 11642271}, '{PAUSE, 11642272, 11648919}, '{F_s5, 11648920, 11801846}, '{PAUSE, 11801847, 11808493}, '{F_s5, 11808494, 12120994}, '{PAUSE, 12120995, 12127642}, '{E5, 12127643, 12659557}, '{PAUSE, 12659558, 12765939}, '{A5, 12765940, 13297854}, '{PAUSE, 13297855, 13404236}, 
'{D6, 13404237, 13716737}, '{PAUSE, 13716738, 13723384}, '{C_s6, 13723385, 13876311}, '{PAUSE, 13876312, 13882959}, '{B5, 13882960, 14355034}, '{PAUSE, 14355035, 14361682}, '{D6, 14361683, 14514608}, '{PAUSE, 14514609, 14521256}, '{A5, 14521257, 14674182}, '{PAUSE, 14674183, 14680830}, '{A5, 14680831, 15212745}, '{PAUSE, 15212746, 15957424}, '{D5, 15957425, 16429499}, '{PAUSE, 16429500, 16436147}, '{E5, 16436148, 16908222}, '{PAUSE, 16908223, 16914870}, '{F_s5, 16914871, 17227370}, '{PAUSE, 17227371, 17234018}, '{E5, 17234019, 17546519}, '{PAUSE, 17546520, 17553166}, '{D5, 17553167, 17706093}, '{PAUSE, 17706094, 17712741}, '{D5, 17712742, 18404230}, '{PAUSE, 18404231, 18510612}, '{G5, 18510613, 18663538}, '{PAUSE, 18663539, 18670186}, '{F_s5, 18670187, 18823113}, '{PAUSE, 18823114, 18829760}, '{E5, 18829761, 18982687}, '{PAUSE, 18982688, 18989335}, '{D5, 18989336, 19142261}, '{PAUSE, 19142262, 19148909}, '{E5, 19148910, 19461410}, '{PAUSE, 19461411, 19468057}, '{F_s5, 19468058, 19620984}, '{PAUSE, 19620985, 19627632}, '{D5, 19627633, 20319121}, '{PAUSE, 20319122, 22319121}};

parameter note narco[279:0] = {'{A5, 0, 400000}, '{PAUSE, 400001, 479999}, '{C5, 480000, 715000}, '{C6, 480000, 715000}, '{PAUSE, 715001, 719999}, '{D5, 720000, 955000}, '{D6, 720000, 955000}, '{PAUSE, 955001, 959999}, '{E5, 960000, 1360000}, '{E6, 960000, 1360000}, '{PAUSE, 1360001, 1919999}, '{E5, 1920000, 2275000}, '{E6, 1920000, 2275000}, '{PAUSE, 2275001, 2279999}, '{E5, 2280000, 2395000}, '{E6, 2280000, 2395000}, '{PAUSE, 2395001, 2399999}, '{D5, 2400000, 2635000}, '{D6, 2400000, 2635000}, '{PAUSE, 2635001, 2639999}, '{F5, 2640000, 2875000}, '{F6, 2640000, 2875000}, '{PAUSE, 2875001, 2879999}, '{E5, 2880000, 3280000}, '{E6, 2880000, 3280000}, '{PAUSE, 3280001, 3839999}, '{E5, 3840000, 4195000}, '{E6, 3840000, 4195000}, '{PAUSE, 4195001, 4199999}, '{E5, 4200000, 4315000}, '{E6, 4200000, 4315000}, '{PAUSE, 4315001, 4319999}, '{D5, 4320000, 4555000}, '{D6, 4320000, 4555000}, '{PAUSE, 4555001, 4559999}, '{F5, 4560000, 4795000}, '{F6, 4560000, 4795000}, '{PAUSE, 4795001, 4799999}, '{E5, 4800000, 5155000}, '{E6, 4800000, 5155000}, '{PAUSE, 5155001, 5159999}, '{E5, 5160000, 5275000}, '{E6, 5160000, 5275000}, '{PAUSE, 5275001, 5279999}, '{C5, 5280000, 5515000}, '{C6, 5280000, 5515000}, '{PAUSE, 5515001, 5519999}, '{B4, 5520000, 5755000}, '{B5, 5520000, 5755000}, '{PAUSE, 5755001, 5759999}, '{D5, 5760000, 6115000}, '{D6, 5760000, 6115000}, '{PAUSE, 6115001, 6119999}, '{D5, 6120000, 6235000}, '{D6, 6120000, 6235000}, '{PAUSE, 6235001, 6239999}, '{C5, 6240000, 6475000}, '{C6, 6240000, 6475000}, '{PAUSE, 6475001, 6479999}, '{B4, 6480000, 6715000}, '{B5, 6480000, 6715000}, '{PAUSE, 6715001, 6719999}, '{A4, 6720000, 7120000}, '{A5, 6720000, 7120000}, '{PAUSE, 7120001, 7679999}, '{A4, 7680000, 8080000}, '{A5, 7680000, 8080000}, '{PAUSE, 8080001, 8159999}, '{C5, 
8160000, 8395000}, '{C6, 8160000, 8395000}, '{PAUSE, 8395001, 8399999}, '{D5, 8400000, 8635000}, '{D6, 8400000, 8635000}, '{PAUSE, 8635001, 8639999}, '{E5, 8640000, 9040000}, '{E6, 8640000, 9040000}, '{PAUSE, 9040001, 9119999}, '{E5, 9120000, 9355000}, '{E6, 9120000, 9355000}, '{PAUSE, 9355001, 9359999}, '{E5, 9360000, 9595000}, '{E6, 9360000, 9595000}, '{PAUSE, 9595001, 9599999}, '{A5, 9600000, 9955000}, '{A6, 9600000, 9955000}, '{PAUSE, 9955001, 9959999}, '{A5, 9960000, 10075000}, '{A6, 9960000, 10075000}, '{PAUSE, 10075001, 10079999}, '{G5, 10080000, 10315000}, '{G6, 10080000, 10315000}, '{PAUSE, 10315001, 10319999}, '{F5, 10320000, 10555000}, '{F6, 10320000, 10555000}, '{PAUSE, 10555001, 10559999}, '{E5, 10560000, 10960000}, '{E6, 10560000, 10960000}, '{PAUSE, 10960001, 11279999}, '{E5, 11280000, 11515000}, '{E6, 11280000, 11515000}, '{PAUSE, 11515001, 11519999}, '{A5, 11520000, 11875000}, '{A6, 11520000, 11875000}, '{PAUSE, 11875001, 11879999}, '{A5, 11880000, 11995000}, '{A6, 11880000, 11995000}, '{PAUSE, 11995001, 11999999}, '{G5, 12000000, 12235000}, '{G6, 12000000, 12235000}, '{PAUSE, 12235001, 12239999}, '{F5, 12240000, 12475000}, '{F6, 12240000, 12475000}, '{PAUSE, 12475001, 12479999}, '{E5, 12480000, 12835000}, '{E6, 12480000, 12835000}, '{PAUSE, 12835001, 12839999}, '{E5, 12840000, 12955000}, '{E6, 12840000, 12955000}, '{PAUSE, 12955001, 12959999}, '{D5, 12960000, 13195000}, '{D6, 12960000, 13195000}, '{PAUSE, 13195001, 13199999}, '{C5, 13200000, 13435000}, '{C6, 13200000, 13435000}, '{PAUSE, 13435001, 13439999}, '{D5, 13440000, 13795000}, '{D6, 13440000, 13795000}, 
'{PAUSE, 13795001, 13799999}, '{D5, 13800000, 13915000}, '{D6, 13800000, 13915000}, '{PAUSE, 13915001, 13919999}, '{C5, 13920000, 14155000}, '{C6, 13920000, 14155000}, '{PAUSE, 14155001, 14159999}, '{B4, 14160000, 14395000}, '{B5, 14160000, 14395000}, '{PAUSE, 14395001, 14399999}, '{A4, 14400000, 14800000}, '{A5, 14400000, 14800000}, '{PAUSE, 14800001, 15359999}, '{A4, 15360000, 15760000}, '{A5, 15360000, 15760000}, '{PAUSE, 15760001, 15839999}, '{C5, 15840000, 16075000}, '{C6, 15840000, 16075000}, '{PAUSE, 16075001, 16079999}, '{D5, 16080000, 16315000}, '{D6, 16080000, 16315000}, '{PAUSE, 16315001, 16319999}, '{E5, 16320000, 16720000}, '{E6, 16320000, 16720000}, '{PAUSE, 16720001, 17279999}, '{E5, 17280000, 17635000}, '{E6, 17280000, 17635000}, '{PAUSE, 17635001, 17639999}, '{E5, 17640000, 17755000}, '{E6, 17640000, 17755000}, '{PAUSE, 17755001, 17759999}, '{D5, 
17760000, 17995000}, '{D6, 17760000, 17995000}, '{PAUSE, 17995001, 17999999}, '{F5, 18000000, 18235000}, '{F6, 18000000, 18235000}, '{PAUSE, 18235001, 18239999}, '{E5, 18240000, 18640000}, '{E6, 18240000, 18640000}, '{PAUSE, 18640001, 19199999}, '{E5, 19200000, 19555000}, '{E6, 19200000, 19555000}, '{PAUSE, 19555001, 19559999}, '{E5, 19560000, 19675000}, '{E6, 19560000, 19675000}, '{PAUSE, 19675001, 19679999}, '{D5, 19680000, 19915000}, '{D6, 19680000, 19915000}, '{PAUSE, 19915001, 19919999}, '{F5, 19920000, 20155000}, '{F6, 19920000, 20155000}, '{PAUSE, 20155001, 20159999}, '{E5, 20160000, 20515000}, '{E6, 20160000, 20515000}, '{PAUSE, 20515001, 20519999}, '{E5, 20520000, 20635000}, '{E6, 20520000, 20635000}, '{PAUSE, 20635001, 20639999}, '{C5, 20640000, 20875000}, '{C6, 20640000, 20875000}, '{PAUSE, 20875001, 20879999}, '{B4, 20880000, 21115000}, '{B5, 20880000, 21115000}, '{PAUSE, 21115001, 21119999}, '{D5, 21120000, 21475000}, '{D6, 21120000, 21475000}, '{PAUSE, 21475001, 21479999}, '{D5, 21480000, 21595000}, '{D6, 21480000, 21595000}, '{PAUSE, 21595001, 21599999}, '{C5, 21600000, 21835000}, '{C6, 21600000, 21835000}, '{PAUSE, 21835001, 21839999}, '{B4, 21840000, 22075000}, '{B5, 21840000, 22075000}, '{PAUSE, 22075001, 22079999}, '{A4, 22080000, 22480000}, '{A5, 22080000, 22480000}, '{PAUSE, 22480001, 23039999}, '{A4, 23040000, 23440000}, '{A5, 23040000, 23440000}, '{PAUSE, 23440001, 23519999}, '{C5, 23520000, 23755000}, '{C6, 23520000, 23755000}, '{PAUSE, 23755001, 23759999}, '{D5, 23760000, 23995000}, '{D6, 23760000, 23995000}, '{PAUSE, 23995001, 23999999}, '{E5, 24000000, 
24400000}, '{E6, 24000000, 24400000}, '{PAUSE, 24400001, 24479999}, '{E5, 24480000, 24715000}, '{E6, 24480000, 24715000}, '{PAUSE, 24715001, 24719999}, '{E5, 24720000, 24955000}, '{E6, 24720000, 24955000}, '{PAUSE, 24955001, 24959999}, '{A5, 24960000, 25315000}, '{A6, 24960000, 25315000}, '{PAUSE, 25315001, 25319999}, '{A5, 25320000, 25435000}, '{A6, 25320000, 25435000}, '{PAUSE, 25435001, 25439999}, '{G5, 25440000, 25675000}, '{G6, 25440000, 25675000}, '{PAUSE, 25675001, 25679999}, '{F5, 25680000, 25915000}, '{F6, 25680000, 25915000}, '{PAUSE, 25915001, 25919999}, '{E5, 25920000, 26320000}, '{E6, 25920000, 26320000}, '{PAUSE, 26320001, 26639999}, '{E5, 26640000, 26875000}, '{E6, 26640000, 26875000}, '{PAUSE, 26875001, 26879999}, '{A5, 26880000, 27235000}, '{A6, 26880000, 27235000}, '{PAUSE, 27235001, 27239999}, '{A5, 27240000, 27355000}, '{A6, 27240000, 27355000}, '{PAUSE, 27355001, 27359999}, '{G5, 27360000, 27595000}, '{G6, 27360000, 27595000}, '{PAUSE, 27595001, 27599999}, '{F5, 27600000, 27835000}, '{F6, 27600000, 27835000}, '{PAUSE, 27835001, 27839999}, '{E5, 27840000, 28195000}, '{E6, 27840000, 28195000}, '{PAUSE, 28195001, 28199999}, '{E5, 28200000, 28315000}, '{E6, 28200000, 28315000}, '{PAUSE, 28315001, 28319999}, '{D5, 28320000, 28555000}, '{D6, 28320000, 28555000}, '{PAUSE, 28555001, 28559999}, '{C5, 28560000, 28795000}, '{C6, 28560000, 28795000}, '{PAUSE, 28795001, 28799999}, '{D5, 28800000, 29155000}, '{D6, 28800000, 29155000}, '{PAUSE, 29155001, 29159999}, '{D5, 29160000, 29275000}, '{D6, 29160000, 29275000}, '{PAUSE, 29275001, 29279999}, '{C5, 29280000, 29515000}, '{C6, 29280000, 29515000}, '{PAUSE, 29515001, 29519999}, '{B4, 29520000, 29755000}, '{B5, 29520000, 29755000}, '{PAUSE, 29755001, 29759999}, '{A5, 29760000, 30160000}, '{PAUSE, 29760001, 31760001}};




module PIEZO_BGMUSIC (
    clk,
    dipswitch_two,
    music_idx,

    piezo
);


    initial begin
        cnt_piezo <= 0;
        cnt_piezo_two <= 0;
        cnt_piezo_three <= 0;

        piezo_bunzu <= 0;

        note_idx = 0;
        note_idx_two = 0;
        note_idx_three = 0;

        cur_tone = 3822;
        cur_start <= 0;
        cur_last <= 2147483647;
    end

    input wire clk;
    input wire dipswitch_two;
    input int music_idx;

    output reg piezo;

    int note_idx, note_idx_two, note_idx_three;
    int cur_tone, cur_start, cur_last;
    int cnt_piezo, cnt_piezo_two, cnt_piezo_three;
    int piezo_bunzu;

    always @(posedge clk) begin
        if (dipswitch_two == 1'b1) begin
            if (music_idx == 0) begin

                if (cur_start <= cnt_piezo && cnt_piezo <= cur_last) begin
                    if (cur_tone == PAUSE) begin
                    end

                    else if (cur_tone == ENDL) begin
                        note_idx = 0;
                        cnt_piezo = -1;
                        // Reset to the first note of the tune
                        cur_tone = ballgame[0].tone;
                        cur_start = ballgame[0].sstart;
                        cur_last = ballgame[0].llast;
                    end

                    else if (piezo_bunzu >= cur_tone/2) begin
                        piezo = !piezo;
                        piezo_bunzu = 0;
                    end

                    else begin
                        piezo_bunzu = piezo_bunzu + 1;
                    end
                end

                else begin
                    note_idx = (note_idx + 1);
                    cur_tone = ballgame[note_idx].tone;
                    cur_start = ballgame[note_idx].sstart;
                    cur_last = ballgame[note_idx].llast;
                end
                
                cnt_piezo = cnt_piezo + 1;
            end

            else if (music_idx == 1) begin
                if (cur_start <= cnt_piezo_two && cnt_piezo_two <= cur_last) begin
                    if (cur_tone == PAUSE) begin
                    end
                    
                    else if (piezo_bunzu >= cur_tone/2) begin
                        piezo = !piezo;
                        piezo_bunzu = 0;
                    end

                    else begin
                        piezo_bunzu = piezo_bunzu + 1;
                    end
                end

                else begin
                    note_idx_two <= (note_idx_two + 1);
                    cur_tone <= dearX[note_idx_two].tone;
                    cur_start <= dearX[note_idx_two].sstart;
                    cur_last <= dearX[note_idx_two].llast;
                end

                cnt_piezo_two = cnt_piezo_two + 1;

            end

            else if (music_idx == 2) begin // 
                if (cur_start <= cnt_piezo_three && cnt_piezo_three <= cur_last) begin

                    if (cur_tone == PAUSE) begin
                    end

                    else if (piezo_bunzu >= cur_tone/2) begin
                        piezo = !piezo;
                        piezo_bunzu = 0;
                    end

                    else begin
                        piezo_bunzu = piezo_bunzu + 1;
                    end
                end

                else begin
                    note_idx_three <= (note_idx_three + 1);
                    cur_tone <= narco[note_idx_three].tone;
                    cur_start <= narco[note_idx_three].sstart;
                    cur_last <= narco[note_idx_three].llast;
                end

                cnt_piezo_three = cnt_piezo_three + 1;
            end
        end

        else begin // dipswitch_two == 1'b0
            note_idx = 0;
            note_idx_two = 0;
            note_idx_three = 0;
            cur_tone = ballgame[0].tone;
            cur_start = ballgame[0].sstart;
            cur_last = ballgame[0].llast;
            cnt_piezo_three = 0;
            cnt_piezo_two = 0;
            cnt_piezo = 0;
        end
    end

endmodule
