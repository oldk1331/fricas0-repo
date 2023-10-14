
(/VERSIONCHECK 2) 

(DEFUN |CRAPACK;modTree;R2L;1| (|a| |lm| $)
  (PROG (|t|)
    (RETURN
     (SEQ
      (LETT |t| (SPADCALL (LENGTH |lm|) (|spadConstant| $ 8) (QREFELT $ 10))
            |CRAPACK;modTree;R2L;1|)
      (SPADCALL |t| |lm| (QREFELT $ 12))
      (SPADCALL |t| (ELT $ 13) (QREFELT $ 15))
      (EXIT
       (SPADCALL (SPADCALL |t| |a| (ELT $ 16) (QREFELT $ 17))
                 (QREFELT $ 18))))))) 

(DEFUN |CRAPACK;chineseRemainder;2LR;2| (|lv| |lm| $)
  (PROG (|y| |l| #1=#:G151 |v| #2=#:G152 |u| #3=#:G153 |m| #4=#:G150 |linv|
         |inv| |x|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LENGTH |lm|) (LENGTH |lv|) (QREFELT $ 21))
        (|error| "lists of moduli and values not of same length"))
       (#5='T
        (SEQ
         (LETT |x| (SPADCALL (LENGTH |lm|) (|spadConstant| $ 8) (QREFELT $ 10))
               . #6=(|CRAPACK;chineseRemainder;2LR;2|))
         (LETT |x| (SPADCALL |x| |lm| (QREFELT $ 12)) . #6#)
         (SPADCALL |x| (ELT $ 13) (QREFELT $ 15))
         (LETT |y|
               (SPADCALL (LENGTH |lm|) (|spadConstant| $ 22) (QREFELT $ 10))
               . #6#)
         (LETT |y|
               (SPADCALL (SPADCALL |y| (QREFELT $ 23)) |x|
                         (CONS #'|CRAPACK;chineseRemainder;2LR;2!0| $)
                         (QREFELT $ 26))
               . #6#)
         (LETT |u|
               (SPADCALL (SPADCALL |y| (QREFELT $ 27))
                         (SPADCALL |x| (QREFELT $ 27)) (|spadConstant| $ 22)
                         (QREFELT $ 30))
               . #6#)
         (EXIT
          (COND ((QEQCAR |u| 1) (|error| "moduli not relatively prime"))
                (#5#
                 (SEQ (LETT |inv| (QCAR (QCDR |u|)) . #6#)
                      (LETT |linv| (SPADCALL |inv| |lm| (QREFELT $ 19)) . #6#)
                      (LETT |l|
                            (PROGN
                             (LETT #4# NIL . #6#)
                             (SEQ (LETT |m| NIL . #6#) (LETT #3# |lm| . #6#)
                                  (LETT |u| NIL . #6#) (LETT #2# |linv| . #6#)
                                  (LETT |v| NIL . #6#) (LETT #1# |lv| . #6#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |v| (CAR #1#) . #6#) NIL)
                                        (ATOM #2#)
                                        (PROGN (LETT |u| (CAR #2#) . #6#) NIL)
                                        (ATOM #3#)
                                        (PROGN (LETT |m| (CAR #3#) . #6#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |u| |v| (QREFELT $ 13))
                                            |m| (QREFELT $ 16))
                                           #4#)
                                          . #6#)))
                                  (LETT #1#
                                        (PROG1 (CDR #1#)
                                          (LETT #2#
                                                (PROG1 (CDR #2#)
                                                  (LETT #3# (CDR #3#) . #6#))
                                                . #6#))
                                        . #6#)
                                  (GO G190) G191 (EXIT (NREVERSE #4#))))
                            . #6#)
                      (LETT |y| (SPADCALL |y| |l| (QREFELT $ 12)) . #6#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |y| |x|
                                   (CONS #'|CRAPACK;chineseRemainder;2LR;2!1|
                                         $)
                                   (QREFELT $ 26))
                         (QREFELT $ 27))
                        (SPADCALL |x| (QREFELT $ 27))
                        (QREFELT $ 16)))))))))))))) 

(DEFUN |CRAPACK;chineseRemainder;2LR;2!1| (|x1| |x2| |x3| |x4| $)
  (SPADCALL (SPADCALL |x1| |x4| (QREFELT $ 13))
            (SPADCALL |x2| |x3| (QREFELT $ 13)) (QREFELT $ 24))) 

(DEFUN |CRAPACK;chineseRemainder;2LR;2!0| (|x1| |x2| |x3| |x4| $)
  (SPADCALL (SPADCALL |x1| |x4| (QREFELT $ 13))
            (SPADCALL |x2| |x3| (QREFELT $ 13)) (QREFELT $ 24))) 

(DEFUN |CRAPACK;chineseRemainder;L2L;3| (|llv| |lm| $)
  (PROG (|retVal| |y| |l| #1=#:G170 |v| #2=#:G171 |u3| #3=#:G172 |m| #4=#:G169
         #5=#:G168 |lv| |linv| |inv| |u| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (LENGTH |lm|) (|spadConstant| $ 8) (QREFELT $ 10))
            . #6=(|CRAPACK;chineseRemainder;L2L;3|))
      (LETT |x| (SPADCALL |x| |lm| (QREFELT $ 12)) . #6#)
      (SPADCALL |x| (ELT $ 13) (QREFELT $ 15))
      (LETT |y| (SPADCALL (LENGTH |lm|) (|spadConstant| $ 22) (QREFELT $ 10))
            . #6#)
      (LETT |y|
            (SPADCALL (SPADCALL |y| (QREFELT $ 23)) |x|
                      (CONS #'|CRAPACK;chineseRemainder;L2L;3!0| $)
                      (QREFELT $ 26))
            . #6#)
      (LETT |u|
            (SPADCALL (SPADCALL |y| (QREFELT $ 27))
                      (SPADCALL |x| (QREFELT $ 27)) (|spadConstant| $ 22)
                      (QREFELT $ 30))
            . #6#)
      (EXIT
       (COND ((QEQCAR |u| 1) (|error| "moduli not relatively prime"))
             ('T
              (SEQ (LETT |inv| (QCAR (QCDR |u|)) . #6#)
                   (LETT |linv| (SPADCALL |inv| |lm| (QREFELT $ 19)) . #6#)
                   (LETT |retVal| NIL . #6#)
                   (SEQ (LETT |lv| NIL . #6#) (LETT #5# |llv| . #6#) G190
                        (COND
                         ((OR (ATOM #5#)
                              (PROGN (LETT |lv| (CAR #5#) . #6#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |l|
                               (PROGN
                                (LETT #4# NIL . #6#)
                                (SEQ (LETT |m| NIL . #6#) (LETT #3# |lm| . #6#)
                                     (LETT |u3| NIL . #6#)
                                     (LETT #2# |linv| . #6#)
                                     (LETT |v| NIL . #6#) (LETT #1# |lv| . #6#)
                                     G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |v| (CAR #1#) . #6#)
                                            NIL)
                                           (ATOM #2#)
                                           (PROGN
                                            (LETT |u3| (CAR #2#) . #6#)
                                            NIL)
                                           (ATOM #3#)
                                           (PROGN
                                            (LETT |m| (CAR #3#) . #6#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #4#
                                             (CONS
                                              (SPADCALL
                                               (SPADCALL |u3| |v|
                                                         (QREFELT $ 13))
                                               |m| (QREFELT $ 16))
                                              #4#)
                                             . #6#)))
                                     (LETT #1#
                                           (PROG1 (CDR #1#)
                                             (LETT #2#
                                                   (PROG1 (CDR #2#)
                                                     (LETT #3# (CDR #3#)
                                                           . #6#))
                                                   . #6#))
                                           . #6#)
                                     (GO G190) G191 (EXIT (NREVERSE #4#))))
                               . #6#)
                         (LETT |y| (SPADCALL |y| |l| (QREFELT $ 12)) . #6#)
                         (EXIT
                          (LETT |retVal|
                                (CONS
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |y| |x|
                                             (CONS
                                              #'|CRAPACK;chineseRemainder;L2L;3!1|
                                              $)
                                             (QREFELT $ 26))
                                   (QREFELT $ 27))
                                  (SPADCALL |x| (QREFELT $ 27)) (QREFELT $ 16))
                                 |retVal|)
                                . #6#)))
                        (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                   (EXIT (REVERSE |retVal|)))))))))) 

(DEFUN |CRAPACK;chineseRemainder;L2L;3!1| (|x1| |x2| |x3| |x4| $)
  (SPADCALL (SPADCALL |x1| |x4| (QREFELT $ 13))
            (SPADCALL |x2| |x3| (QREFELT $ 13)) (QREFELT $ 24))) 

(DEFUN |CRAPACK;chineseRemainder;L2L;3!0| (|x1| |x2| |x3| |x4| $)
  (SPADCALL (SPADCALL |x1| |x4| (QREFELT $ 13))
            (SPADCALL |x2| |x3| (QREFELT $ 13)) (QREFELT $ 24))) 

(DEFUN |CRAPACK;extEuclidean| (|a| |b| |c| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |a| |b| |c| (QREFELT $ 30)) |CRAPACK;extEuclidean|)
      (EXIT
       (COND
        ((QEQCAR |u| 1)
         (|error|
          (LIST (SPADCALL |c| (QREFELT $ 35)) " not spanned by "
                (SPADCALL |a| (QREFELT $ 35)) " and "
                (SPADCALL |b| (QREFELT $ 35)))))
        ('T (LIST (QCDR (QCDR |u|)) (QCAR (QCDR |u|)))))))))) 

(DEFUN |CRAPACK;multiEuclideanTree;LRL;5| (|fl| |rhs| $)
  (PROG (|x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (LENGTH |fl|) |rhs| (QREFELT $ 10))
            . #1=(|CRAPACK;multiEuclideanTree;LRL;5|))
      (LETT |x| (SPADCALL |x| |fl| (QREFELT $ 12)) . #1#)
      (SPADCALL |x| (ELT $ 13) (QREFELT $ 15))
      (EXIT
       (SPADCALL
        (SPADCALL |x| |rhs| (CONS (|function| |CRAPACK;extEuclidean|) $)
                  (QREFELT $ 37))
        (QREFELT $ 18))))))) 

(DEFUN |CRApackage| (#1=#:G186)
  (PROG ()
    (RETURN
     (PROG (#2=#:G187)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|CRApackage|)
                                           '|domainEqualList|)
                . #3=(|CRApackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|CRApackage;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|CRApackage|))))))))))) 

(DEFUN |CRApackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|CRApackage|))
      (LETT |dv$| (LIST '|CRApackage| DV$1) . #1#)
      (LETT $ (GETREFV 39) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|CRApackage| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|BalancedBinaryTree| |#1|))
      $)))) 

(MAKEPROP '|CRApackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'BB (0 . |Zero|)
              (|NonNegativeInteger|) (4 . |balancedBinaryTree|) (|List| 6)
              (10 . |setleaves!|) (16 . *) (|Mapping| 6 6 6) (22 . |mapUp!|)
              (28 . |rem|) (34 . |mapDown!|) (41 . |leaves|)
              |CRAPACK;modTree;R2L;1| (|Boolean|) (46 . ~=) (52 . |One|)
              (56 . |copy|) (61 . +) (|Mapping| 6 6 6 6 6) (67 . |mapUp!|)
              (74 . |value|) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 28 '"failed") (79 . |extendedEuclidean|)
              |CRAPACK;chineseRemainder;2LR;2| (|List| 11)
              |CRAPACK;chineseRemainder;L2L;3| (|OutputForm|) (86 . |coerce|)
              (|Mapping| 11 6 6 6) (91 . |mapDown!|)
              |CRAPACK;multiEuclideanTree;LRL;5|)
           '#(|multiEuclideanTree| 98 |modTree| 104 |chineseRemainder| 110)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 38
                                                 '(0 6 0 8 2 7 0 9 6 10 2 7 0 0
                                                   11 12 2 6 0 0 0 13 2 7 6 0
                                                   14 15 2 6 0 0 0 16 3 7 0 0 6
                                                   14 17 1 7 11 0 18 2 9 20 0 0
                                                   21 0 6 0 22 1 7 0 0 23 2 6 0
                                                   0 0 24 3 7 0 0 0 25 26 1 7 6
                                                   0 27 3 6 29 0 0 0 30 1 6 34
                                                   0 35 3 7 0 0 6 36 37 2 0 11
                                                   11 6 38 2 0 11 6 11 19 2 0 6
                                                   11 11 31 2 0 11 32 11
                                                   33)))))
           '|lookupComplete|)) 
