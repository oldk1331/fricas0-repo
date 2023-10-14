
(/VERSIONCHECK 2) 

(DEFUN |LOOP;loop;L$;1| (|lis| $)
  (PROG (|li| |lx| |minValue| |l2| |l1| #1=#:G140 |x| #2=#:G139)
    (RETURN
     (SEQ
      (LETT |li|
            (PROGN
             (LETT #2# NIL . #3=(|LOOP;loop;L$;1|))
             (SEQ (LETT |x| NIL . #3#) (LETT #1# |lis| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS |x| #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (COND ((NULL |li|) (|error| "cannot form empty loop"))
             ('T
              (SEQ (LETT |minValue| (|SPADfirst| |li|) . #3#)
                   (LETT |lx| NIL . #3#) (LETT |l1| |li| . #3#)
                   (LETT |l2| |lx| . #3#)
                   (SEQ G190
                        (COND
                         ((NULL (COND ((NULL |li|) 'NIL) ('T 'T))) (GO G191)))
                        (SEQ
                         (COND
                          ((< (|SPADfirst| |li|) |minValue|)
                           (SEQ (LETT |l1| |li| . #3#) (LETT |l2| |lx| . #3#)
                                (EXIT
                                 (LETT |minValue| (|SPADfirst| |li|) . #3#)))))
                         (LETT |lx| (CONS (|SPADfirst| |li|) |lx|) . #3#)
                         (EXIT (LETT |li| (CDR |li|) . #3#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (SPADCALL (SPADCALL |l1| (REVERSE |l2|) (QREFELT $ 8))
                              (QREFELT $ 9))))))))))) 

(DEFUN |LOOP;entries;$L;2| (|lp| $) (SPADCALL |lp| (QREFELT $ 12))) 

(PUT '|LOOP;hash;$Si;3| '|SPADreplace| '(XLAM (|s|) 0)) 

(DEFUN |LOOP;hash;$Si;3| (|s| $) 0) 

(DEFUN |LOOP;latex;$S;4| (|lp| $)
  (PROG (|res| |x| #1=#:G147 |i|)
    (RETURN
     (SEQ (LETT |res| "" . #2=(|LOOP;latex;$S;4|))
          (SEQ (LETT |i| 1 . #2#)
               (LETT #1# (SPADCALL |lp| (QREFELT $ 17)) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |x| (QAREF1 |lp| (- |i| 1)) . #2#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL (LIST |res| "->" (STRINGIMAGE |x|))
                                     (QREFELT $ 20))
                           . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (LIST "[" |res| "]") (QREFELT $ 20))))))) 

(DEFUN |LOOP;=;2$B;5| (|x| |y| $)
  (PROG (#1=#:G152 #2=#:G153 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 17)) (SPADCALL |y| (QREFELT $ 17))
                    (QREFELT $ 23))
          (PROGN (LETT #1# 'NIL . #3=(|LOOP;=;2$B;5|)) (GO #1#))))
        (SEQ (LETT |i| 1 . #3#) (LETT #2# (SPADCALL |x| (QREFELT $ 17)) . #3#)
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

(DEFUN |LOOP;~=;2$B;6| (|x| |y| $)
  (COND ((SPADCALL |x| |y| (QREFELT $ 24)) 'NIL) ('T 'T))) 

(DEFUN |LOOP;coerce;$Of;7| (|lp| $)
  (PROG (|res| |x| #1=#:G159 |i|)
    (RETURN
     (SEQ (LETT |res| (SPADCALL (QREFELT $ 27)) . #2=(|LOOP;coerce;$Of;7|))
          (SEQ (LETT |i| 1 . #2#)
               (LETT #1# (SPADCALL |lp| (QREFELT $ 17)) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |x| (QAREF1 |lp| (- |i| 1)) . #2#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (LIST |res| (SPADCALL '-> (QREFELT $ 29))
                                  (SPADCALL |x| (QREFELT $ 30)))
                            (QREFELT $ 31))
                           . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (LIST (SPADCALL '[ (QREFELT $ 29)) |res|
                  (SPADCALL '] (QREFELT $ 29)))
            (QREFELT $ 31))))))) 

(DEFUN |Loop| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G161)
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
      (LETT $ (GETREFV 34) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Loop| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 (|PrimitiveArray| (|NonNegativeInteger|)))
      $)))) 

(MAKEPROP '|Loop| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 16) (0 . |concat|)
              (6 . |construct|) |LOOP;loop;L$;1| (|PrimitiveArray| 16)
              (11 . |entries|) |LOOP;entries;$L;2| (|SingleInteger|)
              |LOOP;hash;$Si;3| (|NonNegativeInteger|) (16 . |#|) (|List| $)
              (|String|) (21 . |concat|) |LOOP;latex;$S;4| (|Boolean|)
              (26 . ~=) |LOOP;=;2$B;5| |LOOP;~=;2$B;6| (|OutputForm|)
              (32 . |empty|) (|Symbol|) (36 . |outputForm|) (41 . |coerce|)
              (46 . |hconcat|) |LOOP;coerce;$Of;7| (|HashState|))
           '#(~= 51 |loop| 57 |latex| 62 |hashUpdate!| 67 |hash| 73 |entries|
              78 |coerce| 83 = 88)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 26))
                        (|makeByteWordVec2| 33
                                            '(2 7 0 0 0 8 1 6 0 7 9 1 11 7 0 12
                                              1 6 16 0 17 1 19 0 18 20 2 16 22
                                              0 0 23 0 26 0 27 1 26 0 28 29 1
                                              16 26 0 30 1 26 0 18 31 2 0 22 0
                                              0 25 1 0 0 7 10 1 0 19 0 21 2 0
                                              33 33 0 1 1 0 14 0 15 1 0 7 0 13
                                              1 0 26 0 32 2 0 22 0 0 24)))))
           '|lookupComplete|)) 

(MAKEPROP '|Loop| 'NILADIC T) 
