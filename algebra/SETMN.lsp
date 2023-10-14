
(DEFUN |SETMN;=;2$B;1| (|s1| |s2| $)
  (SPADCALL (QCAR |s1|) (QCAR |s2|) (QREFELT $ 20))) 

(DEFUN |SETMN;coerce;$Of;2| (|s| $)
  (PROG (#1=#:G126 |i| #2=#:G125)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|SETMN;coerce;$Of;2|))
        (SEQ (LETT |i| NIL . #3#)
             (LETT #1# (SPADCALL |s| (QREFELT $ 23)) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 26)) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 28)))))) 

(DEFUN |SETMN;reallyEnumerate| ($)
  (PROG (#1=#:G129 |i| #2=#:G131 |b| #3=#:G130)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3#
             (GETREFV
              (SIZE
               #4=(|SETMN;enum| (QREFELT $ 6) (QREFELT $ 7) (QREFELT $ 7) $)))
             . #5=(|SETMN;reallyEnumerate|))
       (SEQ (LETT |b| NIL . #5#) (LETT #2# #4# . #5#) (LETT |i| 1 . #5#)
            (LETT #1# 0 . #5#) G190
            (COND
             ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#) . #5#) NIL))
              (GO G191)))
            (SEQ (EXIT (SETELT #3# #1# (CONS |b| |i|))))
            (LETT #1#
                  (PROG1 (|inc_SI| #1#)
                    (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #5#))
                          . #5#))
                  . #5#)
            (GO G190) G191 (EXIT NIL))
       #3#))))) 

(DEFUN |SETMN;member?;Pi$B;4| (|p| |s| $)
  (SPADCALL (QCAR |s|) |p| (QREFELT $ 31))) 

(DEFUN |SETMN;enumerate;V;5| ($)
  (SEQ
   (COND
    ((SPADCALL (SPADCALL (QREFELT $ 13) (QREFELT $ 33)) (QREFELT $ 34))
     (SPADCALL (QREFELT $ 13) (|SETMN;reallyEnumerate| $) (QREFELT $ 35))))
   (EXIT (SPADCALL (QREFELT $ 13) (QREFELT $ 33))))) 

(DEFUN |SETMN;enum| (|p| |q| |n| $)
  (PROG (#1=#:G148 |s| |l| #2=#:G142 |q1| #3=#:G141 |i| |b|)
    (RETURN
     (SEQ
      (COND ((OR (ZEROP |p|) (ZEROP |q|)) NIL)
            ('T
             (COND
              ((EQL |p| |q|)
               (SEQ
                (LETT |b| (SPADCALL (QREFELT $ 7) 'NIL (QREFELT $ 38))
                      . #4=(|SETMN;enum|))
                (SEQ (LETT |i| 1 . #4#) G190
                     (COND ((|greater_SI| |i| |p|) (GO G191)))
                     (SEQ (EXIT (SPADCALL |b| |i| 'T (QREFELT $ 39))))
                     (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT (LIST |b|))))
              ('T
               (SEQ
                (LETT |q1|
                      (PROG1 (LETT #3# (- |q| 1) . #4#)
                        (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                         #3#))
                      . #4#)
                (LETT |l|
                      (|SETMN;enum|
                       (PROG1 (LETT #2# (- |p| 1) . #4#)
                         (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                          #2#))
                       |q1| (QREFELT $ 7) $)
                      . #4#)
                (COND
                 ((NULL |l|)
                  (LETT |l| (LIST (SPADCALL (QREFELT $ 7) 'NIL (QREFELT $ 38)))
                        . #4#)))
                (SEQ (LETT |s| NIL . #4#) (LETT #1# |l| . #4#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #4#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (SPADCALL |s| |q| 'T (QREFELT $ 39))))
                     (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL (|SETMN;enum| |p| |q1| (QREFELT $ 7) $) |l|
                           (QREFELT $ 41)))))))))))) 

(DEFUN |SETMN;size;Nni;7| ($)
  (PROG (#1=#:G149)
    (RETURN
     (SEQ
      (COND
       ((ZEROP (SPADCALL (QREFELT $ 17) (QREFELT $ 42)))
        (SPADCALL (QREFELT $ 17)
                  (PROG1
                      (LETT #1#
                            (SPADCALL (QREFELT $ 7) (QREFELT $ 6)
                                      (QREFELT $ 44))
                            |SETMN;size;Nni;7|)
                    (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                  (QREFELT $ 45))))
      (EXIT (SPADCALL (QREFELT $ 17) (QREFELT $ 42))))))) 

(DEFUN |SETMN;lookup;$Pi;8| (|s| $)
  (PROG (#1=#:G156 #2=#:G154)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL (QREFELT $ 13) (QREFELT $ 33)) (QREFELT $ 34))
        (SPADCALL (QREFELT $ 13) (|SETMN;reallyEnumerate| $) (QREFELT $ 35))))
      (COND
       ((ZEROP (QCDR |s|))
        (PROGN
         (RPLACD |s|
                 (PROG1
                     (LETT #2#
                           (SPADCALL |s|
                                     (SPADCALL (QREFELT $ 13) (QREFELT $ 33))
                                     (QREFELT $ 47))
                           . #3=(|SETMN;lookup;$Pi;8|))
                   (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#)))
         (QCDR |s|))))
      (EXIT
       (PROG1 (LETT #1# (QCDR |s|) . #3#)
         (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))))) 

(DEFUN |SETMN;index;Pi$;9| (|p| $)
  (SEQ
   (COND
    ((SPADCALL |p| (SPADCALL (QREFELT $ 46)) (QREFELT $ 49))
     (|error| "index: argument too large"))
    ('T
     (SEQ
      (COND
       ((SPADCALL (SPADCALL (QREFELT $ 13) (QREFELT $ 33)) (QREFELT $ 34))
        (SPADCALL (QREFELT $ 13) (|SETMN;reallyEnumerate| $) (QREFELT $ 35))))
      (EXIT
       (SPADCALL (SPADCALL (QREFELT $ 13) (QREFELT $ 33)) |p|
                 (QREFELT $ 50)))))))) 

(DEFUN |SETMN;setOfMinN;L$;10| (|l| $)
  (PROG (|count| #1=#:G169 |i| |s|)
    (RETURN
     (SEQ
      (LETT |s| (SPADCALL (QREFELT $ 7) 'NIL (QREFELT $ 38))
            . #2=(|SETMN;setOfMinN;L$;10|))
      (LETT |count| 0 . #2#)
      (SEQ (LETT |i| NIL . #2#) (LETT #1# |l| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (LETT |count| (+ |count| 1) . #2#)
                (COND
                 ((OR (SPADCALL |count| (QREFELT $ 6) (QREFELT $ 49))
                      (OR
                       (OR (ZEROP |i|)
                           (SPADCALL |i| (QREFELT $ 7) (QREFELT $ 52)))
                       (SPADCALL |s| |i| (QREFELT $ 31))))
                  (EXIT (|error| "setOfMinN: improper set of integers"))))
                (EXIT (SPADCALL |s| |i| 'T (QREFELT $ 39))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND
        ((< |count| (QREFELT $ 6))
         (|error| "setOfMinN: improper set of integers"))
        ('T (CONS |s| 0)))))))) 

(DEFUN |SETMN;elements;$L;11| (|s| $)
  (PROG (|i| |found| |l| |b|)
    (RETURN
     (SEQ (LETT |b| (QCAR |s|) . #1=(|SETMN;elements;$L;11|))
          (LETT |l| NIL . #1#) (LETT |found| 0 . #1#) (LETT |i| 1 . #1#)
          (SEQ G190 (COND ((NULL (< |found| (QREFELT $ 6))) (GO G191)))
               (SEQ
                (COND
                 ((SPADCALL |b| |i| (QREFELT $ 31))
                  (SEQ (LETT |l| (CONS |i| |l|) . #1#)
                       (EXIT (LETT |found| (+ |found| 1) . #1#)))))
                (EXIT (LETT |i| (+ |i| 1) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (NREVERSE |l|)))))) 

(DEFUN |SETMN;incrementKthElement;$PiU;12| (|s| |k| $)
  (PROG (#1=#:G185 |newb| |i| |found| |b|)
    (RETURN
     (SEQ (LETT |b| (QCAR |s|) . #2=(|SETMN;incrementKthElement;$PiU;12|))
          (LETT |found| 0 . #2#) (LETT |i| 1 . #2#)
          (SEQ G190 (COND ((NULL (< |found| |k|)) (GO G191)))
               (SEQ
                (COND
                 ((SPADCALL |b| |i| (QREFELT $ 31))
                  (LETT |found| (+ |found| 1) . #2#)))
                (EXIT (LETT |i| (+ |i| 1) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((OR (SPADCALL |i| (QREFELT $ 7) (QREFELT $ 49))
                (SPADCALL |b| |i| (QREFELT $ 31)))
            (EXIT (CONS 1 "failed"))))
          (LETT |newb| (SPADCALL |b| (QREFELT $ 54)) . #2#)
          (SPADCALL |newb| |i| 'T (QREFELT $ 39))
          (SPADCALL |newb|
                    (PROG1 (LETT #1# (- |i| 1) . #2#)
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    'NIL (QREFELT $ 39))
          (EXIT (CONS 0 (CONS |newb| 0))))))) 

(DEFUN |SETMN;delta;$2PiNni;13| (|s| |k| |p| $)
  (PROG (|i| |count| |found| |b|)
    (RETURN
     (SEQ (LETT |b| (QCAR |s|) . #1=(|SETMN;delta;$2PiNni;13|))
          (LETT |count| (LETT |found| 0 . #1#) . #1#) (LETT |i| 1 . #1#)
          (SEQ G190 (COND ((NULL (< |found| |k|)) (GO G191)))
               (SEQ
                (COND
                 ((SPADCALL |b| |i| (QREFELT $ 31))
                  (SEQ (LETT |found| (+ |found| 1) . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |i| |p| (QREFELT $ 52))
                          (COND
                           ((< |found| |k|)
                            (LETT |count| (+ |count| 1) . #1#)))))))))
                (EXIT (LETT |i| (+ |i| 1) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |count|))))) 

(DEFUN |SETMN;replaceKthElement;$2PiU;14| (|s| |k| |p| $)
  (PROG (|newb| |i| |found| |b|)
    (RETURN
     (SEQ (LETT |b| (QCAR |s|) . #1=(|SETMN;replaceKthElement;$2PiU;14|))
          (LETT |found| 0 . #1#) (LETT |i| 1 . #1#)
          (SEQ G190 (COND ((NULL (< |found| |k|)) (GO G191)))
               (SEQ
                (COND
                 ((SPADCALL |b| |i| (QREFELT $ 31))
                  (LETT |found| (+ |found| 1) . #1#)))
                (EXIT (COND ((< |found| |k|) (LETT |i| (+ |i| 1) . #1#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |b| |p| (QREFELT $ 31))
            (COND
             ((SPADCALL |i| |p| (QREFELT $ 58)) (EXIT (CONS 1 "failed"))))))
          (LETT |newb| (SPADCALL |b| (QREFELT $ 54)) . #1#)
          (SPADCALL |newb| |p| 'T (QREFELT $ 39))
          (SPADCALL |newb| |i| 'NIL (QREFELT $ 39))
          (EXIT
           (CONS 0 (CONS |newb| (COND ((EQL |i| |p|) (QCDR |s|)) ('T 0))))))))) 

(DECLAIM (NOTINLINE |SetOfMIntegersInOneToN;|)) 

(DEFUN |SetOfMIntegersInOneToN| (&REST #1=#:G209)
  (PROG ()
    (RETURN
     (PROG (#2=#:G210)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SetOfMIntegersInOneToN|)
                                           '|domainEqualList|)
                . #3=(|SetOfMIntegersInOneToN|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |SetOfMIntegersInOneToN;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|SetOfMIntegersInOneToN|))))))))))) 

(DEFUN |SetOfMIntegersInOneToN;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SetOfMIntegersInOneToN|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|SetOfMIntegersInOneToN| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 64) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SetOfMIntegersInOneToN|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8
                (|Record| (|:| |bits| (|Bits|))
                          (|:| |pos| (|NonNegativeInteger|))))
      (QSETREFV $ 13 (SPADCALL (SPADCALL (QREFELT $ 10)) (QREFELT $ 12)))
      (QSETREFV $ 17 (SPADCALL 0 (QREFELT $ 16)))
      $)))) 

(MAKEPROP '|SetOfMIntegersInOneToN| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Vector| $$) (0 . |empty|) (|Reference| 9) (4 . |ref|) '|all|
              (|NonNegativeInteger|) (|Reference| 14) (9 . |ref|) '|sz|
              (|Boolean|) (|Bits|) (14 . =) |SETMN;=;2$B;1| (|List| 25)
              |SETMN;elements;$L;11| (|OutputForm|) (|PositiveInteger|)
              (20 . |coerce|) (|List| $) (25 . |brace|) |SETMN;coerce;$Of;2|
              (|Integer|) (30 . |elt|) |SETMN;member?;Pi$B;4| (36 . |elt|)
              (41 . |empty?|) (46 . |setelt|) (|Vector| $)
              |SETMN;enumerate;V;5| (52 . |new|) (58 . |setelt|) (|List| 19)
              (65 . |concat!|) (71 . |elt|) (|IntegerCombinatoricFunctions| 30)
              (76 . |binomial|) (82 . |setelt|) |SETMN;size;Nni;7|
              (88 . |position|) |SETMN;lookup;$Pi;8| (94 . >) (100 . |elt|)
              |SETMN;index;Pi$;9| (106 . >) |SETMN;setOfMinN;L$;10|
              (112 . |copy|) (|Union| $ '"failed")
              |SETMN;incrementKthElement;$PiU;12| |SETMN;delta;$2PiNni;13|
              (117 . ~=) |SETMN;replaceKthElement;$2PiU;14| (|String|)
              (|InputForm|) (|SingleInteger|) (|HashState|))
           '#(~= 123 |size| 129 |setOfMinN| 133 |replaceKthElement| 138
              |random| 145 |member?| 149 |lookup| 155 |latex| 160 |index| 165
              |incrementKthElement| 170 |hashUpdate!| 176 |hash| 182
              |enumerate| 187 |elements| 195 |delta| 200 |convert| 207 |coerce|
              212 = 217)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0))
                 (CONS '#(|Finite&| |SetCategory&| |BasicType&| NIL NIL)
                       (CONS
                        '#((|Finite|) (|SetCategory|) (|BasicType|)
                           (|ConvertibleTo| 61) (|CoercibleTo| 24))
                        (|makeByteWordVec2| 63
                                            '(0 9 0 10 1 11 0 9 12 1 15 0 14 16
                                              2 19 18 0 0 20 1 25 24 0 26 1 24
                                              0 27 28 2 19 18 0 30 31 1 11 9 0
                                              33 1 9 18 0 34 2 11 9 0 9 35 2 19
                                              0 14 18 38 3 19 18 0 30 18 39 2
                                              40 0 0 0 41 1 15 14 0 42 2 43 30
                                              30 30 44 2 15 14 0 14 45 2 9 30 2
                                              0 47 2 14 18 0 0 49 2 9 2 0 30 50
                                              2 25 18 0 0 52 1 19 0 0 54 2 25
                                              18 0 0 58 2 0 18 0 0 1 0 0 14 46
                                              1 0 0 22 53 3 0 55 0 25 25 59 0 0
                                              0 1 2 0 18 25 0 32 1 0 25 0 48 1
                                              0 60 0 1 1 0 0 25 51 2 0 55 0 25
                                              56 2 0 63 63 0 1 1 0 62 0 1 0 0
                                              36 37 0 0 27 1 1 0 22 0 23 3 0 14
                                              0 25 25 57 1 0 61 0 1 1 0 24 0 29
                                              2 0 18 0 0 21)))))
           '|lookupComplete|)) 
