
(/VERSIONCHECK 2) 

(DEFUN |XMLAT;xmlAttribute;2S$;1| (|name| |value| $)
  (CONS |name| (LIST |value|))) 

(PUT '|XMLAT;xmlAttribute;SL$;2| '|SPADreplace| 'CONS) 

(DEFUN |XMLAT;xmlAttribute;SL$;2| (|name| |values| $) (CONS |name| |values|)) 

(DEFUN |XMLAT;coerce;$S;3| (|rp| $)
  (PROG (|val| #1=#:G111 |vn|)
    (RETURN
     (SEQ (LETT |val| "" . #2=(|XMLAT;coerce;$S;3|))
          (SEQ (LETT |vn| NIL . #2#) (LETT #1# (QCDR |rp|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |vn| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND ((EQUAL |val| "") (LETT |val| |vn| . #2#))
                       ('T
                        (LETT |val|
                              (SPADCALL (LIST |val| " " |vn|) (QREFELT $ 12))
                              . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (LIST " " (QCAR |rp|)
                  (SPADCALL "=" (STR_ELT #3="\" " 0) (QREFELT $ 14))
                  (SPADCALL |val| (STR_ELT #3# 0) (QREFELT $ 14)))
            (QREFELT $ 12))))))) 

(DEFUN |XMLAT;outputVRML;$TfV;4| (|rp| |f1| $)
  (PROG (|val| #1=#:G116 |vn|)
    (RETURN
     (SEQ (LETT |val| "" . #2=(|XMLAT;outputVRML;$TfV;4|))
          (SEQ (LETT |vn| NIL . #2#) (LETT #1# (QCDR |rp|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |vn| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND ((EQUAL |val| "") (LETT |val| |vn| . #2#))
                       ('T
                        (LETT |val|
                              (SPADCALL (LIST |val| "," |vn|) (QREFELT $ 12))
                              . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (SPADCALL |f1| (SPADCALL (LIST (QCAR |rp|) " " |val|) (QREFELT $ 12))
                    (QREFELT $ 17))
          (EXIT (|Void|)))))) 

(DECLAIM (NOTINLINE |XmlAttribute;|)) 

(DEFUN |XmlAttribute| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G118)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|XmlAttribute|)
                . #2=(|XmlAttribute|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|XmlAttribute|
                         (LIST (CONS NIL (CONS 1 (|XmlAttribute;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|XmlAttribute|))))))))))) 

(DEFUN |XmlAttribute;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|XmlAttribute|) . #1=(|XmlAttribute|))
      (LETT $ (GETREFV 20) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|XmlAttribute| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |n| (|String|)) (|:| |v| (|List| (|String|)))))
      $)))) 

(MAKEPROP '|XmlAttribute| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|String|)
              |XMLAT;xmlAttribute;2S$;1| (|List| 7) |XMLAT;xmlAttribute;SL$;2|
              (|List| $) (0 . |concat|) (|Character|) (5 . |concat|)
              |XMLAT;coerce;$S;3| (|TextFile|) (11 . |writeLine!|) (|Void|)
              |XMLAT;outputVRML;$TfV;4|)
           '#(|xmlAttribute| 17 |outputVRML| 29 |coerce| 35) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 19
                                                 '(1 7 0 11 12 2 7 0 0 13 14 2
                                                   16 7 0 7 17 2 0 0 7 9 10 2 0
                                                   0 7 7 8 2 0 18 0 16 19 1 0 7
                                                   0 15)))))
           '|lookupComplete|)) 

(MAKEPROP '|XmlAttribute| 'NILADIC T) 
