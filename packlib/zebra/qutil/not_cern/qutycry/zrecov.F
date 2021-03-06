      SUBROUTINE ZRECOV

C-    RECOVERY ROUTINE RECEIVING CONTROL ON ERROR

#include "zebra/zunit.inc"
#include "zebra/quest.inc"
#include "zebra/qexchcry.inc"

      DATA  JCDID  /8/,   NCOUNT/0/


      JCONDT = ISEC
      NCOUNT = NCOUNT+1

      IQUEST(1) = NCOUNT
      IQUEST(2) = JCONDT
      IQUEST(3) = JCDID
      IQUEST(4) = 77
      IQUEST(5) = 20
      IQUEST(6) = 77
      IF (JCONDT.NE.23)            GO TO 21

C-    TIME LIMIT
      IQUEST(3) = 9

   21 IF (NCOUNT.LT.4095)    CALL ZRECAPL
      IF (IQUEST(4).NE.0)    CALL ZRECPR
      JCODE = 0
      IF (IQUEST(1).GE.0)          GO TO 49
      ID  = IQUEST(3)
      ISW = IQUEST(6)
      CALL ZRECOK
      CALL ZTELL (ID,0)
      IF  (ISW.EQ.0)         CALL ZEND
   49 WRITE (IQLOG,9049) NCOUNT
      CALL ZFATAL

 9049 FORMAT (24H0ZRECOV.  CALL ZFATAL ON,I6,13H-TH RECOVERY.)
      END
