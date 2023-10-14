
(/VERSIONCHECK 2) 

(DEFUN |IFAMON;Zero;$;1| ($) (SPADCALL (QREFELT $ 10))) 

(DEFUN |IFAMON;zero?;$B;2| (|f| $) (NULL (SPADCALL |f| (QREFELT $ 14)))) 

(DEFUN |IFAMON;terms;$L;3| (|f| $)
  (SPADCALL (SPADCALL |f| (QREFELT $ 14)) (QREFELT $ 17))) 

(DEFUN |IFAMON;nthCoef;$IE;4| (|f| |i| $) (SPADCALL |f| |i| (QREFELT $ 20))) 

(DEFUN |IFAMON;nthFactor;$IS;5| (|f| |i| $) (SPADCALL |f| |i| (QREFELT $ 22))) 

(DEFUN |IFAMON;+;S2$;6| (|s| |f| $)
  (SPADCALL |s| (QREFELT $ 8) |f| (QREFELT $ 24))) 

(DEFUN |IFAMON;+;3$;7| (|f| |g| $) (SPADCALL |f| |g| (QREFELT $ 26))) 

(DEFUN |IFAMON;=;2$B;8| (|f| |g| $) (SPADCALL |f| |g| (QREFELT $ 28))) 

(DEFUN |IFAMON;*;ES$;9| (|n| |s| $) (SPADCALL |s| |n| (QREFELT $ 30))) 

(DEFUN |IFAMON;*;Nni2$;10| (|n| |f| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|IFAMON;*;Nni2$;10!0| (VECTOR $ |n|)) |f|
               (QREFELT $ 35))))) 

(DEFUN |IFAMON;*;Nni2$;10!0| (|x| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|IFAMON;*;Nni2$;10|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |n| |x| (QREFELT $ 33)))))) 

(DEFUN |IFAMON;coerce;$Of;11| (|f| $)
  (SPADCALL |f| (ELT $ 38) (CONS #'|IFAMON;coerce;$Of;11!0| $) 0
            (QREFELT $ 41))) 

(DEFUN |IFAMON;coerce;$Of;11!0| (|x| |y| $) (SPADCALL |y| |x| (QREFELT $ 39))) 

(DEFUN |IFAMON;mapCoef;M2$;12| (|f| |x| $) (SPADCALL |f| |x| (QREFELT $ 35))) 

(DEFUN |IFAMON;mapGen;M2$;13| (|f| |x| $) (SPADCALL |f| |x| (QREFELT $ 45))) 

(DEFUN |IFAMON;coefficient;S$E;14| (|s| |f| $)
  (PROG (#1=#:G149 #2=#:G151 #3=#:G152 |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |x| NIL . #4=(|IFAMON;coefficient;S$E;14|))
               (LETT #3# (SPADCALL |f| (QREFELT $ 18)) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QCAR |x|) |s| (QREFELT $ 47))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# (QCDR |x|) . #4#) (GO #2#))
                          . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (|spadConstant| $ 48))))
      #2# (EXIT #2#))))) 

(DEFUN |IFAMON;highCommonTerms;3$;15| (|f| |g| $)
  (PROG (|n| #1=#:G157 |x| #2=#:G156)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|IFAMON;highCommonTerms;3$;15|))
        (SEQ (LETT |x| NIL . #3#)
             (LETT #1# (SPADCALL |f| (QREFELT $ 14)) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL
                  (LETT |n| (SPADCALL (QCAR |x|) |g| (QREFELT $ 49)) . #3#)
                  (|spadConstant| $ 48) (QREFELT $ 50))
                 (LETT #2#
                       (CONS
                        (CONS (QCAR |x|)
                              (SPADCALL (QCDR |x|) |n| (QREFELT $ 51)))
                        #2#)
                       . #3#)))))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 52)))))) 

(DEFUN |InnerFreeAbelianMonoid| (&REST #1=#:G164)
  (PROG ()
    (RETURN
     (PROG (#2=#:G165)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|InnerFreeAbelianMonoid|)
                                           '|domainEqualList|)
                . #3=(|InnerFreeAbelianMonoid|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |InnerFreeAbelianMonoid;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|InnerFreeAbelianMonoid|))))))))))) 

(DEFUN |InnerFreeAbelianMonoid;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerFreeAbelianMonoid|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|InnerFreeAbelianMonoid| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 60) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|InnerFreeAbelianMonoid|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (|ListMonoidOps| |#1| |#2| |#3|))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 53
                  (CONS (|dispatchFunction| |IFAMON;highCommonTerms;3$;15|)
                        $))))
      $)))) 

(MAKEPROP '|InnerFreeAbelianMonoid| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|ListMonoidOps| 6 7 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (0 . |makeUnit|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |IFAMON;Zero;$;1|) $))
              (|Record| (|:| |gen| 6) (|:| |exp| 7)) (|List| 12)
              (4 . |listOfMonoms|) (|Boolean|) |IFAMON;zero?;$B;2| (9 . |copy|)
              |IFAMON;terms;$L;3| (|Integer|) (14 . |nthExpon|)
              |IFAMON;nthCoef;$IE;4| (20 . |nthFactor|)
              |IFAMON;nthFactor;$IS;5| (26 . |plus|) |IFAMON;+;S2$;6|
              (33 . |plus|) |IFAMON;+;3$;7| (39 . |commutativeEquality|)
              |IFAMON;=;2$B;8| (45 . |makeTerm|) |IFAMON;*;ES$;9|
              (|NonNegativeInteger|) (51 . *) (|Mapping| 7 7) (57 . |mapExpon|)
              |IFAMON;*;Nni2$;10| (|OutputForm|) (63 . +) (69 . *)
              (|Mapping| 37 37 37) (75 . |outputForm|) |IFAMON;coerce;$Of;11|
              |IFAMON;mapCoef;M2$;12| (|Mapping| 6 6) (83 . |mapGen|)
              |IFAMON;mapGen;M2$;13| (89 . =) (95 . |Zero|)
              |IFAMON;coefficient;S$E;14| (99 . >) (105 . |min|)
              (111 . |makeMulti|) (116 . |highCommonTerms|)
              (|Union| 6 '"failed") (|Union| $ '"failed") (|PositiveInteger|)
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 122 |zero?| 128 |terms| 133 |subtractIfCan| 138 |size| 144
              |sample| 149 |retractIfCan| 153 |retract| 158 |nthFactor| 163
              |nthCoef| 169 |mapGen| 175 |mapCoef| 181 |latex| 187
              |highCommonTerms| 192 |hashUpdate!| 198 |hash| 204 |coerce| 209
              |coefficient| 219 |Zero| 225 = 229 + 235 * 247)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL |AbelianMonoid&| |AbelianSemiGroup&|
                     |SetCategory&| |BasicType&| |RetractableTo&| NIL)
                  (CONS
                   '#((|FreeAbelianMonoidCategory| 6 7)
                      (|CancellationAbelianMonoid|) (|AbelianMonoid|)
                      (|AbelianSemiGroup|) (|SetCategory|) (|BasicType|)
                      (|RetractableTo| 6) (|CoercibleTo| 37))
                   (|makeByteWordVec2| 59
                                       '(0 9 0 10 1 9 13 0 14 1 13 0 0 17 2 9 7
                                         0 19 20 2 9 6 0 19 22 3 9 0 6 7 0 24 2
                                         9 0 0 0 26 2 9 15 0 0 28 2 9 0 6 7 30
                                         2 7 0 32 0 33 2 9 0 34 0 35 2 37 0 0 0
                                         38 2 37 0 0 0 39 4 9 37 0 40 40 19 41
                                         2 9 0 44 0 45 2 6 15 0 0 47 0 7 0 48 2
                                         7 15 0 0 50 2 7 0 0 0 51 1 9 0 13 52 2
                                         0 0 0 0 53 2 0 15 0 0 1 1 0 15 0 16 1
                                         0 13 0 18 2 0 55 0 0 1 1 0 32 0 1 0 0
                                         0 1 1 0 54 0 1 1 0 6 0 1 2 0 6 0 19 23
                                         2 0 7 0 19 21 2 0 0 44 0 46 2 0 0 34 0
                                         43 1 0 58 0 1 2 1 0 0 0 53 2 0 57 57 0
                                         1 1 0 59 0 1 1 0 0 6 1 1 0 37 0 42 2 0
                                         7 6 0 49 0 0 0 11 2 0 15 0 0 29 2 0 0
                                         6 0 25 2 0 0 0 0 27 2 0 0 7 6 31 2 0 0
                                         32 0 36 2 0 0 56 0 1)))))
           '|lookupComplete|)) 
