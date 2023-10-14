
(DEFUN |DRAWPT;draw;LLTdv;1| (|lp| |l| $)
  (SPADCALL (SPADCALL (LIST |lp|) (QREFELT $ 8)) |l| (QREFELT $ 11))) 

(DEFUN |DRAWPT;draw;LTdv;2| (|lp| $) (SPADCALL |lp| NIL (QREFELT $ 13))) 

(DEFUN |DRAWPT;draw;2LLTdv;3| (|lx| |ly| |l| $)
  (PROG (#1=#:G112 |x| #2=#:G113 |y| #3=#:G111)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #3# NIL . #4=(|DRAWPT;draw;2LLTdv;3|))
        (SEQ (LETT |y| NIL . #4#) (LETT #2# |ly| . #4#) (LETT |x| NIL . #4#)
             (LETT #1# |lx| . #4#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #4#) NIL) (ATOM #2#)
                   (PROGN (LETT |y| (CAR #2#) . #4#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #3# (CONS (SPADCALL (LIST |x| |y|) (QREFELT $ 17)) #3#)
                     . #4#)))
             (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
             (GO G190) G191 (EXIT (NREVERSE #3#))))
       |l| (QREFELT $ 13)))))) 

(DEFUN |DRAWPT;draw;2LTdv;4| (|lx| |ly| $)
  (SPADCALL |lx| |ly| NIL (QREFELT $ 18))) 

(DEFUN |DRAWPT;draw;3LTdv;5| (|x| |y| |z| $)
  (SPADCALL |x| |y| |z| NIL (QREFELT $ 21))) 

(DEFUN |DRAWPT;draw;3LLTdv;6| (|x| |y| |z| |l| $)
  (PROG (|points| |row| |zval| |i| |j| |zLen| |n| |m|)
    (RETURN
     (SEQ (LETT |m| (LENGTH |x|) . #1=(|DRAWPT;draw;3LLTdv;6|))
          (EXIT
           (COND ((ZEROP |m|) (|error| "No X values"))
                 (#2='T
                  (SEQ (LETT |n| (LENGTH |y|) . #1#)
                       (EXIT
                        (COND ((ZEROP |n|) (|error| "No Y values"))
                              (#2#
                               (SEQ (LETT |zLen| (LENGTH |z|) . #1#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |zLen| (* |m| |n|)
                                                 (QREFELT $ 25))
                                       (COND
                                        ((SPADCALL |zLen| (* |m| |n|)
                                                   (QREFELT $ 26))
                                         (|error|
                                          "Too many Z-values to fit grid"))
                                        (#2#
                                         (|error|
                                          "Not enough Z-values to fit grid"))))
                                      (#2#
                                       (SEQ (LETT |points| NIL . #1#)
                                            (SEQ (LETT |j| |n| . #1#) G190
                                                 (COND ((< |j| 1) (GO G191)))
                                                 (SEQ (LETT |row| NIL . #1#)
                                                      (SEQ (LETT |i| |m| . #1#)
                                                           G190
                                                           (COND
                                                            ((< |i| 1)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |zval|
                                                                  (+
                                                                   (* (- |j| 1)
                                                                      |m|)
                                                                   |i|)
                                                                  . #1#)
                                                            (EXIT
                                                             (LETT |row|
                                                                   (CONS
                                                                    (SPADCALL
                                                                     (LIST
                                                                      (SPADCALL
                                                                       |x| |i|
                                                                       (QREFELT
                                                                        $ 28))
                                                                      (SPADCALL
                                                                       |y| |j|
                                                                       (QREFELT
                                                                        $ 28))
                                                                      (SPADCALL
                                                                       |z|
                                                                       |zval|
                                                                       (QREFELT
                                                                        $ 28))
                                                                      (SPADCALL
                                                                       |z|
                                                                       |zval|
                                                                       (QREFELT
                                                                        $ 28)))
                                                                     (QREFELT $
                                                                              17))
                                                                    |row|)
                                                                   . #1#)))
                                                           (LETT |i| (+ |i| -1)
                                                                 . #1#)
                                                           (GO G190) G191
                                                           (EXIT NIL))
                                                      (EXIT
                                                       (LETT |points|
                                                             (CONS |row|
                                                                   |points|)
                                                             . #1#)))
                                                 (LETT |j| (+ |j| -1) . #1#)
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (SPADCALL
                                              (SPADCALL |points|
                                                        (QREFELT $ 30))
                                              |l|
                                              (QREFELT $ 31))))))))))))))))))) 

(DECLAIM (NOTINLINE |TopLevelDrawFunctionsForPoints;|)) 

(DEFUN |TopLevelDrawFunctionsForPoints| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G127)
       (RETURN
        (COND
         ((LETT #1#
                (HGET |$ConstructorCache| '|TopLevelDrawFunctionsForPoints|)
                . #2=(|TopLevelDrawFunctionsForPoints|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|TopLevelDrawFunctionsForPoints|
                         (LIST
                          (CONS NIL
                                (CONS 1
                                      (|TopLevelDrawFunctionsForPoints;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache|
                    '|TopLevelDrawFunctionsForPoints|))))))))))) 

(DEFUN |TopLevelDrawFunctionsForPoints;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|TopLevelDrawFunctionsForPoints|)
            . #1=(|TopLevelDrawFunctionsForPoints|))
      (LETT $ (GETREFV 32) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TopLevelDrawFunctionsForPoints| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TopLevelDrawFunctionsForPoints| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| 12) (|GraphImage|)
              (0 . |makeGraphImage|) (|List| (|DrawOption|))
              (|TwoDimensionalViewport|) (5 . |makeViewport2D|) (|List| 16)
              |DRAWPT;draw;LLTdv;1| |DRAWPT;draw;LTdv;2| (|List| 27)
              (|Point| 27) (11 . |point|) |DRAWPT;draw;2LLTdv;3|
              |DRAWPT;draw;2LTdv;4| (|ThreeDimensionalViewport|)
              |DRAWPT;draw;3LLTdv;6| |DRAWPT;draw;3LTdv;5| (|Boolean|)
              (|Integer|) (16 . ~=) (22 . >) (|DoubleFloat|) (28 . |elt|)
              (|ThreeSpace| 27) (34 . |mesh|) (39 . |makeViewport3D|))
           '#(|draw| 45) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 31
                                                 '(1 7 0 6 8 2 10 0 7 9 11 1 16
                                                   0 15 17 2 24 23 0 0 25 2 24
                                                   23 0 0 26 2 15 27 0 24 28 1
                                                   29 0 6 30 2 20 0 29 9 31 2 0
                                                   10 15 15 19 1 0 10 12 14 3 0
                                                   10 15 15 9 18 2 0 10 12 9 13
                                                   4 0 20 15 15 15 9 21 3 0 20
                                                   15 15 15 22)))))
           '|lookupComplete|)) 

(MAKEPROP '|TopLevelDrawFunctionsForPoints| 'NILADIC T) 
