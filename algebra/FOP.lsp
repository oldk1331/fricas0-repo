
(/VERSIONCHECK 2) 

(PUT '|FOP;topFortranOutputStack;S;1| '|SPADreplace|
     '(XLAM NIL (STRINGIMAGE |$fortranOutputFile|))) 

(DEFUN |FOP;topFortranOutputStack;S;1| ($) (STRINGIMAGE |$fortranOutputFile|)) 

(DEFUN |FOP;pushFortranOutputStack;FnV;2| (|fn| $)
  (SEQ
   (COND
    ((SPADCALL (QREFELT $ 8) (QREFELT $ 12))
     (SPADCALL (STRINGIMAGE |$fortranOutputFile|) (QREFELT $ 8)
               (QREFELT $ 13)))
    ((NULL
      (EQUAL (SPADCALL (QREFELT $ 8) (QREFELT $ 14))
             (STRINGIMAGE |$fortranOutputFile|)))
     (SEQ (SPADCALL (QREFELT $ 8) (QREFELT $ 15))
          (EXIT
           (SPADCALL (STRINGIMAGE |$fortranOutputFile|) (QREFELT $ 8)
                     (QREFELT $ 13))))))
   (SPADCALL (SPADCALL |fn| (QREFELT $ 17)) (QREFELT $ 8) (QREFELT $ 13))
   (SPADCALL
    (SPADCALL (LIST "set output fortran quiet " (SPADCALL |fn| (QREFELT $ 17)))
              (QREFELT $ 19))
    (QREFELT $ 22))
   (EXIT (SPADCALL (QREFELT $ 23))))) 

(DEFUN |FOP;pushFortranOutputStack;SV;3| (|fn| $)
  (SEQ
   (COND
    ((SPADCALL (QREFELT $ 8) (QREFELT $ 12))
     (SPADCALL (STRINGIMAGE |$fortranOutputFile|) (QREFELT $ 8)
               (QREFELT $ 13)))
    ((NULL
      (EQUAL (SPADCALL (QREFELT $ 8) (QREFELT $ 14))
             (STRINGIMAGE |$fortranOutputFile|)))
     (SEQ (SPADCALL (QREFELT $ 8) (QREFELT $ 15))
          (EXIT
           (SPADCALL (STRINGIMAGE |$fortranOutputFile|) (QREFELT $ 8)
                     (QREFELT $ 13))))))
   (SPADCALL |fn| (QREFELT $ 8) (QREFELT $ 13))
   (SPADCALL (SPADCALL (LIST "set output fortran quiet " |fn|) (QREFELT $ 19))
             (QREFELT $ 22))
   (EXIT (SPADCALL (QREFELT $ 23))))) 

(DEFUN |FOP;popFortranOutputStack;V;4| ($)
  (SEQ
   (COND
    ((NULL (SPADCALL (QREFELT $ 8) (QREFELT $ 12)))
     (SPADCALL (QREFELT $ 8) (QREFELT $ 15))))
   (COND
    ((SPADCALL (QREFELT $ 8) (QREFELT $ 12))
     (SPADCALL "CONSOLE" (QREFELT $ 8) (QREFELT $ 13))))
   (SPADCALL
    (SPADCALL
     (LIST "set output fortran quiet append "
           (SPADCALL (QREFELT $ 8) (QREFELT $ 14)))
     (QREFELT $ 19))
    (QREFELT $ 22))
   (EXIT (SPADCALL (QREFELT $ 23))))) 

(DEFUN |FOP;clearFortranOutputStack;S;5| ($)
  (SETELT $ 8 (SPADCALL (QREFELT $ 7)))) 

(DEFUN |FOP;showFortranOutputStack;S;6| ($) (QREFELT $ 8)) 

(DECLAIM (NOTINLINE |FortranOutputStackPackage;|)) 

(DEFUN |FortranOutputStackPackage| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G151)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|FortranOutputStackPackage|)
                . #2=(|FortranOutputStackPackage|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|FortranOutputStackPackage|
                         (LIST
                          (CONS NIL (CONS 1 (|FortranOutputStackPackage;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|FortranOutputStackPackage|))))))))))) 

(DEFUN |FortranOutputStackPackage;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|FortranOutputStackPackage|)
            . #1=(|FortranOutputStackPackage|))
      (LETT $ (GETREFV 29) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FortranOutputStackPackage| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (SPADCALL (QREFELT $ 7)))
      $)))) 

(MAKEPROP '|FortranOutputStackPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Stack| 9) (0 . |empty|)
              '|fortranOutputStack| (|String|) |FOP;topFortranOutputStack;S;1|
              (|Boolean|) (4 . |empty?|) (9 . |push!|) (15 . |top|)
              (20 . |pop!|) (|FileName|) (25 . |coerce|) (|List| $)
              (30 . |concat|) (|Void|) (|MoreSystemCommands|)
              (35 . |systemCommand|) (40 . |void|)
              |FOP;pushFortranOutputStack;FnV;2|
              |FOP;pushFortranOutputStack;SV;3| |FOP;popFortranOutputStack;V;4|
              |FOP;clearFortranOutputStack;S;5|
              |FOP;showFortranOutputStack;S;6|)
           '#(|topFortranOutputStack| 44 |showFortranOutputStack| 48
              |pushFortranOutputStack| 52 |popFortranOutputStack| 62
              |clearFortranOutputStack| 66)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(0 6 0 7 1 6 11 0 12 2 6 9 9
                                                   0 13 1 6 9 0 14 1 6 9 0 15 1
                                                   16 9 0 17 1 9 0 18 19 1 21
                                                   20 9 22 0 20 0 23 0 0 9 10 0
                                                   0 6 28 1 0 20 16 24 1 0 20 9
                                                   25 0 0 20 26 0 0 6 27)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranOutputStackPackage| 'NILADIC T) 
