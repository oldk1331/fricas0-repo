
(PUT '|ULSCONS;getExpon| '|SPADreplace| 'QCAR) 

(SDEFUN |ULSCONS;getExpon| ((|x| $) ($ |Integer|)) (QCAR |x|)) 

(PUT '|ULSCONS;getUTS| '|SPADreplace| 'QCDR) 

(SDEFUN |ULSCONS;getUTS| ((|x| $) ($ UTS)) (QCDR |x|)) 

(PUT '|ULSCONS;laurent;IUTS$;3| '|SPADreplace| 'CONS) 

(SDEFUN |ULSCONS;laurent;IUTS$;3| ((|n| |Integer|) (|psr| UTS) ($ $))
        (CONS |n| |psr|)) 

(SDEFUN |ULSCONS;taylorRep;$UTS;4| ((|x| $) ($ UTS)) (|ULSCONS;getUTS| |x| $)) 

(SDEFUN |ULSCONS;degree;$I;5| ((|x| $) ($ |Integer|))
        (|ULSCONS;getExpon| |x| $)) 

(SDEFUN |ULSCONS;Zero;$;6| (($ $))
        (SPADCALL 0 (|spadConstant| $ 15) (QREFELT $ 10))) 

(SDEFUN |ULSCONS;One;$;7| (($ $))
        (SPADCALL 0 (|spadConstant| $ 17) (QREFELT $ 10))) 

(SDEFUN |ULSCONS;monomial;CoefI$;8| ((|s| |Coef|) (|e| |Integer|) ($ $))
        (SPADCALL |e| (SPADCALL |s| (QREFELT $ 18)) (QREFELT $ 10))) 

(SDEFUN |ULSCONS;coerce;UTS$;9| ((|uts| UTS) ($ $))
        (SPADCALL 0 |uts| (QREFELT $ 10))) 

(SDEFUN |ULSCONS;coerce;Coef$;10| ((|r| |Coef|) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 18)) (QREFELT $ 20))) 

(SDEFUN |ULSCONS;coerce;I$;11| ((|i| |Integer|) ($ $))
        (SPADCALL (SPADCALL |i| (QREFELT $ 22)) (QREFELT $ 21))) 

(SDEFUN |ULSCONS;taylorIfCan;$U;12| ((|uls| $) ($ |Union| UTS "failed"))
        (SPROG ((#1=#:G167 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (|ULSCONS;getExpon| |uls| $)
                      . #2=(|ULSCONS;taylorIfCan;$U;12|))
                (EXIT
                 (COND
                  ((< |n| 0)
                   (SEQ
                    (LETT |uls| (SPADCALL (- |n|) |uls| (QREFELT $ 24)) . #2#)
                    (EXIT
                     (COND
                      ((< (|ULSCONS;getExpon| |uls| $) 0) (CONS 1 "failed"))
                      (#3='T (CONS 0 (|ULSCONS;getUTS| |uls| $)))))))
                  ((EQL |n| 0) (CONS 0 (|ULSCONS;getUTS| |uls| $)))
                  (#3#
                   (CONS 0
                         (SPADCALL (|ULSCONS;getUTS| |uls| $)
                                   (SPADCALL (|spadConstant| $ 25)
                                             (PROG1 (LETT #1# |n| . #2#)
                                               (|check_subtype2| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #1#))
                                             (QREFELT $ 27))
                                   (QREFELT $ 28))))))))) 

(SDEFUN |ULSCONS;taylor;$UTS;13| ((|uls| $) ($ UTS))
        (SPROG ((|uts| (|Union| UTS "failed")))
               (SEQ
                (LETT |uts| (SPADCALL |uls| (QREFELT $ 30))
                      |ULSCONS;taylor;$UTS;13|)
                (EXIT
                 (COND
                  ((QEQCAR |uts| 1)
                   (|error| "taylor: Laurent series has a pole"))
                  ('T (QCDR |uts|))))))) 

(PUT '|ULSCONS;termExpon| '|SPADreplace| 'QCAR) 

(SDEFUN |ULSCONS;termExpon|
        ((|term| |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))
         ($ |Integer|))
        (QCAR |term|)) 

(PUT '|ULSCONS;termCoef| '|SPADreplace| 'QCDR) 

(SDEFUN |ULSCONS;termCoef|
        ((|term| |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)) ($ |Coef|))
        (QCDR |term|)) 

(PUT '|ULSCONS;rec| '|SPADreplace| 'CONS) 

(SDEFUN |ULSCONS;rec|
        ((|exponent| |Integer|) (|coef| |Coef|)
         ($ |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
        (CONS |exponent| |coef|)) 

(SDEFUN |ULSCONS;recs|
        ((|st| |Stream| |Coef|) (|n| |Integer|)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG NIL
               (SPADCALL (CONS #'|ULSCONS;recs!0| (VECTOR |n| $ |st|))
                         (QREFELT $ 45)))) 

(SDEFUN |ULSCONS;recs!0| (($$ NIL))
        (PROG (|st| $ |n|)
          (LETT |st| (QREFELT $$ 2) . #1=(|ULSCONS;recs|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|coef| NIL))
                   (COND
                    ((SPADCALL |st| (QREFELT $ 34)) (SPADCALL (QREFELT $ 37)))
                    ((SPADCALL (LETT |coef| (SPADCALL |st| (QREFELT $ 38)) NIL)
                               (QREFELT $ 39))
                     (|ULSCONS;recs| (SPADCALL |st| (QREFELT $ 40))
                      (SPADCALL |n| (|spadConstant| $ 41) (QREFELT $ 42)) $))
                    ('T
                     (SPADCALL (|ULSCONS;rec| |n| |coef| $)
                               (|ULSCONS;recs| (SPADCALL |st| (QREFELT $ 40))
                                (SPADCALL |n| (|spadConstant| $ 41)
                                          (QREFELT $ 42))
                                $)
                               (QREFELT $ 43))))))))) 

(SDEFUN |ULSCONS;terms;$S;18|
        ((|x| $)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (|ULSCONS;recs| (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 46))
         (|ULSCONS;getExpon| |x| $) $)) 

(SDEFUN |ULSCONS;recsToCoefs|
        ((|st| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|n| |Integer|) ($ |Stream| |Coef|))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|ULSCONS;recsToCoefs!0| (VECTOR |n| $ |st|))
                          (QREFELT $ 54))))) 

(SDEFUN |ULSCONS;recsToCoefs!0| (($$ NIL))
        (PROG (|st| $ |n|)
          (LETT |st| (QREFELT $$ 2) . #1=(|ULSCONS;recsToCoefs|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|term| NIL) (|ex| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |st| (QREFELT $ 48)) (SPADCALL (QREFELT $ 49)))
                     ('T
                      (SEQ (LETT |term| (SPADCALL |st| (QREFELT $ 50)) NIL)
                           (LETT |ex| (|ULSCONS;termExpon| |term| $) NIL)
                           (EXIT
                            (COND
                             ((SPADCALL |n| |ex| (QREFELT $ 51))
                              (SPADCALL (|ULSCONS;termCoef| |term| $)
                                        (|ULSCONS;recsToCoefs|
                                         (SPADCALL |st| (QREFELT $ 52))
                                         (SPADCALL |n| (|spadConstant| $ 41)
                                                   (QREFELT $ 42))
                                         $)
                                        (QREFELT $ 53)))
                             ('T
                              (SPADCALL (|spadConstant| $ 14)
                                        (|ULSCONS;recsToCoefs| |st|
                                         (SPADCALL |n| (|spadConstant| $ 41)
                                                   (QREFELT $ 42))
                                         $)
                                        (QREFELT $ 53)))))))))))))) 

(SDEFUN |ULSCONS;series;S$;20|
        ((|st| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         ($ $))
        (SPROG ((|ex| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |st| (QREFELT $ 48)) (|spadConstant| $ 13))
                      ('T
                       (SEQ
                        (LETT |ex|
                              (|ULSCONS;termExpon|
                               (SPADCALL |st| (QREFELT $ 50)) $)
                              |ULSCONS;series;S$;20|)
                        (EXIT
                         (SPADCALL |ex|
                                   (SPADCALL
                                    (|ULSCONS;recsToCoefs| |st| |ex| $)
                                    (QREFELT $ 55))
                                   (QREFELT $ 10))))))))) 

(SDEFUN |ULSCONS;removeZeroes;2$;21| ((|x| $) ($ $))
        (SPROG ((|xUTS| (UTS)))
               (COND
                ((SPADCALL
                  (SPADCALL
                   (LETT |xUTS| (|ULSCONS;getUTS| |x| $)
                         |ULSCONS;removeZeroes;2$;21|)
                   (QREFELT $ 46))
                  (QREFELT $ 34))
                 (|spadConstant| $ 13))
                ((SPADCALL (SPADCALL |xUTS| 0 (QREFELT $ 57))
                           (|spadConstant| $ 14) (QREFELT $ 58))
                 (SPADCALL
                  (SPADCALL (+ (|ULSCONS;getExpon| |x| $) 1)
                            (SPADCALL |xUTS| (QREFELT $ 59)) (QREFELT $ 10))
                  (QREFELT $ 60)))
                ('T |x|)))) 

(SDEFUN |ULSCONS;removeZeroes;I2$;22| ((|n| |Integer|) (|x| $) ($ $))
        (SPROG ((|xUTS| (UTS)))
               (COND ((SPADCALL |n| 0 (QREFELT $ 61)) |x|)
                     ((SPADCALL
                       (SPADCALL
                        (LETT |xUTS| (|ULSCONS;getUTS| |x| $)
                              |ULSCONS;removeZeroes;I2$;22|)
                        (QREFELT $ 46))
                       (QREFELT $ 34))
                      (|spadConstant| $ 13))
                     ((SPADCALL (SPADCALL |xUTS| 0 (QREFELT $ 57))
                                (|spadConstant| $ 14) (QREFELT $ 58))
                      (SPADCALL (- |n| 1)
                                (SPADCALL (+ (|ULSCONS;getExpon| |x| $) 1)
                                          (SPADCALL |xUTS| (QREFELT $ 59))
                                          (QREFELT $ 10))
                                (QREFELT $ 24)))
                     ('T |x|)))) 

(SDEFUN |ULSCONS;=;2$B;23| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G235 NIL) (#2=#:G226 NIL) (|expDiff| (|Integer|)))
               (SEQ
                (COND ((EQ |x| |y|) 'T)
                      (#3='T
                       (SEQ
                        (LETT |expDiff|
                              (- (|ULSCONS;getExpon| |x| $)
                                 (|ULSCONS;getExpon| |y| $))
                              . #4=(|ULSCONS;=;2$B;23|))
                        (EXIT
                         (COND
                          ((EQL |expDiff| 0)
                           (SPADCALL (|ULSCONS;getUTS| |x| $)
                                     (|ULSCONS;getUTS| |y| $) (QREFELT $ 62)))
                          ((SPADCALL (ABS |expDiff|) |$streamCount|
                                     (QREFELT $ 63))
                           NIL)
                          ((SPADCALL |expDiff| 0 (QREFELT $ 63))
                           (SPADCALL
                            (SPADCALL (|ULSCONS;getUTS| |x| $)
                                      (SPADCALL (|spadConstant| $ 25)
                                                (PROG1
                                                    (LETT #2# |expDiff| . #4#)
                                                  (|check_subtype2| (>= #2# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #2#))
                                                (QREFELT $ 27))
                                      (QREFELT $ 28))
                            (|ULSCONS;getUTS| |y| $) (QREFELT $ 62)))
                          (#3#
                           (SPADCALL
                            (SPADCALL (|ULSCONS;getUTS| |y| $)
                                      (SPADCALL (|spadConstant| $ 25)
                                                (PROG1
                                                    (LETT #1# (- |expDiff|)
                                                          . #4#)
                                                  (|check_subtype2| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #1#))
                                                (QREFELT $ 27))
                                      (QREFELT $ 28))
                            (|ULSCONS;getUTS| |x| $) (QREFELT $ 62))))))))))) 

(SDEFUN |ULSCONS;pole?;$B;24| ((|x| $) ($ |Boolean|))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |x| (QREFELT $ 12))
                      . #1=(|ULSCONS;pole?;$B;24|))
                (EXIT
                 (COND ((>= |n| 0) NIL)
                       ('T
                        (SEQ
                         (LETT |x| (SPADCALL (- |n|) |x| (QREFELT $ 24)) . #1#)
                         (EXIT (< (SPADCALL |x| (QREFELT $ 12)) 0))))))))) 

(SDEFUN |ULSCONS;+;3$;25| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G252 NIL) (#2=#:G248 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n|
                      (- (|ULSCONS;getExpon| |x| $) (|ULSCONS;getExpon| |y| $))
                      . #3=(|ULSCONS;+;3$;25|))
                (EXIT
                 (COND
                  ((>= |n| 0)
                   (SPADCALL (|ULSCONS;getExpon| |y| $)
                             (SPADCALL (|ULSCONS;getUTS| |y| $)
                                       (SPADCALL (|ULSCONS;getUTS| |x| $)
                                                 (SPADCALL
                                                  (|spadConstant| $ 25)
                                                  (PROG1 (LETT #2# |n| . #3#)
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  (QREFELT $ 27))
                                                 (QREFELT $ 28))
                                       (QREFELT $ 66))
                             (QREFELT $ 10)))
                  ('T
                   (SPADCALL (|ULSCONS;getExpon| |x| $)
                             (SPADCALL (|ULSCONS;getUTS| |x| $)
                                       (SPADCALL (|ULSCONS;getUTS| |y| $)
                                                 (SPADCALL
                                                  (|spadConstant| $ 25)
                                                  (PROG1
                                                      (LETT #1# (- |n|) . #3#)
                                                    (|check_subtype2|
                                                     (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                                  (QREFELT $ 27))
                                                 (QREFELT $ 28))
                                       (QREFELT $ 66))
                             (QREFELT $ 10)))))))) 

(SDEFUN |ULSCONS;-;3$;26| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G263 NIL) (#2=#:G259 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n|
                      (- (|ULSCONS;getExpon| |x| $) (|ULSCONS;getExpon| |y| $))
                      . #3=(|ULSCONS;-;3$;26|))
                (EXIT
                 (COND
                  ((>= |n| 0)
                   (SPADCALL (|ULSCONS;getExpon| |y| $)
                             (SPADCALL
                              (SPADCALL (|ULSCONS;getUTS| |x| $)
                                        (SPADCALL (|spadConstant| $ 25)
                                                  (PROG1 (LETT #2# |n| . #3#)
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  (QREFELT $ 27))
                                        (QREFELT $ 28))
                              (|ULSCONS;getUTS| |y| $) (QREFELT $ 68))
                             (QREFELT $ 10)))
                  ('T
                   (SPADCALL (|ULSCONS;getExpon| |x| $)
                             (SPADCALL (|ULSCONS;getUTS| |x| $)
                                       (SPADCALL (|ULSCONS;getUTS| |y| $)
                                                 (SPADCALL
                                                  (|spadConstant| $ 25)
                                                  (PROG1
                                                      (LETT #1# (- |n|) . #3#)
                                                    (|check_subtype2|
                                                     (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                                  (QREFELT $ 27))
                                                 (QREFELT $ 28))
                                       (QREFELT $ 68))
                             (QREFELT $ 10)))))))) 

(SDEFUN |ULSCONS;*;3$;27| ((|x| $) (|y| $) ($ $))
        (SPADCALL (+ (|ULSCONS;getExpon| |x| $) (|ULSCONS;getExpon| |y| $))
                  (SPADCALL (|ULSCONS;getUTS| |x| $) (|ULSCONS;getUTS| |y| $)
                            (QREFELT $ 28))
                  (QREFELT $ 10))) 

(SDEFUN |ULSCONS;^;$Nni$;28| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (COND ((ZEROP |n|) (|spadConstant| $ 16))
              ('T
               (SPADCALL
                (SPADCALL |n| (|ULSCONS;getExpon| |x| $) (QREFELT $ 71))
                (SPADCALL (|ULSCONS;getUTS| |x| $) |n| (QREFELT $ 72))
                (QREFELT $ 10))))) 

(SDEFUN |ULSCONS;recip;$U;29| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|uts| (|Union| UTS #1#)) (|d| (|Integer|)))
               (SEQ
                (LETT |x| (SPADCALL 1000 |x| (QREFELT $ 24))
                      . #2=(|ULSCONS;recip;$U;29|))
                (EXIT
                 (COND
                  ((SPADCALL
                    (SPADCALL |x|
                              (LETT |d| (SPADCALL |x| (QREFELT $ 12)) . #2#)
                              (QREFELT $ 74))
                    (QREFELT $ 39))
                   (CONS 1 "failed"))
                  (#3='T
                   (SEQ
                    (LETT |uts|
                          (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 76))
                          . #2#)
                    (EXIT
                     (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                           (#3#
                            (CONS 0
                                  (SPADCALL (- |d|) (QCDR |uts|)
                                            (QREFELT $ 10))))))))))))) 

(SDEFUN |ULSCONS;elt;3$;30| ((|uls1| $) (|uls2| $) ($ $))
        (SPROG
         ((#1=#:G293 NIL) (|uts1| (UTS)) (|recipr| (|Union| $ "failed"))
          (|deg| (|Integer|)) (|uts2| (UTS)) (|uts| (|Union| UTS "failed")))
         (SEQ
          (LETT |uts| (SPADCALL |uls2| (QREFELT $ 30))
                . #2=(|ULSCONS;elt;3$;30|))
          (EXIT
           (COND
            ((QEQCAR |uts| 1)
             (|error| "elt: second argument must have positive order"))
            (#3='T
             (SEQ (LETT |uts2| (QCDR |uts|) . #2#)
                  (COND
                   ((NULL
                     (SPADCALL (SPADCALL |uts2| 0 (QREFELT $ 57))
                               (QREFELT $ 39)))
                    (EXIT
                     (|error|
                      "elt: second argument must have positive order"))))
                  (SEQ (LETT |deg| (|ULSCONS;getExpon| |uls1| $) . #2#)
                       (EXIT
                        (COND
                         ((< |deg| 0)
                          (LETT |uls1|
                                (SPADCALL (- |deg|) |uls1| (QREFELT $ 24))
                                . #2#)))))
                  (LETT |deg| (|ULSCONS;getExpon| |uls1| $) . #2#)
                  (EXIT
                   (COND
                    ((< |deg| 0)
                     (SEQ
                      (LETT |recipr|
                            (SPADCALL (SPADCALL |uts2| (QREFELT $ 20))
                                      (QREFELT $ 77))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |recipr| 1)
                         (|error| "elt: second argument not invertible"))
                        (#3#
                         (SEQ
                          (LETT |uts1|
                                (SPADCALL
                                 (SPADCALL |uls1|
                                           (SPADCALL (|spadConstant| $ 25)
                                                     (- |deg|) (QREFELT $ 19))
                                           (QREFELT $ 70))
                                 (QREFELT $ 31))
                                . #2#)
                          (EXIT
                           (SPADCALL
                            (SPADCALL (SPADCALL |uts1| |uts2| (QREFELT $ 78))
                                      (QREFELT $ 20))
                            (SPADCALL (QCDR |recipr|)
                                      (PROG1 (LETT #1# (- |deg|) . #2#)
                                        (|check_subtype2| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #1#))
                                      (QREFELT $ 73))
                            (QREFELT $ 70)))))))))
                    (#3#
                     (SPADCALL
                      (SPADCALL (SPADCALL |uls1| (QREFELT $ 31)) |uts2|
                                (QREFELT $ 78))
                      (QREFELT $ 20)))))))))))) 

(SDEFUN |ULSCONS;eval;$CoefS;31| ((|uls| $) (|r| |Coef|) ($ |Stream| |Coef|))
        (SPROG
         ((#1=#:G312 NIL) (#2=#:G305 NIL) (|recipr| (|Union| |Coef| "failed"))
          (|n| (|Integer|)) (|uts| (UTS)))
         (SEQ
          (SEQ
           (LETT |n| (|ULSCONS;getExpon| |uls| $)
                 . #3=(|ULSCONS;eval;$CoefS;31|))
           (EXIT
            (COND
             ((< |n| 0)
              (LETT |uls| (SPADCALL (- |n|) |uls| (QREFELT $ 24)) . #3#)))))
          (LETT |uts| (|ULSCONS;getUTS| |uls| $) . #3#)
          (LETT |n| (|ULSCONS;getExpon| |uls| $) . #3#)
          (EXIT
           (COND
            ((< |n| 0)
             (COND
              ((SPADCALL |r| (QREFELT $ 39))
               (|error| "eval: 0 raised to negative power"))
              (#4='T
               (SEQ (LETT |recipr| (SPADCALL |r| (QREFELT $ 80)) . #3#)
                    (EXIT
                     (COND
                      ((QEQCAR |recipr| 1)
                       (|error| "eval: non-unit raised to negative power"))
                      (#4#
                       (SPADCALL
                        (SPADCALL (QCDR |recipr|)
                                  (PROG1 (LETT #2# (- |n|) . #3#)
                                    (|check_subtype2| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #2#))
                                  (QREFELT $ 81))
                        (SPADCALL |uts| |r| (QREFELT $ 82))
                        (QREFELT $ 84)))))))))
            ((ZEROP |n|) (SPADCALL |uts| |r| (QREFELT $ 82)))
            (#4#
             (SPADCALL
              (SPADCALL |r|
                        (PROG1 (LETT #1# |n| . #3#)
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#))
                        (QREFELT $ 81))
              (SPADCALL |uts| |r| (QREFELT $ 82)) (QREFELT $ 84)))))))) 

(SDEFUN |ULSCONS;variable;$S;32| ((|x| $) ($ |Symbol|))
        (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 87))) 

(SDEFUN |ULSCONS;center;$Coef;33| ((|x| $) ($ |Coef|))
        (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 89))) 

(SDEFUN |ULSCONS;coefficient;$ICoef;34| ((|x| $) (|n| |Integer|) ($ |Coef|))
        (SPROG ((#1=#:G321 NIL) (|a| (|Integer|)))
               (SEQ
                (LETT |a| (- |n| (|ULSCONS;getExpon| |x| $))
                      . #2=(|ULSCONS;coefficient;$ICoef;34|))
                (EXIT
                 (COND
                  ((>= |a| 0)
                   (SPADCALL (|ULSCONS;getUTS| |x| $)
                             (PROG1 (LETT #1# |a| . #2#)
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT $ 57)))
                  ('T (|spadConstant| $ 14))))))) 

(SDEFUN |ULSCONS;elt;$ICoef;35| ((|x| $) (|n| |Integer|) ($ |Coef|))
        (SPADCALL |x| |n| (QREFELT $ 74))) 

(SDEFUN |ULSCONS;order;$I;36| ((|x| $) ($ |Integer|))
        (+ (|ULSCONS;getExpon| |x| $)
           (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 92)))) 

(SDEFUN |ULSCONS;order;$2I;37| ((|x| $) (|n| . #1=(|Integer|)) ($ . #1#))
        (SPROG ((#2=#:G328 NIL) (|m| (|Integer|)) (|e| (|Integer|)))
               (SEQ
                (LETT |m|
                      (- |n|
                         (LETT |e| (|ULSCONS;getExpon| |x| $)
                               . #3=(|ULSCONS;order;$2I;37|)))
                      . #3#)
                (EXIT
                 (COND ((< |m| 0) |n|)
                       ('T
                        (+ |e|
                           (SPADCALL (|ULSCONS;getUTS| |x| $)
                                     (PROG1 (LETT #2# |m| . #3#)
                                       (|check_subtype2| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                     (QREFELT $ 94))))))))) 

(SDEFUN |ULSCONS;truncate;$I$;38| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((#1=#:G332 NIL) (|m| (|Integer|)) (|e| (|Integer|)))
               (SEQ
                (LETT |m|
                      (- |n|
                         (LETT |e| (|ULSCONS;getExpon| |x| $)
                               . #2=(|ULSCONS;truncate;$I$;38|)))
                      . #2#)
                (EXIT
                 (COND ((< |m| 0) (|spadConstant| $ 13))
                       ('T
                        (SPADCALL |e|
                                  (SPADCALL (|ULSCONS;getUTS| |x| $)
                                            (PROG1 (LETT #1# |m| . #2#)
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 96))
                                  (QREFELT $ 10)))))))) 

(SDEFUN |ULSCONS;truncate;$2I$;39|
        ((|x| $) (|n1| . #1=(|Integer|)) (|n2| . #1#) ($ $))
        (SPROG
         ((#2=#:G338 NIL) (#3=#:G337 NIL) (|m1| (|Integer|)) (|e| (|Integer|))
          (|#G61| #1#) (|#G60| #1#))
         (SEQ
          (COND
           ((< |n2| |n1|)
            (PROGN
             (LETT |#G60| |n2| . #4=(|ULSCONS;truncate;$2I$;39|))
             (LETT |#G61| |n1| . #4#)
             (LETT |n1| |#G60| . #4#)
             (LETT |n2| |#G61| . #4#))))
          (LETT |m1| (- |n1| (LETT |e| (|ULSCONS;getExpon| |x| $) . #4#))
                . #4#)
          (EXIT
           (COND ((< |m1| 0) (SPADCALL |x| |n2| (QREFELT $ 97)))
                 ('T
                  (SPADCALL |e|
                            (SPADCALL (|ULSCONS;getUTS| |x| $)
                                      (PROG1 (LETT #3# |m1| . #4#)
                                        (|check_subtype2| (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #3#))
                                      (PROG1 (LETT #2# (- |n2| |e|) . #4#)
                                        (|check_subtype2| (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #2#))
                                      (QREFELT $ 98))
                            (QREFELT $ 10)))))))) 

(SDEFUN |ULSCONS;rationalFunction;$IF;40|
        ((|x| $) (|n| |Integer|) ($ |Fraction| (|Polynomial| |Coef|)))
        (SPROG
         ((#1=#:G346 NIL) (#2=#:G345 NIL)
          (|c| (|Fraction| (|Polynomial| |Coef|)))
          (|v| (|Fraction| (|Polynomial| |Coef|)))
          (|poly| (|Fraction| (|Polynomial| |Coef|))) (#3=#:G342 NIL)
          (|m| (|Integer|)) (|e| (|Integer|)))
         (SEQ
          (LETT |m|
                (- |n|
                   (LETT |e| (|ULSCONS;getExpon| |x| $)
                         . #4=(|ULSCONS;rationalFunction;$IF;40|)))
                . #4#)
          (EXIT
           (COND ((< |m| 0) (|spadConstant| $ 101))
                 (#5='T
                  (SEQ
                   (LETT |poly|
                         (SPADCALL
                          (SPADCALL (|ULSCONS;getUTS| |x| $)
                                    (PROG1 (LETT #3# |m| . #4#)
                                      (|check_subtype2| (>= #3# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #3#))
                                    (QREFELT $ 103))
                          (QREFELT $ 104))
                         . #4#)
                   (EXIT
                    (COND ((ZEROP |e|) |poly|)
                          (#5#
                           (SEQ
                            (LETT |v|
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 88))
                                            (QREFELT $ 105))
                                  . #4#)
                            (LETT |c|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |x| (QREFELT $ 90))
                                             (QREFELT $ 106))
                                   (QREFELT $ 104))
                                  . #4#)
                            (EXIT
                             (COND
                              ((SPADCALL |e| (QREFELT $ 107))
                               (SPADCALL |poly|
                                         (SPADCALL
                                          (SPADCALL |v| |c| (QREFELT $ 108))
                                          (PROG1 (LETT #2# |e| . #4#)
                                            (|check_subtype2| (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #2#))
                                          (QREFELT $ 109))
                                         (QREFELT $ 110)))
                              (#5#
                               (SPADCALL |poly|
                                         (SPADCALL
                                          (SPADCALL |v| |c| (QREFELT $ 108))
                                          (PROG1 (LETT #1# (- |e|) . #4#)
                                            (|check_subtype2| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #1#))
                                          (QREFELT $ 109))
                                         (QREFELT $ 111)))))))))))))))) 

(SDEFUN |ULSCONS;rationalFunction;$2IF;41|
        ((|x| $) (|n1| . #1=(|Integer|)) (|n2| . #1#)
         ($ |Fraction| (|Polynomial| |Coef|)))
        (SPROG
         ((#2=#:G358 NIL) (#3=#:G357 NIL)
          (|c| (|Fraction| (|Polynomial| |Coef|)))
          (|v| (|Fraction| (|Polynomial| |Coef|)))
          (|poly| (|Fraction| (|Polynomial| |Coef|))) (#4=#:G354 NIL)
          (#5=#:G353 NIL) (|m1| (|Integer|)) (|e| (|Integer|)) (|#G68| #1#)
          (|#G67| #1#))
         (SEQ
          (COND
           ((< |n2| |n1|)
            (PROGN
             (LETT |#G67| |n2| . #6=(|ULSCONS;rationalFunction;$2IF;41|))
             (LETT |#G68| |n1| . #6#)
             (LETT |n1| |#G67| . #6#)
             (LETT |n2| |#G68| . #6#))))
          (LETT |m1| (- |n1| (LETT |e| (|ULSCONS;getExpon| |x| $) . #6#))
                . #6#)
          (EXIT
           (COND ((< |m1| 0) (SPADCALL |x| |n2| (QREFELT $ 112)))
                 (#7='T
                  (SEQ
                   (LETT |poly|
                         (SPADCALL
                          (SPADCALL (|ULSCONS;getUTS| |x| $)
                                    (PROG1 (LETT #5# |m1| . #6#)
                                      (|check_subtype2| (>= #5# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #5#))
                                    (PROG1 (LETT #4# (- |n2| |e|) . #6#)
                                      (|check_subtype2| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #4#))
                                    (QREFELT $ 113))
                          (QREFELT $ 104))
                         . #6#)
                   (EXIT
                    (COND ((ZEROP |e|) |poly|)
                          (#7#
                           (SEQ
                            (LETT |v|
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 88))
                                            (QREFELT $ 105))
                                  . #6#)
                            (LETT |c|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |x| (QREFELT $ 90))
                                             (QREFELT $ 106))
                                   (QREFELT $ 104))
                                  . #6#)
                            (EXIT
                             (COND
                              ((SPADCALL |e| (QREFELT $ 107))
                               (SPADCALL |poly|
                                         (SPADCALL
                                          (SPADCALL |v| |c| (QREFELT $ 108))
                                          (PROG1 (LETT #3# |e| . #6#)
                                            (|check_subtype2| (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #3#))
                                          (QREFELT $ 109))
                                         (QREFELT $ 110)))
                              (#7#
                               (SPADCALL |poly|
                                         (SPADCALL
                                          (SPADCALL |v| |c| (QREFELT $ 108))
                                          (PROG1 (LETT #2# (- |e|) . #6#)
                                            (|check_subtype2| (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #2#))
                                          (QREFELT $ 109))
                                         (QREFELT $ 111)))))))))))))))) 

(SDEFUN |ULSCONS;exquo;2$U;42| ((|x| $) (|y| $) ($ |Union| $ #1="failed"))
        (SPROG ((|uts| (|Union| UTS #1#)) (|d| (|Integer|)))
               (SEQ
                (LETT |x| (SPADCALL 1000 |x| (QREFELT $ 24))
                      . #2=(|ULSCONS;exquo;2$U;42|))
                (LETT |y| (SPADCALL 1000 |y| (QREFELT $ 24)) . #2#)
                (EXIT
                 (COND
                  ((SPADCALL
                    (SPADCALL |y|
                              (LETT |d| (SPADCALL |y| (QREFELT $ 12)) . #2#)
                              (QREFELT $ 74))
                    (QREFELT $ 39))
                   (CONS 1 "failed"))
                  (#3='T
                   (SEQ
                    (LETT |uts|
                          (SPADCALL (|ULSCONS;getUTS| |x| $)
                                    (|ULSCONS;getUTS| |y| $) (QREFELT $ 115))
                          . #2#)
                    (EXIT
                     (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                           (#3#
                            (CONS 0
                                  (SPADCALL
                                   (- (SPADCALL |x| (QREFELT $ 12)) |d|)
                                   (QCDR |uts|) (QREFELT $ 10))))))))))))) 

(SDEFUN |ULSCONS;approximate;$ICoef;43| ((|x| $) (|n| |Integer|) ($ |Coef|))
        (SPROG
         ((|app| (|Coef|)) (#1=#:G374 NIL) (|m| (|Integer|)) (|e| (|Integer|)))
         (SEQ
          (LETT |m|
                (- |n|
                   (LETT |e| (|ULSCONS;getExpon| |x| $)
                         . #2=(|ULSCONS;approximate;$ICoef;43|)))
                . #2#)
          (EXIT
           (COND ((< |m| 0) (|spadConstant| $ 14))
                 (#3='T
                  (SEQ
                   (LETT |app|
                         (SPADCALL (|ULSCONS;getUTS| |x| $)
                                   (PROG1 (LETT #1# |m| . #2#)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT $ 117))
                         . #2#)
                   (EXIT
                    (COND ((ZEROP |e|) |app|)
                          (#3#
                           (SPADCALL |app|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |x| (QREFELT $ 88))
                                                 (QREFELT $ 118))
                                       (SPADCALL |x| (QREFELT $ 90))
                                       (QREFELT $ 119))
                                      |e| (QREFELT $ 120))
                                     (QREFELT $ 121)))))))))))) 

(SDEFUN |ULSCONS;complete;2$;44| ((|x| $) ($ $))
        (SPADCALL (|ULSCONS;getExpon| |x| $)
                  (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 123))
                  (QREFELT $ 10))) 

(SDEFUN |ULSCONS;extend;$I$;45| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((#1=#:G380 NIL) (|m| (|Integer|)) (|e| (|Integer|)))
               (SEQ
                (LETT |e| (|ULSCONS;getExpon| |x| $)
                      . #2=(|ULSCONS;extend;$I$;45|))
                (LETT |m| (- |n| |e|) . #2#)
                (EXIT
                 (COND ((< |m| 0) |x|)
                       ('T
                        (SPADCALL |e|
                                  (SPADCALL (|ULSCONS;getUTS| |x| $)
                                            (PROG1 (LETT #1# |m| . #2#)
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 125))
                                  (QREFELT $ 10)))))))) 

(SDEFUN |ULSCONS;map;M2$;46| ((|f| |Mapping| |Coef| |Coef|) (|x| $) ($ $))
        (SPADCALL (|ULSCONS;getExpon| |x| $)
                  (SPADCALL |f| (|ULSCONS;getUTS| |x| $) (QREFELT $ 128))
                  (QREFELT $ 10))) 

(SDEFUN |ULSCONS;multiplyCoefficients;M2$;47|
        ((|f| |Mapping| |Coef| (|Integer|)) (|x| $) ($ $))
        (SPROG ((|e| (|Integer|)))
               (SEQ
                (LETT |e| (|ULSCONS;getExpon| |x| $)
                      |ULSCONS;multiplyCoefficients;M2$;47|)
                (EXIT
                 (SPADCALL |e|
                           (SPADCALL
                            (CONS #'|ULSCONS;multiplyCoefficients;M2$;47!0|
                                  (VECTOR |f| $ |e|))
                            (|ULSCONS;getUTS| |x| $) (QREFELT $ 131))
                           (QREFELT $ 10)))))) 

(SDEFUN |ULSCONS;multiplyCoefficients;M2$;47!0| ((|z1| NIL) ($$ NIL))
        (PROG (|e| $ |f|)
          (LETT |e| (QREFELT $$ 2)
                . #1=(|ULSCONS;multiplyCoefficients;M2$;47|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |e| |z1| (QREFELT $ 42)) |f|))))) 

(SDEFUN |ULSCONS;multiplyExponents;$Pi$;48|
        ((|x| $) (|n| |PositiveInteger|) ($ $))
        (SPADCALL (SPADCALL |n| (|ULSCONS;getExpon| |x| $) (QREFELT $ 134))
                  (SPADCALL (|ULSCONS;getUTS| |x| $) |n| (QREFELT $ 135))
                  (QREFELT $ 10))) 

(SDEFUN |ULSCONS;differentiate;2$;49| ((|x| $) ($ $))
        (SPROG ((|e| (|Integer|)))
               (SEQ
                (LETT |e| (|ULSCONS;getExpon| |x| $)
                      |ULSCONS;differentiate;2$;49|)
                (EXIT
                 (SPADCALL (- |e| 1)
                           (SPADCALL
                            (CONS #'|ULSCONS;differentiate;2$;49!0|
                                  (VECTOR $ |e|))
                            (|ULSCONS;getUTS| |x| $) (QREFELT $ 131))
                           (QREFELT $ 10)))))) 

(SDEFUN |ULSCONS;differentiate;2$;49!0| ((|z1| NIL) ($$ NIL))
        (PROG (|e| $)
          (LETT |e| (QREFELT $$ 1) . #1=(|ULSCONS;differentiate;2$;49|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |e| |z1| (QREFELT $ 42)) (QREFELT $ 22)))))) 

(SDEFUN |ULSCONS;differentiate;$S$;50| ((|x| $) (|s| |Symbol|) ($ $))
        (SPROG NIL
               (COND
                ((EQUAL |s| (SPADCALL |x| (QREFELT $ 88)))
                 (SPADCALL |x| (QREFELT $ 137)))
                ('T
                 (SPADCALL
                  (SPADCALL
                   (CONS #'|ULSCONS;differentiate;$S$;50!0| (VECTOR $ |s|)) |x|
                   (QREFELT $ 129))
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 90)) |s| (QREFELT $ 138))
                   (SPADCALL |x| (QREFELT $ 137)) (QREFELT $ 139))
                  (QREFELT $ 69)))))) 

(SDEFUN |ULSCONS;differentiate;$S$;50!0| ((|z1| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|ULSCONS;differentiate;$S$;50|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |s| (QREFELT $ 138)))))) 

(SDEFUN |ULSCONS;characteristic;Nni;51| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 141))) 

(SDEFUN |ULSCONS;retract;$UTS;52| ((|x| $) ($ UTS))
        (SPADCALL |x| (QREFELT $ 31))) 

(SDEFUN |ULSCONS;retractIfCan;$U;53| ((|x| $) ($ |Union| UTS "failed"))
        (SPADCALL |x| (QREFELT $ 30))) 

(SDEFUN |ULSCONS;^;$I$;54| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG
         ((|minusN| (|NonNegativeInteger|)) (#1=#:G411 NIL) (|xInv| ($))
          (#2=#:G410 NIL))
         (SEQ
          (COND ((ZEROP |n|) (|spadConstant| $ 16))
                ((SPADCALL |n| 0 (QREFELT $ 63))
                 (SPADCALL (* |n| (|ULSCONS;getExpon| |x| $))
                           (SPADCALL (|ULSCONS;getUTS| |x| $)
                                     (PROG1
                                         (LETT #2# |n|
                                               . #3=(|ULSCONS;^;$I$;54|))
                                       (|check_subtype2| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                     (QREFELT $ 72))
                           (QREFELT $ 10)))
                ('T
                 (SEQ (LETT |xInv| (SPADCALL |x| (QREFELT $ 145)) . #3#)
                      (LETT |minusN|
                            (PROG1 (LETT #1# (- |n|) . #3#)
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))
                            . #3#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL |minusN| (|ULSCONS;getExpon| |xInv| $)
                                  (QREFELT $ 71))
                        (SPADCALL (|ULSCONS;getUTS| |xInv| $) |minusN|
                                  (QREFELT $ 72))
                        (QREFELT $ 10))))))))) 

(SDEFUN |ULSCONS;*;UTS2$;55| ((|x| UTS) (|y| $) ($ $))
        (SPADCALL (SPADCALL |x| (QREFELT $ 20)) |y| (QREFELT $ 70))) 

(SDEFUN |ULSCONS;*;$UTS$;56| ((|x| $) (|y| UTS) ($ $))
        (SPADCALL |x| (SPADCALL |y| (QREFELT $ 20)) (QREFELT $ 70))) 

(SDEFUN |ULSCONS;inv;2$;57| ((|x| $) ($ $))
        (SPROG ((|xInv| (|Union| $ "failed")))
               (SEQ
                (LETT |xInv| (SPADCALL |x| (QREFELT $ 77)) |ULSCONS;inv;2$;57|)
                (EXIT
                 (COND
                  ((QEQCAR |xInv| 1)
                   (|error| "multiplicative inverse does not exist"))
                  ('T (QCDR |xInv|))))))) 

(SDEFUN |ULSCONS;/;3$;58| ((|x| $) (|y| $) ($ $))
        (SPROG ((|yInv| (|Union| $ "failed")))
               (SEQ
                (LETT |yInv| (SPADCALL |y| (QREFELT $ 77)) |ULSCONS;/;3$;58|)
                (EXIT
                 (COND
                  ((QEQCAR |yInv| 1)
                   (|error| "inv: multiplicative inverse does not exist"))
                  ('T (SPADCALL |x| (QCDR |yInv|) (QREFELT $ 70)))))))) 

(SDEFUN |ULSCONS;/;2UTS$;59| ((|x| UTS) (|y| UTS) ($ $))
        (SPADCALL (SPADCALL |x| (QREFELT $ 20)) (SPADCALL |y| (QREFELT $ 20))
                  (QREFELT $ 149))) 

(SDEFUN |ULSCONS;numer;$UTS;60| ((|x| $) ($ UTS))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |x| (QREFELT $ 12))
                      . #1=(|ULSCONS;numer;$UTS;60|))
                (EXIT
                 (COND ((>= |n| 0) (SPADCALL |x| (QREFELT $ 31)))
                       (#2='T
                        (SEQ
                         (LETT |x| (SPADCALL (- |n|) |x| (QREFELT $ 24)) . #1#)
                         (LETT |n| (SPADCALL |x| (QREFELT $ 12)) . #1#)
                         (EXIT
                          (COND ((EQL |n| 0) (SPADCALL |x| (QREFELT $ 31)))
                                (#2# (|ULSCONS;getUTS| |x| $))))))))))) 

(SDEFUN |ULSCONS;denom;$UTS;61| ((|x| $) ($ UTS))
        (SPROG ((#1=#:G434 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |x| (QREFELT $ 12))
                      . #2=(|ULSCONS;denom;$UTS;61|))
                (EXIT
                 (COND ((>= |n| 0) (|spadConstant| $ 17))
                       (#3='T
                        (SEQ
                         (LETT |x| (SPADCALL (- |n|) |x| (QREFELT $ 24)) . #2#)
                         (LETT |n| (SPADCALL |x| (QREFELT $ 12)) . #2#)
                         (EXIT
                          (COND ((EQL |n| 0) (|spadConstant| $ 17))
                                (#3#
                                 (SPADCALL (|spadConstant| $ 25)
                                           (PROG1 (LETT #1# (- |n|) . #2#)
                                             (|check_subtype2| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                           (QREFELT $ 27)))))))))))) 

(SDEFUN |ULSCONS;coerce;F$;62| ((|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 154)) (QREFELT $ 21))) 

(SDEFUN |ULSCONS;^;$F$;63| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |x| |r| (QREFELT $ 157))) 

(SDEFUN |ULSCONS;exp;2$;64| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 159))) 

(SDEFUN |ULSCONS;log;2$;65| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 161))) 

(SDEFUN |ULSCONS;sin;2$;66| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 163))) 

(SDEFUN |ULSCONS;cos;2$;67| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 165))) 

(SDEFUN |ULSCONS;tan;2$;68| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 167))) 

(SDEFUN |ULSCONS;cot;2$;69| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 169))) 

(SDEFUN |ULSCONS;sec;2$;70| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 171))) 

(SDEFUN |ULSCONS;csc;2$;71| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 173))) 

(SDEFUN |ULSCONS;asin;2$;72| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 175))) 

(SDEFUN |ULSCONS;acos;2$;73| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 177))) 

(SDEFUN |ULSCONS;atan;2$;74| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 179))) 

(SDEFUN |ULSCONS;acot;2$;75| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 181))) 

(SDEFUN |ULSCONS;asec;2$;76| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 183))) 

(SDEFUN |ULSCONS;acsc;2$;77| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 185))) 

(SDEFUN |ULSCONS;sinh;2$;78| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 187))) 

(SDEFUN |ULSCONS;cosh;2$;79| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 189))) 

(SDEFUN |ULSCONS;tanh;2$;80| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 191))) 

(SDEFUN |ULSCONS;coth;2$;81| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 193))) 

(SDEFUN |ULSCONS;sech;2$;82| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 195))) 

(SDEFUN |ULSCONS;csch;2$;83| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 197))) 

(SDEFUN |ULSCONS;asinh;2$;84| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 199))) 

(SDEFUN |ULSCONS;acosh;2$;85| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 201))) 

(SDEFUN |ULSCONS;atanh;2$;86| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 203))) 

(SDEFUN |ULSCONS;acoth;2$;87| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 205))) 

(SDEFUN |ULSCONS;asech;2$;88| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 207))) 

(SDEFUN |ULSCONS;acsch;2$;89| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 209))) 

(SDEFUN |ULSCONS;ratInv| ((|n| |Integer|) ($ |Coef|))
        (COND ((ZEROP |n|) (|spadConstant| $ 25))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |n| (QREFELT $ 211)) (QREFELT $ 212))
                (QREFELT $ 154))))) 

(SDEFUN |ULSCONS;integrate;2$;91| ((|x| $) ($ $))
        (SPROG ((|e| (|Integer|)))
               (SEQ
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |x| -1 (QREFELT $ 74)) (QREFELT $ 39)))
                  (|error| "integrate: series has term of order -1"))
                 ('T
                  (SEQ
                   (LETT |e| (|ULSCONS;getExpon| |x| $)
                         |ULSCONS;integrate;2$;91|)
                   (EXIT
                    (SPADCALL (+ |e| 1)
                              (SPADCALL
                               (CONS #'|ULSCONS;integrate;2$;91!0|
                                     (VECTOR $ |e|))
                               (|ULSCONS;getUTS| |x| $) (QREFELT $ 131))
                              (QREFELT $ 10))))))))) 

(SDEFUN |ULSCONS;integrate;2$;91!0| ((|z1| NIL) ($$ NIL))
        (PROG (|e| $)
          (LETT |e| (QREFELT $$ 1) . #1=(|ULSCONS;integrate;2$;91|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|ULSCONS;ratInv|
             (SPADCALL (SPADCALL |e| (|spadConstant| $ 41) (QREFELT $ 42)) |z1|
                       (QREFELT $ 42))
             $))))) 

(SDEFUN |ULSCONS;integrate;$S$;92| ((|x| $) (|s| |Symbol|) ($ $))
        (SPROG NIL
               (COND
                ((EQUAL |s| (SPADCALL |x| (QREFELT $ 88)))
                 (SPADCALL |x| (QREFELT $ 214)))
                ((NULL
                  (SPADCALL |s|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 90))
                                      (QREFELT $ 216))
                            (QREFELT $ 217)))
                 (SPADCALL (CONS #'|ULSCONS;integrate;$S$;92!0| (VECTOR $ |s|))
                           |x| (QREFELT $ 129)))
                ('T
                 (|error|
                  "integrate: center is a function of variable of integration"))))) 

(SDEFUN |ULSCONS;integrate;$S$;92!0| ((|z1| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|ULSCONS;integrate;$S$;92|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |s| (QREFELT $ 218)))))) 

(SDEFUN |ULSCONS;integrateWithOneAnswer|
        ((|f| |Coef|) (|s| |Symbol|) ($ |Coef|))
        (SPROG ((|res| (|Union| |Coef| (|List| |Coef|))))
               (SEQ
                (LETT |res| (SPADCALL |f| |s| (QREFELT $ 222))
                      |ULSCONS;integrateWithOneAnswer|)
                (EXIT
                 (COND ((QEQCAR |res| 0) (QCDR |res|))
                       ('T (|SPADfirst| (QCDR |res|)))))))) 

(SDEFUN |ULSCONS;integrate;$S$;94| ((|x| $) (|s| |Symbol|) ($ $))
        (SPROG NIL
               (COND
                ((EQUAL |s| (SPADCALL |x| (QREFELT $ 88)))
                 (SPADCALL |x| (QREFELT $ 214)))
                ((NULL
                  (SPADCALL |s|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 90))
                                      (QREFELT $ 216))
                            (QREFELT $ 217)))
                 (SPADCALL (CONS #'|ULSCONS;integrate;$S$;94!0| (VECTOR $ |s|))
                           |x| (QREFELT $ 129)))
                ('T
                 (|error|
                  "integrate: center is a function of variable of integration"))))) 

(SDEFUN |ULSCONS;integrate;$S$;94!0| ((|z1| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|ULSCONS;integrate;$S$;94|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ULSCONS;integrateWithOneAnswer| |z1| |s| $))))) 

(SDEFUN |ULSCONS;termOutput|
        ((|k| |Integer|) (|c| |Coef|) (|vv| |OutputForm|) ($ |OutputForm|))
        (SPROG ((|mon| (|OutputForm|)))
               (SEQ
                (COND ((EQL |k| 0) (SPADCALL |c| (QREFELT $ 224)))
                      (#1='T
                       (SEQ
                        (LETT |mon|
                              (COND ((EQL |k| 1) |vv|)
                                    (#1#
                                     (SPADCALL |vv|
                                               (SPADCALL |k| (QREFELT $ 225))
                                               (QREFELT $ 226))))
                              |ULSCONS;termOutput|)
                        (EXIT
                         (COND
                          ((SPADCALL |c| (|spadConstant| $ 25) (QREFELT $ 58))
                           |mon|)
                          ((SPADCALL |c|
                                     (SPADCALL (|spadConstant| $ 25)
                                               (QREFELT $ 227))
                                     (QREFELT $ 58))
                           (SPADCALL |mon| (QREFELT $ 228)))
                          (#1#
                           (SPADCALL (SPADCALL |c| (QREFELT $ 224)) |mon|
                                     (QREFELT $ 229))))))))))) 

(PUT '|ULSCONS;showAll?| '|SPADreplace| '(XLAM NIL |$streamsShowAll|)) 

(SDEFUN |ULSCONS;showAll?| (($ |Boolean|)) |$streamsShowAll|) 

(SDEFUN |ULSCONS;termsToOutputForm|
        ((|m| |Integer|) (|uu| |Stream| |Coef|) (|xxx| |OutputForm|)
         ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|uu1| (|Stream| |Coef|)) (|n| NIL)
          (#1=#:G515 NIL) (|count| (|NonNegativeInteger|)))
         (SEQ (LETT |l| NIL . #2=(|ULSCONS;termsToOutputForm|))
              (EXIT
               (COND
                ((SPADCALL |uu| (QREFELT $ 34))
                 (SPADCALL (|spadConstant| $ 14) (QREFELT $ 224)))
                (#3='T
                 (SEQ (LETT |count| |$streamCount| . #2#)
                      (SEQ (LETT |n| 0 . #2#) (LETT #1# |count| . #2#) G190
                           (COND
                            ((OR (|greater_SI| |n| #1#)
                                 (NULL (NULL (SPADCALL |uu| (QREFELT $ 34)))))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (SPADCALL |uu| (QREFELT $ 38))
                                        (|spadConstant| $ 14) (QREFELT $ 230))
                              (LETT |l|
                                    (CONS
                                     (|ULSCONS;termOutput| (+ |n| |m|)
                                      (SPADCALL |uu| (QREFELT $ 38)) |xxx| $)
                                     |l|)
                                    . #2#)))
                            (EXIT
                             (LETT |uu| (SPADCALL |uu| (QREFELT $ 40)) . #2#)))
                           (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (COND
                       ((|ULSCONS;showAll?| $)
                        (SEQ (LETT |uu1| |uu| . #2#)
                             (EXIT
                              (SEQ (LETT |n| (+ |count| 1) . #2#) G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((SPADCALL |uu| (QREFELT $ 231))
                                        (NULL
                                         (SPADCALL |uu1|
                                                   (SPADCALL |uu|
                                                             (QREFELT $ 40))
                                                   (QREFELT $ 232))))
                                       ('T NIL)))
                                     (GO G191)))
                                   (SEQ
                                    (COND
                                     ((SPADCALL (SPADCALL |uu| (QREFELT $ 38))
                                                (|spadConstant| $ 14)
                                                (QREFELT $ 230))
                                      (LETT |l|
                                            (CONS
                                             (|ULSCONS;termOutput| (+ |n| |m|)
                                              (SPADCALL |uu| (QREFELT $ 38))
                                              |xxx| $)
                                             |l|)
                                            . #2#)))
                                    (COND
                                     ((ODDP |n|)
                                      (LETT |uu1|
                                            (SPADCALL |uu1| (QREFELT $ 40))
                                            . #2#)))
                                    (EXIT
                                     (LETT |uu| (SPADCALL |uu| (QREFELT $ 40))
                                           . #2#)))
                                   (LETT |n| (+ |n| 1) . #2#) (GO G190) G191
                                   (EXIT NIL))))))
                      (LETT |l|
                            (COND ((SPADCALL |uu| (QREFELT $ 233)) |l|)
                                  (#3#
                                   (SEQ
                                    (COND
                                     ((SPADCALL |uu|
                                                (SPADCALL |uu| (QREFELT $ 40))
                                                (QREFELT $ 232))
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |uu| (QREFELT $ 38))
                                         (|spadConstant| $ 14) (QREFELT $ 58))
                                        (EXIT |l|)))))
                                    (EXIT
                                     (CONS
                                      (SPADCALL (SPADCALL 'O (QREFELT $ 234))
                                                (LIST
                                                 (SPADCALL |xxx|
                                                           (SPADCALL
                                                            (+ |n| |m|)
                                                            (QREFELT $ 225))
                                                           (QREFELT $ 226)))
                                                (QREFELT $ 236))
                                      |l|)))))
                            . #2#)
                      (EXIT
                       (COND
                        ((NULL |l|)
                         (SPADCALL (|spadConstant| $ 14) (QREFELT $ 224)))
                        (#3#
                         (SPADCALL (ELT $ 237) (NREVERSE |l|)
                                   (QREFELT $ 240)))))))))))) 

(SDEFUN |ULSCONS;coerce;$Of;98| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|xxx| (|OutputForm|)) (|cen| (|Coef|)) (|var| (|Symbol|))
          (|p| (|Stream| |Coef|)) (|uts| (UTS)) (|m| (|Integer|)))
         (SEQ
          (LETT |x| (SPADCALL |$streamCount| |x| (QREFELT $ 24))
                . #1=(|ULSCONS;coerce;$Of;98|))
          (LETT |m| (SPADCALL |x| (QREFELT $ 12)) . #1#)
          (LETT |uts| (|ULSCONS;getUTS| |x| $) . #1#)
          (LETT |p| (SPADCALL |uts| (QREFELT $ 46)) . #1#)
          (LETT |var| (SPADCALL |uts| (QREFELT $ 87)) . #1#)
          (LETT |cen| (SPADCALL |uts| (QREFELT $ 89)) . #1#)
          (LETT |xxx|
                (COND
                 ((SPADCALL |cen| (QREFELT $ 39))
                  (SPADCALL |var| (QREFELT $ 234)))
                 ('T
                  (SPADCALL
                   (SPADCALL (SPADCALL |var| (QREFELT $ 234))
                             (SPADCALL |cen| (QREFELT $ 224)) (QREFELT $ 241))
                   (QREFELT $ 242))))
                . #1#)
          (EXIT (|ULSCONS;termsToOutputForm| |m| |p| |xxx| $))))) 

(DECLAIM (NOTINLINE |UnivariateLaurentSeriesConstructor;|)) 

(DEFUN |UnivariateLaurentSeriesConstructor| (&REST #1=#:G561)
  (SPROG NIL
         (PROG (#2=#:G562)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariateLaurentSeriesConstructor|)
                                               '|domainEqualList|)
                    . #3=(|UnivariateLaurentSeriesConstructor|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |UnivariateLaurentSeriesConstructor;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariateLaurentSeriesConstructor|)))))))))) 

(DEFUN |UnivariateLaurentSeriesConstructor;| (|#1| |#2|)
  (SPROG
   ((#1=#:G560 NIL) (|pv$| NIL) (#2=#:G549 NIL) (#3=#:G550 NIL) (#4=#:G552 NIL)
    (#5=#:G553 NIL) (#6=#:G554 NIL) (#7=#:G555 NIL) (#8=#:G556 NIL)
    (#9=#:G558 NIL) (#10=#:G559 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #11=(|UnivariateLaurentSeriesConstructor|))
    (LETT DV$2 (|devaluate| |#2|) . #11#)
    (LETT |dv$| (LIST '|UnivariateLaurentSeriesConstructor| DV$1 DV$2) . #11#)
    (LETT $ (GETREFV 282) . #11#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|RetractableTo|
                                                              (|Symbol|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|ConvertibleTo|
                                                              (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|RealConstant|)))
                                        (LETT #10#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              '(|OrderedIntegralDomain|)))
                                              . #11#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|)))
                                         #10#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|RetractableTo|
                                                              (|Integer|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|StepThrough|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            (LIST
                                                             '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#2|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#2|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            (LIST '|Eltable|
                                                                  (|devaluate|
                                                                   |#2|)
                                                                  (|devaluate|
                                                                   |#2|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|ConvertibleTo|
                                                              (|Pattern|
                                                               (|Float|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|ConvertibleTo|
                                                              (|Pattern|
                                                               (|Integer|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|PatternMatchable|
                                                              (|Float|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|PatternMatchable|
                                                              (|Integer|))))
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #11#)
                                        (OR #9#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #11#)
                                        (OR #9# (|HasCategory| |#1| '(|Field|))
                                            #8#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #8#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|Comparable|)))
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              '(|OrderedSet|)))
                                              . #11#)
                                        (OR #10# #7#)
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|Comparable|)))
                                         #10# #7#)
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (LETT #6#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|))
                                              . #11#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              #6#))
                                        (LETT #5#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|))
                                              . #11#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             #5#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|IntegerNumberSystem|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|EuclideanDomain|)))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              . #11#)
                                        (OR #4#
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|ConvertibleTo|
                                                              (|Pattern|
                                                               (|Float|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|ConvertibleTo|
                                                              (|Pattern|
                                                               (|Integer|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|ConvertibleTo|
                                                              (|InputForm|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            (LIST '|Eltable|
                                                                  (|devaluate|
                                                                   |#2|)
                                                                  (|devaluate|
                                                                   |#2|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#2|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            (LIST
                                                             '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#2|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|PatternMatchable|
                                                              (|Float|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|PatternMatchable|
                                                              (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|RetractableTo|
                                                              (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|RetractableTo|
                                                              (|Symbol|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|Comparable|)))
                                            #10# #7#
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             #5#)
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|RealConstant|)))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|StepThrough|))))
                                        (OR
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|AlgebraicallyClosedFunctionSpace|
                                                               (|Integer|)))
                                              (|HasCategory| |#1|
                                                             '(|PrimitiveFunctionCategory|))
                                              (|HasCategory| |#1|
                                                             '(|TranscendentalFunctionCategory|)))
                                         (AND #4#
                                              (|HasSignature| |#1|
                                                              (LIST
                                                               '|integrate|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|))))
                                              (|HasSignature| |#1|
                                                              (LIST
                                                               '|variables|
                                                               (LIST
                                                                '(|List|
                                                                  (|Symbol|))
                                                                (|devaluate|
                                                                 |#1|))))))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|)
                                                               (|devaluate|
                                                                |#1|))))
                                        (OR (|HasCategory| |#1| '(|SemiRing|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasSignature| |#1|
                                                          (LIST '*
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Integer|)
                                                                 (|devaluate|
                                                                  |#1|)))))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))))
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|DifferentialRing|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #11#)
                                        (OR #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicNonZero|))
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicZero|))
                                            #9# (|HasCategory| |#1| '(|Field|))
                                            #8# #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #11#)
                                        (OR
                                         (AND #4#
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|)))
                                         #2#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #2#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))))
                    . #11#))
    (|haddProp| |$ConstructorCache| '|UnivariateLaurentSeriesConstructor|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 4503599627370496))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|Field|))
                (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #11#)
     (|augmentPredVector| $ 9007199254740992))
    (AND
     (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
         (AND (|HasCategory| |#1| '(|Field|)) #6#) #1#)
     (|augmentPredVector| $ 18014398509481984))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 36028797018963968))
    (AND
     (OR (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 72057594037927936))
    (AND
     (OR (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 144115188075855872))
    (AND
     (OR (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 288230376151711744))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 576460752303423488))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 1152921504606846976))
    (AND
     (OR #2# (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 2305843009213693952))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|Record| (|:| |expon| (|Integer|)) (|:| |ps| |#2|)))
    (COND
     ((|testBitVector| |pv$| 22)
      (PROGN
       (QSETREFV $ 112
                 (CONS (|dispatchFunction| |ULSCONS;rationalFunction;$IF;40|)
                       $))
       (QSETREFV $ 114
                 (CONS (|dispatchFunction| |ULSCONS;rationalFunction;$2IF;41|)
                       $))
       (QSETREFV $ 116 (CONS (|dispatchFunction| |ULSCONS;exquo;2$U;42|) $)))))
    (COND
     ((|HasSignature| |#1|
                      (LIST '|coerce| (LIST (|devaluate| |#1|) '(|Symbol|))))
      (COND
       ((|testBitVector| |pv$| 20)
        (QSETREFV $ 122
                  (CONS (|dispatchFunction| |ULSCONS;approximate;$ICoef;43|)
                        $))))))
    (COND
     ((|HasCategory| |#1| '(|PartialDifferentialRing| (|Symbol|)))
      (QSETREFV $ 140
                (CONS (|dispatchFunction| |ULSCONS;differentiate;$S$;50|) $))))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV $ 143 (CONS (|dispatchFunction| |ULSCONS;retract;$UTS;52|) $))
       (QSETREFV $ 144
                 (CONS (|dispatchFunction| |ULSCONS;retractIfCan;$U;53|) $))
       (QSETREFV $ 146 (CONS (|dispatchFunction| |ULSCONS;^;$I$;54|) $))
       (QSETREFV $ 147 (CONS (|dispatchFunction| |ULSCONS;*;UTS2$;55|) $))
       (QSETREFV $ 148 (CONS (|dispatchFunction| |ULSCONS;*;$UTS$;56|) $))
       (QSETREFV $ 145 (CONS (|dispatchFunction| |ULSCONS;inv;2$;57|) $))
       (QSETREFV $ 149 (CONS (|dispatchFunction| |ULSCONS;/;3$;58|) $))
       (QSETREFV $ 150 (CONS (|dispatchFunction| |ULSCONS;/;2UTS$;59|) $))
       (QSETREFV $ 151 (CONS (|dispatchFunction| |ULSCONS;numer;$UTS;60|) $))
       (QSETREFV $ 152
                 (CONS (|dispatchFunction| |ULSCONS;denom;$UTS;61|) $)))))
    (COND
     ((|testBitVector| |pv$| 36)
      (PROGN
       (QSETREFV $ 155 (CONS (|dispatchFunction| |ULSCONS;coerce;F$;62|) $))
       (COND
        ((|testBitVector| |pv$| 2)
         (QSETREFV $ 158 (CONS (|dispatchFunction| |ULSCONS;^;$F$;63|) $))))
       (QSETREFV $ 160 (CONS (|dispatchFunction| |ULSCONS;exp;2$;64|) $))
       (QSETREFV $ 162 (CONS (|dispatchFunction| |ULSCONS;log;2$;65|) $))
       (QSETREFV $ 164 (CONS (|dispatchFunction| |ULSCONS;sin;2$;66|) $))
       (QSETREFV $ 166 (CONS (|dispatchFunction| |ULSCONS;cos;2$;67|) $))
       (QSETREFV $ 168 (CONS (|dispatchFunction| |ULSCONS;tan;2$;68|) $))
       (QSETREFV $ 170 (CONS (|dispatchFunction| |ULSCONS;cot;2$;69|) $))
       (QSETREFV $ 172 (CONS (|dispatchFunction| |ULSCONS;sec;2$;70|) $))
       (QSETREFV $ 174 (CONS (|dispatchFunction| |ULSCONS;csc;2$;71|) $))
       (QSETREFV $ 176 (CONS (|dispatchFunction| |ULSCONS;asin;2$;72|) $))
       (QSETREFV $ 178 (CONS (|dispatchFunction| |ULSCONS;acos;2$;73|) $))
       (QSETREFV $ 180 (CONS (|dispatchFunction| |ULSCONS;atan;2$;74|) $))
       (QSETREFV $ 182 (CONS (|dispatchFunction| |ULSCONS;acot;2$;75|) $))
       (QSETREFV $ 184 (CONS (|dispatchFunction| |ULSCONS;asec;2$;76|) $))
       (QSETREFV $ 186 (CONS (|dispatchFunction| |ULSCONS;acsc;2$;77|) $))
       (QSETREFV $ 188 (CONS (|dispatchFunction| |ULSCONS;sinh;2$;78|) $))
       (QSETREFV $ 190 (CONS (|dispatchFunction| |ULSCONS;cosh;2$;79|) $))
       (QSETREFV $ 192 (CONS (|dispatchFunction| |ULSCONS;tanh;2$;80|) $))
       (QSETREFV $ 194 (CONS (|dispatchFunction| |ULSCONS;coth;2$;81|) $))
       (QSETREFV $ 196 (CONS (|dispatchFunction| |ULSCONS;sech;2$;82|) $))
       (QSETREFV $ 198 (CONS (|dispatchFunction| |ULSCONS;csch;2$;83|) $))
       (QSETREFV $ 200 (CONS (|dispatchFunction| |ULSCONS;asinh;2$;84|) $))
       (QSETREFV $ 202 (CONS (|dispatchFunction| |ULSCONS;acosh;2$;85|) $))
       (QSETREFV $ 204 (CONS (|dispatchFunction| |ULSCONS;atanh;2$;86|) $))
       (QSETREFV $ 206 (CONS (|dispatchFunction| |ULSCONS;acoth;2$;87|) $))
       (QSETREFV $ 208 (CONS (|dispatchFunction| |ULSCONS;asech;2$;88|) $))
       (QSETREFV $ 210 (CONS (|dispatchFunction| |ULSCONS;acsch;2$;89|) $))
       NIL
       (QSETREFV $ 214 (CONS (|dispatchFunction| |ULSCONS;integrate;2$;91|) $))
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
           (QSETREFV $ 219
                     (CONS (|dispatchFunction| |ULSCONS;integrate;$S$;92|)
                           $))))))
       (COND
        ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
         (COND
          ((|HasCategory| |#1| '(|PrimitiveFunctionCategory|))
           (COND
            ((|HasCategory| |#1|
                            '(|AlgebraicallyClosedFunctionSpace| (|Integer|)))
             (PROGN
              (QSETREFV $ 219
                        (CONS (|dispatchFunction| |ULSCONS;integrate;$S$;94|)
                              $))))))))))))
    $))) 

(MAKEPROP '|UnivariateLaurentSeriesConstructor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Integer|) |ULSCONS;laurent;IUTS$;3| |ULSCONS;taylorRep;$UTS;4|
              |ULSCONS;degree;$I;5|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |ULSCONS;Zero;$;6|) $))
              (0 . |Zero|) (4 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |ULSCONS;One;$;7|) $))
              (8 . |One|) (12 . |coerce|) |ULSCONS;monomial;CoefI$;8|
              |ULSCONS;coerce;UTS$;9| |ULSCONS;coerce;Coef$;10| (17 . |coerce|)
              |ULSCONS;coerce;I$;11| |ULSCONS;removeZeroes;I2$;22| (22 . |One|)
              (|NonNegativeInteger|) (26 . |monomial|) (32 . *)
              (|Union| 7 '"failed") |ULSCONS;taylorIfCan;$U;12|
              |ULSCONS;taylor;$UTS;13| (|Boolean|) (|Stream| 6) (38 . |empty?|)
              (|Record| (|:| |k| 9) (|:| |c| 6)) (|Stream| 35) (43 . |empty|)
              (47 . |frst|) (52 . |zero?|) (57 . |rst|) (62 . |One|) (66 . +)
              (72 . |concat|) (|Mapping| $) (78 . |delay|)
              (83 . |coefficients|) |ULSCONS;terms;$S;18| (88 . |empty?|)
              (93 . |empty|) (97 . |frst|) (102 . =) (108 . |rst|)
              (113 . |concat|) (119 . |delay|) (124 . |series|)
              |ULSCONS;series;S$;20| (129 . |coefficient|) (135 . =)
              (141 . |quoByVar|) |ULSCONS;removeZeroes;2$;21| (146 . <=)
              (152 . =) (158 . >) |ULSCONS;=;2$B;23| |ULSCONS;pole?;$B;24|
              (164 . +) |ULSCONS;+;3$;25| (170 . -) |ULSCONS;-;3$;26|
              |ULSCONS;*;3$;27| (176 . *) (182 . ^) |ULSCONS;^;$Nni$;28|
              |ULSCONS;coefficient;$ICoef;34| (|Union| $ '"failed")
              (188 . |recip|) |ULSCONS;recip;$U;29| (193 . |elt|)
              |ULSCONS;elt;3$;30| (199 . |recip|) (204 . ^) (210 . |eval|)
              (|StreamTaylorSeriesOperations| 6) (216 . *)
              |ULSCONS;eval;$CoefS;31| (|Symbol|) (222 . |variable|)
              |ULSCONS;variable;$S;32| (227 . |center|)
              |ULSCONS;center;$Coef;33| |ULSCONS;elt;$ICoef;35| (232 . |order|)
              |ULSCONS;order;$I;36| (237 . |order|) |ULSCONS;order;$2I;37|
              (243 . |truncate|) |ULSCONS;truncate;$I$;38| (249 . |truncate|)
              |ULSCONS;truncate;$2I$;39| (|Fraction| 102) (256 . |Zero|)
              (|Polynomial| 6) (260 . |polynomial|) (266 . |coerce|)
              (271 . |coerce|) (276 . |coerce|) (281 . |positive?|) (286 . -)
              (292 . ^) (298 . *) (304 . /) (310 . |rationalFunction|)
              (316 . |polynomial|) (323 . |rationalFunction|) (330 . |exquo|)
              (336 . |exquo|) (342 . |approximate|) (348 . |coerce|) (353 . -)
              (359 . ^) (365 . *) (371 . |approximate|) (377 . |complete|)
              |ULSCONS;complete;2$;44| (382 . |extend|) |ULSCONS;extend;$I$;45|
              (|Mapping| 6 6) (388 . |map|) |ULSCONS;map;M2$;46|
              (|Mapping| 6 9) (394 . |multiplyCoefficients|)
              |ULSCONS;multiplyCoefficients;M2$;47| (|PositiveInteger|)
              (400 . *) (406 . |multiplyExponents|)
              |ULSCONS;multiplyExponents;$Pi$;48| |ULSCONS;differentiate;2$;49|
              (412 . |differentiate|) (418 . *) (424 . |differentiate|)
              (430 . |characteristic|) |ULSCONS;characteristic;Nni;51|
              (434 . |retract|) (439 . |retractIfCan|) (444 . |inv|) (449 . ^)
              (455 . *) (461 . *) (467 . /) (473 . /) (479 . |numer|)
              (484 . |denom|) (|Fraction| 9) (489 . |coerce|) (494 . |coerce|)
              (|ElementaryFunctionsUnivariateLaurentSeries| 6 7 $$) (499 . ^)
              (505 . ^) (511 . |exp|) (516 . |exp|) (521 . |log|) (526 . |log|)
              (531 . |sin|) (536 . |sin|) (541 . |cos|) (546 . |cos|)
              (551 . |tan|) (556 . |tan|) (561 . |cot|) (566 . |cot|)
              (571 . |sec|) (576 . |sec|) (581 . |csc|) (586 . |csc|)
              (591 . |asin|) (596 . |asin|) (601 . |acos|) (606 . |acos|)
              (611 . |atan|) (616 . |atan|) (621 . |acot|) (626 . |acot|)
              (631 . |asec|) (636 . |asec|) (641 . |acsc|) (646 . |acsc|)
              (651 . |sinh|) (656 . |sinh|) (661 . |cosh|) (666 . |cosh|)
              (671 . |tanh|) (676 . |tanh|) (681 . |coth|) (686 . |coth|)
              (691 . |sech|) (696 . |sech|) (701 . |csch|) (706 . |csch|)
              (711 . |asinh|) (716 . |asinh|) (721 . |acosh|) (726 . |acosh|)
              (731 . |atanh|) (736 . |atanh|) (741 . |acoth|) (746 . |acoth|)
              (751 . |asech|) (756 . |asech|) (761 . |acsch|) (766 . |acsch|)
              (771 . |coerce|) (776 . |inv|) (781 . -) (786 . |integrate|)
              (|List| 86) (791 . |variables|) (796 . |entry?|)
              (802 . |integrate|) (808 . |integrate|) (|Union| 6 (|List| 6))
              (|FunctionSpaceIntegration| 9 6) (814 . |integrate|)
              (|OutputForm|) (820 . |coerce|) (825 . |coerce|) (830 . ^)
              (836 . -) (841 . -) (846 . *) (852 . ~=)
              (858 . |explicitEntries?|) (863 . |eq?|)
              (869 . |explicitlyEmpty?|) (874 . |coerce|) (|List| $)
              (879 . |prefix|) (885 . +) (|Mapping| 223 223 223) (|List| 223)
              (891 . |reduce|) (897 . -) (903 . |paren|)
              |ULSCONS;coerce;$Of;98| (|Union| 253 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| 261) (|Pattern| 9) (|List| 7)
              (|Equation| 7) (|List| 250)
              (|Record| (|:| |mat| 254) (|:| |vec| (|Vector| 9))) (|Vector| $)
              (|Matrix| 9) (|PatternMatchResult| 261 $)
              (|PatternMatchResult| 9 $) (|Factored| 258)
              (|SparseUnivariatePolynomial| $) (|Union| 260 '#1#) (|List| 258)
              (|Float|) (|DoubleFloat|) (|Union| 153 '#2="failed")
              (|Union| 9 '#2#) (|Union| 86 '#2#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|List| 26) (|Mapping| 7 7)
              (|Record| (|:| |mat| 270) (|:| |vec| (|Vector| 7))) (|Matrix| 7)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |coef| 235) (|:| |generator| $))
              (|Union| 235 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 276 '"failed") (|Factored| $) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(~= 908 |zero?| 914 |wholePart| 919 |variable| 924 |unitNormal|
              929 |unitCanonical| 934 |unit?| 939 |truncate| 944 |terms| 957
              |taylorRep| 962 |taylorIfCan| 967 |taylor| 972 |tanh| 977 |tan|
              982 |subtractIfCan| 987 |squareFreePolynomial| 993
              |squareFreePart| 998 |squareFree| 1003 |sqrt| 1008
              |solveLinearPolynomialEquation| 1013 |smaller?| 1019 |sizeLess?|
              1025 |sinh| 1031 |sin| 1036 |sign| 1041 |series| 1046 |sech| 1051
              |sec| 1056 |sample| 1061 |rightRecip| 1065 |rightPower| 1070
              |retractIfCan| 1082 |retract| 1102 |removeZeroes| 1122 |rem| 1133
              |reductum| 1139 |reducedSystem| 1144 |recip| 1166
              |rationalFunction| 1171 |quo| 1184 |principalIdeal| 1190 |prime?|
              1195 |positive?| 1200 |pole?| 1205 |pi| 1210 |patternMatch| 1214
              |order| 1228 |opposite?| 1239 |one?| 1245 |numerator| 1250
              |numer| 1255 |nthRoot| 1260 |nextItem| 1266 |negative?| 1271
              |multiplyExponents| 1276 |multiplyCoefficients| 1282
              |multiEuclidean| 1288 |monomial?| 1294 |monomial| 1299 |min| 1305
              |max| 1311 |map| 1317 |log| 1329 |leftRecip| 1334 |leftPower|
              1339 |leadingMonomial| 1351 |leadingCoefficient| 1356 |lcmCoef|
              1361 |lcm| 1367 |laurent| 1378 |latex| 1390 |inv| 1395
              |integrate| 1400 |init| 1411 |hashUpdate!| 1415 |hash| 1421
              |gcdPolynomial| 1426 |gcd| 1432 |fractionPart| 1443 |floor| 1448
              |factorSquareFreePolynomial| 1453 |factorPolynomial| 1458
              |factor| 1463 |extendedEuclidean| 1468 |extend| 1481 |exquo| 1487
              |expressIdealMember| 1493 |exp| 1499 |eval| 1504 |euclideanSize|
              1550 |elt| 1555 |divide| 1573 |differentiate| 1579 |denominator|
              1629 |denom| 1634 |degree| 1639 |csch| 1644 |csc| 1649 |coth|
              1654 |cot| 1659 |cosh| 1664 |cos| 1669 |convert| 1674
              |conditionP| 1699 |complete| 1704 |commutator| 1709 |coerce| 1715
              |coefficient| 1750 |charthRoot| 1756 |characteristic| 1761
              |center| 1765 |ceiling| 1770 |atanh| 1775 |atan| 1780
              |associator| 1785 |associates?| 1792 |asinh| 1798 |asin| 1803
              |asech| 1808 |asec| 1813 |approximate| 1818 |antiCommutator| 1824
              |annihilate?| 1830 |acsch| 1836 |acsc| 1841 |acoth| 1846 |acot|
              1851 |acosh| 1856 |acos| 1861 |abs| 1866 ^ 1871 |Zero| 1901 |One|
              1905 D 1909 >= 1959 > 1965 = 1971 <= 1977 < 1983 / 1989 - 2007 +
              2018 * 2024)
           'NIL
           (CONS
            (|makeByteWordVec2| 52
                                '(0 0 2 2 0 2 33 0 2 2 0 2 6 24 2 2 23 6 2 2 19
                                  23 24 37 31 7 2 42 43 2 13 46 41 46 0 19 23
                                  37 2 0 0 45 37 6 2 0 0 0 0 37 37 6 2 2 46 52
                                  6 51 41 41 6 0 0 50 41 27 2 0 0 28 9 2 16 17
                                  0 23 37 5 11 2 0 0 0 0 1 23 24 2 2 37 37 37
                                  37 37 37 45 3 4 5 5 27 8 8 10 11 12 14 15 2))
            (CONS
             '#(|UnivariateLaurentSeriesConstructorCategory&|
                |UnivariateLaurentSeriesCategory&| |QuotientFieldCategory&|
                |Field&| |UnivariatePowerSeriesCategory&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL NIL NIL |DivisionRing&| NIL |OrderedRing&|
                |DifferentialExtension&| |FullyLinearlyExplicitOver&|
                |Algebra&| |Algebra&| |EntireRing&| |Algebra&| NIL NIL
                |Algebra&| |PartialDifferentialRing&| |DifferentialRing&| NIL
                NIL NIL NIL |Rng&| NIL |Module&| |Module&| |Module&| |Module&|
                NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL NIL
                NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| NIL NIL
                NIL NIL NIL |NonAssociativeSemiRng&| NIL |AbelianMonoid&|
                |MagmaWithUnit&| |OrderedSet&| NIL |Magma&| |AbelianSemiGroup&|
                NIL NIL |FullyEvalableOver&| NIL NIL |SetCategory&| NIL
                |TranscendentalFunctionCategory&| NIL |Evalable&| NIL
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL |RetractableTo&| NIL NIL NIL
                |PartialOrder&| |RetractableTo&| |RetractableTo&|
                |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL)
             (CONS
              '#((|UnivariateLaurentSeriesConstructorCategory| 6 7)
                 (|UnivariateLaurentSeriesCategory| 6)
                 (|QuotientFieldCategory| 7) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 9) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|)
                 (|PowerSeriesCategory| 6 9 (|SingletonAsOrderedSet|))
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 9) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|DivisionRing|) (|CommutativeRing|) (|OrderedRing|)
                 (|DifferentialExtension| 7) (|FullyLinearlyExplicitOver| 7)
                 (|Algebra| 6) (|Algebra| $$) (|EntireRing|) (|Algebra| 153)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 7)
                 (|PartialDifferentialRing| 86) (|DifferentialRing|)
                 (|LinearlyExplicitOver| 7) (|LinearlyExplicitOver| 9) (|Ring|)
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 6) (|Module| $$)
                 (|Module| 153) (|Module| 7) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 153 153)
                 (|OrderedAbelianGroup|) (|BiModule| 7 7) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 153) (|RightModule| 153)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| 7)
                 (|RightModule| 7) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|OrderedAbelianSemiGroup|) (|NonAssociativeSemiRng|)
                 (|SemiGroup|) (|AbelianMonoid|) (|MagmaWithUnit|)
                 (|OrderedSet|) (|FullyPatternMatchable| 7) (|Magma|)
                 (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|FullyEvalableOver| 7) (|PatternMatchable| 261)
                 (|PatternMatchable| 9) (|SetCategory|) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|) (|RealConstant|)
                 (|Evalable| 7) (|Patternable| 7) (|RetractableTo| 7)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 223) (|Eltable| $$ $$) (|TwoSidedRecip|)
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|unitsKnown|) (|RetractableTo| 86) (|ConvertibleTo| 246)
                 (|ConvertibleTo| 262) (|ConvertibleTo| 261) (|PartialOrder|)
                 (|RetractableTo| 153) (|RetractableTo| 9)
                 (|InnerEvalable| 86 7) (|InnerEvalable| 7 7) (|Eltable| 7 $$)
                 (|ConvertibleTo| 247) (|ConvertibleTo| 248) (|Type|))
              (|makeByteWordVec2| 281
                                  '(0 6 0 14 0 7 0 15 0 7 0 17 1 7 0 6 18 1 6 0
                                    9 22 0 6 0 25 2 7 0 6 26 27 2 7 0 0 0 28 1
                                    33 32 0 34 0 36 0 37 1 33 6 0 38 1 6 32 0
                                    39 1 33 0 0 40 0 9 0 41 2 9 0 0 0 42 2 36 0
                                    35 0 43 1 36 0 44 45 1 7 33 0 46 1 36 32 0
                                    48 0 33 0 49 1 36 35 0 50 2 9 32 0 0 51 1
                                    36 0 0 52 2 33 0 6 0 53 1 33 0 44 54 1 7 0
                                    33 55 2 7 6 0 26 57 2 6 32 0 0 58 1 7 0 0
                                    59 2 9 32 0 0 61 2 7 32 0 0 62 2 9 32 0 0
                                    63 2 7 0 0 0 66 2 7 0 0 0 68 2 9 0 26 0 71
                                    2 7 0 0 26 72 1 7 75 0 76 2 7 0 0 0 78 1 6
                                    75 0 80 2 6 0 0 26 81 2 7 33 0 6 82 2 83 33
                                    6 33 84 1 7 86 0 87 1 7 6 0 89 1 7 26 0 92
                                    2 7 26 0 26 94 2 7 0 0 26 96 3 7 0 0 26 26
                                    98 0 100 0 101 2 7 102 0 26 103 1 100 0 102
                                    104 1 100 0 86 105 1 102 0 6 106 1 9 32 0
                                    107 2 100 0 0 0 108 2 100 0 0 9 109 2 100 0
                                    0 0 110 2 100 0 0 0 111 2 0 100 0 9 112 3 7
                                    102 0 26 26 113 3 0 100 0 9 9 114 2 7 75 0
                                    0 115 2 0 75 0 0 116 2 7 6 0 26 117 1 6 0
                                    86 118 2 6 0 0 0 119 2 6 0 0 9 120 2 6 0 0
                                    0 121 2 0 6 0 9 122 1 7 0 0 123 2 7 0 0 26
                                    125 2 7 0 127 0 128 2 7 0 130 0 131 2 9 0
                                    133 0 134 2 7 0 0 133 135 2 6 0 0 86 138 2
                                    0 0 6 0 139 2 0 0 0 86 140 0 6 26 141 1 0 7
                                    0 143 1 0 29 0 144 1 0 0 0 145 2 0 0 0 9
                                    146 2 0 0 7 0 147 2 0 0 0 7 148 2 0 0 0 0
                                    149 2 0 0 7 7 150 1 0 7 0 151 1 0 7 0 152 1
                                    6 0 153 154 1 0 0 153 155 2 156 2 2 153 157
                                    2 0 0 0 153 158 1 156 2 2 159 1 0 0 0 160 1
                                    156 2 2 161 1 0 0 0 162 1 156 2 2 163 1 0 0
                                    0 164 1 156 2 2 165 1 0 0 0 166 1 156 2 2
                                    167 1 0 0 0 168 1 156 2 2 169 1 0 0 0 170 1
                                    156 2 2 171 1 0 0 0 172 1 156 2 2 173 1 0 0
                                    0 174 1 156 2 2 175 1 0 0 0 176 1 156 2 2
                                    177 1 0 0 0 178 1 156 2 2 179 1 0 0 0 180 1
                                    156 2 2 181 1 0 0 0 182 1 156 2 2 183 1 0 0
                                    0 184 1 156 2 2 185 1 0 0 0 186 1 156 2 2
                                    187 1 0 0 0 188 1 156 2 2 189 1 0 0 0 190 1
                                    156 2 2 191 1 0 0 0 192 1 156 2 2 193 1 0 0
                                    0 194 1 156 2 2 195 1 0 0 0 196 1 156 2 2
                                    197 1 0 0 0 198 1 156 2 2 199 1 0 0 0 200 1
                                    156 2 2 201 1 0 0 0 202 1 156 2 2 203 1 0 0
                                    0 204 1 156 2 2 205 1 0 0 0 206 1 156 2 2
                                    207 1 0 0 0 208 1 156 2 2 209 1 0 0 0 210 1
                                    153 0 9 211 1 153 0 0 212 1 0 0 0 213 1 0 0
                                    0 214 1 6 215 0 216 2 215 32 86 0 217 2 6 0
                                    0 86 218 2 0 0 0 86 219 2 221 220 6 86 222
                                    1 6 223 0 224 1 9 223 0 225 2 223 0 0 0 226
                                    1 6 0 0 227 1 223 0 0 228 2 223 0 0 0 229 2
                                    6 32 0 0 230 1 33 32 0 231 2 33 32 0 0 232
                                    1 33 32 0 233 1 86 223 0 234 2 223 0 0 235
                                    236 2 223 0 0 0 237 2 239 223 238 0 240 2
                                    223 0 0 0 241 1 223 0 0 242 2 0 32 0 0 1 1
                                    60 32 0 1 1 35 7 0 1 1 0 86 0 88 1 56 266 0
                                    1 1 56 0 0 1 1 56 32 0 1 2 0 0 0 9 97 3 0 0
                                    0 9 9 99 1 0 36 0 47 1 0 7 0 11 1 0 29 0 30
                                    1 0 7 0 31 1 36 0 0 192 1 36 0 0 168 2 61
                                    75 0 0 1 1 33 257 258 1 1 2 0 0 1 1 2 278 0
                                    1 1 36 0 0 1 2 33 259 260 258 1 2 25 32 0 0
                                    1 2 2 32 0 0 1 1 36 0 0 188 1 36 0 0 164 1
                                    6 9 0 1 1 0 0 36 56 1 36 0 0 196 1 36 0 0
                                    172 0 60 0 1 1 58 75 0 1 2 58 0 0 26 1 2 0
                                    0 0 133 1 1 8 263 0 1 1 8 264 0 1 1 3 265 0
                                    1 1 0 29 0 144 1 8 153 0 1 1 8 9 0 1 1 3 86
                                    0 1 1 0 7 0 143 2 0 0 9 0 24 1 0 0 0 60 2 2
                                    0 0 0 1 1 0 0 0 1 2 13 252 245 253 1 1 13
                                    254 245 1 2 2 269 245 253 1 1 2 270 245 1 1
                                    58 75 0 77 2 22 100 0 9 112 3 22 100 0 9 9
                                    114 2 2 0 0 0 1 1 2 272 235 1 1 2 32 0 1 1
                                    6 32 0 1 1 0 32 0 65 0 36 0 1 3 16 255 0
                                    247 255 1 3 17 256 0 248 256 1 2 0 9 0 9 95
                                    1 0 9 0 93 2 60 32 0 0 1 1 58 32 0 1 1 2 0
                                    0 1 1 2 7 0 151 2 36 0 0 9 1 1 9 75 0 1 1 6
                                    32 0 1 2 0 0 0 133 136 2 0 0 130 0 132 2 2
                                    273 235 0 1 1 0 32 0 1 2 0 0 6 9 19 2 26 0
                                    0 0 1 2 26 0 0 0 1 2 2 0 268 0 1 2 0 0 127
                                    0 129 1 36 0 0 162 1 58 75 0 1 2 58 0 0 26
                                    1 2 0 0 0 133 1 1 0 0 0 1 1 0 6 0 1 2 2 271
                                    0 0 1 1 2 0 235 1 2 2 0 0 0 1 2 0 0 9 7 10
                                    2 0 0 9 33 1 1 0 280 0 1 1 2 0 0 145 2 38 0
                                    0 86 219 1 36 0 0 214 0 9 0 1 2 0 279 279 0
                                    1 1 0 281 0 1 2 2 258 258 258 1 2 2 0 0 0 1
                                    1 2 0 235 1 1 35 0 0 1 1 34 7 0 1 1 33 257
                                    258 1 1 33 257 258 1 1 2 278 0 1 2 2 275 0
                                    0 1 3 2 277 0 0 0 1 2 0 0 0 9 126 2 56 75 0
                                    0 116 2 2 273 235 0 1 1 36 0 0 160 3 11 0 0
                                    249 249 1 2 11 0 0 250 1 3 11 0 0 7 7 1 2
                                    11 0 0 251 1 3 10 0 0 215 249 1 3 10 0 0 86
                                    7 1 2 20 33 0 6 85 1 2 26 0 1 2 12 0 0 7 1
                                    2 1 0 0 0 79 2 0 6 0 9 91 2 2 274 0 0 1 1
                                    43 0 0 137 2 43 0 0 26 1 2 42 0 0 86 140 2
                                    42 0 0 215 1 3 42 0 0 215 267 1 3 42 0 0 86
                                    26 1 3 2 0 0 268 26 1 2 2 0 0 268 1 1 2 0 0
                                    1 1 2 7 0 152 1 0 9 0 12 1 36 0 0 198 1 36
                                    0 0 174 1 36 0 0 194 1 36 0 0 170 1 36 0 0
                                    190 1 36 0 0 166 1 4 246 0 1 1 14 247 0 1 1
                                    15 248 0 1 1 5 261 0 1 1 5 262 0 1 1 54 244
                                    245 1 1 0 0 0 124 2 59 0 0 0 1 1 53 0 6 21
                                    1 3 0 86 1 1 57 0 0 1 1 59 0 9 23 1 36 0
                                    153 155 1 0 0 7 20 1 0 223 0 243 2 0 6 0 9
                                    74 1 55 75 0 1 0 59 26 142 1 0 6 0 90 1 34
                                    7 0 1 1 36 0 0 204 1 36 0 0 180 3 59 0 0 0
                                    0 1 2 56 32 0 0 1 1 36 0 0 200 1 36 0 0 176
                                    1 36 0 0 208 1 36 0 0 184 2 21 6 0 9 122 2
                                    0 0 0 0 1 2 59 32 0 0 1 1 36 0 0 210 1 36 0
                                    0 186 1 36 0 0 206 1 36 0 0 182 1 36 0 0
                                    202 1 36 0 0 178 1 6 0 0 1 2 58 0 0 26 73 2
                                    36 0 0 153 158 2 36 0 0 0 1 2 2 0 0 9 146 2
                                    0 0 0 133 1 0 60 0 13 0 58 0 16 1 43 0 0 1
                                    2 43 0 0 26 1 2 42 0 0 215 1 2 42 0 0 86 1
                                    3 42 0 0 215 267 1 3 42 0 0 86 26 1 3 2 0 0
                                    268 26 1 2 2 0 0 268 1 2 26 32 0 0 1 2 26
                                    32 0 0 1 2 0 32 0 0 64 2 26 32 0 0 1 2 26
                                    32 0 0 1 2 2 0 7 7 150 2 2 0 0 0 149 2 2 0
                                    0 6 1 1 62 0 0 213 2 62 0 0 0 69 2 0 0 0 0
                                    67 2 62 0 9 0 1 2 60 0 26 0 1 2 36 0 0 153
                                    1 2 36 0 153 0 1 2 2 0 7 0 147 2 2 0 0 7
                                    148 2 0 0 6 0 139 2 0 0 0 6 1 2 0 0 0 0 70
                                    2 0 0 133 0 1)))))
           '|lookupComplete|)) 
