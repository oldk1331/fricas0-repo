
(/VERSIONCHECK 2) 

(DEFUN |URAGG-;elt;AfirstS;1| (|x| T3 $) (SPADCALL |x| (QREFELT $ 8))) 

(DEFUN |URAGG-;elt;AlastS;2| (|x| T4 $) (SPADCALL |x| (QREFELT $ 11))) 

(DEFUN |URAGG-;elt;ArestA;3| (|x| T5 $) (SPADCALL |x| (QREFELT $ 14))) 

(DEFUN |URAGG-;second;AS;4| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 8))) 

(DEFUN |URAGG-;third;AS;5| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 14))
            (QREFELT $ 8))) 

(DEFUN |URAGG-;cyclic?;AB;6| (|x| $)
  (COND
   ((OR (SPADCALL |x| (QREFELT $ 20))
        (SPADCALL (|URAGG-;findCycle| |x| $) (QREFELT $ 20)))
    'NIL)
   ('T 'T))) 

(DEFUN |URAGG-;last;AS;7| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 22)) (QREFELT $ 8))) 

(DEFUN |URAGG-;nodes;AL;8| (|x| $)
  (PROG (|l|)
    (RETURN
     (SEQ (LETT |l| NIL . #1=(|URAGG-;nodes;AL;8|))
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |x| (QREFELT $ 20)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ (LETT |l| (CONS |x| |l|) . #1#)
                    (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 14)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (NREVERSE |l|)))))) 

(DEFUN |URAGG-;children;AL;9| (|x| $)
  (PROG (|l|)
    (RETURN
     (SEQ (LETT |l| NIL |URAGG-;children;AL;9|)
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 20)) |l|)
                 ('T (CONS (SPADCALL |x| (QREFELT $ 14)) |l|)))))))) 

(DEFUN |URAGG-;leaf?;AB;10| (|x| $) (SPADCALL |x| (QREFELT $ 20))) 

(DEFUN |URAGG-;value;AS;11| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 20)) (|error| "value of empty object"))
        ('T (SPADCALL |x| (QREFELT $ 8))))) 

(DEFUN |URAGG-;less?;ANniB;12| (|l| |n| $)
  (PROG (|i|)
    (RETURN
     (SEQ (LETT |i| |n| . #1=(|URAGG-;less?;ANniB;12|))
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| 0 (QREFELT $ 30))
                    (COND ((SPADCALL |l| (QREFELT $ 20)) 'NIL) ('T 'T)))
                   ('T 'NIL)))
                 (GO G191)))
               (SEQ (LETT |l| (SPADCALL |l| (QREFELT $ 14)) . #1#)
                    (EXIT (LETT |i| (- |i| 1) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |i| 0 (QREFELT $ 30))))))) 

(DEFUN |URAGG-;more?;ANniB;13| (|l| |n| $)
  (PROG (|i|)
    (RETURN
     (SEQ (LETT |i| |n| . #1=(|URAGG-;more?;ANniB;13|))
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| 0 (QREFELT $ 30))
                    (COND ((SPADCALL |l| (QREFELT $ 20)) 'NIL) ('T 'T)))
                   ('T 'NIL)))
                 (GO G191)))
               (SEQ (LETT |l| (SPADCALL |l| (QREFELT $ 14)) . #1#)
                    (EXIT (LETT |i| (- |i| 1) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((ZEROP |i|)
             (COND ((SPADCALL |l| (QREFELT $ 20)) 'NIL) (#2='T 'T)))
            (#2# 'NIL))))))) 

(DEFUN |URAGG-;size?;ANniB;14| (|l| |n| $)
  (PROG (|i|)
    (RETURN
     (SEQ (LETT |i| |n| . #1=(|URAGG-;size?;ANniB;14|))
          (SEQ G190
               (COND
                ((NULL
                  (COND ((SPADCALL |l| (QREFELT $ 20)) 'NIL)
                        ('T (SPADCALL |i| 0 (QREFELT $ 30)))))
                 (GO G191)))
               (SEQ (LETT |l| (SPADCALL |l| (QREFELT $ 14)) . #1#)
                    (EXIT (LETT |i| (- |i| 1) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND ((SPADCALL |l| (QREFELT $ 20)) (ZEROP |i|)) ('T 'NIL))))))) 

(DEFUN |URAGG-;#;ANni;15| (|x| $)
  (PROG (|k|)
    (RETURN
     (SEQ
      (SEQ (LETT |k| 0 . #1=(|URAGG-;#;ANni;15|)) G190
           (COND
            ((NULL (COND ((SPADCALL |x| (QREFELT $ 20)) 'NIL) ('T 'T)))
             (GO G191)))
           (SEQ
            (COND
             ((EQL |k| 1000)
              (COND
               ((SPADCALL |x| (QREFELT $ 35))
                (EXIT (|error| "cyclic list"))))))
            (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 14)) . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |k|))))) 

(DEFUN |URAGG-;tail;2A;16| (|x| $)
  (PROG (|y| |k|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 20)) (|error| "empty list"))
            ('T
             (SEQ
              (LETT |y| (SPADCALL |x| (QREFELT $ 14))
                    . #1=(|URAGG-;tail;2A;16|))
              (SEQ (LETT |k| 0 . #1#) G190
                   (COND
                    ((NULL (COND ((SPADCALL |y| (QREFELT $ 20)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((EQL |k| 1000)
                      (COND
                       ((SPADCALL |x| (QREFELT $ 35))
                        (EXIT (|error| "cyclic list"))))))
                    (EXIT
                     (LETT |y| (SPADCALL (LETT |x| |y| . #1#) (QREFELT $ 14))
                           . #1#)))
                   (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
              (EXIT |x|)))))))) 

(DEFUN |URAGG-;findCycle| (|x| $)
  (PROG (|y| #1=#:G232)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |y| (SPADCALL |x| (QREFELT $ 14)) . #2=(|URAGG-;findCycle|))
            (SEQ G190
                 (COND
                  ((NULL (COND ((SPADCALL |y| (QREFELT $ 20)) 'NIL) ('T 'T)))
                   (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL |x| |y| (QREFELT $ 38))
                    (PROGN (LETT #1# |x| . #2#) (GO #1#))))
                  (LETT |x| (SPADCALL |x| (QREFELT $ 14)) . #2#)
                  (LETT |y| (SPADCALL |y| (QREFELT $ 14)) . #2#)
                  (COND
                   ((SPADCALL |y| (QREFELT $ 20))
                    (PROGN (LETT #1# |y| . #2#) (GO #1#))))
                  (COND
                   ((SPADCALL |x| |y| (QREFELT $ 38))
                    (PROGN (LETT #1# |y| . #2#) (GO #1#))))
                  (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 14)) . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT |y|)))
      #1# (EXIT #1#))))) 

(DEFUN |URAGG-;cycleTail;2A;18| (|x| $)
  (PROG (|z| |y|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |y|
               (LETT |x| (SPADCALL |x| (QREFELT $ 39))
                     . #1=(|URAGG-;cycleTail;2A;18|))
               . #1#)
         (QREFELT $ 20))
        |x|)
       ('T
        (SEQ (LETT |z| (SPADCALL |x| (QREFELT $ 14)) . #1#)
             (SEQ G190
                  (COND
                   ((NULL
                     (COND ((SPADCALL |x| |z| (QREFELT $ 38)) 'NIL) ('T 'T)))
                    (GO G191)))
                  (SEQ (LETT |y| |z| . #1#)
                       (EXIT (LETT |z| (SPADCALL |z| (QREFELT $ 14)) . #1#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT |y|)))))))) 

(DEFUN |URAGG-;cycleEntry;2A;19| (|x| $)
  (PROG (|y| |k| |z| |l|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 20)) |x|)
            ((SPADCALL
              (LETT |y| (|URAGG-;findCycle| |x| $)
                    . #1=(|URAGG-;cycleEntry;2A;19|))
              (QREFELT $ 20))
             |y|)
            ('T
             (SEQ (LETT |z| (SPADCALL |y| (QREFELT $ 14)) . #1#)
                  (SEQ (LETT |l| 1 . #1#) G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |y| |z| (QREFELT $ 38)) 'NIL)
                                ('T 'T)))
                         (GO G191)))
                       (SEQ
                        (EXIT (LETT |z| (SPADCALL |z| (QREFELT $ 14)) . #1#)))
                       (LETT |l| (|inc_SI| |l|) . #1#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |y| |x| . #1#)
                  (SEQ (LETT |k| 1 . #1#) G190
                       (COND ((|greater_SI| |k| |l|) (GO G191)))
                       (SEQ
                        (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 14)) . #1#)))
                       (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191
                       (EXIT NIL))
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |x| |y| (QREFELT $ 38)) 'NIL)
                                ('T 'T)))
                         (GO G191)))
                       (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 14)) . #1#)
                            (EXIT
                             (LETT |y| (SPADCALL |y| (QREFELT $ 14)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |x|)))))))) 

(DEFUN |URAGG-;cycleLength;ANni;20| (|x| $)
  (PROG (|y| |k|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |x| (QREFELT $ 20))
            (SPADCALL
             (LETT |x| (|URAGG-;findCycle| |x| $)
                   . #1=(|URAGG-;cycleLength;ANni;20|))
             (QREFELT $ 20)))
        0)
       ('T
        (SEQ (LETT |y| (SPADCALL |x| (QREFELT $ 14)) . #1#)
             (SEQ (LETT |k| 1 . #1#) G190
                  (COND
                   ((NULL
                     (COND ((SPADCALL |x| |y| (QREFELT $ 38)) 'NIL) ('T 'T)))
                    (GO G191)))
                  (SEQ (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 14)) . #1#)))
                  (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
             (EXIT |k|)))))))) 

(DEFUN |URAGG-;rest;ANniA;21| (|x| |n| $)
  (PROG (|i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 1 . #1=(|URAGG-;rest;ANniA;21|)) G190
           (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL |x| (QREFELT $ 20)) (|error| "Index out of range"))
              ('T (LETT |x| (SPADCALL |x| (QREFELT $ 14)) . #1#)))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |URAGG-;last;ANniA;22| (|x| |n| $)
  (PROG (#1=#:G259 |m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |x| (QREFELT $ 44)) . #2=(|URAGG-;last;ANniA;22|))
      (EXIT
       (COND ((SPADCALL |n| |m| (QREFELT $ 45)) (|error| "index out of range"))
             ('T
              (SPADCALL
               (SPADCALL |x|
                         (PROG1 (LETT #1# (- |m| |n|) . #2#)
                           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                            #1#))
                         (QREFELT $ 46))
               (QREFELT $ 47))))))))) 

(DEFUN |URAGG-;=;2AB;23| (|x| |y| $)
  (PROG (#1=#:G270 |k|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |x| |y| (QREFELT $ 38)) 'T)
             (#2='T
              (SEQ
               (SEQ (LETT |k| 0 . #3=(|URAGG-;=;2AB;23|)) G190
                    (COND
                     ((NULL
                       (COND
                        ((OR (SPADCALL |x| (QREFELT $ 20))
                             (SPADCALL |y| (QREFELT $ 20)))
                         'NIL)
                        ('T 'T)))
                      (GO G191)))
                    (SEQ
                     (COND
                      ((EQL |k| 1000)
                       (COND
                        ((SPADCALL |x| (QREFELT $ 35))
                         (EXIT (|error| "cyclic list"))))))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |x| (QREFELT $ 8))
                                  (SPADCALL |y| (QREFELT $ 8)) (QREFELT $ 49))
                        (PROGN (LETT #1# 'NIL . #3#) (GO #1#)))
                       ('T
                        (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 14)) . #3#)
                             (EXIT
                              (LETT |y| (SPADCALL |y| (QREFELT $ 14))
                                    . #3#)))))))
                    (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
               (EXIT
                (COND
                 ((SPADCALL |x| (QREFELT $ 20)) (SPADCALL |y| (QREFELT $ 20)))
                 (#2# 'NIL)))))))
      #1# (EXIT #1#))))) 

(DEFUN |URAGG-;node?;2AB;24| (|u| |v| $)
  (PROG (#1=#:G276 |k|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |k| 0 . #2=(|URAGG-;node?;2AB;24|)) G190
             (COND
              ((NULL (COND ((SPADCALL |v| (QREFELT $ 20)) 'NIL) ('T 'T)))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |u| |v| (QREFELT $ 51))
                 (PROGN (LETT #1# 'T . #2#) (GO #1#)))
                ('T
                 (SEQ
                  (COND
                   ((EQL |k| 1000)
                    (COND
                     ((SPADCALL |v| (QREFELT $ 35))
                      (EXIT (|error| "cyclic list"))))))
                  (EXIT (LETT |v| (SPADCALL |v| (QREFELT $ 14)) . #2#)))))))
             (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT (SPADCALL |u| |v| (QREFELT $ 51)))))
      #1# (EXIT #1#))))) 

(DEFUN |URAGG-;setelt;Afirst2S;25| (|x| T6 |a| $)
  (SPADCALL |x| |a| (QREFELT $ 53))) 

(DEFUN |URAGG-;setelt;Alast2S;26| (|x| T7 |a| $)
  (SPADCALL |x| |a| (QREFELT $ 55))) 

(DEFUN |URAGG-;setelt;Arest2A;27| (|x| T8 |a| $)
  (SPADCALL |x| |a| (QREFELT $ 57))) 

(DEFUN |URAGG-;concat;3A;28| (|x| |y| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 47)) |y| (QREFELT $ 59))) 

(DEFUN |URAGG-;setlast!;A2S;29| (|x| |s| $)
  (SEQ
   (COND ((SPADCALL |x| (QREFELT $ 20)) (|error| "setlast: empty list"))
         ('T
          (SEQ (SPADCALL (SPADCALL |x| (QREFELT $ 22)) |s| (QREFELT $ 53))
               (EXIT |s|)))))) 

(DEFUN |URAGG-;setchildren!;ALA;30| (|u| |lv| $)
  (COND
   ((EQL (LENGTH |lv|) 1) (SPADCALL |u| (|SPADfirst| |lv|) (QREFELT $ 57)))
   ('T (|error| "wrong number of children specified")))) 

(DEFUN |URAGG-;setvalue!;A2S;31| (|u| |s| $) (SPADCALL |u| |s| (QREFELT $ 53))) 

(DEFUN |URAGG-;split!;AIA;32| (|p| |n| $)
  (PROG (|q| #1=#:G287)
    (RETURN
     (SEQ
      (COND ((< |n| 1) (|error| "index out of range"))
            ('T
             (SEQ
              (LETT |p|
                    (SPADCALL |p|
                              (PROG1
                                  (LETT #1# (- |n| 1)
                                        . #2=(|URAGG-;split!;AIA;32|))
                                (|check_subtype| (>= #1# 0)
                                                 '(|NonNegativeInteger|) #1#))
                              (QREFELT $ 46))
                    . #2#)
              (LETT |q| (SPADCALL |p| (QREFELT $ 14)) . #2#)
              (SPADCALL |p| (SPADCALL (QREFELT $ 64)) (QREFELT $ 57))
              (EXIT |q|)))))))) 

(DEFUN |URAGG-;cycleSplit!;2A;33| (|x| $)
  (PROG (|z| |y|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (SPADCALL
          (LETT |y| (SPADCALL |x| (QREFELT $ 39))
                . #1=(|URAGG-;cycleSplit!;2A;33|))
          (QREFELT $ 20))
         (SPADCALL |x| |y| (QREFELT $ 38)))
        |y|)
       ('T
        (SEQ (LETT |z| (SPADCALL |x| (QREFELT $ 14)) . #1#)
             (SEQ G190
                  (COND
                   ((NULL
                     (COND ((SPADCALL |z| |y| (QREFELT $ 38)) 'NIL) ('T 'T)))
                    (GO G191)))
                  (SEQ (LETT |x| |z| . #1#)
                       (EXIT (LETT |z| (SPADCALL |z| (QREFELT $ 14)) . #1#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (SPADCALL |x| (SPADCALL (QREFELT $ 64)) (QREFELT $ 57))
             (EXIT |y|)))))))) 

(DECLAIM (NOTINLINE |UnaryRecursiveAggregate&;|)) 

(DEFUN |UnaryRecursiveAggregate&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|UnaryRecursiveAggregate&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|UnaryRecursiveAggregate&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 68) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|shallowlyMutable|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|finiteAggregate|))
        (QSETREFV $ 48 (CONS (|dispatchFunction| |URAGG-;last;ANniA;22|) $))))
      (COND
       ((|HasCategory| |#2| '(|SetCategory|))
        (PROGN
         (QSETREFV $ 50 (CONS (|dispatchFunction| |URAGG-;=;2AB;23|) $))
         (QSETREFV $ 52 (CONS (|dispatchFunction| |URAGG-;node?;2AB;24|) $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 54
                   (CONS (|dispatchFunction| |URAGG-;setelt;Afirst2S;25|) $))
         (QSETREFV $ 56
                   (CONS (|dispatchFunction| |URAGG-;setelt;Alast2S;26|) $))
         (QSETREFV $ 58
                   (CONS (|dispatchFunction| |URAGG-;setelt;Arest2A;27|) $))
         (QSETREFV $ 60 (CONS (|dispatchFunction| |URAGG-;concat;3A;28|) $))
         (QSETREFV $ 61 (CONS (|dispatchFunction| |URAGG-;setlast!;A2S;29|) $))
         (QSETREFV $ 62
                   (CONS (|dispatchFunction| |URAGG-;setchildren!;ALA;30|) $))
         (QSETREFV $ 63
                   (CONS (|dispatchFunction| |URAGG-;setvalue!;A2S;31|) $))
         (QSETREFV $ 65 (CONS (|dispatchFunction| |URAGG-;split!;AIA;32|) $))
         (QSETREFV $ 66
                   (CONS (|dispatchFunction| |URAGG-;cycleSplit!;2A;33|) $)))))
      $)))) 

(MAKEPROP '|UnaryRecursiveAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |first|) '"first" |URAGG-;elt;AfirstS;1| (5 . |last|)
              '"last" |URAGG-;elt;AlastS;2| (10 . |rest|) '"rest"
              |URAGG-;elt;ArestA;3| |URAGG-;second;AS;4| |URAGG-;third;AS;5|
              (|Boolean|) (15 . |empty?|) |URAGG-;cyclic?;AB;6| (20 . |tail|)
              |URAGG-;last;AS;7| (|List| $) |URAGG-;nodes;AL;8|
              |URAGG-;children;AL;9| |URAGG-;leaf?;AB;10| |URAGG-;value;AS;11|
              (|Integer|) (25 . >) (|NonNegativeInteger|)
              |URAGG-;less?;ANniB;12| |URAGG-;more?;ANniB;13|
              |URAGG-;size?;ANniB;14| (31 . |cyclic?|) |URAGG-;#;ANni;15|
              |URAGG-;tail;2A;16| (36 . |eq?|) (42 . |cycleEntry|)
              |URAGG-;cycleTail;2A;18| |URAGG-;cycleEntry;2A;19|
              |URAGG-;cycleLength;ANni;20| |URAGG-;rest;ANniA;21| (47 . |#|)
              (52 . >) (58 . |rest|) (64 . |copy|) (69 . |last|) (75 . ~=)
              (81 . =) (87 . =) (93 . |node?|) (99 . |setfirst!|)
              (105 . |setelt|) (112 . |setlast!|) (118 . |setelt|)
              (125 . |setrest!|) (131 . |setelt|) (138 . |concat!|)
              (144 . |concat|) (150 . |setlast!|) (156 . |setchildren!|)
              (162 . |setvalue!|) (168 . |empty|) (172 . |split!|)
              (178 . |cycleSplit!|) '"value")
           '#(|value| 183 |third| 188 |tail| 193 |split!| 198 |size?| 204
              |setvalue!| 210 |setlast!| 216 |setelt| 222 |setchildren!| 243
              |second| 249 |rest| 254 |nodes| 260 |node?| 265 |more?| 271
              |less?| 277 |leaf?| 283 |last| 288 |elt| 299 |cyclic?| 317
              |cycleTail| 322 |cycleSplit!| 327 |cycleLength| 332 |cycleEntry|
              337 |concat| 342 |children| 348 = 353 |#| 359)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 66
                                                 '(1 6 7 0 8 1 6 7 0 11 1 6 0 0
                                                   14 1 6 19 0 20 1 6 0 0 22 2
                                                   29 19 0 0 30 1 6 19 0 35 2 6
                                                   19 0 0 38 1 6 0 0 39 1 6 31
                                                   0 44 2 31 19 0 0 45 2 6 0 0
                                                   31 46 1 6 0 0 47 2 0 0 0 31
                                                   48 2 7 19 0 0 49 2 0 19 0 0
                                                   50 2 6 19 0 0 51 2 0 19 0 0
                                                   52 2 6 7 0 7 53 3 0 7 0 9 7
                                                   54 2 6 7 0 7 55 3 0 7 0 12 7
                                                   56 2 6 0 0 0 57 3 0 0 0 15 0
                                                   58 2 6 0 0 0 59 2 0 0 0 0 60
                                                   2 0 7 0 7 61 2 0 0 0 24 62 2
                                                   0 7 0 7 63 0 6 0 64 2 0 0 0
                                                   29 65 1 0 0 0 66 1 0 7 0 28
                                                   1 0 7 0 18 1 0 0 0 37 2 0 0
                                                   0 29 65 2 0 19 0 31 34 2 0 7
                                                   0 7 63 2 0 7 0 7 61 3 0 7 0
                                                   12 7 56 3 0 0 0 15 0 58 3 0
                                                   7 0 9 7 54 2 0 0 0 24 62 1 0
                                                   7 0 17 2 0 0 0 31 43 1 0 24
                                                   0 25 2 0 19 0 0 52 2 0 19 0
                                                   31 33 2 0 19 0 31 32 1 0 19
                                                   0 27 2 0 0 0 31 48 1 0 7 0
                                                   23 2 0 7 0 12 13 2 0 0 0 15
                                                   16 2 0 7 0 9 10 1 0 19 0 21
                                                   1 0 0 0 40 1 0 0 0 66 1 0 31
                                                   0 42 1 0 0 0 41 2 0 0 0 0 60
                                                   1 0 24 0 26 2 0 19 0 0 50 1
                                                   0 31 0 36)))))
           '|lookupComplete|)) 
