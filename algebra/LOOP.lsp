
(/VERSIONCHECK 2) 

(DEFUN |LOOP;loop;L$;1| (|li| $)
  (PROG (|lx| |l2| |l1| |minValue|)
    (RETURN
     (SEQ
      (COND ((NULL |li|) (|error| "cannot form empty loop"))
            ('T
             (SEQ (LETT |minValue| (|SPADfirst| |li|) . #1=(|LOOP;loop;L$;1|))
                  (LETT |lx| NIL . #1#) (LETT |l1| |li| . #1#)
                  (LETT |l2| |lx| . #1#)
                  (SEQ G190
                       (COND
                        ((NULL (COND ((NULL |li|) 'NIL) ('T 'T))) (GO G191)))
                       (SEQ
                        (COND
                         ((< (|SPADfirst| |li|) |minValue|)
                          (SEQ (LETT |l1| |li| . #1#)
                               (EXIT (LETT |l2| |lx| . #1#)))))
                        (LETT |lx| (CONS (|SPADfirst| |li|) |lx|) . #1#)
                        (EXIT (LETT |li| (CDR |li|) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL (SPADCALL |l1| (NREVERSE |l2|) (QREFELT $ 8))
                             (QREFELT $ 9)))))))))) 

(DEFUN |LOOP;entries;$L;2| (|lp| $) (SPADCALL |lp| (QREFELT $ 12))) 

(DEFUN |LOOP;toString| (|lp| $)
  (PROG (|res| |x| #1=#:G143 |i|)
    (RETURN
     (SEQ (LETT |res| "" . #2=(|LOOP;toString|))
          (SEQ (LETT |i| 1 . #2#)
               (LETT #1# (SPADCALL |lp| (QREFELT $ 15)) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |x| (QAREF1 |lp| (- |i| 1)) . #2#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (LIST |res| "->" (|mathObject2String| |x|))
                            (QREFELT $ 18))
                           . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (LIST "[" |res| "]") (QREFELT $ 18))))))) 

(PUT '|LOOP;hash;$Si;4| '|SPADreplace| '(XLAM (|s|) 0)) 

(DEFUN |LOOP;hash;$Si;4| (|s| $) 0) 

(PUT '|LOOP;latex;$S;5| '|SPADreplace|
     '(XLAM (|s|) "\\mbox{\\bf Unimplemented}")) 

(DEFUN |LOOP;latex;$S;5| (|s| $) "\\mbox{\\bf Unimplemented}") 

(DEFUN |LOOP;=;2$B;6| (|x| |y| $)
  (PROG (#1=#:G150 #2=#:G151 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 15)) (SPADCALL |y| (QREFELT $ 15))
                    (QREFELT $ 23))
          (PROGN (LETT #1# 'NIL . #3=(|LOOP;=;2$B;6|)) (GO #1#))))
        (SEQ (LETT |i| 1 . #3#) (LETT #2# (SPADCALL |x| (QREFELT $ 15)) . #3#)
             G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL (QAREF1 |x| (- |i| 1)) (QAREF1 |y| (- |i| 1))
                           (QREFELT $ 23))
                 (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |LOOP;~=;2$B;7| (|x| |y| $)
  (COND ((SPADCALL |x| |y| (QREFELT $ 24)) 'NIL) ('T 'T))) 

(DEFUN |LOOP;coerce;$Of;8| (|n| $)
  (SPADCALL (|LOOP;toString| |n| $) (QREFELT $ 27))) 

(DEFUN |Loop| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G155)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|Loop|) . #2=(|Loop|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|Loop|
                         (LIST (CONS NIL (CONS 1 (|Loop;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Loop|))))))))))) 

(DEFUN |Loop;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Loop|) . #1=(|Loop|))
      (LETT $ (GETREFV 29) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Loop| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 (|PrimitiveArray| (|NonNegativeInteger|)))
      $)))) 

(MAKEPROP '|Loop| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 14) (0 . |concat|)
              (6 . |construct|) |LOOP;loop;L$;1| (|PrimitiveArray| 14)
              (11 . |entries|) |LOOP;entries;$L;2| (|NonNegativeInteger|)
              (16 . |#|) (|List| $) (|String|) (21 . |concat|)
              (|SingleInteger|) |LOOP;hash;$Si;4| |LOOP;latex;$S;5| (|Boolean|)
              (26 . ~=) |LOOP;=;2$B;6| |LOOP;~=;2$B;7| (|OutputForm|)
              (32 . |coerce|) |LOOP;coerce;$Of;8|)
           '#(~= 37 |loop| 43 |latex| 48 |hash| 53 |entries| 58 |coerce| 63 =
              68)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 26))
                        (|makeByteWordVec2| 28
                                            '(2 7 0 0 0 8 1 6 0 7 9 1 11 7 0 12
                                              1 6 14 0 15 1 17 0 16 18 2 14 22
                                              0 0 23 1 17 26 0 27 2 0 22 0 0 25
                                              1 0 0 7 10 1 0 17 0 21 1 0 19 0
                                              20 1 0 7 0 13 1 0 26 0 28 2 0 22
                                              0 0 24)))))
           '|lookupComplete|)) 

(MAKEPROP '|Loop| 'NILADIC T) 
