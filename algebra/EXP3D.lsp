
(SDEFUN |EXP3D;faceIndex|
        ((|subSp| |SubSpace| 3 (|DoubleFloat|))
         ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|faceIndexList| (|List| (|NonNegativeInteger|))) (#1=#:G111 NIL)
          (|poly| NIL))
         (SEQ (LETT |faceIndexList| NIL . #2=(|EXP3D;faceIndex|))
              (SEQ (LETT |poly| NIL . #2#)
                   (LETT #1# (SPADCALL |subSp| (QREFELT $ 8)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |poly| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |faceIndexList|
                           (CONS (SPADCALL |poly| (QREFELT $ 10))
                                 |faceIndexList|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |faceIndexList|))))) 

(SDEFUN |EXP3D;writePolygon|
        ((|f1| |TextFile|) (|curves| |List| (|SubSpace| 3 (|DoubleFloat|)))
         ($ |Void|))
        (SPROG
         ((|s| (|String|)) (#1=#:G118 NIL) (|i| NIL)
          (|faceIndexList| (|List| (|NonNegativeInteger|))) (#2=#:G117 NIL)
          (|curve| NIL))
         (SEQ (LETT |faceIndexList| NIL . #3=(|EXP3D;writePolygon|))
              (SEQ (LETT |curve| NIL . #3#) (LETT #2# |curves| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |curve| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |faceIndexList|
                           (APPEND |faceIndexList|
                                   (|EXP3D;faceIndex| |curve| $))
                           . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |s| "f " . #3#)
              (SEQ (LETT |i| NIL . #3#) (LETT #1# |faceIndexList| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |s| (STRCONC |s| (STRINGIMAGE |i|)) . #3#)
                        (EXIT (LETT |s| (STRCONC |s| " ") . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |f1| |s| (QREFELT $ 13)))))) 

(SDEFUN |EXP3D;writeMesh|
        ((|f1| |TextFile|) (|curves| |List| (|SubSpace| 3 (|DoubleFloat|)))
         ($ |Void|))
        (SPROG
         ((|s| (|String|)) (#1=#:G127 NIL) (|j| NIL) (#2=#:G126 NIL) (|i| NIL)
          (|colLength| (|NonNegativeInteger|))
          (|rowLength| (|NonNegativeInteger|))
          (|meshIndexArray| (|List| (|List| (|NonNegativeInteger|))))
          (#3=#:G125 NIL) (|curve| NIL))
         (SEQ (LETT |meshIndexArray| NIL . #4=(|EXP3D;writeMesh|))
              (SEQ (LETT |curve| NIL . #4#) (LETT #3# |curves| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |curve| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |meshIndexArray|
                           (CONS (|EXP3D;faceIndex| |curve| $)
                                 |meshIndexArray|)
                           . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |meshIndexArray| (REVERSE |meshIndexArray|) . #4#)
              (LETT |rowLength| (LENGTH |meshIndexArray|) . #4#)
              (LETT |colLength|
                    (SPADCALL (SPADCALL |meshIndexArray| 1 (QREFELT $ 17))
                              (QREFELT $ 18))
                    . #4#)
              (EXIT
               (SEQ (LETT |i| 1 . #4#) (LETT #2# (- |rowLength| 1) . #4#) G190
                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |j| 1 . #4#)
                           (LETT #1# (- |colLength| 1) . #4#) G190
                           (COND ((|greater_SI| |j| #1#) (GO G191)))
                           (SEQ
                            (LETT |s|
                                  (SPADCALL
                                   (LIST "f "
                                         (STRINGIMAGE
                                          (SPADCALL
                                           (SPADCALL |meshIndexArray| |i|
                                                     (QREFELT $ 17))
                                           |j| (QREFELT $ 19)))
                                         " "
                                         (STRINGIMAGE
                                          (SPADCALL
                                           (SPADCALL |meshIndexArray| (+ |i| 1)
                                                     (QREFELT $ 17))
                                           |j| (QREFELT $ 19)))
                                         " "
                                         (STRINGIMAGE
                                          (SPADCALL
                                           (SPADCALL |meshIndexArray| (+ |i| 1)
                                                     (QREFELT $ 17))
                                           (+ |j| 1) (QREFELT $ 19)))
                                         " "
                                         (STRINGIMAGE
                                          (SPADCALL
                                           (SPADCALL |meshIndexArray| |i|
                                                     (QREFELT $ 17))
                                           (+ |j| 1) (QREFELT $ 19))))
                                   (QREFELT $ 20))
                                  . #4#)
                            (EXIT (SPADCALL |f1| |s| (QREFELT $ 13))))
                           (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                    (EXIT NIL)))))) 

(SDEFUN |EXP3D;toString| ((|d| |DoubleFloat|) ($ |String|))
        (SPADCALL (SPADCALL |d| (QREFELT $ 23)) (QREFELT $ 24))) 

(SDEFUN |EXP3D;writeObj;SsSV;5|
        ((|subSp| |SubSpace| 3 (|DoubleFloat|)) (|filename| |String|)
         ($ |Void|))
        (SPROG
         ((|curves| (|List| (|SubSpace| 3 (|DoubleFloat|)))) (#1=#:G139 NIL)
          (|component| NIL) (#2=#:G138 NIL) (|v| NIL)
          (|verts| (|List| (|Point| (|DoubleFloat|)))) (|f1| (|TextFile|)))
         (SEQ
          (LETT |f1|
                (SPADCALL (SPADCALL |filename| (QREFELT $ 26)) "output"
                          (QREFELT $ 27))
                . #3=(|EXP3D;writeObj;SsSV;5|))
          (SPADCALL |f1| "# mesh generated by axiom" (QREFELT $ 13))
          (LETT |verts| (SPADCALL |subSp| (QREFELT $ 29)) . #3#)
          (SEQ (LETT |v| NIL . #3#) (LETT #2# |verts| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((< (SPADCALL |v| (QREFELT $ 31)) 3)
                   (|error| "Can't write OBJ file from 2D points"))
                  ('T
                   (SPADCALL |f1|
                             (SPADCALL
                              (LIST "v "
                                    (|EXP3D;toString|
                                     (SPADCALL |v| 1 (QREFELT $ 32)) $)
                                    " "
                                    (|EXP3D;toString|
                                     (SPADCALL |v| 2 (QREFELT $ 32)) $)
                                    " "
                                    (|EXP3D;toString|
                                     (SPADCALL |v| 3 (QREFELT $ 32)) $))
                              (QREFELT $ 20))
                             (QREFELT $ 13))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |component| NIL . #3#)
               (LETT #1# (SPADCALL |subSp| (QREFELT $ 8)) . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |component| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |curves| (SPADCALL |component| (QREFELT $ 8)) . #3#)
                    (COND
                     ((< (LENGTH |curves|) 2)
                      (|sayTeX| "Can't write point or curve to OBJ file")))
                    (EXIT
                     (COND
                      ((SPADCALL (LENGTH |curves|) 1 (QREFELT $ 34))
                       (SEQ
                        (COND
                         ((EQL
                           (SPADCALL (SPADCALL |curves| 1 (QREFELT $ 36))
                                     (QREFELT $ 37))
                           1)
                          (|EXP3D;writePolygon| |f1| |curves| $)))
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL (SPADCALL |curves| 1 (QREFELT $ 36))
                                      (QREFELT $ 37))
                            1 (QREFELT $ 34))
                           (|EXP3D;writeMesh| |f1| |curves| $)))))))))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |f1| (QREFELT $ 38)))))) 

(DECLAIM (NOTINLINE |Export3D;|)) 

(DEFUN |Export3D| ()
  (SPROG NIL
         (PROG (#1=#:G141)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Export3D|)
                    . #2=(|Export3D|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Export3D|
                             (LIST (CONS NIL (CONS 1 (|Export3D;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Export3D|)))))))))) 

(DEFUN |Export3D;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Export3D|) . #1=(|Export3D|))
          (LETT $ (GETREFV 41) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Export3D| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|Export3D| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| $) (|SubSpace| '3 22)
              (0 . |children|) (|NonNegativeInteger|) (5 . |extractIndex|)
              (|String|) (|TextFile|) (10 . |writeLine!|) (|List| 9)
              (|Integer|) (|List| 14) (16 . |elt|) (22 . |#|) (27 . |elt|)
              (33 . |concat|) (|InputForm|) (|DoubleFloat|) (38 . |convert|)
              (43 . |unparse|) (|FileName|) (48 . |coerce|) (53 . |open|)
              (|List| 30) (59 . |pointData|) (|Point| 22) (64 . |#|)
              (69 . |elt|) (|Boolean|) (75 . >) (|List| 7) (81 . |elt|)
              (87 . |numberOfChildren|) (92 . |close!|) (|Void|)
              |EXP3D;writeObj;SsSV;5|)
           '#(|writeObj| 97) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 40
                                                 '(1 7 6 0 8 1 7 9 0 10 2 12 11
                                                   0 11 13 2 16 14 0 15 17 1 14
                                                   9 0 18 2 14 9 0 15 19 1 11 0
                                                   6 20 1 22 21 0 23 1 21 11 0
                                                   24 1 25 0 11 26 2 12 0 25 11
                                                   27 1 7 28 0 29 1 30 9 0 31 2
                                                   30 22 0 15 32 2 9 33 0 0 34
                                                   2 35 7 0 15 36 1 7 9 0 37 1
                                                   12 0 0 38 2 0 39 7 11
                                                   40)))))
           '|lookupComplete|)) 

(MAKEPROP '|Export3D| 'NILADIC T) 
