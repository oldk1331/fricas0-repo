
(/VERSIONCHECK 2) 

(DEFUN |FRMOD;One;$;1| ($) (QREFELT $ 10)) 

(PUT '|FRMOD;module;V$;2| '|SPADreplace| '(XLAM (|v|) |v|)) 

(DEFUN |FRMOD;module;V$;2| (|v| $) |v|) 

(PUT '|FRMOD;basis;$V;3| '|SPADreplace| '(XLAM (|m|) |m|)) 

(DEFUN |FRMOD;basis;$V;3| (|m| $) |m|) 

(DEFUN |FRMOD;rowdiv| (|r| |f| $)
  (PROG (#1=#:G133 #2=#:G135 |i| #3=#:G134)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3#
             (GETREFV
              (|inc_SI| (- #4=(QVSIZE |r|) #5=(SPADCALL |r| (QREFELT $ 29)))))
             . #6=(|FRMOD;rowdiv|))
       (SEQ (LETT |i| #5# . #6#) (LETT #2# #4# . #6#) (LETT #1# 0 . #6#) G190
            (COND ((> |i| #2#) (GO G191)))
            (SEQ
             (EXIT
              (SETELT #3# #1#
                      (SPADCALL (SPADCALL |r| |i| (QREFELT $ 30)) |f|
                                (QREFELT $ 31)))))
            (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #6#)) . #6#)
            (GO G190) G191 (EXIT NIL))
       #3#))))) 

(DEFUN |FRMOD;coerce;$Of;5| (|m| $)
  (SPADCALL (SPADCALL |m| (QREFELT $ 26)) (QREFELT $ 33))) 

(DEFUN |FRMOD;W2A| (|v| $)
  (SPADCALL (SPADCALL |v| (|FRMOD;intmat| $) (QREFELT $ 36)) (QREFELT $ 37))) 

(DEFUN |FRMOD;wmatrix| (|v| $)
  (SPADCALL (SPADCALL |v| (QREFELT $ 39)) (|FRMOD;invintmat| $) (QREFELT $ 40))) 

(DEFUN |FRMOD;getinvintmat| ($)
  (PROG (#1=#:G147 |j| #2=#:G146 |i| |m| #3=#:G140)
    (RETURN
     (SEQ
      (LETT |m|
            (PROG2
                (LETT #3# (SPADCALL (|FRMOD;intmat| $) (QREFELT $ 42))
                      . #4=(|FRMOD;getinvintmat|))
                (QCDR #3#)
              (|check_union| (QEQCAR #3# 0) (|Matrix| (QREFELT $ 7)) #3#))
            . #4#)
      (SEQ (LETT |i| 1 . #4#) (LETT #2# (SPADCALL |m| (QREFELT $ 43)) . #4#)
           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #4#)
                  (LETT #1# (SPADCALL |m| (QREFELT $ 44)) . #4#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL (QREFELT $ 21) |i| |j| (QAREF2O |m| |i| |j| 1 1)
                              (QREFELT $ 45))))
                  (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT 'NIL))))) 

(DEFUN |FRMOD;getintmat| ($)
  (PROG (#1=#:G153 |j| #2=#:G152 |i| |m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL (QREFELT $ 10) (QREFELT $ 39))
            . #3=(|FRMOD;getintmat|))
      (SEQ (LETT |i| 1 . #3#) (LETT #2# (SPADCALL |m| (QREFELT $ 43)) . #3#)
           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #3#)
                  (LETT #1# (SPADCALL |m| (QREFELT $ 44)) . #3#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL (QREFELT $ 22) |i| |j| (QAREF2O |m| |i| |j| 1 1)
                              (QREFELT $ 45))))
                  (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT 'NIL))))) 

(DEFUN |FRMOD;invintmat| ($)
  (SEQ
   (COND
    ((SPADCALL (QREFELT $ 15) (QREFELT $ 46))
     (SPADCALL (QREFELT $ 15) (|FRMOD;getinvintmat| $) (QREFELT $ 47))))
   (EXIT (QREFELT $ 21)))) 

(DEFUN |FRMOD;intmat| ($)
  (SEQ
   (COND
    ((SPADCALL (QREFELT $ 16) (QREFELT $ 46))
     (SPADCALL (QREFELT $ 16) (|FRMOD;getintmat| $) (QREFELT $ 47))))
   (EXIT (QREFELT $ 22)))) 

(DEFUN |FRMOD;vectProd| (|v1| |v2| $)
  (PROG (|k| #1=#:G164 |j| #2=#:G163 |i| |v|)
    (RETURN
     (SEQ
      (LETT |k|
            (SPADCALL
             (LETT |v|
                   (MAKEARR1 (* (QVSIZE |v1|) (QVSIZE |v2|))
                             (|spadConstant| $ 48))
                   . #3=(|FRMOD;vectProd|))
             (QREFELT $ 49))
            . #3#)
      (SEQ (LETT |i| (SPADCALL |v1| (QREFELT $ 50)) . #3#)
           (LETT #2# (QVSIZE |v1|) . #3#) G190 (COND ((> |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| (SPADCALL |v2| (QREFELT $ 50)) . #3#)
                  (LETT #1# (QVSIZE |v2|) . #3#) G190
                  (COND ((> |j| #1#) (GO G191)))
                  (SEQ
                   (QSETAREF1O |v| |k|
                               (SPADCALL (QAREF1O |v1| |i| 1)
                                         (QAREF1O |v2| |j| 1) (QREFELT $ 51))
                               1)
                   (EXIT (LETT |k| (+ |k| 1) . #3#)))
                  (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |v|))))) 

(DEFUN |FRMOD;norm;$F;13| (|m| $)
  (COND
   ((SPADCALL (QVSIZE (SPADCALL |m| (QREFELT $ 26))) (QVSIZE (QREFELT $ 10))
              (QREFELT $ 53))
    (|error| "Module not of rank n"))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL (SPADCALL |m| (QREFELT $ 26)) (QREFELT $ 39))
               (|FRMOD;invintmat| $) (QREFELT $ 40))
     (QREFELT $ 54))))) 

(DEFUN |FRMOD;*;3$;14| (|m1| |m2| $)
  (PROG (|u| #1=#:G172 |i| #2=#:G171 |m| |cd|)
    (RETURN
     (SEQ
      (LETT |m|
            (SPADCALL
             (QCAR
              (LETT |cd|
                    (SPADCALL
                     (|FRMOD;wmatrix|
                      (|FRMOD;vectProd| (SPADCALL |m1| (QREFELT $ 26))
                       (SPADCALL |m2| (QREFELT $ 26)) $)
                      $)
                     (QREFELT $ 58))
                    . #3=(|FRMOD;*;3$;14|)))
             (QREFELT $ 61))
            . #3#)
      (EXIT
       (SPADCALL
        (LIST2VEC
         (PROGN
          (LETT #2# NIL . #3#)
          (SEQ (LETT |i| 1 . #3#)
               (LETT #1# (SPADCALL |m| (QREFELT $ 62)) . #3#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL
                    (LETT |u|
                          (|FRMOD;W2A|
                           (|FRMOD;rowdiv| (SPADCALL |m| |i| (QREFELT $ 63))
                            (QCDR |cd|) $)
                           $)
                          . #3#)
                    (|spadConstant| $ 48) (QREFELT $ 64))
                   (LETT #2# (CONS |u| #2#) . #3#)))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
               (EXIT (NREVERSE #2#)))))
        (QREFELT $ 25))))))) 

(DEFUN |FRMOD;module;Fi$;15| (|i| $)
  (SPADCALL (SPADCALL (SPADCALL |i| (QREFELT $ 67)) (QREFELT $ 25))
            (SPADCALL (QREFELT $ 10) (QREFELT $ 25)) (QREFELT $ 65))) 

(DEFUN |FramedModule| (&REST #1=#:G174)
  (PROG ()
    (RETURN
     (PROG (#2=#:G175)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FramedModule|)
                                           '|domainEqualList|)
                . #3=(|FramedModule|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |FramedModule;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|FramedModule|))))))))))) 

(DEFUN |FramedModule;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FramedModule|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$| (LIST '|FramedModule| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
      (LETT $ (GETREFV 73) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#4|
                                                         (LIST '|RetractableTo|
                                                               (|devaluate|
                                                                |#2|)))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|FramedModule|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 11 (|Vector| |#4|))
      (QSETREFV $ 15 (SPADCALL 'T (QREFELT $ 14)))
      (QSETREFV $ 16 (SPADCALL 'T (QREFELT $ 14)))
      (QSETREFV $ 21
                (SPADCALL (QVSIZE |#5|) (QVSIZE |#5|) (|spadConstant| $ 17)
                          (QREFELT $ 20)))
      (QSETREFV $ 22
                (SPADCALL (QVSIZE |#5|) (QVSIZE |#5|) (|spadConstant| $ 17)
                          (QREFELT $ 20)))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 68 (CONS (|dispatchFunction| |FRMOD;module;Fi$;15|) $))))
      $)))) 

(MAKEPROP '|FramedModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) '|Rep| (|Boolean|)
              (|Reference| 12) (0 . |ref|) '|iflag?| '|wflag?| (5 . |Zero|)
              (|NonNegativeInteger|) (|Matrix| 7) (9 . |new|) '|imat| '|wmat|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FRMOD;One;$;1|) $))
              (|Vector| 9) |FRMOD;module;V$;2| |FRMOD;basis;$V;3| (|Integer|)
              (|Vector| 6) (16 . |minIndex|) (21 . |elt|) (27 . /)
              (|OutputForm|) (33 . |coerce|) |FRMOD;coerce;$Of;5| (|Vector| 7)
              (38 . *) (44 . |represents|) (|Vector| $) (49 . |coordinates|)
              (54 . *) (|Union| $ '"failed") (60 . |inverse|)
              (65 . |maxRowIndex|) (70 . |maxColIndex|) (75 . |setelt|)
              (83 . |elt|) (88 . |setelt|) (94 . |Zero|) (98 . |minIndex|)
              (103 . |minIndex|) (108 . *) (114 . |One|) (118 . ~=)
              (124 . |determinant|) |FRMOD;norm;$F;13|
              (|Record| (|:| |num| 59) (|:| |den| 6))
              (|MatrixCommonDenominator| 6 7) (129 . |splitDenominator|)
              (|Matrix| 6) (|ModularHermitianRowReduction| 6) (134 . |rowEch|)
              (139 . |maxRowIndex|) (144 . |row|) (150 . ~=) |FRMOD;*;3$;14|
              (|FractionalIdeal| 6 7 8 9) (156 . |basis|) (161 . |module|)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 166 |sample| 172 |recip| 176 |one?| 181 |norm| 186 |module|
              191 |latex| 201 |hashUpdate!| 206 |hash| 212 |coerce| 217 |basis|
              222 ^ 227 |One| 239 = 243 * 249)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0))
                 (CONS
                  '#(|Monoid&| |SemiGroup&| |SetCategory&| |BasicType&| NIL)
                  (CONS
                   '#((|Monoid|) (|SemiGroup|) (|SetCategory|) (|BasicType|)
                      (|CoercibleTo| 32))
                   (|makeByteWordVec2| 72
                                       '(1 13 0 12 14 0 7 0 17 3 19 0 18 18 7
                                         20 1 28 27 0 29 2 28 6 0 27 30 2 7 0 6
                                         6 31 1 24 32 0 33 2 19 35 35 0 36 1 9
                                         0 35 37 1 9 19 38 39 2 19 0 0 0 40 1
                                         19 41 0 42 1 19 27 0 43 1 19 27 0 44 4
                                         19 7 0 27 27 7 45 1 13 12 0 46 2 13 12
                                         0 12 47 0 9 0 48 1 24 27 0 49 1 11 27
                                         0 50 2 9 0 0 0 51 0 9 0 52 2 18 12 0 0
                                         53 1 19 7 0 54 1 57 56 19 58 1 60 59
                                         59 61 1 59 27 0 62 2 59 28 0 27 63 2 9
                                         12 0 0 64 1 66 24 0 67 1 0 0 66 68 2 0
                                         12 0 0 1 0 0 0 1 1 0 41 0 1 1 0 12 0 1
                                         1 0 7 0 55 1 1 0 66 68 1 0 0 24 25 1 0
                                         70 0 1 2 0 72 72 0 1 1 0 71 0 1 1 0 32
                                         0 34 1 0 24 0 26 2 0 0 0 18 1 2 0 0 0
                                         69 1 0 0 0 23 2 0 12 0 0 1 2 0 0 0 0
                                         65)))))
           '|lookupComplete|)) 
