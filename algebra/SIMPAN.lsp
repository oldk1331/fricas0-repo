
(DEFUN |SIMPAN;simplify;AnE;1| (|a| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 8)) (QREFELT $ 10))) 

(DECLAIM (NOTINLINE |SimplifyAlgebraicNumberConvertPackage;|)) 

(DEFUN |SimplifyAlgebraicNumberConvertPackage| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G105)
       (RETURN
        (COND
         ((LETT #1#
                (HGET |$ConstructorCache|
                      '|SimplifyAlgebraicNumberConvertPackage|)
                . #2=(|SimplifyAlgebraicNumberConvertPackage|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache|
                         '|SimplifyAlgebraicNumberConvertPackage|
                         (LIST
                          (CONS NIL
                                (CONS 1
                                      (|SimplifyAlgebraicNumberConvertPackage;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache|
                    '|SimplifyAlgebraicNumberConvertPackage|))))))))))) 

(DEFUN |SimplifyAlgebraicNumberConvertPackage;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|SimplifyAlgebraicNumberConvertPackage|)
            . #1=(|SimplifyAlgebraicNumberConvertPackage|))
      (LETT $ (GETREFV 12) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SimplifyAlgebraicNumberConvertPackage|
                  NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SimplifyAlgebraicNumberConvertPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|AlgebraicNumber|)
              (|Expression| (|Integer|)) (0 . |coerce|)
              (|TranscendentalManipulations| (|Integer|) 7) (5 . |simplify|)
              |SIMPAN;simplify;AnE;1|)
           '#(|simplify| 10) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 11
                                                 '(1 7 0 6 8 1 9 7 7 10 1 0 7 6
                                                   11)))))
           '|lookupComplete|)) 

(MAKEPROP '|SimplifyAlgebraicNumberConvertPackage| 'NILADIC T) 
