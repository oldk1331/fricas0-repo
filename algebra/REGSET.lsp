
(/VERSIONCHECK 2) 

(PUT '|REGSET;rep| '|SPADreplace| '(XLAM (|s|) |s|)) 

(DEFUN |REGSET;rep| (|s| $) |s|) 

(PUT '|REGSET;per| '|SPADreplace| '(XLAM (|l|) |l|)) 

(DEFUN |REGSET;per| (|l| $) |l|) 

(DEFUN |REGSET;copy;2$;3| (|ts| $)
  (|REGSET;per| (SPADCALL (|REGSET;rep| |ts| $) (QREFELT $ 11)) $)) 

(DEFUN |REGSET;empty;$;4| ($) (|REGSET;per| NIL $)) 

(DEFUN |REGSET;empty?;$B;5| (|ts| $) (NULL (|REGSET;rep| |ts| $))) 

(DEFUN |REGSET;parts;$L;6| (|ts| $) (|REGSET;rep| |ts| $)) 

(DEFUN |REGSET;members;$L;7| (|ts| $) (|REGSET;rep| |ts| $)) 

(DEFUN |REGSET;map;M2$;8| (|f| |ts| $)
  (SPADCALL (SPADCALL |f| (|REGSET;rep| |ts| $) (QREFELT $ 19)) (QREFELT $ 20))) 

(DEFUN |REGSET;map!;M2$;9| (|f| |ts| $)
  (SPADCALL (SPADCALL |f| (|REGSET;rep| |ts| $) (QREFELT $ 22)) (QREFELT $ 20))) 

(DEFUN |REGSET;member?;P$B;10| (|p| |ts| $)
  (SPADCALL |p| (|REGSET;rep| |ts| $) (QREFELT $ 24))) 

(PUT '|REGSET;roughUnitIdeal?;$B;11| '|SPADreplace| '(XLAM (|ts|) 'NIL)) 

(DEFUN |REGSET;roughUnitIdeal?;$B;11| (|ts| $) 'NIL) 

(DEFUN |REGSET;coerce;$Of;12| (|ts| $)
  (PROG (#1=#:G187 |p| #2=#:G186 |lp|)
    (RETURN
     (SEQ
      (LETT |lp| (REVERSE (|REGSET;rep| |ts| $)) . #3=(|REGSET;coerce;$Of;12|))
      (EXIT
       (SPADCALL
        (PROGN
         (LETT #2# NIL . #3#)
         (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 28)) #2#) . #3#)))
              (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
        (QREFELT $ 30))))))) 

(DEFUN |REGSET;mvar;$V;13| (|ts| $)
  (COND ((SPADCALL |ts| (QREFELT $ 15)) (|error| "mvar$REGSET: #1 is empty"))
        ('T (SPADCALL (|SPADfirst| (|REGSET;rep| |ts| $)) (QREFELT $ 32))))) 

(DEFUN |REGSET;first;$U;14| (|ts| $)
  (COND ((SPADCALL |ts| (QREFELT $ 15)) (CONS 1 "failed"))
        ('T (CONS 0 (|SPADfirst| (|REGSET;rep| |ts| $)))))) 

(DEFUN |REGSET;last;$U;15| (|ts| $)
  (COND ((SPADCALL |ts| (QREFELT $ 15)) (CONS 1 "failed"))
        ('T (CONS 0 (SPADCALL (|REGSET;rep| |ts| $) (QREFELT $ 36)))))) 

(DEFUN |REGSET;rest;$U;16| (|ts| $)
  (COND ((SPADCALL |ts| (QREFELT $ 15)) (CONS 1 "failed"))
        ('T (CONS 0 (|REGSET;per| (CDR (|REGSET;rep| |ts| $)) $))))) 

(DEFUN |REGSET;coerce;$L;17| (|ts| $) (|REGSET;rep| |ts| $)) 

(DEFUN |REGSET;collectUpper;$V$;18| (|ts| |v| $)
  (PROG (|lp| |newlp|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |ts| (QREFELT $ 15)) |ts|)
            ('T
             (SEQ
              (LETT |lp| (|REGSET;rep| |ts| $)
                    . #1=(|REGSET;collectUpper;$V$;18|))
              (LETT |newlp| NIL . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((NULL |lp|) 'NIL)
                            ('T
                             (SPADCALL
                              (SPADCALL (|SPADfirst| |lp|) (QREFELT $ 32)) |v|
                              (QREFELT $ 41)))))
                     (GO G191)))
                   (SEQ (LETT |newlp| (CONS (|SPADfirst| |lp|) |newlp|) . #1#)
                        (EXIT (LETT |lp| (CDR |lp|) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (|REGSET;per| (REVERSE |newlp|) $))))))))) 

(DEFUN |REGSET;collectUnder;$V$;19| (|ts| |v| $)
  (PROG (|lp|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |ts| (QREFELT $ 15)) |ts|)
            ('T
             (SEQ
              (LETT |lp| (|REGSET;rep| |ts| $)
                    . #1=(|REGSET;collectUnder;$V$;19|))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((NULL |lp|) 'NIL)
                            ('T
                             (SPADCALL
                              (SPADCALL (|SPADfirst| |lp|) (QREFELT $ 32)) |v|
                              (QREFELT $ 43)))))
                     (GO G191)))
                   (SEQ (EXIT (LETT |lp| (CDR |lp|) . #1#))) NIL (GO G190) G191
                   (EXIT NIL))
              (EXIT (|REGSET;per| |lp| $))))))))) 

(DEFUN |REGSET;construct;L$;20| (|lp| $)
  (PROG (|ts| |eif|)
    (RETURN
     (SEQ (LETT |ts| (|REGSET;per| NIL $) . #1=(|REGSET;construct;L$;20|))
          (EXIT
           (COND ((NULL |lp|) |ts|)
                 ('T
                  (SEQ
                   (LETT |lp| (SPADCALL (ELT $ 45) |lp| (QREFELT $ 47)) . #1#)
                   (SEQ G190
                        (COND
                         ((NULL (COND ((NULL |lp|) 'NIL) ('T 'T))) (GO G191)))
                        (SEQ
                         (LETT |eif|
                               (SPADCALL |ts| (|SPADfirst| |lp|)
                                         (QREFELT $ 48))
                               . #1#)
                         (EXIT
                          (COND
                           ((QEQCAR |eif| 0)
                            (SEQ (LETT |ts| (QCDR |eif|) . #1#)
                                 (EXIT (LETT |lp| (CDR |lp|) . #1#))))
                           ('T
                            (|error|
                             "in construct : List P -> %  from REGSET : bad #1")))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |ts|))))))))) 

(DEFUN |REGSET;extendIfCan;$PU;21| (|ts| |p| $)
  (SEQ
   (COND ((SPADCALL |p| (QREFELT $ 49)) (CONS 1 "failed"))
         ((SPADCALL |ts| (QREFELT $ 15))
          (SEQ
           (LETT |p| (SPADCALL |p| (QREFELT $ 50)) |REGSET;extendIfCan;$PU;21|)
           (EXIT (CONS 0 (|REGSET;per| (LIST |p|) $)))))
         ((NULL
           (SPADCALL (SPADCALL |ts| (QREFELT $ 33))
                     (SPADCALL |p| (QREFELT $ 32)) (QREFELT $ 51)))
          (CONS 1 "failed"))
         ('T
          (COND
           ((SPADCALL (SPADCALL |p| (QREFELT $ 52)) |ts| (QREFELT $ 53))
            (CONS 0 (|REGSET;per| (CONS |p| (|REGSET;rep| |ts| $)) $)))
           ('T (CONS 1 "failed"))))))) 

(DEFUN |REGSET;removeZero;P$P;22| (|p| |ts| $)
  (PROG (|q| #1=#:G256 #2=#:G247 |ts_v-| |v|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL |p| (QREFELT $ 49)) (SPADCALL |ts| (QREFELT $ 15))) |p|)
        ('T
         (SEQ
          (LETT |v| (SPADCALL |p| (QREFELT $ 32))
                . #3=(|REGSET;removeZero;P$P;22|))
          (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 44)) . #3#)
          (COND
           ((SPADCALL |v| |ts| (QREFELT $ 54))
            (SEQ
             (LETT |q|
                   (SPADCALL |p|
                             (PROG2
                                 (LETT #2# (SPADCALL |ts| |v| (QREFELT $ 55))
                                       . #3#)
                                 (QCDR #2#)
                               (|check_union| (QEQCAR #2# 0) (QREFELT $ 9)
                                              #2#))
                             (QREFELT $ 56))
                   . #3#)
             (EXIT
              (COND
               ((SPADCALL |q| (QREFELT $ 57))
                (PROGN (LETT #1# |q| . #3#) (GO #1#)))
               ((SPADCALL (SPADCALL |q| |ts_v-| (QREFELT $ 58)) (QREFELT $ 57))
                (PROGN (LETT #1# (|spadConstant| $ 59) . #3#) (GO #1#))))))))
          (EXIT
           (COND ((SPADCALL |ts_v-| (QREFELT $ 15)) |p|)
                 ('T
                  (SEQ (LETT |q| (|spadConstant| $ 59) . #3#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |p| |v| (QREFELT $ 61))
                                         (QREFELT $ 63)))
                              (GO G191)))
                            (SEQ
                             (LETT |q|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |p| (QREFELT $ 52))
                                               |ts_v-| (QREFELT $ 58))
                                     (SPADCALL |p| (QREFELT $ 64))
                                     (QREFELT $ 65))
                                    |q| (QREFELT $ 66))
                                   . #3#)
                             (EXIT
                              (LETT |p| (SPADCALL |p| (QREFELT $ 67)) . #3#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL |q| (SPADCALL |p| |ts_v-| (QREFELT $ 58))
                                  (QREFELT $ 66)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |REGSET;internalAugment;P2$;23| (|p| |ts| $)
  (COND
   ((SPADCALL |p| (QREFELT $ 49))
    (|error| "in internalAugment$REGSET: ground? #1"))
   ('T
    (SPADCALL (SPADCALL |p| |ts| 'NIL 'NIL 'NIL 'NIL 'NIL (QREFELT $ 68))
              (QREFELT $ 70))))) 

(DEFUN |REGSET;internalAugment;L2$;24| (|lp| |ts| $)
  (COND ((NULL |lp|) |ts|)
        ('T
         (SPADCALL (CDR |lp|) (SPADCALL (|SPADfirst| |lp|) |ts| (QREFELT $ 71))
                   (QREFELT $ 72))))) 

(DEFUN |REGSET;internalAugment;P$5BL;25|
       (|p| |ts| |rem?| |red?| |prim?| |sqfr?| |extend?| $)
  (PROG (#1=#:G270 |us| #2=#:G269 |lts| #3=#:G268 |f| #4=#:G267 |lsfp| |ts_v+|
         |ts_v-| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL |p| (QREFELT $ 32))
            . #5=(|REGSET;internalAugment;P$5BL;25|))
      (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 44)) . #5#)
      (LETT |ts_v+| (SPADCALL |ts| |v| (QREFELT $ 42)) . #5#)
      (COND
       (|rem?|
        (LETT |p| (QVELT (SPADCALL |p| |ts_v-| (QREFELT $ 74)) 1) . #5#)))
      (COND (|red?| (LETT |p| (SPADCALL |p| |ts_v-| (QREFELT $ 58)) . #5#)))
      (COND (|prim?| (LETT |p| (SPADCALL |p| (QREFELT $ 75)) . #5#)))
      (COND
       (|sqfr?|
        (SEQ (LETT |lsfp| (SPADCALL |p| (QREFELT $ 77)) . #5#)
             (EXIT
              (LETT |lts|
                    (PROGN
                     (LETT #4# NIL . #5#)
                     (SEQ (LETT |f| NIL . #5#) (LETT #3# |lsfp| . #5#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |f| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (|REGSET;per|
                                    (CONS |f| (|REGSET;rep| |ts_v-| $)) $)
                                   #4#)
                                  . #5#)))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #5#))))
       (#6='T
        (LETT |lts| (LIST (|REGSET;per| (CONS |p| (|REGSET;rep| |ts_v-| $)) $))
              . #5#)))
      (EXIT
       (COND
        (|extend?|
         (SPADCALL (SPADCALL |ts_v+| (QREFELT $ 17)) |lts| (QREFELT $ 78)))
        (#6#
         (PROGN
          (LETT #2# NIL . #5#)
          (SEQ (LETT |us| NIL . #5#) (LETT #1# |lts| . #5#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |us| (CAR #1#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT #2#
                       (CONS
                        (|REGSET;per|
                         (SPADCALL (|REGSET;rep| |ts_v+| $)
                                   (|REGSET;rep| |us| $) (QREFELT $ 79))
                         $)
                        #2#)
                       . #5#)))
               (LETT #1# (CDR #1#) . #5#) (GO G190) G191
               (EXIT (NREVERSE #2#))))))))))) 

(DEFUN |REGSET;augment;P$L;26| (|p| |ts| $)
  (COND
   ((SPADCALL |p| (QREFELT $ 49)) (|error| "in augment$REGSET: ground? #1"))
   ((SPADCALL (SPADCALL |p| (QREFELT $ 32)) |ts| (QREFELT $ 54))
    (|error| "in augment$REGSET: bad #1"))
   ('T (SPADCALL |p| |ts| 'T 'T 'T 'T 'T (QREFELT $ 68))))) 

(DEFUN |REGSET;extend;P$L;27| (|p| |ts| $)
  (PROG (|lts| #1=#:G279 |us| |split| |v|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 49)) (|error| "in extend$REGSET: ground? #1"))
       ('T
        (SEQ
         (LETT |v| (SPADCALL |p| (QREFELT $ 32)) . #2=(|REGSET;extend;P$L;27|))
         (COND
          ((NULL
            (SPADCALL (SPADCALL |ts| (QREFELT $ 33))
                      (SPADCALL |p| (QREFELT $ 32)) (QREFELT $ 51)))
           (EXIT (|error| "in extend$REGSET: bad #1"))))
         (LETT |lts| NIL . #2#)
         (LETT |split|
               (SPADCALL (SPADCALL |p| (QREFELT $ 52)) |ts| (QREFELT $ 81))
               . #2#)
         (SEQ (LETT |us| NIL . #2#) (LETT #1# |split| . #2#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |us| (CAR #1#) . #2#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT |lts|
                      (SPADCALL (SPADCALL |p| |us| (QREFELT $ 80)) |lts|
                                (QREFELT $ 82))
                      . #2#)))
              (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT |lts|)))))))) 

(DEFUN |REGSET;invertible?;P$B;28| (|p| |ts| $)
  (SPADCALL |p| |ts| (QREFELT $ 85))) 

(DEFUN |REGSET;invertible?;P$L;29| (|p| |ts| $)
  (SPADCALL |p| |ts| (QREFELT $ 88))) 

(DEFUN |REGSET;invertibleSet;P$L;30| (|p| |ts| $)
  (SPADCALL |p| |ts| (QREFELT $ 92))) 

(DEFUN |REGSET;lastSubResultant;2P$L;31| (|p1| |p2| |ts| $)
  (SPADCALL |p1| |p2| |ts| (QREFELT $ 95))) 

(DEFUN |REGSET;squareFreePart;P$L;32| (|p| |ts| $)
  (SPADCALL |p| |ts| (QREFELT $ 99))) 

(DEFUN |REGSET;intersect;P$L;33| (|p| |ts| $)
  (SPADCALL (LIST |p|) (LIST |ts|) 'NIL 'NIL (QREFELT $ 102))) 

(DEFUN |REGSET;intersect;L2L;34| (|lp| |lts| $)
  (SPADCALL |lp| |lts| 'NIL 'NIL (QREFELT $ 102))) 

(DEFUN |REGSET;zeroSetSplit;LL;35| (|lp| $)
  (SPADCALL |lp| 'T 'NIL (QREFELT $ 105))) 

(DEFUN |REGSET;zeroSetSplit;LBL;36| (|lp| |clos?| $)
  (SPADCALL |lp| |clos?| 'NIL (QREFELT $ 105))) 

(DEFUN |REGSET;zeroSetSplit;L2BL;37| (|lp| |clos?| |info?| $)
  (SPADCALL |lp| 'T |clos?| |info?| 'T (QREFELT $ 108))) 

(DEFUN |REGSET;zeroSetSplit;L4BL;38| (|lp| |hash?| |clos?| |info?| |prep?| $)
  (PROG (|lts| |dom3| |dom2| |dom1| |#G94| |#G93| |#G92| |#G91| |#G90| |#G89|
         |s3| |s2| |s1| |#G85| |#G84| |#G83| |#G82| |#G81| |#G80| |e|)
    (RETURN
     (SEQ
      (COND
       (|hash?|
        (SEQ
         (LETT |e| (|make_full_CVEC| 0) . #1=(|REGSET;zeroSetSplit;L4BL;38|))
         (COND
          (|info?|
           (PROGN
            (LETT |#G80| "w" . #1#)
            (LETT |#G81| "g" . #1#)
            (LETT |#G82| "i" . #1#)
            (LETT |s1| |#G80| . #1#)
            (LETT |s2| |#G81| . #1#)
            (LETT |s3| |#G82| . #1#)))
          (#2='T
           (PROGN
            (LETT |#G83| |e| . #1#)
            (LETT |#G84| |e| . #1#)
            (LETT |#G85| |e| . #1#)
            (LETT |s1| |#G83| . #1#)
            (LETT |s2| |#G84| . #1#)
            (LETT |s3| |#G85| . #1#))))
         (COND
          (|info?|
           (PROGN
            (LETT |#G89| "QCMPACK" . #1#)
            (LETT |#G90| "REGSETGCD: Gcd" . #1#)
            (LETT |#G91| "REGSETGCD: Inv Set" . #1#)
            (LETT |dom1| |#G89| . #1#)
            (LETT |dom2| |#G90| . #1#)
            (LETT |dom3| |#G91| . #1#)))
          (#2#
           (PROGN
            (LETT |#G92| |e| . #1#)
            (LETT |#G93| |e| . #1#)
            (LETT |#G94| |e| . #1#)
            (LETT |dom1| |#G92| . #1#)
            (LETT |dom2| |#G93| . #1#)
            (LETT |dom3| |#G94| . #1#))))
         (SPADCALL |s1| "W" |dom1| (QREFELT $ 112))
         (SPADCALL |s2| "G" |dom2| (QREFELT $ 113))
         (EXIT (SPADCALL |s3| "I" |dom3| (QREFELT $ 114))))))
      (LETT |lts| (SPADCALL |lp| |clos?| |info?| |prep?| (QREFELT $ 115))
            . #1#)
      (COND
       (|hash?|
        (SEQ (SPADCALL (QREFELT $ 116)) (SPADCALL (QREFELT $ 117))
             (EXIT (SPADCALL (QREFELT $ 118))))))
      (EXIT |lts|))))) 

(DEFUN |REGSET;internalZeroSetSplit;L3BL;39| (|lp| |clos?| |info?| |prep?| $)
  (PROG (|lts| #1=#:G316 |p| |ts| |pp|)
    (RETURN
     (SEQ
      (COND
       (|prep?|
        (SEQ
         (LETT |pp| (SPADCALL |lp| |clos?| |info?| (QREFELT $ 120))
               . #2=(|REGSET;internalZeroSetSplit;L3BL;39|))
         (LETT |lp| (QCAR |pp|) . #2#) (EXIT (LETT |lts| (QCDR |pp|) . #2#))))
       (#3='T
        (SEQ (LETT |ts| (SPADCALL NIL (QREFELT $ 20)) . #2#)
             (EXIT (LETT |lts| (LIST |ts|) . #2#)))))
      (LETT |lp| (SPADCALL (ELT $ 57) |lp| (QREFELT $ 122)) . #2#)
      (EXIT
       (COND ((SPADCALL (ELT $ 49) |lp| (QREFELT $ 123)) NIL)
             ((OR (NULL |lp|) (SPADCALL |lts| (QREFELT $ 124))) |lts|)
             ('T
              (SEQ (LETT |lp| (SPADCALL (ELT $ 45) |lp| (QREFELT $ 47)) . #2#)
                   (EXIT
                    (COND
                     (|clos?|
                      (SPADCALL |lp| |lts| |clos?| |info?| (QREFELT $ 102)))
                     (#3#
                      (SEQ
                       (SEQ (LETT |p| NIL . #2#) (LETT #1# |lp| . #2#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |lts|
                                    (SPADCALL (LIST |p|) |lts| |clos?| |info?|
                                              (QREFELT $ 102))
                                    . #2#)))
                            (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |lts|))))))))))))) 

(DEFUN |REGSET;largeSystem?| (|lp| $)
  (PROG (|lts|)
    (RETURN
     (SEQ
      (COND ((SPADCALL (LENGTH |lp|) 16 (QREFELT $ 125)) 'T)
            ((< (LENGTH |lp|) 13) 'NIL)
            ('T
             (SEQ (LETT |lts| NIL |REGSET;largeSystem?|)
                  (EXIT
                   (SPADCALL
                    (- (LENGTH |lp|) (SPADCALL |lp| |lts| (QREFELT $ 126))) 3
                    (QREFELT $ 127)))))))))) 

(DEFUN |REGSET;smallSystem?| (|lp| $) (< (LENGTH |lp|) 5)) 

(DEFUN |REGSET;mediumSystem?| (|lp| $)
  (PROG (|lts|)
    (RETURN
     (SEQ (LETT |lts| NIL |REGSET;mediumSystem?|)
          (EXIT
           (< (- (SPADCALL |lp| |lts| (QREFELT $ 126)) (LENGTH |lp|)) 2)))))) 

(DEFUN |REGSET;lin?| (|p| $)
  (COND
   ((SPADCALL (SPADCALL |p| (QREFELT $ 52)) (QREFELT $ 49))
    (EQL (SPADCALL |p| (QREFELT $ 128)) 1))
   ('T 'NIL))) 

(DEFUN |REGSET;pre_process;L2BR;44| (|lp| |clos?| |info?| $)
  (PROG (#1=#:G368 |lp2| |lts| #2=#:G381 |p| |lp3| #3=#:G380 |lp4| #4=#:G379
         #5=#:G378 #6=#:G377 #7=#:G376 #8=#:G375 #9=#:G374 #10=#:G373
         #11=#:G372 #12=#:G371 #13=#:G370 |lp1| #14=#:G369 |ts|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ts| (SPADCALL NIL (QREFELT $ 20))
              . #15=(|REGSET;pre_process;L2BR;44|))
        (LETT |lts| (LIST |ts|) . #15#)
        (EXIT
         (COND ((NULL |lp|) (CONS |lp| |lts|))
               (#16='T
                (SEQ (LETT |lp1| NIL . #15#) (LETT |lp2| NIL . #15#)
                     (SEQ (LETT |p| NIL . #15#) (LETT #14# |lp| . #15#) G190
                          (COND
                           ((OR (ATOM #14#)
                                (PROGN (LETT |p| (CAR #14#) . #15#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |p| (QREFELT $ 67))
                                        (QREFELT $ 49))
                              (LETT |lp1| (CONS |p| |lp1|) . #15#))
                             ('T (LETT |lp2| (CONS |p| |lp2|) . #15#)))))
                          (LETT #14# (CDR #14#) . #15#) (GO G190) G191
                          (EXIT NIL))
                     (LETT |lts|
                           (SPADCALL |lp1| (LIST |ts|) |clos?| |info?|
                                     (QREFELT $ 102))
                           . #15#)
                     (EXIT
                      (COND
                       ((SPADCALL |lp| (QREFELT $ 130))
                        (COND
                         ((|REGSET;largeSystem?| |lp| $)
                          (PROGN
                           (LETT #1# (CONS |lp2| |lts|) . #15#)
                           (GO #1#)))
                         (#16#
                          (SEQ
                           (COND
                            ((SPADCALL (LENGTH |lp|) 7 (QREFELT $ 125))
                             (SEQ
                              (LETT |lp2| (SPADCALL |lp2| (QREFELT $ 131))
                                    . #15#)
                              (LETT |lp2|
                                    (SPADCALL (ELT $ 57) |lp2| (QREFELT $ 122))
                                    . #15#)
                              (EXIT
                               (COND
                                ((SPADCALL (ELT $ 49) |lp2| (QREFELT $ 123))
                                 (PROGN
                                  (LETT #1# (CONS |lp2| |lts|) . #15#)
                                  (GO #1#)))
                                (#16#
                                 (SEQ
                                  (LETT |lp3|
                                        (PROGN
                                         (LETT #13# NIL . #15#)
                                         (SEQ (LETT |p| NIL . #15#)
                                              (LETT #12# |lp2| . #15#) G190
                                              (COND
                                               ((OR (ATOM #12#)
                                                    (PROGN
                                                     (LETT |p| (CAR #12#)
                                                           . #15#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((|REGSET;lin?| |p| $)
                                                  (LETT #13# (CONS |p| #13#)
                                                        . #15#)))))
                                              (LETT #12# (CDR #12#) . #15#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #13#))))
                                        . #15#)
                                  (LETT |lp4|
                                        (PROGN
                                         (LETT #11# NIL . #15#)
                                         (SEQ (LETT |p| NIL . #15#)
                                              (LETT #10# |lp2| . #15#) G190
                                              (COND
                                               ((OR (ATOM #10#)
                                                    (PROGN
                                                     (LETT |p| (CAR #10#)
                                                           . #15#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((COND
                                                   ((|REGSET;lin?| |p| $) 'NIL)
                                                   (#16# 'T))
                                                  (LETT #11# (CONS |p| #11#)
                                                        . #15#)))))
                                              (LETT #10# (CDR #10#) . #15#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #11#))))
                                        . #15#)
                                  (COND
                                   (|clos?|
                                    (LETT |lts|
                                          (SPADCALL |lp4| |lts| |clos?| |info?|
                                                    (QREFELT $ 102))
                                          . #15#))
                                   (#16#
                                    (SEQ
                                     (LETT |lp4|
                                           (SPADCALL (ELT $ 45) |lp4|
                                                     (QREFELT $ 47))
                                           . #15#)
                                     (EXIT
                                      (SEQ (LETT |p| NIL . #15#)
                                           (LETT #9# |lp4| . #15#) G190
                                           (COND
                                            ((OR (ATOM #9#)
                                                 (PROGN
                                                  (LETT |p| (CAR #9#) . #15#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT |lts|
                                                   (SPADCALL (LIST |p|) |lts|
                                                             |clos?| |info?|
                                                             (QREFELT $ 102))
                                                   . #15#)))
                                           (LETT #9# (CDR #9#) . #15#)
                                           (GO G190) G191 (EXIT NIL))))))
                                  (EXIT (LETT |lp2| |lp3| . #15#))))))))
                            (#16#
                             (SEQ
                              (LETT |lp2| (SPADCALL |lp2| (QREFELT $ 131))
                                    . #15#)
                              (LETT |lp2|
                                    (SPADCALL (ELT $ 57) |lp2| (QREFELT $ 122))
                                    . #15#)
                              (EXIT
                               (COND
                                ((SPADCALL (ELT $ 49) |lp2| (QREFELT $ 123))
                                 (PROGN
                                  (LETT #1# (CONS |lp2| |lts|) . #15#)
                                  (GO #1#))))))))
                           (COND
                            (|clos?|
                             (LETT |lts|
                                   (SPADCALL |lp2| |lts| |clos?| |info?|
                                             (QREFELT $ 102))
                                   . #15#))
                            (#16#
                             (SEQ
                              (LETT |lp2|
                                    (SPADCALL (ELT $ 45) |lp2| (QREFELT $ 47))
                                    . #15#)
                              (EXIT
                               (SEQ (LETT |p| NIL . #15#)
                                    (LETT #8# |lp2| . #15#) G190
                                    (COND
                                     ((OR (ATOM #8#)
                                          (PROGN
                                           (LETT |p| (CAR #8#) . #15#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |lts|
                                            (SPADCALL (LIST |p|) |lts| |clos?|
                                                      |info?| (QREFELT $ 102))
                                            . #15#)))
                                    (LETT #8# (CDR #8#) . #15#) (GO G190) G191
                                    (EXIT NIL))))))
                           (LETT |lp2| NIL . #15#)
                           (EXIT
                            (PROGN
                             (LETT #1# (CONS |lp2| |lts|) . #15#)
                             (GO #1#)))))))
                       ((|REGSET;smallSystem?| |lp| $) (CONS |lp2| |lts|))
                       ((|REGSET;mediumSystem?| |lp| $)
                        (CONS (SPADCALL |lp2| (QREFELT $ 131)) |lts|))
                       (#16#
                        (SEQ
                         (LETT |lp3|
                               (PROGN
                                (LETT #7# NIL . #15#)
                                (SEQ (LETT |p| NIL . #15#)
                                     (LETT #6# |lp2| . #15#) G190
                                     (COND
                                      ((OR (ATOM #6#)
                                           (PROGN
                                            (LETT |p| (CAR #6#) . #15#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((|REGSET;lin?| |p| $)
                                         (LETT #7# (CONS |p| #7#) . #15#)))))
                                     (LETT #6# (CDR #6#) . #15#) (GO G190) G191
                                     (EXIT (NREVERSE #7#))))
                               . #15#)
                         (LETT |lp4|
                               (PROGN
                                (LETT #5# NIL . #15#)
                                (SEQ (LETT |p| NIL . #15#)
                                     (LETT #4# |lp2| . #15#) G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN
                                            (LETT |p| (CAR #4#) . #15#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((COND ((|REGSET;lin?| |p| $) 'NIL)
                                               (#16# 'T))
                                         (LETT #5# (CONS |p| #5#) . #15#)))))
                                     (LETT #4# (CDR #4#) . #15#) (GO G190) G191
                                     (EXIT (NREVERSE #5#))))
                               . #15#)
                         (COND
                          (|clos?|
                           (LETT |lts|
                                 (SPADCALL |lp4| |lts| |clos?| |info?|
                                           (QREFELT $ 102))
                                 . #15#))
                          (#16#
                           (SEQ
                            (LETT |lp4|
                                  (SPADCALL (ELT $ 45) |lp4| (QREFELT $ 47))
                                  . #15#)
                            (EXIT
                             (SEQ (LETT |p| NIL . #15#) (LETT #3# |lp4| . #15#)
                                  G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN
                                         (LETT |p| (CAR #3#) . #15#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |lts|
                                          (SPADCALL (LIST |p|) |lts| |clos?|
                                                    |info?| (QREFELT $ 102))
                                          . #15#)))
                                  (LETT #3# (CDR #3#) . #15#) (GO G190) G191
                                  (EXIT NIL))))))
                         (COND
                          (|clos?|
                           (LETT |lts|
                                 (SPADCALL |lp3| |lts| |clos?| |info?|
                                           (QREFELT $ 102))
                                 . #15#))
                          (#16#
                           (SEQ
                            (LETT |lp3|
                                  (SPADCALL (ELT $ 45) |lp3| (QREFELT $ 47))
                                  . #15#)
                            (EXIT
                             (SEQ (LETT |p| NIL . #15#) (LETT #2# |lp3| . #15#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN
                                         (LETT |p| (CAR #2#) . #15#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |lts|
                                          (SPADCALL (LIST |p|) |lts| |clos?|
                                                    |info?| (QREFELT $ 102))
                                          . #15#)))
                                  (LETT #2# (CDR #2#) . #15#) (GO G190) G191
                                  (EXIT NIL))))))
                         (LETT |lp2| NIL . #15#)
                         (EXIT
                          (PROGN
                           (LETT #1# (CONS |lp2| |lts|) . #15#)
                           (GO #1#)))))))))))))
      #1# (EXIT #1#))))) 

(DECLAIM (NOTINLINE |RegularTriangularSet;|)) 

(DEFUN |RegularTriangularSet| (&REST #1=#:G400)
  (PROG ()
    (RETURN
     (PROG (#2=#:G401)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|RegularTriangularSet|)
                                           '|domainEqualList|)
                . #3=(|RegularTriangularSet|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |RegularTriangularSet;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|RegularTriangularSet|))))))))))) 

(DEFUN |RegularTriangularSet;| (|#1| |#2| |#3| |#4|)
  (PROG (#1=#:G399 |pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|RegularTriangularSet|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT DV$3 (|devaluate| |#3|) . #2#)
      (LETT DV$4 (|devaluate| |#4|) . #2#)
      (LETT |dv$| (LIST '|RegularTriangularSet| DV$1 DV$2 DV$3 DV$4) . #2#)
      (LETT $ (GETREFV 149) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (AND
                                           (|HasCategory| |#4|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#4|)))
                                           (|HasCategory| |#4|
                                                          '(|SetCategory|)))
                                          (|HasCategory| |#4|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#4| '(|BasicType|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#3| '(|Finite|))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|RegularTriangularSet|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 32))
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #2#)
           (|augmentPredVector| $ 64))
      (AND (|HasCategory| |#4| '(|BasicType|)) #1# (|augmentPredVector| $ 128))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RegularTriangularSet| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|List| 9) (0 . |copy|)
              |REGSET;copy;2$;3| |REGSET;empty;$;4| (|Boolean|)
              |REGSET;empty?;$B;5| |REGSET;parts;$L;6| |REGSET;members;$L;7|
              (|Mapping| 9 9) (5 . |map|) |REGSET;construct;L$;20|
              |REGSET;map;M2$;8| (11 . |map!|) |REGSET;map!;M2$;9|
              (17 . |member?|) |REGSET;member?;P$B;10|
              |REGSET;roughUnitIdeal?;$B;11| (|OutputForm|) (23 . |coerce|)
              (|List| $) (28 . |brace|) |REGSET;coerce;$Of;12| (33 . |mvar|)
              |REGSET;mvar;$V;13| (|Union| 9 '#1="failed") |REGSET;first;$U;14|
              (38 . |last|) |REGSET;last;$U;15| (|Union| $ '#1#)
              |REGSET;rest;$U;16| |REGSET;coerce;$L;17| (43 . >)
              |REGSET;collectUpper;$V$;18| (49 . >=)
              |REGSET;collectUnder;$V$;19| (55 . |infRittWu?|)
              (|Mapping| 14 9 9) (61 . |sort|) |REGSET;extendIfCan;$PU;21|
              (67 . |ground?|) (72 . |primitivePart|) (77 . <) (83 . |init|)
              |REGSET;invertible?;P$B;28| (88 . |algebraic?|) (94 . |select|)
              (100 . |lazyPrem|) (106 . |zero?|) |REGSET;removeZero;P$P;22|
              (111 . |Zero|) (|NonNegativeInteger|) (115 . |degree|)
              (|Integer|) (121 . |positive?|) (126 . |mainMonomial|) (131 . *)
              (137 . +) (143 . |tail|) |REGSET;internalAugment;P$5BL;25|
              (|List| $$) (148 . |first|) |REGSET;internalAugment;P2$;23|
              |REGSET;internalAugment;L2$;24|
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (153 . |remainder|) (159 . |mainPrimitivePart|)
              (|PolynomialSetUtilitiesPackage| 6 7 8 9)
              (164 . |squareFreeFactors|) (169 . |extend|) (175 . |concat|)
              |REGSET;augment;P$L;26| |REGSET;invertibleSet;P$L;30|
              (181 . |concat|) |REGSET;extend;P$L;27|
              (|RegularTriangularSetGcdPackage| 6 7 8 9 $$)
              (187 . |toseInvertible?|)
              (|Record| (|:| |val| 14) (|:| |tower| $$)) (|List| 86)
              (193 . |toseInvertible?|)
              (|Record| (|:| |val| 14) (|:| |tower| $)) (|List| 89)
              |REGSET;invertible?;P$L;29| (199 . |toseInvertibleSet|)
              (|Record| (|:| |val| 9) (|:| |tower| $$)) (|List| 93)
              (205 . |toseLastSubResultant|)
              (|Record| (|:| |val| 9) (|:| |tower| $)) (|List| 96)
              |REGSET;lastSubResultant;2P$L;31| (212 . |toseSquareFreePart|)
              |REGSET;squareFreePart;P$L;32|
              (|RegularSetDecompositionPackage| 6 7 8 9 $$) (218 . |decompose|)
              |REGSET;intersect;P$L;33| |REGSET;intersect;L2L;34|
              |REGSET;zeroSetSplit;L2BL;37| |REGSET;zeroSetSplit;LL;35|
              |REGSET;zeroSetSplit;LBL;36| |REGSET;zeroSetSplit;L4BL;38|
              (|Void|) (|String|) (|QuasiComponentPackage| 6 7 8 9 $$)
              (226 . |startTable!|) (233 . |startTableGcd!|)
              (240 . |startTableInvSet!|) |REGSET;internalZeroSetSplit;L3BL;39|
              (247 . |stopTable!|) (251 . |stopTableGcd!|)
              (255 . |stopTableInvSet!|)
              (|Record| (|:| |val| 10) (|:| |towers| 29))
              |REGSET;pre_process;L2BR;44| (|Mapping| 14 9) (259 . |remove|)
              (265 . |any?|) (271 . |empty?|) (276 . >)
              (282 . |numberOfVariables|) (288 . >) (294 . |mdeg|)
              (299 . |One|) (303 . |probablyZeroDim?|) (308 . |crushedSet|)
              (|Mapping| 9 9 9) (|Equation| 9) (|List| 133) (|InputForm|)
              (|Record| (|:| |num| 9) (|:| |den| 6)) (|Union| 9 29)
              (|Union| 14 29) (|List| 8)
              (|Record| (|:| |close| $) (|:| |open| 10)) (|List| 140)
              (|Mapping| 14 9 10) (|Record| (|:| |close| 10) (|:| |open| 10))
              (|Record| (|:| |bas| $) (|:| |top| 10)) (|Union| 144 '#1#)
              (|Record| (|:| |under| $) (|:| |floor| $) (|:| |upper| $))
              (|HashState|) (|SingleInteger|))
           '#(~= 313 |zeroSetSplitIntoTriangularSystems| 319 |zeroSetSplit| 324
              |variables| 351 |trivialIdeal?| 356 |triangular?| 361
              |stronglyReduced?| 366 |stronglyReduce| 377 |squareFreePart| 383
              |sort| 389 |size?| 395 |select| 401 |sample| 413
              |roughUnitIdeal?| 417 |roughSubIdeal?| 422 |roughEqualIdeals?|
              428 |roughBase?| 434 |rewriteSetWithReduction| 439
              |rewriteIdealWithRemainder| 447 |rewriteIdealWithHeadRemainder|
              453 |retractIfCan| 459 |retract| 464 |rest| 469 |removeZero| 474
              |removeDuplicates| 480 |remove| 485 |remainder| 497 |reduced?|
              503 |reduceByQuasiMonic| 510 |reduce| 516 |quasiComponent| 545
              |purelyTranscendental?| 550 |purelyAlgebraicLeadingMonomial?| 556
              |purelyAlgebraic?| 562 |pre_process| 573 |parts| 580
              |normalized?| 585 |mvar| 596 |more?| 601 |members| 607 |member?|
              612 |map!| 618 |map| 624 |mainVariables| 630 |mainVariable?| 635
              |less?| 641 |latex| 647 |lastSubResultantElseSplit| 652
              |lastSubResultant| 659 |last| 666 |invertibleSet| 671
              |invertibleElseSplit?| 677 |invertible?| 683 |intersect| 695
              |internalZeroSetSplit| 719 |internalAugment| 727 |initials| 750
              |initiallyReduced?| 755 |initiallyReduce| 766 |infRittWu?| 772
              |iexactQuo| 778 |headRemainder| 784 |headReduced?| 790
              |headReduce| 801 |hashUpdate!| 807 |hash| 813 |first| 818 |find|
              823 |extendIfCan| 829 |extend| 835 |every?| 865 |eval| 871 |eq?|
              897 |empty?| 903 |empty| 908 |degree| 912 |count| 917 |copy| 929
              |convert| 934 |construct| 939 |collectUpper| 944 |collectUnder|
              950 |collectQuasiMonic| 956 |collect| 961 |coerce| 967 |coHeight|
              982 |basicSet| 987 |autoReduced?| 1000 |augment| 1006 |any?| 1030
              |algebraicVariables| 1036 |algebraicCoefficients?| 1041
              |algebraic?| 1047 = 1053 |#| 1059)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 2))
                 (CONS
                  '#(|RegularTriangularSetCategory&| |TriangularSetCategory&|
                     |PolynomialSetCategory&| |Collection&|
                     |HomogeneousAggregate&| |SetCategory&| |Aggregate&|
                     |Evalable&| |BasicType&| NIL NIL |RetractableFrom&| NIL
                     NIL NIL |InnerEvalable&| NIL)
                  (CONS
                   '#((|RegularTriangularSetCategory| 6 7 8 9)
                      (|TriangularSetCategory| 6 7 8 9)
                      (|PolynomialSetCategory| 6 7 8 9) (|Collection| 9)
                      (|HomogeneousAggregate| 9) (|SetCategory|) (|Aggregate|)
                      (|Evalable| 9) (|BasicType|) (|shallowlyMutable|)
                      (|finiteAggregate|) (|RetractableFrom| (|List| 9))
                      (|CoercibleTo| (|List| 9)) (|Type|) (|CoercibleTo| 27)
                      (|InnerEvalable| 9 9) (|ConvertibleTo| 135))
                   (|makeByteWordVec2| 148
                                       '(1 10 0 0 11 2 10 0 18 0 19 2 10 0 18 0
                                         22 2 10 14 9 0 24 1 9 27 0 28 1 27 0
                                         29 30 1 9 8 0 32 1 10 9 0 36 2 8 14 0
                                         0 41 2 8 14 0 0 43 2 9 14 0 0 45 2 10
                                         0 46 0 47 1 9 14 0 49 1 9 0 0 50 2 8
                                         14 0 0 51 1 9 0 0 52 2 0 14 8 0 54 2 0
                                         34 0 8 55 2 9 0 0 0 56 1 9 14 0 57 0 9
                                         0 59 2 9 60 0 8 61 1 62 14 0 63 1 9 0
                                         0 64 2 9 0 0 0 65 2 9 0 0 0 66 1 9 0 0
                                         67 1 69 2 0 70 2 0 73 9 0 74 1 9 0 0
                                         75 1 76 10 9 77 2 0 29 10 29 78 2 10 0
                                         0 0 79 2 69 0 0 0 82 2 84 14 9 2 85 2
                                         84 87 9 2 88 2 84 69 9 2 92 3 84 94 9
                                         9 2 95 2 84 94 9 2 99 4 101 69 10 69
                                         14 14 102 3 111 109 110 110 110 112 3
                                         84 109 110 110 110 113 3 84 109 110
                                         110 110 114 0 111 109 116 0 84 109 117
                                         0 84 109 118 2 10 0 121 0 122 2 10 14
                                         121 0 123 1 69 14 0 124 2 60 14 0 0
                                         125 2 101 60 10 69 126 2 62 14 0 0 127
                                         1 9 60 0 128 0 6 0 129 1 76 14 10 130
                                         1 76 10 10 131 2 0 14 0 0 1 1 0 141 10
                                         1 3 0 29 10 14 14 105 5 0 29 10 14 14
                                         14 14 108 2 0 29 10 14 107 1 0 29 10
                                         106 1 0 139 0 1 1 0 14 0 1 1 4 14 0 1
                                         1 0 14 0 1 2 0 14 9 0 1 2 0 9 9 0 1 2
                                         0 97 9 0 100 2 0 146 0 8 1 2 0 14 0 60
                                         1 2 7 0 121 0 1 2 0 34 0 8 55 0 0 0 1
                                         1 4 14 0 26 2 4 14 0 0 1 2 4 14 0 0 1
                                         1 4 14 0 1 4 0 10 10 0 132 46 1 2 4 10
                                         10 0 1 2 4 10 10 0 1 1 0 38 10 1 1 0 0
                                         10 1 1 0 38 0 39 2 0 9 9 0 58 1 8 0 0
                                         1 2 8 0 9 0 1 2 7 0 121 0 1 2 4 73 9 0
                                         74 3 0 14 9 0 46 1 2 0 9 9 0 1 4 8 9
                                         132 0 9 9 1 3 7 9 132 0 9 1 2 7 9 132
                                         0 1 4 0 9 9 0 132 46 1 1 0 143 0 1 2 0
                                         14 9 0 1 2 0 14 9 0 1 1 0 14 0 1 2 0
                                         14 9 0 1 3 0 119 10 14 14 120 1 7 10 0
                                         16 1 0 14 0 1 2 0 14 9 0 1 1 0 8 0 33
                                         2 0 14 0 60 1 1 7 10 0 17 2 8 14 9 0
                                         25 2 6 0 18 0 23 2 0 0 18 0 21 1 0 139
                                         0 1 2 0 14 8 0 1 2 0 14 0 60 1 1 0 110
                                         0 1 3 0 137 9 9 0 1 3 0 97 9 9 0 98 1
                                         0 34 0 37 2 0 29 9 0 81 2 0 138 9 0 1
                                         2 0 90 9 0 91 2 0 14 9 0 53 2 0 29 10
                                         29 104 2 0 29 9 29 1 2 0 29 9 0 103 2
                                         0 29 10 0 1 4 0 29 10 14 14 14 115 7 0
                                         29 9 0 14 14 14 14 14 68 2 0 0 9 0 71
                                         2 0 0 10 0 72 1 0 10 0 1 1 0 14 0 1 2
                                         0 14 9 0 1 2 0 9 9 0 1 2 0 14 0 0 1 2
                                         4 6 6 6 1 2 4 136 9 0 1 1 0 14 0 1 2 0
                                         14 9 0 1 2 0 9 9 0 1 2 0 147 147 0 1 1
                                         0 148 0 1 1 0 34 0 35 2 0 34 121 0 1 2
                                         0 38 0 9 48 2 0 29 10 0 1 2 0 29 10 29
                                         78 2 0 29 9 0 83 2 0 29 9 29 1 2 0 0 0
                                         9 1 2 7 14 121 0 1 2 1 0 0 133 1 2 1 0
                                         0 134 1 3 1 0 0 10 10 1 3 1 0 0 9 9 1
                                         2 0 14 0 0 1 1 0 14 0 15 0 0 0 13 1 0
                                         60 0 1 2 8 60 9 0 1 2 7 60 121 0 1 1 0
                                         0 0 12 1 2 135 0 1 1 0 0 10 20 2 0 0 0
                                         8 42 2 0 0 0 8 44 1 0 0 0 1 2 0 0 0 8
                                         1 1 0 10 0 40 1 0 10 0 40 1 0 27 0 31
                                         1 5 60 0 1 2 0 145 10 46 1 3 0 145 10
                                         121 46 1 2 0 14 0 142 1 2 0 29 10 0 1
                                         2 0 29 10 29 1 2 0 29 9 0 80 2 0 29 9
                                         29 1 2 7 14 121 0 1 1 0 139 0 1 2 0 14
                                         9 0 1 2 0 14 8 0 54 2 0 14 0 0 1 1 7
                                         60 0 1)))))
           '|lookupComplete|)) 
