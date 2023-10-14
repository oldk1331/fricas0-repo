
(/VERSIONCHECK 2) 

(DEFUN |GCNAALG;eval| (|rf| |a| $)
  (PROG (|bot| |top| |lEq| #1=#:G142 |i| #2=#:G141 |s| #3=#:G140 |coefOfa|)
    (RETURN
     (SEQ
      (LETT |coefOfa|
            (SPADCALL (ELT $ 36)
                      (SPADCALL (SPADCALL |a| (QREFELT $ 37)) (QREFELT $ 39))
                      (QREFELT $ 43))
            . #4=(|GCNAALG;eval|))
      (SETELT $ 8
              (PROGN
               (LETT #3# NIL . #4#)
               (SEQ (LETT |s| NIL . #4#)
                    (LETT #2# (SPADCALL (QREFELT $ 18) (QREFELT $ 44)) . #4#)
                    G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#) . #4#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #3#
                            (CONS
                             (SPADCALL (|spadConstant| $ 20) (LIST |s|)
                                       (LIST 1) (QREFELT $ 26))
                             #3#)
                            . #4#)))
                    (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                    (EXIT (NREVERSE #3#)))))
      (LETT |lEq| NIL . #4#)
      (SEQ (LETT |i| 1 . #4#)
           (LETT #1# (SPADCALL (QREFELT $ 8) (QREFELT $ 45)) . #4#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (LETT |lEq|
                   (CONS
                    (SPADCALL (SPADCALL (QREFELT $ 8) |i| (QREFELT $ 46))
                              (SPADCALL |coefOfa| |i| (QREFELT $ 46))
                              (QREFELT $ 48))
                    |lEq|)
                   . #4#)))
           (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
      (LETT |top|
            (SPADCALL (SPADCALL |rf| (QREFELT $ 36)) |lEq| (QREFELT $ 50))
            . #4#)
      (LETT |bot|
            (SPADCALL (SPADCALL |rf| (QREFELT $ 36)) |lEq| (QREFELT $ 50))
            . #4#)
      (EXIT (SPADCALL |top| |bot| (QREFELT $ 51))))))) 

(DEFUN |GCNAALG;genericLeftTraceForm;2$F;2| (|a| |b| $)
  (SPADCALL (SPADCALL |a| |b| (QREFELT $ 52)) (QREFELT $ 53))) 

(DEFUN |GCNAALG;genericLeftDiscriminant;F;3| ($)
  (PROG (|m| #1=#:G151 |a| #2=#:G150 #3=#:G149 |b| #4=#:G148 |listBasis|)
    (RETURN
     (SEQ
      (LETT |listBasis| (SPADCALL (SPADCALL (QREFELT $ 56)) (QREFELT $ 59))
            . #5=(|GCNAALG;genericLeftDiscriminant;F;3|))
      (LETT |m|
            (SPADCALL
             (PROGN
              (LETT #4# NIL . #5#)
              (SEQ (LETT |b| NIL . #5#) (LETT #3# |listBasis| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |b| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #4#
                           (CONS
                            (PROGN
                             (LETT #2# NIL . #5#)
                             (SEQ (LETT |a| NIL . #5#)
                                  (LETT #1# |listBasis| . #5#) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |a| (CAR #1#) . #5#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL |a| |b| (QREFELT $ 54))
                                           #2#)
                                          . #5#)))
                                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            #4#)
                           . #5#)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                   (EXIT (NREVERSE #4#))))
             (QREFELT $ 62))
            . #5#)
      (EXIT (SPADCALL |m| (QREFELT $ 63))))))) 

(DEFUN |GCNAALG;genericRightTraceForm;2$F;4| (|a| |b| $)
  (SPADCALL (SPADCALL |a| |b| (QREFELT $ 52)) (QREFELT $ 65))) 

(DEFUN |GCNAALG;genericRightDiscriminant;F;5| ($)
  (PROG (|m| #1=#:G160 |a| #2=#:G159 #3=#:G158 |b| #4=#:G157 |listBasis|)
    (RETURN
     (SEQ
      (LETT |listBasis| (SPADCALL (SPADCALL (QREFELT $ 56)) (QREFELT $ 59))
            . #5=(|GCNAALG;genericRightDiscriminant;F;5|))
      (LETT |m|
            (SPADCALL
             (PROGN
              (LETT #4# NIL . #5#)
              (SEQ (LETT |b| NIL . #5#) (LETT #3# |listBasis| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |b| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #4#
                           (CONS
                            (PROGN
                             (LETT #2# NIL . #5#)
                             (SEQ (LETT |a| NIL . #5#)
                                  (LETT #1# |listBasis| . #5#) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |a| (CAR #1#) . #5#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL |a| |b| (QREFELT $ 66))
                                           #2#)
                                          . #5#)))
                                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            #4#)
                           . #5#)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                   (EXIT (NREVERSE #4#))))
             (QREFELT $ 62))
            . #5#)
      (EXIT (SPADCALL |m| (QREFELT $ 63))))))) 

(DEFUN |GCNAALG;initializeLeft| ($)
  (SEQ (SETELT $ 71 'NIL)
       (SETELT $ 70 (SPADCALL (QREFELT $ 35) (QREFELT $ 72)))
       (EXIT (SPADCALL (QREFELT $ 74))))) 

(DEFUN |GCNAALG;initializeRight| ($)
  (SEQ (SETELT $ 76 'NIL)
       (SETELT $ 75 (SPADCALL (QREFELT $ 35) (QREFELT $ 77)))
       (EXIT (SPADCALL (QREFELT $ 74))))) 

(DEFUN |GCNAALG;leftRankPolynomial;Sup;8| ($)
  (SEQ (COND ((QREFELT $ 71) (|GCNAALG;initializeLeft| $)))
       (EXIT (QREFELT $ 70)))) 

(DEFUN |GCNAALG;rightRankPolynomial;Sup;9| ($)
  (SEQ (COND ((QREFELT $ 76) (|GCNAALG;initializeRight| $)))
       (EXIT (QREFELT $ 75)))) 

(DEFUN |GCNAALG;genericLeftMinimalPolynomial;$Sup;10| (|a| $)
  (PROG ()
    (RETURN
     (SEQ (COND ((QREFELT $ 71) (|GCNAALG;initializeLeft| $)))
          (EXIT
           (SPADCALL
            (CONS #'|GCNAALG;genericLeftMinimalPolynomial;$Sup;10!0|
                  (VECTOR $ |a|))
            (QREFELT $ 70) (QREFELT $ 81))))))) 

(DEFUN |GCNAALG;genericLeftMinimalPolynomial;$Sup;10!0| (|x| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1)
          . #1=(|GCNAALG;genericLeftMinimalPolynomial;$Sup;10|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GCNAALG;eval| |x| |a| $))))) 

(DEFUN |GCNAALG;genericRightMinimalPolynomial;$Sup;11| (|a| $)
  (PROG ()
    (RETURN
     (SEQ (COND ((QREFELT $ 76) (|GCNAALG;initializeRight| $)))
          (EXIT
           (SPADCALL
            (CONS #'|GCNAALG;genericRightMinimalPolynomial;$Sup;11!0|
                  (VECTOR $ |a|))
            (QREFELT $ 75) (QREFELT $ 81))))))) 

(DEFUN |GCNAALG;genericRightMinimalPolynomial;$Sup;11!0| (|x| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1)
          . #1=(|GCNAALG;genericRightMinimalPolynomial;$Sup;11|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GCNAALG;eval| |x| |a| $))))) 

(DEFUN |GCNAALG;genericLeftTrace;$F;12| (|a| $)
  (PROG (|rf| |d1| #1=#:G175)
    (RETURN
     (SEQ (COND ((QREFELT $ 71) (|GCNAALG;initializeLeft| $)))
          (LETT |d1|
                (PROG1
                    (LETT #1# (- (SPADCALL (QREFELT $ 70) (QREFELT $ 85)) 1)
                          . #2=(|GCNAALG;genericLeftTrace;$F;12|))
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                . #2#)
          (LETT |rf| (SPADCALL (QREFELT $ 70) |d1| (QREFELT $ 86)) . #2#)
          (LETT |rf| (|GCNAALG;eval| |rf| |a| $) . #2#)
          (EXIT (SPADCALL |rf| (QREFELT $ 87))))))) 

(DEFUN |GCNAALG;genericRightTrace;$F;13| (|a| $)
  (PROG (|rf| |d1| #1=#:G178)
    (RETURN
     (SEQ (COND ((QREFELT $ 76) (|GCNAALG;initializeRight| $)))
          (LETT |d1|
                (PROG1
                    (LETT #1# (- (SPADCALL (QREFELT $ 75) (QREFELT $ 85)) 1)
                          . #2=(|GCNAALG;genericRightTrace;$F;13|))
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                . #2#)
          (LETT |rf| (SPADCALL (QREFELT $ 75) |d1| (QREFELT $ 86)) . #2#)
          (LETT |rf| (|GCNAALG;eval| |rf| |a| $) . #2#)
          (EXIT (SPADCALL |rf| (QREFELT $ 87))))))) 

(DEFUN |GCNAALG;genericLeftNorm;$F;14| (|a| $)
  (PROG (|rf|)
    (RETURN
     (SEQ (COND ((QREFELT $ 71) (|GCNAALG;initializeLeft| $)))
          (LETT |rf| (SPADCALL (QREFELT $ 70) 1 (QREFELT $ 86))
                . #1=(|GCNAALG;genericLeftNorm;$F;14|))
          (COND
           ((ODDP (SPADCALL (QREFELT $ 70) (QREFELT $ 85)))
            (LETT |rf| (SPADCALL |rf| (QREFELT $ 87)) . #1#)))
          (EXIT |rf|))))) 

(DEFUN |GCNAALG;genericRightNorm;$F;15| (|a| $)
  (PROG (|rf|)
    (RETURN
     (SEQ (COND ((QREFELT $ 76) (|GCNAALG;initializeRight| $)))
          (LETT |rf| (SPADCALL (QREFELT $ 75) 1 (QREFELT $ 86))
                . #1=(|GCNAALG;genericRightNorm;$F;15|))
          (COND
           ((ODDP (SPADCALL (QREFELT $ 75) (QREFELT $ 85)))
            (LETT |rf| (SPADCALL |rf| (QREFELT $ 87)) . #1#)))
          (EXIT |rf|))))) 

(DEFUN |GCNAALG;conditionsForIdempotents;VL;16| (|b| $)
  (PROG (|x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL |b| (QREFELT $ 90))
            |GCNAALG;conditionsForIdempotents;VL;16|)
      (EXIT
       (SPADCALL (ELT $ 36)
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| |x| (QREFELT $ 52)) |x|
                             (QREFELT $ 91))
                   |b| (QREFELT $ 92))
                  (QREFELT $ 39))
                 (QREFELT $ 43))))))) 

(DEFUN |GCNAALG;conditionsForIdempotents;L;17| ($)
  (PROG (|x|)
    (RETURN
     (SEQ (LETT |x| (QREFELT $ 35) |GCNAALG;conditionsForIdempotents;L;17|)
          (EXIT
           (SPADCALL (ELT $ 36)
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |x| (QREFELT $ 52)) |x|
                                 (QREFELT $ 91))
                       (QREFELT $ 37))
                      (QREFELT $ 39))
                     (QREFELT $ 43))))))) 

(DEFUN |GCNAALG;generic;$;18| ($) (QREFELT $ 35)) 

(DEFUN |GCNAALG;generic;VV$;19| (|vs| |ve| $)
  (PROG (|v| #1=#:G199 #2=#:G201 |i| #3=#:G200)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (QVSIZE |vs|) (SPADCALL |ve| (QREFELT $ 96)) (QREFELT $ 98))
        (|error| "generic: too little symbols"))
       ('T
        (SEQ
         (LETT |v|
               (PROGN
                (LETT #3# (GETREFV #4=(SPADCALL |ve| (QREFELT $ 96)))
                      . #5=(|GCNAALG;generic;VV$;19|))
                (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#) (LETT #1# 0 . #5#)
                     G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SETELT #3# #1#
                               (SPADCALL (|spadConstant| $ 20)
                                         (LIST
                                          (SPADCALL |vs| |i| (QREFELT $ 23)))
                                         (LIST 1) (QREFELT $ 26)))))
                     (LETT #1#
                           (PROG1 (|inc_SI| #1#)
                             (LETT |i| (|inc_SI| |i|) . #5#))
                           . #5#)
                     (GO G190) G191 (EXIT NIL))
                #3#)
               . #5#)
         (EXIT
          (SPADCALL (SPADCALL (ELT $ 28) |v| (QREFELT $ 33)) |ve|
                    (QREFELT $ 99)))))))))) 

(DEFUN |GCNAALG;generic;SV$;20| (|s| |ve| $)
  (PROG (|sFC| #1=#:G208 #2=#:G210 |i| #3=#:G209 |lON| #4=#:G207 |q| #5=#:G206)
    (RETURN
     (SEQ
      (LETT |lON|
            (PROGN
             (LETT #5# NIL . #6=(|GCNAALG;generic;SV$;20|))
             (SEQ (LETT |q| 1 . #6#)
                  (LETT #4# (SPADCALL |ve| (QREFELT $ 96)) . #6#) G190
                  (COND ((|greater_SI| |q| #4#) (GO G191)))
                  (SEQ (EXIT (LETT #5# (CONS (STRINGIMAGE |q|) #5#) . #6#)))
                  (LETT |q| (|inc_SI| |q|) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #5#))))
            . #6#)
      (LETT |sFC|
            (PROGN
             (LETT #3# (GETREFV (SIZE |lON|)) . #6#)
             (SEQ (LETT |i| NIL . #6#) (LETT #2# |lON| . #6#)
                  (LETT #1# 0 . #6#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #3# #1#
                            (SPADCALL (STRCONC |s| |i|) (QREFELT $ 17)))))
                  (LETT #1# (PROG1 (|inc_SI| #1#) (LETT #2# (CDR #2#) . #6#))
                        . #6#)
                  (GO G190) G191 (EXIT NIL))
             #3#)
            . #6#)
      (EXIT (SPADCALL |sFC| |ve| (QREFELT $ 100))))))) 

(DEFUN |GCNAALG;generic;V$;21| (|ve| $)
  (PROG (|v| #1=#:G222 #2=#:G224 |i| #3=#:G223 |sFC| #4=#:G219 #5=#:G221
         #6=#:G220 |lON| #7=#:G218 |q| #8=#:G217)
    (RETURN
     (SEQ
      (LETT |lON|
            (PROGN
             (LETT #8# NIL . #9=(|GCNAALG;generic;V$;21|))
             (SEQ (LETT |q| 1 . #9#)
                  (LETT #7# (SPADCALL |ve| (QREFELT $ 96)) . #9#) G190
                  (COND ((|greater_SI| |q| #7#) (GO G191)))
                  (SEQ (EXIT (LETT #8# (CONS (STRINGIMAGE |q|) #8#) . #9#)))
                  (LETT |q| (|inc_SI| |q|) . #9#) (GO G190) G191
                  (EXIT (NREVERSE #8#))))
            . #9#)
      (LETT |sFC|
            (PROGN
             (LETT #6# (GETREFV (SIZE |lON|)) . #9#)
             (SEQ (LETT |i| NIL . #9#) (LETT #5# |lON| . #9#)
                  (LETT #4# 0 . #9#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #6# #4#
                            (SPADCALL (STRCONC "%" (STRCONC "x" |i|))
                                      (QREFELT $ 17)))))
                  (LETT #4# (PROG1 (|inc_SI| #4#) (LETT #5# (CDR #5#) . #9#))
                        . #9#)
                  (GO G190) G191 (EXIT NIL))
             #6#)
            . #9#)
      (LETT |v|
            (PROGN
             (LETT #3# (GETREFV #10=(SPADCALL |ve| (QREFELT $ 96))) . #9#)
             (SEQ (LETT |i| 1 . #9#) (LETT #2# #10# . #9#) (LETT #1# 0 . #9#)
                  G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #3# #1#
                            (SPADCALL (|spadConstant| $ 20)
                                      (LIST
                                       (SPADCALL |sFC| |i| (QREFELT $ 23)))
                                      (LIST 1) (QREFELT $ 26)))))
                  (LETT #1#
                        (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|) . #9#))
                        . #9#)
                  (GO G190) G191 (EXIT NIL))
             #3#)
            . #9#)
      (EXIT
       (SPADCALL (SPADCALL (ELT $ 28) |v| (QREFELT $ 33)) |ve|
                 (QREFELT $ 99))))))) 

(DEFUN |GCNAALG;generic;V$;22| (|vs| $)
  (SPADCALL |vs| (SPADCALL (QREFELT $ 56)) (QREFELT $ 100))) 

(DEFUN |GCNAALG;generic;S$;23| (|s| $)
  (SPADCALL |s| (SPADCALL (QREFELT $ 56)) (QREFELT $ 101))) 

(DECLAIM (NOTINLINE |GenericNonAssociativeAlgebra;|)) 

(DEFUN |GenericNonAssociativeAlgebra| (&REST #1=#:G240)
  (PROG ()
    (RETURN
     (PROG (#2=#:G241)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|GenericNonAssociativeAlgebra|)
                                           '|domainEqualList|)
                . #3=(|GenericNonAssociativeAlgebra|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |GenericNonAssociativeAlgebra;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|GenericNonAssociativeAlgebra|))))))))))) 

(DEFUN |GenericNonAssociativeAlgebra;| (|#1| |#2| |#3| |#4|)
  (PROG (|v| #1=#:G238 |i| #2=#:G239 #3=#:G235 #4=#:G237 #5=#:G236 |q|
         #6=#:G234 |pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (SEQ
      (PROGN
       (LETT DV$1 (|devaluate| |#1|) . #7=(|GenericNonAssociativeAlgebra|))
       (LETT DV$2 (|devaluate| |#2|) . #7#)
       (LETT DV$3 (|devaluate| |#3|) . #7#)
       (LETT DV$4 (|devaluate| |#4|) . #7#)
       (LETT |dv$| (LIST '|GenericNonAssociativeAlgebra| DV$1 DV$2 DV$3 DV$4)
             . #7#)
       (LETT $ (GETREFV 115) . #7#)
       (QSETREFV $ 0 |dv$|)
       (QSETREFV $ 3
                 (LETT |pv$|
                       (|buildPredVector| 0 0
                                          (LIST
                                           (|HasCategory|
                                            (|Fraction| (|Polynomial| |#1|))
                                            '(|IntegralDomain|))
                                           (|HasCategory|
                                            (|Fraction| (|Polynomial| |#1|))
                                            '(|Field|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))))
                       . #7#))
       (|haddProp| |$ConstructorCache| '|GenericNonAssociativeAlgebra|
                   (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
       (|stuffDomainSlots| $)
       (QSETREFV $ 6 |#1|)
       (QSETREFV $ 7 |#2|)
       (QSETREFV $ 8 |#3|)
       (QSETREFV $ 9 |#4|)
       (SETF |pv$| (QREFELT $ 3))
       (QSETREFV $ 14
                 (PROGN
                  (LETT #6# NIL . #7#)
                  (SEQ (LETT |q| 1 . #7#) G190
                       (COND ((|greater_SI| |q| |#2|) (GO G191)))
                       (SEQ
                        (EXIT (LETT #6# (CONS (STRINGIMAGE |q|) #6#) . #7#)))
                       (LETT |q| (|inc_SI| |q|) . #7#) (GO G190) G191
                       (EXIT (NREVERSE #6#)))))
       (QSETREFV $ 18
                 (PROGN
                  (LETT #5# (GETREFV (SIZE #8=(QREFELT $ 14))) . #7#)
                  (SEQ (LETT |i| NIL . #7#) (LETT #4# #8# . #7#)
                       (LETT #3# 0 . #7#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SETELT #5# #3#
                                 (SPADCALL (STRCONC "%" (STRCONC "x" |i|))
                                           (QREFELT $ 17)))))
                       (LETT #3#
                             (PROG1 (|inc_SI| #3#) (LETT #4# (CDR #4#) . #7#))
                             . #7#)
                       (GO G190) G191 (EXIT NIL))
                  #5#))
       (QSETREFV $ 35
                 (SEQ
                  (LETT |v|
                        (PROGN
                         (LETT #2# (GETREFV |#2|) . #7#)
                         (SEQ (LETT |i| 1 . #7#) (LETT #1# 0 . #7#) G190
                              (COND ((|greater_SI| |i| |#2|) (GO G191)))
                              (SEQ
                               (EXIT
                                (SETELT #2# #1#
                                        (SPADCALL (|spadConstant| $ 20)
                                                  (LIST
                                                   (SPADCALL (QREFELT $ 18) |i|
                                                             (QREFELT $ 23)))
                                                  (LIST 1) (QREFELT $ 26)))))
                              (LETT #1#
                                    (PROG1 (|inc_SI| #1#)
                                      (LETT |i| (|inc_SI| |i|) . #7#))
                                    . #7#)
                              (GO G190) G191 (EXIT NIL))
                         #2#)
                        . #7#)
                  (EXIT
                   (SPADCALL (SPADCALL (ELT $ 28) |v| (QREFELT $ 33))
                             (QREFELT $ 34)))))
       (COND
        ((|testBitVector| |pv$| 3)
         (PROGN
          (QSETREFV $ 54
                    (CONS
                     (|dispatchFunction| |GCNAALG;genericLeftTraceForm;2$F;2|)
                     $))
          (QSETREFV $ 64
                    (CONS
                     (|dispatchFunction| |GCNAALG;genericLeftDiscriminant;F;3|)
                     $))
          (QSETREFV $ 66
                    (CONS
                     (|dispatchFunction| |GCNAALG;genericRightTraceForm;2$F;4|)
                     $))
          (QSETREFV $ 67
                    (CONS
                     (|dispatchFunction|
                      |GCNAALG;genericRightDiscriminant;F;5|)
                     $))
          (QSETREFV $ 70 (|spadConstant| $ 69))
          (QSETREFV $ 71 'T)
          NIL
          (QSETREFV $ 75 (|spadConstant| $ 69))
          (QSETREFV $ 76 'T)
          NIL
          (QSETREFV $ 78
                    (CONS
                     (|dispatchFunction| |GCNAALG;leftRankPolynomial;Sup;8|)
                     $))
          (QSETREFV $ 79
                    (CONS
                     (|dispatchFunction| |GCNAALG;rightRankPolynomial;Sup;9|)
                     $))
          (QSETREFV $ 82
                    (CONS
                     (|dispatchFunction|
                      |GCNAALG;genericLeftMinimalPolynomial;$Sup;10|)
                     $))
          (QSETREFV $ 83
                    (CONS
                     (|dispatchFunction|
                      |GCNAALG;genericRightMinimalPolynomial;$Sup;11|)
                     $))
          (QSETREFV $ 53
                    (CONS (|dispatchFunction| |GCNAALG;genericLeftTrace;$F;12|)
                          $))
          (QSETREFV $ 65
                    (CONS
                     (|dispatchFunction| |GCNAALG;genericRightTrace;$F;13|) $))
          (QSETREFV $ 88
                    (CONS (|dispatchFunction| |GCNAALG;genericLeftNorm;$F;14|)
                          $))
          (QSETREFV $ 89
                    (CONS (|dispatchFunction| |GCNAALG;genericRightNorm;$F;15|)
                          $)))))
       $))))) 

(MAKEPROP '|GenericNonAssociativeAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|AlgebraGivenByStructuralConstants| 27 7 8
                                                   (NRTEVAL
                                                    (SPADCALL (QREFELT $ 9)
                                                              (QREFELT $ 13))))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|Vector| 61) (|Vector| (|Matrix| 6))
              (|CoerceVectorMatrixPackage| 6) (0 . |coerce|) '|listOfNumbers|
              (|String|) (|Symbol|) (5 . |coerce|) '|symbolsForCoef|
              (|Polynomial| 6) (10 . |One|) (|Integer|) (|Vector| 16)
              (14 . |elt|) (|List| 16) (|List| 84) (20 . |monomial|)
              (|Fraction| 19) (27 . |coerce|) (|Vector| 27) (|Mapping| 27 19)
              (|Vector| 19) (|VectorFunctions2| 19 27) (32 . |map|)
              (38 . |convert|) '|genericElement| (43 . |numer|)
              (48 . |coordinates|) (|List| 27) (53 . |entries|) (|List| 19)
              (|Mapping| 19 27) (|ListFunctions2| 27 19) (58 . |map|)
              (64 . |entries|) (69 . |maxIndex|) (74 . |elt|) (|Equation| 19)
              (80 . |equation|) (|List| (|Equation| $)) (86 . |eval|) (92 . /)
              (98 . *) (104 . |genericLeftTrace|)
              (109 . |genericLeftTraceForm|) (|Vector| $) (115 . |basis|)
              (|List| $$) (|Vector| $$) (119 . |entries|) (|List| 38)
              (|Matrix| 27) (124 . |matrix|) (129 . |determinant|)
              (134 . |genericLeftDiscriminant|) (138 . |genericRightTrace|)
              (143 . |genericRightTraceForm|)
              (149 . |genericRightDiscriminant|)
              (|SparseUnivariatePolynomial| 27) (153 . |Zero|) '|leftRankPoly|
              '|initLeft?| (157 . |leftMinimalPolynomial|) (|Void|)
              (162 . |void|) '|rightRankPoly| '|initRight?|
              (166 . |rightMinimalPolynomial|) (171 . |leftRankPolynomial|)
              (175 . |rightRankPolynomial|) (|Mapping| 27 27) (179 . |map|)
              (185 . |genericLeftMinimalPolynomial|)
              (190 . |genericRightMinimalPolynomial|) (|NonNegativeInteger|)
              (195 . |degree|) (200 . |coefficient|) (206 . -)
              (211 . |genericLeftNorm|) (216 . |genericRightNorm|)
              |GCNAALG;generic;V$;21| (221 . -) (227 . |coordinates|)
              |GCNAALG;conditionsForIdempotents;VL;16|
              |GCNAALG;conditionsForIdempotents;L;17| |GCNAALG;generic;$;18|
              (233 . |maxIndex|) (|Boolean|) (238 . >) (244 . |represents|)
              |GCNAALG;generic;VV$;19| |GCNAALG;generic;SV$;20|
              |GCNAALG;generic;V$;22| |GCNAALG;generic;S$;23|
              (|SparseUnivariatePolynomial| (|Polynomial| 27))
              (|Union| $ '"failed") (|List| 29)
              (|Record| (|:| |particular| $) (|:| |basis| (|List| $)))
              (|Union| 107 '"failed") (|SquareMatrix| 7 27)
              (|List| (|Polynomial| 27)) (|PositiveInteger|) (|HashState|)
              (|OutputForm|) (|SingleInteger|))
           '#(|rightRankPolynomial| 250 |rightMinimalPolynomial| 254
              |represents| 259 |leftRankPolynomial| 265 |leftMinimalPolynomial|
              269 |genericRightTraceForm| 274 |genericRightTrace| 280
              |genericRightNorm| 285 |genericRightMinimalPolynomial| 290
              |genericRightDiscriminant| 295 |genericLeftTraceForm| 299
              |genericLeftTrace| 305 |genericLeftNorm| 310
              |genericLeftMinimalPolynomial| 315 |genericLeftDiscriminant| 320
              |generic| 324 |coordinates| 355 |convert| 366
              |conditionsForIdempotents| 371 |basis| 380 - 384 * 390)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1))
                 (CONS
                  '#(|FramedNonAssociativeAlgebra&|
                     |FiniteRankNonAssociativeAlgebra&|
                     |NonAssociativeAlgebra&| |Module&| NIL
                     |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&| NIL
                     |AbelianMonoid&| |AbelianSemiGroup&| |Monad&|
                     |SetCategory&| |BasicType&| NIL NIL)
                  (CONS
                   '#((|FramedNonAssociativeAlgebra|
                       (|Fraction| (|Polynomial| 6)))
                      (|FiniteRankNonAssociativeAlgebra|
                       (|Fraction| (|Polynomial| 6)))
                      (|NonAssociativeAlgebra| (|Fraction| (|Polynomial| 6)))
                      (|Module| (|Fraction| (|Polynomial| 6)))
                      (|BiModule| (|Fraction| (|Polynomial| 6))
                                  (|Fraction| (|Polynomial| 6)))
                      (|NonAssociativeRng|)
                      (|LeftModule|
                       (|SquareMatrix| 7 (|Fraction| (|Polynomial| 6))))
                      (|RightModule| (|Fraction| (|Polynomial| 6)))
                      (|LeftModule| (|Fraction| (|Polynomial| 6)))
                      (|AbelianGroup|) (|CancellationAbelianMonoid|)
                      (|AbelianMonoid|) (|AbelianSemiGroup|) (|Monad|)
                      (|SetCategory|) (|BasicType|) (|CoercibleTo| 113)
                      (|unitsKnown|))
                   (|makeByteWordVec2| 103
                                       '(1 12 10 11 13 1 16 0 15 17 0 19 0 20 2
                                         22 16 0 21 23 3 19 0 0 24 25 26 1 27 0
                                         19 28 2 32 29 30 31 33 1 0 0 29 34 1
                                         27 19 0 36 1 0 29 0 37 1 29 38 0 39 2
                                         42 40 41 38 43 1 22 24 0 44 1 40 21 0
                                         45 2 40 19 0 21 46 2 47 0 19 19 48 2
                                         19 0 0 49 50 2 27 0 19 19 51 2 0 0 0 0
                                         52 1 0 27 0 53 2 0 27 0 0 54 0 0 55 56
                                         1 58 57 0 59 1 61 0 60 62 1 61 27 0 63
                                         0 0 27 64 1 0 27 0 65 2 0 27 0 0 66 0
                                         0 27 67 0 68 0 69 1 0 68 0 72 0 73 0
                                         74 1 0 68 0 77 0 0 68 78 0 0 68 79 2
                                         68 0 80 0 81 1 0 68 0 82 1 0 68 0 83 1
                                         68 84 0 85 2 68 27 0 84 86 1 27 0 0 87
                                         1 0 27 0 88 1 0 27 0 89 2 0 0 0 0 91 2
                                         0 29 0 55 92 1 58 21 0 96 2 21 97 0 0
                                         98 2 0 0 29 55 99 0 3 68 79 1 1 68 0
                                         77 2 0 0 29 55 99 0 3 68 78 1 1 68 0
                                         72 2 3 27 0 0 66 1 3 27 0 65 1 3 27 0
                                         89 1 3 68 0 83 0 3 27 67 2 3 27 0 0 54
                                         1 3 27 0 53 1 3 27 0 88 1 3 68 0 82 0
                                         3 27 64 2 0 0 16 55 101 2 0 0 22 55
                                         100 1 0 0 22 102 1 0 0 55 90 0 0 0 95
                                         1 0 0 16 103 1 0 29 0 37 2 0 29 0 55
                                         92 1 0 0 29 34 0 3 40 94 1 3 40 55 93
                                         0 0 55 56 2 0 0 0 0 91 2 0 0 0 0
                                         52)))))
           '|lookupIncomplete|)) 
