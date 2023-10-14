
(/VERSIONCHECK 2) 

(DEFUN |PATTERN;coerce;R$;1| (|r| $) (|PATTERN;mkPat| 'T (CONS 0 |r|) 0 $)) 

(DEFUN |PATTERN;mkPat| (|c| |p| |l| $) (VECTOR |c| |p| |l| NIL (QREFELT $ 17))) 

(DEFUN |PATTERN;hasTopPredicate?;$B;3| (|x| $)
  (COND ((NULL (QVELT |x| 3)) 'NIL) ('T 'T))) 

(DEFUN |PATTERN;topPredicate;$R;4| (|x| $) (CONS (QVELT |x| 3) (QVELT |x| 4))) 

(DEFUN |PATTERN;setTopPredicate;$LA$;5| (|x| |l| |f| $)
  (SEQ (QSETVELT |x| 3 |l|) (QSETVELT |x| 4 |f|) (EXIT |x|))) 

(PUT '|PATTERN;constant?;$B;6| '|SPADreplace| '(XLAM (|p|) (QVELT |p| 0))) 

(DEFUN |PATTERN;constant?;$B;6| (|p| $) (QVELT |p| 0)) 

(PUT '|PATTERN;depth;$Nni;7| '|SPADreplace| '(XLAM (|p|) (QVELT |p| 2))) 

(DEFUN |PATTERN;depth;$Nni;7| (|p| $) (QVELT |p| 2)) 

(DEFUN |PATTERN;inR?;$B;8| (|p| $) (QEQCAR (QVELT |p| 1) 0)) 

(DEFUN |PATTERN;symbol?;$B;9| (|p| $) (QEQCAR (QVELT |p| 1) 4)) 

(DEFUN |PATTERN;isPlus;$U;10| (|p| $) (|PATTERN;isTaggedOp| |p| 1 $)) 

(DEFUN |PATTERN;isTimes;$U;11| (|p| $)
  (|PATTERN;isTaggedOp| |p| (SPADCALL 2 (QREFELT $ 33)) $)) 

(DEFUN |PATTERN;isList;$U;12| (|p| $)
  (|PATTERN;isTaggedOp| |p| (SPADCALL 3 (QREFELT $ 33)) $)) 

(DEFUN |PATTERN;isExpt;$U;13| (|p| $)
  (PROG (#1=#:G251)
    (RETURN
     (COND
      ((QEQCAR (QVELT |p| 1) 2)
       (CONS 0
             (PROG2 (LETT #1# (QVELT |p| 1) |PATTERN;isExpt;$U;13|)
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 2)
                              (|Record| (|:| |val| $)
                                        (|:| |exponent|
                                             (|NonNegativeInteger|)))
                              #1#))))
      ('T (CONS 1 "failed")))))) 

(DEFUN |PATTERN;isQuotient;$U;14| (|p| $)
  (PROG (#1=#:G270)
    (RETURN
     (COND
      ((QEQCAR (QVELT |p| 1) 3)
       (CONS 0
             (PROG2 (LETT #1# (QVELT |p| 1) |PATTERN;isQuotient;$U;14|)
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 3)
                              (|Record| (|:| |num| $) (|:| |den| $)) #1#))))
      ('T (CONS 1 "failed")))))) 

(DEFUN |PATTERN;hasPredicate?;$B;15| (|p| $)
  (COND ((NULL (SPADCALL |p| (QREFELT $ 43))) 'NIL) ('T 'T))) 

(DEFUN |PATTERN;quoted?;$B;16| (|p| $)
  (PROG (#1=#:G288)
    (RETURN
     (COND
      ((SPADCALL |p| (QREFELT $ 29))
       (ZEROP
        (QVELT
         (PROG2 (LETT #1# (QVELT |p| 1) |PATTERN;quoted?;$B;16|)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 4)
                          (|Record| (|:| |tag| (|SingleInteger|))
                                    (|:| |val| (|Symbol|))
                                    (|:| |pred| (|List| (|Any|)))
                                    (|:| |bad| (|List| (|Any|))))
                          #1#))
         0)))
      ('T 'NIL))))) 

(DEFUN |PATTERN;generic?;$B;17| (|p| $)
  (PROG (#1=#:G299)
    (RETURN
     (COND
      ((SPADCALL |p| (QREFELT $ 29))
       (|PATTERN;bitSet?|
        (QVELT
         (PROG2 (LETT #1# (QVELT |p| 1) |PATTERN;generic?;$B;17|)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 4)
                          (|Record| (|:| |tag| (|SingleInteger|))
                                    (|:| |val| (|Symbol|))
                                    (|:| |pred| (|List| (|Any|)))
                                    (|:| |bad| (|List| (|Any|))))
                          #1#))
         0)
        1 $))
      ('T 'NIL))))) 

(DEFUN |PATTERN;multiple?;$B;18| (|p| $)
  (PROG (#1=#:G310)
    (RETURN
     (COND
      ((SPADCALL |p| (QREFELT $ 29))
       (|PATTERN;bitSet?|
        (QVELT
         (PROG2 (LETT #1# (QVELT |p| 1) |PATTERN;multiple?;$B;18|)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 4)
                          (|Record| (|:| |tag| (|SingleInteger|))
                                    (|:| |val| (|Symbol|))
                                    (|:| |pred| (|List| (|Any|)))
                                    (|:| |bad| (|List| (|Any|))))
                          #1#))
         0)
        (SPADCALL 2 (QREFELT $ 33)) $))
      ('T 'NIL))))) 

(DEFUN |PATTERN;optional?;$B;19| (|p| $)
  (PROG (#1=#:G321)
    (RETURN
     (COND
      ((SPADCALL |p| (QREFELT $ 29))
       (|PATTERN;bitSet?|
        (QVELT
         (PROG2 (LETT #1# (QVELT |p| 1) |PATTERN;optional?;$B;19|)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 4)
                          (|Record| (|:| |tag| (|SingleInteger|))
                                    (|:| |val| (|Symbol|))
                                    (|:| |pred| (|List| (|Any|)))
                                    (|:| |bad| (|List| (|Any|))))
                          #1#))
         0)
        (SPADCALL 4 (QREFELT $ 33)) $))
      ('T 'NIL))))) 

(DEFUN |PATTERN;bitSet?| (|a| |b| $)
  (SPADCALL (|and_SI| |a| |b|) 0 (QREFELT $ 49))) 

(DEFUN |PATTERN;coerce;$Of;21| (|p| $) (|PATTERN;PAT2O| (QVELT |p| 1) $)) 

(DEFUN |PATTERN;^;3$;22| (|p1| |p2| $)
  (|PATTERN;taggedElt| (SPADCALL 6 (QREFELT $ 33)) (LIST |p1| |p2|) $)) 

(DEFUN |PATTERN;LPAT2O| (|f| |l| $)
  (PROG (#1=#:G342 |x| #2=#:G341)
    (RETURN
     (SEQ
      (SPADCALL |f|
                (PROGN
                 (LETT #2# NIL . #3=(|PATTERN;LPAT2O|))
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 51)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 55)))))) 

(DEFUN |PATTERN;retract;$R;24| (|p| $)
  (PROG (#1=#:G347)
    (RETURN
     (COND
      ((SPADCALL |p| (QREFELT $ 28))
       (PROG2 (LETT #1# (QVELT |p| 1) |PATTERN;retract;$R;24|)
           (QCDR #1#)
         (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#)))
      ('T (|error| "Not retractable")))))) 

(DEFUN |PATTERN;convert;L$;25| (|l| $)
  (|PATTERN;taggedElt| (SPADCALL 3 (QREFELT $ 33)) |l| $)) 

(DEFUN |PATTERN;retractIfCan;$U;26| (|p| $)
  (PROG (#1=#:G362)
    (RETURN
     (COND
      ((SPADCALL |p| (QREFELT $ 28))
       (CONS 0
             (PROG2 (LETT #1# (QVELT |p| 1) |PATTERN;retractIfCan;$U;26|)
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))))
      ('T (CONS 1 "failed")))))) 

(DEFUN |PATTERN;withPredicates;$L$;27| (|p| |l| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 61)) |l| (QREFELT $ 62))) 

(DEFUN |PATTERN;coerce;S$;28| (|sy| $)
  (SPADCALL |sy| 'NIL 'NIL 'NIL (QREFELT $ 64))) 

(DEFUN |PATTERN;copy;2$;29| (|p| $)
  (VECTOR (SPADCALL |p| (QREFELT $ 25)) (|PATTERN;patcopy| (QVELT |p| 1) $)
          (QVELT |p| 2) (QVELT |p| 3) (QVELT |p| 4))) 

(DEFUN |PATTERN;optpair;LU;30| (|l| $)
  (PROG (|a| |b|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 67)) (QREFELT $ 67))
                  (QREFELT $ 68))
        (SEQ
         (LETT |b| (SPADCALL (SPADCALL |l| (QREFELT $ 67)) (QREFELT $ 69))
               . #1=(|PATTERN;optpair;LU;30|))
         (EXIT
          (COND
           ((SPADCALL (LETT |a| (SPADCALL |l| (QREFELT $ 69)) . #1#)
                      (QREFELT $ 48))
            (CONS 0 |l|))
           ((SPADCALL |b| (QREFELT $ 48))
            (CONS 0 (SPADCALL |l| (QREFELT $ 70))))
           (#2='T (CONS 1 "failed"))))))
       (#2# (CONS 1 "failed"))))))) 

(DEFUN |PATTERN;incmax| (|l| $)
  (PROG (#1=#:G396 |p| #2=#:G395)
    (RETURN
     (SEQ
      (+ 1
         (SPADCALL (ELT $ 73)
                   (PROGN
                    (LETT #2# NIL . #3=(|PATTERN;incmax|))
                    (SEQ (LETT |p| NIL . #3#) (LETT #1# |l| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ (EXIT (LETT #2# (CONS (QVELT |p| 2) #2#) . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   0 (QREFELT $ 76))))))) 

(DEFUN |PATTERN;=;2$B;32| (|p1| |p2| $)
  (COND
   ((|BooleanEquality| (QVELT |p1| 0) (QVELT |p2| 0))
    (COND
     ((EQL (QVELT |p1| 2) (QVELT |p2| 2))
      (COND
       ((SPADCALL (QVELT |p1| 3) (QVELT |p2| 3) (QREFELT $ 77))
        (COND
         ((EQ (QVELT |p1| 4) (QVELT |p2| 4))
          (|PATTERN;pateq?| (QVELT |p1| 1) (QVELT |p2| 1) $))
         (#1='T 'NIL)))
       (#1# 'NIL)))
     (#1# 'NIL)))
   (#1# 'NIL))) 

(DEFUN |PATTERN;isPower;$U;33| (|p| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (|PATTERN;isTaggedOp| |p| (SPADCALL 6 (QREFELT $ 33)) $)
            |PATTERN;isPower;$U;33|)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T
              (CONS 0
                    (CONS (SPADCALL (QCDR |u|) (QREFELT $ 69))
                          (SPADCALL (QCDR |u|) (QREFELT $ 79))))))))))) 

(DEFUN |PATTERN;taggedElt| (|n| |l| $)
  (|PATTERN;mkPat| (SPADCALL (ELT $ 25) |l| (QREFELT $ 84))
   (CONS 1 (VECTOR |n| (QREFELT $ 12) |l|)) (|PATTERN;incmax| |l| $) $)) 

(DEFUN |PATTERN;elt;BoL$;35| (|o| |l| $)
  (SEQ
   (COND
    ((SPADCALL |o| '|%power| (QREFELT $ 85))
     (COND
      ((EQL (SPADCALL |l| (QREFELT $ 86)) 2)
       (EXIT
        (SPADCALL (SPADCALL |l| (QREFELT $ 69)) (SPADCALL |l| (QREFELT $ 87))
                  (QREFELT $ 52)))))))
   (EXIT
    (|PATTERN;mkPat| (SPADCALL (ELT $ 25) |l| (QREFELT $ 84))
     (CONS 1 (VECTOR 0 |o| |l|)) (|PATTERN;incmax| |l| $) $)))) 

(DEFUN |PATTERN;isOp;$U;36| (|p| $)
  (PROG (#1=#:G460)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR (QVELT |p| 1) 1)
        (COND
         ((ZEROP
           (QVELT
            (PROG2 (LETT #1# (QVELT |p| 1) . #2=(|PATTERN;isOp;$U;36|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 1)
                             (|Record| (|:| |tag| (|SingleInteger|))
                                       (|:| |op| (|BasicOperator|))
                                       (|:| |arg| (|List| $)))
                             #1#))
            0))
          (EXIT
           (CONS 0
                 (CONS
                  (QVELT
                   (PROG2 (LETT #1# (QVELT |p| 1) . #2#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 1)
                                    (|Record| (|:| |tag| (|SingleInteger|))
                                              (|:| |op| (|BasicOperator|))
                                              (|:| |arg| (|List| $)))
                                    #1#))
                   1)
                  (QVELT
                   (PROG2 (LETT #1# (QVELT |p| 1) . #2#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 1)
                                    (|Record| (|:| |tag| (|SingleInteger|))
                                              (|:| |op| (|BasicOperator|))
                                              (|:| |arg| (|List| $)))
                                    #1#))
                   2))))))))
      (EXIT (CONS 1 "failed")))))) 

(DEFUN |PATTERN;isTaggedOp| (|p| |t| $)
  (PROG (#1=#:G480)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR (QVELT |p| 1) 1)
        (COND
         ((|eql_SI|
           (QVELT
            (PROG2 (LETT #1# (QVELT |p| 1) . #2=(|PATTERN;isTaggedOp|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 1)
                             (|Record| (|:| |tag| (|SingleInteger|))
                                       (|:| |op| (|BasicOperator|))
                                       (|:| |arg| (|List| $)))
                             #1#))
            0)
           |t|)
          (EXIT
           (CONS 0
                 (QVELT
                  (PROG2 (LETT #1# (QVELT |p| 1) . #2#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 1)
                                   (|Record| (|:| |tag| (|SingleInteger|))
                                             (|:| |op| (|BasicOperator|))
                                             (|:| |arg| (|List| $)))
                                   #1#))
                  2)))))))
      (EXIT (CONS 1 "failed")))))) 

(DEFUN |PATTERN;One;$;38| ($) (SPADCALL (|spadConstant| $ 93) (QREFELT $ 18))) 

(DEFUN |PATTERN;One;$;39| ($)
  (|PATTERN;taggedElt| (SPADCALL 5 (QREFELT $ 33)) (SPADCALL (QREFELT $ 94)) $)) 

(DEFUN |PATTERN;Zero;$;40| ($) (SPADCALL (|spadConstant| $ 95) (QREFELT $ 18))) 

(DEFUN |PATTERN;Zero;$;41| ($)
  (|PATTERN;taggedElt| (SPADCALL 4 (QREFELT $ 33)) (SPADCALL (QREFELT $ 94)) $)) 

(DEFUN |PATTERN;^;$Nni$;42| (|p| |n| $)
  (SEQ
   (COND
    ((SPADCALL |p| (|spadConstant| $ 88) (QREFELT $ 78))
     (COND ((SPADCALL |n| 0 (QREFELT $ 96)) (EXIT (|spadConstant| $ 88))))))
   (COND
    ((OR (SPADCALL |p| (|spadConstant| $ 72) (QREFELT $ 78)) (ZEROP |n|))
     (EXIT (|spadConstant| $ 72))))
   (EXIT
    (COND ((EQL |n| 1) |p|)
          ('T
           (|PATTERN;mkPat| (SPADCALL |p| (QREFELT $ 25))
            (CONS 2 (CONS |p| |n|)) (+ 1 (QVELT |p| 2)) $)))))) 

(DEFUN |PATTERN;/;3$;43| (|p1| |p2| $)
  (COND ((SPADCALL |p2| (|spadConstant| $ 72) (QREFELT $ 78)) |p1|)
        (#1='T
         (|PATTERN;mkPat|
          (COND ((SPADCALL |p1| (QREFELT $ 25)) (SPADCALL |p2| (QREFELT $ 25)))
                (#1# 'NIL))
          (CONS 3 (CONS |p1| |p2|)) (+ 1 (MAX (QVELT |p1| 2) (QVELT |p2| 2)))
          $)))) 

(DEFUN |PATTERN;+;3$;44| (|p1| |p2| $)
  (PROG (|u2| |u1|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p1| (|spadConstant| $ 88) (QREFELT $ 78)) |p2|)
            ((SPADCALL |p2| (|spadConstant| $ 88) (QREFELT $ 78)) |p1|)
            (#1='T
             (SEQ
              (LETT |u1| (SPADCALL |p1| (QREFELT $ 31))
                    . #2=(|PATTERN;+;3$;44|))
              (EXIT
               (COND
                ((QEQCAR |u1| 0)
                 (SEQ (LETT |u2| (SPADCALL |p2| (QREFELT $ 31)) . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |u2| 0)
                         (|PATTERN;taggedElt| 1
                          (SPADCALL (QCDR |u1|) (QCDR |u2|) (QREFELT $ 99)) $))
                        (#1#
                         (|PATTERN;taggedElt| 1
                          (SPADCALL (QCDR |u1|) |p2| (QREFELT $ 100)) $))))))
                (#1#
                 (SEQ (LETT |u2| (SPADCALL |p2| (QREFELT $ 31)) . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |u2| 0)
                         (|PATTERN;taggedElt| 1
                          (SPADCALL |p1| (QCDR |u2|) (QREFELT $ 101)) $))
                        (#1#
                         (|PATTERN;taggedElt| 1 (LIST |p1| |p2|)
                          $))))))))))))))) 

(DEFUN |PATTERN;*;3$;45| (|p1| |p2| $)
  (PROG (|u2| |u1|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |p1| (|spadConstant| $ 88) (QREFELT $ 78))
            (SPADCALL |p2| (|spadConstant| $ 88) (QREFELT $ 78)))
        (|spadConstant| $ 88))
       ('T
        (COND ((SPADCALL |p1| (|spadConstant| $ 72) (QREFELT $ 78)) |p2|)
              ((SPADCALL |p2| (|spadConstant| $ 72) (QREFELT $ 78)) |p1|)
              (#1='T
               (SEQ
                (LETT |u1| (SPADCALL |p1| (QREFELT $ 34))
                      . #2=(|PATTERN;*;3$;45|))
                (EXIT
                 (COND
                  ((QEQCAR |u1| 0)
                   (SEQ (LETT |u2| (SPADCALL |p2| (QREFELT $ 34)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |u2| 0)
                           (|PATTERN;taggedElt| (SPADCALL 2 (QREFELT $ 33))
                            (SPADCALL (QCDR |u1|) (QCDR |u2|) (QREFELT $ 99))
                            $))
                          (#1#
                           (|PATTERN;taggedElt| (SPADCALL 2 (QREFELT $ 33))
                            (SPADCALL (QCDR |u1|) |p2| (QREFELT $ 100)) $))))))
                  (#1#
                   (SEQ (LETT |u2| (SPADCALL |p2| (QREFELT $ 34)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |u2| 0)
                           (|PATTERN;taggedElt| (SPADCALL 2 (QREFELT $ 33))
                            (SPADCALL |p1| (QCDR |u2|) (QREFELT $ 101)) $))
                          (#1#
                           (|PATTERN;taggedElt| (SPADCALL 2 (QREFELT $ 33))
                            (LIST |p1| |p2|) $))))))))))))))))) 

(DEFUN |PATTERN;isOp;$BoU;46| (|p| |o| $)
  (PROG (#1=#:G541)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR (QVELT |p| 1) 1)
        (COND
         ((ZEROP
           (QVELT
            (PROG2 (LETT #1# (QVELT |p| 1) . #2=(|PATTERN;isOp;$BoU;46|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 1)
                             (|Record| (|:| |tag| (|SingleInteger|))
                                       (|:| |op| (|BasicOperator|))
                                       (|:| |arg| (|List| $)))
                             #1#))
            0))
          (COND
           ((SPADCALL
             (QVELT
              (PROG2 (LETT #1# (QVELT |p| 1) . #2#)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 1)
                               (|Record| (|:| |tag| (|SingleInteger|))
                                         (|:| |op| (|BasicOperator|))
                                         (|:| |arg| (|List| $)))
                               #1#))
              1)
             |o| (QREFELT $ 104))
            (EXIT
             (CONS 0
                   (QVELT
                    (PROG2 (LETT #1# (QVELT |p| 1) . #2#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 1)
                                     (|Record| (|:| |tag| (|SingleInteger|))
                                               (|:| |op| (|BasicOperator|))
                                               (|:| |arg| (|List| $)))
                                     #1#))
                    2)))))))))
      (EXIT (CONS 1 "failed")))))) 

(DEFUN |PATTERN;predicates;$L;47| (|p| $)
  (PROG (#1=#:G559)
    (RETURN
     (COND
      ((SPADCALL |p| (QREFELT $ 29))
       (QVELT
        (PROG2 (LETT #1# (QVELT |p| 1) |PATTERN;predicates;$L;47|)
            (QCDR #1#)
          (|check_union| (QEQCAR #1# 4)
                         (|Record| (|:| |tag| (|SingleInteger|))
                                   (|:| |val| (|Symbol|))
                                   (|:| |pred| (|List| (|Any|)))
                                   (|:| |bad| (|List| (|Any|))))
                         #1#))
        2))
      ('T NIL))))) 

(DEFUN |PATTERN;setPredicates;$L$;48| (|p| |l| $)
  (PROG (#1=#:G570)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 46))
        (SEQ
         (QSETVELT
          (PROG2 (LETT #1# (QVELT |p| 1) |PATTERN;setPredicates;$L$;48|)
              (QCDR #1#)
            (|check_union| (QEQCAR #1# 4)
                           (|Record| (|:| |tag| (|SingleInteger|))
                                     (|:| |val| (|Symbol|))
                                     (|:| |pred| (|List| (|Any|)))
                                     (|:| |bad| (|List| (|Any|))))
                           #1#))
          2 |l|)
         (EXIT |p|)))
       ('T (|error| "Can only attach predicates to generic symbol"))))))) 

(DEFUN |PATTERN;resetBadValues;2$;49| (|p| $)
  (PROG (#1=#:G582)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 46))
        (SEQ
         (QSETVELT
          (PROG2 (LETT #1# (QVELT |p| 1) |PATTERN;resetBadValues;2$;49|)
              (QCDR #1#)
            (|check_union| (QEQCAR #1# 4)
                           (|Record| (|:| |tag| (|SingleInteger|))
                                     (|:| |val| (|Symbol|))
                                     (|:| |pred| (|List| (|Any|)))
                                     (|:| |bad| (|List| (|Any|))))
                           #1#))
          3 NIL)
         (EXIT |p|)))
       ('T (|error| "Can only attach bad values to generic symbol"))))))) 

(DEFUN |PATTERN;addBadValue;$A$;50| (|p| |a| $)
  (PROG (#1=#:G594)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 46))
        (SEQ
         (COND
          ((NULL
            (SPADCALL |a|
                      (QVELT
                       (PROG2
                           (LETT #1# (QVELT |p| 1)
                                 . #2=(|PATTERN;addBadValue;$A$;50|))
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 4)
                                        (|Record| (|:| |tag| (|SingleInteger|))
                                                  (|:| |val| (|Symbol|))
                                                  (|:| |pred| (|List| (|Any|)))
                                                  (|:| |bad| (|List| (|Any|))))
                                        #1#))
                       3)
                      (QREFELT $ 107)))
           (QSETVELT
            (PROG2 (LETT #1# (QVELT |p| 1) . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 4)
                             (|Record| (|:| |tag| (|SingleInteger|))
                                       (|:| |val| (|Symbol|))
                                       (|:| |pred| (|List| (|Any|)))
                                       (|:| |bad| (|List| (|Any|))))
                             #1#))
            3
            (CONS |a|
                  (QVELT
                   (PROG2 (LETT #1# (QVELT |p| 1) . #2#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 4)
                                    (|Record| (|:| |tag| (|SingleInteger|))
                                              (|:| |val| (|Symbol|))
                                              (|:| |pred| (|List| (|Any|)))
                                              (|:| |bad| (|List| (|Any|))))
                                    #1#))
                   3)))))
         (EXIT |p|)))
       ('T (|error| "Can only attach bad values to generic symbol"))))))) 

(DEFUN |PATTERN;getBadValues;$L;51| (|p| $)
  (PROG (#1=#:G607)
    (RETURN
     (COND
      ((SPADCALL |p| (QREFELT $ 46))
       (QVELT
        (PROG2 (LETT #1# (QVELT |p| 1) |PATTERN;getBadValues;$L;51|)
            (QCDR #1#)
          (|check_union| (QEQCAR #1# 4)
                         (|Record| (|:| |tag| (|SingleInteger|))
                                   (|:| |val| (|Symbol|))
                                   (|:| |pred| (|List| (|Any|)))
                                   (|:| |bad| (|List| (|Any|))))
                         #1#))
        3))
      ('T (|error| "Not a generic symbol")))))) 

(DEFUN |PATTERN;SYM2O| (|p| $)
  (PROG (#1=#:G620 |i| #2=#:G619 |sy|)
    (RETURN
     (SEQ
      (LETT |sy| (SPADCALL (QVELT |p| 1) (QREFELT $ 110))
            . #3=(|PATTERN;SYM2O|))
      (EXIT
       (COND ((NULL (QVELT |p| 2)) |sy|)
             ('T
              (SPADCALL
               (SPADCALL " | " |sy|
                         (SPADCALL (ELT $ 111)
                                   (PROGN
                                    (LETT #2# NIL . #3#)
                                    (SEQ (LETT |i| 1 . #3#)
                                         (LETT #1# (LENGTH (QVELT |p| 2))
                                               . #3#)
                                         G190
                                         (COND
                                          ((|greater_SI| |i| #1#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (SPADCALL "f"
                                                            (SPADCALL |i|
                                                                      (QREFELT
                                                                       $ 112))
                                                            (QREFELT $ 113))
                                                  #2#)
                                                 . #3#)))
                                         (LETT |i| (|inc_SI| |i|) . #3#)
                                         (GO G190) G191 (EXIT (NREVERSE #2#))))
                                   (QREFELT $ 55))
                         (QREFELT $ 114))
               (QREFELT $ 115))))))))) 

(DEFUN |PATTERN;variables;$L;53| (|p| $)
  (PROG (#1=#:G637 #2=#:G626 |r| #3=#:G636 #4=#:G628 #5=#:G627 |q|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 25)) (SPADCALL (QREFELT $ 94)))
            ((SPADCALL |p| (QREFELT $ 46)) (LIST |p|))
            (#6='T
             (SEQ (LETT |q| (QVELT |p| 1) . #7=(|PATTERN;variables;$L;53|))
                  (EXIT
                   (COND ((QEQCAR |q| 0) (SPADCALL (QREFELT $ 94)))
                         ((QEQCAR |q| 2)
                          (SPADCALL
                           (QCAR
                            (PROG2 (LETT #5# |q| . #7#)
                                (QCDR #5#)
                              (|check_union| (QEQCAR #5# 2)
                                             (|Record| (|:| |val| $)
                                                       (|:| |exponent|
                                                            (|NonNegativeInteger|)))
                                             #5#)))
                           (QREFELT $ 116)))
                         ((QEQCAR |q| 3)
                          (SPADCALL
                           (SPADCALL
                            (QCAR
                             (PROG2 (LETT #4# |q| . #7#)
                                 (QCDR #4#)
                               (|check_union| (QEQCAR #4# 3)
                                              (|Record| (|:| |num| $)
                                                        (|:| |den| $))
                                              #4#)))
                            (QREFELT $ 116))
                           (SPADCALL
                            (QCDR
                             (PROG2 (LETT #4# |q| . #7#)
                                 (QCDR #4#)
                               (|check_union| (QEQCAR #4# 3)
                                              (|Record| (|:| |num| $)
                                                        (|:| |den| $))
                                              #4#)))
                            (QREFELT $ 116))
                           (QREFELT $ 117)))
                         ((QEQCAR |q| 1)
                          (SPADCALL
                           (PROGN
                            (LETT #3# NIL . #7#)
                            (SEQ (LETT |r| NIL . #7#)
                                 (LETT #1#
                                       (QVELT
                                        (PROG2 (LETT #2# |q| . #7#)
                                            (QCDR #2#)
                                          (|check_union| (QEQCAR #2# 1)
                                                         (|Record|
                                                          (|:| |tag|
                                                               (|SingleInteger|))
                                                          (|:| |op|
                                                               (|BasicOperator|))
                                                          (|:| |arg|
                                                               (|List| $)))
                                                         #2#))
                                        2)
                                       . #7#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |r| (CAR #1#) . #7#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #3#
                                         (CONS (SPADCALL |r| (QREFELT $ 116))
                                               #3#)
                                         . #7#)))
                                 (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                                 (EXIT (NREVERSE #3#))))
                           (QREFELT $ 118)))
                         (#6# (SPADCALL (QREFELT $ 94)))))))))))) 

(DEFUN |PATTERN;PAT2O| (|p| $)
  (PROG (#1=#:G643 |u| |l| #2=#:G665 |x| #3=#:G664 #4=#:G645 #5=#:G644
         #6=#:G646)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (SPADCALL (CDR |p|) (QREFELT $ 119)))
            ((QEQCAR |p| 4)
             (|PATTERN;SYM2O|
              (PROG2 (LETT #6# |p| . #7=(|PATTERN;PAT2O|))
                  (QCDR #6#)
                (|check_union| (QEQCAR #6# 4)
                               (|Record| (|:| |tag| (|SingleInteger|))
                                         (|:| |val| (|Symbol|))
                                         (|:| |pred| (|List| (|Any|)))
                                         (|:| |bad| (|List| (|Any|))))
                               #6#))
              $))
            ((QEQCAR |p| 2)
             (SPADCALL
              (SPADCALL
               (QCAR
                (PROG2 (LETT #5# |p| . #7#)
                    (QCDR #5#)
                  (|check_union| (QEQCAR #5# 2)
                                 (|Record| (|:| |val| $)
                                           (|:| |exponent|
                                                (|NonNegativeInteger|)))
                                 #5#)))
               (QREFELT $ 51))
              (SPADCALL
               (QCDR
                (PROG2 (LETT #5# |p| . #7#)
                    (QCDR #5#)
                  (|check_union| (QEQCAR #5# 2)
                                 (|Record| (|:| |val| $)
                                           (|:| |exponent|
                                                (|NonNegativeInteger|)))
                                 #5#)))
               (QREFELT $ 112))
              (QREFELT $ 120)))
            ((QEQCAR |p| 3)
             (SPADCALL
              (SPADCALL
               (QCAR
                (PROG2 (LETT #4# |p| . #7#)
                    (QCDR #4#)
                  (|check_union| (QEQCAR #4# 3)
                                 (|Record| (|:| |num| $) (|:| |den| $)) #4#)))
               (QREFELT $ 51))
              (SPADCALL
               (QCDR
                (PROG2 (LETT #4# |p| . #7#)
                    (QCDR #4#)
                  (|check_union| (QEQCAR #4# 3)
                                 (|Record| (|:| |num| $) (|:| |den| $)) #4#)))
               (QREFELT $ 51))
              (QREFELT $ 121)))
            (#8='T
             (COND
              ((EQL
                (QVELT
                 (PROG2 (LETT #1# |p| . #7#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 1)
                                  (|Record| (|:| |tag| (|SingleInteger|))
                                            (|:| |op| (|BasicOperator|))
                                            (|:| |arg| (|List| $)))
                                  #1#))
                 0)
                1)
               (|PATTERN;LPAT2O| (ELT $ 122)
                (QVELT
                 (PROG2 (LETT #1# |p| . #7#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 1)
                                  (|Record| (|:| |tag| (|SingleInteger|))
                                            (|:| |op| (|BasicOperator|))
                                            (|:| |arg| (|List| $)))
                                  #1#))
                 2)
                $))
              ((|eql_SI|
                (QVELT
                 (PROG2 (LETT #1# |p| . #7#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 1)
                                  (|Record| (|:| |tag| (|SingleInteger|))
                                            (|:| |op| (|BasicOperator|))
                                            (|:| |arg| (|List| $)))
                                  #1#))
                 0)
                (SPADCALL 2 (QREFELT $ 33)))
               (|PATTERN;LPAT2O| (ELT $ 123)
                (QVELT
                 (PROG2 (LETT #1# |p| . #7#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 1)
                                  (|Record| (|:| |tag| (|SingleInteger|))
                                            (|:| |op| (|BasicOperator|))
                                            (|:| |arg| (|List| $)))
                                  #1#))
                 2)
                $))
              ((|eql_SI|
                (QVELT
                 (PROG2 (LETT #1# |p| . #7#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 1)
                                  (|Record| (|:| |tag| (|SingleInteger|))
                                            (|:| |op| (|BasicOperator|))
                                            (|:| |arg| (|List| $)))
                                  #1#))
                 0)
                (SPADCALL 3 (QREFELT $ 33)))
               (SPADCALL
                (QVELT
                 (PROG2 (LETT #1# |p| . #7#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 1)
                                  (|Record| (|:| |tag| (|SingleInteger|))
                                            (|:| |op| (|BasicOperator|))
                                            (|:| |arg| (|List| $)))
                                  #1#))
                 2)
                (QREFELT $ 124)))
              ((|eql_SI|
                (QVELT
                 (PROG2 (LETT #1# |p| . #7#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 1)
                                  (|Record| (|:| |tag| (|SingleInteger|))
                                            (|:| |op| (|BasicOperator|))
                                            (|:| |arg| (|List| $)))
                                  #1#))
                 0)
                (SPADCALL 4 (QREFELT $ 33)))
               (SPADCALL 0 (QREFELT $ 125)))
              ((|eql_SI|
                (QVELT
                 (PROG2 (LETT #1# |p| . #7#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 1)
                                  (|Record| (|:| |tag| (|SingleInteger|))
                                            (|:| |op| (|BasicOperator|))
                                            (|:| |arg| (|List| $)))
                                  #1#))
                 0)
                (SPADCALL 5 (QREFELT $ 33)))
               (SPADCALL 1 (QREFELT $ 125)))
              (#8#
               (SEQ
                (LETT |l|
                      (PROGN
                       (LETT #3# NIL . #7#)
                       (SEQ (LETT |x| NIL . #7#)
                            (LETT #2#
                                  (QVELT
                                   (PROG2 (LETT #1# |p| . #7#)
                                       (QCDR #1#)
                                     (|check_union| (QEQCAR #1# 1)
                                                    (|Record|
                                                     (|:| |tag|
                                                          (|SingleInteger|))
                                                     (|:| |op|
                                                          (|BasicOperator|))
                                                     (|:| |arg| (|List| $)))
                                                    #1#))
                                   2)
                                  . #7#)
                            G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |x| (CAR #2#) . #7#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3#
                                    (CONS (SPADCALL |x| (QREFELT $ 51)) #3#)
                                    . #7#)))
                            (LETT #2# (CDR #2#) . #7#) (GO G190) G191
                            (EXIT (NREVERSE #3#))))
                      . #7#)
                (LETT |u|
                      (SPADCALL
                       (QVELT
                        (PROG2 (LETT #1# |p| . #7#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 1)
                                         (|Record|
                                          (|:| |tag| (|SingleInteger|))
                                          (|:| |op| (|BasicOperator|))
                                          (|:| |arg| (|List| $)))
                                         #1#))
                        1)
                       (QREFELT $ 128))
                      . #7#)
                (EXIT
                 (COND
                  ((QEQCAR |u| 1)
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (QVELT
                       (PROG2 (LETT #1# |p| . #7#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 1)
                                        (|Record| (|:| |tag| (|SingleInteger|))
                                                  (|:| |op| (|BasicOperator|))
                                                  (|:| |arg| (|List| $)))
                                        #1#))
                       1)
                      (QREFELT $ 129))
                     (QREFELT $ 110))
                    |l| (QREFELT $ 130)))
                  (#8# (SPADCALL |l| (QCDR |u|)))))))))))))) 

(DEFUN |PATTERN;patcopy| (|p| $)
  (PROG (#1=#:G672 #2=#:G673 #3=#:G681 #4=#:G671 |x| #5=#:G680 #6=#:G674)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (CONS 0 (CDR |p|)))
            ((QEQCAR |p| 4)
             (CONS 4
                   (VECTOR
                    (QVELT
                     (PROG2 (LETT #6# |p| . #7=(|PATTERN;patcopy|))
                         (QCDR #6#)
                       (|check_union| (QEQCAR #6# 4)
                                      (|Record| (|:| |tag| (|SingleInteger|))
                                                (|:| |val| (|Symbol|))
                                                (|:| |pred| (|List| (|Any|)))
                                                (|:| |bad| (|List| (|Any|))))
                                      #6#))
                     0)
                    (QVELT
                     (PROG2 (LETT #6# |p| . #7#)
                         (QCDR #6#)
                       (|check_union| (QEQCAR #6# 4)
                                      (|Record| (|:| |tag| (|SingleInteger|))
                                                (|:| |val| (|Symbol|))
                                                (|:| |pred| (|List| (|Any|)))
                                                (|:| |bad| (|List| (|Any|))))
                                      #6#))
                     1)
                    (SPADCALL
                     (QVELT
                      (PROG2 (LETT #6# |p| . #7#)
                          (QCDR #6#)
                        (|check_union| (QEQCAR #6# 4)
                                       (|Record| (|:| |tag| (|SingleInteger|))
                                                 (|:| |val| (|Symbol|))
                                                 (|:| |pred| (|List| (|Any|)))
                                                 (|:| |bad| (|List| (|Any|))))
                                       #6#))
                      2)
                     (QREFELT $ 131))
                    (SPADCALL
                     (QVELT
                      (PROG2 (LETT #6# |p| . #7#)
                          (QCDR #6#)
                        (|check_union| (QEQCAR #6# 4)
                                       (|Record| (|:| |tag| (|SingleInteger|))
                                                 (|:| |val| (|Symbol|))
                                                 (|:| |pred| (|List| (|Any|)))
                                                 (|:| |bad| (|List| (|Any|))))
                                       #6#))
                      3)
                     (QREFELT $ 131)))))
            ((QEQCAR |p| 1)
             (CONS 1
                   (VECTOR
                    (QVELT
                     (PROG2 (LETT #4# |p| . #7#)
                         (QCDR #4#)
                       (|check_union| (QEQCAR #4# 1)
                                      (|Record| (|:| |tag| (|SingleInteger|))
                                                (|:| |op| (|BasicOperator|))
                                                (|:| |arg| (|List| $)))
                                      #4#))
                     0)
                    (QVELT
                     (PROG2 (LETT #4# |p| . #7#)
                         (QCDR #4#)
                       (|check_union| (QEQCAR #4# 1)
                                      (|Record| (|:| |tag| (|SingleInteger|))
                                                (|:| |op| (|BasicOperator|))
                                                (|:| |arg| (|List| $)))
                                      #4#))
                     1)
                    (PROGN
                     (LETT #5# NIL . #7#)
                     (SEQ (LETT |x| NIL . #7#)
                          (LETT #3#
                                (QVELT
                                 (PROG2 (LETT #4# |p| . #7#)
                                     (QCDR #4#)
                                   (|check_union| (QEQCAR #4# 1)
                                                  (|Record|
                                                   (|:| |tag|
                                                        (|SingleInteger|))
                                                   (|:| |op| (|BasicOperator|))
                                                   (|:| |arg| (|List| $)))
                                                  #4#))
                                 2)
                                . #7#)
                          G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |x| (CAR #3#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5# (CONS (SPADCALL |x| (QREFELT $ 61)) #5#)
                                  . #7#)))
                          (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))))
            ((QEQCAR |p| 3)
             (CONS 3
                   (CONS
                    (SPADCALL
                     (QCAR
                      (PROG2 (LETT #2# |p| . #7#)
                          (QCDR #2#)
                        (|check_union| (QEQCAR #2# 3)
                                       (|Record| (|:| |num| $) (|:| |den| $))
                                       #2#)))
                     (QREFELT $ 61))
                    (SPADCALL
                     (QCDR
                      (PROG2 (LETT #2# |p| . #7#)
                          (QCDR #2#)
                        (|check_union| (QEQCAR #2# 3)
                                       (|Record| (|:| |num| $) (|:| |den| $))
                                       #2#)))
                     (QREFELT $ 61)))))
            ('T
             (CONS 2
                   (CONS
                    (SPADCALL
                     (QCAR
                      (PROG2 (LETT #1# |p| . #7#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 2)
                                       (|Record| (|:| |val| $)
                                                 (|:| |exponent|
                                                      (|NonNegativeInteger|)))
                                       #1#)))
                     (QREFELT $ 61))
                    (QCDR
                     (PROG2 (LETT #1# |p| . #7#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 2)
                                      (|Record| (|:| |val| $)
                                                (|:| |exponent|
                                                     (|NonNegativeInteger|)))
                                      #1#))))))))))) 

(DEFUN |PATTERN;pateq?| (|p1| |p2| $)
  (PROG (#1=#:G688 #2=#:G687 #3=#:G690 #4=#:G689)
    (RETURN
     (COND
      ((QEQCAR |p1| 0)
       (COND ((QEQCAR |p2| 0) (SPADCALL (CDR |p1|) (CDR |p2|) (QREFELT $ 132)))
             (#5='T 'NIL)))
      ((QEQCAR |p1| 3)
       (COND
        ((QEQCAR |p2| 3)
         (COND
          ((SPADCALL
            (QCAR
             (PROG2 (LETT #4# |p1| . #6=(|PATTERN;pateq?|))
                 (QCDR #4#)
               (|check_union| (QEQCAR #4# 3)
                              (|Record| (|:| |num| $) (|:| |den| $)) #4#)))
            (QCAR (CDR |p2|)) (QREFELT $ 78))
           (SPADCALL
            (QCDR
             (PROG2 (LETT #4# |p1| . #6#)
                 (QCDR #4#)
               (|check_union| (QEQCAR #4# 3)
                              (|Record| (|:| |num| $) (|:| |den| $)) #4#)))
            (QCDR (CDR |p2|)) (QREFELT $ 78)))
          (#5# 'NIL)))
        (#5# 'NIL)))
      ((QEQCAR |p1| 4)
       (COND
        ((QEQCAR |p2| 4)
         (COND
          ((EQUAL
            (QVELT
             (PROG2 (LETT #3# |p1| . #6#)
                 (QCDR #3#)
               (|check_union| (QEQCAR #3# 4)
                              (|Record| (|:| |tag| (|SingleInteger|))
                                        (|:| |val| (|Symbol|))
                                        (|:| |pred| (|List| (|Any|)))
                                        (|:| |bad| (|List| (|Any|))))
                              #3#))
             1)
            (QVELT (CDR |p2|) 1))
           (COND
            ((SPADCALL
              (SPADCALL
               (QVELT
                (PROG2 (LETT #3# |p1| . #6#)
                    (QCDR #3#)
                  (|check_union| (QEQCAR #3# 4)
                                 (|Record| (|:| |tag| (|SingleInteger|))
                                           (|:| |val| (|Symbol|))
                                           (|:| |pred| (|List| (|Any|)))
                                           (|:| |bad| (|List| (|Any|))))
                                 #3#))
                2)
               (QREFELT $ 134))
              (SPADCALL (QVELT (CDR |p2|) 2) (QREFELT $ 134)) (QREFELT $ 135))
             (SPADCALL
              (SPADCALL
               (QVELT
                (PROG2 (LETT #3# |p1| . #6#)
                    (QCDR #3#)
                  (|check_union| (QEQCAR #3# 4)
                                 (|Record| (|:| |tag| (|SingleInteger|))
                                           (|:| |val| (|Symbol|))
                                           (|:| |pred| (|List| (|Any|)))
                                           (|:| |bad| (|List| (|Any|))))
                                 #3#))
                3)
               (QREFELT $ 134))
              (SPADCALL (QVELT (CDR |p2|) 3) (QREFELT $ 134)) (QREFELT $ 135)))
            (#5# 'NIL)))
          (#5# 'NIL)))
        (#5# 'NIL)))
      ((QEQCAR |p1| 1)
       (COND
        ((QEQCAR |p2| 1)
         (COND
          ((EQL
            (QVELT
             (PROG2 (LETT #2# |p1| . #6#)
                 (QCDR #2#)
               (|check_union| (QEQCAR #2# 1)
                              (|Record| (|:| |tag| (|SingleInteger|))
                                        (|:| |op| (|BasicOperator|))
                                        (|:| |arg| (|List| $)))
                              #2#))
             0)
            (QVELT (CDR |p2|) 0))
           (COND
            ((SPADCALL
              (QVELT
               (PROG2 (LETT #2# |p1| . #6#)
                   (QCDR #2#)
                 (|check_union| (QEQCAR #2# 1)
                                (|Record| (|:| |tag| (|SingleInteger|))
                                          (|:| |op| (|BasicOperator|))
                                          (|:| |arg| (|List| $)))
                                #2#))
               1)
              (QVELT (CDR |p2|) 1) (QREFELT $ 104))
             (SPADCALL
              (QVELT
               (PROG2 (LETT #2# |p1| . #6#)
                   (QCDR #2#)
                 (|check_union| (QEQCAR #2# 1)
                                (|Record| (|:| |tag| (|SingleInteger|))
                                          (|:| |op| (|BasicOperator|))
                                          (|:| |arg| (|List| $)))
                                #2#))
               2)
              (QVELT (CDR |p2|) 2) (QREFELT $ 136)))
            (#5# 'NIL)))
          (#5# 'NIL)))
        (#5# 'NIL)))
      ((QEQCAR |p2| 2)
       (COND
        ((EQL
          (QCDR
           (PROG2 (LETT #1# |p1| . #6#)
               (QCDR #1#)
             (|check_union| (QEQCAR #1# 2)
                            (|Record| (|:| |val| $)
                                      (|:| |exponent| (|NonNegativeInteger|)))
                            #1#)))
          (QCDR (CDR |p2|)))
         (SPADCALL
          (QCAR
           (PROG2 (LETT #1# |p1| . #6#)
               (QCDR #1#)
             (|check_union| (QEQCAR #1# 2)
                            (|Record| (|:| |val| $)
                                      (|:| |exponent| (|NonNegativeInteger|)))
                            #1#)))
          (QCAR (CDR |p2|)) (QREFELT $ 78)))
        (#5# 'NIL)))
      (#5# 'NIL))))) 

(DEFUN |PATTERN;retractIfCan;$U;57| (|p| $)
  (PROG (#1=#:G710)
    (RETURN
     (COND
      ((SPADCALL |p| (QREFELT $ 29))
       (CONS 0
             (QVELT
              (PROG2 (LETT #1# (QVELT |p| 1) |PATTERN;retractIfCan;$U;57|)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 4)
                               (|Record| (|:| |tag| (|SingleInteger|))
                                         (|:| |val| (|Symbol|))
                                         (|:| |pred| (|List| (|Any|)))
                                         (|:| |bad| (|List| (|Any|))))
                               #1#))
              1)))
      ('T (CONS 1 "failed")))))) 

(DEFUN |PATTERN;mkrsy| (|t| |c?| |o?| |m?| $)
  (PROG (|opt| |mlt|)
    (RETURN
     (SEQ
      (COND (|c?| (VECTOR 0 |t| NIL NIL))
            (#1='T
             (SEQ (LETT |mlt| (COND (|m?| 2) (#1# 0)) . #2=(|PATTERN;mkrsy|))
                  (LETT |opt| (COND (|o?| 4) (#1# 0)) . #2#)
                  (EXIT
                   (VECTOR (|or_SI| (|or_SI| 1 |mlt|) |opt|) |t| NIL
                           NIL))))))))) 

(DEFUN |PATTERN;patternVariable;S3B$;59| (|sy| |c?| |o?| |m?| $)
  (PROG (|rsy|)
    (RETURN
     (SEQ
      (LETT |rsy| (|PATTERN;mkrsy| |sy| |c?| |o?| |m?| $)
            |PATTERN;patternVariable;S3B$;59|)
      (EXIT (|PATTERN;mkPat| (ZEROP (QVELT |rsy| 0)) (CONS 4 |rsy|) 0 $)))))) 

(DECLAIM (NOTINLINE |Pattern;|)) 

(DEFUN |Pattern| (#1=#:G730)
  (PROG ()
    (RETURN
     (PROG (#2=#:G731)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|Pattern|)
                                           '|domainEqualList|)
                . #3=(|Pattern|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Pattern;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Pattern|))))))))))) 

(DEFUN |Pattern;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Pattern|))
      (LETT |dv$| (LIST '|Pattern| DV$1) . #1#)
      (LETT $ (GETREFV 141) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Pattern| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Record| (|:| |cons?| (|Boolean|))
                          (|:| |pat|
                               (|Union| (|:| |ret| |#1|)
                                        (|:| |ker|
                                             (|Record|
                                              (|:| |tag| (|SingleInteger|))
                                              (|:| |op| (|BasicOperator|))
                                              (|:| |arg| (|List| $))))
                                        (|:| |exp|
                                             (|Record| (|:| |val| $)
                                                       (|:| |exponent|
                                                            (|NonNegativeInteger|))))
                                        (|:| |qot|
                                             (|Record| (|:| |num| $)
                                                       (|:| |den| $)))
                                        (|:| |sym|
                                             (|Record|
                                              (|:| |tag| (|SingleInteger|))
                                              (|:| |val| (|Symbol|))
                                              (|:| |pred| (|List| (|Any|)))
                                              (|:| |bad| (|List| (|Any|)))))))
                          (|:| |lev| (|NonNegativeInteger|))
                          (|:| |topvar| (|List| (|Symbol|)))
                          (|:| |toppred| (|Any|))))
      (QSETREFV $ 12 (SPADCALL (SPADCALL (QREFELT $ 9)) (QREFELT $ 11)))
      (QSETREFV $ 17 (SPADCALL 0 (QREFELT $ 16)))
      (COND
       ((|HasCategory| |#1| '(|Monoid|))
        (QSETREFV $ 72
                  (CONS #'|makeSpadConstant|
                        (LIST (|dispatchFunction| |PATTERN;One;$;38|) $ 72))))
       ('T
        (QSETREFV $ 72
                  (CONS #'|makeSpadConstant|
                        (LIST (|dispatchFunction| |PATTERN;One;$;39|) $ 72)))))
      (COND
       ((|HasCategory| |#1| '(|AbelianMonoid|))
        (QSETREFV $ 88
                  (CONS #'|makeSpadConstant|
                        (LIST (|dispatchFunction| |PATTERN;Zero;$;40|) $ 88))))
       ('T
        (QSETREFV $ 88
                  (CONS #'|makeSpadConstant|
                        (LIST (|dispatchFunction| |PATTERN;Zero;$;41|) $
                              88)))))
      $)))) 

(MAKEPROP '|Pattern| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Symbol|)
              (0 . |new|) (|BasicOperator|) (4 . |operator|) '|dummy| (|Any|)
              (|Integer|) (|AnyFunctions1| 14) (9 . |coerce|) '|nopred|
              |PATTERN;coerce;R$;1| (|Boolean|) |PATTERN;hasTopPredicate?;$B;3|
              (|Record| (|:| |var| 23) (|:| |pred| 13))
              |PATTERN;topPredicate;$R;4| (|List| 8)
              |PATTERN;setTopPredicate;$LA$;5| |PATTERN;constant?;$B;6|
              (|NonNegativeInteger|) |PATTERN;depth;$Nni;7| |PATTERN;inR?;$B;8|
              |PATTERN;symbol?;$B;9| (|Union| 57 '"failed")
              |PATTERN;isPlus;$U;10| (|SingleInteger|) (14 . |coerce|)
              |PATTERN;isTimes;$U;11| |PATTERN;isList;$U;12|
              (|Record| (|:| |val| $) (|:| |exponent| 26))
              (|Union| 36 '"failed") |PATTERN;isExpt;$U;13|
              (|Record| (|:| |num| $) (|:| |den| $)) (|Union| 39 '"failed")
              |PATTERN;isQuotient;$U;14| (|List| 13) |PATTERN;predicates;$L;47|
              |PATTERN;hasPredicate?;$B;15| |PATTERN;quoted?;$B;16|
              |PATTERN;generic?;$B;17| |PATTERN;multiple?;$B;18|
              |PATTERN;optional?;$B;19| (19 . ~=) (|OutputForm|)
              |PATTERN;coerce;$Of;21| |PATTERN;^;3$;22| (|Mapping| 50 50 50)
              (|List| 50) (25 . |reduce|) |PATTERN;retract;$R;24| (|List| $)
              |PATTERN;convert;L$;25| (|Union| 6 '"failed")
              |PATTERN;retractIfCan;$U;26| |PATTERN;copy;2$;29|
              |PATTERN;setPredicates;$L$;48| |PATTERN;withPredicates;$L$;27|
              |PATTERN;patternVariable;S3B$;59| |PATTERN;coerce;S$;28|
              (|List| $$) (31 . |rest|) (36 . |empty?|) (41 . |first|)
              (46 . |reverse|) |PATTERN;optpair;LU;30| (51 . |One|)
              (55 . |max|) (|Mapping| 26 26 26) (|List| 26) (61 . |reduce|)
              (68 . =) |PATTERN;=;2$B;32| (74 . |second|)
              (|Record| (|:| |val| $) (|:| |exponent| $))
              (|Union| 80 '"failed") |PATTERN;isPower;$U;33| (|Mapping| 19 $$)
              (79 . |every?|) (85 . |is?|) (91 . |#|) (96 . |last|)
              (101 . |Zero|) |PATTERN;elt;BoL$;35|
              (|Record| (|:| |op| 10) (|:| |arg| 57)) (|Union| 90 '"failed")
              |PATTERN;isOp;$U;36| (105 . |One|) (109 . |empty|) (113 . |Zero|)
              (117 . >) |PATTERN;^;$Nni$;42| |PATTERN;/;3$;43| (123 . |concat|)
              (129 . |concat|) (135 . |concat|) |PATTERN;+;3$;44|
              |PATTERN;*;3$;45| (141 . =) |PATTERN;isOp;$BoU;46|
              |PATTERN;resetBadValues;2$;49| (147 . |member?|)
              |PATTERN;addBadValue;$A$;50| |PATTERN;getBadValues;$L;51|
              (153 . |coerce|) (158 . |and|) (164 . |coerce|) (169 . |sub|)
              (175 . |infix|) (182 . |paren|) |PATTERN;variables;$L;53|
              (187 . |concat!|) (193 . |concat|) (198 . |coerce|) (203 . ^)
              (209 . /) (215 . +) (221 . *) (227 . |coerce|) (232 . |coerce|)
              (|Mapping| 50 54) (|Union| 126 '"failed") (237 . |display|)
              (242 . |name|) (247 . |prefix|) (253 . |copy|) (258 . =)
              (|Set| 13) (264 . |set|) (269 . =) (275 . =)
              (|Union| 8 '"failed") |PATTERN;retractIfCan;$U;57| (|HashState|)
              (|String|))
           '#(~= 281 |withPredicates| 287 |variables| 293 |topPredicate| 298
              |symbol?| 303 |setTopPredicate| 308 |setPredicates| 315
              |retractIfCan| 321 |retract| 331 |resetBadValues| 341 |quoted?|
              346 |predicates| 351 |patternVariable| 356 |optpair| 364
              |optional?| 369 |multiple?| 374 |latex| 379 |isTimes| 384
              |isQuotient| 389 |isPower| 394 |isPlus| 399 |isOp| 404 |isList|
              415 |isExpt| 420 |inR?| 425 |hashUpdate!| 430 |hash| 436
              |hasTopPredicate?| 441 |hasPredicate?| 446 |getBadValues| 451
              |generic?| 456 |elt| 461 |depth| 467 |copy| 472 |convert| 477
              |constant?| 482 |coerce| 487 |addBadValue| 502 ^ 508 |Zero| 520
              |One| 524 = 528 / 534 + 540 * 546)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0))
                 (CONS
                  '#(|SetCategory&| |BasicType&| |RetractableTo&|
                     |RetractableTo&| NIL)
                  (CONS
                   '#((|SetCategory|) (|BasicType|) (|RetractableTo| 8)
                      (|RetractableTo| 6) (|CoercibleTo| 50))
                   (|makeByteWordVec2| 140
                                       '(0 8 0 9 1 10 0 8 11 1 15 13 14 16 1 32
                                         0 14 33 2 32 19 0 0 49 2 54 50 53 0 55
                                         1 66 0 0 67 1 66 19 0 68 1 66 2 0 69 1
                                         66 0 0 70 0 0 0 72 2 26 0 0 0 73 3 75
                                         26 74 0 26 76 2 23 19 0 0 77 1 66 2 0
                                         79 2 66 19 83 0 84 2 10 19 0 8 85 1 66
                                         26 0 86 1 66 2 0 87 0 0 0 88 0 6 0 93
                                         0 66 0 94 0 6 0 95 2 26 19 0 0 96 2 66
                                         0 0 0 99 2 66 0 0 2 100 2 66 0 2 0 101
                                         2 10 19 0 0 104 2 42 19 13 0 107 1 8
                                         50 0 110 2 50 0 0 0 111 1 26 50 0 112
                                         2 50 0 0 0 113 3 50 0 0 0 0 114 1 50 0
                                         0 115 2 66 0 0 0 117 1 66 0 57 118 1 6
                                         50 0 119 2 50 0 0 0 120 2 50 0 0 0 121
                                         2 50 0 0 0 122 2 50 0 0 0 123 1 66 50
                                         0 124 1 14 50 0 125 1 10 127 0 128 1
                                         10 8 0 129 2 50 0 0 57 130 1 42 0 0
                                         131 2 6 19 0 0 132 1 133 0 42 134 2
                                         133 19 0 0 135 2 66 19 0 0 136 2 0 19
                                         0 0 1 2 0 0 0 42 63 1 0 57 0 116 1 0
                                         21 0 22 1 0 19 0 29 3 0 0 0 23 13 24 2
                                         0 0 0 42 62 1 0 137 0 138 1 0 59 0 60
                                         1 0 8 0 1 1 0 6 0 56 1 0 0 0 106 1 0
                                         19 0 45 1 0 42 0 43 4 0 0 8 19 19 19
                                         64 1 0 30 57 71 1 0 19 0 48 1 0 19 0
                                         47 1 0 140 0 1 1 0 30 0 34 1 0 40 0 41
                                         1 0 81 0 82 1 0 30 0 31 1 0 91 0 92 2
                                         0 30 0 10 105 1 0 30 0 35 1 0 37 0 38
                                         1 0 19 0 28 2 0 139 139 0 1 1 0 32 0 1
                                         1 0 19 0 20 1 0 19 0 44 1 0 42 0 109 1
                                         0 19 0 46 2 0 0 10 57 89 1 0 26 0 27 1
                                         0 0 0 61 1 0 0 57 58 1 0 19 0 25 1 0 0
                                         8 65 1 0 0 6 18 1 0 50 0 51 2 0 0 0 13
                                         108 2 0 0 0 0 52 2 0 0 0 26 97 0 0 0
                                         88 0 0 0 72 2 0 19 0 0 78 2 0 0 0 0 98
                                         2 0 0 0 0 102 2 0 0 0 0 103)))))
           '|lookupComplete|)) 
