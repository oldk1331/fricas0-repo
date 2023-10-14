
(SDEFUN |MAGMA;=;2$B;1| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((QEQCAR |x| 0)
          (COND
           ((QEQCAR |y| 0) (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 10)))
           (#1='T 'NIL)))
         ((QEQCAR |y| 1) (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 11)))
         (#1# 'NIL))) 

(SDEFUN |MAGMA;varList;$L;2| ((|x| $) ($ |List| |VarSet|))
        (SPROG ((|lv| (|List| |VarSet|)))
               (SEQ
                (COND ((QEQCAR |x| 0) (LIST (QCDR |x|)))
                      ('T
                       (SEQ
                        (LETT |lv|
                              (SPADCALL
                               (SPADCALL (QCAR (QCDR |x|)) (QREFELT $ 14))
                               (SPADCALL (QCDR (QCDR |x|)) (QREFELT $ 14))
                               (QREFELT $ 15))
                              |MAGMA;varList;$L;2|)
                        (EXIT (SPADCALL |lv| (QREFELT $ 16))))))))) 

(SDEFUN |MAGMA;left;2$;3| ((|x| $) ($ $))
        (COND ((QEQCAR |x| 0) (|error| "x has only one entry"))
              ('T (QCAR (QCDR |x|))))) 

(SDEFUN |MAGMA;right;2$;4| ((|x| $) ($ $))
        (COND ((QEQCAR |x| 0) (|error| "x has only one entry"))
              ('T (QCDR (QCDR |x|))))) 

(PUT '|MAGMA;retractable?;$B;5| '|SPADreplace| '(XLAM (|x|) (QEQCAR |x| 0))) 

(SDEFUN |MAGMA;retractable?;$B;5| ((|x| $) ($ |Boolean|)) (QEQCAR |x| 0)) 

(SDEFUN |MAGMA;retract;$VarSet;6| ((|x| $) ($ |VarSet|))
        (COND ((QEQCAR |x| 0) (QCDR |x|)) ('T (|error| "Not retractable")))) 

(SDEFUN |MAGMA;retractIfCan;$U;7| ((|x| $) ($ |Union| |VarSet| "failed"))
        (COND ((SPADCALL |x| (QREFELT $ 19)) (CONS 0 (QCDR |x|)))
              ('T (CONS 1 "failed")))) 

(PUT '|MAGMA;coerce;VarSet$;8| '|SPADreplace| '(XLAM (|l|) (CONS 0 |l|))) 

(SDEFUN |MAGMA;coerce;VarSet$;8| ((|l| |VarSet|) ($ $)) (CONS 0 |l|)) 

(SDEFUN |MAGMA;mirror;2$;9| ((|x| $) ($ $))
        (COND ((QEQCAR |x| 0) |x|)
              ('T
               (CONS 1
                     (CONS (SPADCALL (QCDR (QCDR |x|)) (QREFELT $ 24))
                           (SPADCALL (QCAR (QCDR |x|)) (QREFELT $ 24))))))) 

(SDEFUN |MAGMA;coerce;$Ofm;10| ((|x| $) ($ |OrderedFreeMonoid| |VarSet|))
        (COND ((QEQCAR |x| 0) (SPADCALL (QCDR |x|) (QREFELT $ 26)))
              ('T
               (SPADCALL (SPADCALL (QCAR (QCDR |x|)) (QREFELT $ 27))
                         (SPADCALL (QCDR (QCDR |x|)) (QREFELT $ 27))
                         (QREFELT $ 28))))) 

(SDEFUN |MAGMA;coerce;$Of;11| ((|x| $) ($ |OutputForm|))
        (COND ((QEQCAR |x| 0) (SPADCALL (QCDR |x|) (QREFELT $ 30)))
              ('T
               (SPADCALL
                (LIST (SPADCALL (QCAR (QCDR |x|)) (QREFELT $ 31))
                      (SPADCALL (QCDR (QCDR |x|)) (QREFELT $ 31)))
                (QREFELT $ 33))))) 

(SDEFUN |MAGMA;*;3$;12| ((|x| $) (|y| $) ($ $)) (CONS 1 (CONS |x| |y|))) 

(SDEFUN |MAGMA;first;$VarSet;13| ((|x| $) ($ |VarSet|))
        (COND ((QEQCAR |x| 0) (QCDR |x|))
              ('T (SPADCALL (QCAR (QCDR |x|)) (QREFELT $ 35))))) 

(SDEFUN |MAGMA;rest;2$;14| ((|x| $) ($ $))
        (SPROG ((|lx| ($)))
               (SEQ
                (COND ((QEQCAR |x| 0) (|error| "rest$Magma: inexistant rest"))
                      (#1='T
                       (SEQ (LETT |lx| (QCAR (QCDR |x|)) |MAGMA;rest;2$;14|)
                            (EXIT
                             (COND ((QEQCAR |lx| 0) (QCDR (QCDR |x|)))
                                   (#1#
                                    (CONS 1
                                          (CONS (SPADCALL |lx| (QREFELT $ 36))
                                                (QCDR (QCDR |x|))))))))))))) 

(SDEFUN |MAGMA;length;$Pi;15| ((|x| $) ($ |PositiveInteger|))
        (COND ((QEQCAR |x| 0) 1)
              ('T
               (+ (SPADCALL (QCAR (QCDR |x|)) (QREFELT $ 38))
                  (SPADCALL (QCDR (QCDR |x|)) (QREFELT $ 38)))))) 

(SDEFUN |MAGMA;recursif| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((QEQCAR |x| 0)
          (COND
           ((QEQCAR |y| 0) (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 39)))
           (#1='T 'T)))
         ((QEQCAR |y| 0) 'NIL)
         (#1#
          (COND
           ((SPADCALL (QCAR (QCDR |x|)) (QCAR (QCDR |y|)) (QREFELT $ 12))
            (SPADCALL (QCDR (QCDR |x|)) (QCDR (QCDR |y|)) (QREFELT $ 40)))
           (#1#
            (SPADCALL (QCAR (QCDR |x|)) (QCAR (QCDR |y|)) (QREFELT $ 40))))))) 

(SDEFUN |MAGMA;lexico;2$B;17| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((|fy| (|VarSet|)) (|fx| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |x| 0)
                  (COND
                   ((QEQCAR |y| 0)
                    (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 39)))
                   (#1='T
                    (SPADCALL (QCDR |x|) (SPADCALL |y| (QREFELT $ 35))
                              (QREFELT $ 41)))))
                 ((QEQCAR |y| 0)
                  (SPADCALL (CONS 0 (SPADCALL |x| (QREFELT $ 35)))
                            (CONS 0 (SPADCALL |y| (QREFELT $ 20)))
                            (QREFELT $ 40)))
                 (#1#
                  (SEQ
                   (LETT |fx| (SPADCALL |x| (QREFELT $ 35))
                         . #2=(|MAGMA;lexico;2$B;17|))
                   (LETT |fy| (SPADCALL |y| (QREFELT $ 35)) . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL |fx| |fy| (QREFELT $ 10))
                      (SPADCALL (SPADCALL |x| (QREFELT $ 36))
                                (SPADCALL |y| (QREFELT $ 36)) (QREFELT $ 42)))
                     (#1# (SPADCALL |fx| |fy| (QREFELT $ 39))))))))))) 

(SDEFUN |MAGMA;<;2$B;18| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((|ly| #1=(|PositiveInteger|)) (|lx| #1#))
               (SEQ
                (LETT |lx| (SPADCALL |x| (QREFELT $ 38))
                      . #2=(|MAGMA;<;2$B;18|))
                (LETT |ly| (SPADCALL |y| (QREFELT $ 38)) . #2#)
                (EXIT
                 (COND ((EQL |lx| |ly|) (|MAGMA;recursif| |x| |y| $))
                       ('T (< |lx| |ly|))))))) 

(DECLAIM (NOTINLINE |Magma;|)) 

(DEFUN |Magma| (#1=#:G143)
  (SPROG NIL
         (PROG (#2=#:G144)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Magma|)
                                               '|domainEqualList|)
                    . #3=(|Magma|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Magma;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Magma|)))))))))) 

(DEFUN |Magma;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|Magma|))
          (LETT |dv$| (LIST '|Magma| DV$1) . #1#)
          (LETT $ (GETREFV 46) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Magma| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|Record| (|:| |left| $) (|:| |right| $)))
          (QSETREFV $ 8 (|Union| |#1| (QREFELT $ 7)))
          $))) 

(MAKEPROP '|Magma| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'VWORD '|Rep| (|Boolean|)
              (0 . =) (6 . =) |MAGMA;=;2$B;1| (|List| 6) |MAGMA;varList;$L;2|
              (12 . |setUnion|) (18 . |sort!|) |MAGMA;left;2$;3|
              |MAGMA;right;2$;4| |MAGMA;retractable?;$B;5|
              |MAGMA;retract;$VarSet;6| (|Union| 6 '"failed")
              |MAGMA;retractIfCan;$U;7| |MAGMA;coerce;VarSet$;8|
              |MAGMA;mirror;2$;9| (|OrderedFreeMonoid| 6) (23 . |coerce|)
              |MAGMA;coerce;$Ofm;10| (28 . *) (|OutputForm|) (34 . |coerce|)
              |MAGMA;coerce;$Of;11| (|List| $) (39 . |bracket|) |MAGMA;*;3$;12|
              |MAGMA;first;$VarSet;13| |MAGMA;rest;2$;14| (|PositiveInteger|)
              |MAGMA;length;$Pi;15| (44 . <) |MAGMA;<;2$B;18| (50 . <=)
              |MAGMA;lexico;2$B;17| (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 56 |varList| 62 |smaller?| 67 |right| 73 |retractable?| 78
              |retractIfCan| 83 |retract| 88 |rest| 93 |mirror| 98 |min| 103
              |max| 109 |lexico| 115 |length| 121 |left| 126 |latex| 131
              |hashUpdate!| 136 |hash| 142 |first| 147 |coerce| 152 >= 167 >
              173 = 179 <= 185 < 191 * 197)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL |SetCategory&| |BasicType&|
                     |RetractableTo&| |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|) (|SetCategory|)
                      (|BasicType|) (|RetractableTo| 6) (|PartialOrder|)
                      (|CoercibleTo| 29))
                   (|makeByteWordVec2| 45
                                       '(2 6 9 0 0 10 2 7 9 0 0 11 2 13 0 0 0
                                         15 1 13 0 0 16 1 25 0 6 26 2 25 0 0 0
                                         28 1 6 29 0 30 1 29 0 32 33 2 6 9 0 0
                                         39 2 6 9 0 0 41 2 0 9 0 0 1 1 0 13 0
                                         14 2 0 9 0 0 1 1 0 0 0 18 1 0 9 0 19 1
                                         0 21 0 22 1 0 6 0 20 1 0 0 0 36 1 0 0
                                         0 24 2 0 0 0 0 1 2 0 0 0 0 1 2 0 9 0 0
                                         42 1 0 37 0 38 1 0 0 0 17 1 0 44 0 1 2
                                         0 43 43 0 1 1 0 45 0 1 1 0 6 0 35 1 0
                                         25 0 27 1 0 0 6 23 1 0 29 0 31 2 0 9 0
                                         0 1 2 0 9 0 0 1 2 0 9 0 0 12 2 0 9 0 0
                                         1 2 0 9 0 0 40 2 0 0 0 0 34)))))
           '|lookupComplete|)) 
