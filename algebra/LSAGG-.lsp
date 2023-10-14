
(/VERSIONCHECK 2) 

(DEFUN |LSAGG-;sort!;M2A;1| (|f| |l| $)
  (|LSAGG-;mergeSort| |f| |l| (SPADCALL |l| (QREFELT $ 9)) $)) 

(DEFUN |LSAGG-;list;SA;2| (|x| $)
  (SPADCALL |x| (SPADCALL (QREFELT $ 12)) (QREFELT $ 13))) 

(DEFUN |LSAGG-;reduce;MAS;3| (|f| |x| $)
  (COND
   ((SPADCALL |x| (QREFELT $ 16))
    (|error| "reducing over an empty list needs the 3 argument form"))
   ('T
    (SPADCALL |f| (SPADCALL |x| (QREFELT $ 17)) (SPADCALL |x| (QREFELT $ 18))
              (QREFELT $ 20))))) 

(DEFUN |LSAGG-;merge;M3A;4| (|f| |p| |q| $)
  (SPADCALL |f| (SPADCALL |p| (QREFELT $ 22)) (SPADCALL |q| (QREFELT $ 22))
            (QREFELT $ 23))) 

(DEFUN |LSAGG-;select!;M2A;5| (|f| |x| $)
  (PROG (|z| |y|)
    (RETURN
     (SEQ
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((OR (SPADCALL |x| (QREFELT $ 16))
                    (SPADCALL (SPADCALL |x| (QREFELT $ 18)) |f|))
                'NIL)
               ('T 'T)))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                   . #1=(|LSAGG-;select!;M2A;5|))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND ((SPADCALL |x| (QREFELT $ 16)) |x|)
             ('T
              (SEQ (LETT |y| |x| . #1#)
                   (LETT |z| (SPADCALL |y| (QREFELT $ 17)) . #1#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND ((SPADCALL |z| (QREFELT $ 16)) 'NIL) ('T 'T)))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |z| (QREFELT $ 18)) |f|)
                            (SEQ (LETT |y| |z| . #1#)
                                 (EXIT
                                  (LETT |z| (SPADCALL |z| (QREFELT $ 17))
                                        . #1#))))
                           ('T
                            (SEQ (LETT |z| (SPADCALL |z| (QREFELT $ 17)) . #1#)
                                 (EXIT (SPADCALL |y| |z| (QREFELT $ 25))))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |x|))))))))) 

(DEFUN |LSAGG-;merge!;M3A;6| (|f| |p| |q| $)
  (PROG (|t| |r|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 16)) |q|)
            ((SPADCALL |q| (QREFELT $ 16)) |p|)
            ((SPADCALL |p| |q| (QREFELT $ 28))
             (|error| "cannot merge a list into itself"))
            (#1='T
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |p| (QREFELT $ 18))
                          (SPADCALL |q| (QREFELT $ 18)) |f|)
                (SEQ
                 (LETT |r| (LETT |t| |p| . #2=(|LSAGG-;merge!;M3A;6|)) . #2#)
                 (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 17)) . #2#))))
               (#1#
                (SEQ (LETT |r| (LETT |t| |q| . #2#) . #2#)
                     (EXIT (LETT |q| (SPADCALL |q| (QREFELT $ 17)) . #2#)))))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((OR (SPADCALL |p| (QREFELT $ 16))
                            (SPADCALL |q| (QREFELT $ 16)))
                        'NIL)
                       ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |p| (QREFELT $ 18))
                                 (SPADCALL |q| (QREFELT $ 18)) |f|)
                       (SEQ (SPADCALL |t| |p| (QREFELT $ 25))
                            (LETT |t| |p| . #2#)
                            (EXIT
                             (LETT |p| (SPADCALL |p| (QREFELT $ 17)) . #2#))))
                      ('T
                       (SEQ (SPADCALL |t| |q| (QREFELT $ 25))
                            (LETT |t| |q| . #2#)
                            (EXIT
                             (LETT |q| (SPADCALL |q| (QREFELT $ 17))
                                   . #2#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (SPADCALL |t|
                        (COND ((SPADCALL |p| (QREFELT $ 16)) |q|) (#1# |p|))
                        (QREFELT $ 25))
              (EXIT |r|)))))))) 

(DEFUN |LSAGG-;insert!;SAIA;7| (|s| |x| |i| $)
  (PROG (|z| |y| #1=#:G197 |m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |x| (QREFELT $ 31)) . #2=(|LSAGG-;insert!;SAIA;7|))
      (EXIT
       (COND ((< |i| |m|) (|error| "index out of range"))
             ((EQL |i| |m|) (SPADCALL |s| |x| (QREFELT $ 13)))
             ('T
              (SEQ
               (LETT |y|
                     (SPADCALL |x|
                               (PROG1 (LETT #1# (- (- |i| 1) |m|) . #2#)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               (QREFELT $ 32))
                     . #2#)
               (LETT |z| (SPADCALL |y| (QREFELT $ 17)) . #2#)
               (SPADCALL |y| (SPADCALL |s| |z| (QREFELT $ 13)) (QREFELT $ 25))
               (EXIT |x|))))))))) 

(DEFUN |LSAGG-;insert!;2AIA;8| (|w| |x| |i| $)
  (PROG (|z| |y| #1=#:G201 |m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |x| (QREFELT $ 31)) . #2=(|LSAGG-;insert!;2AIA;8|))
      (EXIT
       (COND ((< |i| |m|) (|error| "index out of range"))
             ((EQL |i| |m|) (SPADCALL |w| |x| (QREFELT $ 34)))
             ('T
              (SEQ
               (LETT |y|
                     (SPADCALL |x|
                               (PROG1 (LETT #1# (- (- |i| 1) |m|) . #2#)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               (QREFELT $ 32))
                     . #2#)
               (LETT |z| (SPADCALL |y| (QREFELT $ 17)) . #2#)
               (SPADCALL |y| |w| (QREFELT $ 25))
               (SPADCALL |y| |z| (QREFELT $ 34)) (EXIT |x|))))))))) 

(DEFUN |LSAGG-;remove!;M2A;9| (|f| |x| $)
  (PROG (|q| |p|)
    (RETURN
     (SEQ
      (SEQ G190
           (COND
            ((NULL
              (COND ((SPADCALL |x| (QREFELT $ 16)) 'NIL)
                    ('T (SPADCALL (SPADCALL |x| (QREFELT $ 18)) |f|))))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                   . #1=(|LSAGG-;remove!;M2A;9|))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND ((SPADCALL |x| (QREFELT $ 16)) |x|)
             ('T
              (SEQ (LETT |p| |x| . #1#)
                   (LETT |q| (SPADCALL |x| (QREFELT $ 17)) . #1#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND ((SPADCALL |q| (QREFELT $ 16)) 'NIL) ('T 'T)))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |q| (QREFELT $ 18)) |f|)
                            (LETT |q|
                                  (SPADCALL |p| (SPADCALL |q| (QREFELT $ 17))
                                            (QREFELT $ 25))
                                  . #1#))
                           ('T
                            (SEQ (LETT |p| |q| . #1#)
                                 (EXIT
                                  (LETT |q| (SPADCALL |q| (QREFELT $ 17))
                                        . #1#)))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |x|))))))))) 

(DEFUN |LSAGG-;delete!;AIA;10| (|x| |i| $)
  (PROG (|y| #1=#:G214 |m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |x| (QREFELT $ 31)) . #2=(|LSAGG-;delete!;AIA;10|))
      (EXIT
       (COND ((< |i| |m|) (|error| "index out of range"))
             ((EQL |i| |m|) (SPADCALL |x| (QREFELT $ 17)))
             ('T
              (SEQ
               (LETT |y|
                     (SPADCALL |x|
                               (PROG1 (LETT #1# (- (- |i| 1) |m|) . #2#)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               (QREFELT $ 32))
                     . #2#)
               (SPADCALL |y| (SPADCALL |y| 2 (QREFELT $ 32)) (QREFELT $ 25))
               (EXIT |x|))))))))) 

(DEFUN |LSAGG-;delete!;AUsA;11| (|x| |i| $)
  (PROG (#1=#:G221 |t| #2=#:G220 #3=#:G219 |h| |m| |l|)
    (RETURN
     (SEQ
      (LETT |l| (SPADCALL |i| (QREFELT $ 39)) . #4=(|LSAGG-;delete!;AUsA;11|))
      (LETT |m| (SPADCALL |x| (QREFELT $ 31)) . #4#)
      (EXIT
       (COND ((< |l| |m|) (|error| "index out of range"))
             (#5='T
              (SEQ
               (LETT |h|
                     (COND
                      ((SPADCALL |i| (QREFELT $ 40))
                       (SPADCALL |i| (QREFELT $ 41)))
                      (#5# (SPADCALL |x| (QREFELT $ 42))))
                     . #4#)
               (EXIT
                (COND ((< |h| |l|) |x|)
                      ((EQL |l| |m|)
                       (SPADCALL |x|
                                 (PROG1 (LETT #3# (- (+ |h| 1) |m|) . #4#)
                                   (|check_subtype| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    #3#))
                                 (QREFELT $ 32)))
                      (#5#
                       (SEQ
                        (LETT |t|
                              (SPADCALL |x|
                                        (PROG1
                                            (LETT #2# (- (- |l| 1) |m|) . #4#)
                                          (|check_subtype| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           #2#))
                                        (QREFELT $ 32))
                              . #4#)
                        (SPADCALL |t|
                                  (SPADCALL |t|
                                            (PROG1
                                                (LETT #1# (+ (- |h| |l|) 2)
                                                      . #4#)
                                              (|check_subtype| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               #1#))
                                            (QREFELT $ 32))
                                  (QREFELT $ 25))
                        (EXIT |x|))))))))))))) 

(DEFUN |LSAGG-;find;MAU;12| (|f| |x| $)
  (SEQ
   (SEQ G190
        (COND
         ((NULL
           (COND
            ((OR (SPADCALL |x| (QREFELT $ 16))
                 (SPADCALL (SPADCALL |x| (QREFELT $ 18)) |f|))
             'NIL)
            ('T 'T)))
          (GO G191)))
        (SEQ
         (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 17)) |LSAGG-;find;MAU;12|)))
        NIL (GO G190) G191 (EXIT NIL))
   (EXIT
    (COND ((SPADCALL |x| (QREFELT $ 16)) (CONS 1 "failed"))
          ('T (CONS 0 (SPADCALL |x| (QREFELT $ 18)))))))) 

(DEFUN |LSAGG-;position;MAI;13| (|f| |x| $)
  (PROG (|k|)
    (RETURN
     (SEQ
      (SEQ
       (LETT |k| (SPADCALL |x| (QREFELT $ 31)) . #1=(|LSAGG-;position;MAI;13|))
       G190
       (COND
        ((NULL
          (COND
           ((OR (SPADCALL |x| (QREFELT $ 16))
                (SPADCALL (SPADCALL |x| (QREFELT $ 18)) |f|))
            'NIL)
           ('T 'T)))
         (GO G191)))
       (SEQ (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 17)) . #1#)))
       (LETT |k| (+ |k| 1) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND
        ((SPADCALL |x| (QREFELT $ 16)) (- (SPADCALL |x| (QREFELT $ 31)) 1))
        ('T |k|))))))) 

(DEFUN |LSAGG-;mergeSort| (|f| |p| |n| $)
  (PROG (|q| |l| #1=#:G243)
    (RETURN
     (SEQ
      (COND
       ((EQL |n| 2)
        (COND
         ((SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 17)) (QREFELT $ 18))
                    (SPADCALL |p| (QREFELT $ 18)) |f|)
          (LETT |p| (SPADCALL |p| (QREFELT $ 47))
                . #2=(|LSAGG-;mergeSort|))))))
      (EXIT
       (COND ((< |n| 3) |p|)
             ('T
              (SEQ
               (LETT |l|
                     (PROG1 (LETT #1# (QUOTIENT2 |n| 2) . #2#)
                       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                        #1#))
                     . #2#)
               (LETT |q| (SPADCALL |p| |l| (QREFELT $ 48)) . #2#)
               (LETT |p| (|LSAGG-;mergeSort| |f| |p| |l| $) . #2#)
               (LETT |q| (|LSAGG-;mergeSort| |f| |q| (- |n| |l|) $) . #2#)
               (EXIT (SPADCALL |f| |p| |q| (QREFELT $ 23))))))))))) 

(DEFUN |LSAGG-;sorted?;MAB;15| (|f| |l| $)
  (PROG (|p| #1=#:G259)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |l| (QREFELT $ 16)) 'T)
             ('T
              (SEQ
               (LETT |p| (SPADCALL |l| (QREFELT $ 17))
                     . #2=(|LSAGG-;sorted?;MAB;15|))
               (SEQ G190
                    (COND
                     ((NULL
                       (COND ((SPADCALL |p| (QREFELT $ 16)) 'NIL) ('T 'T)))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |l| (QREFELT $ 18))
                                   (SPADCALL |p| (QREFELT $ 18)) |f|))
                        (PROGN (LETT #1# 'NIL . #2#) (GO #1#)))
                       ('T
                        (LETT |p|
                              (SPADCALL (LETT |l| |p| . #2#) (QREFELT $ 17))
                              . #2#)))))
                    NIL (GO G190) G191 (EXIT NIL))
               (EXIT 'T)))))
      #1# (EXIT #1#))))) 

(DEFUN |LSAGG-;reduce;MA2S;16| (|f| |x| |i| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| |i| . #1=(|LSAGG-;reduce;MA2S;16|))
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |x| (QREFELT $ 16)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ
                (LETT |r| (SPADCALL |r| (SPADCALL |x| (QREFELT $ 18)) |f|)
                      . #1#)
                (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 17)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |r|))))) 

(DEFUN |LSAGG-;reduce;MA3S;17| (|f| |x| |i| |a| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| |i| . #1=(|LSAGG-;reduce;MA3S;17|))
          (SEQ G190
               (COND
                ((NULL
                  (COND ((SPADCALL |x| (QREFELT $ 16)) 'NIL)
                        ('T (SPADCALL |r| |a| (QREFELT $ 51)))))
                 (GO G191)))
               (SEQ
                (LETT |r| (SPADCALL |r| (SPADCALL |x| (QREFELT $ 18)) |f|)
                      . #1#)
                (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 17)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |r|))))) 

(DEFUN |LSAGG-;new;NniSA;18| (|n| |s| $)
  (PROG (|l| |k|)
    (RETURN
     (SEQ (LETT |l| (SPADCALL (QREFELT $ 12)) . #1=(|LSAGG-;new;NniSA;18|))
          (SEQ (LETT |k| 1 . #1#) G190
               (COND ((|greater_SI| |k| |n|) (GO G191)))
               (SEQ (EXIT (LETT |l| (SPADCALL |s| |l| (QREFELT $ 13)) . #1#)))
               (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |l|))))) 

(DEFUN |LSAGG-;map;M3A;19| (|f| |x| |y| $)
  (PROG (|z|)
    (RETURN
     (SEQ (LETT |z| (SPADCALL (QREFELT $ 12)) . #1=(|LSAGG-;map;M3A;19|))
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((OR (SPADCALL |x| (QREFELT $ 16))
                        (SPADCALL |y| (QREFELT $ 16)))
                    'NIL)
                   ('T 'T)))
                 (GO G191)))
               (SEQ
                (LETT |z|
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                 (SPADCALL |y| (QREFELT $ 18)) |f|)
                       |z| (QREFELT $ 13))
                      . #1#)
                (LETT |x| (SPADCALL |x| (QREFELT $ 17)) . #1#)
                (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |z| (QREFELT $ 47))))))) 

(DEFUN |LSAGG-;reverse!;2A;20| (|x| $)
  (PROG (|y| |z|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |x| (QREFELT $ 16))
            (SPADCALL
             (LETT |y| (SPADCALL |x| (QREFELT $ 17))
                   . #1=(|LSAGG-;reverse!;2A;20|))
             (QREFELT $ 16)))
        |x|)
       ('T
        (SEQ (SPADCALL |x| (SPADCALL (QREFELT $ 12)) (QREFELT $ 25))
             (SEQ G190
                  (COND
                   ((NULL (COND ((SPADCALL |y| (QREFELT $ 16)) 'NIL) ('T 'T)))
                    (GO G191)))
                  (SEQ (LETT |z| (SPADCALL |y| (QREFELT $ 17)) . #1#)
                       (SPADCALL |y| |x| (QREFELT $ 25)) (LETT |x| |y| . #1#)
                       (EXIT (LETT |y| |z| . #1#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT |x|)))))))) 

(DEFUN |LSAGG-;copy;2A;21| (|x| $)
  (PROG (|y| |k|)
    (RETURN
     (SEQ (LETT |y| (SPADCALL (QREFELT $ 12)) . #1=(|LSAGG-;copy;2A;21|))
          (SEQ (LETT |k| 0 . #1#) G190
               (COND
                ((NULL (COND ((SPADCALL |x| (QREFELT $ 16)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ
                (COND
                 ((EQL |k| 1000)
                  (COND
                   ((SPADCALL |x| (QREFELT $ 56))
                    (EXIT (|error| "cyclic list"))))))
                (LETT |y|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 18)) |y|
                                (QREFELT $ 13))
                      . #1#)
                (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 17)) . #1#)))
               (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |y| (QREFELT $ 47))))))) 

(DEFUN |LSAGG-;copyInto!;2AIA;22| (|y| |x| |s| $)
  (PROG (|z| #1=#:G292 |m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |y| (QREFELT $ 31))
            . #2=(|LSAGG-;copyInto!;2AIA;22|))
      (EXIT
       (COND ((< |s| |m|) (|error| "index out of range"))
             ('T
              (SEQ
               (LETT |z|
                     (SPADCALL |y|
                               (PROG1 (LETT #1# (- |s| |m|) . #2#)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               (QREFELT $ 32))
                     . #2#)
               (SEQ G190
                    (COND
                     ((NULL
                       (COND
                        ((OR (SPADCALL |z| (QREFELT $ 16))
                             (SPADCALL |x| (QREFELT $ 16)))
                         'NIL)
                        ('T 'T)))
                      (GO G191)))
                    (SEQ
                     (SPADCALL |z| (SPADCALL |x| (QREFELT $ 18))
                               (QREFELT $ 58))
                     (LETT |x| (SPADCALL |x| (QREFELT $ 17)) . #2#)
                     (EXIT (LETT |z| (SPADCALL |z| (QREFELT $ 17)) . #2#)))
                    NIL (GO G190) G191 (EXIT NIL))
               (EXIT |y|))))))))) 

(DEFUN |LSAGG-;position;SA2I;23| (|w| |x| |s| $)
  (PROG (|k| #1=#:G300 |m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |x| (QREFELT $ 31)) . #2=(|LSAGG-;position;SA2I;23|))
      (EXIT
       (COND ((< |s| |m|) (|error| "index out of range"))
             (#3='T
              (SEQ
               (LETT |x|
                     (SPADCALL |x|
                               (PROG1 (LETT #1# (- |s| |m|) . #2#)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               (QREFELT $ 32))
                     . #2#)
               (SEQ (LETT |k| |s| . #2#) G190
                    (COND
                     ((NULL
                       (COND ((SPADCALL |x| (QREFELT $ 16)) 'NIL)
                             ('T
                              (SPADCALL |w| (SPADCALL |x| (QREFELT $ 18))
                                        (QREFELT $ 51)))))
                      (GO G191)))
                    (SEQ (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 17)) . #2#)))
                    (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
               (EXIT
                (COND
                 ((SPADCALL |x| (QREFELT $ 16))
                  (- (SPADCALL |x| (QREFELT $ 31)) 1))
                 (#3# |k|))))))))))) 

(DEFUN |LSAGG-;removeDuplicates!;2A;24| (|l| $)
  (PROG (|p|)
    (RETURN
     (SEQ (LETT |p| |l| . #1=(|LSAGG-;removeDuplicates!;2A;24|))
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |p| (QREFELT $ 16)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |p|
                       (SPADCALL |p|
                                 (SPADCALL
                                  (CONS #'|LSAGG-;removeDuplicates!;2A;24!0|
                                        (VECTOR $ |p|))
                                  (SPADCALL |p| (QREFELT $ 17)) (QREFELT $ 62))
                                 (QREFELT $ 25))
                       . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |l|))))) 

(DEFUN |LSAGG-;removeDuplicates!;2A;24!0| (|x| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|LSAGG-;removeDuplicates!;2A;24|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL |x| (SPADCALL |p| (QREFELT $ 18)) (QREFELT $ 61)))))) 

(DEFUN |LSAGG-;<;2AB;25| (|x| |y| $)
  (PROG (#1=#:G320)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ G190
             (COND
              ((NULL
                (COND
                 ((OR (SPADCALL |x| (QREFELT $ 16))
                      (SPADCALL |y| (QREFELT $ 16)))
                  'NIL)
                 ('T 'T)))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |x| (QREFELT $ 18))
                           (SPADCALL |y| (QREFELT $ 18)) (QREFELT $ 51))
                 (PROGN
                  (LETT #1#
                        (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                  (SPADCALL |y| (QREFELT $ 18)) (QREFELT $ 64))
                        . #2=(|LSAGG-;<;2AB;25|))
                  (GO #1#)))
                ('T
                 (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 17)) . #2#)
                      (EXIT
                       (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #2#)))))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT
         (COND
          ((SPADCALL |x| (QREFELT $ 16))
           (COND ((SPADCALL |y| (QREFELT $ 16)) 'NIL) (#3='T 'T)))
          (#3# 'NIL)))))
      #1# (EXIT #1#))))) 

(DECLAIM (NOTINLINE |ListAggregate&;|)) 

(DEFUN |ListAggregate&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ListAggregate&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ListAggregate&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 67) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#2| '(|BasicType|))
        (QSETREFV $ 52 (CONS (|dispatchFunction| |LSAGG-;reduce;MA3S;17|) $))))
      (COND
       ((|HasCategory| |#2| '(|BasicType|))
        (PROGN
         (QSETREFV $ 60
                   (CONS (|dispatchFunction| |LSAGG-;position;SA2I;23|) $))
         (QSETREFV $ 63
                   (CONS (|dispatchFunction| |LSAGG-;removeDuplicates!;2A;24|)
                         $)))))
      (COND
       ((|HasCategory| |#2| '(|OrderedSet|))
        (QSETREFV $ 65 (CONS (|dispatchFunction| |LSAGG-;<;2AB;25|) $))))
      $)))) 

(MAKEPROP '|ListAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |#|) (|Mapping| 15 7 7)
              |LSAGG-;sort!;M2A;1| (5 . |empty|) (9 . |concat|)
              |LSAGG-;list;SA;2| (|Boolean|) (15 . |empty?|) (20 . |rest|)
              (25 . |first|) (|Mapping| 7 7 7) (30 . |reduce|)
              |LSAGG-;reduce;MAS;3| (37 . |copy|) (42 . |merge!|)
              |LSAGG-;merge;M3A;4| (49 . |setrest!|) (|Mapping| 15 7)
              |LSAGG-;select!;M2A;5| (55 . |eq?|) |LSAGG-;merge!;M3A;6|
              (|Integer|) (61 . |minIndex|) (66 . |rest|)
              |LSAGG-;insert!;SAIA;7| (72 . |concat!|) |LSAGG-;insert!;2AIA;8|
              |LSAGG-;remove!;M2A;9| |LSAGG-;delete!;AIA;10|
              (|UniversalSegment| 30) (78 . |lo|) (83 . |hasHi|) (88 . |hi|)
              (93 . |maxIndex|) |LSAGG-;delete!;AUsA;11| (|Union| 7 '"failed")
              |LSAGG-;find;MAU;12| |LSAGG-;position;MAI;13| (98 . |reverse!|)
              (103 . |split!|) |LSAGG-;sorted?;MAB;15| |LSAGG-;reduce;MA2S;16|
              (109 . ~=) (115 . |reduce|) |LSAGG-;new;NniSA;18|
              |LSAGG-;map;M3A;19| |LSAGG-;reverse!;2A;20| (123 . |cyclic?|)
              |LSAGG-;copy;2A;21| (128 . |setfirst!|)
              |LSAGG-;copyInto!;2AIA;22| (134 . |position|) (141 . =)
              (147 . |remove!|) (153 . |removeDuplicates!|) (158 . <) (164 . <)
              (|Mapping| 7 7))
           '#(|sorted?| 170 |sort!| 176 |select!| 182 |reverse!| 188
              |removeDuplicates!| 193 |remove!| 198 |reduce| 204 |position| 225
              |new| 238 |merge!| 244 |merge| 251 |map| 258 |list| 265 |insert!|
              270 |find| 284 |delete!| 290 |copyInto!| 302 |copy| 309 < 314)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(1 6 8 0 9 0 6 0 12 2 6 0 7 0
                                                   13 1 6 15 0 16 1 6 0 0 17 1
                                                   6 7 0 18 3 6 7 19 0 7 20 1 6
                                                   0 0 22 3 6 0 10 0 0 23 2 6 0
                                                   0 0 25 2 6 15 0 0 28 1 6 30
                                                   0 31 2 6 0 0 8 32 2 6 0 0 0
                                                   34 1 38 30 0 39 1 38 15 0 40
                                                   1 38 30 0 41 1 6 30 0 42 1 6
                                                   0 0 47 2 6 0 0 30 48 2 7 15
                                                   0 0 51 4 0 7 19 0 7 7 52 1 6
                                                   15 0 56 2 6 7 0 7 58 3 0 30
                                                   7 0 30 60 2 7 15 0 0 61 2 6
                                                   0 26 0 62 1 0 0 0 63 2 7 15
                                                   0 0 64 2 0 15 0 0 65 2 0 15
                                                   10 0 49 2 0 0 10 0 11 2 0 0
                                                   26 0 27 1 0 0 0 55 1 0 0 0
                                                   63 2 0 0 26 0 36 3 0 7 19 0
                                                   7 50 4 0 7 19 0 7 7 52 2 0 7
                                                   19 0 21 2 0 30 26 0 46 3 0
                                                   30 7 0 30 60 2 0 0 8 7 53 3
                                                   0 0 10 0 0 29 3 0 0 10 0 0
                                                   24 3 0 0 19 0 0 54 1 0 0 7
                                                   14 3 0 0 7 0 30 33 3 0 0 0 0
                                                   30 35 2 0 44 26 0 45 2 0 0 0
                                                   38 43 2 0 0 0 30 37 3 0 0 0
                                                   0 30 59 1 0 0 0 57 2 0 15 0
                                                   0 65)))))
           '|lookupComplete|)) 
