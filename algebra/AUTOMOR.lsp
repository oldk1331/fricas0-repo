
(/VERSIONCHECK 2) 

(DEFUN |AUTOMOR;One;$;1| ($) (CONS (|function| |AUTOMOR;ident|) $)) 

(PUT '|AUTOMOR;err| '|SPADreplace|
     '(XLAM (|r|) (|error| "Morphism is not invertible"))) 

(DEFUN |AUTOMOR;err| (|r| $) (|error| "Morphism is not invertible")) 

(PUT '|AUTOMOR;ident| '|SPADreplace| '(XLAM (|r| |n|) |r|)) 

(DEFUN |AUTOMOR;ident| (|r| |n| $) |r|) 

(PUT '|AUTOMOR;=;2$B;4| '|SPADreplace| 'EQ) 

(DEFUN |AUTOMOR;=;2$B;4| (|f| |g| $) (EQ |f| |g|)) 

(DEFUN |AUTOMOR;elt;$2R;5| (|f| |r| $) (|AUTOMOR;apply| |f| |r| 1 $)) 

(DEFUN |AUTOMOR;inv;2$;6| (|f| $)
  (PROG () (RETURN (CONS #'|AUTOMOR;inv;2$;6!0| (VECTOR $ |f|))))) 

(DEFUN |AUTOMOR;inv;2$;6!0| (|r1| |i2| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|AUTOMOR;inv;2$;6|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (|AUTOMOR;apply| |f| |r1| (SPADCALL |i2| (QREFELT $ 13)) $))))) 

(DEFUN |AUTOMOR;^;$I$;7| (|f| |n| $)
  (PROG () (RETURN (CONS #'|AUTOMOR;^;$I$;7!0| (VECTOR $ |n| |f|))))) 

(DEFUN |AUTOMOR;^;$I$;7!0| (|r1| |i2| $$)
  (PROG (|f| |n| $)
    (LETT |f| (QREFELT $$ 2) . #1=(|AUTOMOR;^;$I$;7|))
    (LETT |n| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (|AUTOMOR;apply| |f| |r1| (SPADCALL |n| |i2| (QREFELT $ 15)) $))))) 

(DEFUN |AUTOMOR;coerce;$Of;8| (|f| $) (SPADCALL "R -> R" (QREFELT $ 19))) 

(PUT '|AUTOMOR;morphism;M$;9| '|SPADreplace| '(XLAM (|f|) |f|)) 

(DEFUN |AUTOMOR;morphism;M$;9| (|f| $) |f|) 

(DEFUN |AUTOMOR;morphism;M$;10| (|f| $)
  (SPADCALL |f| (CONS (|function| |AUTOMOR;err|) $) (QREFELT $ 24))) 

(DEFUN |AUTOMOR;morphism;2M$;11| (|f| |g| $)
  (PROG () (RETURN (CONS #'|AUTOMOR;morphism;2M$;11!0| (VECTOR $ |g| |f|))))) 

(DEFUN |AUTOMOR;morphism;2M$;11!0| (|r1| |i2| $$)
  (PROG (|f| |g| $)
    (LETT |f| (QREFELT $$ 2) . #1=(|AUTOMOR;morphism;2M$;11|))
    (LETT |g| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|AUTOMOR;iterat| |f| |g| |i2| |r1| $))))) 

(DEFUN |AUTOMOR;apply| (|f| |r| |n| $)
  (PROG (|g|)
    (RETURN
     (SEQ (LETT |g| |f| |AUTOMOR;apply|) (EXIT (SPADCALL |r| |n| |g|)))))) 

(DEFUN |AUTOMOR;iterat| (|f| |g| |n| |r| $)
  (PROG (#1=#:G161 #2=#:G159)
    (RETURN
     (COND
      ((< |n| 0)
       (|AUTOMOR;iter| |g|
        (PROG1 (LETT #2# (- |n|) . #3=(|AUTOMOR;iterat|))
          (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
        |r| $))
      ('T
       (|AUTOMOR;iter| |f|
        (PROG1 (LETT #1# |n| . #3#)
          (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
        |r| $)))))) 

(DEFUN |AUTOMOR;iter| (|f| |n| |r| $)
  (PROG (|i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 1 . #1=(|AUTOMOR;iter|)) G190
           (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (EXIT (LETT |r| (SPADCALL |r| |f|) . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |r|))))) 

(DEFUN |AUTOMOR;*;3$;15| (|f| |g| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |f| |g| (QREFELT $ 10)) (SPADCALL |f| 2 (QREFELT $ 28)))
           ('T (CONS #'|AUTOMOR;*;3$;15!2| (VECTOR |f| |g| $))))))) 

(DEFUN |AUTOMOR;*;3$;15!2| (|r1| |i2| $$)
  (PROG ($ |g| |f|)
    (LETT $ (QREFELT $$ 2) . #1=(|AUTOMOR;*;3$;15|))
    (LETT |g| (QREFELT $$ 1) . #1#)
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (|AUTOMOR;iterat| (CONS #'|AUTOMOR;*;3$;15!0| (VECTOR $ |g| |f|))
          (CONS #'|AUTOMOR;*;3$;15!1| (VECTOR |f| $ |g|)) |i2| |r1| $))))))) 

(DEFUN |AUTOMOR;*;3$;15!1| (|v1| $$)
  (PROG (|g| $ |f|)
    (LETT |g| (QREFELT $$ 2) NIL)
    (LETT $ (QREFELT $$ 1) NIL)
    (LETT |f| (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |g| (QREFELT $ 14))
                (SPADCALL (SPADCALL |f| (QREFELT $ 14)) |v1| (QREFELT $ 11))
                (QREFELT $ 11)))))) 

(DEFUN |AUTOMOR;*;3$;15!0| (|u1| $$)
  (PROG (|f| |g| $)
    (LETT |f| (QREFELT $$ 2) NIL)
    (LETT |g| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN (SPADCALL |f| (SPADCALL |g| |u1| (QREFELT $ 11)) (QREFELT $ 11)))))) 

(DEFUN |Automorphism| (#1=#:G176)
  (PROG ()
    (RETURN
     (PROG (#2=#:G177)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|Automorphism|)
                                           '|domainEqualList|)
                . #3=(|Automorphism|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Automorphism;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|Automorphism|))))))))))) 

(DEFUN |Automorphism;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Automorphism|))
      (LETT |dv$| (LIST '|Automorphism| DV$1) . #1#)
      (LETT $ (GETREFV 33) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Automorphism| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Mapping| |#1| |#1| (|Integer|)))
      $)))) 

(MAKEPROP '|Automorphism| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |AUTOMOR;One;$;1|) $))
              (|Boolean|) |AUTOMOR;=;2$B;4| |AUTOMOR;elt;$2R;5| (|Integer|)
              (0 . -) |AUTOMOR;inv;2$;6| (5 . *) |AUTOMOR;^;$I$;7| (|String|)
              (|OutputForm|) (11 . |message|) |AUTOMOR;coerce;$Of;8|
              (|Mapping| 6 6 12) |AUTOMOR;morphism;M$;9| (|Mapping| 6 6)
              |AUTOMOR;morphism;2M$;11| |AUTOMOR;morphism;M$;10| (16 . |Zero|)
              (|PositiveInteger|) (20 . ^) |AUTOMOR;*;3$;15|
              (|Union| $ '"failed") (|NonNegativeInteger|) (|SingleInteger|))
           '#(~= 26 |sample| 32 |recip| 36 |one?| 41 |morphism| 46 |latex| 62
              |inv| 67 |hash| 72 |elt| 77 |conjugate| 83 |commutator| 89
              |coerce| 95 ^ 100 |One| 118 = 122 / 128 * 134)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|Group&| |Monoid&| |SemiGroup&| |SetCategory&|
                     |BasicType&| NIL NIL NIL)
                  (CONS
                   '#((|Group|) (|Monoid|) (|SemiGroup|) (|SetCategory|)
                      (|BasicType|) (|Eltable| 6 6) (|unitsKnown|)
                      (|CoercibleTo| 18))
                   (|makeByteWordVec2| 32
                                       '(1 12 0 0 13 2 12 0 12 0 15 1 18 0 17
                                         19 0 6 0 26 2 0 0 0 27 28 2 0 9 0 0 1
                                         0 0 0 1 1 0 30 0 1 1 0 9 0 1 2 0 0 23
                                         23 24 1 0 0 21 22 1 0 0 23 25 1 0 17 0
                                         1 1 0 0 0 14 1 0 32 0 1 2 0 6 0 6 11 2
                                         0 0 0 0 1 2 0 0 0 0 1 1 0 18 0 20 2 0
                                         0 0 12 16 2 0 0 0 31 1 2 0 0 0 27 28 0
                                         0 0 8 2 0 9 0 0 10 2 0 0 0 0 1 2 0 0 0
                                         0 29)))))
           '|lookupComplete|)) 
