
(DEFUN |FMONOID;One;$;1| ($) (SPADCALL (QREFELT $ 9))) 

(DEFUN |FMONOID;one?;$B;2| (|f| $) (NULL (SPADCALL |f| (QREFELT $ 12)))) 

(DEFUN |FMONOID;coerce;$Of;3| (|f| $)
  (SPADCALL |f| (ELT $ 16) (ELT $ 17) 1 (QREFELT $ 20))) 

(DEFUN |FMONOID;hcrf;3$;4| (|f| |g| $)
  (SPADCALL
   (SPADCALL (SPADCALL |f| (QREFELT $ 22)) (SPADCALL |g| (QREFELT $ 22))
             (QREFELT $ 23))
   (QREFELT $ 24))) 

(DEFUN |FMONOID;*;$S$;5| (|f| |s| $) (SPADCALL |f| |s| (QREFELT $ 26))) 

(DEFUN |FMONOID;*;S2$;6| (|s| |f| $) (SPADCALL |s| |f| (QREFELT $ 28))) 

(DEFUN |FMONOID;factors;$L;7| (|f| $)
  (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 30))) 

(DEFUN |FMONOID;mapExpon;M2$;8| (|f| |x| $) (SPADCALL |f| |x| (QREFELT $ 33))) 

(DEFUN |FMONOID;mapGen;M2$;9| (|f| |x| $) (SPADCALL |f| |x| (QREFELT $ 36))) 

(DEFUN |FMONOID;^;SNni$;10| (|s| |n| $) (SPADCALL |s| |n| (QREFELT $ 39))) 

(DEFUN |FMONOID;*;3$;11| (|f| |g| $)
  (PROG (|h| |ls| |lf| |lg|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |f| (|spadConstant| $ 7) (QREFELT $ 41)) |g|)
            ((SPADCALL |g| (|spadConstant| $ 7) (QREFELT $ 41)) |f|)
            (#1='T
             (SEQ
              (LETT |lg| (SPADCALL |g| (QREFELT $ 12))
                    . #2=(|FMONOID;*;3$;11|))
              (LETT |ls|
                    (SPADCALL (LETT |lf| (SPADCALL |f| (QREFELT $ 12)) . #2#)
                              (QREFELT $ 42))
                    . #2#)
              (EXIT
               (COND
                ((SPADCALL (QCAR |ls|) (QCAR (|SPADfirst| |lg|))
                           (QREFELT $ 43))
                 (SEQ
                  (SPADCALL (LETT |h| (SPADCALL |lf| (QREFELT $ 30)) . #2#)
                            (CONS (QCAR (|SPADfirst| |lg|))
                                  (+ (QCDR (|SPADfirst| |lg|)) (QCDR |ls|)))
                            (QREFELT $ 44))
                  (EXIT
                   (SPADCALL (SPADCALL |h| (CDR |lg|) (QREFELT $ 45))
                             (QREFELT $ 46)))))
                (#1#
                 (SPADCALL (SPADCALL |lf| |lg| (QREFELT $ 45))
                           (QREFELT $ 46)))))))))))) 

(DEFUN |FMONOID;overlap;2$R;12| (|la| |ar| $)
  (PROG (|lla| |l| #1=#:G169 |m| #2=#:G158 |ru| #3=#:G152 |lar| |la0|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL |la| (|spadConstant| $ 7) (QREFELT $ 41))
             (SPADCALL |ar| (|spadConstant| $ 7) (QREFELT $ 41)))
         (VECTOR |la| (|spadConstant| $ 7) |ar|))
        ('T
         (SEQ
          (LETT |lla|
                (LETT |la0| (SPADCALL |la| (QREFELT $ 12))
                      . #4=(|FMONOID;overlap;2$R;12|))
                . #4#)
          (LETT |lar| (SPADCALL |ar| (QREFELT $ 12)) . #4#)
          (LETT |l| NIL . #4#)
          (SEQ G190
               (COND ((NULL (COND ((NULL |lla|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (COND
                 ((SPADCALL (QCAR (|SPADfirst| |lla|))
                            (QCAR (|SPADfirst| |lar|)) (QREFELT $ 43))
                  (SEQ
                   (COND
                    ((< (QCDR (|SPADfirst| |lla|)) (QCDR (|SPADfirst| |lar|)))
                     (COND
                      ((NULL (CDR |lla|))
                       (PROGN
                        (LETT #1#
                              (VECTOR (SPADCALL |l| (QREFELT $ 46))
                                      (SPADCALL (QCAR (|SPADfirst| |lla|))
                                                (QCDR (|SPADfirst| |lla|))
                                                (QREFELT $ 39))
                                      (SPADCALL
                                       (CONS
                                        (CONS (QCAR (|SPADfirst| |lar|))
                                              (PROG1
                                                  (LETT #3#
                                                        (-
                                                         (QCDR
                                                          (|SPADfirst| |lar|))
                                                         (QCDR
                                                          (|SPADfirst| |lla|)))
                                                        . #4#)
                                                (|check_subtype| (>= #3# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #3#)))
                                        (CDR |lar|))
                                       (QREFELT $ 46)))
                              . #4#)
                        (GO #1#))))))
                   (EXIT
                    (COND
                     ((>= (QCDR (|SPADfirst| |lla|))
                          (QCDR (|SPADfirst| |lar|)))
                      (SEQ
                       (LETT |ru|
                             (SPADCALL (SPADCALL (CDR |lar|) (QREFELT $ 46))
                                       (SPADCALL (CDR |lla|) (QREFELT $ 46))
                                       (QREFELT $ 49))
                             . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR |ru| 0)
                          (SEQ
                           (COND
                            ((SPADCALL (QCDR (|SPADfirst| |lla|))
                                       (QCDR (|SPADfirst| |lar|))
                                       (QREFELT $ 50))
                             (SEQ
                              (LETT |l|
                                    (SPADCALL |l|
                                              (CONS (QCAR (|SPADfirst| |lla|))
                                                    (PROG1
                                                        (LETT #2#
                                                              (-
                                                               (QCDR
                                                                (|SPADfirst|
                                                                 |lla|))
                                                               (QCDR
                                                                (|SPADfirst|
                                                                 |lar|)))
                                                              . #4#)
                                                      (|check_subtype|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#)))
                                              (QREFELT $ 51))
                                    . #4#)
                              (EXIT
                               (LETT |m|
                                     (CONS
                                      (CONS (QCAR (|SPADfirst| |lla|))
                                            (QCDR (|SPADfirst| |lar|)))
                                      (CDR |lla|))
                                     . #4#))))
                            ('T (LETT |m| |lla| . #4#)))
                           (EXIT
                            (PROGN
                             (LETT #1#
                                   (VECTOR (SPADCALL |l| (QREFELT $ 46))
                                           (SPADCALL |m| (QREFELT $ 46))
                                           (QCDR |ru|))
                                   . #4#)
                             (GO #1#))))))))))))))
                (LETT |l| (SPADCALL |l| (|SPADfirst| |lla|) (QREFELT $ 51))
                      . #4#)
                (EXIT (LETT |lla| (CDR |lla|) . #4#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (VECTOR (SPADCALL |la0| (QREFELT $ 46)) (|spadConstant| $ 7)
                   (SPADCALL |lar| (QREFELT $ 46))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FMONOID;divide;2$U;13| (|lar| |a| $)
  (PROG (|Nlar| |llar| |l| #1=#:G186 #2=#:G193 #3=#:G180 |q| |Na| |la|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |a| (|spadConstant| $ 7) (QREFELT $ 41))
         (CONS 0 (CONS |lar| (|spadConstant| $ 7))))
        ('T
         (SEQ
          (LETT |Na|
                (LENGTH
                 (LETT |la| (SPADCALL |a| (QREFELT $ 12))
                       . #4=(|FMONOID;divide;2$U;13|)))
                . #4#)
          (LETT |Nlar|
                (LENGTH (LETT |llar| (SPADCALL |lar| (QREFELT $ 12)) . #4#))
                . #4#)
          (LETT |l| NIL . #4#)
          (SEQ G190
               (COND ((NULL (SPADCALL |Na| |Nlar| (QREFELT $ 54))) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (QCAR (|SPADfirst| |llar|))
                              (QCAR (|SPADfirst| |la|)) (QREFELT $ 43))
                    (COND
                     ((>= (QCDR (|SPADfirst| |llar|))
                          (QCDR (|SPADfirst| |la|)))
                      (SEQ
                       (LETT |q|
                             (SPADCALL (SPADCALL (CDR |llar|) (QREFELT $ 46))
                                       (SPADCALL (CDR |la|) (QREFELT $ 46))
                                       (QREFELT $ 49))
                             . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR |q| 0)
                          (PROGN
                           (LETT #1#
                                 (SEQ
                                  (COND
                                   ((SPADCALL (QCDR (|SPADfirst| |llar|))
                                              (QCDR (|SPADfirst| |la|))
                                              (QREFELT $ 50))
                                    (LETT |l|
                                          (SPADCALL |l|
                                                    (CONS
                                                     (QCAR (|SPADfirst| |la|))
                                                     (PROG1
                                                         (LETT #3#
                                                               (-
                                                                (QCDR
                                                                 (|SPADfirst|
                                                                  |llar|))
                                                                (QCDR
                                                                 (|SPADfirst|
                                                                  |la|)))
                                                               . #4#)
                                                       (|check_subtype|
                                                        (>= #3# 0)
                                                        '(|NonNegativeInteger|)
                                                        #3#)))
                                                    (QREFELT $ 51))
                                          . #4#)))
                                  (EXIT
                                   (PROGN
                                    (LETT #2#
                                          (CONS 0
                                                (CONS
                                                 (SPADCALL |l| (QREFELT $ 46))
                                                 (QCDR |q|)))
                                          . #4#)
                                    (GO #2#))))
                                 . #4#)
                           (GO #1#))))))))))
                  (LETT |l| (SPADCALL |l| (|SPADfirst| |llar|) (QREFELT $ 51))
                        . #4#)
                  (LETT |llar| (CDR |llar|) . #4#)
                  (EXIT (LETT |Nlar| (- |Nlar| 1) . #4#))))
                #1# (EXIT #1#))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS 1 "failed"))))))
      #2# (EXIT #2#))))) 

(DEFUN |FMONOID;hclf;3$;14| (|f| |g| $)
  (PROG (#1=#:G195 #2=#:G199 |h| #3=#:G200 |f0| #4=#:G201 |g0|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |h| NIL . #5=(|FMONOID;hclf;3$;14|))
            (SEQ (LETT |g0| NIL . #5#)
                 (LETT #4# (SPADCALL |g| (QREFELT $ 12)) . #5#)
                 (LETT |f0| NIL . #5#)
                 (LETT #3# (SPADCALL |f| (QREFELT $ 12)) . #5#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |f0| (CAR #3#) . #5#) NIL)
                       (ATOM #4#) (PROGN (LETT |g0| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (QCAR |f0|) (QCAR |g0|) (QREFELT $ 58))
                     (PROGN
                      (LETT #2# (SPADCALL |h| (QREFELT $ 46)) . #5#)
                      (GO #2#)))
                    ('T
                     (SEQ
                      (EXIT
                       (SEQ
                        (LETT |h|
                              (SPADCALL |h|
                                        (CONS (QCAR |f0|)
                                              (MIN (QCDR |f0|) (QCDR |g0|)))
                                        (QREFELT $ 51))
                              . #5#)
                        (EXIT
                         (COND
                          ((SPADCALL (QCDR |f0|) (QCDR |g0|) (QREFELT $ 59))
                           (PROGN
                            (LETT #1#
                                  (PROGN
                                   (LETT #2# (SPADCALL |h| (QREFELT $ 46))
                                         . #5#)
                                   (GO #2#))
                                  . #5#)
                            (GO #1#)))))))
                      #1# (EXIT #1#))))))
                 (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #5#)) . #5#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |h| (QREFELT $ 46)))))
      #2# (EXIT #2#))))) 

(DEFUN |FMONOID;lquo;2$U;15| (|aq| |a| $)
  (PROG (#1=#:G209 |laq| #2=#:G215 #3=#:G216 |a0|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |a| (QREFELT $ 60))
                   (LENGTH
                    (LETT |laq|
                          (SPADCALL (SPADCALL |aq| (QREFELT $ 12))
                                    (QREFELT $ 30))
                          . #4=(|FMONOID;lquo;2$U;15|)))
                   (QREFELT $ 50))
         (CONS 1 "failed"))
        ('T
         (SEQ
          (SEQ (LETT |a0| NIL . #4#)
               (LETT #3# (SPADCALL |a| (QREFELT $ 12)) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |a0| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((OR
                    (SPADCALL (QCAR |a0|) (QCAR (|SPADfirst| |laq|))
                              (QREFELT $ 58))
                    (SPADCALL (QCDR |a0|) (QCDR (|SPADfirst| |laq|))
                              (QREFELT $ 50)))
                   (PROGN (LETT #2# (CONS 1 "failed") . #4#) (GO #2#)))
                  ((EQL (QCDR |a0|) (QCDR (|SPADfirst| |laq|)))
                   (LETT |laq| (CDR |laq|) . #4#))
                  ('T
                   (SPADCALL |laq|
                             (CONS (QCAR (|SPADfirst| |laq|))
                                   (PROG1
                                       (LETT #1#
                                             (- (QCDR (|SPADfirst| |laq|))
                                                (QCDR |a0|))
                                             . #4#)
                                     (|check_subtype| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      #1#)))
                             (QREFELT $ 61))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS 0 (SPADCALL |laq| (QREFELT $ 46))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FMONOID;rquo;2$U;16| (|qa| |a| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u|
            (SPADCALL (SPADCALL |qa| (QREFELT $ 22))
                      (SPADCALL |a| (QREFELT $ 22)) (QREFELT $ 49))
            |FMONOID;rquo;2$U;16|)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 24)))))))))) 

(DEFUN |FMONOID;<;2$B;17| (|a| |b| $)
  (PROG (|na| |la| |lb| #1=#:G230 |nb| #2=#:G227 #3=#:G239)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |la| (SPADCALL |a| (QREFELT $ 12)) . #4=(|FMONOID;<;2$B;17|))
            (LETT |lb| (SPADCALL |b| (QREFELT $ 12)) . #4#)
            (LETT |na| (LENGTH |la|) . #4#) (LETT |nb| (LENGTH |lb|) . #4#)
            (SEQ G190
                 (COND
                  ((NULL
                    (COND
                     ((SPADCALL |na| 0 (QREFELT $ 63))
                      (SPADCALL |nb| 0 (QREFELT $ 63)))
                     ('T 'NIL)))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (QCAR (|SPADfirst| |la|))
                               (QCAR (|SPADfirst| |lb|)) (QREFELT $ 64))
                     (PROGN (LETT #3# 'NIL . #4#) (GO #3#)))
                    ((SPADCALL (QCAR (|SPADfirst| |la|))
                               (QCAR (|SPADfirst| |lb|)) (QREFELT $ 65))
                     (PROGN (LETT #3# 'T . #4#) (GO #3#)))
                    ((EQL (QCDR (|SPADfirst| |la|)) (QCDR (|SPADfirst| |lb|)))
                     (SEQ (LETT |la| (CDR |la|) . #4#)
                          (LETT |lb| (CDR |lb|) . #4#)
                          (LETT |na| (- |na| 1) . #4#)
                          (EXIT (LETT |nb| (- |nb| 1) . #4#))))
                    ((SPADCALL (QCDR (|SPADfirst| |la|))
                               (QCDR (|SPADfirst| |lb|)) (QREFELT $ 50))
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
                      (LETT |lb| (CDR |lb|) . #4#)
                      (EXIT (LETT |nb| (- |nb| 1) . #4#))))
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
                      (LETT |la| (CDR |la|) . #4#)
                      (EXIT (LETT |na| (- |na| 1) . #4#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND ((NULL |la|) (COND ((NULL |lb|) 'NIL) (#5='T 'T)))
                   (#5# 'NIL)))))
      #3# (EXIT #3#))))) 

(DECLAIM (NOTINLINE |FreeMonoid;|)) 

(DEFUN |FreeMonoid| (#1=#:G243)
  (PROG ()
    (RETURN
     (PROG (#2=#:G244)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|FreeMonoid|)
                                           '|domainEqualList|)
                . #3=(|FreeMonoid|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|FreeMonoid;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|FreeMonoid|))))))))))) 

(DEFUN |FreeMonoid;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FreeMonoid|))
      (LETT |dv$| (LIST '|FreeMonoid| DV$1) . #1#)
      (LETT $ (GETREFV 72) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|OrderedSet|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|FreeMonoid| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|ListMonoidOps| |#1| (|NonNegativeInteger|) 1))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 66 (CONS (|dispatchFunction| |FMONOID;<;2$B;17|) $))))
      $)))) 

(MAKEPROP '|FreeMonoid| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|ListMonoidOps| 6 38 (NRTEVAL 1))
              (|local| |#1|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FMONOID;One;$;1|) $))
              '|Rep| (0 . |makeUnit|) (|Record| (|:| |gen| 6) (|:| |exp| 38))
              (|List| 10) (4 . |listOfMonoms|) (|Boolean|) |FMONOID;one?;$B;2|
              (|OutputForm|) (9 . *) (15 . ^) (|Mapping| 15 15 15) (|Integer|)
              (21 . |outputForm|) |FMONOID;coerce;$Of;3| (29 . |reverse|)
              |FMONOID;hclf;3$;14| (34 . |reverse!|) |FMONOID;hcrf;3$;4|
              (39 . |rightMult|) |FMONOID;*;$S$;5| (45 . |leftMult|)
              |FMONOID;*;S2$;6| (51 . |copy|) |FMONOID;factors;$L;7|
              (|Mapping| 38 38) (56 . |mapExpon|) |FMONOID;mapExpon;M2$;8|
              (|Mapping| 6 6) (62 . |mapGen|) |FMONOID;mapGen;M2$;9|
              (|NonNegativeInteger|) (68 . |makeTerm|) |FMONOID;^;SNni$;10|
              (74 . =) (80 . |last|) (85 . =) (91 . |setlast!|) (97 . |concat|)
              (103 . |makeMulti|) |FMONOID;*;3$;11| (|Union| $ '"failed")
              |FMONOID;lquo;2$U;15| (108 . >) (114 . |concat!|)
              (|Record| (|:| |lm| $) (|:| |mm| $) (|:| |rm| $))
              |FMONOID;overlap;2$R;12| (120 . <=)
              (|Record| (|:| |lm| $) (|:| |rm| $)) (|Union| 55 '"failed")
              |FMONOID;divide;2$U;13| (126 . ~=) (132 . ~=) (138 . |size|)
              (143 . |setfirst!|) |FMONOID;rquo;2$U;16| (149 . >) (155 . >)
              (161 . <) (167 . <) (|Union| 6 '"failed") (|PositiveInteger|)
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 173 |smaller?| 179 |size| 185 |sample| 190 |rquo| 194
              |retractIfCan| 200 |retract| 205 |recip| 210 |overlap| 215 |one?|
              221 |nthFactor| 226 |nthExpon| 232 |min| 238 |max| 244 |mapGen|
              250 |mapExpon| 256 |lquo| 262 |latex| 268 |hcrf| 273 |hclf| 279
              |hashUpdate!| 285 |hash| 291 |factors| 296 |divide| 301 |coerce|
              307 ^ 317 |One| 335 >= 339 > 345 = 351 <= 357 < 363 * 369)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 1 0 1 0 0 0 0 1))
                 (CONS
                  '#(|Monoid&| |OrderedSet&| |SemiGroup&| NIL |SetCategory&|
                     |BasicType&| |RetractableTo&| NIL |PartialOrder&|)
                  (CONS
                   '#((|Monoid|) (|OrderedSet|) (|SemiGroup|) (|Comparable|)
                      (|SetCategory|) (|BasicType|) (|RetractableTo| 6)
                      (|CoercibleTo| 15) (|PartialOrder|))
                   (|makeByteWordVec2| 71
                                       '(0 8 0 9 1 8 11 0 12 2 15 0 0 0 16 2 15
                                         0 0 0 17 4 8 15 0 18 18 19 20 1 8 0 0
                                         22 1 8 0 0 24 2 8 0 0 6 26 2 8 0 6 0
                                         28 1 11 0 0 30 2 8 0 32 0 33 2 8 0 35
                                         0 36 2 8 0 6 38 39 2 0 13 0 0 41 1 11
                                         10 0 42 2 6 13 0 0 43 2 11 10 0 10 44
                                         2 11 0 0 0 45 1 8 0 11 46 2 38 13 0 0
                                         50 2 11 0 0 10 51 2 19 13 0 0 54 2 6
                                         13 0 0 58 2 38 13 0 0 59 1 0 38 0 60 2
                                         11 10 0 10 61 2 19 13 0 0 63 2 6 13 0
                                         0 64 2 6 13 0 0 65 2 0 13 0 0 66 2 0
                                         13 0 0 1 2 1 13 0 0 1 1 0 38 0 60 0 0
                                         0 1 2 0 48 0 0 62 1 0 67 0 1 1 0 6 0 1
                                         1 0 48 0 1 2 0 52 0 0 53 1 0 13 0 14 2
                                         0 6 0 19 1 2 0 38 0 19 1 2 1 0 0 0 1 2
                                         1 0 0 0 1 2 0 0 35 0 37 2 0 0 32 0 34
                                         2 0 48 0 0 49 1 0 69 0 1 2 0 0 0 0 25
                                         2 0 0 0 0 23 2 0 71 71 0 1 1 0 70 0 1
                                         1 0 11 0 31 2 0 56 0 0 57 1 0 0 6 1 1
                                         0 15 0 21 2 0 0 6 38 40 2 0 0 0 38 1 2
                                         0 0 0 68 1 0 0 0 7 2 1 13 0 0 1 2 1 13
                                         0 0 1 2 0 13 0 0 41 2 1 13 0 0 1 2 1
                                         13 0 0 66 2 0 0 0 6 27 2 0 0 6 0 29 2
                                         0 0 0 0 47)))))
           '|lookupComplete|)) 
