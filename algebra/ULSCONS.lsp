
(/VERSIONCHECK 2) 

(PUT '|ULSCONS;getExpon| '|SPADreplace| 'QCAR) 

(DEFUN |ULSCONS;getExpon| (|x| $) (QCAR |x|)) 

(PUT '|ULSCONS;getUTS| '|SPADreplace| 'QCDR) 

(DEFUN |ULSCONS;getUTS| (|x| $) (QCDR |x|)) 

(PUT '|ULSCONS;laurent;IUTS$;3| '|SPADreplace| 'CONS) 

(DEFUN |ULSCONS;laurent;IUTS$;3| (|n| |psr| $) (CONS |n| |psr|)) 

(DEFUN |ULSCONS;taylorRep;$UTS;4| (|x| $) (|ULSCONS;getUTS| |x| $)) 

(DEFUN |ULSCONS;degree;$I;5| (|x| $) (|ULSCONS;getExpon| |x| $)) 

(DEFUN |ULSCONS;Zero;$;6| ($) (SPADCALL 0 (|spadConstant| $ 15) (QREFELT $ 10))) 

(DEFUN |ULSCONS;One;$;7| ($) (SPADCALL 0 (|spadConstant| $ 16) (QREFELT $ 10))) 

(DEFUN |ULSCONS;monomial;CoefI$;8| (|s| |e| $)
  (SPADCALL |e| (SPADCALL |s| (QREFELT $ 18)) (QREFELT $ 10))) 

(DEFUN |ULSCONS;coerce;UTS$;9| (|uts| $) (SPADCALL 0 |uts| (QREFELT $ 10))) 

(DEFUN |ULSCONS;coerce;Coef$;10| (|r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 18)) (QREFELT $ 20))) 

(DEFUN |ULSCONS;coerce;I$;11| (|i| $)
  (SPADCALL (SPADCALL |i| (QREFELT $ 22)) (QREFELT $ 21))) 

(DEFUN |ULSCONS;taylorIfCan;$U;12| (|uls| $)
  (PROG (#1=#:G167 |n|)
    (RETURN
     (SEQ
      (LETT |n| (|ULSCONS;getExpon| |uls| $)
            . #2=(|ULSCONS;taylorIfCan;$U;12|))
      (EXIT
       (COND
        ((< |n| 0)
         (SEQ (LETT |uls| (SPADCALL (- |n|) |uls| (QREFELT $ 24)) . #2#)
              (EXIT
               (COND ((< (|ULSCONS;getExpon| |uls| $) 0) (CONS 1 "failed"))
                     (#3='T (CONS 0 (|ULSCONS;getUTS| |uls| $)))))))
        ((EQL |n| 0) (CONS 0 (|ULSCONS;getUTS| |uls| $)))
        (#3#
         (CONS 0
               (SPADCALL (|ULSCONS;getUTS| |uls| $)
                         (SPADCALL (|spadConstant| $ 25)
                                   (PROG1 (LETT #1# |n| . #2#)
                                     (|check_subtype| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      #1#))
                                   (QREFELT $ 27))
                         (QREFELT $ 28)))))))))) 

(DEFUN |ULSCONS;taylor;$UTS;13| (|uls| $)
  (PROG (|uts|)
    (RETURN
     (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT $ 30)) |ULSCONS;taylor;$UTS;13|)
          (EXIT
           (COND
            ((QEQCAR |uts| 1) (|error| "taylor: Laurent series has a pole"))
            ('T (QCDR |uts|)))))))) 

(PUT '|ULSCONS;termExpon| '|SPADreplace| 'QCAR) 

(DEFUN |ULSCONS;termExpon| (|term| $) (QCAR |term|)) 

(PUT '|ULSCONS;termCoef| '|SPADreplace| 'QCDR) 

(DEFUN |ULSCONS;termCoef| (|term| $) (QCDR |term|)) 

(PUT '|ULSCONS;rec| '|SPADreplace| 'CONS) 

(DEFUN |ULSCONS;rec| (|exponent| |coef| $) (CONS |exponent| |coef|)) 

(DEFUN |ULSCONS;recs| (|st| |n| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|ULSCONS;recs!0| (VECTOR |n| $ |st|)) (QREFELT $ 45))))) 

(DEFUN |ULSCONS;recs!0| ($$)
  (PROG (|st| $ |n|)
    (LETT |st| (QREFELT $$ 2) . #1=(|ULSCONS;recs|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |n| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|coef|)
        (RETURN
         (COND ((SPADCALL |st| (QREFELT $ 34)) (SPADCALL (QREFELT $ 37)))
               ((SPADCALL (LETT |coef| (SPADCALL |st| (QREFELT $ 38)) NIL)
                          (QREFELT $ 39))
                (|ULSCONS;recs| (SPADCALL |st| (QREFELT $ 40))
                 (SPADCALL |n| (|spadConstant| $ 41) (QREFELT $ 42)) $))
               ('T
                (SPADCALL (|ULSCONS;rec| |n| |coef| $)
                          (|ULSCONS;recs| (SPADCALL |st| (QREFELT $ 40))
                           (SPADCALL |n| (|spadConstant| $ 41) (QREFELT $ 42))
                           $)
                          (QREFELT $ 43)))))))))) 

(DEFUN |ULSCONS;terms;$S;18| (|x| $)
  (|ULSCONS;recs| (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 46))
   (|ULSCONS;getExpon| |x| $) $)) 

(DEFUN |ULSCONS;recsToCoefs| (|st| |n| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|ULSCONS;recsToCoefs!0| (VECTOR |n| $ |st|))
                (QREFELT $ 55)))))) 

(DEFUN |ULSCONS;recsToCoefs!0| ($$)
  (PROG (|st| $ |n|)
    (LETT |st| (QREFELT $$ 2) . #1=(|ULSCONS;recsToCoefs|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |n| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|term| |ex|)
        (RETURN
         (SEQ
          (COND ((SPADCALL |st| (QREFELT $ 48)) (SPADCALL (QREFELT $ 49)))
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
                                   (|ULSCONS;recsToCoefs|
                                    (SPADCALL |st| (QREFELT $ 52))
                                    (SPADCALL |n| (|spadConstant| $ 41)
                                              (QREFELT $ 42))
                                    $)
                                   (QREFELT $ 53))))))))))))))) 

(DEFUN |ULSCONS;series;S$;20| (|st| $)
  (PROG (|ex|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |st| (QREFELT $ 48)) (|spadConstant| $ 13))
            ('T
             (SEQ
              (LETT |ex| (|ULSCONS;termExpon| (SPADCALL |st| (QREFELT $ 50)) $)
                    |ULSCONS;series;S$;20|)
              (EXIT
               (SPADCALL |ex|
                         (SPADCALL (|ULSCONS;recsToCoefs| |st| |ex| $)
                                   (QREFELT $ 56))
                         (QREFELT $ 10)))))))))) 

(DEFUN |ULSCONS;removeZeroes;2$;21| (|x| $)
  (PROG (|xUTS|)
    (RETURN
     (COND
      ((SPADCALL
        (SPADCALL
         (LETT |xUTS| (|ULSCONS;getUTS| |x| $) |ULSCONS;removeZeroes;2$;21|)
         (QREFELT $ 46))
        (QREFELT $ 34))
       (|spadConstant| $ 13))
      ((SPADCALL (SPADCALL |xUTS| 0 (QREFELT $ 58)) (|spadConstant| $ 14)
                 (QREFELT $ 59))
       (SPADCALL
        (SPADCALL (+ (|ULSCONS;getExpon| |x| $) 1)
                  (SPADCALL |xUTS| (QREFELT $ 60)) (QREFELT $ 10))
        (QREFELT $ 61)))
      ('T |x|))))) 

(DEFUN |ULSCONS;removeZeroes;I2$;22| (|n| |x| $)
  (PROG (|xUTS|)
    (RETURN
     (COND ((SPADCALL |n| 0 (QREFELT $ 62)) |x|)
           ((SPADCALL
             (SPADCALL
              (LETT |xUTS| (|ULSCONS;getUTS| |x| $)
                    |ULSCONS;removeZeroes;I2$;22|)
              (QREFELT $ 46))
             (QREFELT $ 34))
            (|spadConstant| $ 13))
           ((SPADCALL (SPADCALL |xUTS| 0 (QREFELT $ 58)) (|spadConstant| $ 14)
                      (QREFELT $ 59))
            (SPADCALL (- |n| 1)
                      (SPADCALL (+ (|ULSCONS;getExpon| |x| $) 1)
                                (SPADCALL |xUTS| (QREFELT $ 60))
                                (QREFELT $ 10))
                      (QREFELT $ 24)))
           ('T |x|))))) 

(DEFUN |ULSCONS;=;2$B;23| (|x| |y| $)
  (PROG (#1=#:G243 #2=#:G234 |expDiff|)
    (RETURN
     (SEQ
      (COND ((EQ |x| |y|) 'T)
            (#3='T
             (SEQ
              (LETT |expDiff|
                    (- (|ULSCONS;getExpon| |x| $) (|ULSCONS;getExpon| |y| $))
                    . #4=(|ULSCONS;=;2$B;23|))
              (EXIT
               (COND
                ((EQL |expDiff| 0)
                 (SPADCALL (|ULSCONS;getUTS| |x| $) (|ULSCONS;getUTS| |y| $)
                           (QREFELT $ 63)))
                ((SPADCALL (ABS |expDiff|) |$streamCount| (QREFELT $ 64)) 'NIL)
                ((SPADCALL |expDiff| 0 (QREFELT $ 64))
                 (SPADCALL
                  (SPADCALL (|ULSCONS;getUTS| |x| $)
                            (SPADCALL (|spadConstant| $ 25)
                                      (PROG1 (LETT #2# |expDiff| . #4#)
                                        (|check_subtype| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         #2#))
                                      (QREFELT $ 27))
                            (QREFELT $ 28))
                  (|ULSCONS;getUTS| |y| $) (QREFELT $ 63)))
                (#3#
                 (SPADCALL
                  (SPADCALL (|ULSCONS;getUTS| |y| $)
                            (SPADCALL (|spadConstant| $ 25)
                                      (PROG1 (LETT #1# (- |expDiff|) . #4#)
                                        (|check_subtype| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         #1#))
                                      (QREFELT $ 27))
                            (QREFELT $ 28))
                  (|ULSCONS;getUTS| |x| $) (QREFELT $ 63)))))))))))) 

(DEFUN |ULSCONS;pole?;$B;24| (|x| $)
  (PROG (|n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL |x| (QREFELT $ 12)) . #1=(|ULSCONS;pole?;$B;24|))
          (EXIT
           (COND ((>= |n| 0) 'NIL)
                 ('T
                  (SEQ (LETT |x| (SPADCALL (- |n|) |x| (QREFELT $ 24)) . #1#)
                       (EXIT (< (SPADCALL |x| (QREFELT $ 12)) 0)))))))))) 

(DEFUN |ULSCONS;+;3$;25| (|x| |y| $)
  (PROG (#1=#:G254 #2=#:G253 |n|)
    (RETURN
     (SEQ
      (LETT |n| (- (|ULSCONS;getExpon| |x| $) (|ULSCONS;getExpon| |y| $))
            . #3=(|ULSCONS;+;3$;25|))
      (EXIT
       (COND
        ((>= |n| 0)
         (SPADCALL (|ULSCONS;getExpon| |y| $)
                   (SPADCALL (|ULSCONS;getUTS| |y| $)
                             (SPADCALL (|ULSCONS;getUTS| |x| $)
                                       (SPADCALL (|spadConstant| $ 25)
                                                 (PROG1 (LETT #2# |n| . #3#)
                                                   (|check_subtype| (>= #2# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    #2#))
                                                 (QREFELT $ 27))
                                       (QREFELT $ 28))
                             (QREFELT $ 67))
                   (QREFELT $ 10)))
        ('T
         (SPADCALL (|ULSCONS;getExpon| |x| $)
                   (SPADCALL (|ULSCONS;getUTS| |x| $)
                             (SPADCALL (|ULSCONS;getUTS| |y| $)
                                       (SPADCALL (|spadConstant| $ 25)
                                                 (PROG1
                                                     (LETT #1# (- |n|) . #3#)
                                                   (|check_subtype| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    #1#))
                                                 (QREFELT $ 27))
                                       (QREFELT $ 28))
                             (QREFELT $ 67))
                   (QREFELT $ 10))))))))) 

(DEFUN |ULSCONS;-;3$;26| (|x| |y| $)
  (PROG (#1=#:G259 #2=#:G258 |n|)
    (RETURN
     (SEQ
      (LETT |n| (- (|ULSCONS;getExpon| |x| $) (|ULSCONS;getExpon| |y| $))
            . #3=(|ULSCONS;-;3$;26|))
      (EXIT
       (COND
        ((>= |n| 0)
         (SPADCALL (|ULSCONS;getExpon| |y| $)
                   (SPADCALL
                    (SPADCALL (|ULSCONS;getUTS| |x| $)
                              (SPADCALL (|spadConstant| $ 25)
                                        (PROG1 (LETT #2# |n| . #3#)
                                          (|check_subtype| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           #2#))
                                        (QREFELT $ 27))
                              (QREFELT $ 28))
                    (|ULSCONS;getUTS| |y| $) (QREFELT $ 69))
                   (QREFELT $ 10)))
        ('T
         (SPADCALL (|ULSCONS;getExpon| |x| $)
                   (SPADCALL (|ULSCONS;getUTS| |x| $)
                             (SPADCALL (|ULSCONS;getUTS| |y| $)
                                       (SPADCALL (|spadConstant| $ 25)
                                                 (PROG1
                                                     (LETT #1# (- |n|) . #3#)
                                                   (|check_subtype| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    #1#))
                                                 (QREFELT $ 27))
                                       (QREFELT $ 28))
                             (QREFELT $ 69))
                   (QREFELT $ 10))))))))) 

(DEFUN |ULSCONS;*;3$;27| (|x| |y| $)
  (SPADCALL (+ (|ULSCONS;getExpon| |x| $) (|ULSCONS;getExpon| |y| $))
            (SPADCALL (|ULSCONS;getUTS| |x| $) (|ULSCONS;getUTS| |y| $)
                      (QREFELT $ 28))
            (QREFELT $ 10))) 

(DEFUN |ULSCONS;^;$Nni$;28| (|x| |n| $)
  (COND
   ((ZEROP |n|)
    (COND ((SPADCALL |x| (QREFELT $ 72)) (|error| "0 ^ 0 is undefined"))
          (#1='T (|spadConstant| $ 17))))
   (#1#
    (SPADCALL (SPADCALL |n| (|ULSCONS;getExpon| |x| $) (QREFELT $ 73))
              (SPADCALL (|ULSCONS;getUTS| |x| $) |n| (QREFELT $ 74))
              (QREFELT $ 10))))) 

(DEFUN |ULSCONS;recip;$U;29| (|x| $)
  (PROG (|uts| |d|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL 1000 |x| (QREFELT $ 24))
            . #1=(|ULSCONS;recip;$U;29|))
      (EXIT
       (COND
        ((SPADCALL
          (SPADCALL |x| (LETT |d| (SPADCALL |x| (QREFELT $ 12)) . #1#)
                    (QREFELT $ 76))
          (QREFELT $ 39))
         (CONS 1 "failed"))
        (#2='T
         (SEQ
          (LETT |uts| (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 78)) . #1#)
          (EXIT
           (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                 (#2#
                  (CONS 0
                        (SPADCALL (- |d|) (QCDR |uts|)
                                  (QREFELT $ 10)))))))))))))) 

(DEFUN |ULSCONS;elt;3$;30| (|uls1| |uls2| $)
  (PROG (#1=#:G290 |uts1| |recipr| |deg| |uts2| |uts|)
    (RETURN
     (SEQ
      (LETT |uts| (SPADCALL |uls2| (QREFELT $ 30)) . #2=(|ULSCONS;elt;3$;30|))
      (EXIT
       (COND
        ((QEQCAR |uts| 1)
         (|error| "elt: second argument must have positive order"))
        (#3='T
         (SEQ (LETT |uts2| (QCDR |uts|) . #2#)
              (COND
               ((NULL
                 (SPADCALL (SPADCALL |uts2| 0 (QREFELT $ 58)) (QREFELT $ 39)))
                (EXIT
                 (|error| "elt: second argument must have positive order"))))
              (SEQ (LETT |deg| (|ULSCONS;getExpon| |uls1| $) . #2#)
                   (EXIT
                    (COND
                     ((< |deg| 0)
                      (LETT |uls1| (SPADCALL (- |deg|) |uls1| (QREFELT $ 24))
                            . #2#)))))
              (LETT |deg| (|ULSCONS;getExpon| |uls1| $) . #2#)
              (EXIT
               (COND
                ((< |deg| 0)
                 (SEQ
                  (LETT |recipr|
                        (SPADCALL (SPADCALL |uts2| (QREFELT $ 20))
                                  (QREFELT $ 79))
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
                                       (QREFELT $ 71))
                             (QREFELT $ 31))
                            . #2#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |uts1| |uts2| (QREFELT $ 80))
                                  (QREFELT $ 20))
                        (SPADCALL (QCDR |recipr|)
                                  (PROG1 (LETT #1# (- |deg|) . #2#)
                                    (|check_subtype| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     #1#))
                                  (QREFELT $ 75))
                        (QREFELT $ 71)))))))))
                (#3#
                 (SPADCALL
                  (SPADCALL (SPADCALL |uls1| (QREFELT $ 31)) |uts2|
                            (QREFELT $ 80))
                  (QREFELT $ 20))))))))))))) 

(DEFUN |ULSCONS;eval;$CoefS;31| (|uls| |r| $)
  (PROG (#1=#:G309 #2=#:G302 |recipr| |n| |uts|)
    (RETURN
     (SEQ
      (SEQ
       (LETT |n| (|ULSCONS;getExpon| |uls| $) . #3=(|ULSCONS;eval;$CoefS;31|))
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
           (SEQ (LETT |recipr| (SPADCALL |r| (QREFELT $ 82)) . #3#)
                (EXIT
                 (COND
                  ((QEQCAR |recipr| 1)
                   (|error| "eval: non-unit raised to negative power"))
                  (#4#
                   (SPADCALL
                    (SPADCALL (QCDR |recipr|)
                              (PROG1 (LETT #2# (- |n|) . #3#)
                                (|check_subtype| (>= #2# 0)
                                                 '(|NonNegativeInteger|) #2#))
                              (QREFELT $ 83))
                    (SPADCALL |uts| |r| (QREFELT $ 84)) (QREFELT $ 86)))))))))
        ((ZEROP |n|) (SPADCALL |uts| |r| (QREFELT $ 84)))
        (#4#
         (SPADCALL
          (SPADCALL |r|
                    (PROG1 (LETT #1# |n| . #3#)
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    (QREFELT $ 83))
          (SPADCALL |uts| |r| (QREFELT $ 84)) (QREFELT $ 86))))))))) 

(DEFUN |ULSCONS;variable;$S;32| (|x| $)
  (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 89))) 

(DEFUN |ULSCONS;center;$Coef;33| (|x| $)
  (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 91))) 

(DEFUN |ULSCONS;coefficient;$ICoef;34| (|x| |n| $)
  (PROG (#1=#:G318 |a|)
    (RETURN
     (SEQ
      (LETT |a| (- |n| (|ULSCONS;getExpon| |x| $))
            . #2=(|ULSCONS;coefficient;$ICoef;34|))
      (EXIT
       (COND
        ((>= |a| 0)
         (SPADCALL (|ULSCONS;getUTS| |x| $)
                   (PROG1 (LETT #1# |a| . #2#)
                     (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                   (QREFELT $ 58)))
        ('T (|spadConstant| $ 14)))))))) 

(DEFUN |ULSCONS;elt;$ICoef;35| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 76))) 

(DEFUN |ULSCONS;order;$I;36| (|x| $)
  (+ (|ULSCONS;getExpon| |x| $)
     (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 94)))) 

(DEFUN |ULSCONS;order;$2I;37| (|x| |n| $)
  (PROG (#1=#:G325 |m| |e|)
    (RETURN
     (SEQ
      (LETT |m|
            (- |n|
               (LETT |e| (|ULSCONS;getExpon| |x| $)
                     . #2=(|ULSCONS;order;$2I;37|)))
            . #2#)
      (EXIT
       (COND ((< |m| 0) |n|)
             ('T
              (+ |e|
                 (SPADCALL (|ULSCONS;getUTS| |x| $)
                           (PROG1 (LETT #1# |m| . #2#)
                             (|check_subtype| (>= #1# 0)
                                              '(|NonNegativeInteger|) #1#))
                           (QREFELT $ 96)))))))))) 

(DEFUN |ULSCONS;truncate;$I$;38| (|x| |n| $)
  (PROG (#1=#:G328 |m| |e|)
    (RETURN
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
                                    (|check_subtype| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     #1#))
                                  (QREFELT $ 98))
                        (QREFELT $ 10))))))))) 

(DEFUN |ULSCONS;truncate;$2I$;39| (|x| |n1| |n2| $)
  (PROG (#1=#:G332 #2=#:G331 |m1| |e| |#G61| |#G60|)
    (RETURN
     (SEQ
      (COND
       ((< |n2| |n1|)
        (PROGN
         (LETT |#G60| |n2| . #3=(|ULSCONS;truncate;$2I$;39|))
         (LETT |#G61| |n1| . #3#)
         (LETT |n1| |#G60| . #3#)
         (LETT |n2| |#G61| . #3#))))
      (LETT |m1| (- |n1| (LETT |e| (|ULSCONS;getExpon| |x| $) . #3#)) . #3#)
      (EXIT
       (COND ((< |m1| 0) (SPADCALL |x| |n2| (QREFELT $ 99)))
             ('T
              (SPADCALL |e|
                        (SPADCALL (|ULSCONS;getUTS| |x| $)
                                  (PROG1 (LETT #2# |m1| . #3#)
                                    (|check_subtype| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     #2#))
                                  (PROG1 (LETT #1# (- |n2| |e|) . #3#)
                                    (|check_subtype| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     #1#))
                                  (QREFELT $ 100))
                        (QREFELT $ 10))))))))) 

(DEFUN |ULSCONS;rationalFunction;$IF;40| (|x| |n| $)
  (PROG (#1=#:G340 #2=#:G339 |c| |v| |poly| #3=#:G336 |m| |e|)
    (RETURN
     (SEQ
      (LETT |m|
            (- |n|
               (LETT |e| (|ULSCONS;getExpon| |x| $)
                     . #4=(|ULSCONS;rationalFunction;$IF;40|)))
            . #4#)
      (EXIT
       (COND ((< |m| 0) (|spadConstant| $ 103))
             (#5='T
              (SEQ
               (LETT |poly|
                     (SPADCALL
                      (SPADCALL (|ULSCONS;getUTS| |x| $)
                                (PROG1 (LETT #3# |m| . #4#)
                                  (|check_subtype| (>= #3# 0)
                                                   '(|NonNegativeInteger|)
                                                   #3#))
                                (QREFELT $ 105))
                      (QREFELT $ 106))
                     . #4#)
               (EXIT
                (COND ((ZEROP |e|) |poly|)
                      (#5#
                       (SEQ
                        (LETT |v|
                              (SPADCALL (SPADCALL |x| (QREFELT $ 90))
                                        (QREFELT $ 107))
                              . #4#)
                        (LETT |c|
                              (SPADCALL
                               (SPADCALL (SPADCALL |x| (QREFELT $ 92))
                                         (QREFELT $ 108))
                               (QREFELT $ 106))
                              . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |e| (QREFELT $ 109))
                           (SPADCALL |poly|
                                     (SPADCALL
                                      (SPADCALL |v| |c| (QREFELT $ 110))
                                      (PROG1 (LETT #2# |e| . #4#)
                                        (|check_subtype| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         #2#))
                                      (QREFELT $ 111))
                                     (QREFELT $ 112)))
                          (#5#
                           (SPADCALL |poly|
                                     (SPADCALL
                                      (SPADCALL |v| |c| (QREFELT $ 110))
                                      (PROG1 (LETT #1# (- |e|) . #4#)
                                        (|check_subtype| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         #1#))
                                      (QREFELT $ 111))
                                     (QREFELT $ 113))))))))))))))))) 

(DEFUN |ULSCONS;rationalFunction;$2IF;41| (|x| |n1| |n2| $)
  (PROG (#1=#:G352 #2=#:G351 |c| |v| |poly| #3=#:G348 #4=#:G347 |m1| |e| |#G68|
         |#G67|)
    (RETURN
     (SEQ
      (COND
       ((< |n2| |n1|)
        (PROGN
         (LETT |#G67| |n2| . #5=(|ULSCONS;rationalFunction;$2IF;41|))
         (LETT |#G68| |n1| . #5#)
         (LETT |n1| |#G67| . #5#)
         (LETT |n2| |#G68| . #5#))))
      (LETT |m1| (- |n1| (LETT |e| (|ULSCONS;getExpon| |x| $) . #5#)) . #5#)
      (EXIT
       (COND ((< |m1| 0) (SPADCALL |x| |n2| (QREFELT $ 114)))
             (#6='T
              (SEQ
               (LETT |poly|
                     (SPADCALL
                      (SPADCALL (|ULSCONS;getUTS| |x| $)
                                (PROG1 (LETT #4# |m1| . #5#)
                                  (|check_subtype| (>= #4# 0)
                                                   '(|NonNegativeInteger|)
                                                   #4#))
                                (PROG1 (LETT #3# (- |n2| |e|) . #5#)
                                  (|check_subtype| (>= #3# 0)
                                                   '(|NonNegativeInteger|)
                                                   #3#))
                                (QREFELT $ 115))
                      (QREFELT $ 106))
                     . #5#)
               (EXIT
                (COND ((ZEROP |e|) |poly|)
                      (#6#
                       (SEQ
                        (LETT |v|
                              (SPADCALL (SPADCALL |x| (QREFELT $ 90))
                                        (QREFELT $ 107))
                              . #5#)
                        (LETT |c|
                              (SPADCALL
                               (SPADCALL (SPADCALL |x| (QREFELT $ 92))
                                         (QREFELT $ 108))
                               (QREFELT $ 106))
                              . #5#)
                        (EXIT
                         (COND
                          ((SPADCALL |e| (QREFELT $ 109))
                           (SPADCALL |poly|
                                     (SPADCALL
                                      (SPADCALL |v| |c| (QREFELT $ 110))
                                      (PROG1 (LETT #2# |e| . #5#)
                                        (|check_subtype| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         #2#))
                                      (QREFELT $ 111))
                                     (QREFELT $ 112)))
                          (#6#
                           (SPADCALL |poly|
                                     (SPADCALL
                                      (SPADCALL |v| |c| (QREFELT $ 110))
                                      (PROG1 (LETT #1# (- |e|) . #5#)
                                        (|check_subtype| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         #1#))
                                      (QREFELT $ 111))
                                     (QREFELT $ 113))))))))))))))))) 

(DEFUN |ULSCONS;exquo;2$U;42| (|x| |y| $)
  (PROG (|uts| |d|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL 1000 |x| (QREFELT $ 24))
            . #1=(|ULSCONS;exquo;2$U;42|))
      (LETT |y| (SPADCALL 1000 |y| (QREFELT $ 24)) . #1#)
      (EXIT
       (COND
        ((SPADCALL
          (SPADCALL |y| (LETT |d| (SPADCALL |y| (QREFELT $ 12)) . #1#)
                    (QREFELT $ 76))
          (QREFELT $ 39))
         (CONS 1 "failed"))
        (#2='T
         (SEQ
          (LETT |uts|
                (SPADCALL (|ULSCONS;getUTS| |x| $) (|ULSCONS;getUTS| |y| $)
                          (QREFELT $ 117))
                . #1#)
          (EXIT
           (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                 (#2#
                  (CONS 0
                        (SPADCALL (- (SPADCALL |x| (QREFELT $ 12)) |d|)
                                  (QCDR |uts|) (QREFELT $ 10)))))))))))))) 

(DEFUN |ULSCONS;approximate;$ICoef;43| (|x| |n| $)
  (PROG (|app| #1=#:G368 |m| |e|)
    (RETURN
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
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               (QREFELT $ 119))
                     . #2#)
               (EXIT
                (COND ((ZEROP |e|) |app|)
                      (#3#
                       (SPADCALL |app|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |x| (QREFELT $ 90))
                                             (QREFELT $ 120))
                                   (SPADCALL |x| (QREFELT $ 92))
                                   (QREFELT $ 121))
                                  |e| (QREFELT $ 122))
                                 (QREFELT $ 123))))))))))))) 

(DEFUN |ULSCONS;complete;2$;44| (|x| $)
  (SPADCALL (|ULSCONS;getExpon| |x| $)
            (SPADCALL (|ULSCONS;getUTS| |x| $) (QREFELT $ 125)) (QREFELT $ 10))) 

(DEFUN |ULSCONS;extend;$I$;45| (|x| |n| $)
  (PROG (#1=#:G373 |m| |e|)
    (RETURN
     (SEQ (LETT |e| (|ULSCONS;getExpon| |x| $) . #2=(|ULSCONS;extend;$I$;45|))
          (LETT |m| (- |n| |e|) . #2#)
          (EXIT
           (COND ((< |m| 0) |x|)
                 ('T
                  (SPADCALL |e|
                            (SPADCALL (|ULSCONS;getUTS| |x| $)
                                      (PROG1 (LETT #1# |m| . #2#)
                                        (|check_subtype| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         #1#))
                                      (QREFELT $ 127))
                            (QREFELT $ 10))))))))) 

(DEFUN |ULSCONS;map;M2$;46| (|f| |x| $)
  (SPADCALL (|ULSCONS;getExpon| |x| $)
            (SPADCALL |f| (|ULSCONS;getUTS| |x| $) (QREFELT $ 130))
            (QREFELT $ 10))) 

(DEFUN |ULSCONS;multiplyCoefficients;M2$;47| (|f| |x| $)
  (PROG (|e|)
    (RETURN
     (SEQ
      (LETT |e| (|ULSCONS;getExpon| |x| $)
            |ULSCONS;multiplyCoefficients;M2$;47|)
      (EXIT
       (SPADCALL |e|
                 (SPADCALL
                  (CONS #'|ULSCONS;multiplyCoefficients;M2$;47!0|
                        (VECTOR |f| $ |e|))
                  (|ULSCONS;getUTS| |x| $) (QREFELT $ 133))
                 (QREFELT $ 10))))))) 

(DEFUN |ULSCONS;multiplyCoefficients;M2$;47!0| (|z1| $$)
  (PROG (|e| $ |f|)
    (LETT |e| (QREFELT $$ 2) . #1=(|ULSCONS;multiplyCoefficients;M2$;47|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |e| |z1| (QREFELT $ 42)) |f|))))) 

(DEFUN |ULSCONS;multiplyExponents;$Pi$;48| (|x| |n| $)
  (SPADCALL (SPADCALL |n| (|ULSCONS;getExpon| |x| $) (QREFELT $ 136))
            (SPADCALL (|ULSCONS;getUTS| |x| $) |n| (QREFELT $ 137))
            (QREFELT $ 10))) 

(DEFUN |ULSCONS;differentiate;2$;49| (|x| $)
  (PROG (|e|)
    (RETURN
     (SEQ (LETT |e| (|ULSCONS;getExpon| |x| $) |ULSCONS;differentiate;2$;49|)
          (EXIT
           (SPADCALL (- |e| 1)
                     (SPADCALL
                      (CONS #'|ULSCONS;differentiate;2$;49!0| (VECTOR $ |e|))
                      (|ULSCONS;getUTS| |x| $) (QREFELT $ 133))
                     (QREFELT $ 10))))))) 

(DEFUN |ULSCONS;differentiate;2$;49!0| (|z1| $$)
  (PROG (|e| $)
    (LETT |e| (QREFELT $$ 1) . #1=(|ULSCONS;differentiate;2$;49|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |e| |z1| (QREFELT $ 42)) (QREFELT $ 22)))))) 

(DEFUN |ULSCONS;differentiate;$S$;50| (|x| |s| $)
  (PROG ()
    (RETURN
     (COND
      ((EQUAL |s| (SPADCALL |x| (QREFELT $ 90)))
       (SPADCALL |x| (QREFELT $ 139)))
      ('T
       (SPADCALL
        (SPADCALL (CONS #'|ULSCONS;differentiate;$S$;50!0| (VECTOR $ |s|)) |x|
                  (QREFELT $ 131))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 92)) |s| (QREFELT $ 140))
                  (SPADCALL |x| (QREFELT $ 139)) (QREFELT $ 141))
        (QREFELT $ 70))))))) 

(DEFUN |ULSCONS;differentiate;$S$;50!0| (|z1| $$)
  (PROG (|s| $)
    (LETT |s| (QREFELT $$ 1) . #1=(|ULSCONS;differentiate;$S$;50|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |s| (QREFELT $ 140)))))) 

(DEFUN |ULSCONS;characteristic;Nni;51| ($) (SPADCALL (QREFELT $ 143))) 

(DEFUN |ULSCONS;retract;$UTS;52| (|x| $) (SPADCALL |x| (QREFELT $ 31))) 

(DEFUN |ULSCONS;retractIfCan;$U;53| (|x| $) (SPADCALL |x| (QREFELT $ 30))) 

(DEFUN |ULSCONS;^;$I$;54| (|x| |n| $)
  (PROG (|minusN| #1=#:G398 |xInv| #2=#:G397)
    (RETURN
     (SEQ
      (COND
       ((ZEROP |n|)
        (COND ((SPADCALL |x| (QREFELT $ 72)) (|error| "0 ^ 0 is undefined"))
              (#3='T (|spadConstant| $ 17))))
       ((SPADCALL |n| 0 (QREFELT $ 64))
        (SPADCALL (* |n| (|ULSCONS;getExpon| |x| $))
                  (SPADCALL (|ULSCONS;getUTS| |x| $)
                            (PROG1 (LETT #2# |n| . #4=(|ULSCONS;^;$I$;54|))
                              (|check_subtype| (>= #2# 0)
                                               '(|NonNegativeInteger|) #2#))
                            (QREFELT $ 74))
                  (QREFELT $ 10)))
       (#3#
        (SEQ (LETT |xInv| (SPADCALL |x| (QREFELT $ 147)) . #4#)
             (LETT |minusN|
                   (PROG1 (LETT #1# (- |n|) . #4#)
                     (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                   . #4#)
             (EXIT
              (SPADCALL
               (SPADCALL |minusN| (|ULSCONS;getExpon| |xInv| $) (QREFELT $ 73))
               (SPADCALL (|ULSCONS;getUTS| |xInv| $) |minusN| (QREFELT $ 74))
               (QREFELT $ 10)))))))))) 

(DEFUN |ULSCONS;*;UTS2$;55| (|x| |y| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 20)) |y| (QREFELT $ 71))) 

(DEFUN |ULSCONS;*;$UTS$;56| (|x| |y| $)
  (SPADCALL |x| (SPADCALL |y| (QREFELT $ 20)) (QREFELT $ 71))) 

(DEFUN |ULSCONS;inv;2$;57| (|x| $)
  (PROG (|xInv|)
    (RETURN
     (SEQ (LETT |xInv| (SPADCALL |x| (QREFELT $ 79)) |ULSCONS;inv;2$;57|)
          (EXIT
           (COND
            ((QEQCAR |xInv| 1)
             (|error| "multiplicative inverse does not exist"))
            ('T (QCDR |xInv|)))))))) 

(DEFUN |ULSCONS;/;3$;58| (|x| |y| $)
  (PROG (|yInv|)
    (RETURN
     (SEQ (LETT |yInv| (SPADCALL |y| (QREFELT $ 79)) |ULSCONS;/;3$;58|)
          (EXIT
           (COND
            ((QEQCAR |yInv| 1)
             (|error| "inv: multiplicative inverse does not exist"))
            ('T (SPADCALL |x| (QCDR |yInv|) (QREFELT $ 71))))))))) 

(DEFUN |ULSCONS;/;2UTS$;59| (|x| |y| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 20)) (SPADCALL |y| (QREFELT $ 20))
            (QREFELT $ 151))) 

(DEFUN |ULSCONS;numer;$UTS;60| (|x| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |x| (QREFELT $ 12)) . #1=(|ULSCONS;numer;$UTS;60|))
      (EXIT
       (COND ((>= |n| 0) (SPADCALL |x| (QREFELT $ 31)))
             (#2='T
              (SEQ (LETT |x| (SPADCALL (- |n|) |x| (QREFELT $ 24)) . #1#)
                   (LETT |n| (SPADCALL |x| (QREFELT $ 12)) . #1#)
                   (EXIT
                    (COND ((EQL |n| 0) (SPADCALL |x| (QREFELT $ 31)))
                          (#2# (|ULSCONS;getUTS| |x| $)))))))))))) 

(DEFUN |ULSCONS;denom;$UTS;61| (|x| $)
  (PROG (#1=#:G421 |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |x| (QREFELT $ 12)) . #2=(|ULSCONS;denom;$UTS;61|))
      (EXIT
       (COND ((>= |n| 0) (|spadConstant| $ 16))
             (#3='T
              (SEQ (LETT |x| (SPADCALL (- |n|) |x| (QREFELT $ 24)) . #2#)
                   (LETT |n| (SPADCALL |x| (QREFELT $ 12)) . #2#)
                   (EXIT
                    (COND ((EQL |n| 0) (|spadConstant| $ 16))
                          (#3#
                           (SPADCALL (|spadConstant| $ 25)
                                     (PROG1 (LETT #1# (- |n|) . #2#)
                                       (|check_subtype| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        #1#))
                                     (QREFELT $ 27))))))))))))) 

(DEFUN |ULSCONS;coerce;F$;62| (|r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 156)) (QREFELT $ 21))) 

(DEFUN |ULSCONS;^;$F$;63| (|x| |r| $) (SPADCALL |x| |r| (QREFELT $ 159))) 

(DEFUN |ULSCONS;exp;2$;64| (|x| $) (SPADCALL |x| (QREFELT $ 161))) 

(DEFUN |ULSCONS;log;2$;65| (|x| $) (SPADCALL |x| (QREFELT $ 163))) 

(DEFUN |ULSCONS;sin;2$;66| (|x| $) (SPADCALL |x| (QREFELT $ 165))) 

(DEFUN |ULSCONS;cos;2$;67| (|x| $) (SPADCALL |x| (QREFELT $ 167))) 

(DEFUN |ULSCONS;tan;2$;68| (|x| $) (SPADCALL |x| (QREFELT $ 169))) 

(DEFUN |ULSCONS;cot;2$;69| (|x| $) (SPADCALL |x| (QREFELT $ 171))) 

(DEFUN |ULSCONS;sec;2$;70| (|x| $) (SPADCALL |x| (QREFELT $ 173))) 

(DEFUN |ULSCONS;csc;2$;71| (|x| $) (SPADCALL |x| (QREFELT $ 175))) 

(DEFUN |ULSCONS;asin;2$;72| (|x| $) (SPADCALL |x| (QREFELT $ 177))) 

(DEFUN |ULSCONS;acos;2$;73| (|x| $) (SPADCALL |x| (QREFELT $ 179))) 

(DEFUN |ULSCONS;atan;2$;74| (|x| $) (SPADCALL |x| (QREFELT $ 181))) 

(DEFUN |ULSCONS;acot;2$;75| (|x| $) (SPADCALL |x| (QREFELT $ 183))) 

(DEFUN |ULSCONS;asec;2$;76| (|x| $) (SPADCALL |x| (QREFELT $ 185))) 

(DEFUN |ULSCONS;acsc;2$;77| (|x| $) (SPADCALL |x| (QREFELT $ 187))) 

(DEFUN |ULSCONS;sinh;2$;78| (|x| $) (SPADCALL |x| (QREFELT $ 189))) 

(DEFUN |ULSCONS;cosh;2$;79| (|x| $) (SPADCALL |x| (QREFELT $ 191))) 

(DEFUN |ULSCONS;tanh;2$;80| (|x| $) (SPADCALL |x| (QREFELT $ 193))) 

(DEFUN |ULSCONS;coth;2$;81| (|x| $) (SPADCALL |x| (QREFELT $ 195))) 

(DEFUN |ULSCONS;sech;2$;82| (|x| $) (SPADCALL |x| (QREFELT $ 197))) 

(DEFUN |ULSCONS;csch;2$;83| (|x| $) (SPADCALL |x| (QREFELT $ 199))) 

(DEFUN |ULSCONS;asinh;2$;84| (|x| $) (SPADCALL |x| (QREFELT $ 201))) 

(DEFUN |ULSCONS;acosh;2$;85| (|x| $) (SPADCALL |x| (QREFELT $ 203))) 

(DEFUN |ULSCONS;atanh;2$;86| (|x| $) (SPADCALL |x| (QREFELT $ 205))) 

(DEFUN |ULSCONS;acoth;2$;87| (|x| $) (SPADCALL |x| (QREFELT $ 207))) 

(DEFUN |ULSCONS;asech;2$;88| (|x| $) (SPADCALL |x| (QREFELT $ 209))) 

(DEFUN |ULSCONS;acsch;2$;89| (|x| $) (SPADCALL |x| (QREFELT $ 211))) 

(DEFUN |ULSCONS;ratInv| (|n| $)
  (COND ((ZEROP |n|) (|spadConstant| $ 25))
        ('T
         (SPADCALL (SPADCALL (SPADCALL |n| (QREFELT $ 213)) (QREFELT $ 214))
                   (QREFELT $ 156))))) 

(DEFUN |ULSCONS;integrate;2$;91| (|x| $)
  (PROG (|e|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL (SPADCALL |x| -1 (QREFELT $ 76)) (QREFELT $ 39)))
        (|error| "integrate: series has term of order -1"))
       ('T
        (SEQ (LETT |e| (|ULSCONS;getExpon| |x| $) |ULSCONS;integrate;2$;91|)
             (EXIT
              (SPADCALL (+ |e| 1)
                        (SPADCALL
                         (CONS #'|ULSCONS;integrate;2$;91!0| (VECTOR $ |e|))
                         (|ULSCONS;getUTS| |x| $) (QREFELT $ 133))
                        (QREFELT $ 10)))))))))) 

(DEFUN |ULSCONS;integrate;2$;91!0| (|z1| $$)
  (PROG (|e| $)
    (LETT |e| (QREFELT $$ 1) . #1=(|ULSCONS;integrate;2$;91|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|ULSCONS;ratInv|
       (SPADCALL (SPADCALL |e| (|spadConstant| $ 41) (QREFELT $ 42)) |z1|
                 (QREFELT $ 42))
       $))))) 

(DEFUN |ULSCONS;integrate;$S$;92| (|x| |s| $)
  (PROG ()
    (RETURN
     (COND
      ((EQUAL |s| (SPADCALL |x| (QREFELT $ 90)))
       (SPADCALL |x| (QREFELT $ 216)))
      ((NULL
        (SPADCALL |s| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 218))
                  (QREFELT $ 219)))
       (SPADCALL (CONS #'|ULSCONS;integrate;$S$;92!0| (VECTOR $ |s|)) |x|
                 (QREFELT $ 131)))
      ('T
       (|error|
        "integrate: center is a function of variable of integration")))))) 

(DEFUN |ULSCONS;integrate;$S$;92!0| (|z1| $$)
  (PROG (|s| $)
    (LETT |s| (QREFELT $$ 1) . #1=(|ULSCONS;integrate;$S$;92|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |s| (QREFELT $ 220)))))) 

(DEFUN |ULSCONS;integrateWithOneAnswer| (|f| |s| $)
  (PROG (|res|)
    (RETURN
     (SEQ
      (LETT |res| (SPADCALL |f| |s| (QREFELT $ 224))
            |ULSCONS;integrateWithOneAnswer|)
      (EXIT
       (COND ((QEQCAR |res| 0) (QCDR |res|))
             ('T (|SPADfirst| (QCDR |res|))))))))) 

(DEFUN |ULSCONS;integrate;$S$;94| (|x| |s| $)
  (PROG ()
    (RETURN
     (COND
      ((EQUAL |s| (SPADCALL |x| (QREFELT $ 90)))
       (SPADCALL |x| (QREFELT $ 216)))
      ((NULL
        (SPADCALL |s| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 218))
                  (QREFELT $ 219)))
       (SPADCALL (CONS #'|ULSCONS;integrate;$S$;94!0| (VECTOR $ |s|)) |x|
                 (QREFELT $ 131)))
      ('T
       (|error|
        "integrate: center is a function of variable of integration")))))) 

(DEFUN |ULSCONS;integrate;$S$;94!0| (|z1| $$)
  (PROG (|s| $)
    (LETT |s| (QREFELT $$ 1) . #1=(|ULSCONS;integrate;$S$;94|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|ULSCONS;integrateWithOneAnswer| |z1| |s| $))))) 

(DEFUN |ULSCONS;termOutput| (|k| |c| |vv| $)
  (PROG (|mon|)
    (RETURN
     (SEQ
      (COND ((EQL |k| 0) (SPADCALL |c| (QREFELT $ 226)))
            (#1='T
             (SEQ
              (LETT |mon|
                    (COND ((EQL |k| 1) |vv|)
                          (#1#
                           (SPADCALL |vv| (SPADCALL |k| (QREFELT $ 227))
                                     (QREFELT $ 228))))
                    |ULSCONS;termOutput|)
              (EXIT
               (COND
                ((SPADCALL |c| (|spadConstant| $ 25) (QREFELT $ 59)) |mon|)
                ((SPADCALL |c| (SPADCALL (|spadConstant| $ 25) (QREFELT $ 229))
                           (QREFELT $ 59))
                 (SPADCALL |mon| (QREFELT $ 230)))
                (#1#
                 (SPADCALL (SPADCALL |c| (QREFELT $ 226)) |mon|
                           (QREFELT $ 231)))))))))))) 

(PUT '|ULSCONS;showAll?| '|SPADreplace| '(XLAM NIL 'T)) 

(DEFUN |ULSCONS;showAll?| ($) 'T) 

(DEFUN |ULSCONS;termsToOutputForm| (|m| |uu| |xxx| $)
  (PROG (|l| |n| |count|)
    (RETURN
     (SEQ (LETT |l| NIL . #1=(|ULSCONS;termsToOutputForm|))
          (EXIT
           (COND
            ((SPADCALL |uu| (QREFELT $ 34))
             (SPADCALL (|spadConstant| $ 14) (QREFELT $ 226)))
            (#2='T
             (SEQ (LETT |count| |$streamCount| . #1#)
                  (SEQ (LETT |n| 0 . #1#) G190
                       (COND
                        ((OR (|greater_SI| |n| |count|)
                             (NULL
                              (COND ((SPADCALL |uu| (QREFELT $ 34)) 'NIL)
                                    ('T 'T))))
                         (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (SPADCALL |uu| (QREFELT $ 38))
                                    (|spadConstant| $ 14) (QREFELT $ 232))
                          (LETT |l|
                                (CONS
                                 (|ULSCONS;termOutput| (+ |n| |m|)
                                  (SPADCALL |uu| (QREFELT $ 38)) |xxx| $)
                                 |l|)
                                . #1#)))
                        (EXIT
                         (LETT |uu| (SPADCALL |uu| (QREFELT $ 40)) . #1#)))
                       (LETT |n| (|inc_SI| |n|) . #1#) (GO G190) G191
                       (EXIT NIL))
                  (COND
                   ((|ULSCONS;showAll?| $)
                    (SEQ (LETT |n| (+ |count| 1) . #1#) G190
                         (COND
                          ((NULL
                            (COND
                             ((SPADCALL |uu| (QREFELT $ 233))
                              (COND
                               ((SPADCALL |uu| (SPADCALL |uu| (QREFELT $ 40))
                                          (QREFELT $ 234))
                                'NIL)
                               ('T 'T)))
                             ('T 'NIL)))
                           (GO G191)))
                         (SEQ
                          (COND
                           ((SPADCALL (SPADCALL |uu| (QREFELT $ 38))
                                      (|spadConstant| $ 14) (QREFELT $ 232))
                            (LETT |l|
                                  (CONS
                                   (|ULSCONS;termOutput| (+ |n| |m|)
                                    (SPADCALL |uu| (QREFELT $ 38)) |xxx| $)
                                   |l|)
                                  . #1#)))
                          (EXIT
                           (LETT |uu| (SPADCALL |uu| (QREFELT $ 40)) . #1#)))
                         (LETT |n| (+ |n| 1) . #1#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |l|
                        (COND ((SPADCALL |uu| (QREFELT $ 235)) |l|)
                              (#2#
                               (SEQ
                                (COND
                                 ((SPADCALL |uu| (SPADCALL |uu| (QREFELT $ 40))
                                            (QREFELT $ 234))
                                  (COND
                                   ((SPADCALL (SPADCALL |uu| (QREFELT $ 38))
                                              (|spadConstant| $ 14)
                                              (QREFELT $ 59))
                                    (EXIT |l|)))))
                                (EXIT
                                 (CONS
                                  (SPADCALL "O"
                                            (LIST
                                             (SPADCALL |xxx|
                                                       (SPADCALL (+ |n| |m|)
                                                                 (QREFELT $
                                                                          227))
                                                       (QREFELT $ 228)))
                                            (QREFELT $ 237))
                                  |l|)))))
                        . #1#)
                  (EXIT
                   (COND
                    ((NULL |l|)
                     (SPADCALL (|spadConstant| $ 14) (QREFELT $ 226)))
                    (#2#
                     (SPADCALL (ELT $ 238) (NREVERSE |l|)
                               (QREFELT $ 241))))))))))))) 

(DEFUN |ULSCONS;coerce;$Of;98| (|x| $)
  (PROG (|xxx| |cen| |var| |p| |uts| |m|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL |$streamCount| |x| (QREFELT $ 24))
            . #1=(|ULSCONS;coerce;$Of;98|))
      (LETT |m| (SPADCALL |x| (QREFELT $ 12)) . #1#)
      (LETT |uts| (|ULSCONS;getUTS| |x| $) . #1#)
      (LETT |p| (SPADCALL |uts| (QREFELT $ 46)) . #1#)
      (LETT |var| (SPADCALL |uts| (QREFELT $ 89)) . #1#)
      (LETT |cen| (SPADCALL |uts| (QREFELT $ 91)) . #1#)
      (LETT |xxx|
            (COND
             ((SPADCALL |cen| (QREFELT $ 39)) (SPADCALL |var| (QREFELT $ 242)))
             ('T
              (SPADCALL
               (SPADCALL (SPADCALL |var| (QREFELT $ 242))
                         (SPADCALL |cen| (QREFELT $ 226)) (QREFELT $ 243))
               (QREFELT $ 244))))
            . #1#)
      (EXIT (|ULSCONS;termsToOutputForm| |m| |p| |xxx| $)))))) 

(DECLAIM (NOTINLINE |UnivariateLaurentSeriesConstructor;|)) 

(DEFUN |UnivariateLaurentSeriesConstructor| (&REST #1=#:G547)
  (PROG ()
    (RETURN
     (PROG (#2=#:G548)
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
                    '|UnivariateLaurentSeriesConstructor|))))))))))) 

(DEFUN |UnivariateLaurentSeriesConstructor;| (|#1| |#2|)
  (PROG (#1=#:G546 |pv$| #2=#:G534 #3=#:G535 #4=#:G536 #5=#:G537 #6=#:G539
         #7=#:G540 #8=#:G541 #9=#:G542 #10=#:G543 #11=#:G545 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #12=(|UnivariateLaurentSeriesConstructor|))
      (LETT DV$2 (|devaluate| |#2|) . #12#)
      (LETT |dv$| (LIST '|UnivariateLaurentSeriesConstructor| DV$1 DV$2)
            . #12#)
      (LETT $ (GETREFV 287) . #12#)
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
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                (|HasCategory| |#2|
                                                               '(|CharacteristicZero|))))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|InputForm|))))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              '(|RealConstant|)))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              '(|OrderedIntegralDomain|)))
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
                                                              '(|LinearlyExplicitRingOver|
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
                                          (LETT #11#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #12#)
                                          (OR #11#
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
                                          (LETT #10#
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                . #12#)
                                          (OR #11#
                                              (|HasCategory| |#1| '(|Field|))
                                              #10#)
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              #10#)
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              '(|Comparable|)))
                                          (LETT #9#
                                                (AND
                                                 (|HasCategory| |#1|
                                                                '(|Field|))
                                                 (|HasCategory| |#2|
                                                                '(|OrderedSet|)))
                                                . #12#)
                                          (OR
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedIntegralDomain|)))
                                           #9#)
                                          (OR
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                (|HasCategory| |#2|
                                                               '(|Comparable|)))
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedIntegralDomain|)))
                                           #9#)
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (LETT #8#
                                                (|HasCategory| |#2|
                                                               '(|CharacteristicNonZero|))
                                                . #12#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                #8#))
                                          (LETT #7#
                                                (|HasCategory| |#2|
                                                               '(|PolynomialFactorizationExplicit|))
                                                . #12#)
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               #7#)
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              '(|IntegerNumberSystem|)))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              '(|EuclideanDomain|)))
                                          (LETT #6#
                                                (|HasCategory| |#1|
                                                               '(|Algebra|
                                                                 (|Fraction|
                                                                  (|Integer|))))
                                                . #12#)
                                          (OR #6#
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
                                                              '(|LinearlyExplicitRingOver|
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
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              '(|OrderedIntegralDomain|)))
                                              #9#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              '(|RealConstant|)))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              '(|StepThrough|))))
                                          (OR
                                           (AND #6#
                                                (|HasCategory| |#1|
                                                               '(|AlgebraicallyClosedFunctionSpace|
                                                                 (|Integer|)))
                                                (|HasCategory| |#1|
                                                               '(|PrimitiveFunctionCategory|))
                                                (|HasCategory| |#1|
                                                               '(|TranscendentalFunctionCategory|)))
                                           (AND #6#
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
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasSignature| |#1|
                                                          (LIST '*
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Integer|)
                                                                 (|devaluate|
                                                                  |#1|))))
                                          (OR #6# #11#
                                              (|HasCategory| |#1| '(|Field|))
                                              #10#
                                              (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR (|HasCategory| |#1| '(|Ring|))
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
                                          (OR #6#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              #11#
                                              (|HasCategory| |#1| '(|Field|))
                                              #10#
                                              (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (LETT #5#
                                                (|HasCategory| |#1|
                                                               '(|SemiRing|))
                                                . #12#)
                                          (OR #5#
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (LETT #4#
                                                (|HasCategory| |#1|
                                                               '(|AbelianGroup|))
                                                . #12#)
                                          (OR #6# #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              #11#
                                              (|HasCategory| |#1| '(|Field|))
                                              #10#
                                              (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|CancellationAbelianMonoid|))
                                                . #12#)
                                          (OR #6# #4# #3#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              #11#
                                              (|HasCategory| |#1| '(|Field|))
                                              #10#
                                              (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|AbelianMonoid|))
                                                . #12#)
                                          (OR #6# #4# #2# #3#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              #11#
                                              (|HasCategory| |#1| '(|Field|))
                                              #10#
                                              (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))))
                      . #12#))
      (|haddProp| |$ConstructorCache| '|UnivariateLaurentSeriesConstructor|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND #11# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
           (|augmentPredVector| $ 9007199254740992))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|Field|))
                  (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #12#)
       (|augmentPredVector| $ 18014398509481984))
      (AND
       (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
           (AND (|HasCategory| |#1| '(|Field|)) #8#) #1#)
       (|augmentPredVector| $ 36028797018963968))
      (AND
       (OR (|HasCategory| |#1| '(|Field|))
           (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 72057594037927936))
      (AND
       (OR (AND #11# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasCategory| |#1| '(|Ring|))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|) '(|Integer|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 144115188075855872))
      (AND
       (OR (AND #11# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           #5#
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|) '(|Integer|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 288230376151711744))
      (AND
       (OR #4#
           (AND #11# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|) '(|Integer|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 576460752303423488))
      (AND
       (OR #3#
           (AND #11# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|) '(|Integer|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 1152921504606846976))
      (AND
       (OR #2#
           (AND #11# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
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
         (QSETREFV $ 114
                   (CONS (|dispatchFunction| |ULSCONS;rationalFunction;$IF;40|)
                         $))
         (QSETREFV $ 116
                   (CONS
                    (|dispatchFunction| |ULSCONS;rationalFunction;$2IF;41|) $))
         (QSETREFV $ 118
                   (CONS (|dispatchFunction| |ULSCONS;exquo;2$U;42|) $)))))
      (COND
       ((|HasSignature| |#1|
                        (LIST '|coerce| (LIST (|devaluate| |#1|) '(|Symbol|))))
        (COND
         ((|testBitVector| |pv$| 20)
          (QSETREFV $ 124
                    (CONS (|dispatchFunction| |ULSCONS;approximate;$ICoef;43|)
                          $))))))
      (COND
       ((|HasCategory| |#1| '(|PartialDifferentialRing| (|Symbol|)))
        (QSETREFV $ 142
                  (CONS (|dispatchFunction| |ULSCONS;differentiate;$S$;50|)
                        $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 145
                   (CONS (|dispatchFunction| |ULSCONS;retract;$UTS;52|) $))
         (QSETREFV $ 146
                   (CONS (|dispatchFunction| |ULSCONS;retractIfCan;$U;53|) $))
         (QSETREFV $ 148 (CONS (|dispatchFunction| |ULSCONS;^;$I$;54|) $))
         (QSETREFV $ 149 (CONS (|dispatchFunction| |ULSCONS;*;UTS2$;55|) $))
         (QSETREFV $ 150 (CONS (|dispatchFunction| |ULSCONS;*;$UTS$;56|) $))
         (QSETREFV $ 147 (CONS (|dispatchFunction| |ULSCONS;inv;2$;57|) $))
         (QSETREFV $ 151 (CONS (|dispatchFunction| |ULSCONS;/;3$;58|) $))
         (QSETREFV $ 152 (CONS (|dispatchFunction| |ULSCONS;/;2UTS$;59|) $))
         (QSETREFV $ 153 (CONS (|dispatchFunction| |ULSCONS;numer;$UTS;60|) $))
         (QSETREFV $ 154
                   (CONS (|dispatchFunction| |ULSCONS;denom;$UTS;61|) $)))))
      (COND
       ((|testBitVector| |pv$| 36)
        (PROGN
         (QSETREFV $ 157 (CONS (|dispatchFunction| |ULSCONS;coerce;F$;62|) $))
         (COND
          ((|testBitVector| |pv$| 2)
           (QSETREFV $ 160 (CONS (|dispatchFunction| |ULSCONS;^;$F$;63|) $))))
         (QSETREFV $ 162 (CONS (|dispatchFunction| |ULSCONS;exp;2$;64|) $))
         (QSETREFV $ 164 (CONS (|dispatchFunction| |ULSCONS;log;2$;65|) $))
         (QSETREFV $ 166 (CONS (|dispatchFunction| |ULSCONS;sin;2$;66|) $))
         (QSETREFV $ 168 (CONS (|dispatchFunction| |ULSCONS;cos;2$;67|) $))
         (QSETREFV $ 170 (CONS (|dispatchFunction| |ULSCONS;tan;2$;68|) $))
         (QSETREFV $ 172 (CONS (|dispatchFunction| |ULSCONS;cot;2$;69|) $))
         (QSETREFV $ 174 (CONS (|dispatchFunction| |ULSCONS;sec;2$;70|) $))
         (QSETREFV $ 176 (CONS (|dispatchFunction| |ULSCONS;csc;2$;71|) $))
         (QSETREFV $ 178 (CONS (|dispatchFunction| |ULSCONS;asin;2$;72|) $))
         (QSETREFV $ 180 (CONS (|dispatchFunction| |ULSCONS;acos;2$;73|) $))
         (QSETREFV $ 182 (CONS (|dispatchFunction| |ULSCONS;atan;2$;74|) $))
         (QSETREFV $ 184 (CONS (|dispatchFunction| |ULSCONS;acot;2$;75|) $))
         (QSETREFV $ 186 (CONS (|dispatchFunction| |ULSCONS;asec;2$;76|) $))
         (QSETREFV $ 188 (CONS (|dispatchFunction| |ULSCONS;acsc;2$;77|) $))
         (QSETREFV $ 190 (CONS (|dispatchFunction| |ULSCONS;sinh;2$;78|) $))
         (QSETREFV $ 192 (CONS (|dispatchFunction| |ULSCONS;cosh;2$;79|) $))
         (QSETREFV $ 194 (CONS (|dispatchFunction| |ULSCONS;tanh;2$;80|) $))
         (QSETREFV $ 196 (CONS (|dispatchFunction| |ULSCONS;coth;2$;81|) $))
         (QSETREFV $ 198 (CONS (|dispatchFunction| |ULSCONS;sech;2$;82|) $))
         (QSETREFV $ 200 (CONS (|dispatchFunction| |ULSCONS;csch;2$;83|) $))
         (QSETREFV $ 202 (CONS (|dispatchFunction| |ULSCONS;asinh;2$;84|) $))
         (QSETREFV $ 204 (CONS (|dispatchFunction| |ULSCONS;acosh;2$;85|) $))
         (QSETREFV $ 206 (CONS (|dispatchFunction| |ULSCONS;atanh;2$;86|) $))
         (QSETREFV $ 208 (CONS (|dispatchFunction| |ULSCONS;acoth;2$;87|) $))
         (QSETREFV $ 210 (CONS (|dispatchFunction| |ULSCONS;asech;2$;88|) $))
         (QSETREFV $ 212 (CONS (|dispatchFunction| |ULSCONS;acsch;2$;89|) $))
         NIL
         (QSETREFV $ 216
                   (CONS (|dispatchFunction| |ULSCONS;integrate;2$;91|) $))
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
             (QSETREFV $ 221
                       (CONS (|dispatchFunction| |ULSCONS;integrate;$S$;92|)
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
                (QSETREFV $ 221
                          (CONS (|dispatchFunction| |ULSCONS;integrate;$S$;94|)
                                $))))))))))))
      $)))) 

(MAKEPROP '|UnivariateLaurentSeriesConstructor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Integer|) |ULSCONS;laurent;IUTS$;3| |ULSCONS;taylorRep;$UTS;4|
              |ULSCONS;degree;$I;5|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |ULSCONS;Zero;$;6|) $))
              (0 . |Zero|) (4 . |Zero|) (8 . |One|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |ULSCONS;One;$;7|) $))
              (12 . |coerce|) |ULSCONS;monomial;CoefI$;8|
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
              (113 . |concat|) (119 . |Zero|) (123 . |delay|) (128 . |series|)
              |ULSCONS;series;S$;20| (133 . |coefficient|) (139 . =)
              (145 . |quoByVar|) |ULSCONS;removeZeroes;2$;21| (150 . <=)
              (156 . =) (162 . >) |ULSCONS;=;2$B;23| |ULSCONS;pole?;$B;24|
              (168 . +) |ULSCONS;+;3$;25| (174 . -) |ULSCONS;-;3$;26|
              |ULSCONS;*;3$;27| (180 . |zero?|) (185 . *) (191 . ^)
              |ULSCONS;^;$Nni$;28| |ULSCONS;coefficient;$ICoef;34|
              (|Union| $ '"failed") (197 . |recip|) |ULSCONS;recip;$U;29|
              (202 . |elt|) |ULSCONS;elt;3$;30| (208 . |recip|) (213 . ^)
              (219 . |eval|) (|StreamTaylorSeriesOperations| 6) (225 . *)
              |ULSCONS;eval;$CoefS;31| (|Symbol|) (231 . |variable|)
              |ULSCONS;variable;$S;32| (236 . |center|)
              |ULSCONS;center;$Coef;33| |ULSCONS;elt;$ICoef;35| (241 . |order|)
              |ULSCONS;order;$I;36| (246 . |order|) |ULSCONS;order;$2I;37|
              (252 . |truncate|) |ULSCONS;truncate;$I$;38| (258 . |truncate|)
              |ULSCONS;truncate;$2I$;39| (|Fraction| 104) (265 . |Zero|)
              (|Polynomial| 6) (269 . |polynomial|) (275 . |coerce|)
              (280 . |coerce|) (285 . |coerce|) (290 . |positive?|) (295 . -)
              (301 . ^) (307 . *) (313 . /) (319 . |rationalFunction|)
              (325 . |polynomial|) (332 . |rationalFunction|) (339 . |exquo|)
              (345 . |exquo|) (351 . |approximate|) (357 . |coerce|) (362 . -)
              (368 . ^) (374 . *) (380 . |approximate|) (386 . |complete|)
              |ULSCONS;complete;2$;44| (391 . |extend|) |ULSCONS;extend;$I$;45|
              (|Mapping| 6 6) (397 . |map|) |ULSCONS;map;M2$;46|
              (|Mapping| 6 9) (403 . |multiplyCoefficients|)
              |ULSCONS;multiplyCoefficients;M2$;47| (|PositiveInteger|)
              (409 . *) (415 . |multiplyExponents|)
              |ULSCONS;multiplyExponents;$Pi$;48| |ULSCONS;differentiate;2$;49|
              (421 . |differentiate|) (427 . *) (433 . |differentiate|)
              (439 . |characteristic|) |ULSCONS;characteristic;Nni;51|
              (443 . |retract|) (448 . |retractIfCan|) (453 . |inv|) (458 . ^)
              (464 . *) (470 . *) (476 . /) (482 . /) (488 . |numer|)
              (493 . |denom|) (|Fraction| 9) (498 . |coerce|) (503 . |coerce|)
              (|ElementaryFunctionsUnivariateLaurentSeries| 6 7 $$) (508 . ^)
              (514 . ^) (520 . |exp|) (525 . |exp|) (530 . |log|) (535 . |log|)
              (540 . |sin|) (545 . |sin|) (550 . |cos|) (555 . |cos|)
              (560 . |tan|) (565 . |tan|) (570 . |cot|) (575 . |cot|)
              (580 . |sec|) (585 . |sec|) (590 . |csc|) (595 . |csc|)
              (600 . |asin|) (605 . |asin|) (610 . |acos|) (615 . |acos|)
              (620 . |atan|) (625 . |atan|) (630 . |acot|) (635 . |acot|)
              (640 . |asec|) (645 . |asec|) (650 . |acsc|) (655 . |acsc|)
              (660 . |sinh|) (665 . |sinh|) (670 . |cosh|) (675 . |cosh|)
              (680 . |tanh|) (685 . |tanh|) (690 . |coth|) (695 . |coth|)
              (700 . |sech|) (705 . |sech|) (710 . |csch|) (715 . |csch|)
              (720 . |asinh|) (725 . |asinh|) (730 . |acosh|) (735 . |acosh|)
              (740 . |atanh|) (745 . |atanh|) (750 . |acoth|) (755 . |acoth|)
              (760 . |asech|) (765 . |asech|) (770 . |acsch|) (775 . |acsch|)
              (780 . |coerce|) (785 . |inv|) (790 . -) (795 . |integrate|)
              (|List| 88) (800 . |variables|) (805 . |entry?|)
              (811 . |integrate|) (817 . |integrate|) (|Union| 6 (|List| 6))
              (|FunctionSpaceIntegration| 9 6) (823 . |integrate|)
              (|OutputForm|) (829 . |coerce|) (834 . |coerce|) (839 . ^)
              (845 . -) (850 . -) (855 . *) (861 . ~=)
              (867 . |explicitEntries?|) (872 . |eq?|)
              (878 . |explicitlyEmpty?|) (|List| $) (883 . |prefix|) (889 . +)
              (|Mapping| 225 225 225) (|List| 225) (895 . |reduce|)
              (901 . |coerce|) (906 . -) (912 . |paren|)
              |ULSCONS;coerce;$Of;98| (|Union| 255 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| 264) (|Pattern| 9) (|List| 7)
              (|Equation| 7) (|List| 252)
              (|Record| (|:| |mat| 256) (|:| |vec| (|Vector| 9))) (|Vector| $)
              (|Matrix| 9) (|PatternMatchResult| 264 $)
              (|PatternMatchResult| 9 $) (|Union| 260 '#1#) (|List| 261)
              (|SparseUnivariatePolynomial| $) (|Factored| 261) (|DoubleFloat|)
              (|Float|) (|Union| 155 '#2="failed") (|Union| 9 '#2#)
              (|Union| 88 '#2#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|List| 26) (|Mapping| 7 7)
              (|Record| (|:| |mat| 272) (|:| |vec| (|Vector| 7))) (|Matrix| 7)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |coef| 236) (|:| |generator| $))
              (|Union| 236 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 277 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|List| 283) (|List| 9) (|SingletonAsOrderedSet|)
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 917 |zero?| 923 |wholePart| 928 |variables| 933 |variable| 938
              |unitNormal| 943 |unitCanonical| 948 |unit?| 953 |truncate| 958
              |terms| 971 |taylorRep| 976 |taylorIfCan| 981 |taylor| 986 |tanh|
              991 |tan| 996 |subtractIfCan| 1001 |squareFreePolynomial| 1007
              |squareFreePart| 1012 |squareFree| 1017 |sqrt| 1022
              |solveLinearPolynomialEquation| 1027 |smaller?| 1033 |sizeLess?|
              1039 |sinh| 1045 |sin| 1050 |sign| 1055 |series| 1060 |sech| 1065
              |sec| 1070 |sample| 1075 |retractIfCan| 1079 |retract| 1099
              |removeZeroes| 1119 |rem| 1130 |reductum| 1136 |reducedSystem|
              1141 |recip| 1163 |rationalFunction| 1168 |random| 1181 |quo|
              1185 |principalIdeal| 1191 |prime?| 1196 |positive?| 1201 |pole?|
              1206 |pi| 1211 |patternMatch| 1215 |order| 1229 |one?| 1240
              |numerator| 1245 |numer| 1250 |nthRoot| 1255 |nextItem| 1261
              |negative?| 1266 |multiplyExponents| 1271 |multiplyCoefficients|
              1277 |multiEuclidean| 1283 |monomial?| 1289 |monomial| 1294 |min|
              1314 |max| 1320 |map| 1326 |log| 1338 |leadingMonomial| 1343
              |leadingCoefficient| 1348 |lcmCoef| 1353 |lcm| 1359 |laurent|
              1370 |latex| 1376 |inv| 1381 |integrate| 1386 |init| 1397
              |hashUpdate!| 1401 |hash| 1407 |gcdPolynomial| 1412 |gcd| 1418
              |fractionPart| 1429 |floor| 1434 |factorSquareFreePolynomial|
              1439 |factorPolynomial| 1444 |factor| 1449 |extendedEuclidean|
              1454 |extend| 1467 |exquo| 1473 |expressIdealMember| 1479 |exp|
              1485 |eval| 1490 |euclideanSize| 1536 |elt| 1541 |divide| 1559
              |differentiate| 1565 |denominator| 1615 |denom| 1620 |degree|
              1625 |csch| 1630 |csc| 1635 |coth| 1640 |cot| 1645 |cosh| 1650
              |cos| 1655 |convert| 1660 |conditionP| 1685 |complete| 1690
              |coerce| 1695 |coefficient| 1730 |charthRoot| 1736
              |characteristic| 1741 |center| 1745 |ceiling| 1750 |atanh| 1755
              |atan| 1760 |associates?| 1765 |asinh| 1771 |asin| 1776 |asech|
              1781 |asec| 1786 |approximate| 1791 |acsch| 1797 |acsc| 1802
              |acoth| 1807 |acot| 1812 |acosh| 1817 |acos| 1822 |abs| 1827 ^
              1832 |Zero| 1862 |One| 1866 D 1870 >= 1920 > 1926 = 1932 <= 1938
              < 1944 / 1950 - 1968 + 1979 * 1985)
           'NIL
           (CONS
            (|makeByteWordVec2| 53
                                '(0 0 2 2 0 2 33 0 2 2 0 2 7 2 24 19 24 2 37 2
                                  2 2 19 24 24 37 31 4 23 7 2 43 44 2 13 0 23
                                  37 7 2 45 0 0 23 41 37 37 7 2 2 45 7 49 47 7
                                  51 0 47 27 53 2 0 0 28 9 2 16 17 0 37 6 11 2
                                  0 0 0 0 1 23 24 2 2 37 37 37 37 37 37 42 3 5
                                  6 6 27 8 8 10 11 12 14 15 2))
            (CONS
             '#(|UnivariateLaurentSeriesConstructorCategory&| NIL
                |QuotientFieldCategory&| |Field&|
                |UnivariatePowerSeriesCategory&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DivisionRing&| NIL |Algebra&| |Algebra&| NIL |Algebra&|
                |Algebra&| |DifferentialExtension&|
                |FullyLinearlyExplicitRingOver&| |Module&| |Module&|
                |EntireRing&| |Module&| NIL NIL NIL |OrderedRing&| |Module&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL NIL
                NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |Monoid&| |OrderedSet&|
                |AbelianMonoid&| NIL |AbelianSemiGroup&| |SemiGroup&| NIL NIL
                |FullyEvalableOver&| NIL NIL |SetCategory&|
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
                 (|PowerSeriesCategory| 6 9 283) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 9)
                 (|GcdDomain|) (|OrderedIntegralDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|Algebra| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|Algebra| 155) (|Algebra| 7)
                 (|DifferentialExtension| 7)
                 (|FullyLinearlyExplicitRingOver| 7) (|Module| 6) (|Module| $$)
                 (|EntireRing|) (|Module| 155) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|CommutativeRing|) (|OrderedRing|)
                 (|Module| 7) (|PartialDifferentialRing| 88)
                 (|DifferentialRing|) (|LinearlyExplicitRingOver| 7)
                 (|LinearlyExplicitRingOver| 9) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|BiModule| 155 155)
                 (|OrderedAbelianGroup|) (|BiModule| 7 7) (|Ring|)
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 155) (|RightModule| 155)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| 7)
                 (|RightModule| 7) (|Rng|) (|OrderedAbelianMonoid|)
                 (|AbelianGroup|) (|SemiRing|) (|OrderedAbelianSemiGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|OrderedSet|) (|AbelianMonoid|) (|FullyPatternMatchable| 7)
                 (|AbelianSemiGroup|) (|SemiGroup|) (|Comparable|)
                 (|StepThrough|) (|FullyEvalableOver| 7)
                 (|PatternMatchable| 264) (|PatternMatchable| 9)
                 (|SetCategory|) (|TranscendentalFunctionCategory|)
                 (|RealConstant|) (|Evalable| 7) (|Patternable| 7)
                 (|RetractableTo| 7) (|VariablesCommuteWithCoefficients|)
                 (|BasicType|) (|CoercibleTo| 225) (|Eltable| $$ $$)
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|unitsKnown|) (|RetractableTo| 88) (|ConvertibleTo| 248)
                 (|ConvertibleTo| 263) (|ConvertibleTo| 264) (|PartialOrder|)
                 (|RetractableTo| 155) (|RetractableTo| 9)
                 (|InnerEvalable| 88 7) (|InnerEvalable| 7 7) (|Eltable| 7 $$)
                 (|ConvertibleTo| 249) (|ConvertibleTo| 250) (|Type|))
              (|makeByteWordVec2| 286
                                  '(0 6 0 14 0 7 0 15 0 7 0 16 1 7 0 6 18 1 6 0
                                    9 22 0 6 0 25 2 7 0 6 26 27 2 7 0 0 0 28 1
                                    33 32 0 34 0 36 0 37 1 33 6 0 38 1 6 32 0
                                    39 1 33 0 0 40 0 9 0 41 2 9 0 0 0 42 2 36 0
                                    35 0 43 1 36 0 44 45 1 7 33 0 46 1 36 32 0
                                    48 0 33 0 49 1 36 35 0 50 2 9 32 0 0 51 1
                                    36 0 0 52 2 33 0 6 0 53 0 9 0 54 1 33 0 44
                                    55 1 7 0 33 56 2 7 6 0 26 58 2 6 32 0 0 59
                                    1 7 0 0 60 2 9 32 0 0 62 2 7 32 0 0 63 2 9
                                    32 0 0 64 2 7 0 0 0 67 2 7 0 0 0 69 1 0 32
                                    0 72 2 9 0 26 0 73 2 7 0 0 26 74 1 7 77 0
                                    78 2 7 0 0 0 80 1 6 77 0 82 2 6 0 0 26 83 2
                                    7 33 0 6 84 2 85 33 6 33 86 1 7 88 0 89 1 7
                                    6 0 91 1 7 26 0 94 2 7 26 0 26 96 2 7 0 0
                                    26 98 3 7 0 0 26 26 100 0 102 0 103 2 7 104
                                    0 26 105 1 102 0 104 106 1 102 0 88 107 1
                                    104 0 6 108 1 9 32 0 109 2 102 0 0 0 110 2
                                    102 0 0 9 111 2 102 0 0 0 112 2 102 0 0 0
                                    113 2 0 102 0 9 114 3 7 104 0 26 26 115 3 0
                                    102 0 9 9 116 2 7 77 0 0 117 2 0 77 0 0 118
                                    2 7 6 0 26 119 1 6 0 88 120 2 6 0 0 0 121 2
                                    6 0 0 9 122 2 6 0 0 0 123 2 0 6 0 9 124 1 7
                                    0 0 125 2 7 0 0 26 127 2 7 0 129 0 130 2 7
                                    0 132 0 133 2 9 0 135 0 136 2 7 0 0 135 137
                                    2 6 0 0 88 140 2 0 0 6 0 141 2 0 0 0 88 142
                                    0 6 26 143 1 0 7 0 145 1 0 29 0 146 1 0 0 0
                                    147 2 0 0 0 9 148 2 0 0 7 0 149 2 0 0 0 7
                                    150 2 0 0 0 0 151 2 0 0 7 7 152 1 0 7 0 153
                                    1 0 7 0 154 1 6 0 155 156 1 0 0 155 157 2
                                    158 2 2 155 159 2 0 0 0 155 160 1 158 2 2
                                    161 1 0 0 0 162 1 158 2 2 163 1 0 0 0 164 1
                                    158 2 2 165 1 0 0 0 166 1 158 2 2 167 1 0 0
                                    0 168 1 158 2 2 169 1 0 0 0 170 1 158 2 2
                                    171 1 0 0 0 172 1 158 2 2 173 1 0 0 0 174 1
                                    158 2 2 175 1 0 0 0 176 1 158 2 2 177 1 0 0
                                    0 178 1 158 2 2 179 1 0 0 0 180 1 158 2 2
                                    181 1 0 0 0 182 1 158 2 2 183 1 0 0 0 184 1
                                    158 2 2 185 1 0 0 0 186 1 158 2 2 187 1 0 0
                                    0 188 1 158 2 2 189 1 0 0 0 190 1 158 2 2
                                    191 1 0 0 0 192 1 158 2 2 193 1 0 0 0 194 1
                                    158 2 2 195 1 0 0 0 196 1 158 2 2 197 1 0 0
                                    0 198 1 158 2 2 199 1 0 0 0 200 1 158 2 2
                                    201 1 0 0 0 202 1 158 2 2 203 1 0 0 0 204 1
                                    158 2 2 205 1 0 0 0 206 1 158 2 2 207 1 0 0
                                    0 208 1 158 2 2 209 1 0 0 0 210 1 158 2 2
                                    211 1 0 0 0 212 1 155 0 9 213 1 155 0 0 214
                                    1 0 0 0 215 1 0 0 0 216 1 6 217 0 218 2 217
                                    32 88 0 219 2 6 0 0 88 220 2 0 0 0 88 221 2
                                    223 222 6 88 224 1 6 225 0 226 1 9 225 0
                                    227 2 225 0 0 0 228 1 6 0 0 229 1 225 0 0
                                    230 2 225 0 0 0 231 2 6 32 0 0 232 1 33 32
                                    0 233 2 33 32 0 0 234 1 33 32 0 235 2 225 0
                                    0 236 237 2 225 0 0 0 238 2 240 225 239 0
                                    241 1 88 225 0 242 2 225 0 0 0 243 1 225 0
                                    0 244 2 0 32 0 0 1 1 62 32 0 72 1 35 7 0 1
                                    1 0 281 0 1 1 0 88 0 90 1 57 268 0 1 1 57 0
                                    0 1 1 57 32 0 1 3 0 0 0 9 9 101 2 0 0 0 9
                                    99 1 0 36 0 47 1 0 7 0 11 1 0 29 0 30 1 0 7
                                    0 31 1 36 0 0 194 1 36 0 0 170 2 61 77 0 0
                                    1 1 33 262 261 1 1 2 0 0 1 1 2 280 0 1 1 36
                                    0 0 1 2 33 259 260 261 1 2 25 32 0 0 1 2 2
                                    32 0 0 1 1 36 0 0 190 1 36 0 0 166 1 7 9 0
                                    1 1 0 0 36 57 1 36 0 0 198 1 36 0 0 174 0
                                    62 0 1 1 8 265 0 1 1 8 266 0 1 1 3 267 0 1
                                    1 0 29 0 146 1 8 155 0 1 1 8 9 0 1 1 3 88 0
                                    1 1 0 7 0 145 1 0 0 0 61 2 0 0 9 0 24 2 2 0
                                    0 0 1 1 0 0 0 1 2 13 254 247 255 1 1 13 256
                                    247 1 2 2 271 247 255 1 1 2 272 247 1 1 59
                                    77 0 79 3 22 102 0 9 9 116 2 22 102 0 9 114
                                    0 34 0 1 2 2 0 0 0 1 1 2 274 236 1 1 2 32 0
                                    1 1 7 32 0 1 1 0 32 0 66 0 36 0 1 3 16 257
                                    0 249 257 1 3 17 258 0 250 258 1 2 0 9 0 9
                                    97 1 0 9 0 95 1 59 32 0 1 1 2 0 0 1 1 2 7 0
                                    153 2 36 0 0 9 1 1 9 77 0 1 1 7 32 0 1 2 0
                                    0 0 135 138 2 0 0 132 0 134 2 2 275 236 0 1
                                    1 0 32 0 1 3 0 0 0 281 282 1 3 0 0 0 283 9
                                    1 2 0 0 6 9 19 2 26 0 0 0 1 2 26 0 0 0 1 2
                                    2 0 270 0 1 2 0 0 129 0 131 1 36 0 0 164 1
                                    0 0 0 1 1 0 6 0 1 2 2 273 0 0 1 2 2 0 0 0 1
                                    1 2 0 236 1 2 0 0 9 7 10 1 0 285 0 1 1 2 0
                                    0 147 2 38 0 0 88 221 1 36 0 0 216 0 9 0 1
                                    2 0 284 284 0 1 1 0 286 0 1 2 2 261 261 261
                                    1 2 2 0 0 0 1 1 2 0 236 1 1 35 0 0 1 1 34 7
                                    0 1 1 33 262 261 1 1 33 262 261 1 1 2 280 0
                                    1 3 2 278 0 0 0 1 2 2 279 0 0 1 2 0 0 0 9
                                    128 2 57 77 0 0 118 2 2 275 236 0 1 1 36 0
                                    0 162 3 11 0 0 7 7 1 3 11 0 0 251 251 1 2
                                    11 0 0 252 1 2 11 0 0 253 1 3 10 0 0 217
                                    251 1 3 10 0 0 88 7 1 2 20 33 0 6 87 1 2 26
                                    0 1 2 12 0 0 7 1 2 1 0 0 0 81 2 0 6 0 9 93
                                    2 2 276 0 0 1 1 44 0 0 139 2 44 0 0 26 1 2
                                    43 0 0 88 142 2 43 0 0 217 1 3 43 0 0 217
                                    269 1 3 43 0 0 88 26 1 2 2 0 0 270 1 3 2 0
                                    0 270 26 1 1 2 0 0 1 1 2 7 0 154 1 0 9 0 12
                                    1 36 0 0 200 1 36 0 0 176 1 36 0 0 196 1 36
                                    0 0 172 1 36 0 0 192 1 36 0 0 168 1 5 248 0
                                    1 1 14 249 0 1 1 15 250 0 1 1 6 263 0 1 1 6
                                    264 0 1 1 55 246 247 1 1 0 0 0 126 1 54 0 6
                                    21 1 3 0 88 1 1 58 0 9 23 1 57 0 0 1 1 36 0
                                    155 157 1 0 0 7 20 1 0 225 0 245 2 0 6 0 9
                                    76 1 56 77 0 1 0 58 26 144 1 0 6 0 92 1 34
                                    7 0 1 1 36 0 0 206 1 36 0 0 182 2 57 32 0 0
                                    1 1 36 0 0 202 1 36 0 0 178 1 36 0 0 210 1
                                    36 0 0 186 2 21 6 0 9 124 1 36 0 0 212 1 36
                                    0 0 188 1 36 0 0 208 1 36 0 0 184 1 36 0 0
                                    204 1 36 0 0 180 1 7 0 0 1 2 59 0 0 26 75 2
                                    36 0 0 155 160 2 36 0 0 0 1 2 2 0 0 9 148 2
                                    0 0 0 135 1 0 62 0 13 0 59 0 17 1 44 0 0 1
                                    2 44 0 0 26 1 2 43 0 0 88 1 3 43 0 0 88 26
                                    1 2 43 0 0 217 1 3 43 0 0 217 269 1 2 2 0 0
                                    270 1 3 2 0 0 270 26 1 2 26 32 0 0 1 2 26
                                    32 0 0 1 2 0 32 0 0 65 2 26 32 0 0 1 2 26
                                    32 0 0 1 2 2 0 7 7 152 2 2 0 0 0 151 2 2 0
                                    0 6 1 1 60 0 0 215 2 60 0 0 0 70 2 0 0 0 0
                                    68 2 60 0 9 0 1 2 62 0 26 0 1 2 36 0 0 155
                                    1 2 36 0 155 0 1 2 2 0 0 7 150 2 2 0 7 0
                                    149 2 0 0 0 6 1 2 0 0 6 0 141 2 0 0 0 0 71
                                    2 0 0 135 0 1)))))
           '|lookupComplete|)) 
