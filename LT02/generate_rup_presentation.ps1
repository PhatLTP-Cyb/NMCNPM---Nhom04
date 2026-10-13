$F = "c:\Documents\3. Thirdyear\NMCNPM\RUP_Model_Presentation.pptx"

# ========== SLIDE 1: Cover ==========
officecli add $F / --type slide --prop layout=blank --prop background=065A82
officecli add $F "/slide[1]" --type shape --prop name=Title --prop text="Mo Hinh Phat Trien Phan Mem RUP" --prop x=2cm --prop y=5.5cm --prop width=29.87cm --prop height=3cm --prop font=Georgia --prop size=44 --prop bold=true --prop color=FFFFFF --prop align=center
officecli add $F "/slide[1]" --type shape --prop name=Subtitle --prop text="Rational Unified Process" --prop x=2cm --prop y=8.5cm --prop width=29.87cm --prop height=1.5cm --prop font=Calibri --prop size=22 --prop color=1C7293 --prop align=center
officecli add $F "/slide[1]" --type shape --prop name=Students --prop "text=24120091 - Lam Duy Minh  |  24120089 - Ta Quang Manh\n24120070 - Vuong Huu Khang  |  24120115 - Le Tan Phat" --prop x=2cm --prop y=11cm --prop width=29.87cm --prop height=2cm --prop font=Calibri --prop size=16 --prop color=FFFFFF --prop align=center
officecli add $F "/slide[1]" --type shape --prop name=Instructor --prop "text=GV: ThS. Ngo Ngoc Dang Khoa  |  TG: ThS. Ho Tuan Thanh" --prop x=2cm --prop y=13.5cm --prop width=29.87cm --prop height=1cm --prop font=Calibri --prop size=14 --prop color=6B8FAA --prop align=center
officecli add $F "/slide[1]" --type shape --prop name=TopBand --prop preset=rect --prop fill=21295C --prop x=0cm --prop y=0cm --prop width=33.87cm --prop height=0.5cm

# ========== SLIDE 2: Tong Quan ==========
officecli add $F / --type slide --prop layout=blank --prop background=FFFFFF
officecli add $F "/slide[2]" --type shape --prop name=Title --prop text="RUP La Gi?" --prop x=1.5cm --prop y=1cm --prop width=30cm --prop height=2cm --prop font=Georgia --prop size=36 --prop bold=true --prop color=065A82
officecli add $F "/slide[2]" --type shape --prop name=Body --prop "text=RUP (Rational Unified Process) la quy trinh phat trien phan mem lap va tang dan, dua tren kien truc huong doi tuong va dieu khien boi Use-Case." --prop x=1.5cm --prop y=3.5cm --prop width=30cm --prop height=2.5cm --prop font=Calibri --prop size=20 --prop color=2B3A4E
# Card 1
officecli add $F "/slide[2]" --type shape --prop name=Card1Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=1.5cm --prop y=7cm --prop width=9.5cm --prop height=5cm
officecli add $F "/slide[2]" --type shape --prop name=Card1Title --prop text="Nam 1998" --prop x=1.5cm --prop y=7.5cm --prop width=9.5cm --prop height=1.5cm --prop font=Georgia --prop size=24 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[2]" --type shape --prop name=Card1Body --prop "text=Rational Software phat hanh phien ban 1.0" --prop x=1.5cm --prop y=9cm --prop width=9.5cm --prop height=2.5cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
# Card 2
officecli add $F "/slide[2]" --type shape --prop name=Card2Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=12.2cm --prop y=7cm --prop width=9.5cm --prop height=5cm
officecli add $F "/slide[2]" --type shape --prop name=Card2Title --prop "text=Three Amigos" --prop x=12.2cm --prop y=7.5cm --prop width=9.5cm --prop height=1.5cm --prop font=Georgia --prop size=24 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[2]" --type shape --prop name=Card2Body --prop "text=Grady Booch, James Rumbaugh, Ivar Jacobson" --prop x=12.2cm --prop y=9cm --prop width=9.5cm --prop height=2.5cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
# Card 3
officecli add $F "/slide[2]" --type shape --prop name=Card3Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=22.87cm --prop y=7cm --prop width=9.5cm --prop height=5cm
officecli add $F "/slide[2]" --type shape --prop name=Card3Title --prop text="IBM Rational" --prop x=22.87cm --prop y=7.5cm --prop width=9.5cm --prop height=1.5cm --prop font=Georgia --prop size=24 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[2]" --type shape --prop name=Card3Body --prop "text=IBM mua lai Rational Software nam 2003" --prop x=22.87cm --prop y=9cm --prop width=9.5cm --prop height=2.5cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[2]" --type shape --prop name=BottomBand --prop preset=rect --prop fill=065A82 --prop x=0cm --prop y=18.55cm --prop width=33.87cm --prop height=0.5cm
officecli add $F "/slide[2]" --type notes --prop "text=RUP duoc de xuat boi Rational Software, 3 tac gia chinh la Three Amigos"

# ========== SLIDE 3: Cau Truc 2 Chieu ==========
officecli add $F / --type slide --prop layout=blank --prop background=FFFFFF
officecli add $F "/slide[3]" --type shape --prop name=Title --prop "text=Cau Truc 2 Chieu Cua RUP" --prop x=1.5cm --prop y=1cm --prop width=30cm --prop height=2cm --prop font=Georgia --prop size=36 --prop bold=true --prop color=065A82
officecli add $F "/slide[3]" --type table --prop rows=10 --prop cols=5 --prop x=1.5cm --prop y=3.5cm --prop width=31cm --prop height=14cm --prop firstRow=true --prop headerFill=065A82
officecli set $F "/slide[3]/table[1]/tr[1]" --prop c1="Discipline" --prop c2="Inception" --prop c3="Elaboration" --prop c4="Construction" --prop c5="Transition"
officecli set $F "/slide[3]/table[1]/tr[2]" --prop c1="Business Modeling" --prop c2="Cao" --prop c3="Trung binh" --prop c4="Thap" --prop c5="--"
officecli set $F "/slide[3]/table[1]/tr[3]" --prop c1="Requirements" --prop c2="Cao" --prop c3="Cao" --prop c4="Thap" --prop c5="--"
officecli set $F "/slide[3]/table[1]/tr[4]" --prop "c1=Analysis & Design" --prop c2="Trung binh" --prop c3="Cao" --prop c4="Trung binh" --prop c5="Thap"
officecli set $F "/slide[3]/table[1]/tr[5]" --prop c1="Implementation" --prop c2="Thap" --prop c3="Trung binh" --prop c4="Cao" --prop c5="Thap"
officecli set $F "/slide[3]/table[1]/tr[6]" --prop c1="Test" --prop c2="Thap" --prop c3="Trung binh" --prop c4="Cao" --prop c5="Cao"
officecli set $F "/slide[3]/table[1]/tr[7]" --prop c1="Deployment" --prop c2="--" --prop c3="--" --prop c4="Thap" --prop c5="Cao"
officecli set $F "/slide[3]/table[1]/tr[8]" --prop "c1=Config & Change Mgmt" --prop c2="Thap" --prop c3="Trung binh" --prop c4="Trung binh" --prop c5="Trung binh"
officecli set $F "/slide[3]/table[1]/tr[9]" --prop "c1=Project Management" --prop c2="Cao" --prop c3="Cao" --prop c4="Trung binh" --prop c5="Trung binh"
officecli set $F "/slide[3]/table[1]/tr[10]" --prop c1="Environment" --prop c2="Trung binh" --prop c3="Cao" --prop c4="Thap" --prop c5="Thap"
officecli add $F "/slide[3]" --type shape --prop name=BottomBand --prop preset=rect --prop fill=065A82 --prop x=0cm --prop y=18.55cm --prop width=33.87cm --prop height=0.5cm
officecli add $F "/slide[3]" --type notes --prop "text=Bang the hien muc do no luc cua tung discipline qua tung pha"

# ========== SLIDE 4: 6 Best Practices ==========
officecli add $F / --type slide --prop layout=blank --prop background=FFFFFF
officecli add $F "/slide[4]" --type shape --prop name=Title --prop "text=6 Nguyen Tac Cot Loi" --prop x=1.5cm --prop y=1cm --prop width=30cm --prop height=2cm --prop font=Georgia --prop size=36 --prop bold=true --prop color=065A82
# Row 1
officecli add $F "/slide[4]" --type shape --prop name=P1Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=1.5cm --prop y=4cm --prop width=9.5cm --prop height=3.5cm
officecli add $F "/slide[4]" --type shape --prop name=P1Num --prop text="01" --prop x=1.5cm --prop y=4.2cm --prop width=9.5cm --prop height=1.2cm --prop font=Georgia --prop size=24 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[4]" --type shape --prop name=P1Text --prop "text=Phat trien lap\n(Iterative Development)" --prop x=1.5cm --prop y=5.4cm --prop width=9.5cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[4]" --type shape --prop name=P2Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=12.2cm --prop y=4cm --prop width=9.5cm --prop height=3.5cm
officecli add $F "/slide[4]" --type shape --prop name=P2Num --prop text="02" --prop x=12.2cm --prop y=4.2cm --prop width=9.5cm --prop height=1.2cm --prop font=Georgia --prop size=24 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[4]" --type shape --prop name=P2Text --prop "text=Quan ly yeu cau\n(Manage Requirements)" --prop x=12.2cm --prop y=5.4cm --prop width=9.5cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[4]" --type shape --prop name=P3Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=22.87cm --prop y=4cm --prop width=9.5cm --prop height=3.5cm
officecli add $F "/slide[4]" --type shape --prop name=P3Num --prop text="03" --prop x=22.87cm --prop y=4.2cm --prop width=9.5cm --prop height=1.2cm --prop font=Georgia --prop size=24 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[4]" --type shape --prop name=P3Text --prop "text=Kien truc component\n(Component-based)" --prop x=22.87cm --prop y=5.4cm --prop width=9.5cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
# Row 2
officecli add $F "/slide[4]" --type shape --prop name=P4Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=1.5cm --prop y=9cm --prop width=9.5cm --prop height=3.5cm
officecli add $F "/slide[4]" --type shape --prop name=P4Num --prop text="04" --prop x=1.5cm --prop y=9.2cm --prop width=9.5cm --prop height=1.2cm --prop font=Georgia --prop size=24 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[4]" --type shape --prop name=P4Text --prop "text=Mo hinh hoa truc quan\n(Visual Modeling - UML)" --prop x=1.5cm --prop y=10.4cm --prop width=9.5cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[4]" --type shape --prop name=P5Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=12.2cm --prop y=9cm --prop width=9.5cm --prop height=3.5cm
officecli add $F "/slide[4]" --type shape --prop name=P5Num --prop text="05" --prop x=12.2cm --prop y=9.2cm --prop width=9.5cm --prop height=1.2cm --prop font=Georgia --prop size=24 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[4]" --type shape --prop name=P5Text --prop "text=Kiem tra chat luong\n(Continuously Verify Quality)" --prop x=12.2cm --prop y=10.4cm --prop width=9.5cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[4]" --type shape --prop name=P6Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=22.87cm --prop y=9cm --prop width=9.5cm --prop height=3.5cm
officecli add $F "/slide[4]" --type shape --prop name=P6Num --prop text="06" --prop x=22.87cm --prop y=9.2cm --prop width=9.5cm --prop height=1.2cm --prop font=Georgia --prop size=24 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[4]" --type shape --prop name=P6Text --prop "text=Quan ly thay doi\n(Control Changes)" --prop x=22.87cm --prop y=10.4cm --prop width=9.5cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[4]" --type shape --prop name=BottomBand --prop preset=rect --prop fill=065A82 --prop x=0cm --prop y=18.55cm --prop width=33.87cm --prop height=0.5cm

# ========== SLIDE 5: Divider - 4 Pha ==========
officecli add $F / --type slide --prop layout=blank --prop background=065A82
officecli add $F "/slide[5]" --type shape --prop name=BigNum --prop text="4" --prop x=1cm --prop y=2cm --prop width=10cm --prop height=10cm --prop font=Georgia --prop size=120 --prop bold=true --prop color=FFFFFF --prop opacity=0.15 --prop fill=none
officecli add $F "/slide[5]" --type shape --prop name=Title --prop "text=4 Pha Cua RUP" --prop x=2cm --prop y=6cm --prop width=29.87cm --prop height=3cm --prop font=Georgia --prop size=44 --prop bold=true --prop color=FFFFFF --prop align=center
officecli add $F "/slide[5]" --type shape --prop name=Sub --prop "text=Inception  -  Elaboration  -  Construction  -  Transition" --prop x=2cm --prop y=10cm --prop width=29.87cm --prop height=1.5cm --prop font=Calibri --prop size=22 --prop color=1C7293 --prop align=center

# ========== SLIDE 6: Inception ==========
officecli add $F / --type slide --prop layout=blank --prop background=FFFFFF
officecli add $F "/slide[6]" --type shape --prop name=Title --prop "text=Pha 1: Inception (Khoi Dau)" --prop x=1.5cm --prop y=1cm --prop width=30cm --prop height=2cm --prop font=Georgia --prop size=36 --prop bold=true --prop color=065A82
officecli add $F "/slide[6]" --type shape --prop name=What --prop "text=WHAT: Xac dinh tam nhin, pham vi, Business Case, Use-Case chinh (10-20%), danh gia rui ro, uoc luong chi phi" --prop x=1.5cm --prop y=3.5cm --prop width=20cm --prop height=2.5cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[6]" --type shape --prop name=Who --prop "text=WHO: Project Manager, Business Analyst, System Analyst, Architect, Stakeholders" --prop x=1.5cm --prop y=6.5cm --prop width=20cm --prop height=1.5cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[6]" --type shape --prop name=IO --prop "text=INPUT: Y tuong kinh doanh, nghien cuu thi truong\nOUTPUT: Vision Document, Use-Case Model, Business Case, Risk List" --prop x=1.5cm --prop y=8.5cm --prop width=20cm --prop height=3cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[6]" --type shape --prop name=MsBg --prop preset=roundRect --prop fill=065A82 --prop line=none --prop x=23cm --prop y=4cm --prop width=9.37cm --prop height=7cm
officecli add $F "/slide[6]" --type shape --prop name=MsTitle --prop text="Milestone" --prop x=23cm --prop y=4.5cm --prop width=9.37cm --prop height=1.5cm --prop font=Georgia --prop size=22 --prop bold=true --prop color=FFFFFF --prop align=center
officecli add $F "/slide[6]" --type shape --prop name=MsBody --prop "text=Lifecycle Objective (LCO)\n\nGo / No-Go" --prop x=23cm --prop y=6.5cm --prop width=9.37cm --prop height=4cm --prop font=Calibri --prop size=18 --prop color=FFFFFF --prop align=center
officecli add $F "/slide[6]" --type shape --prop name=BottomBand --prop preset=rect --prop fill=065A82 --prop x=0cm --prop y=18.55cm --prop width=33.87cm --prop height=0.5cm

# ========== SLIDE 7: Elaboration ==========
officecli add $F / --type slide --prop layout=blank --prop background=FFFFFF
officecli add $F "/slide[7]" --type shape --prop name=Title --prop "text=Pha 2: Elaboration (Chi Tiet Hoa)" --prop x=1.5cm --prop y=1cm --prop width=30cm --prop height=2cm --prop font=Georgia --prop size=36 --prop bold=true --prop color=065A82
officecli add $F "/slide[7]" --type shape --prop name=What --prop "text=WHAT: Hoan thien 80% use-case, thiet ke kien truc phan mem, xay dung Architectural Prototype, giam thieu rui ro chinh" --prop x=1.5cm --prop y=3.5cm --prop width=20cm --prop height=2.5cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[7]" --type shape --prop name=Who --prop "text=WHO: Software Architect, System Analyst, DB Designer, UI/UX Designer, Senior Developer" --prop x=1.5cm --prop y=6.5cm --prop width=20cm --prop height=1.5cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[7]" --type shape --prop name=IO --prop "text=INPUT: Vision Document, Use-Case Model so bo, Risk List\nOUTPUT: SAD, Design Model, Data Model, Architectural Prototype" --prop x=1.5cm --prop y=8.5cm --prop width=20cm --prop height=3cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[7]" --type shape --prop name=MsBg --prop preset=roundRect --prop fill=065A82 --prop line=none --prop x=23cm --prop y=4cm --prop width=9.37cm --prop height=7cm
officecli add $F "/slide[7]" --type shape --prop name=MsTitle --prop text="Milestone" --prop x=23cm --prop y=4.5cm --prop width=9.37cm --prop height=1.5cm --prop font=Georgia --prop size=22 --prop bold=true --prop color=FFFFFF --prop align=center
officecli add $F "/slide[7]" --type shape --prop name=MsBody --prop "text=Lifecycle Architecture (LCA)\n\nKien truc on dinh" --prop x=23cm --prop y=6.5cm --prop width=9.37cm --prop height=4cm --prop font=Calibri --prop size=18 --prop color=FFFFFF --prop align=center
officecli add $F "/slide[7]" --type shape --prop name=BottomBand --prop preset=rect --prop fill=065A82 --prop x=0cm --prop y=18.55cm --prop width=33.87cm --prop height=0.5cm

# ========== SLIDE 8: Construction ==========
officecli add $F / --type slide --prop layout=blank --prop background=FFFFFF
officecli add $F "/slide[8]" --type shape --prop name=Title --prop "text=Pha 3: Construction (Xay Dung)" --prop x=1.5cm --prop y=1cm --prop width=30cm --prop height=2cm --prop font=Georgia --prop size=36 --prop bold=true --prop color=065A82
officecli add $F "/slide[8]" --type shape --prop name=What --prop "text=WHAT: Phat trien toan bo chuc nang, tich hop module, Unit Test, Integration Test, System Test, viet tai lieu" --prop x=1.5cm --prop y=3.5cm --prop width=20cm --prop height=2.5cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[8]" --type shape --prop name=Who --prop "text=WHO: Developers, Testers/QA, Technical Writer, DBA, Project Manager, UI Developer" --prop x=1.5cm --prop y=6.5cm --prop width=20cm --prop height=1.5cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[8]" --type shape --prop name=IO --prop "text=INPUT: SAD, Design Model, Data Model, Coding Standards\nOUTPUT: Source Code, Beta Release, Test Reports, User Manual" --prop x=1.5cm --prop y=8.5cm --prop width=20cm --prop height=3cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[8]" --type shape --prop name=MsBg --prop preset=roundRect --prop fill=065A82 --prop line=none --prop x=23cm --prop y=4cm --prop width=9.37cm --prop height=7cm
officecli add $F "/slide[8]" --type shape --prop name=MsTitle --prop text="Milestone" --prop x=23cm --prop y=4.5cm --prop width=9.37cm --prop height=1.5cm --prop font=Georgia --prop size=22 --prop bold=true --prop color=FFFFFF --prop align=center
officecli add $F "/slide[8]" --type shape --prop name=MsBody --prop "text=Initial Operational Capability (IOC)\n\nSan sang beta testing" --prop x=23cm --prop y=6.5cm --prop width=9.37cm --prop height=4cm --prop font=Calibri --prop size=18 --prop color=FFFFFF --prop align=center
officecli add $F "/slide[8]" --type shape --prop name=BottomBand --prop preset=rect --prop fill=065A82 --prop x=0cm --prop y=18.55cm --prop width=33.87cm --prop height=0.5cm

# ========== SLIDE 9: Transition ==========
officecli add $F / --type slide --prop layout=blank --prop background=FFFFFF
officecli add $F "/slide[9]" --type shape --prop name=Title --prop "text=Pha 4: Transition (Chuyen Giao)" --prop x=1.5cm --prop y=1cm --prop width=30cm --prop height=2cm --prop font=Georgia --prop size=36 --prop bold=true --prop color=065A82
officecli add $F "/slide[9]" --type shape --prop name=What --prop "text=WHAT: Trien khai production, UAT, dao tao nguoi dung, data migration, sua loi, tinh chinh hieu nang, ban giao" --prop x=1.5cm --prop y=3.5cm --prop width=20cm --prop height=2.5cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[9]" --type shape --prop name=Who --prop "text=WHO: DevOps, Testers/QA, Trainer, Support Team, End Users, Project Manager" --prop x=1.5cm --prop y=6.5cm --prop width=20cm --prop height=1.5cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[9]" --type shape --prop name=IO --prop "text=INPUT: Beta Release, User Manual, Deployment Plan, Training Material\nOUTPUT: Production Release, UAT Sign-off, Training Records, Lessons Learned" --prop x=1.5cm --prop y=8.5cm --prop width=20cm --prop height=3cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[9]" --type shape --prop name=MsBg --prop preset=roundRect --prop fill=065A82 --prop line=none --prop x=23cm --prop y=4cm --prop width=9.37cm --prop height=7cm
officecli add $F "/slide[9]" --type shape --prop name=MsTitle --prop text="Milestone" --prop x=23cm --prop y=4.5cm --prop width=9.37cm --prop height=1.5cm --prop font=Georgia --prop size=22 --prop bold=true --prop color=FFFFFF --prop align=center
officecli add $F "/slide[9]" --type shape --prop name=MsBody --prop "text=Product Release\n\nSan pham van hanh chinh thuc" --prop x=23cm --prop y=6.5cm --prop width=9.37cm --prop height=4cm --prop font=Calibri --prop size=18 --prop color=FFFFFF --prop align=center
officecli add $F "/slide[9]" --type shape --prop name=BottomBand --prop preset=rect --prop fill=065A82 --prop x=0cm --prop y=18.55cm --prop width=33.87cm --prop height=0.5cm

# ========== SLIDE 10: Divider - Vi Du ==========
officecli add $F / --type slide --prop layout=blank --prop background=065A82
officecli add $F "/slide[10]" --type shape --prop name=Title --prop "text=Vi Du: Website E-Commerce ShopVN" --prop x=2cm --prop y=6cm --prop width=29.87cm --prop height=3cm --prop font=Georgia --prop size=44 --prop bold=true --prop color=FFFFFF --prop align=center
officecli add $F "/slide[10]" --type shape --prop name=Sub --prop "text=Ap dung RUP cho du an ban hang dien tu" --prop x=2cm --prop y=10cm --prop width=29.87cm --prop height=1.5cm --prop font=Calibri --prop size=22 --prop color=1C7293 --prop align=center

# ========== SLIDE 11: ShopVN Inception ==========
officecli add $F / --type slide --prop layout=blank --prop background=FFFFFF
officecli add $F "/slide[11]" --type shape --prop name=Title --prop "text=ShopVN - Pha Inception" --prop x=1.5cm --prop y=1cm --prop width=30cm --prop height=2cm --prop font=Georgia --prop size=36 --prop bold=true --prop color=065A82
officecli add $F "/slide[11]" --type shape --prop name=Vision --prop "text=Tam nhin: Xay dung san e-commerce ban dien tu cho thi truong Viet Nam" --prop x=1.5cm --prop y=3.5cm --prop width=30cm --prop height=1.5cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[11]" --type shape --prop name=Scope --prop "text=Pham vi: Quan ly san pham, gio hang, thanh toan online, don hang, tai khoan nguoi dung" --prop x=1.5cm --prop y=5.5cm --prop width=30cm --prop height=1.5cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[11]" --type shape --prop name=Risk --prop "text=Rui ro: Bao mat thanh toan (High), Hieu nang flash sale (Medium)" --prop x=1.5cm --prop y=7.5cm --prop width=30cm --prop height=1.5cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[11]" --type shape --prop name=UC --prop "text=Use-Case chinh: UC01 Dang ky/Dang nhap, UC02 Tim kiem, UC03 Gio hang, UC04 Thanh toan, UC05 Quan ly don hang" --prop x=1.5cm --prop y=9.5cm --prop width=30cm --prop height=2cm --prop font=Calibri --prop size=18 --prop color=2B3A4E
officecli add $F "/slide[11]" --type shape --prop name=BottomBand --prop preset=rect --prop fill=065A82 --prop x=0cm --prop y=18.55cm --prop width=33.87cm --prop height=0.5cm

# ========== SLIDE 12: ShopVN Construction ==========
officecli add $F / --type slide --prop layout=blank --prop background=FFFFFF
officecli add $F "/slide[12]" --type shape --prop name=Title --prop "text=ShopVN - Pha Construction (6 Iterations)" --prop x=1.5cm --prop y=1cm --prop width=30cm --prop height=2cm --prop font=Georgia --prop size=36 --prop bold=true --prop color=065A82
# Row 1
officecli add $F "/slide[12]" --type shape --prop name=I1Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=1.5cm --prop y=4cm --prop width=9.5cm --prop height=4cm
officecli add $F "/slide[12]" --type shape --prop name=I1T --prop "text=Iteration 1 (4 tuan)" --prop x=1.5cm --prop y=4.3cm --prop width=9.5cm --prop height=1.2cm --prop font=Georgia --prop size=18 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[12]" --type shape --prop name=I1B --prop "text=User Service\nDang ky, dang nhap, profile, phan quyen" --prop x=1.5cm --prop y=5.5cm --prop width=9.5cm --prop height=2cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[12]" --type shape --prop name=I2Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=12.2cm --prop y=4cm --prop width=9.5cm --prop height=4cm
officecli add $F "/slide[12]" --type shape --prop name=I2T --prop "text=Iteration 2 (4 tuan)" --prop x=12.2cm --prop y=4.3cm --prop width=9.5cm --prop height=1.2cm --prop font=Georgia --prop size=18 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[12]" --type shape --prop name=I2B --prop "text=Product Service\nCRUD san pham, tim kiem, bo loc" --prop x=12.2cm --prop y=5.5cm --prop width=9.5cm --prop height=2cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[12]" --type shape --prop name=I3Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=22.87cm --prop y=4cm --prop width=9.5cm --prop height=4cm
officecli add $F "/slide[12]" --type shape --prop name=I3T --prop "text=Iteration 3 (4 tuan)" --prop x=22.87cm --prop y=4.3cm --prop width=9.5cm --prop height=1.2cm --prop font=Georgia --prop size=18 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[12]" --type shape --prop name=I3B --prop "text=Cart & Order Service\nGio hang, dat hang, trang thai don" --prop x=22.87cm --prop y=5.5cm --prop width=9.5cm --prop height=2cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
# Row 2
officecli add $F "/slide[12]" --type shape --prop name=I4Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=1.5cm --prop y=9.5cm --prop width=9.5cm --prop height=4cm
officecli add $F "/slide[12]" --type shape --prop name=I4T --prop "text=Iteration 4 (4 tuan)" --prop x=1.5cm --prop y=9.8cm --prop width=9.5cm --prop height=1.2cm --prop font=Georgia --prop size=18 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[12]" --type shape --prop name=I4B --prop "text=Payment Service\nVNPay, MoMo, COD, hoan tien" --prop x=1.5cm --prop y=11cm --prop width=9.5cm --prop height=2cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[12]" --type shape --prop name=I5Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=12.2cm --prop y=9.5cm --prop width=9.5cm --prop height=4cm
officecli add $F "/slide[12]" --type shape --prop name=I5T --prop "text=Iteration 5 (3 tuan)" --prop x=12.2cm --prop y=9.8cm --prop width=9.5cm --prop height=1.2cm --prop font=Georgia --prop size=18 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[12]" --type shape --prop name=I5B --prop "text=Notification + Admin\nEmail, SMS, thong ke, quan tri" --prop x=12.2cm --prop y=11cm --prop width=9.5cm --prop height=2cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[12]" --type shape --prop name=I6Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=22.87cm --prop y=9.5cm --prop width=9.5cm --prop height=4cm
officecli add $F "/slide[12]" --type shape --prop name=I6T --prop "text=Iteration 6 (3 tuan)" --prop x=22.87cm --prop y=9.8cm --prop width=9.5cm --prop height=1.2cm --prop font=Georgia --prop size=18 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[12]" --type shape --prop name=I6B --prop "text=Review, Wishlist, Coupon\nDanh gia, khuyen mai" --prop x=22.87cm --prop y=11cm --prop width=9.5cm --prop height=2cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[12]" --type shape --prop name=BottomBand --prop preset=rect --prop fill=065A82 --prop x=0cm --prop y=18.55cm --prop width=33.87cm --prop height=0.5cm

# ========== SLIDE 13: Diem Manh ==========
officecli add $F / --type slide --prop layout=blank --prop background=FFFFFF
officecli add $F "/slide[13]" --type shape --prop name=Title --prop "text=Diem Manh Cua RUP" --prop x=1.5cm --prop y=1cm --prop width=30cm --prop height=2cm --prop font=Georgia --prop size=36 --prop bold=true --prop color=065A82
# Row 1
officecli add $F "/slide[13]" --type shape --prop name=S1Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=1.5cm --prop y=4cm --prop width=14.94cm --prop height=4cm
officecli add $F "/slide[13]" --type shape --prop name=S1T --prop "text=Phat trien lap & tang dan" --prop x=1.5cm --prop y=4.5cm --prop width=14.94cm --prop height=1.2cm --prop font=Georgia --prop size=20 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[13]" --type shape --prop name=S1B --prop "text=Giam rui ro so voi Waterfall, phat hien loi som qua tung iteration" --prop x=1.5cm --prop y=5.8cm --prop width=14.94cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[13]" --type shape --prop name=S2Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=17.43cm --prop y=4cm --prop width=14.94cm --prop height=4cm
officecli add $F "/slide[13]" --type shape --prop name=S2T --prop "text=Quan ly rui ro tot" --prop x=17.43cm --prop y=4.5cm --prop width=14.94cm --prop height=1.2cm --prop font=Georgia --prop size=20 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[13]" --type shape --prop name=S2B --prop "text=Rui ro duoc xac dinh va xu ly tu som, truoc khi coding nhieu" --prop x=17.43cm --prop y=5.8cm --prop width=14.94cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
# Row 2
officecli add $F "/slide[13]" --type shape --prop name=S3Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=1.5cm --prop y=9.5cm --prop width=14.94cm --prop height=4cm
officecli add $F "/slide[13]" --type shape --prop name=S3T --prop "text=Dieu khien boi Use-Case" --prop x=1.5cm --prop y=10cm --prop width=14.94cm --prop height=1.2cm --prop font=Georgia --prop size=20 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[13]" --type shape --prop name=S3B --prop "text=Dam bao phan mem dap ung dung nhu cau nghiep vu nguoi dung" --prop x=1.5cm --prop y=11.3cm --prop width=14.94cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[13]" --type shape --prop name=S4Bg --prop preset=roundRect --prop fill=F0F7FA --prop line=none --prop x=17.43cm --prop y=9.5cm --prop width=14.94cm --prop height=4cm
officecli add $F "/slide[13]" --type shape --prop name=S4T --prop "text=Kien truc trung tam" --prop x=17.43cm --prop y=10cm --prop width=14.94cm --prop height=1.2cm --prop font=Georgia --prop size=20 --prop bold=true --prop color=065A82 --prop align=center
officecli add $F "/slide[13]" --type shape --prop name=S4B --prop "text=Xay dung kien truc vung chac tu som (pha Elaboration)" --prop x=17.43cm --prop y=11.3cm --prop width=14.94cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[13]" --type shape --prop name=BottomBand --prop preset=rect --prop fill=065A82 --prop x=0cm --prop y=18.55cm --prop width=33.87cm --prop height=0.5cm

# ========== SLIDE 14: Diem Yeu ==========
officecli add $F / --type slide --prop layout=blank --prop background=FFFFFF
officecli add $F "/slide[14]" --type shape --prop name=Title --prop "text=Diem Yeu Cua RUP" --prop x=1.5cm --prop y=1cm --prop width=30cm --prop height=2cm --prop font=Georgia --prop size=36 --prop bold=true --prop color=065A82
# Row 1
officecli add $F "/slide[14]" --type shape --prop name=W1Bg --prop preset=roundRect --prop fill=FFF0F0 --prop line=none --prop x=1.5cm --prop y=4cm --prop width=14.94cm --prop height=4cm
officecli add $F "/slide[14]" --type shape --prop name=W1T --prop "text=Phuc tap & nang ne" --prop x=1.5cm --prop y=4.5cm --prop width=14.94cm --prop height=1.2cm --prop font=Georgia --prop size=20 --prop bold=true --prop color=B85042 --prop align=center
officecli add $F "/slide[14]" --type shape --prop name=W1B --prop "text=Quy trinh do so voi nhieu artifact, role, discipline" --prop x=1.5cm --prop y=5.8cm --prop width=14.94cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[14]" --type shape --prop name=W2Bg --prop preset=roundRect --prop fill=FFF0F0 --prop line=none --prop x=17.43cm --prop y=4cm --prop width=14.94cm --prop height=4cm
officecli add $F "/slide[14]" --type shape --prop name=W2T --prop "text=Chi phi cao" --prop x=17.43cm --prop y=4.5cm --prop width=14.94cm --prop height=1.2cm --prop font=Georgia --prop size=20 --prop bold=true --prop color=B85042 --prop align=center
officecli add $F "/slide[14]" --type shape --prop name=W2B --prop "text=Nhieu tai lieu, nhieu vai tro, tool ho tro thuong ton phi" --prop x=17.43cm --prop y=5.8cm --prop width=14.94cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
# Row 2
officecli add $F "/slide[14]" --type shape --prop name=W3Bg --prop preset=roundRect --prop fill=FFF0F0 --prop line=none --prop x=1.5cm --prop y=9.5cm --prop width=14.94cm --prop height=4cm
officecli add $F "/slide[14]" --type shape --prop name=W3T --prop "text=Doi hoi kinh nghiem" --prop x=1.5cm --prop y=10cm --prop width=14.94cm --prop height=1.2cm --prop font=Georgia --prop size=20 --prop bold=true --prop color=B85042 --prop align=center
officecli add $F "/slide[14]" --type shape --prop name=W3B --prop "text=Team can co kinh nghiem RUP va UML, neu khong se ap dung sai" --prop x=1.5cm --prop y=11.3cm --prop width=14.94cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[14]" --type shape --prop name=W4Bg --prop preset=roundRect --prop fill=FFF0F0 --prop line=none --prop x=17.43cm --prop y=9.5cm --prop width=14.94cm --prop height=4cm
officecli add $F "/slide[14]" --type shape --prop name=W4T --prop "text=Khong phu hop du an nho" --prop x=17.43cm --prop y=10cm --prop width=14.94cm --prop height=1.2cm --prop font=Georgia --prop size=20 --prop bold=true --prop color=B85042 --prop align=center
officecli add $F "/slide[14]" --type shape --prop name=W4B --prop "text=Du an duoi 5 nguoi, RUP qua overkill, nen dung Agile/Scrum" --prop x=17.43cm --prop y=11.3cm --prop width=14.94cm --prop height=1.8cm --prop font=Calibri --prop size=16 --prop color=2B3A4E --prop align=center
officecli add $F "/slide[14]" --type shape --prop name=BottomBand --prop preset=rect --prop fill=065A82 --prop x=0cm --prop y=18.55cm --prop width=33.87cm --prop height=0.5cm

# ========== SLIDE 15: Closing ==========
officecli add $F / --type slide --prop layout=blank --prop background=065A82
officecli add $F "/slide[15]" --type shape --prop name=Title --prop "text=Cam On" --prop x=2cm --prop y=5cm --prop width=29.87cm --prop height=3cm --prop font=Georgia --prop size=44 --prop bold=true --prop color=FFFFFF --prop align=center
officecli add $F "/slide[15]" --type shape --prop name=Sub --prop "text=Nhom san sang tra loi cau hoi" --prop x=2cm --prop y=9cm --prop width=29.87cm --prop height=1.5cm --prop font=Calibri --prop size=22 --prop color=1C7293 --prop align=center
officecli add $F "/slide[15]" --type shape --prop name=Ref --prop "text=Tai lieu tham khao: Kruchten (2003), Jacobson et al. (1999), OpenUP - Eclipse Foundation" --prop x=2cm --prop y=15cm --prop width=29.87cm --prop height=1cm --prop font=Calibri --prop size=14 --prop color=6B8FAA --prop align=center

# ========== SAVE ==========
officecli save $F
