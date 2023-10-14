
(/VERSIONCHECK 2) 

(PUT '|PBWLB;One;$;1| '|SPADreplace| '(XLAM NIL NIL)) 

(DEFUN |PBWLB;One;$;1| ($) NIL) 

(DEFUN |PBWLB;=;2$B;2| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 10))) 

(DEFUN |PBWLB;varList;$L;3| (|x| $)
  (PROG (|le| #1=#:G133 #2=#:G132 #3=#:G134 #4=#:G136 |l|)
    (RETURN
     (SEQ
      (COND ((NULL |x|) NIL)
            (#5='T
             (LETT |le|
                   (PROGN
                    (LETT #1# NIL . #6=(|PBWLB;varList;$L;3|))
                    (SEQ (LETT |l| NIL . #6#) (LETT #4# |x| . #6#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |l| (CAR #4#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #3# (SPADCALL |l| (QREFELT $ 14)) . #6#)
                            (COND
                             (#1#
                              (LETT #2# (SPADCALL #2# #3# (QREFELT $ 15))
                                    . #6#))
                             ('T
                              (PROGN
                               (LETT #2# #3# . #6#)
                               (LETT #1# 'T . #6#)))))))
                         (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                    (COND (#1# #2#) (#5# (|IdentityError| '|setUnion|))))
                   . #6#))))))) 

(PUT '|PBWLB;first;$Lw;4| '|SPADreplace| '|SPADfirst|) 

(DEFUN |PBWLB;first;$Lw;4| (|x| $) (|SPADfirst| |x|)) 

(PUT '|PBWLB;rest;2$;5| '|SPADreplace| 'CDR) 

(DEFUN |PBWLB;rest;2$;5| (|x| $) (CDR |x|)) 

(DEFUN |PBWLB;coerce;VarSet$;6| (|v| $) (LIST (SPADCALL |v| (QREFELT $ 19)))) 

(PUT '|PBWLB;coerce;Lw$;7| '|SPADreplace| 'LIST) 

(DEFUN |PBWLB;coerce;Lw$;7| (|l| $) (LIST |l|)) 

(PUT '|PBWLB;listOfTerms;$L;8| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |PBWLB;listOfTerms;$L;8| (|x| $) |x|) 

(DEFUN |PBWLB;coerce;$Ofm;9| (|x| $)
  (COND ((NULL |x|) (|spadConstant| $ 25))
        ('T
         (SPADCALL (SPADCALL (|SPADfirst| |x|) (QREFELT $ 26))
                   (SPADCALL (CDR |x|) (QREFELT $ 27)) (QREFELT $ 28))))) 

(DEFUN |PBWLB;coerce;$Of;10| (|x| $)
  (PROG (#1=#:G148 |l| #2=#:G147)
    (RETURN
     (SEQ
      (COND ((NULL |x|) (SPADCALL 1 (QREFELT $ 31)))
            ('T
             (SPADCALL (ELT $ 32)
                       (PROGN
                        (LETT #2# NIL . #3=(|PBWLB;coerce;$Of;10|))
                        (SEQ (LETT |l| NIL . #3#) (LETT #1# |x| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |l| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (SPADCALL |l| (QREFELT $ 33)) #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 36)))))))) 

(DEFUN |PBWLB;retractable?;$B;11| (|x| $)
  (COND ((NULL |x|) 'NIL) ('T (NULL (CDR |x|))))) 

(DEFUN |PBWLB;retract;$Lw;12| (|x| $)
  (COND
   ((SPADCALL (LENGTH |x|) 1 (QREFELT $ 40))
    (|error| "cannot convert to Lyndon word"))
   ('T (|SPADfirst| |x|)))) 

(DEFUN |PBWLB;retractIfCan;$U;13| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 38)) (CONS 0 (|SPADfirst| |x|)))
        ('T (CONS 1 "failed")))) 

(DEFUN |PBWLB;length;$Nni;14| (|x| $)
  (PROG (#1=#:G163 |n| #2=#:G161 #3=#:G160 #4=#:G162 #5=#:G166 |l|)
    (RETURN
     (SEQ
      (LETT |n|
            (PROGN
             (LETT #2# NIL . #6=(|PBWLB;length;$Nni;14|))
             (SEQ (LETT |l| NIL . #6#) (LETT #5# |x| . #6#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (SPADCALL |l| (QREFELT $ 45)) . #6#)
                     (COND (#2# (LETT #3# (+ #3# #4#) . #6#))
                           ('T
                            (PROGN
                             (LETT #3# #4# . #6#)
                             (LETT #2# 'T . #6#)))))))
                  (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
             (COND (#2# #3#) ('T 0)))
            . #6#)
      (EXIT
       (PROG1 (LETT #1# |n| . #6#)
         (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))))) 

(DEFUN |PBWLB;recursif| (|x| |y| $)
  (COND ((NULL |y|) 'NIL) ((NULL |x|) 'T)
        (#1='T
         (COND
          ((SPADCALL (|SPADfirst| |x|) (|SPADfirst| |y|) (QREFELT $ 47))
           (|PBWLB;recursif| (SPADCALL |x| (QREFELT $ 18))
            (SPADCALL |y| (QREFELT $ 18)) $))
          (#1#
           (SPADCALL (|SPADfirst| |x|) (|SPADfirst| |y|) (QREFELT $ 48))))))) 

(DEFUN |PBWLB;<;2$B;16| (|x| |y| $)
  (PROG (|ly| |lx|)
    (RETURN
     (SEQ (LETT |lx| (SPADCALL |x| (QREFELT $ 46)) . #1=(|PBWLB;<;2$B;16|))
          (LETT |ly| (SPADCALL |y| (QREFELT $ 46)) . #1#)
          (EXIT
           (COND ((EQL |lx| |ly|) (|PBWLB;recursif| |x| |y| $))
                 ('T (< |lx| |ly|)))))))) 

(DECLAIM (NOTINLINE |PoincareBirkhoffWittLyndonBasis;|)) 

(DEFUN |PoincareBirkhoffWittLyndonBasis| (#1=#:G171)
  (PROG ()
    (RETURN
     (PROG (#2=#:G172)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|PoincareBirkhoffWittLyndonBasis|)
                                           '|domainEqualList|)
                . #3=(|PoincareBirkhoffWittLyndonBasis|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|PoincareBirkhoffWittLyndonBasis;| #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|PoincareBirkhoffWittLyndonBasis|))))))))))) 

(DEFUN |PoincareBirkhoffWittLyndonBasis;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PoincareBirkhoffWittLyndonBasis|))
      (LETT |dv$| (LIST '|PoincareBirkhoffWittLyndonBasis| DV$1) . #1#)
      (LETT $ (GETREFV 53) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PoincareBirkhoffWittLyndonBasis|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|List| (|LyndonWord| |#1|)))
      $)))) 

(MAKEPROP '|PoincareBirkhoffWittLyndonBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |PBWLB;One;$;1|) $))
              (|Boolean|) (0 . =) |PBWLB;=;2$B;2| (|List| 6) (|LyndonWord| 6)
              (6 . |varList|) (11 . |setUnion|) |PBWLB;varList;$L;3|
              |PBWLB;first;$Lw;4| |PBWLB;rest;2$;5| (17 . |coerce|)
              |PBWLB;coerce;VarSet$;6| |PBWLB;coerce;Lw$;7| (|List| 13)
              |PBWLB;listOfTerms;$L;8| (|OrderedFreeMonoid| 6) (22 . |One|)
              (26 . |coerce|) |PBWLB;coerce;$Ofm;9| (31 . *) (|Integer|)
              (|OutputForm|) (37 . |outputForm|) (42 . *) (48 . |coerce|)
              (|Mapping| 30 30 30) (|List| 30) (53 . |reduce|)
              |PBWLB;coerce;$Of;10| |PBWLB;retractable?;$B;11|
              (|NonNegativeInteger|) (59 . ~=) |PBWLB;retract;$Lw;12|
              (|Union| 13 '"failed") |PBWLB;retractIfCan;$U;13|
              (|PositiveInteger|) (65 . |length|) |PBWLB;length;$Nni;14|
              (70 . =) (76 . |lexico|) |PBWLB;<;2$B;16| (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 82 |varList| 88 |smaller?| 93 |retractable?| 99 |retractIfCan|
              104 |retract| 109 |rest| 114 |min| 119 |max| 125 |listOfTerms|
              131 |length| 136 |latex| 141 |hashUpdate!| 146 |hash| 152 |first|
              157 |coerce| 162 |One| 182 >= 186 > 192 = 198 <= 204 < 210)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL |SetCategory&| |BasicType&|
                     |RetractableTo&| |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|) (|SetCategory|)
                      (|BasicType|) (|RetractableTo| (|LyndonWord| 6))
                      (|PartialOrder|) (|CoercibleTo| 30))
                   (|makeByteWordVec2| 52
                                       '(2 7 9 0 0 10 1 13 12 0 14 2 12 0 0 0
                                         15 1 13 0 6 19 0 24 0 25 1 13 24 0 26
                                         2 24 0 0 0 28 1 30 0 29 31 2 30 0 0 0
                                         32 1 13 30 0 33 2 35 30 34 0 36 2 39 9
                                         0 0 40 1 13 44 0 45 2 13 9 0 0 47 2 13
                                         9 0 0 48 2 0 9 0 0 1 1 0 12 0 16 2 0 9
                                         0 0 1 1 0 9 0 38 1 0 42 0 43 1 0 13 0
                                         41 1 0 0 0 18 2 0 0 0 0 1 2 0 0 0 0 1
                                         1 0 22 0 23 1 0 39 0 46 1 0 51 0 1 2 0
                                         50 50 0 1 1 0 52 0 1 1 0 13 0 17 1 0 0
                                         6 20 1 0 24 0 27 1 0 0 13 21 1 0 30 0
                                         37 0 0 0 8 2 0 9 0 0 1 2 0 9 0 0 1 2 0
                                         9 0 0 11 2 0 9 0 0 1 2 0 9 0 0 49)))))
           '|lookupComplete|)) 
