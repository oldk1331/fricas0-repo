
(SDEFUN |SHP;delta| ((|int1| |NonNegativeInteger|) ($ R))
        (SPROG ((#1=#:G121 NIL))
               (SPADCALL (SPADCALL (|spadConstant| $ 8) (QREFELT $ 10))
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (* |int1| (+ |int1| 1)) 2
                                             (QREFELT $ 13)))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0)
                                           (|NonNegativeInteger|)
                                           (|Union| (|NonNegativeInteger|)
                                                    "failed")
                                           #1#))
                         (QREFELT $ 14)))) 

(SDEFUN |SHP;polsth1|
        ((|p1| UP) (|p| |NonNegativeInteger|) (|p2| UP)
         (|q| |NonNegativeInteger|) (|c1| R) ($ |List| UP))
        (SPROG
         ((|List2| (|List| UP)) (|Pr6| (UP)) (#1=#:G213 NIL) (#2=#:G218 NIL)
          (|j| NIL) (|List1| (|List| UP)) (|Listf| (|List| UP)) (#3=#:G204 NIL)
          (|Pr5| (UP)) (#4=#:G203 NIL) (#5=#:G201 NIL) (|Pr4| (UP))
          (#6=#:G154 NIL) (|Pr3| (UP)) (#7=#:G140 NIL)
          (|r| (|NonNegativeInteger|)) (|c2| (R)) (|Pr2| (UP)) (#8=#:G125 NIL)
          (|Pr1| (UP)) (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 16)) (QREFELT $ 17)))
          (LETT |Pr1|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT $ 18)) |p2| (QREFELT $ 19))
                 |p1| (QREFELT $ 20)))
          (LETT |Pr2|
                (PROG2
                    (LETT #8#
                          (SPADCALL |Pr1| (SPADCALL |c1| |q| (QREFELT $ 14))
                                    (QREFELT $ 21)))
                    (QCDR #8#)
                  (|check_union2| (QEQCAR #8# 0) (QREFELT $ 7)
                                  (|Union| (QREFELT $ 7) "failed") #8#)))
          (LETT |c2| (SPADCALL |Pr2| (QREFELT $ 22)))
          (LETT |r| (SPADCALL |Pr2| (QREFELT $ 23)))
          (LETT |Pr3|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |sc1|
                            (PROG1 (LETT #7# (- (- |p| |r|) 1))
                              (|check_subtype2| (>= #7# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #7#))
                            (QREFELT $ 14))
                  0 (QREFELT $ 25))
                 |p1| (QREFELT $ 19)))
          (LETT |Pr4|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |sc1|
                            (PROG1 (LETT #6# (- (- |p| |r|) 1))
                              (|check_subtype2| (>= #6# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #6#))
                            (QREFELT $ 14))
                  0 (QREFELT $ 25))
                 |Pr2| (QREFELT $ 19)))
          (LETT |Listf| (LIST |Pr3| |Pr4|))
          (COND
           ((< |r| (- |p| 1))
            (SEQ
             (LETT |Pr5|
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (|SHP;delta|
                       (PROG1 (LETT #5# (- (- |p| |r|) 1))
                         (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #5#))
                       $)
                      (SPADCALL |c2|
                                (PROG1 (LETT #4# (- (- |p| |r|) 1))
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#))
                                (QREFELT $ 14))
                      (QREFELT $ 26))
                     0 (QREFELT $ 25))
                    |Pr2| (QREFELT $ 19)))
             (LETT |Listf|
                   (SPADCALL |Listf|
                             (SPADCALL
                              (PROG1 (LETT #3# (- (- |p| |r|) 2))
                                (|check_subtype2| (>= #3# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #3#))
                              (|spadConstant| $ 27) (QREFELT $ 29))
                             (QREFELT $ 30)))
             (EXIT
              (LETT |Listf| (SPADCALL |Listf| (LIST |Pr5|) (QREFELT $ 30)))))))
          (LETT |List1|
                (COND
                 ((SPADCALL |Pr1| (|spadConstant| $ 27) (QREFELT $ 32))
                  |Listf|)
                 ('T
                  (SPADCALL (SPADCALL |p1| |Pr2| (QREFELT $ 35))
                            (QREFELT $ 36)))))
          (LETT |List2| NIL)
          (SEQ (LETT |j| 0) (LETT #2# (- |r| 1)) G190
               (COND ((|greater_SI| |j| #2#) (GO G191)))
               (SEQ
                (LETT |Pr6|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #1# (- (- |p| |j|) 1))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         $)
                        0 (QREFELT $ 25))
                       (SPADCALL |List1| (+ |j| 1) (QREFELT $ 37))
                       (QREFELT $ 19)))
                (EXIT
                 (LETT |List2|
                       (SPADCALL (LIST |Pr6|) |List2| (QREFELT $ 30)))))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |Listf| |List2| (QREFELT $ 30)))))) 

(SDEFUN |SHP;polsth2|
        ((|p1| UP) (|p| |NonNegativeInteger|) (|p2| UP)
         (|q| |NonNegativeInteger|) (|c1| R) ($ |List| UP))
        (SPROG
         ((|List2| (|List| UP)) (|Pr5| (UP)) (#1=#:G227 NIL) (|Pr4| (UP))
          (#2=#:G225 NIL) (#3=#:G233 NIL) (|j| NIL)
          (|sres| (|PrimitiveArray| UP)) (|Listf| (|List| UP)) (|Pr3| (UP))
          (|Pr2| (UP)) (|Pr1| (UP)) (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 16)) (QREFELT $ 17)))
          (LETT |Pr1|
                (SPADCALL (SPADCALL |sc1| 0 (QREFELT $ 25)) |p1|
                          (QREFELT $ 19)))
          (LETT |Pr2|
                (SPADCALL (SPADCALL |p1| (QREFELT $ 18)) |p2| (QREFELT $ 19)))
          (LETT |Pr3|
                (SPADCALL (SPADCALL |sc1| 0 (QREFELT $ 25)) |Pr2|
                          (QREFELT $ 19)))
          (LETT |Listf| (LIST |Pr1| |Pr3|))
          (LETT |sres| (SPADCALL |p1| |Pr2| (QREFELT $ 35))) (LETT |List2| NIL)
          (SEQ (LETT |j| 0) (LETT #3# (- |p| 2)) G190
               (COND ((|greater_SI| |j| #3#) (GO G191)))
               (SEQ
                (LETT |Pr4|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #2# (- (- |p| |j|) 1))
                           (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #2#))
                         $)
                        0 (QREFELT $ 25))
                       (QAREF1 |sres| |j|) (QREFELT $ 19)))
                (LETT |Pr5|
                      (PROG2 (LETT #1# (SPADCALL |Pr4| |c1| (QREFELT $ 21)))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                        (|Union| (QREFELT $ 7) "failed") #1#)))
                (EXIT
                 (LETT |List2|
                       (SPADCALL (LIST |Pr5|) |List2| (QREFELT $ 30)))))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |Listf| |List2| (QREFELT $ 30)))))) 

(SDEFUN |SHP;polsth3|
        ((|p1| UP) (|p| |NonNegativeInteger|) (|p2| UP)
         (|q| |NonNegativeInteger|) (|c1| R) ($ |List| UP))
        (SPROG
         ((|List2| (|List| UP)) (|Pr3| (UP)) (#1=#:G245 NIL) (|Pr2| (UP))
          (#2=#:G243 NIL) (#3=#:G251 NIL) (#4=#:G236 NIL) (|j| NIL)
          (|sres| (|PrimitiveArray| UP)) (|Listf| (|List| UP)) (|Pr1| (UP))
          (|v| (|NonNegativeInteger|)) (|q1| (|NonNegativeInteger|))
          (#5=#:G234 NIL) (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 16)) (QREFELT $ 17)))
          (LETT |q1|
                (PROG1 (LETT #5# (- |q| 1))
                  (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #5#)))
          (LETT |v| (+ |p| |q1|))
          (LETT |Pr1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (|SHP;delta| |q1| $)
                            (SPADCALL |sc1| (+ |q| 1) (QREFELT $ 14))
                            (QREFELT $ 26))
                  0 (QREFELT $ 25))
                 |p1| (QREFELT $ 19)))
          (LETT |Listf| (LIST |Pr1|))
          (LETT |sres|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT $ 18)) |p2| (QREFELT $ 19))
                 |p1| (QREFELT $ 35)))
          (LETT |List2| NIL)
          (SEQ (LETT |j| 0)
               (LETT #3#
                     (PROG1 (LETT #4# (- |p| 1))
                       (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #4#)))
               G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
               (SEQ
                (LETT |Pr2|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #2# (- |v| |j|))
                           (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #2#))
                         $)
                        0 (QREFELT $ 25))
                       (QAREF1 |sres| |j|) (QREFELT $ 19)))
                (LETT |Pr3|
                      (PROG2 (LETT #1# (SPADCALL |Pr2| |c1| (QREFELT $ 21)))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                        (|Union| (QREFELT $ 7) "failed") #1#)))
                (EXIT
                 (LETT |List2|
                       (SPADCALL (LIST |Pr3|) |List2| (QREFELT $ 30)))))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |Listf| |List2| (QREFELT $ 30)))))) 

(SDEFUN |SHP;SturmHabichtSequence;2UPL;5| ((|p1| UP) (|p2| UP) ($ |List| UP))
        (SPROG ((|c1| (R)) (|q| #1=(|NonNegativeInteger|)) (|p| #1#))
               (SEQ (LETT |p| (SPADCALL |p1| (QREFELT $ 23)))
                    (LETT |q| (SPADCALL |p2| (QREFELT $ 23)))
                    (LETT |c1| (SPADCALL |p1| (QREFELT $ 22)))
                    (COND
                     ((OR (SPADCALL |c1| (|spadConstant| $ 8) (QREFELT $ 38))
                          (EQL |q| 1))
                      (EXIT (|SHP;polsth1| |p1| |p| |p2| |q| |c1| $))))
                    (EXIT
                     (COND
                      ((EQL |q| 0) (|SHP;polsth2| |p1| |p| |p2| |q| |c1| $))
                      ('T (|SHP;polsth3| |p1| |p| |p2| |q| |c1| $))))))) 

(SDEFUN |SHP;SturmHabichtCoefficients;2UPL;6|
        ((|p1| UP) (|p2| UP) ($ |List| R))
        (SPROG
         ((#1=#:G254 NIL) (#2=#:G259 NIL) (|p| NIL) (#3=#:G260 NIL) (|j| NIL)
          (#4=#:G258 NIL) (|qp| (|NonNegativeInteger|)) (|List1| (|List| UP)))
         (SEQ (LETT |List1| (SPADCALL |p1| |p2| (QREFELT $ 39)))
              (LETT |qp| (LENGTH |List1|))
              (EXIT
               (PROGN
                (LETT #4# NIL)
                (SEQ (LETT |j| 1) (LETT #3# |qp|) (LETT |p| NIL)
                     (LETT #2# |List1|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL)
                           (|greater_SI| |j| #3#))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #4#
                             (CONS
                              (SPADCALL |p|
                                        (PROG1 (LETT #1# (- |qp| |j|))
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 40))
                              #4#))))
                     (LETT #2# (PROG1 (CDR #2#) (LETT |j| (|inc_SI| |j|))))
                     (GO G190) G191 (EXIT (NREVERSE #4#)))))))) 

(SDEFUN |SHP;variation| ((|Lsig| |List| R) ($ |Integer|))
        (SPROG ((|List1| (|List| R)) (|sig1| (R)) (|elt2| (R)) (|elt1| (R)))
               (SEQ
                (COND ((SPADCALL |Lsig| 1 (QREFELT $ 43)) 0)
                      (#1='T
                       (SEQ (LETT |elt1| (|SPADfirst| |Lsig|))
                            (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT $ 44)))
                            (LETT |sig1|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |elt1| |elt2| (QREFELT $ 26))
                                    (QREFELT $ 16))
                                   (QREFELT $ 17)))
                            (LETT |List1| (CDR |Lsig|))
                            (EXIT
                             (COND
                              ((SPADCALL |sig1| (|spadConstant| $ 8)
                                         (QREFELT $ 38))
                               (|SHP;variation| |List1| $))
                              (#1# (+ 1 (|SHP;variation| |List1| $))))))))))) 

(SDEFUN |SHP;permanence| ((|Lsig| |List| R) ($ |Integer|))
        (SPROG ((|List1| (|List| R)) (|sig1| (R)) (|elt2| (R)) (|elt1| (R)))
               (SEQ
                (COND ((SPADCALL |Lsig| 1 (QREFELT $ 43)) 0)
                      (#1='T
                       (SEQ (LETT |elt1| (|SPADfirst| |Lsig|))
                            (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT $ 44)))
                            (LETT |sig1|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |elt1| |elt2| (QREFELT $ 26))
                                    (QREFELT $ 16))
                                   (QREFELT $ 17)))
                            (LETT |List1| (CDR |Lsig|))
                            (EXIT
                             (COND
                              ((SPADCALL |sig1|
                                         (SPADCALL (|spadConstant| $ 8)
                                                   (QREFELT $ 10))
                                         (QREFELT $ 38))
                               (|SHP;permanence| |List1| $))
                              (#1# (+ 1 (|SHP;permanence| |List1| $))))))))))) 

(SDEFUN |SHP;qzeros| ((|Lsig| |List| R) ($ |List| R))
        (SEQ (LETT |Lsig| (REVERSE |Lsig|))
             (SEQ G190
                  (COND
                   ((NULL
                     (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| $ 24)
                               (QREFELT $ 38)))
                    (GO G191)))
                  (SEQ (EXIT (LETT |Lsig| (CDR |Lsig|)))) NIL (GO G190) G191
                  (EXIT NIL))
             (EXIT (NREVERSE |Lsig|)))) 

(SDEFUN |SHP;epsil|
        ((|int1| |NonNegativeInteger|) (|elt1| R) (|elt2| R) ($ |Integer|))
        (SPROG
         ((|ct4| (|Integer|)) (|ct3| (|NonNegativeInteger|)) (#1=#:G271 NIL)
          (|ct2| #2=(|Integer|)) (|ct1| #2#))
         (SEQ
          (COND ((OR (EQL |int1| 0) (ODDP |int1|)) 0)
                ('T
                 (SEQ
                  (LETT |ct1|
                        (COND
                         ((SPADCALL |elt1| (|spadConstant| $ 24)
                                    (QREFELT $ 45))
                          1)
                         (#3='T -1)))
                  (LETT |ct2|
                        (COND
                         ((SPADCALL |elt2| (|spadConstant| $ 24)
                                    (QREFELT $ 45))
                          1)
                         (#3# -1)))
                  (LETT |ct3|
                        (PROG2 (LETT #1# (SPADCALL |int1| 2 (QREFELT $ 13)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                          (|Union| (|NonNegativeInteger|)
                                                   "failed")
                                          #1#)))
                  (LETT |ct4| (* |ct1| |ct2|))
                  (EXIT (* (EXPT -1 |ct3|) |ct4|)))))))) 

(SDEFUN |SHP;numbnce| ((|Lsig| |List| R) ($ |NonNegativeInteger|))
        (COND
         ((OR (NULL |Lsig|)
              (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| $ 24)
                        (QREFELT $ 38)))
          0)
         ('T (+ 1 (|SHP;numbnce| (CDR |Lsig|) $))))) 

(SDEFUN |SHP;numbce| ((|Lsig| |List| R) ($ |NonNegativeInteger|))
        (COND
         ((OR (NULL |Lsig|)
              (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| $ 24)
                        (QREFELT $ 46)))
          0)
         ('T (+ 1 (|SHP;numbce| (CDR |Lsig|) $))))) 

(SDEFUN |SHP;wfunctaux| ((|Lsig| . #1=(|List| R)) ($ |Integer|))
        (SPROG
         ((|ind4| (|Integer|)) (|ind3| (|Integer|)) (|ind2| (|Integer|))
          (|List1| #1#) (#2=#:G289 NIL) (|j| NIL)
          (|cont2| (|NonNegativeInteger|)) (|List2| (|List| R)) (#3=#:G288 NIL)
          (|cont1| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |Lsig|) 0)
                ('T
                 (SEQ (LETT |List2| NIL) (LETT |List1| |Lsig|)
                      (LETT |cont1| (|SHP;numbnce| |List1| $))
                      (SEQ (LETT |j| 1) (LETT #3# |cont1|) G190
                           (COND ((|greater_SI| |j| #3#) (GO G191)))
                           (SEQ
                            (LETT |List2|
                                  (SPADCALL |List2|
                                            (LIST (|SPADfirst| |List1|))
                                            (QREFELT $ 47)))
                            (EXIT (LETT |List1| (CDR |List1|))))
                           (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                      (LETT |ind2| 0) (LETT |cont2| (|SHP;numbce| |List1| $))
                      (SEQ (LETT |j| 1) (LETT #2# |cont2|) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ (EXIT (LETT |List1| (CDR |List1|))))
                           (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                      (COND
                       ((SPADCALL |cont2| 0 (QREFELT $ 48))
                        (LETT |ind2|
                              (|SHP;epsil| |cont2|
                               (SPADCALL |List2| (QREFELT $ 49))
                               (|SPADfirst| |List1|) $))))
                      (LETT |ind3|
                            (- (|SHP;permanence| |List2| $)
                               (|SHP;variation| |List2| $)))
                      (LETT |ind4| (+ |ind2| |ind3|))
                      (EXIT (+ |ind4| (|SHP;wfunctaux| |List1| $))))))))) 

(SDEFUN |SHP;wfunct| ((|Lsig| |List| R) ($ |Integer|))
        (SPROG ((|List1| (|List| R)))
               (SEQ (LETT |List1| (|SHP;qzeros| |Lsig| $))
                    (EXIT (|SHP;wfunctaux| |List1| $))))) 

(SDEFUN |SHP;SturmHabicht;2UPI;15| ((|p1| UP) (|p2| UP) ($ |Integer|))
        (SPROG
         ((#1=#:G297 NIL) (|p| NIL) (#2=#:G296 NIL) (|List1| (|List| UP)))
         (SEQ
          (COND
           ((OR (SPADCALL |p2| (|spadConstant| $ 27) (QREFELT $ 32))
                (EQL (SPADCALL |p1| (QREFELT $ 23)) 0))
            0)
           ('T
            (SEQ (LETT |List1| (SPADCALL |p1| |p2| (QREFELT $ 39)))
                 (EXIT
                  (|SHP;wfunct|
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |p| NIL) (LETT #1# |List1|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS (SPADCALL |p| (QREFELT $ 22)) #2#))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   $)))))))) 

(SDEFUN |SHP;countRealRoots;UPI;16| ((|p1| UP) ($ |Integer|))
        (SPADCALL |p1| (|spadConstant| $ 9) (QREFELT $ 50))) 

(SDEFUN |SHP;SturmHabichtMultiple;2UPI;17| ((|p1| UP) (|p2| UP) ($ |Integer|))
        (SPROG
         ((#1=#:G322 NIL) (|f| NIL) (#2=#:G321 NIL)
          (|sqfr|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (SH (|List| UP)) (|ans| (|Integer|)) (#3=#:G299 NIL) (#4=#:G319 NIL)
          (|p| NIL) (#5=#:G320 NIL) (|j| NIL) (#6=#:G318 NIL)
          (|qp| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR (SPADCALL |p2| (|spadConstant| $ 27) (QREFELT $ 32))
                (EQL (SPADCALL |p1| (QREFELT $ 23)) 0))
            0)
           ('T
            (SEQ (LETT SH (SPADCALL |p1| |p2| (QREFELT $ 39)))
                 (LETT |qp| (LENGTH SH))
                 (LETT |ans|
                       (|SHP;wfunct|
                        (PROGN
                         (LETT #6# NIL)
                         (SEQ (LETT |j| 1) (LETT #5# |qp|) (LETT |p| NIL)
                              (LETT #4# SH) G190
                              (COND
                               ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL)
                                    (|greater_SI| |j| #5#))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS
                                       (SPADCALL |p|
                                                 (PROG1 (LETT #3# (- |qp| |j|))
                                                   (|check_subtype2| (>= #3# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #3#))
                                                 (QREFELT $ 40))
                                       #6#))))
                              (LETT #4#
                                    (PROG1 (CDR #4#)
                                      (LETT |j| (|inc_SI| |j|))))
                              (GO G190) G191 (EXIT (NREVERSE #6#))))
                        $))
                 (LETT SH (REVERSE SH))
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL (|SPADfirst| SH) (|spadConstant| $ 27)
                                   (QREFELT $ 32)))
                        (GO G191)))
                      (SEQ (EXIT (LETT SH (CDR SH)))) NIL (GO G190) G191
                      (EXIT NIL))
                 (EXIT
                  (COND
                   ((EQL (SPADCALL (|SPADfirst| SH) (QREFELT $ 23)) 0) |ans|)
                   ((QEQCAR
                     (SPADCALL (SPADCALL |p1| (QREFELT $ 18)) (|SPADfirst| SH)
                               (QREFELT $ 52))
                     0)
                    (+ |ans| (SPADCALL (|SPADfirst| SH) |p2| (QREFELT $ 53))))
                   ('T
                    (SEQ
                     (LETT |sqfr|
                           (SPADCALL (SPADCALL |p1| (QREFELT $ 55))
                                     (QREFELT $ 60)))
                     (COND
                      ((EQL (LENGTH |sqfr|) 1)
                       (COND
                        ((EQL (QVELT (|SPADfirst| |sqfr|) 2) 1)
                         (EXIT |ans|)))))
                     (EXIT
                      (SPADCALL (ELT $ 62)
                                (PROGN
                                 (LETT #2# NIL)
                                 (SEQ (LETT |f| NIL) (LETT #1# |sqfr|) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN (LETT |f| (CAR #1#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (SPADCALL (QVELT |f| 2)
                                                         (SPADCALL
                                                          (QVELT |f| 1) |p2|
                                                          (QREFELT $ 50))
                                                         (QREFELT $ 61))
                                               #2#))))
                                      (LETT #1# (CDR #1#)) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                (QREFELT $ 65))))))))))))) 

(SDEFUN |SHP;countRealRootsMultiple;UPI;18| ((|p1| UP) ($ |Integer|))
        (SPADCALL |p1| (|spadConstant| $ 9) (QREFELT $ 53))) 

(DECLAIM (NOTINLINE |SturmHabichtPackage;|)) 

(DEFUN |SturmHabichtPackage| (&REST #1=#:G324)
  (SPROG NIL
         (PROG (#2=#:G325)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SturmHabichtPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SturmHabichtPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SturmHabichtPackage|)))))))))) 

(DEFUN |SturmHabichtPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|SturmHabichtPackage| DV$1 DV$2))
          (LETT $ (GETREFV 67))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))))))
          (|haddProp| |$ConstructorCache| '|SturmHabichtPackage|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 53
                       (CONS
                        (|dispatchFunction| |SHP;SturmHabichtMultiple;2UPI;17|)
                        $))
             (QSETREFV $ 66
                       (CONS
                        (|dispatchFunction|
                         |SHP;countRealRootsMultiple;UPI;18|)
                        $)))))
          $))) 

(MAKEPROP '|SturmHabichtPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (8 . -) (|Union| $ '"failed") (|NonNegativeInteger|)
              (13 . |exquo|) (19 . ^) (|Integer|) (25 . |sign|) (30 . |coerce|)
              (35 . |differentiate|) (40 . *) (46 . |pseudoRemainder|)
              (52 . |exquo|) (58 . |leadingCoefficient|) (63 . |degree|)
              (68 . |Zero|) (72 . |monomial|) (78 . *) (84 . |Zero|) (|List| 7)
              (88 . |new|) (94 . |append|) (|Boolean|) (100 . =)
              (|PrimitiveArray| 7) (|SubResultantPackage| 6 7)
              (106 . |subresultantVector|) (112 . |parts|) (117 . |elt|)
              (123 . =) |SHP;SturmHabichtSequence;2UPL;5| (129 . |coefficient|)
              (|List| 6) |SHP;SturmHabichtCoefficients;2UPL;6| (135 . |size?|)
              (141 . |elt|) (147 . >) (153 . ~=) (159 . |append|) (165 . >)
              (171 . |last|) |SHP;SturmHabicht;2UPI;15|
              |SHP;countRealRoots;UPI;16| (176 . |exquo|)
              (182 . |SturmHabichtMultiple|) (|Factored| $)
              (188 . |squareFree|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 56) (|:| |factor| 7) (|:| |exponent| 12))
              (|List| 57) (|Factored| 7) (193 . |factorList|) (198 . *)
              (204 . +) (|Mapping| 15 15 15) (|List| 15) (210 . |reduce|)
              (216 . |countRealRootsMultiple|))
           '#(|countRealRootsMultiple| 221 |countRealRoots| 226
              |SturmHabichtSequence| 231 |SturmHabichtMultiple| 237
              |SturmHabichtCoefficients| 243 |SturmHabicht| 249)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 66
                                                 '(0 6 0 8 0 7 0 9 1 6 0 0 10 2
                                                   12 11 0 0 13 2 6 0 0 12 14 1
                                                   6 15 0 16 1 6 0 15 17 1 7 0
                                                   0 18 2 7 0 0 0 19 2 7 0 0 0
                                                   20 2 7 11 0 6 21 1 7 6 0 22
                                                   1 7 12 0 23 0 6 0 24 2 7 0 6
                                                   12 25 2 6 0 0 0 26 0 7 0 27
                                                   2 28 0 12 7 29 2 28 0 0 0 30
                                                   2 7 31 0 0 32 2 34 33 7 7 35
                                                   1 33 28 0 36 2 28 7 0 15 37
                                                   2 6 31 0 0 38 2 7 6 0 12 40
                                                   2 41 31 0 12 43 2 41 6 0 15
                                                   44 2 6 31 0 0 45 2 6 31 0 0
                                                   46 2 41 0 0 0 47 2 12 31 0 0
                                                   48 1 41 6 0 49 2 7 11 0 0 52
                                                   2 0 15 7 7 53 1 7 54 0 55 1
                                                   59 58 0 60 2 15 0 12 0 61 2
                                                   15 0 0 0 62 2 64 15 63 0 65
                                                   1 0 15 7 66 1 1 15 7 66 1 0
                                                   15 7 51 2 0 28 7 7 39 2 1 15
                                                   7 7 53 2 0 41 7 7 42 2 0 15
                                                   7 7 50)))))
           '|lookupComplete|)) 
