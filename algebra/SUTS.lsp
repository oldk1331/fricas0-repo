
(PUT '|SUTS;makeTerm| '|SPADreplace| 'CONS) 

(SDEFUN |SUTS;makeTerm|
        ((|exp| |Integer|) (|coef| |Coef|)
         ($ |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
        (CONS |exp| |coef|)) 

(PUT '|SUTS;getCoef| '|SPADreplace| 'QCDR) 

(SDEFUN |SUTS;getCoef|
        ((|term| |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)) ($ |Coef|))
        (QCDR |term|)) 

(PUT '|SUTS;getExpon| '|SPADreplace| 'QCAR) 

(SDEFUN |SUTS;getExpon|
        ((|term| |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))
         ($ |Integer|))
        (QCAR |term|)) 

(SDEFUN |SUTS;monomial;CoefNni$;4|
        ((|coef| |Coef|) (|expon| |NonNegativeInteger|) ($ $))
        (SPADCALL |coef| |expon| (QREFELT $ 11))) 

(SDEFUN |SUTS;extend;$Nni$;5| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 14))) 

(SDEFUN |SUTS;Zero;$;6| (($ $))
        (SPADCALL (|spadConstant| $ 16) 0 (QREFELT $ 11))) 

(SDEFUN |SUTS;One;$;7| (($ $))
        (SPADCALL (|spadConstant| $ 18) 0 (QREFELT $ 11))) 

(SDEFUN |SUTS;recip;$U;8| ((|uts| $) ($ |Union| $ "failed"))
        (SPADCALL (|spadConstant| $ 19) |uts| 'T (QREFELT $ 22))) 

(SDEFUN |SUTS;exquo;2$U;9| ((|uts1| $) (|uts2| $) ($ |Union| $ "failed"))
        (SPADCALL |uts1| |uts2| 'T (QREFELT $ 22))) 

(SDEFUN |SUTS;quoByVar;2$;10| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 25))) 

(SDEFUN |SUTS;differentiate;$V$;11| ((|x| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |x| (QREFELT $ 27))) 

(SDEFUN |SUTS;coerce;V$;12| ((|v| |Variable| |var|) ($ $))
        (COND
         ((SPADCALL (QREFELT $ 8) (QREFELT $ 30))
          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13)))
         ('T
          (SPADCALL (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                    (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 13)) (QREFELT $ 31))))) 

(SDEFUN |SUTS;coerce;Up$;13| ((|p| |UnivariatePolynomial| |var| |Coef|) ($ $))
        (SPROG
         ((|st| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 34)) (|spadConstant| $ 17))
                ('T
                 (SEQ
                  (COND
                   ((NULL (SPADCALL (QREFELT $ 8) (QREFELT $ 30)))
                    (LETT |p|
                          (SPADCALL |p|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 18) 1
                                               (QREFELT $ 35))
                                     (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 35))
                                     (QREFELT $ 36))
                                    (QREFELT $ 37))
                          . #1=(|SUTS;coerce;Up$;13|))))
                  (LETT |st| (SPADCALL (QREFELT $ 40)) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |p| (QREFELT $ 34)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ
                        (LETT |st|
                              (SPADCALL
                               (|SUTS;makeTerm| (SPADCALL |p| (QREFELT $ 41))
                                (SPADCALL |p| (QREFELT $ 42)) $)
                               |st| (QREFELT $ 43))
                              . #1#)
                        (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 44)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL (QREFELT $ 46)) (QREFELT $ 48)) |st|
                    (QREFELT $ 49))))))))) 

(SDEFUN |SUTS;univariatePolynomial;$NniUp;14|
        ((|x| $) (|n| |NonNegativeInteger|)
         ($ |UnivariatePolynomial| |var| |Coef|))
        (SPROG
         ((|st| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|ans| (|UnivariatePolynomial| |var| |Coef|))
          (|monPow| (|UnivariatePolynomial| |var| |Coef|))
          (|oldDeg| (|Integer|)) (|pow| (|NonNegativeInteger|)) (#1=#:G170 NIL)
          (#2=#:G176 NIL) (|xExpon| (|Integer|))
          (|xTerm| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
          (|mon| (|UnivariatePolynomial| |var| |Coef|)))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |x| |n| (QREFELT $ 15))
                (LETT |st| (SPADCALL |x| (QREFELT $ 51))
                      . #3=(|SUTS;univariatePolynomial;$NniUp;14|))
                (LETT |ans| (|spadConstant| $ 52) . #3#)
                (LETT |oldDeg| 0 . #3#)
                (LETT |mon|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 35))
                       (SPADCALL (SPADCALL |x| (QREFELT $ 53)) 0
                                 (QREFELT $ 35))
                       (QREFELT $ 54))
                      . #3#)
                (LETT |monPow| (|spadConstant| $ 55) . #3#)
                (SEQ G190
                     (COND ((NULL (SPADCALL |st| (QREFELT $ 56))) (GO G191)))
                     (SEQ
                      (LETT |xExpon|
                            (|SUTS;getExpon|
                             (LETT |xTerm| (SPADCALL |st| (QREFELT $ 57))
                                   . #3#)
                             $)
                            . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |xExpon| |n| (QREFELT $ 58))
                         (PROGN (LETT #2# |ans| . #3#) (GO #4=#:G175)))
                        ('T
                         (SEQ
                          (LETT |pow|
                                (PROG1 (LETT #1# (- |xExpon| |oldDeg|) . #3#)
                                  (|check_subtype| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                                . #3#)
                          (LETT |oldDeg| |xExpon| . #3#)
                          (LETT |monPow|
                                (SPADCALL |monPow|
                                          (SPADCALL |mon| |pow| (QREFELT $ 59))
                                          (QREFELT $ 60))
                                . #3#)
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL (|SUTS;getCoef| |xTerm| $)
                                                    |monPow| (QREFELT $ 61))
                                          (QREFELT $ 36))
                                . #3#)
                          (EXIT
                           (LETT |st| (SPADCALL |st| (QREFELT $ 62))
                                 . #3#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))
          #4# (EXIT #2#)))) 

(SDEFUN |SUTS;polynomial;$NniP;15|
        ((|x| $) (|n| |NonNegativeInteger|) ($ |Polynomial| |Coef|))
        (SPROG
         ((|st| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|ans| (|Polynomial| |Coef|)) (|monPow| (|Polynomial| |Coef|))
          (|oldDeg| (|Integer|)) (|pow| (|NonNegativeInteger|)) (#1=#:G178 NIL)
          (#2=#:G184 NIL) (|xExpon| (|Integer|))
          (|xTerm| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
          (|mon| (|Polynomial| |Coef|)))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |x| |n| (QREFELT $ 15))
                (LETT |st| (SPADCALL |x| (QREFELT $ 51))
                      . #3=(|SUTS;polynomial;$NniP;15|))
                (LETT |ans| (|spadConstant| $ 65) . #3#)
                (LETT |oldDeg| 0 . #3#)
                (LETT |mon|
                      (SPADCALL (SPADCALL (QREFELT $ 7) (QREFELT $ 67))
                                (SPADCALL (SPADCALL |x| (QREFELT $ 53))
                                          (QREFELT $ 68))
                                (QREFELT $ 69))
                      . #3#)
                (LETT |monPow| (|spadConstant| $ 70) . #3#)
                (SEQ G190
                     (COND ((NULL (SPADCALL |st| (QREFELT $ 56))) (GO G191)))
                     (SEQ
                      (LETT |xExpon|
                            (|SUTS;getExpon|
                             (LETT |xTerm| (SPADCALL |st| (QREFELT $ 57))
                                   . #3#)
                             $)
                            . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |xExpon| |n| (QREFELT $ 58))
                         (PROGN (LETT #2# |ans| . #3#) (GO #4=#:G183)))
                        ('T
                         (SEQ
                          (LETT |pow|
                                (PROG1 (LETT #1# (- |xExpon| |oldDeg|) . #3#)
                                  (|check_subtype| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                                . #3#)
                          (LETT |oldDeg| |xExpon| . #3#)
                          (LETT |monPow|
                                (SPADCALL |monPow|
                                          (SPADCALL |mon| |pow| (QREFELT $ 71))
                                          (QREFELT $ 72))
                                . #3#)
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL (|SUTS;getCoef| |xTerm| $)
                                                    |monPow| (QREFELT $ 73))
                                          (QREFELT $ 74))
                                . #3#)
                          (EXIT
                           (LETT |st| (SPADCALL |st| (QREFELT $ 62))
                                 . #3#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))
          #4# (EXIT #2#)))) 

(SDEFUN |SUTS;polynomial;$2NniP;16|
        ((|x| $) (|n1| . #1=(|NonNegativeInteger|)) (|n2| . #1#)
         ($ |Polynomial| |Coef|))
        (SPADCALL (SPADCALL |x| |n1| |n2| (QREFELT $ 76)) |n2| (QREFELT $ 75))) 

(SDEFUN |SUTS;truncate;$Nni$;17| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 78))) 

(SDEFUN |SUTS;truncate;$2Nni$;18|
        ((|x| $) (|n1| . #1=(|NonNegativeInteger|)) (|n2| . #1#) ($ $))
        (SPADCALL |x| |n1| |n2| (QREFELT $ 80))) 

(SDEFUN |SUTS;iCoefficients|
        ((|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|n| |Integer|) ($ |Stream| |Coef|))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|SUTS;iCoefficients!0| (VECTOR |refer| |n| $ |x|))
                 (QREFELT $ 96))))) 

(SDEFUN |SUTS;iCoefficients!0| (($$ NIL))
        (PROG (|x| $ |n| |refer|)
          (LETT |x| (QREFELT $$ 3) . #1=(|SUTS;iCoefficients|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |n| (QREFELT $$ 1) . #1#)
          (LETT |refer| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|nn| NIL) (|nx| NIL) (|xTerm| NIL) (|xCoef| NIL) (|xExpon| NIL))
             (SEQ
              (COND ((SPADCALL |x| (QREFELT $ 81)) (SPADCALL (QREFELT $ 83)))
                    ('T
                     (SEQ (LETT |nn| (SPADCALL |n| (QREFELT $ 84)) NIL)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (SPADCALL
                                   (LETT |nx| (SPADCALL |refer| (QREFELT $ 85))
                                         NIL)
                                   |nn| (QREFELT $ 86)))
                                 (GO G191)))
                               (SEQ (EXIT (SPADCALL |x| (QREFELT $ 87)))) NIL
                               (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (COND
                            ((SPADCALL |x| (QREFELT $ 56))
                             (SEQ
                              (LETT |xCoef|
                                    (|SUTS;getCoef|
                                     (LETT |xTerm|
                                           (SPADCALL |x| (QREFELT $ 57)) NIL)
                                     $)
                                    NIL)
                              (LETT |xExpon| (|SUTS;getExpon| |xTerm| $) NIL)
                              (EXIT
                               (COND
                                ((SPADCALL |xExpon| |n| (QREFELT $ 88))
                                 (SPADCALL |xCoef|
                                           (|SUTS;iCoefficients|
                                            (SPADCALL |x| (QREFELT $ 62))
                                            |refer|
                                            (SPADCALL |n| (|spadConstant| $ 89)
                                                      (QREFELT $ 90))
                                            $)
                                           (QREFELT $ 91)))
                                ('T
                                 (SPADCALL (|spadConstant| $ 16)
                                           (|SUTS;iCoefficients| |x| |refer|
                                            (SPADCALL |n| (|spadConstant| $ 89)
                                                      (QREFELT $ 90))
                                            $)
                                           (QREFELT $ 91)))))))
                            ('T
                             (SPADCALL (|spadConstant| $ 16)
                                       (|SUTS;iCoefficients| |x| |refer|
                                        (SPADCALL |n| (|spadConstant| $ 89)
                                                  (QREFELT $ 90))
                                        $)
                                       (QREFELT $ 91)))))))))))))) 

(SDEFUN |SUTS;coefficients;$S;20| ((|uts| $) ($ |Stream| |Coef|))
        (SPROG
         ((|x| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|refer| (|Reference| (|OrderedCompletion| (|Integer|)))))
         (SEQ
          (LETT |refer| (SPADCALL |uts| (QREFELT $ 97))
                . #1=(|SUTS;coefficients;$S;20|))
          (LETT |x| (SPADCALL |uts| (QREFELT $ 51)) . #1#)
          (EXIT (|SUTS;iCoefficients| |x| |refer| 0 $))))) 

(SDEFUN |SUTS;terms;$S;21|
        ((|uts| $)
         ($ |Stream|
          (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |Coef|))))
        (SPADCALL |uts| (QREFELT $ 99))) 

(SDEFUN |SUTS;iSeries|
        ((|st| |Stream| |Coef|) (|n| |Integer|)
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|SUTS;iSeries!0| (VECTOR |n| |refer| $ |st|))
                          (QREFELT $ 107))))) 

(SDEFUN |SUTS;iSeries!0| (($$ NIL))
        (PROG (|st| $ |refer| |n|)
          (LETT |st| (QREFELT $$ 3) . #1=(|SUTS;iSeries|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |refer| (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|coef| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |st| (QREFELT $ 103))
                      (SEQ
                       (SPADCALL |refer| (SPADCALL (QREFELT $ 46))
                                 (QREFELT $ 104))
                       (EXIT (SPADCALL (QREFELT $ 40)))))
                     ('T
                      (SEQ
                       (SPADCALL |refer| (SPADCALL |n| (QREFELT $ 84))
                                 (QREFELT $ 104))
                       (EXIT
                        (COND
                         ((SPADCALL
                           (LETT |coef| (SPADCALL |st| (QREFELT $ 105)) NIL)
                           (QREFELT $ 30))
                          (|SUTS;iSeries| (SPADCALL |st| (QREFELT $ 106))
                           (SPADCALL |n| (|spadConstant| $ 89) (QREFELT $ 90))
                           |refer| $))
                         ('T
                          (SPADCALL (|SUTS;makeTerm| |n| |coef| $)
                                    (|SUTS;iSeries|
                                     (SPADCALL |st| (QREFELT $ 106))
                                     (SPADCALL |n| (|spadConstant| $ 89)
                                               (QREFELT $ 90))
                                     |refer| $)
                                    (QREFELT $ 43)))))))))))))) 

(SDEFUN |SUTS;series;S$;23| ((|st| |Stream| |Coef|) ($ $))
        (SPROG ((|refer| (|Reference| (|OrderedCompletion| (|Integer|)))))
               (SEQ
                (LETT |refer|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 108) (QREFELT $ 109))
                       (QREFELT $ 48))
                      |SUTS;series;S$;23|)
                (EXIT
                 (SPADCALL |refer| (|SUTS;iSeries| |st| 0 |refer| $)
                           (QREFELT $ 49)))))) 

(SDEFUN |SUTS;nniToI|
        ((|st| |Stream|
          (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |Coef|)))
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG ((|term| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
               (SEQ
                (COND
                 ((SPADCALL |st| (QREFELT $ 111)) (SPADCALL (QREFELT $ 40)))
                 ('T
                  (SEQ
                   (LETT |term|
                         (CONS (QCAR (SPADCALL |st| (QREFELT $ 112)))
                               (QCDR (SPADCALL |st| (QREFELT $ 112))))
                         |SUTS;nniToI|)
                   (EXIT
                    (SPADCALL |term|
                              (|SUTS;nniToI| (SPADCALL |st| (QREFELT $ 113)) $)
                              (QREFELT $ 43))))))))) 

(SDEFUN |SUTS;series;S$;25|
        ((|st| |Stream|
          (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |Coef|)))
         ($ $))
        (SPADCALL (|SUTS;nniToI| |st| $) (QREFELT $ 114))) 

(SDEFUN |SUTS;variable;$S;26| ((|x| $) ($ |Symbol|)) (QREFELT $ 7)) 

(SDEFUN |SUTS;center;$Coef;27| ((|x| $) ($ |Coef|)) (QREFELT $ 8)) 

(SDEFUN |SUTS;coefficient;$NniCoef;28|
        ((|x| $) (|n| |NonNegativeInteger|) ($ |Coef|))
        (SPADCALL |x| |n| (QREFELT $ 117))) 

(SDEFUN |SUTS;elt;$NniCoef;29| ((|x| $) (|n| |NonNegativeInteger|) ($ |Coef|))
        (SPADCALL |x| |n| (QREFELT $ 118))) 

(PUT '|SUTS;pole?;$B;30| '|SPADreplace| '(XLAM (|x|) 'NIL)) 

(SDEFUN |SUTS;pole?;$B;30| ((|x| $) ($ |Boolean|)) 'NIL) 

(SDEFUN |SUTS;order;$Nni;31| ((|x| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G247 NIL))
               (PROG1
                   (LETT #1# (SPADCALL |x| (QREFELT $ 121))
                         |SUTS;order;$Nni;31|)
                 (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |SUTS;order;$2Nni;32|
        ((|x| $) (|n| . #1=(|NonNegativeInteger|)) ($ . #1#))
        (SPROG ((#2=#:G249 NIL))
               (PROG1
                   (LETT #2# (SPADCALL |x| |n| (QREFELT $ 123))
                         |SUTS;order;$2Nni;32|)
                 (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#)))) 

(SDEFUN |SUTS;elt;3$;33| ((|uts1| $) (|uts2| $) ($ $))
        (COND
         ((SPADCALL |uts2| (QREFELT $ 125))
          (SPADCALL (SPADCALL |uts1| 0 (QREFELT $ 118)) (QREFELT $ 126)))
         ((NULL (SPADCALL (SPADCALL |uts2| 0 (QREFELT $ 118)) (QREFELT $ 30)))
          (|error| "elt: second argument must have positive order"))
         ('T (SPADCALL |uts1| |uts2| (QREFELT $ 127))))) 

(SDEFUN |SUTS;integrate;$V$;34| ((|x| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |x| (QREFELT $ 129))) 

(SDEFUN |SUTS;^;3$;35| ((|uts1| $) (|uts2| $) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL |uts1| (QREFELT $ 131)) |uts2| (QREFELT $ 132))
         (QREFELT $ 133))) 

(SDEFUN |SUTS;^;$F$;36| ((|uts| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |uts| |r| (QREFELT $ 136))) 

(SDEFUN |SUTS;exp;2$;37| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 138))) 

(SDEFUN |SUTS;log;2$;38| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 139))) 

(SDEFUN |SUTS;sin;2$;39| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 140))) 

(SDEFUN |SUTS;cos;2$;40| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 142))) 

(SDEFUN |SUTS;tan;2$;41| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 144))) 

(SDEFUN |SUTS;cot;2$;42| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 146))) 

(SDEFUN |SUTS;sec;2$;43| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 148))) 

(SDEFUN |SUTS;csc;2$;44| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 150))) 

(SDEFUN |SUTS;asin;2$;45| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 152))) 

(SDEFUN |SUTS;acos;2$;46| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 154))) 

(SDEFUN |SUTS;atan;2$;47| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 156))) 

(SDEFUN |SUTS;acot;2$;48| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 158))) 

(SDEFUN |SUTS;asec;2$;49| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 160))) 

(SDEFUN |SUTS;acsc;2$;50| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 162))) 

(SDEFUN |SUTS;sinh;2$;51| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 164))) 

(SDEFUN |SUTS;cosh;2$;52| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 166))) 

(SDEFUN |SUTS;tanh;2$;53| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 168))) 

(SDEFUN |SUTS;coth;2$;54| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 170))) 

(SDEFUN |SUTS;sech;2$;55| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 172))) 

(SDEFUN |SUTS;csch;2$;56| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 174))) 

(SDEFUN |SUTS;asinh;2$;57| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 176))) 

(SDEFUN |SUTS;acosh;2$;58| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 178))) 

(SDEFUN |SUTS;atanh;2$;59| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 180))) 

(SDEFUN |SUTS;acoth;2$;60| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 182))) 

(SDEFUN |SUTS;asech;2$;61| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 184))) 

(SDEFUN |SUTS;acsch;2$;62| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 186))) 

(SDEFUN |SUTS;^;$F$;63| ((|uts| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG ((|ratPow| ($)) (|onePlusX| ($)))
               (SEQ
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118))
                             (|spadConstant| $ 18) (QREFELT $ 191)))
                  (|error| "^: constant coefficient must be one"))
                 ('T
                  (SEQ
                   (LETT |onePlusX|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 0 (QREFELT $ 13))
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 31))
                         . #1=(|SUTS;^;$F$;63|))
                   (LETT |ratPow|
                         (SPADCALL |uts| (SPADCALL |r| (QREFELT $ 192))
                                   (QREFELT $ 193))
                         . #1#)
                   (EXIT
                    (SPADCALL |ratPow|
                              (SPADCALL |uts| (|spadConstant| $ 19)
                                        (QREFELT $ 194))
                              (QREFELT $ 127))))))))) 

(SDEFUN |SUTS;exp;2$;64| ((|uts| $) ($ $))
        (SPROG ((|expx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
                  (SEQ
                   (LETT |expx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 138))
                         |SUTS;exp;2$;64|)
                   (EXIT (SPADCALL |expx| |uts| (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "exp: " (QREFELT $ 188))
                             (QREFELT $ 197)))))))) 

(SDEFUN |SUTS;log;2$;65| ((|uts| $) ($ $))
        (SPROG ((|log1PlusX| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118))
                            (|spadConstant| $ 18) (QREFELT $ 191))
                  (SEQ
                   (LETT |log1PlusX|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 18) 0 (QREFELT $ 13))
                           (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                           (QREFELT $ 31))
                          (QREFELT $ 139))
                         |SUTS;log;2$;65|)
                   (EXIT
                    (SPADCALL |log1PlusX|
                              (SPADCALL |uts| (|spadConstant| $ 19)
                                        (QREFELT $ 194))
                              (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "log: " (QREFELT $ 189))
                             (QREFELT $ 197)))))))) 

(SDEFUN |SUTS;sin;2$;66| ((|uts| $) ($ $))
        (SPROG ((|sinx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
                  (SEQ
                   (LETT |sinx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 140))
                         |SUTS;sin;2$;66|)
                   (EXIT (SPADCALL |sinx| |uts| (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "sin: " (QREFELT $ 188))
                             (QREFELT $ 197)))))))) 

(SDEFUN |SUTS;cos;2$;67| ((|uts| $) ($ $))
        (SPROG ((|cosx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
                  (SEQ
                   (LETT |cosx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 142))
                         |SUTS;cos;2$;67|)
                   (EXIT (SPADCALL |cosx| |uts| (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "cos: " (QREFELT $ 188))
                             (QREFELT $ 197)))))))) 

(SDEFUN |SUTS;tan;2$;68| ((|uts| $) ($ $))
        (SPROG ((|tanx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
                  (SEQ
                   (LETT |tanx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 144))
                         |SUTS;tan;2$;68|)
                   (EXIT (SPADCALL |tanx| |uts| (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "tan: " (QREFELT $ 188))
                             (QREFELT $ 197)))))))) 

(SDEFUN |SUTS;cot;2$;69| ((|uts| $) ($ $))
        (COND
         ((SPADCALL |uts| (QREFELT $ 125))
          (|error| "cot: cot(0) is undefined"))
         ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
          (|error|
           (SPADCALL (STRCONC "cot: " (QREFELT $ 190)) (QREFELT $ 197))))
         ('T
          (|error|
           (SPADCALL (STRCONC "cot: " (QREFELT $ 188)) (QREFELT $ 197)))))) 

(SDEFUN |SUTS;sec;2$;70| ((|uts| $) ($ $))
        (SPROG ((|secx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
                  (SEQ
                   (LETT |secx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 148))
                         |SUTS;sec;2$;70|)
                   (EXIT (SPADCALL |secx| |uts| (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "sec: " (QREFELT $ 188))
                             (QREFELT $ 197)))))))) 

(SDEFUN |SUTS;csc;2$;71| ((|uts| $) ($ $))
        (COND
         ((SPADCALL |uts| (QREFELT $ 125))
          (|error| "csc: csc(0) is undefined"))
         ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
          (|error|
           (SPADCALL (STRCONC "csc: " (QREFELT $ 190)) (QREFELT $ 197))))
         ('T
          (|error|
           (SPADCALL (STRCONC "csc: " (QREFELT $ 188)) (QREFELT $ 197)))))) 

(SDEFUN |SUTS;asin;2$;72| ((|uts| $) ($ $))
        (SPROG ((|asinx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
                  (SEQ
                   (LETT |asinx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 152))
                         |SUTS;asin;2$;72|)
                   (EXIT (SPADCALL |asinx| |uts| (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "asin: " (QREFELT $ 188))
                             (QREFELT $ 197)))))))) 

(SDEFUN |SUTS;atan;2$;73| ((|uts| $) ($ $))
        (SPROG ((|atanx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
                  (SEQ
                   (LETT |atanx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 156))
                         |SUTS;atan;2$;73|)
                   (EXIT (SPADCALL |atanx| |uts| (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "atan: " (QREFELT $ 188))
                             (QREFELT $ 197)))))))) 

(PUT '|SUTS;acos;2$;74| '|SPADreplace|
     '(XLAM (|z|) (|error| "acos: acos undefined on this coefficient domain"))) 

(SDEFUN |SUTS;acos;2$;74| ((|z| $) ($ $))
        (|error| "acos: acos undefined on this coefficient domain")) 

(PUT '|SUTS;acot;2$;75| '|SPADreplace|
     '(XLAM (|z|) (|error| "acot: acot undefined on this coefficient domain"))) 

(SDEFUN |SUTS;acot;2$;75| ((|z| $) ($ $))
        (|error| "acot: acot undefined on this coefficient domain")) 

(PUT '|SUTS;asec;2$;76| '|SPADreplace|
     '(XLAM (|z|) (|error| "asec: asec undefined on this coefficient domain"))) 

(SDEFUN |SUTS;asec;2$;76| ((|z| $) ($ $))
        (|error| "asec: asec undefined on this coefficient domain")) 

(PUT '|SUTS;acsc;2$;77| '|SPADreplace|
     '(XLAM (|z|) (|error| "acsc: acsc undefined on this coefficient domain"))) 

(SDEFUN |SUTS;acsc;2$;77| ((|z| $) ($ $))
        (|error| "acsc: acsc undefined on this coefficient domain")) 

(SDEFUN |SUTS;sinh;2$;78| ((|uts| $) ($ $))
        (SPROG ((|sinhx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
                  (SEQ
                   (LETT |sinhx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 164))
                         |SUTS;sinh;2$;78|)
                   (EXIT (SPADCALL |sinhx| |uts| (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "sinh: " (QREFELT $ 188))
                             (QREFELT $ 197)))))))) 

(SDEFUN |SUTS;cosh;2$;79| ((|uts| $) ($ $))
        (SPROG ((|coshx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
                  (SEQ
                   (LETT |coshx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 166))
                         |SUTS;cosh;2$;79|)
                   (EXIT (SPADCALL |coshx| |uts| (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "cosh: " (QREFELT $ 188))
                             (QREFELT $ 197)))))))) 

(SDEFUN |SUTS;tanh;2$;80| ((|uts| $) ($ $))
        (SPROG ((|tanhx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
                  (SEQ
                   (LETT |tanhx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 168))
                         |SUTS;tanh;2$;80|)
                   (EXIT (SPADCALL |tanhx| |uts| (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "tanh: " (QREFELT $ 188))
                             (QREFELT $ 197)))))))) 

(SDEFUN |SUTS;coth;2$;81| ((|uts| $) ($ $))
        (COND
         ((SPADCALL |uts| (QREFELT $ 125))
          (|error| "coth: coth(0) is undefined"))
         ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
          (|error|
           (SPADCALL (STRCONC "coth: " (QREFELT $ 190)) (QREFELT $ 197))))
         ('T
          (|error|
           (SPADCALL (STRCONC "coth: " (QREFELT $ 188)) (QREFELT $ 197)))))) 

(SDEFUN |SUTS;sech;2$;82| ((|uts| $) ($ $))
        (SPROG ((|sechx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
                  (SEQ
                   (LETT |sechx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 172))
                         |SUTS;sech;2$;82|)
                   (EXIT (SPADCALL |sechx| |uts| (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "sech: " (QREFELT $ 188))
                             (QREFELT $ 197)))))))) 

(SDEFUN |SUTS;csch;2$;83| ((|uts| $) ($ $))
        (COND
         ((SPADCALL |uts| (QREFELT $ 125))
          (|error| "csch: csch(0) is undefined"))
         ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
          (|error|
           (SPADCALL (STRCONC "csch: " (QREFELT $ 190)) (QREFELT $ 197))))
         ('T
          (|error|
           (SPADCALL (STRCONC "csch: " (QREFELT $ 188)) (QREFELT $ 197)))))) 

(SDEFUN |SUTS;asinh;2$;84| ((|uts| $) ($ $))
        (SPROG ((|asinhx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
                  (SEQ
                   (LETT |asinhx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 176))
                         |SUTS;asinh;2$;84|)
                   (EXIT (SPADCALL |asinhx| |uts| (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "asinh: " (QREFELT $ 188))
                             (QREFELT $ 197)))))))) 

(SDEFUN |SUTS;atanh;2$;85| ((|uts| $) ($ $))
        (SPROG ((|atanhx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 118)) (QREFELT $ 30))
                  (SEQ
                   (LETT |atanhx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 180))
                         |SUTS;atanh;2$;85|)
                   (EXIT (SPADCALL |atanhx| |uts| (QREFELT $ 127)))))
                 ('T
                  (|error|
                   (SPADCALL (STRCONC "atanh: " (QREFELT $ 188))
                             (QREFELT $ 197)))))))) 

(PUT '|SUTS;acosh;2$;86| '|SPADreplace|
     '(XLAM (|uts|)
       (|error| "acosh: acosh undefined on this coefficient domain"))) 

(SDEFUN |SUTS;acosh;2$;86| ((|uts| $) ($ $))
        (|error| "acosh: acosh undefined on this coefficient domain")) 

(PUT '|SUTS;acoth;2$;87| '|SPADreplace|
     '(XLAM (|uts|)
       (|error| "acoth: acoth undefined on this coefficient domain"))) 

(SDEFUN |SUTS;acoth;2$;87| ((|uts| $) ($ $))
        (|error| "acoth: acoth undefined on this coefficient domain")) 

(PUT '|SUTS;asech;2$;88| '|SPADreplace|
     '(XLAM (|uts|)
       (|error| "asech: asech undefined on this coefficient domain"))) 

(SDEFUN |SUTS;asech;2$;88| ((|uts| $) ($ $))
        (|error| "asech: asech undefined on this coefficient domain")) 

(PUT '|SUTS;acsch;2$;89| '|SPADreplace|
     '(XLAM (|uts|)
       (|error| "acsch: acsch undefined on this coefficient domain"))) 

(SDEFUN |SUTS;acsch;2$;89| ((|uts| $) ($ $))
        (|error| "acsch: acsch undefined on this coefficient domain")) 

(SDEFUN |SUTS;^;$Coef$;90| ((|uts| $) (|r| |Coef|) ($ $))
        (COND
         ((NULL
           (SPADCALL (SPADCALL |uts| 1 (QREFELT $ 118)) (|spadConstant| $ 18)
                     (QREFELT $ 191)))
          (|error| "^: constant coefficient should be 1"))
         ('T (SPADCALL |uts| |r| (QREFELT $ 193))))) 

(SDEFUN |SUTS;coerce;$Of;91| ((|x| $) ($ |OutputForm|))
        (SPROG ((|count| (|NonNegativeInteger|)))
               (SEQ (LETT |count| |$streamCount| |SUTS;coerce;$Of;91|)
                    (SPADCALL |x| |count| (QREFELT $ 15))
                    (EXIT
                     (SPADCALL (SPADCALL |x| (QREFELT $ 51))
                               (SPADCALL |x| (QREFELT $ 97))
                               (SPADCALL |x| (QREFELT $ 116))
                               (SPADCALL |x| (QREFELT $ 53))
                               (|spadConstant| $ 199) (QREFELT $ 200)))))) 

(DECLAIM (NOTINLINE |SparseUnivariateTaylorSeries;|)) 

(DEFUN |SparseUnivariateTaylorSeries| (&REST #1=#:G365)
  (SPROG NIL
         (PROG (#2=#:G366)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseUnivariateTaylorSeries|)
                                               '|domainEqualList|)
                    . #3=(|SparseUnivariateTaylorSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseUnivariateTaylorSeries;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseUnivariateTaylorSeries|)))))))))) 

(DEFUN |SparseUnivariateTaylorSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G357 NIL) (#2=#:G358 NIL) (#3=#:G359 NIL) (#4=#:G360 NIL)
    (#5=#:G361 NIL) (#6=#:G364 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #7=(|SparseUnivariateTaylorSeries|))
    (LETT DV$2 (|devaluate| |#2|) . #7#)
    (LETT DV$3 (|devaluate| |#3|) . #7#)
    (LETT |dv$| (LIST '|SparseUnivariateTaylorSeries| DV$1 DV$2 DV$3) . #7#)
    (LETT $ (GETREFV 212) . #7#)
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
    (|haddProp| |$ConstructorCache| '|SparseUnivariateTaylorSeries|
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
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         #4#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR #3# (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR #2# (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR #1# (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 2147483648))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|InnerSparseUnivariatePowerSeries| |#1|))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 24 (CONS (|dispatchFunction| |SUTS;exquo;2$U;9|) $))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 130 (CONS (|dispatchFunction| |SUTS;integrate;$V$;34|) $))
       (QSETREFV $ 134 (CONS (|dispatchFunction| |SUTS;^;3$;35|) $))
       (COND
        ((|testBitVector| |pv$| 5)
         (PROGN
          (QSETREFV $ 137 (CONS (|dispatchFunction| |SUTS;^;$F$;36|) $))
          (QSETREFV $ 133 (CONS (|dispatchFunction| |SUTS;exp;2$;37|) $))
          (QSETREFV $ 131 (CONS (|dispatchFunction| |SUTS;log;2$;38|) $))
          (QSETREFV $ 141 (CONS (|dispatchFunction| |SUTS;sin;2$;39|) $))
          (QSETREFV $ 143 (CONS (|dispatchFunction| |SUTS;cos;2$;40|) $))
          (QSETREFV $ 145 (CONS (|dispatchFunction| |SUTS;tan;2$;41|) $))
          (QSETREFV $ 147 (CONS (|dispatchFunction| |SUTS;cot;2$;42|) $))
          (QSETREFV $ 149 (CONS (|dispatchFunction| |SUTS;sec;2$;43|) $))
          (QSETREFV $ 151 (CONS (|dispatchFunction| |SUTS;csc;2$;44|) $))
          (QSETREFV $ 153 (CONS (|dispatchFunction| |SUTS;asin;2$;45|) $))
          (QSETREFV $ 155 (CONS (|dispatchFunction| |SUTS;acos;2$;46|) $))
          (QSETREFV $ 157 (CONS (|dispatchFunction| |SUTS;atan;2$;47|) $))
          (QSETREFV $ 159 (CONS (|dispatchFunction| |SUTS;acot;2$;48|) $))
          (QSETREFV $ 161 (CONS (|dispatchFunction| |SUTS;asec;2$;49|) $))
          (QSETREFV $ 163 (CONS (|dispatchFunction| |SUTS;acsc;2$;50|) $))
          (QSETREFV $ 165 (CONS (|dispatchFunction| |SUTS;sinh;2$;51|) $))
          (QSETREFV $ 167 (CONS (|dispatchFunction| |SUTS;cosh;2$;52|) $))
          (QSETREFV $ 169 (CONS (|dispatchFunction| |SUTS;tanh;2$;53|) $))
          (QSETREFV $ 171 (CONS (|dispatchFunction| |SUTS;coth;2$;54|) $))
          (QSETREFV $ 173 (CONS (|dispatchFunction| |SUTS;sech;2$;55|) $))
          (QSETREFV $ 175 (CONS (|dispatchFunction| |SUTS;csch;2$;56|) $))
          (QSETREFV $ 177 (CONS (|dispatchFunction| |SUTS;asinh;2$;57|) $))
          (QSETREFV $ 179 (CONS (|dispatchFunction| |SUTS;acosh;2$;58|) $))
          (QSETREFV $ 181 (CONS (|dispatchFunction| |SUTS;atanh;2$;59|) $))
          (QSETREFV $ 183 (CONS (|dispatchFunction| |SUTS;acoth;2$;60|) $))
          (QSETREFV $ 185 (CONS (|dispatchFunction| |SUTS;asech;2$;61|) $))
          (QSETREFV $ 187 (CONS (|dispatchFunction| |SUTS;acsch;2$;62|) $))))
        ('T
         (PROGN
          (QSETREFV $ 188 "series must have constant coefficient zero")
          (QSETREFV $ 189 "series must have constant coefficient one")
          (QSETREFV $ 190 "series expansion has terms of negative degree")
          (QSETREFV $ 137 (CONS (|dispatchFunction| |SUTS;^;$F$;63|) $))
          (QSETREFV $ 133 (CONS (|dispatchFunction| |SUTS;exp;2$;64|) $))
          (QSETREFV $ 131 (CONS (|dispatchFunction| |SUTS;log;2$;65|) $))
          (QSETREFV $ 141 (CONS (|dispatchFunction| |SUTS;sin;2$;66|) $))
          (QSETREFV $ 143 (CONS (|dispatchFunction| |SUTS;cos;2$;67|) $))
          (QSETREFV $ 145 (CONS (|dispatchFunction| |SUTS;tan;2$;68|) $))
          (QSETREFV $ 147 (CONS (|dispatchFunction| |SUTS;cot;2$;69|) $))
          (QSETREFV $ 149 (CONS (|dispatchFunction| |SUTS;sec;2$;70|) $))
          (QSETREFV $ 151 (CONS (|dispatchFunction| |SUTS;csc;2$;71|) $))
          (QSETREFV $ 153 (CONS (|dispatchFunction| |SUTS;asin;2$;72|) $))
          (QSETREFV $ 157 (CONS (|dispatchFunction| |SUTS;atan;2$;73|) $))
          (QSETREFV $ 155 (CONS (|dispatchFunction| |SUTS;acos;2$;74|) $))
          (QSETREFV $ 159 (CONS (|dispatchFunction| |SUTS;acot;2$;75|) $))
          (QSETREFV $ 161 (CONS (|dispatchFunction| |SUTS;asec;2$;76|) $))
          (QSETREFV $ 163 (CONS (|dispatchFunction| |SUTS;acsc;2$;77|) $))
          (QSETREFV $ 165 (CONS (|dispatchFunction| |SUTS;sinh;2$;78|) $))
          (QSETREFV $ 167 (CONS (|dispatchFunction| |SUTS;cosh;2$;79|) $))
          (QSETREFV $ 169 (CONS (|dispatchFunction| |SUTS;tanh;2$;80|) $))
          (QSETREFV $ 171 (CONS (|dispatchFunction| |SUTS;coth;2$;81|) $))
          (QSETREFV $ 173 (CONS (|dispatchFunction| |SUTS;sech;2$;82|) $))
          (QSETREFV $ 175 (CONS (|dispatchFunction| |SUTS;csch;2$;83|) $))
          (QSETREFV $ 177 (CONS (|dispatchFunction| |SUTS;asinh;2$;84|) $))
          (QSETREFV $ 181 (CONS (|dispatchFunction| |SUTS;atanh;2$;85|) $))
          (QSETREFV $ 179 (CONS (|dispatchFunction| |SUTS;acosh;2$;86|) $))
          (QSETREFV $ 183 (CONS (|dispatchFunction| |SUTS;acoth;2$;87|) $))
          (QSETREFV $ 185 (CONS (|dispatchFunction| |SUTS;asech;2$;88|) $))
          (QSETREFV $ 187
                    (CONS (|dispatchFunction| |SUTS;acsch;2$;89|) $))))))))
    (COND
     ((|testBitVector| |pv$| 24)
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 198 (CONS (|dispatchFunction| |SUTS;^;$Coef$;90|) $))))))
    $))) 

(MAKEPROP '|SparseUnivariateTaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerSparseUnivariatePowerSeries| 6)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Integer|)
              (0 . |monomial|) (|NonNegativeInteger|)
              |SUTS;monomial;CoefNni$;4| (6 . |extend|) |SUTS;extend;$Nni$;5|
              (12 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SUTS;Zero;$;6|) $))
              (16 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SUTS;One;$;7|) $))
              (|Union| $ '"failed") (|Boolean|) (20 . |iExquo|)
              |SUTS;recip;$U;8| (27 . |exquo|) (33 . |taylorQuoByVar|)
              |SUTS;quoByVar;2$;10| (38 . |differentiate|) (|Variable| 7)
              |SUTS;differentiate;$V$;11| (43 . |zero?|) (48 . +)
              |SUTS;coerce;V$;12| (|UnivariatePolynomial| 7 6) (54 . |zero?|)
              (59 . |monomial|) (65 . +) (71 . |elt|)
              (|Record| (|:| |k| 10) (|:| |c| 6)) (|Stream| 38) (77 . |empty|)
              (81 . |degree|) (86 . |leadingCoefficient|) (91 . |concat|)
              (97 . |reductum|) (|OrderedCompletion| 10) (102 . |plusInfinity|)
              (|Reference| 45) (106 . |ref|) (111 . |makeSeries|)
              |SUTS;coerce;Up$;13| (117 . |getStream|) (122 . |Zero|)
              |SUTS;center;$Coef;27| (126 . -) (132 . |One|)
              (136 . |explicitEntries?|) (141 . |frst|) (146 . >) (152 . ^)
              (158 . *) (164 . *) (170 . |rst|)
              |SUTS;univariatePolynomial;$NniUp;14| (|Polynomial| 6)
              (175 . |Zero|) (|Symbol|) (179 . |coerce|) (184 . |coerce|)
              (189 . -) (195 . |One|) (199 . ^) (205 . *) (211 . *) (217 . +)
              |SUTS;polynomial;$NniP;15| |SUTS;truncate;$2Nni$;18|
              |SUTS;polynomial;$2NniP;16| (223 . |truncate|)
              |SUTS;truncate;$Nni$;17| (229 . |truncate|)
              (236 . |explicitlyEmpty?|) (|Stream| 6) (241 . |empty|)
              (245 . |coerce|) (250 . |elt|) (255 . <) (261 . |lazyEvaluate|)
              (266 . =) (272 . |One|) (276 . +) (282 . |concat|) (288 . |Zero|)
              (292 . |Zero|) (296 . |Zero|) (|Mapping| $) (300 . |delay|)
              (305 . |getRef|) |SUTS;coefficients;$S;20| (310 . |terms|)
              (|Record| (|:| |k| 12) (|:| |c| 6)) (|Stream| 100)
              |SUTS;terms;$S;21| (315 . |empty?|) (320 . |setelt|)
              (326 . |frst|) (331 . |rst|) (336 . |delay|) (341 . |One|)
              (345 . -) |SUTS;series;S$;23| (350 . |empty?|) (355 . |frst|)
              (360 . |rst|) (365 . |series|) |SUTS;series;S$;25|
              |SUTS;variable;$S;26| (370 . |coefficient|)
              |SUTS;coefficient;$NniCoef;28| |SUTS;elt;$NniCoef;29|
              |SUTS;pole?;$B;30| (376 . |order|) |SUTS;order;$Nni;31|
              (381 . |order|) |SUTS;order;$2Nni;32| (387 . |zero?|)
              (392 . |coerce|) (397 . |iCompose|) |SUTS;elt;3$;33|
              (403 . |integrate|) (408 . |integrate|) (414 . |log|) (419 . *)
              (425 . |exp|) (430 . ^) (|Fraction| 10) (436 . |cRationalPower|)
              (442 . ^) (448 . |cExp|) (453 . |cLog|) (458 . |cSin|)
              (463 . |sin|) (468 . |cCos|) (473 . |cos|) (478 . |cTan|)
              (483 . |tan|) (488 . |cCot|) (493 . |cot|) (498 . |cSec|)
              (503 . |sec|) (508 . |cCsc|) (513 . |csc|) (518 . |cAsin|)
              (523 . |asin|) (528 . |cAcos|) (533 . |acos|) (538 . |cAtan|)
              (543 . |atan|) (548 . |cAcot|) (553 . |acot|) (558 . |cAsec|)
              (563 . |asec|) (568 . |cAcsc|) (573 . |acsc|) (578 . |cSinh|)
              (583 . |sinh|) (588 . |cCosh|) (593 . |cosh|) (598 . |cTanh|)
              (603 . |tanh|) (608 . |cCoth|) (613 . |coth|) (618 . |cSech|)
              (623 . |sech|) (628 . |cCsch|) (633 . |csch|) (638 . |cAsinh|)
              (643 . |asinh|) (648 . |cAcosh|) (653 . |acosh|) (658 . |cAtanh|)
              (663 . |atanh|) (668 . |cAcoth|) (673 . |acoth|) (678 . |cAsech|)
              (683 . |asech|) (688 . |cAcsch|) (693 . |acsch|) 'ZERO 'ONE
              'NPOWERS (698 . =) (704 . |coerce|) (709 . |cPower|) (715 . -)
              (|OutputForm|) (|String|) (721 . |coerce|) (726 . ^)
              (732 . |One|) (736 . |seriesToOutputForm|) |SUTS;coerce;$Of;91|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|List| 66) (|List| 12) (|Mapping| 6 10) (|PositiveInteger|)
              (|List| 208) (|SingletonAsOrderedSet|) (|Mapping| 6 6)
              (|HashState|) (|SingleInteger|))
           '#(~= 745 |zero?| 751 |variables| 756 |variable| 761
              |univariatePolynomial| 766 |unitNormal| 772 |unitCanonical| 777
              |unit?| 782 |truncate| 787 |terms| 800 |tanh| 805 |tan| 810
              |subtractIfCan| 815 |sqrt| 821 |sinh| 826 |sin| 831 |series| 836
              |sech| 846 |sec| 851 |sample| 856 |reductum| 860 |recip| 865
              |quoByVar| 870 |polynomial| 875 |pole?| 888 |pi| 893 |order| 897
              |opposite?| 908 |one?| 914 |nthRoot| 919 |multiplyExponents| 925
              |multiplyCoefficients| 931 |monomial?| 937 |monomial| 942 |map|
              962 |log| 968 |leadingMonomial| 973 |leadingCoefficient| 978
              |latex| 983 |integrate| 988 |hashUpdate!| 1005 |hash| 1011
              |extend| 1016 |exquo| 1022 |exp| 1028 |eval| 1033 |elt| 1039
              |differentiate| 1051 |degree| 1094 |csch| 1099 |csc| 1104 |coth|
              1109 |cot| 1114 |cosh| 1119 |cos| 1124 |complete| 1129 |coerce|
              1134 |coefficients| 1169 |coefficient| 1174 |charthRoot| 1180
              |characteristic| 1185 |center| 1189 |atanh| 1194 |atan| 1199
              |associates?| 1204 |asinh| 1210 |asin| 1215 |asech| 1220 |asec|
              1225 |approximate| 1230 |annihilate?| 1236 |acsch| 1242 |acsc|
              1247 |acoth| 1252 |acot| 1257 |acosh| 1262 |acos| 1267 ^ 1272
              |Zero| 1302 |One| 1306 D 1310 = 1347 / 1353 - 1359 + 1370 * 1376)
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
                 (|UnivariatePowerSeriesCategory| 6 12)
                 (|PowerSeriesCategory| 6 12 208) (|AbelianMonoidRing| 6 12)
                 (|IntegralDomain|) (|Algebra| 135) (|Algebra| $$)
                 (|Algebra| 6) (|Module| 135) (|CommutativeRing|) (|Module| $$)
                 (|EntireRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 66) (|DifferentialRing|)
                 (|BiModule| 6 6) (|BiModule| 135 135) (|BiModule| $$ $$)
                 (|Ring|) (|LeftModule| 6) (|RightModule| 6) (|LeftModule| 135)
                 (|RightModule| 135) (|RightModule| $$) (|LeftModule| $$)
                 (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|SetCategory|) (|TranscendentalFunctionCategory|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 195) (|CommutativeStar|) (|noZeroDivisors|)
                 (|unitsKnown|) (|Eltable| $$ $$)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 211
                                  '(2 9 0 6 10 11 2 9 0 0 10 14 0 6 0 16 0 6 0
                                    18 3 9 20 0 0 21 22 2 0 20 0 0 24 1 9 0 0
                                    25 1 0 0 0 27 1 6 21 0 30 2 0 0 0 0 31 1 33
                                    21 0 34 2 33 0 6 12 35 2 33 0 0 0 36 2 33 0
                                    0 0 37 0 39 0 40 1 33 12 0 41 1 33 6 0 42 2
                                    39 0 38 0 43 1 33 0 0 44 0 45 0 46 1 47 0
                                    45 48 2 9 0 47 39 49 1 9 39 0 51 0 33 0 52
                                    2 33 0 0 0 54 0 33 0 55 1 39 21 0 56 1 39
                                    38 0 57 2 10 21 0 0 58 2 33 0 0 12 59 2 33
                                    0 0 0 60 2 33 0 6 0 61 1 39 0 0 62 0 64 0
                                    65 1 64 0 66 67 1 64 0 6 68 2 64 0 0 0 69 0
                                    64 0 70 2 64 0 0 12 71 2 64 0 0 0 72 2 64 0
                                    6 0 73 2 64 0 0 0 74 2 9 0 0 10 78 3 9 0 0
                                    10 10 80 1 39 21 0 81 0 82 0 83 1 45 0 10
                                    84 1 47 45 0 85 2 45 21 0 0 86 1 39 0 0 87
                                    2 10 21 0 0 88 0 10 0 89 2 10 0 0 0 90 2 82
                                    0 6 0 91 0 9 0 92 0 10 0 93 0 45 0 94 1 82
                                    0 95 96 1 9 47 0 97 1 9 39 0 99 1 82 21 0
                                    103 2 47 45 0 45 104 1 82 6 0 105 1 82 0 0
                                    106 1 39 0 95 107 0 45 0 108 1 45 0 0 109 1
                                    101 21 0 111 1 101 100 0 112 1 101 0 0 113
                                    1 9 0 39 114 2 9 6 0 10 117 1 9 10 0 121 2
                                    9 10 0 10 123 1 0 21 0 125 1 0 0 6 126 2 9
                                    0 0 0 127 1 0 0 0 129 2 0 0 0 28 130 1 0 0
                                    0 131 2 0 0 0 0 132 1 0 0 0 133 2 0 0 0 0
                                    134 2 9 0 0 135 136 2 0 0 0 135 137 1 9 0 0
                                    138 1 9 0 0 139 1 9 0 0 140 1 0 0 0 141 1 9
                                    0 0 142 1 0 0 0 143 1 9 0 0 144 1 0 0 0 145
                                    1 9 0 0 146 1 0 0 0 147 1 9 0 0 148 1 0 0 0
                                    149 1 9 0 0 150 1 0 0 0 151 1 9 0 0 152 1 0
                                    0 0 153 1 9 0 0 154 1 0 0 0 155 1 9 0 0 156
                                    1 0 0 0 157 1 9 0 0 158 1 0 0 0 159 1 9 0 0
                                    160 1 0 0 0 161 1 9 0 0 162 1 0 0 0 163 1 9
                                    0 0 164 1 0 0 0 165 1 9 0 0 166 1 0 0 0 167
                                    1 9 0 0 168 1 0 0 0 169 1 9 0 0 170 1 0 0 0
                                    171 1 9 0 0 172 1 0 0 0 173 1 9 0 0 174 1 0
                                    0 0 175 1 9 0 0 176 1 0 0 0 177 1 9 0 0 178
                                    1 0 0 0 179 1 9 0 0 180 1 0 0 0 181 1 9 0 0
                                    182 1 0 0 0 183 1 9 0 0 184 1 0 0 0 185 1 9
                                    0 0 186 1 0 0 0 187 2 6 21 0 0 191 1 6 0
                                    135 192 2 9 0 0 6 193 2 0 0 0 0 194 1 196
                                    195 0 197 2 0 0 0 6 198 0 135 0 199 5 9 195
                                    39 47 66 6 135 200 2 0 21 0 0 1 1 32 21 0
                                    125 1 0 207 0 1 1 0 66 0 116 2 0 33 0 12 63
                                    1 26 202 0 1 1 26 0 0 1 1 26 21 0 1 3 0 0 0
                                    12 12 76 2 0 0 0 12 79 1 0 101 0 102 1 1 0
                                    0 169 1 1 0 0 145 2 31 20 0 0 1 1 1 0 0 1 1
                                    1 0 0 165 1 1 0 0 141 1 0 0 82 110 1 0 0
                                    101 115 1 1 0 0 173 1 1 0 0 149 0 32 0 1 1
                                    0 0 0 1 1 28 20 0 23 1 0 0 0 26 3 0 64 0 12
                                    12 77 2 0 64 0 12 75 1 0 21 0 120 0 1 0 1 2
                                    0 12 0 12 124 1 0 12 0 122 2 32 21 0 0 1 1
                                    28 21 0 1 2 1 0 0 10 1 2 0 0 0 206 1 2 0 0
                                    205 0 1 1 0 21 0 1 3 0 0 0 207 204 1 3 0 0
                                    0 208 12 1 2 0 0 6 12 13 2 0 0 209 0 1 1 1
                                    0 0 131 1 0 0 0 1 1 0 6 0 1 1 0 196 0 1 2
                                    25 0 0 66 1 2 1 0 0 28 130 1 1 0 0 129 2 0
                                    210 210 0 1 1 0 211 0 1 2 0 0 0 12 15 2 26
                                    20 0 0 24 1 1 0 0 133 2 10 82 0 6 1 2 9 0 0
                                    0 128 2 0 6 0 12 119 2 8 0 0 203 1 2 8 0 0
                                    66 1 3 8 0 0 203 204 1 3 8 0 0 66 12 1 1 7
                                    0 0 27 2 7 0 0 12 1 2 0 0 0 28 29 1 0 12 0
                                    1 1 1 0 0 175 1 1 0 0 151 1 1 0 0 171 1 1 0
                                    0 147 1 1 0 0 167 1 1 0 0 143 1 0 0 0 1 1
                                    27 0 6 126 1 26 0 0 1 1 29 0 10 1 1 1 0 135
                                    1 1 0 0 28 32 1 0 0 33 50 1 0 195 0 201 1 0
                                    82 0 98 2 0 6 0 12 118 1 3 20 0 1 0 29 12 1
                                    1 0 6 0 53 1 1 0 0 181 1 1 0 0 157 2 26 21
                                    0 0 1 1 1 0 0 177 1 1 0 0 153 1 1 0 0 185 1
                                    1 0 0 161 2 11 6 0 12 1 2 29 21 0 0 1 1 1 0
                                    0 187 1 1 0 0 163 1 1 0 0 183 1 1 0 0 159 1
                                    1 0 0 179 1 1 0 0 155 2 28 0 0 12 1 2 1 0 0
                                    135 137 2 1 0 0 0 134 2 24 0 0 6 198 2 0 0
                                    0 206 1 0 32 0 17 0 28 0 19 2 8 0 0 203 1 2
                                    8 0 0 66 1 3 8 0 0 203 204 1 3 8 0 0 66 12
                                    1 1 7 0 0 1 2 7 0 0 12 1 2 0 21 0 0 1 2 24
                                    0 0 6 1 1 30 0 0 1 2 30 0 0 0 194 2 0 0 0 0
                                    31 2 30 0 10 0 1 2 32 0 12 0 1 2 1 0 135 0
                                    1 2 1 0 0 135 1 2 0 0 0 6 1 2 0 0 6 0 1 2 0
                                    0 0 0 132 2 0 0 206 0 1)))))
           '|lookupComplete|)) 
