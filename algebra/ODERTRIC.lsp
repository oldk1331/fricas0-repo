
(/VERSIONCHECK 2) 

(DEFUN |ODERTRIC;UP2SUP| (|p| $) (SPADCALL (ELT $ 12) |p| (QREFELT $ 16))) 

(DEFUN |ODERTRIC;logDerOnly| (|l| $)
  (PROG (#1=#:G140 |s| #2=#:G139)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|ODERTRIC;logDerOnly|))
       (SEQ (LETT |s| NIL . #3#)
            (LETT #1#
                  (QCDR (SPADCALL |l| (|spadConstant| $ 20) (QREFELT $ 25)))
                  . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS
                     (SPADCALL (SPADCALL |s| (QREFELT $ 26)) |s|
                               (QREFELT $ 27))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |ODERTRIC;ricDsolve;LodoML;3| (|l| |zeros| $)
  (SPADCALL |l| |zeros| (ELT $ 29) (QREFELT $ 34))) 

(DEFUN |ODERTRIC;ricDsolve;LodoML;4| (|l| |zeros| $)
  (SPADCALL |l| |zeros| (ELT $ 29) (QREFELT $ 36))) 

(DEFUN |ODERTRIC;singRicDE;LodoML;5| (|l| |ezfactor| $)
  (SPADCALL |l| (CONS (|function| |ODERTRIC;solveModulo|) $) |ezfactor|
            (QREFELT $ 42))) 

(DEFUN |ODERTRIC;ricDsolve;LodoMML;6| (|l| |zeros| |ezfactor| $)
  (SPADCALL (QCAR (SPADCALL |l| NIL (QREFELT $ 46))) |zeros| |ezfactor|
            (QREFELT $ 36))) 

(DEFUN |ODERTRIC;mapeval| (|p| |ls| |lv| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|ODERTRIC;mapeval!0| (VECTOR $ |lv| |ls|)) |p|
               (QREFELT $ 53))))) 

(DEFUN |ODERTRIC;mapeval!0| (|z| $$)
  (PROG (|ls| |lv| $)
    (LETT |ls| (QREFELT $$ 2) . #1=(|ODERTRIC;mapeval|))
    (LETT |lv| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |z| |ls| |lv| (QREFELT $ 49)) (QREFELT $ 50)))))) 

(DEFUN |ODERTRIC;FifCan| (|f| $)
  (PROG (#1=#:G159 |d| |n|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR
         (LETT |n| (SPADCALL (SPADCALL |f| (QREFELT $ 55)) (QREFELT $ 57))
               . #2=(|ODERTRIC;FifCan|))
         0)
        (COND
         ((QEQCAR
           (LETT |d| (SPADCALL (SPADCALL |f| (QREFELT $ 58)) (QREFELT $ 57))
                 . #2#)
           0)
          (EXIT
           (CONS 0
                 (SPADCALL
                  (PROG2 (LETT #1# |n| . #2#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                  (PROG2 (LETT #1# |d| . #2#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                  (QREFELT $ 59))))))))
      (EXIT (CONS 1 "failed")))))) 

(DEFUN |ODERTRIC;genericPolynomial| (|s| |n| $)
  (PROG (|l| |ans| |sy| |i|)
    (RETURN
     (SEQ
      (LETT |ans| (|spadConstant| $ 60) . #1=(|ODERTRIC;genericPolynomial|))
      (LETT |l| NIL . #1#)
      (SEQ (LETT |i| 0 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ
            (LETT |ans|
                  (SPADCALL |ans|
                            (SPADCALL
                             (SPADCALL
                              (LETT |sy| (SPADCALL |s| (QREFELT $ 61)) . #1#)
                              (QREFELT $ 62))
                             |i| (QREFELT $ 64))
                            (QREFELT $ 65))
                  . #1#)
            (EXIT (LETT |l| (CONS |sy| |l|) . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |ans| (NREVERSE |l|))))))) 

(DEFUN |ODERTRIC;ratsln| (|l| $)
  (PROG (|ls| |lv| #1=#:G182 #2=#:G185 |v| |u| #3=#:G186 |eq|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |ls| NIL . #4=(|ODERTRIC;ratsln|)) (LETT |lv| NIL . #4#)
            (SEQ (LETT |eq| NIL . #4#) (LETT #3# |l| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |eq| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ
                     (LETT |u|
                           (|ODERTRIC;FifCan| (SPADCALL |eq| (QREFELT $ 67)) $)
                           . #4#)
                     (EXIT
                      (COND
                       ((QEQCAR |u| 1)
                        (PROGN
                         (LETT #1#
                               (PROGN
                                (LETT #2# (CONS 1 #5="failed") . #4#)
                                (GO #2#))
                               . #4#)
                         (GO #1#)))
                       ('T
                        (SEQ
                         (LETT |v|
                               (SPADCALL (SPADCALL |eq| (QREFELT $ 68))
                                         (QREFELT $ 70))
                               . #4#)
                         (EXIT
                          (COND
                           ((QEQCAR |v| 1)
                            (PROGN
                             (LETT #1#
                                   (PROGN
                                    (LETT #2# (CONS 1 #5#) . #4#)
                                    (GO #2#))
                                   . #4#)
                             (GO #1#))))))))))
                    (LETT |lv| (CONS (QCDR |u|) |lv|) . #4#)
                    (EXIT (LETT |ls| (CONS (QCDR |v|) |ls|) . #4#))))
                  #1# (EXIT #1#))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (CONS |ls| |lv|)))))
      #2# (EXIT #2#))))) 

(DEFUN |ODERTRIC;ratsol| (|l| $)
  (PROG (|ans| |u| #1=#:G195 |sol|)
    (RETURN
     (SEQ (LETT |ans| NIL . #2=(|ODERTRIC;ratsol|))
          (SEQ (LETT |sol| NIL . #2#) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |u| (|ODERTRIC;ratsln| |sol| $) . #2#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (LETT |ans| (CONS (QCDR |u|) |ans|) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |ODERTRIC;polyRicDE;LodoML;12| (|l| |zeros| $)
  (PROG (|ans| |p| #1=#:G219 |a| #2=#:G218 |rec| |lc|)
    (RETURN
     (SEQ
      (LETT |ans| (LIST (CONS (|spadConstant| $ 18) |l|))
            . #3=(|ODERTRIC;polyRicDE;LodoML;12|))
      (EXIT
       (COND ((NULL (LETT |lc| (SPADCALL |l| (QREFELT $ 73)) . #3#)) |ans|)
             ('T
              (SEQ
               (SEQ (LETT |rec| NIL . #3#) (LETT #2# (REVERSE |lc|) . #3#) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |rec| (CAR #2#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |a| NIL . #3#)
                           (LETT #1# (SPADCALL (QCDR |rec|) |zeros|) . #3#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |a| (|spadConstant| $ 17)
                                         (QREFELT $ 75))
                               (COND
                                ((SPADCALL
                                  (LETT |p|
                                        (|ODERTRIC;newtonSolution| |l| |a|
                                         (QCAR |rec|) |zeros| $)
                                        . #3#)
                                  (|spadConstant| $ 18) (QREFELT $ 76))
                                 (LETT |ans|
                                       (CONS
                                        (CONS |p|
                                              (SPADCALL |l| |p|
                                                        (QREFELT $ 77)))
                                        |ans|)
                                       . #3#)))))))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
               (EXIT |ans|))))))))) 

(DEFUN |ODERTRIC;reverseUP| (|p| $)
  (PROG (|ans| #1=#:G220 |n|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 82) . #2=(|ODERTRIC;reverseUP|))
          (LETT |n| (SPADCALL |p| (QREFELT $ 83)) . #2#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 18) (QREFELT $ 76)))
                 (GO G191)))
               (SEQ
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL (SPADCALL |p| (QREFELT $ 84))
                                          (PROG1
                                              (LETT #1#
                                                    (- |n|
                                                       (SPADCALL |p|
                                                                 (QREFELT $
                                                                          83)))
                                                    . #2#)
                                            (|check_subtype| (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             #1#))
                                          (QREFELT $ 85))
                                (QREFELT $ 86))
                      . #2#)
                (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 87)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |ODERTRIC;reverseUTS| (|s| |n| $)
  (PROG (#1=#:G226 #2=#:G225 #3=#:G227 #4=#:G228 |i|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|ODERTRIC;reverseUTS|))
       (SEQ (LETT |i| 0 . #5#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (SPADCALL |s| |i| (QREFELT $ 88))
                               (PROG1 (LETT #4# (- |n| |i|) . #5#)
                                 (|check_subtype| (>= #4# 0)
                                                  '(|NonNegativeInteger|) #4#))
                               (QREFELT $ 89))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 90)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 18)))))))) 

(DEFUN |ODERTRIC;newtonSolution| (|l| |a| |n| |zeros| $)
  (PROG (|sols| #1=#:G252 |sol| #2=#:G251 |neq| |atn| |u| |aeq| |s| #3=#:G239
         |d| |c| |m| |op| |mu|)
    (RETURN
     (SEQ (LETT |m| 0 . #4=(|ODERTRIC;newtonSolution|))
          (LETT |aeq| (|spadConstant| $ 92) . #4#) (LETT |op| |l| . #4#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |op| (|spadConstant| $ 93) (QREFELT $ 94)))
                 (GO G191)))
               (SEQ
                (LETT |mu|
                      (+ (* (SPADCALL |op| (QREFELT $ 95)) |n|)
                         (SPADCALL (SPADCALL |op| (QREFELT $ 96))
                                   (QREFELT $ 83)))
                      . #4#)
                (LETT |op| (SPADCALL |op| (QREFELT $ 97)) . #4#)
                (EXIT
                 (COND
                  ((SPADCALL |mu| |m| (QREFELT $ 99)) (LETT |m| |mu| . #4#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |l| (|spadConstant| $ 93) (QREFELT $ 94)))
                 (GO G191)))
               (SEQ (LETT |c| (SPADCALL |l| (QREFELT $ 96)) . #4#)
                    (LETT |d| (SPADCALL |l| (QREFELT $ 95)) . #4#)
                    (LETT |s|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 100)
                                     (PROG1
                                         (LETT #3#
                                               (- (- |m| (* |d| |n|))
                                                  (SPADCALL |c|
                                                            (QREFELT $ 83)))
                                               . #4#)
                                       (|check_subtype| (>= #3# 0)
                                                        '(|NonNegativeInteger|)
                                                        #3#))
                                     (QREFELT $ 85))
                           (|ODERTRIC;reverseUP| |c| $) (QREFELT $ 102))
                          . #4#)
                    (LETT |aeq|
                          (SPADCALL |aeq| (SPADCALL |s| |d| (QREFELT $ 103))
                                    (QREFELT $ 104))
                          . #4#)
                    (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 97)) . #4#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |u| (|ODERTRIC;newtonSolve| |aeq| |a| |n| $) . #4#)
          (EXIT
           (COND ((QEQCAR |u| 0) (|ODERTRIC;reverseUTS| (QCDR |u|) |n| $))
                 (#5='T
                  (SEQ (LETT |atn| (SPADCALL |a| |n| (QREFELT $ 89)) . #4#)
                       (LETT |neq| (SPADCALL |l| |atn| (QREFELT $ 77)) . #4#)
                       (LETT |sols|
                             (PROGN
                              (LETT #2# NIL . #4#)
                              (SEQ (LETT |sol| NIL . #4#)
                                   (LETT #1#
                                         (SPADCALL |neq| |zeros|
                                                   (QREFELT $ 80))
                                         . #4#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |sol| (CAR #1#) . #4#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((<
                                        (SPADCALL (QCAR |sol|) (QREFELT $ 83))
                                        |n|)
                                       (LETT #2# (CONS (QCAR |sol|) #2#)
                                             . #4#)))))
                                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             . #4#)
                       (EXIT
                        (COND ((NULL |sols|) |atn|)
                              (#5#
                               (SPADCALL |atn| (|SPADfirst| |sols|)
                                         (QREFELT $ 90))))))))))))) 

(DEFUN |ODERTRIC;newtonSolve| (|eq| |a| |n| $)
  (PROG (|sol| #1=#:G259 |xquo| |i| |deq|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |deq| (SPADCALL |eq| (QREFELT $ 105))
              . #2=(|ODERTRIC;newtonSolve|))
        (LETT |sol| (SPADCALL |a| (QREFELT $ 106)) . #2#)
        (SEQ (LETT |i| 1 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (LETT |xquo|
                    (SPADCALL (SPADCALL |eq| |sol| (QREFELT $ 107))
                              (SPADCALL |deq| |sol| (QREFELT $ 107))
                              (QREFELT $ 109))
                    . #2#)
              (EXIT
               (COND
                ((QEQCAR |xquo| 1)
                 (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
                ('T
                 (LETT |sol|
                       (SPADCALL (SPADCALL |sol| (QCDR |xquo|) (QREFELT $ 110))
                                 |i| (QREFELT $ 111))
                       . #2#)))))
             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |sol|))))
      #1# (EXIT #1#))))) 

(DEFUN |ODERTRIC;ricDsolve;LodoMML;17| (|l| |zeros| |ezfactor| $)
  (PROG (#1=#:G265 #2=#:G268 |ans| #3=#:G271 |f| #4=#:G270 #5=#:G269 |rec| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (SPADCALL |l| (QREFELT $ 95))
              . #6=(|ODERTRIC;ricDsolve;LodoMML;17|))
        (LETT |ans| NIL . #6#)
        (SEQ (LETT |rec| NIL . #6#)
             (LETT #5# (SPADCALL |l| |ezfactor| (QREFELT $ 43)) . #6#) G190
             (COND
              ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#) . #6#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (SEQ
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL |ans|
                                 (PROGN
                                  (LETT #4# NIL . #6#)
                                  (SEQ (LETT |f| NIL . #6#)
                                       (LETT #3#
                                             (|ODERTRIC;nonSingSolve| |n|
                                              (QCDR |rec|) |zeros| $)
                                             . #6#)
                                       G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN
                                              (LETT |f| (CAR #3#) . #6#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #4#
                                               (CONS
                                                (SPADCALL (QCAR |rec|) |f|
                                                          (QREFELT $ 112))
                                                #4#)
                                               . #6#)))
                                       (LETT #3# (CDR #3#) . #6#) (GO G190)
                                       G191 (EXIT (NREVERSE #4#))))
                                 (QREFELT $ 113))
                       (QREFELT $ 114))
                      . #6#)
                (EXIT
                 (COND
                  ((EQL (LENGTH |ans|) |n|)
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# |ans| . #6#) (GO #2#)) . #6#)
                    (GO #1#)))))))
              #1# (EXIT #1#))
             (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
        (EXIT |ans|)))
      #2# (EXIT #2#))))) 

(DEFUN |ODERTRIC;nonSingSolve| (|n| |l| |zeros| $)
  (PROG (#1=#:G278 #2=#:G281 |ans| #3=#:G282 |rec|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |ans| NIL . #4=(|ODERTRIC;nonSingSolve|))
            (SEQ (LETT |rec| NIL . #4#)
                 (LETT #3# (SPADCALL |l| |zeros| (QREFELT $ 80)) . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |rec| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ
                    (LETT |ans|
                          (SPADCALL
                           (SPADCALL |ans|
                                     (|ODERTRIC;nopoly| |n| (QCAR |rec|)
                                      (QCDR |rec|) |zeros| $)
                                     (QREFELT $ 113))
                           (QREFELT $ 114))
                          . #4#)
                    (EXIT
                     (COND
                      ((EQL (LENGTH |ans|) |n|)
                       (PROGN
                        (LETT #1# (PROGN (LETT #2# |ans| . #4#) (GO #2#))
                              . #4#)
                        (GO #1#)))))))
                  #1# (EXIT #1#))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT |ans|)))
      #2# (EXIT #2#))))) 

(DEFUN |ODERTRIC;constantRic| (|p| |zeros| $)
  (COND ((ZEROP (SPADCALL |p| (QREFELT $ 83))) NIL)
        ('T (SPADCALL (SPADCALL |p| (QREFELT $ 115)) |zeros|)))) 

(DEFUN |ODERTRIC;nopoly| (|n| |p| |l| |zeros| $)
  (PROG (#1=#:G289 #2=#:G292 |ans| #3=#:G295 |f| #4=#:G294 #5=#:G293 |rec|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |ans| NIL . #6=(|ODERTRIC;nopoly|))
            (SEQ (LETT |rec| NIL . #6#)
                 (LETT #5#
                       (SPADCALL |l|
                                 (CONS #'|ODERTRIC;nopoly!0|
                                       (VECTOR $ |zeros|))
                                 (QREFELT $ 118))
                       . #6#)
                 G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ
                    (LETT |ans|
                          (SPADCALL
                           (SPADCALL |ans|
                                     (PROGN
                                      (LETT #4# NIL . #6#)
                                      (SEQ (LETT |f| NIL . #6#)
                                           (LETT #3#
                                                 (|ODERTRIC;logDerOnly|
                                                  (QCDR |rec|) $)
                                                 . #6#)
                                           G190
                                           (COND
                                            ((OR (ATOM #3#)
                                                 (PROGN
                                                  (LETT |f| (CAR #3#) . #6#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #4#
                                                   (CONS
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL (QCAR |rec|)
                                                                 (QREFELT $
                                                                          119))
                                                       |p| (QREFELT $ 90))
                                                      (QREFELT $ 120))
                                                     |f| (QREFELT $ 112))
                                                    #4#)
                                                   . #6#)))
                                           (LETT #3# (CDR #3#) . #6#) (GO G190)
                                           G191 (EXIT (NREVERSE #4#))))
                                     (QREFELT $ 113))
                           (QREFELT $ 114))
                          . #6#)
                    (EXIT
                     (COND
                      ((EQL (LENGTH |ans|) |n|)
                       (PROGN
                        (LETT #1# (PROGN (LETT #2# |ans| . #6#) (GO #2#))
                              . #6#)
                        (GO #1#)))))))
                  #1# (EXIT #1#))
                 (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
            (EXIT |ans|)))
      #2# (EXIT #2#))))) 

(DEFUN |ODERTRIC;nopoly!0| (|z| $$)
  (PROG (|zeros| $)
    (LETT |zeros| (QREFELT $$ 1) . #1=(|ODERTRIC;nopoly|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|ODERTRIC;constantRic| |z| |zeros| $))))) 

(DEFUN |ODERTRIC;solveModulo| (|c| |h| $)
  (PROG (#1=#:G306 |s| #2=#:G305 |sol| |unk| |rec|)
    (RETURN
     (SEQ
      (LETT |rec|
            (|ODERTRIC;genericPolynomial| (QREFELT $ 10)
             (- (SPADCALL |c| (QREFELT $ 83)) 1) $)
            . #3=(|ODERTRIC;solveModulo|))
      (LETT |unk| (|spadConstant| $ 60) . #3#)
      (SEQ G190
           (COND
            ((NULL (COND ((SPADCALL |h| (QREFELT $ 122)) 'NIL) ('T 'T)))
             (GO G191)))
           (SEQ
            (LETT |unk|
                  (SPADCALL |unk|
                            (SPADCALL
                             (|ODERTRIC;UP2SUP| (SPADCALL |h| (QREFELT $ 123))
                              $)
                             (SPADCALL (QCAR |rec|)
                                       (SPADCALL |h| (QREFELT $ 124))
                                       (QREFELT $ 125))
                             (QREFELT $ 126))
                            (QREFELT $ 65))
                  . #3#)
            (EXIT (LETT |h| (SPADCALL |h| (QREFELT $ 127)) . #3#)))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT |sol|
            (|ODERTRIC;ratsol|
             (SPADCALL
              (SPADCALL
               (QCDR
                (SPADCALL |unk| (|ODERTRIC;UP2SUP| |c| $) (QREFELT $ 129)))
               (QREFELT $ 131))
              (QCDR |rec|) (QREFELT $ 134))
             $)
            . #3#)
      (EXIT
       (PROGN
        (LETT #2# NIL . #3#)
        (SEQ (LETT |s| NIL . #3#) (LETT #1# |sol| . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS
                      (|ODERTRIC;mapeval| (QCAR |rec|) (QCAR |s|) (QCDR |s|) $)
                      #2#)
                     . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |ODERTRIC;ricDsolve;LodoL;22| (|l| $)
  (SPADCALL |l| (ELT $ 29) (QREFELT $ 135))) 

(DEFUN |ODERTRIC;ricDsolve;LodoL;23| (|l| $)
  (SPADCALL |l| (ELT $ 29) (QREFELT $ 137))) 

(DEFUN |ODERTRIC;ricDsolve;LodoML;24| (|l| |ezfactor| $)
  (PROG ()
    (RETURN
     (SPADCALL |l|
               (CONS #'|ODERTRIC;ricDsolve;LodoML;24!0| (VECTOR $ |ezfactor|))
               |ezfactor| (QREFELT $ 36))))) 

(DEFUN |ODERTRIC;ricDsolve;LodoML;24!0| (|z| $$)
  (PROG (|ezfactor| $)
    (LETT |ezfactor| (QREFELT $$ 1) . #1=(|ODERTRIC;ricDsolve;LodoML;24|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|ODERTRIC;zro| |z| |ezfactor| $))))) 

(DEFUN |ODERTRIC;ricDsolve;LodoML;25| (|l| |ezfactor| $)
  (PROG ()
    (RETURN
     (SPADCALL |l|
               (CONS #'|ODERTRIC;ricDsolve;LodoML;25!0| (VECTOR $ |ezfactor|))
               |ezfactor| (QREFELT $ 34))))) 

(DEFUN |ODERTRIC;ricDsolve;LodoML;25!0| (|z| $$)
  (PROG (|ezfactor| $)
    (LETT |ezfactor| (QREFELT $$ 1) . #1=(|ODERTRIC;ricDsolve;LodoML;25|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|ODERTRIC;zro| |z| |ezfactor| $))))) 

(DEFUN |ODERTRIC;zro| (|p| |ezfactor| $)
  (PROG (#1=#:G323 |r| #2=#:G322)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|ODERTRIC;zro|))
        (SEQ (LETT |r| NIL . #3#)
             (LETT #1# (SPADCALL (SPADCALL |p| |ezfactor|) (QREFELT $ 142))
                   . #3#)
             G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2# (CONS (|ODERTRIC;zro1| (QCAR |r|) $) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 144)))))) 

(DEFUN |ODERTRIC;zro1| (|p| $)
  (LIST
   (SPADCALL (SPADCALL (LIST #'|ODERTRIC;zro1!0|) |p| (QREFELT $ 148))
             (QREFELT $ 150)))) 

(DEFUN |ODERTRIC;zro1!0| (|z| $$) |z|) 

(DEFUN |RationalRicDE| (&REST #1=#:G327)
  (PROG ()
    (RETURN
     (PROG (#2=#:G328)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|RationalRicDE|)
                                           '|domainEqualList|)
                . #3=(|RationalRicDE|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |RationalRicDE;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|RationalRicDE|))))))))))) 

(DEFUN |RationalRicDE;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|RationalRicDE|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|RationalRicDE| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 151) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|AlgebraicallyClosedField|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|RationalRicDE| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 136
                   (CONS (|dispatchFunction| |ODERTRIC;ricDsolve;LodoL;22|) $))
         (QSETREFV $ 138
                   (CONS (|dispatchFunction| |ODERTRIC;ricDsolve;LodoL;23|) $))
         (QSETREFV $ 135
                   (CONS (|dispatchFunction| |ODERTRIC;ricDsolve;LodoML;24|)
                         $))
         (QSETREFV $ 137
                   (CONS (|dispatchFunction| |ODERTRIC;ricDsolve;LodoML;25|)
                         $)))))
      $)))) 

(MAKEPROP '|RationalRicDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) '|dummy| (|Polynomial| 6) (4 . |coerce|)
              (|SparseUnivariatePolynomial| 11) (|Mapping| 11 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 11 13) (9 . |map|)
              (15 . |Zero|) (19 . |Zero|) (|Fraction| 7) (23 . |Zero|)
              (|Union| 19 '"failed")
              (|Record| (|:| |particular| 21) (|:| |basis| 30))
              (|LinearOrdinaryDifferentialOperator2| 7 19) (|RationalLODE| 6 7)
              (27 . |ratDsolve|) (33 . |differentiate|) (38 . /) (|Factored| $)
              (44 . |squareFree|) (|List| 19)
              (|LinearOrdinaryDifferentialOperator1| 19) (|Mapping| 48 7)
              (|Mapping| 141 7) |ODERTRIC;ricDsolve;LodoMML;6|
              |ODERTRIC;ricDsolve;LodoML;3| |ODERTRIC;ricDsolve;LodoMML;17|
              |ODERTRIC;ricDsolve;LodoML;4|
              (|Record| (|:| |frac| 19) (|:| |eq| 23)) (|List| 38)
              (|Mapping| (|List| 7) 7 121) (|PrimitiveRatRicDE| 6 7 23 31)
              (49 . |singRicDE|) |ODERTRIC;singRicDE;LodoML;5|
              (|Record| (|:| |eq| 23) (|:| |rh| 30))
              (|PrimitiveRatDE| 6 7 23 31) (56 . |splitDenominator|) (|List| 8)
              (|List| 6) (62 . |eval|) (69 . |ground|) (|Mapping| 6 11)
              (|UnivariatePolynomialCategoryFunctions2| 11 13 6 7) (74 . |map|)
              (|Fraction| 11) (80 . |numer|) (|Union| 6 '"failed")
              (85 . |retractIfCan|) (90 . |denom|) (95 . /) (101 . |Zero|)
              (105 . |new|) (110 . |coerce|) (|NonNegativeInteger|)
              (115 . |monomial|) (121 . +) (|Equation| 54) (127 . |rhs|)
              (132 . |lhs|) (|Union| 8 '"failed") (137 . |retractIfCan|)
              (|Record| (|:| |deg| 63) (|:| |eq| 7)) (|List| 71)
              (142 . |leadingCoefficientRicDE|) (|Boolean|) (147 . ~=)
              (153 . ~=) (159 . |changeVar|)
              (|Record| (|:| |poly| 7) (|:| |eq| 23)) (|List| 78)
              |ODERTRIC;polyRicDE;LodoML;12|
              (|UnivariateTaylorSeries| 6 10 (NRTEVAL (|spadConstant| $ 17)))
              (165 . |Zero|) (169 . |degree|) (174 . |leadingCoefficient|)
              (179 . |monomial|) (185 . +) (191 . |reductum|)
              (196 . |coefficient|) (202 . |monomial|) (208 . +)
              (|SparseUnivariatePolynomial| 81) (214 . |Zero|) (218 . |Zero|)
              (222 . ~=) (228 . |degree|) (233 . |leadingCoefficient|)
              (238 . |reductum|) (|Integer|) (243 . >) (249 . |One|)
              (253 . |One|) (257 . *) (263 . |monomial|) (269 . +)
              (275 . |differentiate|) (280 . |coerce|) (285 . |elt|)
              (|Union| $ '"failed") (291 . |exquo|) (297 . -)
              (303 . |truncate|) (309 . +) (315 . |concat!|)
              (321 . |removeDuplicates!|) (326 . |squareFreePart|)
              (|Record| (|:| |constant| 6) (|:| |eq| 23)) (|List| 116)
              (331 . |constantCoefficientRicDE|) (337 . |coerce|)
              (342 . |coerce|) (|SparseUnivariatePolynomial| 7) (347 . |zero?|)
              (352 . |leadingCoefficient|) (357 . |degree|) (362 . ^) (368 . *)
              (374 . |reductum|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (379 . |monicDivide|) (|List| 11) (385 . |coefficients|)
              (|List| (|List| 66)) (|NonLinearSolvePackage| 6) (390 . |solve|)
              (396 . |ricDsolve|) (402 . |ricDsolve|) (407 . |ricDsolve|)
              (413 . |ricDsolve|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 98)) (|List| 139)
              (|Factored| 7) (418 . |factors|) (|List| $) (423 . |concat|)
              (|SparseUnivariatePolynomial| 6) (|Mapping| 6 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 6 145)
              (428 . |map|) (|SparseUnivariatePolynomial| $) (434 . |zeroOf|))
           '#(|singRicDE| 439 |ricDsolve| 445 |polyRicDE| 493) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 150
                                                 '(0 8 0 9 1 11 0 6 12 2 15 13
                                                   14 7 16 0 6 0 17 0 7 0 18 0
                                                   19 0 20 2 24 22 23 19 25 1
                                                   19 0 0 26 2 19 0 0 0 27 1 7
                                                   28 0 29 3 41 39 23 40 33 42
                                                   2 45 44 31 30 46 3 11 0 0 47
                                                   48 49 1 11 6 0 50 2 52 7 51
                                                   13 53 1 54 11 0 55 1 11 56 0
                                                   57 1 54 11 0 58 2 6 0 0 0 59
                                                   0 13 0 60 1 8 0 0 61 1 11 0
                                                   8 62 2 13 0 11 63 64 2 13 0
                                                   0 0 65 1 66 54 0 67 1 66 54
                                                   0 68 1 54 69 0 70 1 41 72 23
                                                   73 2 6 74 0 0 75 2 7 74 0 0
                                                   76 2 41 23 23 7 77 0 81 0 82
                                                   1 7 63 0 83 1 7 6 0 84 2 81
                                                   0 6 63 85 2 81 0 0 0 86 1 7
                                                   0 0 87 2 81 6 0 63 88 2 7 0
                                                   6 63 89 2 7 0 0 0 90 0 91 0
                                                   92 0 23 0 93 2 23 74 0 0 94
                                                   1 23 63 0 95 1 23 7 0 96 1
                                                   23 0 0 97 2 98 74 0 0 99 0 6
                                                   0 100 0 7 0 101 2 81 0 0 0
                                                   102 2 91 0 81 63 103 2 91 0
                                                   0 0 104 1 91 0 0 105 1 81 0
                                                   6 106 2 91 81 0 81 107 2 81
                                                   108 0 0 109 2 81 0 0 0 110 2
                                                   81 0 0 63 111 2 19 0 0 0 112
                                                   2 30 0 0 0 113 1 30 0 0 114
                                                   1 7 0 0 115 2 41 117 23 32
                                                   118 1 7 0 6 119 1 19 0 7 120
                                                   1 121 74 0 122 1 121 7 0 123
                                                   1 121 63 0 124 2 13 0 0 63
                                                   125 2 13 0 0 0 126 1 121 0 0
                                                   127 2 13 128 0 0 129 1 13
                                                   130 0 131 2 133 132 130 47
                                                   134 2 0 30 23 33 135 1 0 30
                                                   23 136 2 0 30 31 33 137 1 0
                                                   30 31 138 1 141 140 0 142 1
                                                   48 0 143 144 2 147 145 146 7
                                                   148 1 6 0 149 150 2 0 39 23
                                                   33 43 1 1 30 31 138 2 1 30
                                                   31 33 137 2 1 30 23 33 135 1
                                                   1 30 23 136 3 0 30 31 32 33
                                                   34 2 0 30 31 32 35 2 0 30 23
                                                   32 37 3 0 30 23 32 33 36 2 0
                                                   79 23 32 80)))))
           '|lookupComplete|)) 
