
(/VERSIONCHECK 2) 

(PUT '|IPADIC;characteristic;Nni;1| '|SPADreplace| '(XLAM NIL 0)) 

(DEFUN |IPADIC;characteristic;Nni;1| ($) 0) 

(DEFUN |IPADIC;euclideanSize;$Nni;2| (|x| $) (SPADCALL |x| (QREFELT $ 15))) 

(PUT '|IPADIC;stream| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |IPADIC;stream| (|x| $) |x|) 

(PUT '|IPADIC;padic| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |IPADIC;padic| (|x| $) |x|) 

(DEFUN |IPADIC;digits;$S;5| (|x| $) (|IPADIC;stream| |x| $)) 

(DEFUN |IPADIC;extend;$I$;6| (|x| |n| $)
  (SPADCALL |x| (+ |n| 1) (QREFELT $ 20))) 

(DEFUN |IPADIC;complete;2$;7| (|x| $) (SPADCALL |x| (QREFELT $ 22))) 

(DEFUN |IPADIC;modP| (|n| $)
  (COND
   ((OR (QREFELT $ 7) (EQL (QREFELT $ 6) 2))
    (SPADCALL |n| (QREFELT $ 6) (QREFELT $ 24)))
   ('T (SPADCALL |n| (QREFELT $ 6) (QREFELT $ 25))))) 

(DEFUN |IPADIC;modPInfo| (|n| $)
  (PROG (|q| |r| |r0| |dv|)
    (RETURN
     (SEQ (LETT |dv| (DIVIDE2 |n| (QREFELT $ 6)) . #1=(|IPADIC;modPInfo|))
          (LETT |r0| (QCDR |dv|) . #1#) (LETT |q| (QCAR |dv|) . #1#)
          (COND
           ((SPADCALL (LETT |r| (|IPADIC;modP| |r0| $) . #1#) |r0|
                      (QREFELT $ 27))
            (LETT |q| (+ |q| (QUOTIENT2 (- |r0| |r|) (QREFELT $ 6))) . #1#)))
          (EXIT (CONS |r| |q|)))))) 

(DEFUN |IPADIC;invModP| (|n| $) (SPADCALL |n| (QREFELT $ 6) (QREFELT $ 28))) 

(DEFUN |IPADIC;modulus;I;11| ($) (QREFELT $ 6)) 

(DEFUN |IPADIC;moduloP;$I;12| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 30)) 0) ('T (SPADCALL |x| (QREFELT $ 31))))) 

(DEFUN |IPADIC;quotientByP;2$;13| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 30)) |x|) ('T (SPADCALL |x| (QREFELT $ 33))))) 

(DEFUN |IPADIC;approximate;$2I;14| (|x| |n| $)
  (COND ((OR (SPADCALL |n| 0 (QREFELT $ 36)) (SPADCALL |x| (QREFELT $ 30))) 0)
        ('T
         (+ (SPADCALL |x| (QREFELT $ 31))
            (* (QREFELT $ 6)
               (SPADCALL (SPADCALL |x| (QREFELT $ 33)) (- |n| 1)
                         (QREFELT $ 37))))))) 

(DEFUN |IPADIC;=;2$B;15| (|x| |y| $)
  (PROG (|st| #1=#:G200 |i| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |st| (|IPADIC;stream| (SPADCALL |x| |y| (QREFELT $ 38)) $)
              . #2=(|IPADIC;=;2$B;15|))
        (LETT |n| |$streamCount| . #2#)
        (SEQ (LETT |i| 0 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |st| (QREFELT $ 30))
                 (PROGN (LETT #1# 'T . #2#) (GO #1#)))
                ((SPADCALL (SPADCALL |st| (QREFELT $ 31)) 0 (QREFELT $ 27))
                 (PROGN (LETT #1# 'NIL . #2#) (GO #1#)))
                ('T (LETT |st| (SPADCALL |st| (QREFELT $ 39)) . #2#)))))
             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT (SPADCALL |st| (QREFELT $ 30)))))
      #1# (EXIT #1#))))) 

(DEFUN |IPADIC;order;$Nni;16| (|x| $)
  (PROG (|st| #1=#:G205 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |st| (|IPADIC;stream| |x| $) . #2=(|IPADIC;order;$Nni;16|))
            (SEQ (LETT |i| 0 . #2#) G190
                 (COND ((|greater_SI| |i| 1000) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |st| (QREFELT $ 30))
                     (PROGN (LETT #1# 0 . #2#) (GO #1#)))
                    ((SPADCALL (SPADCALL |st| (QREFELT $ 31)) 0 (QREFELT $ 27))
                     (PROGN (LETT #1# |i| . #2#) (GO #1#)))
                    ('T (LETT |st| (SPADCALL |st| (QREFELT $ 33)) . #2#)))))
                 (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (|error| "order: series has more than 1000 leading zero coefs"))))
      #1# (EXIT #1#))))) 

(DEFUN |IPADIC;Zero;$;17| ($)
  (|IPADIC;padic| (SPADCALL 0 (SPADCALL (QREFELT $ 41)) (QREFELT $ 42)) $)) 

(DEFUN |IPADIC;One;$;18| ($)
  (|IPADIC;padic| (SPADCALL 1 (SPADCALL (QREFELT $ 41)) (QREFELT $ 42)) $)) 

(DEFUN |IPADIC;intToPAdic| (|n| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|IPADIC;intToPAdic!0| (VECTOR $ |n|))
                (QREFELT $ 47)))))) 

(DEFUN |IPADIC;intToPAdic!0| ($$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|IPADIC;intToPAdic|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|modp|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL |n| (|spadConstant| $ 43) (QREFELT $ 44))
            (SPADCALL (QREFELT $ 41)))
           ('T
            (SEQ (LETT |modp| (|IPADIC;modPInfo| |n| $) NIL)
                 (EXIT
                  (SPADCALL (QCAR |modp|) (|IPADIC;intToPAdic| (QCDR |modp|) $)
                            (QREFELT $ 42))))))))))))) 

(DEFUN |IPADIC;intPlusPAdic| (|n| |x| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|IPADIC;intPlusPAdic!0| (VECTOR |n| $ |x|))
                (QREFELT $ 47)))))) 

(DEFUN |IPADIC;intPlusPAdic!0| ($$)
  (PROG (|x| $ |n|)
    (LETT |x| (QREFELT $$ 2) . #1=(|IPADIC;intPlusPAdic|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |n| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|modp|)
        (RETURN
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 30)) (|IPADIC;intToPAdic| |n| $))
                ('T
                 (SEQ
                  (LETT |modp|
                        (|IPADIC;modPInfo|
                         (SPADCALL |n| (SPADCALL |x| (QREFELT $ 31))
                                   (QREFELT $ 48))
                         $)
                        NIL)
                  (EXIT
                   (SPADCALL (QCAR |modp|)
                             (|IPADIC;intPlusPAdic| (QCDR |modp|)
                              (SPADCALL |x| (QREFELT $ 39)) $)
                             (QREFELT $ 42))))))))))))) 

(DEFUN |IPADIC;intMinusPAdic| (|n| |x| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|IPADIC;intMinusPAdic!0| (VECTOR |n| $ |x|))
                (QREFELT $ 47)))))) 

(DEFUN |IPADIC;intMinusPAdic!0| ($$)
  (PROG (|x| $ |n|)
    (LETT |x| (QREFELT $$ 2) . #1=(|IPADIC;intMinusPAdic|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |n| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|modp|)
        (RETURN
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 30)) (|IPADIC;intToPAdic| |n| $))
                ('T
                 (SEQ
                  (LETT |modp|
                        (|IPADIC;modPInfo|
                         (SPADCALL |n| (SPADCALL |x| (QREFELT $ 31))
                                   (QREFELT $ 50))
                         $)
                        NIL)
                  (EXIT
                   (SPADCALL (QCAR |modp|)
                             (|IPADIC;intMinusPAdic| (QCDR |modp|)
                              (SPADCALL |x| (QREFELT $ 39)) $)
                             (QREFELT $ 42))))))))))))) 

(DEFUN |IPADIC;plusAux| (|n| |x| |y| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|IPADIC;plusAux!0| (VECTOR |n| |y| $ |x|))
                (QREFELT $ 47)))))) 

(DEFUN |IPADIC;plusAux!0| ($$)
  (PROG (|x| $ |y| |n|)
    (LETT |x| (QREFELT $$ 3) . #1=(|IPADIC;plusAux|))
    (LETT $ (QREFELT $$ 2) . #1#)
    (LETT |y| (QREFELT $$ 1) . #1#)
    (LETT |n| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|modp|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 30))
            (COND
             ((SPADCALL |y| (QREFELT $ 30))
              (EXIT (|IPADIC;intToPAdic| |n| $))))))
          (EXIT
           (COND
            ((SPADCALL |x| (QREFELT $ 30)) (|IPADIC;intPlusPAdic| |n| |y| $))
            ((SPADCALL |y| (QREFELT $ 30)) (|IPADIC;intPlusPAdic| |n| |x| $))
            ('T
             (SEQ
              (LETT |modp|
                    (|IPADIC;modPInfo|
                     (SPADCALL
                      (SPADCALL |n| (SPADCALL |x| (QREFELT $ 31))
                                (QREFELT $ 48))
                      (SPADCALL |y| (QREFELT $ 31)) (QREFELT $ 48))
                     $)
                    NIL)
              (EXIT
               (SPADCALL (QCAR |modp|)
                         (|IPADIC;plusAux| (QCDR |modp|)
                          (SPADCALL |x| (QREFELT $ 39))
                          (SPADCALL |y| (QREFELT $ 39)) $)
                         (QREFELT $ 42)))))))))))))) 

(DEFUN |IPADIC;minusAux| (|n| |x| |y| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|IPADIC;minusAux!0| (VECTOR |n| |y| $ |x|))
                (QREFELT $ 47)))))) 

(DEFUN |IPADIC;minusAux!0| ($$)
  (PROG (|x| $ |y| |n|)
    (LETT |x| (QREFELT $$ 3) . #1=(|IPADIC;minusAux|))
    (LETT $ (QREFELT $$ 2) . #1#)
    (LETT |y| (QREFELT $$ 1) . #1#)
    (LETT |n| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|modp|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 30))
            (COND
             ((SPADCALL |y| (QREFELT $ 30))
              (EXIT (|IPADIC;intToPAdic| |n| $))))))
          (EXIT
           (COND
            ((SPADCALL |x| (QREFELT $ 30)) (|IPADIC;intMinusPAdic| |n| |y| $))
            ((SPADCALL |y| (QREFELT $ 30)) (|IPADIC;intPlusPAdic| |n| |x| $))
            ('T
             (SEQ
              (LETT |modp|
                    (|IPADIC;modPInfo|
                     (SPADCALL
                      (SPADCALL |n| (SPADCALL |x| (QREFELT $ 31))
                                (QREFELT $ 48))
                      (SPADCALL |y| (QREFELT $ 31)) (QREFELT $ 50))
                     $)
                    NIL)
              (EXIT
               (SPADCALL (QCAR |modp|)
                         (|IPADIC;minusAux| (QCDR |modp|)
                          (SPADCALL |x| (QREFELT $ 39))
                          (SPADCALL |y| (QREFELT $ 39)) $)
                         (QREFELT $ 42)))))))))))))) 

(DEFUN |IPADIC;+;3$;24| (|x| |y| $)
  (|IPADIC;padic|
   (|IPADIC;plusAux| 0 (|IPADIC;stream| |x| $) (|IPADIC;stream| |y| $) $) $)) 

(DEFUN |IPADIC;-;3$;25| (|x| |y| $)
  (|IPADIC;padic|
   (|IPADIC;minusAux| 0 (|IPADIC;stream| |x| $) (|IPADIC;stream| |y| $) $) $)) 

(DEFUN |IPADIC;-;2$;26| (|y| $)
  (|IPADIC;padic| (|IPADIC;intMinusPAdic| 0 (|IPADIC;stream| |y| $) $) $)) 

(DEFUN |IPADIC;coerce;I$;27| (|n| $)
  (|IPADIC;padic| (|IPADIC;intToPAdic| |n| $) $)) 

(DEFUN |IPADIC;intMult| (|n| |x| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|IPADIC;intMult!0| (VECTOR |n| $ |x|))
                (QREFELT $ 47)))))) 

(DEFUN |IPADIC;intMult!0| ($$)
  (PROG (|x| $ |n|)
    (LETT |x| (QREFELT $$ 2) . #1=(|IPADIC;intMult|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |n| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|modp|)
        (RETURN
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 30)) (SPADCALL (QREFELT $ 41)))
                ('T
                 (SEQ
                  (LETT |modp|
                        (|IPADIC;modPInfo|
                         (SPADCALL |n| (SPADCALL |x| (QREFELT $ 31))
                                   (QREFELT $ 54))
                         $)
                        NIL)
                  (EXIT
                   (SPADCALL (QCAR |modp|)
                             (|IPADIC;intPlusPAdic| (QCDR |modp|)
                              (|IPADIC;intMult| |n|
                               (SPADCALL |x| (QREFELT $ 39)) $)
                              $)
                             (QREFELT $ 42))))))))))))) 

(DEFUN |IPADIC;*;I2$;29| (|n| |x| $)
  (|IPADIC;padic| (|IPADIC;intMult| |n| (|IPADIC;stream| |x| $) $) $)) 

(DEFUN |IPADIC;timesAux| (|x| |y| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|IPADIC;timesAux!0| (VECTOR |y| $ |x|))
                (QREFELT $ 47)))))) 

(DEFUN |IPADIC;timesAux!0| ($$)
  (PROG (|x| $ |y|)
    (LETT |x| (QREFELT $$ 2) . #1=(|IPADIC;timesAux|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |y| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|modp| |car| |cdr|)
        (RETURN
         (SEQ
          (COND
           ((OR (SPADCALL |x| (QREFELT $ 30)) (SPADCALL |y| (QREFELT $ 30)))
            (SPADCALL (QREFELT $ 41)))
           ('T
            (SEQ
             (LETT |modp|
                   (|IPADIC;modPInfo|
                    (SPADCALL (SPADCALL |x| (QREFELT $ 31))
                              (SPADCALL |y| (QREFELT $ 31)) (QREFELT $ 54))
                    $)
                   NIL)
             (LETT |car| (QCAR |modp|) NIL)
             (LETT |cdr|
                   (|IPADIC;plusAux| (QCDR |modp|)
                    (|IPADIC;intMult| (SPADCALL |x| (QREFELT $ 31))
                     (SPADCALL |y| (QREFELT $ 39)) $)
                    (|IPADIC;timesAux| (SPADCALL |x| (QREFELT $ 39)) |y| $) $)
                   NIL)
             (EXIT (SPADCALL |car| |cdr| (QREFELT $ 42))))))))))))) 

(DEFUN |IPADIC;*;3$;31| (|x| |y| $)
  (|IPADIC;padic|
   (|IPADIC;timesAux| (|IPADIC;stream| |x| $) (|IPADIC;stream| |y| $) $) $)) 

(DEFUN |IPADIC;quotientAux| (|x| |y| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|IPADIC;quotientAux!0| (VECTOR |y| $ |x|))
                (QREFELT $ 47)))))) 

(DEFUN |IPADIC;quotientAux!0| ($$)
  (PROG (|x| $ |y|)
    (LETT |x| (QREFELT $$ 2) . #1=(|IPADIC;quotientAux|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |y| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|z0| |yy|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 30))
            (|error| "quotientAux: first argument"))
           ((SPADCALL |y| (QREFELT $ 30)) (SPADCALL (QREFELT $ 41)))
           ((SPADCALL (|IPADIC;modP| (SPADCALL |x| (QREFELT $ 31)) $)
                      (|spadConstant| $ 43) (QREFELT $ 44))
            (COND
             ((SPADCALL (|IPADIC;modP| (SPADCALL |y| (QREFELT $ 31)) $)
                        (|spadConstant| $ 43) (QREFELT $ 44))
              (|IPADIC;quotientAux| (SPADCALL |x| (QREFELT $ 39))
               (SPADCALL |y| (QREFELT $ 39)) $))
             ('T (|error| "quotient: quotient not integral"))))
           ('T
            (SEQ
             (LETT |z0|
                   (|IPADIC;modP|
                    (SPADCALL
                     (|IPADIC;invModP| (SPADCALL |x| (QREFELT $ 31)) $)
                     (SPADCALL |y| (QREFELT $ 31)) (QREFELT $ 54))
                    $)
                   NIL)
             (LETT |yy|
                   (SPADCALL
                    (|IPADIC;minusAux| (|spadConstant| $ 43) |y|
                     (|IPADIC;intMult| |z0| |x| $) $)
                    (QREFELT $ 57))
                   NIL)
             (EXIT
              (SPADCALL |z0| (|IPADIC;quotientAux| |x| |yy| $)
                        (QREFELT $ 42))))))))))))) 

(DEFUN |IPADIC;recip;$U;33| (|x| $)
  (COND
   ((OR (SPADCALL |x| (QREFELT $ 30))
        (EQL (|IPADIC;modP| (SPADCALL |x| (QREFELT $ 31)) $) 0))
    (CONS 1 "failed"))
   ('T
    (CONS 0
          (|IPADIC;padic|
           (|IPADIC;quotientAux| (|IPADIC;stream| |x| $)
            (SPADCALL 1 (SPADCALL (QREFELT $ 41)) (QREFELT $ 42)) $)
           $))))) 

(DEFUN |IPADIC;iExquo| (|xx| |yy| |n| $)
  (PROG (|rec|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |n| 1000 (QREFELT $ 60))
        (|error| "exquo: quotient by series with many leading zero coefs"))
       ((SPADCALL |yy| (QREFELT $ 30)) (CONS 1 "failed"))
       ((SPADCALL |xx| (QREFELT $ 30)) (CONS 0 (|spadConstant| $ 35)))
       ((ZEROP (SPADCALL |yy| (QREFELT $ 31)))
        (COND
         ((ZEROP (SPADCALL |xx| (QREFELT $ 31)))
          (|IPADIC;iExquo| (SPADCALL |xx| (QREFELT $ 33))
           (SPADCALL |yy| (QREFELT $ 33)) (+ |n| 1) $))
         (#1='T (CONS 1 "failed"))))
       (#1#
        (SEQ (LETT |rec| (SPADCALL |yy| (QREFELT $ 59)) |IPADIC;iExquo|)
             (EXIT
              (COND ((QEQCAR |rec| 1) (CONS 1 "failed"))
                    (#1#
                     (CONS 0
                           (SPADCALL |xx| (QCDR |rec|)
                                     (QREFELT $ 56))))))))))))) 

(DEFUN |IPADIC;exquo;2$U;35| (|x| |y| $)
  (|IPADIC;iExquo| (|IPADIC;stream| |x| $) (|IPADIC;stream| |y| $) 0 $)) 

(DEFUN |IPADIC;divide;2$R;36| (|x| |y| $)
  (PROG (|z|)
    (RETURN
     (SEQ (LETT |z| (SPADCALL |x| |y| (QREFELT $ 61)) |IPADIC;divide;2$R;36|)
          (EXIT
           (COND ((QEQCAR |z| 1) (CONS (|spadConstant| $ 35) |x|))
                 ('T (CONS (QCDR |z|) (|spadConstant| $ 35))))))))) 

(DEFUN |IPADIC;iSqrt| (|pn| |an| |bn| |bSt| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|IPADIC;iSqrt!0| (VECTOR (QREFELT $ 6) |an| |pn| |bn| $ |bSt|))
       (QREFELT $ 67)))))) 

(DEFUN |IPADIC;iSqrt!0| ($$)
  (PROG (|bSt| $ |bn| |pn| |an| |p|)
    (LETT |bSt| (QREFELT $$ 5) . #1=(|IPADIC;iSqrt|))
    (LETT $ (QREFELT $$ 4) . #1#)
    (LETT |bn| (QREFELT $$ 3) . #1#)
    (LETT |pn| (QREFELT $$ 2) . #1#)
    (LETT |an| (QREFELT $$ 1) . #1#)
    (LETT |p| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|bn1| |c| |aa| |nSt|)
        (RETURN
         (SEQ
          (LETT |bn1|
                (COND ((SPADCALL |bSt| (QREFELT $ 30)) |bn|)
                      ('T
                       (SPADCALL |bn|
                                 (SPADCALL |pn| (SPADCALL |bSt| (QREFELT $ 31))
                                           (QREFELT $ 54))
                                 (QREFELT $ 48))))
                NIL)
          (LETT |c|
                (SPADCALL
                 (SPADCALL |bn1| (SPADCALL |an| |an| (QREFELT $ 54))
                           (QREFELT $ 50))
                 |pn| (QREFELT $ 64))
                NIL)
          (LETT |aa|
                (|IPADIC;modP|
                 (SPADCALL |c|
                           (SPADCALL (SPADCALL 2 |an| (QREFELT $ 66)) |p|
                                     (QREFELT $ 28))
                           (QREFELT $ 54))
                 $)
                NIL)
          (LETT |nSt|
                (COND ((SPADCALL |bSt| (QREFELT $ 30)) |bSt|)
                      ('T (SPADCALL |bSt| (QREFELT $ 33))))
                NIL)
          (EXIT
           (SPADCALL |aa|
                     (|IPADIC;iSqrt| (SPADCALL |pn| |p| (QREFELT $ 54))
                      (SPADCALL |an| (SPADCALL |pn| |aa| (QREFELT $ 54))
                                (QREFELT $ 48))
                      |bn1| |nSt| $)
                     (QREFELT $ 49)))))))))) 

(DEFUN |IPADIC;sqrt;$I$;38| (|b| |a| $)
  (PROG (|bb|)
    (RETURN
     (SEQ
      (COND ((EQL (QREFELT $ 6) 2) (|error| "sqrt: no square roots in Z2 yet"))
            ((NULL
              (ZEROP
               (|IPADIC;modP|
                (- (* |a| |a|)
                   (LETT |bb| (SPADCALL |b| (QREFELT $ 32))
                         . #1=(|IPADIC;sqrt;$I$;38|)))
                $)))
             (|error| "sqrt: not a square root (mod p)"))
            ('T
             (SEQ
              (LETT |b|
                    (COND ((SPADCALL |b| (QREFELT $ 30)) |b|)
                          ('T (SPADCALL |b| (QREFELT $ 33))))
                    . #1#)
              (LETT |a| (|IPADIC;modP| |a| $) . #1#)
              (EXIT
               (SPADCALL |a| (|IPADIC;iSqrt| (QREFELT $ 6) |a| |bb| |b| $)
                         (QREFELT $ 49)))))))))) 

(DEFUN |IPADIC;iRoot| (|f| |alpha| |invFpx0| |pPow| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|IPADIC;iRoot!0|
             (VECTOR (QREFELT $ 6) |invFpx0| |pPow| $ |alpha| |f|))
       (QREFELT $ 47)))))) 

(DEFUN |IPADIC;iRoot!0| ($$)
  (PROG (|f| |alpha| $ |pPow| |invFpx0| |p|)
    (LETT |f| (QREFELT $$ 5) . #1=(|IPADIC;iRoot|))
    (LETT |alpha| (QREFELT $$ 4) . #1#)
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |pPow| (QREFELT $$ 2) . #1#)
    (LETT |invFpx0| (QREFELT $$ 1) . #1#)
    (LETT |p| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G392 |num| |digit|)
        (RETURN
         (SEQ
          (LETT |num|
                (SPADCALL
                 (PROG2
                     (LETT #2#
                           (SPADCALL (SPADCALL |f| |alpha| (QREFELT $ 70))
                                     |pPow| (QREFELT $ 71))
                           NIL)
                     (QCDR #2#)
                   (|check_union| (QEQCAR #2# 0) (|Integer|) #2#))
                 (QREFELT $ 72))
                NIL)
          (LETT |digit|
                (|IPADIC;modP| (SPADCALL |num| |invFpx0| (QREFELT $ 54)) $)
                NIL)
          (EXIT
           (SPADCALL |digit|
                     (|IPADIC;iRoot| |f|
                      (SPADCALL |alpha|
                                (SPADCALL |digit| |pPow| (QREFELT $ 54))
                                (QREFELT $ 48))
                      |invFpx0| (SPADCALL |p| |pPow| (QREFELT $ 54)) $)
                     (QREFELT $ 42)))))))))) 

(DEFUN |IPADIC;root;SupI$;40| (|f| |x0| $)
  (PROG (|invFpx0| |fpx0|)
    (RETURN
     (SEQ (LETT |x0| (|IPADIC;modP| |x0| $) . #1=(|IPADIC;root;SupI$;40|))
          (COND
           ((NULL (ZEROP (|IPADIC;modP| (SPADCALL |f| |x0| (QREFELT $ 70)) $)))
            (EXIT (|error| "root: not a root (mod p)"))))
          (LETT |fpx0|
                (|IPADIC;modP|
                 (SPADCALL (SPADCALL |f| (QREFELT $ 73)) |x0| (QREFELT $ 70))
                 $)
                . #1#)
          (EXIT
           (COND
            ((ZEROP |fpx0|)
             (|error| "root: approximate root must be a simple root (mod p)"))
            ('T
             (SEQ
              (LETT |invFpx0| (|IPADIC;modP| (|IPADIC;invModP| |fpx0| $) $)
                    . #1#)
              (EXIT
               (|IPADIC;padic|
                (SPADCALL |x0|
                          (|IPADIC;iRoot| |f| |x0| |invFpx0| (QREFELT $ 6) $)
                          (QREFELT $ 42))
                $)))))))))) 

(DEFUN |IPADIC;termOutput| (|k| |c| $)
  (PROG (|mon|)
    (RETURN
     (SEQ
      (COND ((EQL |k| 0) (SPADCALL |c| (QREFELT $ 10)))
            (#1='T
             (SEQ
              (LETT |mon|
                    (COND ((EQL |k| 1) (QREFELT $ 11))
                          (#1#
                           (SPADCALL (QREFELT $ 11)
                                     (SPADCALL |k| (QREFELT $ 10))
                                     (QREFELT $ 75))))
                    |IPADIC;termOutput|)
              (EXIT
               (COND ((EQL |c| 1) |mon|)
                     ((EQL |c| -1) (SPADCALL |mon| (QREFELT $ 76)))
                     (#1#
                      (SPADCALL (SPADCALL |c| (QREFELT $ 10)) |mon|
                                (QREFELT $ 77)))))))))))) 

(PUT '|IPADIC;showAll?| '|SPADreplace| '(XLAM NIL 'T)) 

(DEFUN |IPADIC;showAll?| ($) 'T) 

(DEFUN |IPADIC;coerce;$Of;43| (|x| $)
  (PROG (|l| |st| |n| |count|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |st| (|IPADIC;stream| |x| $) . #1=(|IPADIC;coerce;$Of;43|))
         (QREFELT $ 30))
        (SPADCALL 0 (QREFELT $ 10)))
       (#2='T
        (SEQ (LETT |count| |$streamCount| . #1#) (LETT |l| NIL . #1#)
             (SEQ (LETT |n| 0 . #1#) G190
                  (COND
                   ((OR (|greater_SI| |n| |count|)
                        (NULL
                         (COND ((SPADCALL |st| (QREFELT $ 30)) 'NIL) ('T 'T))))
                    (GO G191)))
                  (SEQ
                   (COND
                    ((SPADCALL (SPADCALL |st| (QREFELT $ 31)) 0 (QREFELT $ 27))
                     (LETT |l|
                           (CONS
                            (|IPADIC;termOutput| |n|
                             (SPADCALL |st| (QREFELT $ 31)) $)
                            |l|)
                           . #1#)))
                   (EXIT (LETT |st| (SPADCALL |st| (QREFELT $ 33)) . #1#)))
                  (LETT |n| (|inc_SI| |n|) . #1#) (GO G190) G191 (EXIT NIL))
             (COND
              ((|IPADIC;showAll?| $)
               (SEQ (LETT |n| (+ |count| 1) . #1#) G190
                    (COND
                     ((NULL
                       (COND
                        ((SPADCALL |st| (QREFELT $ 78))
                         (COND
                          ((SPADCALL |st| (SPADCALL |st| (QREFELT $ 33))
                                     (QREFELT $ 79))
                           'NIL)
                          ('T 'T)))
                        ('T 'NIL)))
                      (GO G191)))
                    (SEQ
                     (COND
                      ((SPADCALL (SPADCALL |st| (QREFELT $ 31)) 0
                                 (QREFELT $ 27))
                       (LETT |l|
                             (CONS
                              (|IPADIC;termOutput| |n|
                               (SPADCALL |st| (QREFELT $ 31)) $)
                              |l|)
                             . #1#)))
                     (EXIT (LETT |st| (SPADCALL |st| (QREFELT $ 33)) . #1#)))
                    (LETT |n| (+ |n| 1) . #1#) (GO G190) G191 (EXIT NIL))))
             (LETT |l|
                   (COND ((SPADCALL |st| (QREFELT $ 80)) |l|)
                         (#2#
                          (SEQ
                           (COND
                            ((SPADCALL |st| (SPADCALL |st| (QREFELT $ 33))
                                       (QREFELT $ 79))
                             (COND
                              ((EQL (SPADCALL |st| (QREFELT $ 31)) 0)
                               (EXIT |l|)))))
                           (EXIT
                            (CONS
                             (SPADCALL "O"
                                       (LIST
                                        (SPADCALL (QREFELT $ 11)
                                                  (SPADCALL |n| (QREFELT $ 81))
                                                  (QREFELT $ 75)))
                                       (QREFELT $ 83))
                             |l|)))))
                   . #1#)
             (EXIT
              (COND ((NULL |l|) (SPADCALL 0 (QREFELT $ 81)))
                    (#2#
                     (SPADCALL (ELT $ 84) (NREVERSE |l|)
                               (QREFELT $ 87)))))))))))) 

(DEFUN |InnerPAdicInteger| (&REST #1=#:G438)
  (PROG ()
    (RETURN
     (PROG (#2=#:G439)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|InnerPAdicInteger|)
                                           '|domainEqualList|)
                . #3=(|InnerPAdicInteger|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |InnerPAdicInteger;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|InnerPAdicInteger|))))))))))) 

(DEFUN |InnerPAdicInteger;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerPAdicInteger|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|InnerPAdicInteger| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 99) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|InnerPAdicInteger| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 11 (SPADCALL |#1| (QREFELT $ 10)))
      (QSETREFV $ 12 (|Stream| (|Integer|)))
      $)))) 

(MAKEPROP '|InnerPAdicInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|OutputForm|) (|Integer|) (0 . |coerce|) 'PEXPR '|Rep|
              (|NonNegativeInteger|) |IPADIC;characteristic;Nni;1|
              |IPADIC;order;$Nni;16| |IPADIC;euclideanSize;$Nni;2| (|Stream| 9)
              |IPADIC;digits;$S;5|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |IPADIC;One;$;18|) $))
              (5 . |extend|) |IPADIC;extend;$I$;6| (11 . |complete|)
              |IPADIC;complete;2$;7| (16 . |positiveRemainder|)
              (22 . |symmetricRemainder|) (|Boolean|) (28 . ~=) (34 . |invmod|)
              |IPADIC;modulus;I;11| (40 . |empty?|) (45 . |frst|)
              |IPADIC;moduloP;$I;12| (50 . |rst|) |IPADIC;quotientByP;2$;13|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |IPADIC;Zero;$;17|) $))
              (55 . <=) |IPADIC;approximate;$2I;14| |IPADIC;-;3$;25|
              (61 . |rst|) |IPADIC;=;2$B;15| (66 . |empty|) (70 . |concat|)
              (76 . |Zero|) (80 . =) (86 . |empty|) (|Mapping| $)
              (90 . |delay|) (95 . +) (101 . |concat|) (107 . -)
              |IPADIC;+;3$;24| |IPADIC;-;2$;26| |IPADIC;coerce;I$;27| (113 . *)
              |IPADIC;*;I2$;29| |IPADIC;*;3$;31| (119 . |rest|)
              (|Union| $ '"failed") |IPADIC;recip;$U;33| (124 . >)
              |IPADIC;exquo;2$U;35|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |IPADIC;divide;2$R;36| (130 . |quo|) (|PositiveInteger|)
              (136 . *) (142 . |delay|) |IPADIC;sqrt;$I$;38|
              (|SparseUnivariatePolynomial| 9) (147 . |elt|) (153 . |exquo|)
              (159 . -) (164 . |differentiate|) |IPADIC;root;SupI$;40|
              (169 . ^) (175 . -) (180 . *) (186 . |explicitEntries?|)
              (191 . |eq?|) (197 . |explicitlyEmpty?|) (202 . |coerce|)
              (|List| $) (207 . |prefix|) (213 . +) (|Mapping| 8 8 8)
              (|List| 8) (219 . |reduce|) |IPADIC;coerce;$Of;43|
              (|Union| 82 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 91 '#1#)
              (|Record| (|:| |coef| 82) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|))
           '#(~= 225 |zero?| 231 |unitNormal| 236 |unitCanonical| 241 |unit?|
              246 |subtractIfCan| 251 |sqrt| 257 |sizeLess?| 263 |sample| 269
              |root| 273 |rem| 279 |recip| 285 |quotientByP| 290 |quo| 295
              |principalIdeal| 301 |order| 306 |one?| 311 |multiEuclidean| 316
              |modulus| 322 |moduloP| 326 |lcmCoef| 331 |lcm| 337 |latex| 348
              |hash| 353 |gcdPolynomial| 358 |gcd| 364 |extendedEuclidean| 375
              |extend| 388 |exquo| 394 |expressIdealMember| 400 |euclideanSize|
              406 |divide| 411 |digits| 417 |complete| 422 |coerce| 427
              |characteristic| 442 |associates?| 446 |approximate| 452 ^ 458
              |Zero| 470 |One| 474 = 478 - 484 + 495 * 501)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0))
            (CONS
             '#(NIL |EuclideanDomain&| NIL |GcdDomain&| NIL NIL |Algebra&| NIL
                NIL |EntireRing&| |Module&| NIL |Ring&| NIL NIL NIL
                |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| |SetCategory&| NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|PAdicIntegerCategory| 6) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|Algebra| $$) (|CommutativeRing|)
                 (|CharacteristicZero|) (|EntireRing|) (|Module| $$)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 8))
              (|makeByteWordVec2| 98
                                  '(1 9 8 0 10 2 12 0 0 9 20 1 12 0 0 22 2 9 0
                                    0 0 24 2 9 0 0 0 25 2 9 26 0 0 27 2 9 0 0 0
                                    28 1 12 26 0 30 1 12 9 0 31 1 12 0 0 33 2 9
                                    26 0 0 36 1 17 0 0 39 0 17 0 41 2 17 0 9 0
                                    42 0 9 0 43 2 9 26 0 0 44 0 8 0 45 1 17 0
                                    46 47 2 9 0 0 0 48 2 12 0 9 0 49 2 9 0 0 0
                                    50 2 9 0 9 0 54 1 17 0 0 57 2 9 26 0 0 60 2
                                    9 0 0 0 64 2 9 0 65 0 66 1 12 0 46 67 2 69
                                    9 0 9 70 2 9 58 0 0 71 1 9 0 0 72 1 69 0 0
                                    73 2 8 0 0 0 75 1 8 0 0 76 2 8 0 0 0 77 1
                                    12 26 0 78 2 12 26 0 0 79 1 12 26 0 80 1 13
                                    8 0 81 2 8 0 0 82 83 2 8 0 0 0 84 2 86 8 85
                                    0 87 2 0 26 0 0 1 1 0 26 0 1 1 0 96 0 1 1 0
                                    0 0 1 1 0 26 0 1 2 0 58 0 0 1 2 0 0 0 9 68
                                    2 0 26 0 0 1 0 0 0 1 2 0 0 69 9 74 2 0 0 0
                                    0 1 1 0 58 0 59 1 0 0 0 34 2 0 0 0 0 1 1 0
                                    93 82 1 1 0 13 0 15 1 0 26 0 1 2 0 89 82 0
                                    1 0 0 9 29 1 0 9 0 32 2 0 95 0 0 1 2 0 0 0
                                    0 1 1 0 0 82 1 1 0 97 0 1 1 0 98 0 1 2 0 94
                                    94 94 1 2 0 0 0 0 1 1 0 0 82 1 2 0 90 0 0 1
                                    3 0 92 0 0 0 1 2 0 0 0 9 21 2 0 58 0 0 61 2
                                    0 89 82 0 1 1 0 13 0 16 2 0 62 0 0 63 1 0
                                    17 0 18 1 0 0 0 23 1 0 0 0 1 1 0 0 9 53 1 0
                                    8 0 88 0 0 13 14 2 0 26 0 0 1 2 0 9 0 9 37
                                    2 0 0 0 13 1 2 0 0 0 65 1 0 0 0 35 0 0 0 19
                                    2 0 26 0 0 40 2 0 0 0 0 38 1 0 0 0 52 2 0 0
                                    0 0 51 2 0 0 9 0 55 2 0 0 0 0 56 2 0 0 13 0
                                    1 2 0 0 65 0 1)))))
           '|lookupComplete|)) 
