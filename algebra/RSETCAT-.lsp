
(DEFUN |RSETCAT-;purelyAlgebraic?;PSB;1| (|p| |ts| $)
  (COND ((SPADCALL |p| (QREFELT $ 12)) 'T)
        ((NULL (SPADCALL (SPADCALL |p| (QREFELT $ 13)) |ts| (QREFELT $ 14)))
         'NIL)
        ('T (SPADCALL |p| |ts| (QREFELT $ 15))))) 

(DEFUN |RSETCAT-;purelyTranscendental?;PSB;2| (|p| |ts| $)
  (PROG (|lv|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |ts| (QREFELT $ 17)) 'T)
            ('T
             (SEQ
              (LETT |lv| (SPADCALL |p| (QREFELT $ 19))
                    . #1=(|RSETCAT-;purelyTranscendental?;PSB;2|))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((OR (NULL |lv|)
                            (SPADCALL (|SPADfirst| |lv|) |ts| (QREFELT $ 14)))
                        'NIL)
                       ('T 'T)))
                     (GO G191)))
                   (SEQ (EXIT (LETT |lv| (CDR |lv|) . #1#))) NIL (GO G190) G191
                   (EXIT NIL))
              (EXIT (NULL |lv|))))))))) 

(DEFUN |RSETCAT-;purelyAlgebraicLeadingMonomial?;PSB;3| (|p| |ts| $)
  (COND ((SPADCALL |p| (QREFELT $ 12)) 'T)
        ((SPADCALL (SPADCALL |p| (QREFELT $ 13)) |ts| (QREFELT $ 14))
         (SPADCALL (SPADCALL |p| (QREFELT $ 21)) |ts| (QREFELT $ 22)))
        ('T 'NIL))) 

(DEFUN |RSETCAT-;algebraicCoefficients?;PSB;4| (|p| |ts| $)
  (SEQ
   (COND ((SPADCALL |p| (QREFELT $ 12)) 'T)
         (#1='T
          (SEQ
           (COND
            ((NULL (SPADCALL (SPADCALL |p| (QREFELT $ 21)) (QREFELT $ 12)))
             (COND
              ((NULL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 21)) (QREFELT $ 13)) |ts|
                 (QREFELT $ 14)))
               (EXIT 'NIL)))))
           (EXIT
            (COND
             ((SPADCALL (SPADCALL |p| (QREFELT $ 21)) |ts| (QREFELT $ 15))
              (COND
               ((SPADCALL (SPADCALL |p| (QREFELT $ 24)) (QREFELT $ 12)) 'T)
               ((OR
                 (SPADCALL
                  (SPADCALL (SPADCALL |p| (QREFELT $ 24)) (QREFELT $ 13))
                  (SPADCALL |p| (QREFELT $ 13)) (QREFELT $ 25))
                 (SPADCALL
                  (SPADCALL (SPADCALL |p| (QREFELT $ 24)) (QREFELT $ 13)) |ts|
                  (QREFELT $ 14)))
                (SPADCALL (SPADCALL |p| (QREFELT $ 24)) |ts| (QREFELT $ 15)))
               ('T 'NIL)))
             (#1# 'NIL)))))))) 

(DEFUN |RSETCAT-;purelyAlgebraic?;SB;5| (|ts| $)
  (PROG (#1=#:G181 |i| #2=#:G171 |v| #3=#:G182 |p| |lp|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL |ts| (QREFELT $ 17))
             (EQL (SPADCALL (QREFELT $ 28)) (SPADCALL |ts| (QREFELT $ 29))))
         'T)
        ('T
         (SEQ
          (LETT |lp|
                (SPADCALL (ELT $ 30) (SPADCALL |ts| (QREFELT $ 32))
                          (QREFELT $ 34))
                . #4=(|RSETCAT-;purelyAlgebraic?;SB;5|))
          (LETT |i| (SPADCALL (QREFELT $ 28)) . #4#)
          (SEQ (LETT |p| NIL . #4#) (LETT #3# |lp| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 13)) . #4#)
                    (EXIT
                     (COND
                      ((OR (EQL |i| (SPADCALL |v| (QREFELT $ 36)))
                           (OR (SPADCALL |p| (QREFELT $ 42))
                               (NULL
                                (NULL
                                 (SPADCALL |p|
                                           (SPADCALL |ts| |v| (QREFELT $ 43))
                                           (QREFELT $ 15))))))
                       (LETT |i|
                             (PROG2
                                 (LETT #2# (SPADCALL |i| 1 (QREFELT $ 40))
                                       . #4#)
                                 (QCDR #2#)
                               (|check_union| (QEQCAR #2# 0)
                                              (|NonNegativeInteger|) #2#))
                             . #4#))
                      ('T (PROGN (LETT #1# 'NIL . #4#) (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT 'T)))))
      #1# (EXIT #1#))))) 

(DEFUN |RSETCAT-;purelyAlgebraic?;SB;6| (|ts| $)
  (PROG (|p| #1=#:G184 |v|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |ts| (QREFELT $ 17)) 'T)
            ('T
             (SEQ
              (LETT |v| (SPADCALL |ts| (QREFELT $ 45))
                    . #2=(|RSETCAT-;purelyAlgebraic?;SB;6|))
              (LETT |p|
                    (PROG2 (LETT #1# (SPADCALL |ts| |v| (QREFELT $ 47)) . #2#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0) (QREFELT $ 10) #1#))
                    . #2#)
              (LETT |ts| (SPADCALL |ts| |v| (QREFELT $ 43)) . #2#)
              (EXIT
               (COND
                ((SPADCALL |ts| (QREFELT $ 17)) (SPADCALL |p| (QREFELT $ 42)))
                ((NULL (SPADCALL |ts| (QREFELT $ 48))) 'NIL)
                ('T (SPADCALL |p| |ts| (QREFELT $ 15)))))))))))) 

(DEFUN |RSETCAT-;augment;P2L;7| (|p| |lts| $)
  (PROG (|toSave| |ts|)
    (RETURN
     (SEQ (LETT |toSave| NIL . #1=(|RSETCAT-;augment;P2L;7|))
          (SEQ G190
               (COND ((NULL (COND ((NULL |lts|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |ts| (|SPADfirst| |lts|) . #1#)
                    (LETT |lts| (CDR |lts|) . #1#)
                    (EXIT
                     (LETT |toSave|
                           (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 50))
                                     |toSave| (QREFELT $ 52))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |toSave|))))) 

(DEFUN |RSETCAT-;augment;LSL;8| (|lp| |ts| $)
  (PROG (|toSave| |p|)
    (RETURN
     (SEQ (LETT |toSave| (LIST |ts|) . #1=(|RSETCAT-;augment;LSL;8|))
          (EXIT
           (COND ((NULL |lp|) |toSave|)
                 ('T
                  (SEQ
                   (LETT |lp| (SPADCALL (ELT $ 30) |lp| (QREFELT $ 34)) . #1#)
                   (SEQ G190
                        (COND
                         ((NULL (COND ((NULL |lp|) 'NIL) ('T 'T))) (GO G191)))
                        (SEQ (LETT |p| (|SPADfirst| |lp|) . #1#)
                             (LETT |lp| (CDR |lp|) . #1#)
                             (EXIT
                              (LETT |toSave|
                                    (SPADCALL |p| |toSave| (QREFELT $ 54))
                                    . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |toSave|))))))))) 

(DEFUN |RSETCAT-;augment;L2L;9| (|lp| |lts| $)
  (PROG (|toSave| |ts|)
    (RETURN
     (SEQ
      (COND ((NULL |lp|) |lts|)
            ('T
             (SEQ (LETT |toSave| NIL . #1=(|RSETCAT-;augment;L2L;9|))
                  (SEQ G190
                       (COND
                        ((NULL (COND ((NULL |lts|) 'NIL) ('T 'T))) (GO G191)))
                       (SEQ (LETT |ts| (|SPADfirst| |lts|) . #1#)
                            (LETT |lts| (CDR |lts|) . #1#)
                            (EXIT
                             (LETT |toSave|
                                   (SPADCALL
                                    (SPADCALL |lp| |ts| (QREFELT $ 56))
                                    |toSave| (QREFELT $ 52))
                                   . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |toSave|)))))))) 

(DEFUN |RSETCAT-;extend;P2L;10| (|p| |lts| $)
  (PROG (|toSave| |ts|)
    (RETURN
     (SEQ (LETT |toSave| NIL . #1=(|RSETCAT-;extend;P2L;10|))
          (SEQ G190
               (COND ((NULL (COND ((NULL |lts|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |ts| (|SPADfirst| |lts|) . #1#)
                    (LETT |lts| (CDR |lts|) . #1#)
                    (EXIT
                     (LETT |toSave|
                           (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 58))
                                     |toSave| (QREFELT $ 52))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |toSave|))))) 

(DEFUN |RSETCAT-;extend;LSL;11| (|lp| |ts| $)
  (PROG (|toSave| |p|)
    (RETURN
     (SEQ (LETT |toSave| (LIST |ts|) . #1=(|RSETCAT-;extend;LSL;11|))
          (EXIT
           (COND ((NULL |lp|) |toSave|)
                 ('T
                  (SEQ
                   (LETT |lp| (SPADCALL (ELT $ 30) |lp| (QREFELT $ 34)) . #1#)
                   (SEQ G190
                        (COND
                         ((NULL (COND ((NULL |lp|) 'NIL) ('T 'T))) (GO G191)))
                        (SEQ (LETT |p| (|SPADfirst| |lp|) . #1#)
                             (LETT |lp| (CDR |lp|) . #1#)
                             (EXIT
                              (LETT |toSave|
                                    (SPADCALL |p| |toSave| (QREFELT $ 60))
                                    . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |toSave|))))))))) 

(DEFUN |RSETCAT-;extend;L2L;12| (|lp| |lts| $)
  (PROG (|toSave| |ts|)
    (RETURN
     (SEQ
      (COND ((NULL |lp|) |lts|)
            ('T
             (SEQ (LETT |toSave| NIL . #1=(|RSETCAT-;extend;L2L;12|))
                  (SEQ G190
                       (COND
                        ((NULL (COND ((NULL |lts|) 'NIL) ('T 'T))) (GO G191)))
                       (SEQ (LETT |ts| (|SPADfirst| |lts|) . #1#)
                            (LETT |lts| (CDR |lts|) . #1#)
                            (EXIT
                             (LETT |toSave|
                                   (SPADCALL
                                    (SPADCALL |lp| |ts| (QREFELT $ 62))
                                    |toSave| (QREFELT $ 52))
                                   . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |toSave|)))))))) 

(DEFUN |RSETCAT-;intersect;L2L;13| (|lp| |lts| $)
  (PROG (|toSee| #1=#:G253 |us| #2=#:G252 |lus| |p| |toSave| |ts| |lpwt|
         #3=#:G251 #4=#:G250 #5=#:G249 #6=#:G248)
    (RETURN
     (SEQ
      (COND ((OR (NULL |lp|) (NULL |lts|)) |lts|)
            ('T
             (SEQ
              (LETT |lp|
                    (PROGN
                     (LETT #6# NIL . #7=(|RSETCAT-;intersect;L2L;13|))
                     (SEQ (LETT |p| NIL . #7#) (LETT #5# |lp| . #7#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |p| (CAR #5#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6# (CONS (SPADCALL |p| (QREFELT $ 64)) #6#)
                                  . #7#)))
                          (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #7#)
              (LETT |lp| (SPADCALL |lp| (QREFELT $ 65)) . #7#)
              (LETT |lp| (SPADCALL (ELT $ 66) |lp| (QREFELT $ 68)) . #7#)
              (EXIT
               (COND ((SPADCALL (ELT $ 12) |lp| (QREFELT $ 69)) NIL)
                     ('T
                      (SEQ
                       (LETT |toSee|
                             (PROGN
                              (LETT #4# NIL . #7#)
                              (SEQ (LETT |ts| NIL . #7#) (LETT #3# |lts| . #7#)
                                   G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN
                                          (LETT |ts| (CAR #3#) . #7#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4# (CONS (CONS |lp| |ts|) #4#)
                                           . #7#)))
                                   (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                                   (EXIT (NREVERSE #4#))))
                             . #7#)
                       (LETT |toSave| NIL . #7#)
                       (SEQ G190
                            (COND
                             ((NULL (COND ((NULL |toSee|) 'NIL) ('T 'T)))
                              (GO G191)))
                            (SEQ (LETT |lpwt| (|SPADfirst| |toSee|) . #7#)
                                 (LETT |toSee| (CDR |toSee|) . #7#)
                                 (LETT |lp| (QCAR |lpwt|) . #7#)
                                 (LETT |ts| (QCDR |lpwt|) . #7#)
                                 (EXIT
                                  (COND
                                   ((NULL |lp|)
                                    (LETT |toSave| (CONS |ts| |toSave|) . #7#))
                                   ('T
                                    (SEQ (LETT |p| (|SPADfirst| |lp|) . #7#)
                                         (LETT |lp| (CDR |lp|) . #7#)
                                         (LETT |lus|
                                               (SPADCALL |p| |ts|
                                                         (QREFELT $ 70))
                                               . #7#)
                                         (EXIT
                                          (LETT |toSee|
                                                (SPADCALL
                                                 (PROGN
                                                  (LETT #2# NIL . #7#)
                                                  (SEQ (LETT |us| NIL . #7#)
                                                       (LETT #1# |lus| . #7#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #1#)
                                                             (PROGN
                                                              (LETT |us|
                                                                    (CAR #1#)
                                                                    . #7#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #2#
                                                               (CONS
                                                                (CONS |lp|
                                                                      |us|)
                                                                #2#)
                                                               . #7#)))
                                                       (LETT #1# (CDR #1#)
                                                             . #7#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #2#))))
                                                 |toSee| (QREFELT $ 73))
                                                . #7#)))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |toSave|)))))))))))) 

(DEFUN |RSETCAT-;intersect;LSL;14| (|lp| |ts| $)
  (SPADCALL |lp| (LIST |ts|) (QREFELT $ 75))) 

(DEFUN |RSETCAT-;intersect;P2L;15| (|p| |lts| $)
  (SPADCALL (LIST |p|) |lts| (QREFELT $ 75))) 

(DECLAIM (NOTINLINE |RegularTriangularSetCategory&;|)) 

(DEFUN |RegularTriangularSetCategory&| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|RegularTriangularSetCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$|
            (LIST '|RegularTriangularSetCategory&| DV$1 DV$2 DV$3 DV$4 DV$5)
            . #1#)
      (LETT $ (GETREFV 78) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#4| '(|Finite|))
        (QSETREFV $ 44
                  (CONS (|dispatchFunction| |RSETCAT-;purelyAlgebraic?;SB;5|)
                        $)))
       ('T
        (QSETREFV $ 44
                  (CONS (|dispatchFunction| |RSETCAT-;purelyAlgebraic?;SB;6|)
                        $))))
      $)))) 

(MAKEPROP '|RegularTriangularSetCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|Boolean|)
              (0 . |ground?|) (5 . |mvar|) (10 . |algebraic?|)
              (16 . |algebraicCoefficients?|) |RSETCAT-;purelyAlgebraic?;PSB;1|
              (22 . |empty?|) (|List| 9) (27 . |variables|)
              |RSETCAT-;purelyTranscendental?;PSB;2| (32 . |init|)
              (37 . |purelyAlgebraicLeadingMonomial?|)
              |RSETCAT-;purelyAlgebraicLeadingMonomial?;PSB;3| (43 . |tail|)
              (48 . =) |RSETCAT-;algebraicCoefficients?;PSB;4|
              (|NonNegativeInteger|) (54 . |size|) (58 . |#|)
              (63 . |infRittWu?|) (|List| 10) (69 . |members|)
              (|Mapping| 11 10 10) (74 . |sort|) (|PositiveInteger|)
              (80 . |lookup|) (85 . |One|) (89 . |One|) (|Union| $ '"failed")
              (93 . |subtractIfCan|) (|PolynomialSetUtilitiesPackage| 7 8 9 10)
              (99 . |univariate?|) (104 . |collectUnder|)
              (110 . |purelyAlgebraic?|) (115 . |mvar|) (|Union| 10 '"failed")
              (120 . |select|) (126 . |purelyAlgebraic?|) (|List| $)
              (131 . |augment|) (|List| 6) (137 . |concat|)
              |RSETCAT-;augment;P2L;7| (143 . |augment|)
              |RSETCAT-;augment;LSL;8| (149 . |augment|)
              |RSETCAT-;augment;L2L;9| (155 . |extend|)
              |RSETCAT-;extend;P2L;10| (161 . |extend|)
              |RSETCAT-;extend;LSL;11| (167 . |extend|)
              |RSETCAT-;extend;L2L;12| (173 . |primitivePart|)
              (178 . |removeDuplicates|) (183 . |zero?|) (|Mapping| 11 10)
              (188 . |remove|) (194 . |any?|) (200 . |intersect|)
              (|Record| (|:| |val| 31) (|:| |tower| 6)) (|List| 71)
              (206 . |concat|) |RSETCAT-;intersect;L2L;13| (212 . |intersect|)
              |RSETCAT-;intersect;LSL;14| |RSETCAT-;intersect;P2L;15|)
           '#(|purelyTranscendental?| 218 |purelyAlgebraicLeadingMonomial?| 224
              |purelyAlgebraic?| 230 |intersect| 241 |extend| 259 |augment| 277
              |algebraicCoefficients?| 295)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 77
                                                 '(1 10 11 0 12 1 10 9 0 13 2 6
                                                   11 9 0 14 2 6 11 10 0 15 1 6
                                                   11 0 17 1 10 18 0 19 1 10 0
                                                   0 21 2 6 11 10 0 22 1 10 0 0
                                                   24 2 9 11 0 0 25 0 9 27 28 1
                                                   6 27 0 29 2 10 11 0 0 30 1 6
                                                   31 0 32 2 31 0 33 0 34 1 9
                                                   35 0 36 0 7 0 37 0 10 0 38 2
                                                   27 39 0 0 40 1 41 11 10 42 2
                                                   6 0 0 9 43 1 0 11 0 44 1 6 9
                                                   0 45 2 6 46 0 9 47 1 6 11 0
                                                   48 2 6 49 10 0 50 2 51 0 0 0
                                                   52 2 6 49 10 49 54 2 6 49 31
                                                   0 56 2 6 49 10 0 58 2 6 49
                                                   10 49 60 2 6 49 31 0 62 1 10
                                                   0 0 64 1 31 0 0 65 1 10 11 0
                                                   66 2 31 0 67 0 68 2 31 11 67
                                                   0 69 2 6 49 10 0 70 2 72 0 0
                                                   0 73 2 6 49 31 49 75 2 0 11
                                                   10 0 20 2 0 11 10 0 23 1 0
                                                   11 0 44 2 0 11 10 0 16 2 0
                                                   49 10 49 77 2 0 49 31 0 76 2
                                                   0 49 31 49 74 2 0 49 31 0 61
                                                   2 0 49 31 49 63 2 0 49 10 49
                                                   59 2 0 49 31 0 55 2 0 49 31
                                                   49 57 2 0 49 10 49 53 2 0 11
                                                   10 0 26)))))
           '|lookupComplete|)) 
