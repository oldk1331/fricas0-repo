
(/VERSIONCHECK 2) 

(DEFUN |REALSOLV;prn2rfi| (|p| $)
  (SPADCALL (ELT $ 8) (CONS #'|REALSOLV;prn2rfi!0| $) |p| (QREFELT $ 19))) 

(DEFUN |REALSOLV;prn2rfi!0| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 12))
            (SPADCALL (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 12))
            (QREFELT $ 14))) 

(DEFUN |REALSOLV;pi2rfi| (|p| $) (SPADCALL |p| (QREFELT $ 21))) 

(DEFUN |REALSOLV;solve;PFL;3| (|p| |eps| $)
  (SPADCALL (|REALSOLV;prn2rfi| |p| $) |eps| (QREFELT $ 25))) 

(DEFUN |REALSOLV;solve;PFL;4| (|p| |eps| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 21)) |eps| (QREFELT $ 25))) 

(DEFUN |REALSOLV;realSolve;LLFL;5| (|lp| |lv| |eps| $)
  (SPADCALL
   (SPADCALL (CONS (|function| |REALSOLV;pi2rfi|) $) |lp| (QREFELT $ 32)) |lv|
   |eps| (QREFELT $ 35))) 

(DEFUN |RealSolvePackage| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G133)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|RealSolvePackage|)
                . #2=(|RealSolvePackage|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|RealSolvePackage|
                         (LIST (CONS NIL (CONS 1 (|RealSolvePackage;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|RealSolvePackage|))))))))))) 

(DEFUN |RealSolvePackage;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|RealSolvePackage|) . #1=(|RealSolvePackage|))
      (LETT $ (GETREFV 37) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|RealSolvePackage| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RealSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Symbol|) (|Fraction| 20) (0 . |coerce|)
              (|Integer|) (|Fraction| 9) (5 . |numer|) (10 . |coerce|)
              (15 . |denom|) (20 . /) (|Mapping| 7 6) (|Mapping| 7 10)
              (|Polynomial| 10)
              (|PolynomialCategoryLifting| (|IndexedExponents| 6) 6 10 17 7)
              (26 . |map|) (|Polynomial| 9) (33 . |coerce|) (|List| 23)
              (|Float|) (|FloatingRealPackage| 23) (38 . |realRoots|)
              |REALSOLV;solve;PFL;3| |REALSOLV;solve;PFL;4| (|List| 7)
              (|Mapping| 7 20) (|List| 20) (|ListFunctions2| 20 7) (44 . |map|)
              (|List| 22) (|List| 6) (50 . |realRoots|)
              |REALSOLV;realSolve;LLFL;5|)
           '#(|solve| 57 |realSolve| 69) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 36
                                                 '(1 7 0 6 8 1 10 9 0 11 1 7 0
                                                   9 12 1 10 9 0 13 2 7 0 0 0
                                                   14 3 18 7 15 16 17 19 1 7 0
                                                   20 21 2 24 22 7 23 25 2 31
                                                   28 29 30 32 3 24 33 28 34 23
                                                   35 2 0 22 17 23 26 2 0 22 20
                                                   23 27 3 0 33 30 34 23
                                                   36)))))
           '|lookupComplete|)) 

(MAKEPROP '|RealSolvePackage| 'NILADIC T) 
