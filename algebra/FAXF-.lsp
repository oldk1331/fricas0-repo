
(/VERSIONCHECK 2) 

(DEFUN |FAXF-;represents;VS;1| (|v| $)
  (PROG (|a| #1=#:G142 |i| |b|)
    (RETURN
     (SEQ (LETT |a| (|spadConstant| $ 8) . #2=(|FAXF-;represents;VS;1|))
          (LETT |b| (SPADCALL (QREFELT $ 10)) . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (SPADCALL (QREFELT $ 12)) . #2#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |a|
                       (SPADCALL |a|
                                 (SPADCALL (SPADCALL |v| |i| (QREFELT $ 15))
                                           (SPADCALL |b| |i| (QREFELT $ 17))
                                           (QREFELT $ 18))
                                 (QREFELT $ 19))
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |a|))))) 

(PUT '|FAXF-;transcendenceDegree;Nni;2| '|SPADreplace| '(XLAM NIL 0)) 

(DEFUN |FAXF-;transcendenceDegree;Nni;2| ($) 0) 

(DEFUN |FAXF-;dimension;Cn;3| ($)
  (SPADCALL (QVSIZE (SPADCALL (QREFELT $ 10))) (QREFELT $ 24))) 

(DEFUN |FAXF-;extensionDegree;Opc;4| ($)
  (PROG (#1=#:G146)
    (RETURN
     (SPADCALL
      (PROG1
          (LETT #1# (QVSIZE (SPADCALL (QREFELT $ 10)))
                |FAXF-;extensionDegree;Opc;4|)
        (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
      (QREFELT $ 27))))) 

(DEFUN |FAXF-;degree;SOpc;5| (|a| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 29)) (QREFELT $ 27))) 

(DEFUN |FAXF-;coordinates;VM;6| (|v| $)
  (PROG (#1=#:G152 |i| |j| |m|)
    (RETURN
     (SEQ
      (LETT |m|
            (SPADCALL (QVSIZE |v|) (SPADCALL (QREFELT $ 12))
                      (|spadConstant| $ 31) (QREFELT $ 33))
            . #2=(|FAXF-;coordinates;VM;6|))
      (SEQ (LETT |j| 1 . #2#) (LETT |i| (SPADCALL |v| (QREFELT $ 34)) . #2#)
           (LETT #1# (QVSIZE |v|) . #2#) G190 (COND ((> |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |m| |j| (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 35))
                       (QREFELT $ 36))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (|inc_SI| |j|) . #2#)) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |m|))))) 

(PUT '|FAXF-;algebraic?;SB;7| '|SPADreplace| '(XLAM (|a|) 'T)) 

(DEFUN |FAXF-;algebraic?;SB;7| (|a| $) 'T) 

(PUT '|FAXF-;transcendent?;SB;8| '|SPADreplace| '(XLAM (|a|) 'NIL)) 

(DEFUN |FAXF-;transcendent?;SB;8| (|a| $) 'NIL) 

(DEFUN |FAXF-;extensionDegree;Pi;9| ($)
  (PROG (#1=#:G155)
    (RETURN
     (PROG1
         (LETT #1# (QVSIZE (SPADCALL (QREFELT $ 10)))
               |FAXF-;extensionDegree;Pi;9|)
       (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))) 

(DEFUN |FAXF-;trace;SF;10| (|a| $)
  (PROG (|abs| #1=#:G160 |i| |b|)
    (RETURN
     (SEQ (LETT |b| (SPADCALL (QREFELT $ 10)) . #2=(|FAXF-;trace;SF;10|))
          (LETT |abs| (|spadConstant| $ 31) . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVSIZE |b|) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |abs|
                       (SPADCALL |abs|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |a|
                                             (SPADCALL |b| |i| (QREFELT $ 17))
                                             (QREFELT $ 42))
                                   (QREFELT $ 35))
                                  |i| (QREFELT $ 15))
                                 (QREFELT $ 43))
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |abs|))))) 

(DEFUN |FAXF-;norm;SF;11| (|a| $)
  (PROG (#1=#:G164 |i| |m| |b|)
    (RETURN
     (SEQ (LETT |b| (SPADCALL (QREFELT $ 10)) . #2=(|FAXF-;norm;SF;11|))
          (LETT |m|
                (SPADCALL (QVSIZE |b|) (QVSIZE |b|) (|spadConstant| $ 31)
                          (QREFELT $ 33))
                . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVSIZE |b|) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |m| |i|
                           (SPADCALL
                            (SPADCALL |a| (SPADCALL |b| |i| (QREFELT $ 17))
                                      (QREFELT $ 42))
                            (QREFELT $ 35))
                           (QREFELT $ 36))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |m| (QREFELT $ 45))))))) 

(DEFUN |FAXF-;linearAssociatedExp;SSupS;12| (|x| |f| $)
  (PROG (|y| |erg| #1=#:G169 |i|)
    (RETURN
     (SEQ
      (LETT |erg| (|spadConstant| $ 8)
            . #2=(|FAXF-;linearAssociatedExp;SSupS;12|))
      (LETT |y| |x| . #2#)
      (SEQ (LETT |i| 0 . #2#) (LETT #1# (SPADCALL |f| (QREFELT $ 48)) . #2#)
           G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (LETT |erg|
                  (SPADCALL |erg|
                            (SPADCALL (SPADCALL |f| |i| (QREFELT $ 49)) |y|
                                      (QREFELT $ 18))
                            (QREFELT $ 19))
                  . #2#)
            (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 50)) . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |erg|))))) 

(DEFUN |FAXF-;linearAssociatedLog;2SU;13| (|b| |x| $)
  (PROG (|p| #1=#:G179 #2=#:G178 #3=#:G180 #4=#:G187 |i| |rown| |v| |m1| |l|
         |a| |extdeg|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (|spadConstant| $ 8) (QREFELT $ 52))
        (CONS 0 (|spadConstant| $ 53)))
       (#5='T
        (SEQ
         (LETT |l|
               (LIST (SPADCALL (SPADCALL |b| (QREFELT $ 35)) (QREFELT $ 55)))
               . #6=(|FAXF-;linearAssociatedLog;2SU;13|))
         (LETT |a| |b| . #6#) (LETT |extdeg| (SPADCALL (QREFELT $ 12)) . #6#)
         (SEQ (LETT |i| 2 . #6#) G190
              (COND ((|greater_SI| |i| |extdeg|) (GO G191)))
              (SEQ (LETT |a| (SPADCALL |a| (QREFELT $ 50)) . #6#)
                   (EXIT
                    (LETT |l|
                          (SPADCALL |l|
                                    (SPADCALL (SPADCALL |a| (QREFELT $ 35))
                                              (QREFELT $ 55))
                                    (QREFELT $ 57))
                          . #6#)))
              (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
         (LETT |l|
               (SPADCALL |l|
                         (SPADCALL (SPADCALL |x| (QREFELT $ 35))
                                   (QREFELT $ 55))
                         (QREFELT $ 57))
               . #6#)
         (LETT |m1|
               (SPADCALL
                (SPADCALL (SPADCALL |l| (QREFELT $ 58)) (QREFELT $ 59))
                (QREFELT $ 60))
               . #6#)
         (LETT |v| (SPADCALL |extdeg| (QREFELT $ 61)) . #6#)
         (LETT |rown| 1 . #6#)
         (SEQ (LETT |i| 1 . #6#) G190
              (COND ((|greater_SI| |i| |extdeg|) (GO G191)))
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL (QAREF2O |m1| |rown| |i| 1 1) (|spadConstant| $ 62)
                            (QREFELT $ 63))
                  (SEQ
                   (SPADCALL |v| |i| (QAREF2O |m1| |rown| (+ |extdeg| 1) 1 1)
                             (QREFELT $ 65))
                   (EXIT (LETT |rown| (+ |rown| 1) . #6#)))))))
              (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
         (LETT |p|
               (PROGN
                (LETT #1# NIL . #6#)
                (SEQ (LETT |i| 0 . #6#) (LETT #4# (- (QVSIZE |v|) 1) . #6#)
                     G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #3#
                              (SPADCALL (SPADCALL |v| (+ |i| 1) (QREFELT $ 15))
                                        |i| (QREFELT $ 66))
                              . #6#)
                        (COND
                         (#1#
                          (LETT #2# (SPADCALL #2# #3# (QREFELT $ 67)) . #6#))
                         ('T
                          (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                     (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) (#5# (|spadConstant| $ 53))))
               . #6#)
         (EXIT
          (COND
           ((SPADCALL |p| (|spadConstant| $ 53) (QREFELT $ 68))
            (SEQ
             (SPADCALL
              "linearAssociatedLog: second argument not in                       group generated by first argument"
              (QREFELT $ 72))
             (EXIT (CONS 1 "failed"))))
           (#5# (CONS 0 |p|))))))))))) 

(DEFUN |FAXF-;linearAssociatedLog;SSup;14| (|x| $)
  (PROG (#1=#:G189)
    (RETURN
     (PROG2
         (LETT #1# (SPADCALL (SPADCALL (QREFELT $ 75)) |x| (QREFELT $ 76))
               |FAXF-;linearAssociatedLog;SSup;14|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0)
                      (|SparseUnivariatePolynomial| (QREFELT $ 7)) #1#))))) 

(DEFUN |FAXF-;linearAssociatedOrder;SSup;15| (|x| $)
  (PROG (#1=#:G195 #2=#:G194 #3=#:G196 #4=#:G200 |i| |v| |l| |a| #5=#:G199)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (|spadConstant| $ 8) (QREFELT $ 52))
        (|spadConstant| $ 53))
       (#6='T
        (SEQ
         (LETT |l|
               (LIST (SPADCALL (SPADCALL |x| (QREFELT $ 35)) (QREFELT $ 55)))
               . #7=(|FAXF-;linearAssociatedOrder;SSup;15|))
         (LETT |a| |x| . #7#)
         (SEQ (LETT |i| 1 . #7#) (LETT #5# (SPADCALL (QREFELT $ 12)) . #7#)
              G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
              (SEQ (LETT |a| (SPADCALL |a| (QREFELT $ 50)) . #7#)
                   (EXIT
                    (LETT |l|
                          (SPADCALL |l|
                                    (SPADCALL (SPADCALL |a| (QREFELT $ 35))
                                              (QREFELT $ 55))
                                    (QREFELT $ 57))
                          . #7#)))
              (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
         (LETT |v|
               (|SPADfirst|
                (SPADCALL
                 (SPADCALL (SPADCALL |l| (QREFELT $ 58)) (QREFELT $ 59))
                 (QREFELT $ 79)))
               . #7#)
         (EXIT
          (PROGN
           (LETT #1# NIL . #7#)
           (SEQ (LETT |i| 0 . #7#) (LETT #4# (- (QVSIZE |v|) 1) . #7#) G190
                (COND ((|greater_SI| |i| #4#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (SPADCALL |v| (+ |i| 1) (QREFELT $ 15)) |i|
                                   (QREFELT $ 66))
                         . #7#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 67)) . #7#))
                    ('T (PROGN (LETT #2# #3# . #7#) (LETT #1# 'T . #7#)))))))
                (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) (#6# (|spadConstant| $ 53)))))))))))) 

(DEFUN |FAXF-;charthRoot;SU;16| (|x| $) (CONS 0 (SPADCALL |x| (QREFELT $ 81)))) 

(DEFUN |FAXF-;minimalPolynomial;SPiSup;17| (|a| |n| $)
  (PROG (|u| |f|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (REM (SPADCALL (QREFELT $ 12)) |n|) 0 (QREFELT $ 84))
        (|error|
         "minimalPolynomial: 2. argument must divide extension degree"))
       ('T
        (SEQ
         (LETT |f|
               (SPADCALL (SPADCALL (|spadConstant| $ 64) 1 (QREFELT $ 86))
                         (SPADCALL |a| 0 (QREFELT $ 86)) (QREFELT $ 87))
               . #1=(|FAXF-;minimalPolynomial;SPiSup;17|))
         (LETT |u| (SPADCALL |a| |n| (QREFELT $ 88)) . #1#)
         (SEQ G190
              (COND
               ((NULL (COND ((SPADCALL |u| |a| (QREFELT $ 52)) 'NIL) ('T 'T)))
                (GO G191)))
              (SEQ
               (LETT |f|
                     (SPADCALL |f|
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 64) 1
                                          (QREFELT $ 86))
                                (SPADCALL |u| 0 (QREFELT $ 86)) (QREFELT $ 87))
                               (QREFELT $ 89))
                     . #1#)
               (EXIT (LETT |u| (SPADCALL |u| |n| (QREFELT $ 88)) . #1#)))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT |f|)))))))) 

(DEFUN |FAXF-;norm;SPiS;18| (|e| |s| $)
  (PROG (#1=#:G215 |pow| |qr|)
    (RETURN
     (SEQ
      (LETT |qr| (DIVIDE2 (SPADCALL (QREFELT $ 12)) |s|)
            . #2=(|FAXF-;norm;SPiS;18|))
      (EXIT
       (COND
        ((ZEROP (QCDR |qr|))
         (SEQ
          (LETT |pow|
                (QUOTIENT2 (- (SPADCALL (QREFELT $ 93)) 1)
                           (-
                            (SPADCALL (SPADCALL (QREFELT $ 95)) |s|
                                      (QREFELT $ 96))
                            1))
                . #2#)
          (EXIT
           (SPADCALL |e|
                     (PROG1 (LETT #1# |pow| . #2#)
                       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                        #1#))
                     (QREFELT $ 97)))))
        ('T
         (|error|
          "norm: second argument must divide degree of extension")))))))) 

(DEFUN |FAXF-;trace;SPiS;19| (|e| |s| $)
  (PROG (|a| #1=#:G224 |i| |q| |qr|)
    (RETURN
     (SEQ
      (LETT |qr| (DIVIDE2 (SPADCALL (QREFELT $ 12)) |s|)
            . #2=(|FAXF-;trace;SPiS;19|))
      (LETT |q| (SPADCALL (QREFELT $ 95)) . #2#)
      (EXIT
       (COND
        ((ZEROP (QCDR |qr|))
         (SEQ (LETT |a| (|spadConstant| $ 8) . #2#)
              (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QCAR |qr|) 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |a|
                           (SPADCALL |a|
                                     (SPADCALL |e|
                                               (EXPT |q|
                                                     (SPADCALL |s| |i|
                                                               (QREFELT $ 99)))
                                               (QREFELT $ 97))
                                     (QREFELT $ 19))
                           . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |a|)))
        ('T
         (|error|
          "trace: second argument must divide degree of extension")))))))) 

(DEFUN |FAXF-;size;Nni;20| ($)
  (SPADCALL (SPADCALL (QREFELT $ 95)) (SPADCALL (QREFELT $ 12)) (QREFELT $ 96))) 

(DEFUN |FAXF-;createNormalElement;S;21| ($)
  (PROG (#1=#:G229 #2=#:G232 |res| #3=#:G227 |i|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((EQL (SPADCALL (QREFELT $ 101)) (SPADCALL (QREFELT $ 93)))
         (|spadConstant| $ 64))
        ('T
         (SEQ
          (SEQ (LETT |i| 1 . #4=(|FAXF-;createNormalElement;S;21|)) G190 NIL
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |res|
                        (SPADCALL
                         (PROG1 (LETT #3# |i| . #4#)
                           (|check_subtype| (> #3# 0) '(|PositiveInteger|)
                                            #3#))
                         (QREFELT $ 104))
                        . #4#)
                  (EXIT
                   (COND
                    ((NULL (SPADCALL |res| (QREFELT $ 105)))
                     (PROGN
                      (LETT #1#
                            (COND
                             ((SPADCALL |res| (QREFELT $ 106))
                              (PROGN
                               (LETT #1#
                                     (PROGN (LETT #2# |res| . #4#) (GO #2#))
                                     . #4#)
                               (GO #1#))))
                            . #4#)
                      (GO #1#)))))))
                #1# (EXIT #1#))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))))
      #2# (EXIT #2#))))) 

(DEFUN |FAXF-;normal?;SB;22| (|x| $)
  (PROG (|f| #1=#:G234 #2=#:G233 #3=#:G235 #4=#:G238 |i| |p|)
    (RETURN
     (SEQ
      (LETT |p|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 64) (SPADCALL (QREFELT $ 12))
                       (QREFELT $ 86))
             (SPADCALL (|spadConstant| $ 64) 0 (QREFELT $ 86)) (QREFELT $ 87))
            . #5=(|FAXF-;normal?;SB;22|))
      (LETT |f|
            (PROGN
             (LETT #1# NIL . #5#)
             (SEQ (LETT |i| 0 . #5#)
                  (LETT #4# (- (SPADCALL (QREFELT $ 12)) 1) . #5#) G190
                  (COND ((|greater_SI| |i| #4#) (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3#
                           (SPADCALL (SPADCALL |x| |i| (QREFELT $ 88)) |i|
                                     (QREFELT $ 86))
                           . #5#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 108)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                  (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6='T (|spadConstant| $ 109))))
            . #5#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |p| |f| (QREFELT $ 110)) (|spadConstant| $ 111)
                   (QREFELT $ 112))
         'T)
        (#6# 'NIL))))))) 

(DEFUN |FAXF-;degree;SPi;23| (|a| $)
  (PROG (|deg| |y|)
    (RETURN
     (SEQ (LETT |y| (SPADCALL |a| (QREFELT $ 50)) . #1=(|FAXF-;degree;SPi;23|))
          (LETT |deg| 1 . #1#)
          (SEQ G190
               (COND ((NULL (SPADCALL |y| |a| (QREFELT $ 114))) (GO G191)))
               (SEQ (LETT |y| (SPADCALL |y| (QREFELT $ 50)) . #1#)
                    (EXIT (LETT |deg| (+ |deg| 1) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |deg|))))) 

(DEFUN |FiniteAlgebraicExtensionField&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteAlgebraicExtensionField&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|FiniteAlgebraicExtensionField&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 116) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2| '(|Finite|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 51
                   (CONS
                    (|dispatchFunction| |FAXF-;linearAssociatedExp;SSupS;12|)
                    $))
         (QSETREFV $ 74
                   (CONS
                    (|dispatchFunction| |FAXF-;linearAssociatedLog;2SU;13|) $))
         (QSETREFV $ 77
                   (CONS
                    (|dispatchFunction| |FAXF-;linearAssociatedLog;SSup;14|)
                    $))
         (QSETREFV $ 80
                   (CONS
                    (|dispatchFunction| |FAXF-;linearAssociatedOrder;SSup;15|)
                    $))
         (QSETREFV $ 83 (CONS (|dispatchFunction| |FAXF-;charthRoot;SU;16|) $))
         (QSETREFV $ 91
                   (CONS
                    (|dispatchFunction| |FAXF-;minimalPolynomial;SPiSup;17|)
                    $))
         (QSETREFV $ 98 (CONS (|dispatchFunction| |FAXF-;norm;SPiS;18|) $))
         (QSETREFV $ 100 (CONS (|dispatchFunction| |FAXF-;trace;SPiS;19|) $))
         (QSETREFV $ 94 (CONS (|dispatchFunction| |FAXF-;size;Nni;20|) $))
         (QSETREFV $ 107
                   (CONS (|dispatchFunction| |FAXF-;createNormalElement;S;21|)
                         $))
         (QSETREFV $ 113 (CONS (|dispatchFunction| |FAXF-;normal?;SB;22|) $))
         (QSETREFV $ 115
                   (CONS (|dispatchFunction| |FAXF-;degree;SPi;23|) $)))))
      $)))) 

(MAKEPROP '|FiniteAlgebraicExtensionField&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (|Vector| $) (4 . |basis|) (|PositiveInteger|)
              (8 . |extensionDegree|) (|Integer|) (|Vector| 7) (12 . |elt|)
              (|Vector| 6) (18 . |elt|) (24 . *) (30 . +)
              |FAXF-;represents;VS;1| (|NonNegativeInteger|)
              |FAXF-;transcendenceDegree;Nni;2| (|CardinalNumber|)
              (36 . |coerce|) |FAXF-;dimension;Cn;3| (|OnePointCompletion| 11)
              (41 . |coerce|) |FAXF-;extensionDegree;Opc;4| (46 . |degree|)
              |FAXF-;degree;SOpc;5| (51 . |Zero|) (|Matrix| 7) (55 . |new|)
              (62 . |minIndex|) (67 . |coordinates|) (72 . |setRow!|)
              |FAXF-;coordinates;VM;6| (|Boolean|) |FAXF-;algebraic?;SB;7|
              |FAXF-;transcendent?;SB;8| |FAXF-;extensionDegree;Pi;9| (79 . *)
              (85 . +) |FAXF-;trace;SF;10| (91 . |determinant|)
              |FAXF-;norm;SF;11| (|SparseUnivariatePolynomial| 7)
              (96 . |degree|) (101 . |coefficient|) (107 . |Frobenius|)
              (112 . |linearAssociatedExp|) (118 . =) (124 . |Zero|) (|List| 7)
              (128 . |entries|) (|List| 54) (133 . |concat|) (139 . |matrix|)
              (144 . |transpose|) (149 . |rowEchelon|) (154 . |zero|)
              (159 . |One|) (163 . =) (169 . |One|) (173 . |setelt|)
              (180 . |monomial|) (186 . +) (192 . =) (|Void|) (|String|)
              (|OutputForm|) (198 . |messagePrint|) (|Union| 47 '"failed")
              (203 . |linearAssociatedLog|) (209 . |normalElement|)
              (213 . |linearAssociatedLog|) (219 . |linearAssociatedLog|)
              (|List| 14) (224 . |nullSpace|) (229 . |linearAssociatedOrder|)
              (234 . |charthRoot|) (|Union| $ '"failed") (239 . |charthRoot|)
              (244 . ~=) (|SparseUnivariatePolynomial| 6) (250 . |monomial|)
              (256 . -) (262 . |Frobenius|) (268 . *)
              (|SparseUnivariatePolynomial| $) (274 . |minimalPolynomial|)
              (280 . |extensionDegree|) (284 . |size|) (288 . |size|)
              (292 . |size|) (296 . ^) (302 . ^) (308 . |norm|) (314 . *)
              (320 . |trace|) (326 . |characteristic|) (330 . |characteristic|)
              (334 . |characteristic|) (338 . |index|) (343 . |inGroundField?|)
              (348 . |normal?|) (353 . |createNormalElement|) (357 . +)
              (363 . |Zero|) (367 . |gcd|) (373 . |One|) (377 . =)
              (383 . |normal?|) (388 . ~=) (394 . |degree|))
           '#(|transcendent?| 399 |transcendenceDegree| 404 |trace| 408 |size|
              419 |represents| 423 |normal?| 428 |norm| 433 |minimalPolynomial|
              444 |linearAssociatedOrder| 450 |linearAssociatedLog| 455
              |linearAssociatedExp| 466 |extensionDegree| 472 |dimension| 480
              |degree| 484 |createNormalElement| 494 |coordinates| 498
              |charthRoot| 503 |algebraic?| 508)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 115
                                                 '(0 6 0 8 0 6 9 10 0 6 11 12 2
                                                   14 7 0 13 15 2 16 6 0 13 17
                                                   2 6 0 7 0 18 2 6 0 0 0 19 1
                                                   23 0 21 24 1 26 0 13 27 1 6
                                                   11 0 29 0 7 0 31 3 32 0 21
                                                   21 7 33 1 16 13 0 34 1 6 14
                                                   0 35 3 32 0 0 13 14 36 2 6 0
                                                   0 0 42 2 7 0 0 0 43 1 32 7 0
                                                   45 1 47 21 0 48 2 47 7 0 21
                                                   49 1 6 0 0 50 2 0 0 0 47 51
                                                   2 6 38 0 0 52 0 47 0 53 1 14
                                                   54 0 55 2 56 0 0 54 57 1 32
                                                   0 56 58 1 32 0 0 59 1 32 0 0
                                                   60 1 14 0 21 61 0 7 0 62 2 7
                                                   38 0 0 63 0 6 0 64 3 14 7 0
                                                   13 7 65 2 47 0 7 21 66 2 47
                                                   0 0 0 67 2 47 38 0 0 68 1 71
                                                   69 70 72 2 0 73 0 0 74 0 6 0
                                                   75 2 6 73 0 0 76 1 0 47 0 77
                                                   1 32 78 0 79 1 0 47 0 80 1 6
                                                   0 0 81 1 0 82 0 83 2 21 38 0
                                                   0 84 2 85 0 6 21 86 2 85 0 0
                                                   0 87 2 6 0 0 21 88 2 85 0 0
                                                   0 89 2 0 90 0 11 91 0 6 26
                                                   92 0 6 21 93 0 0 21 94 0 7
                                                   21 95 2 21 0 0 11 96 2 6 0 0
                                                   21 97 2 0 0 0 11 98 2 21 0
                                                   11 0 99 2 0 0 0 11 100 0 6
                                                   21 101 0 7 21 102 0 13 21
                                                   103 1 6 0 11 104 1 6 38 0
                                                   105 1 6 38 0 106 0 0 0 107 2
                                                   85 0 0 0 108 0 85 0 109 2 85
                                                   0 0 0 110 0 85 0 111 2 85 38
                                                   0 0 112 1 0 38 0 113 2 6 38
                                                   0 0 114 1 0 11 0 115 1 0 38
                                                   0 40 0 0 21 22 2 0 0 0 11
                                                   100 1 0 7 0 44 0 0 21 94 1 0
                                                   0 14 20 1 0 38 0 113 2 0 0 0
                                                   11 98 1 0 7 0 46 2 0 90 0 11
                                                   91 1 0 47 0 80 2 0 73 0 0 74
                                                   1 0 47 0 77 2 0 0 0 47 51 0
                                                   0 11 41 0 0 26 28 0 0 23 25
                                                   1 0 11 0 115 1 0 26 0 30 0 0
                                                   0 107 1 0 32 9 37 1 0 82 0
                                                   83 1 0 38 0 39)))))
           '|lookupComplete|)) 
