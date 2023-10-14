
(/VERSIONCHECK 2) 

(DEFUN |OFMONOID;lquo;$SU;1| (|w| |l| $)
  (PROG (#1=#:G140 |fx| |x|)
    (RETURN
     (SEQ (LETT |x| (SPADCALL |w| (QREFELT $ 11)) . #2=(|OFMONOID;lquo;$SU;1|))
          (EXIT
           (COND ((NULL |x|) (CONS 1 "failed"))
                 (#3='T
                  (SEQ (LETT |fx| (|SPADfirst| |x|) . #2#)
                       (EXIT
                        (COND
                         ((SPADCALL (QCAR |fx|) |l| (QREFELT $ 13))
                          (CONS 1 "failed"))
                         ((EQL (QCDR |fx|) 1)
                          (CONS 0 (SPADCALL (CDR |x|) (QREFELT $ 14))))
                         (#3#
                          (CONS 0
                                (SPADCALL
                                 (CONS
                                  (CONS (QCAR |fx|)
                                        (PROG1
                                            (LETT #1# (- (QCDR |fx|) 1) . #2#)
                                          (|check_subtype| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#)))
                                  (CDR |x|))
                                 (QREFELT $ 14)))))))))))))) 

(DEFUN |OFMONOID;rquo;$SU;2| (|w| |l| $)
  (PROG (|r| |u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |w| (QREFELT $ 17)) . #1=(|OFMONOID;rquo;$SU;2|))
          (LETT |r| (SPADCALL |u| |l| (QREFELT $ 16)) . #1#)
          (EXIT
           (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (SPADCALL (QCDR |r|) (QREFELT $ 18)))))))))) 

(DEFUN |OFMONOID;length;$Nni;3| (|x| $)
  (PROG (#1=#:G160 |f| #2=#:G159)
    (RETURN
     (SEQ
      (SPADCALL (ELT $ 21)
                (PROGN
                 (LETT #2# NIL . #3=(|OFMONOID;length;$Nni;3|))
                 (SEQ (LETT |f| NIL . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 11)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCDR |f|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                0 (QREFELT $ 24)))))) 

(DEFUN |OFMONOID;varList;$L;4| (|x| $)
  (PROG (|le| #1=#:G166 |t| #2=#:G165)
    (RETURN
     (SEQ
      (LETT |le|
            (PROGN
             (LETT #2# NIL . #3=(|OFMONOID;varList;$L;4|))
             (SEQ (LETT |t| NIL . #3#)
                  (LETT #1# (SPADCALL |x| (QREFELT $ 11)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS (QCAR |t|) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (SPADCALL (SPADCALL |le| (QREFELT $ 27)) (QREFELT $ 28))))))) 

(DEFUN |OFMONOID;first;$S;5| (|w| $)
  (PROG (|x|)
    (RETURN
     (SEQ (LETT |x| (SPADCALL |w| (QREFELT $ 11)) |OFMONOID;first;$S;5|)
          (EXIT
           (COND ((NULL |x|) (|error| "empty word !!!"))
                 ('T (QCAR (|SPADfirst| |x|))))))))) 

(DEFUN |OFMONOID;rest;2$;6| (|w| $)
  (PROG (#1=#:G171 |fx| |x|)
    (RETURN
     (SEQ (LETT |x| (SPADCALL |w| (QREFELT $ 11)) . #2=(|OFMONOID;rest;2$;6|))
          (EXIT
           (COND ((NULL |x|) (|error| "empty word !!!"))
                 (#3='T
                  (SEQ (LETT |fx| (|SPADfirst| |x|) . #2#)
                       (EXIT
                        (COND
                         ((EQL (QCDR |fx|) 1)
                          (SPADCALL (CDR |x|) (QREFELT $ 14)))
                         (#3#
                          (SPADCALL
                           (CONS
                            (CONS (QCAR |fx|)
                                  (PROG1 (LETT #1# (- (QCDR |fx|) 1) . #2#)
                                    (|check_subtype| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     #1#)))
                            (CDR |x|))
                           (QREFELT $ 14))))))))))))) 

(DEFUN |OFMONOID;lexico;2$B;7| (|a| |b| $)
  (PROG (|la| |lb| #1=#:G181 #2=#:G178 #3=#:G190)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |la| (SPADCALL |a| (QREFELT $ 11))
              . #4=(|OFMONOID;lexico;2$B;7|))
        (LETT |lb| (SPADCALL |b| (QREFELT $ 11)) . #4#)
        (SEQ G190
             (COND
              ((NULL (COND ((OR (NULL |la|) (NULL |lb|)) 'NIL) ('T 'T)))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL (QCAR (|SPADfirst| |la|)) (QCAR (|SPADfirst| |lb|))
                           (QREFELT $ 32))
                 (PROGN (LETT #3# 'NIL . #4#) (GO #3#)))
                ((SPADCALL (QCAR (|SPADfirst| |la|)) (QCAR (|SPADfirst| |lb|))
                           (QREFELT $ 33))
                 (PROGN (LETT #3# 'T . #4#) (GO #3#)))
                ((EQL (QCDR (|SPADfirst| |la|)) (QCDR (|SPADfirst| |lb|)))
                 (SEQ (LETT |la| (CDR |la|) . #4#)
                      (EXIT (LETT |lb| (CDR |lb|) . #4#))))
                ((SPADCALL (QCDR (|SPADfirst| |la|)) (QCDR (|SPADfirst| |lb|))
                           (QREFELT $ 34))
                 (SEQ
                  (LETT |la|
                        (CONS
                         (CONS (QCAR (|SPADfirst| |la|))
                               (PROG1
                                   (LETT #2#
                                         (- (QCDR (|SPADfirst| |la|))
                                            (QCDR (|SPADfirst| |lb|)))
                                         . #4#)
                                 (|check_subtype| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  #2#)))
                         (CDR |lb|))
                        . #4#)
                  (EXIT (LETT |lb| (CDR |lb|) . #4#))))
                ('T
                 (SEQ
                  (LETT |lb|
                        (CONS
                         (CONS (QCAR (|SPADfirst| |lb|))
                               (PROG1
                                   (LETT #1#
                                         (- (QCDR (|SPADfirst| |lb|))
                                            (QCDR (|SPADfirst| |la|)))
                                         . #4#)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  #1#)))
                         (CDR |la|))
                        . #4#)
                  (EXIT (LETT |la| (CDR |la|) . #4#)))))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT
         (COND ((NULL |la|) (COND ((NULL |lb|) 'NIL) (#5='T 'T)))
               (#5# 'NIL)))))
      #3# (EXIT #3#))))) 

(DEFUN |OFMONOID;<;2$B;8| (|a| |b| $)
  (PROG (|lb| |la|)
    (RETURN
     (SEQ (LETT |la| (SPADCALL |a| (QREFELT $ 25)) . #1=(|OFMONOID;<;2$B;8|))
          (LETT |lb| (SPADCALL |b| (QREFELT $ 25)) . #1#)
          (EXIT
           (COND ((EQL |la| |lb|) (SPADCALL |a| |b| (QREFELT $ 35)))
                 ('T (< |la| |lb|)))))))) 

(DEFUN |OFMONOID;mirror;2$;9| (|x| $) (SPADCALL |x| (QREFELT $ 17))) 

(DECLAIM (NOTINLINE |OrderedFreeMonoid;|)) 

(DEFUN |OrderedFreeMonoid| (#1=#:G202)
  (PROG ()
    (RETURN
     (PROG (#2=#:G203)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|OrderedFreeMonoid|)
                                           '|domainEqualList|)
                . #3=(|OrderedFreeMonoid|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|OrderedFreeMonoid;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|OrderedFreeMonoid|))))))))))) 

(DEFUN |OrderedFreeMonoid;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|OrderedFreeMonoid|))
      (LETT |dv$| (LIST '|OrderedFreeMonoid| DV$1) . #1#)
      (LETT $ (GETREFV 48) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|OrderedFreeMonoid| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|ListMonoidOps| |#1| (|NonNegativeInteger|) 1))
      $)))) 

(MAKEPROP '|OrderedFreeMonoid| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeMonoid| 6) (|local| |#1|) (0 . |One|)
              '|Rep| (|Record| (|:| |gen| 6) (|:| |exp| 20)) (|List| 9)
              (4 . |listOfMonoms|) (|Boolean|) (9 . ~=) (15 . |makeMulti|)
              (|Union| $ '"failed") |OFMONOID;lquo;$SU;1| (20 . |reverse|)
              (25 . |reverse!|) |OFMONOID;rquo;$SU;2| (|NonNegativeInteger|)
              (30 . +) (|Mapping| 20 20 20) (|List| 20) (36 . |reduce|)
              |OFMONOID;length;$Nni;3| (|List| 6) (43 . |removeDuplicates|)
              (48 . |sort!|) |OFMONOID;varList;$L;4| |OFMONOID;first;$S;5|
              |OFMONOID;rest;2$;6| (53 . >) (59 . <) (65 . >)
              |OFMONOID;lexico;2$B;7| |OFMONOID;<;2$B;8| |OFMONOID;mirror;2$;9|
              (|Integer|) (|Record| (|:| |lm| $) (|:| |rm| $))
              (|Union| 39 '"failed")
              (|Record| (|:| |lm| $) (|:| |mm| $) (|:| |rm| $))
              (|Union| 6 '"failed") (|PositiveInteger|) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 71 |varList| 77 |smaller?| 82 |size| 88 |sample| 93 |rquo| 97
              |retractIfCan| 109 |retract| 114 |rest| 119 |recip| 124 |overlap|
              129 |one?| 135 |nthFactor| 140 |nthExpon| 146 |mirror| 152 |min|
              157 |max| 163 |lquo| 169 |lexico| 181 |length| 187 |latex| 192
              |hcrf| 197 |hclf| 203 |hashUpdate!| 209 |hash| 215 |first| 220
              |factors| 225 |divide| 230 |coerce| 236 ^ 246 |One| 264 >= 268 >
              274 = 280 <= 286 < 292 * 298)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL |OrderedSet&| |Monoid&| NIL |SemiGroup&|
                     |SetCategory&| |RetractableTo&| |BasicType&|
                     |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedMonoid|) (|OrderedSemiGroup|) (|OrderedSet|)
                      (|Monoid|) (|Comparable|) (|SemiGroup|) (|SetCategory|)
                      (|RetractableTo| 6) (|BasicType|) (|PartialOrder|)
                      (|CoercibleTo| 47))
                   (|makeByteWordVec2| 47
                                       '(0 0 0 7 1 8 10 0 11 2 6 12 0 0 13 1 8
                                         0 10 14 1 8 0 0 17 1 8 0 0 18 2 20 0 0
                                         0 21 3 23 20 22 0 20 24 1 26 0 0 27 1
                                         26 0 0 28 2 6 12 0 0 32 2 6 12 0 0 33
                                         2 20 12 0 0 34 2 0 12 0 0 1 1 0 26 0
                                         29 2 0 12 0 0 1 1 0 20 0 1 0 0 0 1 2 0
                                         15 0 6 19 2 0 15 0 0 1 1 0 42 0 1 1 0
                                         6 0 1 1 0 0 0 31 1 0 15 0 1 2 0 41 0 0
                                         1 1 0 12 0 1 2 0 6 0 38 1 2 0 20 0 38
                                         1 1 0 0 0 37 2 0 0 0 0 1 2 0 0 0 0 1 2
                                         0 15 0 6 16 2 0 15 0 0 1 2 0 12 0 0 35
                                         1 0 20 0 25 1 0 44 0 1 2 0 0 0 0 1 2 0
                                         0 0 0 1 2 0 46 46 0 1 1 0 45 0 1 1 0 6
                                         0 30 1 0 10 0 1 2 0 40 0 0 1 1 0 0 6 1
                                         1 0 47 0 1 2 0 0 6 20 1 2 0 0 0 20 1 2
                                         0 0 0 43 1 0 0 0 7 2 0 12 0 0 1 2 0 12
                                         0 0 1 2 0 12 0 0 1 2 0 12 0 0 1 2 0 12
                                         0 0 36 2 0 0 0 6 1 2 0 0 6 0 1 2 0 0 0
                                         0 1)))))
           '|lookupComplete|)) 
