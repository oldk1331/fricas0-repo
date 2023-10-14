
(/VERSIONCHECK 2) 

(PUT '|PRTITION;Zero;$;1| '|SPADreplace| '(XLAM NIL NIL)) 

(DEFUN |PRTITION;Zero;$;1| ($) NIL) 

(PUT '|PRTITION;coerce;$L;2| '|SPADreplace| '(XLAM (|s|) |s|)) 

(DEFUN |PRTITION;coerce;$L;2| (|s| $) |s|) 

(DEFUN |PRTITION;convert;$L;3| (|x| $) (SPADCALL |x| (QREFELT $ 10))) 

(DEFUN |PRTITION;partition;L$;4| (|list| $)
  (SPADCALL (CONS #'|PRTITION;partition;L$;4!0| $) |list| (QREFELT $ 16))) 

(DEFUN |PRTITION;partition;L$;4!0| (|i1| |i2| $)
  (SPADCALL |i2| |i1| (QREFELT $ 14))) 

(DEFUN |PRTITION;<;2$B;5| (|x| |y| $)
  (COND ((NULL |x|) (COND ((NULL |y|) 'NIL) (#1='T 'T))) ((NULL |y|) 'NIL)
        ((EQL (|SPADfirst| |x|) (|SPADfirst| |y|))
         (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 18)))
        (#1# (< (|SPADfirst| |x|) (|SPADfirst| |y|))))) 

(PUT '|PRTITION;=;2$B;6| '|SPADreplace| 'EQUAL) 

(DEFUN |PRTITION;=;2$B;6| (|x| |y| $) (EQUAL |x| |y|)) 

(DEFUN |PRTITION;+;3$;7| (|x| |y| $)
  (COND ((NULL |x|) |y|) ((NULL |y|) |x|)
        ((SPADCALL (|SPADfirst| |x|) (|SPADfirst| |y|) (QREFELT $ 20))
         (CONS (|SPADfirst| |x|) (SPADCALL (CDR |x|) |y| (QREFELT $ 21))))
        ('T (CONS (|SPADfirst| |y|) (SPADCALL |x| (CDR |y|) (QREFELT $ 21)))))) 

(DEFUN |PRTITION;*;Nni2$;8| (|n| |x| $)
  (PROG (#1=#:G162)
    (RETURN
     (COND ((ZEROP |n|) (|spadConstant| $ 7))
           ('T
            (SPADCALL |x|
                      (SPADCALL
                       (PROG2
                           (LETT #1# (SPADCALL |n| 1 (QREFELT $ 24))
                                 |PRTITION;*;Nni2$;8|)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                        #1#))
                       |x| (QREFELT $ 25))
                      (QREFELT $ 21))))))) 

(DEFUN |PRTITION;dp| (|i| |x| $)
  (COND ((NULL |x|) (|spadConstant| $ 7))
        ((EQL (|SPADfirst| |x|) |i|) (CDR |x|))
        ('T (CONS (|SPADfirst| |x|) (|PRTITION;dp| |i| (CDR |x|) $))))) 

(DEFUN |PRTITION;remv| (|i| |x| $)
  (COND ((SPADCALL |i| |x| (QREFELT $ 26)) (CONS 0 (|PRTITION;dp| |i| |x| $)))
        ('T (CONS 1 "failed")))) 

(DEFUN |PRTITION;subtractIfCan;2$U;11| (|x| |y| $)
  (PROG (|aa|)
    (RETURN
     (SEQ
      (COND
       ((NULL |x|)
        (COND ((NULL |y|) (CONS 0 (|spadConstant| $ 7)))
              (#1='T (CONS 1 "failed"))))
       ((NULL |y|) (CONS 0 |x|))
       (#1#
        (SEQ
         (LETT |aa| (|PRTITION;remv| (|SPADfirst| |y|) |x| $)
               |PRTITION;subtractIfCan;2$U;11|)
         (EXIT
          (COND ((QEQCAR |aa| 1) (CONS 1 "failed"))
                (#1# (SPADCALL (QCDR |aa|) (CDR |y|) (QREFELT $ 27)))))))))))) 

(DEFUN |PRTITION;bite| (|i| |li| $)
  (PROG (|li1|)
    (RETURN
     (SEQ
      (COND ((NULL |li|) (CONS 0 NIL))
            ((EQL (|SPADfirst| |li|) |i|)
             (SEQ
              (LETT |li1| (|PRTITION;bite| |i| (CDR |li|) $) |PRTITION;bite|)
              (EXIT (CONS (+ (|SPADfirst| |li1|) 1) (CDR |li1|)))))
            ('T (CONS 0 |li|))))))) 

(DEFUN |PRTITION;powers;LL;13| (|l| $)
  (PROG (|li|)
    (RETURN
     (SEQ
      (COND ((NULL |l|) NIL)
            ('T
             (SEQ
              (LETT |li| (|PRTITION;bite| (|SPADfirst| |l|) (CDR |l|) $)
                    |PRTITION;powers;LL;13|)
              (EXIT
               (CONS (LIST (|SPADfirst| |l|) (+ (|SPADfirst| |li|) 1))
                     (SPADCALL (CDR |li|) (QREFELT $ 29))))))))))) 

(DEFUN |PRTITION;conjugate;2$;14| (|x| $) (SPADCALL |x| (QREFELT $ 31))) 

(DEFUN |PRTITION;mkterm| (|i1| |i2| $)
  (COND
   ((EQL |i2| 1) (SPADCALL (SPADCALL |i1| (QREFELT $ 34)) " " (QREFELT $ 35)))
   ('T
    (SPADCALL (SPADCALL |i1| (QREFELT $ 34)) (SPADCALL |i2| (QREFELT $ 34))
              (QREFELT $ 35))))) 

(DEFUN |PRTITION;mkexp1| (|lli| $)
  (PROG (|li|)
    (RETURN
     (SEQ
      (COND ((NULL |lli|) NIL)
            ('T
             (SEQ (LETT |li| (|SPADfirst| |lli|) |PRTITION;mkexp1|)
                  (COND
                   ((NULL (CDR |lli|))
                    (COND
                     ((EQL (SPADCALL |li| (QREFELT $ 36)) 1)
                      (EXIT
                       (CONS (SPADCALL (|SPADfirst| |li|) (QREFELT $ 34))
                             NIL))))))
                  (EXIT
                   (CONS
                    (|PRTITION;mkterm| (|SPADfirst| |li|)
                     (SPADCALL |li| (QREFELT $ 36)) $)
                    (|PRTITION;mkexp1| (CDR |lli|) $)))))))))) 

(DEFUN |PRTITION;coerce;$Of;17| (|x| $)
  (COND ((NULL |x|) (SPADCALL |x| (QREFELT $ 37)))
        ('T
         (SPADCALL
          (SPADCALL (ELT $ 38)
                    (|PRTITION;mkexp1| (SPADCALL |x| (QREFELT $ 29)) $)
                    (QREFELT $ 41))
          (QREFELT $ 42))))) 

(DEFUN |PRTITION;pdct;$I;18| (|x| $)
  (PROG (#1=#:G201 #2=#:G200 #3=#:G202 #4=#:G204 |a|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|PRTITION;pdct;$I;18|))
       (SEQ (LETT |a| NIL . #5#) (LETT #4# (SPADCALL |x| (QREFELT $ 29)) . #5#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (* (SPADCALL (SPADCALL |a| (QREFELT $ 36)) (QREFELT $ 44))
                        (EXPT (|SPADfirst| |a|) (SPADCALL |a| (QREFELT $ 36))))
                     . #5#)
               (COND (#1# (LETT #2# (* #2# #3#) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T 1))))))) 

(DEFUN |Partition| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G206)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|Partition|) . #2=(|Partition|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|Partition|
                         (LIST (CONS NIL (CONS 1 (|Partition;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Partition|))))))))))) 

(DEFUN |Partition;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Partition|) . #1=(|Partition|))
      (LETT $ (GETREFV 50) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Partition| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 (|List| (|Integer|)))
      $)))) 

(MAKEPROP '|Partition| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |PRTITION;Zero;$;1|) $))
              (|List| 13) |PRTITION;coerce;$L;2| (0 . |copy|)
              |PRTITION;convert;$L;3| (|Boolean|) (|Integer|) (5 . <)
              (|Mapping| 12 13 13) (11 . |sort|) |PRTITION;partition;L$;4|
              |PRTITION;<;2$B;5| |PRTITION;=;2$B;6| (17 . >) |PRTITION;+;3$;7|
              (|Union| $ '"failed") (|NonNegativeInteger|)
              (23 . |subtractIfCan|) |PRTITION;*;Nni2$;8| (29 . |member?|)
              |PRTITION;subtractIfCan;2$U;11| (|List| 8)
              |PRTITION;powers;LL;13| (|PartitionsAndPermutations|)
              (35 . |conjugate|) |PRTITION;conjugate;2$;14| (|OutputForm|)
              (40 . |coerce|) (45 . ^) (51 . |second|) (56 . |coerce|) (61 . *)
              (|Mapping| 33 33 33) (|List| 33) (67 . |reduce|) (73 . |paren|)
              |PRTITION;coerce;$Of;17| (78 . |factorial|) |PRTITION;pdct;$I;18|
              (|PositiveInteger|) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 83 |zero?| 89 |subtractIfCan| 94 |smaller?| 100 |sample| 106
              |powers| 110 |pdct| 115 |partition| 120 |min| 125 |max| 131
              |latex| 137 |hashUpdate!| 142 |hash| 148 |convert| 153
              |conjugate| 158 |coerce| 163 |Zero| 173 >= 177 > 183 = 189 <= 195
              < 201 + 207 * 213)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL NIL NIL |OrderedSet&| |AbelianMonoid&| NIL
                     |AbelianSemiGroup&| |SetCategory&| NIL |BasicType&|
                     |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedCancellationAbelianMonoid|)
                      (|OrderedAbelianMonoid|) (|OrderedAbelianSemiGroup|)
                      (|CancellationAbelianMonoid|) (|OrderedSet|)
                      (|AbelianMonoid|) (|Comparable|) (|AbelianSemiGroup|)
                      (|SetCategory|) (|ConvertibleTo| 8) (|BasicType|)
                      (|PartialOrder|) (|CoercibleTo| 33))
                   (|makeByteWordVec2| 49
                                       '(1 8 0 0 10 2 13 12 0 0 14 2 6 0 15 0
                                         16 2 13 12 0 0 20 2 23 22 0 0 24 2 6
                                         12 13 0 26 1 30 8 8 31 1 13 33 0 34 2
                                         33 0 0 0 35 1 6 13 0 36 1 6 33 0 37 2
                                         33 0 0 0 38 2 40 33 39 0 41 1 33 0 0
                                         42 1 13 0 0 44 2 0 12 0 0 1 1 0 12 0 1
                                         2 0 22 0 0 27 2 0 12 0 0 1 0 0 0 1 1 0
                                         28 8 29 1 0 13 0 45 1 0 0 8 17 2 0 0 0
                                         0 1 2 0 0 0 0 1 1 0 48 0 1 2 0 47 47 0
                                         1 1 0 49 0 1 1 0 8 0 11 1 0 0 0 32 1 0
                                         8 0 9 1 0 33 0 43 0 0 0 7 2 0 12 0 0 1
                                         2 0 12 0 0 1 2 0 12 0 0 19 2 0 12 0 0
                                         1 2 0 12 0 0 18 2 0 0 0 0 21 2 0 0 23
                                         0 25 2 0 0 46 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Partition| 'NILADIC T) 
