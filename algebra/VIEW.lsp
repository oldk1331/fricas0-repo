
(/VERSIONCHECK 2) 

(DEFUN |VIEW;graphCurves;LGi;1| (|listOfListsOfPoints| $)
  (SPADCALL |listOfListsOfPoints| (SPADCALL (QREFELT $ 8))
            (SPADCALL (QREFELT $ 9)) (SPADCALL (QREFELT $ 11)) NIL
            (QREFELT $ 15))) 

(DEFUN |VIEW;graphCurves;LLGi;2| (|listOfListsOfPoints| |optionsList| $)
  (SPADCALL |listOfListsOfPoints| (SPADCALL (QREFELT $ 8))
            (SPADCALL (QREFELT $ 9)) (SPADCALL (QREFELT $ 11)) |optionsList|
            (QREFELT $ 15))) 

(DEFUN |VIEW;graphCurves;L2PPiLGi;3|
       (|listOfListsOfPoints| |ptColor| |lineColor| |ptSize| |optionsList| $)
  (PROG (|listOfPointSizes| |i| #1=#:G137 |listOfLineColors| #2=#:G136
         |listOfPointColors| #3=#:G135 |len|)
    (RETURN
     (SEQ
      (LETT |len| (LENGTH |listOfListsOfPoints|)
            . #4=(|VIEW;graphCurves;L2PPiLGi;3|))
      (LETT |listOfPointColors|
            (PROGN
             (LETT #3# NIL . #4#)
             (SEQ (LETT |i| 1 . #4#) G190
                  (COND ((|greater_SI| |i| |len|) (GO G191)))
                  (SEQ (EXIT (LETT #3# (CONS |ptColor| #3#) . #4#)))
                  (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #3#))))
            . #4#)
      (LETT |listOfLineColors|
            (PROGN
             (LETT #2# NIL . #4#)
             (SEQ (LETT |i| 1 . #4#) G190
                  (COND ((|greater_SI| |i| |len|) (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS |lineColor| #2#) . #4#)))
                  (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #4#)
      (LETT |listOfPointSizes|
            (PROGN
             (LETT #1# NIL . #4#)
             (SEQ (LETT |i| 1 . #4#) G190
                  (COND ((|greater_SI| |i| |len|) (GO G191)))
                  (SEQ (EXIT (LETT #1# (CONS |ptSize| #1#) . #4#)))
                  (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #1#))))
            . #4#)
      (EXIT
       (SPADCALL |listOfListsOfPoints| |listOfPointColors| |listOfLineColors|
                 |listOfPointSizes| |optionsList| (QREFELT $ 20))))))) 

(DEFUN |VIEW;drawCurves;LLTdv;4| (|listOfListsOfPoints| |optionsList| $)
  (SPADCALL |listOfListsOfPoints| (SPADCALL (QREFELT $ 8))
            (SPADCALL (QREFELT $ 9)) (SPADCALL (QREFELT $ 11)) |optionsList|
            (QREFELT $ 22))) 

(DEFUN |VIEW;drawCurves;L2PPiLTdv;5|
       (|ptLists| |ptColor| |lColor| |ptSize| |optList| $)
  (PROG (|g| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (QREFELT $ 24)) . #1=(|VIEW;drawCurves;L2PPiLTdv;5|))
      (SPADCALL |v| |optList| (QREFELT $ 25))
      (LETT |g|
            (SPADCALL |ptLists| |ptColor| |lColor| |ptSize| |optList|
                      (QREFELT $ 15))
            . #1#)
      (SPADCALL |v| |g| 1 (QREFELT $ 27))
      (EXIT (SPADCALL |v| (QREFELT $ 28))))))) 

(DEFUN |VIEW;coerce;GiTdv;6| (|graf| $)
  (PROG (|v|)
    (RETURN
     (SEQ
      (COND
       ((EQL (SPADCALL |graf| (QREFELT $ 30)) 0)
        (SPADCALL |graf| (QREFELT $ 31))))
      (LETT |v| (SPADCALL (QREFELT $ 24)) |VIEW;coerce;GiTdv;6|)
      (SPADCALL |v| "VIEW2D" (QREFELT $ 33))
      (SPADCALL |v| |graf| 1 (QREFELT $ 27))
      (EXIT (SPADCALL |v| (QREFELT $ 28))))))) 

(DEFUN |ViewportPackage| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G145)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|ViewportPackage|)
                . #2=(|ViewportPackage|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|ViewportPackage|
                         (LIST (CONS NIL (CONS 1 (|ViewportPackage;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|ViewportPackage|))))))))))) 

(DEFUN |ViewportPackage;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|ViewportPackage|) . #1=(|ViewportPackage|))
      (LETT $ (GETREFV 35) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ViewportPackage| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ViewportPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Palette|) (|ViewDefaultsPackage|)
              (0 . |pointColorDefault|) (4 . |lineColorDefault|)
              (|PositiveInteger|) (8 . |pointSizeDefault|) (|GraphImage|)
              (|List| (|List| (|Point| (|DoubleFloat|))))
              (|List| (|DrawOption|)) |VIEW;graphCurves;L2PPiLGi;3|
              |VIEW;graphCurves;LGi;1| |VIEW;graphCurves;LLGi;2| (|List| 6)
              (|List| 10) (12 . |makeGraphImage|) (|TwoDimensionalViewport|)
              |VIEW;drawCurves;L2PPiLTdv;5| |VIEW;drawCurves;LLTdv;4|
              (21 . |viewport2D|) (25 . |options|) (|Void|) (31 . |putGraph|)
              (38 . |makeViewport2D|) (|Integer|) (43 . |key|)
              (48 . |makeGraphImage|) (|String|) (53 . |title|)
              |VIEW;coerce;GiTdv;6|)
           '#(|graphCurves| 59 |drawCurves| 79 |coerce| 94) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 34
                                                 '(0 7 6 8 0 7 6 9 0 7 10 11 5
                                                   12 0 13 18 18 19 14 20 0 21
                                                   0 24 2 21 0 0 14 25 3 21 26
                                                   0 12 10 27 1 21 0 0 28 1 12
                                                   29 0 30 1 12 0 0 31 2 21 26
                                                   0 32 33 5 0 12 13 6 6 10 14
                                                   15 2 0 12 13 14 17 1 0 12 13
                                                   16 5 0 21 13 6 6 10 14 22 2
                                                   0 21 13 14 23 1 0 21 12
                                                   34)))))
           '|lookupComplete|)) 

(MAKEPROP '|ViewportPackage| 'NILADIC T) 
