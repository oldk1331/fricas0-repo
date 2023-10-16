
(SDEFUN |ANTISYM;One;$;1| (($ $))
        (LIST
         (CONS (SPADCALL (QREFELT $ 9) (QREFELT $ 12)) (|spadConstant| $ 13)))) 

(SDEFUN |ANTISYM;coefficient;2$R;2| ((|a| $) (|u| $) ($ R))
        (SPROG
         ((#1=#:G140 NIL) (#2=#:G141 NIL) (|t| NIL) (|x| (|ExtAlgBasis|)))
         (SEQ
          (EXIT
           (COND
            ((NULL (NULL (CDR |u|)))
             (|error| "2nd argument must be a basis element"))
            ('T
             (SEQ (LETT |x| (QCAR (|SPADfirst| |u|)))
                  (SEQ (LETT |t| NIL) (LETT #2# |a|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |t|) |x| (QREFELT $ 16))
                          (PROGN (LETT #1# (QCDR |t|)) (GO #3=#:G139))))
                        (EXIT
                         (COND
                          ((SPADCALL (QCAR |t|) |x| (QREFELT $ 17))
                           (PROGN
                            (LETT #1# (|spadConstant| $ 18))
                            (GO #3#))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (|spadConstant| $ 18))))))
          #3# (EXIT #1#)))) 

(SDEFUN |ANTISYM;retractable?;$B;3| ((|a| $) ($ |Boolean|))
        (COND ((NULL |a|) 'T)
              ('T
               (SPADCALL (QCAR (|SPADfirst| |a|))
                         (SPADCALL (QREFELT $ 9) (QREFELT $ 12))
                         (QREFELT $ 16))))) 

(SDEFUN |ANTISYM;retractIfCan;$U;4| ((|a| $) ($ |Union| R "failed"))
        (COND ((NULL |a|) (CONS 0 (|spadConstant| $ 18)))
              ((SPADCALL (QCAR (|SPADfirst| |a|))
                         (SPADCALL (QREFELT $ 9) (QREFELT $ 12))
                         (QREFELT $ 16))
               (CONS 0 (SPADCALL |a| (QREFELT $ 21))))
              ('T (CONS 1 "failed")))) 

(SDEFUN |ANTISYM;retract;$R;5| ((|a| $) ($ R))
        (COND ((NULL |a|) (|spadConstant| $ 18))
              ('T (SPADCALL |a| (QREFELT $ 21))))) 

(SDEFUN |ANTISYM;homogeneous?;$B;6| ((|a| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G199 NIL) (#2=#:G200 NIL) (#3=#:G192 NIL)
          (#4=#:G191 #5=(|Integer|)) (#6=#:G193 #5#) (#7=#:G203 NIL)
          (#8=#:G105 NIL) (#9=#:G202 NIL) (|ta| NIL) (|siz| #5#)
          (#10=#:G159 NIL) (#11=#:G158 #5#) (#12=#:G160 #5#) (#13=#:G201 NIL)
          (#14=#:G104 NIL))
         (SEQ
          (EXIT
           (COND ((NULL |a|) 'T)
                 (#15='T
                  (SEQ
                   (LETT |siz|
                         (PROGN
                          (LETT #10# NIL)
                          (SEQ (LETT #14# NIL)
                               (LETT #13#
                                     (SPADCALL (QCAR (|SPADfirst| |a|))
                                               (QREFELT $ 26)))
                               G190
                               (COND
                                ((OR (ATOM #13#)
                                     (PROGN (LETT #14# (CAR #13#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #12# #14#)
                                  (COND (#10# (LETT #11# (+ #11# #12#)))
                                        ('T
                                         (PROGN
                                          (LETT #11# #12#)
                                          (LETT #10# 'T)))))))
                               (LETT #13# (CDR #13#)) (GO G190) G191
                               (EXIT NIL))
                          (COND (#10# #11#) (#15# 0))))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |ta| NIL)
                          (LETT #9# (SPADCALL |a| (QREFELT $ 27))) G190
                          (COND
                           ((OR (ATOM #9#) (PROGN (LETT |ta| (CAR #9#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (PROGN
                                (LETT #3# NIL)
                                (SEQ (LETT #8# NIL)
                                     (LETT #7#
                                           (SPADCALL (QCAR |ta|)
                                                     (QREFELT $ 26)))
                                     G190
                                     (COND
                                      ((OR (ATOM #7#)
                                           (PROGN (LETT #8# (CAR #7#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #6# #8#)
                                        (COND (#3# (LETT #4# (+ #4# #6#)))
                                              ('T
                                               (PROGN
                                                (LETT #4# #6#)
                                                (LETT #3# 'T)))))))
                                     (LETT #7# (CDR #7#)) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#3# #4#) ('T 0)))
                               |siz| (QREFELT $ 29))
                              (PROGN
                               (LETT #1#
                                     (PROGN (LETT #2# NIL) (GO #16=#:G198)))
                               (GO #17=#:G195))))))
                          (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL)))
                    #17# (EXIT #1#))
                   (EXIT 'T)))))
          #16# (EXIT #2#)))) 

(SDEFUN |ANTISYM;degree;$Nni;7| ((|a| $) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G211 NIL) (#2=#:G209 NIL) (#3=#:G208 #4=(|Integer|))
          (#5=#:G210 #4#) (#6=#:G215 NIL) (#7=#:G106 NIL))
         (SEQ
          (COND ((NULL |a|) 0)
                ((SPADCALL |a| (QREFELT $ 30))
                 (PROG1
                     (LETT #1#
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT #7# NIL)
                                 (LETT #6#
                                       (SPADCALL (QCAR (|SPADfirst| |a|))
                                                 (QREFELT $ 26)))
                                 G190
                                 (COND
                                  ((OR (ATOM #6#)
                                       (PROGN (LETT #7# (CAR #6#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #5# #7#)
                                    (COND (#2# (LETT #3# (+ #3# #5#)))
                                          ('T
                                           (PROGN
                                            (LETT #3# #5#)
                                            (LETT #2# 'T)))))))
                                 (LETT #6# (CDR #6#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#2# #3#) (#8='T 0))))
                   (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #1#)))
                (#8# (|error| "not a homogeneous element")))))) 

(SDEFUN |ANTISYM;zo| ((|p| |Integer|) (|q| |Integer|) ($ |List| (|Integer|)))
        (COND ((EQL |p| 0) (LIST 1 |q|)) ((EQL |q| 0) (LIST 1 1))
              ('T (LIST 0 0)))) 

(SDEFUN |ANTISYM;getsgn| ((|x| . #1=(|ExtAlgBasis|)) (|y| . #1#) ($ |Integer|))
        (SPROG
         ((|sgn| (|Integer|)) (#2=#:G245 NIL) (#3=#:G244 #4=(|Integer|))
          (#5=#:G246 #4#) (#6=#:G253 NIL) (#7=#:G107 NIL)
          (|xx| #8=(|List| (|Integer|))) (#9=#:G252 NIL) (|i| NIL) (|yy| #8#))
         (SEQ (LETT |sgn| 0) (LETT |xx| (SPADCALL |x| (QREFELT $ 26)))
              (LETT |yy| (SPADCALL |y| (QREFELT $ 26)))
              (SEQ (LETT |i| 1) (LETT #9# (- (QREFELT $ 9) 1)) G190
                   (COND ((|greater_SI| |i| #9#) (GO G191)))
                   (SEQ (LETT |xx| (CDR |xx|))
                        (EXIT
                         (LETT |sgn|
                               (+ |sgn|
                                  (*
                                   (PROGN
                                    (LETT #2# NIL)
                                    (SEQ (LETT #7# NIL) (LETT #6# |xx|) G190
                                         (COND
                                          ((OR (ATOM #6#)
                                               (PROGN
                                                (LETT #7# (CAR #6#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #5# #7#)
                                            (COND (#2# (LETT #3# (+ #3# #5#)))
                                                  ('T
                                                   (PROGN
                                                    (LETT #3# #5#)
                                                    (LETT #2# 'T)))))))
                                         (LETT #6# (CDR #6#)) (GO G190) G191
                                         (EXIT NIL))
                                    (COND (#2# #3#) ('T 0)))
                                   (SPADCALL |yy| |i| (QREFELT $ 33)))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (COND ((EQL (REM |sgn| 2) 0) 1) ('T -1)))))) 

(SDEFUN |ANTISYM;Nalpha|
        ((|x| . #1=(|ExtAlgBasis|)) (|y| . #1#) ($ |List| (|Integer|)))
        (SPROG
         ((#2=#:G260 NIL) (|i| (|Integer|)) (|dum| (|List| (|Integer|)))
          (#3=#:G263 NIL) (|j| NIL) (|dum2| (|List| (|Integer|)))
          (#4=#:G262 NIL) (#5=#:G261 NIL))
         (SEQ (LETT |i| 1)
              (LETT |dum2|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |i| 1) (LETT #4# (QREFELT $ 9)) G190
                          (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ (EXIT (LETT #5# (CONS 0 #5#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (SEQ
               (EXIT
                (SEQ (LETT |j| 1) (LETT #3# (QREFELT $ 9)) G190
                     (COND ((|greater_SI| |j| #3#) (GO G191)))
                     (SEQ
                      (LETT |dum|
                            (|ANTISYM;zo|
                             (SPADCALL (SPADCALL |x| (QREFELT $ 26)) |j|
                                       (QREFELT $ 33))
                             (SPADCALL (SPADCALL |y| (QREFELT $ 26)) |j|
                                       (QREFELT $ 33))
                             $))
                      (LETT |i|
                            (SPADCALL |i| (SPADCALL |dum| 1 (QREFELT $ 33))
                                      (QREFELT $ 34)))
                      (EXIT
                       (COND
                        ((EQL |i| 0)
                         (PROGN (LETT #2# |$NoValue|) (GO #6=#:G257)))
                        ('T
                         (SPADCALL |dum2| |j| (SPADCALL |dum| 2 (QREFELT $ 33))
                                   (QREFELT $ 35))))))
                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL)))
               #6# (EXIT #2#))
              (EXIT
               (COND ((EQL |i| 0) (CONS |i| |dum2|))
                     ('T (CONS (|ANTISYM;getsgn| |x| |y| $) |dum2|))))))) 

(SDEFUN |ANTISYM;*;3$;11| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|z| ($)) (|r| (R)) (|stuff| (|List| (|Integer|))) (#1=#:G277 NIL)
          (|ta| NIL) (#2=#:G276 NIL) (|tb| NIL))
         (SEQ
          (COND ((OR (NULL |a|) (NULL |b|)) (|spadConstant| $ 32))
                ('T
                 (SEQ
                  (COND
                   ((NULL (CDR |a|))
                    (COND
                     ((SPADCALL (QCAR (|SPADfirst| |a|))
                                (SPADCALL (QREFELT $ 9) (QREFELT $ 12))
                                (QREFELT $ 16))
                      (EXIT
                       (SPADCALL (QCDR (|SPADfirst| |a|)) |b|
                                 (QREFELT $ 36)))))))
                  (COND
                   ((NULL (CDR |b|))
                    (COND
                     ((SPADCALL (QCAR (|SPADfirst| |b|))
                                (SPADCALL (QREFELT $ 9) (QREFELT $ 12))
                                (QREFELT $ 16))
                      (EXIT
                       (SPADCALL (QCDR (|SPADfirst| |b|)) |a|
                                 (QREFELT $ 36)))))))
                  (LETT |z| (|spadConstant| $ 32))
                  (SEQ (LETT |tb| NIL) (LETT #2# |b|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |tb| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |ta| NIL) (LETT #1# |a|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |ta| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |stuff|
                                     (|ANTISYM;Nalpha| (QCAR |ta|) (QCAR |tb|)
                                      $))
                               (LETT |r|
                                     (SPADCALL
                                      (SPADCALL (|SPADfirst| |stuff|)
                                                (QCDR |ta|) (QREFELT $ 37))
                                      (QCDR |tb|) (QREFELT $ 38)))
                               (EXIT
                                (COND
                                 ((SPADCALL |r| (|spadConstant| $ 18)
                                            (QREFELT $ 39))
                                  (LETT |z|
                                        (SPADCALL |z|
                                                  (LIST
                                                   (CONS
                                                    (SPADCALL (CDR |stuff|)
                                                              (QREFELT $ 40))
                                                    |r|))
                                                  (QREFELT $ 41)))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT |z|))))))) 

(SDEFUN |ANTISYM;coerce;R$;12| ((|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 18) (QREFELT $ 43))
          (|spadConstant| $ 32))
         ('T (LIST (CONS (SPADCALL (QREFELT $ 9) (QREFELT $ 12)) |r|))))) 

(SDEFUN |ANTISYM;coerce;I$;13| ((|m| |Integer|) ($ $))
        (COND ((EQL |m| 0) (|spadConstant| $ 32))
              ('T
               (LIST
                (CONS (SPADCALL (QREFELT $ 9) (QREFELT $ 12))
                      (SPADCALL |m| (QREFELT $ 45))))))) 

(SDEFUN |ANTISYM;characteristic;Nni;14| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 47))) 

(SDEFUN |ANTISYM;generator;Nni$;15| ((|j| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|dum| (|List| (|Integer|))) (#1=#:G288 NIL) (|i| NIL)
          (#2=#:G287 NIL))
         (SEQ
          (LETT |dum|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 1) (LETT #1# (QREFELT $ 9)) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS 0 #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (SPADCALL |dum| |j| 1 (QREFELT $ 35))
          (EXIT
           (LIST
            (CONS (SPADCALL |dum| (QREFELT $ 40)) (|spadConstant| $ 13))))))) 

(SDEFUN |ANTISYM;exp;L$;16| ((|li| |List| (|Integer|)) ($ $))
        (LIST (CONS (SPADCALL |li| (QREFELT $ 40)) (|spadConstant| $ 13)))) 

(SDEFUN |ANTISYM;leadingBasisTerm;2$;17| ((|a| $) ($ $))
        (LIST (CONS (QCAR (|SPADfirst| |a|)) (|spadConstant| $ 13)))) 

(SDEFUN |ANTISYM;displayList| ((|x| |ExtAlgBasis|) ($ |OutputForm|))
        (SPROG
         ((#1=#:G300 NIL) (|i| NIL) (#2=#:G299 NIL)
          (|le| (|List| (|Integer|))))
         (SEQ (LETT |le| (SPADCALL |x| (QREFELT $ 26)))
              (EXIT
               (SPADCALL (ELT $ 53)
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |i| 1) (LETT #1# (QREFELT $ 9)) G190
                               (COND ((|greater_SI| |i| #1#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((EQL (SPADCALL |le| |i| (QREFELT $ 33)) 1)
                                   (LETT #2#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL (QREFELT $ 7) |i|
                                                     (QREFELT $ 56))
                                           (QREFELT $ 57))
                                          #2#))))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 60)))))) 

(SDEFUN |ANTISYM;makeTerm| ((|r| R) (|x| |ExtAlgBasis|) ($ |OutputForm|))
        (COND
         ((SPADCALL |x| (SPADCALL (QREFELT $ 9) (QREFELT $ 12)) (QREFELT $ 16))
          (SPADCALL |r| (QREFELT $ 61)))
         ((SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 43))
          (|ANTISYM;displayList| |x| $))
         ('T
          (SPADCALL (SPADCALL |r| (QREFELT $ 61)) (|ANTISYM;displayList| |x| $)
                    (QREFELT $ 53))))) 

(SDEFUN |ANTISYM;coerce;$Of;20| ((|a| $) ($ |OutputForm|))
        (SPROG
         ((#1=#:G312 NIL)
          (|t| (|Record| (|:| |k| (|ExtAlgBasis|)) (|:| |c| R)))
          (#2=#:G311 NIL))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT $ 62)) (SPADCALL 0 (QREFELT $ 63)))
                ((NULL (CDR |a|))
                 (SEQ (LETT |t| (|SPADfirst| |a|))
                      (EXIT (|ANTISYM;makeTerm| (QCDR |t|) (QCAR |t|) $))))
                ('T
                 (SPADCALL (ELT $ 64)
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |t| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (|ANTISYM;makeTerm| (QCDR |t|)
                                           (QCAR |t|) $)
                                          #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 60))))))) 

(DECLAIM (NOTINLINE |AntiSymm;|)) 

(DEFUN |AntiSymm| (&REST #1=#:G317)
  (SPROG NIL
         (PROG (#2=#:G318)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AntiSymm|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AntiSymm;|) #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|AntiSymm|)))))))))) 

(DEFUN |AntiSymm;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|AntiSymm| DV$1 DV$2))
          (LETT $ (GETREFV 72))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|AntiSymm| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|List|
                     (|Record| (|:| |k| (|ExtAlgBasis|)) (|:| |c| |#1|))))
          (QSETREFV $ 9 (LENGTH |#2|))
          $))) 

(MAKEPROP '|AntiSymm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 6 11) (|local| |#1|)
              (|local| |#2|) '|Rep| '|dim| (|NonNegativeInteger|)
              (|ExtAlgBasis|) (0 . |Nul|) (5 . |One|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |ANTISYM;One;$;1|) $))
              (|Boolean|) (9 . =) (15 . <) (21 . |Zero|)
              |ANTISYM;coefficient;2$R;2| |ANTISYM;retractable?;$B;3|
              (25 . |leadingCoefficient|) (|Union| 6 '"failed")
              |ANTISYM;retractIfCan;$U;4| |ANTISYM;retract;$R;5| (|List| 28)
              (30 . |exponents|) (35 . |reductum|) (|Integer|) (40 . ~=)
              |ANTISYM;homogeneous?;$B;6| |ANTISYM;degree;$Nni;7| (46 . |Zero|)
              (50 . |elt|) (56 . *) (62 . |setelt!|) (69 . *) (75 . *) (81 . *)
              (87 . ~=) (93 . |coerce|) (98 . +) |ANTISYM;*;3$;11| (104 . =)
              |ANTISYM;coerce;R$;12| (110 . |coerce|) |ANTISYM;coerce;I$;13|
              (115 . |characteristic|) |ANTISYM;characteristic;Nni;14|
              |ANTISYM;generator;Nni$;15| |ANTISYM;exp;L$;16|
              |ANTISYM;leadingBasisTerm;2$;17| (|OutputForm|) (119 . *)
              (|Symbol|) (|List| 54) (125 . |elt|) (131 . |coerce|)
              (|Mapping| 52 52 52) (|List| 52) (136 . |reduce|)
              (142 . |coerce|) (147 . |zero?|) (152 . |coerce|) (157 . +)
              |ANTISYM;coerce;$Of;20| (|Mapping| 6 6) (|Union| $ '"failed")
              (|PositiveInteger|) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 163 |zero?| 169 |subtractIfCan| 174 |sample| 180 |rightRecip|
              184 |rightPower| 189 |retractable?| 201 |retractIfCan| 206
              |retract| 211 |reductum| 216 |recip| 221 |opposite?| 226 |one?|
              232 |map| 237 |leftRecip| 243 |leftPower| 248
              |leadingCoefficient| 260 |leadingBasisTerm| 265 |latex| 270
              |homogeneous?| 275 |hashUpdate!| 280 |hash| 286 |generator| 291
              |exp| 296 |degree| 301 |commutator| 306 |coerce| 312
              |coefficient| 327 |characteristic| 333 |associator| 337
              |antiCommutator| 344 |annihilate?| 350 ^ 356 |Zero| 368 |One| 372
              = 376 - 382 + 393 * 399)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0))
            (CONS
             '#(|LeftAlgebra&| NIL |Rng&| NIL NIL |NonAssociativeRing&| NIL NIL
                |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Magma&| |AbelianSemiGroup&| |SetCategory&| |RetractableTo&|
                NIL |BasicType&| NIL)
             (CONS
              '#((|LeftAlgebra| 6) (|Ring|) (|Rng|) (|SemiRing|) (|SemiRng|)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|LeftModule| 6)
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| $$)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Magma|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|RetractableTo| 6)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 52))
              (|makeByteWordVec2| 71
                                  '(1 11 0 10 12 0 6 0 13 2 11 15 0 0 16 2 11
                                    15 0 0 17 0 6 0 18 1 0 6 0 21 1 11 25 0 26
                                    1 0 0 0 27 2 28 15 0 0 29 0 0 0 32 2 25 28
                                    0 28 33 2 28 0 10 0 34 3 25 28 0 28 28 35 2
                                    0 0 6 0 36 2 6 0 28 0 37 2 6 0 0 0 38 2 6
                                    15 0 0 39 1 11 0 25 40 2 0 0 0 0 41 2 6 15
                                    0 0 43 1 6 0 28 45 0 6 10 47 2 52 0 0 0 53
                                    2 55 54 0 28 56 1 54 52 0 57 2 59 52 58 0
                                    60 1 6 52 0 61 1 0 15 0 62 1 28 52 0 63 2
                                    52 0 0 0 64 2 0 15 0 0 1 1 0 15 0 62 2 0 67
                                    0 0 1 0 0 0 1 1 0 67 0 1 2 0 0 0 10 1 2 0 0
                                    0 68 1 1 0 15 0 20 1 0 22 0 23 1 0 6 0 24 1
                                    0 0 0 27 1 0 67 0 1 2 0 15 0 0 1 1 0 15 0 1
                                    2 0 0 66 0 1 1 0 67 0 1 2 0 0 0 10 1 2 0 0
                                    0 68 1 1 0 6 0 21 1 0 0 0 51 1 0 70 0 1 1 0
                                    15 0 30 2 0 69 69 0 1 1 0 71 0 1 1 0 0 10
                                    49 1 0 0 25 50 1 0 10 0 31 2 0 0 0 0 1 1 0
                                    0 6 44 1 0 0 28 46 1 0 52 0 65 2 0 6 0 0 19
                                    0 0 10 48 3 0 0 0 0 0 1 2 0 0 0 0 1 2 0 15
                                    0 0 1 2 0 0 0 10 1 2 0 0 0 68 1 0 0 0 32 0
                                    0 0 14 2 0 15 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 41 2 0 0 6 0 36 2 0 0 10 0 1 2 0 0
                                    28 0 1 2 0 0 0 0 42 2 0 0 68 0 1)))))
           '|lookupComplete|)) 
