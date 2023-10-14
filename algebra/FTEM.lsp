
(SDEFUN |FTEM;fortranLiteralLine;SV;1| ((|s| |String|) ($ |Void|))
        (SEQ (PRINTEXP |s| |$fortranOutputStream|)
             (EXIT (TERPRI |$fortranOutputStream|)))) 

(PUT '|FTEM;fortranLiteral;SV;2| '|SPADreplace|
     '(XLAM (|s|) (PRINTEXP |s| |$fortranOutputStream|))) 

(SDEFUN |FTEM;fortranLiteral;SV;2| ((|s| |String|) ($ |Void|))
        (PRINTEXP |s| |$fortranOutputStream|)) 

(PUT '|FTEM;fortranCarriageReturn;V;3| '|SPADreplace|
     '(XLAM NIL (TERPRI |$fortranOutputStream|))) 

(SDEFUN |FTEM;fortranCarriageReturn;V;3| (($ |Void|))
        (TERPRI |$fortranOutputStream|)) 

(SDEFUN |FTEM;writePassiveLine!| ((|line| |String|) ($ |Void|))
        (SPADCALL |line| (QREFELT $ 9))) 

(SDEFUN |FTEM;processTemplate;3Fn;5|
        ((|tp| |FileName|) (|fn| |FileName|) ($ |FileName|))
        (SEQ (SPADCALL |fn| (QREFELT $ 14)) (SPADCALL |tp| (QREFELT $ 15))
             (SPADCALL (QREFELT $ 16)) (EXIT |fn|))) 

(SDEFUN |FTEM;getLine| ((|fp| |TextFile|) ($ |String|))
        (SPROG ((|line| (|String|)))
               (SEQ
                (LETT |line|
                      (SPADCALL (SPADCALL |fp| (QREFELT $ 18)) (QREFELT $ 20))
                      . #1=(|FTEM;getLine|))
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((SPADCALL |line| (QREFELT $ 22)) 'NIL)
                              ('T
                               (|eql_SI|
                                (SPADCALL |line|
                                          (SPADCALL |line| (QREFELT $ 24))
                                          (QREFELT $ 26))
                                (|STR_to_CHAR| "_")))))
                       (GO G191)))
                     (SEQ
                      (SPADCALL |line| (SPADCALL |line| (QREFELT $ 24))
                                (|STR_to_CHAR| " ") (QREFELT $ 27))
                      (EXIT
                       (LETT |line|
                             (STRCONC |line|
                                      (SPADCALL (SPADCALL |fp| (QREFELT $ 18))
                                                (QREFELT $ 20)))
                             . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |line|)))) 

(SDEFUN |FTEM;processTemplate;2Fn;7| ((|tp| |FileName|) ($ |FileName|))
        (SPROG
         ((|active| (|Boolean|)) (|line| (|String|)) (#1=#:G125 NIL)
          (|endInput| (|Boolean|)) (|fp| (|TextFile|)))
         (SEQ
          (LETT |fp| (SPADCALL |tp| "input" (QREFELT $ 28))
                . #2=(|FTEM;processTemplate;2Fn;7|))
          (LETT |active| 'T . #2#) (LETT |endInput| 'NIL . #2#)
          (SEQ G190
               (COND
                ((NULL
                  (COND ((OR |endInput| (SPADCALL |fp| (QREFELT $ 29))) 'NIL)
                        ('T 'T)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  (|active|
                   (SEQ (LETT |line| (|FTEM;getLine| |fp| $) . #2#)
                        (EXIT
                         (COND
                          ((EQUAL |line| "endInput")
                           (LETT |endInput| 'T . #2#))
                          ((EQUAL |line| "beginVerbatim")
                           (LETT |active| 'NIL . #2#))
                          ('T
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL (SPADCALL |line| (QREFELT $ 22)))
                               (PROGN
                                (LETT #1# (SPADCALL |line| (QREFELT $ 31))
                                      . #2#)
                                (GO #3=#:G119)))))
                            #3# (EXIT #1#)))))))
                  ('T
                   (SEQ (LETT |line| (SPADCALL |fp| (QREFELT $ 18)) . #2#)
                        (EXIT
                         (COND
                          ((EQUAL |line| "endVerbatim")
                           (LETT |active| 'T . #2#))
                          ('T (|FTEM;writePassiveLine!| |line| $)))))))))
               NIL (GO G190) G191 (EXIT NIL))
          (SPADCALL |fp| (QREFELT $ 32))
          (COND
           ((NULL |active|)
            (|error|
             (SPADCALL
              (SPADCALL
               (LIST "Missing `endVerbatim' line in "
                     (SPADCALL |tp| (QREFELT $ 33)))
               (QREFELT $ 35))
              (QREFELT $ 37)))))
          (EXIT (SPADCALL (STRINGIMAGE |$fortranOutputFile|) (QREFELT $ 38)))))) 

(DECLAIM (NOTINLINE |FortranTemplate;|)) 

(DEFUN |FortranTemplate| ()
  (SPROG NIL
         (PROG (#1=#:G127)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FortranTemplate|)
                    . #2=(|FortranTemplate|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FortranTemplate|
                             (LIST (CONS NIL (CONS 1 (|FortranTemplate;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FortranTemplate|)))))))))) 

(DEFUN |FortranTemplate;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FortranTemplate|) . #1=(|FortranTemplate|))
          (LETT $ (GETREFV 41) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FortranTemplate| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|TextFile|))
          $))) 

(MAKEPROP '|FortranTemplate| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|TextFile|) '|Rep| (|Void|) (|String|)
              |FTEM;fortranLiteralLine;SV;1| |FTEM;fortranLiteral;SV;2|
              |FTEM;fortranCarriageReturn;V;3| (|FileName|)
              (|FortranOutputStackPackage|) (0 . |pushFortranOutputStack|)
              |FTEM;processTemplate;2Fn;7| (5 . |popFortranOutputStack|)
              |FTEM;processTemplate;3Fn;5| (9 . |readLine!|)
              (|TemplateUtilities|) (14 . |stripCommentsAndBlanks|) (|Boolean|)
              (19 . |empty?|) (|Integer|) (24 . |maxIndex|) (|Character|)
              (29 . |elt|) (35 . |setelt|) (42 . |open|) (48 . |endOfFile?|)
              (|Any|) (53 . |interpretString|) (58 . |close!|) (63 . |coerce|)
              (|List| $) (68 . |concat|) (|OutputForm|) (73 . |coerce|)
              (78 . |coerce|) (|SingleInteger|) (|HashState|))
           '#(~= 83 |write!| 89 |reopen!| 95 |read!| 101 |processTemplate| 106
              |open| 117 |name| 128 |latex| 133 |iomode| 138 |hashUpdate!| 143
              |hash| 149 |fortranLiteralLine| 154 |fortranLiteral| 159
              |fortranCarriageReturn| 164 |flush| 168 |coerce| 173 |close!| 178
              = 183)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|FileCategory| 12 8) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 36))
                        (|makeByteWordVec2| 40
                                            '(1 13 7 12 14 0 13 7 16 1 6 8 0 18
                                              1 19 8 8 20 1 8 21 0 22 1 8 23 0
                                              24 2 8 25 0 23 26 3 8 25 0 23 25
                                              27 2 5 0 12 8 28 1 6 21 0 29 1 19
                                              30 8 31 1 0 0 0 32 1 12 8 0 33 1
                                              8 0 34 35 1 8 36 0 37 1 12 0 8 38
                                              2 0 21 0 0 1 2 0 8 0 8 1 2 0 0 0
                                              8 1 1 0 8 0 1 2 0 12 12 12 17 1 0
                                              12 12 15 2 0 0 12 8 1 1 0 0 12 1
                                              1 0 12 0 1 1 0 8 0 1 1 0 8 0 1 2
                                              0 40 40 0 1 1 0 39 0 1 1 0 7 8 9
                                              1 0 7 8 10 0 0 7 11 1 0 7 0 1 1 0
                                              36 0 1 1 0 0 0 32 2 0 21 0 0
                                              1)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranTemplate| 'NILADIC T) 
