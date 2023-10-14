
(/VERSIONCHECK 2) 

(DEFUN |FGROUP;One;$;1| ($) (SPADCALL (QREFELT $ 9))) 

(DEFUN |FGROUP;one?;$B;2| (|f| $) (NULL (SPADCALL |f| (QREFELT $ 12)))) 

(DEFUN |FGROUP;^;SI$;3| (|s| |n| $) (SPADCALL |s| |n| (QREFELT $ 16))) 

(DEFUN |FGROUP;*;$S$;4| (|f| |s| $) (SPADCALL |f| |s| (QREFELT $ 18))) 

(DEFUN |FGROUP;*;S2$;5| (|s| |f| $) (SPADCALL |s| |f| (QREFELT $ 20))) 

(DEFUN |FGROUP;inv;2$;6| (|f| $)
  (SPADCALL (SPADCALL (ELT $ 22) |f| (QREFELT $ 24)) (QREFELT $ 25))) 

(DEFUN |FGROUP;factors;$L;7| (|f| $)
  (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 27))) 

(DEFUN |FGROUP;mapExpon;M2$;8| (|f| |x| $) (SPADCALL |f| |x| (QREFELT $ 29))) 

(DEFUN |FGROUP;mapGen;M2$;9| (|f| |x| $) (SPADCALL |f| |x| (QREFELT $ 31))) 

(DEFUN |FGROUP;coerce;$Of;10| (|f| $)
  (SPADCALL |f| (ELT $ 34) (ELT $ 35) 1 (QREFELT $ 37))) 

(DEFUN |FGROUP;*;3$;11| (|f| |g| $)
  (PROG (|h| |q| |r|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |f| (QREFELT $ 14)) |g|)
            ((SPADCALL |g| (QREFELT $ 14)) |f|)
            (#1='T
             (SEQ
              (LETT |r| (REVERSE (SPADCALL |f| (QREFELT $ 12)))
                    . #2=(|FGROUP;*;3$;11|))
              (LETT |q| (SPADCALL (SPADCALL |g| (QREFELT $ 12)) (QREFELT $ 27))
                    . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((OR (NULL |r|) (NULL |q|)
                            (NULL
                             (SPADCALL (QCAR (|SPADfirst| |r|))
                                       (QCAR (|SPADfirst| |q|))
                                       (QREFELT $ 39))))
                        'NIL)
                       ('T
                        (EQL (QCDR (|SPADfirst| |r|))
                             (- (QCDR (|SPADfirst| |q|)))))))
                     (GO G191)))
                   (SEQ (LETT |r| (CDR |r|) . #2#)
                        (EXIT (LETT |q| (CDR |q|) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((NULL |r|) (SPADCALL |q| (QREFELT $ 40)))
                     ((NULL |q|) (SPADCALL (NREVERSE |r|) (QREFELT $ 40)))
                     ((SPADCALL (QCAR (|SPADfirst| |r|))
                                (QCAR (|SPADfirst| |q|)) (QREFELT $ 39))
                      (SEQ
                       (SPADCALL (LETT |h| (NREVERSE |r|) . #2#)
                                 (CONS (QCAR (|SPADfirst| |q|))
                                       (+ (QCDR (|SPADfirst| |q|))
                                          (QCDR (|SPADfirst| |r|))))
                                 (QREFELT $ 41))
                       (EXIT
                        (SPADCALL (SPADCALL |h| (CDR |q|) (QREFELT $ 42))
                                  (QREFELT $ 40)))))
                     (#1#
                      (SPADCALL (SPADCALL (NREVERSE |r|) |q| (QREFELT $ 42))
                                (QREFELT $ 40)))))))))))) 

(DECLAIM (NOTINLINE |FreeGroup;|)) 

(DEFUN |FreeGroup| (#1=#:G178)
  (PROG ()
    (RETURN
     (PROG (#2=#:G179)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|FreeGroup|)
                                           '|domainEqualList|)
                . #3=(|FreeGroup|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|FreeGroup;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|FreeGroup|))))))))))) 

(DEFUN |FreeGroup;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FreeGroup|))
      (LETT |dv$| (LIST '|FreeGroup| DV$1) . #1#)
      (LETT $ (GETREFV 51) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FreeGroup| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|ListMonoidOps| |#1| (|Integer|) 1))
      $)))) 

(MAKEPROP '|FreeGroup| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|ListMonoidOps| 6 15 (NRTEVAL 1))
              (|local| |#1|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FGROUP;One;$;1|) $))
              '|Rep| (0 . |makeUnit|) (|Record| (|:| |gen| 6) (|:| |exp| 15))
              (|List| 10) (4 . |listOfMonoms|) (|Boolean|) |FGROUP;one?;$B;2|
              (|Integer|) (9 . |makeTerm|) |FGROUP;^;SI$;3| (15 . |rightMult|)
              |FGROUP;*;$S$;4| (21 . |leftMult|) |FGROUP;*;S2$;5| (27 . -)
              (|Mapping| 15 15) |FGROUP;mapExpon;M2$;8| (32 . |reverse!|)
              |FGROUP;inv;2$;6| (37 . |copy|) |FGROUP;factors;$L;7|
              (42 . |mapExpon|) (|Mapping| 6 6) (48 . |mapGen|)
              |FGROUP;mapGen;M2$;9| (|OutputForm|) (54 . *) (60 . ^)
              (|Mapping| 33 33 33) (66 . |outputForm|) |FGROUP;coerce;$Of;10|
              (74 . =) (80 . |makeMulti|) (85 . |setlast!|) (91 . |concat!|)
              |FGROUP;*;3$;11| (|NonNegativeInteger|) (|Union| 6 '"failed")
              (|Union| $ '"failed") (|PositiveInteger|) (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 97 |size| 103 |sample| 108 |retractIfCan| 112 |retract| 117
              |recip| 122 |one?| 127 |nthFactor| 132 |nthExpon| 138 |mapGen|
              144 |mapExpon| 150 |latex| 156 |inv| 161 |hashUpdate!| 166 |hash|
              172 |factors| 177 |conjugate| 182 |commutator| 188 |coerce| 194 ^
              204 |One| 228 = 232 / 238 * 244)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|Group&| |Monoid&| |SemiGroup&| |SetCategory&|
                     |BasicType&| |RetractableTo&| NIL NIL)
                  (CONS
                   '#((|Group|) (|Monoid|) (|SemiGroup|) (|SetCategory|)
                      (|BasicType|) (|RetractableTo| 6) (|unitsKnown|)
                      (|CoercibleTo| 33))
                   (|makeByteWordVec2| 50
                                       '(0 8 0 9 1 8 11 0 12 2 8 0 6 15 16 2 8
                                         0 0 6 18 2 8 0 6 0 20 1 15 0 0 22 1 8
                                         0 0 25 1 11 0 0 27 2 8 0 23 0 29 2 8 0
                                         30 0 31 2 33 0 0 0 34 2 33 0 0 0 35 4
                                         8 33 0 36 36 15 37 2 6 13 0 0 39 1 8 0
                                         11 40 2 11 10 0 10 41 2 11 0 0 0 42 2
                                         0 13 0 0 1 1 0 44 0 1 0 0 0 1 1 0 45 0
                                         1 1 0 6 0 1 1 0 46 0 1 1 0 13 0 14 2 0
                                         6 0 15 1 2 0 15 0 15 1 2 0 0 30 0 32 2
                                         0 0 23 0 24 1 0 49 0 1 1 0 0 0 26 2 0
                                         48 48 0 1 1 0 50 0 1 1 0 11 0 28 2 0 0
                                         0 0 1 2 0 0 0 0 1 1 0 0 6 1 1 0 33 0
                                         38 2 0 0 6 15 17 2 0 0 0 15 1 2 0 0 0
                                         44 1 2 0 0 0 47 1 0 0 0 7 2 0 13 0 0 1
                                         2 0 0 0 0 1 2 0 0 6 0 21 2 0 0 0 6 19
                                         2 0 0 0 0 43)))))
           '|lookupComplete|)) 
