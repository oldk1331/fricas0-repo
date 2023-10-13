
(/VERSIONCHECK 2) 

(DEFUN |JBC-;m2r;LL;1| (|mi| $)
  (PROG (|k| |ri| |j| #1=#:G160 |i|)
    (RETURN
     (SEQ (LETT |ri| NIL . #2=(|JBC-;m2r;LL;1|)) (LETT |k| 1 . #2#)
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |mi| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (SEQ (LETT |j| 1 . #2#) G190
                     (COND ((|greater_SI| |j| |i|) (GO G191)))
                     (SEQ (EXIT (LETT |ri| (CONS |k| |ri|) . #2#)))
                     (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |k| (+ |k| 1) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ri|))))) 

(DEFUN |JBC-;r2m;LL;2| (|ri| $)
  (PROG (#1=#:G164 |i| |mi|)
    (RETURN
     (SEQ
      (LETT |mi| (SPADCALL (SPADCALL (QREFELT $ 8)) 0 (QREFELT $ 17))
            . #2=(|JBC-;r2m;LL;2|))
      (SEQ (LETT |i| NIL . #2#) (LETT #1# |ri| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL |i| (QREFELT $ 9) (QREFELT $ 19))
               (|error| "Improper multi-index"))
              ('T
               (SPADCALL |mi| |i| (+ 1 (SPADCALL |mi| |i| (QREFELT $ 21)))
                         (QREFELT $ 22))))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |mi|))))) 

(DEFUN |JBC-;allRepeated;LL;3| (|mu| $)
  (PROG (|res| |tmp| #1=#:G165 |nu| #2=#:G189 |i| #3=#:G190 |k|)
    (RETURN
     (SEQ (LETT |res| NIL . #4=(|JBC-;allRepeated;LL;3|))
          (SEQ (LETT |k| NIL . #4#) (LETT #3# |mu| . #4#) (LETT |i| 1 . #4#)
               (LETT #2# (QREFELT $ 9) . #4#) G190
               (COND
                ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                     (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (ZEROP |k|))
                   (SEQ (LETT |nu| (SPADCALL |mu| (QREFELT $ 24)) . #4#)
                        (SPADCALL |nu| |i|
                                  (PROG1 (LETT #1# (- |k| 1) . #4#)
                                    (|check_subtype| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     #1#))
                                  (QREFELT $ 22))
                        (LETT |tmp| (SPADCALL |nu| (QREFELT $ 26)) . #4#)
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL
                                          (CONS #'|JBC-;allRepeated;LL;3!0|
                                                (VECTOR $ |i|))
                                          |tmp| (QREFELT $ 29))
                                         (QREFELT $ 30))
                               . #4#)))))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (COND ((NULL |res|) (LIST NIL)) ('T |res|))))))) 

(DEFUN |JBC-;allRepeated;LL;3!0| (|x| $$)
  (PROG (|i| $)
    (LETT |i| (QREFELT $$ 1) . #1=(|JBC-;allRepeated;LL;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G182)
        (RETURN
         (SPADCALL
          (PROG1 (LETT #2# |i| NIL)
            (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
          |x| (QREFELT $ 27)))))))) 

(DEFUN |JBC-;repeatedIndex;SL;4| (|jv| $)
  (SPADCALL (SPADCALL |jv| (QREFELT $ 32)) (QREFELT $ 33))) 

(DEFUN |JBC-;class;LNni;5| (|l| $)
  (PROG (|res| #1=#:G195 |i|)
    (RETURN
     (SEQ (LETT |res| 1 . #2=(|JBC-;class;LNni;5|))
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL)
                     (NULL (ZEROP |i|)))
                 (GO G191)))
               (SEQ (EXIT (LETT |res| (+ |res| 1) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |JBC-;class;SNni;6| (|jv| $)
  (COND ((SPADCALL (SPADCALL |jv| (QREFELT $ 37)) '|Deriv| (QREFELT $ 38)) 0)
        ('T (SPADCALL (SPADCALL |jv| (QREFELT $ 32)) (QREFELT $ 39))))) 

(DEFUN |JBC-;order;SNni;7| (|jv| $)
  (PROG (|sum| #1=#:G202 |i|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |jv| (QREFELT $ 37)) '|Deriv| (QREFELT $ 38)) 0)
       ('T
        (SEQ (LETT |sum| 0 . #2=(|JBC-;order;SNni;7|))
             (SEQ (LETT |i| NIL . #2#)
                  (LETT #1# (SPADCALL |jv| (QREFELT $ 32)) . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT |sum| (+ |sum| |i|) . #2#)))
                  (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT |sum|)))))))) 

(DEFUN |JBC-;dimJ;2Nni;8| (|q| $)
  (PROG (#1=#:G204)
    (RETURN
     (SPADCALL (QREFELT $ 11)
               (PROG1
                   (LETT #1#
                         (SPADCALL (+ |q| (QREFELT $ 9)) (QREFELT $ 9)
                                   (QREFELT $ 42))
                         |JBC-;dimJ;2Nni;8|)
                 (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
               (QREFELT $ 43))))) 

(DEFUN |JBC-;dimS;2Nni;9| (|q| $)
  (PROG (#1=#:G207)
    (RETURN
     (SPADCALL (QREFELT $ 11)
               (PROG1
                   (LETT #1#
                         (SPADCALL (- (+ |q| (QREFELT $ 9)) 1)
                                   (- (QREFELT $ 9) 1) (QREFELT $ 42))
                         |JBC-;dimS;2Nni;9|)
                 (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
               (QREFELT $ 43))))) 

(DEFUN |JBC-;X;S;10| ($) (SPADCALL 1 (QREFELT $ 46))) 

(DEFUN |JBC-;U;S;11| ($) (SPADCALL 1 (QREFELT $ 48))) 

(DEFUN |JBC-;P;LS;12| (|lo| $) (SPADCALL 1 |lo| (QREFELT $ 50))) 

(DEFUN |JBC-;P;PiNniS;13| (|up| |lo| $)
  (SPADCALL |up| (LIST |lo|) (QREFELT $ 52))) 

(DEFUN |JBC-;P;NniS;14| (|lo| $) (SPADCALL 1 (LIST |lo|) (QREFELT $ 52))) 

(DEFUN |JBC-;P;PiLS;15| (|up| |lo| $)
  (PROG (|lop| #1=#:G215 #2=#:G220 |i|)
    (RETURN
     (SEQ
      (COND
       ((EQUAL (SPADCALL (QREFELT $ 55)) '|Multi|)
        (SPADCALL |up| |lo| (QREFELT $ 52)))
       ('T
        (SEQ (LETT |lop| NIL . #3=(|JBC-;P;PiLS;15|))
             (SEQ (LETT |i| NIL . #3#) (LETT #2# |lo| . #3#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND ((ZEROP |i|) (|error| '|errsmg1|))
                          ('T
                           (LETT |lop|
                                 (CONS
                                  (PROG1 (LETT #1# |i| . #3#)
                                    (|check_subtype| (> #1# 0)
                                                     '(|PositiveInteger|) #1#))
                                  |lop|)
                                 . #3#)))))
                  (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |up| (NREVERSE |lop|) (QREFELT $ 56)))))))))) 

(DEFUN |JBC-;Pr;PiLS;16| (|up| |lo| $)
  (SPADCALL |up| (SPADCALL |lo| (QREFELT $ 58)) (QREFELT $ 52))) 

(DEFUN |JBC-;coerce;SOf;17| (|jv| $)
  (SPADCALL (SPADCALL |jv| (QREFELT $ 60)) (QREFELT $ 62))) 

(DEFUN |JBC-;dimJ;2Nni;18| (|q| $)
  (PROG (|res| #1=#:G229 #2=#:G233 |qq| |oldJV| #3=#:G224)
    (RETURN
     (SEQ
      (COND
       ((< |q| (SPADCALL (QREFELT $ 66) (QREFELT $ 70)))
        (SEQ
         (LETT |res| (QAREF1O (QREFELT $ 66) (+ (QREFELT $ 69) |q|) 1)
               . #4=(|JBC-;dimJ;2Nni;18|))
         (EXIT
          (COND ((SPADCALL |res| 0 (QREFELT $ 71)) |res|)
                (#5='T
                 (SEQ
                  (LETT |res|
                        (SPADCALL (QREFELT $ 11)
                                  (PROG1
                                      (LETT #3#
                                            (SPADCALL (+ |q| (QREFELT $ 9))
                                                      (QREFELT $ 9)
                                                      (QREFELT $ 42))
                                            . #4#)
                                    (|check_subtype| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     #3#))
                                  (QREFELT $ 43))
                        . #4#)
                  (QSETAREF1O (QREFELT $ 66) (+ (QREFELT $ 69) |q|) |res| 1)
                  (EXIT |res|)))))))
       (#5#
        (SEQ (LETT |oldJV| (SPADCALL (QREFELT $ 66) (QREFELT $ 72)) . #4#)
             (SETELT $ 66 (SPADCALL (+ |q| 1) 0 (QREFELT $ 65)))
             (SEQ (LETT |qq| (QREFELT $ 69) . #4#)
                  (LETT #2#
                        (- (+ (QREFELT $ 69) (SPADCALL |oldJV| (QREFELT $ 70)))
                           1)
                        . #4#)
                  G190 (COND ((> |qq| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF1O (QREFELT $ 66) |qq| (QAREF1O |oldJV| |qq| 1)
                                1)))
                  (LETT |qq| (+ |qq| 1) . #4#) (GO G190) G191 (EXIT NIL))
             (LETT |res|
                   (SPADCALL (QREFELT $ 11)
                             (PROG1
                                 (LETT #1#
                                       (SPADCALL (+ |q| (QREFELT $ 9))
                                                 (QREFELT $ 9) (QREFELT $ 42))
                                       . #4#)
                               (|check_subtype| (>= #1# 0)
                                                '(|NonNegativeInteger|) #1#))
                             (QREFELT $ 43))
                   . #4#)
             (QSETAREF1O (QREFELT $ 66) (+ (QREFELT $ 69) |q|) |res| 1)
             (EXIT |res|)))))))) 

(DEFUN |JBC-;dimS;2Nni;19| (|q| $)
  (PROG (|res| #1=#:G240 #2=#:G244 |qq| |oldSV| #3=#:G235)
    (RETURN
     (SEQ
      (COND
       ((< |q| (SPADCALL (QREFELT $ 67) (QREFELT $ 70)))
        (SEQ
         (LETT |res| (QAREF1O (QREFELT $ 67) (+ (QREFELT $ 69) |q|) 1)
               . #4=(|JBC-;dimS;2Nni;19|))
         (EXIT
          (COND ((SPADCALL |res| 0 (QREFELT $ 71)) |res|)
                (#5='T
                 (SEQ
                  (LETT |res|
                        (SPADCALL (QREFELT $ 11)
                                  (PROG1
                                      (LETT #3#
                                            (SPADCALL
                                             (- (+ |q| (QREFELT $ 9)) 1)
                                             (- (QREFELT $ 9) 1)
                                             (QREFELT $ 42))
                                            . #4#)
                                    (|check_subtype| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     #3#))
                                  (QREFELT $ 43))
                        . #4#)
                  (QSETAREF1O (QREFELT $ 67) (+ (QREFELT $ 69) |q|) |res| 1)
                  (EXIT |res|)))))))
       (#5#
        (SEQ (LETT |oldSV| (SPADCALL (QREFELT $ 67) (QREFELT $ 72)) . #4#)
             (SETELT $ 67 (SPADCALL (+ |q| 1) 0 (QREFELT $ 65)))
             (SEQ (LETT |qq| (QREFELT $ 69) . #4#)
                  (LETT #2#
                        (- (+ (QREFELT $ 69) (SPADCALL |oldSV| (QREFELT $ 70)))
                           1)
                        . #4#)
                  G190 (COND ((> |qq| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF1O (QREFELT $ 67) |qq| (QAREF1O |oldSV| |qq| 1)
                                1)))
                  (LETT |qq| (+ |qq| 1) . #4#) (GO G190) G191 (EXIT NIL))
             (LETT |res|
                   (SPADCALL (QREFELT $ 11)
                             (PROG1
                                 (LETT #1#
                                       (SPADCALL (- (+ |q| (QREFELT $ 9)) 1)
                                                 (- (QREFELT $ 9) 1)
                                                 (QREFELT $ 42))
                                       . #4#)
                               (|check_subtype| (>= #1# 0)
                                                '(|NonNegativeInteger|) #1#))
                             (QREFELT $ 43))
                   . #4#)
             (QSETAREF1O (QREFELT $ 67) (+ (QREFELT $ 69) |q|) |res| 1)
             (EXIT |res|)))))))) 

(DEFUN |JBC-;differentiate;SPiU;20| (|jv| |i| $)
  (PROG (|nind| |rind| |mind| |jt|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |i| (QREFELT $ 9) (QREFELT $ 19))
        (|error| "Improper upper index"))
       (#1='T
        (SEQ
         (LETT |jt| (SPADCALL |jv| (QREFELT $ 37))
               . #2=(|JBC-;differentiate;SPiU;20|))
         (EXIT
          (COND ((EQUAL |jt| '|Const|) (CONS 1 "0"))
                ((EQUAL |jt| '|Indep|)
                 (COND
                  ((EQL (SPADCALL |jv| (QREFELT $ 73)) |i|)
                   (CONS 0 (SPADCALL (QREFELT $ 12))))
                  (#1# (CONS 1 "0"))))
                ((EQUAL (SPADCALL (QREFELT $ 55)) '|Multi|)
                 (SEQ (LETT |mind| (SPADCALL |jv| (QREFELT $ 32)) . #2#)
                      (SPADCALL |mind| |i|
                                (+
                                 (SPADCALL |mind|
                                           (+ (- |i| 1)
                                              (SPADCALL |mind| (QREFELT $ 74)))
                                           (QREFELT $ 21))
                                 1)
                                (QREFELT $ 22))
                      (EXIT
                       (CONS 0
                             (SPADCALL (SPADCALL |jv| (QREFELT $ 73)) |mind|
                                       (QREFELT $ 52))))))
                (#1#
                 (SEQ (LETT |rind| (SPADCALL |jv| (QREFELT $ 75)) . #2#)
                      (EXIT
                       (COND
                        ((NULL |rind|)
                         (CONS 0
                               (SPADCALL (SPADCALL |jv| (QREFELT $ 73))
                                         (LIST |i|) (QREFELT $ 56))))
                        (#1#
                         (SEQ (LETT |nind| NIL . #2#)
                              (SEQ G190
                                   (COND
                                    ((OR
                                      (NULL
                                       (COND ((NULL |rind|) 'NIL) ('T 'T)))
                                      (NULL
                                       (SPADCALL (|SPADfirst| |rind|) |i|
                                                 (QREFELT $ 19))))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |nind|
                                          (CONS (|SPADfirst| |rind|) |nind|)
                                          . #2#)
                                    (EXIT (LETT |rind| (CDR |rind|) . #2#)))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |nind|
                                    (SPADCALL (NREVERSE |nind|)
                                              (CONS |i| |rind|) (QREFELT $ 77))
                                    . #2#)
                              (EXIT
                               (CONS 0
                                     (SPADCALL (SPADCALL |jv| (QREFELT $ 73))
                                               |nind|
                                               (QREFELT $ 56))))))))))))))))))) 

(DEFUN |JBC-;derivativeOf?;2SL;21| (|jv1| |jv2| $)
  (PROG (|res| #1=#:G262 #2=#:G267 #3=#:G268 |i1| #4=#:G269 |i2| |jt|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |jv1| (QREFELT $ 37)) '|Deriv| (QREFELT $ 38))
         NIL)
        (#5='T
         (SEQ
          (LETT |jt| (SPADCALL |jv2| (QREFELT $ 37))
                . #6=(|JBC-;derivativeOf?;2SL;21|))
          (COND
           ((SPADCALL |jt| '|Deriv| (QREFELT $ 38))
            (COND ((SPADCALL |jt| '|Dep| (QREFELT $ 38)) (EXIT NIL)))))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |jv1| (QREFELT $ 73))
                       (SPADCALL |jv2| (QREFELT $ 73)) (QREFELT $ 80))
             NIL)
            (#5#
             (SEQ (LETT |res| NIL . #6#)
                  (SEQ (LETT |i2| NIL . #6#)
                       (LETT #4# (SPADCALL |jv2| (QREFELT $ 32)) . #6#)
                       (LETT |i1| NIL . #6#)
                       (LETT #3# (SPADCALL |jv1| (QREFELT $ 32)) . #6#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |i1| (CAR #3#) . #6#) NIL)
                             (ATOM #4#)
                             (PROGN (LETT |i2| (CAR #4#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((< |i1| |i2|) (PROGN (LETT #2# NIL . #6#) (GO #2#)))
                          ('T
                           (LETT |res|
                                 (CONS
                                  (PROG1 (LETT #1# (- |i1| |i2|) . #6#)
                                    (|check_subtype| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     #1#))
                                  |res|)
                                 . #6#)))))
                       (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (NREVERSE |res|))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |JBC-;integrateIfCan;SPiU;22| (|jv| |i| $)
  (PROG (|rind| |pos| #1=#:G273 |mi| |mind|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |i| (QREFELT $ 9) (QREFELT $ 19))
        (|error| "Improper upper index"))
       ((SPADCALL (SPADCALL |jv| (QREFELT $ 37)) '|Deriv| (QREFELT $ 38))
        (CONS 1 "failed"))
       ((EQUAL (SPADCALL (QREFELT $ 55)) '|Multi|)
        (SEQ
         (LETT |mind| (SPADCALL |jv| (QREFELT $ 32))
               . #2=(|JBC-;integrateIfCan;SPiU;22|))
         (LETT |pos| (+ (- |i| 1) (SPADCALL |mind| (QREFELT $ 74))) . #2#)
         (LETT |mi| (SPADCALL |mind| |pos| (QREFELT $ 82)) . #2#)
         (EXIT
          (COND ((ZEROP |mi|) (CONS 1 "failed"))
                (#3='T
                 (SEQ
                  (SPADCALL |mind| |pos|
                            (PROG1 (LETT #1# (- |mi| 1) . #2#)
                              (|check_subtype| (>= #1# 0)
                                               '(|NonNegativeInteger|) #1#))
                            (QREFELT $ 22))
                  (EXIT
                   (CONS 0
                         (SPADCALL (SPADCALL |jv| (QREFELT $ 73)) |mind|
                                   (QREFELT $ 52))))))))))
       (#3#
        (SEQ (LETT |rind| (SPADCALL |jv| (QREFELT $ 75)) . #2#)
             (LETT |pos| (SPADCALL |i| |rind| (QREFELT $ 83)) . #2#)
             (EXIT
              (COND
               ((< |pos| (SPADCALL |rind| (QREFELT $ 84))) (CONS 1 "failed"))
               (#3#
                (SEQ (LETT |rind| (SPADCALL |rind| |pos| (QREFELT $ 85)) . #2#)
                     (EXIT
                      (CONS 0
                            (SPADCALL (SPADCALL |jv| (QREFELT $ 73)) |rind|
                                      (QREFELT $ 56))))))))))))))) 

(DEFUN |JBC-;integrate;SPiS;23| (|jv| |i| $)
  (PROG (|ji|)
    (RETURN
     (SEQ
      (LETT |ji| (SPADCALL |jv| |i| (QREFELT $ 88)) |JBC-;integrate;SPiS;23|)
      (EXIT
       (COND ((QEQCAR |ji| 1) (|error| "Integration not possible"))
             ('T (QCDR |ji|)))))))) 

(DEFUN |JBC-;weight;SNni;24| (|jv| $)
  (PROG (|res| |pos| #1=#:G293 |i| |t|)
    (RETURN
     (SEQ
      (LETT |t| (SPADCALL |jv| (QREFELT $ 37)) . #2=(|JBC-;weight;SNni;24|))
      (EXIT
       (COND ((EQUAL |t| '|Const|) 0)
             ((EQUAL |t| '|Indep|) (SPADCALL |jv| (QREFELT $ 73)))
             ((EQUAL |t| '|Dep|)
              (* (+ (QREFELT $ 9) 1) (SPADCALL |jv| (QREFELT $ 73))))
             ('T
              (SEQ (LETT |pos| (+ (QREFELT $ 9) 1) . #2#)
                   (LETT |res| (* |pos| (SPADCALL |jv| (QREFELT $ 73))) . #2#)
                   (SEQ (LETT |i| NIL . #2#)
                        (LETT #1# (SPADCALL |jv| (QREFELT $ 75)) . #2#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ (LETT |pos| (* |pos| (+ (QREFELT $ 9) 1)) . #2#)
                             (EXIT (LETT |res| (+ |res| (* |i| |pos|)) . #2#)))
                        (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                   (EXIT |res|))))))))) 

(DEFUN |JBC-;one?;SB;25| (|jv| $)
  (EQUAL (SPADCALL |jv| (QREFELT $ 37)) '|Const|)) 

(DEFUN |JBC-;=;2SB;26| (|jv1| |jv2| $)
  (PROG (|t1|)
    (RETURN
     (SEQ (LETT |t1| (SPADCALL |jv1| (QREFELT $ 37)) |JBC-;=;2SB;26|)
          (EXIT
           (COND
            ((EQUAL |t1| '|Const|)
             (EQUAL (SPADCALL |jv2| (QREFELT $ 37)) '|Const|))
            ((EQUAL |t1| '|Indep|)
             (COND
              ((EQUAL (SPADCALL |jv2| (QREFELT $ 37)) '|Indep|)
               (EQL (SPADCALL |jv1| (QREFELT $ 73))
                    (SPADCALL |jv2| (QREFELT $ 73))))
              (#1='T 'NIL)))
            (#1#
             (COND
              ((EQL (SPADCALL |jv1| (QREFELT $ 73))
                    (SPADCALL |jv2| (QREFELT $ 73)))
               (SPADCALL (SPADCALL |jv1| (QREFELT $ 32))
                         (SPADCALL |jv2| (QREFELT $ 32)) (QREFELT $ 92)))
              (#1# 'NIL))))))))) 

(DEFUN |JBC-;<;2SB;27| (|jv1| |jv2| $)
  (PROG (#1=#:G304 #2=#:G305 |i1| #3=#:G306 |i2| |o2| |o1| |t2| |t1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |t1| (SPADCALL |jv1| (QREFELT $ 37)) . #4=(|JBC-;<;2SB;27|))
            (LETT |t2| (SPADCALL |jv2| (QREFELT $ 37)) . #4#)
            (EXIT
             (COND ((EQUAL |t2| '|Const|) 'NIL) ((EQUAL |t1| '|Const|) 'T)
                   ((EQUAL |t1| '|Indep|)
                    (COND
                     ((EQUAL |t2| '|Indep|)
                      (< (SPADCALL |jv1| (QREFELT $ 73))
                         (SPADCALL |jv2| (QREFELT $ 73))))
                     (#5='T 'T)))
                   ((EQUAL |t1| '|Dep|)
                    (COND ((EQUAL |t2| '|Indep|) 'NIL)
                          ((EQUAL |t2| '|Dep|)
                           (< (SPADCALL |jv1| (QREFELT $ 73))
                              (SPADCALL |jv2| (QREFELT $ 73))))
                          (#5# 'T)))
                   (#5#
                    (COND ((OR (EQUAL |t2| '|Indep|) (EQUAL |t2| '|Dep|)) 'NIL)
                          ('T
                           (SEQ
                            (LETT |o1| (SPADCALL |jv1| (QREFELT $ 94)) . #4#)
                            (LETT |o2| (SPADCALL |jv2| (QREFELT $ 94)) . #4#)
                            (EXIT
                             (COND
                              ((EQL |o1| |o2|)
                               (SEQ
                                (SEQ (LETT |i2| NIL . #4#)
                                     (LETT #3# (SPADCALL |jv2| (QREFELT $ 32))
                                           . #4#)
                                     (LETT |i1| NIL . #4#)
                                     (LETT #2# (SPADCALL |jv1| (QREFELT $ 32))
                                           . #4#)
                                     G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN
                                            (LETT |i1| (CAR #2#) . #4#)
                                            NIL)
                                           (ATOM #3#)
                                           (PROGN
                                            (LETT |i2| (CAR #3#) . #4#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((SPADCALL |i1| |i2| (QREFELT $ 95))
                                         (PROGN
                                          (LETT #1#
                                                (SPADCALL |i1| |i2|
                                                          (QREFELT $ 71))
                                                . #4#)
                                          (GO #1#))))))
                                     (LETT #2#
                                           (PROG1 (CDR #2#)
                                             (LETT #3# (CDR #3#) . #4#))
                                           . #4#)
                                     (GO G190) G191 (EXIT NIL))
                                (EXIT
                                 (< (SPADCALL |jv1| (QREFELT $ 73))
                                    (SPADCALL |jv2| (QREFELT $ 73))))))
                              (#5# (< |o1| |o2|))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |JBC-;>;2SB;28| (|jv1| |jv2| $) (SPADCALL |jv2| |jv1| (QREFELT $ 97))) 

(DEFUN |JBC-;variables;NniL;29| (|q| $)
  (PROG (#1=#:G341 #2=#:G357 |i| #3=#:G356 #4=#:G338 #5=#:G355 #6=#:G354 JV
         #7=#:G322 #8=#:G353 |k| #9=#:G352 |ind| |IndList| |OIndList|
         |NIndList| #10=#:G316 #11=#:G351 |j| #12=#:G350 |qq| #13=#:G313
         #14=#:G349 #15=#:G311 #16=#:G348 #17=#:G347 #18=#:G309 #19=#:G346)
    (RETURN
     (SEQ
      (COND
       ((ZEROP |q|)
        (PROGN
         (LETT #19# NIL . #20=(|JBC-;variables;NniL;29|))
         (SEQ (LETT |i| (QREFELT $ 9) . #20#) G190 (COND ((< |i| 1) (GO G191)))
              (SEQ
               (EXIT
                (LETT #19#
                      (CONS
                       (SPADCALL
                        (PROG1 (LETT #18# |i| . #20#)
                          (|check_subtype| (> #18# 0) '(|PositiveInteger|)
                                           #18#))
                        (QREFELT $ 46))
                       #19#)
                      . #20#)))
              (LETT |i| (+ |i| -1) . #20#) (GO G190) G191
              (EXIT (NREVERSE #19#)))))
       ('T
        (SEQ
         (LETT |OIndList|
               (PROGN
                (LETT #17# NIL . #20#)
                (SEQ (LETT |i| 1 . #20#) (LETT #16# (QREFELT $ 9) . #20#) G190
                     (COND ((|greater_SI| |i| #16#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #17#
                             (CONS
                              (LIST
                               (PROG1 (LETT #15# |i| . #20#)
                                 (|check_subtype| (> #15# 0)
                                                  '(|PositiveInteger|) #15#)))
                              #17#)
                             . #20#)))
                     (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                     (EXIT (NREVERSE #17#))))
               . #20#)
         (LETT |IndList|
               (PROGN
                (LETT #14# NIL . #20#)
                (SEQ (LETT |i| (QREFELT $ 9) . #20#) G190
                     (COND ((< |i| 1) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #14#
                             (CONS
                              (LIST
                               (PROG1 (LETT #13# |i| . #20#)
                                 (|check_subtype| (> #13# 0)
                                                  '(|PositiveInteger|) #13#)))
                              #14#)
                             . #20#)))
                     (LETT |i| (+ |i| -1) . #20#) (GO G190) G191
                     (EXIT (NREVERSE #14#))))
               . #20#)
         (SEQ (LETT |qq| 2 . #20#) G190
              (COND ((|greater_SI| |qq| |q|) (GO G191)))
              (SEQ (LETT |NIndList| NIL . #20#)
                   (SEQ (LETT |ind| NIL . #20#) (LETT #12# |OIndList| . #20#)
                        G190
                        (COND
                         ((OR (ATOM #12#)
                              (PROGN (LETT |ind| (CAR #12#) . #20#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| (|SPADfirst| |ind|) . #20#)
                               (LETT #11# (QREFELT $ 9) . #20#) G190
                               (COND ((> |j| #11#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |NIndList|
                                       (CONS
                                        (CONS
                                         (PROG1 (LETT #10# |j| . #20#)
                                           (|check_subtype| (> #10# 0)
                                                            '(|PositiveInteger|)
                                                            #10#))
                                         |ind|)
                                        |NIndList|)
                                       . #20#)))
                               (LETT |j| (+ |j| 1) . #20#) (GO G190) G191
                               (EXIT NIL))))
                        (LETT #12# (CDR #12#) . #20#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |OIndList| (REVERSE |NIndList|) . #20#)
                   (EXIT
                    (LETT |IndList|
                          (SPADCALL |NIndList| |IndList| (QREFELT $ 30))
                          . #20#)))
              (LETT |qq| (|inc_SI| |qq|) . #20#) (GO G190) G191 (EXIT NIL))
         (LETT JV NIL . #20#)
         (SEQ (LETT |ind| NIL . #20#) (LETT #9# |IndList| . #20#) G190
              (COND
               ((OR (ATOM #9#) (PROGN (LETT |ind| (CAR #9#) . #20#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |k| 1 . #20#) (LETT #8# (QREFELT $ 11) . #20#) G190
                     (COND ((|greater_SI| |k| #8#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT JV
                             (CONS
                              (SPADCALL
                               (PROG1 (LETT #7# |k| . #20#)
                                 (|check_subtype| (> #7# 0)
                                                  '(|PositiveInteger|) #7#))
                               |ind| (QREFELT $ 56))
                              JV)
                             . #20#)))
                     (LETT |k| (|inc_SI| |k|) . #20#) (GO G190) G191
                     (EXIT NIL))))
              (LETT #9# (CDR #9#) . #20#) (GO G190) G191 (EXIT NIL))
         (EXIT
          (SPADCALL
           (SPADCALL
            (PROGN
             (LETT #6# NIL . #20#)
             (SEQ (LETT |i| 1 . #20#) (LETT #5# (QREFELT $ 9) . #20#) G190
                  (COND ((|greater_SI| |i| #5#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #6#
                          (CONS
                           (SPADCALL
                            (PROG1 (LETT #4# |i| . #20#)
                              (|check_subtype| (> #4# 0) '(|PositiveInteger|)
                                               #4#))
                            (QREFELT $ 46))
                           #6#)
                          . #20#)))
                  (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            (PROGN
             (LETT #3# NIL . #20#)
             (SEQ (LETT |i| 1 . #20#) (LETT #2# (QREFELT $ 11) . #20#) G190
                  (COND ((|greater_SI| |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #3#
                          (CONS
                           (SPADCALL
                            (PROG1 (LETT #1# |i| . #20#)
                              (|check_subtype| (> #1# 0) '(|PositiveInteger|)
                                               #1#))
                            (QREFELT $ 48))
                           #3#)
                          . #20#)))
                  (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                  (EXIT (NREVERSE #3#))))
            (QREFELT $ 100))
           JV (QREFELT $ 100)))))))))) 

(DEFUN |JBC-;variables;NniPiL;30| (|q| |c| $)
  (PROG (JV #1=#:G367 #2=#:G378 |k| #3=#:G377 |ind| |OIndList| |NIndList|
         #4=#:G361 #5=#:G376 |j| #6=#:G375 |qq| #7=#:G358 #8=#:G374 |i|
         #9=#:G373)
    (RETURN
     (SEQ
      (COND ((ZEROP |q|) NIL)
            ('T
             (SEQ
              (LETT |OIndList|
                    (PROGN
                     (LETT #9# NIL . #10=(|JBC-;variables;NniPiL;30|))
                     (SEQ (LETT |i| |c| . #10#) (LETT #8# (QREFELT $ 9) . #10#)
                          G190 (COND ((> |i| #8#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9#
                                  (CONS
                                   (LIST
                                    (PROG1 (LETT #7# |i| . #10#)
                                      (|check_subtype| (> #7# 0)
                                                       '(|PositiveInteger|)
                                                       #7#)))
                                   #9#)
                                  . #10#)))
                          (LETT |i| (+ |i| 1) . #10#) (GO G190) G191
                          (EXIT (NREVERSE #9#))))
                    . #10#)
              (SEQ (LETT |qq| 2 . #10#) G190
                   (COND ((|greater_SI| |qq| |q|) (GO G191)))
                   (SEQ (LETT |NIndList| NIL . #10#)
                        (SEQ (LETT |ind| NIL . #10#)
                             (LETT #6# |OIndList| . #10#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |ind| (CAR #6#) . #10#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |j| (|SPADfirst| |ind|) . #10#)
                                    (LETT #5# (QREFELT $ 9) . #10#) G190
                                    (COND ((> |j| #5#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |NIndList|
                                            (CONS
                                             (CONS
                                              (PROG1 (LETT #4# |j| . #10#)
                                                (|check_subtype| (> #4# 0)
                                                                 '(|PositiveInteger|)
                                                                 #4#))
                                              |ind|)
                                             |NIndList|)
                                            . #10#)))
                                    (LETT |j| (+ |j| 1) . #10#) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |OIndList| (NREVERSE |NIndList|) . #10#)))
                   (LETT |qq| (|inc_SI| |qq|) . #10#) (GO G190) G191
                   (EXIT NIL))
              (LETT JV NIL . #10#)
              (SEQ (LETT |ind| NIL . #10#) (LETT #3# |OIndList| . #10#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ind| (CAR #3#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| 1 . #10#) (LETT #2# (QREFELT $ 11) . #10#)
                          G190 (COND ((|greater_SI| |k| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT JV
                                  (CONS
                                   (SPADCALL
                                    (PROG1 (LETT #1# |k| . #10#)
                                      (|check_subtype| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       #1#))
                                    |ind| (QREFELT $ 56))
                                   JV)
                                  . #10#)))
                          (LETT |k| (|inc_SI| |k|) . #10#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #3# (CDR #3#) . #10#) (GO G190) G191 (EXIT NIL))
              (EXIT JV)))))))) 

(DEFUN |JetBundleCategory&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|JetBundleCategory&|))
      (LETT |dv$| (LIST '|JetBundleCategory&| DV$1) . #1#)
      (LETT $ (GETREFV 105) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (SPADCALL (QREFELT $ 8)))
      (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
      (QSETREFV $ 66 (SPADCALL 1 (QREFELT $ 11) (QREFELT $ 65)))
      (QSETREFV $ 67 (SPADCALL 1 (QREFELT $ 11) (QREFELT $ 65)))
      (QSETREFV $ 69 (SPADCALL (QREFELT $ 66) (QREFELT $ 68)))
      $)))) 

(MAKEPROP '|JetBundleCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|PositiveInteger|)
              (0 . |numIndVar|) '|nn| (4 . |numDepVar|) '|mm| (8 . |One|)
              (|List| 7) (|List| 16) |JBC-;m2r;LL;1| (|NonNegativeInteger|)
              (12 . |new|) (|Boolean|) (18 . >) (|Integer|) (24 . |elt|)
              (30 . |setelt|) |JBC-;r2m;LL;2| (37 . |copy|) (|List| 13)
              (42 . |allRepeated|) (47 . |cons|) (|Mapping| 13 13) (53 . |map|)
              (59 . |concat!|) |JBC-;allRepeated;LL;3| (65 . |multiIndex|)
              (70 . |m2r|) |JBC-;repeatedIndex;SL;4| |JBC-;class;LNni;5|
              (|Symbol|) (75 . |type|) (80 . ~=) (86 . |class|)
              |JBC-;class;SNni;6| |JBC-;order;SNni;7| (91 . |binomial|)
              (97 . *) |JBC-;dimJ;2Nni;18| |JBC-;dimS;2Nni;19| (103 . X)
              |JBC-;X;S;10| (108 . U) |JBC-;U;S;11| (113 . P) |JBC-;P;LS;12|
              (119 . |Pm|) |JBC-;P;PiNniS;13| |JBC-;P;NniS;14|
              (125 . |getNotation|) (129 . |Pr|) |JBC-;P;PiLS;15| (135 . |r2m|)
              |JBC-;Pr;PiLS;16| (140 . |name|) (|OutputForm|) (145 . |coerce|)
              |JBC-;coerce;SOf;17| (|Vector| 16) (150 . |new|) '|dimJV|
              '|dimSV| (156 . |minIndex|) '|mn| (161 . |#|) (166 . >)
              (172 . |copy|) (177 . |index|) (182 . |minIndex|)
              (187 . |repeatedIndex|) (192 . |empty|) (196 . |concat!|)
              (|Union| $ '"0") |JBC-;differentiate;SPiU;20| (202 . ~=)
              |JBC-;derivativeOf?;2SL;21| (208 . |qelt|) (214 . |position|)
              (220 . |minIndex|) (225 . |delete|) (|Union| $ '"failed")
              |JBC-;integrateIfCan;SPiU;22| (231 . |integrateIfCan|)
              |JBC-;integrate;SPiS;23| |JBC-;weight;SNni;24| |JBC-;one?;SB;25|
              (237 . =) |JBC-;=;2SB;26| (243 . |order|) (248 . ~=)
              |JBC-;<;2SB;27| (254 . <) |JBC-;>;2SB;28| (|List| 6)
              (260 . |concat!|) (|List| $) |JBC-;variables;NniL;29|
              |JBC-;variables;NniPiL;30| (|Expression| 20))
           '#(|weight| 266 |variables| 271 |repeatedIndex| 282 |r2m| 287
              |order| 292 |one?| 297 |m2r| 302 |integrateIfCan| 307 |integrate|
              313 |dimS| 319 |dimJ| 324 |differentiate| 329 |derivativeOf?| 335
              |coerce| 341 |class| 346 |allRepeated| 356 X 361 U 365 |Pr| 369 P
              375 > 397 = 403 < 409)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 103
                                                 '(0 6 7 8 0 6 7 10 0 6 0 12 2
                                                   14 0 16 16 17 2 7 18 0 0 19
                                                   2 14 16 0 20 21 3 14 16 0 20
                                                   16 22 1 14 0 0 24 1 6 25 14
                                                   26 2 13 0 7 0 27 2 25 0 28 0
                                                   29 2 25 0 0 0 30 1 6 14 0 32
                                                   1 6 13 14 33 1 6 36 0 37 2
                                                   36 18 0 0 38 1 6 16 14 39 2
                                                   20 0 0 0 42 2 16 0 7 0 43 1
                                                   6 0 7 46 1 6 0 7 48 2 6 0 7
                                                   14 50 2 6 0 7 14 52 0 6 36
                                                   55 2 6 0 7 13 56 1 6 14 13
                                                   58 1 6 36 0 60 1 36 61 0 62
                                                   2 64 0 16 16 65 1 64 20 0 68
                                                   1 64 16 0 70 2 16 18 0 0 71
                                                   1 64 0 0 72 1 6 7 0 73 1 14
                                                   20 0 74 1 6 13 0 75 0 61 0
                                                   76 2 13 0 0 0 77 2 7 18 0 0
                                                   80 2 14 16 0 20 82 2 13 20 7
                                                   0 83 1 13 20 0 84 2 13 0 0
                                                   20 85 2 6 86 0 7 88 2 14 18
                                                   0 0 92 1 6 16 0 94 2 16 18 0
                                                   0 95 2 6 18 0 0 97 2 99 0 0
                                                   0 100 1 0 16 0 90 2 0 101 16
                                                   7 103 1 0 101 16 102 1 0 13
                                                   0 34 1 0 14 13 23 1 0 16 0
                                                   41 1 0 18 0 91 1 0 13 14 15
                                                   2 0 86 0 7 87 2 0 0 0 7 89 1
                                                   0 16 16 45 1 0 16 16 44 2 0
                                                   78 0 7 79 2 0 14 0 0 81 1 0
                                                   61 0 63 1 0 16 0 40 1 0 16
                                                   14 35 1 0 25 14 31 0 0 0 47
                                                   0 0 0 49 2 0 0 7 13 59 1 0 0
                                                   16 54 1 0 0 14 51 2 0 0 7 16
                                                   53 2 0 0 7 14 57 2 0 18 0 0
                                                   98 2 0 18 0 0 93 2 0 18 0 0
                                                   96)))))
           '|lookupComplete|)) 
