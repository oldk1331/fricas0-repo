
(DEFUN |FLOATCP;complexRoots;FParL;1| (|q| |eps| $)
  (PROG (|p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |q| (QREFELT $ 9)) |FLOATCP;complexRoots;FParL;1|)
      (EXIT (SPADCALL (SPADCALL |p| (QREFELT $ 11)) |eps| (QREFELT $ 14))))))) 

(DEFUN |FLOATCP;complexRoots;LLParL;2| (|lp| |lv| |eps| $)
  (PROG (|lden| |dp| #1=#:G114 |p| #2=#:G113 |lnum| #3=#:G112 #4=#:G111)
    (RETURN
     (SEQ
      (LETT |lnum|
            (PROGN
             (LETT #4# NIL . #5=(|FLOATCP;complexRoots;LLParL;2|))
             (SEQ (LETT |p| NIL . #5#) (LETT #3# |lp| . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4# (CONS (SPADCALL |p| (QREFELT $ 9)) #4#) . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |lden|
            (PROGN
             (LETT #2# NIL . #5#)
             (SEQ (LETT |p| NIL . #5#) (LETT #1# |lp| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL (LETT |dp| (SPADCALL |p| (QREFELT $ 16)) . #5#)
                                (|spadConstant| $ 17) (QREFELT $ 19))
                      (LETT #2# (CONS |dp| #2#) . #5#)))))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #5#)
      (EXIT (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT $ 24))))))) 

(DEFUN |FLOATCP;complexSolve;LParL;3| (|lp| |eps| $)
  (PROG (#1=#:G137 |x| #2=#:G138 |r| #3=#:G136 #4=#:G135 |nres| #5=#:G134 |lv|
         #6=#:G121 #7=#:G120 #8=#:G122 #9=#:G133 |dp| #10=#:G118 #11=#:G117
         #12=#:G119 #13=#:G132 |np| |lden| #14=#:G131 |p| #15=#:G130 |lnum|
         #16=#:G129 #17=#:G128)
    (RETURN
     (SEQ
      (LETT |lnum|
            (PROGN
             (LETT #17# NIL . #18=(|FLOATCP;complexSolve;LParL;3|))
             (SEQ (LETT |p| NIL . #18#) (LETT #16# |lp| . #18#) G190
                  (COND
                   ((OR (ATOM #16#) (PROGN (LETT |p| (CAR #16#) . #18#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #17# (CONS (SPADCALL |p| (QREFELT $ 9)) #17#)
                          . #18#)))
                  (LETT #16# (CDR #16#) . #18#) (GO G190) G191
                  (EXIT (NREVERSE #17#))))
            . #18#)
      (LETT |lden|
            (PROGN
             (LETT #15# NIL . #18#)
             (SEQ (LETT |p| NIL . #18#) (LETT #14# |lp| . #18#) G190
                  (COND
                   ((OR (ATOM #14#) (PROGN (LETT |p| (CAR #14#) . #18#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL
                       (LETT |dp| (SPADCALL |p| (QREFELT $ 16)) . #18#)
                       (|spadConstant| $ 17) (QREFELT $ 19))
                      (LETT #15# (CONS |dp| #15#) . #18#)))))
                  (LETT #14# (CDR #14#) . #18#) (GO G190) G191
                  (EXIT (NREVERSE #15#))))
            . #18#)
      (LETT |lv|
            (PROGN
             (LETT #10# NIL . #18#)
             (SEQ (LETT |np| NIL . #18#) (LETT #13# |lnum| . #18#) G190
                  (COND
                   ((OR (ATOM #13#) (PROGN (LETT |np| (CAR #13#) . #18#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #12# (SPADCALL |np| (QREFELT $ 27)) . #18#)
                     (COND
                      (#10#
                       (LETT #11# (SPADCALL #11# #12# (QREFELT $ 28)) . #18#))
                      ('T
                       (PROGN
                        (LETT #11# #12# . #18#)
                        (LETT #10# 'T . #18#)))))))
                  (LETT #13# (CDR #13#) . #18#) (GO G190) G191 (EXIT NIL))
             (COND (#10# #11#) (#19='T (|IdentityError| '|setUnion|))))
            . #18#)
      (COND
       ((SPADCALL |lden| NIL (QREFELT $ 29))
        (LETT |lv|
              (SPADCALL |lv|
                        (PROGN
                         (LETT #6# NIL . #18#)
                         (SEQ (LETT |dp| NIL . #18#) (LETT #9# |lden| . #18#)
                              G190
                              (COND
                               ((OR (ATOM #9#)
                                    (PROGN (LETT |dp| (CAR #9#) . #18#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #8# (SPADCALL |dp| (QREFELT $ 27))
                                       . #18#)
                                 (COND
                                  (#6#
                                   (LETT #7# (SPADCALL #7# #8# (QREFELT $ 28))
                                         . #18#))
                                  ('T
                                   (PROGN
                                    (LETT #7# #8# . #18#)
                                    (LETT #6# 'T . #18#)))))))
                              (LETT #9# (CDR #9#) . #18#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#6# #7#) (#19# (|IdentityError| '|setUnion|))))
                        (QREFELT $ 28))
              . #18#)))
      (EXIT
       (PROGN
        (LETT #5# NIL . #18#)
        (SEQ (LETT |nres| NIL . #18#)
             (LETT #4# (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT $ 24))
                   . #18#)
             G190
             (COND
              ((OR (ATOM #4#) (PROGN (LETT |nres| (CAR #4#) . #18#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #5#
                     (CONS
                      (PROGN
                       (LETT #3# NIL . #18#)
                       (SEQ (LETT |r| NIL . #18#) (LETT #2# |nres| . #18#)
                            (LETT |x| NIL . #18#) (LETT #1# |lv| . #18#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |x| (CAR #1#) . #18#) NIL)
                                  (ATOM #2#)
                                  (PROGN (LETT |r| (CAR #2#) . #18#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3#
                                    (CONS
                                     (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                               (SPADCALL |r| (QREFELT $ 34))
                                               (QREFELT $ 36))
                                     #3#)
                                    . #18#)))
                            (LETT #1#
                                  (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #18#))
                                  . #18#)
                            (GO G190) G191 (EXIT (NREVERSE #3#))))
                      #5#)
                     . #18#)))
             (LETT #4# (CDR #4#) . #18#) (GO G190) G191
             (EXIT (NREVERSE #5#))))))))) 

(DEFUN |FLOATCP;complexSolve;LParL;4| (|le| |eps| $)
  (PROG (#1=#:G164 |x| #2=#:G165 |r| #3=#:G163 #4=#:G162 |nres| #5=#:G161 |lv|
         #6=#:G146 #7=#:G145 #8=#:G147 #9=#:G160 |dp| #10=#:G143 #11=#:G142
         #12=#:G144 #13=#:G159 |np| |lden| #14=#:G158 |p| #15=#:G157 |lnum|
         #16=#:G156 #17=#:G155 |lp| #18=#:G154 |ep| #19=#:G153)
    (RETURN
     (SEQ
      (LETT |lp|
            (PROGN
             (LETT #19# NIL . #20=(|FLOATCP;complexSolve;LParL;4|))
             (SEQ (LETT |ep| NIL . #20#) (LETT #18# |le| . #20#) G190
                  (COND
                   ((OR (ATOM #18#) (PROGN (LETT |ep| (CAR #18#) . #20#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #19#
                          (CONS
                           (SPADCALL (SPADCALL |ep| (QREFELT $ 40))
                                     (SPADCALL |ep| (QREFELT $ 41))
                                     (QREFELT $ 42))
                           #19#)
                          . #20#)))
                  (LETT #18# (CDR #18#) . #20#) (GO G190) G191
                  (EXIT (NREVERSE #19#))))
            . #20#)
      (LETT |lnum|
            (PROGN
             (LETT #17# NIL . #20#)
             (SEQ (LETT |p| NIL . #20#) (LETT #16# |lp| . #20#) G190
                  (COND
                   ((OR (ATOM #16#) (PROGN (LETT |p| (CAR #16#) . #20#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #17# (CONS (SPADCALL |p| (QREFELT $ 9)) #17#)
                          . #20#)))
                  (LETT #16# (CDR #16#) . #20#) (GO G190) G191
                  (EXIT (NREVERSE #17#))))
            . #20#)
      (LETT |lden|
            (PROGN
             (LETT #15# NIL . #20#)
             (SEQ (LETT |p| NIL . #20#) (LETT #14# |lp| . #20#) G190
                  (COND
                   ((OR (ATOM #14#) (PROGN (LETT |p| (CAR #14#) . #20#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL
                       (LETT |dp| (SPADCALL |p| (QREFELT $ 16)) . #20#)
                       (|spadConstant| $ 17) (QREFELT $ 19))
                      (LETT #15# (CONS |dp| #15#) . #20#)))))
                  (LETT #14# (CDR #14#) . #20#) (GO G190) G191
                  (EXIT (NREVERSE #15#))))
            . #20#)
      (LETT |lv|
            (PROGN
             (LETT #10# NIL . #20#)
             (SEQ (LETT |np| NIL . #20#) (LETT #13# |lnum| . #20#) G190
                  (COND
                   ((OR (ATOM #13#) (PROGN (LETT |np| (CAR #13#) . #20#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #12# (SPADCALL |np| (QREFELT $ 27)) . #20#)
                     (COND
                      (#10#
                       (LETT #11# (SPADCALL #11# #12# (QREFELT $ 28)) . #20#))
                      ('T
                       (PROGN
                        (LETT #11# #12# . #20#)
                        (LETT #10# 'T . #20#)))))))
                  (LETT #13# (CDR #13#) . #20#) (GO G190) G191 (EXIT NIL))
             (COND (#10# #11#) (#21='T (|IdentityError| '|setUnion|))))
            . #20#)
      (COND
       ((SPADCALL |lden| NIL (QREFELT $ 29))
        (LETT |lv|
              (SPADCALL |lv|
                        (PROGN
                         (LETT #6# NIL . #20#)
                         (SEQ (LETT |dp| NIL . #20#) (LETT #9# |lden| . #20#)
                              G190
                              (COND
                               ((OR (ATOM #9#)
                                    (PROGN (LETT |dp| (CAR #9#) . #20#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #8# (SPADCALL |dp| (QREFELT $ 27))
                                       . #20#)
                                 (COND
                                  (#6#
                                   (LETT #7# (SPADCALL #7# #8# (QREFELT $ 28))
                                         . #20#))
                                  ('T
                                   (PROGN
                                    (LETT #7# #8# . #20#)
                                    (LETT #6# 'T . #20#)))))))
                              (LETT #9# (CDR #9#) . #20#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#6# #7#) (#21# (|IdentityError| '|setUnion|))))
                        (QREFELT $ 28))
              . #20#)))
      (EXIT
       (PROGN
        (LETT #5# NIL . #20#)
        (SEQ (LETT |nres| NIL . #20#)
             (LETT #4# (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT $ 24))
                   . #20#)
             G190
             (COND
              ((OR (ATOM #4#) (PROGN (LETT |nres| (CAR #4#) . #20#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #5#
                     (CONS
                      (PROGN
                       (LETT #3# NIL . #20#)
                       (SEQ (LETT |r| NIL . #20#) (LETT #2# |nres| . #20#)
                            (LETT |x| NIL . #20#) (LETT #1# |lv| . #20#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |x| (CAR #1#) . #20#) NIL)
                                  (ATOM #2#)
                                  (PROGN (LETT |r| (CAR #2#) . #20#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3#
                                    (CONS
                                     (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                               (SPADCALL |r| (QREFELT $ 34))
                                               (QREFELT $ 36))
                                     #3#)
                                    . #20#)))
                            (LETT #1#
                                  (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #20#))
                                  . #20#)
                            (GO G190) G191 (EXIT (NREVERSE #3#))))
                      #5#)
                     . #20#)))
             (LETT #4# (CDR #4#) . #20#) (GO G190) G191
             (EXIT (NREVERSE #5#))))))))) 

(DEFUN |FLOATCP;complexSolve;FParL;5| (|p| |eps| $)
  (PROG (#1=#:G174 |val| #2=#:G173 |x| |mvar|)
    (RETURN
     (SEQ
      (LETT |mvar| (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 46))
            . #3=(|FLOATCP;complexSolve;FParL;5|))
      (EXIT
       (COND ((QEQCAR |mvar| 1) (|error| "no variable found"))
             ('T
              (SEQ (LETT |x| (SPADCALL (QCDR |mvar|) (QREFELT $ 32)) . #3#)
                   (EXIT
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |val| NIL . #3#)
                          (LETT #1# (SPADCALL |p| |eps| (QREFELT $ 15)) . #3#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |val| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL |x|
                                             (SPADCALL |val| (QREFELT $ 34))
                                             (QREFELT $ 36))
                                   #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))))))))))) 

(DEFUN |FLOATCP;complexSolve;EParL;6| (|eq| |eps| $)
  (SPADCALL
   (SPADCALL (SPADCALL |eq| (QREFELT $ 40)) (SPADCALL |eq| (QREFELT $ 41))
             (QREFELT $ 42))
   |eps| (QREFELT $ 48))) 

(DECLAIM (NOTINLINE |FloatingComplexPackage;|)) 

(DEFUN |FloatingComplexPackage| (#1=#:G176)
  (PROG ()
    (RETURN
     (PROG (#2=#:G177)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|FloatingComplexPackage|)
                                           '|domainEqualList|)
                . #3=(|FloatingComplexPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|FloatingComplexPackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|FloatingComplexPackage|))))))))))) 

(DEFUN |FloatingComplexPackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FloatingComplexPackage|))
      (LETT |dv$| (LIST '|FloatingComplexPackage| DV$1) . #1#)
      (LETT $ (GETREFV 50) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FloatingComplexPackage| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FloatingComplexPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Polynomial| (|Complex| (|Integer|))) (|Fraction| 7)
              (0 . |numer|)
              (|SparseUnivariatePolynomial| (|Complex| (|Integer|)))
              (5 . |univariate|) (|List| 33) (|ComplexRootPackage| 10 6)
              (10 . |complexZeros|) |FLOATCP;complexRoots;FParL;1|
              (16 . |denom|) (21 . |One|) (|Boolean|) (25 . ~=) (|List| 12)
              (|List| 7) (|List| 30)
              (|InnerNumericFloatSolvePackage| (|Complex| (|Integer|)) 33 6)
              (31 . |innerSolve|) (|List| 8) |FLOATCP;complexRoots;LLParL;2|
              (39 . |variables|) (44 . |setUnion|) (50 . ~=) (|Symbol|)
              (|Polynomial| 33) (56 . |coerce|) (|Complex| 6) (61 . |coerce|)
              (|Equation| 31) (66 . |equation|) (|List| 47)
              |FLOATCP;complexSolve;LParL;3| (|Equation| 8) (72 . |lhs|)
              (77 . |rhs|) (82 . -) (|List| 39) |FLOATCP;complexSolve;LParL;4|
              (|Union| 30 '"failed") (88 . |mainVariable|) (|List| 35)
              |FLOATCP;complexSolve;FParL;5| |FLOATCP;complexSolve;EParL;6|)
           '#(|complexSolve| 93 |complexRoots| 117) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 49
                                                 '(1 8 7 0 9 1 7 10 0 11 2 13
                                                   12 10 6 14 1 8 7 0 16 0 7 0
                                                   17 2 7 18 0 0 19 4 23 20 21
                                                   21 22 6 24 1 7 22 0 27 2 22
                                                   0 0 0 28 2 21 18 0 0 29 1 31
                                                   0 30 32 1 31 0 33 34 2 35 0
                                                   31 31 36 1 39 8 0 40 1 39 8
                                                   0 41 2 8 0 0 0 42 1 7 45 0
                                                   46 2 0 37 25 6 38 2 0 47 8 6
                                                   48 2 0 37 43 6 44 2 0 47 39
                                                   6 49 3 0 20 25 22 6 26 2 0
                                                   12 8 6 15)))))
           '|lookupComplete|)) 
