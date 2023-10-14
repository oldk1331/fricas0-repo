
(/VERSIONCHECK 2) 

(DEFUN |BINFILE;defstream| (|fn| |mode| $)
  (COND
   ((EQUAL |mode| "input")
    (COND
     ((NULL (SPADCALL |fn| (QREFELT $ 9)))
      (|error| (LIST "File is not readable" (SPADCALL |fn| (QREFELT $ 11)))))
     (#1='T (BINARY_OPEN_INPUT (SPADCALL |fn| (QREFELT $ 13))))))
   ((EQUAL |mode| "output")
    (COND
     ((NULL (SPADCALL |fn| (QREFELT $ 14)))
      (|error| (LIST "File is not writable" (SPADCALL |fn| (QREFELT $ 11)))))
     (#1# (BINARY_OPEN_OUTPUT (SPADCALL |fn| (QREFELT $ 13))))))
   ('T
    (|error|
     (LIST "IO mode must be input or output"
           (SPADCALL |mode| (QREFELT $ 15))))))) 

(DEFUN |BINFILE;open;FnS$;2| (|fname| |mode| $)
  (PROG (|fstream|)
    (RETURN
     (SEQ
      (LETT |fstream| (|BINFILE;defstream| |fname| |mode| $)
            |BINFILE;open;FnS$;2|)
      (EXIT (VECTOR |fname| |fstream| |mode|)))))) 

(DEFUN |BINFILE;reopen!;$S$;3| (|f| |mode| $)
  (PROG (|fname|)
    (RETURN
     (SEQ (LETT |fname| (QVELT |f| 0) |BINFILE;reopen!;$S$;3|)
          (QSETVELT |f| 1 (|BINFILE;defstream| |fname| |mode| $))
          (QSETVELT |f| 2 |mode|) (EXIT |f|))))) 

(DEFUN |BINFILE;close!;2$;4| (|f| $)
  (SEQ
   (COND
    ((EQUAL (QVELT |f| 2) "output") (SEQ (BINARY_CLOSE_OUTPUT) (EXIT |f|)))
    ((EQUAL (QVELT |f| 2) "input") (SEQ (BINARY_CLOSE_INPUT) (EXIT |f|)))
    ('T (|error| "file must be in read or write state"))))) 

(DEFUN |BINFILE;read!;$Si;5| (|f| $)
  (SEQ
   (COND
    ((SPADCALL (QVELT |f| 2) "input" (QREFELT $ 19))
     (|error| "File not in read state"))
    ('T (SEQ (BINARY_SELECT_INPUT (QVELT |f| 1)) (EXIT (BINARY_READBYTE))))))) 

(DEFUN |BINFILE;readIfCan!;$U;6| (|f| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (QVELT |f| 2) "input" (QREFELT $ 19))
        (|error| "File not in read state"))
       (#1='T
        (SEQ (BINARY_SELECT_INPUT (QVELT |f| 1))
             (LETT |n| (BINARY_READBYTE) |BINFILE;readIfCan!;$U;6|)
             (EXIT
              (COND ((|eql_SI| |n| -1) (CONS 1 "failed"))
                    (#1# (CONS 0 |n|))))))))))) 

(DEFUN |BINFILE;write!;$2Si;7| (|f| |x| $)
  (SEQ
   (COND
    ((SPADCALL (QVELT |f| 2) "output" (QREFELT $ 19))
     (|error| "File not in write state"))
    ((OR (|less_SI| |x| 0) (SPADCALL |x| 255 (QREFELT $ 25)))
     (|error| "integer cannot be represented as a byte"))
    ('T (SEQ (BINARY_PRINBYTE |x|) (EXIT |x|)))))) 

(DEFUN |BINFILE;position;$Si;8| (|f| $)
  (COND
   ((SPADCALL (QVELT |f| 2) "input" (QREFELT $ 19))
    (|error| "file must be in read state"))
   ('T (FILE-POSITION (QVELT |f| 1))))) 

(DEFUN |BINFILE;position!;$2Si;9| (|f| |i| $)
  (SEQ
   (COND
    ((SPADCALL (QVELT |f| 2) "input" (QREFELT $ 19))
     (|error| "file must be in read state"))
    ('T (SEQ (FILE-POSITION (QVELT |f| 1) |i|) (EXIT |i|)))))) 

(DECLAIM (NOTINLINE |BinaryFile;|)) 

(DEFUN |BinaryFile| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G157)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|BinaryFile|)
                . #2=(|BinaryFile|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|BinaryFile|
                         (LIST (CONS NIL (CONS 1 (|BinaryFile;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|BinaryFile|))))))))))) 

(DEFUN |BinaryFile;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|BinaryFile|) . #1=(|BinaryFile|))
      (LETT $ (GETREFV 31) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|BinaryFile| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |fileName| (|FileName|))
                          (|:| |fileState| (|SExpression|))
                          (|:| |fileIOmode| (|String|))))
      $)))) 

(MAKEPROP '|BinaryFile| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|File| 20) '|Rep| (|Boolean|) (|FileName|)
              (0 . |readable?|) (|OutputForm|) (5 . |coerce|) (|String|)
              (10 . |coerce|) (15 . |writable?|) (20 . |coerce|)
              |BINFILE;open;FnS$;2| |BINFILE;reopen!;$S$;3|
              |BINFILE;close!;2$;4| (25 . ~=) (|SingleInteger|)
              |BINFILE;read!;$Si;5| (|Union| 20 '"failed")
              |BINFILE;readIfCan!;$U;6| (|Integer|) (31 . >)
              |BINFILE;write!;$2Si;7| |BINFILE;position;$Si;8|
              |BINFILE;position!;$2Si;9| (|Void|) (|HashState|))
           '#(|write!| 37 |reopen!| 43 |readIfCan!| 49 |read!| 54 |position!|
              59 |position| 65 |open| 70 |close!| 76)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|FileCategory| 8 20) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 10))
                        (|makeByteWordVec2| 28
                                            '(1 8 7 0 9 1 8 10 0 11 1 8 12 0 13
                                              1 8 7 0 14 1 12 10 0 15 2 12 7 0
                                              0 19 2 24 7 0 0 25 2 0 20 0 20 26
                                              2 0 0 0 12 17 1 0 22 0 23 1 0 20
                                              0 21 2 0 20 0 20 28 1 0 20 0 27 2
                                              0 0 8 12 16 1 0 0 0 18)))))
           '|lookupIncomplete|)) 

(MAKEPROP '|BinaryFile| 'NILADIC T) 
