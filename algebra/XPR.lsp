
(/VERSIONCHECK 2) 

(DEFUN |XPR;One;$;1| ($)
  (LIST (CONS (|spadConstant| $ 9) (|spadConstant| $ 10)))) 

(DEFUN |XPR;characteristic;Nni;2| ($) (SPADCALL (QREFELT $ 13))) 

(PUT '|XPR;#;$Nni;3| '|SPADreplace| 'LENGTH) 

(DEFUN |XPR;#;$Nni;3| (|x| $) (LENGTH |x|)) 

(DEFUN |XPR;maxdeg;$E;4| (|p| $)
  (COND ((NULL |p|) (|error| "zero polynomial !!"))
        ('T (QCAR (|SPADfirst| |p|))))) 

(DEFUN |XPR;mindeg;$E;5| (|p| $)
  (COND ((NULL |p|) (|error| "zero polynomial !!"))
        ('T (QCAR (SPADCALL |p| (QREFELT $ 18)))))) 

(DEFUN |XPR;coef;$ER;6| (|p| |e| $)
  (PROG (#1=#:G145 #2=#:G149 #3=#:G150 |tm|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |tm| NIL . #4=(|XPR;coef;$ER;6|)) (LETT #3# |p| . #4#) G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |tm| (CAR #3#) . #4#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL (QCAR |tm|) |e| (QREFELT $ 21))
                 (PROGN (LETT #2# (QCDR |tm|) . #4#) (GO #2#)))
                ('T
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (QCAR |tm|) |e| (QREFELT $ 22))
                     (PROGN
                      (LETT #1#
                            (PROGN
                             (LETT #2# (|spadConstant| $ 23) . #4#)
                             (GO #2#))
                            . #4#)
                      (GO #1#)))))
                  #1# (EXIT #1#))))))
             (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT (|spadConstant| $ 23))))
      #2# (EXIT #2#))))) 

(DEFUN |XPR;constant?;$B;7| (|p| $)
  (COND ((SPADCALL |p| (|spadConstant| $ 25) (QREFELT $ 26)) 'T)
        ('T
         (SPADCALL (SPADCALL |p| (QREFELT $ 16)) (|spadConstant| $ 9)
                   (QREFELT $ 21))))) 

(DEFUN |XPR;constant;$R;8| (|p| $)
  (SPADCALL |p| (|spadConstant| $ 9) (QREFELT $ 24))) 

(DEFUN |XPR;quasiRegular?;$B;9| (|p| $)
  (COND ((SPADCALL |p| (|spadConstant| $ 25) (QREFELT $ 26)) 'T)
        ('T
         (SPADCALL (QCAR (SPADCALL |p| (QREFELT $ 18))) (|spadConstant| $ 9)
                   (QREFELT $ 29))))) 

(DEFUN |XPR;quasiRegular;2$;10| (|p| $)
  (PROG (#1=#:G162 |t| #2=#:G161)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 30)) |p|)
            (#3='T
             (PROGN
              (LETT #2# NIL . #4=(|XPR;quasiRegular;2$;10|))
              (SEQ (LETT |t| NIL . #4#) (LETT #1# |p| . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((SPADCALL (QCAR |t|) (|spadConstant| $ 9)
                                   (QREFELT $ 21))
                         'NIL)
                        (#3# 'T))
                       (LETT #2# (CONS |t| #2#) . #4#)))))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |XPR;recip;$U;11| (|p| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |p| (|spadConstant| $ 25) (QREFELT $ 26))
            (SPADCALL (QCAR (|SPADfirst| |p|)) (|spadConstant| $ 9)
                      (QREFELT $ 32)))
        (CONS 1 "failed"))
       ('T
        (SEQ
         (LETT |u| (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 34))
               |XPR;recip;$U;11|)
         (EXIT
          (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                ('T (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 35))))))))))))) 

(DEFUN |XPR;coerce;R$;12| (|r| $)
  (COND
   ((SPADCALL |r| (|spadConstant| $ 23) (QREFELT $ 37)) (|spadConstant| $ 25))
   ('T (LIST (CONS (|spadConstant| $ 9) |r|))))) 

(DEFUN |XPR;coerce;I$;13| (|n| $)
  (SPADCALL (SPADCALL |n| (QREFELT $ 39)) (QREFELT $ 35))) 

(DEFUN |XPR;*;3$;14| (|p1| |p2| $)
  (PROG (#1=#:G179 #2=#:G178 #3=#:G180 #4=#:G186 |t2| #5=#:G185 #6=#:G184 |t1|)
    (RETURN
     (SEQ
      (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| $ 25))
            ('T
             (COND
              ((SPADCALL (QCAR (|SPADfirst| |p1|)) (|spadConstant| $ 9)
                         (QREFELT $ 21))
               (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT $ 41)))
              ((SPADCALL |p2| (|spadConstant| $ 11) (QREFELT $ 26)) |p1|)
              (#7='T
               (PROGN
                (LETT #1# NIL . #8=(|XPR;*;3$;14|))
                (SEQ (LETT |t1| NIL . #8#) (LETT #6# |p1| . #8#) G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |t1| (CAR #6#) . #8#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #3#
                              (PROGN
                               (LETT #5# NIL . #8#)
                               (SEQ (LETT |t2| NIL . #8#) (LETT #4# |p2| . #8#)
                                    G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN
                                           (LETT |t2| (CAR #4#) . #8#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #5#
                                            (CONS
                                             (CONS
                                              (SPADCALL (QCAR |t1|) (QCAR |t2|)
                                                        (QREFELT $ 42))
                                              (SPADCALL (QCDR |t1|) (QCDR |t2|)
                                                        (QREFELT $ 43)))
                                             #5#)
                                            . #8#)))
                                    (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                                    (EXIT (NREVERSE #5#))))
                              . #8#)
                        (COND
                         (#1#
                          (LETT #2# (SPADCALL #2# #3# (QREFELT $ 44)) . #8#))
                         ('T
                          (PROGN (LETT #2# #3# . #8#) (LETT #1# 'T . #8#)))))))
                     (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) (#7# (|spadConstant| $ 25)))))))))))) 

(DEFUN |XPR;*;3$;15| (|p1| |p2| $)
  (PROG (#1=#:G189 #2=#:G188 #3=#:G190 |r| #4=#:G197 |t2| #5=#:G196 #6=#:G195
         |t1|)
    (RETURN
     (SEQ
      (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| $ 25))
            ('T
             (COND
              ((SPADCALL (QCAR (|SPADfirst| |p1|)) (|spadConstant| $ 9)
                         (QREFELT $ 21))
               (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT $ 41)))
              ((SPADCALL |p2| (|spadConstant| $ 11) (QREFELT $ 26)) |p1|)
              (#7='T
               (PROGN
                (LETT #1# NIL . #8=(|XPR;*;3$;15|))
                (SEQ (LETT |t1| NIL . #8#) (LETT #6# |p1| . #8#) G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |t1| (CAR #6#) . #8#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #3#
                              (PROGN
                               (LETT #5# NIL . #8#)
                               (SEQ (LETT |t2| NIL . #8#) (LETT #4# |p2| . #8#)
                                    G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN
                                           (LETT |t2| (CAR #4#) . #8#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SEQ
                                         (LETT |r|
                                               (SPADCALL (QCDR |t1|)
                                                         (QCDR |t2|)
                                                         (QREFELT $ 43))
                                               . #8#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |r| (|spadConstant| $ 23)
                                                      (QREFELT $ 37))
                                            'NIL)
                                           ('T 'T))))
                                        (LETT #5#
                                              (CONS
                                               (CONS
                                                (SPADCALL (QCAR |t1|)
                                                          (QCAR |t2|)
                                                          (QREFELT $ 42))
                                                |r|)
                                               #5#)
                                              . #8#)))))
                                    (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                                    (EXIT (NREVERSE #5#))))
                              . #8#)
                        (COND
                         (#1#
                          (LETT #2# (SPADCALL #2# #3# (QREFELT $ 44)) . #8#))
                         ('T
                          (PROGN (LETT #2# #3# . #8#) (LETT #1# 'T . #8#)))))))
                     (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) (#7# (|spadConstant| $ 25)))))))))))) 

(DEFUN |XPR;^;$Nni$;16| (|p| |nn| $) (|XPR;repeatMultExpt| |p| |nn| $)) 

(DEFUN |XPR;repeatMultExpt| (|x| |nn| $)
  (PROG (|y| |i|)
    (RETURN
     (SEQ
      (COND ((EQL |nn| 0) (|spadConstant| $ 11))
            ('T
             (SEQ (LETT |y| |x| . #1=(|XPR;repeatMultExpt|))
                  (SEQ (LETT |i| 2 . #1#) G190
                       (COND ((|greater_SI| |i| |nn|) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |y| (SPADCALL |x| |y| (QREFELT $ 45)) . #1#)))
                       (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |y|)))))))) 

(DEFUN |XPR;outTerm| (|r| |m| $)
  (COND
   ((SPADCALL |r| (|spadConstant| $ 10) (QREFELT $ 37))
    (SPADCALL |m| (QREFELT $ 48)))
   ((SPADCALL |m| (|spadConstant| $ 9) (QREFELT $ 21))
    (SPADCALL |r| (QREFELT $ 49)))
   ('T
    (SPADCALL (SPADCALL |r| (QREFELT $ 49)) (SPADCALL |m| (QREFELT $ 48))
              (QREFELT $ 50))))) 

(DEFUN |XPR;coerce;$Of;19| (|a| $)
  (PROG (#1=#:G210 |t| #2=#:G209)
    (RETURN
     (SEQ
      (COND ((NULL |a|) (SPADCALL (|spadConstant| $ 23) (QREFELT $ 49)))
            ('T
             (SPADCALL (ELT $ 51)
                       (NREVERSE
                        (PROGN
                         (LETT #2# NIL . #3=(|XPR;coerce;$Of;19|))
                         (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (|XPR;outTerm| (QCDR |t|) (QCAR |t|) $)
                                       #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))
                       (QREFELT $ 54)))))))) 

(DEFUN |XPR;/;$R$;20| (|x| |r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 56)) |x| (QREFELT $ 41))) 

(DEFUN |XPolynomialRing| (&REST #1=#:G221)
  (PROG ()
    (RETURN
     (PROG (#2=#:G222)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|XPolynomialRing|)
                                           '|domainEqualList|)
                . #3=(|XPolynomialRing|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |XPolynomialRing;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|XPolynomialRing|))))))))))) 

(DEFUN |XPolynomialRing;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G219 #2=#:G220 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|XPolynomialRing|))
      (LETT DV$2 (|devaluate| |#2|) . #3#)
      (LETT |dv$| (LIST '|XPolynomialRing| DV$1 DV$2) . #3#)
      (LETT $ (GETREFV 69) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#1| '(|SemiRing|))
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoid|))
                                                . #3#)
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|OrderedAbelianMonoidSup|)))
                                          (|HasCategory| |#1|
                                                         '(|canonicalUnitNormal|))
                                          (|HasCategory| |#1|
                                                         '(|noZeroDivisors|))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|Comparable|))
                                                . #3#)
                                          (OR #1# #2#
                                              (|HasCategory| |#1|
                                                             '(|OrderedAbelianMonoidSup|)))
                                          (|HasCategory| |#1| '(|Field|))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|XPolynomialRing| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|List| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
      (COND
       ((|testBitVector| |pv$| 7)
        (QSETREFV $ 45 (CONS (|dispatchFunction| |XPR;*;3$;14|) $)))
       ('T (QSETREFV $ 45 (CONS (|dispatchFunction| |XPR;*;3$;15|) $))))
      (COND
       ((|testBitVector| |pv$| 10)
        (QSETREFV $ 57 (CONS (|dispatchFunction| |XPR;/;$R$;20|) $))))
      $)))) 

(MAKEPROP '|XPolynomialRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 6 7) (|local| |#1|)
              (|local| |#2|) '|Rep| (0 . |One|) (4 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |XPR;One;$;1|) $))
              (|NonNegativeInteger|) (8 . |characteristic|)
              |XPR;characteristic;Nni;2| |XPR;#;$Nni;3| |XPR;maxdeg;$E;4|
              (|Record| (|:| |k| 7) (|:| |c| 6)) (12 . |last|)
              |XPR;mindeg;$E;5| (|Boolean|) (17 . =) (23 . <) (29 . |Zero|)
              |XPR;coef;$ER;6| (33 . |Zero|) (37 . =) |XPR;constant?;$B;7|
              |XPR;constant;$R;8| (43 . ~=) |XPR;quasiRegular?;$B;9|
              |XPR;quasiRegular;2$;10| (49 . >) (|Union| $ '"failed")
              (55 . |recip|) |XPR;coerce;R$;12| |XPR;recip;$U;11| (60 . =)
              (|Integer|) (66 . |coerce|) |XPR;coerce;I$;13| (71 . *) (77 . *)
              (83 . *) (89 . +) (95 . *) |XPR;^;$Nni$;16| (|OutputForm|)
              (101 . |coerce|) (106 . |coerce|) (111 . *) (117 . +)
              (|Mapping| 47 47 47) (|List| 47) (123 . |reduce|)
              |XPR;coerce;$Of;19| (129 . |inv|) (134 . /) (|Mapping| 6 7)
              (|Union| 7 '"failed") (|List| 17) (|Mapping| 6 6) (|List| 6)
              (|List| 7) (|List| $) (|PositiveInteger|) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(|recip| 140 |quasiRegular?| 145 |quasiRegular| 150 |mindeg| 155
              |maxdeg| 160 |constant?| 165 |constant| 170 |coerce| 175 |coef|
              190 |characteristic| 196 ^ 200 |Zero| 206 |One| 210 = 214 / 220 +
              226 * 232 |#| 244)
           'NIL
           (CONS
            (|makeByteWordVec2| 9
                                '(0 0 1 0 1 0 0 3 0 0 0 0 0 3 0 5 0 0 5 0 0 0 5
                                  0 0 9 0 0 0 0 2 4 6 7))
            (CONS
             '#(NIL |FreeModuleCategory&| |Algebra&| NIL |Module&| NIL |Ring&|
                NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |OrderedSet&| |SemiGroup&|
                |AbelianSemiGroup&| NIL |SetCategory&| NIL |BasicType&| NIL
                |RetractableTo&| |PartialOrder&| NIL NIL)
             (CONS
              '#((|XAlgebra| 6) (|FreeModuleCategory| 6 7) (|Algebra| 6)
                 (|IndexedDirectProductCategory| 6 7) (|Module| 6)
                 (|BiModule| 6 6) (|Ring|) (|OrderedAbelianMonoidSup|)
                 (|AbelianProductCategory| 6) (|LeftModule| 6)
                 (|RightModule| 6) (|Rng|) (|LeftModule| $$)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedAbelianSemiGroup|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|OrderedSet|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Comparable|) (|SetCategory|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 47)
                 (|RetractableTo| 7) (|PartialOrder|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|))
              (|makeByteWordVec2| 57
                                  '(0 7 0 9 0 6 0 10 0 6 12 13 1 8 17 0 18 2 7
                                    20 0 0 21 2 7 20 0 0 22 0 6 0 23 0 0 0 25 2
                                    0 20 0 0 26 2 7 20 0 0 29 2 7 20 0 0 32 1 6
                                    33 0 34 2 6 20 0 0 37 1 6 0 38 39 2 0 0 6 0
                                    41 2 7 0 0 0 42 2 6 0 0 0 43 2 0 0 0 0 44 2
                                    0 0 0 0 45 1 7 47 0 48 1 6 47 0 49 2 47 0 0
                                    0 50 2 47 0 0 0 51 2 53 47 52 0 54 1 6 0 0
                                    56 2 0 0 0 6 57 1 0 33 0 36 1 0 20 0 30 1 0
                                    0 0 31 1 0 7 0 19 1 0 7 0 16 1 0 20 0 27 1
                                    0 6 0 28 1 0 0 6 35 1 0 0 38 40 1 0 47 0 55
                                    2 0 6 0 7 24 0 0 12 14 2 0 0 0 12 46 0 0 0
                                    25 0 0 0 11 2 0 20 0 0 26 2 10 0 0 6 57 2 0
                                    0 0 0 44 2 0 0 6 0 41 2 0 0 0 0 45 1 0 12 0
                                    15)))))
           '|lookupIncomplete|)) 
