
(DEFUN |INTALG;F2UPR| (|f| $) (SPADCALL (|INTALG;F2R| |f| $) (QREFELT $ 20))) 

(DEFUN |INTALG;F2R| (|f| $)
  (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 21)) (QREFELT $ 23))
            (QREFELT $ 24))) 

(DEFUN |INTALG;algintexp| (|f| |derivation| $)
  (PROG (|u| |p| |h| |ff| |w| |r| #1=#:G181 |i| |vf| |vp| |n| |v| |d| |c|)
    (RETURN
     (SEQ
      (LETT |d|
            (QCDR
             (LETT |c| (SPADCALL |f| (QREFELT $ 26))
                   . #2=(|INTALG;algintexp|)))
            . #2#)
      (LETT |v| (QCAR |c|) . #2#)
      (LETT |vp| (MAKEARR1 (LETT |n| (QVSIZE |v|) . #2#) (|spadConstant| $ 28))
            . #2#)
      (LETT |vf| (MAKEARR1 |n| (|spadConstant| $ 31)) . #2#)
      (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 34)) . #2#)
           (LETT #1# (QVSIZE |v|) . #2#) G190 (COND ((> |i| #1#) (GO G191)))
           (SEQ
            (LETT |r|
                  (SPADCALL (SPADCALL (QAREF1O |v| |i| 1) |d| (QREFELT $ 35))
                            (QREFELT $ 37))
                  . #2#)
            (QSETAREF1O |vf| |i| (QCDR |r|) 1)
            (EXIT (QSETAREF1O |vp| |i| (QCAR |r|) 1)))
           (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
      (LETT |ff|
            (SPADCALL |vf| (LETT |w| (SPADCALL (QREFELT $ 39)) . #2#)
                      (QREFELT $ 41))
            . #2#)
      (LETT |h| (SPADCALL |ff| |derivation| (QREFELT $ 45)) . #2#)
      (LETT |p|
            (SPADCALL (SPADCALL (ELT $ 46) |vp| (QREFELT $ 50)) |w|
                      (QREFELT $ 41))
            . #2#)
      (COND
       ((SPADCALL (QCDR |h|) (QREFELT $ 52))
        (COND
         ((SPADCALL |p| (QREFELT $ 52))
          (EXIT (SPADCALL (QCAR |h|) (QREFELT $ 54)))))))
      (LETT |u| (|INTALG;alglogint| (QCDR |h|) |derivation| $) . #2#)
      (EXIT
       (COND
        ((QEQCAR |u| 1)
         (SPADCALL (QCAR |h|) NIL
                   (LIST
                    (CONS (SPADCALL |p| (QCDR |h|) (QREFELT $ 55))
                          (QREFELT $ 12)))
                   (QREFELT $ 60)))
        ((SPADCALL |p| (QREFELT $ 52))
         (SPADCALL (QCAR |h|) (QCDR |u|) NIL (QREFELT $ 60)))
        ('T
         (|error|
          "integrate: implementation incomplete (has polynomial part)")))))))) 

(DEFUN |INTALG;algintprim| (|f| |derivation| $)
  (PROG (|u| |h|)
    (RETURN
     (SEQ
      (LETT |h| (SPADCALL |f| |derivation| (QREFELT $ 45))
            . #1=(|INTALG;algintprim|))
      (EXIT
       (COND
        ((SPADCALL (QCDR |h|) (QREFELT $ 52))
         (SPADCALL (QCAR |h|) (QREFELT $ 54)))
        (#2='T
         (SEQ (LETT |u| (|INTALG;alglogint| (QCDR |h|) |derivation| $) . #1#)
              (EXIT
               (COND
                ((QEQCAR |u| 1)
                 (SPADCALL (QCAR |h|) NIL
                           (LIST (CONS (QCDR |h|) (QREFELT $ 12)))
                           (QREFELT $ 60)))
                (#2#
                 (SPADCALL (QCAR |h|) (QCDR |u|) NIL (QREFELT $ 60))))))))))))) 

(DEFUN |INTALG;find_multiples| (|f1| |lp| $)
  (PROG (|res| |rr| |nfac| #1=#:G203 |nfac_ok| |ndu| |nnu| |facu| |fac| |cp|
         |p| #2=#:G217 |f| |n| |rp1| #3=#:G198 |l| |cp1| |k| |p1|)
    (RETURN
     (SEQ (LETT |p1| (QCAR |f1|) . #4=(|INTALG;find_multiples|))
          (LETT |res| (LIST (VECTOR |p1| (QCDR |f1|) (|spadConstant| $ 62)))
                . #4#)
          (LETT |rr| NIL . #4#) (LETT |k| (SPADCALL |p1| (QREFELT $ 64)) . #4#)
          (LETT |rp1| (SPADCALL |p1| (QREFELT $ 65)) . #4#)
          (SEQ
           (EXIT
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |rp1| (|spadConstant| $ 66) (QREFELT $ 67)))
                   (GO G191)))
                 (SEQ (LETT |cp1| (SPADCALL |rp1| (QREFELT $ 68)) . #4#)
                      (LETT |l| (SPADCALL |rp1| (QREFELT $ 64)) . #4#)
                      (COND
                       ((ODDP (- |k| |l|))
                        (PROGN (LETT #3# |$NoValue| . #4#) (GO #3#))))
                      (EXIT
                       (LETT |rp1| (SPADCALL |rp1| (QREFELT $ 65)) . #4#)))
                 NIL (GO G190) G191 (EXIT NIL)))
           #3# (EXIT #3#))
          (LETT |n| (- |k| |l|) . #4#)
          (SEQ (LETT |f| NIL . #4#) (LETT #2# |lp| . #4#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |rr| (CONS |f| |rr|) . #4#)
                    (LETT |p| (QCAR |f|) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |p| (QREFELT $ 64)) |k|
                                 (QREFELT $ 69))
                       "iterate")
                      ('T
                       (SEQ (LETT |cp| (SPADCALL |p| |l| (QREFELT $ 70)) . #4#)
                            (EXIT
                             (COND
                              ((SPADCALL |cp| (|spadConstant| $ 30)
                                         (QREFELT $ 71))
                               "iterate")
                              ('T
                               (SEQ
                                (LETT |fac|
                                      (SPADCALL |cp| |cp1| (QREFELT $ 72))
                                      . #4#)
                                (LETT |facu| (SPADCALL |fac| (QREFELT $ 74))
                                      . #4#)
                                (EXIT
                                 (COND ((QEQCAR |facu| 1) "iterate")
                                       ('T
                                        (SEQ (LETT |nfac| (QCDR |facu|) . #4#)
                                             (LETT |nfac_ok| 'T . #4#)
                                             (COND
                                              ((SPADCALL |n| 1 (QREFELT $ 77))
                                               (SEQ
                                                (LETT |nnu|
                                                      (SPADCALL
                                                       (SPADCALL |nfac|
                                                                 (QREFELT $
                                                                          78))
                                                       |n| (QREFELT $ 81))
                                                      . #4#)
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |nnu| 1)
                                                   (LETT |nfac_ok| 'NIL . #4#))
                                                  ('T
                                                   (SEQ
                                                    (LETT |ndu|
                                                          (SPADCALL
                                                           (SPADCALL |nfac|
                                                                     (QREFELT $
                                                                              82))
                                                           |n| (QREFELT $ 81))
                                                          . #4#)
                                                    (EXIT
                                                     (COND
                                                      ((QEQCAR |nnu| 1)
                                                       (LETT |nfac_ok| 'NIL
                                                             . #4#))
                                                      ('T
                                                       (LETT |nfac|
                                                             (SPADCALL
                                                              (QCDR |nnu|)
                                                              (PROG2
                                                                  (LETT #1#
                                                                        |ndu|
                                                                        . #4#)
                                                                  (QCDR #1#)
                                                                (|check_union|
                                                                 (QEQCAR #1# 0)
                                                                 (|Integer|)
                                                                 #1#))
                                                              (QREFELT $ 83))
                                                             . #4#)))))))))))
                                             (EXIT
                                              (COND
                                               (|nfac_ok|
                                                (COND
                                                 ((SPADCALL |p1|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |nfac|
                                                                        (QREFELT
                                                                         $ 84))
                                                              (- |k|)
                                                              (QREFELT $ 85))
                                                             (SPADCALL |p|
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |nfac|
                                                                         (QREFELT
                                                                          $
                                                                          84))
                                                                        1
                                                                        (QREFELT
                                                                         $ 86))
                                                                       (QREFELT
                                                                        $ 87))
                                                             (QREFELT $ 88))
                                                            (QREFELT $ 67))
                                                  "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |res|
                                                         (CONS
                                                          (VECTOR |p|
                                                                  (QCDR |f|)
                                                                  |nfac|)
                                                          |res|)
                                                         . #4#)
                                                   (EXIT
                                                    (LETT |rr| (CDR |rr|)
                                                          . #4#))))))
                                               ('T "iterate"))))))))))))))))
               (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |res| (NREVERSE |res|) . #4#) (EXIT (CONS |res| |rr|)))))) 

(DEFUN |INTALG;handle_multiples1| (|rec| |lp| |cc| $)
  (PROG (|llg| |nlog| |nlp| |pc2| |rc| |di| |di2| |di1| |na| |nfac| #1=#:G233
         |peq| |alpha| |p| |pc1|)
    (RETURN
     (SEQ (LETT |nlp| NIL . #2=(|INTALG;handle_multiples1|))
          (LETT |llg| NIL . #2#) (LETT |pc1| (|SPADfirst| |lp|) . #2#)
          (LETT |p| (QVELT |pc1| 0) . #2#)
          (LETT |alpha| (SPADCALL (|INTALG;UP2SUP| |p| $) (QREFELT $ 90))
                . #2#)
          (SEQ (LETT |peq| NIL . #2#) (LETT #1# |lp| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |peq| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |nfac| (QVELT |peq| 2) . #2#)
                    (LETT |na|
                          (SPADCALL (SPADCALL |nfac| (QREFELT $ 84)) |alpha|
                                    (QREFELT $ 91))
                          . #2#)
                    (LETT |di1|
                          (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1)
                                    (QVELT |rec| 2) (QVELT |rec| 3) |na|
                                    (QREFELT $ 93))
                          . #2#)
                    (LETT |di2|
                          (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1)
                                    (QVELT |rec| 2) (QVELT |rec| 3)
                                    (SPADCALL |na| (QREFELT $ 94))
                                    (QREFELT $ 93))
                          . #2#)
                    (LETT |di| (SPADCALL |di1| |di2| (QREFELT $ 95)) . #2#)
                    (LETT |rc| (SPADCALL |di| (QREFELT $ 99)) . #2#)
                    (EXIT
                     (COND
                      ((QEQCAR |rc| 1)
                       (SEQ
                        (LETT |pc2|
                              (VECTOR (QVELT |peq| 0) (QVELT |peq| 1)
                                      (QVELT |peq| 2)
                                      (SPADCALL |na|
                                                (SPADCALL |cc| (QREFELT $ 100))
                                                (QREFELT $ 72))
                                      |di|)
                              . #2#)
                        (EXIT (LETT |nlp| (CONS |pc2| |nlp|) . #2#))))
                      ('T
                       (SEQ
                        (LETT |nlog|
                              (|INTALG;mkLog| |p|
                               (SPADCALL
                                (SPADCALL |cc|
                                          (SPADCALL (QCAR (QCDR |rc|))
                                                    (QREFELT $ 101))
                                          (QREFELT $ 102))
                                (QREFELT $ 103))
                               (QCDR (QCDR |rc|)) |na| $)
                              . #2#)
                        (EXIT
                         (LETT |llg| (SPADCALL |nlog| |llg| (QREFELT $ 104))
                               . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |llg| |nlp| NIL)))))) 

(DEFUN |INTALG;handle_multiples| (|rec| |lp| $)
  (PROG (#1=#:G252 |ff| |fu| |nfac| #2=#:G255 |peq| |lp1| #3=#:G254 #4=#:G253
         |llg| |nlp| |p| |pc1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |pc1| (|SPADfirst| |lp|) . #5=(|INTALG;handle_multiples|))
            (LETT |p| (QVELT |pc1| 0) . #5#) (LETT |nlp| NIL . #5#)
            (LETT |llg| NIL . #5#)
            (EXIT
             (COND
              ((SPADCALL |p|
                         (SPADCALL |p|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 76)
                                              (QREFELT $ 94))
                                    1 (QREFELT $ 86))
                                   (QREFELT $ 87))
                         (QREFELT $ 105))
               (|INTALG;handle_multiples1| |rec| |lp| 2 $))
              (#6='T
               (SEQ
                (LETT |lp1|
                      (PROGN
                       (LETT #4# NIL . #5#)
                       (SEQ (LETT |peq| NIL . #5#) (LETT #3# |lp| . #5#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |peq| (CAR #3#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL (QVELT |peq| 2)
                                          (|spadConstant| $ 106)
                                          (QREFELT $ 107))
                                (LETT #4# (CONS |peq| #4#) . #5#)))))
                            (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      . #5#)
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |lp|)
                             (SPADCALL 2 (LENGTH |lp1|) (QREFELT $ 109))
                             (QREFELT $ 69))
                   (VECTOR NIL NIL |lp|))
                  (#6#
                   (SEQ
                    (SEQ (LETT |peq| NIL . #5#) (LETT #2# |lp1| . #5#) G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |peq| (CAR #2#) . #5#) NIL))
                           (GO G191)))
                         (SEQ (LETT |nfac| (QVELT |peq| 2) . #5#)
                              (LETT |fu|
                                    (SPADCALL
                                     (CONS #'|INTALG;handle_multiples!0|
                                           (VECTOR $ |nfac|))
                                     |lp| (QREFELT $ 116))
                                    . #5#)
                              (EXIT
                               (COND
                                ((QEQCAR |fu| 1)
                                 (PROGN
                                  (LETT #1# (VECTOR NIL NIL |lp|) . #5#)
                                  (GO #1#)))
                                ('T
                                 (SEQ (LETT |ff| (QCDR |fu|) . #5#)
                                      (EXIT
                                       (COND
                                        ((SPADCALL (QVELT |ff| 1)
                                                   (QVELT |peq| 1)
                                                   (QREFELT $ 117))
                                         (PROGN
                                          (LETT #1# (VECTOR NIL NIL |lp|)
                                                . #5#)
                                          (GO #1#))))))))))
                         (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (|INTALG;handle_multiples1| |rec| |lp1| 1 $))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |INTALG;handle_multiples!0| (|x| $$)
  (PROG (|nfac| $)
    (LETT |nfac| (QREFELT $$ 1) . #1=(|INTALG;handle_multiples|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (QVELT |x| 2) (SPADCALL |nfac| (QREFELT $ 110))
                (QREFELT $ 111)))))) 

(DEFUN |INTALG;classify_divisors| (|rec| |r| $)
  (PROG (|nlm2| |nlp2| |nlm1| |nlp1| |llg| |rr2| #1=#:G270 |lp| |lm| |lf| |rp|
         |lf2| |u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL (SPADCALL |r| (QREFELT $ 118)) (QREFELT $ 121))
            . #2=(|INTALG;classify_divisors|))
      (LETT |lf| (SPADCALL |u| (QREFELT $ 124)) . #2#)
      (LETT |lf2| (CDR |lf|) . #2#) (LETT |lm| NIL . #2#)
      (SEQ G190 (COND ((NULL (COND ((NULL |lf|) 'NIL) ('T 'T))) (GO G191)))
           (SEQ
            (LETT |rp|
                  (|INTALG;find_multiples| (|SPADfirst| |lf|) (CDR |lf|) $)
                  . #2#)
            (LETT |lf| (QCDR |rp|) . #2#)
            (EXIT (LETT |lm| (CONS (QCAR |rp|) |lm|) . #2#)))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT |llg| NIL . #2#) (LETT |nlm1| NIL . #2#) (LETT |nlm2| NIL . #2#)
      (SEQ (LETT |lp| NIL . #2#) (LETT #1# |lm| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |lp| (CAR #1#) . #2#) NIL))
             (GO G191)))
           (SEQ (LETT |rr2| (|INTALG;handle_multiples| |rec| |lp| $) . #2#)
                (LETT |llg| (SPADCALL (QVELT |rr2| 0) |llg| (QREFELT $ 104))
                      . #2#)
                (COND
                 ((NULL (NULL (LETT |nlp1| (QVELT |rr2| 1) . #2#)))
                  (LETT |nlm1| (CONS |nlp1| |nlm1|) . #2#)))
                (EXIT
                 (COND
                  ((NULL (NULL (LETT |nlp2| (QVELT |rr2| 2) . #2#)))
                   (LETT |nlm2| (CONS |nlp2| |nlm2|) . #2#)))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT (VECTOR |llg| |nlm1| |nlm2|)))))) 

(DEFUN |INTALG;get_lf| (|ll1| |ll2| $)
  (PROG (#1=#:G285 |peq| #2=#:G284 #3=#:G283 #4=#:G282)
    (RETURN
     (SEQ (COND ((NULL |ll1|) (COND ((NULL |ll2|) (EXIT NIL)))))
          (EXIT
           (COND
            ((SPADCALL (+ (LENGTH |ll1|) (LENGTH |ll2|)) 1 (QREFELT $ 125))
             (|error|
              "integrate: implementation incomplete (irrational residues)"))
            ((NULL |ll1|)
             (PROGN
              (LETT #4# NIL . #5=(|INTALG;get_lf|))
              (SEQ (LETT |peq| NIL . #5#) (LETT #3# (|SPADfirst| |ll2|) . #5#)
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |peq| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT #4# (CONS (QVELT |peq| 0) #4#) . #5#)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                   (EXIT (NREVERSE #4#)))))
            ('T
             (PROGN
              (LETT #2# NIL . #5#)
              (SEQ (LETT |peq| NIL . #5#) (LETT #1# (|SPADfirst| |ll1|) . #5#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |peq| (CAR #1#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT #2# (CONS (QVELT |peq| 0) #2#) . #5#)))
                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))))))))) 

(DEFUN |INTALG;get_la| (|ll1| |ll2| $)
  (PROG (#1=#:G291 |lfac| #2=#:G290)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|INTALG;get_la|))
       (SEQ (LETT |lfac| NIL . #3#)
            (LETT #1# (|INTALG;get_lf| |ll1| |ll2| $) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |lfac| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS
                     (SPADCALL (SPADCALL |lfac| 0 (QREFELT $ 70))
                               (QREFELT $ 94))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |INTALG;get_ld| (|rec| |ll1| |ll2| $)
  (PROG (#1=#:G307 |peq| #2=#:G306 #3=#:G305 |a| #4=#:G304)
    (RETURN
     (SEQ (COND ((NULL |ll1|) (COND ((NULL |ll2|) (EXIT NIL)))))
          (EXIT
           (COND
            ((SPADCALL (+ (LENGTH |ll1|) (LENGTH |ll2|)) 1 (QREFELT $ 125))
             (|error|
              "integrate: implementation incomplete (irrational residues)"))
            ((NULL |ll1|)
             (PROGN
              (LETT #4# NIL . #5=(|INTALG;get_ld|))
              (SEQ (LETT |a| NIL . #5#)
                   (LETT #3# (|INTALG;get_la| |ll1| |ll2| $) . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #4#
                           (CONS
                            (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1)
                                      (QVELT |rec| 2) (QVELT |rec| 3) |a|
                                      (QREFELT $ 93))
                            #4#)
                           . #5#)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                   (EXIT (NREVERSE #4#)))))
            ('T
             (PROGN
              (LETT #2# NIL . #5#)
              (SEQ (LETT |peq| NIL . #5#) (LETT #1# (|SPADfirst| |ll1|) . #5#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |peq| (CAR #1#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT #2# (CONS (QVELT |peq| 4) #2#) . #5#)))
                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))))))))) 

(DEFUN |INTALG;palglogint| (|f| |derivation| $)
  (PROG (|tr1u| |v1| |alpha| |ld| |la| |bb| #1=#:G366 |fcf| |lins2| |fc2|
         |nfl2| #2=#:G343 |lins1| |fc1| |nfl1| #3=#:G380 |nfl| #4=#:G379
         #5=#:G378 #6=#:G377 |nlins2| #7=#:G376 #8=#:G375 |nlins1| #9=#:G374
         #10=#:G373 |nfacs2| |nfacs1| |ppr| |r| |rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL |f| |derivation| (QREFELT $ 127))
            . #11=(|INTALG;palglogint|))
      (EXIT
       (COND
        ((SPADCALL
          (LETT |r| (SPADCALL |f| |derivation| (QREFELT $ 129)) . #11#)
          (QREFELT $ 130))
         (CONS 1 "failed"))
        (#12='T
         (SEQ (LETT |ppr| (|INTALG;classify_divisors| |rec| |r| $) . #11#)
              (LETT |nfacs1| (QVELT |ppr| 1) . #11#)
              (LETT |nfacs2| (QVELT |ppr| 2) . #11#)
              (COND
               ((NULL |nfacs1|)
                (COND ((NULL |nfacs2|) (EXIT (CONS 0 (QVELT |ppr| 0)))))))
              (LETT |nlins1|
                    (PROGN
                     (LETT #10# NIL . #11#)
                     (SEQ (LETT |nfl| NIL . #11#) (LETT #9# |nfacs1| . #11#)
                          G190
                          (COND
                           ((OR (ATOM #9#)
                                (PROGN (LETT |nfl| (CAR #9#) . #11#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL (QVELT (|SPADfirst| |nfl|) 0)
                                         (QREFELT $ 64))
                               1 (QREFELT $ 125))
                              (LETT #10# (CONS |nfl| #10#) . #11#)))))
                          (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                          (EXIT (NREVERSE #10#))))
                    . #11#)
              (LETT |nlins2|
                    (PROGN
                     (LETT #8# NIL . #11#)
                     (SEQ (LETT |nfl| NIL . #11#) (LETT #7# |nfacs2| . #11#)
                          G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |nfl| (CAR #7#) . #11#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL (QVELT (|SPADfirst| |nfl|) 0)
                                         (QREFELT $ 64))
                               1 (QREFELT $ 125))
                              (LETT #8# (CONS |nfl| #8#) . #11#)))))
                          (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    . #11#)
              (EXIT
               (COND
                ((SPADCALL (+ (LENGTH |nlins1|) (LENGTH |nlins2|)) 1
                           (QREFELT $ 125))
                 (|error|
                  #13="integrate: implementation incomplete (residue poly has multiple non-linear factors)"))
                (#12#
                 (SEQ
                  (LETT |lins1|
                        (PROGN
                         (LETT #6# NIL . #11#)
                         (SEQ (LETT |nfl| NIL . #11#)
                              (LETT #5# |nfacs1| . #11#) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |nfl| (CAR #5#) . #11#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((EQL
                                   (SPADCALL (QVELT (|SPADfirst| |nfl|) 0)
                                             (QREFELT $ 64))
                                   1)
                                  (LETT #6# (CONS |nfl| #6#) . #11#)))))
                              (LETT #5# (CDR #5#) . #11#) (GO G190) G191
                              (EXIT (NREVERSE #6#))))
                        . #11#)
                  (LETT |lins2|
                        (PROGN
                         (LETT #4# NIL . #11#)
                         (SEQ (LETT |nfl| NIL . #11#)
                              (LETT #3# |nfacs2| . #11#) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |nfl| (CAR #3#) . #11#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((EQL
                                   (SPADCALL (QVELT (|SPADfirst| |nfl|) 0)
                                             (QREFELT $ 64))
                                   1)
                                  (LETT #4# (CONS |nfl| #4#) . #11#)))))
                              (LETT #3# (CDR #3#) . #11#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #11#)
                  (COND
                   ((NULL |nfacs2|)
                    (COND
                     ((NULL |nlins1|)
                      (COND
                       ((EQL (LENGTH |lins1|) 1) (EXIT (CONS 1 "failed"))))))))
                  (COND
                   ((SPADCALL (LENGTH |nfacs1|) 0 (QREFELT $ 125))
                    (COND
                     ((EQL (LENGTH |nlins2|) 0)
                      (EXIT
                       (SEQ
                        (COND
                         ((EQL (LENGTH |nlins1|) 1)
                          (SEQ (LETT |nfl1| (|SPADfirst| |nlins1|) . #11#)
                               (COND
                                ((NULL (NULL (CDR |nfl1|)))
                                 (EXIT (|error| #13#))))
                               (LETT |fc1| (|SPADfirst| |nfl1|) . #11#)
                               (EXIT (LETT |fcf| (QVELT |fc1| 0) . #11#))))
                         ((SPADCALL (LENGTH |lins1|) 1 (QREFELT $ 125))
                          (|error|
                           #14="integrate: implementation incomplete (irrational residues)"))
                         (#12#
                          (SEQ (LETT |nfl1| (|SPADfirst| |lins1|) . #11#)
                               (EXIT
                                (COND ((NULL (CDR |nfl1|)) (|error| #14#))
                                      (#12#
                                       (SEQ
                                        (LETT |fc1| (|SPADfirst| |nfl1|)
                                              . #11#)
                                        (LETT |fcf| (QVELT |fc1| 0) . #11#)
                                        (EXIT
                                         (LETT |lins1| (LIST (CDR |nfl1|))
                                               . #11#)))))))))
                        (EXIT
                         (COND
                          ((SPADCALL
                            (LETT |bb|
                                  (SPADCALL |fcf|
                                            (PROG1
                                                (LETT #2#
                                                      (-
                                                       (SPADCALL |fcf|
                                                                 (QREFELT $
                                                                          64))
                                                       1)
                                                      . #11#)
                                              (|check_subtype| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               #2#))
                                            (QREFELT $ 70))
                                  . #11#)
                            (QREFELT $ 131))
                           (COND
                            ((SPADCALL |fcf|
                                       (SPADCALL |fcf|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (|spadConstant| $ 76)
                                                   (QREFELT $ 94))
                                                  1 (QREFELT $ 86))
                                                 (QREFELT $ 87))
                                       (QREFELT $ 105))
                             (COND
                              ((EQL (SPADCALL |fcf| (QREFELT $ 64)) 2)
                               (CONS 1 "failed"))
                              (#12#
                               (SEQ
                                (COND
                                 ((NULL |nfacs2|)
                                  (COND
                                   ((EQL (LENGTH |nfacs1|) 1)
                                    (COND
                                     ((EQL (SPADCALL |fcf| (QREFELT $ 64)) 4)
                                      (EXIT (CONS 1 "failed"))))))))
                                (EXIT
                                 (|error|
                                  #15="Not integrable (provided residues have no relations)"))))))
                            (#12# (|error| #15#))))
                          (#12#
                           (SEQ
                            (LETT |la| (|INTALG;get_la| |lins1| |lins2| $)
                                  . #11#)
                            (LETT |ld|
                                  (|INTALG;get_ld| |rec| |lins1| |lins2| $)
                                  . #11#)
                            (LETT |tr1u|
                                  (|INTALG;trace1| |fcf| |la| |ld|
                                   (QVELT |fc1| 4) (QVELT |fc1| 3) |bb| $)
                                  . #11#)
                            (EXIT
                             (COND ((QEQCAR |tr1u| 1) (CONS 1 "failed"))
                                   (#12#
                                    (CONS 0
                                          (SPADCALL (QVELT |ppr| 0)
                                                    (QCDR |tr1u|)
                                                    (QREFELT $
                                                             104))))))))))))))))
                  (EXIT
                   (COND
                    ((SPADCALL (+ (LENGTH |lins1|) (LENGTH |lins2|)) 1
                               (QREFELT $ 77))
                     (|error| #14#))
                    (#12#
                     (SEQ
                      (COND
                       ((EQL (LENGTH |nlins2|) 1)
                        (SEQ (LETT |nfl2| (|SPADfirst| |nlins2|) . #11#)
                             (COND
                              ((NULL (NULL (CDR |nfl2|)))
                               (EXIT (|error| #13#))))
                             (EXIT (LETT |fc2| (|SPADfirst| |nfl2|) . #11#))))
                       ((SPADCALL (LENGTH |lins2|) 1 (QREFELT $ 77))
                        (|error| #14#))
                       (#12#
                        (SEQ (LETT |nfl2| (|SPADfirst| |lins2|) . #11#)
                             (LETT |fc2| (|SPADfirst| |nfl2|) . #11#)
                             (EXIT
                              (LETT |lins2| (LIST (CDR |nfl2|)) . #11#)))))
                      (LETT |fcf| (QVELT |fc2| 0) . #11#)
                      (EXIT
                       (COND
                        ((SPADCALL
                          (LETT |bb|
                                (SPADCALL |fcf|
                                          (PROG1
                                              (LETT #1#
                                                    (-
                                                     (SPADCALL |fcf|
                                                               (QREFELT $ 64))
                                                     1)
                                                    . #11#)
                                            (|check_subtype| (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             #1#))
                                          (QREFELT $ 70))
                                . #11#)
                          (QREFELT $ 131))
                         (|error| "impossible"))
                        (#12#
                         (SEQ
                          (LETT |la| (|INTALG;get_la| |lins1| |lins2| $)
                                . #11#)
                          (LETT |ld| (|INTALG;get_ld| |rec| |lins1| |lins2| $)
                                . #11#)
                          (LETT |alpha|
                                (SPADCALL (|INTALG;UP2SUP| |fcf| $)
                                          (QREFELT $ 90))
                                . #11#)
                          (LETT |v1|
                                (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1)
                                          (QVELT |rec| 2) (QVELT |rec| 3)
                                          |alpha| (QREFELT $ 93))
                                . #11#)
                          (LETT |tr1u|
                                (|INTALG;trace1| |fcf| |la| |ld| |v1| |alpha|
                                 |bb| $)
                                . #11#)
                          (EXIT
                           (COND ((QEQCAR |tr1u| 1) (CONS 1 "failed"))
                                 (#12#
                                  (CONS 0
                                        (SPADCALL (QVELT |ppr| 0) (QCDR |tr1u|)
                                                  (QREFELT $
                                                           104)))))))))))))))))))))))))) 

(DEFUN |INTALG;UPQ2F| (|p| $) (SPADCALL (ELT $ 84) |p| (QREFELT $ 135))) 

(DEFUN |INTALG;UP2SUP| (|p| $)
  (SPADCALL (LIST #'|INTALG;UP2SUP!0|) |p| (QREFELT $ 139))) 

(DEFUN |INTALG;UP2SUP!0| (|x| $$) |x|) 

(DEFUN |INTALG;SUP2UP| (|p| $)
  (SPADCALL (LIST #'|INTALG;SUP2UP!0|) |p| (QREFELT $ 141))) 

(DEFUN |INTALG;SUP2UP!0| (|x| $$) |x|) 

(DEFUN |INTALG;varRoot?| (|p| |derivation| $)
  (PROG (#1=#:G387 #2=#:G389 #3=#:G390 |c|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |c| NIL . #4=(|INTALG;varRoot?|))
               (LETT #3#
                     (SPADCALL (SPADCALL |p| (QREFELT $ 118)) (QREFELT $ 143))
                     . #4#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |c| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |c| |derivation|) (|spadConstant| $ 30)
                             (QREFELT $ 144))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |INTALG;pLogDeriv| (|log| |derivation| $)
  (PROG (|ans| |algans| #1=#:G415 |i| |diflog| |numlog| |c| |n|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |derivation| (QVELT |log| 1) (QREFELT $ 146))
                  (|spadConstant| $ 147) (QREFELT $ 148))
        (|error| "can only handle logs with constant coefficients"))
       (#2='T
        (SEQ
         (LETT |n| (SPADCALL (QVELT |log| 1) (QREFELT $ 149))
               . #3=(|INTALG;pLogDeriv|))
         (EXIT
          (COND
           ((EQL |n| 1)
            (SEQ
             (LETT |c|
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL (QVELT |log| 1) (QREFELT $ 150))
                               (QREFELT $ 151))
                     (SPADCALL (QVELT |log| 1) (QREFELT $ 151))
                     (QREFELT $ 152))
                    (QREFELT $ 153))
                   . #3#)
             (LETT |ans| (SPADCALL (QVELT |log| 2) |c| (QREFELT $ 154)) . #3#)
             (EXIT
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL (QVELT |log| 0) (QREFELT $ 155)) |c|
                          (QREFELT $ 156))
                (SPADCALL |ans| |derivation|) (QREFELT $ 156))
               |ans| (QREFELT $ 152)))))
           (#2#
            (SEQ
             (LETT |numlog|
                   (SPADCALL |derivation| (QVELT |log| 2) (QREFELT $ 146))
                   . #3#)
             (LETT |diflog|
                   (SPADCALL (QVELT |log| 2) (QVELT |log| 1) |numlog|
                             (QREFELT $ 159))
                   . #3#)
             (EXIT
              (COND ((QEQCAR |diflog| 1) (|error| "this shouldn't happen"))
                    (#2#
                     (SEQ (LETT |algans| (QCAR (QCDR |diflog|)) . #3#)
                          (LETT |ans| (|spadConstant| $ 11) . #3#)
                          (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |n| 1) . #3#)
                               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                               (SEQ
                                (LETT |algans|
                                      (SPADCALL
                                       (SPADCALL |algans|
                                                 (SPADCALL
                                                  (|spadConstant| $ 160) 1
                                                  (QREFELT $ 161))
                                                 (QREFELT $ 162))
                                       (QVELT |log| 1) (QREFELT $ 163))
                                      . #3#)
                                (EXIT
                                 (LETT |ans|
                                       (SPADCALL |ans|
                                                 (SPADCALL |algans| |i|
                                                           (QREFELT $ 164))
                                                 (QREFELT $ 55))
                                       . #3#)))
                               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (SPADCALL (SPADCALL (QVELT |log| 0) (QREFELT $ 155))
                                     |ans| (QREFELT $ 156)))))))))))))))))) 

(DEFUN |INTALG;R2UP| (|f| |k| $)
  (PROG (|g| |y| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (QREFELT $ 17) (QREFELT $ 166)) . #1=(|INTALG;R2UP|))
      (LETT |g|
            (SPADCALL
             (SPADCALL (CONS #'|INTALG;R2UP!0| (VECTOR $ |x|))
                       (SPADCALL |f| (QREFELT $ 169)) (QREFELT $ 172))
             (LETT |y| (SPADCALL (QREFELT $ 18) (QREFELT $ 166)) . #1#)
             (QREFELT $ 173))
            . #1#)
      (EXIT
       (SPADCALL
        (CONS #'|INTALG;R2UP!1| (VECTOR $ (QREFELT $ 18) (QREFELT $ 17)))
        (SPADCALL |g| |k| (SPADCALL |k| (QREFELT $ 174)) (QREFELT $ 176))
        (QREFELT $ 179))))))) 

(DEFUN |INTALG;R2UP!1| (|x1| $$)
  (PROG (|dumx| |dumy| $)
    (LETT |dumx| (QREFELT $$ 2) . #1=(|INTALG;R2UP|))
    (LETT |dumy| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|INTALG;rlift| |x1| |dumx| |dumy| $))))) 

(DEFUN |INTALG;R2UP!0| (|f1| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTALG;R2UP|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |f1| |x| (QREFELT $ 168)))))) 

(DEFUN |INTALG;univ| (|f| |k| $)
  (PROG (|g|)
    (RETURN
     (SEQ (LETT |g| (SPADCALL |f| |k| (QREFELT $ 181)) |INTALG;univ|)
          (EXIT
           (SPADCALL (|INTALG;SUP2UP| (SPADCALL |g| (QREFELT $ 183)) $)
                     (|INTALG;SUP2UP| (SPADCALL |g| (QREFELT $ 184)) $)
                     (QREFELT $ 35))))))) 

(DEFUN |INTALG;rlift| (|f| |kx| |ky| $)
  (PROG (|uf|)
    (RETURN
     (SEQ (LETT |uf| (SPADCALL |f| |ky| (QREFELT $ 181)) |INTALG;rlift|)
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTALG;rlift!0| (VECTOR $ |kx|))
                      (SPADCALL |uf| (QREFELT $ 185)) (QREFELT $ 188))
            (QREFELT $ 189))))))) 

(DEFUN |INTALG;rlift!0| (|x1| $$)
  (PROG (|kx| $)
    (LETT |kx| (QREFELT $$ 1) . #1=(|INTALG;rlift|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|INTALG;univ| |x1| |kx| $))))) 

(DEFUN |INTALG;trace1| (|q| |la| |ld| |v1| |alpha| |b| $)
  (PROG (|rc| |v2| |v0| #1=#:G433 #2=#:G432 #3=#:G434 #4=#:G444 |a| #5=#:G445
         |dv| |cd| #6=#:G443 #7=#:G442)
    (RETURN
     (SEQ
      (LETT |cd|
            (SPADCALL
             (PROGN
              (LETT #7# NIL . #8=(|INTALG;trace1|))
              (SEQ (LETT |a| NIL . #8#) (LETT #6# |la| . #8#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |a| (CAR #6#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #7#
                           (CONS
                            (SPADCALL (SPADCALL |a| |b| (QREFELT $ 72))
                                      (QREFELT $ 190))
                            #7#)
                           . #8#)))
                   (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                   (EXIT (NREVERSE #7#))))
             (QREFELT $ 194))
            . #8#)
      (LETT |v0|
            (PROGN
             (LETT #1# NIL . #8#)
             (SEQ (LETT |dv| NIL . #8#) (LETT #5# |ld| . #8#)
                  (LETT |a| NIL . #8#) (LETT #4# (QCAR |cd|) . #8#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#) . #8#) NIL)
                        (ATOM #5#) (PROGN (LETT |dv| (CAR #5#) . #8#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3# (SPADCALL |a| |dv| (QREFELT $ 195)) . #8#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 196)) . #8#))
                      ('T (PROGN (LETT #2# #3# . #8#) (LETT #1# 'T . #8#)))))))
                  (LETT #4# (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #8#)) . #8#)
                  (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#9='T (|spadConstant| $ 197))))
            . #8#)
      (LETT |v2|
            (SPADCALL |v0| (SPADCALL (QCDR |cd|) |v1| (QREFELT $ 195))
                      (QREFELT $ 95))
            . #8#)
      (LETT |rc| (SPADCALL |v2| (QREFELT $ 99)) . #8#)
      (EXIT
       (COND
        ((QEQCAR |rc| 1)
         (COND
          ((SPADCALL (SPADCALL |q| (QREFELT $ 64)) 2 (QREFELT $ 198))
           (CONS 1 "failed"))
          (#9#
           (|error| "Not integrable (provided residues have no relations)"))))
        (#9#
         (CONS 0
               (|INTALG;mkLog| |q|
                (SPADCALL
                 (SPADCALL (- (* (QCAR (QCDR |rc|)) (QCDR |cd|)))
                           (QREFELT $ 101))
                 (QREFELT $ 103))
                (QCDR (QCDR |rc|)) |alpha| $))))))))) 

(DEFUN |INTALG;mkLog| (|q| |scalr| |lgd| |alpha| $)
  (COND
   ((SPADCALL (SPADCALL |q| (QREFELT $ 64)) 1 (QREFELT $ 198))
    (LIST
     (VECTOR |scalr|
             (SPADCALL (SPADCALL (|spadConstant| $ 160) 1 (QREFELT $ 161))
                       (|INTALG;F2UPR| |alpha| $) (QREFELT $ 199))
             (SPADCALL |lgd| (QREFELT $ 20)))))
   ('T
    (LIST
     (VECTOR |scalr|
             (SPADCALL (CONS (|function| |INTALG;F2R|) $) |q| (QREFELT $ 201))
             (|INTALG;R2UP| |lgd| (SPADCALL |alpha| (QREFELT $ 202)) $)))))) 

(DEFUN |INTALG;nonLinear| (|l| $)
  (PROG (|ans| |found| #1=#:G458 #2=#:G459 |q|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |found| 'NIL . #3=(|INTALG;nonLinear|))
            (LETT |ans| (|SPADfirst| |l|) . #3#)
            (SEQ (LETT |q| NIL . #3#) (LETT #2# |l| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |q| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL (QCAR |q|) (QREFELT $ 203)) 1
                               (QREFELT $ 125))
                     (COND
                      (|found|
                       (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                      ('T
                       (SEQ (LETT |found| 'T . #3#)
                            (EXIT (LETT |ans| |q| . #3#)))))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ans|))))
      #1# (EXIT #1#))))) 

(DEFUN |INTALG;palginfieldint;RMU;24| (|f| |derivation| $)
  (PROG (|h|)
    (RETURN
     (SEQ
      (LETT |h| (SPADCALL |f| |derivation| (QREFELT $ 45))
            |INTALG;palginfieldint;RMU;24|)
      (EXIT
       (COND ((SPADCALL (QCDR |h|) (QREFELT $ 52)) (CONS 0 (QCAR |h|)))
             ('T (CONS 1 "failed")))))))) 

(DEFUN |INTALG;palgextintegrate;RMUPUP2FU;25|
       (|f| |derivation| |g| |c1| |c2| $)
  (PROG (|cu3| |cu2| |cr| |c| |cu0| |lp1| |lp| |dcdx| |dder| |denc| |nder|
         |numc| |h|)
    (RETURN
     (SEQ
      (LETT |h| (SPADCALL |f| |derivation| (QREFELT $ 45))
            . #1=(|INTALG;palgextintegrate;RMUPUP2FU;25|))
      (EXIT
       (COND
        ((SPADCALL (QCDR |h|) (QREFELT $ 52))
         (CONS 0 (CONS (QCAR |h|) (|spadConstant| $ 30))))
        (#2='T
         (SEQ (LETT |numc| (SPADCALL |c1| (QREFELT $ 206)) . #1#)
              (LETT |nder| (SPADCALL |numc| |derivation|) . #1#)
              (LETT |denc| (SPADCALL |c1| (QREFELT $ 207)) . #1#)
              (LETT |dder| (SPADCALL |denc| |derivation|) . #1#)
              (LETT |dcdx|
                    (SPADCALL
                     (SPADCALL (SPADCALL |nder| |denc| (QREFELT $ 208))
                               (SPADCALL |numc| |dder| (QREFELT $ 208))
                               (QREFELT $ 209))
                     (SPADCALL
                      (SPADCALL (SPADCALL |denc| (QREFELT $ 23))
                                (QREFELT $ 210))
                      2 (QREFELT $ 211))
                     (QREFELT $ 212))
                    . #1#)
              (LETT |lp| (SPADCALL (QCDR |h|) (QREFELT $ 169)) . #1#)
              (LETT |lp1|
                    (SPADCALL |dcdx| (SPADCALL |lp| |c1| |c2| (QREFELT $ 214))
                              (QREFELT $ 215))
                    . #1#)
              (LETT |cu0| (SPADCALL |lp1| |g| (QREFELT $ 217)) . #1#)
              (EXIT
               (COND ((QEQCAR |cu0| 1) (CONS 1 "failed"))
                     (#2#
                      (SEQ (LETT |c| (QCDR |cu0|) . #1#)
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |c| (QREFELT $ 218)) 0
                                        (QREFELT $ 77))
                              (CONS 1 "failed"))
                             (#2#
                              (SEQ
                               (LETT |cr| (SPADCALL |c| (QREFELT $ 219)) . #1#)
                               (LETT |cu2| (SPADCALL |cr| (QREFELT $ 221))
                                     . #1#)
                               (EXIT
                                (COND ((QEQCAR |cu2| 1) (CONS 1 "failed"))
                                      (#2#
                                       (SEQ
                                        (LETT |cu3|
                                              (SPADCALL (QCDR |cu2|)
                                                        (QREFELT $ 223))
                                              . #1#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |cu3| 1) (CONS 1 "failed"))
                                          (#2#
                                           (CONS 0
                                                 (CONS (QCAR |h|)
                                                       (QCDR
                                                        |cu3|)))))))))))))))))))))))))) 

(DEFUN |INTALG;palgintegrate;RMIr;26| (|f| |derivation| $)
  (PROG (|difFirstKind| #1=#:G556 #2=#:G555 #3=#:G557 #4=#:G563 |lg| #5=#:G560
         |u| |h|)
    (RETURN
     (SEQ
      (LETT |h| (SPADCALL |f| |derivation| (QREFELT $ 45))
            . #6=(|INTALG;palgintegrate;RMIr;26|))
      (EXIT
       (COND
        ((SPADCALL (QCDR |h|) (QREFELT $ 52))
         (SPADCALL (QCAR |h|) (QREFELT $ 54)))
        (#7='T
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (QCDR |h|) (QREFELT $ 227))
              (SEQ
               (LETT |u| (|INTALG;palglogint| (QCDR |h|) |derivation| $) . #6#)
               (EXIT
                (COND
                 ((QEQCAR |u| 1)
                  (PROGN
                   (LETT #5#
                         (SPADCALL (QCAR |h|) NIL
                                   (LIST (CONS (QCDR |h|) (QREFELT $ 12)))
                                   (QREFELT $ 60))
                         . #6#)
                   (GO #5#)))))))
             (#7#
              (EXIT
               (SPADCALL (QCAR |h|) NIL (LIST (CONS (QCDR |h|) (QREFELT $ 12)))
                         (QREFELT $ 60)))))
            (EXIT
             (COND
              ((SPADCALL
                (LETT |difFirstKind|
                      (SPADCALL (QCDR |h|)
                                (PROGN
                                 (LETT #1# NIL . #6#)
                                 (SEQ (LETT |lg| NIL . #6#)
                                      (LETT #4# (QCDR |u|) . #6#) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN
                                             (LETT |lg| (CAR #4#) . #6#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (PROGN
                                         (LETT #3#
                                               (|INTALG;pLogDeriv| |lg|
                                                (CONS
                                                 #'|INTALG;palgintegrate;RMIr;26!0|
                                                 (VECTOR $ |derivation|))
                                                $)
                                               . #6#)
                                         (COND
                                          (#1#
                                           (LETT #2#
                                                 (SPADCALL #2# #3#
                                                           (QREFELT $ 55))
                                                 . #6#))
                                          ('T
                                           (PROGN
                                            (LETT #2# #3# . #6#)
                                            (LETT #1# 'T . #6#)))))))
                                      (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                                      (EXIT NIL))
                                 (COND (#1# #2#) (#7# (|spadConstant| $ 11))))
                                (QREFELT $ 229))
                      . #6#)
                (QREFELT $ 52))
               (SPADCALL (QCAR |h|) (QCDR |u|) NIL (QREFELT $ 60)))
              (#7#
               (SPADCALL (QCAR |h|) (QCDR |u|)
                         (LIST (CONS |difFirstKind| (QREFELT $ 12)))
                         (QREFELT $ 60)))))))
          #5# (EXIT #5#))))))))) 

(DEFUN |INTALG;palgintegrate;RMIr;26!0| (|x1| $$)
  (PROG (|derivation| $)
    (LETT |derivation| (QREFELT $$ 1) . #1=(|INTALG;palgintegrate;RMIr;26|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |derivation| (QREFELT $ 228)))))) 

(DEFUN |INTALG;algintegrate;RMIr;27| (|f| |derivation| $)
  (PROG (#1=#:G574 |xx| |x'| |x|)
    (RETURN
     (SEQ
      (LETT |x'|
            (SPADCALL
             (LETT |x| (SPADCALL (|spadConstant| $ 76) 1 (QREFELT $ 86))
                   . #2=(|INTALG;algintegrate;RMIr;27|))
             |derivation|)
            . #2#)
      (EXIT
       (COND
        ((ZEROP (SPADCALL |x'| (QREFELT $ 64)))
         (|INTALG;algintprim| |f| |derivation| $))
        ('T
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |xx| (SPADCALL |x'| |x| (QREFELT $ 231)) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |xx| 0)
                    (COND
                     ((QEQCAR (SPADCALL (QCDR |xx|) (QREFELT $ 223)) 0)
                      (PROGN
                       (LETT #1# (|INTALG;algintexp| |f| |derivation| $) . #2#)
                       (GO #1#))))))))
            (EXIT (|error| "should not happen"))))
          #1# (EXIT #1#))))))))) 

(DEFUN |INTALG;alglogint| (|f| |derivation| $)
  (PROG ()
    (RETURN
     (COND
      ((|INTALG;varRoot?| (SPADCALL |f| |derivation| (QREFELT $ 129))
        (CONS #'|INTALG;alglogint!0| (VECTOR |derivation| $)) $)
       (CONS 1 "failed"))
      ('T
       (|error| "integrate: implementation incomplete (constant residues)")))))) 

(DEFUN |INTALG;alglogint!0| (|x1| $$)
  (PROG ($ |derivation|)
    (LETT $ (QREFELT $$ 1) . #1=(|INTALG;alglogint|))
    (LETT |derivation| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL (SPADCALL |x1| (QREFELT $ 21)) |derivation|)
                (QREFELT $ 233)))))) 

(DECLAIM (NOTINLINE |AlgebraicIntegrate;|)) 

(DEFUN |AlgebraicIntegrate| (&REST #1=#:G585)
  (PROG ()
    (RETURN
     (PROG (#2=#:G586)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|AlgebraicIntegrate|)
                                           '|domainEqualList|)
                . #3=(|AlgebraicIntegrate|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |AlgebraicIntegrate;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|AlgebraicIntegrate|))))))))))) 

(DEFUN |AlgebraicIntegrate;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraicIntegrate|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$| (LIST '|AlgebraicIntegrate| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
      (LETT $ (GETREFV 234) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|AlgebraicIntegrate|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 12 (|spadConstant| $ 11))
      (QSETREFV $ 17 (SPADCALL (SPADCALL (QREFELT $ 14)) (QREFELT $ 16)))
      (QSETREFV $ 18 (SPADCALL (SPADCALL (QREFELT $ 14)) (QREFELT $ 16)))
      $)))) 

(MAKEPROP '|AlgebraicIntegrate| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |Zero|)
              '|dummy| (|Symbol|) (4 . |new|) (|Kernel| 7) (8 . |kernel|)
              '|dumx| '|dumy| (|SparseUnivariatePolynomial| 10) (13 . |coerce|)
              (18 . |coerce|) (|Fraction| 8) (23 . |coerce|) (28 . |coerce|)
              (|Record| (|:| |num| 33) (|:| |den| 8))
              (33 . |integralCoordinates|) (|LaurentPolynomial| 7 8)
              (38 . |Zero|) (42 . |Zero|) (46 . |Zero|) (50 . |Zero|)
              (|Integer|) (|Vector| 8) (54 . |minIndex|) (59 . /)
              (|Record| (|:| |polyPart| $) (|:| |fracPart| 22))
              (65 . |separate|) (|Vector| $) (70 . |integralBasis|)
              (|Vector| 22) (74 . |represents|)
              (|Record| (|:| |answer| 10) (|:| |logpart| 10)) (|Mapping| 8 8)
              (|AlgebraicHermiteIntegration| 7 8 9 10)
              (80 . |HermiteIntegrate|) (86 . |convert|) (|Mapping| 22 27)
              (|Vector| 27) (|VectorFunctions2| 27 22) (91 . |map|) (|Boolean|)
              (97 . |zero?|) (|IntegrationResult| 10) (102 . |coerce|)
              (107 . +)
              (|Record| (|:| |scalar| 61) (|:| |coeff| 19) (|:| |logand| 19))
              (|List| 56) (|Record| (|:| |integrand| 10) (|:| |intvar| 10))
              (|List| 58) (113 . |mkAnswer|) (|Fraction| 32) (120 . |One|)
              (|NonNegativeInteger|) (124 . |degree|) (129 . |reductum|)
              (134 . |Zero|) (138 . ~=) (144 . |leadingCoefficient|) (149 . ~=)
              (155 . |coefficient|) (161 . =) (167 . /)
              (|Union| 61 '#1="failed") (173 . |retractIfCan|) (178 . |One|)
              (182 . |One|) (186 . >) (192 . |numer|) (|Union| 32 '"failed")
              (|IntegerRoots| 32) (197 . |perfectNthRoot|) (203 . |denom|)
              (208 . /) (214 . |coerce|) (219 . ^) (225 . |monomial|)
              (231 . |elt|) (237 . *) (|SparseUnivariatePolynomial| $)
              (243 . |rootOf|) (248 . *) (|FiniteDivisor| 7 8 9 10)
              (254 . |divisor|) (263 . -) (268 . -)
              (|Record| (|:| |order| 63) (|:| |function| 10))
              (|Union| 96 '"failed") (|PointsOfFiniteOrder| 6 7 8 9 10)
              (274 . |torsionIfCan|) (279 . |coerce|) (284 . |coerce|)
              (289 . *) (295 . |inv|) (300 . |concat|) (306 . =) (312 . |Zero|)
              (316 . >) (|PositiveInteger|) (322 . *) (328 . -) (333 . =)
              (|Record| (|:| |factor| 8) (|:| |exponent| 32) (|:| |coeff| 61))
              (|Union| 112 '"failed") (|Mapping| 51 112) (|List| 112)
              (339 . |find|) (345 . ~=) (351 . |primitivePart|) (|Factored| 8)
              (|FunctionSpaceUnivariatePolynomialFactor| 6 7 8)
              (356 . |ffactor|) (|Record| (|:| |factor| 8) (|:| |exponent| 32))
              (|List| 122) (361 . |factors|) (366 . >)
              (|Record| (|:| |num| $) (|:| |den| 8) (|:| |derivden| 8)
                        (|:| |gd| 8))
              (372 . |algSplitSimple|) (|DoubleResultantPackage| 7 8 9 10)
              (378 . |doubleResultant|) (384 . |ground?|) (389 . |zero?|)
              (|Mapping| 7 61) (|SparseUnivariatePolynomial| 61)
              (|UnivariatePolynomialCategoryFunctions2| 61 133 7 8)
              (394 . |map|) (|SparseUnivariatePolynomial| 7) (|Mapping| 7 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 7 136)
              (400 . |map|)
              (|UnivariatePolynomialCategoryFunctions2| 7 136 7 8)
              (406 . |map|) (|List| 7) (412 . |coefficients|) (417 . ~=)
              (|Mapping| 10 10) (423 . |map|) (429 . |Zero|) (433 . ~=)
              (439 . |degree|) (444 . |reductum|) (449 . |leadingCoefficient|)
              (454 . /) (460 . -) (465 . |elt|) (471 . |coerce|) (476 . *)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 157 '"failed") (482 . |extendedEuclidean|) (489 . |One|)
              (493 . |monomial|) (499 . *) (505 . |rem|) (511 . |coefficient|)
              (|Kernel| $) (517 . |coerce|) (|Fraction| $) (522 . |elt|)
              (528 . |lift|) (|Mapping| 7 22)
              (|UnivariatePolynomialCategoryFunctions2| 22 9 7 8) (533 . |map|)
              (539 . |elt|) (545 . |minPoly|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 15) 15
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 15)
                                                     7)
              (550 . |univariate|) (|Mapping| 10 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 136 10 19)
              (557 . |map|) (|Fraction| 89) (563 . |univariate|)
              (|Fraction| 136) (569 . |numer|) (574 . |denom|)
              (579 . |retract|) (|Mapping| 22 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 136 22 9)
              (584 . |map|) (590 . |reduce|) (595 . |retract|)
              (|Record| (|:| |num| (|List| 32)) (|:| |den| 32)) (|List| 61)
              (|InnerCommonDenominator| 32 61 (|List| 32) 192)
              (600 . |splitDenominator|) (605 . *) (611 . +) (617 . |Zero|)
              (621 . <=) (627 . -)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 10 19)
              (633 . |map|) (639 . |retract|) (644 . |degree|)
              (|Union| 10 '"failed") |INTALG;palginfieldint;RMU;24|
              (649 . |numer|) (654 . |denom|) (659 . *) (665 . -) (671 . |inv|)
              (676 . ^) (682 . *) (|ChangeOfVariable| 7 8 9) (688 . |eval|)
              (695 . *) (|Union| $ '"failed") (701 . |exquo|) (707 . |degree|)
              (712 . |leadingCoefficient|) (|Union| 8 '"failed")
              (717 . |retractIfCan|) (|Union| 7 '#1#) (722 . |retractIfCan|)
              (|Record| (|:| |ratpart| 10) (|:| |coeff| 7))
              (|Union| 224 '"failed") |INTALG;palgextintegrate;RMUPUP2FU;25|
              (727 . |integralAtInfinity?|) (732 . |differentiate|) (738 . -)
              |INTALG;palgintegrate;RMIr;26| (744 . |exquo|)
              |INTALG;algintegrate;RMIr;27| (750 . |retract|))
           '#(|palgintegrate| 755 |palginfieldint| 761 |palgextintegrate| 767
              |algintegrate| 776)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 233
                                                 '(0 10 0 11 0 13 0 14 1 15 0
                                                   13 16 1 19 0 10 20 1 8 0 7
                                                   21 1 22 0 8 23 1 10 0 22 24
                                                   1 10 25 0 26 0 27 0 28 0 6 0
                                                   29 0 7 0 30 0 22 0 31 1 33
                                                   32 0 34 2 22 0 8 8 35 1 27
                                                   36 22 37 0 10 38 39 2 10 0
                                                   40 38 41 2 44 42 10 43 45 1
                                                   27 22 0 46 2 49 40 47 48 50
                                                   1 10 51 0 52 1 53 0 10 54 2
                                                   10 0 0 0 55 3 53 0 10 57 59
                                                   60 0 61 0 62 1 8 63 0 64 1 8
                                                   0 0 65 0 8 0 66 2 8 51 0 0
                                                   67 1 8 7 0 68 2 63 51 0 0 69
                                                   2 8 7 0 63 70 2 7 51 0 0 71
                                                   2 7 0 0 0 72 1 7 73 0 74 0 6
                                                   0 75 0 7 0 76 2 63 51 0 0 77
                                                   1 61 32 0 78 2 80 79 32 63
                                                   81 1 61 32 0 82 2 61 0 32 32
                                                   83 1 7 0 61 84 2 7 0 0 32 85
                                                   2 8 0 7 63 86 2 8 0 0 0 87 2
                                                   8 0 7 0 88 1 7 0 89 90 2 7 0
                                                   0 0 91 5 92 0 10 8 8 8 7 93
                                                   1 7 0 0 94 2 92 0 0 0 95 1
                                                   98 97 92 99 1 7 0 32 100 1
                                                   61 0 32 101 2 61 0 32 0 102
                                                   1 61 0 0 103 2 57 0 0 0 104
                                                   2 8 51 0 0 105 0 61 0 106 2
                                                   61 51 0 0 107 2 63 0 108 0
                                                   109 1 61 0 0 110 2 61 51 0 0
                                                   111 2 115 113 114 0 116 2 32
                                                   51 0 0 117 1 8 0 0 118 1 120
                                                   119 8 121 1 119 123 0 124 2
                                                   32 51 0 0 125 2 10 126 0 43
                                                   127 2 128 8 10 43 129 1 8 51
                                                   0 130 1 7 51 0 131 2 134 8
                                                   132 133 135 2 138 136 137 8
                                                   139 2 140 8 137 136 141 1 8
                                                   142 0 143 2 7 51 0 0 144 2
                                                   19 0 145 0 146 0 19 0 147 2
                                                   19 51 0 0 148 1 19 63 0 149
                                                   1 19 0 0 150 1 19 10 0 151 2
                                                   10 0 0 0 152 1 10 0 0 153 2
                                                   19 10 0 10 154 1 10 0 61 155
                                                   2 10 0 0 0 156 3 19 158 0 0
                                                   0 159 0 10 0 160 2 19 0 10
                                                   63 161 2 19 0 0 0 162 2 19 0
                                                   0 0 163 2 19 10 0 63 164 1 7
                                                   0 165 166 2 8 7 167 7 168 1
                                                   10 9 0 169 2 171 8 170 9 172
                                                   2 8 7 0 7 173 1 7 89 165 174
                                                   3 175 136 7 15 136 176 2 178
                                                   19 177 136 179 2 7 180 0 165
                                                   181 1 182 136 0 183 1 182
                                                   136 0 184 1 182 136 0 185 2
                                                   187 9 186 136 188 1 10 0 9
                                                   189 1 7 61 0 190 1 193 191
                                                   192 194 2 92 0 32 0 195 2 92
                                                   0 0 0 196 0 92 0 197 2 32 51
                                                   0 0 198 2 19 0 0 0 199 2 200
                                                   19 177 8 201 1 7 165 0 202 1
                                                   133 63 0 203 1 22 8 0 206 1
                                                   22 8 0 207 2 8 0 0 0 208 2 8
                                                   0 0 0 209 1 22 0 0 210 2 22
                                                   0 0 32 211 2 22 0 8 0 212 3
                                                   213 9 9 22 22 214 2 9 0 22 0
                                                   215 2 9 216 0 0 217 1 9 63 0
                                                   218 1 9 22 0 219 1 22 220 0
                                                   221 1 8 222 0 223 1 10 51 0
                                                   227 2 10 0 0 43 228 2 10 0 0
                                                   0 229 2 8 216 0 0 231 1 8 7
                                                   0 233 2 0 53 10 43 230 2 0
                                                   204 10 43 205 5 0 225 10 43
                                                   9 22 22 226 2 0 53 10 43
                                                   232)))))
           '|lookupComplete|)) 
