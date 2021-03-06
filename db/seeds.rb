User.first_or_create([
                       { email: "test@example.com", password: "1234567", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, username: "test", favorite: nil, profile: nil, avatar: nil, genre_id: nil },
                       { email: "test1@yahoo.co.jp", password: "1234567", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, username: "AK47", favorite: nil, profile: nil, avatar: nil, genre_id: nil }
                     ])
Gear.first_or_create([
                       { gearname: "KATANA-AIR", image: "https://img.digimart.net/prdimg/m/57/09c59874579315cb84be4bed128b6a0f20b729.jpg", maker: "BOSS", category: "ギターアンプ（コンボ）" },
                       { gearname: "MD-200", image: "https://img.digimart.net/prdimg/m/e0/ad87ad82be09f1412b0e35ce71575ae1c3a5bb.jpg", maker: "BOSS", category: "マルチエフェクター" },
                       { gearname: "DD-7 Digital Delay", image: "https://img.digimart.net/prdimg/m/f7/ddcc20b98cb41436fe3d0d7bffa8a37383d8e7.jpg", maker: "BOSS", category: "ディレイ" },
                       { gearname: "DD-3 Digital Delay", image: "https://img.digimart.net/prdimg/m/22/2e6d573b76c0dc0a0f353937c919833366978f.jpg", maker: "BOSS", category: "ディレイ" },
                       { gearname: "SE-70 SUPER EFFECTS PROCESSOR", image: "https://img.digimart.net/prdimg/m/3b/311bbdc021d194dc01381cfc385b403eb2fb5f.jpg", maker: "BOSS", category: "マルチエフェクター" },
                       { gearname: "KATANA-HEAD Guitar Amplifier  KTN-HEAD", image: "https://img.digimart.net/prdimg/m/af/681f37f047f2c3f41da9e6520053a9db5eb466.jpg", maker: "BOSS", category: "ギターアンプ（ヘッド）" },
                       { gearname: "OD-200 Hybrid Drive", image: "https://img.digimart.net/prdimg/m/db/8b7c4fe5e923b4c2cb6bc460d639deeb4bc6f7.jpg", maker: "BOSS", category: "オーバードライブ" },
                       { gearname: "DD-20 Digital Delay \"GIGA DELAY\"", image: "https://img.digimart.net/prdimg/m/05/0598e046d4d35f077ed17c6ec6a278dca7b076.jpg", maker: "BOSS", category: "ディレイ" },
                       { gearname: "DD-500", image: "https://img.digimart.net/prdimg/m/d6/524e1571c885eb6fb196b74b933c2c5c2854b1.jpg", maker: "BOSS", category: "ディレイ" },
                       { gearname: "OS-2 Over Drive / Distortion\" MADE IN TAIWAN\"", image: "https://img.digimart.net/prdimg/m/9a/27f9440bc7f5f6106024574e16f1452f02dc88.jpg", maker: "BOSS", category: "オーバードライブ" },
                       { gearname: "RV-6 Reverb", image: "https://img.digimart.net/prdimg/m/78/a8a798d9cf42f53f974e0b021a08ddb9b451b3.jpg", maker: "BOSS", category: "リバーブ" },
                       { gearname: "TU-3W", image: "https://img.digimart.net/prdimg/m/00/d2f822af40c5413e803b3085c08d8f790062cc.jpg", maker: "BOSS", category: "その他" },
                       { gearname: "TU-80", image: "https://img.digimart.net/prdimg/m/96/259deb9c6aacadb36b04afcfab9bc308a71b68.jpg", maker: "BOSS", category: "その他" },
                       { gearname: "TU-80", image: "https://img.digimart.net/prdimg/m/36/64e4d903cf47d99eac7b8250dc908d0c730a7a.jpg", maker: "BOSS", category: "その他" },
                       { gearname: "TU-12EX", image: "https://img.digimart.net/prdimg/m/18/ef8714662ad907d38502e092d393261f82055c.jpg", maker: "BOSS", category: "その他" },
                       { gearname: "GT-1", image: "https://img.digimart.net/prdimg/m/00/a59cc0bb8b621b77ea350beda3f307e1fa95e6.jpg", maker: "BOSS", category: "その他" },
                       { gearname: "Custom Shop CSP101SL Script Phase 90 with LED", image: "https://img.digimart.net/prdimg/m/5a/0ace35cfdd73f3c9d53e71429b0805de008d05.jpg", maker: "MXR", category: "フェイザー" },
                       { gearname: "MC401 CAE Boost / Line Driver", image: "https://img.digimart.net/prdimg/m/00/88869c6e23c285dc83b4aa104bdfebe79037f5.jpg", maker: "MXR", category: "ブースター" },
                       { gearname: "M104 Distortion+", image: "https://img.digimart.net/prdimg/m/5c/d63e81414973ccef8405d499c46e1f4be7becb.jpg", maker: "MXR", category: "ディストーション" },
                       { gearname: "M-108 10 Band Graphic EQ", image: "https://img.digimart.net/prdimg/m/ea/4cfbca39950eb1d0bf87cb2e3cbc740fefbae7.jpg", maker: "MXR", category: "イコライザー" },
                       { gearname: "DD25 Green Day Dookie Drive", image: "https://img.digimart.net/prdimg/m/cc/001cc93ccd65b69cabad373d2bd9cec4f28894.jpg", maker: "MXR", category: "オーバードライブ" },
                       { gearname: "M102 Dynacomp", image: "https://img.digimart.net/prdimg/m/85/7268fc17c1dc96eba202a1e472fe4eece03267.jpg", maker: "MXR", category: "その他" },
                       { gearname: "M82/Bass Envelope Filter", image: "https://img.digimart.net/prdimg/m/23/f3f776180ce71ffa8e05ae1fa8eb66620b7ed4.jpg", maker: "MXR", category: "その他" },
                       { gearname: "M-133 micro amp", image: "https://img.digimart.net/prdimg/m/d1/e2f41f49ea68d2b7aa4bc7b169ee96c76b8ef1.jpg", maker: "MXR", category: "ブースター" },
                       { gearname: "M-101 Phase 90", image: "https://img.digimart.net/prdimg/m/32/ce171b3a5b82b9f2b8a77f258015c485857e06.jpg", maker: "MXR", category: "フェイザー" },
                       { gearname: "M101 Phase 90 美品", image: "https://img.digimart.net/prdimg/m/c7/adb0ba9c26ee717996df391fc700e1ce032ddb.jpg", maker: "MXR", category: "フェイザー" },
                       { gearname: "M104 Distortion+", image: "https://img.digimart.net/prdimg/m/d8/6c1424dc7ac3abc29ac7a4e6f8a72fda3a8e36.jpg", maker: "MXR", category: "その他" },
                       { gearname: "Shin-Juku Drive / CSP035", image: "https://img.digimart.net/prdimg/m/d9/56e65d602f2458e2b5ffba899985da05820cdd.jpg", maker: "MXR", category: "オーバードライブ" },
                       { gearname: "CSP-001", image: "https://img.digimart.net/prdimg/m/6b/db71677088326096e11ca42cf2dcfef4e052f1.jpg", maker: "MXR", category: "フェイザー" },
                       { gearname: "M234 Analog Chorus", image: "https://img.digimart.net/prdimg/m/21/b8cab808320aafde0dbaa28ac5124ac71746d9.jpg", maker: "MXR", category: "コーラス" },
                       { gearname: "CSP037 RAIJIN Drive", image: "https://img.digimart.net/prdimg/m/51/9d3212380b4f6a57f33ce7dac5d7734bc541fa.jpg", maker: "MXR", category: "オーバードライブ" },
                       { gearname: "M108SE 10-Band Graphic-EQ LIMITED BLK", image: "https://img.digimart.net/prdimg/m/93/b873d256c60cc4db043addf2a094a0ee6ed06b.jpg", maker: "MXR", category: "イコライザー" },
                       { gearname: "M133 Micro Amp", image: "https://img.digimart.net/prdimg/m/10/f228973b8a11b7a4f50aa63e474f46721f1112.jpg", maker: "MXR", category: "プリアンプ" },
                       { gearname: "M102 Dyna Comp Compressor", image: "https://img.digimart.net/prdimg/m/5b/27cd835a8a07392b50273feac3144bfd4ba19f.jpg", maker: "MXR", category: "コンプレッサ／リミッター" },
                       { gearname: "M101 PHASE 90", image: "https://img.digimart.net/prdimg/m/54/be1dcab29afd0e37474cb12ca9619fafe8cbd9.jpg", maker: "MXR", category: "フェイザー" },
                       { gearname: "M80 Bass D.I", image: "https://img.digimart.net/prdimg/m/86/fa91d4bd10b2df5a4291324bb87b24f5c3f70d.jpg", maker: "MXR", category: "ベース用プリアンプ" },
                       { gearname: "polytune3", image: "https://img.digimart.net/prdimg/m/40/b88b73fda091f921baef1fe9cf17ba2ccff475.jpg", maker: "tc electronic", category: "ペダルタイプ" },
                       { gearname: "HALL OF FAME", image: "https://img.digimart.net/prdimg/m/96/83615c3565a5e3c65d94d884a76f3b49f7f442.jpg", maker: "tc electronic", category: "リバーブ" },
                       { gearname: "FLASHBACK MINI DELAY", image: "https://img.digimart.net/prdimg/m/ca/404c83e375fcf70c9cfb30e71d2933dac865c8.jpg", maker: "tc electronic", category: "ディレイ" },
                       { gearname: "RH GIGBAG", image: "https://img.digimart.net/prdimg/m/1a/be6dcffe6ed3182082a0c62ce6f8714ed992d7.jpg", maker: "tc electronic", category: "その他" },
                       { gearname: "AL TER EGO", image: "https://img.digimart.net/prdimg/m/c4/2f3b9e33fde9db7a9b198d3a2bc6ae3225ac69.jpg", maker: "tc electronic", category: "その他" },
                       { gearname: "T2 Reverb", image: "https://img.digimart.net/prdimg/m/64/52cb98457f93c1611301ed1bd24837567a1312.jpg", maker: "tc electronic", category: "その他" },
                       { gearname: "Thunderstorm Flanger", image: "https://img.digimart.net/prdimg/m/75/35625be3b3e8f340b519ef19bf0106c4748df8.jpg", maker: "tc electronic", category: "フランジャー" },
                       { gearname: "SUB ‘N' UP OCTAVER", image: "https://img.digimart.net/prdimg/m/9a/b48a440639541134ce3bb59f3d120f534c6796.jpg", maker: "tc electronic", category: "オクターバー" },
                       { gearname: "CORONA CHORUS", image: "https://img.digimart.net/prdimg/m/30/2e2938369192ff83d2c5363645943b987d8428.jpg", maker: "tc electronic", category: "コーラス" },
                       { gearname: "BRAINWAVES", image: "https://img.digimart.net/prdimg/m/53/26da74bffcda12719341e67d5e0d76001b66b2.jpg", maker: "tc electronic", category: "ハーモナイザー" },
                       { gearname: "Sub'N'Up Octaver", image: "https://img.digimart.net/prdimg/m/85/8978b04e29bd589ba278d11328ca675ba04d10.jpg", maker: "tc electronic", category: "オクターバー" },
                       { gearname: "POLYTUNE 2 MINI", image: "https://img.digimart.net/prdimg/m/bf/2ea6961796296361425ab4e913c0797031a63a.jpg", maker: "tc electronic", category: "ペダルタイプ" },
                       { gearname: "QUINTESSENCE HARMONY", image: "https://img.digimart.net/prdimg/m/24/bf79479679ac57be578adf06e6b0e686139ba1.jpg", maker: "tc electronic", category: "ハーモナイザー" },
                       { gearname: "SENTRY NOISE GATE", image: "https://img.digimart.net/prdimg/m/53/1e9fabdc282b34f35b0561eae46f1caab6f1ee.jpg", maker: "tc electronic", category: "ノイズリダクション／ノイズゲート" },
                       { gearname: "CORONA MINI CHORUS", image: "https://img.digimart.net/prdimg/m/96/a912f5240c603fb00635cb42c104abb7b497a8.jpg", maker: "tc electronic", category: "コーラス" },
                       { gearname: "HYPERGRAVITY COMPRESSOR", image: "https://img.digimart.net/prdimg/m/ea/8695a27d50ead59715880ab4f7dfc21be59a89.jpg", maker: "tc electronic", category: "コンプレッサ／リミッター" },
                       { gearname: "HALL OF FAME 2 REVERB", image: "https://img.digimart.net/prdimg/m/02/eff88d6e919044de760d358fb38ad887cdce0e.jpg", maker: "tc electronic", category: "リバーブ" },
                       { gearname: "SPARK MINI BOOSTER", image: "https://img.digimart.net/prdimg/m/3b/0b45f4a109864de7c6d94be0b99fd205d2d006.jpg", maker: "tc electronic", category: "ブースター" },
                       { gearname: "POLYTUNE 3", image: "https://img.digimart.net/prdimg/m/af/92626747e10f2bad85b061ebc00042aeea4406.jpg", maker: "tc electronic", category: "ペダルタイプ" },
                       { gearname: "KEY9", image: "https://img.digimart.net/prdimg/m/58/6e87762e0ef603dbb110b29740c4991d2567ee.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "B9", image: "https://img.digimart.net/prdimg/m/37/a8beb967dc0fa7e87210c1307025b2d4a82c7d.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "SYNTH9", image: "https://img.digimart.net/prdimg/m/2b/f5c8c6318f703f348988c651d3f0d1ea737506.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "C9", image: "https://img.digimart.net/prdimg/m/e3/449ce25eda0de163fa3228f6c386f8e379d4e3.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "MEL9", image: "https://img.digimart.net/prdimg/m/21/af0560b5e2bc89c5d56f4b8a4573a58c0916e1.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "BATTALION", image: "https://img.digimart.net/prdimg/m/43/7fae5daa1bc10754860706779ad096fde7ffa3.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "SMALL CLONE", image: "https://img.digimart.net/prdimg/m/45/06c8a9f4798bdbd9cbf7074b4df49b82311168.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "BASS BIG MUFF", image: "https://img.digimart.net/prdimg/m/07/bc381a08c2335b4beed5310c4dd42d9ce20969.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "OCEANS11", image: "https://img.digimart.net/prdimg/m/de/29ff3e520e3fea62a65fc9d73a6647ebd89838.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "TRI BIG MUFF PI", image: "https://img.digimart.net/prdimg/m/d2/043d8b71d845c36d659ef730e9b1611507281d.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "NANO BIG MUFF PI", image: "https://img.digimart.net/prdimg/m/1f/47d3aa8271825d4a72bb75192559cafd4df9e5.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "NANO GRN RSA BMUFF", image: "https://img.digimart.net/prdimg/m/da/7838ff4787eaffad0cb16c87611663e2cb9995.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "NANO GRN RSA BMUFF", image: "https://img.digimart.net/prdimg/m/ff/660d8fea21e4840e5e220daf9f64d4f04dcd0a.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "NANO GRN RSA BMUFF", image: "https://img.digimart.net/prdimg/m/eb/164728f0668f21686a723b28a0ac649e3a6f87.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "SOUL FOOD", image: "https://img.digimart.net/prdimg/m/77/2c1d3b0cf939d0cfc376a861d7ce8e592f4fb6.jpg", maker: "Electro-Harmonix", category: "その他" },
                       { gearname: "DR400", image: "https://img.digimart.net/prdimg/m/96/0a42d55c65bb39672a112e536c1e5c6a26319d.jpg", maker: "BEHRINGER", category: "その他" },
                       { gearname: "UM2 U-PHORIA オーディオインターフェース", image: "https://img.digimart.net/prdimg/m/f1/e4fe0f127b29a69093b4acdcbdf8e9b2e51218.jpg", maker: "BEHRINGER", category: "USBタイプ" },
                       { gearname: "MS-101-BU  アナログモノフォニックシンセサイザー", image: "https://img.digimart.net/prdimg/m/51/4e5d502b3e6c3b367456026c54f531c6634599.jpg", maker: "BEHRINGER", category: "その他" },
                       { gearname: "MS-101-RD  アナログモノフォニックシンセサイザー", image: "https://img.digimart.net/prdimg/m/a0/1837dc8797da4bd4bcfcec63874f2d8b81fc1b.jpg", maker: "BEHRINGER", category: "その他" },
                       { gearname: "BLE100", image: "https://img.digimart.net/prdimg/m/df/ebd6bae438270dd1198d3d3edfea3135fb8afa.jpg", maker: "BEHRINGER", category: "その他" },
                       { gearname: "ODYSSEY", image: "https://img.digimart.net/prdimg/m/29/1a49e84b5184bc85de90164ebe0af8af5ecd1a.jpg", maker: "BEHRINGER", category: "アナログシンセ" },
                       { gearname: "MODEL D", image: "https://img.digimart.net/prdimg/m/ae/9dcd111d58d9191eb18c075ed5b3a07961babe.jpg", maker: "BEHRINGER", category: "アナログシンセ" },
                       { gearname: "MS-101-RD", image: "https://img.digimart.net/prdimg/m/88/b5040275021656eaa93ecc69e86cade7b08036.jpg", maker: "BEHRINGER", category: "アナログシンセ" },
                       { gearname: "MS-101-BU", image: "https://img.digimart.net/prdimg/m/49/f731d6f73958cf60440b8fdf0d21eea41a807d.jpg", maker: "BEHRINGER", category: "アナログシンセ" },
                       { gearname: "BASS V-AMP", image: "https://img.digimart.net/prdimg/m/28/2717fdf3eeb0e969a715687ffed00706a0ae5e.jpg", maker: "BEHRINGER", category: "ベース用マルチエフェクター" },
                       { gearname: "UB1002", image: "https://img.digimart.net/prdimg/m/d0/c2cf8af64b06b4869b8c455f16d28daf4220a7.jpg", maker: "BEHRINGER", category: "8ch〜" },
                       { gearname: "C-1", image: "https://img.digimart.net/prdimg/m/c3/32ef7f533164fa13370f1404059e20574a981c.jpg", maker: "BEHRINGER", category: "その他" },
                       { gearname: "X2442USB 2013年製", image: "https://img.digimart.net/prdimg/m/03/e48372fed5940e0d81132d34770b405a23874c.jpg", maker: "BEHRINGER", category: "16ch〜" },
                       { gearname: "UC200 ULTRA CHORUS", image: "https://img.digimart.net/prdimg/m/1d/b2136ddf4c8f47eb4503554300c6e2c27a8092.jpg", maker: "BEHRINGER", category: "コーラス" },
                       { gearname: "Relay G10S", image: "https://img.digimart.net/prdimg/m/04/b643b35dd58d56c9efe1748df81360ead60718.jpg", maker: "LINE 6", category: "楽器用ワイヤレスセット" },
                       { gearname: "Relay G10", image: "https://img.digimart.net/prdimg/m/e0/b600e1fe8b6936ab0fb3ca33dab8eb2783d16c.jpg", maker: "LINE 6", category: "楽器用ワイヤレスセット" },
                       { gearname: "Relay G30", image: "https://img.digimart.net/prdimg/m/44/4f680f0b26037efa717d318007ac5233c79a81.jpg", maker: "LINE 6", category: "楽器用ワイヤレスセット" },
                       { gearname: "Relay G50", image: "https://img.digimart.net/prdimg/m/2e/2dbd555d51c80c066a69ee16fbe0cde51887e3.jpg", maker: "LINE 6", category: "楽器用ワイヤレスセット" },
                       { gearname: "M9 Stompbox Modeler", image: "https://img.digimart.net/prdimg/m/dc/5ad634b3a807068570a72693ccc597e234adea.jpg", maker: "LINE 6", category: "マルチエフェクター" },
                       { gearname: "M5 Stompbox Modeler", image: "https://img.digimart.net/prdimg/m/67/8dbc981e7f530093aa9baa517944d78454a7e4.jpg", maker: "LINE 6", category: "マルチエフェクター" },
                       { gearname: "Helix LT", image: "https://img.digimart.net/prdimg/m/03/3a947d06029026465d9ea86b5dbbb9ce1f35e4.jpg", maker: "LINE 6", category: "ギター用アンプシミュレーター" },
                       { gearname: "HX Stomp", image: "https://img.digimart.net/prdimg/m/49/3ce13cdcf77c733d0136f6a0e1481bbb79095c.jpg", maker: "LINE 6", category: "マルチエフェクター" },
                       { gearname: "DT25 HEAD", image: "https://img.digimart.net/prdimg/m/b3/046c68c795d4f73096fa6ac9d340037d6aa247.jpg", maker: "LINE 6", category: "ギターアンプ（ヘッド）" },
                       { gearname: "EX-1", image: "https://img.digimart.net/prdimg/m/a5/94651383c47223ba4e13d84d75b40999501ee4.jpg", maker: "LINE 6", category: "その他" },
                       { gearname: "HX EFFECTS", image: "https://img.digimart.net/prdimg/m/d9/bd10dca9da1961af373afb498ce7cd428cae3f.jpg", maker: "LINE 6", category: "マルチエフェクター" },
                       { gearname: "VARIAX Standard White", image: "https://img.digimart.net/prdimg/m/e3/7decff4757c52ab8e0cfc9f77fe9bd4e24ac8c.jpg", maker: "LINE 6", category: "その他" },
                       { gearname: "TS MINI", image: "https://img.digimart.net/prdimg/m/6b/a912ef7a09c452ab88614302e515e3e5ef4edf.jpg", maker: "Ibanez", category: "オーバードライブ" },
                       { gearname: "TS9 Tube Screamer", image: "https://img.digimart.net/prdimg/m/b8/9da22716c03d38a946906c5430aa72c51af75d.jpg", maker: "Ibanez", category: "オーバードライブ" },
                       { gearname: "NTS nu TUBESCREAMER", image: "https://img.digimart.net/prdimg/m/e4/172694cda79384c9aab5474e65d1a7b0ddc16c.jpg", maker: "Ibanez", category: "オーバードライブ" },
                       { gearname: "Analog Delay Mini", image: "https://img.digimart.net/prdimg/m/ad/63d04a911e34cd104161c971191734aab27fe5.jpg", maker: "Ibanez", category: "その他" },
                       { gearname: "NTS", image: "https://img.digimart.net/prdimg/m/25/ed097f6f550c1e2194ca3af8af970eba7fa19e.jpg", maker: "Ibanez", category: "オーバードライブ" },
                       { gearname: "TS808 Tube Screamer Overdrive Pro", image: "https://img.digimart.net/prdimg/m/fe/0ed1109b76e1464e6a3b6605b53dde6a186dfe.jpg", maker: "Ibanez", category: "オーバードライブ" },
                       { gearname: "TS10 TUBE SCREAMER CLASSIC", image: "https://img.digimart.net/prdimg/m/29/19afed8feafe25c31cade31081f3130e874ff6.jpg", maker: "Ibanez", category: "オーバードライブ" },
                       { gearname: "TS-808 40TH TUBE SCREAMER Overdrive Pro", image: "https://img.digimart.net/prdimg/m/26/4eb4b23da60f5a06ea6da731d6a16bbd01448c.jpg", maker: "Ibanez", category: "オーバードライブ" },
                       { gearname: "TS808HW", image: "https://img.digimart.net/prdimg/m/43/98f0e9906dcedc963f44ab849595c47e8b2290.jpg", maker: "Ibanez", category: "オーバードライブ" },
                       { gearname: "TS-9", image: "https://img.digimart.net/prdimg/m/c9/5480ab9a82bb7c2f3e2717d3d750b85b9543ac.jpg", maker: "Ibanez", category: "オーバードライブ" }
                     ])
Review.first_or_create([
                         { title: "Bluetoothとワイヤレスシステムを唯一搭載している", detail: "タイトルの通り、Bluetoothスピーカーとワイヤレスシステムを搭載している現在のところ唯一のアンプだと思いましたので購入しました。\r\n電源コードひとつでギター演奏と外部音源を鳴らせるのは部屋がすっきりして良いです。\r\nフロントパネルの見た目は好きではないので、フロント部分を下方向に向け、コントロールツマミ部分を正面に向け、アルミラックの上段に置いて使用しています。", cost_performance: 3, sound: 4, durability: 2, design: 1, satisfaction_level: 5, gear_id: 1, user_id: 1 },
                         { title: "モジュレーションthe BESTって感じの製品です！", detail: "「MD-200 Modulation」は、フラッグシップ・モデルである「MD-500」のアルゴリズムを継承した、高品位なモジュレーション・ペダル。「CE-1 CHORUS」のモデリングやVIBRATO、SLICERを始めとする12種類のモードを搭載し、多彩なモジュレーション・エフェクトを生み出すことが可能。コントロールもシンプルで、RATE（フットスイッチでのタップ入力にも対応）やDEPTH、E.LEVELなどに加え、モードによって操作パラメータが変化するPARAMノブを3つ搭載。各モードに応じたパラメータを直感的に操作し、サウンドメイクすることができる。さらに、インサート機能も搭載しており、お気に入りのペダルをインサート接続すると、MD-200によるエフェクトのポジションをプリ／ポストから選択可能だ。", cost_performance: 4, sound: 5, durability: 3, design: 2, satisfaction_level: 4, gear_id: 2, user_id: 1 },
                         { title: "何度も言ってますが、とにかく高音質！", detail: "とにかく驚きの高音質です!!\r\n\r\n高音質というのは、つまり高音域の劣化がないことを指し、\r\n\r\n音が全く奥に引っ込まないんです！\r\n\r\nアタックもボヤけずシャっと立ち上がるので、付点８分とかのわかりやすいディレイにしたときにトコトコ具合の綺麗さは本当にすごい！\r\n\r\nわたしはDD-3を持ってるのでBOSSのDDシリーズの音はなんとなく知ってるつもりになってましたが、\r\n\r\nいやもう、完全に別モノやで!!", cost_performance: 3, sound: 5, durability: 3, design: 4, satisfaction_level: 4, gear_id: 3, user_id: 1 },
                         { title: "中間みたいな", detail: "アナログとデジタルの中間の様な感じです。アナログほどボヤけた音でなく、デジタルの様にスッキリハッキリした訳ではなく、どっち付かずとも言えなくないですが、それがこの商品の良いところだと思います。はじめにこの商品に出会っていれば…何故か敬遠して試さなくて、色々なディレイを購入したけど、ようやくディレイ探しに抜け出せました。", cost_performance: 4, sound: 4, durability: 4, design: 3, satisfaction_level: 5, gear_id: 4, user_id: 1 },
                         { title: "長期に渡り売れ続けたマルチエフェクターの名器", detail: "SE-70には35種類のエフェクターが45種のアルゴリズム（予め用意されたエフェクターの組み合わせ）で組まれている。当時BOSSで出していたコンパクトはほぼすべて入っていたので、少々高くてもかなり満足し、スイッチを入れる度に新しい感動を得た覚えがある。\r\n\r\n最初に1台購入しそれから宅録も濃いものを作るようになり、数年後中古で安くなっていたものをもう1台購入するほど惚れ込んだ機種。\r\n\r\n現在ならGT-100あたりで済みそうだが、この機種は機材としてよい音を出してくれただけでなく、エフェクター知識や音の変化を学ぶ機会を私に与えてくれた。", cost_performance: 2, sound: 4, durability: 4, design: 2, satisfaction_level: 3, gear_id: 5, user_id: 1 },
                         { title: "すごく使い勝手がいいです", detail: "最初はPCとの接続設定などに手こづりましたが、説明書どうりするとあとは簡単です。新しいバージョンのWindows、Macでも対応してるので安心です。マルチとヘッドアンプのいいとこ取りのような感じで別売りのフットペダルなど使うと万能だと思います。\r\nある程度の音は出せます。それ以上はPCで設定すれば大抵の音が見つかります。\r\n\r\nあと、スピーカーケーブルを外すとヘッド本体だけでもアンプとして使えます。音はそれほど期待できません、確認程度です。", cost_performance: 3, sound: 4, durability: 2, design: 4, satisfaction_level: 3, gear_id: 6, user_id: 1 },
                         { title: "BOSSから、新たなツインペダルが発表!", detail: "12タイプの歪みを選んで使うことのできるペダルですね。\r\n選べるのはOVERDRIVE、BLUES、SCREAM、CNTR OD、X-DRIVE、DIST、X-DIST、STACK DRIVE、FAT　DIST、BROWN、X-METAL、FUZZ。\r\n各歪みはLEVEL、DRIVE、LOW、MIDDLE、HIGHの3バンドEQを搭載。そして各歪みごとに異なるPARAMコントロールを搭載しています。\r\n\r\nさらにPRE/POSTブーストに加え、ノイズゲートも搭載しています。\r\nフットスイッチでON/OFFとブーストおよびメモリの選択が可能おｔなっています。", cost_performance: 2, sound: 4, durability: 2, design: 2, satisfaction_level: 5, gear_id: 7, user_id: 1 },
                         { title: "機能豊富なディレイとして上出来です。", detail: "まずプリセットをメモリーして、\r\n右側のペダルで選択できること。これが一番秀逸。\r\n曲間でディレイタイムが変わることや、\r\n使いたい効果が違う場合にも困ることがありません。\r\n\r\nRE-201のモデリングなども入っていたり、\r\nSOS機能で23秒までのルーパー・オーバーダブが可能。\r\n消費電力も200ｍAとそこそこです。\r\nアルカリ単三6本で7時間ほど持つらしい。\r\n\r\nアンプのセンドリターンなどに入れれるように、\r\n入出力は変更できるようになってます。\r\nドライ・ウエットを分けることも可能で、\r\n色々なシーンに使えると思います。", cost_performance: 5, sound: 4, durability: 4, design: 3, satisfaction_level: 5, gear_id: 8, user_id: 1 },
                         { title: "鈴が鳴るような美しいディレイ音と、脅威的な即興演奏性", detail: "脅威的な操作性の高さからくる即興演奏性が突出しています。\r\nもちろんフロアに置くのも良いですが、あえてテーブルに置くことで最高の操作性が実現します。\r\n音は鈴が鳴るような解像感の高い音で、文句無しの美しいディレイ音です。\r\nステレオ接続で出力しても、モノラルっぽさを残しているモードもありますし、\r\nステレオ感が強く左右に音が派手に分かれるモードもあります。\r\nこれはヴィンテージの名機の機材を多数製造してきたBOSS（Roland）の考えなのだと思います。", cost_performance: 5, sound: 5, durability: 4, design: 3, satisfaction_level: 3, gear_id: 9, user_id: 1 },
                         { title: "ゲインブースターとしておすすめ", detail: "主にテレキャスターでゲインブースターとして使用しています。\r\nこのエフェクターの良い所はTONE、DRIVE、COLOR全て効きが良いことです。単体だと使えるポイントが限らますが…\r\nブースターとして使う場合、荒い歪みにしたいならCOLORをDS寄りに、細かい歪みならOD寄りと使い分けています。TONEもLOW側を中心に幅広く使えます。", cost_performance: 4, sound: 1, durability: 4, design: 4, satisfaction_level: 3, gear_id: 10, user_id: 1 },
                         { title: "私にはとってはBOSSのリバーブはこれで完結！", detail: "メインで使っています。\r\n\r\n機能の割に価格もそれなりに安く良いです。\r\nモジュレーションリバーブや、流行りのシマ―リバーブも搭載されていて、このような変化球系リバーブは調整が難しいのですが、rv-6は繊細な操作が可能でとにかく分かりますので、\r\nここぞ！って時のリバーブに使いたい方や薄掛けでニュアンスを追求する方にはベストマッチかと思います。\r\n\r\nやはり全体的にデジタルくさいのは皆様も言われていますが、最低限音作りが出来る中級者の中からすれば簡単に好みの音にもっていけます。\r\n\r\nプレートやルームが、逆にデジタル感がいい感じにマッチします。\r\n\r\nスプリングやホールなどは、レキシコンのデジテックリバーブには流石に勝てません。", cost_performance: 4, sound: 3, durability: 3, design: 5, satisfaction_level: 2, gear_id: 11, user_id: 1 },
                         { title: "これが欲しかった！", detail: "バッファー＋チューナーに惹かれて、ベース用に35年ぶりの買い替え。\r\nチューナーの精度は高く速い。デフォルトのセンターでグリーンが光るモードだと、アッという間に終わる。\r\nLEDの光量も良く考えられており、ステージの暗転中でもハッキリ視認。\r\nベースで使用。バッファーの音質は、先の投稿の様に、単独で聞くと低音がタイトになる印象だが、バンドの中で聞くと、全体に音質がクリアになり、低音も良く響く。", cost_performance: 4, sound: 1, durability: 5, design: 3, satisfaction_level: 3, gear_id: 12, user_id: 1 },
                         { title: "アコギ感覚", detail: "トランスミッターをギターにさせば即電源入り、トランスミッターを抜いてほっとけば勝手にスリープに落ちる\r\nもっと気楽に使うならトランスミッター刺したままでもギタースタンドに立てておけばスリープに入り、ギターを動かしたら電源オン\r\nエレキギターがアコギ並みに手軽に音が出せるのは素晴らしい\r\nフットスイッチ類が全くないので曲中に音を変えられない分マイナス1", cost_performance: 4, sound: 1, durability: 3, design: 3, satisfaction_level: 4, gear_id: 1, user_id: 2 },
                         { title: "満足です", detail: "現在バンドにキーボードがいなく、ギター1本のため、\r\nDD-200の中のSHIMMERモードを使って、まるで、ギターとストリングスが同時になっているような\r\n音が好きで良く使ってます。ギターはストラト（メキシコ）です、これとJC120で\r\nすごい音のめぐりの空間をスタジオ内で演出しています。\r\nバンドメンバーも大変好評でした。自分も弾いてて、すごく気持ちいいです。", cost_performance: 3, sound: 4, durability: 5, design: 4, satisfaction_level: 3, gear_id: 2, user_id: 2 },
                         { title: "まさにスタンダード！", detail: "全てにおいて素晴らしい！\r\nアナログディレイも実用レベルで素晴らしく\r\nデジタルディレイ コーラス 簡易ルーパー 等１台で四役以上\r\nプレイヤーのタッチや感覚 アンサブルを邪魔しません\r\n外部FS-4U等のフットスイッチを接続すると\r\ntap入力も更に使いやすくなり◎", cost_performance: 0, sound: 0, durability: 0, design: 0, satisfaction_level: 0, gear_id: 3, user_id: 2 },
                         { title: "他のデジタルディレイと比べて。", detail: "如何にもなデジタルディレイなのですが、他の機種と比べると若干音が丸いというか太い感じがあります。\r\n簡単に調べると、どうやらビットレートの違いのようで、\r\nBOSS DD-500は32bit\r\nLINE6 DL4は24bit、\r\nBOSS DD-7は16bit\r\n（※DD-7は通販サイト等参照）\r\nとなってますが本機DD-3は12bitと、DD-7より落ちて、出力される音も7KHz以上は減衰しているらしく、恐らくこれが音の太さや丸さの理由だと思われます。", cost_performance: 5, sound: 5, durability: 2, design: 3, satisfaction_level: 3, gear_id: 4, user_id: 2 },
                         { title: "バージョンアップ", detail: "クランチ気味のマーシャルに刺し\r\n惚れました。\r\nMDP系のエフェクターもですし、リヴァーブやフランジャー等の空間系も良くなったプログラムが多いです。空間系は控えめにして使う方がいいですね。\r\nGTシリーズはGT-10から全て使ってきましたが\r\n一段と音質がアップしていますね。", cost_performance: 5, sound: 4, durability: 3, design: 2, satisfaction_level: 4, gear_id: 5, user_id: 2 },
                         { title: "ひずみがいい！", detail: "歪の音が最高です。特に巻弦の音は強く歪ませても１本太い芯が有り、潰れる事無くリフが気持ち良いです。\r\n他に mini Rectifier　Laney IRT-STUDIO\r\nTubeMeister Deluxe 40も所有していますが歪の音は文句無しに飛び抜けています。", cost_performance: 3, sound: 3, durability: 4, design: 4, satisfaction_level: 1, gear_id: 6, user_id: 2 },
                         { title: "比較対象はgt-1000", detail: "素晴らしくコスパの良い、今までに無い歪み系マルチペダル。\r\n自分はBOSSの歴代GTユーザーです。OD200 のスペックはGT1000の歪みエフェクトとほぼ同じ内容ですが、それでも期待を込めて購入しました。結果は期待以上！GT1000超えでした。簡単な話、クオリティが MEシリーズ GT10 GT100 GT1000 OD200 の順に高い。レンジが広いと言うか、音の分離が良いと言うか、GT1000のエフェクトと比較しても音の傾向は同じですが、OD200の方が気持ちの良い音で、各つまみの効きも良いです。GTでこもり気味だったファズやメタル系はかなり明らかな違いがあるように感じます", cost_performance: 4, sound: 3, durability: 4, design: 4, satisfaction_level: 5, gear_id: 7, user_id: 2 },
                         { title: "クリアな音質を実現！", detail: "フロア・タイプのエフェクターながら、ラック式ディレイにも匹敵するクリアな音質と最長23秒もの超ロング・ディレイを実現、全11種類のディレイ・タイプ（STANDARD、DUAL、PAN、ANALOG、TAPE、REVERSE、オシレーター効果を加えるTWIST、ディレイ音に空間的な広がりを加えるSMOOTH、LFOに変化をもたらすMODULATE、他）を搭載したたツイン・ペダル式の多機能デジタル・ディレイです。", cost_performance: 4, sound: 4, durability: 3, design: 2, satisfaction_level: 5, gear_id: 8, user_id: 2 },
                         { title: "完璧です。", detail: "他社製品と比べても価格設定は低めで、それでいてとても使いやすいです。\r\nプリセットの組める数、音質、出来ること、全てにおいて完璧だと思いました。使いやすさは初めての人でも容易に使えるレベルでとても扱いやすいです。", cost_performance: 4, sound: 3, durability: 4, design: 3, satisfaction_level: 2, gear_id: 9, user_id: 2 },
                         { title: "いいと思います", detail: "ノイズが大きく感じるのはアウトプットが大きく出るからだと思います。\r\n少しレベルを絞ればそれほど気になりません。\r\n\r\n癖が少なく、使い易く感じます。\r\nカラーとトーンを真ん中付近で、お好みで調整すると、アンプライクで素敵な歪が作れます。", cost_performance: 3, sound: 3, durability: 4, design: 4, satisfaction_level: 2, gear_id: 10, user_id: 2 },
                         { title: "素敵なサウンドで大満足！", detail: "リバーブはアンプについてるで十分かなと思ってましたが、試しに購入してみました。\r\n色々な音が作れて驚きです。\r\nこんなことなら、もっと早く買うべきでした。\r\n素敵なサウンドに大満足！", cost_performance: 2, sound: 3, durability: 4, design: 4, satisfaction_level: 3, gear_id: 11, user_id: 2 },
                         { title: "いいね！", detail: "安心なエフェクター｡ボスコン壊れる気がしない!\r\n初期ロットではINSPECTED IN JAPANで監修だけ日本｡ネジも普通の黒ですが2017年から完全国産品でMADE IN JAPANのラベルに変わりネジもいわゆる銀ネジです☆", cost_performance: 5, sound: 2, durability: 4, design: 3, satisfaction_level: 3, gear_id: 12, user_id: 2 }
                       ])
Like.first_or_create([
                       { user_id: 1, review_id: 2 },
                       { user_id: 1, review_id: 14 },
                       { user_id: 1, review_id: 13 },
                       { user_id: 1, review_id: 1 },
                       { user_id: 1, review_id: 3 },
                       { user_id: 1, review_id: 15 },
                       { user_id: 1, review_id: 4 },
                       { user_id: 1, review_id: 16 },
                       { user_id: 1, review_id: 5 },
                       { user_id: 1, review_id: 17 },
                       { user_id: 1, review_id: 6 },
                       { user_id: 1, review_id: 18 },
                       { user_id: 1, review_id: 7 },
                       { user_id: 1, review_id: 19 },
                       { user_id: 1, review_id: 20 },
                       { user_id: 1, review_id: 8 },
                       { user_id: 1, review_id: 9 },
                       { user_id: 1, review_id: 21 },
                       { user_id: 1, review_id: 10 },
                       { user_id: 1, review_id: 22 },
                       { user_id: 1, review_id: 11 },
                       { user_id: 1, review_id: 23 },
                       { user_id: 1, review_id: 12 },
                       { user_id: 1, review_id: 24 },
                       { user_id: 2, review_id: 1 },
                       { user_id: 2, review_id: 13 },
                       { user_id: 2, review_id: 2 },
                       { user_id: 2, review_id: 14 },
                       { user_id: 2, review_id: 3 },
                       { user_id: 2, review_id: 15 },
                       { user_id: 2, review_id: 4 },
                       { user_id: 2, review_id: 16 },
                       { user_id: 2, review_id: 5 },
                       { user_id: 2, review_id: 17 },
                       { user_id: 2, review_id: 6 },
                       { user_id: 2, review_id: 18 },
                       { user_id: 2, review_id: 7 },
                       { user_id: 2, review_id: 19 },
                       { user_id: 2, review_id: 8 },
                       { user_id: 2, review_id: 20 },
                       { user_id: 2, review_id: 9 },
                       { user_id: 2, review_id: 21 },
                       { user_id: 2, review_id: 10 },
                       { user_id: 2, review_id: 22 },
                       { user_id: 2, review_id: 11 },
                       { user_id: 2, review_id: 23 },
                       { user_id: 2, review_id: 12 },
                       { user_id: 2, review_id: 24 }
                     ])
