
(/VERSIONCHECK 2) 

(DEFUN |ANTISYM;One;$;1| ($)
  (LIST (CONS (SPADCALL (QREFELT $ 9) (QREFELT $ 12)) (|spadConstant| $ 13)))) 

(DEFUN |ANTISYM;coefficient;2$R;2| (|a| |u| $)
  (PROG (#1=#:G131 #2=#:G132 |t| |x|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL (NULL (CDR |u|)))
         (|error| "2nd argument must be a basis element"))
        ('T
         (SEQ
          (LETT |x| (QCAR (|SPADfirst| |u|))
                . #3=(|ANTISYM;coefficient;2$R;2|))
          (SEQ (LETT |t| NIL . #3#) (LETT #2# |a| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (COND
                 ((SPADCALL (QCAR |t|) |x| (QREFELT $ 16))
                  (PROGN (LETT #1# (QCDR |t|) . #3#) (GO #1#))))
                (EXIT
                 (COND
                  ((SPADCALL (QCAR |t|) |x| (QREFELT $ 17))
                   (PROGN (LETT #1# (|spadConstant| $ 18) . #3#) (GO #1#))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (|spadConstant| $ 18))))))
      #1# (EXIT #1#))))) 

(DEFUN |ANTISYM;retractable?;$B;3| (|a| $)
  (COND ((NULL |a|) 'T)
        ('T
         (SPADCALL (QCAR (|SPADfirst| |a|))
                   (SPADCALL (QREFELT $ 9) (QREFELT $ 12)) (QREFELT $ 16))))) 

(DEFUN |ANTISYM;retractIfCan;$U;4| (|a| $)
  (COND ((NULL |a|) (CONS 0 (|spadConstant| $ 18)))
        ((SPADCALL (QCAR (|SPADfirst| |a|))
                   (SPADCALL (QREFELT $ 9) (QREFELT $ 12)) (QREFELT $ 16))
         (CONS 0 (SPADCALL |a| (QREFELT $ 21))))
        ('T (CONS 1 "failed")))) 

(DEFUN |ANTISYM;retract;$R;5| (|a| $)
  (COND ((NULL |a|) (|spadConstant| $ 18)) ('T (SPADCALL |a| (QREFELT $ 21))))) 

(DEFUN |ANTISYM;homogeneous?;$B;6| (|a| $)
  (PROG (#1=#:G183 #2=#:G185 #3=#:G180 #4=#:G179 #5=#:G181 #6=#:G188 #7=#:G104
         #8=#:G187 |ta| |siz| #9=#:G147 #10=#:G146 #11=#:G148 #12=#:G186
         #13=#:G103)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |a|) 'T)
             (#14='T
              (SEQ
               (LETT |siz|
                     (PROGN
                      (LETT #9# NIL . #15=(|ANTISYM;homogeneous?;$B;6|))
                      (SEQ (LETT #13# NIL . #15#)
                           (LETT #12#
                                 (SPADCALL (QCAR (|SPADfirst| |a|))
                                           (QREFELT $ 26))
                                 . #15#)
                           G190
                           (COND
                            ((OR (ATOM #12#)
                                 (PROGN (LETT #13# (CAR #12#) . #15#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #11# #13# . #15#)
                              (COND (#9# (LETT #10# (+ #10# #11#) . #15#))
                                    ('T
                                     (PROGN
                                      (LETT #10# #11# . #15#)
                                      (LETT #9# 'T . #15#)))))))
                           (LETT #12# (CDR #12#) . #15#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#9# #10#) (#14# 0)))
                     . #15#)
               (SEQ
                (EXIT
                 (SEQ (LETT |ta| NIL . #15#)
                      (LETT #8# (SPADCALL |a| (QREFELT $ 27)) . #15#) G190
                      (COND
                       ((OR (ATOM #8#)
                            (PROGN (LETT |ta| (CAR #8#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL
                           (PROGN
                            (LETT #3# NIL . #15#)
                            (SEQ (LETT #7# NIL . #15#)
                                 (LETT #6#
                                       (SPADCALL (QCAR |ta|) (QREFELT $ 26))
                                       . #15#)
                                 G190
                                 (COND
                                  ((OR (ATOM #6#)
                                       (PROGN (LETT #7# (CAR #6#) . #15#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #5# #7# . #15#)
                                    (COND (#3# (LETT #4# (+ #4# #5#) . #15#))
                                          ('T
                                           (PROGN
                                            (LETT #4# #5# . #15#)
                                            (LETT #3# 'T . #15#)))))))
                                 (LETT #6# (CDR #6#) . #15#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#3# #4#) ('T 0)))
                           |siz| (QREFELT $ 29))
                          (PROGN
                           (LETT #1# (PROGN (LETT #2# 'NIL . #15#) (GO #2#))
                                 . #15#)
                           (GO #1#))))))
                      (LETT #8# (CDR #8#) . #15#) (GO G190) G191 (EXIT NIL)))
                #1# (EXIT #1#))
               (EXIT 'T)))))
      #2# (EXIT #2#))))) 

(DEFUN |ANTISYM;degree;$Nni;7| (|a| $)
  (PROG (#1=#:G196 #2=#:G194 #3=#:G193 #4=#:G195 #5=#:G199 #6=#:G105)
    (RETURN
     (SEQ
      (COND ((NULL |a|) 0)
            ((SPADCALL |a| (QREFELT $ 30))
             (PROG1
                 (LETT #1#
                       (PROGN
                        (LETT #2# NIL . #7=(|ANTISYM;degree;$Nni;7|))
                        (SEQ (LETT #6# NIL . #7#)
                             (LETT #5#
                                   (SPADCALL (QCAR (|SPADfirst| |a|))
                                             (QREFELT $ 26))
                                   . #7#)
                             G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN (LETT #6# (CAR #5#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #4# #6# . #7#)
                                (COND (#2# (LETT #3# (+ #3# #4#) . #7#))
                                      ('T
                                       (PROGN
                                        (LETT #3# #4# . #7#)
                                        (LETT #2# 'T . #7#)))))))
                             (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#2# #3#) (#8='T 0)))
                       . #7#)
               (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))
            (#8# (|error| "not a homogeneous element"))))))) 

(DEFUN |ANTISYM;zo| (|p| |q| $)
  (COND ((EQL |p| 0) (LIST 1 |q|)) ((EQL |q| 0) (LIST 1 1)) ('T (LIST 0 0)))) 

(DEFUN |ANTISYM;getsgn| (|x| |y| $)
  (PROG (|sgn| #1=#:G220 #2=#:G219 #3=#:G221 #4=#:G228 #5=#:G106 |xx| #6=#:G227
         |i| |yy|)
    (RETURN
     (SEQ (LETT |sgn| 0 . #7=(|ANTISYM;getsgn|))
          (LETT |xx| (SPADCALL |x| (QREFELT $ 26)) . #7#)
          (LETT |yy| (SPADCALL |y| (QREFELT $ 26)) . #7#)
          (SEQ (LETT |i| 1 . #7#) (LETT #6# (- (QREFELT $ 9) 1) . #7#) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ (LETT |xx| (CDR |xx|) . #7#)
                    (EXIT
                     (LETT |sgn|
                           (+ |sgn|
                              (*
                               (PROGN
                                (LETT #1# NIL . #7#)
                                (SEQ (LETT #5# NIL . #7#) (LETT #4# |xx| . #7#)
                                     G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN
                                            (LETT #5# (CAR #4#) . #7#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #3# #5# . #7#)
                                        (COND
                                         (#1# (LETT #2# (+ #2# #3#) . #7#))
                                         ('T
                                          (PROGN
                                           (LETT #2# #3# . #7#)
                                           (LETT #1# 'T . #7#)))))))
                                     (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#1# #2#) ('T 0)))
                               (SPADCALL |yy| |i| (QREFELT $ 33))))
                           . #7#)))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT (COND ((EQL (REM |sgn| 2) 0) 1) ('T -1))))))) 

(DEFUN |ANTISYM;Nalpha| (|x| |y| $)
  (PROG (#1=#:G232 |i| |dum| #2=#:G237 |j| |dum2| #3=#:G236 #4=#:G235)
    (RETURN
     (SEQ (LETT |i| 1 . #5=(|ANTISYM;Nalpha|))
          (LETT |dum2|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |i| 1 . #5#) (LETT #3# (QREFELT $ 9) . #5#) G190
                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ (EXIT (LETT #4# (CONS 0 #4#) . #5#)))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (SEQ
           (EXIT
            (SEQ (LETT |j| 1 . #5#) (LETT #2# (QREFELT $ 9) . #5#) G190
                 (COND ((|greater_SI| |j| #2#) (GO G191)))
                 (SEQ
                  (LETT |dum|
                        (|ANTISYM;zo|
                         (SPADCALL (SPADCALL |x| (QREFELT $ 26)) |j|
                                   (QREFELT $ 33))
                         (SPADCALL (SPADCALL |y| (QREFELT $ 26)) |j|
                                   (QREFELT $ 33))
                         $)
                        . #5#)
                  (LETT |i|
                        (SPADCALL |i| (SPADCALL |dum| 1 (QREFELT $ 33))
                                  (QREFELT $ 34))
                        . #5#)
                  (EXIT
                   (COND
                    ((EQL |i| 0) (PROGN (LETT #1# |$NoValue| . #5#) (GO #1#)))
                    ('T
                     (SPADCALL |dum2| |j| (SPADCALL |dum| 2 (QREFELT $ 33))
                               (QREFELT $ 35))))))
                 (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL)))
           #1# (EXIT #1#))
          (EXIT
           (COND ((EQL |i| 0) (CONS |i| |dum2|))
                 ('T (CONS (|ANTISYM;getsgn| |x| |y| $) |dum2|)))))))) 

(DEFUN |ANTISYM;*;3$;11| (|a| |b| $)
  (PROG (|z| |r| |stuff| #1=#:G249 |ta| #2=#:G248 |tb|)
    (RETURN
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
                   (SPADCALL (QCDR (|SPADfirst| |a|)) |b| (QREFELT $ 36)))))))
              (COND
               ((NULL (CDR |b|))
                (COND
                 ((SPADCALL (QCAR (|SPADfirst| |b|))
                            (SPADCALL (QREFELT $ 9) (QREFELT $ 12))
                            (QREFELT $ 16))
                  (EXIT
                   (SPADCALL (QCDR (|SPADfirst| |b|)) |a| (QREFELT $ 36)))))))
              (LETT |z| (|spadConstant| $ 32) . #3=(|ANTISYM;*;3$;11|))
              (SEQ (LETT |tb| NIL . #3#) (LETT #2# |b| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |tb| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |ta| NIL . #3#) (LETT #1# |a| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |ta| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |stuff|
                                 (|ANTISYM;Nalpha| (QCAR |ta|) (QCAR |tb|) $)
                                 . #3#)
                           (LETT |r|
                                 (SPADCALL
                                  (SPADCALL (|SPADfirst| |stuff|) (QCDR |ta|)
                                            (QREFELT $ 37))
                                  (QCDR |tb|) (QREFELT $ 38))
                                 . #3#)
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
                                              (QREFELT $ 41))
                                    . #3#)))))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))))))) 

(DEFUN |ANTISYM;coerce;R$;12| (|r| $)
  (COND
   ((SPADCALL |r| (|spadConstant| $ 18) (QREFELT $ 43)) (|spadConstant| $ 32))
   ('T (LIST (CONS (SPADCALL (QREFELT $ 9) (QREFELT $ 12)) |r|))))) 

(DEFUN |ANTISYM;coerce;I$;13| (|m| $)
  (COND ((EQL |m| 0) (|spadConstant| $ 32))
        ('T
         (LIST
          (CONS (SPADCALL (QREFELT $ 9) (QREFELT $ 12))
                (SPADCALL |m| (QREFELT $ 45))))))) 

(DEFUN |ANTISYM;characteristic;Nni;14| ($) (SPADCALL (QREFELT $ 47))) 

(DEFUN |ANTISYM;generator;Nni$;15| (|j| $)
  (PROG (|dum| #1=#:G260 |i| #2=#:G259)
    (RETURN
     (SEQ
      (LETT |dum|
            (PROGN
             (LETT #2# NIL . #3=(|ANTISYM;generator;Nni$;15|))
             (SEQ (LETT |i| 1 . #3#) (LETT #1# (QREFELT $ 9) . #3#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS 0 #2#) . #3#)))
                  (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (SPADCALL |dum| |j| 1 (QREFELT $ 35))
      (EXIT
       (LIST (CONS (SPADCALL |dum| (QREFELT $ 40)) (|spadConstant| $ 13)))))))) 

(DEFUN |ANTISYM;exp;L$;16| (|li| $)
  (LIST (CONS (SPADCALL |li| (QREFELT $ 40)) (|spadConstant| $ 13)))) 

(DEFUN |ANTISYM;leadingBasisTerm;2$;17| (|a| $)
  (LIST (CONS (QCAR (|SPADfirst| |a|)) (|spadConstant| $ 13)))) 

(DEFUN |ANTISYM;displayList| (|x| $)
  (PROG (#1=#:G272 |i| #2=#:G271 |le|)
    (RETURN
     (SEQ
      (LETT |le| (SPADCALL |x| (QREFELT $ 26)) . #3=(|ANTISYM;displayList|))
      (EXIT
       (SPADCALL (ELT $ 53)
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |i| 1 . #3#) (LETT #1# (QREFELT $ 9) . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |le| |i| (QREFELT $ 33)) 1)
                           (LETT #2#
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL (QREFELT $ 7) |i| (QREFELT $ 56))
                                   (QREFELT $ 57))
                                  #2#)
                                 . #3#)))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 60))))))) 

(DEFUN |ANTISYM;makeTerm| (|r| |x| $)
  (COND
   ((SPADCALL |x| (SPADCALL (QREFELT $ 9) (QREFELT $ 12)) (QREFELT $ 16))
    (SPADCALL |r| (QREFELT $ 61)))
   ((SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 43))
    (|ANTISYM;displayList| |x| $))
   ('T
    (SPADCALL (SPADCALL |r| (QREFELT $ 61)) (|ANTISYM;displayList| |x| $)
              (QREFELT $ 53))))) 

(DEFUN |ANTISYM;coerce;$Of;20| (|a| $)
  (PROG (#1=#:G284 |t| #2=#:G283)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 62)) (SPADCALL 0 (QREFELT $ 63)))
            ((NULL (CDR |a|))
             (SEQ (LETT |t| (|SPADfirst| |a|) . #3=(|ANTISYM;coerce;$Of;20|))
                  (EXIT (|ANTISYM;makeTerm| (QCDR |t|) (QCAR |t|) $))))
            ('T
             (SPADCALL (ELT $ 64)
                       (PROGN
                        (LETT #2# NIL . #3#)
                        (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (|ANTISYM;makeTerm| (QCDR |t|) (QCAR |t|)
                                       $)
                                      #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 60)))))))) 

(DECLAIM (NOTINLINE |AntiSymm;|)) 

(DEFUN |AntiSymm| (&REST #1=#:G289)
  (PROG ()
    (RETURN
     (PROG (#2=#:G290)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|AntiSymm|)
                                           '|domainEqualList|)
                . #3=(|AntiSymm|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |AntiSymm;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|AntiSymm|))))))))))) 

(DEFUN |AntiSymm;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AntiSymm|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|AntiSymm| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 72) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|AntiSymm| (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8
                (|List| (|Record| (|:| |k| (|ExtAlgBasis|)) (|:| |c| |#1|))))
      (QSETREFV $ 9 (LENGTH |#2|))
      $)))) 

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
              (50 . |elt|) (56 . *) (62 . |setelt|) (69 . *) (75 . *) (81 . *)
              (87 . ~=) (93 . |coerce|) (98 . +) |ANTISYM;*;3$;11| (104 . =)
              |ANTISYM;coerce;R$;12| (110 . |coerce|) |ANTISYM;coerce;I$;13|
              (115 . |characteristic|) |ANTISYM;characteristic;Nni;14|
              |ANTISYM;generator;Nni$;15| |ANTISYM;exp;L$;16|
              |ANTISYM;leadingBasisTerm;2$;17| (|OutputForm|) (119 . *)
              (|Symbol|) (|List| 54) (125 . |elt|) (131 . |coerce|)
              (|Mapping| 52 52 52) (|List| 52) (136 . |reduce|)
              (142 . |coerce|) (147 . |zero?|) (152 . |coerce|) (157 . +)
              |ANTISYM;coerce;$Of;20| (|Mapping| 6 6) (|Union| $ '"failed")
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 163 |zero?| 169 |subtractIfCan| 174 |sample| 180
              |retractable?| 184 |retractIfCan| 189 |retract| 194 |reductum|
              199 |recip| 204 |opposite?| 209 |one?| 215 |map| 220
              |leadingCoefficient| 226 |leadingBasisTerm| 231 |latex| 236
              |homogeneous?| 241 |hashUpdate!| 246 |hash| 252 |generator| 257
              |exp| 262 |degree| 267 |coerce| 272 |coefficient| 287
              |characteristic| 293 |annihilate?| 297 ^ 303 |Zero| 315 |One| 319
              = 323 - 329 + 340 * 346)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|LeftAlgebra&| |Ring&| |Rng&| NIL NIL |AbelianGroup&| NIL
                     NIL |AbelianMonoid&| |Monoid&| NIL |SemiGroup&|
                     |AbelianSemiGroup&| |SetCategory&| |RetractableTo&| NIL
                     |BasicType&| NIL)
                  (CONS
                   '#((|LeftAlgebra| 6) (|Ring|) (|Rng|) (|LeftModule| 6)
                      (|LeftModule| $$) (|AbelianGroup|)
                      (|CancellationAbelianMonoid|) (|SemiRing|)
                      (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                      (|AbelianSemiGroup|) (|SetCategory|) (|RetractableTo| 6)
                      (|unitsKnown|) (|BasicType|) (|CoercibleTo| 52))
                   (|makeByteWordVec2| 71
                                       '(1 11 0 10 12 0 6 0 13 2 11 15 0 0 16 2
                                         11 15 0 0 17 0 6 0 18 1 0 6 0 21 1 11
                                         25 0 26 1 0 0 0 27 2 28 15 0 0 29 0 0
                                         0 32 2 25 28 0 28 33 2 28 0 10 0 34 3
                                         25 28 0 28 28 35 2 0 0 6 0 36 2 6 0 28
                                         0 37 2 6 0 0 0 38 2 6 15 0 0 39 1 11 0
                                         25 40 2 0 0 0 0 41 2 6 15 0 0 43 1 6 0
                                         28 45 0 6 10 47 2 52 0 0 0 53 2 55 54
                                         0 28 56 1 54 52 0 57 2 59 52 58 0 60 1
                                         6 52 0 61 1 0 15 0 62 1 28 52 0 63 2
                                         52 0 0 0 64 2 0 15 0 0 1 1 0 15 0 62 2
                                         0 67 0 0 1 0 0 0 1 1 0 15 0 20 1 0 22
                                         0 23 1 0 6 0 24 1 0 0 0 27 1 0 67 0 1
                                         2 0 15 0 0 1 1 0 15 0 1 2 0 0 66 0 1 1
                                         0 6 0 21 1 0 0 0 51 1 0 69 0 1 1 0 15
                                         0 30 2 0 71 71 0 1 1 0 70 0 1 1 0 0 10
                                         49 1 0 0 25 50 1 0 10 0 31 1 0 0 6 44
                                         1 0 0 28 46 1 0 52 0 65 2 0 6 0 0 19 0
                                         0 10 48 2 0 15 0 0 1 2 0 0 0 10 1 2 0
                                         0 0 68 1 0 0 0 32 0 0 0 14 2 0 15 0 0
                                         1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 41 2
                                         0 0 6 0 36 2 0 0 0 0 42 2 0 0 28 0 1 2
                                         0 0 10 0 1 2 0 0 68 0 1)))))
           '|lookupComplete|)) 
