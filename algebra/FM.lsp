
(/VERSIONCHECK 2) 

(DEFUN |FM;*;R2$;1| (|r| |x| $)
  (PROG (#1=#:G143 |u| #2=#:G142)
    (RETURN
     (SEQ
      (COND ((SPADCALL |r| (QREFELT $ 13)) (|spadConstant| $ 14))
            ((SPADCALL |r| (QREFELT $ 11) (QREFELT $ 15)) |x|)
            ('T
             (PROGN
              (LETT #2# NIL . #3=(|FM;*;R2$;1|))
              (SEQ (LETT |u| NIL . #3#) (LETT #1# |x| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2#
                           (CONS
                            (CONS (QCAR |u|)
                                  (SPADCALL |r| (QCDR |u|) (QREFELT $ 16)))
                            #2#)
                           . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |FM;*;R2$;2| (|r| |x| $)
  (PROG (|a| #1=#:G148 |u| #2=#:G147)
    (RETURN
     (SEQ
      (COND ((SPADCALL |r| (QREFELT $ 13)) (|spadConstant| $ 14))
            ((SPADCALL |r| (QREFELT $ 11) (QREFELT $ 15)) |x|)
            ('T
             (PROGN
              (LETT #2# NIL . #3=(|FM;*;R2$;2|))
              (SEQ (LETT |u| NIL . #3#) (LETT #1# |x| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (LETT |a| (SPADCALL |r| (QCDR |u|) (QREFELT $ 16))
                              . #3#)
                        (|spadConstant| $ 10) (QREFELT $ 18))
                       (LETT #2# (CONS (CONS (QCAR |u|) |a|) #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |FM;*;$R$;3| (|x| |r| $)
  (PROG (#1=#:G153 |u| #2=#:G152)
    (RETURN
     (SEQ
      (COND ((SPADCALL |r| (QREFELT $ 13)) (|spadConstant| $ 14))
            ((SPADCALL |r| (QREFELT $ 11) (QREFELT $ 15)) |x|)
            ('T
             (PROGN
              (LETT #2# NIL . #3=(|FM;*;$R$;3|))
              (SEQ (LETT |u| NIL . #3#) (LETT #1# |x| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2#
                           (CONS
                            (CONS (QCAR |u|)
                                  (SPADCALL (QCDR |u|) |r| (QREFELT $ 16)))
                            #2#)
                           . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |FM;*;$R$;4| (|x| |r| $)
  (PROG (|a| #1=#:G158 |u| #2=#:G157)
    (RETURN
     (SEQ
      (COND ((SPADCALL |r| (QREFELT $ 13)) (|spadConstant| $ 14))
            ((SPADCALL |r| (QREFELT $ 11) (QREFELT $ 15)) |x|)
            ('T
             (PROGN
              (LETT #2# NIL . #3=(|FM;*;$R$;4|))
              (SEQ (LETT |u| NIL . #3#) (LETT #1# |x| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (LETT |a| (SPADCALL (QCDR |u|) |r| (QREFELT $ 16))
                              . #3#)
                        (|spadConstant| $ 10) (QREFELT $ 18))
                       (LETT #2# (CONS (CONS (QCAR |u|) |a|) #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |FM;*;RS$;5| (|r| |s| $)
  (COND
   ((SPADCALL |r| (|spadConstant| $ 10) (QREFELT $ 15)) (|spadConstant| $ 14))
   ('T (LIST (CONS |s| |r|))))) 

(DEFUN |FM;*;SR$;6| (|s| |r| $)
  (COND
   ((SPADCALL |r| (|spadConstant| $ 10) (QREFELT $ 15)) (|spadConstant| $ 14))
   ('T (LIST (CONS |s| |r|))))) 

(DEFUN |FM;coerce;$Of;7| (|x| $)
  (PROG (|le| #1=#:G171 |rec|)
    (RETURN
     (SEQ
      (COND ((NULL |x|) (SPADCALL (|spadConstant| $ 10) (QREFELT $ 23)))
            ('T
             (SEQ (LETT |le| NIL . #2=(|FM;coerce;$Of;7|))
                  (SEQ (LETT |rec| NIL . #2#) (LETT #1# (REVERSE |x|) . #2#)
                       G190
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
                                 (CONS (SPADCALL (QCAR |rec|) (QREFELT $ 24))
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
                       (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL (ELT $ 26) |le| (QREFELT $ 29)))))))))) 

(DEFUN |FM;coerce;$Of;8| (|x| $)
  (PROG (#1=#:G186 |rec| #2=#:G185)
    (RETURN
     (SEQ
      (SPADCALL (ELT $ 26)
                (PROGN
                 (LETT #2# NIL . #3=(|FM;coerce;$Of;8|))
                 (SEQ (LETT |rec| NIL . #3#) (LETT #1# |x| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |rec| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL (QCDR |rec|) (QREFELT $ 23))
                                         (SPADCALL (QCAR |rec|) (QREFELT $ 24))
                                         (QREFELT $ 25))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 29)))))) 

(DEFUN |FM;leadingMonomial;$S;9| (|x| $) (QCAR (|SPADfirst| |x|))) 

(DEFUN |FM;support;$L;10| (|x| $)
  (PROG (#1=#:G191 |t| #2=#:G190)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|FM;support;$L;10|))
       (SEQ (LETT |t| NIL . #3#) (LETT #1# |x| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ (EXIT (LETT #2# (CONS (QCAR |t|) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |FM;coefficients;$L;11| (|x| $)
  (PROG (#1=#:G195 |t| #2=#:G194)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|FM;coefficients;$L;11|))
       (SEQ (LETT |t| NIL . #3#) (LETT #1# |x| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ (EXIT (LETT #2# (CONS (QCDR |t|) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |FM;monomials;$L;12| (|x| $)
  (PROG (#1=#:G199 |t| #2=#:G198)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|FM;monomials;$L;12|))
       (SEQ (LETT |t| NIL . #3#) (LETT #1# |x| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS (SPADCALL (QCAR |t|) (QCDR |t|) (QREFELT $ 36)) #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |FM;retractIfCan;$U;13| (|x| $)
  (COND
   ((OR (SPADCALL (SPADCALL |x| (QREFELT $ 40)) 1 (QREFELT $ 42))
        (NULL
         (SPADCALL (QCDR (|SPADfirst| |x|)) (|spadConstant| $ 9)
                   (QREFELT $ 15))))
    (CONS 1 "failed"))
   ('T (CONS 0 (QCAR (|SPADfirst| |x|)))))) 

(DEFUN |FM;retract;$S;14| (|x| $)
  (PROG (|rr|)
    (RETURN
     (SEQ (LETT |rr| (SPADCALL |x| (QREFELT $ 44)) |FM;retract;$S;14|)
          (EXIT
           (COND ((QEQCAR |rr| 1) (|error| "FM1.retract impossible"))
                 ('T (QCDR |rr|)))))))) 

(DEFUN |FM;coerce;S$;15| (|s| $) (LIST (CONS |s| (|spadConstant| $ 9)))) 

(DEFUN |FM;monom;SR$;16| (|b| |r| $) (LIST (CONS |b| |r|))) 

(DEFUN |FM;coefficient;$SR;17| (|x| |s| $)
  (COND ((NULL |x|) (|spadConstant| $ 10))
        ((SPADCALL (QCAR (|SPADfirst| |x|)) |s| (QREFELT $ 47))
         (SPADCALL (CDR |x|) |s| (QREFELT $ 48)))
        ((SPADCALL (QCAR (|SPADfirst| |x|)) |s| (QREFELT $ 49))
         (QCDR (|SPADfirst| |x|)))
        ('T (|spadConstant| $ 10)))) 

(DEFUN |FM;monomial?;$B;18| (|x| $) (EQL (SPADCALL |x| (QREFELT $ 40)) 1)) 

(PUT '|FM;listOfTerms;$L;19| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |FM;listOfTerms;$L;19| (|x| $) |x|) 

(DEFUN |FM;numberOfMonomials;$Nni;20| (|x| $)
  (LENGTH (SPADCALL |x| (QREFELT $ 53)))) 

(DEFUN |FM;linearExtend;M$R;21| (|f| |x| $)
  (PROG (|res| #1=#:G229 |t|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 54)) (|spadConstant| $ 10))
            ('T
             (SEQ
              (LETT |res| (|spadConstant| $ 10)
                    . #2=(|FM;linearExtend;M$R;21|))
              (SEQ (LETT |t| NIL . #2#)
                   (LETT #1# (SPADCALL |x| (QREFELT $ 53)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL (QCDR |t|)
                                               (SPADCALL (QCAR |t|) |f|)
                                               (QREFELT $ 16))
                                     (QREFELT $ 55))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))))))) 

(DEFUN |FreeModule| (&REST #1=#:G237)
  (PROG ()
    (RETURN
     (PROG (#2=#:G238)
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
              (PROG1 (APPLY (|function| |FreeModule;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|FreeModule|))))))))))) 

(DEFUN |FreeModule;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G234 #2=#:G235 #3=#:G236 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|FreeModule|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT |dv$| (LIST '|FreeModule| DV$1 DV$2) . #4#)
      (LETT $ (GETREFV 64) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#1| '(|SemiRing|))
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoid|))
                                                . #4#)
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|OrderedAbelianMonoidSup|)))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#1|
                                                          '(|CancellationAbelianMonoid|)))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|Comparable|))
                                                . #4#)
                                          (OR #2# #3#
                                              (|HasCategory| |#1|
                                                             '(|OrderedAbelianMonoidSup|)))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|AbelianMonoid|))
                                                . #4#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianGroup|))
                                           #1#
                                           (|HasCategory| |#1|
                                                          '(|CancellationAbelianMonoid|)))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|FreeModule| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|List| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
      (QSETREFV $ 11
                (COND ((|HasCategory| |#1| '(|Monoid|)) (|spadConstant| $ 9))
                      ('T (|spadConstant| $ 10))))
      (COND
       ((|HasCategory| |#1| '(|noZeroDivisors|))
        (QSETREFV $ 17 (CONS (|dispatchFunction| |FM;*;R2$;1|) $)))
       ('T (QSETREFV $ 17 (CONS (|dispatchFunction| |FM;*;R2$;2|) $))))
      (COND
       ((|HasCategory| |#1| '(|noZeroDivisors|))
        (QSETREFV $ 19 (CONS (|dispatchFunction| |FM;*;$R$;3|) $)))
       ('T (QSETREFV $ 19 (CONS (|dispatchFunction| |FM;*;$R$;4|) $))))
      (COND
       ((|HasCategory| |#1| '(|Monoid|))
        (QSETREFV $ 30 (CONS (|dispatchFunction| |FM;coerce;$Of;7|) $)))
       ('T (QSETREFV $ 30 (CONS (|dispatchFunction| |FM;coerce;$Of;8|) $))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 44 (CONS (|dispatchFunction| |FM;retractIfCan;$U;13|) $))
         (QSETREFV $ 45 (CONS (|dispatchFunction| |FM;retract;$S;14|) $))
         (QSETREFV $ 46 (CONS (|dispatchFunction| |FM;coerce;S$;15|) $)))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 57
                   (CONS (|dispatchFunction| |FM;linearExtend;M$R;21|) $)))))
      $)))) 

(MAKEPROP '|FreeModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedDirectProductObject| 6 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (0 . |One|) (4 . |Zero|)
              '|r_one| (|Boolean|) (8 . |zero?|) (13 . |Zero|) (17 . =)
              (23 . *) (29 . *) (35 . ~=) (41 . *) |FM;*;RS$;5| |FM;*;SR$;6|
              (|OutputForm|) (47 . |coerce|) (52 . |coerce|) (57 . *) (63 . +)
              (|Mapping| 22 22 22) (|List| 22) (69 . |reduce|) (75 . |coerce|)
              |FM;leadingMonomial;$S;9| (|List| 7) |FM;support;$L;10|
              (|List| 6) |FM;coefficients;$L;11| |FM;monom;SR$;16| (|List| $)
              |FM;monomials;$L;12| (|NonNegativeInteger|)
              |FM;numberOfMonomials;$Nni;20| (|Integer|) (80 . ~=)
              (|Union| 7 '"failed") (86 . |retractIfCan|) (91 . |retract|)
              (96 . |coerce|) (101 . >) |FM;coefficient;$SR;17| (107 . =)
              |FM;monomial?;$B;18| (|Record| (|:| |k| 7) (|:| |c| 6))
              (|List| 51) |FM;listOfTerms;$L;19| (113 . |zero?|) (118 . +)
              (|Mapping| 6 7) (124 . |linearExtend|) (|Union| $ '"failed")
              (|Mapping| 6 6) (|PositiveInteger|) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(|zero?| 130 |support| 135 |retractIfCan| 140 |retract| 145
              |numberOfMonomials| 150 |monomials| 155 |monomial?| 160 |monom|
              165 |listOfTerms| 171 |linearExtend| 176 |leadingMonomial| 182
              |coerce| 187 |coefficients| 197 |coefficient| 202 |Zero| 208 *
              212)
           'NIL
           (CONS
            (|makeByteWordVec2| 11
                                '(0 0 2 0 4 0 0 0 4 1 6 6 7 6 11 0 9 0 0 0 3
                                  5))
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
              (|makeByteWordVec2| 57
                                  '(0 6 0 9 0 6 0 10 1 6 12 0 13 0 0 0 14 2 6
                                    12 0 0 15 2 6 0 0 0 16 2 0 0 6 0 17 2 6 12
                                    0 0 18 2 0 0 0 6 19 1 6 22 0 23 1 7 22 0 24
                                    2 22 0 0 0 25 2 22 0 0 0 26 2 28 22 27 0 29
                                    1 0 22 0 30 2 41 12 0 0 42 1 0 43 0 44 1 0
                                    7 0 45 1 0 0 7 46 2 7 12 0 0 47 2 7 12 0 0
                                    49 1 0 12 0 54 2 6 0 0 0 55 2 0 6 56 0 57 1
                                    10 12 0 54 1 0 32 0 33 1 3 43 0 44 1 3 7 0
                                    45 1 0 39 0 40 1 0 37 0 38 1 0 12 0 50 2 0
                                    0 7 6 36 1 0 52 0 53 2 2 6 56 0 57 1 0 7 0
                                    31 1 3 0 7 46 1 0 22 0 30 1 0 34 0 35 2 0 6
                                    0 7 48 0 10 0 14 2 0 0 7 6 21 2 0 0 6 7 20
                                    2 0 0 0 6 19 2 0 0 6 0 17)))))
           '|lookupIncomplete|)) 
