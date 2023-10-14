
(/VERSIONCHECK 2) 

(PUT '|ILIST;#;$Nni;1| '|SPADreplace| 'LENGTH) 

(DEFUN |ILIST;#;$Nni;1| (|x| $) (LENGTH |x|)) 

(PUT '|ILIST;concat;S2$;2| '|SPADreplace| 'CONS) 

(DEFUN |ILIST;concat;S2$;2| (|s| |x| $) (CONS |s| |x|)) 

(PUT '|ILIST;eq?;2$B;3| '|SPADreplace| 'EQ) 

(DEFUN |ILIST;eq?;2$B;3| (|x| |y| $) (EQ |x| |y|)) 

(PUT '|ILIST;first;$S;4| '|SPADreplace| '|SPADfirst|) 

(DEFUN |ILIST;first;$S;4| (|x| $) (|SPADfirst| |x|)) 

(PUT '|ILIST;elt;$firstS;5| '|SPADreplace|
     '(XLAM (|x| "first") (|SPADfirst| |x|))) 

(DEFUN |ILIST;elt;$firstS;5| (|x| T3 $) (|SPADfirst| |x|)) 

(PUT '|ILIST;empty;$;6| '|SPADreplace| '(XLAM NIL NIL)) 

(DEFUN |ILIST;empty;$;6| ($) NIL) 

(PUT '|ILIST;empty?;$B;7| '|SPADreplace| 'NULL) 

(DEFUN |ILIST;empty?;$B;7| (|x| $) (NULL |x|)) 

(PUT '|ILIST;rest;2$;8| '|SPADreplace| 'CDR) 

(DEFUN |ILIST;rest;2$;8| (|x| $) (CDR |x|)) 

(PUT '|ILIST;elt;$rest$;9| '|SPADreplace| '(XLAM (|x| "rest") (CDR |x|))) 

(DEFUN |ILIST;elt;$rest$;9| (|x| T4 $) (CDR |x|)) 

(DEFUN |ILIST;setfirst!;$2S;10| (|x| |s| $)
  (COND ((SPADCALL |x| (QREFELT $ 17)) (|error| "Cannot update an empty list"))
        ('T (QCAR (RPLACA |x| |s|))))) 

(DEFUN |ILIST;setelt;$first2S;11| (|x| T11 |s| $)
  (COND ((SPADCALL |x| (QREFELT $ 17)) (|error| "Cannot update an empty list"))
        ('T (QCAR (RPLACA |x| |s|))))) 

(DEFUN |ILIST;setrest!;3$;12| (|x| |y| $)
  (COND ((SPADCALL |x| (QREFELT $ 17)) (|error| "Cannot update an empty list"))
        ('T (QCDR (RPLACD |x| |y|))))) 

(DEFUN |ILIST;setelt;$rest2$;13| (|x| T12 |y| $)
  (COND ((SPADCALL |x| (QREFELT $ 17)) (|error| "Cannot update an empty list"))
        ('T (QCDR (RPLACD |x| |y|))))) 

(PUT '|ILIST;construct;L$;14| '|SPADreplace| '(XLAM (|l|) |l|)) 

(DEFUN |ILIST;construct;L$;14| (|l| $) |l|) 

(PUT '|ILIST;parts;$L;15| '|SPADreplace| '(XLAM (|s|) |s|)) 

(DEFUN |ILIST;parts;$L;15| (|s| $) |s|) 

(PUT '|ILIST;reverse!;2$;16| '|SPADreplace| 'NREVERSE) 

(DEFUN |ILIST;reverse!;2$;16| (|x| $) (NREVERSE |x|)) 

(PUT '|ILIST;reverse;2$;17| '|SPADreplace| 'REVERSE) 

(DEFUN |ILIST;reverse;2$;17| (|x| $) (REVERSE |x|)) 

(DEFUN |ILIST;minIndex;$I;18| (|x| $) (QREFELT $ 7)) 

(DEFUN |ILIST;rest;$Nni$;19| (|x| |n| $)
  (PROG (|i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 1 . #1=(|ILIST;rest;$Nni$;19|)) G190
           (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (COND ((NULL |x|) (|error| "index out of range")))
                (EXIT (LETT |x| (QCDR |x|) . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |ILIST;copy;2$;20| (|x| $)
  (PROG (|y| |i|)
    (RETURN
     (SEQ (LETT |y| (SPADCALL (QREFELT $ 16)) . #1=(|ILIST;copy;2$;20|))
          (SEQ (LETT |i| 0 . #1#) G190
               (COND ((NULL (COND ((NULL |x|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (COND
                 ((EQ |i| 1000)
                  (COND
                   ((SPADCALL |x| (QREFELT $ 33)) (|error| "cyclic list")))))
                (LETT |y| (CONS (QCAR |x|) |y|) . #1#)
                (EXIT (LETT |x| (QCDR |x|) . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT (NREVERSE |y|)))))) 

(DEFUN |ILIST;coerce;$Of;21| (|x| $)
  (PROG (|z| |y| |s|)
    (RETURN
     (SEQ (LETT |y| NIL . #1=(|ILIST;coerce;$Of;21|))
          (LETT |s| (SPADCALL |x| (QREFELT $ 35)) . #1#)
          (SEQ G190
               (COND ((NULL (COND ((EQ |x| |s|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (LETT |y|
                      (CONS
                       (SPADCALL (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 37))
                       |y|)
                      . #1#)
                (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 18)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |y| (NREVERSE |y|) . #1#)
          (EXIT
           (COND ((SPADCALL |s| (QREFELT $ 17)) (SPADCALL |y| (QREFELT $ 39)))
                 ('T
                  (SEQ
                   (LETT |z|
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                                    (QREFELT $ 37))
                          (QREFELT $ 41))
                         . #1#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND ((EQ |s| (SPADCALL |x| (QREFELT $ 18))) 'NIL)
                                 ('T 'T)))
                          (GO G191)))
                        (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 18)) . #1#)
                             (EXIT
                              (LETT |z|
                                    (CONS
                                     (SPADCALL (SPADCALL |x| (QREFELT $ 13))
                                               (QREFELT $ 37))
                                     |z|)
                                    . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (SPADCALL
                     (SPADCALL |y|
                               (SPADCALL
                                (SPADCALL (NREVERSE |z|) (QREFELT $ 42))
                                (QREFELT $ 43))
                               (QREFELT $ 44))
                     (QREFELT $ 39))))))))))) 

(DEFUN |ILIST;=;2$B;22| (|x| |y| $)
  (PROG (#1=#:G1052)
    (RETURN
     (SEQ
      (EXIT
       (COND ((EQ |x| |y|) 'T)
             (#2='T
              (SEQ
               (SEQ G190
                    (COND
                     ((NULL (COND ((OR (NULL |x|) (NULL |y|)) 'NIL) ('T 'T)))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 46))
                        (PROGN
                         (LETT #1# 'NIL . #3=(|ILIST;=;2$B;22|))
                         (GO #1#)))
                       ('T
                        (SEQ (LETT |x| (QCDR |x|) . #3#)
                             (EXIT (LETT |y| (QCDR |y|) . #3#)))))))
                    NIL (GO G190) G191 (EXIT NIL))
               (EXIT (COND ((NULL |x|) (NULL |y|)) (#2# 'NIL)))))))
      #1# (EXIT #1#))))) 

(DEFUN |ILIST;latex;$S;23| (|x| $)
  (PROG (|s|)
    (RETURN
     (SEQ (LETT |s| "\\left[" . #1=(|ILIST;latex;$S;23|))
          (SEQ G190 (COND ((NULL (COND ((NULL |x|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (LETT |s| (STRCONC |s| (SPADCALL (QCAR |x|) (QREFELT $ 49)))
                      . #1#)
                (LETT |x| (QCDR |x|) . #1#)
                (EXIT
                 (COND
                  ((NULL (NULL |x|)) (LETT |s| (STRCONC |s| ", ") . #1#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (STRCONC |s| " \\right]")))))) 

(DEFUN |ILIST;member?;S$B;24| (|s| |x| $)
  (PROG (#1=#:G1063)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ G190 (COND ((NULL (COND ((NULL |x|) 'NIL) ('T 'T))) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |s| (QCAR |x|) (QREFELT $ 51))
                 (PROGN (LETT #1# 'T . #2=(|ILIST;member?;S$B;24|)) (GO #1#)))
                ('T (LETT |x| (QCDR |x|) . #2#)))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |ILIST;concat!;3$;25| (|x| |y| $)
  (PROG (|z|)
    (RETURN
     (SEQ
      (COND
       ((NULL |x|)
        (COND ((NULL |y|) |x|)
              (#1='T
               (SEQ (PUSH (SPADCALL |y| (QREFELT $ 13)) |x|)
                    (QRPLACD |x| (SPADCALL |y| (QREFELT $ 18))) (EXIT |x|)))))
       (#1#
        (SEQ (LETT |z| |x| . #2=(|ILIST;concat!;3$;25|))
             (SEQ G190
                  (COND
                   ((NULL (COND ((NULL (QCDR |z|)) 'NIL) ('T 'T))) (GO G191)))
                  (SEQ (EXIT (LETT |z| (QCDR |z|) . #2#))) NIL (GO G190) G191
                  (EXIT NIL))
             (QRPLACD |z| |y|) (EXIT |x|)))))))) 

(DEFUN |ILIST;removeDuplicates!;2$;26| (|l| $)
  (PROG (|pp| |pr| |p| |f|)
    (RETURN
     (SEQ (LETT |p| |l| . #1=(|ILIST;removeDuplicates!;2$;26|))
          (SEQ G190 (COND ((NULL (COND ((NULL |p|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |pp| |p| . #1#) (LETT |f| (QCAR |p|) . #1#)
                    (LETT |p| (QCDR |p|) . #1#)
                    (EXIT
                     (SEQ G190
                          (COND
                           ((NULL
                             (COND ((NULL (LETT |pr| (QCDR |pp|) . #1#)) 'NIL)
                                   ('T 'T)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (QCAR |pr|) |f| (QREFELT $ 51))
                              (QRPLACD |pp| (QCDR |pr|)))
                             ('T (LETT |pp| |pr| . #1#)))))
                          NIL (GO G190) G191 (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |l|))))) 

(DEFUN |ILIST;sort!;M2$;27| (|f| |l| $)
  (|ILIST;mergeSort| |f| |l| (SPADCALL |l| (QREFELT $ 9)) $)) 

(DEFUN |ILIST;merge!;M3$;28| (|f| |p| |q| $)
  (PROG (|t| |r|)
    (RETURN
     (SEQ
      (COND ((NULL |p|) |q|) ((NULL |q|) |p|)
            ((EQ |p| |q|) (|error| "cannot merge a list into itself"))
            (#1='T
             (SEQ
              (COND
               ((SPADCALL (QCAR |p|) (QCAR |q|) |f|)
                (SEQ
                 (LETT |r| (LETT |t| |p| . #2=(|ILIST;merge!;M3$;28|)) . #2#)
                 (EXIT (LETT |p| (QCDR |p|) . #2#))))
               (#1#
                (SEQ (LETT |r| (LETT |t| |q| . #2#) . #2#)
                     (EXIT (LETT |q| (QCDR |q|) . #2#)))))
              (SEQ G190
                   (COND
                    ((NULL (COND ((OR (NULL |p|) (NULL |q|)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QCAR |p|) (QCAR |q|) |f|)
                       (SEQ (QRPLACD |t| |p|) (LETT |t| |p| . #2#)
                            (EXIT (LETT |p| (QCDR |p|) . #2#))))
                      ('T
                       (SEQ (QRPLACD |t| |q|) (LETT |t| |q| . #2#)
                            (EXIT (LETT |q| (QCDR |q|) . #2#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (QRPLACD |t| (COND ((NULL |p|) |q|) (#1# |p|))) (EXIT |r|)))))))) 

(DEFUN |ILIST;split!;$I$;29| (|p| |n| $)
  (PROG (|q| #1=#:G1098)
    (RETURN
     (SEQ
      (COND ((< |n| 1) (|error| "index out of range"))
            ('T
             (SEQ
              (LETT |p|
                    (SPADCALL |p|
                              (PROG1
                                  (LETT #1# (- |n| 1)
                                        . #2=(|ILIST;split!;$I$;29|))
                                (|check_subtype| (>= #1# 0)
                                                 '(|NonNegativeInteger|) #1#))
                              (QREFELT $ 32))
                    . #2#)
              (LETT |q| (QCDR |p|) . #2#) (QRPLACD |p| NIL) (EXIT |q|)))))))) 

(DEFUN |ILIST;mergeSort| (|f| |p| |n| $)
  (PROG (|q| |l| #1=#:G1102)
    (RETURN
     (SEQ
      (COND
       ((EQL |n| 2)
        (COND
         ((SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 18)) (QREFELT $ 13))
                    (SPADCALL |p| (QREFELT $ 13)) |f|)
          (LETT |p| (SPADCALL |p| (QREFELT $ 28)) . #2=(|ILIST;mergeSort|))))))
      (EXIT
       (COND ((< |n| 3) |p|)
             ('T
              (SEQ
               (LETT |l|
                     (PROG1 (LETT #1# (QUOTIENT2 |n| 2) . #2#)
                       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                        #1#))
                     . #2#)
               (LETT |q| (SPADCALL |p| |l| (QREFELT $ 58)) . #2#)
               (LETT |p| (|ILIST;mergeSort| |f| |p| |l| $) . #2#)
               (LETT |q| (|ILIST;mergeSort| |f| |q| (- |n| |l|) $) . #2#)
               (EXIT (SPADCALL |f| |p| |q| (QREFELT $ 57))))))))))) 

(DEFUN |IndexedList| (&REST #1=#:G1121)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1122)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|IndexedList|)
                                           '|domainEqualList|)
                . #3=(|IndexedList|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |IndexedList;|) #1#)
                (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|IndexedList|))))))))))) 

(DEFUN |IndexedList;| (|#1| |#2|)
  (PROG (#1=#:G1120 |pv$| #2=#:G1118 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|IndexedList|))
      (LETT DV$2 (|devaluate| |#2|) . #3#)
      (LETT |dv$| (LIST '|IndexedList| DV$1 DV$2) . #3#)
      (LETT $ (GETREFV 72) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#1| '(|OrderedSet|))
                                          (|HasCategory| |#1|
                                                         '(|CoercibleTo|
                                                           (|OutputForm|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #3#)
                                          (OR
                                           (|HasCategory| |#1| '(|OrderedSet|))
                                           #2#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #2#)
                                          (OR
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            #2#))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            #2#))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|IndexedList| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 512))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 1024))
      (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)) . #3#)
           (|augmentPredVector| $ 2048))
      (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
           (|augmentPredVector| $ 4096))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 45 (CONS (|dispatchFunction| |ILIST;coerce;$Of;21|) $))))
      (COND
       ((|testBitVector| |pv$| 5)
        (PROGN
         (QSETREFV $ 47 (CONS (|dispatchFunction| |ILIST;=;2$B;22|) $))
         (QSETREFV $ 50 (CONS (|dispatchFunction| |ILIST;latex;$S;23|) $))
         (QSETREFV $ 52
                   (CONS (|dispatchFunction| |ILIST;member?;S$B;24|) $)))))
      (COND
       ((|testBitVector| |pv$| 5)
        (QSETREFV $ 54
                  (CONS (|dispatchFunction| |ILIST;removeDuplicates!;2$;26|)
                        $))))
      $)))) 

(MAKEPROP '|IndexedList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) |ILIST;#;$Nni;1| |ILIST;concat;S2$;2|
              (|Boolean|) |ILIST;eq?;2$B;3| |ILIST;first;$S;4| '"first"
              |ILIST;elt;$firstS;5| |ILIST;empty;$;6| |ILIST;empty?;$B;7|
              |ILIST;rest;2$;8| '"rest" |ILIST;elt;$rest$;9|
              |ILIST;setfirst!;$2S;10| |ILIST;setelt;$first2S;11|
              |ILIST;setrest!;3$;12| |ILIST;setelt;$rest2$;13| (|List| 6)
              |ILIST;construct;L$;14| |ILIST;parts;$L;15|
              |ILIST;reverse!;2$;16| |ILIST;reverse;2$;17| (|Integer|)
              |ILIST;minIndex;$I;18| |ILIST;rest;$Nni$;19| (0 . |cyclic?|)
              |ILIST;copy;2$;20| (5 . |cycleEntry|) (|OutputForm|)
              (10 . |coerce|) (|List| $) (15 . |bracket|) (|List| 36)
              (20 . |list|) (25 . |commaSeparate|) (30 . |overbar|)
              (35 . |concat!|) (41 . |coerce|) (46 . ~=) (52 . =) (|String|)
              (58 . |latex|) (63 . |latex|) (68 . =) (74 . |member?|)
              |ILIST;concat!;3$;25| (80 . |removeDuplicates!|)
              (|Mapping| 11 6 6) |ILIST;sort!;M2$;27| |ILIST;merge!;M3$;28|
              |ILIST;split!;$I$;29| (|Mapping| 6 6 6) (|Equation| 6)
              (|List| 60) (|Mapping| 11 6) (|Void|) (|UniversalSegment| 30)
              '"last" '"value" (|Mapping| 6 6) (|InputForm|) (|SingleInteger|)
              (|List| 30) (|Union| 6 '"failed"))
           '#(~= 85 |value| 91 |third| 96 |tail| 101 |swap!| 106 |split!| 113
              |sorted?| 119 |sort!| 130 |sort| 141 |smaller?| 152 |size?| 158
              |setvalue!| 164 |setrest!| 170 |setlast!| 176 |setfirst!| 182
              |setelt| 188 |setchildren!| 230 |select!| 236 |select| 242
              |second| 248 |sample| 253 |reverse!| 257 |reverse| 262 |rest| 267
              |removeDuplicates!| 278 |removeDuplicates| 283 |remove!| 288
              |remove| 300 |reduce| 312 |qsetelt!| 333 |qelt| 340
              |possiblyInfinite?| 346 |position| 351 |parts| 370 |nodes| 375
              |node?| 380 |new| 386 |more?| 392 |minIndex| 398 |min| 403
              |merge!| 409 |merge| 422 |members| 435 |member?| 440 |maxIndex|
              446 |max| 451 |map!| 457 |map| 463 |list| 476 |less?| 481
              |leaves| 487 |leaf?| 492 |latex| 497 |last| 502 |insert!| 513
              |insert| 527 |indices| 541 |index?| 546 |hash| 552 |first| 557
              |find| 568 |fill!| 574 |explicitlyFinite?| 580 |every?| 585
              |eval| 591 |eq?| 617 |entry?| 623 |entries| 629 |empty?| 634
              |empty| 639 |elt| 643 |distance| 686 |delete!| 692 |delete| 704
              |cyclic?| 716 |cycleTail| 721 |cycleSplit!| 726 |cycleLength| 731
              |cycleEntry| 736 |count| 741 |copyInto!| 753 |copy| 760 |convert|
              765 |construct| 770 |concat!| 775 |concat| 787 |coerce| 810
              |children| 815 |child?| 820 |any?| 826 >= 832 > 838 = 844 <= 850
              < 856 |#| 862)
           'NIL
           (CONS
            (|makeByteWordVec2| 9
                                '(0 0 0 0 0 0 0 0 0 2 0 2 0 0 8 6 0 0 0 0 8 9 1
                                  6 2))
            (CONS
             '#(|ListAggregate&| |StreamAggregate&|
                |ExtensibleLinearAggregate&| |FiniteLinearAggregate&|
                |UnaryRecursiveAggregate&| |LinearAggregate&|
                |RecursiveAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| NIL NIL |BasicType&| |PartialOrder&|)
             (CONS
              '#((|ListAggregate| 6) (|StreamAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 30 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 30 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 30 6)
                 (|InnerEvalable| 6 6) (|CoercibleTo| 36) (|ConvertibleTo| 68)
                 (|BasicType|) (|PartialOrder|))
              (|makeByteWordVec2| 71
                                  '(1 0 11 0 33 1 0 0 0 35 1 6 36 0 37 1 36 0
                                    38 39 1 40 0 36 41 1 36 0 38 42 1 36 0 0 43
                                    2 40 0 0 36 44 1 0 36 0 45 2 6 11 0 0 46 2
                                    0 11 0 0 47 1 6 48 0 49 1 0 48 0 50 2 6 11
                                    0 0 51 2 0 11 6 0 52 1 0 0 0 54 2 5 11 0 0
                                    1 1 0 6 0 1 1 0 6 0 1 1 0 0 0 1 3 12 63 0
                                    30 30 1 2 12 0 0 30 58 1 2 11 0 1 2 0 11 55
                                    0 1 1 13 0 0 1 2 12 0 55 0 56 1 2 0 0 1 2 0
                                    0 55 0 1 2 2 11 0 0 1 2 0 11 0 8 1 2 12 6 0
                                    6 1 2 12 0 0 0 23 2 12 6 0 6 1 2 12 6 0 6
                                    21 3 12 6 0 30 6 1 3 12 6 0 64 6 1 3 12 6 0
                                    65 6 1 3 12 0 0 19 0 24 3 12 6 0 14 6 22 3
                                    12 6 0 66 6 1 2 12 0 0 38 1 2 0 0 62 0 1 2
                                    10 0 62 0 1 1 0 6 0 1 0 0 0 1 1 12 0 0 28 1
                                    0 0 0 29 2 0 0 0 8 32 1 0 0 0 18 1 5 0 0 54
                                    1 11 0 0 1 2 5 0 6 0 1 2 0 0 62 0 1 2 11 0
                                    6 0 1 2 10 0 62 0 1 4 11 6 59 0 6 6 1 3 10
                                    6 59 0 6 1 2 10 6 59 0 1 3 12 6 0 30 6 1 2
                                    0 6 0 30 1 1 0 11 0 1 3 5 30 6 0 30 1 2 5
                                    30 6 0 1 2 0 30 62 0 1 1 10 25 0 27 1 0 38
                                    0 1 2 5 11 0 0 1 2 0 0 8 6 1 2 0 11 0 8 1 1
                                    4 30 0 31 2 2 0 0 0 1 2 2 0 0 0 1 3 0 0 55
                                    0 0 57 2 2 0 0 0 1 3 0 0 55 0 0 1 1 10 25 0
                                    1 2 11 11 6 0 52 1 4 30 0 1 2 2 0 0 0 1 2
                                    12 0 67 0 1 3 0 0 59 0 0 1 2 0 0 67 0 1 1 0
                                    0 6 1 2 0 11 0 8 1 1 0 25 0 1 1 0 11 0 1 1
                                    5 48 0 50 2 0 0 0 8 1 1 0 6 0 1 3 0 0 0 0
                                    30 1 3 0 0 6 0 30 1 3 0 0 6 0 30 1 3 0 0 0
                                    0 30 1 1 0 70 0 1 2 0 11 30 0 1 1 5 69 0 1
                                    2 0 0 0 8 1 1 0 6 0 13 2 0 71 62 0 1 2 12 0
                                    0 6 1 1 0 11 0 1 2 10 11 62 0 1 3 7 0 0 6 6
                                    1 3 7 0 0 25 25 1 2 7 0 0 60 1 2 7 0 0 61 1
                                    2 0 11 0 0 12 2 11 11 6 0 1 1 0 25 0 1 1 0
                                    11 0 17 0 0 0 16 2 0 6 0 30 1 3 0 6 0 30 6
                                    1 2 0 0 0 64 1 2 0 6 0 65 1 2 0 0 0 19 20 2
                                    0 6 0 14 15 2 0 6 0 66 1 2 0 30 0 0 1 2 0 0
                                    0 30 1 2 0 0 0 64 1 2 0 0 0 30 1 2 0 0 0 64
                                    1 1 0 11 0 33 1 0 0 0 1 1 12 0 0 1 1 0 8 0
                                    1 1 0 0 0 35 2 11 8 6 0 1 2 10 8 62 0 1 3
                                    12 0 0 0 30 1 1 0 0 0 34 1 1 68 0 1 1 0 0
                                    25 26 2 0 0 0 6 1 2 0 0 0 0 53 1 0 0 38 1 2
                                    0 0 0 6 1 2 0 0 6 0 10 2 0 0 0 0 1 1 3 36 0
                                    45 1 0 38 0 1 2 5 11 0 0 1 2 10 11 62 0 1 2
                                    2 11 0 0 1 2 2 11 0 0 1 2 5 11 0 0 47 2 2
                                    11 0 0 1 2 2 11 0 0 1 1 10 8 0 9)))))
           '|lookupComplete|)) 
