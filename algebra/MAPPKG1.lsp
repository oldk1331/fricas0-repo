
(DEFUN |MAPPKG1;nullary;AM;1| (|a| $) (CONS #'|MAPPKG1;nullary;AM;1!0| |a|)) 

(DEFUN |MAPPKG1;nullary;AM;1!0| (|a|) |a|) 

(DEFUN |MAPPKG1;coerce;AM;2| (|a| $) (SPADCALL |a| (QREFELT $ 8))) 

(PUT '|MAPPKG1;id;2A;3| '|SPADreplace| '(XLAM (|a|) |a|)) 

(DEFUN |MAPPKG1;id;2A;3| (|a| $) |a|) 

(DEFUN |MAPPKG1;^;MNniM;4| (|g| |n| $)
  (PROG () (RETURN (CONS #'|MAPPKG1;^;MNniM;4!0| (VECTOR $ |n| |g|))))) 

(DEFUN |MAPPKG1;^;MNniM;4!0| (|a1| $$)
  (PROG (|g| |n| $)
    (LETT |g| (QREFELT $$ 2) . #1=(|MAPPKG1;^;MNniM;4|))
    (LETT |n| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |g| |n| |a1| (QREFELT $ 14)))))) 

(DEFUN |MAPPKG1;recur;2M;5| (|fnaa| $)
  (PROG () (RETURN (CONS #'|MAPPKG1;recur;2M;5!0| (VECTOR $ |fnaa|))))) 

(DEFUN |MAPPKG1;recur;2M;5!0| (|n1| |a2| $$)
  (PROG (|fnaa| $)
    (LETT |fnaa| (QREFELT $$ 1) . #1=(|MAPPKG1;recur;2M;5|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |fnaa| |n1| |a2| (QREFELT $ 17)))))) 

(DECLAIM (NOTINLINE |MappingPackage1;|)) 

(DEFUN |MappingPackage1| (#1=#:G115)
  (PROG ()
    (RETURN
     (PROG (#2=#:G116)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|MappingPackage1|)
                                           '|domainEqualList|)
                . #3=(|MappingPackage1|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|MappingPackage1;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|MappingPackage1|))))))))))) 

(DEFUN |MappingPackage1;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MappingPackage1|))
      (LETT |dv$| (LIST '|MappingPackage1| DV$1) . #1#)
      (LETT $ (GETREFV 19) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MappingPackage1| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MappingPackage1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Mapping| 6)
              |MAPPKG1;nullary;AM;1| |MAPPKG1;coerce;AM;2| |MAPPKG1;id;2A;3|
              (|Mapping| 6 6) (|NonNegativeInteger|)
              (|MappingPackageInternalHacks1| 6) (0 . |iter|)
              |MAPPKG1;^;MNniM;4| (|Mapping| 6 12 6) (7 . |recur|)
              |MAPPKG1;recur;2M;5|)
           '#(|recur| 14 |nullary| 19 |id| 24 |coerce| 29 ^ 34) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 18
                                                 '(3 13 6 11 12 6 14 3 13 6 16
                                                   12 6 17 1 0 16 16 18 1 0 7 6
                                                   8 1 0 6 6 10 1 0 7 6 9 2 0
                                                   11 11 12 15)))))
           '|lookupComplete|)) 
