
(/VERSIONCHECK 2) 

(DEFUN |SORD;Zero;$;1| ($) (|spadConstant| $ 7)) 

(DEFUN |SORD;One;$;2| ($) (|spadConstant| $ 9)) 

(DEFUN |SORD;omega;$;3| ($) (SPADCALL 1 (|spadConstant| $ 10) (QREFELT $ 12))) 

(DEFUN |SORD;omegapower;2$;4| (|p| $) (SPADCALL 1 |p| (QREFELT $ 12))) 

(DEFUN |SORD;zero?;$B;5| (|p| $) (SPADCALL |p| (QREFELT $ 16))) 

(DEFUN |SORD;one?;$B;6| (|p| $)
  (SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 18))) 

(DEFUN |SORD;=;2$B;7| (|p1| |p2| $) (SPADCALL |p1| |p2| (QREFELT $ 18))) 

(DEFUN |SORD;coerce;Nni$;8| (|n| $)
  (SPADCALL |n| (|spadConstant| $ 8) (QREFELT $ 12))) 

(DEFUN |SORD;retractIfCan;$U;9| (|x| $) (SPADCALL |x| (QREFELT $ 23))) 

(DEFUN |SORD;<;2$B;10| (|o1| |o2| $)
  (PROG (|p2| |p1|)
    (RETURN
     (SEQ (LETT |p1| |o1| . #1=(|SORD;<;2$B;10|)) (LETT |p2| |o2| . #1#)
          (EXIT
           (COND
            ((SPADCALL |p1| (QREFELT $ 25))
             (COND
              ((SPADCALL |p2| (QREFELT $ 25))
               (< (SPADCALL |p1| (QREFELT $ 26))
                  (SPADCALL |p2| (QREFELT $ 26))))
              (#2='T 'T)))
            ((SPADCALL |p2| (QREFELT $ 25)) 'NIL)
            (#2# (SPADCALL |p1| |p2| (QREFELT $ 27))))))))) 

(DEFUN |SORD;+;3$;11| (|p1| |p2| $) (SPADCALL |p1| |p2| (QREFELT $ 29))) 

(DEFUN |SORD;*;3$;12| (|p1| |p2| $) (SPADCALL |p1| |p2| (QREFELT $ 31))) 

(DEFUN |SORD;subtractIfCan;2$U;13| (|o1| |o2| $)
  (SPADCALL |o1| |o2| (QREFELT $ 34))) 

(DEFUN |SORD;ordinalAdd;3$;14| (|o1| |o2| $)
  (PROG (|p2| #1=#:G158 |t| |p1| |lt| |e|)
    (RETURN
     (SEQ (LETT |p1| |o1| . #2=(|SORD;ordinalAdd;3$;14|))
          (LETT |p2| |o2| . #2#)
          (LETT |e| (SPADCALL |p2| (QREFELT $ 36)) . #2#)
          (EXIT
           (COND
            ((SPADCALL |e| (|spadConstant| $ 8) (QREFELT $ 20))
             (SPADCALL |p1| |p2| (QREFELT $ 30)))
            ('T
             (SEQ (LETT |lt| NIL . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL |p1| (QREFELT $ 36)) |e|
                                    (QREFELT $ 37)))
                         (GO G191)))
                       (SEQ
                        (LETT |lt| (CONS (SPADCALL |p1| (QREFELT $ 38)) |lt|)
                              . #2#)
                        (EXIT
                         (LETT |p1| (SPADCALL |p1| (QREFELT $ 39)) . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |t| NIL . #2#) (LETT #1# |lt| . #2#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |p2| (SPADCALL |t| |p2| (QREFELT $ 30)) . #2#)))
                       (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT |p2|))))))))) 

(DEFUN |SORD;integerPart;$Nni;15| (|o| $)
  (PROG (|p|)
    (RETURN
     (SEQ (LETT |p| |o| . #1=(|SORD;integerPart;$Nni;15|))
          (SEQ G190
               (COND ((NULL (NOT (SPADCALL |p| (QREFELT $ 25)))) (GO G191)))
               (SEQ (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 39)) . #1#))) NIL
               (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |p| (QREFELT $ 26))))))) 

(DEFUN |SORD;limitPart;2$;16| (|o| $)
  (PROG (#1=#:G163)
    (RETURN
     (PROG2
         (LETT #1#
               (SPADCALL |o|
                         (SPADCALL (SPADCALL |o| (QREFELT $ 41))
                                   (QREFELT $ 21))
                         (QREFELT $ 35))
               |SORD;limitPart;2$;16|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0) $ #1#))))) 

(DEFUN |SORD;ordinalMul;3$;17| (|o1| |o2| $)
  (PROG (|lo| |hi| |e|)
    (RETURN
     (SEQ
      (LETT |e| (SPADCALL |o1| (QREFELT $ 36)) . #1=(|SORD;ordinalMul;3$;17|))
      (LETT |hi|
            (COND
             ((SPADCALL |e| (|spadConstant| $ 8) (QREFELT $ 43))
              (SPADCALL (CONS #'|SORD;ordinalMul;3$;17!0| (VECTOR $ |e|))
                        (SPADCALL |o2| (QREFELT $ 42)) (QREFELT $ 45)))
             ('T (SPADCALL |o2| (QREFELT $ 42))))
            . #1#)
      (LETT |lo| (SPADCALL |o1| (SPADCALL |o2| (QREFELT $ 41)) (QREFELT $ 46))
            . #1#)
      (EXIT (SPADCALL |hi| |lo| (QREFELT $ 30))))))) 

(DEFUN |SORD;ordinalMul;3$;17!0| (|x| $$)
  (PROG (|e| $)
    (LETT |e| (QREFELT $$ 1) . #1=(|SORD;ordinalMul;3$;17|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |e| |x| (QREFELT $ 40)))))) 

(DEFUN |SORD;sub_one| (|o| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |o| (QREFELT $ 25))
        (SEQ (LETT |n| (SPADCALL |o| (QREFELT $ 26)) |SORD;sub_one|)
             (EXIT
              (COND ((EQL |n| 0) (|error| "sub_one applied to zero ordinal"))
                    (#1='T (SPADCALL (- |n| 1) (QREFELT $ 21)))))))
       (#1# |o|)))))) 

(DEFUN |SORD;infinite_power| (|o1| |o2| $)
  (PROG (|e1|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |o1| (|spadConstant| $ 8) (QREFELT $ 20))
        (|spadConstant| $ 8))
       ((SPADCALL |o1| (|spadConstant| $ 10) (QREFELT $ 20))
        (|spadConstant| $ 10))
       (#1='T
        (SEQ (LETT |e1| (SPADCALL |o1| (QREFELT $ 36)) |SORD;infinite_power|)
             (EXIT
              (COND
               ((SPADCALL |e1| (|spadConstant| $ 8) (QREFELT $ 43))
                (SPADCALL (SPADCALL |e1| |o2| (QREFELT $ 47)) (QREFELT $ 14)))
               (#1#
                (SPADCALL
                 (SPADCALL (CONS (|function| |SORD;sub_one|) $) |o2|
                           (QREFELT $ 45))
                 (QREFELT $ 14)))))))))))) 

(DEFUN |SORD;finite_ordinal_power| (|o| |n| $)
  (PROG (|n1| |e|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) (|spadConstant| $ 10)) ((EQL |n| 1) |o|)
            (#1='T
             (SEQ
              (LETT |e| (SPADCALL |o| (QREFELT $ 36))
                    . #2=(|SORD;finite_ordinal_power|))
              (EXIT
               (COND
                ((SPADCALL |e| (|spadConstant| $ 8) (QREFELT $ 20))
                 (SPADCALL (EXPT (SPADCALL |o| (QREFELT $ 48)) |n|)
                           (QREFELT $ 21)))
                (#1#
                 (SEQ (LETT |n1| (- |n| 1) . #2#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |e| |n1| (QREFELT $ 46))
                                  (QREFELT $ 14))
                        |o| (QREFELT $ 47)))))))))))))) 

(DEFUN |SORD;ordinalPower;3$;21| (|o1| |o2| $)
  (SPADCALL (|SORD;infinite_power| |o1| (SPADCALL |o2| (QREFELT $ 42)) $)
            (|SORD;finite_ordinal_power| |o1| (SPADCALL |o2| (QREFELT $ 41)) $)
            (QREFELT $ 47))) 

(DEFUN |SORD;^;3$;22| (|o1| |o2| $)
  (SPADCALL (|SORD;infinite_power| |o1| (SPADCALL |o2| (QREFELT $ 42)) $)
            (SPADCALL |o1| (SPADCALL |o2| (QREFELT $ 41)) (QREFELT $ 50))
            (QREFELT $ 32))) 

(DEFUN |SORD;coerce;$Of;23| (|o| $)
  (PROG (|l| |l1| |mon| |co| |p| |e| |c| |v|)
    (RETURN
     (SEQ (LETT |p| |o| . #1=(|SORD;coerce;$Of;23|))
          (EXIT
           (COND
            ((SPADCALL |p| (QREFELT $ 25))
             (SPADCALL (SPADCALL |p| (QREFELT $ 26)) (QREFELT $ 53)))
            ('T
             (SEQ (LETT |l| NIL . #1#) (LETT |v| "omega" . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |p| (|spadConstant| $ 7) (QREFELT $ 54)))
                         (GO G191)))
                       (SEQ (LETT |c| (SPADCALL |p| (QREFELT $ 55)) . #1#)
                            (LETT |e| (SPADCALL |p| (QREFELT $ 36)) . #1#)
                            (LETT |p| (SPADCALL |p| (QREFELT $ 39)) . #1#)
                            (LETT |co| (SPADCALL |c| (QREFELT $ 53)) . #1#)
                            (LETT |l1|
                                  (COND
                                   ((SPADCALL |e| (|spadConstant| $ 8)
                                              (QREFELT $ 20))
                                    |co|)
                                   ('T
                                    (SEQ
                                     (COND
                                      ((SPADCALL |e| (|spadConstant| $ 10)
                                                 (QREFELT $ 20))
                                       (LETT |mon| |v| . #1#))
                                      ('T
                                       (LETT |mon|
                                             (SPADCALL |v|
                                                       (SPADCALL |e|
                                                                 (QREFELT $
                                                                          56))
                                                       (QREFELT $ 57))
                                             . #1#)))
                                     (EXIT
                                      (COND ((EQL |c| 1) |mon|)
                                            ('T
                                             (SPADCALL |co| |mon|
                                                       (QREFELT $ 58))))))))
                                  . #1#)
                            (EXIT (LETT |l| (CONS |l1| |l|) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |l| (NREVERSE |l|) . #1#)
                  (EXIT (SPADCALL (ELT $ 59) |l| (QREFELT $ 62))))))))))) 

(DEFUN |SmallOrdinal| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G189)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|SmallOrdinal|)
                . #2=(|SmallOrdinal|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|SmallOrdinal|
                         (LIST (CONS NIL (CONS 1 (|SmallOrdinal;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|SmallOrdinal|))))))))))) 

(DEFUN |SmallOrdinal;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|SmallOrdinal|) . #1=(|SmallOrdinal|))
      (LETT $ (GETREFV 67) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SmallOrdinal| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 (|PolynomialRing| (|NonNegativeInteger|) $))
      $)))) 

(MAKEPROP '|SmallOrdinal| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (0 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SORD;Zero;$;1|) $))
              (4 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SORD;One;$;2|) $))
              (|NonNegativeInteger|) (8 . |monomial|) |SORD;omega;$;3|
              |SORD;omegapower;2$;4| (|Boolean|) (14 . |zero?|)
              |SORD;zero?;$B;5| (19 . =) |SORD;one?;$B;6| |SORD;=;2$B;7|
              |SORD;coerce;Nni$;8| (|Union| 11 '"failed") (25 . |retractIfCan|)
              |SORD;retractIfCan;$U;9| (30 . |ground?|) (35 . |ground|)
              (40 . |smaller?|) |SORD;<;2$B;10| (46 . +) |SORD;+;3$;11|
              (52 . *) |SORD;*;3$;12| (|Union| $ '"failed")
              (58 . |subtractIfCan|) |SORD;subtractIfCan;2$U;13|
              (64 . |degree|) (69 . >=) (75 . |leadingMonomial|)
              (80 . |reductum|) |SORD;ordinalAdd;3$;14|
              |SORD;integerPart;$Nni;15| |SORD;limitPart;2$;16| (85 . >)
              (|Mapping| $$ $$) (91 . |mapExponents|) (97 . *)
              |SORD;ordinalMul;3$;17| (103 . |retract|)
              |SORD;ordinalPower;3$;21| (108 . ^) |SORD;^;3$;22| (|OutputForm|)
              (114 . |coerce|) (119 . ~=) (125 . |leadingCoefficient|)
              |SORD;coerce;$Of;23| (130 . ^) (136 . *) (142 . +)
              (|Mapping| 52 52 52) (|List| 52) (148 . |reduce|)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 154 |zero?| 160 |subtractIfCan| 165 |smaller?| 171 |sample|
              177 |retractIfCan| 181 |retract| 186 |recip| 191 |ordinalPower|
              196 |ordinalMul| 202 |ordinalAdd| 208 |one?| 214 |omegapower| 219
              |omega| 224 |min| 228 |max| 234 |limitPart| 240 |latex| 245
              |integerPart| 250 |hashUpdate!| 255 |hash| 261 |coerce| 266 ^ 276
              |Zero| 294 |One| 298 >= 302 > 308 = 314 <= 320 < 326 + 332 * 338)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL NIL NIL |OrderedSet&| |AbelianMonoid&| |Monoid&|
                     NIL NIL |SemiGroup&| |AbelianSemiGroup&| |SetCategory&|
                     |RetractableTo&| |BasicType&| |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedAbelianMonoid|) (|OrderedAbelianSemiGroup|)
                      (|CancellationAbelianMonoid|) (|SemiRing|) (|OrderedSet|)
                      (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|Comparable|)
                      (|SemiGroup|) (|AbelianSemiGroup|) (|SetCategory|)
                      (|RetractableTo| 11) (|BasicType|) (|PartialOrder|)
                      (|CoercibleTo| 52))
                   (|makeByteWordVec2| 66
                                       '(0 6 0 7 0 6 0 9 2 6 0 11 2 12 1 6 15 0
                                         16 2 6 15 0 0 18 1 6 22 0 23 1 6 15 0
                                         25 1 6 11 0 26 2 6 15 0 0 27 2 6 0 0 0
                                         29 2 6 0 0 0 31 2 6 33 0 0 34 1 6 2 0
                                         36 2 0 15 0 0 37 1 6 0 0 38 1 6 0 0 39
                                         2 0 15 0 0 43 2 6 0 44 0 45 2 6 0 0 11
                                         46 1 0 11 0 48 2 0 0 0 11 50 1 11 52 0
                                         53 2 0 15 0 0 54 1 6 11 0 55 2 52 0 0
                                         0 57 2 52 0 0 0 58 2 52 0 0 0 59 2 61
                                         52 60 0 62 2 0 15 0 0 54 1 0 15 0 17 2
                                         0 33 0 0 35 2 0 15 0 0 1 0 0 0 1 1 0
                                         22 0 24 1 0 11 0 48 1 0 33 0 1 2 0 0 0
                                         0 49 2 0 0 0 0 47 2 0 0 0 0 40 1 0 15
                                         0 19 1 0 0 0 14 0 0 0 13 2 0 0 0 0 1 2
                                         0 0 0 0 1 1 0 0 0 42 1 0 64 0 1 1 0 11
                                         0 41 2 0 66 66 0 1 1 0 65 0 1 1 0 0 11
                                         21 1 0 52 0 56 2 0 0 0 0 51 2 0 0 0 63
                                         1 2 0 0 0 11 50 0 0 0 8 0 0 0 10 2 0
                                         15 0 0 37 2 0 15 0 0 43 2 0 15 0 0 20
                                         2 0 15 0 0 1 2 0 15 0 0 28 2 0 0 0 0
                                         30 2 0 0 0 0 32 2 0 0 11 0 1 2 0 0 63
                                         0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|SmallOrdinal| 'NILADIC T) 
