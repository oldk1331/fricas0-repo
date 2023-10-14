
(/VERSIONCHECK 2) 

(DEFUN |TBAGG-;table;S;1| ($) (SPADCALL (QREFELT $ 9))) 

(DEFUN |TBAGG-;table;LS;2| (|l| $) (SPADCALL |l| (QREFELT $ 13))) 

(DEFUN |TBAGG-;insert!;R2S;3| (|p| |t| $)
  (SEQ (SPADCALL |t| (QCAR |p|) (QCDR |p|) (QREFELT $ 15)) (EXIT |t|))) 

(DEFUN |TBAGG-;indices;SL;4| (|t| $) (SPADCALL |t| (QREFELT $ 18))) 

(DEFUN |TBAGG-;coerce;SOf;5| (|t| $)
  (PROG (#1=#:G151 |k| #2=#:G150)
    (RETURN
     (SEQ
      (SPADCALL "table"
                (PROGN
                 (LETT #2# NIL . #3=(|TBAGG-;coerce;SOf;5|))
                 (SEQ (LETT |k| NIL . #3#)
                      (LETT #1# (SPADCALL |t| (QREFELT $ 18)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |k| (QREFELT $ 21))
                                         (SPADCALL
                                          (SPADCALL |t| |k| (QREFELT $ 22))
                                          (QREFELT $ 23))
                                         (QREFELT $ 24))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 26)))))) 

(DEFUN |TBAGG-;elt;SKeyEntry;6| (|t| |k| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |k| |t| (QREFELT $ 29)) |TBAGG-;elt;SKeyEntry;6|)
          (EXIT
           (COND ((QEQCAR |r| 0) (QCDR |r|))
                 ('T (|error| "key not in table")))))))) 

(DEFUN |TBAGG-;elt;SKey2Entry;7| (|t| |k| |e| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL |k| |t| (QREFELT $ 29)) |TBAGG-;elt;SKey2Entry;7|)
      (EXIT (COND ((QEQCAR |r| 0) (QCDR |r|)) ('T |e|))))))) 

(DEFUN |TBAGG-;map!;M2S;8| (|f| |t| $)
  (PROG (#1=#:G166 |k|)
    (RETURN
     (SEQ
      (SEQ (LETT |k| NIL . #2=(|TBAGG-;map!;M2S;8|))
           (LETT #1# (SPADCALL |t| (QREFELT $ 18)) . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |t| |k| (SPADCALL (SPADCALL |t| |k| (QREFELT $ 22)) |f|)
                       (QREFELT $ 15))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |t|))))) 

(DEFUN |TBAGG-;map;M3S;9| (|f| |s| |t| $)
  (PROG (#1=#:G171 |k| |z|)
    (RETURN
     (SEQ (LETT |z| (SPADCALL (QREFELT $ 34)) . #2=(|TBAGG-;map;M3S;9|))
          (SEQ (LETT |k| NIL . #2#)
               (LETT #1# (SPADCALL |s| (QREFELT $ 18)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |k| |t| (QREFELT $ 36))
                   (SPADCALL |z| |k|
                             (SPADCALL (SPADCALL |s| |k| (QREFELT $ 22))
                                       (SPADCALL |t| |k| (QREFELT $ 22)) |f|)
                             (QREFELT $ 15))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |z|))))) 

(DEFUN |TBAGG-;parts;SL;10| (|t| $)
  (PROG (#1=#:G176 |k| #2=#:G175)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|TBAGG-;parts;SL;10|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# (SPADCALL |t| (QREFELT $ 18)) . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (CONS |k| (SPADCALL |t| |k| (QREFELT $ 22))) #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |TBAGG-;parts;SL;11| (|t| $)
  (PROG (#1=#:G180 |k| #2=#:G179)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|TBAGG-;parts;SL;11|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# (SPADCALL |t| (QREFELT $ 18)) . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |t| |k| (QREFELT $ 22)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |TBAGG-;entries;SL;12| (|t| $) (SPADCALL |t| (QREFELT $ 42))) 

(DEFUN |TBAGG-;=;2SB;13| (|s| |t| $)
  (PROG (#1=#:G187 #2=#:G191 |e| #3=#:G192 |k|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |s| |t| (QREFELT $ 44)) 'T)
             ((SPADCALL (SPADCALL |s| (QREFELT $ 46))
                        (SPADCALL |t| (QREFELT $ 46)) (QREFELT $ 47))
              'NIL)
             ('T
              (SEQ
               (SEQ
                (EXIT
                 (SEQ (LETT |k| NIL . #4=(|TBAGG-;=;2SB;13|))
                      (LETT #3# (SPADCALL |s| (QREFELT $ 18)) . #4#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                        (GO G191)))
                      (SEQ (LETT |e| (SPADCALL |k| |t| (QREFELT $ 29)) . #4#)
                           (EXIT
                            (COND
                             ((OR (QEQCAR |e| 1)
                                  (SPADCALL (QCDR |e|)
                                            (SPADCALL |s| |k| (QREFELT $ 22))
                                            (QREFELT $ 48)))
                              (PROGN
                               (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#))
                                     . #4#)
                               (GO #1#))))))
                      (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                #1# (EXIT #1#))
               (EXIT 'T)))))
      #2# (EXIT #2#))))) 

(DEFUN |TBAGG-;map;M2S;14| (|f| |t| $)
  (PROG (|ke| #1=#:G199 |k| |z|)
    (RETURN
     (SEQ (LETT |z| (SPADCALL (QREFELT $ 34)) . #2=(|TBAGG-;map;M2S;14|))
          (SEQ (LETT |k| NIL . #2#)
               (LETT #1# (SPADCALL |t| (QREFELT $ 18)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |ke|
                      (SPADCALL (CONS |k| (SPADCALL |t| |k| (QREFELT $ 22)))
                                |f|)
                      . #2#)
                (EXIT (SPADCALL |z| (QCAR |ke|) (QCDR |ke|) (QREFELT $ 15))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |z|))))) 

(DEFUN |TBAGG-;map!;M2S;15| (|f| |t| $)
  (PROG (#1=#:G209 |ke| |lke| #2=#:G202 #3=#:G208 |k|)
    (RETURN
     (SEQ (LETT |lke| NIL . #4=(|TBAGG-;map!;M2S;15|))
          (SEQ (LETT |k| NIL . #4#)
               (LETT #3# (SPADCALL |t| (QREFELT $ 18)) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |lke|
                       (CONS
                        (SPADCALL
                         (CONS |k|
                               (PROG2
                                   (LETT #2# (SPADCALL |k| |t| (QREFELT $ 52))
                                         . #4#)
                                   (QCDR #2#)
                                 (|check_union| (QEQCAR #2# 0) (QREFELT $ 8)
                                                #2#)))
                         |f|)
                        |lke|)
                       . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |ke| NIL . #4#) (LETT #1# |lke| . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ke| (CAR #1#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT (SPADCALL |t| (QCAR |ke|) (QCDR |ke|) (QREFELT $ 15))))
               (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |t|))))) 

(DEFUN |TBAGG-;inspect;SR;16| (|t| $)
  (PROG (|ks|)
    (RETURN
     (SEQ (LETT |ks| (SPADCALL |t| (QREFELT $ 18)) |TBAGG-;inspect;SR;16|)
          (EXIT
           (COND
            ((NULL |ks|) (|error| "Cannot extract from an empty aggregate"))
            ('T
             (CONS (|SPADfirst| |ks|)
                   (SPADCALL |t| (|SPADfirst| |ks|) (QREFELT $ 22)))))))))) 

(DEFUN |TBAGG-;find;MSU;17| (|f| |t| $)
  (PROG (#1=#:G224 #2=#:G225 |ke|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |ke| NIL . #3=(|TBAGG-;find;MSU;17|))
             (LETT #2# (SPADCALL |t| (QREFELT $ 55)) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |ke| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |ke| |f|)
                 (PROGN (LETT #1# (CONS 0 |ke|) . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(DEFUN |TBAGG-;index?;KeySB;18| (|k| |t| $)
  (QEQCAR (SPADCALL |k| |t| (QREFELT $ 29)) 0)) 

(DEFUN |TBAGG-;remove!;R2S;19| (|x| |t| $)
  (SEQ
   (COND
    ((SPADCALL |x| |t| (QREFELT $ 60))
     (SPADCALL (QCAR |x|) |t| (QREFELT $ 52))))
   (EXIT |t|))) 

(DEFUN |TBAGG-;extract!;SR;20| (|t| $)
  (PROG (|k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |t| (QREFELT $ 62)) |TBAGG-;extract!;SR;20|)
          (SPADCALL (QCAR |k|) |t| (QREFELT $ 52)) (EXIT |k|))))) 

(DEFUN |TBAGG-;any?;MSB;21| (|f| |t| $)
  (PROG (#1=#:G243 #2=#:G244 |k|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |k| NIL . #3=(|TBAGG-;any?;MSB;21|))
             (LETT #2# (SPADCALL |t| (QREFELT $ 18)) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |t| |k| (QREFELT $ 22)) |f|)
                 (PROGN (LETT #1# 'T . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |TBAGG-;every?;MSB;22| (|f| |t| $)
  (PROG (#1=#:G248 #2=#:G249 |k|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |k| NIL . #3=(|TBAGG-;every?;MSB;22|))
             (LETT #2# (SPADCALL |t| (QREFELT $ 18)) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((COND ((SPADCALL (SPADCALL |t| |k| (QREFELT $ 22)) |f|) 'NIL)
                       ('T 'T))
                 (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |TBAGG-;count;MSNni;23| (|f| |t| $)
  (PROG (|tally| #1=#:G253 |k|)
    (RETURN
     (SEQ (LETT |tally| 0 . #2=(|TBAGG-;count;MSNni;23|))
          (SEQ (LETT |k| NIL . #2#)
               (LETT #1# (SPADCALL |t| (QREFELT $ 18)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |t| |k| (QREFELT $ 22)) |f|)
                   (LETT |tally| (+ |tally| 1) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |tally|))))) 

(DEFUN |TableAggregate&| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TableAggregate&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|TableAggregate&| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 68) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#3| '(|CoercibleTo| (|OutputForm|)))
        (QSETREFV $ 27 (CONS (|dispatchFunction| |TBAGG-;coerce;SOf;5|) $))))
      (COND
       ((|HasCategory| |#1| '(|finiteAggregate|))
        (PROGN
         (QSETREFV $ 39 (CONS (|dispatchFunction| |TBAGG-;parts;SL;10|) $))
         (QSETREFV $ 41 (CONS (|dispatchFunction| |TBAGG-;parts;SL;11|) $))
         (QSETREFV $ 43 (CONS (|dispatchFunction| |TBAGG-;entries;SL;12|) $))
         (COND
          ((|HasCategory| |#3| '(|BasicType|))
           (QSETREFV $ 49 (CONS (|dispatchFunction| |TBAGG-;=;2SB;13|) $))))
         (QSETREFV $ 51 (CONS (|dispatchFunction| |TBAGG-;map;M2S;14|) $))
         (COND
          ((|HasCategory| |#3| '(|BasicType|))
           (QSETREFV $ 53 (CONS (|dispatchFunction| |TBAGG-;map!;M2S;15|) $))))
         (QSETREFV $ 54 (CONS (|dispatchFunction| |TBAGG-;inspect;SR;16|) $))
         (QSETREFV $ 58 (CONS (|dispatchFunction| |TBAGG-;find;MSU;17|) $))
         (QSETREFV $ 59 (CONS (|dispatchFunction| |TBAGG-;index?;KeySB;18|) $))
         (COND
          ((|HasCategory| |#3| '(|BasicType|))
           (QSETREFV $ 61
                     (CONS (|dispatchFunction| |TBAGG-;remove!;R2S;19|) $))))
         (QSETREFV $ 63 (CONS (|dispatchFunction| |TBAGG-;extract!;SR;20|) $))
         (QSETREFV $ 65 (CONS (|dispatchFunction| |TBAGG-;any?;MSB;21|) $))
         (QSETREFV $ 66 (CONS (|dispatchFunction| |TBAGG-;every?;MSB;22|) $))
         (QSETREFV $ 67
                   (CONS (|dispatchFunction| |TBAGG-;count;MSNni;23|) $)))))
      $)))) 

(MAKEPROP '|TableAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |empty|) |TBAGG-;table;S;1|
              (|Record| (|:| |key| 7) (|:| |entry| 8)) (|List| 11)
              (4 . |dictionary|) |TBAGG-;table;LS;2| (9 . |setelt|)
              |TBAGG-;insert!;R2S;3| (|List| 7) (16 . |keys|)
              |TBAGG-;indices;SL;4| (|OutputForm|) (21 . |coerce|) (26 . |elt|)
              (32 . |coerce|) (37 . =) (|List| $) (43 . |prefix|)
              (49 . |coerce|) (|Union| 8 '"failed") (54 . |search|)
              |TBAGG-;elt;SKeyEntry;6| |TBAGG-;elt;SKey2Entry;7|
              (|Mapping| 8 8) |TBAGG-;map!;M2S;8| (60 . |table|) (|Boolean|)
              (64 . |key?|) (|Mapping| 8 8 8) |TBAGG-;map;M3S;9| (70 . |parts|)
              (|List| 8) (75 . |parts|) (80 . |parts|) (85 . |entries|)
              (90 . |eq?|) (|NonNegativeInteger|) (96 . |#|) (101 . ~=)
              (107 . ~=) (113 . =) (|Mapping| 11 11) (119 . |map|)
              (125 . |remove!|) (131 . |map!|) (137 . |inspect|)
              (142 . |parts|) (|Union| 11 '"failed") (|Mapping| 35 11)
              (147 . |find|) (153 . |index?|) (159 . |member?|)
              (165 . |remove!|) (171 . |inspect|) (176 . |extract!|)
              (|Mapping| 35 8) (181 . |any?|) (187 . |every?|) (193 . |count|))
           '#(|table| 199 |remove!| 208 |parts| 214 |map!| 224 |map| 236
              |inspect| 249 |insert!| 254 |indices| 260 |index?| 265 |find| 271
              |extract!| 277 |every?| 282 |entries| 288 |elt| 293 |count| 306
              |coerce| 312 |any?| 317 = 323)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 67
                                                 '(0 6 0 9 1 6 0 12 13 3 6 8 0
                                                   7 8 15 1 6 17 0 18 1 7 20 0
                                                   21 2 6 8 0 7 22 1 8 20 0 23
                                                   2 20 0 0 0 24 2 20 0 0 25 26
                                                   1 0 20 0 27 2 6 28 7 0 29 0
                                                   6 0 34 2 6 35 7 0 36 1 0 12
                                                   0 39 1 0 40 0 41 1 6 40 0 42
                                                   1 0 40 0 43 2 6 35 0 0 44 1
                                                   6 45 0 46 2 45 35 0 0 47 2 8
                                                   35 0 0 48 2 0 35 0 0 49 2 0
                                                   0 50 0 51 2 6 28 7 0 52 2 0
                                                   0 50 0 53 1 0 11 0 54 1 6 12
                                                   0 55 2 0 56 57 0 58 2 0 35 7
                                                   0 59 2 6 35 11 0 60 2 0 0 11
                                                   0 61 1 6 11 0 62 1 0 11 0 63
                                                   2 0 35 64 0 65 2 0 35 64 0
                                                   66 2 0 45 64 0 67 0 0 0 10 1
                                                   0 0 12 14 2 0 0 11 0 61 1 0
                                                   40 0 41 1 0 12 0 39 2 0 0 32
                                                   0 33 2 0 0 50 0 53 3 0 0 37
                                                   0 0 38 2 0 0 50 0 51 1 0 11
                                                   0 54 2 0 0 11 0 16 1 0 17 0
                                                   19 2 0 35 7 0 59 2 0 56 57 0
                                                   58 1 0 11 0 63 2 0 35 64 0
                                                   66 1 0 40 0 43 3 0 8 0 7 8
                                                   31 2 0 8 0 7 30 2 0 45 64 0
                                                   67 1 0 20 0 27 2 0 35 64 0
                                                   65 2 0 35 0 0 49)))))
           '|lookupComplete|)) 
