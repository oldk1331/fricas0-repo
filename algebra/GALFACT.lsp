
(/VERSIONCHECK 2) 

(DEFUN |GALFACT;useEisensteinCriterion?;B;1| ($) (QREFELT $ 11)) 

(DEFUN |GALFACT;useEisensteinCriterion;2B;2| (|b| $)
  (PROG (|#G5| |#G4|)
    (RETURN
     (SEQ
      (PROGN
       (LETT |#G4| |b| . #1=(|GALFACT;useEisensteinCriterion;2B;2|))
       (LETT |#G5| (QREFELT $ 11) . #1#)
       (SETELT $ 11 |#G4|)
       (LETT |b| |#G5| . #1#))
      (EXIT |b|))))) 

(DEFUN |GALFACT;tryFunctionalDecomposition?;B;3| ($) (QREFELT $ 10)) 

(DEFUN |GALFACT;tryFunctionalDecomposition;2B;4| (|b| $)
  (PROG (|#G8| |#G7|)
    (RETURN
     (SEQ
      (PROGN
       (LETT |#G7| |b| . #1=(|GALFACT;tryFunctionalDecomposition;2B;4|))
       (LETT |#G8| (QREFELT $ 10) . #1#)
       (SETELT $ 10 |#G7|)
       (LETT |b| |#G8| . #1#))
      (EXIT |b|))))) 

(DEFUN |GALFACT;useSingleFactorBound?;B;5| ($) (QREFELT $ 9)) 

(DEFUN |GALFACT;useSingleFactorBound;2B;6| (|b| $)
  (PROG (|#G11| |#G10|)
    (RETURN
     (SEQ
      (PROGN
       (LETT |#G10| |b| . #1=(|GALFACT;useSingleFactorBound;2B;6|))
       (LETT |#G11| (QREFELT $ 9) . #1#)
       (SETELT $ 9 |#G10|)
       (LETT |b| |#G11| . #1#))
      (EXIT |b|))))) 

(DEFUN |GALFACT;stopMusserTrials;Pi;7| ($) (QREFELT $ 8)) 

(DEFUN |GALFACT;stopMusserTrials;2Pi;8| (|n| $)
  (PROG (|#G14| |#G13|)
    (RETURN
     (SEQ
      (PROGN
       (LETT |#G13| |n| . #1=(|GALFACT;stopMusserTrials;2Pi;8|))
       (LETT |#G14| (QREFELT $ 8) . #1#)
       (SETELT $ 8 |#G13|)
       (LETT |n| |#G14| . #1#))
      (EXIT |n|))))) 

(DEFUN |GALFACT;musserTrials;Pi;9| ($) (QREFELT $ 7)) 

(DEFUN |GALFACT;musserTrials;2Pi;10| (|n| $)
  (PROG (|#G17| |#G16|)
    (RETURN
     (SEQ
      (PROGN
       (LETT |#G16| |n| . #1=(|GALFACT;musserTrials;2Pi;10|))
       (LETT |#G17| (QREFELT $ 7) . #1#)
       (SETELT $ 7 |#G16|)
       (LETT |n| |#G17| . #1#))
      (EXIT |n|))))) 

(DEFUN |GALFACT;eisensteinIrreducible?;UPB;11| (|f| $)
  (PROG (#1=#:G215 #2=#:G216 |p| |rf| |tc| |lc| |c|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |rf| (SPADCALL |f| (QREFELT $ 24))
              . #3=(|GALFACT;eisensteinIrreducible?;UPB;11|))
        (LETT |c| (SPADCALL |rf| (QREFELT $ 26)) . #3#)
        (EXIT
         (COND ((OR (ZEROP |c|) (SPADCALL |c| (QREFELT $ 27))) 'NIL)
               ('T
                (SEQ (LETT |lc| (SPADCALL |f| (QREFELT $ 28)) . #3#)
                     (LETT |tc| |lc| . #3#)
                     (SEQ G190
                          (COND
                           ((NULL
                             (COND ((SPADCALL |rf| (QREFELT $ 29)) 'NIL)
                                   ('T 'T)))
                            (GO G191)))
                          (SEQ (LETT |tc| (SPADCALL |rf| (QREFELT $ 28)) . #3#)
                               (EXIT
                                (LETT |rf| (SPADCALL |rf| (QREFELT $ 24))
                                      . #3#)))
                          NIL (GO G190) G191 (EXIT NIL))
                     (SEQ (LETT |p| NIL . #3#)
                          (LETT #2#
                                (SPADCALL (SPADCALL |c| (QREFELT $ 31))
                                          (QREFELT $ 35))
                                . #3#)
                          G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |p| (CAR #2#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((EQL (QCDR |p|) 1)
                              (COND
                               ((NULL (ZEROP (REM |lc| (QCAR |p|))))
                                (COND
                                 ((NULL (ZEROP (REM |tc| (EXPT (QCAR |p|) 2))))
                                  (PROGN (LETT #1# 'T . #3#) (GO #1#))))))))))
                          (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                     (EXIT 'NIL)))))))
      #1# (EXIT #1#))))) 

(DEFUN |GALFACT;numberOfFactors;LNni;12| (|ddlist| $)
  (PROG (|n| #1=#:G218 |d| #2=#:G225 |dd|)
    (RETURN
     (SEQ (LETT |n| 0 . #3=(|GALFACT;numberOfFactors;LNni;12|))
          (LETT |d| 0 . #3#)
          (SEQ (LETT |dd| NIL . #3#) (LETT #2# |ddlist| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |dd| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |n|
                       (+ |n|
                          (COND
                           ((ZEROP
                             (LETT |d| (SPADCALL (QCAR |dd|) (QREFELT $ 38))
                                   . #3#))
                            1)
                           ('T
                            (PROG1 (LETT #1# (QUOTIENT2 |d| (QCDR |dd|)) . #3#)
                              (|check_subtype| (>= #1# 0)
                                               '(|NonNegativeInteger|) #1#)))))
                       . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |n|))))) 

(DEFUN |GALFACT;shiftSet| (|s| |shift| $)
  (PROG (#1=#:G229 |e| #2=#:G228)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|GALFACT;shiftSet|))
        (SEQ (LETT |e| NIL . #3#)
             (LETT #1# (SPADCALL |s| (QREFELT $ 44)) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ (EXIT (LETT #2# (CONS (+ |e| |shift|) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 45)))))) 

(DEFUN |GALFACT;reductum| (|n| $) (- |n| (ASH 1 (- (INTEGER-LENGTH |n|) 1)))) 

(DEFUN |GALFACT;seed| (|level| $) (- (ASH 1 |level|) 1)) 

(DEFUN |GALFACT;nextRecNum| (|levels| |level| |n| $)
  (PROG (|b| |lr| #1=#:G239 |l|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |l| (INTEGER-LENGTH |n|) . #2=(|GALFACT;nextRecNum|))
             (EXIT
              (COND
               ((< |l| |levels|)
                (PROGN
                 (LETT #1# (CONS 1 (+ |n| (ASH 1 (- |l| 1)))) . #2#)
                 (GO #1#))))))
        (EXIT
         (COND
          ((EQL |n| (ASH (|GALFACT;seed| |level| $) (- |levels| |level|)))
           (CONS 0 "End of level"))
          ('T
           (SEQ (LETT |b| 1 . #2#)
                (SEQ G190
                     (COND
                      ((NULL
                        (EQL (- |l| |b|)
                             (LETT |lr|
                                   (INTEGER-LENGTH
                                    (LETT |n| (|GALFACT;reductum| |n| $)
                                          . #2#))
                                   . #2#)))
                       (GO G191)))
                     (SEQ (EXIT (LETT |b| (+ |b| 1) . #2#))) NIL (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (CONS 1
                       (+ (|GALFACT;reductum| |n| $)
                          (ASH (|GALFACT;seed| (+ |b| 1) $) |lr|))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |GALFACT;fullSet| (|n| $)
  (PROG (|i| #1=#:G242)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #1# NIL . #2=(|GALFACT;fullSet|))
        (SEQ (LETT |i| 0 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ (EXIT (LETT #1# (CONS |i| #1#) . #2#)))
             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
             (EXIT (NREVERSE #1#))))
       (QREFELT $ 45)))))) 

(DEFUN |GALFACT;modularFactor;UPR;18| (|p| $)
  (PROG (|cprime| |choice| |nfc| |nf| #1=#:G269 |t| #2=#:G265 |d| |trials| |s|
         #3=#:G268 |j| |degfact| #4=#:G250 #5=#:G267 |f| |ddlist| #6=#:G266 |i|
         |diffp| |dirred| |n|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL (EQL (ABS (SPADCALL |p| (QREFELT $ 26))) 1))
         (|error| "modularFactor: the polynomial is not primitive."))
        ('T
         (COND
          ((ZEROP
            (LETT |n| (SPADCALL |p| (QREFELT $ 38))
                  . #7=(|GALFACT;modularFactor;UPR;18|)))
           (CONS 0 (LIST |p|)))
          ('T
           (SEQ (LETT |cprime| 2 . #7#) (LETT |trials| NIL . #7#)
                (LETT |d| (|GALFACT;fullSet| |n| $) . #7#)
                (LETT |dirred| (SPADCALL (LIST 0 |n|) (QREFELT $ 45)) . #7#)
                (LETT |s| (SPADCALL (QREFELT $ 48)) . #7#)
                (LETT |ddlist| NIL . #7#) (LETT |degfact| 0 . #7#)
                (LETT |nf| (+ (QREFELT $ 8) 1) . #7#)
                (LETT |diffp| (SPADCALL |p| (QREFELT $ 49)) . #7#)
                (SEQ (LETT |i| 1 . #7#) (LETT #6# (QREFELT $ 7) . #7#) G190
                     (COND ((|greater_SI| |i| #6#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |nf| (QREFELT $ 8) (QREFELT $ 50))
                         (SEQ
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND
                                   ((OR
                                     (ZEROP
                                      (REM (SPADCALL |p| (QREFELT $ 28))
                                           |cprime|))
                                     (NULL
                                      (ZEROP
                                       (SPADCALL
                                        (SPADCALL |p| |diffp| |cprime|
                                                  (QREFELT $ 52))
                                        (QREFELT $ 38)))))
                                    'T)
                                   ('T 'NIL)))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |cprime|
                                       (SPADCALL |cprime| (QREFELT $ 54))
                                       . #7#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |ddlist| (SPADCALL |p| |cprime| (QREFELT $ 55))
                                . #7#)
                          (LETT |s| (SPADCALL (LIST 0) (QREFELT $ 45)) . #7#)
                          (SEQ (LETT |f| NIL . #7#) (LETT #5# |ddlist| . #7#)
                               G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |f| (CAR #5#) . #7#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |degfact|
                                      (PROG1 (LETT #4# (QCDR |f|) . #7#)
                                        (|check_subtype| (>= #4# 0)
                                                         '(|NonNegativeInteger|)
                                                         #4#))
                                      . #7#)
                                (EXIT
                                 (COND
                                  ((NULL (ZEROP |degfact|))
                                   (SEQ (LETT |j| 1 . #7#)
                                        (LETT #3#
                                              (QUOTIENT2
                                               (SPADCALL (QCAR |f|)
                                                         (QREFELT $ 38))
                                               |degfact|)
                                              . #7#)
                                        G190
                                        (COND
                                         ((|greater_SI| |j| #3#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |s|
                                                (SPADCALL |s|
                                                          (|GALFACT;shiftSet|
                                                           |s| |degfact| $)
                                                          (QREFELT $ 56))
                                                . #7#)))
                                        (LETT |j| (|inc_SI| |j|) . #7#)
                                        (GO G190) G191 (EXIT NIL))))))
                               (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |trials|
                                (CONS (CONS |cprime| |ddlist|) |trials|) . #7#)
                          (LETT |d| (SPADCALL |d| |s| (QREFELT $ 57)) . #7#)
                          (EXIT
                           (COND
                            ((SPADCALL |d| |dirred| (QREFELT $ 58))
                             (PROGN
                              (LETT #2# (CONS 0 (LIST |p|)) . #7#)
                              (GO #2#)))
                            ('T
                             (SEQ
                              (LETT |cprime| (SPADCALL |cprime| (QREFELT $ 54))
                                    . #7#)
                              (EXIT
                               (LETT |nf| (SPADCALL |ddlist| (QREFELT $ 41))
                                     . #7#)))))))))))
                     (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
                (LETT |choice| (|SPADfirst| |trials|) . #7#)
                (LETT |nfc| (SPADCALL (QCDR |choice|) (QREFELT $ 41)) . #7#)
                (SEQ (LETT |t| NIL . #7#) (LETT #1# (CDR |trials|) . #7#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |nf| (SPADCALL (QCDR |t|) (QREFELT $ 41)) . #7#)
                      (EXIT
                       (COND
                        ((< |nf| |nfc|)
                         (SEQ (LETT |nfc| |nf| . #7#)
                              (EXIT (LETT |choice| |t| . #7#))))
                        ((EQL |nf| |nfc|)
                         (COND
                          ((SPADCALL (QCAR |t|) (QCAR |choice|) (QREFELT $ 59))
                           (SEQ (LETT |nfc| |nf| . #7#)
                                (EXIT (LETT |choice| |t| . #7#)))))))))
                     (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
                (LETT |cprime| (QCAR |choice|) . #7#)
                (EXIT
                 (CONS |cprime|
                       (SPADCALL (QCDR |choice|) |cprime|
                                 (QREFELT $ 61))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |GALFACT;degreePartition;LM;19| (|ddlist| $)
  (PROG (|dp| |dd| #1=#:G271 |d| #2=#:G277 |f|)
    (RETURN
     (SEQ
      (LETT |dp| (SPADCALL (QREFELT $ 65))
            . #3=(|GALFACT;degreePartition;LM;19|))
      (LETT |d| 0 . #3#) (LETT |dd| 0 . #3#)
      (SEQ (LETT |f| NIL . #3#) (LETT #2# |ddlist| . #3#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #3#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((ZEROP (LETT |d| (SPADCALL (QCAR |f|) (QREFELT $ 38)) . #3#))
               (LETT |dp| (SPADCALL 0 |dp| (QREFELT $ 66)) . #3#))
              ('T
               (SEQ
                (LETT |dd|
                      (PROG1 (LETT #1# (QCDR |f|) . #3#)
                        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                         #1#))
                      . #3#)
                (EXIT
                 (LETT |dp|
                       (SPADCALL |dd| |dp| (QUOTIENT2 |d| |dd|) (QREFELT $ 67))
                       . #3#)))))))
           (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |dp|))))) 

(DEFUN |GALFACT;henselfact| (|f| |pdecomp| $)
  (PROG (#1=#:G289 #2=#:G288 #3=#:G290 #4=#:G294 |g| |lrf| |b| #5=#:G285
         |cprime| |m| |cf| #6=#:G293)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |f| (QREFELT $ 70))
          (PROGN (LETT #6# (LIST |f|) . #7=(|GALFACT;henselfact|)) (GO #6#)))
         ((QREFELT $ 11)
          (COND
           ((SPADCALL |f| (QREFELT $ 36))
            (PROGN (LETT #6# (LIST |f|) . #7#) (GO #6#))))))
        (COND
         (|pdecomp|
          (COND
           ((QREFELT $ 10) (LETT |cf| (SPADCALL |f| (QREFELT $ 74)) . #7#))
           (#8='T (LETT |cf| (CONS 1 #9="failed") . #7#))))
         (#8# (LETT |cf| (CONS 1 #9#) . #7#)))
        (EXIT
         (COND
          ((QEQCAR |cf| 1)
           (SEQ (LETT |m| (SPADCALL |f| (QREFELT $ 63)) . #7#)
                (EXIT
                 (COND ((ZEROP (LETT |cprime| (QCAR |m|) . #7#)) (QCDR |m|))
                       (#8#
                        (SEQ
                         (LETT |b|
                               (PROG1
                                   (LETT #5#
                                         (*
                                          (SPADCALL 2
                                                    (SPADCALL |f|
                                                              (QREFELT $ 28))
                                                    (QREFELT $ 75))
                                          (SPADCALL |f| (QREFELT $ 77)))
                                         . #7#)
                                 (|check_subtype| (> #5# 0)
                                                  '(|PositiveInteger|) #5#))
                               . #7#)
                         (EXIT
                          (SPADCALL |f| (QCDR |m|) |cprime| |b|
                                    (QREFELT $ 79)))))))))
          (#8#
           (SEQ (LETT |lrf| (QCDR |cf|) . #7#)
                (EXIT
                 (PROGN
                  (LETT #1# NIL . #7#)
                  (SEQ (LETT |g| NIL . #7#)
                       (LETT #4# (|GALFACT;henselfact| (QCAR |lrf|) 'T $)
                             . #7#)
                       G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |g| (CAR #4#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (|GALFACT;henselfact|
                                 (SPADCALL |g| (QCDR |lrf|) (QREFELT $ 80))
                                 'NIL $)
                                . #7#)
                          (COND (#1# (LETT #2# (APPEND #2# #3#) . #7#))
                                ('T
                                 (PROGN
                                  (LETT #2# #3# . #7#)
                                  (LETT #1# 'T . #7#)))))))
                       (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#8# NIL))))))))))
      #6# (EXIT #6#))))) 

(DEFUN |GALFACT;completeFactor| (|f| |lf| |cprime| |pk| |r| |d| $)
  (PROG (|level| |found?| |levels| |ic| #1=#:G341 #2=#:G328 |llg| |b| #3=#:G327
         |ltrue| |degf| #4=#:G324 |lg| |gpk| #5=#:G319 #6=#:G316 #7=#:G315 |rg|
         #8=#:G314 |dg| |f0| |lc| #9=#:G312 #10=#:G311 |nb| |j| |f1| |g| |g0|
         |degg| |i| #11=#:G234)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lc| (SPADCALL |f| (QREFELT $ 28))
              . #12=(|GALFACT;completeFactor|))
        (LETT |f0| (SPADCALL |f| 0 (QREFELT $ 81)) . #12#)
        (LETT |ltrue| NIL . #12#) (LETT |found?| 'T . #12#)
        (LETT |degf| 0 . #12#) (LETT |degg| 0 . #12#) (LETT |g0| 0 . #12#)
        (LETT |g| (|spadConstant| $ 47) . #12#) (LETT |rg| 0 . #12#)
        (LETT |nb| 0 . #12#) (LETT |lg| NIL . #12#) (LETT |b| 1 . #12#)
        (LETT |dg| (SPADCALL (QREFELT $ 48)) . #12#)
        (LETT |llg| (CONS NIL 0) . #12#) (LETT |levels| (LENGTH |lf|) . #12#)
        (LETT |level| 1 . #12#) (LETT |ic| (CONS 1 0) . #12#)
        (LETT |i| 0 . #12#)
        (SEQ G190 (COND ((NULL (< |level| |levels|)) (GO G191)))
             (SEQ (LETT |ic| (CONS 1 (|GALFACT;seed| |level| $)) . #12#)
                  (SEQ G190
                       (COND
                        ((NULL (COND (|found?| 'NIL) ('T (QEQCAR |ic| 1))))
                         (GO G191)))
                       (SEQ
                        (LETT |i|
                              (PROG2 (LETT #11# |ic| . #12#)
                                  (QCDR #11#)
                                (|check_union| (QEQCAR #11# 1) (|Integer|)
                                               #11#))
                              . #12#)
                        (LETT |degg| 0 . #12#) (LETT |g0| 1 . #12#)
                        (SEQ (LETT |j| 1 . #12#) G190
                             (COND ((|greater_SI| |j| |levels|) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |i| (- |j| 1) (QREFELT $ 82))
                                 (SEQ
                                  (LETT |degg|
                                        (+ |degg|
                                           (SPADCALL
                                            (SPADCALL |lf| |j| (QREFELT $ 83))
                                            (QREFELT $ 38)))
                                        . #12#)
                                  (EXIT
                                   (LETT |g0|
                                         (* |g0|
                                            (SPADCALL
                                             (SPADCALL |lf| |j| (QREFELT $ 83))
                                             0 (QREFELT $ 81)))
                                         . #12#)))))))
                             (LETT |j| (|inc_SI| |j|) . #12#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |g0| (SPADCALL (* |lc| |g0|) |pk| (QREFELT $ 84))
                              . #12#)
                        (COND
                         ((SPADCALL |degg| |d| (QREFELT $ 85))
                          (COND
                           ((QEQCAR
                             (SPADCALL (* |lc| |f0|) |g0| (QREFELT $ 87)) 0)
                            (SEQ
                             (LETT |g| (SPADCALL |lc| (QREFELT $ 88)) . #12#)
                             (SEQ (LETT |j| 1 . #12#) G190
                                  (COND
                                   ((|greater_SI| |j| |levels|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL |i| (- |j| 1) (QREFELT $ 82))
                                      (LETT |g|
                                            (SPADCALL |g|
                                                      (SPADCALL |lf| |j|
                                                                (QREFELT $ 83))
                                                      (QREFELT $ 89))
                                            . #12#)))))
                                  (LETT |j| (|inc_SI| |j|) . #12#) (GO G190)
                                  G191 (EXIT NIL))
                             (LETT |g|
                                   (SPADCALL (SPADCALL |g| |pk| (QREFELT $ 90))
                                             (QREFELT $ 91))
                                   . #12#)
                             (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 92))
                                   . #12#)
                             (EXIT
                              (COND
                               ((QEQCAR |f1| 0)
                                (SEQ (LETT |found?| 'T . #12#)
                                     (LETT |nb| 1 . #12#)
                                     (SEQ (LETT |j| 1 . #12#) G190
                                          (COND
                                           ((|greater_SI| |j| |levels|)
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((SPADCALL |i| (- |j| 1)
                                                        (QREFELT $ 82))
                                              (SEQ
                                               (SPADCALL |lf| |j| |nb|
                                                         (QREFELT $ 94))
                                               (EXIT
                                                (LETT |nb| (+ |nb| 1)
                                                      . #12#)))))))
                                          (LETT |j| (|inc_SI| |j|) . #12#)
                                          (GO G190) G191 (EXIT NIL))
                                     (LETT |lg| |lf| . #12#)
                                     (LETT |lf|
                                           (SPADCALL |lf|
                                                     (PROG1
                                                         (LETT #10# |level|
                                                               . #12#)
                                                       (|check_subtype|
                                                        (>= #10# 0)
                                                        '(|NonNegativeInteger|)
                                                        #10#))
                                                     (QREFELT $ 95))
                                           . #12#)
                                     (SPADCALL
                                      (SPADCALL |lg|
                                                (PROG1
                                                    (LETT #9# (- |level| 1)
                                                          . #12#)
                                                  (|check_subtype| (>= #9# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   #9#))
                                                (QREFELT $ 95))
                                      NIL (QREFELT $ 96))
                                     (LETT |f| (QCDR |f1|) . #12#)
                                     (LETT |lc| (SPADCALL |f| (QREFELT $ 28))
                                           . #12#)
                                     (LETT |f0| (SPADCALL |f| 0 (QREFELT $ 81))
                                           . #12#)
                                     (LETT |dg|
                                           (SPADCALL
                                            (CONS #'|GALFACT;completeFactor!0|
                                                  (VECTOR $ |degg|))
                                            |d| (QREFELT $ 99))
                                           . #12#)
                                     (COND
                                      ((SPADCALL |dg|
                                                 (SPADCALL (LIST 0 |degg|)
                                                           (QREFELT $ 45))
                                                 (QREFELT $ 58))
                                       (LETT |lg| (LIST |g|) . #12#))
                                      ('T
                                       (SEQ
                                        (LETT |rg|
                                              (PROG1
                                                  (LETT #8#
                                                        (MAX 2
                                                             (- (+ |r| |level|)
                                                                |levels|))
                                                        . #12#)
                                                (|check_subtype| (>= #8# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #8#))
                                              . #12#)
                                        (LETT |b|
                                              (PROG1
                                                  (LETT #7#
                                                        (*
                                                         (SPADCALL 2
                                                                   (SPADCALL
                                                                    |g|
                                                                    (QREFELT $
                                                                             28))
                                                                   (QREFELT $
                                                                            75))
                                                         (SPADCALL |g| |rg|
                                                                   (QREFELT $
                                                                            100)))
                                                        . #12#)
                                                (|check_subtype| (> #7# 0)
                                                                 '(|PositiveInteger|)
                                                                 #7#))
                                              . #12#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |b| |pk| (QREFELT $ 101))
                                           (COND
                                            ((SPADCALL |g| (QREFELT $ 70))
                                             (LETT |lg| (LIST |g|) . #12#))
                                            ((QREFELT $ 11)
                                             (COND
                                              ((SPADCALL |g| (QREFELT $ 36))
                                               (LETT |lg| (LIST |g|) . #12#))
                                              ('T
                                               (SEQ
                                                (LETT |llg|
                                                      (SPADCALL |g| |lg|
                                                                |cprime| |b|
                                                                (QREFELT $
                                                                         103))
                                                      . #12#)
                                                (LETT |gpk|
                                                      (PROG1
                                                          (LETT #6#
                                                                (QCDR |llg|)
                                                                . #12#)
                                                        (|check_subtype|
                                                         (> #6# 0)
                                                         '(|PositiveInteger|)
                                                         #6#))
                                                      . #12#)
                                                (EXIT
                                                 (COND
                                                  ((< |gpk| |b|)
                                                   (LETT |lg| (QCAR |llg|)
                                                         . #12#))
                                                  ('T
                                                   (LETT |lg|
                                                         (|GALFACT;completeFactor|
                                                          |g| (QCAR |llg|)
                                                          |cprime| |gpk| |rg|
                                                          |dg| $)
                                                         . #12#))))))))
                                            ('T
                                             (SEQ
                                              (LETT |llg|
                                                    (SPADCALL |g| |lg| |cprime|
                                                              |b|
                                                              (QREFELT $ 103))
                                                    . #12#)
                                              (LETT |gpk|
                                                    (PROG1
                                                        (LETT #5# (QCDR |llg|)
                                                              . #12#)
                                                      (|check_subtype|
                                                       (> #5# 0)
                                                       '(|PositiveInteger|)
                                                       #5#))
                                                    . #12#)
                                              (EXIT
                                               (COND
                                                ((< |gpk| |b|)
                                                 (LETT |lg| (QCAR |llg|)
                                                       . #12#))
                                                ('T
                                                 (LETT |lg|
                                                       (|GALFACT;completeFactor|
                                                        |g| (QCAR |llg|)
                                                        |cprime| |gpk| |rg|
                                                        |dg| $)
                                                       . #12#))))))))
                                          ('T
                                           (LETT |lg| (LIST |g|) . #12#)))))))
                                     (LETT |ltrue| (APPEND |ltrue| |lg|)
                                           . #12#)
                                     (LETT |r|
                                           (PROG1
                                               (LETT #4#
                                                     (MAX 2
                                                          (- |r|
                                                             (LENGTH |lg|)))
                                                     . #12#)
                                             (|check_subtype| (>= #4# 0)
                                                              '(|NonNegativeInteger|)
                                                              #4#))
                                           . #12#)
                                     (LETT |degf| (SPADCALL |f| (QREFELT $ 38))
                                           . #12#)
                                     (LETT |d|
                                           (SPADCALL
                                            (CONS #'|GALFACT;completeFactor!1|
                                                  (VECTOR $ |degf|))
                                            |d| (QREFELT $ 99))
                                           . #12#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |degf| 1 (QREFELT $ 97))
                                        (SEQ
                                         (COND
                                          ((EQL |degf| 1)
                                           (LETT |ltrue| (CONS |f| |ltrue|)
                                                 . #12#)))
                                         (EXIT
                                          (PROGN
                                           (LETT #1# |ltrue| . #12#)
                                           (GO #1#)))))
                                       ('T
                                        (SEQ
                                         (LETT |b|
                                               (PROG1
                                                   (LETT #3#
                                                         (*
                                                          (SPADCALL 2 |lc|
                                                                    (QREFELT $
                                                                             75))
                                                          (SPADCALL |f| |r|
                                                                    (QREFELT $
                                                                             100)))
                                                         . #12#)
                                                 (|check_subtype| (> #3# 0)
                                                                  '(|PositiveInteger|)
                                                                  #3#))
                                               . #12#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |b| |pk| (QREFELT $ 101))
                                            (SEQ
                                             (LETT |llg|
                                                   (SPADCALL |f| |lf| |cprime|
                                                             |b|
                                                             (QREFELT $ 103))
                                                   . #12#)
                                             (LETT |lf| (QCAR |llg|) . #12#)
                                             (LETT |pk|
                                                   (PROG1
                                                       (LETT #2# (QCDR |llg|)
                                                             . #12#)
                                                     (|check_subtype| (> #2# 0)
                                                                      '(|PositiveInteger|)
                                                                      #2#))
                                                   . #12#)
                                             (COND
                                              ((< |pk| |b|)
                                               (PROGN
                                                (LETT #1# (APPEND |lf| |ltrue|)
                                                      . #12#)
                                                (GO #1#))))
                                             (EXIT
                                              (LETT |level| 1
                                                    . #12#)))))))))))))))))))
                        (EXIT
                         (LETT |ic|
                               (|GALFACT;nextRecNum| |levels| |level| |i| $)
                               . #12#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (COND
                   (|found?|
                    (SEQ (LETT |levels| (LENGTH |lf|) . #12#)
                         (EXIT (LETT |found?| 'NIL . #12#)))))
                  (EXIT
                   (COND
                    ((NULL (QEQCAR |ic| 1))
                     (LETT |level| (+ |level| 1) . #12#)))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT (CONS |f| |ltrue|))))
      #1# (EXIT #1#))))) 

(DEFUN |GALFACT;completeFactor!1| (|x| $$)
  (PROG (|degf| $)
    (LETT |degf| (QREFELT $$ 1) . #1=(|GALFACT;completeFactor|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |degf| (QREFELT $ 97)))))) 

(DEFUN |GALFACT;completeFactor!0| (|x| $$)
  (PROG (|degg| $)
    (LETT |degg| (QREFELT $$ 1) . #1=(|GALFACT;completeFactor|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |degg| (QREFELT $ 97)))))) 

(DEFUN |GALFACT;divideSet| (|s| |n| $)
  (PROG (|l| |ee| #1=#:G349 |e|)
    (RETURN
     (SEQ (LETT |l| (LIST 0) . #2=(|GALFACT;divideSet|))
          (SEQ (LETT |e| NIL . #2#)
               (LETT #1# (SPADCALL |s| (QREFELT $ 44)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |ee| (SPADCALL |e| |n| (QREFELT $ 104)) . #2#)
                    (EXIT
                     (COND
                      ((QEQCAR |ee| 0)
                       (LETT |l| (CONS (QCDR |ee|) |l|) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |l| (QREFELT $ 45))))))) 

(DEFUN |GALFACT;btwFactor| (|f| |d| |r| |pdecomp| $)
  (PROG (#1=#:G388 |i| |lf| #2=#:G387 |fact| #3=#:G386 #4=#:G375 |lfg|
         #5=#:G374 |df| #6=#:G371 |dgh| |g| #7=#:G385 |lg| |dh| |lrf| |pk|
         #8=#:G366 |lm| |b| #9=#:G364 |f0| |lc| #10=#:G384 |cprime| |m| |cf|
         |negativelc?| |reverse?|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |df| (SPADCALL |f| (QREFELT $ 38)) . #11=(|GALFACT;btwFactor|))
        (COND
         ((NULL (EQL (SPADCALL |d| (QREFELT $ 105)) |df|))
          (EXIT (|error| "btwFact: Bad arguments"))))
        (LETT |reverse?| 'NIL . #11#) (LETT |negativelc?| 'NIL . #11#)
        (EXIT
         (COND
          ((SPADCALL |d| (SPADCALL (LIST 0 |df|) (QREFELT $ 45))
                     (QREFELT $ 58))
           (LIST |f|))
          (#12='T
           (SEQ
            (COND
             ((< (ABS (SPADCALL |f| 0 (QREFELT $ 81)))
                 (ABS (SPADCALL |f| (QREFELT $ 28))))
              (SEQ (LETT |f| (SPADCALL |f| (QREFELT $ 107)) . #11#)
                   (EXIT (LETT |reverse?| 'T . #11#)))))
            (COND
             ((SPADCALL |f| (QREFELT $ 70))
              (EXIT
               (COND (|reverse?| (LIST (SPADCALL |f| (QREFELT $ 107))))
                     (#12# (LIST |f|)))))
             ((QREFELT $ 11)
              (COND
               ((SPADCALL |f| (QREFELT $ 36))
                (EXIT
                 (COND (|reverse?| (LIST (SPADCALL |f| (QREFELT $ 107))))
                       (#12# (LIST |f|))))))))
            (COND
             ((< (SPADCALL |f| (QREFELT $ 28)) 0)
              (SEQ (LETT |f| (SPADCALL |f| (QREFELT $ 108)) . #11#)
                   (EXIT (LETT |negativelc?| 'T . #11#)))))
            (COND
             (|pdecomp|
              (COND
               ((QREFELT $ 10)
                (LETT |cf| (SPADCALL |f| (QREFELT $ 74)) . #11#))
               (#12# (LETT |cf| (CONS 1 #13="failed") . #11#))))
             (#12# (LETT |cf| (CONS 1 #13#) . #11#)))
            (COND
             ((QEQCAR |cf| 1)
              (SEQ (LETT |m| (SPADCALL |f| (QREFELT $ 63)) . #11#)
                   (EXIT
                    (COND
                     ((ZEROP (LETT |cprime| (QCAR |m|) . #11#))
                      (COND
                       (|reverse?|
                        (COND
                         (|negativelc?|
                          (PROGN
                           (LETT #10#
                                 (LIST
                                  (SPADCALL (SPADCALL |f| (QREFELT $ 107))
                                            (QREFELT $ 108)))
                                 . #11#)
                           (GO #10#)))
                         (#12#
                          (PROGN
                           (LETT #10# (LIST (SPADCALL |f| (QREFELT $ 107)))
                                 . #11#)
                           (GO #10#)))))
                       (|negativelc?|
                        (PROGN
                         (LETT #10# (LIST (SPADCALL |f| (QREFELT $ 108)))
                               . #11#)
                         (GO #10#)))
                       (#12# (PROGN (LETT #10# (LIST |f|) . #11#) (GO #10#)))))
                     (#12#
                      (SEQ
                       (COND
                        ((SPADCALL |f| (QREFELT $ 109))
                         (LETT |d| (SPADCALL 1 |d| (QREFELT $ 111)) . #11#)))
                       (LETT |lc| (SPADCALL |f| (QREFELT $ 28)) . #11#)
                       (LETT |f0| (SPADCALL |f| 0 (QREFELT $ 81)) . #11#)
                       (LETT |b|
                             (PROG1
                                 (LETT #9#
                                       (* (SPADCALL 2 |lc| (QREFELT $ 75))
                                          (SPADCALL |f| |r| (QREFELT $ 100)))
                                       . #11#)
                               (|check_subtype| (> #9# 0) '(|PositiveInteger|)
                                                #9#))
                             . #11#)
                       (LETT |lm|
                             (SPADCALL |f| (QCDR |m|) |cprime| |b|
                                       (QREFELT $ 103))
                             . #11#)
                       (LETT |lf| (QCAR |lm|) . #11#)
                       (LETT |pk|
                             (PROG1 (LETT #8# (QCDR |lm|) . #11#)
                               (|check_subtype| (> #8# 0) '(|PositiveInteger|)
                                                #8#))
                             . #11#)
                       (COND
                        ((SPADCALL (|SPADfirst| |lf|) (QREFELT $ 112))
                         (LETT |lf| (CDR |lf|) . #11#)))
                       (EXIT
                        (COND
                         ((NULL (< |pk| |b|))
                          (LETT |lf|
                                (|GALFACT;completeFactor| |f| |lf| |cprime|
                                 |pk| |r| |d| $)
                                . #11#))))))))))
             (#12#
              (SEQ (LETT |lrf| (QCDR |cf|) . #11#)
                   (LETT |dh| (SPADCALL (QCDR |lrf|) (QREFELT $ 38)) . #11#)
                   (LETT |lg|
                         (|GALFACT;btwFactor| (QCAR |lrf|)
                          (|GALFACT;divideSet| |d| |dh| $) 2 'T $)
                         . #11#)
                   (LETT |lf| NIL . #11#)
                   (EXIT
                    (SEQ (LETT |i| 1 . #11#) (LETT #7# (LENGTH |lg|) . #11#)
                         G190 (COND ((|greater_SI| |i| #7#) (GO G191)))
                         (SEQ
                          (LETT |g| (SPADCALL |lg| |i| (QREFELT $ 83)) . #11#)
                          (LETT |dgh| (* (SPADCALL |g| (QREFELT $ 38)) |dh|)
                                . #11#)
                          (LETT |df|
                                (PROG2
                                    (LETT #6#
                                          (SPADCALL |df| |dgh| (QREFELT $ 113))
                                          . #11#)
                                    (QCDR #6#)
                                  (|check_union| (QEQCAR #6# 0)
                                                 (|NonNegativeInteger|) #6#))
                                . #11#)
                          (LETT |lfg|
                                (|GALFACT;btwFactor|
                                 (SPADCALL |g| (QCDR |lrf|) (QREFELT $ 80))
                                 (SPADCALL
                                  (CONS #'|GALFACT;btwFactor!0|
                                        (VECTOR $ |dgh|))
                                  |d| (QREFELT $ 99))
                                 (PROG1 (LETT #5# (MAX 2 (- |r| |df|)) . #11#)
                                   (|check_subtype| (>= #5# 0)
                                                    '(|NonNegativeInteger|)
                                                    #5#))
                                 'NIL $)
                                . #11#)
                          (LETT |lf| (APPEND |lf| |lfg|) . #11#)
                          (EXIT
                           (LETT |r|
                                 (PROG1
                                     (LETT #4# (MAX 2 (- |r| (LENGTH |lfg|)))
                                           . #11#)
                                   (|check_subtype| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    #4#))
                                 . #11#)))
                         (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                         (EXIT NIL))))))
            (COND
             (|reverse?|
              (LETT |lf|
                    (PROGN
                     (LETT #3# NIL . #11#)
                     (SEQ (LETT |fact| NIL . #11#) (LETT #2# |lf| . #11#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |fact| (CAR #2#) . #11#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS (SPADCALL |fact| (QREFELT $ 107)) #3#)
                                  . #11#)))
                          (LETT #2# (CDR #2#) . #11#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #11#)))
            (SEQ (LETT |i| 1 . #11#) (LETT #1# (LENGTH |lf|) . #11#) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((<
                      (SPADCALL (SPADCALL |lf| |i| (QREFELT $ 83))
                                (QREFELT $ 28))
                      0)
                     (SPADCALL |lf| |i|
                               (SPADCALL (SPADCALL |lf| |i| (QREFELT $ 83))
                                         (QREFELT $ 108))
                               (QREFELT $ 114))))))
                 (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191 (EXIT NIL))
            (EXIT |lf|)))))))
      #10# (EXIT #10#))))) 

(DEFUN |GALFACT;btwFactor!0| (|x| $$)
  (PROG (|dgh| $)
    (LETT |dgh| (QREFELT $$ 1) . #1=(|GALFACT;btwFactor|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |dgh| (QREFELT $ 97)))))) 

(DEFUN |GALFACT;makeFR;RF;24| (|flist| $)
  (PROG (|fflist| #1=#:G405 |fc| #2=#:G404 |ff| |ctp|)
    (RETURN
     (SEQ
      (LETT |ctp| (SPADCALL (QCAR |flist|) (QREFELT $ 31))
            . #3=(|GALFACT;makeFR;RF;24|))
      (LETT |fflist| NIL . #3#)
      (SEQ (LETT |ff| NIL . #3#) (LETT #2# (QCDR |flist|) . #3#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |ff| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |fflist|
                   (CONS (VECTOR (CONS 3 "prime") (QCAR |ff|) (QCDR |ff|))
                         |fflist|)
                   . #3#)))
           (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |fc| NIL . #3#)
           (LETT #1# (SPADCALL |ctp| (QREFELT $ 118)) . #3#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |fc| (CAR #1#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |fflist|
                   (CONS
                    (VECTOR (QVELT |fc| 0)
                            (SPADCALL (QVELT |fc| 1) (QREFELT $ 88))
                            (QVELT |fc| 2))
                    |fflist|)
                   . #3#)))
           (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL (SPADCALL (SPADCALL |ctp| (QREFELT $ 119)) (QREFELT $ 88))
                 |fflist| (QREFELT $ 123))))))) 

(DEFUN |GALFACT;quadratic| (|p| $)
  (PROG (#1=#:G411 |f| |b| |a| |d| |r|)
    (RETURN
     (SEQ (LETT |a| (SPADCALL |p| (QREFELT $ 28)) . #2=(|GALFACT;quadratic|))
          (LETT |b| (SPADCALL |p| 1 (QREFELT $ 81)) . #2#)
          (LETT |d|
                (- (SPADCALL |b| 2 (QREFELT $ 127))
                   (* (SPADCALL 4 |a| (QREFELT $ 75))
                      (SPADCALL |p| 0 (QREFELT $ 81))))
                . #2#)
          (LETT |r| (SPADCALL |d| (QREFELT $ 130)) . #2#)
          (EXIT
           (COND ((QEQCAR |r| 1) (LIST |p|))
                 ('T
                  (SEQ (LETT |b| (+ |b| (QCDR |r|)) . #2#)
                       (LETT |a| (SPADCALL 2 |a| (QREFELT $ 75)) . #2#)
                       (LETT |d| (GCD |a| |b|) . #2#)
                       (COND
                        ((NULL (EQL |d| 1))
                         (SEQ (LETT |a| (QUOTIENT2 |a| |d|) . #2#)
                              (EXIT (LETT |b| (QUOTIENT2 |b| |d|) . #2#)))))
                       (LETT |f|
                             (SPADCALL (SPADCALL |a| 1 (QREFELT $ 131))
                                       (SPADCALL |b| 0 (QREFELT $ 131))
                                       (QREFELT $ 132))
                             . #2#)
                       (EXIT
                        (CONS |f|
                              (LIST
                               (PROG2
                                   (LETT #1# (SPADCALL |p| |f| (QREFELT $ 92))
                                         . #2#)
                                   (QCDR #1#)
                                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 6)
                                                #1#))))))))))))) 

(DEFUN |GALFACT;isPowerOf2| (|n| $)
  (PROG (|qr|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 1) 'T)
            (#1='T
             (SEQ (LETT |qr| (DIVIDE2 |n| 2) |GALFACT;isPowerOf2|)
                  (EXIT
                   (COND ((EQL (QCDR |qr|) 1) 'NIL)
                         (#1# (|GALFACT;isPowerOf2| (QCAR |qr|) $))))))))))) 

(DEFUN |GALFACT;subMinusX| (|supPol| $)
  (PROG (|minusX|)
    (RETURN
     (SEQ (LETT |minusX| (SPADCALL -1 1 (QREFELT $ 134)) |GALFACT;subMinusX|)
          (EXIT
           (SPADCALL (SPADCALL |supPol| |minusX| (QREFELT $ 135))
                     (QREFELT $ 136))))))) 

(DEFUN |GALFACT;henselFact;UPBR;28| (|f| |sqf| $)
  (PROG (|factorlist| #1=#:G461 |pf| #2=#:G460 #3=#:G459 #4=#:G458 |d| |sqff|
         |mult| #5=#:G457 |sqfr| |sqfflist| #6=#:G456 #7=#:G455 |fac| #8=#:G454
         |sfac| #9=#:G453 |lcPol| |c| #10=#:G424)
    (RETURN
     (SEQ (LETT |factorlist| NIL . #11=(|GALFACT;henselFact;UPBR;28|))
          (LETT |c| (SPADCALL |f| (QREFELT $ 26)) . #11#)
          (LETT |f|
                (PROG2 (LETT #10# (SPADCALL |f| |c| (QREFELT $ 137)) . #11#)
                    (QCDR #10#)
                  (|check_union| (QEQCAR #10# 0) (QREFELT $ 6) #10#))
                . #11#)
          (COND
           ((< (SPADCALL |f| (QREFELT $ 28)) 0)
            (SEQ (LETT |c| (- |c|) . #11#)
                 (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 108)) . #11#)))))
          (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 138)) . #11#)
               (EXIT
                (COND
                 ((SPADCALL |d| 0 (QREFELT $ 50))
                  (SEQ
                   (LETT |f|
                         (QCAR
                          (SPADCALL |f| (SPADCALL 1 |d| (QREFELT $ 131))
                                    (QREFELT $ 140)))
                         . #11#)
                   (EXIT
                    (LETT |factorlist|
                          (LIST (CONS (SPADCALL 1 1 (QREFELT $ 131)) |d|))
                          . #11#)))))))
          (LETT |d| (SPADCALL |f| (QREFELT $ 38)) . #11#)
          (EXIT
           (COND ((ZEROP |d|) (CONS |c| |factorlist|))
                 ((EQL |d| 1) (CONS |c| (CONS (CONS |f| 1) |factorlist|)))
                 (#12='T
                  (SEQ
                   (LETT |lcPol|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 28))
                                   (QREFELT $ 88))
                         . #11#)
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |lcPol| (QREFELT $ 108))
                                (SPADCALL |f| (QREFELT $ 24)) (QREFELT $ 141))
                      (SEQ
                       (SEQ (LETT |fac| NIL . #11#)
                            (LETT #9#
                                  (SPADCALL (ELT $ 136)
                                            (SPADCALL |d| (QREFELT $ 144))
                                            (QREFELT $ 147))
                                  . #11#)
                            G190
                            (COND
                             ((OR (ATOM #9#)
                                  (PROGN (LETT |fac| (CAR #9#) . #11#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |factorlist|
                                    (CONS (CONS |fac| 1) |factorlist|)
                                    . #11#)))
                            (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (CONS |c| |factorlist|))))
                     (#12#
                      (SEQ
                       (COND
                        ((ODDP |d|)
                         (COND
                          ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                     (QREFELT $ 141))
                           (EXIT
                            (SEQ
                             (SEQ (LETT |sfac| NIL . #11#)
                                  (LETT #8# (SPADCALL |d| (QREFELT $ 144))
                                        . #11#)
                                  G190
                                  (COND
                                   ((OR (ATOM #8#)
                                        (PROGN
                                         (LETT |sfac| (CAR #8#) . #11#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |fac| (|GALFACT;subMinusX| |sfac| $)
                                         . #11#)
                                   (COND
                                    ((< (SPADCALL |fac| (QREFELT $ 28)) 0)
                                     (LETT |fac|
                                           (SPADCALL |fac| (QREFELT $ 108))
                                           . #11#)))
                                   (EXIT
                                    (LETT |factorlist|
                                          (CONS (CONS |fac| 1) |factorlist|)
                                          . #11#)))
                                  (LETT #8# (CDR #8#) . #11#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS |c| |factorlist|))))))))
                       (COND
                        ((|GALFACT;isPowerOf2| |d| $)
                         (COND
                          ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                     (QREFELT $ 141))
                           (EXIT
                            (SEQ
                             (LETT |factorlist|
                                   (CONS (CONS |f| 1) |factorlist|) . #11#)
                             (EXIT (CONS |c| |factorlist|))))))))
                       (EXIT
                        (COND
                         (|sqf|
                          (CONS |c|
                                (APPEND
                                 (PROGN
                                  (LETT #7# NIL . #11#)
                                  (SEQ (LETT |pf| NIL . #11#)
                                       (LETT #6#
                                             (|GALFACT;henselfact| |f| 'T $)
                                             . #11#)
                                       G190
                                       (COND
                                        ((OR (ATOM #6#)
                                             (PROGN
                                              (LETT |pf| (CAR #6#) . #11#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #7# (CONS (CONS |pf| 1) #7#)
                                               . #11#)))
                                       (LETT #6# (CDR #6#) . #11#) (GO G190)
                                       G191 (EXIT (NREVERSE #7#))))
                                 |factorlist|)))
                         (#12#
                          (SEQ
                           (LETT |sqfflist|
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 148))
                                           (QREFELT $ 151))
                                 . #11#)
                           (SEQ (LETT |sqfr| NIL . #11#)
                                (LETT #5# |sqfflist| . #11#) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN
                                       (LETT |sqfr| (CAR #5#) . #11#)
                                       NIL))
                                  (GO G191)))
                                (SEQ (LETT |mult| (QCDR |sqfr|) . #11#)
                                     (LETT |sqff| (QCAR |sqfr|) . #11#)
                                     (LETT |d| (SPADCALL |sqff| (QREFELT $ 38))
                                           . #11#)
                                     (EXIT
                                      (COND
                                       ((EQL |d| 1)
                                        (LETT |factorlist|
                                              (CONS (CONS |sqff| |mult|)
                                                    |factorlist|)
                                              . #11#))
                                       ((EQL |d| 2)
                                        (LETT |factorlist|
                                              (APPEND
                                               (PROGN
                                                (LETT #4# NIL . #11#)
                                                (SEQ (LETT |pf| NIL . #11#)
                                                     (LETT #3#
                                                           (|GALFACT;quadratic|
                                                            |sqff| $)
                                                           . #11#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #3#)
                                                           (PROGN
                                                            (LETT |pf|
                                                                  (CAR #3#)
                                                                  . #11#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #4#
                                                             (CONS
                                                              (CONS |pf|
                                                                    |mult|)
                                                              #4#)
                                                             . #11#)))
                                                     (LETT #3# (CDR #3#)
                                                           . #11#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #4#))))
                                               |factorlist|)
                                              . #11#))
                                       ('T
                                        (LETT |factorlist|
                                              (APPEND
                                               (PROGN
                                                (LETT #2# NIL . #11#)
                                                (SEQ (LETT |pf| NIL . #11#)
                                                     (LETT #1#
                                                           (|GALFACT;henselfact|
                                                            |sqff| 'T $)
                                                           . #11#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #1#)
                                                           (PROGN
                                                            (LETT |pf|
                                                                  (CAR #1#)
                                                                  . #11#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #2#
                                                             (CONS
                                                              (CONS |pf|
                                                                    |mult|)
                                                              #2#)
                                                             . #11#)))
                                                     (LETT #1# (CDR #1#)
                                                           . #11#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #2#))))
                                               |factorlist|)
                                              . #11#)))))
                                (LETT #5# (CDR #5#) . #11#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (CONS |c| |factorlist|)))))))))))))))))) 

(DEFUN |GALFACT;btwFact;UPBSNniR;29| (|f| |sqf| |fd| |r| $)
  (PROG (|maxd| #1=#:G503 |factorlist| #2=#:G521 |pf| #3=#:G520 #4=#:G498
         #5=#:G519 #6=#:G518 #7=#:G494 |d| |sqff| |mult| #8=#:G517 |sqfr|
         #9=#:G492 |sqfflist| #10=#:G516 #11=#:G515 |fac| #12=#:G514 |sfac|
         #13=#:G513 |lcPol| #14=#:G473 #15=#:G471 |c| #16=#:G466)
    (RETURN
     (SEQ
      (LETT |d| (SPADCALL |f| (QREFELT $ 38))
            . #17=(|GALFACT;btwFact;UPBSNniR;29|))
      (COND
       ((NULL (EQL (SPADCALL |fd| (QREFELT $ 105)) |d|))
        (EXIT (|error| "btwFact: Bad arguments"))))
      (LETT |factorlist| NIL . #17#)
      (LETT |c| (SPADCALL |f| (QREFELT $ 26)) . #17#)
      (LETT |f|
            (PROG2 (LETT #16# (SPADCALL |f| |c| (QREFELT $ 137)) . #17#)
                (QCDR #16#)
              (|check_union| (QEQCAR #16# 0) (QREFELT $ 6) #16#))
            . #17#)
      (COND
       ((< (SPADCALL |f| (QREFELT $ 28)) 0)
        (SEQ (LETT |c| (- |c|) . #17#)
             (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 108)) . #17#)))))
      (SEQ (LETT |maxd| (SPADCALL |f| (QREFELT $ 138)) . #17#)
           (EXIT
            (COND
             ((SPADCALL |maxd| 0 (QREFELT $ 50))
              (SEQ
               (LETT |f|
                     (QCAR
                      (SPADCALL |f| (SPADCALL 1 |maxd| (QREFELT $ 131))
                                (QREFELT $ 140)))
                     . #17#)
               (LETT |factorlist|
                     (LIST (CONS (SPADCALL 1 1 (QREFELT $ 131)) |maxd|))
                     . #17#)
               (LETT |r|
                     (PROG1 (LETT #15# (MAX 2 (- |r| |maxd|)) . #17#)
                       (|check_subtype| (>= #15# 0) '(|NonNegativeInteger|)
                                        #15#))
                     . #17#)
               (LETT |d|
                     (PROG2
                         (LETT #14# (SPADCALL |d| |maxd| (QREFELT $ 113))
                               . #17#)
                         (QCDR #14#)
                       (|check_union| (QEQCAR #14# 0) (|NonNegativeInteger|)
                                      #14#))
                     . #17#)
               (EXIT
                (LETT |fd|
                      (SPADCALL
                       (CONS #'|GALFACT;btwFact;UPBSNniR;29!0| (VECTOR $ |d|))
                       |fd| (QREFELT $ 99))
                      . #17#)))))))
      (EXIT
       (COND ((ZEROP |d|) (CONS |c| |factorlist|))
             ((EQL |d| 1) (CONS |c| (CONS (CONS |f| 1) |factorlist|)))
             (#18='T
              (SEQ
               (LETT |lcPol|
                     (SPADCALL (SPADCALL |f| (QREFELT $ 28)) (QREFELT $ 88))
                     . #17#)
               (EXIT
                (COND
                 ((SPADCALL (SPADCALL |lcPol| (QREFELT $ 108))
                            (SPADCALL |f| (QREFELT $ 24)) (QREFELT $ 141))
                  (SEQ
                   (SEQ (LETT |fac| NIL . #17#)
                        (LETT #13#
                              (SPADCALL (ELT $ 136)
                                        (SPADCALL |d| (QREFELT $ 144))
                                        (QREFELT $ 147))
                              . #17#)
                        G190
                        (COND
                         ((OR (ATOM #13#)
                              (PROGN (LETT |fac| (CAR #13#) . #17#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |factorlist| (CONS (CONS |fac| 1) |factorlist|)
                                . #17#)))
                        (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT (CONS |c| |factorlist|))))
                 (#18#
                  (SEQ
                   (COND
                    ((ODDP |d|)
                     (COND
                      ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                 (QREFELT $ 141))
                       (EXIT
                        (SEQ
                         (SEQ (LETT |sfac| NIL . #17#)
                              (LETT #12# (SPADCALL |d| (QREFELT $ 144)) . #17#)
                              G190
                              (COND
                               ((OR (ATOM #12#)
                                    (PROGN
                                     (LETT |sfac| (CAR #12#) . #17#)
                                     NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |fac| (|GALFACT;subMinusX| |sfac| $)
                                     . #17#)
                               (COND
                                ((< (SPADCALL |fac| (QREFELT $ 28)) 0)
                                 (LETT |fac| (SPADCALL |fac| (QREFELT $ 108))
                                       . #17#)))
                               (EXIT
                                (LETT |factorlist|
                                      (CONS (CONS |fac| 1) |factorlist|)
                                      . #17#)))
                              (LETT #12# (CDR #12#) . #17#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (CONS |c| |factorlist|))))))))
                   (COND
                    ((|GALFACT;isPowerOf2| |d| $)
                     (COND
                      ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                 (QREFELT $ 141))
                       (EXIT
                        (SEQ
                         (LETT |factorlist| (CONS (CONS |f| 1) |factorlist|)
                               . #17#)
                         (EXIT (CONS |c| |factorlist|))))))))
                   (EXIT
                    (COND
                     (|sqf|
                      (CONS |c|
                            (APPEND
                             (PROGN
                              (LETT #11# NIL . #17#)
                              (SEQ (LETT |pf| NIL . #17#)
                                   (LETT #10#
                                         (|GALFACT;btwFactor| |f| |fd| |r| 'T
                                          $)
                                         . #17#)
                                   G190
                                   (COND
                                    ((OR (ATOM #10#)
                                         (PROGN
                                          (LETT |pf| (CAR #10#) . #17#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #11# (CONS (CONS |pf| 1) #11#)
                                           . #17#)))
                                   (LETT #10# (CDR #10#) . #17#) (GO G190) G191
                                   (EXIT (NREVERSE #11#))))
                             |factorlist|)))
                     (#18#
                      (SEQ
                       (LETT |sqfflist|
                             (SPADCALL (SPADCALL |f| (QREFELT $ 148))
                                       (QREFELT $ 151))
                             . #17#)
                       (COND
                        ((EQL (LENGTH |sqfflist|) 1)
                         (LETT |r|
                               (PROG1
                                   (LETT #9#
                                         (MAX
                                          (QUOTIENT2 |r|
                                                     (QCDR
                                                      (|SPADfirst|
                                                       |sqfflist|)))
                                          2)
                                         . #17#)
                                 (|check_subtype| (>= #9# 0)
                                                  '(|NonNegativeInteger|) #9#))
                               . #17#))
                        (#18# (LETT |r| 2 . #17#)))
                       (SEQ (LETT |sqfr| NIL . #17#)
                            (LETT #8# |sqfflist| . #17#) G190
                            (COND
                             ((OR (ATOM #8#)
                                  (PROGN (LETT |sqfr| (CAR #8#) . #17#) NIL))
                              (GO G191)))
                            (SEQ (LETT |mult| (QCDR |sqfr|) . #17#)
                                 (LETT |sqff| (QCAR |sqfr|) . #17#)
                                 (LETT |d| (SPADCALL |sqff| (QREFELT $ 38))
                                       . #17#)
                                 (EXIT
                                  (COND
                                   ((EQL |d| 1)
                                    (SEQ
                                     (LETT |factorlist|
                                           (CONS (CONS |sqff| |mult|)
                                                 |factorlist|)
                                           . #17#)
                                     (LETT |maxd|
                                           (PROG1
                                               (LETT #7#
                                                     (-
                                                      (SPADCALL |fd|
                                                                (QREFELT $
                                                                         105))
                                                      |mult|)
                                                     . #17#)
                                             (|check_subtype| (>= #7# 0)
                                                              '(|NonNegativeInteger|)
                                                              #7#))
                                           . #17#)
                                     (EXIT
                                      (LETT |fd|
                                            (SPADCALL
                                             (CONS
                                              #'|GALFACT;btwFact;UPBSNniR;29!1|
                                              (VECTOR $ |maxd|))
                                             |fd| (QREFELT $ 99))
                                            . #17#))))
                                   ((EQL |d| 2)
                                    (SEQ
                                     (LETT |factorlist|
                                           (APPEND
                                            (PROGN
                                             (LETT #6# NIL . #17#)
                                             (SEQ (LETT |pf| NIL . #17#)
                                                  (LETT #5#
                                                        (|GALFACT;quadratic|
                                                         |sqff| $)
                                                        . #17#)
                                                  G190
                                                  (COND
                                                   ((OR (ATOM #5#)
                                                        (PROGN
                                                         (LETT |pf| (CAR #5#)
                                                               . #17#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #6#
                                                          (CONS
                                                           (CONS |pf| |mult|)
                                                           #6#)
                                                          . #17#)))
                                                  (LETT #5# (CDR #5#) . #17#)
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #6#))))
                                            |factorlist|)
                                           . #17#)
                                     (LETT |maxd|
                                           (PROG1
                                               (LETT #4#
                                                     (-
                                                      (SPADCALL |fd|
                                                                (QREFELT $
                                                                         105))
                                                      (SPADCALL 2 |mult|
                                                                (QREFELT $
                                                                         75)))
                                                     . #17#)
                                             (|check_subtype| (>= #4# 0)
                                                              '(|NonNegativeInteger|)
                                                              #4#))
                                           . #17#)
                                     (EXIT
                                      (LETT |fd|
                                            (SPADCALL
                                             (CONS
                                              #'|GALFACT;btwFact;UPBSNniR;29!2|
                                              (VECTOR $ |maxd|))
                                             |fd| (QREFELT $ 99))
                                            . #17#))))
                                   ('T
                                    (SEQ
                                     (LETT |factorlist|
                                           (APPEND
                                            (PROGN
                                             (LETT #3# NIL . #17#)
                                             (SEQ (LETT |pf| NIL . #17#)
                                                  (LETT #2#
                                                        (|GALFACT;btwFactor|
                                                         |sqff|
                                                         (SPADCALL
                                                          (CONS
                                                           #'|GALFACT;btwFact;UPBSNniR;29!3|
                                                           (VECTOR $ |d|))
                                                          |fd| (QREFELT $ 99))
                                                         |r| 'T $)
                                                        . #17#)
                                                  G190
                                                  (COND
                                                   ((OR (ATOM #2#)
                                                        (PROGN
                                                         (LETT |pf| (CAR #2#)
                                                               . #17#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #3#
                                                          (CONS
                                                           (CONS |pf| |mult|)
                                                           #3#)
                                                          . #17#)))
                                                  (LETT #2# (CDR #2#) . #17#)
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #3#))))
                                            |factorlist|)
                                           . #17#)
                                     (LETT |maxd|
                                           (PROG1
                                               (LETT #1#
                                                     (-
                                                      (SPADCALL |fd|
                                                                (QREFELT $
                                                                         105))
                                                      (SPADCALL |d| |mult|
                                                                (QREFELT $
                                                                         153)))
                                                     . #17#)
                                             (|check_subtype| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              #1#))
                                           . #17#)
                                     (EXIT
                                      (LETT |fd|
                                            (SPADCALL
                                             (CONS
                                              #'|GALFACT;btwFact;UPBSNniR;29!4|
                                              (VECTOR $ |maxd|))
                                             |fd| (QREFELT $ 99))
                                            . #17#)))))))
                            (LETT #8# (CDR #8#) . #17#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (CONS |c| |factorlist|)))))))))))))))))) 

(DEFUN |GALFACT;btwFact;UPBSNniR;29!4| (|x| $$)
  (PROG (|maxd| $)
    (LETT |maxd| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;29|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 97)))))) 

(DEFUN |GALFACT;btwFact;UPBSNniR;29!3| (|x| $$)
  (PROG (|d| $)
    (LETT |d| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;29|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 97)))))) 

(DEFUN |GALFACT;btwFact;UPBSNniR;29!2| (|x| $$)
  (PROG (|maxd| $)
    (LETT |maxd| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;29|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 97)))))) 

(DEFUN |GALFACT;btwFact;UPBSNniR;29!1| (|x| $$)
  (PROG (|maxd| $)
    (LETT |maxd| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;29|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 97)))))) 

(DEFUN |GALFACT;btwFact;UPBSNniR;29!0| (|x| $$)
  (PROG (|d| $)
    (LETT |d| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;29|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 97)))))) 

(DEFUN |GALFACT;factor;UPF;30| (|f| $)
  (SPADCALL
   (COND
    ((QREFELT $ 9)
     (SPADCALL |f| 'NIL (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 38)) $) 2
               (QREFELT $ 154)))
    ('T (SPADCALL |f| 'NIL (QREFELT $ 152))))
   (QREFELT $ 126))) 

(DEFUN |GALFACT;errorsum?| (|d| |ld| $)
  (PROG (#1=#:G525 #2=#:G524 #3=#:G526 #4=#:G529 #5=#:G127)
    (RETURN
     (SEQ
      (COND
       ((EQL |d|
             (PROGN
              (LETT #1# NIL . #6=(|GALFACT;errorsum?|))
              (SEQ (LETT #5# NIL . #6#) (LETT #4# |ld| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3# #5# . #6#)
                      (COND (#1# (LETT #2# (+ #2# #3#) . #6#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #6#)
                              (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#7='T 0))))
        'NIL)
       (#7# 'T)))))) 

(DEFUN |GALFACT;makeSet| (|ld| $)
  (PROG (|s| #1=#:G533 |d|)
    (RETURN
     (SEQ
      (LETT |s| (SPADCALL (LIST 0) (QREFELT $ 45)) . #2=(|GALFACT;makeSet|))
      (SEQ (LETT |d| NIL . #2#) (LETT #1# |ld| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |d| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (LETT |s|
                   (SPADCALL |s| (|GALFACT;shiftSet| |s| |d| $) (QREFELT $ 56))
                   . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |s|))))) 

(DEFUN |GALFACT;factor;UPLNniF;33| (|f| |ld| |r| $)
  (COND
   ((|GALFACT;errorsum?| (SPADCALL |f| (QREFELT $ 38)) |ld| $)
    (|error| "factor: Bad arguments"))
   ('T
    (SPADCALL
     (SPADCALL |f| 'NIL (|GALFACT;makeSet| |ld| $) |r| (QREFELT $ 154))
     (QREFELT $ 126))))) 

(DEFUN |GALFACT;factor;UPNniF;34| (|f| |r| $)
  (SPADCALL
   (SPADCALL |f| 'NIL (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 38)) $) |r|
             (QREFELT $ 154))
   (QREFELT $ 126))) 

(DEFUN |GALFACT;factor;UPLF;35| (|f| |ld| $)
  (SPADCALL |f| |ld| 2 (QREFELT $ 156))) 

(DEFUN |GALFACT;factor;UP2NniF;36| (|f| |d| |r| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (SPADCALL |f| (QREFELT $ 38)) |d| (QREFELT $ 104))
            |GALFACT;factor;UP2NniF;36|)
      (EXIT
       (COND ((QEQCAR |n| 1) (|error| "factor: Bad arguments"))
             ('T
              (SPADCALL |f| (SPADCALL (QCDR |n|) |d| (QREFELT $ 159)) |r|
                        (QREFELT $ 156))))))))) 

(DEFUN |GALFACT;factorSquareFree;UPF;37| (|f| $)
  (SPADCALL
   (COND
    ((QREFELT $ 9)
     (SPADCALL |f| 'T (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 38)) $) 2
               (QREFELT $ 154)))
    ('T (SPADCALL |f| 'T (QREFELT $ 152))))
   (QREFELT $ 126))) 

(DEFUN |GALFACT;factorSquareFree;UPLNniF;38| (|f| |ld| |r| $)
  (COND
   ((|GALFACT;errorsum?| (SPADCALL |f| (QREFELT $ 38)) |ld| $)
    (|error| "factorSquareFree: Bad arguments"))
   ('T
    (SPADCALL (SPADCALL |f| 'T (|GALFACT;makeSet| |ld| $) |r| (QREFELT $ 154))
              (QREFELT $ 126))))) 

(DEFUN |GALFACT;factorSquareFree;UPNniF;39| (|f| |r| $)
  (SPADCALL
   (SPADCALL |f| 'T (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 38)) $) |r|
             (QREFELT $ 154))
   (QREFELT $ 126))) 

(DEFUN |GALFACT;factorSquareFree;UPLF;40| (|f| |ld| $)
  (SPADCALL |f| |ld| 2 (QREFELT $ 162))) 

(DEFUN |GALFACT;factorSquareFree;UP2NniF;41| (|f| |d| |r| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (SPADCALL |f| (QREFELT $ 38)) |d| (QREFELT $ 104))
            |GALFACT;factorSquareFree;UP2NniF;41|)
      (EXIT
       (COND ((QEQCAR |n| 1) (|error| "factorSquareFree: Bad arguments"))
             ('T
              (SPADCALL |f| (SPADCALL (QCDR |n|) |d| (QREFELT $ 159)) |r|
                        (QREFELT $ 162))))))))) 

(DEFUN |GALFACT;factorOfDegree;PiUPLNniBU;42| (|d| |p| |ld| |r| |sqf| $)
  (PROG (#1=#:G565 #2=#:G571 #3=#:G572 |f| |lf| |dp|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |dp| (SPADCALL |p| (QREFELT $ 38))
              . #4=(|GALFACT;factorOfDegree;PiUPLNniBU;42|))
        (EXIT
         (COND
          ((|GALFACT;errorsum?| |dp| |ld| $)
           (|error| "factorOfDegree: Bad arguments"))
          ('T
           (SEQ
            (COND
             ((EQL |d| 1)
              (COND
               ((SPADCALL |p| (QREFELT $ 109)) (EXIT (CONS 1 "failed"))))))
            (LETT |lf|
                  (QCDR
                   (SPADCALL |p| |sqf| (|GALFACT;makeSet| |ld| $) |r|
                             (QREFELT $ 154)))
                  . #4#)
            (SEQ
             (EXIT
              (SEQ (LETT |f| NIL . #4#) (LETT #3# |lf| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (SPADCALL (QCAR |f|) (QREFELT $ 38)) |d|)
                       (PROGN
                        (LETT #1#
                              (PROGN
                               (LETT #2# (CONS 0 (QCAR |f|)) . #4#)
                               (GO #2#))
                              . #4#)
                        (GO #1#))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
             #1# (EXIT #1#))
            (EXIT (CONS 1 "failed"))))))))
      #2# (EXIT #2#))))) 

(DEFUN |GALFACT;factorOfDegree;PiUPLNniU;43| (|d| |p| |ld| |r| $)
  (SPADCALL |d| |p| |ld| |r| 'NIL (QREFELT $ 167))) 

(DEFUN |GALFACT;factorOfDegree;PiUPNniU;44| (|d| |p| |r| $)
  (SPADCALL |d| |p| (SPADCALL (SPADCALL |p| (QREFELT $ 38)) 1 (QREFELT $ 159))
            |r| 'NIL (QREFELT $ 167))) 

(DEFUN |GALFACT;factorOfDegree;PiUPLU;45| (|d| |p| |ld| $)
  (SPADCALL |d| |p| |ld| 2 'NIL (QREFELT $ 167))) 

(DEFUN |GALFACT;factorOfDegree;PiUPU;46| (|d| |p| $)
  (SPADCALL |d| |p| (SPADCALL (SPADCALL |p| (QREFELT $ 38)) 1 (QREFELT $ 159))
            2 'NIL (QREFELT $ 167))) 

(DECLAIM (NOTINLINE |GaloisGroupFactorizer;|)) 

(DEFUN |GaloisGroupFactorizer| (#1=#:G589)
  (PROG ()
    (RETURN
     (PROG (#2=#:G590)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|GaloisGroupFactorizer|)
                                           '|domainEqualList|)
                . #3=(|GaloisGroupFactorizer|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|GaloisGroupFactorizer;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|GaloisGroupFactorizer|))))))))))) 

(DEFUN |GaloisGroupFactorizer;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GaloisGroupFactorizer|))
      (LETT |dv$| (LIST '|GaloisGroupFactorizer| DV$1) . #1#)
      (LETT $ (GETREFV 172) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|GaloisGroupFactorizer| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 5)
      (QSETREFV $ 8 8)
      (QSETREFV $ 9 'T)
      (QSETREFV $ 10 'T)
      (QSETREFV $ 11 'T)
      $)))) 

(MAKEPROP '|GaloisGroupFactorizer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|mussertrials|
              '|stopmussertrials| '|usesinglefactorbound|
              '|tryfunctionaldecomposition| '|useeisensteincriterion|
              (|Boolean|) |GALFACT;useEisensteinCriterion?;B;1|
              |GALFACT;useEisensteinCriterion;2B;2|
              |GALFACT;tryFunctionalDecomposition?;B;3|
              |GALFACT;tryFunctionalDecomposition;2B;4|
              |GALFACT;useSingleFactorBound?;B;5|
              |GALFACT;useSingleFactorBound;2B;6| (|PositiveInteger|)
              |GALFACT;stopMusserTrials;Pi;7| |GALFACT;stopMusserTrials;2Pi;8|
              |GALFACT;musserTrials;Pi;9| |GALFACT;musserTrials;2Pi;10|
              (0 . |reductum|) (|Integer|) (5 . |content|) (10 . |unit?|)
              (15 . |leadingCoefficient|) (20 . |zero?|) (|Factored| $)
              (25 . |factor|) (|Record| (|:| |factor| 25) (|:| |exponent| 25))
              (|List| 32) (|Factored| 25) (30 . |factors|)
              |GALFACT;eisensteinIrreducible?;UPB;11| (|NonNegativeInteger|)
              (35 . |degree|) (|Record| (|:| |factor| 6) (|:| |degree| 25))
              (|List| 39) |GALFACT;numberOfFactors;LNni;12| (|List| 37)
              (|Set| 37) (40 . |parts|) (45 . |set|) (50 . |One|) (54 . |Zero|)
              (58 . |empty|) (62 . |differentiate|) (67 . >)
              (|ModularDistinctDegreeFactorizer| 6) (73 . |gcd|)
              (|IntegerPrimesPackage| 25) (80 . |nextPrime|) (85 . |ddFact|)
              (91 . |union|) (97 . |intersect|) (103 . =) (109 . >) (|List| 6)
              (115 . |separateFactors|)
              (|Record| (|:| |prime| 25) (|:| |factors| 60))
              |GALFACT;modularFactor;UPR;18| (|Multiset| 37) (121 . |empty|)
              (125 . |insert!|) (131 . |insert!|)
              |GALFACT;degreePartition;LM;19| (|BrillhartTests| 6)
              (138 . |brillhartIrreducible?|)
              (|Record| (|:| |left| 6) (|:| |right| 6)) (|Union| 71 '"failed")
              (|UnivariatePolynomialDecompositionPackage| 25 6)
              (143 . |monicDecomposeIfCan|) (148 . *)
              (|GaloisGroupFactorizationUtilities| 25 6 (|Float|))
              (154 . |beauzamyBound|) (|GeneralHenselPackage| 25 6)
              (159 . |completeHensel|) (167 . |elt|) (173 . |coefficient|)
              (179 . |bit?|) (185 . |elt|) (191 . |symmetricRemainder|)
              (197 . |member?|) (|Union| $ '"failed") (203 . |exquo|)
              (209 . |coerce|) (214 . *) (220 . |reduction|)
              (226 . |primitivePart|) (231 . |exquo|) (|Void|) (237 . |swap!|)
              (244 . |rest|) (250 . |setrest!|) (256 . <=) (|Mapping| 12 37)
              (262 . |select|) (268 . |singleFactorBound|) (274 . >)
              (|Record| (|:| |plist| 60) (|:| |modulo| 25))
              (280 . |HenselLift|) (288 . |exquo|) (294 . |max|)
              (|GaloisGroupPolynomialUtilities| 25 6) (299 . |reverse|)
              (304 . -) (309 . |noLinearFactor?|) (314 . |One|)
              (318 . |remove|) (324 . |ground?|) (329 . |subtractIfCan|)
              (335 . |setelt|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 115) (|:| |fctr| 25) (|:| |xpnt| 25))
              (|List| 116) (342 . |factorList|) (347 . |unit|)
              (|Record| (|:| |flg| 115) (|:| |fctr| 6) (|:| |xpnt| 25))
              (|List| 120) (|Factored| 6) (352 . |makeFR|)
              (|Record| (|:| |irr| 6) (|:| |pow| 25))
              (|Record| (|:| |contp| 25) (|:| |factors| (|List| 124)))
              |GALFACT;makeFR;RF;24| (358 . ^) (|Union| 25 '"failed")
              (|IntegerRoots| 25) (364 . |perfectSqrt|) (369 . |monomial|)
              (375 . +) (|SparseUnivariatePolynomial| 25) (381 . |monomial|)
              (387 . |elt|) (393 . |unmakeSUP|) (398 . |exquo|)
              (404 . |minimumDegree|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (409 . |monicDivide|) (415 . =) (|List| 133)
              (|CyclotomicPolynomialPackage|) (421 . |cyclotomicDecomposition|)
              (|Mapping| 6 133) (|ListFunctions2| 133 6) (426 . |map|)
              (432 . |squareFree|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 25)) (|List| 149)
              (437 . |factors|) |GALFACT;henselFact;UPBR;28| (442 . *)
              |GALFACT;btwFact;UPBSNniR;29| |GALFACT;factor;UPF;30|
              |GALFACT;factor;UPLNniF;33| |GALFACT;factor;UPNniF;34|
              |GALFACT;factor;UPLF;35| (448 . |new|)
              |GALFACT;factor;UP2NniF;36| |GALFACT;factorSquareFree;UPF;37|
              |GALFACT;factorSquareFree;UPLNniF;38|
              |GALFACT;factorSquareFree;UPNniF;39|
              |GALFACT;factorSquareFree;UPLF;40|
              |GALFACT;factorSquareFree;UP2NniF;41| (|Union| 6 '"failed")
              |GALFACT;factorOfDegree;PiUPLNniBU;42|
              |GALFACT;factorOfDegree;PiUPLNniU;43|
              |GALFACT;factorOfDegree;PiUPNniU;44|
              |GALFACT;factorOfDegree;PiUPLU;45|
              |GALFACT;factorOfDegree;PiUPU;46|)
           '#(|useSingleFactorBound?| 454 |useSingleFactorBound| 458
              |useEisensteinCriterion?| 463 |useEisensteinCriterion| 467
              |tryFunctionalDecomposition?| 472 |tryFunctionalDecomposition|
              476 |stopMusserTrials| 481 |numberOfFactors| 490 |musserTrials|
              495 |modularFactor| 504 |makeFR| 509 |henselFact| 514
              |factorSquareFree| 520 |factorOfDegree| 551 |factor| 588
              |eisensteinIrreducible?| 619 |degreePartition| 624 |btwFact| 629)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 171
                                                 '(1 6 0 0 24 1 6 25 0 26 1 25
                                                   12 0 27 1 6 25 0 28 1 6 12 0
                                                   29 1 25 30 0 31 1 34 33 0 35
                                                   1 6 37 0 38 1 43 42 0 44 1
                                                   43 0 42 45 0 6 0 46 0 6 0 47
                                                   0 43 0 48 1 6 0 0 49 2 37 12
                                                   0 0 50 3 51 6 6 6 25 52 1 53
                                                   25 25 54 2 51 40 6 25 55 2
                                                   43 0 0 0 56 2 43 0 0 0 57 2
                                                   43 12 0 0 58 2 25 12 0 0 59
                                                   2 51 60 40 25 61 0 64 0 65 2
                                                   64 0 37 0 66 3 64 0 37 0 37
                                                   67 1 69 12 6 70 1 73 72 6 74
                                                   2 25 0 19 0 75 1 76 25 6 77
                                                   4 78 60 6 60 25 19 79 2 6 0
                                                   0 0 80 2 6 25 0 37 81 2 25
                                                   12 0 0 82 2 60 6 0 25 83 2
                                                   25 0 0 0 84 2 43 12 37 0 85
                                                   2 25 86 0 0 87 1 6 0 25 88 2
                                                   6 0 0 0 89 2 78 6 6 25 90 1
                                                   6 0 0 91 2 6 86 0 0 92 3 60
                                                   93 0 25 25 94 2 60 0 0 37 95
                                                   2 60 0 0 0 96 2 37 12 0 0 97
                                                   2 43 0 98 0 99 2 76 25 6 37
                                                   100 2 19 12 0 0 101 4 78 102
                                                   6 60 25 19 103 2 37 86 0 0
                                                   104 1 43 37 0 105 1 106 6 6
                                                   107 1 6 0 0 108 1 69 12 6
                                                   109 0 19 0 110 2 43 0 37 0
                                                   111 1 6 12 0 112 2 37 86 0 0
                                                   113 3 60 6 0 25 6 114 1 34
                                                   117 0 118 1 34 25 0 119 2
                                                   122 0 6 121 123 2 25 0 0 19
                                                   127 1 129 128 25 130 2 6 0
                                                   25 37 131 2 6 0 0 0 132 2
                                                   133 0 25 37 134 2 133 0 0 0
                                                   135 1 6 0 133 136 2 6 86 0
                                                   25 137 1 6 37 0 138 2 6 139
                                                   0 0 140 2 6 12 0 0 141 1 143
                                                   142 25 144 2 146 60 145 142
                                                   147 1 6 30 0 148 1 122 150 0
                                                   151 2 25 0 37 0 153 2 42 0
                                                   37 37 159 0 0 12 17 1 0 12
                                                   12 18 0 0 12 13 1 0 12 12 14
                                                   0 0 12 15 1 0 12 12 16 1 0
                                                   19 19 21 0 0 19 20 1 0 37 40
                                                   41 1 0 19 19 23 0 0 19 22 1
                                                   0 62 6 63 1 0 122 125 126 2
                                                   0 125 6 12 152 2 0 122 6 37
                                                   163 1 0 122 6 161 3 0 122 6
                                                   42 37 162 2 0 122 6 42 164 3
                                                   0 122 6 37 37 165 2 0 166 19
                                                   6 171 3 0 166 19 6 42 170 3
                                                   0 166 19 6 37 169 5 0 166 19
                                                   6 42 37 12 167 4 0 166 19 6
                                                   42 37 168 1 0 122 6 155 2 0
                                                   122 6 42 158 2 0 122 6 37
                                                   157 3 0 122 6 37 37 160 3 0
                                                   122 6 42 37 156 1 0 12 6 36
                                                   1 0 64 40 68 4 0 125 6 12 43
                                                   37 154)))))
           '|lookupComplete|)) 
