*
* $Id: hmrs3eb.F,v 1.1.1.2 1996/10/30 08:28:47 cernlib Exp $
*
* $Log: hmrs3eb.F,v $
* Revision 1.1.1.2  1996/10/30 08:28:47  cernlib
* Version 7.04
*
* Revision 1.1.1.1  1996/04/12 15:29:24  plothow
* Version 7.01
*
*
#include "pdf/pilot.h"
C-----------------------------------------------------------------------
       SUBROUTINE HMRS3EB(X,SCALE,MODE,UPV,DNV,SEA,STR,CHM,BOT,GL)
C***************************************************************C
C                                                               C
C                                                               C
C     NEW VERSIONS !!!! JANUARY 1990  (AS DESCRIBED IN          C
C     "PARTON DISTRIBUTIONS ... " P.N. HARRIMAN, A.D. MARTIN,   C
C     R.G. ROBERTS AND W.J. STIRLING PREPRINT DTP-90-04 )       C
C                                                               C
C         ********* DEBUGGED APRIL 1990********                 C
C                                                               C
C         ****** NOW DOWN TO X=10**-5 *********                 C
C                                                               C
C  MODE 1 CORRESPONDS TO  HARRIMAN,                             C
C  MARTIN, ROBERTS, STIRLING (EMC FIT)    WITH LAMBDA= 100 MEV  C
C                                                               C
C  MODE 2  CORRESPONDS TO HARRIMAN,                             C
C  MARTIN, ROBERTS, STIRLING (BCDMS FIT)  WITH LAMBDA= 190 MEV  C
C                                                               C
C             >>>>>>>>  CROSS CHECK  <<<<<<<<                   C
C                                                               C
C    THE FIRST NUMBER IN THE "E" GRID IS  .01969                C
C    THE FIRST NUMBER IN THE "B" GRID IS  .03058                C
C                                                               C
C                                                               C
C                         -*-                                   C
C                                                               C
C    (NOTE THAT X TIMES THE PARTON DISTRIBUTION FUNCTION        C
C    IS RETURNED I.E. G(X) = GLU/X ETC, AND THAT "SEA"          C
C    IS THE LIGHT QUARK SEA I.E. UBAR(X)=DBAR(X)=               C
C      SEA/X FOR A PROTON.  IF IN DOUBT, CHECK THE              C
C    MOMENTUM SUM RULE! NOTE ALSO THAT SCALE=Q IN GEV)          C
C                                                               C
C                         -*-                                   C
C                                                               C
C     (THE RANGE OF APPLICABILITY IS CURRENTLY:                 C
C     10**-5 < X < 1  AND  5 < Q**2 < 1.31 * 10**6              C
C     HIGHER Q**2 VALUES CAN BE SUPPLIED ON REQUEST             C
C     - PROBLEMS, COMMENTS ETC TO WJS@UK.AC.DUR.HEP             C
C                                                               C
C                                                               C
C***************************************************************C
#include "pdf/impdp.inc"
      IF(MODE.EQ.1) CALL STRH3E(X,SCALE,UPV,DNV,SEA,STR,CHM,BOT,GL)
      IF(MODE.EQ.2) CALL STRH3B(X,SCALE,UPV,DNV,SEA,STR,CHM,BOT,GL)
      RETURN
      END
