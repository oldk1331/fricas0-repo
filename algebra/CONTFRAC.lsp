
(DEFUN |CONTFRAC;reducedForm;2$;1| (|c| $)
  (COND ((QCDR |c|) |c|)
        ((SPADCALL (QCDR (QCAR |c|)) (QREFELT $ 11))
         (SPADCALL
          (SPADCALL (SPADCALL (SPADCALL |c| (QREFELT $ 13)) (QREFELT $ 14))
                    (QREFELT $ 16))
          (QREFELT $ 17)))
        ((COND
          ((COND
            ((|HasCategory| (QREFELT $ 6) '(|OrderedRing|))
             (|HasCategory| (QREFELT $ 6) '(|multiplicativeValuation|)))
            (#1='T 'NIL))
           'T)
          (#1# (|HasCategory| (QREFELT $ 6) '(|additiveValuation|))))
         (|CONTFRAC;genFromSequence| (SPADCALL |c| (QREFELT $ 18)) $))
        (#1#
         (|error| "Reduced form not defined for this continued fraction.")))) 

(DEFUN |CONTFRAC;eucWhole| (|a| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 20)) (SPADCALL |a| (QREFELT $ 21))
            (QREFELT $ 22))) 

(DEFUN |CONTFRAC;eucWhole0| (|a| $)
  (PROG (|q| |r| |d| |n|)
    (RETURN
     (SEQ
      (COND
       ((COND
         ((|HasCategory| (QREFELT $ 6) '(|OrderedRing|))
          (|HasCategory| (QREFELT $ 6) '(|multiplicativeValuation|)))
         (#1='T 'NIL))
        (SEQ
         (LETT |n| (SPADCALL |a| (QREFELT $ 20)) . #2=(|CONTFRAC;eucWhole0|))
         (LETT |d| (SPADCALL |a| (QREFELT $ 21)) . #2#)
         (LETT |q| (SPADCALL |n| |d| (QREFELT $ 22)) . #2#)
         (LETT |r|
               (SPADCALL |n| (SPADCALL |q| |d| (QREFELT $ 23)) (QREFELT $ 24))
               . #2#)
         (COND
          ((SPADCALL |r| (|spadConstant| $ 26) (QREFELT $ 27))
           (LETT |q| (SPADCALL |q| (|spadConstant| $ 29) (QREFELT $ 24))
                 . #2#)))
         (EXIT |q|)))
       (#1# (|CONTFRAC;eucWhole| |a| $))))))) 

(DEFUN |CONTFRAC;=;2$B;4| (|x| |y| $)
  (PROG (|yl| |xl| #1=#:G149)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 19)) . #2=(|CONTFRAC;=;2$B;4|))
            (LETT |y| (SPADCALL |y| (QREFELT $ 19)) . #2#)
            (EXIT
             (COND
              ((SPADCALL (QCAR (QCAR |x|)) (QCAR (QCAR |y|)) (QREFELT $ 30))
               'NIL)
              (#3='T
               (SEQ (LETT |xl| (QCDR (QCAR |x|)) . #2#)
                    (LETT |yl| (QCDR (QCAR |y|)) . #2#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((OR (SPADCALL |xl| (QREFELT $ 31))
                                  (SPADCALL |yl| (QREFELT $ 31)))
                              'NIL)
                             ('T 'T)))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QCDR (SPADCALL |xl| (QREFELT $ 32)))
                                       (QCDR (SPADCALL |yl| (QREFELT $ 32)))
                                       (QREFELT $ 30))
                             (PROGN (LETT #1# 'NIL . #2#) (GO #1#)))
                            ('T
                             (SEQ
                              (LETT |xl| (SPADCALL |xl| (QREFELT $ 33)) . #2#)
                              (EXIT
                               (LETT |yl| (SPADCALL |yl| (QREFELT $ 33))
                                     . #2#)))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((SPADCALL |xl| (QREFELT $ 31))
                       (SPADCALL |yl| (QREFELT $ 31)))
                      (#3# 'NIL)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |CONTFRAC;continuedFraction;F$;5| (|q| $) (SPADCALL |q| (QREFELT $ 35))) 

(DEFUN |CONTFRAC;continuedFraction;R2S$;6| (|wh| |nums| |dens| $)
  (CONS (CONS |wh| (|CONTFRAC;genFractionA| |nums| |dens| $)) 'NIL)) 

(DEFUN |CONTFRAC;genFractionA| (|nums| |dens| $)
  (PROG (|d| |n|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |nums| (QREFELT $ 38)) (SPADCALL |dens| (QREFELT $ 38)))
        (SPADCALL (QREFELT $ 39)))
       ('T
        (SEQ
         (LETT |n| (SPADCALL |nums| (QREFELT $ 40))
               . #1=(|CONTFRAC;genFractionA|))
         (LETT |d| (SPADCALL |dens| (QREFELT $ 40)) . #1#)
         (EXIT
          (COND
           ((SPADCALL |n| (|spadConstant| $ 26) (QREFELT $ 27))
            (|error| "Numerators must be greater than 0."))
           ((SPADCALL |d| (|spadConstant| $ 26) (QREFELT $ 27))
            (|error| "Denominators must be greater than 0."))
           ('T
            (SPADCALL (CONS |n| |d|)
                      (SPADCALL
                       (CONS #'|CONTFRAC;genFractionA!0|
                             (VECTOR |dens| $ |nums|))
                       (QREFELT $ 43))
                      (QREFELT $ 44)))))))))))) 

(DEFUN |CONTFRAC;genFractionA!0| ($$)
  (PROG (|nums| $ |dens|)
    (LETT |nums| (QREFELT $$ 2) . #1=(|CONTFRAC;genFractionA|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |dens| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|CONTFRAC;genFractionA| (SPADCALL |nums| (QREFELT $ 41))
       (SPADCALL |dens| (QREFELT $ 41)) $))))) 

(DEFUN |CONTFRAC;continuedFraction;R2S$;8| (|wh| |nums| |dens| $)
  (CONS (CONS |wh| (|CONTFRAC;genFractionB| |nums| |dens| $)) 'NIL)) 

(DEFUN |CONTFRAC;genFractionB| (|nums| |dens| $)
  (PROG (|d| |n|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |nums| (QREFELT $ 38)) (SPADCALL |dens| (QREFELT $ 38)))
        (SPADCALL (QREFELT $ 39)))
       ('T
        (SEQ
         (LETT |n| (SPADCALL |nums| (QREFELT $ 40))
               . #1=(|CONTFRAC;genFractionB|))
         (LETT |d| (SPADCALL |dens| (QREFELT $ 40)) . #1#)
         (EXIT
          (SPADCALL (CONS |n| |d|)
                    (SPADCALL
                     (CONS #'|CONTFRAC;genFractionB!0|
                           (VECTOR |dens| $ |nums|))
                     (QREFELT $ 43))
                    (QREFELT $ 44)))))))))) 

(DEFUN |CONTFRAC;genFractionB!0| ($$)
  (PROG (|nums| $ |dens|)
    (LETT |nums| (QREFELT $$ 2) . #1=(|CONTFRAC;genFractionB|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |dens| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|CONTFRAC;genFractionB| (SPADCALL |nums| (QREFELT $ 41))
       (SPADCALL |dens| (QREFELT $ 41)) $))))) 

(DEFUN |CONTFRAC;reducedContinuedFraction;RS$;10| (|wh| |dens| $)
  (SPADCALL |wh| (SPADCALL (LIST (|spadConstant| $ 29)) (QREFELT $ 46)) |dens|
            (QREFELT $ 37))) 

(DEFUN |CONTFRAC;coerce;I$;11| (|n| $)
  (CONS (CONS (SPADCALL |n| (QREFELT $ 49)) (SPADCALL (QREFELT $ 39))) 'T)) 

(DEFUN |CONTFRAC;coerce;R$;12| (|r| $)
  (CONS (CONS |r| (SPADCALL (QREFELT $ 39))) 'T)) 

(DEFUN |CONTFRAC;coerce;F$;13| (|a| $)
  (PROG (|d| |n| |l| |qr| |fr| |wh|)
    (RETURN
     (SEQ
      (LETT |wh| (|CONTFRAC;eucWhole0| |a| $) . #1=(|CONTFRAC;coerce;F$;13|))
      (LETT |fr| (SPADCALL |a| (SPADCALL |wh| (QREFELT $ 52)) (QREFELT $ 53))
            . #1#)
      (EXIT
       (COND
        ((SPADCALL |fr| (QREFELT $ 54))
         (CONS (CONS |wh| (SPADCALL (QREFELT $ 39))) 'T))
        ('T
         (SEQ (LETT |l| NIL . #1#)
              (LETT |n| (SPADCALL |fr| (QREFELT $ 20)) . #1#)
              (LETT |d| (SPADCALL |fr| (QREFELT $ 21)) . #1#)
              (SEQ G190
                   (COND
                    ((NULL (COND ((SPADCALL |d| (QREFELT $ 55)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ (LETT |qr| (SPADCALL |n| |d| (QREFELT $ 57)) . #1#)
                        (LETT |l|
                              (CONS (CONS (|spadConstant| $ 29) (QCAR |qr|))
                                    |l|)
                              . #1#)
                        (LETT |n| |d| . #1#)
                        (EXIT (LETT |d| (QCDR |qr|) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS (CONS |wh| (SPADCALL (CDR (NREVERSE |l|)) (QREFELT $ 60)))
                     'T)))))))))) 

(DEFUN |CONTFRAC;characteristic;Nni;14| ($) (SPADCALL (QREFELT $ 62))) 

(DEFUN |CONTFRAC;genFromSequence| (|apps| $)
  (PROG (|wh| |hi| |lo|)
    (RETURN
     (SEQ
      (LETT |lo| (SPADCALL |apps| (QREFELT $ 64))
            . #1=(|CONTFRAC;genFromSequence|))
      (LETT |apps| (SPADCALL |apps| (QREFELT $ 65)) . #1#)
      (LETT |hi| (SPADCALL |apps| (QREFELT $ 64)) . #1#)
      (LETT |apps| (SPADCALL |apps| (QREFELT $ 65)) . #1#)
      (SEQ G190
           (COND
            ((NULL
              (SPADCALL (|CONTFRAC;eucWhole0| |lo| $)
                        (|CONTFRAC;eucWhole0| |hi| $) (QREFELT $ 30)))
             (GO G191)))
           (SEQ (LETT |lo| (SPADCALL |apps| (QREFELT $ 64)) . #1#)
                (LETT |apps| (SPADCALL |apps| (QREFELT $ 65)) . #1#)
                (LETT |hi| (SPADCALL |apps| (QREFELT $ 64)) . #1#)
                (EXIT (LETT |apps| (SPADCALL |apps| (QREFELT $ 65)) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT |wh| (|CONTFRAC;eucWhole0| |lo| $) . #1#)
      (EXIT
       (CONS
        (CONS |wh|
              (|CONTFRAC;genReducedForm| (SPADCALL |wh| (QREFELT $ 52)) |apps|
               (SPADCALL (|spadConstant| $ 58) (|spadConstant| $ 66)
                         (|spadConstant| $ 66) (|spadConstant| $ 58)
                         (QREFELT $ 68))
               $))
        (COND
         ((COND
           ((|HasCategory| (QREFELT $ 6) '(|OrderedRing|))
            (|HasCategory| (QREFELT $ 6) '(|multiplicativeValuation|)))
           (#2='T 'NIL))
          'T)
         (#2# (|HasCategory| (QREFELT $ 6) '(|additiveValuation|)))))))))) 

(DEFUN |CONTFRAC;genReducedForm| (|wh0| |apps| |mt| $)
  (PROG (|whi| |wlo| |hi| |lo|)
    (RETURN
     (SEQ
      (LETT |lo|
            (SPADCALL (SPADCALL |apps| (QREFELT $ 64)) |wh0| (QREFELT $ 53))
            . #1=(|CONTFRAC;genReducedForm|))
      (LETT |apps| (SPADCALL |apps| (QREFELT $ 65)) . #1#)
      (LETT |hi|
            (SPADCALL (SPADCALL |apps| (QREFELT $ 64)) |wh0| (QREFELT $ 53))
            . #1#)
      (LETT |apps| (SPADCALL |apps| (QREFELT $ 65)) . #1#)
      (COND
       ((SPADCALL |lo| |hi| (QREFELT $ 69))
        (COND
         ((SPADCALL (SPADCALL |mt| |lo| (QREFELT $ 70)) (QREFELT $ 54))
          (EXIT (SPADCALL (QREFELT $ 39)))))))
      (LETT |mt| (SPADCALL |mt| (QREFELT $ 71)) . #1#)
      (LETT |wlo| (|CONTFRAC;eucWhole| (SPADCALL |mt| |lo| (QREFELT $ 70)) $)
            . #1#)
      (LETT |whi| (|CONTFRAC;eucWhole| (SPADCALL |mt| |hi| (QREFELT $ 70)) $)
            . #1#)
      (SEQ G190 (COND ((NULL (SPADCALL |wlo| |whi| (QREFELT $ 30))) (GO G191)))
           (SEQ
            (LETT |wlo|
                  (|CONTFRAC;eucWhole|
                   (SPADCALL |mt|
                             (SPADCALL (SPADCALL |apps| (QREFELT $ 64)) |wh0|
                                       (QREFELT $ 53))
                             (QREFELT $ 70))
                   $)
                  . #1#)
            (LETT |apps| (SPADCALL |apps| (QREFELT $ 65)) . #1#)
            (LETT |whi|
                  (|CONTFRAC;eucWhole|
                   (SPADCALL |mt|
                             (SPADCALL (SPADCALL |apps| (QREFELT $ 64)) |wh0|
                                       (QREFELT $ 53))
                             (QREFELT $ 70))
                   $)
                  . #1#)
            (EXIT (LETT |apps| (SPADCALL |apps| (QREFELT $ 65)) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL (CONS (|spadConstant| $ 29) |wlo|)
                 (SPADCALL
                  (CONS #'|CONTFRAC;genReducedForm!0|
                        (VECTOR $ |wlo| |mt| |apps| |wh0|))
                  (QREFELT $ 43))
                 (QREFELT $ 44))))))) 

(DEFUN |CONTFRAC;genReducedForm!0| ($$)
  (PROG (|wh0| |apps| |mt| |wlo| $)
    (LETT |wh0| (QREFELT $$ 4) . #1=(|CONTFRAC;genReducedForm|))
    (LETT |apps| (QREFELT $$ 3) . #1#)
    (LETT |mt| (QREFELT $$ 2) . #1#)
    (LETT |wlo| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|CONTFRAC;genReducedForm| |wh0| |apps|
       (SPADCALL |mt| (SPADCALL (SPADCALL |wlo| (QREFELT $ 52)) (QREFELT $ 72))
                 (QREFELT $ 73))
       $))))) 

(DEFUN |CONTFRAC;wholePart;$R;17| (|c| $) (QCAR (QCAR |c|))) 

(DEFUN |CONTFRAC;partialNumerators;$S;18| (|c| $)
  (SPADCALL (LIST #'|CONTFRAC;partialNumerators;$S;18!0|) (QCDR (QCAR |c|))
            (QREFELT $ 77))) 

(DEFUN |CONTFRAC;partialNumerators;$S;18!0| (|x| $$) (QCAR |x|)) 

(DEFUN |CONTFRAC;partialDenominators;$S;19| (|c| $)
  (SPADCALL (LIST #'|CONTFRAC;partialDenominators;$S;19!0|) (QCDR (QCAR |c|))
            (QREFELT $ 77))) 

(DEFUN |CONTFRAC;partialDenominators;$S;19!0| (|x| $$) (QCDR |x|)) 

(DEFUN |CONTFRAC;partialQuotients;$S;20| (|c| $)
  (SPADCALL (QCAR (QCAR |c|)) (SPADCALL |c| (QREFELT $ 79)) (QREFELT $ 80))) 

(DEFUN |CONTFRAC;approximants;$S;21| (|c| $)
  (COND
   ((SPADCALL (QCDR (QCAR |c|)) (QREFELT $ 31))
    (SPADCALL (LIST (SPADCALL (QCAR (QCAR |c|)) (QREFELT $ 52)))
              (QREFELT $ 83)))
   ('T
    (|CONTFRAC;genApproximants| (|spadConstant| $ 29) (|spadConstant| $ 26)
     (QCAR (QCAR |c|)) (|spadConstant| $ 29) (QCDR (QCAR |c|)) $)))) 

(DEFUN |CONTFRAC;convergents;$S;22| (|c| $)
  (COND
   ((SPADCALL (QCDR (QCAR |c|)) (QREFELT $ 31))
    (SPADCALL (SPADCALL (QCAR (QCAR |c|)) (QREFELT $ 52))
              (SPADCALL (QREFELT $ 84)) (QREFELT $ 85)))
   ('T
    (|CONTFRAC;genConvergents| (|spadConstant| $ 29) (|spadConstant| $ 26)
     (QCAR (QCAR |c|)) (|spadConstant| $ 29) (QCDR (QCAR |c|)) $)))) 

(DEFUN |CONTFRAC;numerators;$S;23| (|c| $)
  (COND
   ((SPADCALL (QCDR (QCAR |c|)) (QREFELT $ 31))
    (SPADCALL (QCAR (QCAR |c|)) (SPADCALL (QREFELT $ 86)) (QREFELT $ 80)))
   ('T
    (|CONTFRAC;genNumDen| (|spadConstant| $ 29) (QCAR (QCAR |c|))
     (QCDR (QCAR |c|)) $)))) 

(DEFUN |CONTFRAC;denominators;$S;24| (|c| $)
  (|CONTFRAC;genNumDen| (|spadConstant| $ 26) (|spadConstant| $ 29)
   (QCDR (QCAR |c|)) $)) 

(DEFUN |CONTFRAC;extend;$I$;25| (|x| |n| $)
  (SEQ (SPADCALL (QCDR (QCAR |x|)) |n| (QREFELT $ 89)) (EXIT |x|))) 

(DEFUN |CONTFRAC;complete;2$;26| (|x| $)
  (SEQ (SPADCALL (QCDR (QCAR |x|)) (QREFELT $ 91)) (EXIT |x|))) 

(DEFUN |CONTFRAC;iGenApproximants| (|pm2| |qm2| |pm1| |qm1| |fr| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|CONTFRAC;iGenApproximants!0|
             (VECTOR |qm1| |qm2| |pm1| |pm2| $ |fr|))
       (QREFELT $ 94)))))) 

(DEFUN |CONTFRAC;iGenApproximants!0| ($$)
  (PROG (|fr| $ |pm2| |pm1| |qm2| |qm1|)
    (LETT |fr| (QREFELT $$ 5) . #1=(|CONTFRAC;iGenApproximants|))
    (LETT $ (QREFELT $$ 4) . #1#)
    (LETT |pm2| (QREFELT $$ 3) . #1#)
    (LETT |pm1| (QREFELT $$ 2) . #1#)
    (LETT |qm2| (QREFELT $$ 1) . #1#)
    (LETT |qm1| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|nd| |pm| |qm|)
        (RETURN
         (SEQ (LETT |nd| (SPADCALL |fr| (QREFELT $ 32)) NIL)
              (LETT |pm|
                    (SPADCALL (SPADCALL (QCAR |nd|) |pm2| (QREFELT $ 23))
                              (SPADCALL (QCDR |nd|) |pm1| (QREFELT $ 23))
                              (QREFELT $ 93))
                    NIL)
              (LETT |qm|
                    (SPADCALL (SPADCALL (QCAR |nd|) |qm2| (QREFELT $ 23))
                              (SPADCALL (QCDR |nd|) |qm1| (QREFELT $ 23))
                              (QREFELT $ 93))
                    NIL)
              (EXIT
               (|CONTFRAC;genApproximants| |pm1| |qm1| |pm| |qm|
                (SPADCALL |fr| (QREFELT $ 33)) $))))))))) 

(DEFUN |CONTFRAC;genApproximants| (|pm2| |qm2| |pm1| |qm1| |fr| $)
  (COND
   ((SPADCALL |fr| (QREFELT $ 31))
    (SPADCALL (LIST (SPADCALL |pm1| |qm1| (QREFELT $ 95))) (QREFELT $ 83)))
   ('T
    (SPADCALL (SPADCALL |pm1| |qm1| (QREFELT $ 95))
              (|CONTFRAC;iGenApproximants| |pm2| |qm2| |pm1| |qm1| |fr| $)
              (QREFELT $ 85))))) 

(DEFUN |CONTFRAC;iGenConvergents| (|pm2| |qm2| |pm1| |qm1| |fr| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|CONTFRAC;iGenConvergents!0|
             (VECTOR |qm1| |qm2| |pm1| |pm2| $ |fr|))
       (QREFELT $ 94)))))) 

(DEFUN |CONTFRAC;iGenConvergents!0| ($$)
  (PROG (|fr| $ |pm2| |pm1| |qm2| |qm1|)
    (LETT |fr| (QREFELT $$ 5) . #1=(|CONTFRAC;iGenConvergents|))
    (LETT $ (QREFELT $$ 4) . #1#)
    (LETT |pm2| (QREFELT $$ 3) . #1#)
    (LETT |pm1| (QREFELT $$ 2) . #1#)
    (LETT |qm2| (QREFELT $$ 1) . #1#)
    (LETT |qm1| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|nd| |pm| |qm|)
        (RETURN
         (SEQ (LETT |nd| (SPADCALL |fr| (QREFELT $ 32)) NIL)
              (LETT |pm|
                    (SPADCALL (SPADCALL (QCAR |nd|) |pm2| (QREFELT $ 23))
                              (SPADCALL (QCDR |nd|) |pm1| (QREFELT $ 23))
                              (QREFELT $ 93))
                    NIL)
              (LETT |qm|
                    (SPADCALL (SPADCALL (QCAR |nd|) |qm2| (QREFELT $ 23))
                              (SPADCALL (QCDR |nd|) |qm1| (QREFELT $ 23))
                              (QREFELT $ 93))
                    NIL)
              (EXIT
               (|CONTFRAC;genConvergents| |pm1| |qm1| |pm| |qm|
                (SPADCALL |fr| (QREFELT $ 33)) $))))))))) 

(DEFUN |CONTFRAC;genConvergents| (|pm2| |qm2| |pm1| |qm1| |fr| $)
  (COND
   ((SPADCALL |fr| (QREFELT $ 31))
    (SPADCALL (SPADCALL |pm1| |qm1| (QREFELT $ 95)) (SPADCALL (QREFELT $ 84))
              (QREFELT $ 85)))
   ('T
    (SPADCALL (SPADCALL |pm1| |qm1| (QREFELT $ 95))
              (|CONTFRAC;iGenConvergents| |pm2| |qm2| |pm1| |qm1| |fr| $)
              (QREFELT $ 85))))) 

(DEFUN |CONTFRAC;genNumDen| (|m2| |m1| |fr| $)
  (PROG ()
    (RETURN
     (COND
      ((SPADCALL |fr| (QREFELT $ 31))
       (SPADCALL |m1| (SPADCALL (QREFELT $ 86)) (QREFELT $ 80)))
      ('T
       (SPADCALL |m1|
                 (SPADCALL
                  (CONS #'|CONTFRAC;genNumDen!0| (VECTOR $ |fr| |m2| |m1|))
                  (QREFELT $ 96))
                 (QREFELT $ 80))))))) 

(DEFUN |CONTFRAC;genNumDen!0| ($$)
  (PROG (|m1| |m2| |fr| $)
    (LETT |m1| (QREFELT $$ 3) . #1=(|CONTFRAC;genNumDen|))
    (LETT |m2| (QREFELT $$ 2) . #1#)
    (LETT |fr| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|CONTFRAC;genNumDen| |m1|
       (SPADCALL
        (SPADCALL |m2| (QCAR (SPADCALL |fr| (QREFELT $ 32))) (QREFELT $ 23))
        (SPADCALL |m1| (QCDR (SPADCALL |fr| (QREFELT $ 32))) (QREFELT $ 23))
        (QREFELT $ 93))
       (SPADCALL |fr| (QREFELT $ 33)) $))))) 

(DEFUN |CONTFRAC;Zero;$;32| ($) (SPADCALL (|spadConstant| $ 26) (QREFELT $ 51))) 

(DEFUN |CONTFRAC;One;$;33| ($) (SPADCALL (|spadConstant| $ 29) (QREFELT $ 51))) 

(DEFUN |CONTFRAC;+;3$;34| (|c| |d| $)
  (|CONTFRAC;genFromSequence|
   (SPADCALL (ELT $ 97) (SPADCALL |c| (QREFELT $ 18))
             (SPADCALL |d| (QREFELT $ 18)) (QREFELT $ 99))
   $)) 

(DEFUN |CONTFRAC;-;3$;35| (|c| |d| $)
  (|CONTFRAC;genFromSequence|
   (SPADCALL (ELT $ 53) (SPADCALL |c| (QREFELT $ 18))
             (SPADCALL (SPADCALL |d| (QREFELT $ 18)) (QREFELT $ 101))
             (QREFELT $ 99))
   $)) 

(DEFUN |CONTFRAC;-;2$;36| (|c| $)
  (|CONTFRAC;genFromSequence|
   (SPADCALL (ELT $ 72)
             (SPADCALL (SPADCALL |c| (QREFELT $ 18)) (QREFELT $ 101))
             (QREFELT $ 104))
   $)) 

(DEFUN |CONTFRAC;*;3$;37| (|c| |d| $)
  (|CONTFRAC;genFromSequence|
   (SPADCALL (ELT $ 106) (SPADCALL |c| (QREFELT $ 18))
             (SPADCALL |d| (QREFELT $ 18)) (QREFELT $ 99))
   $)) 

(DEFUN |CONTFRAC;*;R2$;38| (|a| |d| $)
  (PROG ()
    (RETURN
     (|CONTFRAC;genFromSequence|
      (SPADCALL (CONS #'|CONTFRAC;*;R2$;38!0| (VECTOR $ |a|))
                (SPADCALL |d| (QREFELT $ 18)) (QREFELT $ 104))
      $)))) 

(DEFUN |CONTFRAC;*;R2$;38!0| (|x| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1) . #1=(|CONTFRAC;*;R2$;38|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a| |x| (QREFELT $ 108)))))) 

(DEFUN |CONTFRAC;*;F2$;39| (|q| |d| $)
  (PROG ()
    (RETURN
     (|CONTFRAC;genFromSequence|
      (SPADCALL (CONS #'|CONTFRAC;*;F2$;39!0| (VECTOR $ |q|))
                (SPADCALL |d| (QREFELT $ 18)) (QREFELT $ 104))
      $)))) 

(DEFUN |CONTFRAC;*;F2$;39!0| (|x| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) . #1=(|CONTFRAC;*;F2$;39|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |q| |x| (QREFELT $ 106)))))) 

(DEFUN |CONTFRAC;*;I2$;40| (|n| |d| $)
  (PROG ()
    (RETURN
     (|CONTFRAC;genFromSequence|
      (SPADCALL (CONS #'|CONTFRAC;*;I2$;40!0| (VECTOR $ |n|))
                (SPADCALL |d| (QREFELT $ 18)) (QREFELT $ 104))
      $)))) 

(DEFUN |CONTFRAC;*;I2$;40!0| (|x| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|CONTFRAC;*;I2$;40|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |n| |x| (QREFELT $ 111)))))) 

(DEFUN |CONTFRAC;/;3$;41| (|c| |d| $)
  (|CONTFRAC;genFromSequence|
   (SPADCALL (ELT $ 113) (SPADCALL |c| (QREFELT $ 18))
             (SPADCALL (SPADCALL |d| (QREFELT $ 18)) (QREFELT $ 101))
             (QREFELT $ 99))
   $)) 

(DEFUN |CONTFRAC;recip;$U;42| (|c| $)
  (COND ((SPADCALL |c| (|spadConstant| $ 25) (QREFELT $ 34)) (CONS 1 "failed"))
        ('T
         (CONS 0
               (|CONTFRAC;genFromSequence|
                (SPADCALL (CONS #'|CONTFRAC;recip;$U;42!0| $)
                          (SPADCALL (SPADCALL |c| (QREFELT $ 18))
                                    (QREFELT $ 101))
                          (QREFELT $ 104))
                $))))) 

(DEFUN |CONTFRAC;recip;$U;42!0| (|x| $)
  (SPADCALL (|spadConstant| $ 58) |x| (QREFELT $ 113))) 

(DEFUN |CONTFRAC;showAll?| ($) (COND ((NULL |$streamsShowAll|) 'NIL) ('T 'T))) 

(DEFUN |CONTFRAC;zagRec| (|t| $)
  (SPADCALL (SPADCALL (QCAR |t|) (QREFELT $ 118))
            (SPADCALL (QCDR |t|) (QREFELT $ 118)) (QREFELT $ 119))) 

(DEFUN |CONTFRAC;coerce;$Of;45| (|c| $)
  (PROG (|e| |l| |fr| |n| |count| |wh|)
    (RETURN
     (SEQ (LETT |wh| (QCAR (QCAR |c|)) . #1=(|CONTFRAC;coerce;$Of;45|))
          (LETT |fr| (QCDR (QCAR |c|)) . #1#)
          (EXIT
           (COND
            ((SPADCALL |fr| (QREFELT $ 31)) (SPADCALL |wh| (QREFELT $ 118)))
            (#2='T
             (SEQ (LETT |count| |$streamCount| . #1#) (LETT |l| NIL . #1#)
                  (SEQ (LETT |n| 1 . #1#) G190
                       (COND
                        ((OR (|greater_SI| |n| |count|)
                             (NULL
                              (COND ((SPADCALL |fr| (QREFELT $ 31)) 'NIL)
                                    ('T 'T))))
                         (GO G191)))
                       (SEQ
                        (LETT |l|
                              (CONS
                               (|CONTFRAC;zagRec|
                                (SPADCALL |fr| (QREFELT $ 32)) $)
                               |l|)
                              . #1#)
                        (EXIT
                         (LETT |fr| (SPADCALL |fr| (QREFELT $ 33)) . #1#)))
                       (LETT |n| (|inc_SI| |n|) . #1#) (GO G190) G191
                       (EXIT NIL))
                  (COND
                   ((|CONTFRAC;showAll?| $)
                    (SEQ (LETT |n| (+ |count| 1) . #1#) G190
                         (COND
                          ((NULL (SPADCALL |fr| (QREFELT $ 120))) (GO G191)))
                         (SEQ
                          (LETT |l|
                                (CONS
                                 (|CONTFRAC;zagRec|
                                  (SPADCALL |fr| (QREFELT $ 32)) $)
                                 |l|)
                                . #1#)
                          (EXIT
                           (LETT |fr| (SPADCALL |fr| (QREFELT $ 33)) . #1#)))
                         (LETT |n| (+ |n| 1) . #1#) (GO G190) G191
                         (EXIT NIL))))
                  (COND
                   ((NULL (SPADCALL |fr| (QREFELT $ 121)))
                    (LETT |l| (CONS (SPADCALL '|...| (QREFELT $ 123)) |l|)
                          . #1#)))
                  (LETT |l| (NREVERSE |l|) . #1#)
                  (LETT |e| (SPADCALL (ELT $ 124) |l| (QREFELT $ 127)) . #1#)
                  (EXIT
                   (COND ((SPADCALL |wh| (QREFELT $ 55)) |e|)
                         (#2#
                          (SPADCALL (SPADCALL |wh| (QREFELT $ 118)) |e|
                                    (QREFELT $ 124))))))))))))) 

(DECLAIM (NOTINLINE |ContinuedFraction;|)) 

(DEFUN |ContinuedFraction| (#1=#:G309)
  (PROG ()
    (RETURN
     (PROG (#2=#:G310)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|ContinuedFraction|)
                                           '|domainEqualList|)
                . #3=(|ContinuedFraction|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|ContinuedFraction;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ContinuedFraction|))))))))))) 

(DEFUN |ContinuedFraction;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ContinuedFraction|))
      (LETT |dv$| (LIST '|ContinuedFraction| DV$1) . #1#)
      (LETT $ (GETREFV 144) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ContinuedFraction| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Record|
                 (|:| |value|
                      (|Record| (|:| |whole| |#1|)
                                (|:| |fract|
                                     (|Stream|
                                      (|Record| (|:| |num| |#1|)
                                                (|:| |den| |#1|))))))
                 (|:| |reduced?| (|Boolean|))))
      (COND
       ((COND
         ((|HasCategory| |#1| '(|OrderedRing|))
          (|HasCategory| |#1| '(|multiplicativeValuation|)))
         ('T 'NIL))
        (PROGN
         (QSETREFV $ 37
                   (CONS
                    (|dispatchFunction| |CONTFRAC;continuedFraction;R2S$;6|)
                    $))))
       ('T
        (PROGN
         (QSETREFV $ 37
                   (CONS
                    (|dispatchFunction| |CONTFRAC;continuedFraction;R2S$;8|)
                    $)))))
      $)))) 

(MAKEPROP '|ContinuedFraction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              (|Record| (|:| |num| 6) (|:| |den| 6)) (|Stream| 9)
              (0 . |explicitlyFinite?|) (|Stream| 15)
              |CONTFRAC;convergents;$S;22| (5 . |complete|) (|Fraction| 6)
              (10 . |last|) |CONTFRAC;continuedFraction;F$;5|
              |CONTFRAC;approximants;$S;21| |CONTFRAC;reducedForm;2$;1|
              (15 . |numer|) (20 . |denom|) (25 . |quo|) (31 . *) (37 . -)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CONTFRAC;Zero;$;32|) $))
              (43 . |Zero|) (47 . <)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CONTFRAC;One;$;33|) $))
              (53 . |One|) (57 . ~=) (63 . |empty?|) (68 . |frst|) (73 . |rst|)
              |CONTFRAC;=;2$B;4| |CONTFRAC;coerce;F$;13| (|Stream| 6)
              (78 . |continuedFraction|) (85 . |empty?|) (90 . |empty|)
              (94 . |frst|) (99 . |rst|) (|Mapping| $) (104 . |delay|)
              (109 . |concat|) (|List| 6) (115 . |repeating|)
              |CONTFRAC;reducedContinuedFraction;RS$;10| (|Integer|)
              (120 . |coerce|) |CONTFRAC;coerce;I$;11| |CONTFRAC;coerce;R$;12|
              (125 . |coerce|) (130 . -) (136 . |zero?|) (141 . |zero?|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (146 . |divide|) (152 . |One|) (|List| 9) (156 . |construct|)
              (|NonNegativeInteger|) (161 . |characteristic|)
              |CONTFRAC;characteristic;Nni;14| (165 . |first|) (170 . |rst|)
              (175 . |Zero|) (|MoebiusTransform| 15) (179 . |moebius|)
              (187 . =) (193 . |eval|) (199 . |recip|) (204 . -)
              (209 . |shift|) |CONTFRAC;wholePart;$R;17| (|Mapping| 6 9)
              (|StreamFunctions2| 9 6) (215 . |map|)
              |CONTFRAC;partialNumerators;$S;18|
              |CONTFRAC;partialDenominators;$S;19| (221 . |concat|)
              |CONTFRAC;partialQuotients;$S;20| (|List| 15) (227 . |repeating|)
              (232 . |empty|) (236 . |concat|) (242 . |empty|)
              |CONTFRAC;numerators;$S;23| |CONTFRAC;denominators;$S;24|
              (246 . |extend|) |CONTFRAC;extend;$I$;25| (252 . |complete|)
              |CONTFRAC;complete;2$;26| (257 . +) (263 . |delay|) (268 . /)
              (274 . |delay|) (279 . +) (|Mapping| 15 15 15) (285 . |map|)
              |CONTFRAC;+;3$;34| (292 . |rest|) |CONTFRAC;-;3$;35|
              (|Mapping| 15 15) (297 . |map|) |CONTFRAC;-;2$;36| (303 . *)
              |CONTFRAC;*;3$;37| (309 . *) |CONTFRAC;*;R2$;38|
              |CONTFRAC;*;F2$;39| (315 . *) |CONTFRAC;*;I2$;40| (321 . /)
              |CONTFRAC;/;3$;41| (|Union| $ '"failed") |CONTFRAC;recip;$U;42|
              (|OutputForm|) (327 . |coerce|) (332 . |zag|)
              (338 . |explicitEntries?|) (343 . |explicitlyEmpty?|) (|Symbol|)
              (348 . |coerce|) (353 . +) (|Mapping| 117 117 117) (|List| 117)
              (359 . |reduce|) |CONTFRAC;coerce;$Of;45|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |coef| 131) (|:| |generator| $))
              (|Union| 131 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 136 '"failed") (|Factored| $) (|Fraction| 48)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 365 |zero?| 371 |wholePart| 376 |unitNormal| 381
              |unitCanonical| 386 |unit?| 391 |subtractIfCan| 396
              |squareFreePart| 402 |squareFree| 407 |sizeLess?| 412 |sample|
              418 |rem| 422 |reducedForm| 428 |reducedContinuedFraction| 433
              |recip| 439 |quo| 444 |principalIdeal| 450 |prime?| 455
              |partialQuotients| 460 |partialNumerators| 465
              |partialDenominators| 470 |opposite?| 475 |one?| 481 |numerators|
              486 |multiEuclidean| 491 |lcmCoef| 497 |lcm| 503 |latex| 514
              |inv| 519 |hashUpdate!| 524 |hash| 530 |gcdPolynomial| 535 |gcd|
              541 |factor| 552 |extendedEuclidean| 557 |extend| 570 |exquo| 576
              |expressIdealMember| 582 |euclideanSize| 588 |divide| 593
              |denominators| 599 |convergents| 604 |continuedFraction| 609
              |complete| 621 |coerce| 626 |characteristic| 656 |associates?|
              660 |approximants| 666 |annihilate?| 671 ^ 677 |Zero| 695 |One|
              699 = 703 / 709 - 715 + 726 * 732)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0))
            (CONS
             '#(|Field&| |EuclideanDomain&| |UniqueFactorizationDomain&| NIL
                |GcdDomain&| |DivisionRing&| NIL |Algebra&| |Algebra&| NIL
                |Algebra&| |Algebra&| |Module&| |EntireRing&| |Module&| NIL
                |Module&| |Module&| NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL NIL
                NIL |Rng&| NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| |SetCategory&|
                NIL NIL NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|Field|) (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|Algebra| 6) (|Algebra| 139)
                 (|LeftOreRing|) (|Algebra| $$) (|Algebra| (|Fraction| 6))
                 (|Module| 139) (|EntireRing|) (|Module| $$)
                 (|CommutativeRing|) (|Module| (|Fraction| 6)) (|Module| 6)
                 (|BiModule| 139 139) (|BiModule| $$ $$)
                 (|BiModule| (|Fraction| 6) (|Fraction| 6)) (|Ring|)
                 (|BiModule| 6 6) (|RightModule| 139) (|LeftModule| 139)
                 (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| (|Fraction| 6)) (|LeftModule| (|Fraction| 6))
                 (|Rng|) (|RightModule| 6) (|LeftModule| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 117))
              (|makeByteWordVec2| 143
                                  '(1 10 8 0 11 1 12 0 0 14 1 12 15 0 16 1 15 6
                                    0 20 1 15 6 0 21 2 6 0 0 0 22 2 6 0 0 0 23
                                    2 6 0 0 0 24 0 6 0 26 2 6 8 0 0 27 0 6 0 29
                                    2 6 8 0 0 30 1 10 8 0 31 1 10 9 0 32 1 10 0
                                    0 33 3 0 0 6 36 36 37 1 36 8 0 38 0 10 0 39
                                    1 36 6 0 40 1 36 0 0 41 1 10 0 42 43 2 10 0
                                    9 0 44 1 36 0 45 46 1 6 0 48 49 1 15 0 6 52
                                    2 15 0 0 0 53 1 15 8 0 54 1 6 8 0 55 2 6 56
                                    0 0 57 0 15 0 58 1 10 0 59 60 0 15 61 62 1
                                    12 15 0 64 1 12 0 0 65 0 15 0 66 4 67 0 15
                                    15 15 15 68 2 15 8 0 0 69 2 67 15 0 15 70 1
                                    67 0 0 71 1 15 0 0 72 2 67 0 0 15 73 2 76
                                    36 75 10 77 2 36 0 6 0 80 1 12 0 82 83 0 12
                                    0 84 2 12 0 15 0 85 0 36 0 86 2 10 0 0 48
                                    89 1 10 0 0 91 2 6 0 0 0 93 1 12 0 42 94 2
                                    15 0 6 6 95 1 36 0 42 96 2 15 0 0 0 97 3 12
                                    0 98 0 0 99 1 12 0 0 101 2 12 0 103 0 104 2
                                    15 0 0 0 106 2 15 0 6 0 108 2 15 0 48 0 111
                                    2 15 0 0 0 113 1 6 117 0 118 2 117 0 0 0
                                    119 1 10 8 0 120 1 10 8 0 121 1 122 117 0
                                    123 2 117 0 0 0 124 2 126 117 125 0 127 2 0
                                    8 0 0 1 1 0 8 0 1 1 0 6 0 74 1 0 129 0 1 1
                                    0 0 0 1 1 0 8 0 1 2 0 115 0 0 1 1 0 0 0 1 1
                                    0 138 0 1 2 0 8 0 0 1 0 0 0 1 2 0 0 0 0 1 1
                                    0 0 0 19 2 0 0 6 36 47 1 0 115 0 116 2 0 0
                                    0 0 1 1 0 133 131 1 1 0 8 0 1 1 0 36 0 81 1
                                    0 36 0 78 1 0 36 0 79 2 0 8 0 0 1 1 0 8 0 1
                                    1 0 36 0 87 2 0 134 131 0 1 2 0 130 0 0 1 2
                                    0 0 0 0 1 1 0 0 131 1 1 0 141 0 1 1 0 0 0 1
                                    2 0 143 143 0 1 1 0 142 0 1 2 0 132 132 132
                                    1 2 0 0 0 0 1 1 0 0 131 1 1 0 138 0 1 2 0
                                    135 0 0 1 3 0 137 0 0 0 1 2 0 0 0 48 90 2 0
                                    115 0 0 1 2 0 134 131 0 1 1 0 61 0 1 2 0 56
                                    0 0 1 1 0 36 0 88 1 0 12 0 13 1 0 0 15 17 3
                                    0 0 6 36 36 37 1 0 0 0 92 1 0 0 0 1 1 0 0
                                    139 1 1 0 0 6 51 1 0 0 15 35 1 0 0 48 50 1
                                    0 117 0 128 0 0 61 63 2 0 8 0 0 1 1 0 12 0
                                    18 2 0 8 0 0 1 2 0 0 0 48 1 2 0 0 0 61 1 2
                                    0 0 0 140 1 0 0 0 25 0 0 0 28 2 0 8 0 0 34
                                    2 0 0 0 0 114 2 0 0 0 0 102 1 0 0 0 105 2 0
                                    0 0 0 100 2 0 0 0 139 1 2 0 0 139 0 1 2 0 0
                                    15 0 110 2 0 0 0 15 1 2 0 0 6 0 109 2 0 0 0
                                    6 1 2 0 0 0 0 107 2 0 0 48 0 112 2 0 0 61 0
                                    1 2 0 0 140 0 1)))))
           '|lookupComplete|)) 
