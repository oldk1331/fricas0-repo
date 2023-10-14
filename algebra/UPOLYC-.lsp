
(/VERSIONCHECK 2) 

(DEFUN |UPOLYC-;variables;SL;1| (|p| $)
  (COND
   ((OR (SPADCALL |p| (QREFELT $ 9)) (ZEROP (SPADCALL |p| (QREFELT $ 11))))
    NIL)
   ('T (LIST (SPADCALL (QREFELT $ 13)))))) 

(DEFUN |UPOLYC-;degree;SSaosNni;2| (|p| |v| $) (SPADCALL |p| (QREFELT $ 11))) 

(DEFUN |UPOLYC-;totalDegree;SLNni;3| (|p| |lv| $)
  (COND ((NULL |lv|) 0) ('T (SPADCALL |p| (QREFELT $ 17))))) 

(DEFUN |UPOLYC-;degree;SLL;4| (|p| |lv| $)
  (COND ((NULL |lv|) NIL) ('T (LIST (SPADCALL |p| (QREFELT $ 11)))))) 

(DEFUN |UPOLYC-;eval;SLLS;5| (|p| |lv| |lq| $)
  (COND ((NULL |lv|) |p|)
        ((NULL (NULL (CDR |lv|)))
         (|error| "can only eval a univariate polynomial once"))
        ('T
         (SPADCALL |p| (|SPADfirst| |lv|) (|SPADfirst| |lq|) (QREFELT $ 21))))) 

(DEFUN |UPOLYC-;eval;SSaos2S;6| (|p| |v| |q| $)
  (SPADCALL |p| |q| (QREFELT $ 24))) 

(DEFUN |UPOLYC-;eval;SLLS;7| (|p| |lv| |lr| $)
  (COND ((NULL |lv|) |p|)
        ((NULL (NULL (CDR |lv|)))
         (|error| "can only eval a univariate polynomial once"))
        ('T
         (SPADCALL |p| (|SPADfirst| |lv|) (|SPADfirst| |lr|) (QREFELT $ 26))))) 

(DEFUN |UPOLYC-;eval;SSaosRS;8| (|p| |v| |r| $)
  (SPADCALL (SPADCALL |p| |r| (QREFELT $ 29)) (QREFELT $ 30))) 

(DEFUN |UPOLYC-;eval;SLS;9| (|p| |le| $)
  (COND ((NULL |le|) |p|)
        ((NULL (NULL (CDR |le|)))
         (|error| "can only eval a univariate polynomial once"))
        ('T
         (COND
          ((QEQCAR
            (SPADCALL (SPADCALL (|SPADfirst| |le|) (QREFELT $ 33))
                      (QREFELT $ 35))
            1)
           |p|)
          ('T
           (SPADCALL |p| (SPADCALL (|SPADfirst| |le|) (QREFELT $ 36))
                     (QREFELT $ 24))))))) 

(DEFUN |UPOLYC-;mainVariable;SU;10| (|p| $)
  (COND ((ZEROP (SPADCALL |p| (QREFELT $ 11))) (CONS 1 "failed"))
        ('T (CONS 0 (SPADCALL (QREFELT $ 13)))))) 

(DEFUN |UPOLYC-;minimumDegree;SSaosNni;11| (|p| |v| $)
  (SPADCALL |p| (QREFELT $ 40))) 

(DEFUN |UPOLYC-;minimumDegree;SLL;12| (|p| |lv| $)
  (COND ((NULL |lv|) NIL) ('T (LIST (SPADCALL |p| (QREFELT $ 40)))))) 

(DEFUN |UPOLYC-;monomial;SSaosNniS;13| (|p| |v| |n| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|UPOLYC-;monomial;SSaosNniS;13!0| (VECTOR $ |n|)) |p|
               (QREFELT $ 45))))) 

(DEFUN |UPOLYC-;monomial;SSaosNniS;13!0| (|x1| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|UPOLYC-;monomial;SSaosNniS;13|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |n| (QREFELT $ 43)))))) 

(DEFUN |UPOLYC-;coerce;SaosS;14| (|v| $)
  (SPADCALL (|spadConstant| $ 48) 1 (QREFELT $ 49))) 

(DEFUN |UPOLYC-;makeSUP;SSup;15| (|p| $)
  (COND ((SPADCALL |p| (QREFELT $ 9)) (|spadConstant| $ 52))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL |p| (QREFELT $ 53)) (SPADCALL |p| (QREFELT $ 11))
                    (QREFELT $ 54))
          (SPADCALL (SPADCALL |p| (QREFELT $ 55)) (QREFELT $ 56))
          (QREFELT $ 57))))) 

(DEFUN |UPOLYC-;unmakeSUP;SupS;16| (|sp| $)
  (COND ((SPADCALL |sp| (QREFELT $ 59)) (|spadConstant| $ 60))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL |sp| (QREFELT $ 61))
                    (SPADCALL |sp| (QREFELT $ 62)) (QREFELT $ 49))
          (SPADCALL (SPADCALL |sp| (QREFELT $ 63)) (QREFELT $ 64))
          (QREFELT $ 65))))) 

(DEFUN |UPOLYC-;karatsubaDivide;SNniR;17| (|p| |n| $)
  (SPADCALL |p| (SPADCALL (|spadConstant| $ 48) |n| (QREFELT $ 49))
            (QREFELT $ 68))) 

(DEFUN |UPOLYC-;shiftRight;SNniS;18| (|p| |n| $)
  (QCAR
   (SPADCALL |p| (SPADCALL (|spadConstant| $ 48) |n| (QREFELT $ 49))
             (QREFELT $ 68)))) 

(DEFUN |UPOLYC-;shiftLeft;SNniS;19| (|p| |n| $)
  (SPADCALL |p| (SPADCALL (|spadConstant| $ 48) |n| (QREFELT $ 49))
            (QREFELT $ 71))) 

(DEFUN |UPOLYC-;solveLinearPolynomialEquation;LSupU;20| (|lpp| |pp| $)
  (SPADCALL |lpp| |pp| (QREFELT $ 77))) 

(DEFUN |UPOLYC-;factorPolynomial;SupF;21| (|pp| $)
  (SPADCALL |pp| (QREFELT $ 83))) 

(DEFUN |UPOLYC-;factorSquareFreePolynomial;SupF;22| (|pp| $)
  (SPADCALL |pp| (QREFELT $ 86))) 

(DEFUN |UPOLYC-;factor;SF;23| (|p| $)
  (PROG (#1=#:G243 |w| #2=#:G242 |ansR|)
    (RETURN
     (SEQ
      (COND
       ((ZEROP (SPADCALL |p| (QREFELT $ 11)))
        (SEQ
         (LETT |ansR| (SPADCALL (SPADCALL |p| (QREFELT $ 53)) (QREFELT $ 89))
               . #3=(|UPOLYC-;factor;SF;23|))
         (EXIT
          (SPADCALL (SPADCALL (SPADCALL |ansR| (QREFELT $ 91)) (QREFELT $ 30))
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |w| NIL . #3#)
                          (LETT #1# (SPADCALL |ansR| (QREFELT $ 95)) . #3#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |w| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (VECTOR (QVELT |w| 0)
                                           (SPADCALL (QVELT |w| 1)
                                                     (QREFELT $ 30))
                                           (QVELT |w| 2))
                                   #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 99)))))
       ('T
        (SPADCALL (ELT $ 64)
                  (SPADCALL (SPADCALL |p| (QREFELT $ 56)) (QREFELT $ 100))
                  (QREFELT $ 104)))))))) 

(DEFUN |UPOLYC-;vectorise;SNniV;24| (|p| |n| $)
  (PROG (#1=#:G244 #2=#:G248 |i| |m| |v|)
    (RETURN
     (SEQ
      (LETT |m|
            (SPADCALL
             (LETT |v| (MAKEARR1 |n| (|spadConstant| $ 106))
                   . #3=(|UPOLYC-;vectorise;SNniV;24|))
             (QREFELT $ 109))
            . #3#)
      (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 109)) . #3#)
           (LETT #2# (QVSIZE |v|) . #3#) G190 (COND ((> |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (QSETAREF1O |v| |i|
                         (SPADCALL |p|
                                   (PROG1 (LETT #1# (- |i| |m|) . #3#)
                                     (|check_subtype| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      #1#))
                                   (QREFELT $ 110))
                         1)))
           (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |v|))))) 

(DEFUN |UPOLYC-;retract;SR;25| (|p| $)
  (COND ((SPADCALL |p| (QREFELT $ 9)) (|spadConstant| $ 106))
        ((ZEROP (SPADCALL |p| (QREFELT $ 11))) (SPADCALL |p| (QREFELT $ 53)))
        ('T (|error| "Polynomial is not of degree 0")))) 

(DEFUN |UPOLYC-;retractIfCan;SU;26| (|p| $)
  (COND ((SPADCALL |p| (QREFELT $ 9)) (CONS 0 (|spadConstant| $ 106)))
        ((ZEROP (SPADCALL |p| (QREFELT $ 11)))
         (CONS 0 (SPADCALL |p| (QREFELT $ 53))))
        ('T (CONS 1 "failed")))) 

(DEFUN |UPOLYC-;init;S;27| ($) (SPADCALL (|spadConstant| $ 115) (QREFELT $ 30))) 

(DEFUN |UPOLYC-;nextItemInner| (|n| $)
  (PROG (|n3| #1=#:G266 |n2| |n1| |nn|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |n| (QREFELT $ 9))
        (CONS 0
              (SPADCALL
               (PROG2
                   (LETT #1# (SPADCALL (|spadConstant| $ 106) (QREFELT $ 118))
                         . #2=(|UPOLYC-;nextItemInner|))
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
               (QREFELT $ 30))))
       ((ZEROP (SPADCALL |n| (QREFELT $ 11)))
        (SEQ
         (LETT |nn| (SPADCALL (SPADCALL |n| (QREFELT $ 53)) (QREFELT $ 118))
               . #2#)
         (EXIT
          (COND ((QEQCAR |nn| 1) (CONS 1 "failed"))
                (#3='T (CONS 0 (SPADCALL (QCDR |nn|) (QREFELT $ 30))))))))
       (#3#
        (SEQ (LETT |n1| (SPADCALL |n| (QREFELT $ 55)) . #2#)
             (LETT |n2| (|UPOLYC-;nextItemInner| |n1| $) . #2#)
             (EXIT
              (COND
               ((QEQCAR |n2| 0)
                (CONS 0
                      (SPADCALL
                       (SPADCALL (SPADCALL |n| (QREFELT $ 53))
                                 (SPADCALL |n| (QREFELT $ 11)) (QREFELT $ 49))
                       (QCDR |n2|) (QREFELT $ 65))))
               ((< (+ 1 (SPADCALL |n1| (QREFELT $ 11)))
                   (SPADCALL |n| (QREFELT $ 11)))
                (CONS 0
                      (SPADCALL
                       (SPADCALL (SPADCALL |n| (QREFELT $ 53))
                                 (SPADCALL |n| (QREFELT $ 11)) (QREFELT $ 49))
                       (SPADCALL
                        (PROG2
                            (LETT #1#
                                  (SPADCALL (|spadConstant| $ 115)
                                            (QREFELT $ 118))
                                  . #2#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                        (+ 1 (SPADCALL |n1| (QREFELT $ 11))) (QREFELT $ 49))
                       (QREFELT $ 65))))
               (#3#
                (SEQ
                 (LETT |n3|
                       (SPADCALL (SPADCALL |n| (QREFELT $ 53)) (QREFELT $ 118))
                       . #2#)
                 (EXIT
                  (COND ((QEQCAR |n3| 1) (CONS 1 "failed"))
                        (#3#
                         (CONS 0
                               (SPADCALL (QCDR |n3|)
                                         (SPADCALL |n| (QREFELT $ 11))
                                         (QREFELT $ 49))))))))))))))))) 

(DEFUN |UPOLYC-;nextItem;SU;29| (|n| $)
  (PROG (#1=#:G279 |n1|)
    (RETURN
     (SEQ
      (LETT |n1| (|UPOLYC-;nextItemInner| |n| $)
            . #2=(|UPOLYC-;nextItem;SU;29|))
      (EXIT
       (COND
        ((QEQCAR |n1| 1)
         (CONS 0
               (SPADCALL
                (PROG2
                    (LETT #1# (SPADCALL (|spadConstant| $ 115) (QREFELT $ 118))
                          . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                (+ 1 (SPADCALL |n| (QREFELT $ 11))) (QREFELT $ 49))))
        ('T |n1|))))))) 

(DEFUN |UPOLYC-;content;SSaosS;30| (|p| |v| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 120)) (QREFELT $ 30))) 

(DEFUN |UPOLYC-;primeFactor| (|p| |q| $)
  (PROG (|p1| #1=#:G285)
    (RETURN
     (SEQ
      (LETT |p1|
            (PROG2
                (LETT #1#
                      (SPADCALL |p| (SPADCALL |p| |q| (QREFELT $ 122))
                                (QREFELT $ 123))
                      . #2=(|UPOLYC-;primeFactor|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
            . #2#)
      (EXIT
       (COND ((SPADCALL |p1| |p| (QREFELT $ 124)) |p|)
             ('T (|UPOLYC-;primeFactor| |p1| |q| $)))))))) 

(DEFUN |UPOLYC-;separate;2SR;32| (|p| |q| $)
  (PROG (#1=#:G291 |a|)
    (RETURN
     (SEQ
      (LETT |a| (|UPOLYC-;primeFactor| |p| |q| $)
            . #2=(|UPOLYC-;separate;2SR;32|))
      (EXIT
       (CONS |a|
             (PROG2 (LETT #1# (SPADCALL |p| |a| (QREFELT $ 123)) . #2#)
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#)))))))) 

(DEFUN |UPOLYC-;differentiate;SM2S;33| (|x| |deriv| |x'| $)
  (PROG (|d| #1=#:G296 |lc| |dg|)
    (RETURN
     (SEQ
      (LETT |d| (|spadConstant| $ 60) . #2=(|UPOLYC-;differentiate;SM2S;33|))
      (SEQ G190
           (COND
            ((NULL
              (SPADCALL (LETT |dg| (SPADCALL |x| (QREFELT $ 11)) . #2#) 0
                        (QREFELT $ 127)))
             (GO G191)))
           (SEQ (LETT |lc| (SPADCALL |x| (QREFELT $ 53)) . #2#)
                (LETT |d|
                      (SPADCALL
                       (SPADCALL |d|
                                 (SPADCALL |x'|
                                           (SPADCALL
                                            (SPADCALL |dg| |lc|
                                                      (QREFELT $ 128))
                                            (PROG1 (LETT #1# (- |dg| 1) . #2#)
                                              (|check_subtype| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               #1#))
                                            (QREFELT $ 49))
                                           (QREFELT $ 71))
                                 (QREFELT $ 65))
                       (SPADCALL (SPADCALL |lc| |deriv|) |dg| (QREFELT $ 49))
                       (QREFELT $ 65))
                      . #2#)
                (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 55)) . #2#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL |d|
                 (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 53)) |deriv|)
                           (QREFELT $ 30))
                 (QREFELT $ 65))))))) 

(DEFUN |UPOLYC-;ncdiff| (|n| |x'| $)
  (PROG (|n1| #1=#:G314)
    (RETURN
     (COND ((ZEROP |n|) (|spadConstant| $ 60))
           ((ZEROP
             (LETT |n1|
                   (PROG1 (LETT #1# (- |n| 1) . #2=(|UPOLYC-;ncdiff|))
                     (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                   . #2#))
            |x'|)
           ('T
            (SPADCALL
             (SPADCALL |x'|
                       (SPADCALL (|spadConstant| $ 48) |n1| (QREFELT $ 49))
                       (QREFELT $ 71))
             (SPADCALL (SPADCALL (|spadConstant| $ 48) 1 (QREFELT $ 49))
                       (|UPOLYC-;ncdiff| |n1| |x'| $) (QREFELT $ 71))
             (QREFELT $ 65))))))) 

(DEFUN |UPOLYC-;differentiate;SM2S;35| (|x| |deriv| |x'| $)
  (PROG (|d| |lc| |dg|)
    (RETURN
     (SEQ
      (LETT |d| (|spadConstant| $ 60) . #1=(|UPOLYC-;differentiate;SM2S;35|))
      (SEQ G190
           (COND
            ((NULL
              (SPADCALL (LETT |dg| (SPADCALL |x| (QREFELT $ 11)) . #1#) 0
                        (QREFELT $ 127)))
             (GO G191)))
           (SEQ (LETT |lc| (SPADCALL |x| (QREFELT $ 53)) . #1#)
                (LETT |d|
                      (SPADCALL
                       (SPADCALL |d|
                                 (SPADCALL (SPADCALL |lc| |deriv|) |dg|
                                           (QREFELT $ 49))
                                 (QREFELT $ 65))
                       (SPADCALL |lc| (|UPOLYC-;ncdiff| |dg| |x'| $)
                                 (QREFELT $ 131))
                       (QREFELT $ 65))
                      . #1#)
                (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 55)) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL |d|
                 (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 53)) |deriv|)
                           (QREFELT $ 30))
                 (QREFELT $ 65))))))) 

(DEFUN |UPOLYC-;differentiate;SMS;36| (|x| |deriv| $)
  (SPADCALL |x| |deriv| (|spadConstant| $ 47) (QREFELT $ 132))) 

(DEFUN |UPOLYC-;differentiate;2S;37| (|x| $)
  (PROG (|d| #1=#:G324 |dg|)
    (RETURN
     (SEQ (LETT |d| (|spadConstant| $ 60) . #2=(|UPOLYC-;differentiate;2S;37|))
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (LETT |dg| (SPADCALL |x| (QREFELT $ 11)) . #2#) 0
                            (QREFELT $ 127)))
                 (GO G191)))
               (SEQ
                (LETT |d|
                      (SPADCALL |d|
                                (SPADCALL
                                 (SPADCALL |dg| (SPADCALL |x| (QREFELT $ 53))
                                           (QREFELT $ 128))
                                 (PROG1 (LETT #1# (- |dg| 1) . #2#)
                                   (|check_subtype| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                 (QREFELT $ 49))
                                (QREFELT $ 65))
                      . #2#)
                (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 55)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |d|))))) 

(DEFUN |UPOLYC-;differentiate;SSaosS;38| (|x| |v| $)
  (SPADCALL |x| (QREFELT $ 135))) 

(DEFUN |UPOLYC-;elt;3F;39| (|g| |f| $)
  (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 138)) |f| (QREFELT $ 140))
            (SPADCALL (SPADCALL |g| (QREFELT $ 141)) |f| (QREFELT $ 140))
            (QREFELT $ 142))) 

(DEFUN |UPOLYC-;pseudoQuotient;3S;40| (|p| |q| $)
  (PROG (#1=#:G372 #2=#:G370 |n|)
    (RETURN
     (SEQ
      (LETT |n|
            (+ (- (SPADCALL |p| (QREFELT $ 11)) (SPADCALL |q| (QREFELT $ 11)))
               1)
            . #3=(|UPOLYC-;pseudoQuotient;3S;40|))
      (EXIT
       (COND ((< |n| 1) (|spadConstant| $ 60))
             ('T
              (PROG2
                  (LETT #1#
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |q| (QREFELT $ 53))
                                     (PROG1 (LETT #2# |n| . #3#)
                                       (|check_subtype| (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        #2#))
                                     (QREFELT $ 144))
                           |p| (QREFELT $ 131))
                          (SPADCALL |p| |q| (QREFELT $ 145)) (QREFELT $ 146))
                         |q| (QREFELT $ 123))
                        . #3#)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))))))))) 

(DEFUN |UPOLYC-;pseudoDivide;2SR;41| (|p| |q| $)
  (PROG (#1=#:G380 |lc| #2=#:G378 |prem| |n|)
    (RETURN
     (SEQ
      (LETT |n|
            (+ (- (SPADCALL |p| (QREFELT $ 11)) (SPADCALL |q| (QREFELT $ 11)))
               1)
            . #3=(|UPOLYC-;pseudoDivide;2SR;41|))
      (EXIT
       (COND
        ((< |n| 1) (VECTOR (|spadConstant| $ 48) (|spadConstant| $ 60) |p|))
        ('T
         (SEQ (LETT |prem| (SPADCALL |p| |q| (QREFELT $ 145)) . #3#)
              (LETT |lc|
                    (SPADCALL (SPADCALL |q| (QREFELT $ 53))
                              (PROG1 (LETT #2# |n| . #3#)
                                (|check_subtype| (>= #2# 0)
                                                 '(|NonNegativeInteger|) #2#))
                              (QREFELT $ 144))
                    . #3#)
              (EXIT
               (VECTOR |lc|
                       (PROG2
                           (LETT #1#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |lc| |p| (QREFELT $ 131))
                                            |prem| (QREFELT $ 146))
                                  |q| (QREFELT $ 123))
                                 . #3#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                       |prem|)))))))))) 

(DEFUN |UPOLYC-;composite;FSU;42| (|f| |q| $)
  (PROG (|d| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (SPADCALL |f| (QREFELT $ 138)) |q| (QREFELT $ 150))
            . #1=(|UPOLYC-;composite;FSU;42|))
      (EXIT
       (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |d|
                     (SPADCALL (SPADCALL |f| (QREFELT $ 141)) |q|
                               (QREFELT $ 150))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL (QCDR |n|) (QCDR |d|)
                                       (QREFELT $ 151)))))))))))))) 

(DEFUN |UPOLYC-;composite;2SU;43| (|p| |q| $)
  (PROG (#1=#:G406 |w| |u| |v| |cqr|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 154)) (CONS 0 |p|))
            ('T
             (SEQ
              (EXIT
               (SEQ
                (LETT |cqr| (SPADCALL |p| |q| (QREFELT $ 155))
                      . #2=(|UPOLYC-;composite;2SU;43|))
                (COND
                 ((SPADCALL (QVELT |cqr| 2) (QREFELT $ 154))
                  (SEQ
                   (LETT |v|
                         (SPADCALL (QVELT |cqr| 2) (QVELT |cqr| 0)
                                   (QREFELT $ 156))
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |v| 0)
                      (SEQ
                       (LETT |u| (SPADCALL (QVELT |cqr| 1) |q| (QREFELT $ 150))
                             . #2#)
                       (EXIT
                        (COND
                         ((QEQCAR |u| 0)
                          (SEQ
                           (LETT |w|
                                 (SPADCALL (QCDR |u|) (QVELT |cqr| 0)
                                           (QREFELT $ 156))
                                 . #2#)
                           (EXIT
                            (COND
                             ((QEQCAR |w| 0)
                              (PROGN
                               (LETT #1#
                                     (CONS 0
                                           (SPADCALL (QCDR |v|)
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (|spadConstant| $ 48) 1
                                                       (QREFELT $ 49))
                                                      (QCDR |w|)
                                                      (QREFELT $ 71))
                                                     (QREFELT $ 65)))
                                     . #2#)
                               (GO #1#))))))))))))))))
                (EXIT (CONS 1 "failed"))))
              #1# (EXIT #1#)))))))) 

(DEFUN |UPOLYC-;elt;S2F;44| (|p| |f| $)
  (PROG (|ans| #1=#:G413 |n|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 9)) (|spadConstant| $ 158))
            (#2='T
             (SEQ
              (LETT |ans|
                    (SPADCALL
                     (SPADCALL (SPADCALL |p| (QREFELT $ 53)) (QREFELT $ 30))
                     (QREFELT $ 159))
                    . #3=(|UPOLYC-;elt;S2F;44|))
              (LETT |n| (SPADCALL |p| (QREFELT $ 11)) . #3#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((SPADCALL
                         (LETT |p| (SPADCALL |p| (QREFELT $ 55)) . #3#)
                         (QREFELT $ 9))
                        'NIL)
                       ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |ans|
                           (SPADCALL
                            (SPADCALL |ans|
                                      (SPADCALL |f|
                                                (PROG1
                                                    (LETT #1#
                                                          (- |n|
                                                             (LETT |n|
                                                                   (SPADCALL
                                                                    |p|
                                                                    (QREFELT $
                                                                             11))
                                                                   . #3#))
                                                          . #3#)
                                                  (|check_subtype| (>= #1# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   #1#))
                                                (QREFELT $ 160))
                                      (QREFELT $ 161))
                            (SPADCALL
                             (SPADCALL (SPADCALL |p| (QREFELT $ 53))
                                       (QREFELT $ 30))
                             (QREFELT $ 159))
                            (QREFELT $ 162))
                           . #3#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((ZEROP |n|) |ans|)
                     (#2#
                      (SPADCALL |ans| (SPADCALL |f| |n| (QREFELT $ 163))
                                (QREFELT $ 161)))))))))))) 

(DEFUN |UPOLYC-;order;2SNni;45| (|p| |q| $)
  (PROG (|ans| #1=#:G427 |u|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |p| (QREFELT $ 9))
         (|error| "order: arguments must be nonzero"))
        ((< (SPADCALL |q| (QREFELT $ 11)) 1)
         (|error| "order: place must be non-trivial"))
        ('T
         (SEQ (LETT |ans| 0 . #2=(|UPOLYC-;order;2SNni;45|))
              (EXIT
               (SEQ G190 NIL
                    (SEQ (LETT |u| (SPADCALL |p| |q| (QREFELT $ 123)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |u| 1)
                            (PROGN (LETT #1# |ans| . #2#) (GO #1#)))
                           ('T
                            (SEQ (LETT |p| (QCDR |u|) . #2#)
                                 (EXIT (LETT |ans| (+ |ans| 1) . #2#)))))))
                    NIL (GO G190) G191 (EXIT NIL)))))))
      #1# (EXIT #1#))))) 

(DEFUN |UPOLYC-;squareFree;SF;46| (|p| $) (SPADCALL |p| (QREFELT $ 167))) 

(DEFUN |UPOLYC-;squareFreePart;2S;47| (|p| $) (SPADCALL |p| (QREFELT $ 169))) 

(DEFUN |UPOLYC-;gcdPolynomial;3Sup;48| (|pp| |qq| $)
  (COND ((SPADCALL |pp| (QREFELT $ 171)) (SPADCALL |qq| (QREFELT $ 172)))
        ((SPADCALL |qq| (QREFELT $ 171)) (SPADCALL |pp| (QREFELT $ 172)))
        ('T
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |pp| (QREFELT $ 173))
                     (SPADCALL |qq| (QREFELT $ 173)) (QREFELT $ 122))
           (SPADCALL
            (SPADCALL (SPADCALL |pp| (QREFELT $ 174))
                      (SPADCALL |qq| (QREFELT $ 174)) (QREFELT $ 175))
            (QREFELT $ 174))
           (QREFELT $ 176))
          (QREFELT $ 172))))) 

(DEFUN |UPOLYC-;squareFreePolynomial;SupF;49| (|pp| $)
  (SPADCALL |pp| (QREFELT $ 179))) 

(DEFUN |UPOLYC-;elt;F2R;50| (|f| |r| $)
  (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 138)) |r| (QREFELT $ 29))
            (SPADCALL (SPADCALL |f| (QREFELT $ 141)) |r| (QREFELT $ 29))
            (QREFELT $ 181))) 

(DEFUN |UPOLYC-;euclideanSize;SNni;51| (|x| $)
  (COND
   ((SPADCALL |x| (QREFELT $ 9))
    (|error| "euclideanSize called on 0 in Univariate Polynomial"))
   ('T (SPADCALL |x| (QREFELT $ 11))))) 

(DEFUN |UPOLYC-;divide;2SR;52| (|x| |y| $)
  (PROG (|quot| |n| #1=#:G441 |f| |lc|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |y| (QREFELT $ 9))
        (|error| "division by 0 in Univariate Polynomials"))
       ('T
        (SEQ (LETT |quot| (|spadConstant| $ 60) . #2=(|UPOLYC-;divide;2SR;52|))
             (LETT |lc|
                   (SPADCALL (SPADCALL |y| (QREFELT $ 53)) (QREFELT $ 184))
                   . #2#)
             (SEQ G190
                  (COND
                   ((NULL
                     (COND ((SPADCALL |x| (QREFELT $ 9)) 'NIL)
                           ('T
                            (>= (SPADCALL |x| (QREFELT $ 11))
                                (SPADCALL |y| (QREFELT $ 11))))))
                    (GO G191)))
                  (SEQ
                   (LETT |f|
                         (SPADCALL |lc| (SPADCALL |x| (QREFELT $ 53))
                                   (QREFELT $ 185))
                         . #2#)
                   (LETT |n|
                         (PROG1
                             (LETT #1#
                                   (- (SPADCALL |x| (QREFELT $ 11))
                                      (SPADCALL |y| (QREFELT $ 11)))
                                   . #2#)
                           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                            #1#))
                         . #2#)
                   (LETT |quot|
                         (SPADCALL |quot| (SPADCALL |f| |n| (QREFELT $ 49))
                                   (QREFELT $ 65))
                         . #2#)
                   (EXIT
                    (LETT |x|
                          (SPADCALL |x|
                                    (SPADCALL (SPADCALL |f| |n| (QREFELT $ 49))
                                              |y| (QREFELT $ 71))
                                    (QREFELT $ 146))
                          . #2#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (CONS |quot| |x|))))))))) 

(DEFUN |UPOLYC-;integrate;2S;53| (|p| $)
  (PROG (|ans| |d| |l|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 60) . #1=(|UPOLYC-;integrate;2S;53|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 60) (QREFELT $ 187)))
                 (GO G191)))
               (SEQ (LETT |l| (SPADCALL |p| (QREFELT $ 53)) . #1#)
                    (LETT |d| (+ 1 (SPADCALL |p| (QREFELT $ 11))) . #1#)
                    (LETT |ans|
                          (SPADCALL |ans|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |d| (QREFELT $ 190))
                                               (QREFELT $ 191))
                                     (SPADCALL |l| |d| (QREFELT $ 49))
                                     (QREFELT $ 192))
                                    (QREFELT $ 65))
                          . #1#)
                    (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 55)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DECLAIM (NOTINLINE |UnivariatePolynomialCategory&;|)) 

(DEFUN |UnivariatePolynomialCategory&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|UnivariatePolynomialCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|UnivariatePolynomialCategory&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 200) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|Field|))
                                          (|HasCategory| |#2| '(|GcdDomain|))
                                          (|HasCategory| |#2|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|StepThrough|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
        (PROGN
         (QSETREFV $ 81
                   (CONS
                    (|dispatchFunction|
                     |UPOLYC-;solveLinearPolynomialEquation;LSupU;20|)
                    $))
         (QSETREFV $ 85
                   (CONS
                    (|dispatchFunction| |UPOLYC-;factorPolynomial;SupF;21|) $))
         (QSETREFV $ 87
                   (CONS
                    (|dispatchFunction|
                     |UPOLYC-;factorSquareFreePolynomial;SupF;22|)
                    $))
         (QSETREFV $ 105
                   (CONS (|dispatchFunction| |UPOLYC-;factor;SF;23|) $)))))
      (COND
       ((|testBitVector| |pv$| 6)
        (PROGN
         (QSETREFV $ 116 (CONS (|dispatchFunction| |UPOLYC-;init;S;27|) $))
         NIL
         (QSETREFV $ 119
                   (CONS (|dispatchFunction| |UPOLYC-;nextItem;SU;29|) $)))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 121
                   (CONS (|dispatchFunction| |UPOLYC-;content;SSaosS;30|) $))
         NIL
         (QSETREFV $ 126
                   (CONS (|dispatchFunction| |UPOLYC-;separate;2SR;32|) $)))))
      (COND
       ((|testBitVector| |pv$| 5)
        (QSETREFV $ 130
                  (CONS (|dispatchFunction| |UPOLYC-;differentiate;SM2S;33|)
                        $)))
       ('T
        (PROGN
         (QSETREFV $ 130
                   (CONS (|dispatchFunction| |UPOLYC-;differentiate;SM2S;35|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 4)
        (PROGN
         (QSETREFV $ 143 (CONS (|dispatchFunction| |UPOLYC-;elt;3F;39|) $))
         (QSETREFV $ 147
                   (CONS (|dispatchFunction| |UPOLYC-;pseudoQuotient;3S;40|)
                         $))
         (QSETREFV $ 149
                   (CONS (|dispatchFunction| |UPOLYC-;pseudoDivide;2SR;41|) $))
         (QSETREFV $ 153
                   (CONS (|dispatchFunction| |UPOLYC-;composite;FSU;42|) $))
         (QSETREFV $ 157
                   (CONS (|dispatchFunction| |UPOLYC-;composite;2SU;43|) $))
         (QSETREFV $ 164 (CONS (|dispatchFunction| |UPOLYC-;elt;S2F;44|) $))
         (QSETREFV $ 165
                   (CONS (|dispatchFunction| |UPOLYC-;order;2SNni;45|) $)))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 168
                   (CONS (|dispatchFunction| |UPOLYC-;squareFree;SF;46|) $))
         (QSETREFV $ 170
                   (CONS (|dispatchFunction| |UPOLYC-;squareFreePart;2S;47|)
                         $)))))
      (COND
       ((|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
        (PROGN
         (QSETREFV $ 177
                   (CONS (|dispatchFunction| |UPOLYC-;gcdPolynomial;3Sup;48|)
                         $))
         (QSETREFV $ 180
                   (CONS
                    (|dispatchFunction| |UPOLYC-;squareFreePolynomial;SupF;49|)
                    $)))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 182 (CONS (|dispatchFunction| |UPOLYC-;elt;F2R;50|) $))
         (QSETREFV $ 183
                   (CONS (|dispatchFunction| |UPOLYC-;euclideanSize;SNni;51|)
                         $))
         (QSETREFV $ 186
                   (CONS (|dispatchFunction| |UPOLYC-;divide;2SR;52|) $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 193
                  (CONS (|dispatchFunction| |UPOLYC-;integrate;2S;53|) $))))
      $)))) 

(MAKEPROP '|UnivariatePolynomialCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |zero?|) (|NonNegativeInteger|) (5 . |degree|)
              (|SingletonAsOrderedSet|) (10 . |create|) (|List| 12)
              |UPOLYC-;variables;SL;1| |UPOLYC-;degree;SSaosNni;2|
              (14 . |totalDegree|) |UPOLYC-;totalDegree;SLNni;3| (|List| 10)
              |UPOLYC-;degree;SLL;4| (19 . |eval|) (|List| $)
              |UPOLYC-;eval;SLLS;5| (26 . |elt|) |UPOLYC-;eval;SSaos2S;6|
              (32 . |eval|) (|List| 7) |UPOLYC-;eval;SLLS;7| (39 . |elt|)
              (45 . |coerce|) |UPOLYC-;eval;SSaosRS;8| (|Equation| 6)
              (50 . |lhs|) (|Union| 12 '"failed") (55 . |mainVariable|)
              (60 . |rhs|) (|List| 196) |UPOLYC-;eval;SLS;9|
              |UPOLYC-;mainVariable;SU;10| (65 . |minimumDegree|)
              |UPOLYC-;minimumDegree;SSaosNni;11|
              |UPOLYC-;minimumDegree;SLL;12| (70 . +) (|Mapping| 10 10)
              (76 . |mapExponents|) |UPOLYC-;monomial;SSaosNniS;13|
              (82 . |One|) (86 . |One|) (90 . |monomial|)
              |UPOLYC-;coerce;SaosS;14| (|SparseUnivariatePolynomial| 7)
              (96 . |Zero|) (100 . |leadingCoefficient|) (105 . |monomial|)
              (111 . |reductum|) (116 . |makeSUP|) (121 . +)
              |UPOLYC-;makeSUP;SSup;15| (127 . |zero?|) (132 . |Zero|)
              (136 . |leadingCoefficient|) (141 . |degree|) (146 . |reductum|)
              (151 . |unmakeSUP|) (156 . +) |UPOLYC-;unmakeSUP;SupS;16|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (162 . |monicDivide|) |UPOLYC-;karatsubaDivide;SNniR;17|
              |UPOLYC-;shiftRight;SNniS;18| (168 . *)
              |UPOLYC-;shiftLeft;SNniS;19| (|Union| 74 '"failed") (|List| 75)
              (|SparseUnivariatePolynomial| 6)
              (|PolynomialFactorizationByRecursionUnivariate| 7 6)
              (174 . |solveLinearPolynomialEquationByRecursion|)
              (|Union| 79 '"failed") (|List| 80)
              (|SparseUnivariatePolynomial| $)
              (180 . |solveLinearPolynomialEquation|) (|Factored| 75)
              (186 . |factorByRecursion|) (|Factored| 80)
              (191 . |factorPolynomial|) (196 . |factorSquareFreeByRecursion|)
              (201 . |factorSquareFreePolynomial|) (|Factored| $)
              (206 . |factor|) (|Factored| 7) (211 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 92) (|:| |fctr| 7) (|:| |xpnt| 107))
              (|List| 93) (216 . |factorList|)
              (|Record| (|:| |flg| 92) (|:| |fctr| 6) (|:| |xpnt| 107))
              (|List| 96) (|Factored| 6) (221 . |makeFR|)
              (227 . |factorPolynomial|) (|Mapping| 6 51) (|Factored| 51)
              (|FactoredFunctions2| 51 6) (232 . |map|) (238 . |factor|)
              (243 . |Zero|) (|Integer|) (|Vector| 7) (247 . |minIndex|)
              (252 . |coefficient|) |UPOLYC-;vectorise;SNniV;24|
              |UPOLYC-;retract;SR;25| (|Union| 7 '"failed")
              |UPOLYC-;retractIfCan;SU;26| (258 . |init|) (262 . |init|)
              (|Union| $ '"failed") (266 . |nextItem|) (271 . |nextItem|)
              (276 . |content|) (281 . |content|) (287 . |gcd|) (293 . |exquo|)
              (299 . =) (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (305 . |separate|) (311 . >) (317 . *) (|Mapping| 7 7)
              (323 . |differentiate|) (330 . *) (336 . |differentiate|)
              |UPOLYC-;differentiate;SMS;36| |UPOLYC-;differentiate;2S;37|
              (343 . |differentiate|) |UPOLYC-;differentiate;SSaosS;38|
              (|Fraction| 6) (348 . |numer|) (|Fraction| $) (353 . |elt|)
              (359 . |denom|) (364 . /) (370 . |elt|) (376 . ^)
              (382 . |pseudoRemainder|) (388 . -) (394 . |pseudoQuotient|)
              (|Record| (|:| |coef| 7) (|:| |quotient| $) (|:| |remainder| $))
              (400 . |pseudoDivide|) (406 . |composite|) (412 . /)
              (|Union| 139 '"failed") (418 . |composite|) (424 . |ground?|)
              (429 . |pseudoDivide|) (435 . |exquo|) (441 . |composite|)
              (447 . |Zero|) (451 . |coerce|) (456 . ^) (462 . *) (468 . +)
              (474 . ^) (480 . |elt|) (486 . |order|)
              (|UnivariatePolynomialSquareFree| 7 6) (492 . |squareFree|)
              (497 . |squareFree|) (502 . |squareFreePart|)
              (507 . |squareFreePart|) (512 . |zero?|) (517 . |unitCanonical|)
              (522 . |content|) (527 . |primitivePart|)
              (532 . |subResultantGcd|) (538 . *) (544 . |gcdPolynomial|)
              (|UnivariatePolynomialSquareFree| 6 75) (550 . |squareFree|)
              (555 . |squareFreePolynomial|) (560 . /) (566 . |elt|)
              (572 . |euclideanSize|) (577 . |inv|) (582 . *) (588 . |divide|)
              (594 . ~=) (600 . |One|) (|Fraction| 107) (604 . |coerce|)
              (609 . |inv|) (614 . *) (620 . |integrate|) (|Symbol|)
              (|List| 194) (|Equation| $) (|Union| 107 '#1="failed")
              (|Union| 189 '#1#) (|OutputForm|))
           '#(|vectorise| 625 |variables| 631 |unmakeSUP| 636 |totalDegree| 641
              |squareFreePolynomial| 647 |squareFreePart| 652 |squareFree| 657
              |solveLinearPolynomialEquation| 662 |shiftRight| 668 |shiftLeft|
              674 |separate| 680 |retractIfCan| 686 |retract| 691
              |pseudoQuotient| 696 |pseudoDivide| 702 |order| 708 |nextItem|
              714 |monomial| 719 |minimumDegree| 726 |makeSUP| 738
              |mainVariable| 743 |karatsubaDivide| 748 |integrate| 754 |init|
              759 |gcdPolynomial| 763 |factorSquareFreePolynomial| 769
              |factorPolynomial| 774 |factor| 779 |eval| 784 |euclideanSize|
              818 |elt| 823 |divide| 841 |differentiate| 847 |degree| 871
              |content| 883 |composite| 889 |coerce| 901)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 193
                                                 '(1 6 8 0 9 1 6 10 0 11 0 12 0
                                                   13 1 6 10 0 17 3 6 0 0 12 0
                                                   21 2 6 0 0 0 24 3 6 0 0 12 7
                                                   26 2 6 7 0 7 29 1 6 0 7 30 1
                                                   32 6 0 33 1 6 34 0 35 1 32 6
                                                   0 36 1 6 10 0 40 2 10 0 0 0
                                                   43 2 6 0 44 0 45 0 6 0 47 0
                                                   7 0 48 2 6 0 7 10 49 0 51 0
                                                   52 1 6 7 0 53 2 51 0 7 10 54
                                                   1 6 0 0 55 1 6 51 0 56 2 51
                                                   0 0 0 57 1 51 8 0 59 0 6 0
                                                   60 1 51 7 0 61 1 51 10 0 62
                                                   1 51 0 0 63 1 6 0 51 64 2 6
                                                   0 0 0 65 2 6 67 0 0 68 2 6 0
                                                   0 0 71 2 76 73 74 75 77 2 0
                                                   78 79 80 81 1 76 82 75 83 1
                                                   0 84 80 85 1 76 82 75 86 1 0
                                                   84 80 87 1 7 88 0 89 1 90 7
                                                   0 91 1 90 94 0 95 2 98 0 6
                                                   97 99 1 7 84 80 100 2 103 98
                                                   101 102 104 1 0 88 0 105 0 7
                                                   0 106 1 108 107 0 109 2 6 7
                                                   0 10 110 0 7 0 115 0 0 0 116
                                                   1 7 117 0 118 1 0 117 0 119
                                                   1 6 7 0 120 2 0 0 0 12 121 2
                                                   6 0 0 0 122 2 6 117 0 0 123
                                                   2 6 8 0 0 124 2 0 125 0 0
                                                   126 2 10 8 0 0 127 2 7 0 10
                                                   0 128 3 0 0 0 129 0 130 2 6
                                                   0 7 0 131 3 6 0 0 129 0 132
                                                   1 6 0 0 135 1 137 6 0 138 2
                                                   6 139 0 139 140 1 137 6 0
                                                   141 2 137 0 0 0 142 2 0 139
                                                   139 139 143 2 7 0 0 10 144 2
                                                   6 0 0 0 145 2 6 0 0 0 146 2
                                                   0 0 0 0 147 2 0 148 0 0 149
                                                   2 6 117 0 0 150 2 137 0 6 6
                                                   151 2 0 152 139 0 153 1 6 8
                                                   0 154 2 6 148 0 0 155 2 6
                                                   117 0 7 156 2 0 117 0 0 157
                                                   0 137 0 158 1 137 0 6 159 2
                                                   137 0 0 107 160 2 137 0 0 0
                                                   161 2 137 0 0 0 162 2 137 0
                                                   0 10 163 2 0 139 0 139 164 2
                                                   0 10 0 0 165 1 166 98 6 167
                                                   1 0 88 0 168 1 166 6 6 169 1
                                                   0 0 0 170 1 75 8 0 171 1 75
                                                   0 0 172 1 75 6 0 173 1 75 0
                                                   0 174 2 75 0 0 0 175 2 75 0
                                                   6 0 176 2 0 80 80 80 177 1
                                                   178 82 75 179 1 0 84 80 180
                                                   2 7 0 0 0 181 2 0 7 139 7
                                                   182 1 0 10 0 183 1 7 0 0 184
                                                   2 7 0 0 0 185 2 0 67 0 0 186
                                                   2 6 8 0 0 187 0 75 0 188 1
                                                   189 0 107 190 1 189 0 0 191
                                                   2 6 0 189 0 192 1 0 0 0 193
                                                   2 0 108 0 10 111 1 0 14 0 15
                                                   1 0 0 51 66 2 0 10 0 14 18 1
                                                   0 84 80 180 1 0 0 0 170 1 0
                                                   88 0 168 2 0 78 79 80 81 2 0
                                                   0 0 10 70 2 0 0 0 10 72 2 0
                                                   125 0 0 126 1 0 113 0 114 1
                                                   0 7 0 112 2 0 0 0 0 147 2 0
                                                   148 0 0 149 2 0 10 0 0 165 1
                                                   0 117 0 119 3 0 0 0 12 10 46
                                                   2 0 19 0 14 42 2 0 10 0 12
                                                   41 1 0 51 0 58 1 0 34 0 39 2
                                                   0 67 0 10 69 1 0 0 0 193 0 0
                                                   0 116 2 0 80 80 80 177 1 0
                                                   84 80 87 1 0 84 80 85 1 0 88
                                                   0 105 3 0 0 0 14 22 23 3 0 0
                                                   0 12 0 25 3 0 0 0 12 7 31 3
                                                   0 0 0 14 27 28 2 0 0 0 37 38
                                                   1 0 10 0 183 2 0 139 0 139
                                                   164 2 0 7 139 7 182 2 0 139
                                                   139 139 143 2 0 67 0 0 186 3
                                                   0 0 0 129 0 130 2 0 0 0 129
                                                   133 1 0 0 0 134 2 0 0 0 12
                                                   136 2 0 10 0 12 16 2 0 19 0
                                                   14 20 2 0 0 0 12 121 2 0 152
                                                   139 0 153 2 0 117 0 0 157 1
                                                   0 0 12 50)))))
           '|lookupComplete|)) 
