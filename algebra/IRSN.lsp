
(/VERSIONCHECK 2) 

(DEFUN |IRSN;aIdInverse| ($)
  (PROG (#1=#:G224 #2=#:G178 #3=#:G155 |i| #4=#:G234 |k| #5=#:G151 #6=#:G142
         |j| #7=#:G233 |l| #8=#:G232 |idperm| #9=#:G230 #10=#:G231)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SETELT $ 17 (SPADCALL (QREFELT $ 7) (QREFELT $ 7) 0 (QREFELT $ 16)))
        (SEQ (LETT |k| 1 . #11=(|IRSN;aIdInverse|))
             (LETT #10# (QREFELT $ 7) . #11#) G190
             (COND ((|greater_SI| |k| #10#) (GO G191)))
             (SEQ (EXIT (SPADCALL (QREFELT $ 17) |k| |k| 1 (QREFELT $ 18))))
             (LETT |k| (|inc_SI| |k|) . #11#) (GO G190) G191 (EXIT NIL))
        (COND
         ((< (QREFELT $ 10) 5)
          (PROGN (LETT #9# (QREFELT $ 17) . #11#) (GO #9#))))
        (LETT |idperm| NIL . #11#)
        (SEQ (LETT |k| (QREFELT $ 10) . #11#) G190 (COND ((< |k| 1) (GO G191)))
             (SEQ (EXIT (LETT |idperm| (CONS |k| |idperm|) . #11#)))
             (LETT |k| (+ |k| -1) . #11#) (GO G190) G191 (EXIT NIL))
        (SEQ (LETT |k| 1 . #11#) (LETT #8# (- (QREFELT $ 7) 1) . #11#) G190
             (COND ((|greater_SI| |k| #8#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |l| (+ |k| 1) . #11#) (LETT #7# (QREFELT $ 7) . #11#)
                    G190 (COND ((> |l| #7#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL (QREFELT $ 17) |k| |l|
                                (|IRSN;signum| |k| |l| |idperm| $)
                                (QREFELT $ 18))))
                    (LETT |l| (+ |l| 1) . #11#) (GO G190) G191 (EXIT NIL))))
             (LETT |k| (|inc_SI| |k|) . #11#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (SEQ (LETT |j| (QREFELT $ 7) . #11#) G190 (COND ((< |j| 2) (GO G191)))
              (SEQ
               (SEQ (LETT |i| (- |j| 1) . #11#) G190
                    (COND ((< |i| 1) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL (QREFELT $ 17)
                                (PROG1 (LETT #6# |i| . #11#)
                                  (|check_subtype| (>= #6# 0)
                                                   '(|NonNegativeInteger|)
                                                   #6#))
                                |j|
                                (-
                                 (SPADCALL (QREFELT $ 17)
                                           (PROG1 (LETT #5# |i| . #11#)
                                             (|check_subtype| (>= #5# 0)
                                                              '(|NonNegativeInteger|)
                                                              #5#))
                                           |j| (QREFELT $ 19)))
                                (QREFELT $ 18))))
                    (LETT |i| (+ |i| -1) . #11#) (GO G190) G191 (EXIT NIL))
               (EXIT
                (SEQ (LETT |k| (+ |j| 1) . #11#)
                     (LETT #4# (QREFELT $ 7) . #11#) G190
                     (COND ((> |k| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |i| (- |j| 1) . #11#) G190
                            (COND ((< |i| 1) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL (QREFELT $ 17)
                                        (PROG1 (LETT #3# |i| . #11#)
                                          (|check_subtype| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           #3#))
                                        |k|
                                        (+
                                         (SPADCALL (QREFELT $ 17)
                                                   (PROG1 (LETT #2# |i| . #11#)
                                                     (|check_subtype|
                                                      (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      #2#))
                                                   |k| (QREFELT $ 19))
                                         (*
                                          (SPADCALL (QREFELT $ 17)
                                                    (PROG1
                                                        (LETT #1# |i| . #11#)
                                                      (|check_subtype|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                                    |j| (QREFELT $ 19))
                                          (SPADCALL (QREFELT $ 17) |j| |k|
                                                    (QREFELT $ 19))))
                                        (QREFELT $ 18))))
                            (LETT |i| (+ |i| -1) . #11#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |k| (+ |k| 1) . #11#) (GO G190) G191 (EXIT NIL))))
              (LETT |j| (+ |j| -1) . #11#) (GO G190) G191 (EXIT NIL)))))
      #9# (EXIT #9#))))) 

(DEFUN |IRSN;alreadyComputed?| (|lambda| $)
  (PROG (#1=#:G243 #2=#:G241 #3=#:G240 #4=#:G242 #5=#:G246 #6=#:G127 #7=#:G236
         #8=#:G235)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |lambda| (QREFELT $ 6) (QREFELT $ 22)))
        (SEQ (SETELT $ 6 |lambda|)
             (SETELT $ 9 (SPADCALL |lambda| (QREFELT $ 24)))
             (SETELT $ 11
                     (PROG1
                         (LETT #8# (|SPADfirst| (QREFELT $ 9))
                               . #9=(|IRSN;alreadyComputed?|))
                       (|check_subtype| (>= #8# 0) '(|NonNegativeInteger|)
                                        #8#)))
             (SETELT $ 12
                     (PROG1 (LETT #7# (|SPADfirst| |lambda|) . #9#)
                       (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|)
                                        #7#)))
             (SETELT $ 10
                     (PROG1
                         (LETT #1#
                               (PROGN
                                (LETT #2# NIL . #9#)
                                (SEQ (LETT #6# NIL . #9#)
                                     (LETT #5# |lambda| . #9#) G190
                                     (COND
                                      ((OR (ATOM #5#)
                                           (PROGN
                                            (LETT #6# (CAR #5#) . #9#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #4# #6# . #9#)
                                        (COND
                                         (#2# (LETT #3# (+ #3# #4#) . #9#))
                                         ('T
                                          (PROGN
                                           (LETT #3# #4# . #9#)
                                           (LETT #2# 'T . #9#)))))))
                                     (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#2# #3#) ('T 0)))
                               . #9#)
                       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                        #1#)))
             (SETELT $ 8 (SPADCALL |lambda| (QREFELT $ 27)))
             (SETELT $ 7 (LENGTH (QREFELT $ 8)))
             (EXIT (|IRSN;aIdInverse| $))))))))) 

(DEFUN |IRSN;listPermutation| (|pi| $)
  (PROG (|li| |k|)
    (RETURN
     (SEQ (LETT |li| NIL . #1=(|IRSN;listPermutation|))
          (SEQ (LETT |k| (QREFELT $ 10) . #1#) G190
               (COND ((< |k| 1) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |li| (CONS (SPADCALL |pi| |k| (QREFELT $ 29)) |li|)
                       . #1#)))
               (LETT |k| (+ |k| -1) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |li|))))) 

(DEFUN |IRSN;signum| (|numberOfRowTableau| |numberOfColumnTableau| |pi| $)
  (PROG (|k| |l| |end| |sign| |z| |swap| |endk| |ctrl| |s| |columntab|
         |rowtab|)
    (RETURN
     (SEQ
      (LETT |rowtab|
            (SPADCALL
             (SPADCALL (QREFELT $ 8) |numberOfRowTableau| (QREFELT $ 30))
             (QREFELT $ 31))
            . #1=(|IRSN;signum|))
      (LETT |columntab|
            (SPADCALL
             (SPADCALL (QREFELT $ 8) |numberOfColumnTableau| (QREFELT $ 30))
             (QREFELT $ 31))
            . #1#)
      (LETT |sign| 1 . #1#) (LETT |end| 'NIL . #1#) (LETT |k| 1 . #1#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((SPADCALL |k| (QREFELT $ 11) (QREFELT $ 32))
                (COND (|end| 'NIL) ('T 'T)))
               ('T 'NIL)))
             (GO G191)))
           (SEQ (LETT |l| 1 . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND
                         ((SPADCALL |l|
                                    (SPADCALL (QREFELT $ 6) |k| (QREFELT $ 33))
                                    (QREFELT $ 34))
                          (COND (|end| 'NIL) ('T 'T)))
                         ('T 'NIL)))
                       (GO G191)))
                     (SEQ (LETT |z| |l| . #1#) (LETT |endk| 'NIL . #1#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND
                                   ((SPADCALL |z|
                                              (SPADCALL (QREFELT $ 6) |k|
                                                        (QREFELT $ 33))
                                              (QREFELT $ 34))
                                    (COND (|endk| 'NIL) ('T 'T)))
                                   ('T 'NIL)))
                                 (GO G191)))
                               (SEQ (LETT |s| |k| . #1#) (LETT |ctrl| 'T . #1#)
                                    (SEQ G190 (COND ((NULL |ctrl|) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((SPADCALL |s|
                                                       (SPADCALL (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          33))
                                                       (QREFELT $ 34))
                                             (COND
                                              ((EQL
                                                (+ 1
                                                   (SPADCALL |rowtab| |k| |z|
                                                             (QREFELT $ 19)))
                                                (SPADCALL |pi|
                                                          (+ 1
                                                             (SPADCALL
                                                              |columntab| |s|
                                                              |l|
                                                              (QREFELT $ 19)))
                                                          (QREFELT $ 33)))
                                               (LETT |ctrl| 'NIL . #1#))
                                              ('T (LETT |s| (+ |s| 1) . #1#))))
                                            ('T (LETT |ctrl| 'NIL . #1#)))))
                                         NIL (GO G190) G191 (EXIT NIL))
                                    (LETT |endk|
                                          (SPADCALL |s|
                                                    (SPADCALL (QREFELT $ 9) |l|
                                                              (QREFELT $ 33))
                                                    (QREFELT $ 34))
                                          . #1#)
                                    (EXIT
                                     (COND
                                      (|endk|
                                       (SEQ
                                        (COND
                                         ((< |k| |s|)
                                          (SEQ (LETT |sign| (- |sign|) . #1#)
                                               (LETT |swap|
                                                     (SPADCALL |columntab| |s|
                                                               |l|
                                                               (QREFELT $ 19))
                                                     . #1#)
                                               (SPADCALL |columntab| |s| |l|
                                                         (SPADCALL |columntab|
                                                                   |k| |l|
                                                                   (QREFELT $
                                                                            19))
                                                         (QREFELT $ 18))
                                               (EXIT
                                                (SPADCALL |columntab| |k| |l|
                                                          |swap|
                                                          (QREFELT $ 18))))))
                                        (EXIT
                                         (COND
                                          ((< |l| |z|)
                                           (SEQ
                                            (LETT |swap|
                                                  (SPADCALL |rowtab| |k| |z|
                                                            (QREFELT $ 19))
                                                  . #1#)
                                            (SPADCALL |rowtab| |k| |z|
                                                      (SPADCALL |rowtab| |k|
                                                                |l|
                                                                (QREFELT $ 19))
                                                      (QREFELT $ 18))
                                            (EXIT
                                             (SPADCALL |rowtab| |k| |l| |swap|
                                                       (QREFELT $ 18)))))))))
                                      ('T (LETT |z| (+ |z| 1) . #1#)))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (COND
                           ((SPADCALL |z|
                                      (SPADCALL (QREFELT $ 6) |k|
                                                (QREFELT $ 33))
                                      (QREFELT $ 35))
                            (SEQ (LETT |sign| 0 . #1#)
                                 (EXIT (LETT |end| 'T . #1#)))))
                          (EXIT (LETT |l| (+ |l| 1) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |k| (+ |k| 1) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |sign|))))) 

(DEFUN |IRSN;sumPartition| (|lambda| $)
  (PROG (#1=#:G270 |prev| |ok| |sum| #2=#:G273 |x|)
    (RETURN
     (SEQ (LETT |ok| 'T . #3=(|IRSN;sumPartition|))
          (LETT |prev| (|SPADfirst| |lambda|) . #3#) (LETT |sum| 0 . #3#)
          (SEQ (LETT |x| NIL . #3#) (LETT #2# |lambda| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |sum| (+ |sum| |x|) . #3#)
                    (LETT |ok| (COND (|ok| (>= |prev| |x|)) ('T 'NIL)) . #3#)
                    (EXIT (LETT |prev| |x| . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (COND ((NULL |ok|) (|error| "No proper partition ")))
          (EXIT
           (PROG1 (LETT #1# |sum| . #3#)
             (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))))) 

(DEFUN |IRSN;testPermutation| (|pi| $)
  (PROG (#1=#:G281 #2=#:G285 |i| |test| #3=#:G278 |ok| #4=#:G284)
    (RETURN
     (SEQ (LETT |ok| 'T . #5=(|IRSN;testPermutation|)) (SETELT $ 10 0)
          (SEQ (LETT |i| NIL . #5#) (LETT #4# |pi| . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (COND
                 ((SPADCALL |i| (QREFELT $ 10) (QREFELT $ 35))
                  (SETELT $ 10 |i|)))
                (EXIT (COND ((< |i| 1) (LETT |ok| 'NIL . #5#)))))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (COND
           ((EQL (QREFELT $ 10) (LENGTH |pi|))
            (COND ((NULL |ok|) (|error| #6="No permutation of 1,2,..,n"))))
           ('T (|error| #6#)))
          (LETT |test|
                (MAKEARR1
                 (PROG1 (LETT #3# (QREFELT $ 10) . #5#)
                   (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
                 'NIL)
                . #5#)
          (SEQ (LETT |i| NIL . #5#) (LETT #2# |pi| . #5#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #5#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |test| |i| 'T (QREFELT $ 37))))
               (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL 'NIL |test| (QREFELT $ 38)) (|error| "No permutation")))
          (EXIT
           (PROG1 (LETT #1# (QREFELT $ 10) . #5#)
             (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))))) 

(DEFUN |IRSN;dimensionOfIrreducibleRepresentation;LNni;7| (|lambda| $)
  (PROG (#1=#:G288 |dd| #2=#:G292 |j| #3=#:G291 |i| |lambdaprime| |nn|)
    (RETURN
     (SEQ
      (LETT |nn| (|IRSN;sumPartition| |lambda| $)
            . #4=(|IRSN;dimensionOfIrreducibleRepresentation;LNni;7|))
      (LETT |dd| 1 . #4#)
      (LETT |lambdaprime| (SPADCALL |lambda| (QREFELT $ 24)) . #4#)
      (SEQ (LETT |i| 1 . #4#)
           (LETT #3# (SPADCALL |lambdaprime| 1 (QREFELT $ 33)) . #4#) G190
           (COND ((|greater_SI| |i| #3#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #4#)
                  (LETT #2# (SPADCALL |lambda| |i| (QREFELT $ 33)) . #4#) G190
                  (COND ((|greater_SI| |j| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT |dd|
                          (* |dd|
                             (+
                              (-
                               (-
                                (+ (SPADCALL |lambda| |i| (QREFELT $ 33))
                                   (SPADCALL |lambdaprime| |j| (QREFELT $ 33)))
                                |i|)
                               |j|)
                              1))
                          . #4#)))
                  (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (PROG1 (LETT #1# (QUOTIENT2 (SPADCALL |nn| (QREFELT $ 40)) |dd|) . #4#)
         (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))))) 

(DEFUN |IRSN;irreducibleRepresentation;LPM;8| (|lambda| |pi| $)
  (PROG (#1=#:G299 |l| #2=#:G298 |k| |aPi| |piList| |nn|)
    (RETURN
     (SEQ
      (LETT |nn| (|IRSN;sumPartition| |lambda| $)
            . #3=(|IRSN;irreducibleRepresentation;LPM;8|))
      (|IRSN;alreadyComputed?| |lambda| $)
      (LETT |piList| (|IRSN;listPermutation| |pi| $) . #3#)
      (COND
       ((NULL (EQL |nn| (|IRSN;testPermutation| |piList| $)))
        (|error| "Partition and permutation are not consistent")))
      (LETT |aPi| (SPADCALL (QREFELT $ 7) (QREFELT $ 7) 0 (QREFELT $ 16))
            . #3#)
      (SEQ (LETT |k| 1 . #3#) (LETT #2# (QREFELT $ 7) . #3#) G190
           (COND ((|greater_SI| |k| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |l| 1 . #3#) (LETT #1# (QREFELT $ 7) . #3#) G190
                  (COND ((|greater_SI| |l| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |aPi| |k| |l| (|IRSN;signum| |k| |l| |piList| $)
                              (QREFELT $ 18))))
                  (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL (QREFELT $ 17) |aPi| (QREFELT $ 42))))))) 

(DEFUN |IRSN;irreducibleRepresentation;LL;9| (|lambda| $)
  (PROG (|listperm| |li| |k|)
    (RETURN
     (SEQ (LETT |listperm| NIL . #1=(|IRSN;irreducibleRepresentation;LL;9|))
          (LETT |li| NIL . #1#) (|IRSN;sumPartition| |lambda| $)
          (|IRSN;alreadyComputed?| |lambda| $)
          (LETT |listperm|
                (COND
                 ((EQL (QREFELT $ 10) 1)
                  (CONS (|spadConstant| $ 44) |listperm|))
                 ((EQL (QREFELT $ 10) 2)
                  (CONS (SPADCALL (LIST 1 2) (QREFELT $ 45)) |listperm|))
                 ('T
                  (SEQ
                   (SEQ (LETT |k| (QREFELT $ 10) . #1#) G190
                        (COND ((< |k| 1) (GO G191)))
                        (SEQ (EXIT (LETT |li| (CONS |k| |li|) . #1#)))
                        (LETT |k| (+ |k| -1) . #1#) (GO G190) G191 (EXIT NIL))
                   (LETT |listperm|
                         (CONS (SPADCALL |li| (QREFELT $ 45)) |listperm|)
                         . #1#)
                   (EXIT
                    (CONS (SPADCALL (LIST 1 2) (QREFELT $ 45)) |listperm|)))))
                . #1#)
          (EXIT (SPADCALL |lambda| |listperm| (QREFELT $ 47))))))) 

(DEFUN |IRSN;irreducibleRepresentation;LLL;10| (|lambda| |listperm| $)
  (PROG (#1=#:G308 |pi| #2=#:G307)
    (RETURN
     (SEQ (|IRSN;sumPartition| |lambda| $) (|IRSN;alreadyComputed?| |lambda| $)
          (EXIT
           (PROGN
            (LETT #2# NIL . #3=(|IRSN;irreducibleRepresentation;LLL;10|))
            (SEQ (LETT |pi| NIL . #3#) (LETT #1# |listperm| . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |pi| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |lambda| |pi| (QREFELT $ 43)) #2#)
                         . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#))))))))) 

(DEFUN |IrrRepSymNatPackage| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G310)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|IrrRepSymNatPackage|)
                . #2=(|IrrRepSymNatPackage|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|IrrRepSymNatPackage|
                         (LIST (CONS NIL (CONS 1 (|IrrRepSymNatPackage;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|IrrRepSymNatPackage|))))))))))) 

(DEFUN |IrrRepSymNatPackage;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|IrrRepSymNatPackage|) . #1=(|IrrRepSymNatPackage|))
      (LETT $ (GETREFV 49) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|IrrRepSymNatPackage| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 NIL)
      (QSETREFV $ 7 0)
      (QSETREFV $ 8 NIL)
      (QSETREFV $ 9 NIL)
      (QSETREFV $ 10 0)
      (QSETREFV $ 11 0)
      (QSETREFV $ 12 0)
      (QSETREFV $ 17 (SPADCALL 1 1 0 (QREFELT $ 16)))
      $)))) 

(MAKEPROP '|IrrRepSymNatPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|oldlambda| '|flambda| '|younglist|
              '|lprime| '|n| '|rows| '|columns| (|NonNegativeInteger|)
              (|Integer|) (|Matrix| 14) (0 . |new|) '|aId| (7 . |setelt|)
              (15 . |elt|) (|Boolean|) (|List| 14) (22 . =)
              (|PartitionsAndPermutations|) (28 . |conjugate|) (|List| 15)
              (|SymmetricGroupCombinatoricFunctions|)
              (33 . |listYoungTableaus|) (|Permutation| 14) (38 . |eval|)
              (44 . |elt|) (50 . |copy|) (55 . <=) (61 . |elt|) (67 . <=)
              (73 . >) (|Vector| 20) (79 . |setelt|) (86 . |member?|)
              (|IntegerCombinatoricFunctions| 14) (92 . |factorial|)
              |IRSN;dimensionOfIrreducibleRepresentation;LNni;7| (97 . *)
              |IRSN;irreducibleRepresentation;LPM;8| (103 . |One|)
              (107 . |cycle|) (|List| 28)
              |IRSN;irreducibleRepresentation;LLL;10|
              |IRSN;irreducibleRepresentation;LL;9|)
           '#(|irreducibleRepresentation| 112
              |dimensionOfIrreducibleRepresentation| 129)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 48
                                                 '(3 15 0 13 13 14 16 4 15 14 0
                                                   14 14 14 18 3 15 14 0 14 14
                                                   19 2 21 20 0 0 22 1 23 21 21
                                                   24 1 26 25 21 27 2 28 14 0
                                                   14 29 2 25 15 0 14 30 1 15 0
                                                   0 31 2 13 20 0 0 32 2 21 14
                                                   0 14 33 2 14 20 0 0 34 2 14
                                                   20 0 0 35 3 36 20 0 14 20 37
                                                   2 36 20 20 0 38 1 39 14 14
                                                   40 2 15 0 0 0 42 0 28 0 44 1
                                                   28 0 21 45 2 0 15 21 28 43 2
                                                   0 25 21 46 47 1 0 25 21 48 1
                                                   0 13 21 41)))))
           '|lookupComplete|)) 

(MAKEPROP '|IrrRepSymNatPackage| 'NILADIC T) 
