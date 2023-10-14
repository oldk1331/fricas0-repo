
(/VERSIONCHECK 2) 

(DEFUN |SCACHE;expandCache| (|x| $)
  (PROG (#1=#:G142 |k| |ocache|)
    (RETURN
     (SEQ
      (COND
       ((EQL (QREFELT $ 8) (QREFELT $ 9))
        (SEQ (LETT |ocache| (QREFELT $ 7) . #2=(|SCACHE;expandCache|))
             (SETELT $ 8 (+ (SPADCALL 2 (QREFELT $ 8) (QREFELT $ 12)) 10))
             (SETELT $ 7 (MAKEARR1 (QREFELT $ 8) |x|))
             (EXIT
              (SEQ (LETT |k| 0 . #2#) (LETT #1# (- (QREFELT $ 9) 1) . #2#) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT (QSETAREF1 (QREFELT $ 7) |k| (QAREF1 |ocache| |k|))))
                   (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191
                   (EXIT NIL))))))
      (EXIT (SPADCALL (QREFELT $ 14))))))) 

(DEFUN |SCACHE;insertBefore| (|l| |x| $)
  (PROG (#1=#:G146 |k| |vscan|)
    (RETURN
     (SEQ (|SCACHE;expandCache| |x| $)
          (LETT |vscan| (QREFELT $ 7) . #2=(|SCACHE;insertBefore|))
          (SEQ (LETT |k| 0 . #2#) (LETT #1# (- (- (QREFELT $ 9) |l|) 1) . #2#)
               G190 (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |vscan| (- (QREFELT $ 9) |k|)
                            (QAREF1 |vscan| (- (- (QREFELT $ 9) |k|) 1)))))
               (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETAREF1 |vscan| |l| |x|) (SETELT $ 9 (+ (QREFELT $ 9) 1))
          (EXIT (SPADCALL (QREFELT $ 14))))))) 

(DEFUN |SCACHE;shiftCache| (|l| |n| $)
  (PROG (|x| #1=#:G151 |k| |vscan|)
    (RETURN
     (SEQ (LETT |vscan| (QREFELT $ 7) . #2=(|SCACHE;shiftCache|))
          (SEQ (LETT |k| |l| . #2#) (LETT #1# (- (QREFELT $ 9) 1) . #2#) G190
               (COND ((> |k| #1#) (GO G191)))
               (SEQ (LETT |x| (QAREF1 |vscan| |k|) . #2#)
                    (EXIT
                     (SPADCALL |x| (+ |n| (SPADCALL |x| (QREFELT $ 15)))
                               (QREFELT $ 16))))
               (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (QREFELT $ 14))))))) 

(DEFUN |SCACHE;clearCache;V;4| ($)
  (PROG (|x| #1=#:G156 |k| |vscan|)
    (RETURN
     (SEQ (LETT |vscan| (QREFELT $ 7) . #2=(|SCACHE;clearCache;V;4|))
          (SEQ (LETT |k| 0 . #2#) (LETT #1# (- (QREFELT $ 9) 1) . #2#) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ (LETT |x| (QAREF1 |vscan| |k|) . #2#)
                    (EXIT (SPADCALL |x| 0 (QREFELT $ 16))))
               (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
          (SETELT $ 7 (MAKE-ARRAY 0)) (SETELT $ 8 0) (SETELT $ 9 0)
          (EXIT (SPADCALL (QREFELT $ 14))))))) 

(DEFUN |SCACHE;insertAtEnd| (|x| $)
  (SEQ (|SCACHE;expandCache| |x| $) (QSETAREF1 (QREFELT $ 7) (QREFELT $ 9) |x|)
       (SETELT $ 9 (+ (QREFELT $ 9) 1)) (EXIT (SPADCALL (QREFELT $ 14))))) 

(DEFUN |SCACHE;linearSearch;SMU;6| (|x| |equal?| $)
  (PROG (#1=#:G173 |k| |vscan| |y|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |k| 0 . #2=(|SCACHE;linearSearch;SMU;6|))
            (SEQ G190 (COND ((NULL (< |k| (QREFELT $ 9))) (GO G191)))
                 (SEQ (LETT |vscan| (QREFELT $ 7) . #2#)
                      (LETT |y| (QAREF1 |vscan| |k|) . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL |y| |equal?|)
                         (SEQ
                          (SPADCALL |x| (SPADCALL |y| (QREFELT $ 15))
                                    (QREFELT $ 16))
                          (EXIT
                           (PROGN (LETT #1# (CONS 0 |y|) . #2#) (GO #1#)))))
                        ('T
                         (SEQ (LETT |vscan| (QREFELT $ 7) . #2#)
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((EQ |y| (QAREF1 |vscan| |k|)) 'NIL)
                                       ('T 'T)))
                                     (GO G191)))
                                   (SEQ (EXIT (LETT |k| (+ |k| 1) . #2#))) NIL
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT (LETT |k| (+ |k| 1) . #2#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |SCACHE;enterInCache;SMS;7| (|x| |equal?| $)
  (PROG (|res|)
    (RETURN
     (SEQ
      (LETT |res| (SPADCALL |x| |equal?| (QREFELT $ 20))
            |SCACHE;enterInCache;SMS;7|)
      (EXIT
       (COND ((QEQCAR |res| 0) (QCDR |res|))
             ('T
              (SEQ (SPADCALL |x| (+ 1 (QREFELT $ 9)) (QREFELT $ 16))
                   (|SCACHE;insertAtEnd| |x| $) (EXIT |x|))))))))) 

(DEFUN |SCACHE;enterInCache;SMS;8| (|x| |triage| $)
  (PROG (#1=#:G199 |pos| #2=#:G204 |l| |m| |i| |i0| |l0| |vscan| |cp| |y|
         |has_vm| |vm| |vl| |m0|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |vscan| (QREFELT $ 7) . #3=(|SCACHE;enterInCache;SMS;8|))
            (LETT |l| -1 . #3#) (LETT |m| (QREFELT $ 9) . #3#)
            (LETT |m0| |m| . #3#)
            (EXIT
             (COND
              ((ZEROP (QREFELT $ 9))
               (SEQ (SPADCALL |x| 1024 (QREFELT $ 16))
                    (|SCACHE;insertAtEnd| |x| $)
                    (EXIT (PROGN (LETT #2# |x| . #3#) (GO #2#)))))
              (#4='T
               (SEQ
                (SEQ G190 (COND ((NULL (< (+ |l| 1) |m|)) (GO G191)))
                     (SEQ (LETT |m0| (QREFELT $ 9) . #3#)
                          (COND
                           ((NULL (< |l| 0))
                            (LETT |vl| (QAREF1 |vscan| |l|) . #3#)))
                          (LETT |has_vm| 'NIL . #3#)
                          (COND
                           ((< |m| |m0|)
                            (SEQ (LETT |vm| (QAREF1 |vscan| |m|) . #3#)
                                 (EXIT (LETT |has_vm| 'T . #3#)))))
                          (LETT |i| (ASH (+ |l| |m|) -1) . #3#)
                          (LETT |cp|
                                (SPADCALL |x|
                                          (LETT |y| (QAREF1 |vscan| |i|) . #3#)
                                          |triage|)
                                . #3#)
                          (EXIT
                           (COND
                            ((ZEROP |cp|)
                             (SEQ
                              (SPADCALL |x| (SPADCALL |y| (QREFELT $ 15))
                                        (QREFELT $ 16))
                              (EXIT (PROGN (LETT #2# |y| . #3#) (GO #2#)))))
                            ('T
                             (SEQ (LETT |vscan| (QREFELT $ 7) . #3#)
                                  (COND
                                   ((NULL (< |l| 0))
                                    (COND
                                     ((NULL (EQ |vl| (QAREF1 |vscan| |l|)))
                                      (SEQ (LETT |l0| |l| . #3#)
                                           (SEQ G190
                                                (COND
                                                 ((NULL
                                                   (COND
                                                    ((EQ |vl|
                                                         (QAREF1 |vscan| |l|))
                                                     'NIL)
                                                    ('T 'T)))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT |l| (+ |l| 1) . #3#)))
                                                NIL (GO G190) G191 (EXIT NIL))
                                           (LETT |i| (- (+ |i| |l|) |l0|)
                                                 . #3#)
                                           (EXIT
                                            (LETT |m| (- (+ |m| |l|) |l0|)
                                                  . #3#)))))))
                                  (COND
                                   ((NULL (EQ |y| (QAREF1 |vscan| |i|)))
                                    (SEQ (LETT |i0| |i| . #3#)
                                         (SEQ G190
                                              (COND
                                               ((NULL
                                                 (COND
                                                  ((EQ |y|
                                                       (QAREF1 |vscan| |i|))
                                                   'NIL)
                                                  ('T 'T)))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |i| (+ |i| 1) . #3#)))
                                              NIL (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (LETT |m| (- (+ |m| |i|) |i0|)
                                                . #3#)))))
                                  (COND
                                   (|has_vm|
                                    (COND
                                     ((NULL (EQ |vm| (QAREF1 |vscan| |m|)))
                                      (SEQ G190
                                           (COND
                                            ((NULL
                                              (COND
                                               ((EQ |vm| (QAREF1 |vscan| |m|))
                                                'NIL)
                                               ('T 'T)))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT (LETT |m| (+ |m| 1) . #3#)))
                                           NIL (GO G190) G191 (EXIT NIL))))))
                                  (EXIT
                                   (COND ((< |cp| 0) (LETT |m| |i| . #3#))
                                         ('T (LETT |l| |i| . #3#)))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((EQL |m| (QREFELT $ 9))
                   (SEQ
                    (SPADCALL |x|
                              (+
                               (SPADCALL (QAREF1 |vscan| (- |m| 1))
                                         (QREFELT $ 15))
                               1024)
                              (QREFELT $ 16))
                    (|SCACHE;insertAtEnd| |x| $)
                    (EXIT (PROGN (LETT #2# |x| . #3#) (GO #2#)))))
                  (#4#
                   (SEQ
                    (LETT |pos|
                          (COND ((< |l| 0) 0)
                                (#4#
                                 (SPADCALL (QAREF1 |vscan| |l|)
                                           (QREFELT $ 15))))
                          . #3#)
                    (EXIT
                     (|SCACHE;insertInCache|
                      (PROG1 (LETT #1# (+ |l| 1) . #3#)
                        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                         #1#))
                      |x| |pos| $))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |SCACHE;insertInCache| (|before| |x| |pos| $)
  (PROG (#1=#:G206 |y|)
    (RETURN
     (SEQ
      (LETT |y| (QAREF1 (QREFELT $ 7) |before|) . #2=(|SCACHE;insertInCache|))
      (COND
       ((EQL (+ |pos| 1) (SPADCALL |y| (QREFELT $ 15)))
        (|SCACHE;shiftCache| |before| 1024 $)))
      (SPADCALL |x|
                (+ |pos|
                   (QUOTIENT2
                    (PROG1
                        (LETT #1# (- (SPADCALL |y| (QREFELT $ 15)) |pos|)
                              . #2#)
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    2))
                (QREFELT $ 16))
      (|SCACHE;insertBefore| |before| |x| $) (EXIT |x|))))) 

(DEFUN |SortedCache| (#1=#:G209)
  (PROG ()
    (RETURN
     (PROG (#2=#:G210)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|SortedCache|)
                                           '|domainEqualList|)
                . #3=(|SortedCache|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|SortedCache;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|SortedCache|))))))))))) 

(DEFUN |SortedCache;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SortedCache|))
      (LETT |dv$| (LIST '|SortedCache| DV$1) . #1#)
      (LETT $ (GETREFV 24) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SortedCache| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (MAKE-ARRAY 0))
      (QSETREFV $ 8 0)
      (QSETREFV $ 9 0)
      $)))) 

(MAKEPROP '|SortedCache| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|cache| '|cache_size|
              '|cache_use| (|PositiveInteger|) (|NonNegativeInteger|) (0 . *)
              (|Void|) (6 . |void|) (10 . |position|) (15 . |setPosition|)
              |SCACHE;clearCache;V;4| (|Union| 6 '"failed")
              (|Mapping| (|Boolean|) 6) |SCACHE;linearSearch;SMU;6|
              |SCACHE;enterInCache;SMS;7| (|Mapping| (|Integer|) 6 6)
              |SCACHE;enterInCache;SMS;8|)
           '#(|linearSearch| 21 |enterInCache| 27 |clearCache| 39) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 23
                                                 '(2 11 0 10 0 12 0 13 0 14 1 6
                                                   11 0 15 2 6 13 0 11 16 2 0
                                                   18 6 19 20 2 0 6 6 19 21 2 0
                                                   6 6 22 23 0 0 13 17)))))
           '|lookupComplete|)) 
