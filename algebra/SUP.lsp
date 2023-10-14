
(/VERSIONCHECK 2) 

(PUT '|SUP;makeSUP;2$;1| '|SPADreplace| '(XLAM (|p|) |p|)) 

(DEFUN |SUP;makeSUP;2$;1| (|p| $) |p|) 

(PUT '|SUP;unmakeSUP;2$;2| '|SPADreplace| '(XLAM (|sp|) |sp|)) 

(DEFUN |SUP;unmakeSUP;2$;2| (|sp| $) |sp|) 

(DEFUN |SUP;^;$Pi$;3| (|p| |np| $) (SPADCALL |p| |np| (QREFELT $ 12))) 

(DEFUN |SUP;^;$Nni$;4| (|p| |n| $)
  (PROG (|rn| |qn| |rec| #1=#:G173 |t| #2=#:G172 #3=#:G171 |y| |cc|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |p|) (|spadConstant| $ 15))
             ((ZEROP |n|) (|spadConstant| $ 16)) ((EQL |n| 1) |p|)
             (#4='T
              (COND
               ((NULL (CDR |p|))
                (COND
                 ((SPADCALL
                   (LETT |cc|
                         (SPADCALL (QCDR (|SPADfirst| |p|)) |n| (QREFELT $ 19))
                         . #5=(|SUP;^;$Nni$;4|))
                   (QREFELT $ 21))
                  (|spadConstant| $ 15))
                 (#4# (LIST (CONS (* |n| (QCAR (|SPADfirst| |p|))) |cc|)))))
               ((< (SPADCALL (QREFELT $ 22)) 3)
                (SPADCALL |p| |n| (QREFELT $ 24)))
               (#4#
                (SEQ (LETT |y| (|spadConstant| $ 16) . #5#)
                     (LETT |rec| (DIVIDE2 |n| (SPADCALL (QREFELT $ 22))) . #5#)
                     (LETT |qn| (QCAR |rec|) . #5#)
                     (LETT |rn| (QCDR |rec|) . #5#)
                     (SEQ G190 NIL
                          (SEQ
                           (COND
                            ((EQL |rn| 1)
                             (LETT |y| (SPADCALL |y| |p| (QREFELT $ 25))
                                   . #5#)))
                           (COND
                            ((SPADCALL |rn| 1 (QREFELT $ 26))
                             (LETT |y|
                                   (SPADCALL |y|
                                             (SPADCALL (LIST (|SPADfirst| |p|))
                                                       (CDR |p|) |rn|
                                                       (QREFELT $ 27))
                                             (QREFELT $ 25))
                                   . #5#)))
                           (EXIT
                            (COND
                             ((ZEROP |qn|)
                              (PROGN (LETT #3# |y| . #5#) (GO #3#)))
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
                                                        (SPADCALL
                                                         (QREFELT $ 22)))
                                                     (SPADCALL (QCDR |t|)
                                                               (QREFELT $ 28)))
                                                    #2#)
                                                   . #5#)))
                                           (LETT #1# (CDR #1#) . #5#) (GO G190)
                                           G191 (EXIT (NREVERSE #2#))))
                                     . #5#)
                               (LETT |rec|
                                     (DIVIDE2 |qn| (SPADCALL (QREFELT $ 22)))
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
    (SPADCALL (QCDR (|SPADfirst| |p|)) (|spadConstant| $ 17) (QREFELT $ 30))))) 

(DEFUN |SUP;ground?;$B;7| (|p| $)
  (COND ((NULL |p|) 'T) ((NULL (CDR |p|)) (ZEROP (QCAR (|SPADfirst| |p|))))
        ('T 'NIL))) 

(DEFUN |SUP;multiplyExponents;$Nni$;8| (|p| |n| $)
  (PROG (#1=#:G188 |u| #2=#:G187)
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
  (PROG (#1=#:G197 |u| |m|)
    (RETURN
     (SEQ
      (COND ((NULL |p|) (CONS 0 |p|))
            (#2='T
             (SEQ
              (LETT |m| (SPADCALL (QCAR (|SPADfirst| |p|)) |n| (QREFELT $ 35))
                    . #3=(|SUP;divideExponents;$NniU;9|))
              (EXIT
               (COND ((QEQCAR |m| 1) (CONS 1 "failed"))
                     (#2#
                      (SEQ
                       (LETT |u| (SPADCALL (CDR |p|) |n| (QREFELT $ 36)) . #3#)
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
  (PROG (|highp| #1=#:G206 |lowp| #2=#:G209 |t|)
    (RETURN
     (SEQ
      (COND ((ZEROP |n|) (CONS |p| (|spadConstant| $ 15)))
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
                                                       (QREFELT $ 38))
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
  (PROG (#1=#:G216 #2=#:G221 |t| #3=#:G220)
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
                          (LETT #1# (SPADCALL (QCAR |t|) |n| (QREFELT $ 38))
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
  (PROG (#1=#:G226 |t| #2=#:G225)
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
  (PROG (|rout| |u| |c2| |e2| #1=#:G237 |tm|)
    (RETURN
     (SEQ (LETT |rout| NIL . #2=(|SUP;pomopo!;$RNni2$;13|))
          (SEQ (LETT |tm| NIL . #2#) (LETT #1# |p2| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |e2| (+ |e| (QCAR |tm|)) . #2#)
                    (LETT |c2| (SPADCALL |r| (QCDR |tm|) (QREFELT $ 43)) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |c2| (|spadConstant| $ 37) (QREFELT $ 30))
                       "next term")
                      ('T
                       (SEQ
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |p1|) 'NIL)
                                      ('T
                                       (SPADCALL (QCAR (|SPADfirst| |p1|)) |e2|
                                                 (QREFELT $ 26)))))
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
                                           (QREFELT $ 44))
                                 . #2#)
                           (|spadConstant| $ 37) (QREFELT $ 45))
                          (LETT |rout| (CONS (CONS |e2| |u|) |rout|) . #2#)))
                        (EXIT (LETT |p1| (CDR |p1|) . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (NRECONC |rout| |p1|)))))) 

(PUT '|SUP;univariate;2$;14| '|SPADreplace| '(XLAM (|p|) |p|)) 

(DEFUN |SUP;univariate;2$;14| (|p| $) |p|) 

(PUT '|SUP;multivariate;$Saos$;15| '|SPADreplace| '(XLAM (|sup| |v|) |sup|)) 

(DEFUN |SUP;multivariate;$Saos$;15| (|sup| |v| $) |sup|) 

(DEFUN |SUP;univariate;$SaosSup;16| (|p| |v| $)
  (COND ((SPADCALL |p| (QREFELT $ 29)) (|spadConstant| $ 51))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 52)) (QREFELT $ 53))
                    (SPADCALL |p| (QREFELT $ 54)) (QREFELT $ 55))
          (SPADCALL (SPADCALL |p| (QREFELT $ 56)) |v| (QREFELT $ 58))
          (QREFELT $ 59))))) 

(DEFUN |SUP;multivariate;SupSaos$;17| (|supp| |v| $)
  (PROG (|lc|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |supp| (QREFELT $ 60)) (|spadConstant| $ 15))
            (#1='T
             (SEQ
              (LETT |lc| (SPADCALL |supp| (QREFELT $ 61))
                    |SUP;multivariate;SupSaos$;17|)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |lc| (QREFELT $ 54)) 0 (QREFELT $ 26))
                 (|error| "bad form polynomial"))
                (#1#
                 (SPADCALL
                  (SPADCALL (SPADCALL |lc| (QREFELT $ 52))
                            (SPADCALL |supp| (QREFELT $ 62)) (QREFELT $ 63))
                  (SPADCALL (SPADCALL |supp| (QREFELT $ 64)) |v|
                            (QREFELT $ 65))
                  (QREFELT $ 66)))))))))))) 

(DEFUN |SUP;squareFreePolynomial;SupF;18| (|pp| $)
  (SPADCALL |pp| (QREFELT $ 69))) 

(DEFUN |SUP;factorPolynomial;SupF;19| (|pp| $) (SPADCALL |pp| (QREFELT $ 75))) 

(DEFUN |SUP;factorSquareFreePolynomial;SupF;20| (|pp| $)
  (SPADCALL |pp| (QREFELT $ 75))) 

(DEFUN |SUP;gcdPolynomial;3Sup;21| (|pp| |qq| $)
  (SPADCALL |pp| |qq| (QREFELT $ 78))) 

(DEFUN |SUP;factor;$F;22| (|p| $) (SPADCALL |p| (QREFELT $ 82))) 

(DEFUN |SUP;solveLinearPolynomialEquation;LSupU;23| (|lpp| |pp| $)
  (SPADCALL |lpp| |pp| (QREFELT $ 88))) 

(DEFUN |SUP;solveLinearPolynomialEquation;LSupU;24| (|lpp| |pp| $)
  (SPADCALL |lpp| |pp| (QREFELT $ 93))) 

(DEFUN |SUP;factorPolynomial;SupF;25| (|pp| $) (SPADCALL |pp| (QREFELT $ 94))) 

(DEFUN |SUP;factorSquareFreePolynomial;SupF;26| (|pp| $)
  (SPADCALL |pp| (QREFELT $ 95))) 

(DEFUN |SUP;exquo;2$U;27| (|p1| |p2| $)
  (PROG (|rout| #1=#:G281 |ee| |a|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |p2|) (|error| "Division by 0"))
             ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 96))
              (CONS 0 |p1|))
             ((SPADCALL |p1| |p2| (QREFELT $ 96))
              (CONS 0 (|spadConstant| $ 16)))
             (#2='T
              (SEQ (LETT |rout| NIL . #3=(|SUP;exquo;2$U;27|))
                   (SEQ G190
                        (COND
                         ((NULL (COND ((NULL |p1|) 'NIL) ('T 'T))) (GO G191)))
                        (SEQ
                         (LETT |a|
                               (SPADCALL (QCDR (|SPADfirst| |p1|))
                                         (QCDR (|SPADfirst| |p2|))
                                         (QREFELT $ 97))
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
                                             (QREFELT $ 38))
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
                                                 (QREFELT $ 98))
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
  (PROG (|rout| #1=#:G297 |ee| |a|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |p2|) (|error| "Division by 0"))
             ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 96))
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
                                         (QREFELT $ 97))
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
                                             (QREFELT $ 38))
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
                                                 (QREFELT $ 98))
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
  (PROG (|rout| |u| |c2| |e2| #1=#:G308 |tm|)
    (RETURN
     (SEQ (LETT |rout| NIL . #2=(|SUP;fmecg;$NniR2$;29|))
          (LETT |r| (SPADCALL |r| (QREFELT $ 100)) . #2#)
          (SEQ (LETT |tm| NIL . #2#) (LETT #1# |p2| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |e2| (+ |e| (QCAR |tm|)) . #2#)
                    (LETT |c2| (SPADCALL |r| (QCDR |tm|) (QREFELT $ 43)) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |c2| (|spadConstant| $ 37) (QREFELT $ 30))
                       "next term")
                      ('T
                       (SEQ
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |p1|) 'NIL)
                                      ('T
                                       (SPADCALL (QCAR (|SPADfirst| |p1|)) |e2|
                                                 (QREFELT $ 26)))))
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
                                           (QREFELT $ 44))
                                 . #2#)
                           (|spadConstant| $ 37) (QREFELT $ 45))
                          (LETT |rout| (CONS (CONS |e2| |u|) |rout|) . #2#)))
                        (EXIT (LETT |p1| (CDR |p1|) . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (NRECONC |rout| |p1|)))))) 

(DEFUN |SUP;pseudoRemainder;3$;30| (|p1| |p2| $)
  (PROG (|e1| #1=#:G315 #2=#:G317 |u| #3=#:G310 |e| |co|)
    (RETURN
     (SEQ
      (COND ((NULL |p2|) (|error| "PseudoDivision by Zero"))
            ((NULL |p1|) (|spadConstant| $ 15))
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
                                       (QREFELT $ 38))
                             . #5#)
                       (EXIT
                        (COND
                         ((QEQCAR |u| 1)
                          (PROGN (LETT #2# |$NoValue| . #5#) (GO #2#))))))
                      (LETT |p1|
                            (SPADCALL
                             (SPADCALL |co| (CDR |p1|) (QREFELT $ 101))
                             (QCDR |u|) (QCDR (|SPADfirst| |p1|)) |p2|
                             (QREFELT $ 98))
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
                      (SPADCALL (SPADCALL |co| |e1| (QREFELT $ 102)) |p1|
                                (QREFELT $ 101)))))))))))) 

(DEFUN |SUP;toutput| (|t1| |v| $)
  (PROG (|mon|)
    (RETURN
     (SEQ
      (COND ((EQL (QCAR |t1|) 0) (SPADCALL (QCDR |t1|) (QREFELT $ 105)))
            (#1='T
             (SEQ
              (COND ((EQL (QCAR |t1|) 1) (LETT |mon| |v| . #2=(|SUP;toutput|)))
                    (#1#
                     (LETT |mon|
                           (SPADCALL |v| (SPADCALL (QCAR |t1|) (QREFELT $ 106))
                                     (QREFELT $ 107))
                           . #2#)))
              (EXIT
               (COND
                ((SPADCALL (QCDR |t1|) (|spadConstant| $ 17) (QREFELT $ 30))
                 |mon|)
                (#1#
                 (SEQ
                  (COND
                   ((SPADCALL (QCDR |t1|)
                              (SPADCALL (|spadConstant| $ 17) (QREFELT $ 100))
                              (QREFELT $ 30))
                    (COND
                     ((SPADCALL (SPADCALL (QCDR |t1|) (QREFELT $ 105))
                                (SPADCALL -1 (QREFELT $ 108)) (QREFELT $ 109))
                      (EXIT (SPADCALL |mon| (QREFELT $ 110)))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |t1|) (QREFELT $ 105)) |mon|
                             (QREFELT $ 111)))))))))))))) 

(DEFUN |SUP;outputForm;$2Of;32| (|p| |v| $)
  (PROG (|l| #1=#:G337 |t| #2=#:G336)
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
       (COND ((NULL |l|) (SPADCALL 0 (QREFELT $ 108)))
             ('T (SPADCALL (ELT $ 112) |l| (QREFELT $ 115))))))))) 

(DEFUN |SUP;coerce;$Of;33| (|p| $) (SPADCALL |p| "?" (QREFELT $ 116))) 

(DEFUN |SUP;elt;$2R;34| (|p| |val| $)
  (PROG (|co| #1=#:G341 |n| #2=#:G345 |tm|)
    (RETURN
     (SEQ
      (COND ((NULL |p|) (|spadConstant| $ 37))
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
                                                    (QREFELT $ 102))
                                          (QREFELT $ 43))
                                (QCDR |tm|) (QREFELT $ 44))
                               . #4#)))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |n| 0) |co|)
                         (#3#
                          (SPADCALL |co| (SPADCALL |val| |n| (QREFELT $ 102))
                                    (QREFELT $ 43)))))))))))) 

(DEFUN |SUP;elt;3$;35| (|p| |val| $)
  (PROG (|coef| #1=#:G348 |n| #2=#:G352 |tm|)
    (RETURN
     (SEQ
      (COND ((NULL |p|) (|spadConstant| $ 15))
            (#3='T
             (SEQ
              (LETT |coef| (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 53))
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
                                                (QREFELT $ 12))
                                      (QREFELT $ 25))
                            (SPADCALL (QCDR |tm|) (QREFELT $ 53))
                            (QREFELT $ 66))
                           . #4#)))
                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((EQL |n| 0) |coef|)
                     (#3#
                      (SPADCALL |coef| (SPADCALL |val| |n| (QREFELT $ 12))
                                (QREFELT $ 25)))))))))))) 

(DEFUN |SUP;monicDivide;2$R;36| (|p1| |p2| $)
  (PROG (|rout| #1=#:G360 |u| |n|)
    (RETURN
     (SEQ
      (COND ((NULL |p2|) (|error| "monicDivide: division by 0"))
            ((SPADCALL (SPADCALL |p2| (QREFELT $ 52)) (|spadConstant| $ 17)
                       (QREFELT $ 45))
             (|error| "Divisor Not Monic"))
            ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 96))
             (CONS |p1| (|spadConstant| $ 15)))
            ((NULL |p1|) (CONS (|spadConstant| $ 15) (|spadConstant| $ 15)))
            (#2='T
             (COND
              ((< (SPADCALL |p1| (QREFELT $ 54))
                  (LETT |n| (SPADCALL |p2| (QREFELT $ 54))
                        . #3=(|SUP;monicDivide;2$R;36|)))
               (CONS (|spadConstant| $ 15) |p1|))
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
                                            (QREFELT $ 38))
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
                                                 |p2| (QREFELT $ 98))
                                       . #3#)))))))
                           NIL (GO G190) G191 (EXIT NIL)))
                     #1# (EXIT #1#))
                    (EXIT (CONS (NREVERSE |rout|) |p1|))))))))))) 

(DEFUN |SUP;discriminant;$R;37| (|p| $) (SPADCALL |p| (QREFELT $ 122))) 

(DEFUN |SUP;subResultantGcd;3$;38| (|p1| |p2| $)
  (SPADCALL |p1| |p2| (QREFELT $ 124))) 

(DEFUN |SUP;resultant;2$R;39| (|p1| |p2| $)
  (SPADCALL |p1| |p2| (QREFELT $ 126))) 

(DEFUN |SUP;content;$R;40| (|p| $)
  (PROG (#1=#:G370 #2=#:G369 #3=#:G371 #4=#:G373 |tm|)
    (RETURN
     (SEQ
      (COND ((NULL |p|) (|spadConstant| $ 37))
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
                        (LETT #2# (SPADCALL #2# #3# (QREFELT $ 128)) . #6#))
                       ('T
                        (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# (|spadConstant| $ 37)))))))))) 

(DEFUN |SUP;primitivePart;2$;41| (|p| $)
  (PROG (#1=#:G376 |ct|)
    (RETURN
     (SEQ
      (COND ((NULL |p|) |p|)
            ('T
             (SEQ
              (LETT |ct| (SPADCALL |p| (QREFELT $ 129))
                    . #2=(|SUP;primitivePart;2$;41|))
              (EXIT
               (SPADCALL
                (PROG2 (LETT #1# (SPADCALL |p| |ct| (QREFELT $ 130)) . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) $ #1#))
                (QREFELT $ 131)))))))))) 

(DEFUN |SUP;gcd;3$;42| (|p1| |p2| $) (SPADCALL |p1| |p2| (QREFELT $ 133))) 

(DEFUN |SUP;divide;2$R;43| (|p1| |p2| $)
  (PROG (|rout| #1=#:G389 |u| |n| |ct|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p2| (QREFELT $ 29)) (|error| "Division by 0"))
            ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 96))
             (CONS |p1| (|spadConstant| $ 15)))
            ('T
             (SEQ
              (LETT |ct| (SPADCALL (QCDR (|SPADfirst| |p2|)) (QREFELT $ 135))
                    . #2=(|SUP;divide;2$R;43|))
              (LETT |n| (QCAR (|SPADfirst| |p2|)) . #2#)
              (LETT |p2| (CDR |p2|) . #2#) (LETT |rout| NIL . #2#)
              (SEQ
               (EXIT
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |p1| (|spadConstant| $ 15) (QREFELT $ 136)))
                       (GO G191)))
                     (SEQ
                      (LETT |u|
                            (SPADCALL (QCAR (|SPADfirst| |p1|)) |n|
                                      (QREFELT $ 38))
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
                                                 (QREFELT $ 43)))
                                 |rout|)
                                . #2#)
                          (EXIT
                           (LETT |p1|
                                 (SPADCALL (CDR |p1|)
                                           (QCAR (|SPADfirst| |rout|))
                                           (QCDR (|SPADfirst| |rout|)) |p2|
                                           (QREFELT $ 98))
                                 . #2#)))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #1# (EXIT #1#))
              (EXIT (CONS (NREVERSE |rout|) |p1|))))))))) 

(DEFUN |SUP;/;$R$;44| (|p| |co| $)
  (SPADCALL (SPADCALL |co| (QREFELT $ 135)) |p| (QREFELT $ 101))) 

(DEFUN |SparseUnivariatePolynomial| (#1=#:G437)
  (PROG ()
    (RETURN
     (PROG (#2=#:G438)
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
  (PROG (#1=#:G436 |pv$| #2=#:G434 #3=#:G435 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|SparseUnivariatePolynomial|))
      (LETT |dv$| (LIST '|SparseUnivariatePolynomial| DV$1) . #4#)
      (LETT $ (GETREFV 183) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
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
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|canonicalUnitNormal|))
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|GcdDomain|))
                                                . #4#)
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              #3#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3#
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
                                                               '(|CommutativeRing|))
                                                . #4#)
                                          (OR #2#
                                              (|HasCategory| |#1| '(|Field|))
                                              #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (OR #2# #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|SparseUnivariatePolynomial| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 134217728))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #4#)
       (|augmentPredVector| $ 268435456))
      (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 536870912))
      (AND
       (OR #3#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 1073741824))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|List|
                 (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |#1|))))
      (COND
       ((|HasCategory| |#1| '(|FieldOfPrimeCharacteristic|))
        (PROGN
         (QSETREFV $ 14 (CONS (|dispatchFunction| |SUP;^;$Pi$;3|) $))
         (QSETREFV $ 12 (CONS (|dispatchFunction| |SUP;^;$Nni$;4|) $)))))
      (COND
       ((|HasCategory| |#1| '(|FiniteFieldCategory|))
        (COND
         ((|testBitVector| |pv$| 1)
          (PROGN
           (QSETREFV $ 71
                     (CONS
                      (|dispatchFunction| |SUP;squareFreePolynomial;SupF;18|)
                      $))
           (QSETREFV $ 76
                     (CONS (|dispatchFunction| |SUP;factorPolynomial;SupF;19|)
                           $))
           (QSETREFV $ 77
                     (CONS
                      (|dispatchFunction|
                       |SUP;factorSquareFreePolynomial;SupF;20|)
                      $))
           (QSETREFV $ 79
                     (CONS (|dispatchFunction| |SUP;gcdPolynomial;3Sup;21|) $))
           (QSETREFV $ 84 (CONS (|dispatchFunction| |SUP;factor;$F;22|) $))
           (QSETREFV $ 91
                     (CONS
                      (|dispatchFunction|
                       |SUP;solveLinearPolynomialEquation;LSupU;23|)
                      $))))))
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 91
                   (CONS
                    (|dispatchFunction|
                     |SUP;solveLinearPolynomialEquation;LSupU;24|)
                    $))
         (QSETREFV $ 76
                   (CONS (|dispatchFunction| |SUP;factorPolynomial;SupF;25|)
                         $))
         (QSETREFV $ 77
                   (CONS
                    (|dispatchFunction|
                     |SUP;factorSquareFreePolynomial;SupF;26|)
                    $)))))
      (COND
       ((|testBitVector| |pv$| 16)
        (COND
         ((|HasCategory| |#1| '(|Approximate|))
          (QSETREFV $ 99 (CONS (|dispatchFunction| |SUP;exquo;2$U;27|) $)))
         ('T
          (QSETREFV $ 99 (CONS (|dispatchFunction| |SUP;exquo;2$U;28|) $))))))
      (COND
       ((|testBitVector| |pv$| 16)
        (PROGN
         (QSETREFV $ 123
                   (CONS (|dispatchFunction| |SUP;discriminant;$R;37|) $))
         (QSETREFV $ 125
                   (CONS (|dispatchFunction| |SUP;subResultantGcd;3$;38|) $))
         (QSETREFV $ 127
                   (CONS (|dispatchFunction| |SUP;resultant;2$R;39|) $)))))
      (COND
       ((|testBitVector| |pv$| 17)
        (PROGN
         (QSETREFV $ 129 (CONS (|dispatchFunction| |SUP;content;$R;40|) $))
         (QSETREFV $ 132
                   (CONS (|dispatchFunction| |SUP;primitivePart;2$;41|) $))
         (QSETREFV $ 134 (CONS (|dispatchFunction| |SUP;gcd;3$;42|) $)))))
      (COND
       ((|testBitVector| |pv$| 15)
        (PROGN
         (QSETREFV $ 137 (CONS (|dispatchFunction| |SUP;divide;2$R;43|) $))
         (QSETREFV $ 138 (CONS (|dispatchFunction| |SUP;/;$R$;44|) $)))))
      $)))) 

(MAKEPROP '|SparseUnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 11) (|local| |#1|) '|Rep|
              (|SparseUnivariatePolynomial| 6) |SUP;makeSUP;2$;1|
              |SUP;unmakeSUP;2$;2| (|NonNegativeInteger|) (0 . ^)
              (|PositiveInteger|) (6 . ^) (12 . |Zero|) (16 . |One|)
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
              |SUP;multivariate;SupSaos$;17| (171 . +) (|Factored| 50)
              (|UnivariatePolynomialSquareFree| $$ 50) (177 . |squareFree|)
              (|Factored| 57) (182 . |squareFreePolynomial|) (|Factored| 73)
              (|SparseUnivariatePolynomial| 8) (|TwoFactorize| 6)
              (187 . |generalTwoFactor|) (192 . |factorPolynomial|)
              (197 . |factorSquareFreePolynomial|) (202 . |gcd|)
              (208 . |gcdPolynomial|) (|Factored| $$)
              (|DistinctDegreeFactorize| 6 $$) (214 . |factor|) (|Factored| $)
              (219 . |factor|) (|Union| 86 '"failed") (|List| 50)
              (|FiniteFieldSolveLinearPolynomialEquation| 6 $$ 50)
              (224 . |solveLinearPolynomialEquation|) (|Union| 90 '#1="failed")
              (|List| 57) (230 . |solveLinearPolynomialEquation|)
              (|PolynomialFactorizationByRecursionUnivariate| 6 $$)
              (236 . |solveLinearPolynomialEquationByRecursion|)
              (242 . |factorByRecursion|) (247 . |factorSquareFreeByRecursion|)
              (252 . =) (258 . |exquo|) |SUP;fmecg;$NniR2$;29| (264 . |exquo|)
              (270 . -) (275 . *) (281 . ^) |SUP;pseudoRemainder;3$;30|
              (|OutputForm|) (287 . |coerce|) (292 . |coerce|) (297 . ^)
              (303 . |coerce|) (308 . =) (314 . -) (319 . *) (325 . +)
              (|Mapping| 104 104 104) (|List| 104) (331 . |reduce|)
              |SUP;outputForm;$2Of;32| |SUP;coerce;$Of;33| |SUP;elt;$2R;34|
              |SUP;elt;3$;35| |SUP;monicDivide;2$R;36|
              (|PseudoRemainderSequence| 6 $$) (337 . |discriminant|)
              (342 . |discriminant|) (347 . |subResultantGcd|)
              (353 . |subResultantGcd|) (359 . |resultant|) (365 . |resultant|)
              (371 . |gcd|) (377 . |content|) (382 . |exquo|)
              (388 . |unitCanonical|) (393 . |primitivePart|)
              (398 . |gcdPolynomial|) (404 . |gcd|) (410 . |inv|) (415 . ~=)
              (421 . |divide|) (427 . /) (|Union| 160 '#1#) (|Matrix| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 18)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 18 $)
              (|Fraction| 18) (|Record| (|:| |coef| 148) (|:| |generator| $))
              (|List| $) (|Union| 148 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 150 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Fraction| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |coef| 6) (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 153 '"failed")
              (|Record| (|:| |mat| 161) (|:| |vec| (|Vector| 18))) (|Vector| $)
              (|Matrix| 18) (|Symbol|) (|List| 162) (|List| 11)
              (|Union| 146 '#2="failed") (|Union| 18 '#2#) (|Mapping| 6 6)
              (|Vector| 6) (|Record| (|:| |var| 48) (|:| |exponent| 11))
              (|Union| 169 '"failed") (|List| 48) (|Union| 48 '#2#) (|List| 6)
              (|Equation| $) (|List| 174) (|Union| 6 '#2#) (|Mapping| 11 11)
              (|Record| (|:| |mat| 179) (|:| |vec| 168)) (|Matrix| 6)
              (|String|) (|SingleInteger|) (|HashState|))
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
              |leadingMonomial| 866 |leadingCoefficient| 871 |lcmCoef| 876
              |lcm| 882 |latex| 893 |karatsubaDivide| 898 |isTimes| 904
              |isPlus| 909 |isExpt| 914 |integrate| 919 |init| 924
              |hashUpdate!| 928 |hash| 934 |ground?| 939 |ground| 944
              |gcdPolynomial| 949 |gcd| 955 |fmecg| 966
              |factorSquareFreePolynomial| 974 |factorPolynomial| 979 |factor|
              984 |extendedEuclidean| 989 |exquo| 1002 |expressIdealMember|
              1014 |eval| 1020 |euclideanSize| 1074 |elt| 1079
              |divideExponents| 1109 |divide| 1115 |discriminant| 1121
              |differentiate| 1132 |degree| 1215 |convert| 1232 |content| 1247
              |conditionP| 1258 |composite| 1263 |coerce| 1275 |coefficients|
              1305 |coefficient| 1310 |charthRoot| 1330 |characteristic| 1335
              |binomThmExpt| 1339 |associates?| 1346 ^ 1352 |Zero| 1364 |One|
              1368 D 1372 = 1448 / 1454 - 1460 + 1471 * 1477)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 0 1 15 0 1 15 0 19 18 0 0 7 25 20 17 0 0
                                  0 7 8 9 25 14 25 20 20 22 0 0 7 27 0 0 0 0 7
                                  7 26 0 0 0 0 0 0 0 0 2 3 13 21 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 4 5 6 10 11 12 15 27 16 16))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL |DifferentialExtension&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| |Algebra&|
                |Algebra&| NIL |PartialDifferentialRing&| |DifferentialRing&|
                NIL |Module&| NIL NIL |Module&| NIL NIL |Module&| |EntireRing&|
                |PartialDifferentialRing&| |Ring&| NIL NIL NIL NIL NIL NIL NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&|
                NIL |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL NIL
                |Evalable&| |FullyRetractableTo&| |SetCategory&| NIL NIL NIL
                |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 11 48)
                 (|MaybeSkewPolynomialCategory| 6 11 48)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 11) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 11)
                 (|GcdDomain|) (|IntegralDomain|) (|DifferentialExtension| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| 146)
                 (|Algebra| 6) (|Algebra| $$) (|LeftOreRing|)
                 (|PartialDifferentialRing| 48) (|DifferentialRing|)
                 (|LinearlyExplicitRingOver| 6) (|Module| 146)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitRingOver| 18) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|PartialDifferentialRing| 162)
                 (|Ring|) (|BiModule| 6 6) (|BiModule| 146 146)
                 (|BiModule| $$ $$) (|Rng|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| $$) (|LeftModule| 146) (|RightModule| 146)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 18)
                 (|Comparable|) (|StepThrough|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Eltable| $$ $$)
                 (|Eltable| 6 6) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 48) (|InnerEvalable| 48 $$)
                 (|InnerEvalable| 48 6) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 6) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 104) (|ConvertibleTo| 142)
                 (|ConvertibleTo| 143) (|ConvertibleTo| 141)
                 (|RetractableTo| 146) (|RetractableTo| 18)
                 (|canonicalUnitNormal|) (|additiveValuation|)
                 (|CommutativeStar|) (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 182
                                  '(2 0 0 0 11 12 2 0 0 0 13 14 0 0 0 15 0 0 0
                                    16 0 6 0 17 2 6 0 0 18 19 1 6 20 0 21 0 6
                                    11 22 2 23 2 2 13 24 2 0 0 0 0 25 2 11 20 0
                                    0 26 3 0 0 0 0 11 27 1 6 0 0 28 2 6 20 0 0
                                    30 2 18 34 0 0 35 0 6 0 37 2 11 34 0 0 38 2
                                    6 0 0 0 43 2 6 0 0 0 44 2 6 20 0 0 45 0 50
                                    0 51 1 0 6 0 52 1 0 0 6 53 1 0 11 0 54 2 50
                                    0 2 11 55 1 0 0 0 56 2 50 0 0 0 59 1 50 20
                                    0 60 1 50 2 0 61 1 50 11 0 62 2 0 0 6 11 63
                                    1 50 0 0 64 2 0 0 0 0 66 1 68 67 50 69 1 0
                                    70 57 71 1 74 72 73 75 1 0 70 57 76 1 0 70
                                    57 77 2 50 0 0 0 78 2 0 57 57 57 79 1 81 80
                                    2 82 1 0 83 0 84 2 87 85 86 50 88 2 0 89 90
                                    57 91 2 92 85 86 50 93 1 92 67 50 94 1 92
                                    67 50 95 2 0 20 0 0 96 2 6 34 0 0 97 2 0 34
                                    0 0 99 1 6 0 0 100 2 0 0 6 0 101 2 6 0 0 11
                                    102 1 6 104 0 105 1 11 104 0 106 2 104 0 0
                                    0 107 1 18 104 0 108 2 104 20 0 0 109 1 104
                                    0 0 110 2 104 0 0 0 111 2 104 0 0 0 112 2
                                    114 104 113 0 115 1 121 6 2 122 1 0 6 0 123
                                    2 121 2 2 2 124 2 0 0 0 0 125 2 121 6 2 2
                                    126 2 0 6 0 0 127 2 6 0 0 0 128 1 0 6 0 129
                                    2 0 34 0 6 130 1 0 0 0 131 1 0 0 0 132 2 6
                                    57 57 57 133 2 0 0 0 0 134 1 6 0 0 135 2 0
                                    20 0 0 136 2 0 39 0 0 137 2 0 0 0 6 138 2 0
                                    20 0 0 136 1 0 20 0 29 2 0 168 0 11 1 1 0
                                    171 0 1 1 0 0 8 10 2 0 57 0 48 58 1 0 8 0
                                    47 1 16 156 0 1 1 16 0 0 131 1 16 20 0 1 2
                                    0 11 0 171 1 2 0 11 0 171 1 1 0 11 0 1 2 0
                                    34 0 0 1 2 16 0 0 0 125 1 1 70 57 71 1 17 0
                                    0 1 1 17 83 0 1 2 1 89 90 57 91 2 13 20 0 0
                                    1 2 15 20 0 0 1 2 0 0 0 11 41 2 0 0 0 11 42
                                    2 17 155 0 0 1 0 0 0 1 1 10 165 0 1 1 11
                                    166 0 1 1 0 172 0 1 1 0 176 0 1 1 10 146 0
                                    1 1 11 18 0 1 1 0 48 0 1 1 0 6 0 1 2 24 6 0
                                    0 127 3 24 0 0 0 48 1 2 15 0 0 0 1 1 0 0 0
                                    56 2 14 159 140 160 1 1 14 161 140 1 2 0
                                    178 140 160 1 1 0 179 140 1 1 0 34 0 1 2 15
                                    0 0 0 1 2 0 0 0 0 103 2 16 0 0 0 1 2 16 157
                                    0 0 1 1 15 147 148 1 2 17 0 0 48 1 1 17 0 0
                                    132 1 0 148 0 1 1 1 20 0 1 4 0 0 0 6 11 0
                                    46 3 2 144 0 142 144 1 3 3 145 0 143 145 1
                                    2 0 104 0 104 116 2 16 11 0 0 1 1 0 20 0 31
                                    1 0 11 0 1 1 21 34 0 1 2 0 0 8 48 49 2 0 0
                                    57 48 65 2 0 0 0 11 33 2 15 149 148 0 1 1 0
                                    148 0 1 1 0 20 0 1 2 0 0 6 11 63 3 0 0 0 48
                                    11 1 3 0 0 0 171 164 1 2 0 39 0 0 120 3 0
                                    39 0 0 48 1 2 0 11 0 48 1 2 0 164 0 171 1 1
                                    0 11 0 1 2 0 0 177 0 1 2 0 0 167 0 1 1 0 8
                                    0 9 1 0 172 0 1 1 0 0 0 1 1 0 6 0 52 2 17
                                    154 0 0 1 2 17 0 0 0 1 1 17 0 148 1 1 0 180
                                    0 1 2 0 39 0 11 40 1 0 149 0 1 1 0 149 0 1
                                    1 0 170 0 1 1 7 0 0 1 0 21 0 1 2 0 182 182
                                    0 1 1 0 181 0 1 1 0 20 0 32 1 0 6 0 1 2 17
                                    57 57 57 79 1 17 0 148 1 2 17 0 0 0 134 4 0
                                    0 0 11 6 0 98 1 1 70 57 77 1 1 70 57 76 1 1
                                    83 0 84 3 15 151 0 0 0 1 2 15 152 0 0 1 2
                                    16 34 0 0 99 2 16 34 0 6 130 2 15 149 148 0
                                    1 3 0 0 0 171 148 1 3 0 0 0 171 173 1 3 0 0
                                    0 48 0 1 3 0 0 0 48 6 1 3 0 0 0 0 0 1 3 0 0
                                    0 148 148 1 2 0 0 0 174 1 2 0 0 0 175 1 1
                                    15 11 0 1 2 15 6 153 6 1 2 16 153 0 153 1 2
                                    16 153 153 153 1 2 0 6 0 6 118 2 0 0 0 0
                                    119 2 0 34 0 11 36 2 15 39 0 0 137 1 24 6 0
                                    123 2 24 0 0 48 1 3 22 0 0 163 164 1 3 22 0
                                    0 162 11 1 2 22 0 0 162 1 2 22 0 0 163 1 3
                                    0 0 0 167 0 1 2 0 0 0 167 1 3 0 0 0 167 11
                                    1 1 0 0 0 1 2 0 0 0 11 1 3 0 0 0 171 164 1
                                    3 0 0 0 48 11 1 2 0 0 0 48 1 2 0 0 0 171 1
                                    1 0 11 0 54 2 0 11 0 48 1 2 0 164 0 171 1 1
                                    6 141 0 1 1 4 142 0 1 1 5 143 0 1 2 17 0 0
                                    48 1 1 17 6 0 129 1 29 139 140 1 2 16 158
                                    153 0 1 2 16 34 0 0 1 1 31 0 0 1 1 23 0 146
                                    1 1 0 0 48 1 1 0 0 6 53 1 0 0 18 1 1 0 104
                                    0 117 1 0 173 0 1 2 0 6 0 11 1 3 0 0 0 171
                                    164 1 3 0 0 0 48 11 1 1 30 34 0 1 0 0 11 1
                                    3 28 0 0 0 11 27 2 16 20 0 0 1 2 0 0 0 11
                                    12 2 0 0 0 13 14 0 0 0 15 0 0 0 16 3 22 0 0
                                    162 11 1 3 22 0 0 163 164 1 2 22 0 0 163 1
                                    2 22 0 0 162 1 2 0 0 0 167 1 3 0 0 0 167 11
                                    1 1 0 0 0 1 2 0 0 0 11 1 3 0 0 0 48 11 1 3
                                    0 0 0 171 164 1 2 0 0 0 171 1 2 0 0 0 48 1
                                    2 0 20 0 0 96 2 15 0 0 6 138 2 0 0 0 0 1 1
                                    0 0 0 1 2 0 0 0 0 66 2 7 0 0 146 1 2 7 0
                                    146 0 1 2 0 0 0 6 1 2 0 0 6 0 101 2 0 0 18
                                    0 1 2 0 0 0 0 25 2 0 0 11 0 1 2 0 0 13 0
                                    1)))))
           '|lookupComplete|)) 
