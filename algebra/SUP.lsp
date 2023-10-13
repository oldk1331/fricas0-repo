
(/VERSIONCHECK 2) 

(PUT '|SUP;makeSUP;2$;1| '|SPADreplace| '(XLAM (|p|) |p|)) 

(DEFUN |SUP;makeSUP;2$;1| (|p| $) |p|) 

(PUT '|SUP;unmakeSUP;2$;2| '|SPADreplace| '(XLAM (|sp|) |sp|)) 

(DEFUN |SUP;unmakeSUP;2$;2| (|sp| $) |sp|) 

(DEFUN |SUP;^;$Pi$;3| (|p| |np| $) (SPADCALL |p| |np| (QREFELT $ 14))) 

(DEFUN |SUP;^;$Nni$;4| (|p| |n| $)
  (PROG (|rn| |qn| |rec| #1=#:G171 |t| #2=#:G170 #3=#:G169 |y| |cc|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |p|) (|spadConstant| $ 17))
             ((ZEROP |n|) (|spadConstant| $ 18)) ((EQL |n| 1) |p|)
             (#4='T
              (COND
               ((NULL (CDR |p|))
                (COND
                 ((SPADCALL
                   (LETT |cc|
                         (SPADCALL (QCDR (|SPADfirst| |p|)) |n| (QREFELT $ 21))
                         . #5=(|SUP;^;$Nni$;4|))
                   (QREFELT $ 23))
                  (|spadConstant| $ 17))
                 (#4# (LIST (CONS (* |n| (QCAR (|SPADfirst| |p|))) |cc|)))))
               (#4#
                (SEQ
                 (COND
                  ((< (SPADCALL (QREFELT $ 24)) 3)
                   (PROGN
                    (LETT #3# (SPADCALL |p| |n| (QREFELT $ 26)) . #5#)
                    (GO #3#))))
                 (LETT |y| (|spadConstant| $ 18) . #5#)
                 (LETT |rec| (DIVIDE2 |n| (SPADCALL (QREFELT $ 24))) . #5#)
                 (LETT |qn| (QCAR |rec|) . #5#) (LETT |rn| (QCDR |rec|) . #5#)
                 (SEQ G190 NIL
                      (SEQ
                       (COND
                        ((EQL |rn| 1)
                         (LETT |y| (SPADCALL |y| |p| (QREFELT $ 27)) . #5#)))
                       (COND
                        ((SPADCALL |rn| 1 (QREFELT $ 28))
                         (LETT |y|
                               (SPADCALL |y|
                                         (SPADCALL (LIST (|SPADfirst| |p|))
                                                   (CDR |p|) |rn|
                                                   (QREFELT $ 29))
                                         (QREFELT $ 27))
                               . #5#)))
                       (EXIT
                        (COND
                         ((ZEROP |qn|) (PROGN (LETT #3# |y| . #5#) (GO #3#)))
                         ('T
                          (SEQ
                           (LETT |p|
                                 (PROGN
                                  (LETT #2# NIL . #5#)
                                  (SEQ (LETT |t| NIL . #5#)
                                       (LETT #1# |p| . #5#) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |t| (CAR #1#) . #5#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (CONS
                                                 (* (QCAR |t|)
                                                    (SPADCALL (QREFELT $ 24)))
                                                 (SPADCALL (QCDR |t|)
                                                           (QREFELT $ 30)))
                                                #2#)
                                               . #5#)))
                                       (LETT #1# (CDR #1#) . #5#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 . #5#)
                           (LETT |rec| (DIVIDE2 |qn| (SPADCALL (QREFELT $ 24)))
                                 . #5#)
                           (LETT |qn| (QCAR |rec|) . #5#)
                           (EXIT (LETT |rn| (QCDR |rec|) . #5#)))))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |y|)))))))
      #3# (EXIT #3#))))) 

(PUT '|SUP;zero?;$B;5| '|SPADreplace| 'NULL) 

(DEFUN |SUP;zero?;$B;5| (|p| $) (NULL |p|)) 

(DEFUN |SUP;one?;$B;6| (|p| $)
  (COND
   ((OR (OR (NULL |p|) (NULL (NULL (CDR |p|))))
        (NULL (ZEROP (QCAR (|SPADfirst| |p|)))))
    'NIL)
   ('T
    (SPADCALL (QCDR (|SPADfirst| |p|)) (|spadConstant| $ 19) (QREFELT $ 32))))) 

(DEFUN |SUP;ground?;$B;7| (|p| $)
  (COND ((NULL |p|) 'T) ((NULL (CDR |p|)) (ZEROP (QCAR (|SPADfirst| |p|))))
        ('T 'NIL))) 

(DEFUN |SUP;multiplyExponents;$Nni$;8| (|p| |n| $)
  (PROG (#1=#:G186 |u| #2=#:G185)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|SUP;multiplyExponents;$Nni$;8|))
       (SEQ (LETT |u| NIL . #3#) (LETT #1# |p| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (CONS (* (QCAR |u|) |n|) (QCDR |u|)) #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |SUP;divideExponents;$NniU;9| (|p| |n| $)
  (PROG (#1=#:G195 |u| |m|)
    (RETURN
     (SEQ
      (COND ((NULL |p|) (CONS 0 |p|))
            (#2='T
             (SEQ
              (LETT |m| (SPADCALL (QCAR (|SPADfirst| |p|)) |n| (QREFELT $ 37))
                    . #3=(|SUP;divideExponents;$NniU;9|))
              (EXIT
               (COND ((QEQCAR |m| 1) (CONS 1 "failed"))
                     (#2#
                      (SEQ
                       (LETT |u| (SPADCALL (CDR |p|) |n| (QREFELT $ 38)) . #3#)
                       (EXIT
                        (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                              (#2#
                               (CONS 0
                                     (CONS
                                      (CONS
                                       (PROG1 (LETT #1# (QCDR |m|) . #3#)
                                         (|check_subtype| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          #1#))
                                       (QCDR (|SPADfirst| |p|)))
                                      (QCDR |u|))))))))))))))))) 

(DEFUN |SUP;karatsubaDivide;$NniR;10| (|p| |n| $)
  (PROG (|highp| #1=#:G204 |lowp| #2=#:G207 |t|)
    (RETURN
     (SEQ
      (COND ((ZEROP |n|) (CONS |p| (|spadConstant| $ 17)))
            ('T
             (SEQ (LETT |lowp| |p| . #3=(|SUP;karatsubaDivide;$NniR;10|))
                  (LETT |highp| NIL . #3#)
                  (SEQ
                   (EXIT
                    (SEQ G190 NIL
                         (SEQ
                          (COND
                           ((NULL |lowp|)
                            (PROGN (LETT #2# |$NoValue| . #3#) (GO #2#))))
                          (LETT |t| (|SPADfirst| |lowp|) . #3#)
                          (COND
                           ((< (QCAR |t|) |n|)
                            (PROGN (LETT #2# |$NoValue| . #3#) (GO #2#))))
                          (LETT |lowp| (CDR |lowp|) . #3#)
                          (EXIT
                           (LETT |highp|
                                 (CONS
                                  (CONS
                                   (PROG2
                                       (LETT #1#
                                             (SPADCALL (QCAR |t|) |n|
                                                       (QREFELT $ 40))
                                             . #3#)
                                       (QCDR #1#)
                                     (|check_union| (QEQCAR #1# 0)
                                                    (|NonNegativeInteger|)
                                                    #1#))
                                   (QCDR |t|))
                                  |highp|)
                                 . #3#)))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #2# (EXIT #2#))
                  (EXIT (CONS (REVERSE |highp|) |lowp|))))))))) 

(DEFUN |SUP;shiftRight;$Nni$;11| (|p| |n| $)
  (PROG (#1=#:G214 #2=#:G219 |t| #3=#:G218)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3# NIL . #4=(|SUP;shiftRight;$Nni$;11|))
       (SEQ (LETT |t| NIL . #4#) (LETT #2# |p| . #4#) G190
            (COND
             ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #4#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #3#
                    (CONS
                     (CONS
                      (PROG2
                          (LETT #1# (SPADCALL (QCAR |t|) |n| (QREFELT $ 40))
                                . #4#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                       #1#))
                      (QCDR |t|))
                     #3#)
                    . #4#)))
            (LETT #2# (CDR #2#) . #4#) (GO G190) G191
            (EXIT (NREVERSE #3#)))))))) 

(DEFUN |SUP;shiftLeft;$Nni$;12| (|p| |n| $)
  (PROG (#1=#:G224 |t| #2=#:G223)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|SUP;shiftLeft;$Nni$;12|))
       (SEQ (LETT |t| NIL . #3#) (LETT #1# |p| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (CONS (+ (QCAR |t|) |n|) (QCDR |t|)) #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |SUP;pomopo!;$RNni2$;13| (|p1| |r| |e| |p2| $)
  (PROG (|rout| |u| |c2| |e2| #1=#:G235 |tm|)
    (RETURN
     (SEQ (LETT |rout| NIL . #2=(|SUP;pomopo!;$RNni2$;13|))
          (SEQ (LETT |tm| NIL . #2#) (LETT #1# |p2| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |e2| (+ |e| (QCAR |tm|)) . #2#)
                    (LETT |c2| (SPADCALL |r| (QCDR |tm|) (QREFELT $ 45)) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |c2| (|spadConstant| $ 39) (QREFELT $ 32))
                       "next term")
                      ('T
                       (SEQ
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |p1|) 'NIL)
                                      ('T
                                       (SPADCALL (QCAR (|SPADfirst| |p1|)) |e2|
                                                 (QREFELT $ 28)))))
                               (GO G191)))
                             (SEQ
                              (LETT |rout| (CONS (|SPADfirst| |p1|) |rout|)
                                    . #2#)
                              (EXIT (LETT |p1| (CDR |p1|) . #2#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (COND
                         ((OR (NULL |p1|) (< (QCAR (|SPADfirst| |p1|)) |e2|))
                          (EXIT
                           (LETT |rout| (CONS (CONS |e2| |c2|) |rout|)
                                 . #2#))))
                        (COND
                         ((SPADCALL
                           (LETT |u|
                                 (SPADCALL (QCDR (|SPADfirst| |p1|)) |c2|
                                           (QREFELT $ 46))
                                 . #2#)
                           (|spadConstant| $ 39) (QREFELT $ 47))
                          (LETT |rout| (CONS (CONS |e2| |u|) |rout|) . #2#)))
                        (EXIT (LETT |p1| (CDR |p1|) . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (NRECONC |rout| |p1|)))))) 

(PUT '|SUP;univariate;2$;14| '|SPADreplace| '(XLAM (|p|) |p|)) 

(DEFUN |SUP;univariate;2$;14| (|p| $) |p|) 

(PUT '|SUP;multivariate;$Saos$;15| '|SPADreplace| '(XLAM (|sup| |v|) |sup|)) 

(DEFUN |SUP;multivariate;$Saos$;15| (|sup| |v| $) |sup|) 

(DEFUN |SUP;univariate;$SaosSup;16| (|p| |v| $)
  (COND ((SPADCALL |p| (QREFELT $ 31)) (|spadConstant| $ 53))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 54)) (QREFELT $ 55))
                    (SPADCALL |p| (QREFELT $ 56)) (QREFELT $ 57))
          (SPADCALL (SPADCALL |p| (QREFELT $ 58)) |v| (QREFELT $ 60))
          (QREFELT $ 61))))) 

(DEFUN |SUP;multivariate;SupSaos$;17| (|supp| |v| $)
  (PROG (|lc|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |supp| (QREFELT $ 62)) (|spadConstant| $ 17))
            (#1='T
             (SEQ
              (LETT |lc| (SPADCALL |supp| (QREFELT $ 63))
                    |SUP;multivariate;SupSaos$;17|)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |lc| (QREFELT $ 56)) 0 (QREFELT $ 28))
                 (|error| "bad form polynomial"))
                (#1#
                 (SPADCALL
                  (SPADCALL (SPADCALL |lc| (QREFELT $ 54))
                            (SPADCALL |supp| (QREFELT $ 64)) (QREFELT $ 65))
                  (SPADCALL (SPADCALL |supp| (QREFELT $ 66)) |v|
                            (QREFELT $ 67))
                  (QREFELT $ 68)))))))))))) 

(DEFUN |SUP;squareFreePolynomial;SupF;18| (|pp| $)
  (SPADCALL |pp| (QREFELT $ 71))) 

(DEFUN |SUP;factorPolynomial;SupF;19| (|pp| $) (SPADCALL |pp| (QREFELT $ 77))) 

(DEFUN |SUP;factorSquareFreePolynomial;SupF;20| (|pp| $)
  (SPADCALL |pp| (QREFELT $ 77))) 

(DEFUN |SUP;gcdPolynomial;3Sup;21| (|pp| |qq| $)
  (SPADCALL |pp| |qq| (QREFELT $ 80))) 

(DEFUN |SUP;factor;$F;22| (|p| $) (SPADCALL |p| (QREFELT $ 84))) 

(DEFUN |SUP;solveLinearPolynomialEquation;LSupU;23| (|lpp| |pp| $)
  (SPADCALL |lpp| |pp| (QREFELT $ 90))) 

(DEFUN |SUP;solveLinearPolynomialEquation;LSupU;24| (|lpp| |pp| $)
  (SPADCALL |lpp| |pp| (QREFELT $ 95))) 

(DEFUN |SUP;factorPolynomial;SupF;25| (|pp| $) (SPADCALL |pp| (QREFELT $ 96))) 

(DEFUN |SUP;factorSquareFreePolynomial;SupF;26| (|pp| $)
  (SPADCALL |pp| (QREFELT $ 97))) 

(DEFUN |SUP;exquo;2$U;27| (|p1| |p2| $)
  (PROG (|rout| #1=#:G279 |ee| |a|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |p2|) (|error| "Division by 0"))
             ((SPADCALL |p2| (|spadConstant| $ 18) (QREFELT $ 98))
              (CONS 0 |p1|))
             ((SPADCALL |p1| |p2| (QREFELT $ 98))
              (CONS 0 (|spadConstant| $ 18)))
             (#2='T
              (SEQ (LETT |rout| NIL . #3=(|SUP;exquo;2$U;27|))
                   (SEQ G190
                        (COND
                         ((NULL (COND ((NULL |p1|) 'NIL) ('T 'T))) (GO G191)))
                        (SEQ
                         (LETT |a|
                               (SPADCALL (QCDR (|SPADfirst| |p1|))
                                         (QCDR (|SPADfirst| |p2|))
                                         (QREFELT $ 99))
                               . #3#)
                         (EXIT
                          (COND
                           ((QEQCAR |a| 1)
                            (PROGN
                             (LETT #1# (CONS 1 "failed") . #3#)
                             (GO #1#)))
                           ('T
                            (SEQ
                             (LETT |ee|
                                   (SPADCALL (QCAR (|SPADfirst| |p1|))
                                             (QCAR (|SPADfirst| |p2|))
                                             (QREFELT $ 40))
                                   . #3#)
                             (EXIT
                              (COND
                               ((QEQCAR |ee| 1)
                                (PROGN
                                 (LETT #1# (CONS 1 "failed") . #3#)
                                 (GO #1#)))
                               ('T
                                (SEQ
                                 (LETT |p1|
                                       (SPADCALL (CDR |p1|) (QCDR |ee|)
                                                 (QCDR |a|) (CDR |p2|)
                                                 (QREFELT $ 100))
                                       . #3#)
                                 (EXIT
                                  (LETT |rout|
                                        (CONS (CONS (QCDR |ee|) (QCDR |a|))
                                              |rout|)
                                        . #3#)))))))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (COND ((NULL |p1|) (CONS 0 (REVERSE |rout|)))
                          (#2# (CONS 1 "failed"))))))))
      #1# (EXIT #1#))))) 

(DEFUN |SUP;exquo;2$U;28| (|p1| |p2| $)
  (PROG (|rout| #1=#:G295 |ee| |a|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |p2|) (|error| "Division by 0"))
             ((SPADCALL |p2| (|spadConstant| $ 18) (QREFELT $ 98))
              (CONS 0 |p1|))
             (#2='T
              (SEQ (LETT |rout| NIL . #3=(|SUP;exquo;2$U;28|))
                   (SEQ G190
                        (COND
                         ((NULL (COND ((NULL |p1|) 'NIL) ('T 'T))) (GO G191)))
                        (SEQ
                         (LETT |a|
                               (SPADCALL (QCDR (|SPADfirst| |p1|))
                                         (QCDR (|SPADfirst| |p2|))
                                         (QREFELT $ 99))
                               . #3#)
                         (EXIT
                          (COND
                           ((QEQCAR |a| 1)
                            (PROGN
                             (LETT #1# (CONS 1 "failed") . #3#)
                             (GO #1#)))
                           ('T
                            (SEQ
                             (LETT |ee|
                                   (SPADCALL (QCAR (|SPADfirst| |p1|))
                                             (QCAR (|SPADfirst| |p2|))
                                             (QREFELT $ 40))
                                   . #3#)
                             (EXIT
                              (COND
                               ((QEQCAR |ee| 1)
                                (PROGN
                                 (LETT #1# (CONS 1 "failed") . #3#)
                                 (GO #1#)))
                               ('T
                                (SEQ
                                 (LETT |p1|
                                       (SPADCALL (CDR |p1|) (QCDR |ee|)
                                                 (QCDR |a|) (CDR |p2|)
                                                 (QREFELT $ 100))
                                       . #3#)
                                 (EXIT
                                  (LETT |rout|
                                        (CONS (CONS (QCDR |ee|) (QCDR |a|))
                                              |rout|)
                                        . #3#)))))))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (COND ((NULL |p1|) (CONS 0 (REVERSE |rout|)))
                          (#2# (CONS 1 "failed"))))))))
      #1# (EXIT #1#))))) 

(DEFUN |SUP;fmecg;$NniR2$;29| (|p1| |e| |r| |p2| $)
  (PROG (|rout| |u| |c2| |e2| #1=#:G306 |tm|)
    (RETURN
     (SEQ (LETT |rout| NIL . #2=(|SUP;fmecg;$NniR2$;29|))
          (LETT |r| (SPADCALL |r| (QREFELT $ 102)) . #2#)
          (SEQ (LETT |tm| NIL . #2#) (LETT #1# |p2| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |e2| (+ |e| (QCAR |tm|)) . #2#)
                    (LETT |c2| (SPADCALL |r| (QCDR |tm|) (QREFELT $ 45)) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |c2| (|spadConstant| $ 39) (QREFELT $ 32))
                       "next term")
                      ('T
                       (SEQ
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |p1|) 'NIL)
                                      ('T
                                       (SPADCALL (QCAR (|SPADfirst| |p1|)) |e2|
                                                 (QREFELT $ 28)))))
                               (GO G191)))
                             (SEQ
                              (LETT |rout| (CONS (|SPADfirst| |p1|) |rout|)
                                    . #2#)
                              (EXIT (LETT |p1| (CDR |p1|) . #2#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (COND
                         ((OR (NULL |p1|) (< (QCAR (|SPADfirst| |p1|)) |e2|))
                          (EXIT
                           (LETT |rout| (CONS (CONS |e2| |c2|) |rout|)
                                 . #2#))))
                        (COND
                         ((SPADCALL
                           (LETT |u|
                                 (SPADCALL (QCDR (|SPADfirst| |p1|)) |c2|
                                           (QREFELT $ 46))
                                 . #2#)
                           (|spadConstant| $ 39) (QREFELT $ 47))
                          (LETT |rout| (CONS (CONS |e2| |u|) |rout|) . #2#)))
                        (EXIT (LETT |p1| (CDR |p1|) . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (NRECONC |rout| |p1|)))))) 

(DEFUN |SUP;pseudoRemainder;3$;30| (|p1| |p2| $)
  (PROG (|e1| #1=#:G313 #2=#:G315 |u| #3=#:G308 |e| |co|)
    (RETURN
     (SEQ
      (COND ((NULL |p2|) (|error| "PseudoDivision by Zero"))
            ((NULL |p1|) (|spadConstant| $ 17))
            (#4='T
             (SEQ
              (LETT |co| (QCDR (|SPADfirst| |p2|))
                    . #5=(|SUP;pseudoRemainder;3$;30|))
              (LETT |e| (QCAR (|SPADfirst| |p2|)) . #5#)
              (LETT |p2| (CDR |p2|) . #5#)
              (LETT |e1|
                    (PROG1
                        (LETT #3#
                              (MAX (+ (- (QCAR (|SPADfirst| |p1|)) |e|) 1) 0)
                              . #5#)
                      (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
                    . #5#)
              (SEQ
               (EXIT
                (SEQ G190
                     (COND
                      ((NULL (COND ((NULL |p1|) 'NIL) ('T 'T))) (GO G191)))
                     (SEQ
                      (SEQ
                       (LETT |u|
                             (SPADCALL (QCAR (|SPADfirst| |p1|)) |e|
                                       (QREFELT $ 40))
                             . #5#)
                       (EXIT
                        (COND
                         ((QEQCAR |u| 1)
                          (PROGN (LETT #2# |$NoValue| . #5#) (GO #2#))))))
                      (LETT |p1|
                            (SPADCALL
                             (SPADCALL |co| (CDR |p1|) (QREFELT $ 103))
                             (QCDR |u|) (QCDR (|SPADfirst| |p1|)) |p2|
                             (QREFELT $ 100))
                            . #5#)
                      (EXIT
                       (LETT |e1|
                             (PROG1 (LETT #1# (- |e1| 1) . #5#)
                               (|check_subtype| (>= #1# 0)
                                                '(|NonNegativeInteger|) #1#))
                             . #5#)))
                     NIL (GO G190) G191 (EXIT NIL)))
               #2# (EXIT #2#))
              (EXIT
               (COND ((EQL |e1| 0) |p1|)
                     (#4#
                      (SPADCALL (SPADCALL |co| |e1| (QREFELT $ 104)) |p1|
                                (QREFELT $ 103)))))))))))) 

(DEFUN |SUP;toutput| (|t1| |v| $)
  (PROG (|mon|)
    (RETURN
     (SEQ
      (COND ((EQL (QCAR |t1|) 0) (SPADCALL (QCDR |t1|) (QREFELT $ 107)))
            (#1='T
             (SEQ
              (COND ((EQL (QCAR |t1|) 1) (LETT |mon| |v| . #2=(|SUP;toutput|)))
                    (#1#
                     (LETT |mon|
                           (SPADCALL |v| (SPADCALL (QCAR |t1|) (QREFELT $ 108))
                                     (QREFELT $ 109))
                           . #2#)))
              (EXIT
               (COND
                ((SPADCALL (QCDR |t1|) (|spadConstant| $ 19) (QREFELT $ 32))
                 |mon|)
                (#1#
                 (SEQ
                  (COND
                   ((SPADCALL (QCDR |t1|)
                              (SPADCALL (|spadConstant| $ 19) (QREFELT $ 102))
                              (QREFELT $ 32))
                    (COND
                     ((SPADCALL (SPADCALL (QCDR |t1|) (QREFELT $ 107))
                                (SPADCALL -1 (QREFELT $ 110)) (QREFELT $ 111))
                      (EXIT (SPADCALL |mon| (QREFELT $ 112)))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |t1|) (QREFELT $ 107)) |mon|
                             (QREFELT $ 113)))))))))))))) 

(DEFUN |SUP;outputForm;$2Of;32| (|p| |v| $)
  (PROG (|l| #1=#:G335 |t| #2=#:G334)
    (RETURN
     (SEQ
      (LETT |l|
            (PROGN
             (LETT #2# NIL . #3=(|SUP;outputForm;$2Of;32|))
             (SEQ (LETT |t| NIL . #3#) (LETT #1# |p| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (|SUP;toutput| |t| |v| $) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (COND ((NULL |l|) (SPADCALL 0 (QREFELT $ 110)))
             ('T (SPADCALL (ELT $ 114) |l| (QREFELT $ 117))))))))) 

(DEFUN |SUP;coerce;$Of;33| (|p| $) (SPADCALL |p| "?" (QREFELT $ 118))) 

(DEFUN |SUP;elt;$2R;34| (|p| |val| $)
  (PROG (|co| #1=#:G339 |n| #2=#:G343 |tm|)
    (RETURN
     (SEQ
      (COND ((NULL |p|) (|spadConstant| $ 39))
            (#3='T
             (SEQ (LETT |co| (QCDR (|SPADfirst| |p|)) . #4=(|SUP;elt;$2R;34|))
                  (LETT |n| (QCAR (|SPADfirst| |p|)) . #4#)
                  (SEQ (LETT |tm| NIL . #4#) (LETT #2# (CDR |p|) . #4#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |tm| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |co|
                               (SPADCALL
                                (SPADCALL |co|
                                          (SPADCALL |val|
                                                    (PROG1
                                                        (LETT #1#
                                                              (- |n|
                                                                 (LETT |n|
                                                                       (QCAR
                                                                        |tm|)
                                                                       . #4#))
                                                              . #4#)
                                                      (|check_subtype|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                                    (QREFELT $ 104))
                                          (QREFELT $ 45))
                                (QCDR |tm|) (QREFELT $ 46))
                               . #4#)))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |n| 0) |co|)
                         (#3#
                          (SPADCALL |co| (SPADCALL |val| |n| (QREFELT $ 104))
                                    (QREFELT $ 45)))))))))))) 

(DEFUN |SUP;elt;3$;35| (|p| |val| $)
  (PROG (|coef| #1=#:G346 |n| #2=#:G350 |tm|)
    (RETURN
     (SEQ
      (COND ((NULL |p|) (|spadConstant| $ 17))
            (#3='T
             (SEQ
              (LETT |coef| (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 55))
                    . #4=(|SUP;elt;3$;35|))
              (LETT |n| (QCAR (|SPADfirst| |p|)) . #4#)
              (SEQ (LETT |tm| NIL . #4#) (LETT #2# (CDR |p|) . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |tm| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |coef|
                           (SPADCALL
                            (SPADCALL |coef|
                                      (SPADCALL |val|
                                                (PROG1
                                                    (LETT #1#
                                                          (- |n|
                                                             (LETT |n|
                                                                   (QCAR |tm|)
                                                                   . #4#))
                                                          . #4#)
                                                  (|check_subtype| (>= #1# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   #1#))
                                                (QREFELT $ 14))
                                      (QREFELT $ 27))
                            (SPADCALL (QCDR |tm|) (QREFELT $ 55))
                            (QREFELT $ 68))
                           . #4#)))
                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((EQL |n| 0) |coef|)
                     (#3#
                      (SPADCALL |coef| (SPADCALL |val| |n| (QREFELT $ 14))
                                (QREFELT $ 27)))))))))))) 

(DEFUN |SUP;monicDivide;2$R;36| (|p1| |p2| $)
  (PROG (|rout| #1=#:G358 |u| |n|)
    (RETURN
     (SEQ
      (COND ((NULL |p2|) (|error| "monicDivide: division by 0"))
            ((SPADCALL (SPADCALL |p2| (QREFELT $ 54)) (|spadConstant| $ 19)
                       (QREFELT $ 47))
             (|error| "Divisor Not Monic"))
            ((SPADCALL |p2| (|spadConstant| $ 18) (QREFELT $ 98))
             (CONS |p1| (|spadConstant| $ 17)))
            ((NULL |p1|) (CONS (|spadConstant| $ 17) (|spadConstant| $ 17)))
            (#2='T
             (COND
              ((< (SPADCALL |p1| (QREFELT $ 56))
                  (LETT |n| (SPADCALL |p2| (QREFELT $ 56))
                        . #3=(|SUP;monicDivide;2$R;36|)))
               (CONS (|spadConstant| $ 17) |p1|))
              (#2#
               (SEQ (LETT |rout| NIL . #3#) (LETT |p2| (CDR |p2|) . #3#)
                    (SEQ
                     (EXIT
                      (SEQ G190
                           (COND
                            ((NULL (COND ((NULL |p1|) 'NIL) ('T 'T)))
                             (GO G191)))
                           (SEQ
                            (LETT |u|
                                  (SPADCALL (QCAR (|SPADfirst| |p1|)) |n|
                                            (QREFELT $ 40))
                                  . #3#)
                            (EXIT
                             (COND
                              ((QEQCAR |u| 1)
                               (PROGN (LETT #1# |$NoValue| . #3#) (GO #1#)))
                              ('T
                               (SEQ
                                (LETT |rout|
                                      (CONS
                                       (CONS (QCDR |u|)
                                             (QCDR (|SPADfirst| |p1|)))
                                       |rout|)
                                      . #3#)
                                (EXIT
                                 (LETT |p1|
                                       (SPADCALL (CDR |p1|)
                                                 (QCAR (|SPADfirst| |rout|))
                                                 (QCDR (|SPADfirst| |rout|))
                                                 |p2| (QREFELT $ 100))
                                       . #3#)))))))
                           NIL (GO G190) G191 (EXIT NIL)))
                     #1# (EXIT #1#))
                    (EXIT (CONS (NREVERSE |rout|) |p1|))))))))))) 

(DEFUN |SUP;discriminant;$R;37| (|p| $) (SPADCALL |p| (QREFELT $ 124))) 

(DEFUN |SUP;subResultantGcd;3$;38| (|p1| |p2| $)
  (SPADCALL |p1| |p2| (QREFELT $ 126))) 

(DEFUN |SUP;resultant;2$R;39| (|p1| |p2| $)
  (SPADCALL |p1| |p2| (QREFELT $ 128))) 

(DEFUN |SUP;content;$R;40| (|p| $)
  (PROG (#1=#:G368 #2=#:G367 #3=#:G369 #4=#:G371 |tm|)
    (RETURN
     (SEQ
      (COND ((NULL |p|) (|spadConstant| $ 39))
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|SUP;content;$R;40|))
              (SEQ (LETT |tm| NIL . #6#) (LETT #4# |p| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |tm| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3# (QCDR |tm|) . #6#)
                      (COND
                       (#1#
                        (LETT #2# (SPADCALL #2# #3# (QREFELT $ 130)) . #6#))
                       ('T
                        (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# (|spadConstant| $ 39)))))))))) 

(DEFUN |SUP;primitivePart;2$;41| (|p| $)
  (PROG (#1=#:G374 |ct|)
    (RETURN
     (SEQ
      (COND ((NULL |p|) |p|)
            ('T
             (SEQ
              (LETT |ct| (SPADCALL |p| (QREFELT $ 131))
                    . #2=(|SUP;primitivePart;2$;41|))
              (EXIT
               (SPADCALL
                (PROG2 (LETT #1# (SPADCALL |p| |ct| (QREFELT $ 132)) . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) $ #1#))
                (QREFELT $ 133)))))))))) 

(DEFUN |SUP;gcd;3$;42| (|p1| |p2| $) (SPADCALL |p1| |p2| (QREFELT $ 135))) 

(DEFUN |SUP;divide;2$R;43| (|p1| |p2| $)
  (PROG (|rout| #1=#:G387 |u| |n| |ct|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p2| (QREFELT $ 31)) (|error| "Division by 0"))
            ((SPADCALL |p2| (|spadConstant| $ 18) (QREFELT $ 98))
             (CONS |p1| (|spadConstant| $ 17)))
            ('T
             (SEQ
              (LETT |ct| (SPADCALL (QCDR (|SPADfirst| |p2|)) (QREFELT $ 137))
                    . #2=(|SUP;divide;2$R;43|))
              (LETT |n| (QCAR (|SPADfirst| |p2|)) . #2#)
              (LETT |p2| (CDR |p2|) . #2#) (LETT |rout| NIL . #2#)
              (SEQ
               (EXIT
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |p1| (|spadConstant| $ 17) (QREFELT $ 138)))
                       (GO G191)))
                     (SEQ
                      (LETT |u|
                            (SPADCALL (QCAR (|SPADfirst| |p1|)) |n|
                                      (QREFELT $ 40))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN (LETT #1# |$NoValue| . #2#) (GO #1#)))
                        ('T
                         (SEQ
                          (LETT |rout|
                                (CONS
                                 (CONS (QCDR |u|)
                                       (SPADCALL |ct| (QCDR (|SPADfirst| |p1|))
                                                 (QREFELT $ 45)))
                                 |rout|)
                                . #2#)
                          (EXIT
                           (LETT |p1|
                                 (SPADCALL (CDR |p1|)
                                           (QCAR (|SPADfirst| |rout|))
                                           (QCDR (|SPADfirst| |rout|)) |p2|
                                           (QREFELT $ 100))
                                 . #2#)))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #1# (EXIT #1#))
              (EXIT (CONS (NREVERSE |rout|) |p1|))))))))) 

(DEFUN |SUP;/;$R$;44| (|p| |co| $)
  (SPADCALL (SPADCALL |co| (QREFELT $ 137)) |p| (QREFELT $ 103))) 

(DEFUN |SparseUnivariatePolynomial| (#1=#:G433)
  (PROG ()
    (RETURN
     (PROG (#2=#:G434)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|SparseUnivariatePolynomial|)
                                           '|domainEqualList|)
                . #3=(|SparseUnivariatePolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|SparseUnivariatePolynomial;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|SparseUnivariatePolynomial|))))))))))) 

(DEFUN |SparseUnivariatePolynomial;| (|#1|)
  (PROG (#1=#:G432 |pv$| #2=#:G431 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|SparseUnivariatePolynomial|))
      (LETT |dv$| (LIST '|SparseUnivariatePolynomial| DV$1) . #3#)
      (LETT $ (GETREFV 183) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#1|
                                                         '(|canonicalUnitNormal|))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory|
                                            (|SingletonAsOrderedSet|)
                                            '(|PatternMatchable| (|Float|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory|
                                            (|SingletonAsOrderedSet|)
                                            '(|PatternMatchable| (|Integer|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory|
                                            (|SingletonAsOrderedSet|)
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Float|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory|
                                            (|SingletonAsOrderedSet|)
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|InputForm|)))
                                           (|HasCategory|
                                            (|SingletonAsOrderedSet|)
                                            '(|ConvertibleTo| (|InputForm|))))
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|)))
                                          (|HasCategory| |#1| '(|StepThrough|))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|)))))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|GcdDomain|))
                                                . #3#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1| '(|Field|)) #2#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1|
                                                          '(|PolynomialFactorizationExplicit|)))
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              #2#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|SparseUnivariatePolynomial| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #3#)
       (|augmentPredVector| $ 33554432))
      (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 67108864))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|List|
                 (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |#1|))))
      (QSETREFV $ 8 63)
      (QSETREFV $ 9 (|UnivariatePolynomialMultiplicationPackage| |#1| $))
      (COND
       ((|HasCategory| |#1| '(|FieldOfPrimeCharacteristic|))
        (PROGN
         (QSETREFV $ 16 (CONS (|dispatchFunction| |SUP;^;$Pi$;3|) $))
         (QSETREFV $ 14 (CONS (|dispatchFunction| |SUP;^;$Nni$;4|) $)))))
      (COND
       ((|HasCategory| |#1| '(|FiniteFieldCategory|))
        (COND
         ((|testBitVector| |pv$| 1)
          (PROGN
           (QSETREFV $ 73
                     (CONS
                      (|dispatchFunction| |SUP;squareFreePolynomial;SupF;18|)
                      $))
           (QSETREFV $ 78
                     (CONS (|dispatchFunction| |SUP;factorPolynomial;SupF;19|)
                           $))
           (QSETREFV $ 79
                     (CONS
                      (|dispatchFunction|
                       |SUP;factorSquareFreePolynomial;SupF;20|)
                      $))
           (QSETREFV $ 81
                     (CONS (|dispatchFunction| |SUP;gcdPolynomial;3Sup;21|) $))
           (QSETREFV $ 86 (CONS (|dispatchFunction| |SUP;factor;$F;22|) $))
           (QSETREFV $ 93
                     (CONS
                      (|dispatchFunction|
                       |SUP;solveLinearPolynomialEquation;LSupU;23|)
                      $))))))
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 93
                   (CONS
                    (|dispatchFunction|
                     |SUP;solveLinearPolynomialEquation;LSupU;24|)
                    $))
         (QSETREFV $ 78
                   (CONS (|dispatchFunction| |SUP;factorPolynomial;SupF;25|)
                         $))
         (QSETREFV $ 79
                   (CONS
                    (|dispatchFunction|
                     |SUP;factorSquareFreePolynomial;SupF;26|)
                    $)))))
      (COND
       ((|testBitVector| |pv$| 17)
        (COND
         ((|HasCategory| |#1| '(|Approximate|))
          (QSETREFV $ 101 (CONS (|dispatchFunction| |SUP;exquo;2$U;27|) $)))
         ('T
          (QSETREFV $ 101 (CONS (|dispatchFunction| |SUP;exquo;2$U;28|) $))))))
      (COND
       ((|testBitVector| |pv$| 17)
        (PROGN
         (QSETREFV $ 125
                   (CONS (|dispatchFunction| |SUP;discriminant;$R;37|) $))
         (QSETREFV $ 127
                   (CONS (|dispatchFunction| |SUP;subResultantGcd;3$;38|) $))
         (QSETREFV $ 129
                   (CONS (|dispatchFunction| |SUP;resultant;2$R;39|) $)))))
      (COND
       ((|testBitVector| |pv$| 22)
        (PROGN
         (QSETREFV $ 131 (CONS (|dispatchFunction| |SUP;content;$R;40|) $))
         (QSETREFV $ 134
                   (CONS (|dispatchFunction| |SUP;primitivePart;2$;41|) $))
         (QSETREFV $ 136 (CONS (|dispatchFunction| |SUP;gcd;3$;42|) $)))))
      (COND
       ((|testBitVector| |pv$| 16)
        (PROGN
         (QSETREFV $ 139 (CONS (|dispatchFunction| |SUP;divide;2$R;43|) $))
         (QSETREFV $ 140 (CONS (|dispatchFunction| |SUP;/;$R$;44|) $)))))
      $)))) 

(MAKEPROP '|SparseUnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 13) (|local| |#1|) '|Rep|
              '|kBound| '|upmp| (|SparseUnivariatePolynomial| 6)
              |SUP;makeSUP;2$;1| |SUP;unmakeSUP;2$;2| (|NonNegativeInteger|)
              (0 . ^) (|PositiveInteger|) (6 . ^) (12 . |Zero|) (16 . |One|)
              (20 . |One|) (|Integer|) (24 . ^) (|Boolean|) (30 . |zero?|)
              (35 . |characteristic|) (|RepeatedSquaring| $$) (39 . |expt|)
              (45 . *) (51 . >) (57 . |binomThmExpt|) (64 . |primeFrobenius|)
              |SUP;zero?;$B;5| (69 . =) |SUP;one?;$B;6| |SUP;ground?;$B;7|
              |SUP;multiplyExponents;$Nni$;8| (|Union| $ '"failed")
              (75 . |exquo|) |SUP;divideExponents;$NniU;9| (81 . |Zero|)
              (85 . |subtractIfCan|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |SUP;karatsubaDivide;$NniR;10| |SUP;shiftRight;$Nni$;11|
              |SUP;shiftLeft;$Nni$;12| (91 . *) (97 . +) (103 . ~=)
              |SUP;pomopo!;$RNni2$;13| |SUP;univariate;2$;14|
              (|SingletonAsOrderedSet|) |SUP;multivariate;$Saos$;15|
              (|SparseUnivariatePolynomial| $$) (109 . |Zero|)
              (113 . |leadingCoefficient|) (118 . |coerce|) (123 . |degree|)
              (128 . |monomial|) (134 . |reductum|)
              (|SparseUnivariatePolynomial| $) |SUP;univariate;$SaosSup;16|
              (139 . +) (145 . |zero?|) (150 . |leadingCoefficient|)
              (155 . |degree|) (160 . |monomial|) (166 . |reductum|)
              |SUP;multivariate;SupSaos$;17| (171 . +) (|Factored| 52)
              (|UnivariatePolynomialSquareFree| $$ 52) (177 . |squareFree|)
              (|Factored| 59) (182 . |squareFreePolynomial|) (|Factored| 75)
              (|SparseUnivariatePolynomial| 10) (|TwoFactorize| 6)
              (187 . |generalTwoFactor|) (192 . |factorPolynomial|)
              (197 . |factorSquareFreePolynomial|) (202 . |gcd|)
              (208 . |gcdPolynomial|) (|Factored| $$)
              (|DistinctDegreeFactorize| 6 $$) (214 . |factor|) (|Factored| $)
              (219 . |factor|) (|Union| 88 '"failed") (|List| 52)
              (|FiniteFieldSolveLinearPolynomialEquation| 6 $$ 52)
              (224 . |solveLinearPolynomialEquation|) (|Union| 92 '#1="failed")
              (|List| 59) (230 . |solveLinearPolynomialEquation|)
              (|PolynomialFactorizationByRecursionUnivariate| 6 $$)
              (236 . |solveLinearPolynomialEquationByRecursion|)
              (242 . |factorByRecursion|) (247 . |factorSquareFreeByRecursion|)
              (252 . =) (258 . |exquo|) |SUP;fmecg;$NniR2$;29| (264 . |exquo|)
              (270 . -) (275 . *) (281 . ^) |SUP;pseudoRemainder;3$;30|
              (|OutputForm|) (287 . |coerce|) (292 . |coerce|) (297 . ^)
              (303 . |coerce|) (308 . =) (314 . -) (319 . *) (325 . +)
              (|Mapping| 106 106 106) (|List| 106) (331 . |reduce|)
              |SUP;outputForm;$2Of;32| |SUP;coerce;$Of;33| |SUP;elt;$2R;34|
              |SUP;elt;3$;35| |SUP;monicDivide;2$R;36|
              (|PseudoRemainderSequence| 6 $$) (337 . |discriminant|)
              (342 . |discriminant|) (347 . |subResultantGcd|)
              (353 . |subResultantGcd|) (359 . |resultant|) (365 . |resultant|)
              (371 . |gcd|) (377 . |content|) (382 . |exquo|)
              (388 . |unitCanonical|) (393 . |primitivePart|)
              (398 . |gcdPolynomial|) (404 . |gcd|) (410 . |inv|) (415 . ~=)
              (421 . |divide|) (427 . /) (|Union| 162 '#1#) (|Matrix| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 20)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 20 $)
              (|Fraction| 20) (|Record| (|:| |coef| 150) (|:| |generator| $))
              (|List| $) (|Union| 150 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 153 '"failed") (|Fraction| $)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |coef| 6) (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 155 '"failed") (|Matrix| 20)
              (|Record| (|:| |mat| 160) (|:| |vec| (|Vector| 20))) (|Vector| $)
              (|Symbol|) (|List| 163) (|List| 13) (|Union| 148 '#2="failed")
              (|Union| 20 '#2#) (|Mapping| 6 6) (|Vector| 6) (|List| 50)
              (|Record| (|:| |var| 50) (|:| |exponent| 13))
              (|Union| 171 '#3="failed") (|Union| 50 '#3#) (|Matrix| 6)
              (|Record| (|:| |mat| 174) (|:| |vec| 169)) (|List| 6)
              (|Equation| $) (|List| 177) (|Union| 6 '#2#) (|Mapping| 13 13)
              (|SingleInteger|) (|String|))
           '#(~= 433 |zero?| 439 |vectorise| 444 |variables| 450 |unmakeSUP|
              455 |univariate| 460 |unitNormal| 471 |unitCanonical| 476 |unit?|
              481 |totalDegreeSorted| 486 |totalDegree| 492 |subtractIfCan| 503
              |subResultantGcd| 509 |squareFreePolynomial| 515 |squareFreePart|
              520 |squareFree| 525 |solveLinearPolynomialEquation| 530
              |smaller?| 536 |sizeLess?| 542 |shiftRight| 548 |shiftLeft| 554
              |separate| 560 |sample| 566 |retractIfCan| 570 |retract| 590
              |resultant| 610 |rem| 623 |reductum| 629 |reducedSystem| 634
              |recip| 656 |quo| 661 |pseudoRemainder| 667 |pseudoQuotient| 673
              |pseudoDivide| 679 |principalIdeal| 685 |primitivePart| 690
              |primitiveMonomials| 701 |prime?| 706 |pomopo!| 711
              |patternMatch| 719 |outputForm| 733 |order| 739 |one?| 745
              |numberOfMonomials| 750 |nextItem| 755 |multivariate| 760
              |multiplyExponents| 772 |multiEuclidean| 778 |monomials| 784
              |monomial?| 789 |monomial| 794 |monicDivide| 814 |minimumDegree|
              827 |mapExponents| 844 |map| 850 |makeSUP| 856 |mainVariable| 861
              |leadingMonomial| 866 |leadingCoefficient| 871 |lcm| 876 |latex|
              887 |karatsubaDivide| 892 |isTimes| 898 |isPlus| 903 |isExpt| 908
              |integrate| 913 |init| 918 |hash| 922 |ground?| 927 |ground| 932
              |gcdPolynomial| 937 |gcd| 943 |fmecg| 954
              |factorSquareFreePolynomial| 962 |factorPolynomial| 967 |factor|
              972 |extendedEuclidean| 977 |exquo| 990 |expressIdealMember| 1002
              |eval| 1008 |euclideanSize| 1062 |elt| 1067 |divideExponents|
              1097 |divide| 1103 |discriminant| 1109 |differentiate| 1120
              |degree| 1203 |convert| 1220 |content| 1235 |conditionP| 1246
              |composite| 1251 |coerce| 1263 |coefficients| 1293 |coefficient|
              1298 |charthRoot| 1318 |characteristic| 1323 |binomThmExpt| 1327
              |associates?| 1334 ^ 1340 |Zero| 1352 |One| 1356 D 1360 = 1436 /
              1442 - 1448 + 1459 * 1465)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 1 16 0 1 16 0 25 24 0 0 9 12 17 0 0 0 9
                                  10 11 12 15 23 17 17 20 0 0 9 18 0 0 0 0 9 9
                                  12 0 0 0 0 0 0 0 0 3 4 8 19 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 2 5 6 7 13 14 16 12 17 17))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| |IntegralDomain&|
                |DifferentialExtension&| |FullyLinearlyExplicitRingOver&|
                |Algebra&| |Algebra&| |Algebra&| |PartialDifferentialRing&|
                |DifferentialRing&| NIL |Module&| NIL NIL |Module&| NIL NIL
                |Module&| NIL |PartialDifferentialRing&| |Ring&| NIL NIL NIL
                NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                NIL NIL NIL NIL |Evalable&| |FullyRetractableTo&|
                |SetCategory&| NIL NIL |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| |InnerEvalable&| |RetractableTo&| NIL
                |BasicType&| NIL NIL NIL NIL NIL |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 13 50)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 13) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 13)
                 (|GcdDomain|) (|IntegralDomain|) (|DifferentialExtension| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| 148)
                 (|Algebra| 6) (|Algebra| $$) (|PartialDifferentialRing| 50)
                 (|DifferentialRing|) (|LinearlyExplicitRingOver| 6)
                 (|Module| 148) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitRingOver| 20) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|PartialDifferentialRing| 163)
                 (|Ring|) (|BiModule| 6 6) (|BiModule| 148 148)
                 (|BiModule| $$ $$) (|Rng|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| $$) (|LeftModule| 148) (|RightModule| 148)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 20)
                 (|Comparable|) (|StepThrough|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Eltable| $$ $$)
                 (|Eltable| 6 6) (|RetractableTo| 50) (|InnerEvalable| 50 $$)
                 (|InnerEvalable| 50 6) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 6) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 106) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 144) (|ConvertibleTo| 145)
                 (|ConvertibleTo| 143) (|RetractableTo| 148)
                 (|RetractableTo| 20) (|additiveValuation|) (|CommutativeStar|)
                 (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 182
                                  '(2 0 0 0 13 14 2 0 0 0 15 16 0 0 0 17 0 0 0
                                    18 0 6 0 19 2 6 0 0 20 21 1 6 22 0 23 0 6
                                    13 24 2 25 2 2 15 26 2 0 0 0 0 27 2 13 22 0
                                    0 28 3 0 0 0 0 13 29 1 6 0 0 30 2 6 22 0 0
                                    32 2 20 36 0 0 37 0 6 0 39 2 13 36 0 0 40 2
                                    6 0 0 0 45 2 6 0 0 0 46 2 6 22 0 0 47 0 52
                                    0 53 1 0 6 0 54 1 0 0 6 55 1 0 13 0 56 2 52
                                    0 2 13 57 1 0 0 0 58 2 52 0 0 0 61 1 52 22
                                    0 62 1 52 2 0 63 1 52 13 0 64 2 0 0 6 13 65
                                    1 52 0 0 66 2 0 0 0 0 68 1 70 69 52 71 1 0
                                    72 59 73 1 76 74 75 77 1 0 72 59 78 1 0 72
                                    59 79 2 52 0 0 0 80 2 0 59 59 59 81 1 83 82
                                    2 84 1 0 85 0 86 2 89 87 88 52 90 2 0 91 92
                                    59 93 2 94 87 88 52 95 1 94 69 52 96 1 94
                                    69 52 97 2 0 22 0 0 98 2 6 36 0 0 99 2 0 36
                                    0 0 101 1 6 0 0 102 2 0 0 6 0 103 2 6 0 0
                                    13 104 1 6 106 0 107 1 13 106 0 108 2 106 0
                                    0 0 109 1 20 106 0 110 2 106 22 0 0 111 1
                                    106 0 0 112 2 106 0 0 0 113 2 106 0 0 0 114
                                    2 116 106 115 0 117 1 123 6 2 124 1 0 6 0
                                    125 2 123 2 2 2 126 2 0 0 0 0 127 2 123 6 2
                                    2 128 2 0 6 0 0 129 2 6 0 0 0 130 1 0 6 0
                                    131 2 0 36 0 6 132 1 0 0 0 133 1 0 0 0 134
                                    2 6 59 59 59 135 2 0 0 0 0 136 1 6 0 0 137
                                    2 0 22 0 0 138 2 0 41 0 0 139 2 0 0 0 6 140
                                    2 0 22 0 0 138 1 0 22 0 31 2 0 169 0 13 1 1
                                    0 170 0 1 1 0 0 10 12 2 0 59 0 50 60 1 0 10
                                    0 49 1 17 157 0 1 1 17 0 0 133 1 17 22 0 1
                                    2 0 13 0 170 1 2 0 13 0 170 1 1 0 13 0 1 2
                                    0 36 0 0 1 2 17 0 0 0 127 1 1 72 59 73 1 22
                                    0 0 1 1 22 85 0 1 2 1 91 92 59 93 2 8 22 0
                                    0 1 2 16 22 0 0 1 2 0 0 0 13 43 2 0 0 0 13
                                    44 2 22 156 0 0 1 0 0 0 1 1 13 166 0 1 1 14
                                    167 0 1 1 0 173 0 1 1 0 179 0 1 1 13 148 0
                                    1 1 14 20 0 1 1 0 50 0 1 1 0 6 0 1 2 12 6 0
                                    0 129 3 12 0 0 0 50 1 2 16 0 0 0 1 1 0 0 0
                                    58 1 15 160 142 1 2 15 161 142 162 1 1 0
                                    174 142 1 2 0 175 142 162 1 1 0 36 0 1 2 16
                                    0 0 0 1 2 0 0 0 0 105 2 17 0 0 0 1 2 17 158
                                    0 0 1 1 16 149 150 1 2 22 0 0 50 1 1 22 0 0
                                    134 1 0 150 0 1 1 1 22 0 1 4 0 0 0 6 13 0
                                    48 3 3 146 0 144 146 1 3 4 147 0 145 147 1
                                    2 0 106 0 106 118 2 17 13 0 0 1 1 0 22 0 33
                                    1 0 13 0 1 1 19 36 0 1 2 0 0 59 50 67 2 0 0
                                    10 50 51 2 0 0 0 13 35 2 16 151 150 0 1 1 0
                                    150 0 1 1 0 22 0 1 3 0 0 0 50 13 1 3 0 0 0
                                    170 165 1 2 0 0 6 13 65 2 0 41 0 0 122 3 0
                                    41 0 0 50 1 2 0 13 0 50 1 2 0 165 0 170 1 1
                                    0 13 0 1 2 0 0 180 0 1 2 0 0 168 0 1 1 0 10
                                    0 11 1 0 173 0 1 1 0 0 0 1 1 0 6 0 54 2 22
                                    0 0 0 1 1 22 0 150 1 1 0 182 0 1 2 0 41 0
                                    13 42 1 0 151 0 1 1 0 151 0 1 1 0 172 0 1 1
                                    9 0 0 1 0 19 0 1 1 0 181 0 1 1 0 22 0 34 1
                                    0 6 0 1 2 22 59 59 59 81 2 22 0 0 0 136 1
                                    22 0 150 1 4 0 0 0 13 6 0 100 1 1 72 59 79
                                    1 1 72 59 78 1 1 85 0 86 2 16 152 0 0 1 3
                                    16 154 0 0 0 1 2 17 36 0 0 101 2 17 36 0 6
                                    132 2 16 151 150 0 1 3 0 0 0 170 150 1 3 0
                                    0 0 170 176 1 3 0 0 0 50 0 1 3 0 0 0 50 6 1
                                    3 0 0 0 0 0 1 3 0 0 0 150 150 1 2 0 0 0 177
                                    1 2 0 0 0 178 1 1 16 13 0 1 2 16 6 155 6 1
                                    2 17 155 0 155 1 2 17 155 155 155 1 2 0 6 0
                                    6 120 2 0 0 0 0 121 2 0 36 0 13 38 2 16 41
                                    0 0 139 1 12 6 0 125 2 12 0 0 50 1 3 20 0 0
                                    164 165 1 3 20 0 0 163 13 1 2 20 0 0 163 1
                                    2 20 0 0 164 1 3 0 0 0 168 0 1 2 0 0 0 168
                                    1 3 0 0 0 168 13 1 1 0 0 0 1 2 0 0 0 13 1 3
                                    0 0 0 170 165 1 2 0 0 0 170 1 3 0 0 0 50 13
                                    1 2 0 0 0 50 1 2 0 165 0 170 1 2 0 13 0 50
                                    1 1 0 13 0 56 1 7 143 0 1 1 5 144 0 1 1 6
                                    145 0 1 2 22 0 0 50 1 1 22 6 0 131 1 26 141
                                    142 1 2 17 159 155 0 1 2 17 36 0 0 1 1 21 0
                                    148 1 1 17 0 0 1 1 0 0 50 1 1 0 0 6 55 1 0
                                    0 20 1 1 0 106 0 119 1 0 176 0 1 3 0 0 0 50
                                    13 1 3 0 0 0 170 165 1 2 0 6 0 13 1 1 27 36
                                    0 1 0 0 13 1 3 12 0 0 0 13 29 2 17 22 0 0 1
                                    2 0 0 0 13 14 2 0 0 0 15 16 0 0 0 17 0 0 0
                                    18 3 20 0 0 163 13 1 3 20 0 0 164 165 1 2
                                    20 0 0 164 1 2 20 0 0 163 1 2 0 0 0 168 1 3
                                    0 0 0 168 13 1 1 0 0 0 1 2 0 0 0 13 1 3 0 0
                                    0 170 165 1 3 0 0 0 50 13 1 2 0 0 0 50 1 2
                                    0 0 0 170 1 2 0 22 0 0 98 2 16 0 0 6 140 1
                                    0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 68 2 9 0 0
                                    148 1 2 9 0 148 0 1 2 0 0 0 6 1 2 0 0 6 0
                                    103 2 0 0 0 0 27 2 0 0 20 0 1 2 0 0 13 0 1
                                    2 0 0 15 0 1)))))
           '|lookupComplete|)) 
