
(/VERSIONCHECK 2) 

(DEFUN |FCPAK1;zeroVector;SPFc;1| (|fname| |n| $)
  (PROG (|fa| |indices| |ip1| |segbp1| |segp1| |hp1| |lp1| |i1| |ue|)
    (RETURN
     (SEQ (LETT |ue| (|spadConstant| $ 7) . #1=(|FCPAK1;zeroVector;SPFc;1|))
          (LETT |i1| 'I1 . #1#) (LETT |lp1| (|spadConstant| $ 9) . #1#)
          (LETT |hp1| |n| . #1#)
          (LETT |segp1| (SPADCALL |lp1| |hp1| (QREFELT $ 11)) . #1#)
          (LETT |segbp1| (SPADCALL |i1| |segp1| (QREFELT $ 14)) . #1#)
          (LETT |ip1| (SPADCALL |i1| (QREFELT $ 15)) . #1#)
          (LETT |indices| (LIST |ip1|) . #1#)
          (LETT |fa|
                (SPADCALL |segbp1|
                          (SPADCALL |fname| |indices| |ue| (QREFELT $ 18))
                          (QREFELT $ 19))
                . #1#)
          (EXIT |fa|))))) 

(DEFUN |FCPAK1;zeroMatrix;S2PFc;2| (|fname| |m| |n| $)
  (PROG (|fa| |indices| |ip2| |ip1| |segbp2| |segp2| |hp2| |i2| |segbp1|
         |segp1| |hp1| |lp1| |i1| |ue|)
    (RETURN
     (SEQ (LETT |ue| (|spadConstant| $ 7) . #1=(|FCPAK1;zeroMatrix;S2PFc;2|))
          (LETT |i1| 'I1 . #1#) (LETT |lp1| (|spadConstant| $ 9) . #1#)
          (LETT |hp1| |m| . #1#)
          (LETT |segp1| (SPADCALL |lp1| |hp1| (QREFELT $ 11)) . #1#)
          (LETT |segbp1| (SPADCALL |i1| |segp1| (QREFELT $ 14)) . #1#)
          (LETT |i2| 'I2 . #1#) (LETT |hp2| |n| . #1#)
          (LETT |segp2| (SPADCALL |lp1| |hp2| (QREFELT $ 11)) . #1#)
          (LETT |segbp2| (SPADCALL |i2| |segp2| (QREFELT $ 14)) . #1#)
          (LETT |ip1| (SPADCALL |i1| (QREFELT $ 15)) . #1#)
          (LETT |ip2| (SPADCALL |i2| (QREFELT $ 15)) . #1#)
          (LETT |indices| (LIST |ip1| |ip2|) . #1#)
          (LETT |fa|
                (SPADCALL |segbp1|
                          (SPADCALL |segbp2|
                                    (SPADCALL |fname| |indices| |ue|
                                              (QREFELT $ 18))
                                    (QREFELT $ 19))
                          (QREFELT $ 19))
                . #1#)
          (EXIT |fa|))))) 

(DEFUN |FCPAK1;zeroMatrix;S2SbFc;3| (|fname| |segbp1| |segbp2| $)
  (PROG (|fa| |indices| |ip2| |ip1| |i2| |i1| |ue|)
    (RETURN
     (SEQ (LETT |ue| (|spadConstant| $ 7) . #1=(|FCPAK1;zeroMatrix;S2SbFc;3|))
          (LETT |i1| (SPADCALL |segbp1| (QREFELT $ 22)) . #1#)
          (LETT |i2| (SPADCALL |segbp2| (QREFELT $ 22)) . #1#)
          (LETT |ip1| (SPADCALL |i1| (QREFELT $ 15)) . #1#)
          (LETT |ip2| (SPADCALL |i2| (QREFELT $ 15)) . #1#)
          (LETT |indices| (LIST |ip1| |ip2|) . #1#)
          (LETT |fa|
                (SPADCALL |segbp1|
                          (SPADCALL |segbp2|
                                    (SPADCALL |fname| |indices| |ue|
                                              (QREFELT $ 18))
                                    (QREFELT $ 19))
                          (QREFELT $ 19))
                . #1#)
          (EXIT |fa|))))) 

(DEFUN |FCPAK1;zeroSquareMatrix;SPFc;4| (|fname| |n| $)
  (PROG (|fa| |indices| |ip2| |ip1| |segbp2| |i2| |segbp1| |segp1| |hp1| |lp1|
         |i1| |ue|)
    (RETURN
     (SEQ
      (LETT |ue| (|spadConstant| $ 7) . #1=(|FCPAK1;zeroSquareMatrix;SPFc;4|))
      (LETT |i1| 'I1 . #1#) (LETT |lp1| (|spadConstant| $ 9) . #1#)
      (LETT |hp1| |n| . #1#)
      (LETT |segp1| (SPADCALL |lp1| |hp1| (QREFELT $ 11)) . #1#)
      (LETT |segbp1| (SPADCALL |i1| |segp1| (QREFELT $ 14)) . #1#)
      (LETT |i2| 'I2 . #1#)
      (LETT |segbp2| (SPADCALL |i2| |segp1| (QREFELT $ 14)) . #1#)
      (LETT |ip1| (SPADCALL |i1| (QREFELT $ 15)) . #1#)
      (LETT |ip2| (SPADCALL |i2| (QREFELT $ 15)) . #1#)
      (LETT |indices| (LIST |ip1| |ip2|) . #1#)
      (LETT |fa|
            (SPADCALL |segbp1|
                      (SPADCALL |segbp2|
                                (SPADCALL |fname| |indices| |ue|
                                          (QREFELT $ 18))
                                (QREFELT $ 19))
                      (QREFELT $ 19))
            . #1#)
      (EXIT |fa|))))) 

(DEFUN |FCPAK1;identitySquareMatrix;SPFc;5| (|fname| |n| $)
  (PROG (|fa| |fl| |f1| |fc| |indices| |indice1| |ip2| |ip1| |segbp2| |i2|
         |segbp1| |segp1| |hp1| |lp1| |i1| |u1| |ue|)
    (RETURN
     (SEQ
      (LETT |ue| (|spadConstant| $ 7)
            . #1=(|FCPAK1;identitySquareMatrix;SPFc;5|))
      (LETT |u1| (|spadConstant| $ 25) . #1#) (LETT |i1| 'I1 . #1#)
      (LETT |lp1| (|spadConstant| $ 9) . #1#) (LETT |hp1| |n| . #1#)
      (LETT |segp1| (SPADCALL |lp1| |hp1| (QREFELT $ 11)) . #1#)
      (LETT |segbp1| (SPADCALL |i1| |segp1| (QREFELT $ 14)) . #1#)
      (LETT |i2| 'I2 . #1#)
      (LETT |segbp2| (SPADCALL |i2| |segp1| (QREFELT $ 14)) . #1#)
      (LETT |ip1| (SPADCALL |i1| (QREFELT $ 15)) . #1#)
      (LETT |ip2| (SPADCALL |i2| (QREFELT $ 15)) . #1#)
      (LETT |indice1| (LIST |ip1| |ip1|) . #1#)
      (LETT |indices| (LIST |ip1| |ip2|) . #1#)
      (LETT |fc|
            (SPADCALL |segbp2| (SPADCALL |fname| |indices| |ue| (QREFELT $ 18))
                      (QREFELT $ 19))
            . #1#)
      (LETT |f1| (SPADCALL |fname| |indice1| |u1| (QREFELT $ 18)) . #1#)
      (LETT |fl| (LIST |fc| |f1|) . #1#)
      (LETT |fa|
            (SPADCALL |segbp1| (SPADCALL |fl| (QREFELT $ 27)) (QREFELT $ 19))
            . #1#)
      (EXIT |fa|))))) 

(DECLAIM (NOTINLINE |FortranCodePackage1;|)) 

(DEFUN |FortranCodePackage1| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G138)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|FortranCodePackage1|)
                . #2=(|FortranCodePackage1|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|FortranCodePackage1|
                         (LIST (CONS NIL (CONS 1 (|FortranCodePackage1;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|FortranCodePackage1|))))))))))) 

(DEFUN |FortranCodePackage1;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|FortranCodePackage1|) . #1=(|FortranCodePackage1|))
      (LETT $ (GETREFV 29) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FortranCodePackage1| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FortranCodePackage1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Expression| (|Integer|)) (0 . |Zero|)
              (|Polynomial| (|Integer|)) (4 . |One|) (|Segment| 8)
              (8 . |segment|) (|Symbol|) (|SegmentBinding| 8) (14 . |equation|)
              (20 . |coerce|) (|List| 8) (|FortranCode|) (25 . |assign|)
              (32 . |forLoop|) |FCPAK1;zeroVector;SPFc;1|
              |FCPAK1;zeroMatrix;S2PFc;2| (38 . |variable|)
              |FCPAK1;zeroMatrix;S2SbFc;3| |FCPAK1;zeroSquareMatrix;SPFc;4|
              (43 . |One|) (|List| $) (47 . |block|)
              |FCPAK1;identitySquareMatrix;SPFc;5|)
           '#(|zeroVector| 52 |zeroSquareMatrix| 58 |zeroMatrix| 64
              |identitySquareMatrix| 78)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(0 6 0 7 0 8 0 9 2 10 0 8 8
                                                   11 2 13 0 12 10 14 1 8 0 12
                                                   15 3 17 0 12 16 6 18 2 17 0
                                                   13 0 19 1 13 12 0 22 0 6 0
                                                   25 1 17 0 26 27 2 0 17 12 8
                                                   20 2 0 17 12 8 24 3 0 17 12
                                                   8 8 21 3 0 17 12 13 13 23 2
                                                   0 17 12 8 28)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranCodePackage1| 'NILADIC T) 
