
(/VERSIONCHECK 2) 

(PUT '|UTS;stream| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |UTS;stream| (|x| $) |x|) 

(DEFUN |UTS;coerce;V$;2| (|v| $)
  (COND
   ((SPADCALL (QREFELT $ 8) (QREFELT $ 11))
    (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 15)))
   ('T
    (SPADCALL (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 15))
              (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 15)) (QREFELT $ 18))))) 

(DEFUN |UTS;coerce;I$;3| (|n| $)
  (SPADCALL (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 23))) 

(DEFUN |UTS;coerce;Coef$;4| (|r| $) (SPADCALL |r| (QREFELT $ 27))) 

(DEFUN |UTS;monomial;CoefNni$;5| (|c| |n| $) (SPADCALL |c| |n| (QREFELT $ 28))) 

(PUT '|UTS;getExpon| '|SPADreplace| 'QCAR) 

(DEFUN |UTS;getExpon| (|term| $) (QCAR |term|)) 

(PUT '|UTS;getCoef| '|SPADreplace| 'QCDR) 

(DEFUN |UTS;getCoef| (|term| $) (QCDR |term|)) 

(PUT '|UTS;rec| '|SPADreplace| 'CONS) 

(DEFUN |UTS;rec| (|expon| |coef| $) (CONS |expon| |coef|)) 

(DEFUN |UTS;recs| (|st| |n| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|UTS;recs!0| (VECTOR |n| $ |st|)) (QREFELT $ 41))))) 

(DEFUN |UTS;recs!0| ($$)
  (PROG (|st| $ |n|)
    (LETT |st| (QREFELT $$ 2) . #1=(|UTS;recs|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |n| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|coef|)
        (RETURN
         (COND ((SPADCALL |st| (QREFELT $ 29)) (SPADCALL (QREFELT $ 38)))
               ((SPADCALL (LETT |coef| (SPADCALL |st| (QREFELT $ 31)) NIL)
                          (QREFELT $ 11))
                (|UTS;recs| (SPADCALL |st| (QREFELT $ 32))
                 (SPADCALL |n| (|spadConstant| $ 33) (QREFELT $ 34)) $))
               ('T
                (SPADCALL (|UTS;rec| |n| |coef| $)
                          (|UTS;recs| (SPADCALL |st| (QREFELT $ 32))
                           (SPADCALL |n| (|spadConstant| $ 33) (QREFELT $ 34))
                           $)
                          (QREFELT $ 39)))))))))) 

(DEFUN |UTS;terms;$S;10| (|x| $) (|UTS;recs| (|UTS;stream| |x| $) 0 $)) 

(DEFUN |UTS;recsToCoefs| (|st| |n| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|UTS;recsToCoefs!0| (VECTOR |n| $ |st|))
                (QREFELT $ 52)))))) 

(DEFUN |UTS;recsToCoefs!0| ($$)
  (PROG (|st| $ |n|)
    (LETT |st| (QREFELT $$ 2) . #1=(|UTS;recsToCoefs|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |n| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|term| |expon|)
        (RETURN
         (SEQ
          (COND ((SPADCALL |st| (QREFELT $ 43)) (SPADCALL (QREFELT $ 48)))
                ('T
                 (SEQ (LETT |term| (SPADCALL |st| (QREFELT $ 44)) NIL)
                      (LETT |expon| (|UTS;getExpon| |term| $) NIL)
                      (EXIT
                       (COND
                        ((SPADCALL |n| |expon| (QREFELT $ 45))
                         (SPADCALL (|UTS;getCoef| |term| $)
                                   (|UTS;recsToCoefs|
                                    (SPADCALL |st| (QREFELT $ 46))
                                    (SPADCALL |n| (|spadConstant| $ 33)
                                              (QREFELT $ 34))
                                    $)
                                   (QREFELT $ 49)))
                        ('T
                         (SPADCALL (|spadConstant| $ 16)
                                   (|UTS;recsToCoefs| |st|
                                    (SPADCALL |n| (|spadConstant| $ 33)
                                              (QREFELT $ 34))
                                    $)
                                   (QREFELT $ 49))))))))))))))) 

(DEFUN |UTS;series;S$;12| (|st| $) (|UTS;recsToCoefs| |st| 0 $)) 

(DEFUN |UTS;stToPoly| (|st| |term| |n| |n0| $)
  (COND
   ((OR (SPADCALL |n| |n0| (QREFELT $ 54)) (SPADCALL |st| (QREFELT $ 29)))
    (|spadConstant| $ 56))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |st| (QREFELT $ 31))
               (SPADCALL |term| |n| (QREFELT $ 57)) (QREFELT $ 58))
     (|UTS;stToPoly| (SPADCALL |st| (QREFELT $ 32)) |term| (+ |n| 1) |n0| $)
     (QREFELT $ 59))))) 

(DEFUN |UTS;polynomial;$NniP;14| (|x| |n| $)
  (|UTS;stToPoly| (|UTS;stream| |x| $)
   (SPADCALL (SPADCALL (QREFELT $ 7) (QREFELT $ 61))
             (SPADCALL (QREFELT $ 8) (QREFELT $ 62)) (QREFELT $ 63))
   0 |n| $)) 

(DEFUN |UTS;polynomial;$2NniP;15| (|x| |n1| |n2| $)
  (PROG (|#G31| |#G30|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |n1| |n2| (QREFELT $ 54))
        (PROGN
         (LETT |#G30| |n2| . #1=(|UTS;polynomial;$2NniP;15|))
         (LETT |#G31| |n1| . #1#)
         (LETT |n1| |#G30| . #1#)
         (LETT |n2| |#G31| . #1#))))
      (EXIT
       (|UTS;stToPoly| (SPADCALL (|UTS;stream| |x| $) |n1| (QREFELT $ 65))
        (SPADCALL (SPADCALL (QREFELT $ 7) (QREFELT $ 61))
                  (SPADCALL (QREFELT $ 8) (QREFELT $ 62)) (QREFELT $ 63))
        |n1| |n2| $)))))) 

(DEFUN |UTS;univariatePolynomial;$NniUp;16| (|x| |n| $)
  (PROG (|st| |term| |ress| #1=#:G171 |k| |t1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ress| (|spadConstant| $ 68)
              . #2=(|UTS;univariatePolynomial;$NniUp;16|))
        (LETT |st| (|UTS;stream| |x| $) . #2#)
        (EXIT
         (COND
          ((SPADCALL (QREFELT $ 8) (|spadConstant| $ 16) (QREFELT $ 69))
           (SEQ
            (SEQ (LETT |k| 0 . #2#) G190
                 (COND ((|greater_SI| |k| |n|) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |st| (QREFELT $ 29))
                     (PROGN (LETT #1# |ress| . #2#) (GO #1#)))
                    ('T
                     (SEQ
                      (LETT |term|
                            (SPADCALL (SPADCALL |st| (QREFELT $ 31)) |k|
                                      (QREFELT $ 70))
                            . #2#)
                      (LETT |ress| (SPADCALL |term| |ress| (QREFELT $ 71))
                            . #2#)
                      (EXIT
                       (LETT |st| (SPADCALL |st| (QREFELT $ 35)) . #2#)))))))
                 (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
            (EXIT |ress|)))
          ('T
           (SEQ |ress|
                (LETT |t1|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 70))
                       (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 70))
                       (QREFELT $ 72))
                      . #2#)
                (LETT |term| (|spadConstant| $ 73) . #2#)
                (SEQ (LETT |k| 1 . #2#) G190
                     (COND ((|greater_SI| |k| |n|) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |st| (QREFELT $ 29))
                         (PROGN (LETT #1# |ress| . #2#) (GO #1#)))
                        ('T
                         (SEQ
                          (LETT |ress|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |st| (QREFELT $ 31))
                                           |term| (QREFELT $ 74))
                                 |ress| (QREFELT $ 71))
                                . #2#)
                          (LETT |term| (SPADCALL |term| |t1| (QREFELT $ 75))
                                . #2#)
                          (EXIT
                           (LETT |st| (SPADCALL |st| (QREFELT $ 35))
                                 . #2#)))))))
                     (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |ress|)))))))
      #1# (EXIT #1#))))) 

(DEFUN |UTS;coerce;Up$;17| (|p| $)
  (PROG (|st| |i| |oldDeg| |delta| #1=#:G174 |deg|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 77)) (|spadConstant| $ 17))
            ('T
             (SEQ
              (COND
               ((NULL (SPADCALL (QREFELT $ 8) (QREFELT $ 11)))
                (LETT |p|
                      (SPADCALL |p|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 12) 1
                                           (QREFELT $ 70))
                                 (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 70))
                                 (QREFELT $ 71))
                                (QREFELT $ 78))
                      . #2=(|UTS;coerce;Up$;17|))))
              (LETT |st| (SPADCALL (QREFELT $ 48)) . #2#)
              (LETT |oldDeg| (+ (SPADCALL |p| (QREFELT $ 79)) 1) . #2#)
              (SEQ G190
                   (COND
                    ((NULL (COND ((SPADCALL |p| (QREFELT $ 77)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ (LETT |deg| (SPADCALL |p| (QREFELT $ 79)) . #2#)
                        (LETT |delta|
                              (PROG1 (LETT #1# (- (- |oldDeg| |deg|) 1) . #2#)
                                (|check_subtype| (>= #1# 0)
                                                 '(|NonNegativeInteger|) #1#))
                              . #2#)
                        (SEQ (LETT |i| 1 . #2#) G190
                             (COND ((|greater_SI| |i| |delta|) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |st|
                                     (SPADCALL (|spadConstant| $ 16) |st|
                                               (QREFELT $ 49))
                                     . #2#)))
                             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |st|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 80)) |st|
                                        (QREFELT $ 49))
                              . #2#)
                        (LETT |oldDeg| |deg| . #2#)
                        (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 81)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1 . #2#) G190
                   (COND ((|greater_SI| |i| |oldDeg|) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |st|
                           (SPADCALL (|spadConstant| $ 16) |st| (QREFELT $ 49))
                           . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |st|)))))))) 

(DEFUN |UTS;stToCoef| (|st| |term| |n| |n0| $)
  (COND
   ((OR (SPADCALL |n| |n0| (QREFELT $ 54)) (SPADCALL |st| (QREFELT $ 29)))
    (|spadConstant| $ 16))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |st| (QREFELT $ 31))
               (SPADCALL |term| |n| (QREFELT $ 83)) (QREFELT $ 84))
     (|UTS;stToCoef| (SPADCALL |st| (QREFELT $ 32)) |term| (+ |n| 1) |n0| $)
     (QREFELT $ 85))))) 

(DEFUN |UTS;approximate;$NniCoef;19| (|x| |n| $)
  (|UTS;stToCoef| (|UTS;stream| |x| $)
   (SPADCALL (SPADCALL (QREFELT $ 7) (QREFELT $ 86)) (QREFELT $ 8)
             (QREFELT $ 87))
   0 |n| $)) 

(DEFUN |UTS;variable;$S;20| (|x| $) (QREFELT $ 7)) 

(DEFUN |UTS;center;$Coef;21| (|s| $) (QREFELT $ 8)) 

(DEFUN |UTS;coefficient;$NniCoef;22| (|x| |n| $)
  (PROG (#1=#:G189 |u|)
    (RETURN
     (SEQ (LETT |u| (|UTS;stream| |x| $) . #2=(|UTS;coefficient;$NniCoef;22|))
          (SEQ G190
               (COND
                ((NULL
                  (COND ((SPADCALL |u| (QREFELT $ 29)) 'NIL)
                        ('T (SPADCALL |n| 0 (QREFELT $ 54)))))
                 (GO G191)))
               (SEQ (LETT |u| (SPADCALL |u| (QREFELT $ 35)) . #2#)
                    (EXIT
                     (LETT |n|
                           (PROG1 (LETT #1# (- |n| 1) . #2#)
                             (|check_subtype| (>= #1# 0)
                                              '(|NonNegativeInteger|) #1#))
                           . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((OR (SPADCALL |u| (QREFELT $ 29)) (SPADCALL |n| 0 (QREFELT $ 91)))
            (EXIT (|spadConstant| $ 16))))
          (EXIT (SPADCALL |u| (QREFELT $ 31))))))) 

(DEFUN |UTS;elt;$NniCoef;23| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 92))) 

(DEFUN |UTS;map;M2$;24| (|f| |x| $) (SPADCALL |f| |x| (QREFELT $ 95))) 

(DEFUN |UTS;eval;$CoefS;25| (|x| |r| $)
  (SPADCALL (|UTS;stream| |x| $) (SPADCALL |r| (QREFELT $ 8) (QREFELT $ 87))
            (QREFELT $ 97))) 

(DEFUN |UTS;differentiate;2$;26| (|x| $)
  (SPADCALL (|UTS;stream| |x| $) (QREFELT $ 99))) 

(DEFUN |UTS;differentiate;$V$;27| (|x| |v| $) (SPADCALL |x| (QREFELT $ 100))) 

(DEFUN |UTS;differentiate;$S$;28| (|x| |s| $)
  (PROG ()
    (RETURN
     (COND
      ((EQUAL |s| (SPADCALL |x| (QREFELT $ 89)))
       (SPADCALL |x| (QREFELT $ 100)))
      ('T
       (SPADCALL
        (SPADCALL (CONS #'|UTS;differentiate;$S$;28!0| (VECTOR $ |s|)) |x|
                  (QREFELT $ 96))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 90)) |s| (QREFELT $ 102))
                  (SPADCALL |x| (QREFELT $ 100)) (QREFELT $ 103))
        (QREFELT $ 104))))))) 

(DEFUN |UTS;differentiate;$S$;28!0| (|y| $$)
  (PROG (|s| $)
    (LETT |s| (QREFELT $$ 1) . #1=(|UTS;differentiate;$S$;28|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |y| |s| (QREFELT $ 102)))))) 

(DEFUN |UTS;multiplyCoefficients;M2$;29| (|f| |x| $)
  (SPADCALL |f| (|UTS;stream| |x| $) (QREFELT $ 107))) 

(DEFUN |UTS;lagrange;2$;30| (|x| $)
  (SPADCALL (|UTS;stream| |x| $) (QREFELT $ 109))) 

(DEFUN |UTS;lambert;2$;31| (|x| $)
  (SPADCALL (|UTS;stream| |x| $) (QREFELT $ 111))) 

(DEFUN |UTS;oddlambert;2$;32| (|x| $)
  (SPADCALL (|UTS;stream| |x| $) (QREFELT $ 113))) 

(DEFUN |UTS;evenlambert;2$;33| (|x| $)
  (SPADCALL (|UTS;stream| |x| $) (QREFELT $ 115))) 

(DEFUN |UTS;generalLambert;$2I$;34| (|x| |a| |d| $)
  (SPADCALL (|UTS;stream| |x| $) |a| |d| (QREFELT $ 117))) 

(DEFUN |UTS;extend;$Nni$;35| (|x| |n| $)
  (SPADCALL |x| (+ |n| 1) (QREFELT $ 119))) 

(DEFUN |UTS;complete;2$;36| (|x| $) (SPADCALL |x| (QREFELT $ 121))) 

(DEFUN |UTS;truncate;$Nni$;37| (|x| |n| $)
  (SPADCALL (|UTS;stream| |x| $) (+ |n| 1) (QREFELT $ 123))) 

(DEFUN |UTS;truncate;$2Nni$;38| (|x| |n1| |n2| $)
  (PROG (|st| |i| |m| #1=#:G215 |#G84| |#G83|)
    (RETURN
     (SEQ
      (COND
       ((< |n2| |n1|)
        (PROGN
         (LETT |#G83| |n2| . #2=(|UTS;truncate;$2Nni$;38|))
         (LETT |#G84| |n1| . #2#)
         (LETT |n1| |#G83| . #2#)
         (LETT |n2| |#G84| . #2#))))
      (LETT |m|
            (PROG1 (LETT #1# (- |n2| |n1|) . #2#)
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            . #2#)
      (LETT |st|
            (SPADCALL (SPADCALL (|UTS;stream| |x| $) |n1| (QREFELT $ 125))
                      (+ |m| 1) (QREFELT $ 123))
            . #2#)
      (SEQ (LETT |i| 1 . #2#) G190 (COND ((|greater_SI| |i| |n1|) (GO G191)))
           (SEQ
            (EXIT
             (LETT |st| (SPADCALL (|spadConstant| $ 16) |st| (QREFELT $ 47))
                   . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |st|))))) 

(DEFUN |UTS;elt;3$;39| (|x| |y| $)
  (SPADCALL (|UTS;stream| |x| $) (|UTS;stream| |y| $) (QREFELT $ 127))) 

(DEFUN |UTS;revert;2$;40| (|x| $)
  (SPADCALL (|UTS;stream| |x| $) (QREFELT $ 129))) 

(DEFUN |UTS;multisect;2I2$;41| (|a| |b| |x| $)
  (SPADCALL |a| |b| (|UTS;stream| |x| $) (QREFELT $ 131))) 

(DEFUN |UTS;invmultisect;2I2$;42| (|a| |b| |x| $)
  (SPADCALL |a| |b| (|UTS;stream| |x| $) (QREFELT $ 133))) 

(DEFUN |UTS;multiplyExponents;$Pi$;43| (|x| |n| $)
  (SPADCALL |n| 0 |x| (QREFELT $ 134))) 

(DEFUN |UTS;quoByVar;2$;44| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 29)) (|spadConstant| $ 17))
        ('T (SPADCALL |x| (QREFELT $ 35))))) 

(DEFUN |UTS;unit?;$B;45| (|x| $)
  (SPADCALL (SPADCALL |x| 0 (QREFELT $ 92)) (QREFELT $ 138))) 

(DEFUN |UTS;^;$Coef$;46| (|x| |s| $)
  (SPADCALL |s| (|UTS;stream| |x| $) (QREFELT $ 141))) 

(DEFUN |UTS;^;$Coef$;47| (|x| |s| $)
  (SPADCALL |s| (|UTS;stream| |x| $) (QREFELT $ 143))) 

(DEFUN |UTS;coerce;F$;48| (|r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 144)) (QREFELT $ 23))) 

(DEFUN |UTS;integrate;2$;49| (|x| $)
  (SPADCALL (|spadConstant| $ 16) (|UTS;stream| |x| $) (QREFELT $ 146))) 

(DEFUN |UTS;integrate;$V$;50| (|x| |v| $) (SPADCALL |x| (QREFELT $ 147))) 

(DEFUN |UTS;integrate;$S$;51| (|x| |s| $)
  (PROG ()
    (RETURN
     (COND
      ((EQUAL |s| (SPADCALL |x| (QREFELT $ 89)))
       (SPADCALL |x| (QREFELT $ 147)))
      ((NULL
        (SPADCALL |s| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 150))
                  (QREFELT $ 151)))
       (SPADCALL (CONS #'|UTS;integrate;$S$;51!0| (VECTOR $ |s|)) |x|
                 (QREFELT $ 96)))
      ('T
       (|error|
        "integrate: center is a function of variable of integration")))))) 

(DEFUN |UTS;integrate;$S$;51!0| (|y| $$)
  (PROG (|s| $)
    (LETT |s| (QREFELT $$ 1) . #1=(|UTS;integrate;$S$;51|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |y| |s| (QREFELT $ 152)))))) 

(DEFUN |UTS;integrateWithOneAnswer| (|f| |s| $)
  (PROG (|res|)
    (RETURN
     (SEQ
      (LETT |res| (SPADCALL |f| |s| (QREFELT $ 156))
            |UTS;integrateWithOneAnswer|)
      (EXIT
       (COND ((QEQCAR |res| 0) (QCDR |res|))
             ('T (|SPADfirst| (QCDR |res|))))))))) 

(DEFUN |UTS;integrate;$S$;53| (|x| |s| $)
  (PROG ()
    (RETURN
     (COND
      ((EQUAL |s| (SPADCALL |x| (QREFELT $ 89)))
       (SPADCALL |x| (QREFELT $ 147)))
      ((NULL
        (SPADCALL |s| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 150))
                  (QREFELT $ 151)))
       (SPADCALL (CONS #'|UTS;integrate;$S$;53!0| (VECTOR $ |s|)) |x|
                 (QREFELT $ 96)))
      ('T
       (|error|
        "integrate: center is a function of variable of integration")))))) 

(DEFUN |UTS;integrate;$S$;53!0| (|y| $$)
  (PROG (|s| $)
    (LETT |s| (QREFELT $$ 1) . #1=(|UTS;integrate;$S$;53|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|UTS;integrateWithOneAnswer| |y| |s| $))))) 

(DECLAIM (NOTINLINE |UnivariateTaylorSeries;|)) 

(DEFUN |UnivariateTaylorSeries| (&REST #1=#:G259)
  (PROG ()
    (RETURN
     (PROG (#2=#:G260)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|UnivariateTaylorSeries|)
                                           '|domainEqualList|)
                . #3=(|UnivariateTaylorSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |UnivariateTaylorSeries;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|UnivariateTaylorSeries|))))))))))) 

(DEFUN |UnivariateTaylorSeries;| (|#1| |#2| |#3|)
  (PROG (|pv$| #1=#:G251 #2=#:G252 #3=#:G253 #4=#:G254 #5=#:G255 #6=#:G258 $
         |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #7=(|UnivariateTaylorSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #7#)
      (LETT DV$3 (|devaluate| |#3|) . #7#)
      (LETT |dv$| (LIST '|UnivariateTaylorSeries| DV$1 DV$2 DV$3) . #7#)
      (LETT $ (GETREFV 166) . #7#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (LETT #6#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #7#)
                                          (OR #6#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (|HasSignature| |#1|
                                                          (LIST '*
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|NonNegativeInteger|)
                                                                 (|devaluate|
                                                                  |#1|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PartialDifferentialRing|
                                                            (|Symbol|)))
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|NonNegativeInteger|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|SemiGroup|))
                                          (|HasSignature| |#1|
                                                          (LIST '^
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|NonNegativeInteger|))))
                                          (AND
                                           (|HasSignature| |#1|
                                                           (LIST '^
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|NonNegativeInteger|))))
                                           (|HasSignature| |#1|
                                                           (LIST '|coerce|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Symbol|)))))
                                          (LETT #5#
                                                (|HasCategory| |#1|
                                                               '(|SemiRing|))
                                                . #7#)
                                          (OR #5#
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|NonNegativeInteger|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (LETT #4#
                                                (|HasCategory| |#1| '(|Ring|))
                                                . #7#)
                                          (OR #6#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              #4#
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|NonNegativeInteger|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR #4#
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|NonNegativeInteger|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #6#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           #4#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|NonNegativeInteger|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|AbelianGroup|))
                                                . #7#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #6#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           #4#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|NonNegativeInteger|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CancellationAbelianMonoid|))
                                                . #7#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3# #2#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #6#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           #4#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|NonNegativeInteger|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|AbelianMonoid|))
                                                . #7#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3# #1# #2#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #6#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           #4#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|NonNegativeInteger|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (OR
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|Algebra|
                                                             (|Fraction|
                                                              (|Integer|))))
                                            (|HasCategory| |#1|
                                                           '(|AlgebraicallyClosedFunctionSpace|
                                                             (|Integer|)))
                                            (|HasCategory| |#1|
                                                           '(|PrimitiveFunctionCategory|))
                                            (|HasCategory| |#1|
                                                           '(|TranscendentalFunctionCategory|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|Algebra|
                                                             (|Fraction|
                                                              (|Integer|))))
                                            (|HasSignature| |#1|
                                                            (LIST '|integrate|
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Symbol|))))
                                            (|HasSignature| |#1|
                                                            (LIST '|variables|
                                                                  (LIST
                                                                   '(|List|
                                                                     (|Symbol|))
                                                                   (|devaluate|
                                                                    |#1|))))))))
                      . #7#))
      (|haddProp| |$ConstructorCache| '|UnivariateTaylorSeries|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
           (|augmentPredVector| $ 33554432))
      (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
           (|augmentPredVector| $ 67108864))
      (AND
       (OR (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           #5#
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|NonNegativeInteger|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 134217728))
      (AND
       (OR (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           #4#
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|NonNegativeInteger|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 268435456))
      (AND
       (OR #3#
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|NonNegativeInteger|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 536870912))
      (AND
       (OR #2#
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|NonNegativeInteger|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 1073741824))
      (AND
       (OR #1#
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|NonNegativeInteger|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 2147483648))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (|Stream| |#1|))
      (COND
       ((|HasSignature| |#1|
                        (LIST '|coerce| (LIST (|devaluate| |#1|) '(|Symbol|))))
        (COND
         ((|testBitVector| |pv$| 10)
          (PROGN
           (QSETREFV $ 88
                     (CONS (|dispatchFunction| |UTS;approximate;$NniCoef;19|)
                           $)))))))
      (COND
       ((|HasCategory| |#1| '(|PartialDifferentialRing| (|Symbol|)))
        (QSETREFV $ 105
                  (CONS (|dispatchFunction| |UTS;differentiate;$S$;28|) $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (QSETREFV $ 139 (CONS (|dispatchFunction| |UTS;unit?;$B;45|) $))))
      (COND
       ((|testBitVector| |pv$| 24)
        (COND
         ((|domainEqual| |#1| (|Fraction| (|Integer|)))
          (QSETREFV $ 142 (CONS (|dispatchFunction| |UTS;^;$Coef$;46|) $)))
         ('T
          (QSETREFV $ 142 (CONS (|dispatchFunction| |UTS;^;$Coef$;47|) $))))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 145 (CONS (|dispatchFunction| |UTS;coerce;F$;48|) $))
         (QSETREFV $ 147 (CONS (|dispatchFunction| |UTS;integrate;2$;49|) $))
         (QSETREFV $ 148 (CONS (|dispatchFunction| |UTS;integrate;$V$;50|) $))
         (COND
          ((|HasSignature| |#1|
                           (LIST '|integrate|
                                 (LIST (|devaluate| |#1|) (|devaluate| |#1|)
                                       '(|Symbol|))))
           (COND
            ((|HasSignature| |#1|
                             (LIST '|variables|
                                   (LIST '(|List| (|Symbol|))
                                         (|devaluate| |#1|))))
             (QSETREFV $ 153
                       (CONS (|dispatchFunction| |UTS;integrate;$S$;51|)
                             $))))))
         (COND
          ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
           (COND
            ((|HasCategory| |#1| '(|PrimitiveFunctionCategory|))
             (COND
              ((|HasCategory| |#1|
                              '(|AlgebraicallyClosedFunctionSpace|
                                (|Integer|)))
               (PROGN
                (QSETREFV $ 153
                          (CONS (|dispatchFunction| |UTS;integrate;$S$;53|)
                                $))))))))))))
      $)))) 

(MAKEPROP '|UnivariateTaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerTaylorSeries| 6) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (|Boolean|) (0 . |zero?|)
              (5 . |One|) (9 . |One|) (|NonNegativeInteger|)
              |UTS;monomial;CoefNni$;5| (13 . |Zero|) (17 . |Zero|) (21 . +)
              (|Variable| 7) |UTS;coerce;V$;2| (|Integer|) (27 . |coerce|)
              |UTS;coerce;Coef$;4| |UTS;coerce;I$;3| (|Stream| 6)
              (|StreamTaylorSeriesOperations| 6) (32 . |coerce|) (37 . |monom|)
              (43 . |empty?|) (48 . |empty|) (52 . |frst|) (57 . |rst|)
              (62 . |One|) (66 . +) (72 . |rst|)
              (|Record| (|:| |k| 14) (|:| |c| 6)) (|Stream| 36) (77 . |empty|)
              (81 . |concat|) (|Mapping| $) (87 . |delay|) |UTS;terms;$S;10|
              (92 . |empty?|) (97 . |frst|) (102 . =) (108 . |rst|)
              (113 . |concat|) (119 . |empty|) (123 . |concat|) (129 . |Zero|)
              (133 . |Zero|) (137 . |delay|) |UTS;series;S$;12| (142 . >)
              (|Polynomial| 6) (148 . |Zero|) (152 . ^) (158 . *) (164 . +)
              (|Symbol|) (170 . |coerce|) (175 . |coerce|) (180 . -)
              |UTS;polynomial;$NniP;14| (186 . |rest|)
              |UTS;polynomial;$2NniP;15| (|UnivariatePolynomial| 7 6)
              (192 . |Zero|) (196 . =) (202 . |monomial|) (208 . +) (214 . -)
              (220 . |One|) (224 . *) (230 . *)
              |UTS;univariatePolynomial;$NniUp;16| (236 . |zero?|)
              (241 . |elt|) (247 . |degree|) (252 . |leadingCoefficient|)
              (257 . |reductum|) |UTS;coerce;Up$;17| (262 . ^) (268 . *)
              (274 . +) (280 . |coerce|) (285 . -) (291 . |approximate|)
              |UTS;variable;$S;20| |UTS;center;$Coef;21| (297 . ~=)
              |UTS;coefficient;$NniCoef;22| |UTS;elt;$NniCoef;23|
              (|Mapping| 6 6) (303 . |map|) |UTS;map;M2$;24| (309 . |eval|)
              |UTS;eval;$CoefS;25| (315 . |deriv|) |UTS;differentiate;2$;26|
              |UTS;differentiate;$V$;27| (320 . |differentiate|) (326 . *)
              (332 . -) (338 . |differentiate|) (|Mapping| 6 21)
              (344 . |gderiv|) |UTS;multiplyCoefficients;M2$;29|
              (350 . |lagrange|) |UTS;lagrange;2$;30| (355 . |lambert|)
              |UTS;lambert;2$;31| (360 . |oddlambert|) |UTS;oddlambert;2$;32|
              (365 . |evenlambert|) |UTS;evenlambert;2$;33|
              (370 . |generalLambert|) |UTS;generalLambert;$2I$;34|
              (377 . |extend|) |UTS;extend;$Nni$;35| (383 . |complete|)
              |UTS;complete;2$;36| (388 . |first|) |UTS;truncate;$Nni$;37|
              (394 . |rest|) |UTS;truncate;$2Nni$;38| (400 . |compose|)
              |UTS;elt;3$;39| (406 . |revert|) |UTS;revert;2$;40|
              (411 . |multisect|) |UTS;multisect;2I2$;41|
              (418 . |invmultisect|) |UTS;invmultisect;2I2$;42|
              (|PositiveInteger|) |UTS;multiplyExponents;$Pi$;43|
              |UTS;quoByVar;2$;44| (425 . |unit?|) (430 . |unit?|)
              (|Fraction| 21) (435 . |powern|) (441 . ^) (447 . |power|)
              (453 . |coerce|) (458 . |coerce|) (463 . |integrate|)
              (469 . |integrate|) (474 . |integrate|) (|List| 60)
              (480 . |variables|) (485 . |entry?|) (491 . |integrate|)
              (497 . |integrate|) (|Union| 6 (|List| 6))
              (|FunctionSpaceIntegration| 21 6) (503 . |integrate|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Union| $ '"failed") (|List| 14) (|List| 161)
              (|SingletonAsOrderedSet|) (|String|) (|SingleInteger|)
              (|HashState|) (|OutputForm|))
           '#(~= 509 |zero?| 515 |variables| 520 |variable| 525
              |univariatePolynomial| 530 |unitNormal| 536 |unitCanonical| 541
              |unit?| 546 |truncate| 551 |terms| 564 |tanh| 569 |tan| 574
              |subtractIfCan| 579 |sqrt| 585 |sinh| 590 |sin| 595 |series| 600
              |sech| 610 |sec| 615 |sample| 620 |revert| 624 |reductum| 629
              |recip| 634 |quoByVar| 639 |polynomial| 644 |pole?| 657 |pi| 662
              |order| 666 |opposite?| 677 |one?| 683 |oddlambert| 688 |nthRoot|
              693 |multisect| 699 |multiplyExponents| 706
              |multiplyCoefficients| 712 |monomial?| 718 |monomial| 723 |map|
              743 |log| 749 |leadingMonomial| 754 |leadingCoefficient| 759
              |latex| 764 |lambert| 769 |lagrange| 774 |invmultisect| 779
              |integrate| 786 |hashUpdate!| 803 |hash| 809 |generalLambert| 814
              |extend| 821 |exquo| 827 |exp| 833 |evenlambert| 838 |eval| 843
              |elt| 849 |differentiate| 861 |degree| 904 |csch| 909 |csc| 914
              |coth| 919 |cot| 924 |cosh| 929 |cos| 934 |complete| 939 |coerce|
              944 |coefficients| 979 |coefficient| 984 |charthRoot| 990
              |characteristic| 995 |center| 999 |atanh| 1004 |atan| 1009
              |associates?| 1014 |asinh| 1020 |asin| 1025 |asech| 1030 |asec|
              1035 |approximate| 1040 |annihilate?| 1046 |acsch| 1052 |acsc|
              1057 |acoth| 1062 |acot| 1067 |acosh| 1072 |acos| 1077 ^ 1082
              |Zero| 1112 |One| 1116 D 1120 = 1157 / 1163 - 1169 + 1180 * 1186)
           'NIL
           (CONS
            (|makeByteWordVec2| 23
                                '(0 0 0 0 2 1 2 5 1 6 2 2 3 4 5 8 7 0 1 6 17 0
                                  0 1 1 6 15 17 19 13 21 0 13 23 0 0 0 1 0 0 0
                                  6 2 16 9 1 1 1 1 1 1))
            (CONS
             '#(|UnivariateTaylorSeriesCategory&|
                |UnivariatePowerSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL |Algebra&| |Algebra&| |Algebra&|
                |Module&| NIL |Module&| |EntireRing&| NIL NIL |Module&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| |AbelianGroup&| NIL NIL
                NIL |Monoid&| |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                |SetCategory&| |TranscendentalFunctionCategory&| NIL
                |BasicType&| NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariateTaylorSeriesCategory| 6)
                 (|UnivariatePowerSeriesCategory| 6 14)
                 (|PowerSeriesCategory| 6 14 161) (|AbelianMonoidRing| 6 14)
                 (|IntegralDomain|) (|Algebra| 140) (|Algebra| $$)
                 (|Algebra| 6) (|Module| 140) (|CommutativeRing|) (|Module| $$)
                 (|EntireRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 60) (|DifferentialRing|)
                 (|BiModule| 6 6) (|BiModule| 140 140) (|BiModule| $$ $$)
                 (|Ring|) (|LeftModule| 6) (|RightModule| 6) (|LeftModule| 140)
                 (|RightModule| 140) (|RightModule| $$) (|LeftModule| $$)
                 (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|SetCategory|) (|TranscendentalFunctionCategory|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 165) (|CommutativeStar|) (|noZeroDivisors|)
                 (|unitsKnown|) (|Eltable| $$ $$)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 165
                                  '(1 6 10 0 11 0 6 0 12 0 0 0 13 0 6 0 16 0 0
                                    0 17 2 0 0 0 0 18 1 6 0 21 22 1 26 25 6 27
                                    2 26 25 6 21 28 1 9 10 0 29 0 9 0 30 1 9 6
                                    0 31 1 25 0 0 32 0 14 0 33 2 14 0 0 0 34 1
                                    9 0 0 35 0 37 0 38 2 37 0 36 0 39 1 37 0 40
                                    41 1 37 10 0 43 1 37 36 0 44 2 14 10 0 0 45
                                    1 37 0 0 46 2 9 0 6 0 47 0 25 0 48 2 25 0 6
                                    0 49 0 14 0 50 0 21 0 51 1 25 0 40 52 2 14
                                    10 0 0 54 0 55 0 56 2 55 0 0 14 57 2 55 0 6
                                    0 58 2 55 0 0 0 59 1 55 0 60 61 1 55 0 6 62
                                    2 55 0 0 0 63 2 25 0 0 14 65 0 67 0 68 2 6
                                    10 0 0 69 2 67 0 6 14 70 2 67 0 0 0 71 2 67
                                    0 0 0 72 0 67 0 73 2 67 0 6 0 74 2 67 0 0 0
                                    75 1 67 10 0 77 2 67 0 0 0 78 1 67 14 0 79
                                    1 67 6 0 80 1 67 0 0 81 2 6 0 0 14 83 2 6 0
                                    0 0 84 2 6 0 0 0 85 1 6 0 60 86 2 6 0 0 0
                                    87 2 0 6 0 14 88 2 14 10 0 0 91 2 9 0 94 0
                                    95 2 26 25 25 6 97 1 26 25 25 99 2 6 0 0 60
                                    102 2 0 0 6 0 103 2 0 0 0 0 104 2 0 0 0 60
                                    105 2 26 25 106 25 107 1 26 25 25 109 1 26
                                    25 25 111 1 26 25 25 113 1 26 25 25 115 3
                                    26 25 25 21 21 117 2 9 0 0 21 119 1 9 0 0
                                    121 2 9 0 0 14 123 2 9 0 0 14 125 2 26 25
                                    25 25 127 1 26 25 25 129 3 26 25 21 21 25
                                    131 3 26 25 21 21 25 133 1 6 10 0 138 1 0
                                    10 0 139 2 26 25 140 25 141 2 0 0 0 6 142 2
                                    26 25 6 25 143 1 6 0 140 144 1 0 0 140 145
                                    2 26 25 6 25 146 1 0 0 0 147 2 0 0 0 19 148
                                    1 6 149 0 150 2 149 10 60 0 151 2 6 0 0 60
                                    152 2 0 0 0 60 153 2 155 154 6 60 156 2 0
                                    10 0 0 1 1 32 10 0 1 1 0 160 0 1 1 0 60 0
                                    89 2 0 67 0 14 76 1 26 157 0 1 1 26 0 0 1 1
                                    26 10 0 139 2 0 0 0 14 124 3 0 0 0 14 14
                                    126 1 0 37 0 42 1 1 0 0 1 1 1 0 0 1 2 31
                                    158 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 0
                                    0 25 1 1 0 0 37 53 1 1 0 0 1 1 1 0 0 1 0 32
                                    0 1 1 0 0 0 130 1 0 0 0 1 1 28 158 0 1 1 0
                                    0 0 137 2 0 55 0 14 64 3 0 55 0 14 14 66 1
                                    0 10 0 1 0 1 0 1 1 0 14 0 1 2 0 14 0 14 1 2
                                    32 10 0 0 1 1 28 10 0 1 1 0 0 0 114 2 1 0 0
                                    21 1 3 0 0 21 21 0 132 2 0 0 0 135 136 2 0
                                    0 106 0 108 1 0 10 0 1 3 0 0 0 160 159 1 3
                                    0 0 0 161 14 1 2 0 0 6 14 15 2 0 0 94 0 96
                                    1 1 0 0 1 1 0 0 0 1 1 0 6 0 1 1 0 162 0 1 1
                                    0 0 0 112 1 0 0 0 110 3 0 0 21 21 0 134 2
                                    25 0 0 60 153 2 1 0 0 19 148 1 1 0 0 147 2
                                    0 164 164 0 1 1 0 163 0 1 3 0 0 0 21 21 118
                                    2 0 0 0 14 120 2 26 158 0 0 1 1 1 0 0 1 1 0
                                    0 0 116 2 10 25 0 6 98 2 9 0 0 0 128 2 0 6
                                    0 14 93 2 8 0 0 60 105 3 8 0 0 60 14 1 2 8
                                    0 0 149 1 3 8 0 0 149 159 1 1 7 0 0 100 2 7
                                    0 0 14 1 2 0 0 0 19 101 1 0 14 0 1 1 1 0 0
                                    1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1
                                    1 0 0 1 1 0 0 0 122 1 27 0 6 23 1 26 0 0 1
                                    1 29 0 21 24 1 1 0 140 145 1 0 0 19 20 1 0
                                    0 67 82 1 0 165 0 1 1 0 25 0 1 2 0 6 0 14
                                    92 1 3 158 0 1 0 29 14 1 1 0 6 0 90 1 1 0 0
                                    1 1 1 0 0 1 2 26 10 0 0 1 1 1 0 0 1 1 1 0 0
                                    1 1 1 0 0 1 1 1 0 0 1 2 11 6 0 14 88 2 29
                                    10 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1
                                    0 0 1 1 1 0 0 1 1 1 0 0 1 2 28 0 0 14 1 2 1
                                    0 0 140 1 2 1 0 0 0 1 2 24 0 0 6 142 2 0 0
                                    0 135 1 0 32 0 17 0 28 0 13 2 8 0 0 60 1 3
                                    8 0 0 60 14 1 2 8 0 0 149 1 3 8 0 0 149 159
                                    1 1 7 0 0 1 2 7 0 0 14 1 2 0 10 0 0 1 2 24
                                    0 0 6 1 2 30 0 0 0 104 1 30 0 0 1 2 0 0 0 0
                                    18 2 30 0 21 0 1 2 32 0 14 0 1 2 1 0 0 140
                                    1 2 1 0 140 0 1 2 0 0 6 0 103 2 0 0 0 0 1 2
                                    0 0 0 6 1 2 0 0 135 0 1)))))
           '|lookupComplete|)) 
