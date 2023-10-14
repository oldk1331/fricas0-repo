
(/VERSIONCHECK 2) 

(PUT '|PALETTE;dark;C$;1| '|SPADreplace| '(XLAM (|c|) (CONS 1 |c|))) 

(DEFUN |PALETTE;dark;C$;1| (|c| $) (CONS 1 |c|)) 

(PUT '|PALETTE;dim;C$;2| '|SPADreplace| '(XLAM (|c|) (CONS 2 |c|))) 

(DEFUN |PALETTE;dim;C$;2| (|c| $) (CONS 2 |c|)) 

(PUT '|PALETTE;bright;C$;3| '|SPADreplace| '(XLAM (|c|) (CONS 3 |c|))) 

(DEFUN |PALETTE;bright;C$;3| (|c| $) (CONS 3 |c|)) 

(PUT '|PALETTE;pastel;C$;4| '|SPADreplace| '(XLAM (|c|) (CONS 4 |c|))) 

(DEFUN |PALETTE;pastel;C$;4| (|c| $) (CONS 4 |c|)) 

(PUT '|PALETTE;light;C$;5| '|SPADreplace| '(XLAM (|c|) (CONS 5 |c|))) 

(DEFUN |PALETTE;light;C$;5| (|c| $) (CONS 5 |c|)) 

(PUT '|PALETTE;hue;$C;6| '|SPADreplace| 'QCDR) 

(DEFUN |PALETTE;hue;$C;6| (|p| $) (QCDR |p|)) 

(PUT '|PALETTE;shade;$I;7| '|SPADreplace| 'QCAR) 

(DEFUN |PALETTE;shade;$I;7| (|p| $) (QCAR |p|)) 

(DEFUN |PALETTE;coerce;C$;8| (|c| $) (SPADCALL |c| (QREFELT $ 10))) 

(DEFUN |PALETTE;coerce;$Of;9| (|p| $)
  (SPADCALL
   (LIST "[" (SPADCALL (QCDR |p|) (QREFELT $ 18)) "] from the "
         (SPADCALL (LIST "Dark" "Dim" "Bright" "Pastel" "Light") (QCAR |p|)
                   (QREFELT $ 20))
         " palette")
   (QREFELT $ 22))) 

(DECLAIM (NOTINLINE |Palette;|)) 

(DEFUN |Palette| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G116)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|Palette|) . #2=(|Palette|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|Palette|
                         (LIST (CONS NIL (CONS 1 (|Palette;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Palette|))))))))))) 

(DEFUN |Palette;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Palette|) . #1=(|Palette|))
      (LETT $ (GETREFV 28) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Palette| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |shadeField| (|Integer|))
                          (|:| |hueField| (|Color|))))
      $)))) 

(MAKEPROP '|Palette| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Color|) |PALETTE;dark;C$;1|
              |PALETTE;dim;C$;2| |PALETTE;bright;C$;3| |PALETTE;pastel;C$;4|
              |PALETTE;light;C$;5| |PALETTE;hue;$C;6| (|Integer|)
              |PALETTE;shade;$I;7| |PALETTE;coerce;C$;8| (|OutputForm|)
              (0 . |coerce|) (|List| 17) (5 . |elt|) (|List| $)
              (11 . |hconcat|) |PALETTE;coerce;$Of;9| (|HashState|) (|String|)
              (|SingleInteger|) (|Boolean|))
           '#(~= 16 |shade| 22 |pastel| 27 |light| 32 |latex| 37 |hue| 42
              |hashUpdate!| 47 |hash| 53 |dim| 58 |dark| 63 |coerce| 68
              |bright| 78 = 83)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 17))
                        (|makeByteWordVec2| 27
                                            '(1 7 17 0 18 2 19 17 0 14 20 1 17
                                              0 21 22 2 0 27 0 0 1 1 0 14 0 15
                                              1 0 0 7 11 1 0 0 7 12 1 0 25 0 1
                                              1 0 7 0 13 2 0 24 24 0 1 1 0 26 0
                                              1 1 0 0 7 9 1 0 0 7 8 1 0 0 7 16
                                              1 0 17 0 23 1 0 0 7 10 2 0 27 0 0
                                              1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Palette| 'NILADIC T) 
