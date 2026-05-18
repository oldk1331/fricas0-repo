
(SDEFUN |BASFILE;open;FnS%;1| ((|fn| (|FileName|)) (|mode| (|String|)) (% (%)))
        (SPROG ((|res1| (|None|)))
               (SEQ
                (COND
                 ((EQUAL |mode| "input")
                  (SEQ
                   (LETT |res1| (MAKE_INSTREAM (SPADCALL |fn| (QREFELT % 8))))
                   (EXIT
                    (COND
                     ((NULL |res1|)
                      (|error|
                       (LIST '|mathprint|
                             (LIST 'CONCAT
                                   (SPADCALL "Can not open for input"
                                             (QREFELT % 10))
                                   (SPADCALL |fn| (QREFELT % 11))))))
                     (#1='T |res1|)))))
                 ((EQUAL |mode| "output")
                  (SEQ
                   (LETT |res1| (MAKE_OUTSTREAM (SPADCALL |fn| (QREFELT % 8))))
                   (EXIT
                    (COND
                     ((NULL |res1|)
                      (|error|
                       (LIST '|mathprint|
                             (LIST 'CONCAT
                                   (SPADCALL "Can not open for output"
                                             (QREFELT % 10))
                                   (SPADCALL |fn| (QREFELT % 11))))))
                     (#1# |res1|)))))
                 (#1#
                  (|error|
                   (LIST '|mathprint|
                         (LIST 'CONCAT
                               (SPADCALL "IO mode must be input or output"
                                         (QREFELT % 10))
                               (SPADCALL |mode| (QREFELT % 10)))))))))) 

(MAKEPROP '|BASFILE;close!;%V;2| '|SPADreplace| 'SHUT) 

(SDEFUN |BASFILE;close!;%V;2| ((|f| (%)) (% (|Void|))) (SHUT |f|)) 

(SDEFUN |BASFILE;readIfCan;%U;3| ((|f| (%)) (% (|Union| (|None|) "failed")))
        (SPROG ((|res1| (|None|)))
               (SEQ (LETT |res1| (READ |f| NIL |$eof_marker|))
                    (EXIT
                     (COND ((|eof_marker?| |res1|) (CONS 1 "failed"))
                           ('T (CONS 0 (SPADCALL |res1| (QREFELT % 17))))))))) 

(SDEFUN |BASFILE;read;%N;4| ((|f| (%)) (% (|None|)))
        (SPROG ((|res1| (|None|)))
               (SEQ (LETT |res1| (READ |f| NIL |$eof_marker|))
                    (EXIT
                     (COND ((|eof_marker?| |res1|) (|error| "End of file"))
                           ('T (SPADCALL |res1| (QREFELT % 17)))))))) 

(SDEFUN |BASFILE;write!;%NV;5| ((|f| (%)) (|d| (|None|)) (% (|Void|)))
        (SPROG ((|res1| (|Union| (|None|) "failed")))
               (SEQ
                (LETT |res1| (|trappedSpadEval| (SPADCALL |d| (QREFELT % 21))))
                (EXIT
                 (COND
                  ((QEQCAR |res1| 1)
                   (|error| "The value cannot be saved to a file."))
                  ('T (|write_to_stream| (QCDR |res1|) |f|))))))) 

(MAKEPROP '|BASFILE;flush;%V;6| '|SPADreplace| 'FORCE-OUTPUT) 

(SDEFUN |BASFILE;flush;%V;6| ((|f| (%)) (% (|Void|))) (FORCE-OUTPUT |f|)) 

(DECLAIM (NOTINLINE |BasicFile;|)) 

(DEFUN |BasicFile;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|BasicFile|))
          (LETT % (GETREFV 24))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|BasicFile| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |BasicFile| ()
  (SPROG NIL
         (PROG (#1=#:G25)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|BasicFile|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|BasicFile|
                             (LIST (CONS NIL (CONS 1 (|BasicFile;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|BasicFile|)))))))))) 

(MAKEPROP '|BasicFile| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|FileName|) (0 . |coerce|)
              (|OutputForm|) (5 . |coerce|) (10 . |coerce|)
              |BASFILE;open;FnS%;1| (|Void|) |BASFILE;close!;%V;2| (|None|)
              (|FileSerialization|) (15 . |deserialize|) (|Union| 15 '"failed")
              |BASFILE;readIfCan;%U;3| |BASFILE;read;%N;4| (20 . |serialize|)
              |BASFILE;write!;%NV;5| |BASFILE;flush;%V;6|)
           '#(|write!| 25 |readIfCan| 31 |read| 36 |open| 41 |flush| 47
              |close!| 52)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|open| ($$ (|FileName|) (|String|))) T)
                                   '((|close!| ((|Void|) $$)) T)
                                   '((|read| ((|None|) $$)) T)
                                   '((|readIfCan|
                                      ((|Union| (|None|) "failed") $$))
                                     T)
                                   '((|write!| ((|Void|) $$ (|None|))) T)
                                   '((|flush| ((|Void|) $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 23
                                            '(1 7 6 0 8 1 6 9 0 10 1 7 9 0 11 1
                                              16 15 15 17 1 16 15 15 21 2 0 13
                                              0 15 22 1 0 18 0 19 1 0 15 0 20 2
                                              0 0 7 6 12 1 0 13 0 23 1 0 13 0
                                              14)))))
           '|lookupComplete|)) 
