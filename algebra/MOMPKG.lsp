
(/VERSIONCHECK 2) 

(DEFUN |MOMPKG;cumulant2moment;2S;1| (|cum| $)
  (SPADCALL
   (SPADCALL (SPADCALL (SPADCALL |cum| (QREFELT $ 9)) (QREFELT $ 11))
             (QREFELT $ 12))
   (QREFELT $ 13))) 

(DEFUN |MOMPKG;moment2cumulant;2S;2| (|mom| $)
  (SPADCALL
   (SPADCALL (SPADCALL (SPADCALL |mom| (QREFELT $ 9)) (QREFELT $ 15))
             (QREFELT $ 12))
   (QREFELT $ 13))) 

(DEFUN |MOMPKG;freecumulant2moment;2S;3| (|cum| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL
     (SPADCALL
      (SPADCALL (|spadConstant| $ 17) (SPADCALL |cum| (QREFELT $ 9))
                (QREFELT $ 18))
      (QREFELT $ 20))
     (QREFELT $ 12))
    (QREFELT $ 12))
   (QREFELT $ 21))) 

(DEFUN |MOMPKG;moment2freecumulant;2S;4| (|mom| $)
  (PROG (#1=#:G131 |f1| |f| |g1| |g|)
    (RETURN
     (SEQ
      (LETT |g|
            (SPADCALL (|spadConstant| $ 17) (SPADCALL |mom| (QREFELT $ 9))
                      (QREFELT $ 23))
            . #2=(|MOMPKG;moment2freecumulant;2S;4|))
      (LETT |g1| (SPADCALL |g| (QREFELT $ 25)) . #2#)
      (LETT |f|
            (SPADCALL
             (PROG2 (LETT #1# |g1| . #2#)
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6)) #1#))
             (QREFELT $ 20))
            . #2#)
      (LETT |f1| (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 25)) . #2#)
      (EXIT
       (SPADCALL
        (SPADCALL
         (PROG2 (LETT #1# |f1| . #2#)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6)) #1#))
         (QREFELT $ 12))
        (QREFELT $ 21))))))) 

(DEFUN |MOMPKG;booleancumulant2moment;2S;5| (|x| $)
  (PROG (#1=#:G136 |boo| |rec|)
    (RETURN
     (SEQ
      (LETT |rec|
            (SPADCALL (|spadConstant| $ 17)
                      (SPADCALL (SPADCALL |x| (QREFELT $ 27)) (QREFELT $ 9))
                      (QREFELT $ 23))
            . #2=(|MOMPKG;booleancumulant2moment;2S;5|))
      (LETT |boo| (SPADCALL |rec| (QREFELT $ 25)) . #2#)
      (EXIT
       (SPADCALL
        (SPADCALL
         (PROG2 (LETT #1# |boo| . #2#)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6)) #1#))
         (QREFELT $ 13))
        (QREFELT $ 28))))))) 

(DEFUN |MOMPKG;moment2booleancumulant;2S;6| (|x| $)
  (PROG (#1=#:G141 |mom| |boo|)
    (RETURN
     (SEQ
      (LETT |boo|
            (SPADCALL (|spadConstant| $ 17) (SPADCALL |x| (QREFELT $ 9))
                      (QREFELT $ 23))
            . #2=(|MOMPKG;moment2booleancumulant;2S;6|))
      (LETT |mom| (SPADCALL |boo| (QREFELT $ 25)) . #2#)
      (EXIT
       (SPADCALL
        (SPADCALL
         (SPADCALL
          (PROG2 (LETT #1# |mom| . #2#)
              (QCDR #1#)
            (|check_union| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6)) #1#))
          (QREFELT $ 13))
         (QREFELT $ 27))
        (QREFELT $ 28))))))) 

(DEFUN |MOMPKG;hankelDeterminant;SNniR;7| (|x| |n| $)
  (SPADCALL
   (SPADCALL
    (CONS (|spadConstant| $ 17)
          (SPADCALL |x| (SPADCALL 2 |n| (QREFELT $ 33)) (QREFELT $ 35)))
    (QREFELT $ 38))
   (QREFELT $ 39))) 

(DEFUN |MOMPKG;moment2nthjacobi;LR;8| (|mom| $)
  (PROG (N G #1=#:G160 |h| #2=#:G159 H |Hk| #3=#:G158 |l| |k| |bb| |aa| |bk|
         |ak|)
    (RETURN
     (SEQ (LETT N (LENGTH |mom|) . #4=(|MOMPKG;moment2nthjacobi;LR;8|))
          (LETT G |mom| . #4#) (LETT |aa| NIL . #4#) (LETT |bb| NIL . #4#)
          (SEQ G190 (COND ((NULL (SPADCALL N 1 (QREFELT $ 43))) (GO G191)))
               (SEQ (LETT |ak| (|SPADfirst| G) . #4#)
                    (LETT |bk|
                          (SPADCALL (SPADCALL G (QREFELT $ 44))
                                    (SPADCALL |ak| |ak| (QREFELT $ 45))
                                    (QREFELT $ 46))
                          . #4#)
                    (LETT |aa| (SPADCALL |aa| |ak| (QREFELT $ 47)) . #4#)
                    (LETT |bb| (SPADCALL |bb| |bk| (QREFELT $ 47)) . #4#)
                    (LETT H
                          (LIST (SPADCALL |ak| (QREFELT $ 48))
                                (SPADCALL |bk| (QREFELT $ 48)))
                          . #4#)
                    (SEQ (LETT |k| 3 . #4#) G190 (COND ((> |k| N) (GO G191)))
                         (SEQ
                          (LETT |Hk|
                                (SPADCALL (SPADCALL G |k| (QREFELT $ 49))
                                          (QREFELT $ 48))
                                . #4#)
                          (SEQ (LETT |l| 1 . #4#) (LETT #3# (- |k| 1) . #4#)
                               G190 (COND ((|greater_SI| |l| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |Hk|
                                       (SPADCALL |Hk|
                                                 (SPADCALL
                                                  (SPADCALL G |l|
                                                            (QREFELT $ 49))
                                                  (SPADCALL H (- |k| |l|)
                                                            (QREFELT $ 49))
                                                  (QREFELT $ 45))
                                                 (QREFELT $ 46))
                                       . #4#)))
                               (LETT |l| (|inc_SI| |l|) . #4#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (LETT H (SPADCALL H |Hk| (QREFELT $ 47)) . #4#)))
                         (LETT |k| (+ |k| 1) . #4#) (GO G190) G191 (EXIT NIL))
                    (COND
                     ((|HasCategory| (QREFELT $ 6) '(|Field|))
                      (SEQ
                       (LETT G
                             (PROGN
                              (LETT #2# NIL . #4#)
                              (SEQ (LETT |h| NIL . #4#) (LETT #1# H . #4#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |h| (CAR #1#) . #4#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |h| |bk| (QREFELT $ 50))
                                             (QREFELT $ 48))
                                            #2#)
                                           . #4#)))
                                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             . #4#)
                       (EXIT (LETT G (CDR (CDR G)) . #4#)))))
                    (EXIT (LETT N (- N 2) . #4#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |aa| |bb|)))))) 

(DEFUN |MOMPKG;moment2jacobi2;SS;9| (|mom| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|MOMPKG;moment2jacobi2;SS;9!0| (VECTOR (QREFELT $ 6) |mom| $))
       (QREFELT $ 63)))))) 

(DEFUN |MOMPKG;moment2jacobi2;SS;9!0| ($$)
  (PROG ($ |mom| R)
    (LETT $ (QREFELT $$ 2) . #1=(|MOMPKG;moment2jacobi2;SS;9|))
    (LETT |mom| (QREFELT $$ 1) . #1#)
    (LETT R (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|gseries| #2=#:G162 |a| |gseries1| |b| |b1|)
        (RETURN
         (SEQ
          (LETT |gseries|
                (SPADCALL (|spadConstant| $ 17) (SPADCALL |mom| (QREFELT $ 9))
                          (QREFELT $ 23))
                NIL)
          (LETT |gseries1|
                (PROG2 (LETT #2# (SPADCALL |gseries| (QREFELT $ 25)) NIL)
                    (QCDR #2#)
                  (|check_union| (QEQCAR #2# 0) (|Stream| R) #2#))
                NIL)
          (LETT |gseries1| (SPADCALL |gseries1| (QREFELT $ 12)) NIL)
          (LETT |a|
                (SPADCALL (SPADCALL |gseries1| (QREFELT $ 53)) (QREFELT $ 48))
                NIL)
          (LETT |gseries1| (SPADCALL |gseries1| (QREFELT $ 12)) NIL)
          (LETT |b|
                (SPADCALL (SPADCALL |gseries1| (QREFELT $ 53)) (QREFELT $ 48))
                NIL)
          (LETT |b1| (SPADCALL (SPADCALL |b| (QREFELT $ 54)) (QREFELT $ 48))
                NIL)
          (EXIT
           (SPADCALL (CONS |a| |b|)
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |b| (QREFELT $ 54))
                                 (SPADCALL (SPADCALL |gseries1| (QREFELT $ 55))
                                           (QREFELT $ 13))
                                 (QREFELT $ 56))
                       (QREFELT $ 27))
                      (QREFELT $ 59))
                     (QREFELT $ 60)))))))))) 

(DEFUN |MOMPKG;moment2jacobi;SR;10| (|mom| $)
  (PROG (|res|)
    (RETURN
     (SEQ
      (LETT |res| (SPADCALL |mom| (QREFELT $ 59)) |MOMPKG;moment2jacobi;SR;10|)
      (EXIT
       (CONS
        (SPADCALL (LIST #'|MOMPKG;moment2jacobi;SR;10!0|) |res| (QREFELT $ 66))
        (SPADCALL (LIST #'|MOMPKG;moment2jacobi;SR;10!1|) |res|
                  (QREFELT $ 66)))))))) 

(DEFUN |MOMPKG;moment2jacobi;SR;10!1| (|y| $$) (QCDR |y|)) 

(DEFUN |MOMPKG;moment2jacobi;SR;10!0| (|y| $$) (QCAR |y|)) 

(DEFUN |MOMPKG;jacobi2polypq| (|aa| |bb| |p| |q| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|MOMPKG;jacobi2polypq!0|
             (VECTOR |p| |bb| |q| $ |aa| (QREFELT $ 72)))
       (QREFELT $ 79)))))) 

(DEFUN |MOMPKG;jacobi2polypq!0| ($$)
  (PROG (|xsup| |aa| $ |q| |bb| |p|)
    (LETT |xsup| (QREFELT $$ 5) . #1=(|MOMPKG;jacobi2polypq|))
    (LETT |aa| (QREFELT $$ 4) . #1#)
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |q| (QREFELT $$ 2) . #1#)
    (LETT |bb| (QREFELT $$ 1) . #1#)
    (LETT |p| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|q1| |pq1|)
        (RETURN
         (SEQ
          (LETT |q1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |xsup|
                            (SPADCALL (SPADCALL |aa| (QREFELT $ 53))
                                      (|spadConstant| $ 70) (QREFELT $ 73))
                            (QREFELT $ 74))
                  |q| (QREFELT $ 75))
                 (SPADCALL (SPADCALL |bb| (QREFELT $ 53)) |p| (QREFELT $ 73))
                 (QREFELT $ 74))
                NIL)
          (LETT |pq1| (CONS |q| |q1|) NIL)
          (EXIT
           (SPADCALL |pq1|
                     (|MOMPKG;jacobi2polypq| (SPADCALL |aa| (QREFELT $ 12))
                      (SPADCALL |bb| (QREFELT $ 12)) |q| |q1| $)
                     (QREFELT $ 78)))))))))) 

(DEFUN |MOMPKG;jacobi2poly;2SS;12| (|aa| |bb| $)
  (PROG (|res| |p1| |p0|)
    (RETURN
     (SEQ (LETT |p0| (|spadConstant| $ 70) . #1=(|MOMPKG;jacobi2poly;2SS;12|))
          (LETT |p1|
                (SPADCALL (QREFELT $ 72)
                          (SPADCALL (SPADCALL |aa| (QREFELT $ 53)) |p0|
                                    (QREFELT $ 73))
                          (QREFELT $ 74))
                . #1#)
          (LETT |res|
                (|MOMPKG;jacobi2polypq| (SPADCALL |aa| (QREFELT $ 12)) |bb|
                 |p0| |p1| $)
                . #1#)
          (EXIT
           (SPADCALL (LIST #'|MOMPKG;jacobi2poly;2SS;12!0|) |res|
                     (QREFELT $ 83))))))) 

(DEFUN |MOMPKG;jacobi2poly;2SS;12!0| (|pp| $$) (QCAR |pp|)) 

(DEFUN |MOMPKG;moment2Stransform;SR;13| (|x| $)
  (PROG (S |chi| |mom| S2 |chi2s| |chi2| |mom2|)
    (RETURN
     (SEQ
      (LETT |mom| (SPADCALL |x| (QREFELT $ 9))
            . #1=(|MOMPKG;moment2Stransform;SR;13|))
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |mom| (QREFELT $ 53)) (QREFELT $ 85))
         (SEQ
          (LETT |mom2|
                (SPADCALL (|spadConstant| $ 86)
                          (SPADCALL (SPADCALL 1 2 (QREFELT $ 89))
                                    (SPADCALL |mom| (QREFELT $ 12))
                                    (QREFELT $ 90))
                          (QREFELT $ 23))
                . #1#)
          (LETT |chi2| (SPADCALL |mom2| (QREFELT $ 91)) . #1#)
          (LETT |chi2s| (SPADCALL |chi2| (QREFELT $ 13)) . #1#)
          (LETT S2
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 86) |chi2s| (QREFELT $ 92))
                 (SPADCALL |chi2s| (QREFELT $ 28)) (QREFELT $ 93))
                . #1#)
          (EXIT
           (VECTOR (SPADCALL 1 2 (QREFELT $ 89))
                   (SPADCALL (|spadConstant| $ 94) (QREFELT $ 95)) S2))))
        ('T
         (SEQ
          (LETT |mom| (SPADCALL (|spadConstant| $ 86) |mom| (QREFELT $ 23))
                . #1#)
          (LETT |chi| (SPADCALL |mom| (QREFELT $ 91)) . #1#)
          (LETT S
                (SPADCALL (SPADCALL |chi| (QREFELT $ 13))
                          (SPADCALL (SPADCALL |chi| (QREFELT $ 12))
                                    (QREFELT $ 13))
                          (QREFELT $ 93))
                . #1#)
          (EXIT (VECTOR (|spadConstant| $ 94) (|spadConstant| $ 96) S)))))))))) 

(DEFUN |MOMPKG;moment2monotonecumulantgenerator| (|srm| $)
  (PROG (#1=#:G203 |mtnew| |rrnew| |mnt| |rn| |tmp| |k| #2=#:G204 |r| #3=#:G205
         |m| |n| |mm| |rr| |mt|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |mt| (QVELT |srm| 0)
              . #4=(|MOMPKG;moment2monotonecumulantgenerator|))
        (LETT |rr| (QVELT |srm| 1) . #4#) (LETT |mm| (QVELT |srm| 2) . #4#)
        (LETT |n| (+ (LENGTH |rr|) 1) . #4#)
        (LETT |tmp| (|spadConstant| $ 87) . #4#)
        (SEQ (LETT |m| NIL . #4#) (LETT #3# (REVERSE |mt|) . #4#)
             (LETT |r| NIL . #4#) (LETT #2# |rr| . #4#) (LETT |k| 2 . #4#) G190
             (COND
              ((OR (|greater_SI| |k| |n|) (ATOM #2#)
                   (PROGN (LETT |r| (CAR #2#) . #4#) NIL) (ATOM #3#)
                   (PROGN (LETT |m| (CAR #3#) . #4#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT |tmp|
                     (SPADCALL |tmp|
                               (SPADCALL (SPADCALL |k| |m| (QREFELT $ 100)) |r|
                                         (QREFELT $ 101))
                               (QREFELT $ 102))
                     . #4#)))
             (LETT |k|
                   (PROG1 (|inc_SI| |k|)
                     (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#))
                           . #4#))
                   . #4#)
             (GO G190) G191 (EXIT NIL))
        (LETT |mnt| (SPADCALL |tmp| (QREFELT $ 103)) . #4#)
        (LETT |rn|
              (SPADCALL (SPADCALL |mm| (QREFELT $ 53))
                        (SPADCALL |mnt| (|spadConstant| $ 17) (QREFELT $ 104))
                        (QREFELT $ 46))
              . #4#)
        (LETT |mnt|
              (SPADCALL |mnt| (SPADCALL (QREFELT $ 99) |rn| (QREFELT $ 101))
                        (QREFELT $ 102))
              . #4#)
        (LETT |rrnew| (CONS |rn| |rr|) . #4#)
        (LETT |mtnew| (CONS |mnt| |mt|) . #4#)
        (EXIT
         (PROGN
          (LETT #1# (VECTOR |mtnew| |rrnew| (SPADCALL |mm| (QREFELT $ 12)))
                . #4#)
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |MOMPKG;moment2monotonecumulant;2S;15| (|mm| $)
  (PROG (|res1| |res| |mtr1| |r1| |m1t|)
    (RETURN
     (SEQ
      (LETT |m1t| (SPADCALL (SPADCALL |mm| (QREFELT $ 105)) 1 (QREFELT $ 71))
            . #1=(|MOMPKG;moment2monotonecumulant;2S;15|))
      (LETT |r1| (SPADCALL |mm| (QREFELT $ 105)) . #1#)
      (LETT |mtr1|
            (VECTOR (LIST |m1t|) (LIST |r1|)
                    (SPADCALL (SPADCALL |mm| (QREFELT $ 9)) (QREFELT $ 12)))
            . #1#)
      (LETT |res|
            (SPADCALL
             (CONS (|function| |MOMPKG;moment2monotonecumulantgenerator|) $)
             |mtr1| (QREFELT $ 109))
            . #1#)
      (LETT |res1|
            (SPADCALL (CONS #'|MOMPKG;moment2monotonecumulant;2S;15!0| $) |res|
                      (QREFELT $ 113))
            . #1#)
      (EXIT (SPADCALL |res1| (QREFELT $ 13))))))) 

(DEFUN |MOMPKG;moment2monotonecumulant;2S;15!0| (|s| $)
  (SPADCALL (QVELT |s| 1) (QREFELT $ 110))) 

(DEFUN |MomentPackage| (#1=#:G212)
  (PROG ()
    (RETURN
     (PROG (#2=#:G213)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|MomentPackage|)
                                           '|domainEqualList|)
                . #3=(|MomentPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|MomentPackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|MomentPackage|))))))))))) 

(DEFUN |MomentPackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MomentPackage|))
      (LETT |dv$| (LIST '|MomentPackage| DV$1) . #1#)
      (LETT $ (GETREFV 115) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1| '(|Field|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|MomentPackage| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 52
                   (CONS (|dispatchFunction| |MOMPKG;moment2nthjacobi;LR;8|)
                         $))
         (QSETREFV $ 59
                   (CONS (|dispatchFunction| |MOMPKG;moment2jacobi2;SS;9|) $))
         (QSETREFV $ 68
                   (CONS (|dispatchFunction| |MOMPKG;moment2jacobi;SR;10|)
                         $)))))
      (QSETREFV $ 72 (SPADCALL (|spadConstant| $ 17) 1 (QREFELT $ 71)))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 98
                   (CONS (|dispatchFunction| |MOMPKG;moment2Stransform;SR;13|)
                         $))
         (QSETREFV $ 99 (SPADCALL (|spadConstant| $ 17) 1 (QREFELT $ 71)))
         (QSETREFV $ 114
                   (CONS
                    (|dispatchFunction| |MOMPKG;moment2monotonecumulant;2S;15|)
                    $)))))
      $)))) 

(MAKEPROP '|MomentPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Stream| 6)
              (|Sequence| 6) (0 . |stream|)
              (|StreamExponentialSeriesOperations| 6) (5 . |exp0|)
              (10 . |rest|) (15 . |sequence|) |MOMPKG;cumulant2moment;2S;1|
              (20 . |log1|) |MOMPKG;moment2cumulant;2S;2| (25 . |One|)
              (29 . |concat|) (|StreamTaylorSeriesOperations| 6)
              (35 . |lagrange|) (40 . |coerce|)
              |MOMPKG;freecumulant2moment;2S;3| (45 . |cons|)
              (|Union| 7 '"failed") (51 . |recip|)
              |MOMPKG;moment2freecumulant;2S;4| (56 . -) (61 . |rest|)
              |MOMPKG;booleancumulant2moment;2S;5|
              |MOMPKG;moment2booleancumulant;2S;6| (|PositiveInteger|)
              (|NonNegativeInteger|) (66 . *) (|List| 6) (72 . |firstn|)
              (|Matrix| 6) (|HankelPackage| 6) (78 . |HankelMatrix|)
              (83 . |determinant|) |MOMPKG;hankelDeterminant;SNniR;7|
              (|Boolean|) (|Integer|) (88 . >) (94 . |second|) (99 . *)
              (105 . -) (111 . |concat|) (117 . -) (122 . |elt|) (128 . /)
              (|Record| (|:| |an| 34) (|:| |bn| 34)) (134 . |moment2nthjacobi|)
              (139 . |first|) (144 . |inv|) (149 . |rst|) (154 . *)
              (|Record| (|:| |an| 6) (|:| |bn| 6)) (|Stream| 57)
              (160 . |moment2jacobi2|) (165 . |cons|) (171 . |One|)
              (|Mapping| $) (175 . |delay|) (|Mapping| 6 57)
              (|StreamFunctions2| 57 6) (180 . |map|)
              (|Record| (|:| |an| 7) (|:| |bn| 7)) (186 . |moment2jacobi|)
              (|SparseUnivariatePolynomial| 6) (191 . |One|) (195 . |monomial|)
              '|xsup| (201 . *) (207 . -) (213 . *)
              (|Record| (|:| |first| 69) (|:| |second| 69)) (|Stream| 76)
              (219 . |cons|) (225 . |delay|) (|Stream| 69) (|Mapping| 69 76)
              (|StreamFunctions2| 76 69) (230 . |map|)
              |MOMPKG;jacobi2poly;2SS;12| (236 . |zero?|) (241 . |Zero|)
              (245 . |Zero|) (|Fraction| 42) (249 . /) (255 . |powern|)
              (261 . |revert|) (266 . |cons|) (272 . +) (278 . |One|) (282 . -)
              (287 . |Zero|)
              (|Record| (|:| |puiseux| 88) (|:| |laurent| 88) (|:| |coef| 8))
              (291 . |moment2Stransform|) '|t| (296 . *) (302 . *) (308 . +)
              (314 . |integrate|) (319 . |elt|) (325 . |first|)
              (|Record| (|:| |momt| (|List| 69)) (|:| |cum| 34) (|:| |mom| 7))
              (|Mapping| 106 106) (|Stream| 106) (330 . |generate|)
              (336 . |first|) (|Mapping| 6 106) (|StreamFunctions2| 106 6)
              (341 . |map|) (347 . |moment2monotonecumulant|))
           '#(|qcumulant2nthmoment| 352 |moment2nthjacobi| 359
              |moment2monotonecumulant| 364 |moment2jacobi2| 369
              |moment2jacobi| 374 |moment2freecumulant| 379 |moment2cumulant|
              384 |moment2booleancumulant| 389 |moment2Stransform| 394
              |jacobi2poly| 399 |hankelDeterminant| 405 |freecumulant2moment|
              411 |cumulant2moment| 416 |booleancumulant2moment| 421)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 114
                                                 '(1 8 7 0 9 1 10 7 7 11 1 7 0
                                                   0 12 1 8 0 7 13 1 10 7 7 15
                                                   0 6 0 17 2 7 0 6 0 18 1 19 7
                                                   7 20 1 8 0 7 21 2 7 0 6 0 23
                                                   1 19 24 7 25 1 8 0 0 27 1 8
                                                   0 0 28 2 32 0 31 0 33 2 8 34
                                                   0 32 35 1 37 36 34 38 1 36 6
                                                   0 39 2 42 41 0 0 43 1 34 6 0
                                                   44 2 6 0 0 0 45 2 6 0 0 0 46
                                                   2 34 0 0 6 47 1 6 0 0 48 2
                                                   34 6 0 42 49 2 6 0 0 0 50 1
                                                   0 51 34 52 1 7 6 0 53 1 6 0
                                                   0 54 1 7 0 0 55 2 8 0 6 0 56
                                                   1 0 58 8 59 2 58 0 57 0 60 0
                                                   31 0 61 1 58 0 62 63 2 65 7
                                                   64 58 66 1 0 67 8 68 0 69 0
                                                   70 2 69 0 6 32 71 2 69 0 6 0
                                                   73 2 69 0 0 0 74 2 69 0 0 0
                                                   75 2 77 0 76 0 78 1 77 0 62
                                                   79 2 82 80 81 77 83 1 6 41 0
                                                   85 0 6 0 86 0 69 0 87 2 88 0
                                                   42 42 89 2 19 7 88 7 90 1 19
                                                   7 7 91 2 8 0 6 0 92 2 8 0 0
                                                   0 93 0 88 0 94 1 88 0 0 95 0
                                                   88 0 96 1 0 97 8 98 2 69 0
                                                   32 0 100 2 69 0 0 6 101 2 69
                                                   0 0 0 102 1 69 0 0 103 2 69
                                                   6 0 6 104 1 8 6 0 105 2 108
                                                   0 107 106 109 1 34 6 0 110 2
                                                   112 7 111 108 113 1 0 8 8
                                                   114 3 0 6 6 8 32 1 1 2 51 34
                                                   52 1 1 8 8 114 1 2 58 8 59 1
                                                   2 67 8 68 1 0 8 8 26 1 0 8 8
                                                   16 1 0 8 8 30 1 1 97 8 98 2
                                                   0 80 7 7 84 2 0 6 8 32 40 1
                                                   0 8 8 22 1 0 8 8 14 1 0 8 8
                                                   29)))))
           '|lookupComplete|)) 
