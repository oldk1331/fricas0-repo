
(SDEFUN |XMLAT;xmlAttribute;2S$;1| ((|name| |String|) (|value| |String|) ($ $))
        (CONS |name| (LIST |value|))) 

(PUT '|XMLAT;xmlAttribute;SL$;2| '|SPADreplace| 'CONS) 

(SDEFUN |XMLAT;xmlAttribute;SL$;2|
        ((|name| |String|) (|values| |List| (|String|)) ($ $))
        (CONS |name| |values|)) 

(SDEFUN |XMLAT;coerce;$S;3| ((|rp| $) ($ |String|))
        (SPROG ((|val| (|String|)) (#1=#:G112 NIL) (|vn| NIL))
               (SEQ (LETT |val| "")
                    (SEQ (LETT |vn| NIL) (LETT #1# (QCDR |rp|)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |vn| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND ((EQUAL |val| "") (LETT |val| |vn|))
                                 ('T
                                  (LETT |val|
                                        (SPADCALL (LIST |val| " " |vn|)
                                                  (QREFELT $ 12)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL
                      (LIST " " (QCAR |rp|)
                            (SPADCALL "=" (STR_ELT #2="\" " 0) (QREFELT $ 14))
                            (SPADCALL |val| (STR_ELT #2# 0) (QREFELT $ 14)))
                      (QREFELT $ 12)))))) 

(SDEFUN |XMLAT;outputVRML;$TfV;4| ((|rp| $) (|f1| |TextFile|) ($ |Void|))
        (SPROG ((|val| (|String|)) (#1=#:G117 NIL) (|vn| NIL))
               (SEQ (LETT |val| "")
                    (SEQ (LETT |vn| NIL) (LETT #1# (QCDR |rp|)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |vn| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND ((EQUAL |val| "") (LETT |val| |vn|))
                                 ('T
                                  (LETT |val|
                                        (SPADCALL (LIST |val| "," |vn|)
                                                  (QREFELT $ 12)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (SPADCALL |f1|
                              (SPADCALL (LIST (QCAR |rp|) " " |val|)
                                        (QREFELT $ 12))
                              (QREFELT $ 17))
                    (EXIT (|Void|))))) 

(DECLAIM (NOTINLINE |XmlAttribute;|)) 

(DEFUN |XmlAttribute| ()
  (SPROG NIL
         (PROG (#1=#:G119)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|XmlAttribute|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|XmlAttribute|
                             (LIST (CONS NIL (CONS 1 (|XmlAttribute;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|XmlAttribute|)))))))))) 

(DEFUN |XmlAttribute;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|XmlAttribute|))
          (LETT $ (GETREFV 20))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|XmlAttribute| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |n| (|String|))
                              (|:| |v| (|List| (|String|)))))
          $))) 

(MAKEPROP '|XmlAttribute| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|String|)
              |XMLAT;xmlAttribute;2S$;1| (|List| 7) |XMLAT;xmlAttribute;SL$;2|
              (|List| $) (0 . |concat|) (|Character|) (5 . |concat|)
              |XMLAT;coerce;$S;3| (|TextFile|) (11 . |writeLine!|) (|Void|)
              |XMLAT;outputVRML;$TfV;4|)
           '#(|xmlAttribute| 17 |outputVRML| 29 |coerce| 35) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|xmlAttribute| ($$ (|String|) (|String|))) T)
                              '((|xmlAttribute|
                                 ($$ (|String|) (|List| (|String|))))
                                T)
                              '((|coerce| ((|String|) $$)) T)
                              '((|outputVRML| ((|Void|) $$ (|TextFile|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 19
                                            '(1 7 0 11 12 2 7 0 0 13 14 2 16 7
                                              0 7 17 2 0 0 7 9 10 2 0 0 7 7 8 2
                                              0 18 0 16 19 1 0 7 0 15)))))
           '|lookupComplete|)) 

(MAKEPROP '|XmlAttribute| 'NILADIC T) 
