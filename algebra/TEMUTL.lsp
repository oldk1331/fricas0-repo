
(/VERSIONCHECK 2) 

(DEFUN |TEMUTL;stripC| (|s| |u| $)
  (PROG (|i|)
    (RETURN
     (SEQ (LETT |i| (SPADCALL |u| |s| 1 (QREFELT $ 10)) |TEMUTL;stripC|)
          (EXIT
           (COND ((EQL |i| 0) |s|)
                 ('T
                  (SPADCALL |s| (SPADCALL |i| (QREFELT $ 13))
                            (QREFELT $ 14))))))))) 

(DEFUN |TEMUTL;stripCommentsAndBlanks;2S;2| (|s| $)
  (SPADCALL (|TEMUTL;stripC| (|TEMUTL;stripC| |s| "++" $) "--" $)
            (|STR_to_CHAR| " ") (QREFELT $ 16))) 

(DEFUN |TEMUTL;interpretString;SA;3| (|s| $)
  (SPADCALL (SPADCALL |s| (QREFELT $ 18)) (QREFELT $ 20))) 

(DEFUN |TemplateUtilities| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G132)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|TemplateUtilities|)
                . #2=(|TemplateUtilities|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|TemplateUtilities|
                         (LIST (CONS NIL (CONS 1 (|TemplateUtilities;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|TemplateUtilities|))))))))))) 

(DEFUN |TemplateUtilities;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|TemplateUtilities|) . #1=(|TemplateUtilities|))
      (LETT $ (GETREFV 22) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TemplateUtilities| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TemplateUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|InputForm|) (0 . |One|) (|Integer|)
              (|String|) (4 . |position|) (11 . |Zero|) (|UniversalSegment| 8)
              (15 . SEGMENT) (20 . |delete|) (|Character|) (26 . |trim|)
              |TEMUTL;stripCommentsAndBlanks;2S;2| (32 . |parse|) (|Any|)
              (37 . |interpret|) |TEMUTL;interpretString;SA;3|)
           '#(|stripCommentsAndBlanks| 42 |interpretString| 47) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 21
                                                 '(0 6 0 7 3 9 8 0 0 8 10 0 6 0
                                                   11 1 12 0 8 13 2 9 0 0 12 14
                                                   2 9 0 0 15 16 1 6 0 9 18 1 6
                                                   19 0 20 1 0 9 9 17 1 0 19 9
                                                   21)))))
           '|lookupComplete|)) 

(MAKEPROP '|TemplateUtilities| 'NILADIC T) 
