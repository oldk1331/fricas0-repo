
(PUT '|FNAME;=;2$B;1| '|SPADreplace| 'EQUAL) 

(DEFUN |FNAME;=;2$B;1| (|f1| |f2| $) (EQUAL |f1| |f2|)) 

(DEFUN |FNAME;coerce;$Of;2| (|f| $)
  (SPADCALL (SPADCALL |f| (QREFELT $ 9)) (QREFELT $ 11))) 

(PUT '|FNAME;coerce;$S;3| '|SPADreplace| 'NAMESTRING) 

(DEFUN |FNAME;coerce;$S;3| (|f| $) (NAMESTRING |f|)) 

(PUT '|FNAME;coerce;S$;4| '|SPADreplace| 'PARSE-NAMESTRING) 

(DEFUN |FNAME;coerce;S$;4| (|s| $) (PARSE-NAMESTRING |s|)) 

(PUT '|FNAME;filename;3S$;5| '|SPADreplace| '|fnameMake|) 

(DEFUN |FNAME;filename;3S$;5| (|d| |n| |e| $) (|fnameMake| |d| |n| |e|)) 

(PUT '|FNAME;directory;$S;6| '|SPADreplace| '|fnameDirectory|) 

(DEFUN |FNAME;directory;$S;6| (|f| $) (|fnameDirectory| |f|)) 

(PUT '|FNAME;name;$S;7| '|SPADreplace| '|fnameName|) 

(DEFUN |FNAME;name;$S;7| (|f| $) (|fnameName| |f|)) 

(PUT '|FNAME;extension;$S;8| '|SPADreplace| '|fnameType|) 

(DEFUN |FNAME;extension;$S;8| (|f| $) (|fnameType| |f|)) 

(PUT '|FNAME;exists?;$B;9| '|SPADreplace| '|fnameExists?|) 

(DEFUN |FNAME;exists?;$B;9| (|f| $) (|fnameExists?| |f|)) 

(PUT '|FNAME;readable?;$B;10| '|SPADreplace| '|fnameReadable?|) 

(DEFUN |FNAME;readable?;$B;10| (|f| $) (|fnameReadable?| |f|)) 

(PUT '|FNAME;writable?;$B;11| '|SPADreplace| '|fnameWritable?|) 

(DEFUN |FNAME;writable?;$B;11| (|f| $) (|fnameWritable?| |f|)) 

(PUT '|FNAME;new;3S$;12| '|SPADreplace| '|fnameNew|) 

(DEFUN |FNAME;new;3S$;12| (|d| |pref| |e| $) (|fnameNew| |d| |pref| |e|)) 

(DECLAIM (NOTINLINE |FileName;|)) 

(DEFUN |FileName| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G116)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|FileName|) . #2=(|FileName|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|FileName|
                         (LIST (CONS NIL (CONS 1 (|FileName;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|FileName|))))))))))) 

(DEFUN |FileName;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|FileName|) . #1=(|FileName|))
      (LETT $ (GETREFV 24) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FileName| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FileName| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) |FNAME;=;2$B;1| (|String|)
              |FNAME;coerce;$S;3| (|OutputForm|) (0 . |coerce|)
              |FNAME;coerce;$Of;2| |FNAME;coerce;S$;4| |FNAME;filename;3S$;5|
              |FNAME;directory;$S;6| |FNAME;name;$S;7| |FNAME;extension;$S;8|
              |FNAME;exists?;$B;9| |FNAME;readable?;$B;10|
              |FNAME;writable?;$B;11| |FNAME;new;3S$;12| (|HashState|)
              (|SingleInteger|))
           '#(~= 5 |writable?| 11 |readable?| 16 |new| 21 |name| 28 |latex| 33
              |hashUpdate!| 38 |hash| 44 |filename| 49 |extension| 56 |exists?|
              61 |directory| 66 |coerce| 71 = 86)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|FileNameCategory|) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 10))
                        (|makeByteWordVec2| 23
                                            '(1 8 10 0 11 2 0 6 0 0 1 1 0 6 0
                                              20 1 0 6 0 19 3 0 0 8 8 8 21 1 0
                                              8 0 16 1 0 8 0 1 2 0 22 22 0 1 1
                                              0 23 0 1 3 0 0 8 8 8 14 1 0 8 0
                                              17 1 0 6 0 18 1 0 8 0 15 1 0 0 8
                                              13 1 0 8 0 9 1 0 10 0 12 2 0 6 0
                                              0 7)))))
           '|lookupComplete|)) 

(MAKEPROP '|FileName| 'NILADIC T) 
