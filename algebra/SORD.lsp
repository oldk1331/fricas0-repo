
(/VERSIONCHECK 2) 

(DEFUN |SORD;Zero;$;1| ($) (|spadConstant| $ 7)) 

(DEFUN |SORD;One;$;2| ($) (|spadConstant| $ 9)) 

(DEFUN |SORD;omega;$;3| ($) (SPADCALL 1 (|spadConstant| $ 10) (QREFELT $ 12))) 

(DEFUN |SORD;omegapower;2$;4| (|p| $) (SPADCALL 1 |p| (QREFELT $ 12))) 

(DEFUN |SORD;zero?;$B;5| (|p| $) (SPADCALL |p| (QREFELT $ 16))) 

(DEFUN |SORD;one?;$B;6| (|p| $)
  (SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 18))) 

(DEFUN |SORD;=;2$B;7| (|p1| |p2| $) (SPADCALL |p1| |p2| (QREFELT $ 18))) 

(DEFUN |SORD;hashUpdate!;Hs$Hs;8| (|hs| |p| $)
  (COND
   ((SPADCALL |p| (QREFELT $ 17))
    (SPADCALL |hs| (SPADCALL 6672 (QREFELT $ 23)) (QREFELT $ 25)))
   ('T (SPADCALL |hs| |p| (QREFELT $ 26))))) 

(DEFUN |SORD;coerce;Nni$;9| (|n| $)
  (SPADCALL |n| (|spadConstant| $ 8) (QREFELT $ 12))) 

(DEFUN |SORD;retractIfCan;$U;10| (|x| $) (SPADCALL |x| (QREFELT $ 30))) 

(DEFUN |SORD;<;2$B;11| (|o1| |o2| $)
  (PROG (|p2| |p1|)
    (RETURN
     (SEQ (LETT |p1| |o1| . #1=(|SORD;<;2$B;11|)) (LETT |p2| |o2| . #1#)
          (EXIT
           (COND
            ((SPADCALL |p1| (QREFELT $ 32))
             (COND
              ((SPADCALL |p2| (QREFELT $ 32))
               (< (SPADCALL |p1| (QREFELT $ 33))
                  (SPADCALL |p2| (QREFELT $ 33))))
              (#2='T 'T)))
            ((SPADCALL |p2| (QREFELT $ 32)) 'NIL)
            (#2# (SPADCALL |p1| |p2| (QREFELT $ 34))))))))) 

(DEFUN |SORD;+;3$;12| (|p1| |p2| $) (SPADCALL |p1| |p2| (QREFELT $ 36))) 

(DEFUN |SORD;*;3$;13| (|p1| |p2| $) (SPADCALL |p1| |p2| (QREFELT $ 38))) 

(DEFUN |SORD;subtractIfCan;2$U;14| (|o1| |o2| $)
  (SPADCALL |o1| |o2| (QREFELT $ 41))) 

(DEFUN |SORD;ordinalAdd;3$;15| (|o1| |o2| $)
  (PROG (|p2| #1=#:G161 |t| |p1| |lt| |e|)
    (RETURN
     (SEQ (LETT |p1| |o1| . #2=(|SORD;ordinalAdd;3$;15|))
          (LETT |p2| |o2| . #2#)
          (LETT |e| (SPADCALL |p2| (QREFELT $ 43)) . #2#)
          (EXIT
           (COND
            ((SPADCALL |e| (|spadConstant| $ 8) (QREFELT $ 20))
             (SPADCALL |p1| |p2| (QREFELT $ 37)))
            ('T
             (SEQ (LETT |lt| NIL . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL |p1| (QREFELT $ 43)) |e|
                                    (QREFELT $ 44)))
                         (GO G191)))
                       (SEQ
                        (LETT |lt| (CONS (SPADCALL |p1| (QREFELT $ 45)) |lt|)
                              . #2#)
                        (EXIT
                         (LETT |p1| (SPADCALL |p1| (QREFELT $ 46)) . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |t| NIL . #2#) (LETT #1# |lt| . #2#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |p2| (SPADCALL |t| |p2| (QREFELT $ 37)) . #2#)))
                       (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT |p2|))))))))) 

(DEFUN |SORD;integerPart;$Nni;16| (|o| $)
  (PROG (|p|)
    (RETURN
     (SEQ (LETT |p| |o| . #1=(|SORD;integerPart;$Nni;16|))
          (SEQ G190
               (COND ((NULL (NOT (SPADCALL |p| (QREFELT $ 32)))) (GO G191)))
               (SEQ (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 46)) . #1#))) NIL
               (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |p| (QREFELT $ 33))))))) 

(DEFUN |SORD;limitPart;2$;17| (|o| $)
  (PROG (#1=#:G166)
    (RETURN
     (PROG2
         (LETT #1#
               (SPADCALL |o|
                         (SPADCALL (SPADCALL |o| (QREFELT $ 48))
                                   (QREFELT $ 28))
                         (QREFELT $ 42))
               |SORD;limitPart;2$;17|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0) $ #1#))))) 

(DEFUN |SORD;ordinalMul;3$;18| (|o1| |o2| $)
  (PROG (|lo| |hi| |e|)
    (RETURN
     (SEQ
      (LETT |e| (SPADCALL |o1| (QREFELT $ 43)) . #1=(|SORD;ordinalMul;3$;18|))
      (LETT |hi|
            (COND
             ((SPADCALL |e| (|spadConstant| $ 8) (QREFELT $ 50))
              (SPADCALL (CONS #'|SORD;ordinalMul;3$;18!0| (VECTOR $ |e|))
                        (SPADCALL |o2| (QREFELT $ 49)) (QREFELT $ 52)))
             ('T (SPADCALL |o2| (QREFELT $ 49))))
            . #1#)
      (LETT |lo| (SPADCALL |o1| (SPADCALL |o2| (QREFELT $ 48)) (QREFELT $ 53))
            . #1#)
      (EXIT (SPADCALL |hi| |lo| (QREFELT $ 37))))))) 

(DEFUN |SORD;ordinalMul;3$;18!0| (|x| $$)
  (PROG (|e| $)
    (LETT |e| (QREFELT $$ 1) . #1=(|SORD;ordinalMul;3$;18|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |e| |x| (QREFELT $ 47)))))) 

(DEFUN |SORD;sub_one| (|o| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |o| (QREFELT $ 32))
        (SEQ (LETT |n| (SPADCALL |o| (QREFELT $ 33)) |SORD;sub_one|)
             (EXIT
              (COND ((EQL |n| 0) (|error| "sub_one applied to zero ordinal"))
                    (#1='T (SPADCALL (- |n| 1) (QREFELT $ 28)))))))
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
        (SEQ (LETT |e1| (SPADCALL |o1| (QREFELT $ 43)) |SORD;infinite_power|)
             (EXIT
              (COND
               ((SPADCALL |e1| (|spadConstant| $ 8) (QREFELT $ 50))
                (SPADCALL (SPADCALL |e1| |o2| (QREFELT $ 54)) (QREFELT $ 14)))
               (#1#
                (SPADCALL
                 (SPADCALL (CONS (|function| |SORD;sub_one|) $) |o2|
                           (QREFELT $ 52))
                 (QREFELT $ 14)))))))))))) 

(DEFUN |SORD;finite_ordinal_power| (|o| |n| $)
  (PROG (|n1| |e|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) (|spadConstant| $ 10)) ((EQL |n| 1) |o|)
            (#1='T
             (SEQ
              (LETT |e| (SPADCALL |o| (QREFELT $ 43))
                    . #2=(|SORD;finite_ordinal_power|))
              (EXIT
               (COND
                ((SPADCALL |e| (|spadConstant| $ 8) (QREFELT $ 20))
                 (SPADCALL (EXPT (SPADCALL |o| (QREFELT $ 55)) |n|)
                           (QREFELT $ 28)))
                (#1#
                 (SEQ (LETT |n1| (- |n| 1) . #2#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |e| |n1| (QREFELT $ 53))
                                  (QREFELT $ 14))
                        |o| (QREFELT $ 54)))))))))))))) 

(DEFUN |SORD;ordinalPower;3$;22| (|o1| |o2| $)
  (SPADCALL (|SORD;infinite_power| |o1| (SPADCALL |o2| (QREFELT $ 49)) $)
            (|SORD;finite_ordinal_power| |o1| (SPADCALL |o2| (QREFELT $ 48)) $)
            (QREFELT $ 54))) 

(DEFUN |SORD;^;3$;23| (|o1| |o2| $)
  (SPADCALL (|SORD;infinite_power| |o1| (SPADCALL |o2| (QREFELT $ 49)) $)
            (SPADCALL |o1| (SPADCALL |o2| (QREFELT $ 48)) (QREFELT $ 57))
            (QREFELT $ 39))) 

(DEFUN |SORD;coerce;$Of;24| (|o| $)
  (PROG (|l| |l1| |mon| |co| |p| |e| |c| |v|)
    (RETURN
     (SEQ (LETT |p| |o| . #1=(|SORD;coerce;$Of;24|))
          (EXIT
           (COND
            ((SPADCALL |p| (QREFELT $ 32))
             (SPADCALL (SPADCALL |p| (QREFELT $ 33)) (QREFELT $ 60)))
            ('T
             (SEQ (LETT |l| NIL . #1#) (LETT |v| "omega" . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |p| (|spadConstant| $ 7) (QREFELT $ 61)))
                         (GO G191)))
                       (SEQ (LETT |c| (SPADCALL |p| (QREFELT $ 62)) . #1#)
                            (LETT |e| (SPADCALL |p| (QREFELT $ 43)) . #1#)
                            (LETT |p| (SPADCALL |p| (QREFELT $ 46)) . #1#)
                            (LETT |co| (SPADCALL |c| (QREFELT $ 60)) . #1#)
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
                                                                          63))
                                                       (QREFELT $ 64))
                                             . #1#)))
                                     (EXIT
                                      (COND ((EQL |c| 1) |mon|)
                                            ('T
                                             (SPADCALL |co| |mon|
                                                       (QREFELT $ 65))))))))
                                  . #1#)
                            (EXIT (LETT |l| (CONS |l1| |l|) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |l| (NREVERSE |l|) . #1#)
                  (EXIT (SPADCALL (ELT $ 66) |l| (QREFELT $ 69))))))))))) 

(DEFUN |SmallOrdinal| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G192)
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
      (LETT $ (GETREFV 72) . #1#)
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
              (|Integer|) (|SingleInteger|) (25 . |coerce|) (|HashState|)
              (30 . |update!|) (36 . |hashUpdate!|) |SORD;hashUpdate!;Hs$Hs;8|
              |SORD;coerce;Nni$;9| (|Union| 11 '"failed") (42 . |retractIfCan|)
              |SORD;retractIfCan;$U;10| (47 . |ground?|) (52 . |ground|)
              (57 . |smaller?|) |SORD;<;2$B;11| (63 . +) |SORD;+;3$;12|
              (69 . *) |SORD;*;3$;13| (|Union| $ '"failed")
              (75 . |subtractIfCan|) |SORD;subtractIfCan;2$U;14|
              (81 . |degree|) (86 . >=) (92 . |leadingMonomial|)
              (97 . |reductum|) |SORD;ordinalAdd;3$;15|
              |SORD;integerPart;$Nni;16| |SORD;limitPart;2$;17| (102 . >)
              (|Mapping| $$ $$) (108 . |mapExponents|) (114 . *)
              |SORD;ordinalMul;3$;18| (120 . |retract|)
              |SORD;ordinalPower;3$;22| (125 . ^) |SORD;^;3$;23| (|OutputForm|)
              (131 . |coerce|) (136 . ~=) (142 . |leadingCoefficient|)
              |SORD;coerce;$Of;24| (147 . ^) (153 . *) (159 . +)
              (|Mapping| 59 59 59) (|List| 59) (165 . |reduce|)
              (|PositiveInteger|) (|String|))
           '#(~= 171 |zero?| 177 |subtractIfCan| 182 |smaller?| 188 |sample|
              194 |retractIfCan| 198 |retract| 203 |recip| 208 |ordinalPower|
              213 |ordinalMul| 219 |ordinalAdd| 225 |one?| 231 |omegapower| 236
              |omega| 241 |min| 245 |max| 251 |limitPart| 257 |latex| 262
              |integerPart| 267 |hashUpdate!| 272 |hash| 278 |coerce| 283 ^ 293
              |Zero| 311 |One| 315 >= 319 > 325 = 331 <= 337 < 343 + 349 * 355)
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
                      (|CoercibleTo| 59))
                   (|makeByteWordVec2| 71
                                       '(0 6 0 7 0 6 0 9 2 6 0 11 2 12 1 6 15 0
                                         16 2 6 15 0 0 18 1 22 0 21 23 2 24 0 0
                                         22 25 2 6 24 24 0 26 1 6 29 0 30 1 6
                                         15 0 32 1 6 11 0 33 2 6 15 0 0 34 2 6
                                         0 0 0 36 2 6 0 0 0 38 2 6 40 0 0 41 1
                                         6 2 0 43 2 0 15 0 0 44 1 6 0 0 45 1 6
                                         0 0 46 2 0 15 0 0 50 2 6 0 51 0 52 2 6
                                         0 0 11 53 1 0 11 0 55 2 0 0 0 11 57 1
                                         11 59 0 60 2 0 15 0 0 61 1 6 11 0 62 2
                                         59 0 0 0 64 2 59 0 0 0 65 2 59 0 0 0
                                         66 2 68 59 67 0 69 2 0 15 0 0 61 1 0
                                         15 0 17 2 0 40 0 0 42 2 0 15 0 0 1 0 0
                                         0 1 1 0 29 0 31 1 0 11 0 55 1 0 40 0 1
                                         2 0 0 0 0 56 2 0 0 0 0 54 2 0 0 0 0 47
                                         1 0 15 0 19 1 0 0 0 14 0 0 0 13 2 0 0
                                         0 0 1 2 0 0 0 0 1 1 0 0 0 49 1 0 71 0
                                         1 1 0 11 0 48 2 0 24 24 0 27 1 0 22 0
                                         1 1 0 0 11 28 1 0 59 0 63 2 0 0 0 0 58
                                         2 0 0 0 70 1 2 0 0 0 11 57 0 0 0 8 0 0
                                         0 10 2 0 15 0 0 44 2 0 15 0 0 50 2 0
                                         15 0 0 20 2 0 15 0 0 1 2 0 15 0 0 35 2
                                         0 0 0 0 37 2 0 0 0 0 39 2 0 0 11 0 1 2
                                         0 0 70 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|SmallOrdinal| 'NILADIC T) 
