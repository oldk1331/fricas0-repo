
(/VERSIONCHECK 2) 

(PUT '|LMOPS;makeUnit;$;1| '|SPADreplace| '(XLAM NIL NIL)) 

(DEFUN |LMOPS;makeUnit;$;1| ($) NIL) 

(DEFUN |LMOPS;size;$Nni;2| (|l| $) (LENGTH (SPADCALL |l| (QREFELT $ 13)))) 

(DEFUN |LMOPS;coerce;S$;3| (|s| $) (LIST (CONS |s| (QREFELT $ 8)))) 

(DEFUN |LMOPS;coerce;$Of;4| (|l| $) (SPADCALL |l| (QREFELT $ 18))) 

(DEFUN |LMOPS;makeTerm;SE$;5| (|s| |e| $)
  (COND ((SPADCALL |e| (QREFELT $ 21)) (SPADCALL (QREFELT $ 10)))
        ('T (LIST (CONS |s| |e|))))) 

(PUT '|LMOPS;makeMulti;L$;6| '|SPADreplace| '(XLAM (|l|) |l|)) 

(DEFUN |LMOPS;makeMulti;L$;6| (|l| $) |l|) 

(DEFUN |LMOPS;=;2$B;7| (|f| |g| $) (SPADCALL |f| |g| (QREFELT $ 24))) 

(PUT '|LMOPS;listOfMonoms;$L;8| '|SPADreplace| '(XLAM (|l|) |l|)) 

(DEFUN |LMOPS;listOfMonoms;$L;8| (|l| $) |l|) 

(DEFUN |LMOPS;nthExpon;$IE;9| (|f| |i| $)
  (QCDR
   (SPADCALL |f| (+ (- |i| 1) (SPADCALL |f| (QREFELT $ 27))) (QREFELT $ 28)))) 

(DEFUN |LMOPS;nthFactor;$IS;10| (|f| |i| $)
  (QCAR
   (SPADCALL |f| (+ (- |i| 1) (SPADCALL |f| (QREFELT $ 27))) (QREFELT $ 28)))) 

(PUT '|LMOPS;reverse;2$;11| '|SPADreplace| 'REVERSE) 

(DEFUN |LMOPS;reverse;2$;11| (|l| $) (REVERSE |l|)) 

(PUT '|LMOPS;reverse!;2$;12| '|SPADreplace| 'NREVERSE) 

(DEFUN |LMOPS;reverse!;2$;12| (|l| $) (NREVERSE |l|)) 

(DEFUN |LMOPS;mapGen;M2$;13| (|f| |l| $)
  (PROG (#1=#:G174 |x| #2=#:G173)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|LMOPS;mapGen;M2$;13|))
       (SEQ (LETT |x| NIL . #3#) (LETT #1# |l| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (CONS (SPADCALL (QCAR |x|) |f|) (QCDR |x|)) #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |LMOPS;mapExpon;M2$;14| (|f| |l| $)
  (PROG (|ans| |a| #1=#:G181 |x|)
    (RETURN
     (SEQ (LETT |ans| NIL . #2=(|LMOPS;mapExpon;M2$;14|))
          (SEQ (LETT |x| NIL . #2#) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (LETT |a| (SPADCALL (QCDR |x|) |f|) . #2#)
                             (|spadConstant| $ 35) (QREFELT $ 36))
                   (LETT |ans| (CONS (CONS (QCAR |x|) |a|) |ans|) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |ans| (QREFELT $ 32))))))) 

(DEFUN |LMOPS;outputForm;$2MIOf;15| (|l| |op| |opexp| |id| $)
  (PROG (#1=#:G191 |p| #2=#:G190)
    (RETURN
     (SEQ
      (COND ((NULL |l|) (SPADCALL |id| (QREFELT $ 39)))
            ('T
             (SEQ
              (LETT |l|
                    (PROGN
                     (LETT #2# NIL . #3=(|LMOPS;outputForm;$2MIOf;15|))
                     (SEQ (LETT |p| NIL . #3#) (LETT #1# |l| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (COND
                                    ((SPADCALL (QCDR |p|) (QREFELT $ 8)
                                               (QREFELT $ 40))
                                     (SPADCALL (QCAR |p|) (QREFELT $ 41)))
                                    ('T
                                     (SPADCALL
                                      (SPADCALL (QCAR |p|) (QREFELT $ 41))
                                      (SPADCALL (QCDR |p|) (QREFELT $ 42))
                                      |opexp|)))
                                   #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT (SPADCALL |op| |l| (QREFELT $ 45)))))))))) 

(DEFUN |LMOPS;retractIfCan;$U;16| (|l| $)
  (SEQ
   (COND
    ((NULL (NULL |l|))
     (COND
      ((NULL (CDR |l|))
       (COND
        ((SPADCALL (QCDR (|SPADfirst| |l|)) (QREFELT $ 8) (QREFELT $ 40))
         (EXIT (CONS 0 (QCAR (|SPADfirst| |l|))))))))))
   (EXIT (CONS 1 "failed")))) 

(DEFUN |LMOPS;rightMult;$S$;17| (|f| |s| $)
  (PROG (|h|)
    (RETURN
     (SEQ
      (COND ((NULL |f|) (SPADCALL |s| (QREFELT $ 16)))
            ((SPADCALL |s| (QCAR (SPADCALL |f| '|last| (QREFELT $ 50)))
                       (QREFELT $ 51))
             (SEQ
              (SPADCALL
               (LETT |h| (SPADCALL |f| (QREFELT $ 52))
                     |LMOPS;rightMult;$S$;17|)
               (CONS |s|
                     (SPADCALL (QCDR (SPADCALL |f| '|last| (QREFELT $ 50)))
                               (QREFELT $ 8) (QREFELT $ 53)))
               (QREFELT $ 54))
              (EXIT |h|)))
            ('T (SPADCALL |f| (CONS |s| (QREFELT $ 8)) (QREFELT $ 55)))))))) 

(DEFUN |LMOPS;leftMult;S2$;18| (|s| |f| $)
  (COND ((NULL |f|) (SPADCALL |s| (QREFELT $ 16)))
        ((SPADCALL |s| (QCAR (|SPADfirst| |f|)) (QREFELT $ 51))
         (CONS
          (CONS |s|
                (SPADCALL (QCDR (|SPADfirst| |f|)) (QREFELT $ 8)
                          (QREFELT $ 53)))
          (CDR |f|)))
        ('T (CONS (CONS |s| (QREFELT $ 8)) |f|)))) 

(DEFUN |LMOPS;commutativeEquality;2$B;19| (|s1| |s2| $)
  (PROG (#1=#:G219 #2=#:G220 |t1|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL (LENGTH |s1|) (LENGTH |s2|) (QREFELT $ 58)) 'NIL)
             ('T
              (SEQ
               (SEQ (LETT |t1| NIL . #3=(|LMOPS;commutativeEquality;2$B;19|))
                    (LETT #2# |s1| . #3#) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |t1| (CAR #2#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((NULL (SPADCALL |t1| |s2| (QREFELT $ 59)))
                        (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
                    (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
               (EXIT 'T)))))
      #1# (EXIT #1#))))) 

(DEFUN |LMOPS;plus!| (|s| |n| |f| $)
  (PROG (|h1| |h| #1=#:G229 |l| |m| |g|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |h| (LETT |g| (CONS (CONS |s| |n|) |f|) . #2=(|LMOPS;plus!|))
              . #2#)
        (LETT |h1| (CDR |h|) . #2#)
        (SEQ G190 (COND ((NULL (COND ((NULL |h1|) 'NIL) ('T 'T))) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |s| (QCAR (|SPADfirst| |h1|)) (QREFELT $ 51))
                 (SEQ
                  (LETT |l|
                        (COND
                         ((SPADCALL
                           (LETT |m|
                                 (SPADCALL |n| (QCDR (|SPADfirst| |h1|))
                                           (QREFELT $ 53))
                                 . #2#)
                           (QREFELT $ 21))
                          (CDR |h1|))
                         ('T (CONS (CONS |s| |m|) (CDR |h1|))))
                        . #2#)
                  (SPADCALL |h| |l| (QREFELT $ 61))
                  (EXIT (PROGN (LETT #1# (CDR |g|) . #2#) (GO #1#)))))
                ('T
                 (SEQ (LETT |h| |h1| . #2#)
                      (EXIT (LETT |h1| (CDR |h1|) . #2#)))))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT |g|)))
      #1# (EXIT #1#))))) 

(DEFUN |LMOPS;plus;SE2$;21| (|s| |n| |f| $)
  (|LMOPS;plus!| |s| |n| (SPADCALL |f| (QREFELT $ 52)) $)) 

(DEFUN |LMOPS;plus;3$;22| (|f| |g| $)
  (COND ((< (LENGTH |f|) (LENGTH |g|)) (|LMOPS;localplus| |f| |g| $))
        ('T (|LMOPS;localplus| |g| |f| $)))) 

(DEFUN |LMOPS;localplus| (|f| |g| $)
  (PROG (#1=#:G238 |x|)
    (RETURN
     (SEQ (LETT |g| (SPADCALL |g| (QREFELT $ 52)) . #2=(|LMOPS;localplus|))
          (SEQ (LETT |x| NIL . #2#) (LETT #1# |f| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |g| (SPADCALL (QCAR |x|) (QCDR |x|) |g| (QREFELT $ 62))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |g|))))) 

(DECLAIM (NOTINLINE |ListMonoidOps;|)) 

(DEFUN |ListMonoidOps| (&REST #1=#:G239)
  (PROG ()
    (RETURN
     (PROG (#2=#:G240)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ListMonoidOps|)
                                           '|domainEqualList|)
                . #3=(|ListMonoidOps|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ListMonoidOps;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|ListMonoidOps|))))))))))) 

(DEFUN |ListMonoidOps;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ListMonoidOps|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|ListMonoidOps| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 67) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ListMonoidOps| (LIST DV$1 DV$2 DV$3)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (|List| (|Record| (|:| |gen| |#1|) (|:| |exp| |#2|))))
      $)))) 

(MAKEPROP '|ListMonoidOps| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| |LMOPS;makeUnit;$;1|
              (|Record| (|:| |gen| 6) (|:| |exp| 7)) (|List| 11)
              |LMOPS;listOfMonoms;$L;8| (|NonNegativeInteger|)
              |LMOPS;size;$Nni;2| |LMOPS;coerce;S$;3| (|OutputForm|)
              (0 . |coerce|) |LMOPS;coerce;$Of;4| (|Boolean|) (5 . |zero?|)
              |LMOPS;makeTerm;SE$;5| |LMOPS;makeMulti;L$;6| (10 . =)
              |LMOPS;=;2$B;7| (|Integer|) (16 . |minIndex|) (21 . |elt|)
              |LMOPS;nthExpon;$IE;9| |LMOPS;nthFactor;$IS;10|
              |LMOPS;reverse;2$;11| |LMOPS;reverse!;2$;12| (|Mapping| 6 6)
              |LMOPS;mapGen;M2$;13| (27 . |Zero|) (31 . ~=) (|Mapping| 7 7)
              |LMOPS;mapExpon;M2$;14| (37 . |coerce|) (42 . =) (48 . |coerce|)
              (53 . |coerce|) (|Mapping| 17 17 17) (|List| 17) (58 . |reduce|)
              |LMOPS;outputForm;$2MIOf;15| (|Union| 6 '"failed")
              |LMOPS;retractIfCan;$U;16| '"last" (64 . |elt|) (70 . =)
              (76 . |copy|) (81 . +) (87 . |setlast!|) (93 . |concat|)
              |LMOPS;rightMult;$S$;17| |LMOPS;leftMult;S2$;18| (99 . ~=)
              (105 . |member?|) |LMOPS;commutativeEquality;2$B;19|
              (111 . |setrest!|) |LMOPS;plus;SE2$;21| |LMOPS;plus;3$;22|
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 117 |size| 123 |rightMult| 128 |reverse!| 134 |reverse| 139
              |retractIfCan| 144 |retract| 149 |plus| 154 |outputForm| 167
              |nthFactor| 175 |nthExpon| 181 |mapGen| 187 |mapExpon| 193
              |makeUnit| 199 |makeTerm| 203 |makeMulti| 209 |listOfMonoms| 214
              |leftMult| 219 |latex| 225 |hashUpdate!| 230 |hash| 236
              |commutativeEquality| 241 |coerce| 247 = 257)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| |RetractableTo&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|RetractableTo| 6)
                           (|CoercibleTo| 17))
                        (|makeByteWordVec2| 66
                                            '(1 9 17 0 18 1 7 20 0 21 2 9 20 0
                                              0 24 1 9 26 0 27 2 9 11 0 26 28 0
                                              7 0 35 2 7 20 0 0 36 1 26 17 0 39
                                              2 7 20 0 0 40 1 6 17 0 41 1 7 17
                                              0 42 2 44 17 43 0 45 2 9 11 0 49
                                              50 2 6 20 0 0 51 1 9 0 0 52 2 7 0
                                              0 0 53 2 9 11 0 11 54 2 9 0 0 11
                                              55 2 14 20 0 0 58 2 9 20 11 0 59
                                              2 9 0 0 0 61 2 0 20 0 0 1 1 0 14
                                              0 15 2 0 0 0 6 56 1 0 0 0 32 1 0
                                              0 0 31 1 0 47 0 48 1 0 6 0 1 2 0
                                              0 0 0 63 3 0 0 6 7 0 62 4 0 17 0
                                              43 43 26 46 2 0 6 0 26 30 2 0 7 0
                                              26 29 2 0 0 33 0 34 2 0 0 37 0 38
                                              0 0 0 10 2 0 0 6 7 22 1 0 0 12 23
                                              1 0 12 0 13 2 0 0 6 0 57 1 0 65 0
                                              1 2 0 64 64 0 1 1 0 66 0 1 2 0 20
                                              0 0 60 1 0 0 6 16 1 0 17 0 19 2 0
                                              20 0 0 25)))))
           '|lookupComplete|)) 
