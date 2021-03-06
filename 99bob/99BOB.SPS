01010  * THE LAYOUT FOR THE INPUT CARDS FOR SPS AND SSPS - THE SYMBOLIC       JR
01020  * PROGRAM CARDS - IS IDENTICAL. THE MEANING OF THE 80 COLUMNS IS       JR
01030  *                                                                      JR
01040  *   01-05 - CARD NUMBERING WITHOUT DUPLICATES AND IN ASCENDING         JR
01050  *        ORDER, BEST WITH GAPS FOR INSERTIONS.                         JR
01060  *   06-07 - COUNT - NUMBER OF CHARACTERS, ONLY USED FOR DEFINITION     JR
01070  *        OF CONSTANTS AND AREAS.                                       JR
01080  *   08-13 - LABEL IF NEEDED.                                           JR
01090  *   14-16 - OPERATION CODE.                                            JR
01100  *   17-27 - A-OPERAND, SUBDIVIDED AS FOLLOWS.                          JR
01110  *       17-22 - ADDRESS IN FORM OF A LABEL OR EXPRESSLY GIVEN          JR
01120  *           AS A NUMBER OF 4 DIGITS.                                   JR
01130  *       23    - OPTIONAL SIGN PLUS OR MINUS FOR AN ADDRESS CALCULATION JR
01150  *       24-26 - ADDRESS CALCULATION, OPTIONAL AS A 3-DIGIT NUMBER      JR
01160  *           MEANING AN INCREMENT OR DECREMENT FOR ADDRESS.             JR
01170  *       27    - OPTIONALLY CHOSEN INDEX REGISTER 1/2/3.                JR
01180  *   28-38 - B-OPERAND, SUBDIVIDED LIKE A-OPERAND.                      JR
01190  *   39    - OPERATION SUPPLEMENT WHERE NEEDED.                         JR
01200  *   40-55 - COMMENTS.                                                  JR
01210  *   56-75 - UNUSED.                                                    JR
01220  *   76-80 - PROGRAM IDENTIFICATION OF FREE CHOICE.                     JR
01221  * 1         2         3         4         5         6         7         8
01222  *901234567890123456789012345678901234567890123456789012345678901234567890
01223  *                                                                      JR
01310        ORG0500                   START AT 500                           JR
01320  START CS 0332                   CLEAR THE                              JR
01330        CS                        PRINT AREA                             JR
01340  LOOP  MCWCOUNT      0250        MOVE COUNT TO PRINT AREA               JR
01350        W                         PRINT IT                               JR
01360        MCWMESG1      0250        PRINT BOTTLES OF BEER ON THE WALL      JR
01370        W                                                                JR
01380        CS 0332                   CLEAR LINE                             JR
01390        CS                                                               JR
01400        MCWCOUNT      0250        PRINT COUNT AGAIN                      JR
01410        W                                                                JR
01420        MCWMESG2      0250        PRINT BOTTLES OF BEER                  JR
01430        W                                                                JR
01440        CS 0332                                                          JR
01450        CS                                                               JR
01460        MCWMESG3      0250        PRINT TAKE ONE DOWN...                 JR
01470        W                                                                JR
01480        CS 0332                                                          JR
01490        CS                                                               JR
01500        S  ONE        COUNT       INCREMENT COUNT                        JR
01510        C  COUNT      LIMIT                                              JR
01520        B  LOOP                  /                                       JR
01530        H  START                  HALT AND REPEAT                        JR
0155002DUMMY DCW*      00                                                     JR
0156002COUNT DCW*      99                                                     JR
0157002ONE   DCW*      01                                                     JR
0158002LIMIT DCW*      00                                                     JR
0159031MESG1 DCW*         BOTTLES OF BEER ON THE WALL                         JR
0160019MESG2 DCW*         BOTTLES OF BEER                                     JR
0161029MESG3 DCW*      TAKE ONE DOWN  PASS IT AROUND                          JR
01620        ENDSTART                  END AND ENTRY                          JR
