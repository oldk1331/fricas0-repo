
(PUT '|FM;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |FM;rep| ((|x| $) ($ |Rep|)) |x|) 

(PUT '|FM;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(SDEFUN |FM;per| ((|r| |Rep|) ($ $)) |r|) 

(SDEFUN |FM;*;R2$;3| ((|r| R) (|x| $) ($ $))
        (SPROG ((#1=#:G124 NIL) (|u| NIL) (#2=#:G123 NIL))
               (SEQ
                (COND ((SPADCALL |r| (QREFELT $ 13)) (|spadConstant| $ 14))
                      ((SPADCALL |r| (QREFELT $ 11) (QREFELT $ 15)) |x|)
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|FM;*;R2$;3|))
                        (SEQ (LETT |u| NIL . #3#) (LETT #1# |x| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (CONS (QCAR |u|)
                                            (SPADCALL |r| (QCDR |u|)
                                                      (QREFELT $ 16)))
                                      #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FM;*;R2$;4| ((|r| R) (|x| $) ($ $))
        (SPROG ((|a| (R)) (#1=#:G129 NIL) (|u| NIL) (#2=#:G128 NIL))
               (SEQ
                (COND ((SPADCALL |r| (QREFELT $ 13)) (|spadConstant| $ 14))
                      ((SPADCALL |r| (QREFELT $ 11) (QREFELT $ 15)) |x|)
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|FM;*;R2$;4|))
                        (SEQ (LETT |u| NIL . #3#) (LETT #1# |x| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |a|
                                        (SPADCALL |r| (QCDR |u|)
                                                  (QREFELT $ 16))
                                        . #3#)
                                  (|spadConstant| $ 10) (QREFELT $ 18))
                                 (LETT #2# (CONS (CONS (QCAR |u|) |a|) #2#)
                                       . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FM;*;$R$;5| ((|x| $) (|r| R) ($ $))
        (SPROG ((#1=#:G134 NIL) (|u| NIL) (#2=#:G133 NIL))
               (SEQ
                (COND ((SPADCALL |r| (QREFELT $ 13)) (|spadConstant| $ 14))
                      ((SPADCALL |r| (QREFELT $ 11) (QREFELT $ 15)) |x|)
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|FM;*;$R$;5|))
                        (SEQ (LETT |u| NIL . #3#) (LETT #1# |x| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (CONS (QCAR |u|)
                                            (SPADCALL (QCDR |u|) |r|
                                                      (QREFELT $ 16)))
                                      #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FM;*;$R$;6| ((|x| $) (|r| R) ($ $))
        (SPROG ((|a| (R)) (#1=#:G139 NIL) (|u| NIL) (#2=#:G138 NIL))
               (SEQ
                (COND ((SPADCALL |r| (QREFELT $ 13)) (|spadConstant| $ 14))
                      ((SPADCALL |r| (QREFELT $ 11) (QREFELT $ 15)) |x|)
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|FM;*;$R$;6|))
                        (SEQ (LETT |u| NIL . #3#) (LETT #1# |x| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |a|
                                        (SPADCALL (QCDR |u|) |r|
                                                  (QREFELT $ 16))
                                        . #3#)
                                  (|spadConstant| $ 10) (QREFELT $ 18))
                                 (LETT #2# (CONS (CONS (QCAR |u|) |a|) #2#)
                                       . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FM;*;RS$;7| ((|r| R) (|s| S) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 10) (QREFELT $ 15))
          (|spadConstant| $ 14))
         ('T (LIST (CONS |s| |r|))))) 

(SDEFUN |FM;*;SR$;8| ((|s| S) (|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 10) (QREFELT $ 15))
          (|spadConstant| $ 14))
         ('T (LIST (CONS |s| |r|))))) 

(SDEFUN |FM;coerce;$Of;9| ((|x| $) ($ |OutputForm|))
        (SPROG ((|le| (|List| (|OutputForm|))) (#1=#:G152 NIL) (|rec| NIL))
               (SEQ
                (COND
                 ((NULL |x|) (SPADCALL (|spadConstant| $ 10) (QREFELT $ 23)))
                 ('T
                  (SEQ (LETT |le| NIL . #2=(|FM;coerce;$Of;9|))
                       (SEQ (LETT |rec| NIL . #2#)
                            (LETT #1# (REVERSE |x|) . #2#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL (QCDR |rec|) (|spadConstant| $ 9)
                                          (QREFELT $ 15))
                                (LETT |le|
                                      (CONS
                                       (SPADCALL (QCAR |rec|) (QREFELT $ 24))
                                       |le|)
                                      . #2#))
                               ('T
                                (LETT |le|
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL (QCDR |rec|) (QREFELT $ 23))
                                        (SPADCALL (QCAR |rec|) (QREFELT $ 24))
                                        (QREFELT $ 25))
                                       |le|)
                                      . #2#)))))
                            (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (SPADCALL (ELT $ 26) |le| (QREFELT $ 29))))))))) 

(SDEFUN |FM;coerce;$Of;10| ((|x| $) ($ |OutputForm|))
        (SPROG ((#1=#:G167 NIL) (|rec| NIL) (#2=#:G166 NIL))
               (SEQ
                (SPADCALL (ELT $ 26)
                          (PROGN
                           (LETT #2# NIL . #3=(|FM;coerce;$Of;10|))
                           (SEQ (LETT |rec| NIL . #3#) (LETT #1# |x| . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |rec| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL (QCDR |rec|)
                                                    (QREFELT $ 23))
                                          (SPADCALL (QCAR |rec|)
                                                    (QREFELT $ 24))
                                          (QREFELT $ 25))
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 29))))) 

(SDEFUN |FM;leadingMonomial;2$;11| ((|x| $) ($ $))
        (SPADCALL (QCDR (|SPADfirst| (|FM;rep| |x| $)))
                  (QCAR (|SPADfirst| |x|)) (QREFELT $ 31))) 

(SDEFUN |FM;support;$L;12| ((|x| $) ($ |List| S))
        (SPROG ((#1=#:G172 NIL) (|t| NIL) (#2=#:G171 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FM;support;$L;12|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |x| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |t|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FM;coefficients;$L;13| ((|x| $) ($ |List| R))
        (SPROG ((#1=#:G176 NIL) (|t| NIL) (#2=#:G175 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FM;coefficients;$L;13|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |x| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCDR |t|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FM;monomials;$L;14| ((|x| $) ($ |List| $))
        (SPROG ((#1=#:G180 NIL) (|t| NIL) (#2=#:G179 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FM;monomials;$L;14|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |x| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (QCAR |t|) (QCDR |t|) (QREFELT $ 37))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FM;retractIfCan;$U;15| ((|x| $) ($ |Union| S "failed"))
        (COND
         ((OR (SPADCALL (SPADCALL |x| (QREFELT $ 41)) 1 (QREFELT $ 43))
              (NULL
               (SPADCALL (QCDR (|SPADfirst| |x|)) (|spadConstant| $ 9)
                         (QREFELT $ 15))))
          (CONS 1 "failed"))
         ('T (CONS 0 (QCAR (|SPADfirst| |x|)))))) 

(SDEFUN |FM;retract;$S;16| ((|x| $) ($ S))
        (SPROG ((|rr| (|Union| S "failed")))
               (SEQ
                (LETT |rr| (SPADCALL |x| (QREFELT $ 45)) |FM;retract;$S;16|)
                (EXIT
                 (COND ((QEQCAR |rr| 1) (|error| "FM1.retract impossible"))
                       ('T (QCDR |rr|))))))) 

(SDEFUN |FM;coerce;S$;17| ((|s| S) ($ $))
        (LIST (CONS |s| (|spadConstant| $ 9)))) 

(SDEFUN |FM;monom;SR$;18| ((|b| S) (|r| R) ($ $)) (LIST (CONS |b| |r|))) 

(SDEFUN |FM;coefficient;$SR;19| ((|x| $) (|s| S) ($ R))
        (COND ((NULL |x|) (|spadConstant| $ 10))
              ((SPADCALL |s| (QCAR (|SPADfirst| |x|)) (QREFELT $ 48))
               (SPADCALL (CDR |x|) |s| (QREFELT $ 49)))
              ((SPADCALL (QCAR (|SPADfirst| |x|)) |s| (QREFELT $ 50))
               (QCDR (|SPADfirst| |x|)))
              ('T (|spadConstant| $ 10)))) 

(SDEFUN |FM;monomial?;$B;20| ((|x| $) ($ |Boolean|))
        (EQL (SPADCALL |x| (QREFELT $ 41)) 1)) 

(PUT '|FM;listOfTerms;$L;21| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |FM;listOfTerms;$L;21|
        ((|x| $) ($ |List| (|Record| (|:| |k| S) (|:| |c| R)))) |x|) 

(SDEFUN |FM;numberOfMonomials;$Nni;22| ((|x| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |x| (QREFELT $ 54)))) 

(SDEFUN |FM;linearExtend;M$R;23| ((|f| |Mapping| R S) (|x| $) ($ R))
        (SPROG ((|res| (R)) (#1=#:G210 NIL) (|t| NIL))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 55)) (|spadConstant| $ 10))
                      ('T
                       (SEQ
                        (LETT |res| (|spadConstant| $ 10)
                              . #2=(|FM;linearExtend;M$R;23|))
                        (SEQ (LETT |t| NIL . #2#)
                             (LETT #1# (SPADCALL |x| (QREFELT $ 54)) . #2#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |res|
                                     (SPADCALL |res|
                                               (SPADCALL (QCDR |t|)
                                                         (SPADCALL (QCAR |t|)
                                                                   |f|)
                                                         (QREFELT $ 16))
                                               (QREFELT $ 56))
                                     . #2#)))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|))))))) 

(DECLAIM (NOTINLINE |FreeModule;|)) 

(DEFUN |FreeModule| (&REST #1=#:G215)
  (SPROG NIL
         (PROG (#2=#:G216)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FreeModule|)
                                               '|domainEqualList|)
                    . #3=(|FreeModule|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FreeModule;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FreeModule|)))))))))) 

(DEFUN |FreeModule;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FreeModule|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FreeModule| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 65) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|OrderedAbelianMonoidSup|))
                                               (|HasCategory| |#2|
                                                              '(|OrderedSet|)))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|Comparable|))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|))))
                                              (OR
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|))))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|))
                                               (|HasCategory| |#1|
                                                              '(|CancellationAbelianMonoid|)))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#1|
                                                              '(|CancellationAbelianMonoid|)))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|))))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#1|
                                                              '(|CancellationAbelianMonoid|))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|FreeModule| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (|List| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
          (QSETREFV $ 11
                    (COND
                     ((|HasCategory| |#1| '(|Monoid|)) (|spadConstant| $ 9))
                     ('T (|spadConstant| $ 10))))
          (COND
           ((|HasCategory| |#1| '(|noZeroDivisors|))
            (QSETREFV $ 17 (CONS (|dispatchFunction| |FM;*;R2$;3|) $)))
           ('T (QSETREFV $ 17 (CONS (|dispatchFunction| |FM;*;R2$;4|) $))))
          (COND
           ((|HasCategory| |#1| '(|noZeroDivisors|))
            (QSETREFV $ 19 (CONS (|dispatchFunction| |FM;*;$R$;5|) $)))
           ('T (QSETREFV $ 19 (CONS (|dispatchFunction| |FM;*;$R$;6|) $))))
          (COND
           ((|HasCategory| |#1| '(|Monoid|))
            (QSETREFV $ 30 (CONS (|dispatchFunction| |FM;coerce;$Of;9|) $)))
           ('T
            (QSETREFV $ 30 (CONS (|dispatchFunction| |FM;coerce;$Of;10|) $))))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 45
                       (CONS (|dispatchFunction| |FM;retractIfCan;$U;15|) $))
             (QSETREFV $ 46 (CONS (|dispatchFunction| |FM;retract;$S;16|) $))
             (QSETREFV $ 47 (CONS (|dispatchFunction| |FM;coerce;S$;17|) $)))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 58
                       (CONS (|dispatchFunction| |FM;linearExtend;M$R;23|)
                             $)))))
          $))) 

(MAKEPROP '|FreeModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedDirectProductObject| 6 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (0 . |One|) (4 . |Zero|)
              '|r_one| (|Boolean|) (8 . |zero?|) (13 . |Zero|) (17 . =)
              (23 . *) (29 . *) (35 . ~=) (41 . *) |FM;*;RS$;7| |FM;*;SR$;8|
              (|OutputForm|) (47 . |coerce|) (52 . |coerce|) (57 . *) (63 . +)
              (|Mapping| 22 22 22) (|List| 22) (69 . |reduce|) (75 . |coerce|)
              (80 . |monomial|) |FM;leadingMonomial;2$;11| (|List| 7)
              |FM;support;$L;12| (|List| 6) |FM;coefficients;$L;13|
              |FM;monom;SR$;18| (|List| $) |FM;monomials;$L;14|
              (|NonNegativeInteger|) |FM;numberOfMonomials;$Nni;22| (|Integer|)
              (86 . ~=) (|Union| 7 '"failed") (92 . |retractIfCan|)
              (97 . |retract|) (102 . |coerce|) (107 . |smaller?|)
              |FM;coefficient;$SR;19| (113 . =) |FM;monomial?;$B;20|
              (|Record| (|:| |k| 7) (|:| |c| 6)) (|List| 52)
              |FM;listOfTerms;$L;21| (119 . |zero?|) (124 . +) (|Mapping| 6 7)
              (130 . |linearExtend|) (|Union| $ '"failed") (|Mapping| 6 6)
              (|PositiveInteger|) (|HashState|) (|String|) (|SingleInteger|))
           '#(|zero?| 136 |support| 141 |retractIfCan| 146 |retract| 151
              |numberOfMonomials| 156 |monomials| 161 |monomial?| 166
              |monomial| 171 |monom| 177 |listOfTerms| 183 |linearExtend| 188
              |leadingMonomial| 194 |coerce| 199 |coefficients| 209
              |coefficient| 214 |Zero| 220 * 224)
           'NIL
           (CONS
            (|makeByteWordVec2| 8
                                '(0 0 2 0 4 0 0 0 4 1 6 6 8 6 7 0 5 0 0 0 3 6))
            (CONS
             '#(|FreeModuleCategory&| NIL |Module&| NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |AbelianSemiGroup&| NIL |SetCategory&| |BasicType&| NIL
                |RetractableTo&| |PartialOrder&|)
             (CONS
              '#((|FreeModuleCategory| 6 7)
                 (|IndexedDirectProductCategory| 6 7) (|Module| 6)
                 (|BiModule| 6 6) (|OrderedAbelianMonoidSup|)
                 (|AbelianProductCategory| 6) (|LeftModule| 6)
                 (|RightModule| 6) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|AbelianMonoid|) (|AbelianSemiGroup|)
                 (|Comparable|) (|SetCategory|) (|BasicType|)
                 (|CoercibleTo| 22) (|RetractableTo| 7) (|PartialOrder|))
              (|makeByteWordVec2| 58
                                  '(0 6 0 9 0 6 0 10 1 6 12 0 13 0 0 0 14 2 6
                                    12 0 0 15 2 6 0 0 0 16 2 0 0 6 0 17 2 6 12
                                    0 0 18 2 0 0 0 6 19 1 6 22 0 23 1 7 22 0 24
                                    2 22 0 0 0 25 2 22 0 0 0 26 2 28 22 27 0 29
                                    1 0 22 0 30 2 0 0 6 7 31 2 42 12 0 0 43 1 0
                                    44 0 45 1 0 7 0 46 1 0 0 7 47 2 7 12 0 0 48
                                    2 7 12 0 0 50 1 0 12 0 55 2 6 0 0 0 56 2 0
                                    6 57 0 58 1 9 12 0 55 1 0 33 0 34 1 3 44 0
                                    45 1 3 7 0 46 1 0 40 0 41 1 0 38 0 39 1 0
                                    12 0 51 2 0 0 6 7 31 2 0 0 7 6 37 1 0 53 0
                                    54 2 2 6 57 0 58 1 0 0 0 32 1 3 0 7 47 1 0
                                    22 0 30 1 0 35 0 36 2 0 6 0 7 49 0 9 0 14 2
                                    0 0 6 7 20 2 0 0 7 6 21 2 0 0 0 6 19 2 0 0
                                    6 0 17)))))
           '|lookupIncomplete|)) 
