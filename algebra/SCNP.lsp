
(/VERSIONCHECK 2) 

(DEFUN |SCNP;namedPoints;LL$;1| (|ptin| |nmin| $) (CONS 0 (CONS |ptin| |nmin|))) 

(DEFUN |SCNP;namedPoints;LL$;2| (|chin| |nmin| $) (CONS 1 (CONS |chin| |nmin|))) 

(DEFUN |SCNP;isLeaf?;$B;3| (|n| $)
  (PROG (#1=#:G138)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 0) (PROGN (LETT #1# 'T |SCNP;isLeaf?;$B;3|) (GO #1#))))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |SCNP;getNames;$L;4| (|n| $)
  (PROG (#1=#:G142)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 0)
          (PROGN (LETT #1# (QCDR (CDR |n|)) |SCNP;getNames;$L;4|) (GO #1#))))
        (EXIT (QCDR (CDR |n|)))))
      #1# (EXIT #1#))))) 

(DEFUN |SCNP;findPoint;$SPT;5| (|n| |ptName| $)
  (PROG (#1=#:G147 |s| #2=#:G148 |sNum|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 1)
          (PROGN
           (LETT #1# (SPADCALL 0 0 (QREFELT $ 17))
                 . #3=(|SCNP;findPoint;$SPT;5|))
           (GO #1#))))
        (SEQ (LETT |sNum| 1 . #3#) (LETT #2# (LENGTH (QCDR (CDR |n|))) . #3#)
             G190 (COND ((|greater_SI| |sNum| #2#) (GO G191)))
             (SEQ
              (LETT |s| (SPADCALL (QCDR (CDR |n|)) |sNum| (QREFELT $ 19))
                    . #3#)
              (EXIT
               (COND
                ((EQUAL |s| |ptName|)
                 (PROGN
                  (LETT #1# (SPADCALL (QCAR (CDR |n|)) |sNum| (QREFELT $ 20))
                        . #3#)
                  (GO #1#))))))
             (LETT |sNum| (|inc_SI| |sNum|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (SPADCALL 0 0 (QREFELT $ 17)))))
      #1# (EXIT #1#))))) 

(DEFUN |SCNP;toString;$S;6| (|n| $)
  (PROG (|s| #1=#:G160 |l1| #2=#:G159 |ptr| #3=#:G158 |lenPT| |lenNM|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |s| "" . #4=(|SCNP;toString;$S;6|))
            (COND
             ((QEQCAR |n| 0)
              (SEQ (LETT |lenNM| (LENGTH (QCDR (CDR |n|))) . #4#)
                   (LETT |lenPT| (LENGTH (QCAR (CDR |n|))) . #4#)
                   (COND
                    ((SPADCALL |lenNM| |lenPT| (QREFELT $ 23))
                     (PROGN
                      (LETT #3#
                            (SPADCALL
                             (LIST "string number:" (STRINGIMAGE |lenNM|)
                                   " ~= point number:" (STRINGIMAGE |lenPT|))
                             (QREFELT $ 24))
                            . #4#)
                      (GO #3#))))
                   (EXIT
                    (SEQ (LETT |ptr| 1 . #4#)
                         (LETT #2# (LENGTH (QCDR (CDR |n|))) . #4#) G190
                         (COND ((|greater_SI| |ptr| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((EQL |ptr| 1)
                             (LETT |s|
                                   (SPADCALL
                                    (LIST
                                     (SPADCALL (QCDR (CDR |n|)) |ptr|
                                               (QREFELT $ 19))
                                     ":"
                                     (|mathObject2String|
                                      (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                (QREFELT $ 20))))
                                    (QREFELT $ 24))
                                   . #4#))
                            ('T
                             (LETT |s|
                                   (SPADCALL
                                    (LIST |s| ","
                                          (SPADCALL (QCDR (CDR |n|)) |ptr|
                                                    (QREFELT $ 19))
                                          ":"
                                          (|mathObject2String|
                                           (SPADCALL (QCAR (CDR |n|)) |ptr|
                                                     (QREFELT $ 20))))
                                    (QREFELT $ 24))
                                   . #4#)))))
                         (LETT |ptr| (|inc_SI| |ptr|) . #4#) (GO G190) G191
                         (EXIT NIL))))))
            (COND
             ((QEQCAR |n| 1)
              (SEQ (LETT |l1| NIL . #4#) (LETT #1# (QCDR (CDR |n|)) . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |l1| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |s| (SPADCALL (LIST |s| "," |l1|) (QREFELT $ 24))
                           . #4#)))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))))
            (EXIT |s|)))
      #3# (EXIT #3#))))) 

(DEFUN |SCNP;coerce;$Of;7| (|n| $)
  (SPADCALL (SPADCALL |n| (QREFELT $ 25)) (QREFELT $ 27))) 

(DEFUN |SceneNamedPoints| (#1=#:G162)
  (PROG ()
    (RETURN
     (PROG (#2=#:G163)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|SceneNamedPoints|)
                                           '|domainEqualList|)
                . #3=(|SceneNamedPoints|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|SceneNamedPoints;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|SceneNamedPoints|))))))))))) 

(DEFUN |SceneNamedPoints;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SceneNamedPoints|))
      (LETT |dv$| (LIST '|SceneNamedPoints| DV$1) . #1#)
      (LETT $ (GETREFV 29) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SceneNamedPoints| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Union|
                 (|:| |leaf|
                      (|Record| (|:| |listPT| (|List| |#1|))
                                (|:| |listNM| (|List| (|String|)))))
                 (|:| |br|
                      (|Record| (|:| |ch| (|List| $))
                                (|:| |listHNM| (|List| (|String|)))))))
      $)))) 

(MAKEPROP '|SceneNamedPoints| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              (|List| 18) |SCNP;namedPoints;LL$;1| (|List| $)
              |SCNP;namedPoints;LL$;2| (|Boolean|) |SCNP;isLeaf?;$B;3|
              |SCNP;getNames;$L;4| (|Integer|) (0 . |sipnt|) (|String|)
              (6 . |elt|) (12 . |elt|) |SCNP;findPoint;$SPT;5|
              (|NonNegativeInteger|) (18 . ~=) (24 . |concat|)
              |SCNP;toString;$S;6| (|OutputForm|) (29 . |coerce|)
              |SCNP;coerce;$Of;7|)
           '#(|toString| 34 |namedPoints| 39 |isLeaf?| 51 |getNames| 56
              |findPoint| 61 |coerce| 67)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(2 6 0 16 16 17 2 9 18 0 16
                                                   19 2 8 6 0 16 20 2 22 13 0 0
                                                   23 1 18 0 11 24 1 18 26 0 27
                                                   1 0 18 0 25 2 0 0 8 9 10 2 0
                                                   0 11 9 12 1 0 13 0 14 1 0 9
                                                   0 15 2 0 6 0 18 21 1 0 26 0
                                                   28)))))
           '|lookupComplete|)) 
