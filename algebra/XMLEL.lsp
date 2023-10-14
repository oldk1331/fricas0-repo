
(PUT '|XMLEL;xmlElement;SLL$;1| '|SPADreplace|
     '(XLAM (|name| |elements| |attributes|)
       (VECTOR |name| |elements| |attributes| ""))) 

(DEFUN |XMLEL;xmlElement;SLL$;1| (|name| |elements| |attributes| $)
  (VECTOR |name| |elements| |attributes| "")) 

(PUT '|XMLEL;xmlElement;2SL$;2| '|SPADreplace|
     '(XLAM (|name| |txt| |attributes|) (VECTOR |name| NIL |attributes| |txt|))) 

(DEFUN |XMLEL;xmlElement;2SL$;2| (|name| |txt| |attributes| $)
  (VECTOR |name| NIL |attributes| |txt|)) 

(DEFUN |XMLEL;outputStructured| (|rp| $)
  (PROG (|res| #1=#:G123 |el| |atts| #2=#:G122 |s| #3=#:G121)
    (RETURN
     (SEQ
      (LETT |atts|
            (SPADCALL
             (PROGN
              (LETT #3# NIL . #4=(|XMLEL;outputStructured|))
              (SEQ (LETT |s| NIL . #4#) (LETT #2# (QVELT |rp| 2) . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #3# (CONS (SPADCALL |s| (QREFELT $ 13)) #3#)
                           . #4#)))
                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                   (EXIT (NREVERSE #3#))))
             (QREFELT $ 14))
            . #4#)
      (EXIT
       (COND
        ((< (SPADCALL (QVELT |rp| 1) (QREFELT $ 17)) 1)
         (LIST
          (SPADCALL (LIST "<" (QVELT |rp| 0) |atts| " />") (QREFELT $ 14))))
        ('T
         (SEQ
          (LETT |res|
                (LIST
                 (SPADCALL (LIST "<" (QVELT |rp| 0) |atts| ">")
                           (QREFELT $ 14)))
                . #4#)
          (SEQ (LETT |el| NIL . #4#) (LETT #1# (QVELT |rp| 1) . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res| (SPADCALL |el| (QREFELT $ 19))
                                 (QREFELT $ 20))
                       . #4#)))
               (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |res|
                     (SPADCALL (LIST "</" (QVELT |rp| 0) ">") (QREFELT $ 14))
                     (QREFELT $ 21))))))))))) 

(DEFUN |XMLEL;outputUnstructured| (|rp| $)
  (PROG (|res| |atts| #1=#:G128 |s| #2=#:G127)
    (RETURN
     (SEQ
      (LETT |atts|
            (SPADCALL
             (PROGN
              (LETT #2# NIL . #3=(|XMLEL;outputUnstructured|))
              (SEQ (LETT |s| NIL . #3#) (LETT #1# (QVELT |rp| 2) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 13)) #2#)
                           . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             (QREFELT $ 14))
            . #3#)
      (LETT |res|
            (LIST
             (SPADCALL (LIST "<" (QVELT |rp| 0) |atts| ">") (QREFELT $ 14)))
            . #3#)
      (LETT |res| (SPADCALL |res| (QVELT |rp| 3) (QREFELT $ 21)) . #3#)
      (EXIT
       (SPADCALL |res| (SPADCALL (LIST "</" (QVELT |rp| 0) ">") (QREFELT $ 14))
                 (QREFELT $ 21))))))) 

(DEFUN |XMLEL;coerce;$L;5| (|rp| $)
  (COND ((EQUAL (QVELT |rp| 3) "") (|XMLEL;outputStructured| |rp| $))
        ('T (|XMLEL;outputUnstructured| |rp| $)))) 

(DEFUN |XMLEL;empty?;$B;6| (|el| $)
  (COND ((EQUAL (QVELT |el| 0) "") 'T) ('T 'NIL))) 

(DEFUN |XMLEL;outputVRML;$TfV;7| (|rp| |f1| $)
  (PROG (#1=#:G152 |el| #2=#:G151 |att| #3=#:G149 #4=#:G150)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((OR (EQUAL (QVELT |rp| 0) "X3D") (EQUAL (QVELT |rp| 0) "Scene"))
          (SEQ
           (SEQ (LETT |el| NIL . #5=(|XMLEL;outputVRML;$TfV;7|))
                (LETT #4# (QVELT |rp| 1) . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |el| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ (EXIT (SPADCALL |el| |f1| (QREFELT $ 26))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (EXIT (PROGN (LETT #3# (|Void|) . #5#) (GO #3#))))))
        (SPADCALL |f1| (STRCONC (QVELT |rp| 0) "{") (QREFELT $ 27))
        (COND
         ((EQUAL (QVELT |rp| 0) "Shape")
          (SPADCALL |f1| "geometry" (QREFELT $ 27))))
        (SEQ (LETT |att| NIL . #5#) (LETT #2# (QVELT |rp| 2) . #5#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |att| (CAR #2#) . #5#) NIL))
               (GO G191)))
             (SEQ (EXIT (SPADCALL |att| |f1| (QREFELT $ 28))))
             (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
        (COND
         ((SPADCALL (SPADCALL (QVELT |rp| 1) (QREFELT $ 17)) 0 (QREFELT $ 29))
          (SEQ
           (COND
            ((EQUAL (QVELT |rp| 0) "Transform")
             (SPADCALL |f1| "children[" (QREFELT $ 27))))
           (SEQ (LETT |el| NIL . #5#) (LETT #1# (QVELT |rp| 1) . #5#) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#) . #5#) NIL))
                  (GO G191)))
                (SEQ (EXIT (SPADCALL |el| |f1| (QREFELT $ 26))))
                (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
           (EXIT
            (COND
             ((EQUAL (QVELT |rp| 0) "Transform")
              (SPADCALL |f1| "]" (QREFELT $ 27))))))))
        (SPADCALL |f1| "}" (QREFELT $ 27)) (EXIT (|Void|))))
      #3# (EXIT #3#))))) 

(DECLAIM (NOTINLINE |XmlElement;|)) 

(DEFUN |XmlElement| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G154)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|XmlElement|)
                . #2=(|XmlElement|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|XmlElement|
                         (LIST (CONS NIL (CONS 1 (|XmlElement;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|XmlElement|))))))))))) 

(DEFUN |XmlElement;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|XmlElement|) . #1=(|XmlElement|))
      (LETT $ (GETREFV 30) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|XmlElement| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |n| (|String|)) (|:| |e| (|List| $))
                          (|:| |a| (|List| (|XmlAttribute|)))
                          (|:| |content| (|String|))))
      $)))) 

(MAKEPROP '|XmlElement| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|String|) (|List| $) (|List| 12)
              |XMLEL;xmlElement;SLL$;1| |XMLEL;xmlElement;2SL$;2|
              (|XmlAttribute|) (0 . |coerce|) (5 . |concat|)
              (|NonNegativeInteger|) (|List| $$) (10 . |#|) (|List| 7)
              |XMLEL;coerce;$L;5| (15 . |concat|) (21 . |concat|) (|Boolean|)
              |XMLEL;empty?;$B;6| (|Void|) (|TextFile|)
              |XMLEL;outputVRML;$TfV;7| (27 . |writeLine!|) (33 . |outputVRML|)
              (39 . >))
           '#(|xmlElement| 45 |outputVRML| 59 |empty?| 65 |coerce| 70) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 29
                                                 '(1 12 7 0 13 1 7 0 8 14 1 16
                                                   15 0 17 2 18 0 0 0 20 2 18 0
                                                   0 7 21 2 25 7 0 7 27 2 12 24
                                                   0 25 28 2 15 22 0 0 29 3 0 0
                                                   7 7 9 11 3 0 0 7 8 9 10 2 0
                                                   24 0 25 26 1 0 22 0 23 1 0
                                                   18 0 19)))))
           '|lookupComplete|)) 

(MAKEPROP '|XmlElement| 'NILADIC T) 
