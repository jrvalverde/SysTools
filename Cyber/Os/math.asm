      MACHINE SUBROUTINE ALOG  (A1)
      0
      1
      0
ALE   0
      U=(I)        FETCH ARGUMENT
      W=(UBE)      EO
      Z,O=U.       UNPACK
      X=(UBF)      EO*
      T=(UBG)      LN2
      P=ZROA,U=0    ARGUMENT IS =0
      N=-48
      U=N,Z.       PACK FRACTIONAL ARG.
      Z.N=U-W
      Z,0=Z-       NORMALIZE
      Z.R=Z-X      Y-EO-EO*
      Z,0=Z-       NORMALIZE
      Y.R=U+W      Y+EO
      Z.R=Z/Y      Y-EO/Y+EO=T
      O=O-N
      T=(UBJ)      1/3
      U=(UBI)
      W=(UBL)      LN(EO)
      S.R=Z*Z      T2ND
      Z.R=Z+Z      2T
      W.R=W+Z      LNEO+2T
      W,0=W-       NORMALIZE
      Z.R=Z*S      2T 3RD
      T.R=T*Z
      X=(UBH)      1/7
      Y.R=S*Z
      V.R=S*Y      T6TH
      U.R=Y*U      T4TH/5
      T.R=W+T      1+T 2ND/3
      T,0=T-       NORMALIZE
      T.R=T+U      1+2ND/3 + T4TH/5
      T,0=T-       NORMALIZE
      Y.R=V*S
      V.R=X*V      T6TH/7
      U=(UBN)      1/9
      U.R=U*Y
      T.R=V+T      1+T2ND/3+T4TH/5+T6TH/7
      T,0=T-       NORMALIZE
      T.R=U+T      1+ECT+T8TH/9
      T,0=T-       NORMALIZE
      U=(UBC)
      V=(UBD)
      Z.R=Y*S
      Y.R=Z*U
      U=(UBM)
      Z.R=Z*S
      T.R=T+Y
      T,0=T-
      Z.R=Z*V
      T.R=T+Z
      T,0=T-
      V=(I)        ARGUMENT
      X=(UBG)      LN2
      Y=O          EXPONENT TO X6
      Y=0,Y.       PACK EXPONENT =N
      W=V-U
      Y,0=Y-       NORMALIZE N
      Y.R=X*Y      N*LN2
      P=LOGA,W/0   SENSE ARGUMENT NOT 1.0
      Y=0
      P=ALE
LOGA  Y.R=Y+T
      Y,0=Y-       NORMALIZE
      P=ALE,V)0
ZROA  Y=1777B      SET ANSWER TO INDEFINITE
      Y=Y(48)
      P=ALE
      ..           CONSTANTS
UBG   17175427102775750717B
UBH   17154444444444444445B
UBI   17156314631463146315B
UBJ   17165252525252525253B
UBL   60612350675002027060B
UBM   17204000000000000000B
UBE   17175520236314774736B
UBF   16366220424722026021B
UBN   17147070707070707071B
UBC   17145642721350564272B
UBD   17144730473047304731B
      END
#eor
      MACHINE SUBROUTINE  ALOG10  (A1)
      0
      1
      0
ALT   0
      U=(I)        FETCH ARGUMENT
      W=(UBE)      E0
      X=(UBF)      E0*
      Z,O=U.       UNPACK
      T=(UBG)      LN2
      P=ZROA,U=0
      N=777717B    -48 TO B6
      U=N,Z.       PACK FRACTIONAL ARG
      Z.N=U-W      Y-E0,Y=ARG
      Z,0=Z-       NORMALIZE
      Z.R=Z-X      Y-E0-E0*
      Z,0=Z-       NORMALIZE
      Y.R=U+W      Y+E0
      Z.R=Z/Y      Y-E0/Y+E0=T
      O=O-N        EXPONENT + 48
      T=(UBJ)      1/3
      U=(UBI)
      W=(UBL)      LN(E0)
      S.R=Z*Z      T2ND
      Z.R=Z+Z      2T
      W.R=W+Z      LNE0+2T
      W,0=W-       NORMALIZE
      Z.R=Z*S      2T 3RD
      T.R=T*Z
      X=(UBH)      1/7
      Y.R=S*Z
      V.R=S*Y      T 6TH
      U.R=Y*U      T4TH / 5
      T.R=W+T      1+T 2ND/3
      T,0=T-       NORMALIZE
      T.R=T+U      1+T2ND/3 + T4TH/5
      T,0=T-       NORMALIZE
      Y.R=V*S
      V.R=X*V      T6TH/7
      U=(UBN)      1/9
      U.R=U*Y
      T.R=V+T      1+T2ND/3+T4TH/5+T6TH/7
      T,0=T-       NORMALIZE
      T.R=U+T      1+ECT+T8TH/9
      T,0=T-       NORMALIZE
      U=(UBC)
      V=(UBD)
      Z.R=Y*S
      Y.R=Z*U
      U=(UBM)
      Z.R=Z*S
      T.R=T+Y
      T,0=T-
      Z.R=Z*V
      T.R=T+Z
      T,0=T-
      V=(I)        FETCH ARGUMENT
      X=(UBG)      LN2
      Y=O          EXPONENT TO X6
      Y=0,Y.       PACK EXPONENT=N
      W=V-U
      Y,0=Y-       NORMALIZE N
      Y.R=X*Y      N*LN2
      P=LOGA,W/0   SENSE ARGUMENT NOT 1.0
      Y=0
      P=ALT
LOGA  Y.R=Y+T
      W=(LTN)
      Y,0=Y-       NORMALIZE
      Y=Y*W
      P=ALT,V)0
ZROA  Y=1777B
      Y=Y(60B)
      P=ALT
      ..           CONSTANTS
UBG   17175427102775750717B
UBH   17154444444444444445B
UBI   17156314631463146315B
UBJ   17165252525252525253B
UBL   60612350675002027060B
UBM   17204000000000000000B
UBE   17175520236314774736B
UBF   16366220424722026021B
UBN   17147070707070707071B
UBC   17145642721350564272B
UBD   17144730473047304731B
LTN   17166745573052233452B
      END
#eor
      MACHINE SUBROUTINE ATAN  (A1)
      0
      0
      0
ATN   0
      K=0
      J=0
      T=(I)        FETCH ARGUMENT
      U=(ATA)      FLT. PT. 1
      V=(ATB)      SQ RT 2
      P=ATO,T)0
      J=7
      T=-T
ATO   W.N=V-U      SQ RT 2 - 1
      W,0=W-
      X.N=W-T
      X,0=X-
      P=ATP,X)0    ARG IS LESS OR = SQ RT 2 - 1
      W.N=V+U      FORM SQ RT 2 + 1
      W,0=W-       NORMALIZE
      X.N=W-T
      P=ATR,X)0    LESS OR = SQ RT 2 +1
      U=-U         FORM -1
      T=U/T        -1/Z
      K=2
ATP   U=(ATI)
      V=T*T        TSQ
      W=(ATH)      E3
      U.N=U+V      T SQ + D4
      Y=V
      X=(ATG)
      U,0=U-
      W=W/U
      V=(ATF)      E2
      X.N=X+Y
      U=(ATE)
      X,0=X-
      X.N=X+W
      X,0=X-
      V=V/X
      U.N=U+Y
      W=(ATD)      E1
      U,0=U-
      Y.N=U+V
      X=(ATC)      D1
      Y=W/Y
      V=(K+ATJ)
      Y.N=Y+X
      Y,0=Y-
      Y=Y*T        *T
      P=ATQ,K=0
      Y.N=Y+V
      Y,0=Y-
ATQ   P=ATN,J=0    POSITIVE ARGUMENT
      Y=-Y
      P=ATN
ATR   K=1
      V.N=T-U
      W.N=T+U
      V,0=V-
      W,0=W-
      T=V/W
      P=ATP
      ..           CONSTANTS
ATA   17204000000000000000B
ATB   17205520236314750656B
ATC   17156342227732547734B
ATD   17216164452160711744B
ATE   17225317772277306204B
ATF   60560111317142532541B
ATG   17215337417031405016B
ATH   60623134652277270450B
ATI   17205265617124327034B
ATJ   17170000000000000000B
      17176220773250420550B
      17206220773250420550B
      END
#eor
      MACHINE SUBROUTINE COS  (A1)
      0
      1
      0
CAA   0
      U=(I)
      P=CAG,U)0
      U=-U
CAG   T=(SAF)
      V.N=U-T
      Y=U
      X=(SAH)
      P=CAI,V(0    ARG ( 2PI
      W.N=U/T
      W,L=W.
      W=W(L)
      W=0,W.       PACK INTEGER PORTION
      W,0=W-       NORMALIZE
      W.R=W*T
      U.R=U-W
      U,J=U-
CAI   W.N=U-X
      V=(SAL)
      P=CAJ,W(0    ARG ( PI
      W=(SAK)
      U.N=T-U
      U,0=U-
      U.R=W+U
CAJ   S.N=U-V
      T=(SAP)
      P=CAK,S(0     ARG ( PI/2
      W=(SAO)
      U.N=X-U      PI-ARG
      U,0=U-
      U.R=U+W
      Y=-Y
CAK   W=(SAQ)
      Y=(SAM)
      X.N=T-U
      P=CAR,X)0    ARG(PI/4
      U.N=U-V
      U,0=U-
      U.R=U-W
      U,0=U-
SAR   T=(SAS)
      S.R=U*U
      T.R=U*T
      V=(SAT)
      W=(SAU)
      X=(SAV)
      Z.R=S*U
      U=(SAW)
      Y.R=V*Z
      Z.R=Z*S
      T.R=T+Y
      T,0=T-
      Y.R=Z*W
      W=(SAX)
      Z.R=S*Z
      T.R=Y+T
      T,0=T-
      Y.R=Z*X
      X=(SAY)
      Z.R=Z*S
      T.R=T+Y
      T,0=T-
      Y.R=Z*U
      Z.R=Z*S
      T.R=T+Y
      T,0=T-
      Y.R=Z*W
      Z.R=Z*S
      T.R=T+Y
      T,0=T-
      Y.R=Z*X
      W=(SAM)
      Y.R=T+Y
      Y,N=Y-
      P=CAA,W(0
      Y=-Y
      P=CAA
CAR   S.R=U*U
      T=(CAF)
      U=(CAZ)
      V=(CAM)
      W=(CAH)
      Z.R=S*S
      T.R=S*T
      V.R=V+T
      V,0=V-
      Y.R=U*Z
      Z.R=S*Z
      V.R=V+Y
      V,0=V-
      U=(CAO)
      Y.R=W*Z
      Z.R=S*Z
      V.R=V+Y
      V,0=V-
      W=(CAL)
      Y.R=U*Z
      Z.R=Z*S
      X=(CAQ)
      V.R=V+Y
      V,0=V-
      Y.R=W*Z
      Z.R=S*Z
      V.R=V+Y
      V,0=V-
      W=(SAM)
      Y.R=X*Z
      Y.R=Y+V
      Y,0=Y-
      P=CAA,W)0
      Y=-Y
      P=CAA
      ..
 
CAF   60610000000000000113B
CAZ   17135252525252503360B
CAH   60712237223731501253B
CAO   17006400635431356344B
CAL   61053301240133176055B
CAQ   16634313531506475746B
CAM   17177777777777777775B
SAM   0
SAF   17226220773250420550B
SAK   16426134743306206553B
SAH   17216220773250420550B
SAO   16416134743306206553B
SAL   17206220773250420550B
SAQ   16406134743306206553B
SAP   17176220773250420550B
SAS   17177777777777777776B
SAT   60622525252525252563B
SAU   17114210421042072252B
SAV   60741377137721714335B
SAW   16755616741655620270B
SAX   61111215351223012441B
SAY   16575326540202025530B
      END
#eor
      MACHINE SUBROUTINE DVCHK  (A1)
      0
      1
      0
DVCK  0
      Z=1
      Z=(I)
      P=DVCK,Z.N   CHECK FOR INDEFINITE
      Z=2
      Z=(I)
      P=DVCK
      END
#eor
      MACHINE SUBROUTINE END
      ABS,ONE=1
      0            HEADING
      0
END   0            EXIT/ENTRY
      I=2
ENF   T=(I)
      I=I+1
      P=ENJ,T/0    SENSE NO END OF ARGUMENTS
ENI   T=(ONE)
      P=ENI,T/0    SENSE NOT READY
      Z=Z(52B)
      Y=51604B     END CODES
      Y=Y(52B)
      Y=Y+Z
      Y=(ENK)
      Y=152307B    MSG CODES
      Y=Y(52B)
      T=ENK
      Y=T+Y
      Y=(ONE)      SEND MESSAGE REQUEST
ENC   T=(ONE)
      P=ENC,T/0    SENSE NOT READY
      Y=51604B
      Y=Y(52B)
      Y=(ONE)
      0
ENJ   U=(T)
      X=*52B
      V=-X.T
      P=ENF,V=0
      V=77B
      Y=V.U
      V=34B
      P=ENM,Y=0
      V=1
      Y=V.U
      P=ENJ,Y=0    ACTIVE
      V=777706B
      U=U.V
      V=30B
ENM   Y=U+V        FORM NEW REQUEST
      V=*52B
      Y=(T)        SEND NEW REQUEST TO ARGUMENT LIST
      V=-V.T
      Y=031117B    CIO CODES
      Y=Y(52B)
      Y=V+Y
ENG   T=(ONE)
      P=ENG,T/0    SENSE NOT READY
      Y=(ONE)
      P=ENF        LOOP
ENK   0            MESSAGE AREA
ENL   0
      END
#eor
      MACHINE SUBROUTINE EXIT
      ABS,ONE=1
      0
      0
EXT   0            EXIT/ENTRY
EXN   I=2
ETF   T=(I)
      I=I+1
      P=ETJ,T/0    SENSE NO END OF ARGUMENTS
ETI   T=(ONE)
      P=ETI,T/0    SENSE NOT READY
      Y=530B       EX CODES
      U=1124B      IT CODES
      Y=Y(14B)
      Y=U+Y        EXIT
      Y=Y(44B)
      Y=(ETK)
      Y=152307B    MSG CODES
      Y=Y(52B)
      T=ETK
      Y=T+Y
      Y=(ONE)
ETD   T=(ONE)
      P=ETD,T/0
      Y=51604B     END
      Y=Y(52B)
      Y=(ONE)
      0
ETJ   U=(T)
      X=*52B
      V=-X.T
      P=ETF,V=0
      V=77B
      Y=V.U
      W=34B
      P=ETM,Y=0    BUFFER WAS NOT USED
      V=1
      W=V.U
      P=ETJ,W=0    WAIT ** BUFFER IS ACTIVE
      V=777706B
      U=U.V        CLEAR PREVIOUS REQUEST FOR I/O
      W=30B
ETM   Y=U+W        FORM NEW REQUEST
      V=*52B
      Y=(T)        SEND NEW REQUEST TO ARGUMENT REGION
      V=-V.T
      Y=031117B
      Y=Y(52B)
      Y=V+Y
ETG   T=(ONE)
      P=ETG,T/0    SENSE NOT READY
      Y=(ONE)
      P=ETF        LOOP
ETK   0
ETL   0
      END
#eor
      MACHINE SUBROUTINE  EXP  (A1)
      0
      1
      0
EXP   0
      U=(I)
      V=(EAD)      LOAD LN2
      Z=U
      P=EAE,U)0
      U=-U
EAE   W.R=U/V
      X=0
      X=0,X.       PACK ZERO
      X.N=X+W      PUT INTO INTEGER FORM
      W,0=X.
      P=ZINT,W=0
      W=0,W.
      W,0=W-       IN ARG/LN2
ZINT  Y.R=W*V      J*LN2
      Z.R=U-Y      ARG-J*LN2
      W,L=W.       UNPACK J
      T=(EAI)
      W=W(L)       SHIFT TO INTEGER POSITION
      Z,0=Z-       NORMALIZE NEW ARG
      N=W          J TO B6
      S.R=Z*Z      T**2
      V=(EAZ)
      U=T          1 TO T AND U
      Y=Z-V        DECREMENT
      T.N=T+Y      FORMA 1+X/2
      U.N=U-Y      FORM 1-X/2
      U,0=U-
      T,0=T-
      V=(EAO)
      W=(EAM)
      X=(EAN)
      Y.R=S*V
      S.R=S*Z
      T.R=T+Y
      U.R=U+Y
      U,0=U-       NORMALIZE
      T,0=T-       NORMALIZE
      Y.R=S*W
      S.R=S*Z
      V=(EAL)
      W=(EAK)
      T.R=T+Y
      U.R=U-Y
      U,0=U-
      T,0=T-       NORMALIZE
      Y.R=S*X
      S.R=S*Z
      T.R=T+Y
      U.R=U+Y
      U,0=U-       NORMALIZE
      T,0=T-       NORMALIZE
      Y.R=S*V
      S.R=S*Z
      T.R=T+Y
      U.R=U-Y
      U,0=U-       NORMALIZE
      T,0=T-
      Y.R=S*W
      X.R=T+Y
      Z.R=U+Y
      Z,0=Z-
      X,0=X-
      Y.R=X/Z      A+B/A-B
      T=(I)        FETCH ARGUMENT FOR SIGN TEST
      V=(EAI)
      Y,M=Y.       UNPACK
      N=N+M        ADD J TO EXP
      Y=N,Y.       REPACK
      P=EXP,T)0
      Y.R=V/Y
      P=EXP
      ..
EAI   17204000000000000000B
EAO   17147213505642721350B
EAN   17065127726500512772B
EAK   16746233741042727604B
EAP   17174000000000000000B
EAM   17117603701740760370B
EAL   17024106253546725457B
EAD   17175427102775750717B
EAZ   00010000000000000000B
      END
#eor
      MACHINE SUBROUTINE IBAIEX (A1,A2)
      0
      2
      0
      0
PII   0
      U=0          SIGN FLAG OF BASE
      V=0          SIGN FLAG OF EXPONENT
      P=PIC,Y)0
      U=77B
PIC   P=PID,Z)0
      Y=0
      P=PII        EXIT  B**-X
PID   P=PII,Y=0    O**E
      P=PIA,Z/0
      Y=1          B**O
      P=PIX        EXIT
PIA   Z=Z-1
      P=PIX,Z=0    B**1
      T=Z
      Y=0,Y.       PACK BASE
      V=Y
PIB   T=T-1
      Y.D=Y*V
      P=PIB,T/0
      Y,0=Y.
PIX   P=PII,U=0
      P=PII,V=0
      Y=-Y
      P=PII
      END
#eor
      MACHINE SUBROUTINE IFENDF
      ABS,ONE=1
      0
      0
EOF   0
      P=EOA,Y)0    X7 CONTAINS ADDRESS OF ARGUMENT LIST
      Y=-Y         GENERATE FILE NAME
      T=(Y)
      U=*6
      V=T.U
      P=EOB,V=0    VARIABLE TAPE NUMBER
EOC   U=2          SCAN PROGRAM ARGUMNETS
EOD   X=(U)
      P=ERR,X=0    SENSE END OF ARGUMENTS
      W=*52B
      V=X.W
      W=T-V        COMPARE FILE NAMES
      U=U+1
      P=EOD,W/0    NO HIT
      Y=X
      P=EOA
EOB   U=(TCD)      CODES FOR TAPEXX
      V=12B
      V=0,V.
      Z=V
      V,0=V-
      T=0,T.       PACK VARIABLE TAPE NUMBER
      W=T/V
      W,O=W.
      W=W(O)
      Y=0,W.
      X.D=Z*Y
      Y.N=T-X      REMAINDER
      P=EOE,W=0
      V=V+33B
      Y=Y+33B
      V=U+V
      V=V(6)
      T=T+V
      T=T(30B)
      P=EOC
EOE   Y=Y+33B
      T=Y+U
      T=T(36B)
      P=EOC
EOA   T=(Y)
      U=77B
      V=T.U
      P=EOG,V=0
      U=1
      V=T.U
      P=EOA,V=0
      T=(Y+2)      IN
      U=(Y+3)      OUT
      V=(Y)        FETCH FILE NAME,FUNCTION
      T=T-U
EOG   Y=0
      P=EOF,T/0    NO END OF ILE
      T=70B
      U=T.V
      U=U-30B
      P=EOF,U/0
      Y=51706B     EOF CODES
      P=EOF
ERR   T=UAM
      Y=152307B    MSG CODES
      Y=Y(52B)
      Y=Y+T
      Y=(ONE)
ERA   T=(ONE)
      P=ERA,T/0
      Y=010224B    ABT CODES
      Y=Y(52B)
      Y=(ONE)
      0
      ..           CONSTANTS
TCD   2401200500B           CODES FOR TAPE SP
UAM   05170655172524202524B
      55474755251601232311B
      07160504551505041125B
      15000000000000000000B
      END
#eor
      MACHINE SUBROUTINE OVERFL (A1)
      0
      1
      0
OVRFL 0
      Z=1
      Z=(I)
      P=OVRFL,Z.O  CHECK FOR RANGE
      Z=2
      Z=(I)
      P=OVRFL
      END
#eor
      MACHINE SUBROUTINE PAUSE
      ABS,ONE=1
      ABS,ZRO=0
      0            HEADING
      0
PAU   0            EXIT/ENTRY
      Z=Z(36B)
      Y=20012B
      U=52305B
      Y=Y(17B)
      Y=U+Y
      Y=Y(36B)
      Y=Y+Z
      Y=(PAK)
      Y=152307B
      U=PAK
      Y=Y(52B)
PAV   T=(ONE)
      P=PAV,T/0    SENSE NOT READY
      Y=Y+U
      Y=(ONE)
      T=(ZRO)
      U=10000B
      Z=-U.T
      Z=Z+U        SET RECALL BIT
      Z=(ZRO)
PAX   V=(ZRO)
      W=U.V
      P=PAU,W=0    SENSE RECALL BIT CLEARED
      Y=2203B
      Y=Y(6)
      Y=Y+14B
      Y=Y(52B)
PAY   T=(ONE)
      P=PAY,T/0
      Y=(ONE)
      P=PAX        GO SENSE HALT BIT
PAK   0            MESSAGE AREA
PAL   0
      END
#eor
      MACHINE SUBROUTINE RBAIEX  (A1,A2)
      0
      2
      0
      0
UBA   0
      V,0=Y.       UNPACK BASE
      P=UBA,Y=0
      W=Z-60B
      P=MULTEX,W(0       DO SUCCESSIVE MULTIPLIES
      P=MULTEX,V=0
      Z=0,Z.       FOR FLT BASE FX EX
      Z,0=Z-
      Z=(UBS)
      Y=(UBK)
      Z=O
      Z=(BRO)      SAVE B REGISTERS
      U,0=Y-
      Z=N
      Z=(BRN)
      Z=L
      Z=(BRL)
      Z,O=U.                  UNPACK
      W=(UBE)                 E0
      X=(UBF)                 E0*
      T=(UBG)                 LN2
      N=777717B
      U=N,Z.                  PACK FRACTIONAL ARG
      Z.N=U-W                 Y-E0,Y=ARG
      Z,0=Z-                  NORMALIZE
      Z.R=Z-X                 Y-E0-E0
      Z,0=Z-                  NORMALIZE
      Y.R=U+W                 Y+E0
      Z.R=Z/Y                 Y-E0/Y+E0=T
      O=O-N                   EXPONENT+48
      T=(UBJ)                 1/3
      U=(UBI)      1/3
      W=(UBL)                 LN(E0)
      S.R=Z*Z                 T2ND
      Z.R=Z+Z                 2T
      W.R=W+Z                 LNE0+2T
      W,0=W-                  NORMALIZE
      Z.R=Z*S                 2T3RD
      T.R=T*Z
      X=(UBH)                 1/7
      Y.R=S*Z
      V.R=S*Y                 T6TH
      U.R=Y*U                 T4TH/5
      T.R=W+T                 1+T2ND/3
      T,0=T-                  NORMALIZE
      T.R=T+U                 1+T2ND/3+T4TH/5
      T,0=T-                  NORMALIZE
      Y.R=V*S
      V.R=X*V                 T6TH/7
      U=(UBN)                 1/9
      U.R=U*Y
      T.R=V+T                 1+T2ND/3+T4TH/5+T6TH/7
      T,0=T-                  NORMALIZE
      T.R=U+T                 1+ECT+T8TH/9
      T,0=T-                  NORMALIZE
      U=(UBC)
      V=(UBD)
      Z.R=Y*S
      Y.R=Z*U
      U=(UBM)
      Z.R=Z*S
      T.R=T+Y
      T,0=T-
      Z.R=Z*V
      T.R=T+Z
      T,0=T-
      V=(UBK)                 FETCH U
      X=(UBG)                 LN2
      Y=O+0                   EXPONENT TO X6
      Y=0,Y.                  PACK EXPONENT=N
      W=V-U
      Y,0=Y-                  NORMALIZE N
      Y.R=X*Y                 N*LN2
      P=LOGA,W/0   SENSE ARGUMENT NOT 1.0
       Y=U
      P=UBX
LOGA  Y.R=Y+T
      Y,0=Y-                  NORMALIZE
      X=(UBS)                 FETCH B
      U.R=Y*X                 LNU*B=ARG
      P=UBB,V)0
      Y=1777B
      Y=Y(60B)
      P=UBX         EXIT
MULTEX U=(EAI)     1.0
      T=Y
      Y.L=V-V      SET Y POSITIVE
      P=UBA,V=0    EXIT O**N = 0
      W=Z
      W=W(-74B)
      Z.L=Z-W      FORCE EXPONENT POSITIVE
      Y=T
      P=LOOP,Z/0   EXPONENT NOT ZERO
      Y=U          SET RESULT TO 1.0
      P=UBA        EXIT
LOOP  Z=Z-1
      P=TEST,Z=0   N**1 = N
      Y=Y*T
      P=LOOP
TEST  Z=U/Y
      P=UBA,W)0    EXPONENT WAS POSITIVE
      Y=Z
      P=UBA
UBB   V=(EAD)                 LOAD LN2
      Z=U                     STORE ARG
      Z=(EAB)                 FOR SIGN TEST
      P=EAE,U)0               USE ABSF(ARG)
      U=-U
EAE   W.R=U/V                 FIND INTEGER
      X=0
      X=0,X.
      X.N=X+W
      W,0=X.
      P=ZINT,W=0
      W=0,W.                  LARGEST INTEGER J
      W,0=W-                  IN ARG/LN2
ZINT  Y.R=W*V
      T=(EAI)                 1
      X=(EAJ)                 LN2/2
      Z.R=U-Y                 ARG-J*LN2
      Y.R=Z-X                 TEST LESS THAN LN2/2
      P=EAH
      W.R=W+T                 ADD 1 TO J
      Z.R=Z-V                 SUBTRACT LN2
EAH   W,L=W.                  UNPACK J
      W=W(L)                  SHIFT TO INT POS
      Z,0=Z-                  NORMALIZE NEW ARG T
      N=W+0                   J TO B6
      S.R=Z*Z                 T2ND
      V=(EAZ)       EXP DEC
      T=(EAI)       1
      U=(EAI)       1
      Y=Z-V         DECREMENT
      T.R=T+Y
      U.R=U-Y
      U,0=U-        NORMALIZE
      T,0=T-                  NORMALIZE
      V=(EAO)
      W=(EAM)
      X=(EAN)
      Y.R=S*V
      S.R=S*Z
      T.R=T+Y
      U.R=U+Y
      U,0=U-        NORMALIZE
      T,0=T-                  NORMALIZE
      Y.R=S*W
      S.R=S*Z
      V=(EAL)
      W=(EAK)
      T.R=T+Y
      U.R=U-Y
      T,0=T-                  NORMALIZE
      U,0=U-        NORMALIZE
      Y.R=S*X
      S.R=S*Z
      T.R=T+Y
      U.R=U+Y
      T,0=T-                  NORMALIZE
      U,0=U-        NORMALIZE
      Y.R=S*V
      S.R=S*Z
      T.R=T+Y
      U.R=U-Y
      T,0=T-                  NORMALIZE
      U,0=U-        NORMALIZE
      Y.R=S*W
      X.R=T+Y
      Z.R=U+Y
      X,0=X-                  NORMALIZE
      Z,0=Z-                  NORMALIZE
      Y.R=X/Z                 A+B/A-B
      T=(EAB)                 FETCH SIGN TEST
      V=(EAI)
      Y,O=Y.                  UNPACK
      N=N+O                   ADD J TO EXP
      Y=N,Y.                  REPACK
      P=UBX,T)0    EXIT IF ARGUMENT IS POSITIVE
      Y.R=V/Y                 OTHERWISE INVERT
UBX   T=(BRO)
      U=(BRN)
      V=(BRL)
      O=T
      N=U
      L=V
      P=UBA                   AND EXIT
      ..           CONSTANTS
EAB   0
BRO   0
BRN   0
BRL   0
UBG   17175427102775750717B
UBH   17154444444444444445B
UBI   17156314631463146315B
UBJ   17165252525252525253B
UBL   60612350675002027060B
UBM   17204000000000000000B
UBE   17175520236314774736B
UBF   16366220424722026021B
UBN   17147070707070707071B
UBC   17145642721350564272B
UBD   17144730473047304731B
EAI   17204000000000000000B
EAO   17147213505642721350B
EAN   17065127726500512772B
EAK   16746233741042727604B
EAP   17174000000000000000B
EAM   17117603701740760370B
EAL   17024106253546725457B
EAD   17175427102775750717B
EAJ   17165427102775750717B
EAZ   00010000000000000000B
UBK   0
UBS   0
      END
#eor
      MACHINE SUBROUTINE RBAREX(A1,A2)
      0
      2
      0
      0
UBA   0
      Z=(UBS)
      P=UBA,Y=0
      Y=(UBK)
      Z=O
      Z=(BRO)      SAVE B REGISTERS
      U,0=Y-
      Z=N
      Z=(BRN)
      Z=L
      Z=(BRL)
      Z,O=U.                  UNPACK
      W=(UBE)                 E0
      X=(UBF)                 E0*
      T=(UBG)                 LN2
      N=777717B    -48 TO B6
      U=N,Z.                  PACK FRACTIONAL ARG
      Z.N=U-W                 Y-E0,Y=ARG
      Z,0=Z-                  NORMALIZE
      Z.R=Z-X                 Y-E0-E0
      Z,0=Z-                  NORMALIZE
      Y.R=U+W                 Y+E0
      Z.R=Z/Y                 Y-E0/Y+E0=T
      O=O-N                   EXPONENT+48
      T=(UBJ)                 1/3
      U=(UBI)      1/3
      W=(UBL)                 LN(E0)
      S.R=Z*Z                 T2ND
      Z.R=Z+Z                 2T
      W.R=W+Z                 LNE0+2T
      W,0=W-                  NORMALIZE
      Z.R=Z*S                 2T3RD
      T.R=T*Z
      X=(UBH)                 1/7
      Y.R=S*Z
      V.R=S*Y                 T6TH
      U.R=Y*U                 T4TH/5
      T.R=W+T                 1+T2ND/3
      T,0=T-                  NORMALIZE
      T.R=T+U                 1+T2ND/3+T4TH/5
      T,0=T-                  NORMALIZE
      Y.R=V*S
      V.R=X*V                 T6TH/7
      U=(UBN)                 1/9
      U.R=U*Y
      T.R=V+T                 1+T2ND/3+T4TH/5+T6TH/7
      T,0=T-                  NORMALIZE
      T.R=U+T                 1+ECT+T8TH/9
      T,0=T-                  NORMALIZE
      U=(UBC)
      V=(UBD)
      Z.R=Y*S
      Y.R=Z*U
      U=(UBM)
      Z.R=Z*S
      T.R=T+Y
      T,0=T-
      Z.R=Z*V
      T.R=T+Z
      T,0=T-
      V=(UBK)                 FETCH U
      X=(UBG)                 LN2
      Y=O+0                   EXPONENT TO X6
      Y=0,Y.                  PACK EXPONENT=N
      W=V-U
      Y,0=Y-                  NORMALIZE N
      Y.R=X*Y                 N*LN2
      P=LOGA,W/0   SENSE ARGUMENT NOT 1.0
      Y=U
      P=UBX
LOGA  Y.R=Y+T
      Y,0=Y-                  NORMALIZE
      X=(UBS)                 FETCH B
      U.R=Y*X                 LNU*B=ARG
      P=UBB,V)0
      Y=1777B
      Y=Y(60B)
      P=UBX         EXIT
UBB   V=(EAD)                 LOAD LN2
      Z=U                     STORE ARG
      Z=(EAB)                 FOR SIGN TEST
      P=EAE,U)0               USE ABSF(ARG)
      U=-U
EAE   W.R=U/V                 FIND INTEGER
      X=0
      X=0,X.
      X.N=X+W
      W,0=X.
      P=ZINT,W=0
      W=0,W.                  LARGEST INTEGER J
      W,0=W-                  IN ARG/LN2
ZINT  Y.R=W*V
      T=(EAI)                 1
      X=(EAJ)                 LN2/2
      Z.R=U-Y                 ARG-J*LN2
      Y.R=Z-X                 TEST LESS THAN LN2/2
      P=EAH
      W.R=W+T                 ADD 1 TO J
      Z.R=Z-V                 SUBTRACT LN2
EAH   W,L=W.                  UNPACK J
      W=W(L)                  SHIFT TO INT POS
      Z,0=Z-                  NORMALIZE NEW ARG T
      N=W+0                   J TO B6
      S.R=Z*Z                 T2ND
      V=(EAZ)       EXP DEC
      T=(EAI)       1
      U=(EAI)       1
      Y=Z-V         DECREMENT
      T.R=T+Y
      U.R=U-Y
      U,0=U-        NORMALIZE
      T,0=T-                  NORMALIZE
      V=(EAO)
      W=(EAM)
      X=(EAN)
      Y.R=S*V
      S.R=S*Z
      T.R=T+Y
      U.R=U+Y
      U,0=U-        NORMALIZE
      T,0=T-                  NORMALIZE
      Y.R=S*W
      S.R=S*Z
      V=(EAL)
      W=(EAK)
      T.R=T+Y
      U.R=U-Y
      T,0=T-                  NORMALIZE
      U,0=U-        NORMALIZE
      Y.R=S*X
      S.R=S*Z
      T.R=T+Y
      U.R=U+Y
      T,0=T-                  NORMALIZE
      U,0=U-        NORMALIZE
      Y.R=S*V
      S.R=S*Z
      T.R=T+Y
      U.R=U-Y
      T,0=T-                  NORMALIZE
      U,0=U-        NORMALIZE
      Y.R=S*W
      X.R=T+Y
      Z.R=U+Y
      X,0=X-                  NORMALIZE
      Z,0=Z-                  NORMALIZE
      Y.R=X/Z                 A+B/A-B
      T=(EAB)                 FETCH SIGN TEST
      V=(EAI)
      Y,O=Y.                  UNPACK
      N=N+O                   ADD J TO EXP
      Y=N,Y.                  REPACK
      P=UBX,T)0    EXIT IF ARGUMENT IS POSITIVE
      Y.R=V/Y                 OTHERWISE INVERT
UBX   T=(BRO)
      U=(BRN)
      V=(BRL)
      O=T
      N=U
      L=V
      P=UBA                   AND EXIT
      ..           CONSTANTS
EAB   0
BRO   0
BRN   0
BRL   0
UBG   17175427102775750717B
UBH   17154444444444444445B
UBI   17156314631463146315B
UBJ   17165252525252525253B
UBL   60612350675002027060B
UBM   17204000000000000000B
UBE   17175520236314774736B
UBF   16366220424722026021B
UBN   17147070707070707071B
UBC   17145642721350564272B
UBD   17144730473047304731B
EAI   17204000000000000000B
EAO   17147213505642721350B
EAN   17065127726500512772B
EAK   16746233741042727604B
EAP   17174000000000000000B
EAM   17117603701740760370B
EAL   17024106253546725457B
EAD   17175427102775750717B
EAJ   17165427102775750717B
EAZ   00010000000000000000B
UBK   0
UBS   0
      END
#eor
      MACHINE SUBROUTINE REMARK  (A1)
      ABS,ONE=1
      ABS,ZRO=0
      0
      1
      0
REM   0
      T=I
      Y=152307B    MSG CODES
      Y=Y(52B)
      Y=Y+T
REN   T=(ONE)
      P=REN,T/0
      T=(ZRO)
      U=10000B
      Z=-U.T       CLEAR HALT BIT
      Y=(ONE)
      Z=Z+U        SET HALT BIT
      Z=(ZRO)
RER   T=(ZRO)
      V=T.U
      P=REM,V=0
      Y=2203B      RC
      Y=Y(6)
      Y=Y+14B
REQ   T=(ONE)
      P=REQ,T/0
      Y=Y(52B)
      Y=(ONE)
      P=RER
      END
#eor
      MACHINE SUBROUTINE SIN (A1)
      0
      1            ONE ARGUMENT
      0
SAA   0
      U=(I)        FETCH ARGUMENT
      T=(SAF)      FETCH 2PI
      Y=U
      P=SAG,U)0    ARGUMENT IS POSITIVE
      U=-U         FORCE POSIVIVE
SAG   V.N=U-T      ARG-2PI
      X=(SAH)      PI
      P=SAI,V(0    ARG(2PI
      W.N=U/T      DIVIDE OUT MULTIPLES OF 2PI
      W,L=W.       UNPACK
      W=W(L)
      W=0,W.       PACK INTEGER PRRTION
      W,0=W-       NORMALIZE
      W.N=W*T
      U.N=U-W
      U,J=U-
SAI   W.N=U-X      ARG-PI
      P=SAJ,W(0    ARG(PI
      W=(SAK)
      U.N=T-U
      U,J=U-
      U.R=W+U
      Y=-Y
SAJ   T=(SAL)      PI/2
      Y=(SAM)
      Y.N=U-T
      P=SAN,Y(0    ARG(PI/2
      U.N=X-U
      W=(SAO)
      U,J=U-
      U.R=U+W
SAN   V=(SAP)      PI/4
      W=(SAQ)
      X.N=V-U
      P=SAR,X)0    PI/4)ARG
      U.N=T-U
      U,J=U-
      U.R=U+W
CAR   S.R=U*U
      T=(CAF)
      U=(CAZ)
      V=(CAM)
      W=(CAH)
      Z.R=S*S
      T.R=S*T
      V.R=V+T
      V,0=V-
      Y.R=U*Z
      Z.R=S*Z
      V.R=V+Y
      V,0=V-
      U=(CAO)
      Y.R=W*Z
      Z.R=S*Z
      V.R=V+Y
      V,0=V-
      W=(CAL)
      Y.R=U*Z
      Z.R=Z*S
      X=(CAQ)
      V.R=V+Y
      V,0=V-
      Y.R=W*Z
      Z.R=S*Z
      V.R=V+Y
      V,0=V-
      W=(SAM)
      Y.R=X*Z
      Y.R=Y+V
      Y,0=Y-
      P=SAA,W)0
      Y=-Y
      P=SAA
SAR   T=(SAS)
      S.R=U*U      X*2
      T.R=U*T
      V=(SAT)      -1/3I
      W=(SAU)      1/5.
      X=(SAV)      -1/7.
      Z.R=S*U      X*3
      U=(SAW)      1/9.
      Y.R=V*Z      -X*3/3.
      Z.R=Z*S      X*5
      T.R=T+Y      X-(X*3/3.)
      T,0=T-
      Y.R=Z*W      X*5/5.
      W=(SAX)      -1/11.
      Z.R=S*Z      X*7
      T.R=Y+T      +X*5/5.
      T,0=T-
      Y.R=Z*X      -X*7/7.
      X=(SAY)      1/13.
      Z.R=Z*S      X*9
      T.R=T+Y      +(-X*7/7.)
      T,0=T-
      Y.R=Z*U      X*9/9.
      Z.R=Z*S      X*11
      T.R=T+Y      +(X*9/9.)
      T,0=T-
      Y.R=Z*W      -X*11/11.
      Z.R=Z*S      X*13
      T.R=T+Y      +(-X*11/11.)
      T,0=T-
      Y.R=Z*X      X*13/13.
      W=(SAM)
      Y.R=T+Y
      Y,0=Y-
      P=SAA,W)0
      Y=-Y
      P=SAA
      ..
CAF   60610000000000000113B
CAZ   17135252525252503360B
CAH   60712237223731501253B
CAO   17006400635431356344B
CAL   61053301240133176055B
CAQ   16634313531506475746B
CAM   17177777777777777775B
SAM   0
SAF   17226220773250420550B
SAK   16426134743306206553B
SAH   17216220773250420550B
SAO   16416134743306206553B
SAL   17206220773250420550B
SAQ   16406134743306206553B
SAP   17176220773250420550B
SAS   17177777777777777776B
SAT   60622525252525252563B
SAU   17114210421042072252B
SAV   60741377137721714335B
SAW   16755616741655620270B
SAX   61111215351223012441B
SAY   16575326540202025530B
      END
#eor
      MACHINE SUBROUTINE SQRT  (A1)
      0
      0
      0
SQRRT 0            SQUARE ROOT
      U=(I)        FETCH ARGUMNET
      K=-60B
      Y,N=U.       UNPACK
      W=(SQD)      START INITIAL APPROXIMATION
      L=1
      T=K,U.       PACK F(X)  AS A FRACTION
      V=(E+L)
      X=T*W
      Y=Y(-74B)    SET X6=0000..0
      S.N=X+V      FIRST APPROX
      V=T/S        F(X)/X1
      P=SQRRT,U=0  SENSE ARGUMENT = 000.....0
      U=N-K        EXPONENT + 60
      Z=L
      W=Z.U        1 IF ODD EXPONENT    0 IF EVEN
      U=U(-1)      EXPONENT /2      2**(P/2)
      Z=Z(-K)      PUT BIT IN POSITION 2**0 OF EXPONENT
      J=W          INDEXING FOR FINAL CORRECTION
      M=U+K        EXPONENT -60
      Y.N=S+V      X1+(F(X)/X1)
      W=Y-Z        1/2(X1+(F(X)/X1)
      X=T/W        F(X)/X2
      P=SQB,U)0    SENSE ARGUMENT ) OR = U/2
      J=J-L        SET NEW INDEXING VALUE FOR FRACTION
SQB   V=(J+SQA)    1/SQRT2  , 1.0  ,  OR SQRT2
      Y.N=W+X
      S=Y-Z        3RD APPROXIMATION
      X=T/S
      W,N=S.       NNPACK
      N=N-K        N IS 0 OR 1
      M=M+N        FINAL EXPONENT
      U=(I)
      W.N=S+X
      X=W-Z
      S=M,X.       PACK
      Y=S*V
      P=SQRRT,U)0
      Y=1777B
      Y=Y(52B)
      P=SQRRT
      ..
      17175520236314774740B       1/SQRT2
SQA   17204000000000000000B
      17205520236314774735B
SQD   17175374211460550654B
      17165374211460550654B
      END
      END
#eor
      MACHINE SUBROUTINE SLITE  (A1)
      ABS,ZRO=0
      0
      1
      0
LIT   0
      T=(I)
      U=(ZRO)      FETCH LITES
      T=(T+MSK)
      Y=-T.U       CLEAR SELECTED LITE
      Y.L=V-T      SET SELECTED LITE
      Y=(ZRO)
      P=LIT,T/0    SENSE NOT CLEAR LITES
      V=*66B
      Y=V.U        CLEAR SENSE LITES
      Y=(ZRO)
      P=LIT
MSK   0
      1
      2
      4
      10B
      20B
      40B
      END
#eor
      MACHINE SUBROUTINE SLITET  (A1,A2)
      ABS,ZRO=0
      0
      2
      0
      0
SLI   0
      T=(I)
      U=(ZRO)      FETCH SENSE LITES
      Z=2
      T=(T+MSK)    FETCH CORRECT BIT
      Y=-T.U       TURN OFF LITE
      Y=(ZRO)
      W=T.U        IF BIT IS O LITE WAS OFF
      P=SLA,W/0
      Y=1
      Y=(J)
      P=SLI
SLA   Z=(J)
      P=SLI
MSK   0
      1
      2
      4
      10B
      20B
      40B
      END
#eor
      MACHINE SUBROUTINE SSWTCH  (A1,A2)
      ABS,ZRO=0
      0
      2
      0
      0
SWT   0
      T=(I)
      U=(ZRO)
      T=(T+MSK)
      V=T.U
      Y=1
      Z=2
      P=SWA,V=0
      Y=(J)        SWITCH WAS DOWN
      P=SWT
SWA   Z=(J)
      P=SWT        SWITCH WAS UP
      ..           CONSTANTS
MSK   0
      100B
      200B
      400B
      1000B
      2000B
      4000B
      END
#eor
      MACHINE SUBROUTINE START
      ABS,ONE=1
      0
      0
STR   0
      Y=STC
STS   T=(ONE)
      P=STS,T/0
      U=152307B    MSG CODES
      U=U(52B)
      Y=Y+U
      Y=(ONE)
      P=STR
      ..           CONSTANTS
STC   23240122240000000000B    START
      END
#eor
      MACHINE SUBROUTINE STOP
      ABS,ONE=1
      0            HEADING
      0
STP   0            EXIT/ENTRY
      I=2
STF   T=(I)
      I=I+1
      P=STJ,T/0    SENSE NO END OF ARGUMENTS
STI   T=(ONE)
      P=STI,T/0    SENSE NOT READY
      Z=Z(44B)
      Y=2324B
      U=1720B
      Y=Y(14B)
      Y=U+Y
      Y=Y(44B)
      Y=Y+Z
      Y=(STK)
      Y=152307B
      Y=Y(52B)
      T=STK
      Y=T+Y
      Y=(ONE)
STD   T=(ONE)
      P=STD,T/0    SENSE NOT READY
      Y=051604B
      Y=Y(52B)
      Y=(ONE)
      0
STJ   U=(T)
      X=*52B
      V=-X.T
      P=STF,V=0
      V=77B
      Y=V.U
      W=34B
      P=STM,Y=0
      V=1
      W=V.U
      P=STJ,W=0    ACTIVE
      V=777706B
      U=U.V        CLEAR PREVIOUS REQUEST
      W=30B
STM   Y=U+W        FORM NEW REQUEST
      V=*52B
      Y=(T)        SEND NEW REQUEST TO ARGUMENT LIST
      V=-V.T
      Y=031117B    CIO CODES
      Y=Y(52B)
      Y=V+Y
STG   T=(ONE)
      P=STG,T/0    SENSE NOT READY
      Y=(ONE)
      P=STF        LOOP
STK   0            MESSAGE AREA
STL   0
      END
#eor
      MACHINE SUBROUTINE TAN  (A1)
      0
      1
      0
TAA   0
      U=(I)        FETCH ARG
      T=(SAF)      FETCH 2PI
      Y=U          SEND ARG TO X6
      P=TAB,U)0    JUMP IF ARG POS
      U=-U         OTHERWISE COMPLEMENT
TAB   V.N=T-U      TEST ARG (2PI
      X=(SAH)      FETCH PI
      P=TAC,V)0    JUMP IF ARG ( 2PI
      V.N=U/T      OTHERWISE SUBTRACT
      V,K=V.       MULTIPLE OF
      V=V(K)       2PI TO REDUCE
      V=0,V.       RANGE
      V,0=V-
      V.R=V*T
      U.R=U-V
      U,0=U-
TAC   S.N=U-X      TEST ARG ( PI
      V=(SAL)      FETCH PI/2
      P=TAD,S(0    JUNP IF ARG ( PI
      W=(SAK)      FETCH 2PU*
      U.R=T-U      2PI-ARG
      U,0=U-       NORMALIZE
      U.R=W+U      2ND TERM DOUBLE PRECISION
      Y=-Y         COMPLEMENT SIGN FLAG
TAD   S.N=U-V      TEST ARG ( PI/2
      T=(SAP)      FETCH PI/4
      P=TAE,S(0    JUMP IF ARG (PI/2
      W=(SAO)      FETCH PI*
      U.R=X-U      PI-ARG
      U,0=U-       NORMALIZE
      U.R=U+W      IND TERM DOUBLE PRECISION
      Y=-Y         COMPLEMENT SIGN FLAG
TAE   Y=(TAF)      STORE SIGN FLAG
      X=(TAG)      FETCH A
      T.N=T-U      TEST ARG ( PI/4
      P=TAR,T(0    JUMP IF ARG ) PI/4
      Z.R=U*U      X2ND TO X7
      S.R=U*X      AX TO X0
      T=(TAH)      FETCH B
      V=(TAI)      FETCH C
      Y.R=Z*T      BX2ND TO X6
      Z.R=Z*U      X3RD TO X7
      T.R=X-Y      A-BX2ND TO X1
      X=(TAJ)      FETCH D
      T,0=T-       NORMALIZE
      Y.R=Z*V      CX3RD TO X6
      Z.R=Z*U      X4TH TO X7
      S.R=S-Y      AX-CX3RD TO X0
      S,0=S-       NORMALIZE
      V=(TAK)      FETCH E
      Y.R=X*Z      DX4TH TO X6
      Z.R=Z*U      X5TH TO X7
      T.R=T+Y      A-BX2ND+DX4TH TO X1
      X=(TAL)      FETCH F
      Y.R=Z*V      EX5TH TO X6
      Z.R=Z*U      X6TH TO X7
      T,0=T-       NORMALIZE
      S.R=S+Y      AX-CX3RD+EX5TH TO X0
      V=(TAM)      FETCH G
      Y.R=Z*X      FX6TH TO X6
      Z.R=Z*U      X7TH TO X7
      T.R=T-Y      A-BX2ND+DX4TH-FX6TH TO X1
      X=(TAF)      FETCH SIGN TEST
      T,0=T-       NORMALIZE
      Y.R=Z*V      GX7TH TO X6
      Z.R=Z*U      X8TH TO X7
      S.R=S-Y      AX ETC -GX7TH
      S,0=S-       NORMALIZE
      P=TAN,X)0    TEST SIGN
      S=-S         IF NEG COMPLEMENT
TAN   T.R=T+Z      A+BXETC+X8TH
      T,0=T-       NORMALIZE
      Y.R=S/T      DIVIDE
      P=TAA        EXIT
TAR   W=(SAQ)      FETCH PI/2*
      X=(TAG)      FETCH A
      U.N=V-U      PI/2-ARG
      U,0=U-       NORMALIZE
      U.R=U+W      PI/2-ARG+PI/2*
      Z.R=U*U      X2ND TO X7
      S.R=U*X      AX TO X0
      T=(TAH)      FETCH B
      V=(TAI)      FETCH C
      Y.R=Z*T      BX2ND TO X6
      Z.R=Z*U      X3RD TO X7
      T.R=X-Y      A-BX2ND TO X1
      X=(TAJ)      FETCH D
      T,0=T-       NORMALIZE
      Y.R=Z*V      CX3RD TO X6
      Z.R=Z*U      X4TH TO X7
      S.R=S-Y      AX-CX3RD TO X0
      S,0=S-       NORMALIZE
      V=(TAK)      FETCH E
      Y.R=X*Z      DX4TH TO X6
      Z.R=Z*U      X5TH TP X7
      T.R=T+Y      A-BX2ND+DX4TH TO X1
      X=(TAL)      FETCH F
      Y.R=Z*V      EX5TH TO X6
      Z.R=Z*U      X6TJ TO X7
      T,0=T-       NORMALIZE
      S.R=S+Y      AX-CX3RD+EX5TH TO X0
      V=(TAM)      FETCH G
      Y.R=Z*X      FX6TH TO X6
      Z.R=Z*U      X7TH TO X7
      T.R=T-Y      A-BX2ND+DX4TH-FX6TH TO X1
      X=(TAF)      FETCH SIGN TEST
      T,0=T-       NORMALIZE
      Y.R=Z*V      GX7TH TO X6
      Z.R=Z*U      X8TH TO X7
      S.R=S-Y      AX ETC -GX7TH
      S,0=S-       NORMALIZE
      P=TAO,X)0    TEST SIGN
      S=-S
TAO   T.R=T+Z      A+BXETC+X8TH
      T,0=T-       NORMALIZE
      Y.R=T/S      DIVIDE
      P=TAA        EXIT
TAF   0
      ..
TAG   17447567021000000000B
TAH   17437157062000000000B
TAI   17424077370000000000B
TAJ   17376260340000000000B   51975
TAK   17346611000000000000B
TAL   17314730000000000000B
TAM   17254400000000000000B
SAF   17226220773250420550B
SAH   17216220773250420550B
SAK   16426134743306206553B
SAL   17206220773250420550B
SAO   16416134743306206553B
SAP   17176220773250420550B
SAQ   16406134743306206553B
      END
#eor
      MACHINE SUBROUTINE TANH (A1)
      0
      1
      0
TANH  0
      U=(I)
      W=(EAZ)
      V=(EAD)      LOAD LN2
      Z=U
      P=EAE,U)0
      U=-U
EAE   U=U+W
      W.R=U/V      FIND INTEGER
      X=0
      X=0,X.
      X.N=X+W
      W,0=X.
      P=ZINT,W=0
      W=0,W.
      W,0=W-       IN ARG/LN2
ZINT  Y.R=W*V
      Z.R=U-Y      ARG-J*LN2
      W,L=W.       UNPACK J
      T=(EAI)
      W=W(L)       SHIFT TO INTEGER POSITION
      Z,0=Z-       NORMALIZE NEW ARG
      N=W          J TO B6
      S.R=Z*Z      T**2
      V=(EAZ)
      U=T          1 TO T AND U
      Y=Z-V        DECREMENT
      T.R=T+Y
      U.R=U-Y
      U,0=U-
      T,0=T-
      V=(EAO)
      W=(EAM)
      X=(EAN)
      Y.R=S*V
      S.R=S*Z
      T.R=T+Y
      U.R=U+Y
      U,0=U-       NORMALIZE
      T,0=T-       NORMALIZE
      Y.R=S*W
      S.R=S*Z
      V=(EAL)
      W=(EAK)
      T.R=T+Y
      U.R=U-Y
      U,0=U-
      T,0=T-       NORMALIZE
      Y.R=S*X
      S.R=S*Z
      T.R=T+Y
      U.R=U+Y
      U,0=U-       NORMALIZE
      T,0=T-       NORMALIZE
      Y.R=S*V
      S.R=S*Z
      T.R=T+Y
      U.R=U-Y
      U,0=U-       NORMALIZE
      T,0=T-
      Y.R=S*W
      X.R=T+Y
      Z.R=U+Y
      Z,0=Z-
      X,0=X-
      Y.R=X/Z      A+B/A-B
      T=(I)        FETCH ARGUMENT FOR SIGN TEST
      V=(EAI)
      Y,M=Y.       UNPACK
      N=N+M        ADD J TO EXP
      Y=N,Y.       REPACK
      S.N=Y-V
      U.N=Y+V
      Y=S/U
      P=TANH,T)0
      Y=-Y
      P=TANH
      ..
EAI   17204000000000000000B
EAO   17147213505642721350B
EAN   17065127726500512772B
EAK   16746233741042727604B
EAP   17174000000000000000B
EAM   17117603701740760370B
EAL   17024106253546725457B
EAD   17175427102775750717B
EAZ   00010000000000000000B
      END
#eor
      MACHINE SUBROUTINE TIME (A1,A2)
      ABS,ONE=1
      0
      2
      0
      0
TIM   0
      K=5
      J=0
      Y=0
TIQ   T=(ONE)
      P=TIQ,T/0
      Y=(TCM)
TIN   P=TIP,I=0
TIO   T=(I)
      Y=T
      Y=(J+TCM)
      J=J+1
      I=I+1
      P=TIP,J=K
      P=TIO,Y/0
TIP   Y=152307B    MSG CODES
      V=TCD
      Y=Y(52B)
      Y=Y+V
      Y=(ONE)
      P=TIM
      ..
TCD   24111505555555555555B
TCM   0
      0
      0
      0
      0
      0
      END
