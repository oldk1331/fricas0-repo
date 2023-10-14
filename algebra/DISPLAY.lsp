
(/VERSIONCHECK 2) 

(DEFUN |DISPLAY;bright;SL;1| (|s| $) (LIST (QREFELT $ 6) |s| (QREFELT $ 7))) 

(DEFUN |DISPLAY;bright;2L;2| (|l| $)
  (CONS (QREFELT $ 6) (APPEND |l| (SPADCALL (QREFELT $ 7) (QREFELT $ 12))))) 

(DEFUN |DISPLAY;newLine;S;3| ($) (QREFELT $ 8)) 

(DEFUN |DISPLAY;copies;I2S;4| (|n| |s| $)
  (PROG (|t|)
    (RETURN
     (SEQ
      (COND ((< |n| 1) "") ((EQL |n| 1) |s|)
            (#1='T
             (SEQ
              (LETT |t| (SPADCALL (QUOTIENT2 |n| 2) |s| (QREFELT $ 16))
                    |DISPLAY;copies;I2S;4|)
              (EXIT
               (COND ((ODDP |n|) (SPADCALL (LIST |s| |t| |t|) (QREFELT $ 18)))
                     (#1# (SPADCALL (LIST |t| |t|) (QREFELT $ 18)))))))))))) 

(DEFUN |DISPLAY;center0| (|len| |wid| |fill| $)
  (PROG (|t| |m|)
    (RETURN
     (SEQ
      (COND ((OR (< |wid| 1) (>= |len| |wid|)) (CONS "" ""))
            ('T
             (SEQ
              (LETT |m| (QUOTIENT2 (- |wid| |len|) 2) . #1=(|DISPLAY;center0|))
              (LETT |t|
                    (SPADCALL
                     (+ 1 (QUOTIENT2 |m| (SPADCALL |fill| (QREFELT $ 19))))
                     |fill| (QREFELT $ 16))
                    . #1#)
              (EXIT
               (CONS
                (SPADCALL |t| (SPADCALL 1 |m| (QREFELT $ 21)) (QREFELT $ 22))
                (SPADCALL |t|
                          (SPADCALL 1 (- (- |wid| |len|) |m|) (QREFELT $ 21))
                          (QREFELT $ 22))))))))))) 

(DEFUN |DISPLAY;center;SI2S;6| (|s| |wid| |fill| $)
  (PROG (|rec| |len|)
    (RETURN
     (SEQ
      (COND ((< |wid| 1) "")
            (#1='T
             (SEQ
              (LETT |len| (SPADCALL |s| (QREFELT $ 19))
                    . #2=(|DISPLAY;center;SI2S;6|))
              (EXIT
               (COND ((EQL |len| |wid|) |s|)
                     ((SPADCALL |len| |wid| (QREFELT $ 24))
                      (SPADCALL |s| (SPADCALL 1 |wid| (QREFELT $ 21))
                                (QREFELT $ 22)))
                     (#1#
                      (SEQ
                       (LETT |rec| (|DISPLAY;center0| |len| |wid| |fill| $)
                             . #2#)
                       (EXIT
                        (SPADCALL (LIST (QCAR |rec|) |s| (QCDR |rec|))
                                  (QREFELT $ 18)))))))))))))) 

(DEFUN |DISPLAY;center;LISL;7| (|l| |wid| |fill| $)
  (PROG (|rec| |len|)
    (RETURN
     (SEQ
      (COND ((< |wid| 1) (LIST ""))
            (#1='T
             (SEQ
              (LETT |len| (SPADCALL |l| (QREFELT $ 26))
                    . #2=(|DISPLAY;center;LISL;7|))
              (EXIT
               (COND ((EQL |len| |wid|) |l|)
                     (#1#
                      (SEQ
                       (LETT |rec| (|DISPLAY;center0| |len| |wid| |fill| $)
                             . #2#)
                       (EXIT
                        (CONS (QCAR |rec|)
                              (APPEND |l|
                                      (SPADCALL (QCDR |rec|)
                                                (QREFELT $ 12)))))))))))))))) 

(DEFUN |DISPLAY;say;SV;8| (|s| $)
  (SEQ (|sayBrightly| |s|) (EXIT (SPADCALL (QREFELT $ 29))))) 

(DEFUN |DISPLAY;say;LV;9| (|l| $)
  (SEQ (|sayBrightly| |l|) (EXIT (SPADCALL (QREFELT $ 29))))) 

(PUT '|DISPLAY;sayLength;SI;10| '|SPADreplace| 'QCSIZE) 

(DEFUN |DISPLAY;sayLength;SI;10| (|s| $) (QCSIZE |s|)) 

(DEFUN |DISPLAY;sayLength;LI;11| (|l| $)
  (PROG (|sum| #1=#:G150 |s|)
    (RETURN
     (SEQ (LETT |sum| 0 . #2=(|DISPLAY;sayLength;LI;11|))
          (SEQ (LETT |s| NIL . #2#) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((OR (EQUAL |s| (QREFELT $ 6)) (EQUAL |s| (QREFELT $ 7)))
                   (LETT |sum| (+ |sum| 1) . #2#))
                  ((EQUAL |s| (QREFELT $ 8)) |sum|)
                  ('T
                   (LETT |sum| (+ |sum| (SPADCALL |s| (QREFELT $ 19)))
                         . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |sum|))))) 

(DECLAIM (NOTINLINE |DisplayPackage;|)) 

(DEFUN |DisplayPackage| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G152)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|DisplayPackage|)
                . #2=(|DisplayPackage|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|DisplayPackage|
                         (LIST (CONS NIL (CONS 1 (|DisplayPackage;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|DisplayPackage|))))))))))) 

(DEFUN |DisplayPackage;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|DisplayPackage|) . #1=(|DisplayPackage|))
      (LETT $ (GETREFV 32) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|DisplayPackage| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 "%b")
      (QSETREFV $ 7 "%d")
      (QSETREFV $ 8 "%l")
      $)))) 

(MAKEPROP '|DisplayPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL 'HION 'HIOFF 'NEWLINE (|List| 10)
              (|String|) |DISPLAY;bright;SL;1| (0 . |list|)
              |DISPLAY;bright;2L;2| |DISPLAY;newLine;S;3| (|Integer|)
              |DISPLAY;copies;I2S;4| (|List| $) (5 . |concat|)
              |DISPLAY;sayLength;SI;10| (|UniversalSegment| 15) (10 . SEGMENT)
              (16 . |elt|) (|Boolean|) (22 . >) |DISPLAY;center;SI2S;6|
              |DISPLAY;sayLength;LI;11| |DISPLAY;center;LISL;7| (|Void|)
              (28 . |void|) |DISPLAY;say;SV;8| |DISPLAY;say;LV;9|)
           '#(|sayLength| 32 |say| 42 |newLine| 52 |copies| 56 |center| 62
              |bright| 76)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 31
                                                 '(1 9 0 10 12 1 10 0 17 18 2
                                                   20 0 15 15 21 2 10 0 0 20 22
                                                   2 15 23 0 0 24 0 28 0 29 1 0
                                                   15 9 26 1 0 15 10 19 1 0 28
                                                   10 30 1 0 28 9 31 0 0 10 14
                                                   2 0 10 15 10 16 3 0 10 10 15
                                                   10 25 3 0 9 9 15 10 27 1 0 9
                                                   9 13 1 0 9 10 11)))))
           '|lookupComplete|)) 

(MAKEPROP '|DisplayPackage| 'NILADIC T) 
