
(DEFUN |FLOATRP;makeEq| (|nres| |lv| $)
  (PROG (#1=#:G108 |x| #2=#:G109 |r| #3=#:G107)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3# NIL . #4=(|FLOATRP;makeEq|))
       (SEQ (LETT |r| NIL . #4#) (LETT #2# |nres| . #4#) (LETT |x| NIL . #4#)
            (LETT #1# |lv| . #4#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #4#) NIL) (ATOM #2#)
                  (PROGN (LETT |r| (CAR #2#) . #4#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #3#
                    (CONS
                     (SPADCALL (SPADCALL |x| (QREFELT $ 9))
                               (SPADCALL |r| (QREFELT $ 10)) (QREFELT $ 12))
                     #3#)
                    . #4#)))
            (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
            (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(DEFUN |FLOATRP;realRoots;FParL;2| (|p| |eps| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 15)) |eps| (QREFELT $ 18))) 

(DEFUN |FLOATRP;realRoots;LLParL;3| (|lp| |lv| |eps| $)
  (PROG (|lden| |dp| #1=#:G118 |p| #2=#:G117 |lnum| #3=#:G116 #4=#:G115)
    (RETURN
     (SEQ
      (LETT |lnum|
            (PROGN
             (LETT #4# NIL . #5=(|FLOATRP;realRoots;LLParL;3|))
             (SEQ (LETT |p| NIL . #5#) (LETT #3# |lp| . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4# (CONS (SPADCALL |p| (QREFELT $ 15)) #4#) . #5#)))
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
                     ((SPADCALL (LETT |dp| (SPADCALL |p| (QREFELT $ 20)) . #5#)
                                (|spadConstant| $ 21) (QREFELT $ 23))
                      (LETT #2# (CONS |dp| #2#) . #5#)))))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #5#)
      (EXIT (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT $ 27))))))) 

(DEFUN |FLOATRP;solve;LParL;4| (|lp| |eps| $)
  (PROG (#1=#:G138 |numres| #2=#:G137 |lv| #3=#:G125 #4=#:G124 #5=#:G126
         #6=#:G136 |dp| #7=#:G122 #8=#:G121 #9=#:G123 #10=#:G135 |np| |lden|
         #11=#:G134 |p| #12=#:G133 |lnum| #13=#:G132 #14=#:G131)
    (RETURN
     (SEQ
      (LETT |lnum|
            (PROGN
             (LETT #14# NIL . #15=(|FLOATRP;solve;LParL;4|))
             (SEQ (LETT |p| NIL . #15#) (LETT #13# |lp| . #15#) G190
                  (COND
                   ((OR (ATOM #13#) (PROGN (LETT |p| (CAR #13#) . #15#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #14# (CONS (SPADCALL |p| (QREFELT $ 15)) #14#)
                          . #15#)))
                  (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                  (EXIT (NREVERSE #14#))))
            . #15#)
      (LETT |lden|
            (PROGN
             (LETT #12# NIL . #15#)
             (SEQ (LETT |p| NIL . #15#) (LETT #11# |lp| . #15#) G190
                  (COND
                   ((OR (ATOM #11#) (PROGN (LETT |p| (CAR #11#) . #15#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL
                       (LETT |dp| (SPADCALL |p| (QREFELT $ 20)) . #15#)
                       (|spadConstant| $ 21) (QREFELT $ 23))
                      (LETT #12# (CONS |dp| #12#) . #15#)))))
                  (LETT #11# (CDR #11#) . #15#) (GO G190) G191
                  (EXIT (NREVERSE #12#))))
            . #15#)
      (LETT |lv|
            (PROGN
             (LETT #7# NIL . #15#)
             (SEQ (LETT |np| NIL . #15#) (LETT #10# |lnum| . #15#) G190
                  (COND
                   ((OR (ATOM #10#) (PROGN (LETT |np| (CAR #10#) . #15#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #9# (SPADCALL |np| (QREFELT $ 30)) . #15#)
                     (COND
                      (#7# (LETT #8# (SPADCALL #8# #9# (QREFELT $ 31)) . #15#))
                      ('T
                       (PROGN (LETT #8# #9# . #15#) (LETT #7# 'T . #15#)))))))
                  (LETT #10# (CDR #10#) . #15#) (GO G190) G191 (EXIT NIL))
             (COND (#7# #8#) (#16='T (|IdentityError| '|setUnion|))))
            . #15#)
      (COND
       ((SPADCALL |lden| NIL (QREFELT $ 32))
        (LETT |lv|
              (SPADCALL |lv|
                        (PROGN
                         (LETT #3# NIL . #15#)
                         (SEQ (LETT |dp| NIL . #15#) (LETT #6# |lden| . #15#)
                              G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |dp| (CAR #6#) . #15#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #5# (SPADCALL |dp| (QREFELT $ 30))
                                       . #15#)
                                 (COND
                                  (#3#
                                   (LETT #4# (SPADCALL #4# #5# (QREFELT $ 31))
                                         . #15#))
                                  ('T
                                   (PROGN
                                    (LETT #4# #5# . #15#)
                                    (LETT #3# 'T . #15#)))))))
                              (LETT #6# (CDR #6#) . #15#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#3# #4#) (#16# (|IdentityError| '|setUnion|))))
                        (QREFELT $ 31))
              . #15#)))
      (EXIT
       (PROGN
        (LETT #2# NIL . #15#)
        (SEQ (LETT |numres| NIL . #15#)
             (LETT #1# (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT $ 27))
                   . #15#)
             G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |numres| (CAR #1#) . #15#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2# (CONS (|FLOATRP;makeEq| |numres| |lv| $) #2#)
                     . #15#)))
             (LETT #1# (CDR #1#) . #15#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |FLOATRP;solve;LParL;5| (|le| |eps| $)
  (PROG (#1=#:G161 |numres| #2=#:G160 |lv| #3=#:G146 #4=#:G145 #5=#:G147
         #6=#:G159 |dp| #7=#:G143 #8=#:G142 #9=#:G144 #10=#:G158 |np| |lden|
         #11=#:G157 |p| #12=#:G156 |lnum| #13=#:G155 #14=#:G154 |lp| #15=#:G153
         |ep| #16=#:G152)
    (RETURN
     (SEQ
      (LETT |lp|
            (PROGN
             (LETT #16# NIL . #17=(|FLOATRP;solve;LParL;5|))
             (SEQ (LETT |ep| NIL . #17#) (LETT #15# |le| . #17#) G190
                  (COND
                   ((OR (ATOM #15#) (PROGN (LETT |ep| (CAR #15#) . #17#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #16#
                          (CONS
                           (SPADCALL (SPADCALL |ep| (QREFELT $ 36))
                                     (SPADCALL |ep| (QREFELT $ 37))
                                     (QREFELT $ 38))
                           #16#)
                          . #17#)))
                  (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                  (EXIT (NREVERSE #16#))))
            . #17#)
      (LETT |lnum|
            (PROGN
             (LETT #14# NIL . #17#)
             (SEQ (LETT |p| NIL . #17#) (LETT #13# |lp| . #17#) G190
                  (COND
                   ((OR (ATOM #13#) (PROGN (LETT |p| (CAR #13#) . #17#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #14# (CONS (SPADCALL |p| (QREFELT $ 15)) #14#)
                          . #17#)))
                  (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                  (EXIT (NREVERSE #14#))))
            . #17#)
      (LETT |lden|
            (PROGN
             (LETT #12# NIL . #17#)
             (SEQ (LETT |p| NIL . #17#) (LETT #11# |lp| . #17#) G190
                  (COND
                   ((OR (ATOM #11#) (PROGN (LETT |p| (CAR #11#) . #17#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL
                       (LETT |dp| (SPADCALL |p| (QREFELT $ 20)) . #17#)
                       (|spadConstant| $ 21) (QREFELT $ 23))
                      (LETT #12# (CONS |dp| #12#) . #17#)))))
                  (LETT #11# (CDR #11#) . #17#) (GO G190) G191
                  (EXIT (NREVERSE #12#))))
            . #17#)
      (LETT |lv|
            (PROGN
             (LETT #7# NIL . #17#)
             (SEQ (LETT |np| NIL . #17#) (LETT #10# |lnum| . #17#) G190
                  (COND
                   ((OR (ATOM #10#) (PROGN (LETT |np| (CAR #10#) . #17#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #9# (SPADCALL |np| (QREFELT $ 30)) . #17#)
                     (COND
                      (#7# (LETT #8# (SPADCALL #8# #9# (QREFELT $ 31)) . #17#))
                      ('T
                       (PROGN (LETT #8# #9# . #17#) (LETT #7# 'T . #17#)))))))
                  (LETT #10# (CDR #10#) . #17#) (GO G190) G191 (EXIT NIL))
             (COND (#7# #8#) (#18='T (|IdentityError| '|setUnion|))))
            . #17#)
      (COND
       ((SPADCALL |lden| NIL (QREFELT $ 32))
        (LETT |lv|
              (SPADCALL |lv|
                        (PROGN
                         (LETT #3# NIL . #17#)
                         (SEQ (LETT |dp| NIL . #17#) (LETT #6# |lden| . #17#)
                              G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |dp| (CAR #6#) . #17#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #5# (SPADCALL |dp| (QREFELT $ 30))
                                       . #17#)
                                 (COND
                                  (#3#
                                   (LETT #4# (SPADCALL #4# #5# (QREFELT $ 31))
                                         . #17#))
                                  ('T
                                   (PROGN
                                    (LETT #4# #5# . #17#)
                                    (LETT #3# 'T . #17#)))))))
                              (LETT #6# (CDR #6#) . #17#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#3# #4#) (#18# (|IdentityError| '|setUnion|))))
                        (QREFELT $ 31))
              . #17#)))
      (EXIT
       (PROGN
        (LETT #2# NIL . #17#)
        (SEQ (LETT |numres| NIL . #17#)
             (LETT #1# (SPADCALL |lnum| |lden| |lv| |eps| (QREFELT $ 27))
                   . #17#)
             G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |numres| (CAR #1#) . #17#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2# (CONS (|FLOATRP;makeEq| |numres| |lv| $) #2#)
                     . #17#)))
             (LETT #1# (CDR #1#) . #17#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |FLOATRP;solve;FParL;6| (|p| |eps| $)
  (PROG (#1=#:G170 |val| #2=#:G169 |x| |mvar|)
    (RETURN
     (SEQ
      (LETT |mvar| (SPADCALL (SPADCALL |p| (QREFELT $ 15)) (QREFELT $ 42))
            . #3=(|FLOATRP;solve;FParL;6|))
      (EXIT
       (COND ((QEQCAR |mvar| 1) (|error| "no variable found"))
             ('T
              (SEQ (LETT |x| (SPADCALL (QCDR |mvar|) (QREFELT $ 9)) . #3#)
                   (EXIT
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |val| NIL . #3#)
                          (LETT #1# (SPADCALL |p| |eps| (QREFELT $ 19)) . #3#)
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
                                             (SPADCALL |val| (QREFELT $ 10))
                                             (QREFELT $ 12))
                                   #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))))))))))) 

(DEFUN |FLOATRP;solve;EParL;7| (|eq| |eps| $)
  (SPADCALL
   (SPADCALL (SPADCALL |eq| (QREFELT $ 36)) (SPADCALL |eq| (QREFELT $ 37))
             (QREFELT $ 38))
   |eps| (QREFELT $ 44))) 

(DECLAIM (NOTINLINE |FloatingRealPackage;|)) 

(DEFUN |FloatingRealPackage| (#1=#:G172)
  (PROG ()
    (RETURN
     (PROG (#2=#:G173)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|FloatingRealPackage|)
                                           '|domainEqualList|)
                . #3=(|FloatingRealPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|FloatingRealPackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|FloatingRealPackage|))))))))))) 

(DEFUN |FloatingRealPackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FloatingRealPackage|))
      (LETT |dv$| (LIST '|FloatingRealPackage| DV$1) . #1#)
      (LETT $ (GETREFV 46) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FloatingRealPackage| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FloatingRealPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|)
              (|Polynomial| 6) (0 . |coerce|) (5 . |coerce|) (|Equation| 8)
              (10 . |equation|) (|Polynomial| (|Integer|)) (|Fraction| 13)
              (16 . |numer|) (|List| 6)
              (|InnerNumericFloatSolvePackage| (|Integer|) 6 6)
              (21 . |innerSolve1|) |FLOATRP;realRoots;FParL;2| (27 . |denom|)
              (32 . |One|) (|Boolean|) (36 . ~=) (|List| 16) (|List| 13)
              (|List| 7) (42 . |innerSolve|) (|List| 14)
              |FLOATRP;realRoots;LLParL;3| (50 . |variables|) (55 . |setUnion|)
              (61 . ~=) (|List| 43) |FLOATRP;solve;LParL;4| (|Equation| 14)
              (67 . |lhs|) (72 . |rhs|) (77 . -) (|List| 35)
              |FLOATRP;solve;LParL;5| (|Union| 7 '"failed")
              (83 . |mainVariable|) (|List| 11) |FLOATRP;solve;FParL;6|
              |FLOATRP;solve;EParL;7|)
           '#(|solve| 88 |realRoots| 112) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(1 8 0 7 9 1 8 0 6 10 2 11 0
                                                   8 8 12 1 14 13 0 15 2 17 16
                                                   13 6 18 1 14 13 0 20 0 13 0
                                                   21 2 13 22 0 0 23 4 17 24 25
                                                   25 26 6 27 1 13 26 0 30 2 26
                                                   0 0 0 31 2 25 22 0 0 32 1 35
                                                   14 0 36 1 35 14 0 37 2 14 0
                                                   0 0 38 1 13 41 0 42 2 0 33
                                                   28 6 34 2 0 43 14 6 44 2 0
                                                   33 39 6 40 2 0 43 35 6 45 2
                                                   0 16 14 6 19 3 0 24 28 26 6
                                                   29)))))
           '|lookupComplete|)) 
