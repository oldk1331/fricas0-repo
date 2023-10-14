
(/VERSIONCHECK 2) 

(DEFUN |SET;#;$Nni;1| (|s| $) (SPADCALL |s| (QREFELT $ 9))) 

(DEFUN |SET;brace;$;2| ($) (SPADCALL (QREFELT $ 11))) 

(DEFUN |SET;set;$;3| ($) (SPADCALL (QREFELT $ 11))) 

(DEFUN |SET;empty;$;4| ($) (SPADCALL (QREFELT $ 14))) 

(DEFUN |SET;copy;2$;5| (|s| $) (SPADCALL |s| (QREFELT $ 15))) 

(DEFUN |SET;parts;$L;6| (|s| $) (SPADCALL |s| (QREFELT $ 18))) 

(DEFUN |SET;inspect;$S;7| (|s| $)
  (COND ((SPADCALL |s| (QREFELT $ 21)) (|error| "Empty set"))
        ('T (SPADCALL |s| (SPADCALL |s| (QREFELT $ 23)) (QREFELT $ 24))))) 

(DEFUN |SET;extract!;$S;8| (|s| $)
  (PROG (|x|)
    (RETURN
     (SEQ (LETT |x| (SPADCALL |s| (QREFELT $ 25)) |SET;extract!;$S;8|)
          (SPADCALL |s| (SPADCALL |s| (QREFELT $ 23)) (QREFELT $ 26))
          (EXIT |x|))))) 

(DEFUN |SET;find;M$U;9| (|f| |s| $) (SPADCALL |f| |s| (QREFELT $ 30))) 

(DEFUN |SET;map;M2$;10| (|f| |s| $)
  (SPADCALL |f| (SPADCALL |s| (QREFELT $ 16)) (QREFELT $ 33))) 

(DEFUN |SET;reduce;M$S;11| (|f| |s| $) (SPADCALL |f| |s| (QREFELT $ 36))) 

(DEFUN |SET;reduce;M$2S;12| (|f| |s| |x| $)
  (SPADCALL |f| |s| |x| (QREFELT $ 38))) 

(DEFUN |SET;reduce;M$3S;13| (|f| |s| |x| |y| $)
  (SPADCALL |f| |s| |x| |y| (QREFELT $ 40))) 

(DEFUN |SET;convert;$If;14| (|x| $)
  (SPADCALL
   (LIST (SPADCALL '|set| (QREFELT $ 44))
         (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 45)))
   (QREFELT $ 47))) 

(DEFUN |SET;=;2$B;15| (|s| |t| $) (SPADCALL |s| |t| (QREFELT $ 49))) 

(DEFUN |SET;max;$S;16| (|s| $) (SPADCALL |s| (QREFELT $ 25))) 

(DEFUN |SET;min;$S;17| (|s| $)
  (COND ((SPADCALL |s| (QREFELT $ 21)) (|error| "Empty set"))
        ('T (SPADCALL |s| (SPADCALL |s| (QREFELT $ 52)) (QREFELT $ 24))))) 

(DEFUN |SET;map!;M2$;18| (|f| |s| $)
  (SEQ (SPADCALL |f| |s| (QREFELT $ 54)) (SPADCALL |s| (QREFELT $ 55))
       (EXIT (SPADCALL |s| (QREFELT $ 56))))) 

(DEFUN |SET;construct;L$;19| (|l| $)
  (PROG (|i| #1=#:G184 |x| |a| |n|)
    (RETURN
     (SEQ
      (COND
       ((ZEROP (LETT |n| (LENGTH |l|) . #2=(|SET;construct;L$;19|)))
        (SPADCALL (QREFELT $ 11)))
       ('T
        (SEQ (LETT |a| (SPADCALL |n| (|SPADfirst| |l|) (QREFELT $ 57)) . #2#)
             (SEQ (LETT |x| NIL . #2#) (LETT #1# |l| . #2#)
                  (LETT |i| (SPADCALL |a| (QREFELT $ 52)) . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (SPADCALL |a| |i| |x| (QREFELT $ 58))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT #1# (CDR #1#) . #2#)) . #2#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL (SPADCALL |a| (QREFELT $ 55)) (QREFELT $ 56)))))))))) 

(DEFUN |SET;insert!;S2$;20| (|x| |s| $)
  (PROG (|k| |n|)
    (RETURN
     (SEQ
      (LETT |n| (+ (SPADCALL |s| (QREFELT $ 23)) 1)
            . #1=(|SET;insert!;S2$;20|))
      (LETT |k| (SPADCALL |s| (QREFELT $ 52)) . #1#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((< |k| |n|)
                (SPADCALL |x| (SPADCALL |s| |k| (QREFELT $ 24))
                          (QREFELT $ 60)))
               ('T 'NIL)))
             (GO G191)))
           (SEQ (EXIT (LETT |k| (+ |k| 1) . #1#))) NIL (GO G190) G191
           (EXIT NIL))
      (COND
       ((< |k| |n|)
        (COND
         ((SPADCALL (SPADCALL |s| |k| (QREFELT $ 24)) |x| (QREFELT $ 61))
          (EXIT |s|)))))
      (EXIT (SPADCALL |x| |s| |k| (QREFELT $ 62))))))) 

(DEFUN |SET;member?;S$B;21| (|x| |s| $)
  (PROG (|t| |b| |m|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |s| (QREFELT $ 21)) 'NIL)
            ('T
             (SEQ
              (LETT |t| (SPADCALL |s| (QREFELT $ 23))
                    . #1=(|SET;member?;S$B;21|))
              (LETT |b| (SPADCALL |s| (QREFELT $ 52)) . #1#)
              (SEQ G190 (COND ((NULL (< |b| |t|)) (GO G191)))
                   (SEQ (LETT |m| (QUOTIENT2 (+ |b| |t|) 2) . #1#)
                        (EXIT
                         (COND
                          ((SPADCALL |x| (SPADCALL |s| |m| (QREFELT $ 24))
                                     (QREFELT $ 60))
                           (LETT |b| (+ |m| 1) . #1#))
                          ('T (LETT |t| |m| . #1#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |x| (SPADCALL |s| |t| (QREFELT $ 24))
                         (QREFELT $ 61)))))))))) 

(DEFUN |SET;remove!;S2$;22| (|x| |s| $)
  (PROG (|k| |n|)
    (RETURN
     (SEQ
      (LETT |n| (+ (SPADCALL |s| (QREFELT $ 23)) 1)
            . #1=(|SET;remove!;S2$;22|))
      (LETT |k| (SPADCALL |s| (QREFELT $ 52)) . #1#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((< |k| |n|)
                (SPADCALL |x| (SPADCALL |s| |k| (QREFELT $ 24))
                          (QREFELT $ 60)))
               ('T 'NIL)))
             (GO G191)))
           (SEQ (EXIT (LETT |k| (+ |k| 1) . #1#))) NIL (GO G190) G191
           (EXIT NIL))
      (COND
       ((< |k| |n|)
        (COND
         ((SPADCALL |x| (SPADCALL |s| |k| (QREFELT $ 24)) (QREFELT $ 61))
          (EXIT (SPADCALL |s| |k| (QREFELT $ 26)))))))
      (EXIT |s|))))) 

(DEFUN |SET;intersect;3$;23| (|s| |t| $)
  (PROG (|j| |i| |r| |n| |m|)
    (RETURN
     (SEQ (LETT |m| (SPADCALL |s| (QREFELT $ 23)) . #1=(|SET;intersect;3$;23|))
          (LETT |n| (SPADCALL |t| (QREFELT $ 23)) . #1#)
          (LETT |i| (SPADCALL |s| (QREFELT $ 52)) . #1#)
          (LETT |j| (SPADCALL |t| (QREFELT $ 52)) . #1#)
          (LETT |r| (SPADCALL (QREFELT $ 11)) . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |m| (QREFELT $ 66))
                    (SPADCALL |j| |n| (QREFELT $ 66)))
                   ('T 'NIL)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                             (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 61))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24))
                              (QREFELT $ 67))
                    (LETT |i| (+ |i| 1) . #1#)
                    (EXIT (LETT |j| (+ |j| 1) . #1#))))
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                             (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 68))
                   (LETT |i| (+ |i| 1) . #1#))
                  ('T (LETT |j| (+ |j| 1) . #1#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |r|))))) 

(DEFUN |SET;difference;3$;24| (|s| |t| $)
  (PROG (|i| |j| |r| |n| |m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |s| (QREFELT $ 23)) . #1=(|SET;difference;3$;24|))
      (LETT |n| (SPADCALL |t| (QREFELT $ 23)) . #1#)
      (LETT |i| (SPADCALL |s| (QREFELT $ 52)) . #1#)
      (LETT |j| (SPADCALL |t| (QREFELT $ 52)) . #1#)
      (LETT |r| (SPADCALL (QREFELT $ 11)) . #1#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((SPADCALL |i| |m| (QREFELT $ 66))
                (SPADCALL |j| |n| (QREFELT $ 66)))
               ('T 'NIL)))
             (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                         (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 61))
               (SEQ (LETT |i| (+ |i| 1) . #1#)
                    (EXIT (LETT |j| (+ |j| 1) . #1#))))
              ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                         (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 68))
               (SEQ
                (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24)) (QREFELT $ 67))
                (EXIT (LETT |i| (+ |i| 1) . #1#))))
              ('T (LETT |j| (+ |j| 1) . #1#)))))
           NIL (GO G190) G191 (EXIT NIL))
      (SEQ G190 (COND ((NULL (SPADCALL |i| |m| (QREFELT $ 66))) (GO G191)))
           (SEQ (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24)) (QREFELT $ 67))
                (EXIT (LETT |i| (+ |i| 1) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |r|))))) 

(DEFUN |SET;symmetricDifference;3$;25| (|s| |t| $)
  (PROG (|j| |i| |r| |n| |m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |s| (QREFELT $ 23))
            . #1=(|SET;symmetricDifference;3$;25|))
      (LETT |n| (SPADCALL |t| (QREFELT $ 23)) . #1#)
      (LETT |i| (SPADCALL |s| (QREFELT $ 52)) . #1#)
      (LETT |j| (SPADCALL |t| (QREFELT $ 52)) . #1#)
      (LETT |r| (SPADCALL (QREFELT $ 11)) . #1#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((SPADCALL |i| |m| (QREFELT $ 66))
                (SPADCALL |j| |n| (QREFELT $ 66)))
               ('T 'NIL)))
             (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                         (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 68))
               (SEQ
                (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24)) (QREFELT $ 67))
                (EXIT (LETT |i| (+ |i| 1) . #1#))))
              ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                         (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 60))
               (SEQ
                (SPADCALL |r| (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 67))
                (EXIT (LETT |j| (+ |j| 1) . #1#))))
              ('T
               (SEQ (LETT |i| (+ |i| 1) . #1#)
                    (EXIT (LETT |j| (+ |j| 1) . #1#)))))))
           NIL (GO G190) G191 (EXIT NIL))
      (SEQ G190 (COND ((NULL (SPADCALL |i| |m| (QREFELT $ 66))) (GO G191)))
           (SEQ (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24)) (QREFELT $ 67))
                (EXIT (LETT |i| (+ |i| 1) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (SEQ G190 (COND ((NULL (SPADCALL |j| |n| (QREFELT $ 66))) (GO G191)))
           (SEQ (SPADCALL |r| (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 67))
                (EXIT (LETT |j| (+ |j| 1) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |r|))))) 

(DEFUN |SET;subset?;2$B;26| (|s| |t| $)
  (PROG (#1=#:G231 |j| |i| |n| |m|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |m| (SPADCALL |s| (QREFELT $ 23)) . #2=(|SET;subset?;2$B;26|))
        (LETT |n| (SPADCALL |t| (QREFELT $ 23)) . #2#)
        (EXIT
         (COND ((SPADCALL |m| |n| (QREFELT $ 72)) 'NIL)
               ('T
                (SEQ (LETT |i| (SPADCALL |s| (QREFELT $ 52)) . #2#)
                     (LETT |j| (SPADCALL |t| (QREFELT $ 52)) . #2#)
                     (SEQ G190
                          (COND
                           ((NULL
                             (COND
                              ((SPADCALL |i| |m| (QREFELT $ 66))
                               (SPADCALL |j| |n| (QREFELT $ 66)))
                              ('T 'NIL)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                                        (SPADCALL |t| |j| (QREFELT $ 24))
                                        (QREFELT $ 61))
                              (SEQ (LETT |i| (+ |i| 1) . #2#)
                                   (EXIT (LETT |j| (+ |j| 1) . #2#))))
                             ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                                        (SPADCALL |t| |j| (QREFELT $ 24))
                                        (QREFELT $ 60))
                              (LETT |j| (+ |j| 1) . #2#))
                             ('T (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))
                          NIL (GO G190) G191 (EXIT NIL))
                     (EXIT (SPADCALL |i| |m| (QREFELT $ 72)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |SET;union;3$;27| (|s| |t| $)
  (PROG (|j| |i| |r| |n| |m|)
    (RETURN
     (SEQ (LETT |m| (SPADCALL |s| (QREFELT $ 23)) . #1=(|SET;union;3$;27|))
          (LETT |n| (SPADCALL |t| (QREFELT $ 23)) . #1#)
          (LETT |i| (SPADCALL |s| (QREFELT $ 52)) . #1#)
          (LETT |j| (SPADCALL |t| (QREFELT $ 52)) . #1#)
          (LETT |r| (SPADCALL (QREFELT $ 11)) . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |m| (QREFELT $ 66))
                    (SPADCALL |j| |n| (QREFELT $ 66)))
                   ('T 'NIL)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                             (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 61))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24))
                              (QREFELT $ 67))
                    (LETT |i| (+ |i| 1) . #1#)
                    (EXIT (LETT |j| (+ |j| 1) . #1#))))
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                             (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 68))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24))
                              (QREFELT $ 67))
                    (EXIT (LETT |i| (+ |i| 1) . #1#))))
                  ('T
                   (SEQ
                    (SPADCALL |r| (SPADCALL |t| |j| (QREFELT $ 24))
                              (QREFELT $ 67))
                    (EXIT (LETT |j| (+ |j| 1) . #1#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ G190 (COND ((NULL (SPADCALL |i| |m| (QREFELT $ 66))) (GO G191)))
               (SEQ
                (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24)) (QREFELT $ 67))
                (EXIT (LETT |i| (+ |i| 1) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ G190 (COND ((NULL (SPADCALL |j| |n| (QREFELT $ 66))) (GO G191)))
               (SEQ
                (SPADCALL |r| (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 67))
                (EXIT (LETT |j| (+ |j| 1) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |r|))))) 

(DEFUN |SET;insert!;S2$;28| (|x| |s| $)
  (PROG (#1=#:G245 #2=#:G247 #3=#:G248 |k|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ
           (LETT |k| (SPADCALL |s| (QREFELT $ 52)) . #4=(|SET;insert!;S2$;28|))
           (LETT #3# (SPADCALL |s| (QREFELT $ 23)) . #4#) G190
           (COND ((> |k| #3#) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |s| |k| (QREFELT $ 24)) |x| (QREFELT $ 61))
               (PROGN
                (LETT #1# (PROGN (LETT #2# |s| . #4#) (GO #2#)) . #4#)
                (GO #1#))))))
           (LETT |k| (+ |k| 1) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT
         (SPADCALL |x| |s| (+ (SPADCALL |s| (QREFELT $ 23)) 1)
                   (QREFELT $ 62)))))
      #2# (EXIT #2#))))) 

(DEFUN |SET;remove!;S2$;29| (|x| |s| $)
  (PROG (|k| #1=#:G252 |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (+ (SPADCALL |s| (QREFELT $ 23)) 1)
              . #2=(|SET;remove!;S2$;29|))
        (LETT |k| (SPADCALL |s| (QREFELT $ 52)) . #2#)
        (SEQ G190 (COND ((NULL (< |k| |n|)) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |x| (SPADCALL |s| |k| (QREFELT $ 24))
                           (QREFELT $ 61))
                 (PROGN
                  (LETT #1# (SPADCALL |s| |k| (QREFELT $ 26)) . #2#)
                  (GO #1#)))
                ('T (LETT |k| (+ |k| 1) . #2#)))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT |s|)))
      #1# (EXIT #1#))))) 

(DEFUN |SET;map!;M2$;30| (|f| |s| $)
  (SEQ (SPADCALL |f| |s| (QREFELT $ 54)) (EXIT (SPADCALL |s| (QREFELT $ 75))))) 

(DECLAIM (NOTINLINE |Set;|)) 

(DEFUN |Set| (#1=#:G258)
  (PROG ()
    (RETURN
     (PROG (#2=#:G259)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache| '|Set|)
                                           '|domainEqualList|)
                . #3=(|Set|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Set;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Set|))))))))))) 

(DEFUN |Set;| (|#1|)
  (PROG (#1=#:G257 |pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|Set|))
      (LETT |dv$| (LIST '|Set| DV$1) . #2#)
      (LETT $ (GETREFV 83) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#1| '(|Finite|))
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           (|HasCategory| |#1|
                                                          '(|SetCategory|)))
                                          (OR
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            (|HasCategory| |#1| '(|Finite|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            (|HasCategory| |#1|
                                                           '(|SetCategory|))))
                                          (|HasCategory| |#1| '(|BasicType|))
                                          (|HasCategory| |#1|
                                                         '(|OrderedSet|))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|Set| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 64))
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #2#)
           (|augmentPredVector| $ 128))
      (AND (|HasCategory| |#1| '(|BasicType|)) #1# (|augmentPredVector| $ 256))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|FlexibleArray| |#1|))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 48 (CONS (|dispatchFunction| |SET;convert;$If;14|) $))))
      (COND
       ((|testBitVector| |pv$| 6)
        (PROGN
         (QSETREFV $ 50 (CONS (|dispatchFunction| |SET;=;2$B;15|) $))
         (QSETREFV $ 51 (CONS (|dispatchFunction| |SET;max;$S;16|) $))
         (QSETREFV $ 53 (CONS (|dispatchFunction| |SET;min;$S;17|) $))
         (QSETREFV $ 33 (CONS (|dispatchFunction| |SET;map!;M2$;18|) $))
         (QSETREFV $ 59 (CONS (|dispatchFunction| |SET;construct;L$;19|) $))
         (QSETREFV $ 63 (CONS (|dispatchFunction| |SET;insert!;S2$;20|) $))
         (QSETREFV $ 64 (CONS (|dispatchFunction| |SET;member?;S$B;21|) $))
         (QSETREFV $ 65 (CONS (|dispatchFunction| |SET;remove!;S2$;22|) $))
         (QSETREFV $ 69 (CONS (|dispatchFunction| |SET;intersect;3$;23|) $))
         (QSETREFV $ 70 (CONS (|dispatchFunction| |SET;difference;3$;24|) $))
         (QSETREFV $ 71
                   (CONS (|dispatchFunction| |SET;symmetricDifference;3$;25|)
                         $))
         (QSETREFV $ 73 (CONS (|dispatchFunction| |SET;subset?;2$B;26|) $))
         (QSETREFV $ 74 (CONS (|dispatchFunction| |SET;union;3$;27|) $))))
       ('T
        (PROGN
         (QSETREFV $ 63 (CONS (|dispatchFunction| |SET;insert!;S2$;28|) $))
         (QSETREFV $ 65 (CONS (|dispatchFunction| |SET;remove!;S2$;29|) $))
         (QSETREFV $ 33 (CONS (|dispatchFunction| |SET;map!;M2$;30|) $)))))
      $)))) 

(MAKEPROP '|Set| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) (0 . |#|) |SET;#;$Nni;1| |SET;empty;$;4|
              |SET;brace;$;2| |SET;set;$;3| (5 . |empty|) (9 . |copy|)
              |SET;copy;2$;5| (|List| 6) (14 . |parts|) |SET;parts;$L;6|
              (|Boolean|) (19 . |empty?|) (|Integer|) (24 . |maxIndex|)
              (29 . |elt|) |SET;inspect;$S;7| (35 . |delete!|)
              |SET;extract!;$S;8| (|Union| 6 '"failed") (|Mapping| 20 6)
              (41 . |find|) |SET;find;M$U;9| (|Mapping| 6 6) (47 . |map!|)
              |SET;map;M2$;10| (|Mapping| 6 6 6) (53 . |reduce|)
              |SET;reduce;M$S;11| (59 . |reduce|) |SET;reduce;M$2S;12|
              (66 . |reduce|) |SET;reduce;M$3S;13| (|Symbol|) (|InputForm|)
              (74 . |convert|) (79 . |convert|) (|List| $) (84 . |convert|)
              (89 . |convert|) (94 . =) (100 . =) (106 . |max|)
              (111 . |minIndex|) (116 . |min|) (121 . |map!|) (127 . |sort!|)
              (132 . |removeRepeats!|) (137 . |new|) (143 . |setelt|)
              (150 . |construct|) (155 . >) (161 . =) (167 . |insert!|)
              (174 . |insert!|) (180 . |member?|) (186 . |remove!|) (192 . <=)
              (198 . |concat!|) (204 . <) (210 . |intersect|)
              (216 . |difference|) (222 . |symmetricDifference|) (228 . >)
              (234 . |subset?|) (240 . |union|) (246 . |removeDuplicates!|)
              (|Equation| 6) (|List| 76) (|PositiveInteger|) (|SingleInteger|)
              (|OutputForm|) (|HashState|) (|String|))
           '#(~= 251 |universe| 257 |union| 261 |symmetricDifference| 279
              |subset?| 285 |size?| 291 |size| 297 |set| 301 |select!| 310
              |select| 316 |sample| 322 |removeDuplicates| 326 |remove!| 331
              |remove| 343 |reduce| 355 |random| 376 |parts| 380 |more?| 385
              |min| 391 |members| 396 |member?| 401 |max| 407 |map!| 412 |map|
              418 |lookup| 424 |less?| 429 |latex| 435 |intersect| 440
              |inspect| 446 |insert!| 451 |index| 457 |hashUpdate!| 462 |hash|
              468 |find| 473 |extract!| 479 |every?| 484 |eval| 490 |eq?| 516
              |enumerate| 522 |empty?| 526 |empty| 531 |difference| 535
              |dictionary| 547 |count| 556 |copy| 568 |convert| 573 |construct|
              578 |complement| 583 |coerce| 588 |cardinality| 593 |brace| 598
              |bag| 607 |any?| 612 >= 618 > 624 = 630 <= 636 < 642 |#| 648)
           'NIL
           (CONS
            (|makeByteWordVec2| 4 '(0 0 0 0 0 0 0 2 0 0 4 0 0 0 0 0 0 4 1))
            (CONS
             '#(|FiniteSetAggregate&| |Dictionary&| |DictionaryOperations&|
                |SetAggregate&| |BagAggregate&| |Collection&|
                |HomogeneousAggregate&| |Finite&| |SetCategory&| |Aggregate&|
                |Evalable&| NIL |PartialOrder&| |BasicType&| NIL NIL NIL
                |InnerEvalable&| NIL)
             (CONS
              '#((|FiniteSetAggregate| 6) (|Dictionary| 6)
                 (|DictionaryOperations| 6) (|SetAggregate| 6)
                 (|BagAggregate| 6) (|Collection| 6) (|HomogeneousAggregate| 6)
                 (|Finite|) (|SetCategory|) (|Aggregate|) (|Evalable| 6)
                 (|finiteAggregate|) (|PartialOrder|) (|BasicType|)
                 (|CoercibleTo| 80) (|Type|) (|shallowlyMutable|)
                 (|InnerEvalable| 6 6) (|ConvertibleTo| 43))
              (|makeByteWordVec2| 82
                                  '(1 7 8 0 9 0 7 0 14 1 7 0 0 15 1 7 17 0 18 1
                                    0 20 0 21 1 7 22 0 23 2 7 6 0 22 24 2 7 0 0
                                    22 26 2 7 28 29 0 30 2 0 0 32 0 33 2 7 6 35
                                    0 36 3 7 6 35 0 6 38 4 7 6 35 0 6 6 40 1 43
                                    0 42 44 1 17 43 0 45 1 43 0 46 47 1 0 43 0
                                    48 2 7 20 0 0 49 2 0 20 0 0 50 1 0 6 0 51 1
                                    7 22 0 52 1 0 6 0 53 2 7 0 32 0 54 1 7 0 0
                                    55 1 7 0 0 56 2 7 0 8 6 57 3 7 6 0 22 6 58
                                    1 0 0 17 59 2 6 20 0 0 60 2 6 20 0 0 61 3 7
                                    0 6 0 22 62 2 0 0 6 0 63 2 0 20 6 0 64 2 0
                                    0 6 0 65 2 22 20 0 0 66 2 7 0 0 6 67 2 6 20
                                    0 0 68 2 0 0 0 0 69 2 0 0 0 0 70 2 0 0 0 0
                                    71 2 22 20 0 0 72 2 0 20 0 0 73 2 0 0 0 0
                                    74 1 7 0 0 75 2 0 20 0 0 1 0 2 0 1 2 0 0 0
                                    0 74 2 0 0 6 0 1 2 0 0 0 6 1 2 0 0 0 0 71 2
                                    0 20 0 0 73 2 0 20 0 8 1 0 2 8 1 0 0 0 13 1
                                    0 0 17 1 2 8 0 29 0 1 2 8 0 29 0 1 0 0 0 1
                                    1 9 0 0 1 2 9 0 6 0 65 2 8 0 29 0 1 2 9 0 6
                                    0 1 2 8 0 29 0 1 4 9 6 35 0 6 6 41 3 8 6 35
                                    0 6 39 2 8 6 35 0 37 0 2 0 1 1 8 17 0 19 2
                                    0 20 0 8 1 1 6 6 0 53 1 8 17 0 1 2 9 20 6 0
                                    64 1 6 6 0 51 2 7 0 32 0 33 2 0 0 32 0 34 1
                                    2 78 0 1 2 0 20 0 8 1 1 0 82 0 1 2 0 0 0 0
                                    69 1 0 6 0 25 2 0 0 6 0 63 1 2 0 78 1 2 0
                                    81 81 0 1 1 0 79 0 1 2 0 28 29 0 31 1 0 6 0
                                    27 2 8 20 29 0 1 3 3 0 0 17 17 1 2 3 0 0 76
                                    1 3 3 0 0 6 6 1 2 3 0 0 77 1 2 0 20 0 0 1 0
                                    2 46 1 1 0 20 0 21 0 0 0 11 2 0 0 0 0 70 2
                                    0 0 0 6 1 0 0 0 1 1 0 0 17 1 2 9 8 6 0 1 2
                                    8 8 29 0 1 1 0 0 0 16 1 1 43 0 48 1 0 0 17
                                    59 1 2 0 0 1 1 0 80 0 1 1 0 8 0 1 0 0 0 12
                                    1 0 0 17 1 1 0 0 17 1 2 8 20 29 0 1 2 0 20
                                    0 0 1 2 0 20 0 0 1 2 0 20 0 0 50 2 0 20 0 0
                                    1 2 0 20 0 0 1 1 8 8 0 10)))))
           '|lookupComplete|)) 
