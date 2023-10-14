
(/VERSIONCHECK 2) 

(DEFUN |RRCC-;zero?;ThePolsSB;1| (|toTest| |rootChar| $)
  (EQL (SPADCALL |toTest| |rootChar| (QREFELT $ 10)) 0)) 

(DEFUN |RRCC-;negative?;ThePolsSB;2| (|toTest| |rootChar| $)
  (< (SPADCALL |toTest| |rootChar| (QREFELT $ 10)) 0)) 

(DEFUN |RRCC-;positive?;ThePolsSB;3| (|toTest| |rootChar| $)
  (SPADCALL (SPADCALL |toTest| |rootChar| (QREFELT $ 10)) 0 (QREFELT $ 15))) 

(DEFUN |RRCC-;rootOf;ThePolsPiU;4| (|pol| |n| $)
  (PROG (|liste|)
    (RETURN
     (SEQ
      (LETT |liste| (SPADCALL |pol| (QREFELT $ 18))
            |RRCC-;rootOf;ThePolsPiU;4|)
      (EXIT
       (COND ((SPADCALL (LENGTH |liste|) |n| (QREFELT $ 20)) (CONS 1 "failed"))
             ('T (CONS 0 (SPADCALL |liste| |n| (QREFELT $ 22)))))))))) 

(DEFUN |RRCC-;recip;ThePolsSU;5| (|toInv| |rootChar| $)
  (PROG (|d| |defPol| #1=#:G150 |res|)
    (RETURN
     (SEQ
      (COND
       ((EQL (SPADCALL |toInv| (QREFELT $ 26)) 0)
        (SEQ
         (LETT |res|
               (SPADCALL (SPADCALL |toInv| (QREFELT $ 27)) (QREFELT $ 28))
               . #2=(|RRCC-;recip;ThePolsSU;5|))
         (EXIT
          (COND ((QEQCAR |res| 1) (CONS 1 "failed"))
                (#3='T (CONS 0 (SPADCALL (QCDR |res|) (QREFELT $ 29))))))))
       (#3#
        (SEQ (LETT |defPol| (SPADCALL |rootChar| (QREFELT $ 30)) . #2#)
             (LETT |d| (SPADCALL (LIST |defPol| |toInv|) (QREFELT $ 32)) . #2#)
             (EXIT
              (COND
               ((SPADCALL (QCDR |d|) |rootChar| (QREFELT $ 33))
                (CONS 1 "failed"))
               (#3#
                (SEQ
                 (COND
                  ((SPADCALL (SPADCALL (QCDR |d|) (QREFELT $ 26)) 0
                             (QREFELT $ 34))
                   (SEQ
                    (LETT |defPol|
                          (PROG2
                              (LETT #1#
                                    (SPADCALL |defPol| (QCDR |d|)
                                              (QREFELT $ 35))
                                    . #2#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0) (QREFELT $ 8) #1#))
                          . #2#)
                    (EXIT
                     (LETT |d|
                           (SPADCALL (LIST |defPol| |toInv|) (QREFELT $ 32))
                           . #2#)))))
                 (EXIT
                  (CONS 0 (SPADCALL (QCAR |d|) 2 (QREFELT $ 37))))))))))))))) 

(DECLAIM (NOTINLINE |RealRootCharacterizationCategory&;|)) 

(DEFUN |RealRootCharacterizationCategory&| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|RealRootCharacterizationCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|RealRootCharacterizationCategory&| DV$1 DV$2 DV$3)
            . #1#)
      (LETT $ (GETREFV 40) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RealRootCharacterizationCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Integer|) (0 . |sign|) (6 . |Zero|) (|Boolean|)
              |RRCC-;zero?;ThePolsSB;1| |RRCC-;negative?;ThePolsSB;2| (10 . >)
              |RRCC-;positive?;ThePolsSB;3| (|List| $) (16 . |allRootsOf|)
              (|NonNegativeInteger|) (21 . >) (|List| 6) (27 . |elt|)
              (|Union| $ '"failed") (|PositiveInteger|)
              |RRCC-;rootOf;ThePolsPiU;4| (33 . |degree|)
              (38 . |leadingCoefficient|) (43 . |recip|) (48 . |coerce|)
              (53 . |definingPolynomial|)
              (|Record| (|:| |coef| 17) (|:| |generator| $))
              (58 . |principalIdeal|) (63 . |zero?|) (69 . ~=) (75 . |exquo|)
              (|List| 8) (81 . |elt|) (|Union| 8 '"failed")
              |RRCC-;recip;ThePolsSU;5|)
           '#(|zero?| 87 |rootOf| 93 |recip| 99 |positive?| 105 |negative?|
              111)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 39
                                                 '(2 6 9 8 0 10 0 7 0 11 2 9 12
                                                   0 0 15 1 6 17 8 18 2 19 12 0
                                                   0 20 2 21 6 0 9 22 1 8 19 0
                                                   26 1 8 7 0 27 1 7 23 0 28 1
                                                   8 0 7 29 1 6 8 0 30 1 8 31
                                                   17 32 2 6 12 8 0 33 2 19 12
                                                   0 0 34 2 8 23 0 0 35 2 36 8
                                                   0 9 37 2 0 12 8 0 13 2 0 23
                                                   8 24 25 2 0 38 8 0 39 2 0 12
                                                   8 0 16 2 0 12 8 0 14)))))
           '|lookupComplete|)) 
