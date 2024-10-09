      MACHINE SUBROUTINE RANF (A1)
      0
      0
      0
RAND  0
      T=(XND)
      U=(XPLR)
      J=-60B
      V=0,T.
      W=0,U.
      X.D=V*W
      V=J,X.
      Y,0=V-
      Z=X
      Y=(I)
      Z=(XND)
      P=RAND
      ..
XND   7777777770000011B
XPLR  77777775B
      END
#eor
      MACHINE SUBROUTINE XLOCF  (A1)
      0
      1
      0
XLO   0
      Y=I
      P=XLO
      END
#eor
      MACHINE SUBROUTINE INPUTB  (A1,A2,A3)
      ABS,ONE=1
      0
      3
      0
      0
      0
INO   0
      P=FIN,I=0    FIRST ENTRY
      P=LIN,I(0    LAST ENTRY
      T=(ARL)
      T=(T)        ADDRESS OF ARG LIST TO B
INA   U=(B)
      V=1
      X=77B
      W=X.U
      P=INC,W=0    BUFFER NOT PREVIOUSLY USED
      W=V.U
      P=ING,W=0
      U=(B+2)      IN COUNTER
      V=(B+3)      OUT COUNTER
      W=U-V
      P=INC,W=0    IN = OUT BUFFER IS EMPTY
      W=(V)        FETCH DATA FROM BUFFER
      Y=W
      Y=(I)
      I=I+1        ADVANCE FOR NEXT STORE
      Y=V+1        ADVANCE OUT COUNT
      V=(B+4)      LAST
      U=Y-V
      P=INB,U=0    GO RESET OUT = FIRST
      Y=(B+3)
      P=INO,J=0
      J=J-1
      P=INO,J=0
      P=INA
INB   V=(B+1)      FIRST
      Y=V
      Y=(B+3)      SET OUT = FIRST
       P=INO
INC   U=(B)
      V=70B
      V=V.U
      W=V-30B
      P=INR,W=0    GO RESET IN AND OUT
      V=77B
      W=V.U
      P=IND,W=0
      V=1
      W=V.U
      V=(RCL)      RECALL CODES
      P=IND,W/0
INE   W=(ONE)
      P=INE,W/0
      Y=V
      Y=(ONE)
      P=INC
INR   U=(B+1)      FIRST
      Y=U
      Y=(B+2)
      Y=(B+3)
      P=INO
IND   V=777700B
      W=12B
      Y=V.U
      Y=Y+W
      Y=(B)
      V=B
      Y=031117B
      Y=Y(52B)
      Y=Y+V
      Y=(ONE)
ING   V=(RCL)
INF   U=(ONE)
      P=INF,U/0
      Y=V
      Y=(ONE)
      P=INA
FIN   P=FIB,J)0
      J=-J
      T=(J)
      U=*6
      V=T.U
      P=FIE,V/0    FILE NAME
      U=(TCD)      CODES FOR TAPE
      V=12B
      V=0,V.       PACK
      Z=V
      V,0=V-       NORMALIZE DIVISOR
      T=0,T.       PACK DIVIDEND
      W=T/V
      W,L=W.
      W=W(L)
      Y=0,W.
      X.D=Z*Y
      Y.N=T-X      REMAINDER
      P=FIF,W=0
      V=V+33B
      Y=Y+33B
      V=U+V        ADD IN HIGH ORDER DIGIT
      V=V(6)       SHIFT UP FOR NEXT DIGIT
      T=Y+V        ADD IN LOW ORDER DIGIT
      T=T(30B)
      P=FIE
FIF   Y=Y+33B
      T=Y+U
      T=T(36B)
FIE   U=*52B
      V=T.U
      I=2
FIC   W=(I)
      P=ERR,W=0    NO FILE NAME
      X=W.U
      Y=X-V
      I=I+1
      P=FIC,Y/0
      J=W
FIG   T=(J)
      U=77B
      X=1
      W=T.U
      P=FIH,W=0
      W=T.X
      P=FIG,W=0    BUSY
FIH   X=T.U
      Y=V+X
FIB   Y=J
      Y=(ARL)
FIL   T=(ONE)
      P=FIL,T/0
FIK   U=77B
      T=(J)
      V=T.U
      P=FIJ,V=0
      U=1
      V=T.U
      P=FIK,V=0
FIJ   T=(J)
      U=74B
      V=T.U
      W=V-14B
      P=FII,W=0    1 1XX
      T=(J+2)      IN
      U=(J+3)      OUT
      V=T-U
      P=INO,V=0    NO DATA IN BUFFER
      T=(J)
      U=4
      V=T.U
      P=INO,V=0
FII   U=(J)        DATA AND WRITE MODE
      V=777706B    OR 1 1XX
      W=20B
      Y=V.U
      Y=Y+W        FILE NAME, 2X
      Y=(J)
      Y=031117B
      U=J
      Y=Y(52B)
      Y=Y+U        CIO,ARG LIST
      Y=(ONE)
      P=INO
LIN   T=(ARL)
       T=(T)
      V=70B
       W=V.T
      X=W-20B
      P=INR,X=0
      X=W-30B
      P=INR,X=0
       V=(B+2)     IN
      Y=V
       Y=(B+3)     OUT
      W=12B
      V=777700B
       Y=V.T
      Y=Y+W
       Y=(B)
       V=B
      Y=031117B
      Y=Y(52B)
      Y=Y+V
      Y=(ONE)
      V=1
       U=(B)
      W=V.U
      P=LIN,W/0
      W=(RCL)
      Y=W
LIA   W=(ONE)
      P=LIA,W/0
      Y=(ONE)
LIB   W=(ONE)
      P=LIB,W/0
      P=LIN
ERR   Y=152307B
      Y=Y(52B)
      U=MSG
      Y=Y+U
      Y=(ONE)
      Y=010224B
      Y=Y(52B)
ERA   U=1
      P=ERA,U/0
      Y=(ONE)
      0
      ..
MSG   02111655172524202524B    BIN ERROR
      55474755251601232311B
      07160504551505041125B
      15000000000000000000B
TCD   00000000002401200500B
RCL   22031400000000000000B
ARL   0
      END
#eor
      MACHINE SUBROUTINE INPUTC  (A1,A2,A3)
      ABS,ONE=1
*     GENERALIZED DATA INPUT FOR FORTRAN OBJECT PROGRAMS
      0
      3
      0
      0
      0
DIN   0            DATA INPUT ROUTINE
      P=LAST,I(0   LAST ENTRY
      P=FIRST,I=0  FIRST ENTRY
      Z=0
      Z=(DFLG)     CLEAR DATA FLAG -- NOT ALL HOLERITH
RET   Y=I          I IS A VALID DATA ADDRESS
      T=(FCC)      FORMAT CHARACTER POINTER
      Y=(TMA)      SAVE DATA ADDRESS
      Y=J
      Y=(ARY)      STORE ARRAY LENGTH
      U=(DCC)      DATA CHARACTER POINTER
      O=FOR
      O=O+12B      LIMIT
      J=T
      K=U
      T=(XIM)      ITEM REPEAT COUNTER
      P=DIB,T/0    REPEAT PREVIOUS ITEM
DIL   P=CNA,J/O
      R=LNX        GO FETCH NEXT 10 CHARACTERS
CNA   T=(J)
      J=J+1
      S=T
      U=T-55B
      P=DIL,U=0    SENSE BLANK CODE
DIJ   U=T-52B
      P=DIC,U=0
DII   Y=0
      Z=1          FORCE ITEM MULTIPLIER TO 1
      Y=(XFG)
      Z=(MUL)
DIE   T=S-33B
      P=DID,T(0    LETTER , M FIELD IS BLANK
      U=S-55B
      P=DIL,U=0    ADVANCE TO NON-BLANK CHARACTER
      U=S-45B
      P=DID,U)0    SPECIAL CHARACTER, M FIELD IS BLANK
      Z=(XFG)      CONVER M FIELD TO BINARY
DIK   Y=Y(1)
      U=Y
      Y=Y(2)
      Y=Y+U        MULTIPLY BY 10
      Y=Y+T        ADD IN NEXT DIGIT
      Y=(MUL)
      T=(J)
DIO   P=CNB,J/O
      R=LNX
CNB   T=(J)
      J=J+1
      U=T-55B
      S=T
      P=DIE,U/0
      P=DIO
DID   T=S-51B
      P=DIF,T/0    SENSE NO OPEN PAREN.
      U=(XPG)      GROUP REPEAT COUNT
      T=U-1
      P=ERR,T/0
      U=(MUL)
      V=(XFG)
      Y=U
      Z=J
      Y=(XPG)
      Y=V
      T=(FAD)
      Y=(XPAREN)   FLAG NOT ZERO IF MULTIPLIER WITH (
      T=T(52B)
      Z=T+Z
      Z=(LOP)      ADDRESS OF LAST (
      P=DIL
DIF   T=S-50B
      P=SLA,T=0    GO PROCESS N/
      T=S-11B
      P=INT,T=0    GO PROCESS NIW
      T=S-30B
      P=XSK,T=0    GO PROCESS NX
      T=S-1        A
      P=ALA,T=0    GO PROCESS NAW
      T=S-5        E
      P=EFP,T=0    GO PROCESS NEW.D
      T=S-6        F
      P=FFP,T=0    GO PROCESS NFW.D
      T=S-17B
      P=OTA,T=0    GO PROCESS NOW
      T=S-10B
      P=HTA,T=0     GO PROCESS NH
      T=S-20B
      P=PTA,T=0    GO PROCESS NP
      T=S-45B
      P=PLS,T=0    GO PROCESS + SIGN
      T=S-46B
      P=MNS,T=0    GO PROCESS MINUS SIGN
      T=S-4
      P=EFP,T=0
      P=ERR
ERR   T=(EPK)      MSG CODES
      Y=FNO        ADDRESS OF FORMAT NUMBER
      Y=Y+T
ERA   T=(ONE)
      P=ERA,T/0
      Y=(ONE)
      Y=010224B    ABT CODES
ERB   T=(ONE)
      P=ERB,T/0
      Y=Y(52B)
      Y=(ONE)
      0            STOP
DIB   T=(NXS)      FETCH ENTRY ADDRESS TO LAST SPECIFICATION
      L=T
XYZ   P=L          TRANSFER TO RE-ENTRY POINT
DIC   T=(XPG)
      P=DIM,T/0    REPEAT GROUP
DOH   P=DOG,J/O
      R=LNX
DOG   T=(J)
      J=J+1
      U=T-55B
      P=DOH,U=0
      V=T-52B
      P=DOH,V=0
      V=T-56B
      P=DOH,V=0    SENSE FOR SEQUENCE ),
      S=T
      P=DII,S/0
      T=(BAS)      INITIAL ADDRESS OF FORMAT
      Y=T
      Y=(FAD)
      R=LNX
      Z=1
      Z=(XPG)
ENDF  R=RNX
      P=DIL
DIM   Y=T-1
      Y=(XPG)
      P=DIG,Y/0
      U=(XPAREN)
      P=ENDH,U/0
      T=(DFLG)
      P=DIN,T/0    STATEMENT WAS PURE HOLERITH -- DATA NOT ENCOUNTERED
      Z=1
      Z=(XPG)
ENDH  P=DOH,Y=0
DIG   T=(LOP)      ADDRESS OF LAST (
      N=T
      Y=T
      Y=Y(22B)
      Y=Y-1
      Y=(FAD)      FORMAT WORD POINTER
      R=LNX
      J=N
      P=CNA,J/O
      R=LNX
      P=CNA
LNX   0
      U=(FAD)
      W=Y
      Y=U+1
      U=(Y)
      Y=(FAD)
      L=FOR
      S=77B
LNA   U=U(6)
      Y=S.U
      Y=(L)
      L=L+1
      P=LNA,L/O
      J=FOR
      Y=W
      P=LNX
FWD   0            CONVERT DIGITS UNTIL NON-DIGIT CHARACTER IS FOUND
      Y=0          CLEAR ASSEMBLY WORD
FWC   P=FWA,J/O
      R=LNX
FWA   T=(J)
      S=T
      P=ERR,T=0    END OF RECORD
      U=T-55B
      P=FWE,U=0
      U=T-33B
      P=FWB,U(0    CHARACTER IS A LETTER
      V=T-45B
      P=FWB,V)0    SPECIAL CHARACTER
      Y=Y(1)
      V=Y
      Y=Y(2)
      Y=Y+V        MULTIPLY BY 1/
      Y=Y+U        ADD IN NEXT DIGIT
FWE   J=J+1
      P=FWC
FWB   Y=(VLU)      STORE INTEGER TO VLU
      P=FWD        EXIT FROM CONVERSION
LAST  T=(DFLG)
      P=DIN,T=0    EXIT FORMAT WAS NOT ALL HOLERITH
      P=RET        GO PROCESS FORMAT
FIRST T=(K)        FETCH FORMAT NUMBER
      Y=T
      U=111620B    INP
      Y=Y+U
      Y=Y(52B)     INPXXX
      Y=(FNO)
FIN   P=FIB,J)0
      J=-J
      T=(J)
      U=*6
      V=T.U
      P=FIE,V/0    FILE NAME
      U=(TCD)      CODES FOR TAPE
      V=12B
      Z=V
      V=0,V.       PACK
      V,0=V-       NORMALIZE DIVISOR
      T=0,T.       PACK DIVIDEND
      W=T/V
      W,L=W.
      W=W(L)
      Y=0,W.
      X.D=Z*Y
      Y.N=T-X      REMAINDER
      P=FIF,W=0
      V=V+33B
      Y=Y+33B
      V=U+V        ADD IN HIGH ORDER DIGIT
      V=V(6)       SHIFT UP FOR NEXT DIGIT
      T=Y+V        ADD IN LOW ORDER DIGIT
      T=T(30B)
      P=FIE
FIF   Y=Y+33B
      T=Y+U
      T=T(36B)
FIE   U=*52B
      I=2
      V=U.T
FID   W=(I)
      I=I+1
      P=FIC,W/0
      T=UAM
ERRA  U=(EPK)      MSG CODES
      Y=T+U        ADDRESS OF MESSAGE
ERRB  T=(ONE)
      P=ERRB,T/0
      Y=(ONE)
      P=ERR        GO SEND FORMAT NUMBER
FIC   X=W.U
      X=X-V
      P=FID,X/0
      J=W
      P=ADDR,J/0
      T=UAM
      P=ERRA       SEND UNASSIGNED MEDIUM MESSAGE
ADDR  J=W
      T=(J)
      U=*52B
      X=-U.T
      Y=V+X
FIB   Y=FOR
      Z=DAT        ADDRESS OF DATA
      Y=(FCC)      FORMAT CHARACTER  POINTER
      Z=(DCC)      DATA CHARACTER POINTER
      Z=0
      Y=0
      Y=(FFLG)     E OR FL FLGA
      Y=(MUL)
      Z=(XPAREN)
      Y=(SCA)      RESET P SCALAR
      Z=(SGN)
      Z=(XIM)
      Z=J
      Z=(ARL)      SAVE ADDRESS OF ARGUMENT LIST
      Z=1
      Z=(XPG)      SET GROUP TO 1
      T=(XYZ)
      U=*14B
      Y=U.T
      Y=(XYZ)
      Z=(DFLG)
      Z=K+1
      Z=(FAD)
      N=FOR
      Z=K
      S=77B
      Z=(BAS)
FOB   L=12B
      T=(K+1)      FORMAT ADDRESS +1
FOA   T=T(6)
      Y=T.S        SAVE LOWER 6 BITS
      Y=(N)        STORE TO FOR
      N=N+1        ADVANCE STORAGE ADDRESS
      L=L-1        DECREMENT CHARACTER COUNTER
      P=FOA,L/0    WORD NOT PROCESSED
FOC   R=RNX        GO READ ONE RECORD
      P=DIN        EXIT TO RECIEVE DATA ADDRESS
RNX   0            PUT NEXT RECORD INTO BUFFER IBF
      R=RNZ        PICK RECORD FROM CIRCULAR BUFFER
      K=DAT
      S=77B
      L=IBF        ADDRESS OF BUFFER
      N=DAT        ADDRESS OF WORKING BUFFER
      K=DAT
RNV   M=12B
      T=(L)
RNU   T=T(6)
      Y=T.S        SAVE SIX BIT CODE
      M=M-1        DECREMENT CHARACTER COUNTER
      P=RNW,Y=0    END OF RECORD
      Y=(N)        STORE SIX BIT CODE
      N=N+1        ADVANCE FOR NEXT STORE
      P=RNU,M/0
      L=L+1        ADVANCE TO NEXT 1/ CHARACTERS
      P=RNV
RNW   Y=55B
      M=DAT
      N=N-M
      M=226B
RNY   P=RNX,N=M    SENSE 150 CHARACTERS STORED
      Y=(N+DAT)    STORE SPACE CODE
      N=N+1        ADVANCE STORAGE ADDRESS
      P=RNY        GO TEST FOR COMPLETION OF LOOP
RNZ   0            EXIT ENTRY
      K=IBF        BASE ADDRESS OF BUFFER
      L=K+16B
      T=(ARL)
      N=0
      M=T          ARGUNENT LIST ADDRESS
RNA   T=(M)
      U=77B
      V=T.U
      P=RNL,V/0    READ HAS BEEN REFERENCED
      V=11B
      Y=T+V
      Y=(M)
RNL   U=1
      V=T.U
      P=RXU,V/0
      U=40B
      V=T.U
      P=RNA,V/0    RWND,BKSP OR RWND INT.
RXU   U=77B
      V=T.U
      V=V-14B
      P=RER,V=0    SEND END OF RECORD
      U=4
      V=T.U
      P=RNB,V=0    SENSE READ MODE
      T=(M+2)      IN
      U=(M+3)      OUT
      V=T-U
      P=RNB,V=0
RER   T=(M)
      V=777706B
      U=20B
      Y=T.V
      Y=Y+U
      Y=(M)
      P=RNT
RNB   T=(M+3)      OUT
      U=(M+2)      IN
      V=T-U
      P=RNC,V=0
      U=(T)        DATA
      V=7777B
      Y=U
      X=V.U
      P=RND,X/0    NO END OF LINE
      N=7          SET END OF LINE FLAG
      P=RNQ,U=0    SNESE WHOLE WORD ZERO
RND   T=77B
      U=55B
RNO   V=Y.T
      P=RNE,V/0    NO ZERO CODES
      Y=Y+U
      T=T(6)
      U=U(6)
      P=RNO
RNE   Y=(K)
      T=(LCT)
      U=(M+3)      OUT
      V=(M+4)      LIMIT
      W=U+1        OUT + 1
      X=W-V
      Y=T+1
      Y=(LCT)
      P=RNN,X=0    OUT+1 = LIMIT
      Y=W
      Y=(M+3)      ADVANCE OUT
RNF   K=K+1
      P=RNG,N/0    END OF LINE
      P=RNA,K/L    SENSE NO LIMIT
RNG   P=RNH,K=L    SENSE LIMIT
      T=(COA)      ALL BLANKS
      Y=T
      Y=(K)
      P=RNF
RNQ   T=(M+3)      OUT
      U=(M+4)      LIMIT
      V=T+1        OUT +1
      W=U-V
      P=RNR,W=0    SENSE EQUAL TO LIMIT
      Y=V
      Y=(M+3)      ADVANCE OUT
      P=RNG
RNR   T=(M+1)      FIRST
      Y=T
      Y=(M+3)      SET OUT EQUAL TO FIRST
      P=RNG
RNN   U=(M+1)      FIRAT
      Y=U
      Y=(M+3)
      P=RNF
RNH   T=(LCT)
      U=T-1000B
      Z=0
      Z=(K)
      P=RNZ,U(0
      Y=0
      Y=(LCT)      CLEAR COUNTER
      T=(M)
      U=1
      V=T.U
      P=RNZ,V=0    ACTIVE
      U=70B
      V=T.U
      W=V-20B
      P=RNZ,W=0    END OF RECORD
      W=V-30B
      P=RNZ,W=0    END OF FILE
      U=777700B
      Y=T.U
      V=10B
      Y=Y+V
      Y=(M)
RNI   T=(ONE)
      P=RNI,T/0
      Y=031117B    CIO CODES
      U=M
      Y=Y(52B)
      Y=Y+U
      Y=(ONE)
      P=RNZ
RNC   T=(M)
      U=77B
      V=T.U
      P=RNK,V=0
      U=1
      V=T.U
      P=RNB,V=0
RNK   U=70B
      V=U.T
      Y=0
      W=V-20B
      P=EOFMSG,W=0
      W=V-30B      END OF FILE
      P=EOFMSG,W=0
      U=777702B
      Y=U.T
      U=10B
      Y=Y+U
      Y=(M)
RNT   U=M
      Y=031117B    CIO CODES
      Y=Y(52B)
      Y=Y+U
RNJ   T=(ONE)
      P=RNJ,T/0
      Y=(ONE)
      V=(RZB)      RECALL CODES
      U=(M)        FETCH FILE NAME
RNJA  T=(ONE)
      P=RNJA,T/0
      Y=V
      Y=(ONE)      SEND RECALL
RNJB  U=U(73B)     SHIFT INACTIVE BIT TO SIGN POSITION
      P=RNB,U(0    SENSE INACTIVE
      U=(M)        FETCH FILE NAME
      P=RNJB
EOFMSG  T=(ONE)
      P=EOFMSG,T/0
      Y=152307B    MSG CODES
      U=MESG
      Y=Y(52B)
      Z=Y+U
      Z=(ONE)
      J=2          PREPARE TO ENDFILE ALL BUFFERS
      S=*52B       MASK
RNJC  T=(J)        FETCH ARGUMENT
      J=J+1
      P=RNJF,T=0   END OF ARGUMENTS
      U=-S.T       MASK OFF ADDRESS
      P=RNJC,U=0   GET NEXT ARGUMENT
RNJD  V=(U)        FILE NAME
      T=77B
      Z=777700B
      W=T.V
      X=1
      P=RNJC,W=0
      W=X.V
      P=RNJD,W=0   SENSE FILE ACTIVE
      Y=Z.V        CLEAR FUNCTION
      X=34B
      Y=Y+X
      Y=(U)        STORE TO PARAMETER LIST
RNJE  T=(ONE)
      P=RNJE,T/0
      Y=031117B    CIO
      Y=Y(52B)
      Y=Y+U
      Y=(ONE)      SEND CIO REQUEST
      P=RNJC
RNJF  Y=051604B    END CODES
      Y=Y(52B)
DLAY  T=(ONE)
      P=DLAY,T/0
      Y=(ONE)
      Y=010224B    ABT CODES
      P=ERB
PTA   T=(MUL)
      Y=-T         TAKE COMPLIMENT OF SCALAR
      Z=0
      Y=(SCA)      SET SCALAR
      Z=(SGN)
      P=SLB
PLS   Y=0          PLUS SIGN
PLT   Y=(SGN)
      R=FWD
      T=(J)
      U=T-20B      P CODE
      P=ERR,U/0    ERROR ** SIGN NOT FOLLOWED BY P
      T=(VLU)
      U=(SGN)
      Y.L=T-U      CORRECT SCALE FACTOR  FOR + OR - VALUE
      Y=-Y
      Y=(SCA)
      J=J+1
      P=SLB
MNS   Y=*74B       ALL ONES
      P=PLT        GO SET SIGN FOR MINUS
XOV   0            CHECK FOR OVERFLOW OF DATA SOURCE
      T=(WTH)
      U=K
      V=DAT
      W=U-V
      W=W-226B
      W=W+T        ADD IN WIDTH
      P=ERR,W)0
      P=XOV
EXT   P=EXA,J/O
      R=LNX
EXA   T=(J)
      U=T-56B
      P=EXB,U/0    SENSE NO COMMA
      J=J+1        ADVANCE OVER COMMA CODE
      P=EXT
EXB   T=(TMA)
      I=T
      T=(XIM)
      Z=T-1
      Z=(XIM)
      Y=(I)        STORE DATA
      Z=J
      Z=(FCC)
      Y=K
      Y=(DCC)
      T=(ARY)
      J=T          RESTORE ARRAY LENGTH
      P=DIN,J=0    EXIT, NO ARRAY
      I=I+1        ADVANCE FOR NEXT DATA STORE
      J=J-1        REDUCE ARRAY LENGTH
      P=DIN,J=0    EXIT, ARRAY SATISFIED
      P=RET        GO PROCESS NEXT ELEMENT
INT   T=(MUL)      CONVERT NIW
      Y=T
      Y=(XIM)
      R=FWD
      T=(VLU)
      Y=T
      Y=(WTH)
INA   R=XOV        CHECK FOR OVERFLOW OF DATA
      Y=0
      S=0          SIGN RECORD
      T=(WTH)      FIELD WIDTH
      M=K
      K=T+K        ADVANCE DATA POINTER
      L=T
INB   P=INE,L=0    CONVERSION COMPLETE
      T=(M)        FETCH ONE CHARACTER
      M=M+1        ADVANCE FOR NEXT CHARACTER
      L=L-1        REDUCE FIELD WIDTH BY 1
      U=T-55B
      P=INB,U=0    SKIP OVER BLANK COLUMNS
      S=0
      U=T-45B
      P=INC,U=0    SET SIGN FLAG FOR +
      U=T-46B
      P=IND,U/0
      S=-S         SET SIGN FLAG TO ALL ONES
INC   P=INE,L=0    CONVERSION COMPLETE
      T=(M)        PICK UP NEXT CHARACTER
      M=M+1        ADVANCE FOR NEXT CHARACTER
      L=L-1
IND   U=T-33B
      W=T-55B
      P=INF,W=0
      V=T-45B
      P=ERR,V)0    CODE NOT A DIGIT
ING   Y=Y(1)
      W=Y
      Y=Y(2)
      Y=Y+W        TIMES 10
      Y=Y+U         ADD IN NEXT DIGIT
      P=INC        GO TEST FOR END OF CONVERSION
INE   Y.L=Y-S      CORRECT INTEGER FOR SIGN
      Z=INA        RE-ENTRY POINT FOR MULTIPLE ITEM
      Z=(NXS)
      P=EXT        GO RESTROE REGISTERS ADN EXIT
INF   U=0
      P=ING
OTA   T=(MUL)      CONVERT NOW
      Y=T
      Y=(XIM)      STORE ITEM REPEAT COUNT
      R=FWD        GET FIELD WIDTH
      T=(VLU)
      Y=T
      Y=(WTH)      FIELD WIDTH
OTB   R=XOV        CHECK FOR OVERFLOW OF DATA SOURCE
      T=(WTH)
      Y=0
      L=T
      S=0          CLEAR SIGN REGISTER
      Y=(SGN)
      U=0
OTG   T=(K)
      W=T-55B
      P=OTF,W=0
      W=T-45B
      P=OTC,W/0
      S=0
      P=OTD
OTC   W=T-46B
      P=OTE,W/0    FIRST NON-BLANK IS A DIGIT
      S=-S
OTD   K=K+1
      L=L-1
      P=OTH,L=0    CONVERSION COMPLETE
      P=OTE
OTF   K=K+1
      L=L-1
      P=OTG,L/0
      P=OTH        CONVERSION COMPLETE
OTE   T=(K)
      Y=Y(3)
      V=T-55B
      P=OTJ,V=0
      V=T-33B
OTJ   Y=Y+V        ASSEMBLE DIGIT INTO Y FROM V
      V=V(-3)
      U=U+V        SAVE RESIDUE
      P=OTD
OTH   Y.L=Y-S
      P=ERR,U/0    NON-OCTAL DIGITS IN NUMERIC FIELD
      Z=OTB
      Z=(NXS)
      P=EXT
XSK   R=XOV        CHECK FOR OVERFLOW OF DATA
      T=(MUL)
      K=T+K        ADVANCE DATA POINTER BY T
      P=SLB
SLA   R=RNX
      T=(MUL)
      Y=T-1
      Y=(MUL)
      P=SLA,Y/0
      K=DAT        RESET POINTER FOR NEW RECORD
SLB   P=NXA,J/O
      R=LNX
NXA   T=(J)
      S=T
      P=ERR,T=0    END OF RECORD
      U=T-56B
      P=NXB,U/0
      J=J+1        ADVANCE OVER COMMA
      P=SLB        ADVANCE TO NEXT CODE IF COMMA
NXB   U=T-55B
      P=DIL,U/0
      J=J+1
      P=SLB
HTA   T=(MUL)
      Y=T
      Y=(WTH)
      R=XOV
HTF   P=HTC,T=0
      P=HTB,J/O
      U=(FAD)
      L=FOR
      Y=0
HTG   V=(L)
      Y=Y+V
      L=L+1
      P=HTD,L=O
      Y=Y(6)
      P=HTG
HTD   Y=(U)        STORE BACK INTO MAIN PROGRAM
      R=LNX        GET NEXT FORMAT CHARACTERS
HTB   U=(K)
      Y=U
      Y=(J)
      K=K+1
      J=J+1
      T=T-1
      P=HTF
HTC   U=(FAD)
      L=FOR
      Y=0
HTI   V=(L)
      Y=Y+V
      L=L+1
      P=HTE,L=O
      Y=Y(6)
      P=HTI
HTE   Y=(U)
      P=SLB
ALA   T=(MUL)
      P=ERR,T=0
      Y=T
      Y=(XIM)
      R=FWD
      T=(VLU)
      Y=T
      Y=(WTH)
ALB   R=XOV
      T=(WTH)      IIDTH
      Y=0          CLEAR ASSEMBLY AREA
      L=T
      U=T-13B
      W=55B
      P=ALC,U(0
      U=U+1        WIDTH IS GREATER THAN 10
      K=U+K        ADVANCE DATA POINTER N-10 PLACES
      L=12B
ALC   T=(K)        DATA
      K=K+1
      L=L-1        DECREMENT FIELD WIDTH
      Y=Y(6)
      Y=Y+T        ADD IN NEXT CHARACTER TO ASSEMBLY WORD
      P=ALC,L/0
ALE   T=*6
      S=Y.T
      P=ALD,S/0
      Y=Y(6)
      Y=Y+W
      P=ALE
ALD   Z=ALB
      Z=(NXS)
      P=EXT        EXIT TO RESTORE REGISTERS AND STORE Y
FFP   Y=77B
      Y=(FFLG)
      P=EFPX
*     PROCESS NEW.D
EFP   Y=0
      Y=(FFLG)
EFPX  T=(MUL)
      Y=T
      Y=(XIM)
      R=FWD
      T=(VLU)
      Y=T
      Y=(WTH)      SET WIDTH
      U=(J)
      Y=U-57B
      P=ERR,Y/0    NO DECIMAL POINT FOLLOWING WIDTH
      J=J+1
      R=FWD
      T=(VLU)
      Y=T
      Y=(DPR)      PLACES TO RIGHT OF DECIMAL POINT
EFA   R=XOV        CHECK FOR OVERFLOW OF RECORD
      T=(WTH)
      L=T          SET FIELD WIDTH IN L FOR LOOP COUNT
      Y=0
      M=0          COUNTER FOR DIGITS IN FRACTION
      S=0          DATA SIGN REGISTER
      Z=0          VALUE OF E
      X=0          SIGN OF E
EFB   P=EFM,L=0    FIELD REDUCED TO ZERO
      T=(K)
      L=L-1
      K=K+1
      U=T-55B
      P=EFB,U=0    SENSE FOR LEADING BLANKS
      V=T-45B
      P=EFC,V=0
      W=T-46B
      P=EFD,W/0    NO LEADING SIGN
      S=-S         SET COMPLIMENT FOR MINUS SIGN
EFC   P=EFM,L=0    END OF DATA FIELD
      T=(K)        DATA
      L=L-1        REDUCE FIELD WIDTH
      K=K+1        ADVANCE FOR NEXT DATA CHARACTER
EFD   U=T-45B      . E + - OR BLANK
      P=EFE,U(0    GO CHECK FOR LETTER , MAY BE E
      U=T-57B      . + - OR BLANK
      P=EFF,U/0    + - OR BLANK
      P=ERR,M/0    MORE THAN ONE PERIOD IN DATA
      M=M+1        SET INDICATOR PERIOD ENCOUNTERED
      P=EFC        GO GET NEXT NEXT DATA CHARACTER
EFF   U=T-55B
      P=EFG,U/0    + OR - FOR EXPONENT
      T=33B
EFE   U=T-33B      REMOVE BIAS
      P=EFK,U(0    MUST BE AN E OR ELSE ERROR
      Y=Y(1)
      V=Y
      Y=Y(2)
      Y=V+Y
      Y=Y+U
      P=EFC,M=0    GO GET NEXT DATA CHARACTER
      M=M+1        ADVANCE COUNT FOR FRACTION COUNT
      P=EFC        GO GET NEXT DATA CHARACTER
EFG   U=T-45B      +
      P=EFH,U=0
      U=T-46B
      P=EFJ,U/0    NO SIGN PRESENT
      X=-X         SET SIGN RECORD IN X
EFH   P=EFM,L=0    CONVERSION COMPLETE
      T=(K)
      L=L-1
      K=K+1
EFJ   U=T-55B
      P=EFI,U=0
      U=T-45B
      P=ERR,U)0
      U=T-33B
      P=ERR,U(0
EFI   Z=Z(1)
      W=Z
      Z=Z(2)
      Z=Z+W
      Z=Z+U
      P=EFH
EFK   U=T-5
      P=EFL,U=0
      U=T-4
      P=ERR,U/0    ILLEGAL CODE IN EXPONENT
EFL   P=EFM,L=0
      T=(K)
      K=K+1
      L=L-1
      U=T-55B
      P=EFL,U=0    SKIP OVER BLANK COLUMNS AFTER LETTER E
      P=EFG
EFM   U=(FFLG)
      T=(SCA)
      P=SCALE,U/0  SCALE FOR F TYPE CONVERSION
      Z.L=Z-X
      P=EFMA
SCALE  Z.L=Z-X
      T=(SCA)      SCALAR ENTERED BY NP SPECIFICATION
      Z=Z+T        E+P
EFMA  P=EFU,M=0
      M=M-1
      U=M
      Z=Z-U        E+P-DIGIT COUNT IN FRACTION
      P=EFN
EFU   U=(DPR)      GET VALUE OF D SPECIFIED IN FORMAT
      Z=Z-U
EFN   X=0          SET SIGN OF TOTAL SCALE
      P=EFO,Z)0    SCALE IS POSITIVE
      X=-X         REVERSE SIGN
      Z=-Z         FORCE SCALE TO POSITIVE NOTATION
EFO   U=*14B
      U=U.Y        EXPONENT TO U
      U=U(-60B)
      U,N=U-       NORMALIZE  TO GET COUNT FOR RT HHIFT
      N=N-60B
      Y=Y(N)       RIGHT SHIFT
      U=N
      U=-U
      N=U
      Y=N,Y.
      Y,0=Y-       NORMALIZE Y
      Z=0,Z.        PACK Z
      N=60B
EFQ   Z,O=Z-       NORMALIZE SCALE COUNT
      N=N-O
      P=EFT,N=0    NO SCALE FACTOR
      P=EFT,N(0    SCALE REDUCED BELOW 0
      U=(N+EXP)    FETCH POWER OF 10**2**(N-O)
      P=EFR,X(0    DIVIDE IF SIGN IS MINUS
      Y=U*Y        MULTIPLY BY SCALE FACTOR
EFS   T=(CAC)      MASK TO CLEAR NORMALIZED BIT
      Z=T.Z
      P=EFQ        GO GET NEXT SCALE COUNT
EFR   Y=Y/U
      P=EFS
EFT   U,0=Y.
      P=DDD,U/0
      Y=0
      S=0
DDD   Y.L=Y-S
      T=(FFLG)
      P=CCC,T/0
      Z=EFA
      Z=(NXS)
      P=EXT
CCC   Z=EFA
      Z=(NXS)
      P=EXT
      ..           CONSTANTS
FFLG  0
LCT   0
MESG  55555555051604551706B
      55061114055604012401B
      55111620252457000000B
UAM   02030455172524202524B
      55474755251601232311B
      07160504551505041125B
      15000000000000000000B
TCD   00000000002401200500B
EPK   15230700000000000000B
RZB   22031400000000000000B    RCL
CAB   17204000000000000000B
CAC   77773777777777777777B
COA   55555555555555555555B
*     POWERS OF 10 ** 2**N
EXP   17204000000000000000B            10**0
TEN   17235000000000000000B            10**1
      17266200000000000000B            10**2
      17354704000000000000B            10**4
      17525753604000000000B            10**8
      20064341571157602000B            10**16
      20734734265552025560B            10**32
      22456047403722377715B            10**64
      25724473510762300345B            10**128
      34435247735376716757B            10**256
FAD   0
ARL   0
HFG   0
NXS   0
MUL   0
FLA   0
XFG   0
SCA   0
FNO   0            FORMAT NUMBER
TMA   0
TMB   0
XIM   0
XPG   0
FCC   0
DCC   0
VLU   0
WTH   0
SGN   0
DPR   0
LOP   0
ARY   0            ARRAY LENGTH
BAS   0
DFLG  0
XPAREN 0
FOR   (12B)
IBF   (20B)
DAT   (230B)
      END
#eor
      MACHINE  SUBROUTINE  OUTPTB  (A1,A2,A3)
      ABS,ONE=1
      0
      3
      0
      0
      0
BINOT 0
      P=END,I(0
      P=FIN,I=0    FIRST ENTRY
      T=(ARGLS)
LOOP  U=(I)        FETCH DATA
      V=(T+2)      IN POINTDR
       X=(T+3)     OUT POINTER
      Y=U
      W=(T+4)      LIMIT
       Z=V+1       IN + 1
       U=Z-X       WILL IN + 1 = OUT
       P=LOOP1,U=0 YES
       Y=(V)       NO STOR E DATA TO BUFFER
       I=I+1       ADVANCE FOR NEXT DATA FETCH
      X=Z-W        WILL IN = LIMIT
       N=LOOP2
      P=DUMP,X=0   BUFFER FILLED ** GO DUMP CONTENTS
      Z=(T+2)
LOOP2  P=BINOT,J=0   NO ARRAY
      J=J-1        DECREMENT ARRAY COUNT
      P=LOOP,J/0   GO GET NEXT DATA
      P=BINOT
LOOP1  N=LOOP
       P=DUMP
DUMP  T=(ARGLS)
      V=77B
ACTIV U=(T)
      S=1
      W=V.U
      P=INAC,W=0   NO FUNCTION IN BUFFER
      X=S.U
      P=INAC,X/0   BUFFER NOT ACTIVE
      R=RCALL      GO RECALL
      P=ACTIV
INAC  S=16B        WRITE BINARY FUNCFION
      U=(T)
      Y=031117B    CIO CODES
      Z=Y
      V=777700B
      Z=Z(52B)
      Y=U.V        CLEAR PREVIOUS FUNCTION
      Y=Y+S        SET IN NEW FUNCTION
      Y=(T)        RESET FILE NAME
      Z=Z+T
      Z=(ONE)
DLAY  V=(ONE)
      P=DLAY,V/0
INTER R=RCALL
      U=(T)
      V=1
      W=V.U
      P=INTER,W=0
      U=(T+1)      FIRST
      Y=U
      Y=(T+2)      SET IN = FIRST
       P=N
RCALL 0
      X=(RCL)
      Y=X
WAIT  W=(ONE)
      P=WAIT,W/0
      Y=(ONE)
      P=RCALL
END   T=(ARGLS)
      U=777700B
      V=26B
      W=(T)
      Z=031117B    CIO CODES
      Y=W.U
      Z=Z(52B)
      Y=Y+V
WAIT2 U=(ONE)
      P=WAIT2,U/0
      Y=(T)
      Z=Z+T
      Z=(ONE)
      P=BINOT
FIN   T=(ONE)
      P=FIN,T/0
      P=FIN,T/0
      P=FIB,J)0
      J=-J
      T=(J)
      U=*6
      V=T.U
      P=FIE,V/0    FILE NAME
      U=(TCD)      CODES FOR TAPE
      V=12B
      V=0,V.       PACK
      Z=V
      V,0=V-       NORMALIZE DIVISOR
      T=0,T.       PACK DIVIDEND
      W=T/V
      W,L=W.
      W=W(L)
      Y=0,W.
      X.D=Z*Y
      Y.N=T-X      REMAINDER
      P=FIF,W=0
      V=V+33B
      Y=Y+33B
      V=U+V        ADD IN HIGH ORDER DIGIT
      V=V(6)       SHIFT UP FOR NEXT DIGIT
      T=Y+V        ADD IN LOW ORDER DIGIT
      T=T(30B)
      P=FIE
FIF   Y=Y+33B
      T=Y+U
      T=T(36B)
FIE   U=*52B
      I=2
      W=T.U        CLEAR LOWER 18 BITS
FIA   V=(I)        PROGRAM ARGUMENT
      P=ERR,V=0    UNASSIGNED MEDIUM
      Y=V.U
      X=W-Y
      I=I+1
      P=FIA,X/0
      J=V
FIG   T=(J)        FETCH FILE NAME
      U=77B
      Y=U.T        SAVE PREVIOUS FUNCTION
      Y=Y+W
      V=U.T
      P=FIB,V=0
      U=1          ACTIVE BIT MASK
      V=T.U
      P=FIG,V=0    BUFFER ACTIVE
FIB   Y=J
      Y=(ARGLS)
FIRST T=(ONE)
      P=FIRST,T/0
FIK   T=(J)
      U=77B
      V=T.U
      P=FIL,V=0    SENSE UNUSED BUFFER
      U=1
      V=T.U
      P=FIK,V=0    ACTIVE BUFFER
FIL   U=74B
      V=T.U
      W=V-14B
      P=FIM,W=0    1 1XX  SEND END OF RECORD
      T=(J+2)      IN
      U=(J+3)      OUT
      V=T-U
      P=BINOT,V=0  NO DATA IN BUFFER
      T=(J)
      U=4
      V=T.U        MASK OFF READ / WRITE  FLAG
      P=BINOT,V=0  SENSE READ MODE
FIM   T=(J)
      V=777706B
      Y=V.T
      U=20B
      Y=Y+U
      Y=(J)
FIO   T=(ONE)
      P=FIO,T/0
      Y=031117B
      U=J
      Y=Y(52B)
      Y=Y+U
      Y=(ONE)
      P=BINOT
ERR   T=MSG        ADDRESS OF MESSAGE
      Y=152307B    MSG CODES
      Y=Y(52B)
      Y=Y+T
      Y=(ONE)
ERA   T=(ONE)
      P=ERA,T/0
      Y=010224B    ABT CODES
      Y=Y(52B)
      Y=(ONE)
      0            STOP
      ..
TCD   00000000002401200500B
RCL   22031400000000000000B
MSG   27221124055502111601B
      22315547475525160123B
      23110716050455150504B
      11251500000000000000B
ARGLS 0
      END
#eor
      MACHINE SUBROUTINE  OUTPTC(A,B,C)
      ABS,ONE=1
      0
      3
      0
      0
      0
OUT   0            DATA OUTPUT
      P=FIN,I=0
      P=NOD,I(0
      Y=0
      Y=(FFG)      CLEAR NO DATA FLAG
NOD   Y=J
      Y=(ARY)      SAVE LENGTH
      O=FOR+12B
RET   T=(FCC)      RE-ENTRY POINT FOR ARRAYS
      U=(DCC)
      L=T          FORMAT POINTER
      M=U          DATA POINTER
      T=(XIM)      ITEM REPEAT COUNTER
      V=(NXS)
      P=DOP,T=0
      J=V
      P=J
DOP   P=DOA,L/O
      R=LNX        LOAD NEXT FORMAT CHARACTERS
DOA   T=(L)
      L=L+1
      V=T-55B      SENSE FOR SPACE
      P=DOP,V=0
      S=T          DUPLICATE CODE IN S AND T
      U=T-52B
      P=DOC,U=0
DOI   Y=0
      Z=1
      Y=(XFG)      FLAG DENOTING PREDEEDING DIGIT IF NOT 0
      Z=(MUL)      PRESET ITEM OR GROUP COUNT TO 1
DOB   U=T-33B
      P=DOD,U(0    CODE IS A LETTER
      V=T-45B
      P=DOD,V)0    SPECIAL CHARACTER
      Z=(XFG)      SET FLAG , PRECEEDING DIGIT
      Y=Y(1)       MULTIPLY BY 10
      W=Y
      Y=Y(2)
      Y=Y+W
      Y=Y+U
      Y=(MUL)
DOK   P=DOJ,L/O
      R=LNX
DOJ   T=(L)
      L=L+1
      U=T-55B
      P=DOK,U=0
      P=DOB
DOD   U=T-51B
      P=DOE,U/0    SENSE NO OPEN PAREN.
      V=(XPG)
      V=V-1
      P=DOQ,V=0
      T=PNL
      R=ERR
DOQ   U=(MUL)
      V=(XFG)
      Y=U
      Y=(XPG)
      Z=V
      T=(FAD)
      Y=L
      T=T(52B)     ADDRESS AND CHZRACTER POINTER
      Y=Y+T        OF LAST (
      Z=(XPAREN)   FLAG IS ZERO IF NO MULTIPLIER
      Y=(LOP)
      P=DOP
DOC   V=(FFG)
      U=(XPG)
      P=DOM,U/0    REPEAT FROM PREVIOUS (
      Y=1
      Y=(XPG)
DOH   P=DOG,L/O
      R=LNX
DOG   T=(L)
      L=L+1
      V=T-55B
      P=DOH,V=0
      V=T-52B      SENSE FOR )
      P=DOH,V=0
      V=T-56B      SENSE FOR ,
      P=DOH,V=0    SENSE FOR ), SEQUWNCE
      S=T
      P=DOI,S/0
HEDLIN J=L
        U=(XPG)
      Y=0
        T=U-1
        P=DOM,T/0  (N(NH)
      Y=(M)        SET END OF LINE CODE
      R=ONA
      L=J
        U=(XPG)
      T=(FFG)
        Y=U-1
        Y=(XPG)
        P=DOF,Y/0
      P=LNE,I(0
      Y=0
      U=(BAS)
      Y=(SGN)
      Z=1
      Y=U
      Z=(XPG)
      Y=(FAD)      RESDT FORMAT TO BEGINNING
      R=LNX
      P=DOP
DOM   U=(XPG)
      Y=U-1
      Z=0
      Y=(XPG)
      Z=(SGN)      CLEAR SIGN TO + STATUS
      P=DMB,Y=0    GO SENSE FOR MULTIPLIER FOR (
DOF   T=(LOP)
      J=T
      Y=T
      Y=Y(22B)     RESET FORMAT CHARACTER FROM (FAD)
      Y=Y-1
      Y=(FAD)
      R=LNX
      L=J
      P=DOA,L/O
      R=LNX
      P=DOP
DMB   T=(XPAREN)
      P=LEVEL,T=0  LEVEL 1 PAREN
      P=DOF,Y/0
      Y=(XPAREN)
      Y=1
      Y=(XPG)
      P=DOH
LEVEL J=L
      Y=0
      Y=(M)
      Y=1
      Y=(XPG)
      R=ONA
      L=J
      P=OUT,I(0
      P=DOF        OUTPUT LINE AND GO RESET FROM LAST (
DOE   U=T-50B      /
      P=SLA,U=0    PROEESS /
      U=T-11B
      P=INT,U=0    PROCESS NIW
      U=T-30B
      P=XSP,U=0    PROCESS NX
      U=T-1        A
      P=ALA,U=0    PROCESS NAW
      U=T-17B
      P=OCT,U=0    PROCESS NOW
      U=T-10B
      P=HOL,U=0    PROCESS NH
      U=T-6
      P=FOA,U=0
      U=T-5        E
      P=ETP,U=0
      U=T-20B
      P=PTP,U=0
      U=T-45B
      P=PLS,U=0
      U=T-46B
      P=MNS,U=0
      U=T-4
      P=ETP,U=0
      T=IFL        ERROR TYPE
      R=ERR
ERR   0            PROCESS ERROR MESSAGE
      U=(MSG)      CODES FOR MSG
      Y=U+T
ERB   T=(ONE)
      P=ERB,T/0
      Y=(ONE)
      Y=FNO        ADDRESS OF FORMAT NUMBER
      Y=Y+U        FORMAT MUMBER TO DAYFILE
ERA   T=(ONE)
      P=ERA,T/0
      Y=(ONE)
      U=010224B    ABT CODES
ERC   T=(ONE)
      P=ERC,T/0
      U=U(52B)
      Y=U
      Y=(ONE)
      0            STOP
WNX   0
      T=(ARL)      CONTAINS ADDRESS OF ARGUMENT LIST
      K=0          END OF RECORD FLAG
      M=Y          BASE ADDRESS OF DATA
      L=M+14B
      N=T
WNB   T=(N)
      U=1
      V=T.U
      P=WNP,V/0    NOT ACTIVE
      U=77B
      V=4
      W=T.U        FUNCTION AND READ/WRITE BIT
      P=WNP,W=0
      X=V.W        READ/WRITE BIT
      P=WNB,X=0    SENSE FOR READ MODE
      V=70B
      X=V.W        FUNCTION
      U=X-10B
      P=WNP,U=0    I/O SELECT AND WRITE MODE
      U=X-20B      I/O SELECT AND WRITE MODE
      P=WNB,U/0    WAIT FOR PREVIOUS FUNCTION COMPLETED
WNP   U=2
      V=U.T
      P=WNA,V=0    SENSE FOR BCD MODE
      V=777706B
      Y=T.V
       V=20B       END OF RECORD
      Y=Y+V
WNT   T=(N)
      U=1
      V=T.U
      P=WNT,V=0    ACTIVE
      Y=(N)
WNQ   T=(ONE)
      P=WNQ,T/0    SENSE RA+1 BUSY
      Y=031117B    CIO CODES
      Y=Y(52B)
      U=N
      Y=Y+U
      Y=(ONE)
      U=1
WNR   T=(N)
      V=T.U
      P=WNR,V=0    WAIT FOR NOT BUSY
WNA   T=(N+2)      IN
      U=(N+3)      OUT
      W=T-U
      P=WNS,W/0    SENSE IN NOT = OUT
      V=(N)
      Y=77B
      Y=Y.V
      W=15B
      P=WNS,Y/0
      Y=V+W        BUFFER NOT PREVIOUSLY REFERENCED
      Y=(N)        SET WRITE CODED INACTIVE
WNS   V=T+1        IN+1
      W=V-U        WILL IN+1 = OUT
      P=WNC,W=0
WNG   T=(M)
      U=*60B
      V=-U.T
      P=WNE,V/0    NO END OF LINE BYTE
      K=7          SET END OF LINE FLAG
WNE   Y=T
      U=(N+2)
      X=(N+4)      LIMIT
      Y=(U)
      M=M+1
      Y=U+1        SET IN = IN+1
         W=X-Y
      P=WND,W=0
      Y=(N+2)
      V=(LCT)
      Y=V+1
      Y=(LCT)
      P=WNA,K=0    NO END OF RECORD
      U=(N)
      T=1
      V=U.T
      P=WNX,V=0    ACTIVE
      Y=Y-1000B
      P=WNX,Y(0
      Y=0
      Y=(LCT)
      T=777702B
      Y=U.T
      V=14B
      Y=Y+V        WRITE CODED
      Y=(N)
WNF   T=(ONE)
      P=WNF,T/0
      T=(PCB)
      Y=T
      W=N
      Y=Y+W
      Y=(ONE)
      P=WNX
WND   T=(N+1)      FIRST
      U=(N+3)      OUT
      V=T-U
      P=WNH,V/0
      T=(ONE)
      P=WND,T/0
      T=(RCL)
      Y=T
      Y=(ONE)
      P=WND
WNH   Y=T
      Y=(N+2)      SET IN = FIRST
      P=WNG
WNC   T=(ONE)
      P=WNC,T/0
      T=(RCL)
      Y=T
      Y=(ONE)
      P=WNA
LNE   U=(DCC)
      Y=0          STORE END OF RECORD
      Y=(FFG)      CLEAR NO DATA FLAG
      Y=(U)
      W=M          POINTER FOR DATA IN CHARACTER BUFFER
      V=DAT
      T=W-V        CHECK FOR DATA IN BUFFER
      Y=(M)
      P=OUTA,T=0
LND   Y=OBF        SET ADDRESS OF BUFFER
      R=ONA        DMMP BUFFER
      P=OUT        EXIT
OUTA  Y=55B
      Y=(M)
      M=M+1
      Y=0
      Y=(M)
      P=LND
LNX   0            LOAD WITH NEXT 10 CHARACTERS OF FORMAY
      T=(FAD)
      X=Y
      Y=T+1
      U=(Y)                        3
      Y=(FAD)
      K=12B
      L=FOR
      S=77B
LNA   U=U(6)
      Y=S.U
      Y=(L)
      K=K-1
      P=LNB,K=0
      L=L+1
      P=LNA
LNB   L=FOR
      Y=X
      P=LNX
FIN   P=FIA,J)0
      J=-J         SUBROUTINE
      T=(J)        FETCH FILE NAME CONSTANT
      U=*6
      V=T.U
      P=FIE,V/0    FILE NAME
      U=(TCD)      CODES FOR TAPE
      V=12B
      V=0,V.       PACK
      Z=V
      V,0=V-       NORMALIZE DIVISOR
      T=0,T.       PACK DIVIDEND
      W=T/V
      W,L=W.
      W=W(L)
      Y=0,W.
      X.D=Z*Y
      Y.N=T-X      REMAINDER
      P=FIF,W=0
      V=V+33B
      Y=Y+33B
      V=U+V        ADD IN HIGH ORDER DIGIT
      V=V(6)       SHIFT UP FOR NEXT DIGIT
      T=Y+V        ADD IN LOW ORDER DIGIT
      T=T(30B)
      P=FIE
FIF   Y=Y+33B
      T=Y+U
      T=T(36B)
FIE   U=*52B
      I=2
      V=T.U
      W=(I)
FIB   W=(I)        FETCH PROGRAM ARGUMENT
      P=FIC,W/0
      T=UAM        ADDRESS OF ERROR MESSAGE
      R=ERR
FIC   X=W.U
      X=X-V
      I=I+1
      P=FIB,X/0
      J=W
FINB  T=(J)        FILE NAME
      U=*52B
      X=-U.T
      S=77B
      Z=T.S
      P=FINA,Z=0
      S=1
      Z=T.S
      P=FINB,Z=0
FINA  Y=V+X
      Y=(W)        STORE FILE NAME INTO ARGUMENT LIST
FIA   Y=J
      Z=K+1
      Y=(ARL)
      Z=(FAD)      FORMAT ADDRESS
      T=(K)        FETCH FORMAT
      Z=K
      Y=T
      Y=(FNO)      STORE FORMAT NUMBER
      Z=(BAS)
      Y=0
      Y=(CAD)
      Y=(XIM)
      Y=(EFG)
      Y=(ARY)      CLEAR ARRAY LENGTH
      Y=(SCA)      CLEAR SCALE FACTOR
      Y=(SGN)      CLEAR SIGN
      Y=(XPAREN)
      Y=1
      Y=(FFG)      SET NO DATA FLAG
      Y=(XPG)
      Y=FOR
      Y=(FCC)
      Y=DAT
      Y=(DCC)
      L=FOR
      T=(FAD)
      U=(T)
      K=12B
      S=77B
LIA   U=U(6)
      Y=S.U
      Y=(L)
      K=K-1        SOORE 10 CHARACTERS OF FORMAT
      P=OUT,K=0
      L=L+1
      P=LIA
XOV   0
      T=M
      U=DAT
      V=T-U
      V=V-226B
      P=XOV,V(0
      T=EXR        ERROR TYPE
      R=ERR
FWD   0
      Y=0
FWC   P=FWA,L/O
      R=LNX
FWA   T=(L)
      V=T-33B
      P=FWB,V(0
      U=T-55B
      P=FWE,U=0
      U=T-45B
      P=FWB,U)0
      Y=Y(1)
      W=Y
      Y=Y(2)
      Y=Y+W
      Y=Y+V
FWE   L=L+1
      P=FWC
FWB   Y=(VLU)
      P=FWD
ONA   0            PACK UP CHARACTERS CODES 10/WORD
      M=OBF        OUTPUT BUFFER
      L=DAT
      S=*6
      X=55B        CONSTANT FOR FILLING OUT WITH SPACES
      U=77B        MASK
      W=(L)        FETCH CHARACTER
ONC   Y=0          CLEAR ASSEMBLY CLEL
ONB   T=W
      L=L+1        ADVANCE FOR NEXT FETCH
      Y=Y(6)
      Y=Y+T        ADD IN NEXT CHARACTER
      P=OND,T=0    SENSE FOR END OF DATA
      W=(L)        MAKE FETCH FOR NEXT DATA
      V=Y.S        MASK CHARACTER OUT OF HIGH ORDER POSITION
      P=ONB,V=0    GO INSERT NEXT CHARACTER
      Y=(M)        STORE WORD
      M=M+1
      P=ONC        GO START NEXT WORD
OND   V=Y.U        MASK LOW ORDER CHARACTER
      P=ONG,Y=0
      P=ONF,V=0    SENSE NOT FULL WORD OF CODES
ONG   Y=(M)        STORE WORD
      Z=0
      Z=(M+1)
      P=ONH        GO OUTPUT RECORD
ONF   Y=Y+X        FILL IN SPACE
      W=Y.S        CHARACTER IN HIGH ORDER POSIIION
      P=ONG,W/0    YES
      Y=Y(6)       NO SHIFT UP FOR NEXT CODE
      P=ONF        GO FILL IN WITH NEXT SPACE CODE
ONH   Y=OBF
      R=WNX
      M=DAT
      P=ONA        EXIT
*     PROCESS NIW  FOR OUTPUT DATA
INT   T=(MUL)      ITEM MULTIPLIER
      Y=T
      Y=(XIM)      SAVE FOR ITEM REPEAT
      R=FWD
      T=(VLU)      FIELD WIDTH
      Y=T
      Y=(WTH)      SAVE WIDTH
INA   R=XOV        CHECK FOR OVERFLOW OF RECORD
      T=(I)        FETCH DATA
      P=LNE,I(0
      Z=12B
      S=45B        SET + CODE
      Z=0,Z.       PACK  INTEGER
      P=INB,T)0    POSITIVE INTEGER
      S=46B        SEY - CODE
      T=-T         FORCE DATA POSITIVE
INB   U=(WTH)
      N=U-1        LOOP COUNT, LEAVE ONE PLACE FOR SIGN
      M=U+M         ADVANCE POINTER TO BEGINNING OF NEXT FIELD
      K=M-1
      U=S-45B
      P=INC,U/0    NEGATIVE DATA
      N=N+1        ALLOW 2 MORE DIGIT FOR + DATA
INC   T=0,T.       PACK DIVIDEND
      U=(TEN)      FETCH DIVISOR
      W=T/U        QUOTIENT TO W
      V,J=W.       UNPACK QUOTIENT
      V=V(J)       SHIFT TO INTEGER POSITION
      X=0,V.       PACKQUOTIENT
      W.D=X*Z      PRODUCT OF QUOTIENT AND DIVISOR
      W,0=W.        UNPACK W
      T,0=T.       UNPACK T
      Y=T-W
      Y=Y+33B      ADD IN DISPLAY CODE SBIAS
      T=V          TRANSMIT QUOTIENT TO DIVIDEND REGISTER
      Y=(K)        STORE REMAINDER INTO BUFFER
      K=K-1
      N=N-1        REDUCE LOOP COUNTER
      P=INE,T=0    DIVIDEND REDUCED TO ZERO
      P=IND,N=0    FIELD WIDTH IS REDUCED TO ZERO
      P=INC        GET NEXT DIGIT
IND   P=INH,V/0    FIELD WIDTH IS TOO SMALL
      Y=S
      Y=(K)        STORE SIGN INTO BUFFER
ING   Z=INA
      Z=(NXS)      SET RE-ENTRY ADDRESS
      P=EXT
INE   Y=S
      T=S-45B
      P=INF,T/0
      P=ING,N=0
      N=N-1
      Y=55B
INF   Y=(K)
      K=K-1
      N=N-1
      P=ING,N(0    CONVERSION COMPLETED
      Y=55B        FILL FIELD WITH SPACES
      P=INF
INH   Y=47B        ENTER   CODE ERROR
      U=S-45B
      P=INF,U/0
      K=K+1
      P=INF
EXT   P=EXA,L/O
      R=LNX
EXA   T=(L)
      U=T-56B
      P=EXB,U/0    SENSE NO COMMA
      L=L+1
      P=EXT        CHECK CODE
EXB   Y=L
      Y=(FCC)
      Y=M
      Y=(DCC)
      T=(XIM)
      Y=T-1
      Y=(XIM)
      T=(ARY)
      P=OUT,T=0    NO ARRAY
      Y=T-1        REDUCE LENGTH
      P=OUT,Y=0     EXIT ARRAY SATISFIED
      I=I+1
      Y=(ARY)
      P=RET        PROCESS NEXT ELEMENT
SLA   Y=55B
      T=DAT
      U=M
      V=T-U
         P=SLAB,V/0     SENSE FOR DATA IN BUFFER
      Y=(M)                        3
      M=M+1
SLAB  Y=0
      Y=(M)
      J=L
      R=ONA
      L=J
      T=(MUL)
      Y=T-1
      P=NXT,Y=0
      Y=(MUL)
      P=SLA
NXT   P=NXA,L/O
      R=LNX
NXA   T=(L)
      U=T-56B
      P=NXB,U/0
      L=L+1
      P=NXT
NXB   U=T-55B
      P=DOP,U/0    SENSE NO SPACE OR NO COMMA
      L=L+1
      P=NXT
*     PROCESS NH
HOL   R=HOLER
      P=NXT
HOLER 0
      T=(MUL)
      Y=T
      Y=(WTH)
      R=XOV
      T=(WTH)
      N=T
HOA   P=HOB,L/O
      R=LNX
HOB   T=(L)
      L=L+1
      Y=T
      N=N-1
      Y=(M)
      M=M+1
      P=HOA,N/0
      P=HOLER
XSP   T=(MUL)
      Y=T
      Y=(WTH)
      R=XOV
      T=(WTH)
      Y=55B        STORE SPACES
XSA   Y=(M)
      M=M+1
      T=T-1
      P=XSA,T/0
      P=NXT
*     PROCESS NOW
OCT   T=(MUL)
      Y=T
      Y=(XIM)      SET ITEM REPEAT COUNT
      R=FWD        GET FIELD WIDTH
      T=(VLU)
      Y=T
      Y=(WTH)
OCA   R=XOV        CHECK FOR OVERFLOW OF RECORD
      T=(I)        FETCH DATA
      P=LNE,I(0    SENSE FOR END OF LIST
      U=7          MASK
      V=(WTH)
      N=V          LOOP COUNT
      M=V+M
      K=M-1        SET INITIAL STORAGE ADDRESS
OCB   P=OCD,N=0
      Y=U.T
      Y=Y+33B      ADD IN BIAS
      Y=(K)
      T=T(-3)      SHIFT TO NEXT DIGIT
      K=K-1        REDUCE FOR NEXT STORE INTO BUFFER
      N=N-1        REDUCE LOOP COUNT
      P=OCB,T/0
      P=OCX,N=0
      Y=55B
OCE   Y=(K)        FILL REMAINING FIELD WITH BLANKS
      K=K-1
      N=N-1
      P=OCE,N/0
      P=OCX
OCD   Y=47B        * CODE
      Y=(K-1)      STORE * ------FIELD TOO SMALL
OCX   Y=OCA
      Y=(NXS)
      P=EXT
*     PROCESS NAW
ALA   T=(MUL)
      Y=T
      Y=(XIM)
      R=FWD
      T=(VLU)
      Y=T
      Y=(WTH)
ALB   R=XOV
      T=(I)
      P=LNE,I(0    SENSE FOR END OF LIST
      U=(WTH)
      V=77B
      N=U          WIDTH
      W=U-12B
      P=ALE,W)0    RIGHT JUSTIFY IN FIELD
ALJ   T=T(6)       SHIFT CHARACTER INTO POSITION
      Y=T.V
      Y=(M)
      M=M+1
      N=N-1
      P=ALJ,N/0
ALG   Y=ALB
      Y=(NXS)      STORE RE-ENTRY ADDRESS
      P=EXT
ALE   M=M+N        ADVANCE POINTER TO START OF NEXT FIELD
      K=M-1        END OF CURRENT FIELD
      N=N-12B      WIDTH - MAXIMUM
      W=12B        LOOP COUNT
ALF   Y=T.V        MASK OFF RIGHT MOST CODE
      T=T(-6)      POSITION FOR NEXT CYCLE
      Y=(K)        STORE
      K=K-1
      W=W-1        LOOP COUNTER
      P=ALF,W/0    LOOP NOT COMPLETE
      Y=55B
ALH   P=ALG,N=0    DONE
      Y=(K)
      K=K-1        FILL WITH SPACES
      N=N-1
      P=ALH
PLS   Y=0
      Y=(SGN)      CLEAR SIGN
PMS   T=(XFG)
      P=NXT,T=0
      T=SER        ERROR N+ OR N-
      R=ERR
MNS   Y=*74B
      Y=(SGN)      SET SIGN FOR MINUS NOTATION
      P=PMS
PTP   T=(SGN)
      U=(XFG)
      P=PTA,U=0    SP P
      U=(MUL)      MAGNITUDE
      Y.L=U-T      CORRECT FOR SIGN
PTA   Y=(SCA)      SET SCALAR
      P=NXT
FOA   T=(MUL)
      Y=T
      Y=(XIM)      STORE REPEAT COUNT
      R=FWD
      T=(VLU)
      Y=T
      Y=(WTH)      STORE FIELD WIDTH
FOZ   P=FOQ,L/O
      R=LNX        LOAD WITH NEXT FORMAT WORD
FOQ   T=(L)
      L=L+1
      U=T-55B
      P=FOZ,U=0
      U=T-57B
      P=FQH,U=0
      T=NDP
      R=ERR
FQH   R=FWD
      T=(VLU)
      Y=T
      Y=(DPR)      STORE COUNT FOR PLACES TO RIGHT OF DECIMAL POINT
FOB   T=(EFG)
      P=FXX,T=0    F CONVERSION
      T=(WTH)
      Y=T+5
      Y=(WTH)
      R=XOV
      T=(WTH)
      Y=T-5
      Y=(WTH)
      P=FQX
FXX   R=XOV
FQX   T=(I)
      P=LNE,I(0    SENSE FOR END OF LIST
      Y=55B
      P=FOG,T)0
      Y=46B
      T=-T
FOG   Y=(SGN)
      Y=M          POINTER FOR START OF THIS FIELD
      Y=(FDF)      SAVE FOR FIELD DEFINITION
      N=777717B
      P=UUU,T/0     SENSE DATA NOT PURE ZERO
      T,J=T.       UNPACK VARIABLE
      J=J+1777B
      P=UUU,J/0    SENSE NO ZERO EXPONENT
      J=-57B
      T=J,T.       PACK WITH 1 PLACE IN INTEGRAL FIELD
UUU   V=(WTH)      FIELD WIDTH
      M=V+M        SET POINTER TO START OF NEXT FIELD
      V=*14B
      V=V.T        EXPONENT TO V
      V=V(14B)     EXPONENT TO LOWER V
      V=V-1777B
      P=FQE,V/0
INDEF Y=11B
FQG   J=M-1
      T=(EFG)
      Z=0
      Y=(J)
      Z=(MAG)      CLEAR MAGNITUDE
      U=(FDF)
      Z=55B
      N=U
CLOOP    Z=(N)
         N=N+1
         P=CLOOP,N/J
DLOOP P=NORND,T=0
      Y=(J+1)
      Y=(J+2)
      Y=(J+3)
      Y=(J+4)
      M=M+4
      P=PZXT
FQE   V=V-2000B
      P=EEF,V/0
RANGE Y=22B
      P=FQG
EEF   Z=0
      Z=(MAG)      CLEAR MAGNITUDE
ETY   N=13B
      Z,K=T.        PUT EXPONENT IN K
      Z=0          CLEAR ACCRUED MAGNITUDE
      K=K+57B
      P=ETV,K(0    EXPONENT IS LESS THAN 10**0
      N=12B
ETT   U=(N+PTN)    FETCH POSITIVE POWER OF TNE
      V=T-U
      P=ETU,V(0    DATA IS LESS THAN FETCHED POWER OF TNEN
      T.R=T/U
      Z=Z+N        INCREASE MAGNITUDE
      U=*14B
      V=T.U
      V=V(14B)
      V=V-1777B
      P=INDEF,V=0
      V=V-2000B
      P=RANGE,V=0
      P=ETT
ZOPA  U=(MAG)
      N=N-1
      Y=U+1
      Y=(MAG)
      P=ZOP
ETU   N=N-1
      P=ETT,N/0
      P=ETX        DATA IS LESS THAN 10**1
ETV   U=(N+MTN)    FETCH NEGITIVE POWER OF TEN
      V=T-U
      P=ETW,V)0    DATA IS GREATER THAN POWER OF 10**N
      U=(N+PTN)    MULTIPLY BY 10**N
      T=T*U
      U=N
      Z=Z-U
      U=*14B
      V=T.U
      V=V(14B)
      P=ETX,V=0    EXPONENT FIELD HAS BEEN REDUCED TO ZERO
      V=V-1777B
      P=INDEF,V=0
      V=V-2000B
      P=RANGE,V=0
      P=ETV
ETW   N=N-1
      P=ETV,N/0
ETX   U=(SCA)      SCALE FACTOR
      Z=(MAG)
      X,N=T.
      Y=X(N)       SHIFT OFF FRACTION
      Y=(IGR)      SAVE INTEGER
      N=N+60B
      T=*14B
      W=X(N)       SHIFT FRACTION UP TO BINARY POINT
      V=-T.W       CLEAR INTEGER FRIM FRACTION
      Z=Z+U
      T=(EFG)
      P=FTJ,T=0
      Z=U          SET MAGNITUDE = SCALE FACTOR
FTJ   N=Z+1
      U=(DPR)      NUMBER OF PLACES TO RIGHT OF DECIMAL POINT
      T=(FDF)
      S=*14B
      K=M-1
      U=-U
      K=U+K        SET POINTER FOR DECIMAL POINT
      J=K-1
      P=FTE,Z(0    NUMBER IS ALL FRACTION
      U=(EFG)
      P=ZOP,U=0    F FORMAT
      U=(SCA)      FETCH SCALAR
      W=U-1
      P=ZOP,W(0
      P=ZOPA,W=0
      U=(MAG)      FETCH MAGNIJUDE
      N=N-1        REDUCE 1 FROM INTEGRAL FIILD
      Y=U+1
      Y=(MAG)
ZOP   K=K-N        SET START OF INTEGER FIELD
      U=K
      Y=0
      Y=(T)
      Y=T-U
      P=FTI,Y(0
      W=(SGN)
      W=W-46B
      P=SERRO,W=0  NOT ROOM FOR - SIGN
      P=FTIX,Y=0
SERRO  K=T+1
      Y=47B
      Y=(SGN)      STORE ERROR CODE
FTI   J=K-1        SIGN POSITION
FTIZ  T=(IGR)
      Y=0
      Y=(J)
      Y=T+33B      INTEGER PART OF WORD
      O=0
FTB   Y=(K)        STORE TO BUFFER
      K=K+1        ADVANCE FOR NEXT DIGIT STORE
      O=O+1        ADVANCE INTEGER COUNT
      N=N-1        INTEGERS LEFT TO CONVERT
      P=FTC,K=M
      P=FTA,N=0    INTEGRAL FIELD STORED
      O=O-17B
      Y=33B
      P=FTB,O)0    MAXIMUM NUMBER OF INTEGERS STORED
      O=O+17B      RESTORE COUNT
      V=V(1)       *2
      W=V
      V=V(2)       *8
      V=V+W        *10
      Y=S.V
      Y=Y(-60B)
      Y=Y+33B
      V=-S.V       CLEAR PREVIOUS PRODUCT
      P=FTB        GO CHECK FOR MORE
FTA   Y=57B
FTD   Y=(K)
      P=FTC,K=M
      K=K+1        ADVANCE FOR NEXT STORE INTO CHARACTER BUFFER
FTF   P=FTC,K=M    COMPARE AGAINST LIMIT IN M
      V=V(1)
      W=V
      V=V(2)
      V=V+W
      Y=S.V
      Y=Y(-60B)
      Y=Y+33B
      V=-S.V
      P=FTD
FTIX  J=K
      P=FTIZ
FTE   J=K
      Y=57B
         U=(SGN)
         X=U-46B
         P=FTL,X/0
      Z=0
         J=J-1
      Z=(J)
FTL   Y=(K)
      K=K+1
      P=FSA,N=0
      N=N+1        INCREMENT NEGITIVE MAGNITUDE
      P=FTC,K=M
      Y=33B
      P=FTL        STORE ZEROS FOR NEGITIVE MAGNITUDE
FSA   T=(IGR)
      Y=T+33B
      P=FTD
FTC   Z=V
      U=(J)        FETCH SIGN FIELD
      T=(SGN)
      P=FPTC,U/0
      Y=T
      Y=(J)        STORE SIGN OR *
FPTC   T=(FDF)     FIELD DEFINITION
      Y=55B
      N=T
FTG   P=FTH,N)J
      Y=(N)        STORE SPACE CODE
      N=N+1
      P=FTG
FTH   Z=Z(14B)
      P=NORND,Z)0
      R=ROUND
NORND T=(EFG)
      Z=0
      O=FOR
      Z=(SGN)
      O=O+12B
      P=EXX,T/0
      Y=FOB
      Y=(NXS)
      P=EXT
ETP   T=(MUL)
      Y=T
      Y=(XIM)      SAVE ITEM MULTIPLIER
      R=FWD
      T=(VLU)
      Y=T
      Y=(WTH)      FIELD WIDTH
ETR   P=ETQ,L/O
      R=LNX        LOAD WITH NEXT SET OF FORMAT CODES
ETQ   T=(L)        FETCH NEXT CODE
      L=L+1        ADVANCE COR NEXT FETCH
      U=T-55B
      P=ETR,U=0    SKIP BLANK CODE
      U=T-57B      LOOK FOR DECIMAL POINT
      P=ETS,U=0
      T=NDP        ADDRESS OF ERROR MESSAGE
      R=ERR
ETS   R=FWD
      T=(VLU)
      Y=T
      Y=(DPR)      PLACES TO RIGHT OF DECIMAL POINT
      T=(WTH)
      Y=T-4        SUBTRACT PLACES FOR EXPONENT
      Y=(WTH)      STORE MODIFIED WIDTH
EZZ   Y=77B
      Y=(EFG)      SET FLAG TO DENOTE E CONVERSION
      P=FOB        ENTER F CONVERSION
EXX   T=(MAG)      REENTRY POINT FROM F CONVERSION
      U=(SCA)
      Z=45B
      T=T-U
      P=EMA,T)0    MAGNITUDE IS +
      Z=46B
      T=-T
EMA   Y=5          LETTER E
      Y=(M)
      M=M+1
      Z=(M)        STORE SIGN
      M=M+2        ADVANCE TO END OF FIELD
      S=12B
      S=0,S.
      N=2          CONVERT 2 POSIIIONS OF EXPONENT
      U=(TEN)
EMB   T=0,T.
      W=T/U        DIVIDE BY 10
      V,J=W.       UNPACK
      V=V(J)       POSITION INTEGER
      X=0,V.       PACK QUOTIENT
      W.D=X*S      MULTIPLY BY DIVISOR
      Y.N=T-W      REMAINDER
      T=V
      Y=Y+33B
      Y=(M)
      M=M-1
      N=N-1
      P=EMB,N/0
      P=EMC,T=0    SENSE EXPONENT NOT LARGER THAN 99
        Z=(M-1)
        Y=T+33B    MAKE ENTRY FOR 3 DIGIT EXPONENT
      Y=(M)
EMC   M=M+3        ADVANCE TO START OF NEXT FIELD
PZXT    Y=EZZ      E TYPE EXIT
      Z=0
      Y=(NXS)
      Z=(EFG)
      P=EXT
ROUND 0
      T=(FDF)      START OF FIELD
      J=M-1        LAST ADDRESS OF FIELD
      N=T
ROUT  P=ROUF,J=N   EXIT
      U=(J)        FETCH CHARACTER
      V=U-57B
      P=ROUD,V=0   CODE IS A DECIMAL POINT , SKIP CODE
      W=U-33B
      X=U-45B
      P=ROUS,W(0   CODE LESS THAN 33
      P=ROUS,X)0   CODE GREATER OR = 45
      Y=U+1
      Z=Y-45B
      P=ROUN,Z=0   DIGIT TOGGLED
      Y=(J)        RESTORE DIGIT
      P=ROUND      EXIT
ROUN  Y=33B
      Y=(J)
ROUD  J=J-1
      P=ROUT
ROUS  T=(EFG)
      P=ROUE,T/0   E
      Y=U          F TYPE CONVERSION
      Y=(J-1)      MOVE SPECIAL CODE UP 1 PLACE
ROUU  Z=34B
      Z=(J)
      P=ROUND
ROUE  T=(MAG)
      Y=34B
      Z=T+1
      Y=(J+1)
      Z=(MAG)
      P=ROUND
ROUF  U=(J)
      W=46B
      X=U-W
      V=47B
      P=ROUU,X/0
      Y=V
      Y=(J)
      P=ROUND
      ..           CONSTANTS
XPAREN 0
LCT   0
FFG   0            NO DATA FLAG
FDF   0            START OF CURRENT FIELD
EFG   0            FLAG FOR E CONVERSION
FNO   0            FORMAT NUMBER
MAG   0
DPR   0
SCA   0
SGN   0
IGR   0
XFG   0
XPG   0
ARY   0            ARRAY LENGTH
CAD   0
LOP   0
FAD   0
ARL   0
FCC   0
DCC   0
MUL   0
XIM   0
WTH   0
VLU   0
NXS   0
PCB   03111700000000000000B
RCL   22031400000000000000B
MSG   15230700000000000000B
TEN   17235000000000000000B            10**1
PTN   17204000000000000000B
      17235000000000000000B
      17266200000000000000B
      17317640000000000000B
      17354704000000000000B
      17406065000000000000B
      17437502200000000000B
      17474611320000000000B
      17525753604000000000B
      17557346545000000000B
      17614520137100000000B
      17645644166720000000B
MTN   17204000000000000000B
      17204000000000000000B
      17146314631463146314B
      17115075341217270243B
      17064061115645706517B
      17026433342726161031B
      16775174265421615507B
      16744143367501327554B
      16706553762465362572B
      16655274616704302141B
      16624227013720233264B
      16566676337663536755B
EXP   17204000000000000000B            10**0
      17266200000000000000B            10**2
      17354704000000000000B            10**4
      17525753604000000000B            10**8
      20064341571157602000B            10**16
      20734734265552025560B            10**32
      22456047403722377715B            10**64
      25724473510762300345B            10**128
      34435247735376716757B            10**256
MSK   00007777777777777777B
COA   77773777777777777777B
TCD   00000000002401200500B
UAM   02030455172524202524B
      55474755251601232311B
      07160504551505041125B
      15000000000000000000B
NDP   16175504050357552024B
      57551116550555172255B
      06570000000000000000B
EXR   05300305050405045522B
      05031722045555140516B
      07241057000000000000B
IFL   11141405070114550625B
      16032411171601145514B
      05242405225700000000B
PNL   20012205165755140526B
      05145655165116515700B
      0
SER   16455517225516460000B
OBF   (17B)
BAS   (1)
FOR   (14B)
PNT   (1)
DAT   (226B)
      END
#eor
      MACHINE SUBROUTINE ENDFIL
      ABS,ONE=1
      0
      0
ENF   0            EXIT/ENTRY
      P=REB,Y)0    NOT SUBROUTINE OR VARIABLE TAPE NUMBER
      Y=-Y         SET ADDRESS OF CONSTANT POSITIVE
      T=(Y)        FETCH FILE NAME OR TAPE NUMBER
      U=*6
      V=T.U
      P=REC,V=0    SENSE FOR VARIABLE TAPE NUMBER
FIE   U=2
REA   X=(U)        SEARCH ARGUMENT REGION
      P=ERR,X=0    ERROR ** NO MATCH
      W=*52B
      V=X.W        CLEAR ADDRESS OF ARGUMENT LIST
      Y=T-V
      U=U+1        ADVANCE FOR NEXT FETCH
      P=REA,Y/0
      Y=T
      O=X
RED   T=(O)
      V=77B
      X=V.T
      P=REE,X=0
      V=1
      W=V.T
      P=RED,W=0
REE   Y=Y+X
      Y=O
      P=REB
REC   U=(TCD)
      V=10
      V=0,V.
      Z=V
      V,0=V-
      T=0,T.
      W=T/V
      W,O=W.
      W=W(O)
      Y=0,W.
      X.D=Z*Y
      Y.N=T-X      REMAINDER
      P=FIF,W=0
      V=V+33B
      Y=Y+33B
      V=U+V        ADD IN HIGH ORDER DIGIT
      V=V(6)       SHIFT UP FOR NEXT DIGIT
      T=Y+V        ADD IN LOW ORDER DIGIT
      T=T(30B)
      P=FIE
FIF   Y=Y+33B
      T=Y+U
      T=T(36B)     LEFT JUSTIFY
      P=FIE
REB   O=Y
ENG   U=(O)
      V=77B
      Y=U
      W=V.U
      V=34B
      P=ENJ,W=0
      V=1
      W=V.U
      P=ENG,W=0
      V=777700B
      Y=V.U
      V=34B
ENJ   Y=Y+V
      Y=(O)
ENH   U=(ONE)
      P=ENH,U/0
      Y=031117B
      Y=Y(52B)
      T=O
      Y=Y+T
      Y=(ONE)
      P=ENF
ERR   T=UAM
      Y=152307B    MSG
      Y=Y(52B)
      Y=Y+T
      Y=(ONE)
ERA   T=(ONE)
      P=ERA,T/0
      Y=010224B    ABT CODES
      Y=Y(52B)
      Y=(ONE)
      0
      ..
TCD   00000000002401200500B
UAM   05170655172524202524B     EOF
      55474755251601232311B
      07160504551505041125B
      15000000000000000000B
      END
#eor
      MACHINE SUBROUTINE REWINM
      ABS,ONE=1
      0
      0
REW   0            EXIT/ENTRY
      P=REB,Y)0    NOT SUBROUTINE OR VARIABLE TAPE NUMBER
      Y=-Y         SET ADDRESS OF CONSTANT POSITIVE
      T=(Y)        FETCH FILE NAME OR TAPE NUMBER
      U=*6
      V=T.U
      P=REC,V=0    SENSE FOR VARIABLE TAPE NUMBER
FIE   U=2
REA   X=(U)        SEARCH ARGUMENT REGION
      P=ERR,X=0    ERROR ** NO MATCH
      W=*52B
      V=X.W        CLEAR ADDRESS OF ARGUMENT LIST
      W=T-V
      U=U+1        ADVANCE FOR NEXT FETCH
      P=REA,W/0
REJ   U=(X)
      V=77B
      W=V.U
      P=REK,W=0
      W=1
      W=W.U
      P=REJ,W=0    BUFFER ACTIVE
REK   W=V.U
      Y=T+W
      Y=X
      P=REB
REC   U=(TCD)
      V=12B
      V=0,V.
      Z=V
      V,0=V-
      T=0,T.
      W=T/V
      W,O=W.
      W=W(O)
      Y=0,W.
      X.D=Z*Y
      Y.N=T-X      REMAINDER
      P=FIF,W=0
      V=V+33B
      Y=Y+33B
      V=U+V        ADD IN HIGH ORDER DIGIT
      V=V(6)       SHIFT UP FOR NEXT DIGIT
      T=Y+V        ADD IN LOW ORDER DIGIT
      T=T(30B)
      P=FIE
FIF   Y=Y+33B
      T=Y+U
      T=T(36B)
      P=FIE
REB   T=*52B
      Z=-T.Y
REM   V=(RCL)
      Y=V
REG   U=(Z)
      V=77B
      W=U.V
      P=REW,W=0
      V=1
      W=V.U
      P=REH,W/0
      X=(ONE)
      P=REM,X/0
      Y=(ONE)
      P=REM
REH   T=(Z+2)      IN
      V=(Z+3)      OUT
      W=T-V
      P=RER,W=0
      T=4
      V=T.U        MASK OFF READ / WRITE FLAG
      P=RER,V=0    SENSE FOR READ MODE
KER   V=777706B    DATA IN BUFFER AND WRITE MODE OR U 1XX
      T=20B
      Y=U.V        CLEAR PREVIOUS FUNCTION
      Y=Y+T        SDT EOR FUNCTION
      Y=(Z)
REL   U=(ONE)
      P=REL,U/0
      Y=031117B    CIO CODES
      Y=Y(52B)
      X=Z
      Y=Y+X
      Y=(ONE)
      P=REM
RER   U=(Z)
      V=74B
      Y=U.V
      Y=Y-14B
      P=JER,Y/0
      P=KER
JER   V=777706B
      W=V.U        CLEAR FUNCTION AND SET REQUEST
      V=50B
      Y=V+W
      Y=(Z)
REI   U=(ONE)
      P=REI,U/0
      Y=031117B
      Y=Y(52B)
      T=Z
      Y=Y+T
      Y=(ONE)
      P=REW
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
TCD   00000000002401200500B
RCL   22031400000000000000B
UAM   22052755172524202524B    REW
      55474755251601232311B
      07160504551505041125B
      15000000000000000000B
      END
#eor
      MACHINE SUBROUTINE BACKSP
      ABS,ONE=1
      0
      0
BAC   0            EXIT/ENTRY
      P=REB,Y)0    NOT SUBROUTINE OR VARIABLE TAPE NUMBER
      Y=-Y         SET ADDRESS OF CONSTANT POSITIVE
      T=(Y)        FETCH FILE NAME OR TAPE NUMBER
      U=*6
      V=T.U
      P=REC,V=0    SENSE FOR VARIABLE TAPE NUMBER
FIE   U=2
REA   X=(U)        SEARCH ARGUMENT REGION
      P=ERR,X=0    ERROR ** NO MATCH
      W=*52B
      Y=X.W        CLEAR ADDRESS OF ARGUMENT LIST
      W=T-Y
      U=U+1        ADVANCE FOR NEXT FETCH
      P=REA,W/0
REE   U=(X)
      T=77B
      V=T.U
      P=RED,V=0
      T=1
      V=T.U
      P=REE,V=0
RED   V=77B
      T=V.U
      Y=Y+T
      Y=X
      P=REB
REC   U=(TCD)      DISPLAY CODES FOR TAPE00
      V=10
      V=0,V.       PACK
      Z=V
      V,0=V-       NORMALIZE
      T=0,T.       PACK
      W=T/V
      W,O=W.
      W=W(O)
      Y=0,W.
      X.D=Z*Y
      Y.N=T-X      REMAINDER
      P=FIF,W=0
      V=V+33B
      Y=Y+33B
      V=U+V        ADD IN HIGH ORDER DIGIT
      V=V(6)       SHIFT UP FOR NEXT DIGIT
      T=Y+V        ADD IN LOW ORDER DIGIT
      T=T(30B)
      P=FIE
FIF   Y=Y+33B
      T=Y+U
      T=T(36B)
      P=FIE
REB   T=*52B
      Z=-T.Y
BAD   U=(Z)
      V=77B
      W=V.U
      P=BAC,W=0    EXIT, FILE NOT YET USED
      V=1
      W=V.U
      P=BAD,W=0
      T=(Z+2)      IN
      U=(Z+3)
      V=T-U
      P=RER,V=0    NO DATA IN BUFFER
      T=(Z)
      U=4
      V=T.U
      P=RER,V=0    SENSE READ MODE
REG   T=(Z)
      U=777706B
      V=20B
      Y=T.U
      Y=Y+V
      Y=(Z)
REI   T=(ONE)
      P=REI,T/0
      Y=031117B
      Y=Y(52B)
      U=Z
      Y=Y+U
      Y=(ONE)
      P=BAD
RER   T=(Z)
      U=74B
      V=T.U
      V=V-14B
      P=REF,V/0    SENSE NOT 1 1XX
      P=REG
REF   V=777706B
      Y=V.T
      V=40B
      Y=Y+V
      Y=(Z)
BAE   U=(ONE)
      P=BAE,U/0    SENSE NOT READY
      Y=031117B    CIO
      Y=Y(52B)
      Y=Z+Y
      Y=(ONE)
      P=BAC        EXIT
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
      ..
UAM   02232055172524202524B      BSP
      55474755251601232311B
      07160504551505041125B
      15000000000000000000B
TCD   00000000002401200500B
      END
#eor
      MACHINE SUBROUTINE DISPLA (A1,A2)
      ABS,ONE=1
      0
      2
      0
      0
DIS   0
      O=NAM
      T=(J)        FETCH DATA
DLAY1 U=(ONE)
      P=DLAY1,U/0
DBA   U=(I)        FETCH HOLLERITH
      Y=U
      Y=(O)        STORE HOLLERITH
      O=O+1
      I=I+1
      U=(I)
      P=DBA,U/0
      K=DAT
      Y=55B
      P=DIA,T)0    DATA IS POSITIVE
      Y=46B        SET MINUS CODE
      T=-T
DIA   Y=(K+1)      STORE SIGN
      K=K+1
      P=INT,T=0
DIB   M=INF
      Y=T
      Y=Y(-60B)
      Y=Y-1777B
      P=ERR,Y=0    SENSE FOR INFINITE
      M=RNG
      Y=Y-2000B
      P=ERR,Y=0
      Y,N=T-       NORMALIZE
      P=FPT,N=0    DATA WAS NORMALIZED
      N=N-60B
      P=INT,N/0    SENSE NOT NORMALIZED FLT PT ZERO
FPT   Z=0
      Z=(MAG)      CLEAR MAGNITUDE
      N=13B
      Z,M=T.       UNPACK DATA
      Z=0
      M=M+57B
      P=DTV,M(0    EXPONENT IS LESS THAN 10**0
      N=12B
DTT   U=(N+PTN)
      V=T-U
      P=DTU,V(0
      T=T/U
      Z=Z+N
      P=DTT
DTU   N=N-1
      P=DTT,N/0
      P=DTX
DTV   U=(N+MTN)
      V=T-U
      P=DTW,V)0
      U=(N+PTN)
      T=T*U
      U=N
      Z=Z-U
      P=DTV
DTW   N=N-1
      P=DTV,N/0
DTX   Z=(MAG)      STORE MAGNITUDE DUE TO SCALING UP OR DOWN
      X,N=T.       UNPACK
      Y=X(N)       SHFI FRACTION OFF SCALED DATA
      Y=Y+33B
      Y=(K+1)      STORE INTEGER PORTION
      K=K+1
      Y=57B        STORE DECIMAL POINT
      Y=(K+1)
      K=K+1
      N=N+60B
      W=X(N)
      L=16B
      Z=*14B
      V=-Z.W
DPC   P=DPD,L=0
      V=-Z.V
      L=L-1
      V=V(1)
      W=V
      V=V(2)
      V=V+W
      Y=Z.V
      Y=Y(-60B)
      Y=Y+33B
      Y=(K+1)
      K=K+1
      P=DPC
DPD   Y=55B
      Y=(K+1)
      K=K+1
      Y=(K+1)
      K=K+1
      T=(MAG)
      Y=45B
      P=DPE,Y)0
      Y=46B
      T=-T
DPE   Z=5
      Z=(K+1)
      K=K+1
      Y=(K+1)
      K=K+1
      Z=12B
      Z=0,Z.
      N=3
      U=(TEN)
DPF   T=0,T.
      W=T/U
      V,J=W.
      V=V(J)       SHIFT TO INTEGER POSITION
      X=0,V.
      W.D=X*Z
      Y.N=T-W
      Y=Y+33B
      T=V
      Y=(K+3)
      K=K-1
      N=N-1
      P=DPF,N/0
      Y=55B
      Y=(K+7)
      Y=0
      Y=(K+10B)
PCK   K=DAT
DPG   T=(K)
      K=K+1
      Y=Y+T
DPJ   U=*6
      V=Y.U
      P=DPH,V/0
      Y=Y(6)
      P=DPG,T/0
      P=DPJ
DPH   Y=(O)        STORE PACKED WORD
      O=O+1        ADVANCE FOR NEXT WORD
      Y=0
      P=DPI,T=0    END OF DISPLAY CODES
      P=DPG        GO PACK NEXT WORD
DPI   Y=0          END OD COESS FOUND ** STORE ZEROES FOR END OF LINE
      Y=(O)
      Y=152307B    MSG CODES
      Y=Y(52B)
      U=NAM
      Y=Y+U
WRT   T=(ONE)
      P=WRT,T/0
      Y=(ONE)
      P=DIS
INT   N=20B
      Y=0
      Y=(K+21B)
      Z=12B
      Z=0,Z.       PACK
      U=(TEN)
INA   T=0,T.       PACK
      W=T/U
      V,J=W.       UNPACK
      V=V(J)       SHIFT TO INTEGER POSITION
      X=0,V.       PACK
      W.D=X*Z
      Y.N=T-W
      Y=Y+33B
      T=V
      Y=(K+20B)
      K=K-1
      N=N-1
      P=INA,N/0
      Y=0
      P=PCK
ERR   T=(M)
      Y=T
      Y=(O)
      O=O+1
      P=DPI
      ..           CONSTANTS
INF   55551116061116112405B
RNG   55552201160705555555B
MAG   0
NAM   0            NAME
COF   0            CONVERTED DATA
      0
      0
      0
      0
      0
      0            END OF MEASAGE
TEN   17235000000000000000B            10**1
PTN   17204000000000000000B
      17235000000000000000B
      17266200000000000000B
      17317640000000000000B
      17354704000000000000B
      17406065000000000000B
      17437502200000000000B
      17474611320000000000B
      17525753604000000000B
      17557346545000000000B
      17614520137100000000B
      17645644166720000000B
MTN   17204000000000000000B
      17204000000000000000B
      17146314631463146314B
      17115075341217270243B
      17064061115645706517B
      17026433342726161031B
      16775174265421615507B
      16744143367501327554B
      16706553762465362572B
      16655274616704302141B
      16624227013720233264B
      16566676337663536755B
DAT   55B
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      END
