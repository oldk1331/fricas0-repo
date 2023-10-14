
(/VERSIONCHECK 2) 

(PUT '|KERNEL;operator;$Bo;1| '|SPADreplace| 'SPAD-KERNEL-OP) 

(DEFUN |KERNEL;operator;$Bo;1| (|k| $) (SPAD-KERNEL-OP |k|)) 

(PUT '|KERNEL;argument;$L;2| '|SPADreplace| 'SPAD-KERNEL-ARG) 

(DEFUN |KERNEL;argument;$L;2| (|k| $) (SPAD-KERNEL-ARG |k|)) 

(PUT '|KERNEL;height;$Nni;3| '|SPADreplace| 'SPAD-KERNEL-NEST) 

(DEFUN |KERNEL;height;$Nni;3| (|k| $) (SPAD-KERNEL-NEST |k|)) 

(PUT '|KERNEL;position;$Nni;4| '|SPADreplace| 'SPAD-KERNEL-POSIT) 

(DEFUN |KERNEL;position;$Nni;4| (|k| $) (SPAD-KERNEL-POSIT |k|)) 

(PUT '|KERNEL;setPosition;$NniV;5| '|SPADreplace| 'SET-SPAD-KERNEL-POSIT) 

(DEFUN |KERNEL;setPosition;$NniV;5| (|k| |n| $) (SET-SPAD-KERNEL-POSIT |k| |n|)) 

(PUT '|KERNEL;mkKer| '|SPADreplace| '|makeSpadKernel|) 

(DEFUN |KERNEL;mkKer| (|o| |a| |n| $) (|makeSpadKernel| |o| |a| |n|)) 

(DEFUN |KERNEL;is?;$SB;7| (|k| |s| $)
  (SPADCALL (SPADCALL |k| (QREFELT $ 8)) |s| (QREFELT $ 28))) 

(DEFUN |KERNEL;is?;$BoB;8| (|k| |o| $)
  (SPADCALL (SPADCALL |k| (QREFELT $ 8)) |o| (QREFELT $ 30))) 

(DEFUN |KERNEL;name;$S;9| (|k| $)
  (SPADCALL (SPADCALL |k| (QREFELT $ 8)) (QREFELT $ 32))) 

(DEFUN |KERNEL;B2Z| (|flag| $) (COND (|flag| -1) ('T 1))) 

(DEFUN |KERNEL;kernel;S$;11| (|s| $)
  (SPADCALL
   (SPADCALL (SPADCALL |s| 0 (QREFELT $ 34)) (QREFELT $ 16) (QREFELT $ 35)) NIL
   1 (QREFELT $ 36))) 

(DEFUN |KERNEL;preds| (|o| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |o| (QREFELT $ 17) (QREFELT $ 39)) |KERNEL;preds|)
      (EXIT (COND ((QEQCAR |u| 1) NIL) ('T (QCDR |u|)))))))) 

(DEFUN |KERNEL;symbolIfCan;$U;13| (|k| $)
  (COND
   ((SPADCALL (SPADCALL |k| (QREFELT $ 8)) (QREFELT $ 16) (QREFELT $ 40))
    (CONS 0 (SPADCALL (SPADCALL |k| (QREFELT $ 8)) (QREFELT $ 32))))
   ('T (CONS 1 "failed")))) 

(DEFUN |KERNEL;kerEqual| (|k1| |k2| |f| $)
  (PROG (|n2| |n1|)
    (RETURN
     (COND
      ((OR
        (SPADCALL (SPADCALL |k1| (QREFELT $ 12)) (SPADCALL |k2| (QREFELT $ 12))
                  (QREFELT $ 43))
        (OR
         (SPADCALL (SPADCALL |k1| (QREFELT $ 8)) (SPADCALL |k2| (QREFELT $ 8))
                   (QREFELT $ 44))
         (SPADCALL
          (LETT |n1| (LENGTH (SPADCALL |k1| (QREFELT $ 10)))
                . #1=(|KERNEL;kerEqual|))
          (LETT |n2| (LENGTH (SPADCALL |k2| (QREFELT $ 10))) . #1#)
          (QREFELT $ 43))))
       'NIL)
      ('T (SPADCALL |k1| |k2| |f|)))))) 

(DEFUN |KERNEL;kernelEnterInCache| (|k| $)
  (PROG (#1=#:G162 |res| |f1| |f0|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |f0|
               (SPADCALL (SPADCALL |k| (QREFELT $ 8)) (QREFELT $ 22)
                         (QREFELT $ 39))
               . #2=(|KERNEL;kernelEnterInCache|))
         (EXIT
          (COND
           ((QEQCAR |f0| 0)
            (SEQ (LETT |f1| (QCDR |f0|) . #2#)
                 (LETT |res|
                       (SPADCALL |k|
                                 (CONS #'|KERNEL;kernelEnterInCache!0|
                                       (VECTOR $ |f1| |k|))
                                 (QREFELT $ 47))
                       . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |res| 0)
                    (PROGN (LETT #1# (QCDR |res|) . #2#) (GO #1#))))))))))
        (EXIT
         (SPADCALL |k| (CONS (|function| |KERNEL;triage|) $) (QREFELT $ 49)))))
      #1# (EXIT #1#))))) 

(DEFUN |KERNEL;kernelEnterInCache!0| (|y| $$)
  (PROG (|k| |f1| $)
    (LETT |k| (QREFELT $$ 2) . #1=(|KERNEL;kernelEnterInCache|))
    (LETT |f1| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|KERNEL;kerEqual| |k| |y| |f1| $))))) 

(DEFUN |KERNEL;=;2$B;16| (|k1| |k2| $)
  (SEQ
   (COND
    ((EQL (SPADCALL |k1| (QREFELT $ 13)) 0)
     (LETT |k1| (|KERNEL;kernelEnterInCache| |k1| $)
           . #1=(|KERNEL;=;2$B;16|))))
   (COND
    ((EQL (SPADCALL |k2| (QREFELT $ 13)) 0)
     (LETT |k2| (|KERNEL;kernelEnterInCache| |k2| $) . #1#)))
   (EXIT (EQL (SPADCALL |k1| (QREFELT $ 13)) (SPADCALL |k2| (QREFELT $ 13)))))) 

(DEFUN |KERNEL;<;2$B;17| (|k1| |k2| $)
  (SEQ
   (COND
    ((EQL (SPADCALL |k1| (QREFELT $ 13)) 0)
     (LETT |k1| (|KERNEL;kernelEnterInCache| |k1| $)
           . #1=(|KERNEL;<;2$B;17|))))
   (COND
    ((EQL (SPADCALL |k2| (QREFELT $ 13)) 0)
     (LETT |k2| (|KERNEL;kernelEnterInCache| |k2| $) . #1#)))
   (EXIT (< (SPADCALL |k1| (QREFELT $ 13)) (SPADCALL |k2| (QREFELT $ 13)))))) 

(DEFUN |KERNEL;kernel;BoLNni$;18| (|fn| |x| |n| $)
  (PROG (#1=#:G176 |u|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |u| (SPADCALL |fn| (QREFELT $ 53))
               . #2=(|KERNEL;kernel;BoLNni$;18|))
         (EXIT
          (COND
           ((QEQCAR |u| 0)
            (COND
             ((SPADCALL (LENGTH |x|) (QCDR |u|) (QREFELT $ 43))
              (PROGN
               (LETT #1# (|error| "Wrong number of arguments") . #2#)
               (GO #1#))))))))
        (EXIT
         (|KERNEL;kernelEnterInCache| (|KERNEL;mkKer| |fn| |x| |n| $) $))))
      #1# (EXIT #1#))))) 

(DEFUN |KERNEL;coerce;$Of;19| (|k| $)
  (PROG (|u| |l| #1=#:G195 |x| #2=#:G194 |f| |o| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL |k| (QREFELT $ 42)) . #3=(|KERNEL;coerce;$Of;19|))
      (EXIT
       (COND ((QEQCAR |v| 0) (SPADCALL (QCDR |v|) (QREFELT $ 55)))
             (#4='T
              (SEQ
               (LETT |f|
                     (SPADCALL (LETT |o| (SPADCALL |k| (QREFELT $ 8)) . #3#)
                               (QREFELT $ 21) (QREFELT $ 39))
                     . #3#)
               (EXIT
                (COND
                 ((QEQCAR |f| 0)
                  (SPADCALL (SPADCALL |k| (QREFELT $ 10)) (QCDR |f|)))
                 (#4#
                  (SEQ
                   (LETT |l|
                         (PROGN
                          (LETT #2# NIL . #3#)
                          (SEQ (LETT |x| NIL . #3#)
                               (LETT #1# (SPADCALL |k| (QREFELT $ 10)) . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (SPADCALL |x| (QREFELT $ 56)) #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #3#)
                   (LETT |u| (SPADCALL |o| (QREFELT $ 59)) . #3#)
                   (EXIT
                    (COND
                     ((QEQCAR |u| 1)
                      (SPADCALL
                       (SPADCALL (SPADCALL |o| (QREFELT $ 32)) (QREFELT $ 55))
                       |l| (QREFELT $ 61)))
                     (#4# (SPADCALL |l| (QCDR |u|))))))))))))))))) 

(DEFUN |KERNEL;triage| (|k1| |k2| $)
  (PROG (#1=#:G197 #2=#:G202 #3=#:G203 |x1| #4=#:G204 |x2| |n2| |n1|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |k1| (QREFELT $ 12))
                   (SPADCALL |k2| (QREFELT $ 12)) (QREFELT $ 64))
         (|KERNEL;B2Z|
          (< (SPADCALL |k1| (QREFELT $ 12)) (SPADCALL |k2| (QREFELT $ 12))) $))
        ((SPADCALL (SPADCALL |k1| (QREFELT $ 8)) (SPADCALL |k2| (QREFELT $ 8))
                   (QREFELT $ 44))
         (|KERNEL;B2Z|
          (SPADCALL (SPADCALL |k1| (QREFELT $ 8)) (SPADCALL |k2| (QREFELT $ 8))
                    (QREFELT $ 65))
          $))
        ((SPADCALL
          (LETT |n1| (LENGTH (SPADCALL |k1| (QREFELT $ 10)))
                . #5=(|KERNEL;triage|))
          (LETT |n2| (LENGTH (SPADCALL |k2| (QREFELT $ 10))) . #5#)
          (QREFELT $ 64))
         (|KERNEL;B2Z| (< |n1| |n2|) $))
        ('T
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |x2| NIL . #5#)
                 (LETT #4# (SPADCALL |k2| (QREFELT $ 10)) . #5#)
                 (LETT |x1| NIL . #5#)
                 (LETT #3# (SPADCALL |k1| (QREFELT $ 10)) . #5#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x1| (CAR #3#) . #5#) NIL)
                       (ATOM #4#) (PROGN (LETT |x2| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |x1| |x2| (QREFELT $ 66))
                     (PROGN
                      (LETT #1#
                            (PROGN
                             (LETT #2#
                                   (|KERNEL;B2Z|
                                    (SPADCALL |x1| |x2| (QREFELT $ 67)) $)
                                   . #5#)
                             (GO #2#))
                            . #5#)
                      (GO #1#))))))
                 (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #5#)) . #5#)
                 (GO G190) G191 (EXIT NIL)))
           #1# (EXIT #1#))
          (EXIT 0)))))
      #2# (EXIT #2#))))) 

(DEFUN |KERNEL;convert;$If;21| (|k| $)
  (PROG (|u| |l| #1=#:G222 |x| #2=#:G221 |f| |o| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL |k| (QREFELT $ 42)) . #3=(|KERNEL;convert;$If;21|))
      (EXIT
       (COND ((QEQCAR |v| 0) (SPADCALL (QCDR |v|) (QREFELT $ 69)))
             (#4='T
              (SEQ
               (LETT |f|
                     (SPADCALL (LETT |o| (SPADCALL |k| (QREFELT $ 8)) . #3#)
                               (QREFELT $ 23) (QREFELT $ 39))
                     . #3#)
               (EXIT
                (COND
                 ((QEQCAR |f| 0)
                  (SPADCALL (SPADCALL |k| (QREFELT $ 10)) (QCDR |f|)))
                 (#4#
                  (SEQ
                   (LETT |l|
                         (PROGN
                          (LETT #2# NIL . #3#)
                          (SEQ (LETT |x| NIL . #3#)
                               (LETT #1# (SPADCALL |k| (QREFELT $ 10)) . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (SPADCALL |x| (QREFELT $ 70)) #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #3#)
                   (LETT |u|
                         (SPADCALL (SPADCALL |k| (QREFELT $ 8)) (QREFELT $ 73))
                         . #3#)
                   (EXIT
                    (COND
                     ((QEQCAR |u| 1)
                      (SPADCALL
                       (CONS
                        (SPADCALL
                         (SPADCALL (SPADCALL |k| (QREFELT $ 8)) (QREFELT $ 32))
                         (QREFELT $ 69))
                        |l|)
                       (QREFELT $ 76)))
                     (#4# (SPADCALL |l| (QCDR |u|))))))))))))))))) 

(DEFUN |KERNEL;convert;$P;22| (|k| $)
  (PROG (#1=#:G231 |x| #2=#:G230 |l| |s| |v| |o|)
    (RETURN
     (SEQ (LETT |o| (SPADCALL |k| (QREFELT $ 8)) . #3=(|KERNEL;convert;$P;22|))
          (LETT |v| (SPADCALL |k| (QREFELT $ 42)) . #3#)
          (EXIT
           (COND
            ((QEQCAR |v| 0)
             (SEQ
              (LETT |s|
                    (SPADCALL (QCDR |v|)
                              (SPADCALL |o| (QREFELT $ 20) (QREFELT $ 40))
                              (SPADCALL |o| (QREFELT $ 18) (QREFELT $ 40))
                              (SPADCALL |o| (QREFELT $ 19) (QREFELT $ 40))
                              (QREFELT $ 79))
                    . #3#)
              (EXIT
               (COND ((NULL (LETT |l| (|KERNEL;preds| |o| $) . #3#)) |s|)
                     (#4='T (SPADCALL |s| |l| (QREFELT $ 81)))))))
            (#4#
             (SPADCALL |o|
                       (PROGN
                        (LETT #2# NIL . #3#)
                        (SEQ (LETT |x| NIL . #3#)
                             (LETT #1# (SPADCALL |k| (QREFELT $ 10)) . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (SPADCALL |x| (QREFELT $ 82)) #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 83))))))))) 

(DEFUN |KERNEL;convert;$P;23| (|k| $)
  (PROG (#1=#:G240 |x| #2=#:G239 |l| |s| |v| |o|)
    (RETURN
     (SEQ (LETT |o| (SPADCALL |k| (QREFELT $ 8)) . #3=(|KERNEL;convert;$P;23|))
          (LETT |v| (SPADCALL |k| (QREFELT $ 42)) . #3#)
          (EXIT
           (COND
            ((QEQCAR |v| 0)
             (SEQ
              (LETT |s|
                    (SPADCALL (QCDR |v|)
                              (SPADCALL |o| (QREFELT $ 20) (QREFELT $ 40))
                              (SPADCALL |o| (QREFELT $ 18) (QREFELT $ 40))
                              (SPADCALL |o| (QREFELT $ 19) (QREFELT $ 40))
                              (QREFELT $ 85))
                    . #3#)
              (EXIT
               (COND ((NULL (LETT |l| (|KERNEL;preds| |o| $) . #3#)) |s|)
                     (#4='T (SPADCALL |s| |l| (QREFELT $ 86)))))))
            (#4#
             (SPADCALL |o|
                       (PROGN
                        (LETT #2# NIL . #3#)
                        (SEQ (LETT |x| NIL . #3#)
                             (LETT #1# (SPADCALL |k| (QREFELT $ 10)) . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (SPADCALL |x| (QREFELT $ 87)) #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 88))))))))) 

(DECLAIM (NOTINLINE |Kernel;|)) 

(DEFUN |Kernel| (#1=#:G241)
  (PROG ()
    (RETURN
     (PROG (#2=#:G242)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache| '|Kernel|)
                                           '|domainEqualList|)
                . #3=(|Kernel|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Kernel;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Kernel|))))))))))) 

(DEFUN |Kernel;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Kernel|))
      (LETT |dv$| (LIST '|Kernel| DV$1) . #1#)
      (LETT $ (GETREFV 93) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|Kernel| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 16 '|%symbol|)
      (QSETREFV $ 17 '|%pmpredicate|)
      (QSETREFV $ 18 '|%pmoptional|)
      (QSETREFV $ 19 '|%pmmultiple|)
      (QSETREFV $ 20 '|%pmconstant|)
      (QSETREFV $ 21 '|%specialDisp|)
      (QSETREFV $ 22 '|%specialEqual|)
      (QSETREFV $ 23 '|%specialInput|)
      (SPADCALL (QREFELT $ 25))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 77 (CONS (|dispatchFunction| |KERNEL;convert;$If;21|) $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (QSETREFV $ 84 (CONS (|dispatchFunction| |KERNEL;convert;$P;22|) $))))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 89 (CONS (|dispatchFunction| |KERNEL;convert;$P;23|) $))))
      $)))) 

(MAKEPROP '|Kernel| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|BasicOperator|)
              |KERNEL;operator;$Bo;1| (|List| 6) |KERNEL;argument;$L;2|
              (|NonNegativeInteger|) |KERNEL;height;$Nni;3|
              |KERNEL;position;$Nni;4| (|Void|) |KERNEL;setPosition;$NniV;5|
              'SYMBOL 'PMPRED 'PMOPT 'PMMULT 'PMCONST 'SPECIALDISP
              'SPECIALEQUAL 'SPECIALINPUT (|SortedCache| $$) (0 . |clearCache|)
              (|Boolean|) (|Symbol|) (4 . |is?|) |KERNEL;is?;$SB;7| (10 . =)
              |KERNEL;is?;$BoB;8| (16 . |name|) |KERNEL;name;$S;9|
              (21 . |operator|) (27 . |assert|) |KERNEL;kernel;BoLNni$;18|
              |KERNEL;kernel;S$;11| (|Union| (|None|) '"failed")
              (33 . |property|) (39 . |has?|) (|Union| 27 '"failed")
              |KERNEL;symbolIfCan;$U;13| (45 . ~=) (51 . ~=)
              (|Union| $$ '"failed") (|Mapping| 26 $$) (57 . |linearSearch|)
              (|Mapping| 63 $$ $$) (63 . |enterInCache|) |KERNEL;=;2$B;16|
              |KERNEL;<;2$B;17| (|Union| 11 '"failed") (69 . |arity|)
              (|OutputForm|) (74 . |coerce|) (79 . |coerce|)
              (|Mapping| 54 (|List| 54)) (|Union| 57 '"failed")
              (84 . |display|) (|List| $) (89 . |prefix|)
              |KERNEL;coerce;$Of;19| (|Integer|) (95 . ~=) (101 . <) (107 . ~=)
              (113 . |smaller?|) (|InputForm|) (119 . |convert|)
              (124 . |convert|) (|Mapping| 68 (|List| 68))
              (|Union| 71 '"failed") (129 . |input|) (|Pattern| (|Float|))
              (134 . |convert|) (139 . |convert|) (144 . |convert|)
              (|Pattern| 63) (149 . |patternVariable|) (|List| (|Any|))
              (157 . |setPredicates|) (163 . |convert|) (168 . |elt|)
              (174 . |convert|) (179 . |patternVariable|)
              (187 . |setPredicates|) (193 . |convert|) (198 . |elt|)
              (204 . |convert|) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 209 |symbolIfCan| 215 |smaller?| 220 |setPosition| 226
              |position| 232 |operator| 237 |name| 242 |min| 247 |max| 253
              |latex| 259 |kernel| 264 |is?| 276 |height| 288 |hashUpdate!| 293
              |hash| 299 |convert| 304 |coerce| 319 |argument| 324 >= 329 > 335
              = 341 <= 347 < 353)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(0 0 0 0 0 0 0 0 1 2 3))
                 (CONS
                  '#(|OrderedSet&| NIL NIL NIL |SetCategory&| |PartialOrder&|
                     |BasicType&| NIL NIL NIL NIL)
                  (CONS
                   '#((|OrderedSet|) (|CachableSet|) (|Comparable|)
                      (|Patternable| 6) (|SetCategory|) (|PartialOrder|)
                      (|BasicType|) (|CoercibleTo| 54) (|ConvertibleTo| 74)
                      (|ConvertibleTo| 78) (|ConvertibleTo| 68))
                   (|makeByteWordVec2| 92
                                       '(0 24 14 25 2 7 26 0 27 28 2 7 26 0 0
                                         30 1 7 27 0 32 2 7 0 27 11 34 2 7 0 0
                                         27 35 2 7 38 0 27 39 2 7 26 0 27 40 2
                                         11 26 0 0 43 2 7 26 0 0 44 2 24 45 2
                                         46 47 2 24 2 2 48 49 1 7 52 0 53 1 27
                                         54 0 55 1 6 54 0 56 1 7 58 0 59 2 54 0
                                         0 60 61 2 63 26 0 0 64 2 7 26 0 0 65 2
                                         6 26 0 0 66 2 6 26 0 0 67 1 27 68 0 69
                                         1 6 68 0 70 1 7 72 0 73 1 27 74 0 75 1
                                         68 0 60 76 1 0 68 0 77 4 78 0 27 26 26
                                         26 79 2 78 0 0 80 81 1 6 78 0 82 2 78
                                         0 7 60 83 1 0 78 0 84 4 74 0 27 26 26
                                         26 85 2 74 0 0 80 86 1 6 74 0 87 2 74
                                         0 7 60 88 1 0 74 0 89 2 0 26 0 0 1 1 0
                                         41 0 42 2 0 26 0 0 1 2 0 14 0 11 15 1
                                         0 11 0 13 1 0 7 0 8 1 0 27 0 33 2 0 0
                                         0 0 1 2 0 0 0 0 1 1 0 91 0 1 1 0 0 27
                                         37 3 0 0 7 9 11 36 2 0 26 0 27 29 2 0
                                         26 0 7 31 1 0 11 0 12 2 0 90 90 0 1 1
                                         0 92 0 1 1 3 68 0 77 1 1 74 0 89 1 2
                                         78 0 84 1 0 54 0 62 1 0 9 0 10 2 0 26
                                         0 0 1 2 0 26 0 0 1 2 0 26 0 0 50 2 0
                                         26 0 0 1 2 0 26 0 0 51)))))
           '|lookupComplete|)) 
