
(SDEFUN |JBFC-;X;PiS;1| ((|i| (|PositiveInteger|)) (% (S)))
        (SPADCALL (SPADCALL |i| (QREFELT % 11)) (QREFELT % 12))) 

(SDEFUN |JBFC-;U;PiS;2| ((|i| (|PositiveInteger|)) (% (S)))
        (SPADCALL (SPADCALL |i| (QREFELT % 14)) (QREFELT % 12))) 

(SDEFUN |JBFC-;P;PiLS;3|
        ((|i| (|PositiveInteger|)) (|l| (|List| (|NonNegativeInteger|)))
         (% (S)))
        (SPADCALL (SPADCALL |i| |l| (QREFELT % 17)) (QREFELT % 12))) 

(SDEFUN |JBFC-;X;S;4| ((% (S)))
        (SPADCALL (SPADCALL (QREFELT % 19)) (QREFELT % 12))) 

(SDEFUN |JBFC-;U;S;5| ((% (S)))
        (SPADCALL (SPADCALL (QREFELT % 21)) (QREFELT % 12))) 

(SDEFUN |JBFC-;P;LS;6| ((|l| (|List| (|NonNegativeInteger|))) (% (S)))
        (SPADCALL (SPADCALL |l| (QREFELT % 23)) (QREFELT % 12))) 

(SDEFUN |JBFC-;P;PiNniS;7|
        ((|i| (|PositiveInteger|)) (|l| (|NonNegativeInteger|)) (% (S)))
        (SPADCALL (SPADCALL |i| |l| (QREFELT % 26)) (QREFELT % 12))) 

(SDEFUN |JBFC-;P;NniS;8| ((|i| (|NonNegativeInteger|)) (% (S)))
        (SPADCALL (SPADCALL |i| (QREFELT % 28)) (QREFELT % 12))) 

(SDEFUN |JBFC-;setNotation;SV;9| ((|s| (|Symbol|)) (% (|Void|)))
        (SPADCALL |s| (QREFELT % 31))) 

(SDEFUN |JBFC-;getNotation;S;10| ((% (|Symbol|))) (SPADCALL (QREFELT % 34))) 

(SDEFUN |JBFC-;numIndVar;Pi;11| ((% (|PositiveInteger|)))
        (SPADCALL (QREFELT % 9))) 

(SDEFUN |JBFC-;numDepVar;Pi;12| ((% (|PositiveInteger|)))
        (SPADCALL (QREFELT % 37))) 

(SDEFUN |JBFC-;gcd;3S;13| ((|f1| (S)) (|f2| (S)) (% (S))) (|spadConstant| % 39)) 

(SDEFUN |JBFC-;retractIfCan;SU;14| ((|f| (S)) (% (|Union| JB "failed")))
        (SPROG ((JV (|List| JB)) (|jv| (JB)))
               (SEQ (LETT JV (SPADCALL |f| (QREFELT % 42)))
                    (EXIT
                     (COND
                      ((EQL (LENGTH JV) 1)
                       (SEQ (LETT |jv| (|SPADfirst| JV))
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |f| |jv| (QREFELT % 43))
                                         (QREFELT % 45))
                               (CONS 0 |jv|))
                              (#1='T (CONS 1 "failed"))))))
                      (#1# (CONS 1 "failed"))))))) 

(SDEFUN |JBFC-;const?;SB;15| ((|Phi| (S)) (% (|Boolean|)))
        (SPROG ((JV (|List| JB)))
               (SEQ (LETT JV (SPADCALL |Phi| (QREFELT % 42)))
                    (EXIT
                     (COND ((NULL JV) 'T) ((> (LENGTH JV) 1) NIL)
                           ('T
                            (SPADCALL (|SPADfirst| JV) (|spadConstant| % 48)
                                      (QREFELT % 49)))))))) 

(SDEFUN |JBFC-;order;SNni;16| ((|Phi| (S)) (% (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL |Phi| (QREFELT % 51)) (QREFELT % 52))) 

(SDEFUN |JBFC-;class;SNni;17| ((|Phi| (S)) (% (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL |Phi| (QREFELT % 51)) (QREFELT % 54))) 

(SDEFUN |JBFC-;leadingDer;SJB;18| ((|fun| (S)) (% (JB)))
        (SPROG ((JV (|List| JB)))
               (SEQ (LETT JV (SPADCALL |fun| (QREFELT % 42)))
                    (EXIT
                     (COND ((NULL JV) (|spadConstant| % 48))
                           ('T (|SPADfirst| JV))))))) 

(SDEFUN |JBFC-;freeOf?;SJBB;19| ((|fun| (S)) (|jv| (JB)) (% (|Boolean|)))
        (NULL (SPADCALL |jv| (SPADCALL |fun| (QREFELT % 42)) (QREFELT % 57)))) 

(MAKEPROP '|JBFC-;characteristic;Nni;20| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |JBFC-;characteristic;Nni;20| ((% (|NonNegativeInteger|))) 0) 

(SDEFUN |JBFC-;dSubst;SJB2S;21| ((|f| (S)) (|jv| (JB)) (|exp| (S)) (% (S)))
        (SPROG
         ((|of| (S)) (|JVar| (|List| JB)) (#1=#:G104 NIL) (|jvar| NIL)
          (#2=#:G103 NIL) (|d| (|List| (|NonNegativeInteger|))) (|dexp| (S))
          (|nf| (S)))
         (SEQ (LETT |of| (|spadConstant| % 60)) (LETT |nf| |f|)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |nf| |of| (QREFELT % 61))) (GO G191)))
                   (SEQ (LETT |of| |nf|)
                        (LETT |JVar| (SPADCALL |of| (QREFELT % 42)))
                        (EXIT
                         (SEQ (LETT #1# NIL) (LETT |jvar| NIL)
                              (LETT #2# |JVar|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |jvar| (CAR #2#)) NIL) #1#)
                                (GO G191)))
                              (SEQ
                               (LETT |d| (SPADCALL |jvar| |jv| (QREFELT % 62)))
                               (EXIT
                                (COND
                                 ((NULL (NULL |d|))
                                  (SEQ
                                   (LETT |dexp|
                                         (SPADCALL |exp| |d| (QREFELT % 63)))
                                   (EXIT
                                    (LETT |nf|
                                          (SPADCALL |nf| |jvar| |dexp|
                                                    (QREFELT % 64)))))))))
                              (LETT #2#
                                    (PROG1 (CDR #2#)
                                      (LETT #1#
                                            (SPADCALL |jvar| |jv|
                                                      (QREFELT % 65)))))
                              (GO G190) G191 (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |nf|)))) 

(SDEFUN |JBFC-;dimension;LSem2Nni;22|
        ((|sys| (|List| S)) (|jm| (|SparseEchelonMatrix| JB S))
         (|q| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPROG ((#1=#:G105 NIL))
               (PROG1
                   (LETT #1# (- (SPADCALL |q| (QREFELT % 67)) (LENGTH |sys|)))
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))) 

(SDEFUN |JBFC-;orderDim;LSem2Nni;23|
        ((|sys| (|List| S)) (|jm| (|SparseEchelonMatrix| JB S))
         (|q| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPROG ((#1=#:G107 NIL))
               (PROG1
                   (LETT #1# (- (SPADCALL |q| (QREFELT % 71)) (LENGTH |sys|)))
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))) 

(SDEFUN |JBFC-;jacobiMatrix;LSem;24|
        ((|funs| (|List| S)) (% (|SparseEchelonMatrix| JB S)))
        (SPROG ((#1=#:G112 NIL) (|fun| NIL) (#2=#:G113 NIL))
               (SEQ
                (SPADCALL |funs|
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |fun| NIL) (LETT #2# |funs|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |fun| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS (SPADCALL |fun| (QREFELT % 42))
                                              #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          (QREFELT % 75))))) 

(SDEFUN |JBFC-;jacobiMatrix;LLSem;25|
        ((|funs| (|List| S)) (|varlist| (|List| (|List| JB)))
         (% (|SparseEchelonMatrix| JB S)))
        (SPROG
         ((#1=#:G129 NIL) (|JvList| (|List| JB))
          (JM (|SparseEchelonMatrix| JB S)) (|i| NIL) (|vars| NIL)
          (#2=#:G131 NIL) (|f| NIL) (#3=#:G130 NIL) (|jv| NIL) (#4=#:G132 NIL)
          (|df| (S)) (|ents| (|List| S)) (|inds| (|List| JB)))
         (SEQ (LETT |JvList| (|SPADfirst| |varlist|))
              (SEQ (LETT |vars| NIL) (LETT #1# (CDR |varlist|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |vars| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |JvList|
                           (SPADCALL
                            (SPADCALL (ELT % 77) |JvList| |vars|
                                      (QREFELT % 79))
                            (QREFELT % 80)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT JM (SPADCALL |JvList| (LENGTH |funs|) (QREFELT % 83)))
              (SEQ (LETT |i| 1) (LETT |vars| NIL) (LETT #2# |varlist|)
                   (LETT |f| NIL) (LETT #3# |funs|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#)) NIL) (ATOM #2#)
                         (PROGN (LETT |vars| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ents| NIL) (LETT |inds| NIL)
                        (SEQ (LETT |jv| NIL) (LETT #4# |vars|) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |jv| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |df| (SPADCALL |f| |jv| (QREFELT % 43)))
                              (EXIT
                               (COND
                                ((OR (QREFELT % 73)
                                     (NULL (SPADCALL |df| (QREFELT % 84))))
                                 (SEQ (LETT |ents| (CONS |df| |ents|))
                                      (EXIT
                                       (LETT |inds| (CONS |jv| |inds|))))))))
                             (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL JM |i| (NREVERSE |inds|) (NREVERSE |ents|)
                                   (QREFELT % 86))))
                   (LETT #3#
                         (PROG1 (CDR #3#)
                           (LETT #2#
                                 (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT JM)))) 

(SDEFUN |JBFC-;symbol;LSem;26|
        ((|funs| (|List| S)) (% (|SparseEchelonMatrix| JB S)))
        (SPROG
         ((#1=#:G174 NIL) (|fun| NIL) (#2=#:G175 NIL)
          (JVL (|List| (|List| JB))) (#3=#:G176 NIL) (#4=#:G177 NIL)
          (|ol| (|List| (|NonNegativeInteger|))) (|ord| (|NonNegativeInteger|))
          (#5=#:G178 NIL) (|jl| (|List| JB)) (|ojl| (|List| JB))
          (|allJV| (|List| JB)) (|oJV| (|List| (|List| JB)))
          (|symb| (|SparseEchelonMatrix| JB S)) (|i| NIL) (#6=#:G180 NIL)
          (|f| NIL) (#7=#:G179 NIL) (|jv| NIL) (#8=#:G181 NIL) (|df| (S))
          (|ents| (|List| S)) (|inds| (|List| JB)))
         (SEQ
          (LETT JVL
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |fun| NIL) (LETT #2# |funs|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |fun| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (SPADCALL |fun| (QREFELT % 42)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |ol|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT #4# JVL) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |jl| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL (|SPADfirst| |jl|) (QREFELT % 52))
                               #3#))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (LETT |ord| (SPADCALL (ELT % 90) |ol| 0 (QREFELT % 92)))
          (LETT |oJV| NIL) (LETT |allJV| NIL)
          (SEQ (LETT #5# JVL) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |jl| (CAR #5#)) NIL)) (GO G191)))
               (SEQ (LETT |ojl| NIL)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |jl|) NIL)
                                  ('T
                                   (NULL
                                    (<
                                     (SPADCALL (|SPADfirst| |jl|)
                                               (QREFELT % 52))
                                     |ord|)))))
                           (GO G191)))
                         (SEQ (LETT |ojl| (CONS (|SPADfirst| |jl|) |ojl|))
                              (EXIT (LETT |jl| (CDR |jl|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |ojl| (NREVERSE |ojl|))
                    (LETT |oJV| (CONS |ojl| |oJV|))
                    (EXIT
                     (LETT |allJV|
                           (SPADCALL
                            (SPADCALL (ELT % 77) |allJV| |ojl| (QREFELT % 79))
                            (QREFELT % 80)))))
               (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
          (LETT |oJV| (NREVERSE |oJV|))
          (LETT |symb| (SPADCALL |allJV| (LENGTH |funs|) (QREFELT % 83)))
          (SEQ (LETT |i| 1) (LETT #6# |oJV|) (LETT |f| NIL) (LETT #7# |funs|)
               G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#)) NIL) (ATOM #6#)
                     (PROGN (LETT |ojl| (CAR #6#)) NIL))
                 (GO G191)))
               (SEQ (LETT |ents| NIL) (LETT |inds| NIL)
                    (SEQ (LETT |jv| NIL) (LETT #8# |ojl|) G190
                         (COND
                          ((OR (ATOM #8#) (PROGN (LETT |jv| (CAR #8#)) NIL))
                           (GO G191)))
                         (SEQ (LETT |df| (SPADCALL |f| |jv| (QREFELT % 43)))
                              (EXIT
                               (COND
                                ((OR (QREFELT % 73)
                                     (NULL (SPADCALL |df| (QREFELT % 84))))
                                 (SEQ (LETT |ents| (CONS |df| |ents|))
                                      (EXIT
                                       (LETT |inds| (CONS |jv| |inds|))))))))
                         (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL |symb| |i| (NREVERSE |inds|) (NREVERSE |ents|)
                               (QREFELT % 86))))
               (LETT #7#
                     (PROG1 (CDR #7#)
                       (LETT #6# (PROG1 (CDR #6#) (LETT |i| (|inc_SI| |i|))))))
               (GO G190) G191 (EXIT NIL))
          (EXIT |symb|)))) 

(SDEFUN |JBFC-;extractSymbol;2Sem;27|
        ((|jm| (|SparseEchelonMatrix| JB S)) (% (|SparseEchelonMatrix| JB S)))
        (SPROG ((|o| (|NonNegativeInteger|)) (|inds| (|List| JB)))
               (SEQ (LETT |inds| (SPADCALL |jm| (QREFELT % 94)))
                    (LETT |o| (SPADCALL (|SPADfirst| |inds|) (QREFELT % 52)))
                    (LETT |inds| (CDR |inds|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |inds|) NIL)
                                  ('T
                                   (EQL
                                    (SPADCALL (|SPADfirst| |inds|)
                                              (QREFELT % 52))
                                    |o|))))
                           (GO G191)))
                         (SEQ (EXIT (LETT |inds| (CDR |inds|)))) NIL (GO G190)
                         G191 (EXIT NIL))
                    (EXIT
                     (COND ((NULL |inds|) |jm|)
                           ('T
                            (QCAR
                             (SPADCALL |jm| (|SPADfirst| |inds|)
                                       (QREFELT % 96))))))))) 

(SDEFUN |JBFC-;formalDiff;LPiL;28|
        ((|Sys| (|List| S)) (|i| (|PositiveInteger|)) (% (|List| S)))
        (SPROG ((JM (|SparseEchelonMatrix| JB S)))
               (SEQ (LETT JM (SPADCALL |Sys| (QREFELT % 98)))
                    (EXIT (QCAR (SPADCALL |Sys| |i| JM (QREFELT % 100))))))) 

(SDEFUN |JBFC-;formalDiff;SPiS;29|
        ((|Eq| (S)) (|i| (|PositiveInteger|)) (% (S)))
        (|SPADfirst| (SPADCALL (LIST |Eq|) |i| (QREFELT % 102)))) 

(SDEFUN |JBFC-;formalDiff;SLS;30|
        ((|f| (S)) (|mu| (|List| (|NonNegativeInteger|))) (% (S)))
        (SPROG
         ((|j| NIL) (#1=#:G203 NIL) (|i| NIL) (#2=#:G202 NIL) (|k| NIL)
          (#3=#:G204 NIL) (|jm| (|SparseEchelonMatrix| JB S)) (#4=#:G195 NIL)
          (|tmp| (|Record| (|:| |DPhi| S) (|:| |JVars| (|List| JB))))
          (|df| (S)) (JV (|List| JB)))
         (SEQ (LETT JV (SPADCALL |f| (QREFELT % 42))) (LETT |df| |f|)
              (SEQ (LETT |j| NIL) (LETT #1# |mu|) (LETT |i| 1)
                   (LETT #2# (QREFELT % 10)) G190
                   (COND
                    ((OR (|greater_SI| |i| #2#) (ATOM #1#)
                         (PROGN (LETT |j| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| 1) (LETT #3# |j|) G190
                          (COND ((|greater_SI| |k| #3#) (GO G191)))
                          (SEQ
                           (LETT |jm|
                                 (SPADCALL (LIST |df|) (LIST JV)
                                           (QREFELT % 75)))
                           (LETT |tmp|
                                 (SPADCALL |df|
                                           (PROG1 (LETT #4# |i|)
                                             (|check_subtype2| (> #4# 0)
                                                               '(|PositiveInteger|)
                                                               '(|NonNegativeInteger|)
                                                               #4#))
                                           |jm| (QREFELT % 105)))
                           (LETT |df| (QCAR |tmp|))
                           (EXIT (LETT JV (QCDR |tmp|))))
                          (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |df|)))) 

(SDEFUN |JBFC-;formalDiff2;LPiSemR;31|
        ((|Sys| (|List| S)) (|i| (|PositiveInteger|))
         (JM (|SparseEchelonMatrix| JB S))
         (%
          (|Record| (|:| |DSys| (|List| S))
                    (|:| |JVars| (|List| (|List| JB))))))
        (SPROG
         ((|inds| (|List| JB)) (#1=#:G234 NIL) (#2=#:G235 NIL) (#3=#:G236 NIL)
          (|eq| NIL) (#4=#:G237 NIL) (|l| NIL) (#5=#:G238 NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| S))))
          (|jv| NIL) (#6=#:G240 NIL) (|df| NIL) (#7=#:G239 NIL)
          (|djv| (|Union| JB "0")) (|res| (S)) (|LRes| (|List| S))
          (JV (|List| JB)) (LJV (|List| (|List| JB))))
         (SEQ (LETT |inds| (SPADCALL JM (QREFELT % 94)))
              (EXIT
               (COND
                ((NULL |inds|)
                 (CONS
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |eq| NIL) (LETT #2# |Sys|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT (LETT #1# (CONS (|spadConstant| % 60) #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#))))
                  (PROGN
                   (LETT #3# NIL)
                   (SEQ (LETT |eq| NIL) (LETT #4# |Sys|) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |eq| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #3# (CONS NIL #3#))))
                        (LETT #4# (CDR #4#)) (GO G190) G191
                        (EXIT (NREVERSE #3#))))))
                ('T
                 (SEQ (LETT |LRes| NIL) (LETT LJV NIL)
                      (SEQ (LETT |l| 1)
                           (LETT #5# (SPADCALL JM (QREFELT % 107))) G190
                           (COND ((|greater_SI| |l| #5#) (GO G191)))
                           (SEQ (LETT |r| (SPADCALL JM |l| (QREFELT % 109)))
                                (LETT |res| (|spadConstant| % 60))
                                (LETT JV NIL)
                                (SEQ (LETT |jv| NIL)
                                     (LETT #6# (REVERSE (QCAR |r|)))
                                     (LETT |df| NIL)
                                     (LETT #7# (REVERSE (QCDR |r|))) G190
                                     (COND
                                      ((OR (ATOM #7#)
                                           (PROGN (LETT |df| (CAR #7#)) NIL)
                                           (ATOM #6#)
                                           (PROGN (LETT |jv| (CAR #6#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((OR (QREFELT % 73)
                                             (NULL
                                              (SPADCALL |df| (QREFELT % 84))))
                                         (SEQ
                                          (LETT |djv|
                                                (SPADCALL |jv| |i|
                                                          (QREFELT % 111)))
                                          (EXIT
                                           (COND
                                            ((QEQCAR |djv| 1)
                                             (LETT JV (CONS |jv| JV)))
                                            ((SPADCALL |djv|
                                                       (CONS 0
                                                             (|spadConstant| %
                                                                             48))
                                                       (QREFELT % 113))
                                             (SEQ
                                              (LETT |res|
                                                    (SPADCALL |res| |df|
                                                              (QREFELT % 114)))
                                              (EXIT (LETT JV (CONS |jv| JV)))))
                                            ('T
                                             (SEQ
                                              (LETT |res|
                                                    (SPADCALL |res|
                                                              (SPADCALL |df|
                                                                        (SPADCALL
                                                                         (QCDR
                                                                          |djv|)
                                                                         (QREFELT
                                                                          %
                                                                          12))
                                                                        (QREFELT
                                                                         %
                                                                         115))
                                                              (QREFELT % 114)))
                                              (EXIT
                                               (LETT JV
                                                     (CONS (QCDR |djv|)
                                                           (CONS |jv|
                                                                 JV)))))))))))))
                                     (LETT #7#
                                           (PROG1 (CDR #7#)
                                             (LETT #6# (CDR #6#))))
                                     (GO G190) G191 (EXIT NIL))
                                (LETT |LRes| (CONS |res| |LRes|))
                                (LETT JV
                                      (SPADCALL (ELT % 77)
                                                (SPADCALL JV (QREFELT % 80))
                                                (QREFELT % 116)))
                                (EXIT (LETT LJV (CONS JV LJV))))
                           (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
                      (EXIT (CONS (NREVERSE |LRes|) (NREVERSE LJV)))))))))) 

(SDEFUN |JBFC-;formalDiff2;SPiSemR;32|
        ((|Eq| (S)) (|i| (|PositiveInteger|)) (JM (|SparseEchelonMatrix| JB S))
         (% (|Record| (|:| |DPhi| S) (|:| |JVars| (|List| JB)))))
        (SPROG
         ((|tmp|
           (|Record| (|:| |DSys| (|List| S))
                     (|:| |JVars| (|List| (|List| JB))))))
         (SEQ (LETT |tmp| (SPADCALL (LIST |Eq|) |i| JM (QREFELT % 100)))
              (EXIT
               (CONS (|SPADfirst| (QCAR |tmp|)) (|SPADfirst| (QCDR |tmp|))))))) 

(SDEFUN |JBFC-;greater|
        ((|r1|
          (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                    (|:| |Dep| (|List| (|NonNegativeInteger|))) (|:| |Fun| S)))
         (|r2|
          (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                    (|:| |Dep| (|List| (|NonNegativeInteger|))) (|:| |Fun| S)))
         (% (|Boolean|)))
        (SPADCALL (QVELT |r1| 0) (QVELT |r2| 0) (QREFELT % 77))) 

(SDEFUN |JBFC-;sortLD;2L;34| ((|sys| (|List| S)) (% (|List| S)))
        (SPROG
         ((#1=#:G259 NIL) (|f| NIL) (#2=#:G260 NIL)
          (|sl|
           (|List|
            (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                      (|:| |Dep| (|List| (|NonNegativeInteger|)))
                      (|:| |Fun| S))))
          (#3=#:G261 NIL) (|l| NIL) (#4=#:G262 NIL))
         (SEQ
          (LETT |sl|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |f| NIL) (LETT #2# |sys|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (VECTOR (SPADCALL |f| (QREFELT % 51)) NIL
                                       (LIST 1) |f|)
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |sl|
                (SPADCALL (CONS (|function| |JBFC-;greater|) %) |sl|
                          (QREFELT % 122)))
          (EXIT
           (PROGN
            (LETT #3# NIL)
            (SEQ (LETT |l| NIL) (LETT #4# |sl|) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |l| (CAR #4#)) NIL)) (GO G191)))
                 (SEQ (EXIT (LETT #3# (CONS (QVELT |l| 3) #3#))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |JBFC-;simpLD|
        ((|l|
          (|List|
           (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                     (|:| |Dep| (|List| (|NonNegativeInteger|)))
                     (|:| |Fun| S))))
         (%
          (|List|
           (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                     (|:| |Dep| (|List| (|NonNegativeInteger|)))
                     (|:| |Fun| S)))))
        (SPROG
         ((|cur|
           #1=(|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                        (|:| |Dep| (|List| (|NonNegativeInteger|)))
                        (|:| |Fun| S)))
          (|fl| #1#) (|eqLD| (|List| #1#)) (#2=#:G309 NIL) (#3=#:G308 NIL)
          (|s| (|Union| S #4="failed")) (|solvable?| (|Boolean|))
          (#5=#:G310 NIL) (#6=#:G272 NIL) (|neweq| (S)) (#7=#:G311 NIL)
          (JV #8=(|List| JB)) (|len| #9=(|NonNegativeInteger|))
          (|seq|
           (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                     (|:| |Dep| (|List| (|NonNegativeInteger|)))
                     (|:| |Fun| S)))
          (|sj| #8#) (|minlen| #9#) (|lJV| (|List| #8#)) (#10=#:G313 NIL)
          (#11=#:G312 NIL) (|sjv| (JB)) (#12=#:G315 NIL) (|eq| NIL)
          (#13=#:G314 NIL) (|newld| (JB))
          (|newL|
           (|List|
            (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                      (|:| |Dep| (|List| (|NonNegativeInteger|)))
                      (|:| |Fun| S)))))
         (SEQ
          (COND ((< (LENGTH |l|) 2) |l|)
                (#14='T
                 (SEQ (LETT |cur| (|SPADfirst| |l|)) (LETT |l| (CDR |l|))
                      (EXIT
                       (COND
                        ((SPADCALL (QVELT |cur| 0) (QVELT (|SPADfirst| |l|) 0)
                                   (QREFELT % 124))
                         (CONS |cur| (|JBFC-;simpLD| |l| %)))
                        (#14#
                         (SEQ (LETT |eqLD| (LIST |cur|))
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND ((NULL |l|) NIL)
                                            ('T
                                             (SPADCALL (QVELT |cur| 0)
                                                       (QVELT
                                                        (LETT |fl|
                                                              (|SPADfirst|
                                                               |l|))
                                                        0)
                                                       (QREFELT % 49)))))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((QVELT |fl| 1)
                                       (|error| #15="cannot simplify"))
                                      ('T
                                       (SEQ (LETT |eqLD| (CONS |fl| |eqLD|))
                                            (EXIT (LETT |l| (CDR |l|))))))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |solvable?| NIL)
                              (SEQ (LETT #2# NIL) (LETT |eq| NIL)
                                   (LETT #3# |eqLD|) G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN (LETT |eq| (CAR #3#)) NIL) #2#)
                                     (GO G191)))
                                   (SEQ
                                    (LETT |s|
                                          (SPADCALL (QVELT |eq| 3)
                                                    (QVELT |cur| 0)
                                                    (QREFELT % 126)))
                                    (LETT |solvable?| (QEQCAR |s| 0))
                                    (EXIT (LETT |seq| |eq|)))
                                   (LETT #3#
                                         (PROG1 (CDR #3#)
                                           (LETT #2# |solvable?|)))
                                   (GO G190) G191 (EXIT NIL))
                              (LETT |newL| NIL)
                              (COND
                               (|solvable?|
                                (SEQ (LETT |eq| NIL) (LETT #5# |eqLD|) G190
                                     (COND
                                      ((OR (ATOM #5#)
                                           (PROGN (LETT |eq| (CAR #5#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((SPADCALL |eq| |seq| (QREFELT % 127))
                                         (SEQ
                                          (LETT |neweq|
                                                (SPADCALL
                                                 (SPADCALL (QVELT |eq| 3)
                                                           (QVELT |cur| 0)
                                                           (PROG2
                                                               (LETT #6# |s|)
                                                               (QCDR #6#)
                                                             (|check_union2|
                                                              (QEQCAR #6# 0)
                                                              (QREFELT % 6)
                                                              (|Union|
                                                               (QREFELT % 6)
                                                               #4#)
                                                              #6#))
                                                           (QREFELT % 64))
                                                 (QREFELT % 128)))
                                          (EXIT
                                           (COND
                                            ((NULL
                                              (SPADCALL |neweq|
                                                        (QREFELT % 84)))
                                             (SEQ
                                              (LETT |newld|
                                                    (SPADCALL |neweq|
                                                              (QREFELT % 51)))
                                              (EXIT
                                               (LETT |newL|
                                                     (SPADCALL
                                                      (CONS
                                                       (|function|
                                                        |JBFC-;greater|)
                                                       %)
                                                      |newL|
                                                      (LIST
                                                       (VECTOR |newld| NIL
                                                               (SPADCALL
                                                                (QVELT |eq| 2)
                                                                (QVELT |seq| 2)
                                                                (QREFELT %
                                                                         129))
                                                               |neweq|))
                                                      (QREFELT %
                                                               130)))))))))))))
                                     (LETT #5# (CDR #5#)) (GO G190) G191
                                     (EXIT NIL)))
                               (#14#
                                (SEQ (LETT |seq| (|SPADfirst| |eqLD|))
                                     (LETT |sj|
                                           (SPADCALL (QVELT |seq| 3)
                                                     (QREFELT % 42)))
                                     (LETT |minlen| (LENGTH |sj|))
                                     (LETT |lJV| (LIST |sj|))
                                     (SEQ (LETT |eq| NIL)
                                          (LETT #7# (CDR |eqLD|)) G190
                                          (COND
                                           ((OR (ATOM #7#)
                                                (PROGN
                                                 (LETT |eq| (CAR #7#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT JV
                                                 (SPADCALL (QVELT |eq| 3)
                                                           (QREFELT % 42)))
                                           (LETT |len| (LENGTH JV))
                                           (LETT |lJV| (CONS JV |lJV|))
                                           (EXIT
                                            (COND
                                             ((< |len| |minlen|)
                                              (SEQ (LETT |seq| |eq|)
                                                   (LETT |sj| JV)
                                                   (EXIT
                                                    (LETT |minlen| |len|)))))))
                                          (LETT #7# (CDR #7#)) (GO G190) G191
                                          (EXIT NIL))
                                     (LETT |lJV| (NREVERSE |lJV|))
                                     (EXIT
                                      (COND
                                       ((EQL |minlen| 1)
                                        (SEQ (LETT #10# |lJV|) (LETT |eq| NIL)
                                             (LETT #11# |eqLD|) G190
                                             (COND
                                              ((OR (ATOM #11#)
                                                   (PROGN
                                                    (LETT |eq| (CAR #11#))
                                                    NIL)
                                                   (ATOM #10#)
                                                   (PROGN
                                                    (LETT JV (CAR #10#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((SPADCALL |eq| |seq|
                                                           (QREFELT % 127))
                                                 (COND
                                                  ((EQL (LENGTH JV) 1)
                                                   (|error| #15#))
                                                  ('T
                                                   (LETT |newL|
                                                         (SPADCALL
                                                          (CONS
                                                           (|function|
                                                            |JBFC-;greater|)
                                                           %)
                                                          |newL|
                                                          (LIST
                                                           (VECTOR
                                                            (SPADCALL JV
                                                                      (QREFELT
                                                                       % 131))
                                                            'T (QVELT |eq| 2)
                                                            (QVELT |eq| 3)))
                                                          (QREFELT %
                                                                   130)))))))))
                                             (LETT #11#
                                                   (PROG1 (CDR #11#)
                                                     (LETT #10# (CDR #10#))))
                                             (GO G190) G191 (EXIT NIL)))
                                       (#14#
                                        (SEQ
                                         (LETT |sjv|
                                               (SPADCALL |sj| (QREFELT % 131)))
                                         (EXIT
                                          (SEQ (LETT #12# |lJV|)
                                               (LETT |eq| NIL)
                                               (LETT #13# |eqLD|) G190
                                               (COND
                                                ((OR (ATOM #13#)
                                                     (PROGN
                                                      (LETT |eq| (CAR #13#))
                                                      NIL)
                                                     (ATOM #12#)
                                                     (PROGN
                                                      (LETT JV (CAR #12#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL |eq| |seq|
                                                             (QREFELT % 127))
                                                   (SEQ
                                                    (LETT |newld|
                                                          (SPADCALL
                                                           (SPADCALL JV
                                                                     (QREFELT %
                                                                              131))
                                                           |sjv|
                                                           (QREFELT % 88)))
                                                    (EXIT
                                                     (LETT |newL|
                                                           (SPADCALL
                                                            (CONS
                                                             (|function|
                                                              |JBFC-;greater|)
                                                             %)
                                                            |newL|
                                                            (LIST
                                                             (VECTOR |newld| 'T
                                                                     (QVELT
                                                                      |eq| 2)
                                                                     (QVELT
                                                                      |eq| 3)))
                                                            (QREFELT %
                                                                     130)))))))))
                                               (LETT #13#
                                                     (PROG1 (CDR #13#)
                                                       (LETT #12# (CDR #12#))))
                                               (GO G190) G191
                                               (EXIT NIL))))))))))
                              (EXIT
                               (CONS |seq|
                                     (|JBFC-;simpLD|
                                      (SPADCALL
                                       (CONS (|function| |JBFC-;greater|) %)
                                       |l| |newL| (QREFELT % 130))
                                      %))))))))))))) 

(SDEFUN |JBFC-;simplify;LSemR;36|
        ((|sys| (|List| S)) (|jm| (|SparseEchelonMatrix| JB S))
         (%
          (|Record| (|:| |Sys| (|List| S))
                    (|:| JM (|SparseEchelonMatrix| JB S))
                    (|:| |Depend|
                         (|Union| "failed"
                                  (|List| (|List| (|NonNegativeInteger|))))))))
        (SPROG
         ((#1=#:G349 NIL) (|neq| (S)) (|jmi| (|SparseEchelonMatrix| JB S))
          (|newSys| (|List| S)) (#2=#:G350 NIL) (|f| NIL) (#3=#:G351 NIL)
          (|sl|
           (|List|
            (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                      (|:| |Dep| #4=(|List| (|NonNegativeInteger|)))
                      (|:| |Fun| S))))
          (#5=#:G352 NIL) (#6=#:G353 NIL) (|resSys| (|List| S)) (#7=#:G354 NIL)
          (|l| NIL) (#8=#:G355 NIL) (|resDep| (|List| #4#))
          (|inds| (|List| JB)) (|resJM| (|SparseEchelonMatrix| JB S)) (|i| NIL)
          (|dep| NIL) (#9=#:G357 NIL) (|eq| NIL) (#10=#:G356 NIL)
          (|tmp| (|SparseEchelonMatrix| JB S))
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| S)))))
         (SEQ (LETT |newSys| NIL)
              (SEQ (LETT |i| 1) (LETT |eq| NIL) (LETT #1# |sys|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |neq| (SPADCALL |eq| (QREFELT % 128)))
                        (COND
                         ((SPADCALL |neq| |eq| (QREFELT % 61))
                          (SEQ
                           (LETT |jmi| (SPADCALL (LIST |neq|) (QREFELT % 98)))
                           (EXIT
                            (SPADCALL |jm| |i|
                                      (SPADCALL |jmi| 1 (QREFELT % 109))
                                      (QREFELT % 132))))))
                        (EXIT (LETT |newSys| (CONS |neq| |newSys|))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |newSys| (NREVERSE |newSys|))
              (LETT |sl|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |i| 1) (LETT |f| NIL) (LETT #3# |newSys|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (VECTOR
                                    (|SPADfirst|
                                     (QCAR
                                      (SPADCALL |jm| |i| (QREFELT % 109))))
                                    NIL (LIST |i|) |f|)
                                   #2#))))
                          (LETT #3#
                                (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|))))
                          (GO G190) G191 (EXIT (NREVERSE #2#)))))
              (LETT |sl|
                    (|JBFC-;simpLD|
                     (SPADCALL (CONS (|function| |JBFC-;greater|) %) |sl|
                               (QREFELT % 122))
                     %))
              (LETT |resSys|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |l| NIL) (LETT #6# |sl|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |l| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #5# (CONS (QVELT |l| 3) #5#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT |resDep|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |l| NIL) (LETT #8# |sl|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |l| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #7# (CONS (QVELT |l| 2) #7#))))
                          (LETT #8# (CDR #8#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |inds| (SPADCALL |jm| (QREFELT % 94)))
              (LETT |resJM| (SPADCALL |inds| (LENGTH |sl|) (QREFELT % 83)))
              (SEQ (LETT |i| 1) (LETT |dep| NIL) (LETT #9# |resDep|)
                   (LETT |eq| NIL) (LETT #10# |resSys|) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |eq| (CAR #10#)) NIL)
                         (ATOM #9#) (PROGN (LETT |dep| (CAR #9#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((EQL (SPADCALL |dep| (QREFELT % 133)) 1)
                      (LETT |r|
                            (SPADCALL |jm| (|SPADfirst| |dep|)
                                      (QREFELT % 109))))
                     ('T
                      (SEQ
                       (LETT |tmp|
                             (SPADCALL (LIST |eq|) (LIST |inds|)
                                       (QREFELT % 75)))
                       (EXIT (LETT |r| (SPADCALL |tmp| 1 (QREFELT % 109)))))))
                    (EXIT (SPADCALL |resJM| |i| |r| (QREFELT % 132))))
                   (LETT #10#
                         (PROG1 (CDR #10#)
                           (LETT #9#
                                 (PROG1 (CDR #9#) (LETT |i| (|inc_SI| |i|))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |resSys| |resJM| (CONS 1 |resDep|)))))) 

(SDEFUN |JBFC-;simpOne;2S;37| ((|f| (S)) (% (S)))
        (SPADCALL |f| (QREFELT % 137))) 

(SDEFUN |JBFC-;simpMod;3L;38|
        ((|sys1| (|List| S)) (|sys2| (|List| S)) (% (|List| S)))
        (SPROG
         ((|eq2| NIL) (#1=#:G387 NIL) (|ls| (|Union| S "failed")) (|jv| NIL)
          (#2=#:G388 NIL) (|i| (|NonNegativeInteger|)) (LD (|List| JB))
          (LS (|List| S)) (|newSys| (|List| S)) (|eq1| NIL) (#3=#:G389 NIL)
          (#4=#:G390 NIL) (|ld| (JB)) (LD1 (|List| JB)) (LS1 (|List| S))
          (|neq| (S)) (|res| (|List| S)))
         (SEQ
          (COND ((OR (NULL |sys1|) (NULL |sys2|)) |sys1|)
                ('T
                 (SEQ (LETT LD NIL) (LETT LS NIL)
                      (SEQ (LETT |eq2| NIL) (LETT #1# |sys2|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |eq2| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |ld| (SPADCALL |eq2| (QREFELT % 51)))
                                (LETT |ls|
                                      (SPADCALL |eq2| |ld| (QREFELT % 126)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |ls| 0)
                                   (SEQ (LETT |i| 1)
                                        (SEQ (LETT |jv| NIL) (LETT #2# LD) G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |jv| (CAR #2#))
                                                    NIL)
                                                   (NULL
                                                    (SPADCALL |jv| |ld|
                                                              (QREFELT % 77))))
                                               (GO G191)))
                                             (SEQ (EXIT (LETT |i| (+ |i| 1))))
                                             (LETT #2# (CDR #2#)) (GO G190)
                                             G191 (EXIT NIL))
                                        (LETT LD
                                              (SPADCALL |ld| LD |i|
                                                        (QREFELT % 139)))
                                        (EXIT
                                         (LETT LS
                                               (SPADCALL (QCDR |ls|) LS |i|
                                                         (QREFELT %
                                                                  140)))))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (LETT |newSys|
                            (SPADCALL (ELT % 128) |sys1| (QREFELT % 142)))
                      (EXIT
                       (COND ((NULL LD) |newSys|)
                             ('T
                              (SEQ (LETT |res| NIL)
                                   (SEQ (LETT |eq1| NIL) (LETT #3# |newSys|)
                                        G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |eq1| (CAR #3#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ (LETT |neq| |eq1|) (LETT LD1 LD)
                                             (LETT LS1 LS)
                                             (SEQ (LETT #4# NIL) G190
                                                  (COND (#4# (GO G191)))
                                                  (SEQ
                                                   (LETT |ld|
                                                         (SPADCALL |neq|
                                                                   (QREFELT %
                                                                            51)))
                                                   (SEQ G190
                                                        (COND
                                                         ((NULL
                                                           (COND
                                                            ((NULL LD1) NIL)
                                                            ('T
                                                             (SPADCALL
                                                              (|SPADfirst| LD1)
                                                              |ld|
                                                              (QREFELT %
                                                                       77)))))
                                                          (GO G191)))
                                                        (SEQ
                                                         (LETT LD1 (CDR LD1))
                                                         (EXIT
                                                          (LETT LS1
                                                                (CDR LS1))))
                                                        NIL (GO G190) G191
                                                        (EXIT NIL))
                                                   (EXIT
                                                    (COND
                                                     ((NULL (NULL LD1))
                                                      (SEQ
                                                       (LETT |neq|
                                                             (SPADCALL |neq|
                                                                       (|SPADfirst|
                                                                        LD1)
                                                                       (|SPADfirst|
                                                                        LS1)
                                                                       (QREFELT
                                                                        % 64)))
                                                       (LETT LD1 (CDR LD1))
                                                       (EXIT
                                                        (LETT LS1
                                                              (CDR LS1))))))))
                                                  (LETT #4# (NULL LD1))
                                                  (GO G190) G191 (EXIT NIL))
                                             (COND
                                              ((SPADCALL |neq| |eq1|
                                                         (QREFELT % 61))
                                               (LETT |neq|
                                                     (SPADCALL |neq|
                                                               (QREFELT %
                                                                        128)))))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |neq|
                                                           (QREFELT % 84)))
                                                (LETT |res|
                                                      (CONS |neq| |res|))))))
                                        (LETT #3# (CDR #3#)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT
                                    (SPADCALL (NREVERSE |res|)
                                              (QREFELT % 143))))))))))))) 

(SDEFUN |JBFC-;simpMod;LSemLR;39|
        ((|sys1| (|List| S)) (|jm| (|SparseEchelonMatrix| JB S))
         (|sys2| (|List| S))
         (%
          (|Record| (|:| |Sys| (|List| S))
                    (|:| JM (|SparseEchelonMatrix| JB S))
                    (|:| |Depend|
                         (|Union| "failed"
                                  (|List| (|List| (|NonNegativeInteger|))))))))
        (SPROG
         ((#1=#:G433 NIL) (#2=#:G434 NIL) (|osys| (|List| S)) (|eq2| NIL)
          (#3=#:G435 NIL) (|ls| (|Union| S "failed")) (|jv| NIL)
          (#4=#:G436 NIL) (LD (|List| JB)) (LS (|List| S))
          (|newSys| (|List| S)) (|eq1| NIL) (#5=#:G437 NIL) (#6=#:G438 NIL)
          (|ld| (JB)) (LD1 (|List| JB)) (LS1 (|List| S)) (|neq| (S))
          (|res| (|List| S)) (|resJM| (|SparseEchelonMatrix| JB S)) (|oeq| NIL)
          (#7=#:G440 NIL) (#8=#:G439 NIL) (|njm| (|SparseEchelonMatrix| JB S))
          (|resSys| (|List| S)) (#9=#:G441 NIL) (|i| (|NonNegativeInteger|))
          (#10=#:G442 NIL))
         (SEQ
          (COND
           ((OR (NULL |sys1|) (NULL |sys2|))
            (VECTOR |sys1| |jm|
                    (CONS 1
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |i| 1) (LETT #2# (LENGTH |sys1|)) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ (EXIT (LETT #1# (CONS (LIST |i|) #1#))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT (NREVERSE #1#)))))))
           ('T
            (SEQ (LETT |osys| |sys1|) (LETT LD NIL) (LETT LS NIL)
                 (SEQ (LETT |eq2| NIL) (LETT #3# |sys2|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |eq2| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |ld| (SPADCALL |eq2| (QREFELT % 51)))
                           (LETT |ls| (SPADCALL |eq2| |ld| (QREFELT % 126)))
                           (EXIT
                            (COND
                             ((QEQCAR |ls| 0)
                              (SEQ (LETT |i| 1)
                                   (SEQ (LETT |jv| NIL) (LETT #4# LD) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN (LETT |jv| (CAR #4#)) NIL)
                                              (NULL
                                               (SPADCALL |jv| |ld|
                                                         (QREFELT % 77))))
                                          (GO G191)))
                                        (SEQ (EXIT (LETT |i| (+ |i| 1))))
                                        (LETT #4# (CDR #4#)) (GO G190) G191
                                        (EXIT NIL))
                                   (LETT LD
                                         (SPADCALL |ld| LD |i|
                                                   (QREFELT % 139)))
                                   (EXIT
                                    (LETT LS
                                          (SPADCALL (QCDR |ls|) LS |i|
                                                    (QREFELT % 140)))))))))
                      (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                 (LETT |newSys| (SPADCALL (ELT % 128) |sys1| (QREFELT % 142)))
                 (LETT |res| NIL)
                 (SEQ (LETT |eq1| NIL) (LETT #5# |newSys|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |eq1| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |neq| |eq1|) (LETT LD1 LD) (LETT LS1 LS)
                           (SEQ (LETT #6# NIL) G190 (COND (#6# (GO G191)))
                                (SEQ
                                 (LETT |ld| (SPADCALL |neq| (QREFELT % 51)))
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND ((NULL LD1) NIL)
                                               ('T
                                                (SPADCALL (|SPADfirst| LD1)
                                                          |ld|
                                                          (QREFELT % 77)))))
                                        (GO G191)))
                                      (SEQ (LETT LD1 (CDR LD1))
                                           (EXIT (LETT LS1 (CDR LS1))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT
                                  (COND
                                   ((NULL (NULL LD1))
                                    (SEQ
                                     (LETT |neq|
                                           (SPADCALL |neq| (|SPADfirst| LD1)
                                                     (|SPADfirst| LS1)
                                                     (QREFELT % 64)))
                                     (LETT LD1 (CDR LD1))
                                     (EXIT (LETT LS1 (CDR LS1))))))))
                                (LETT #6# (NULL LD1)) (GO G190) G191
                                (EXIT NIL))
                           (COND
                            ((SPADCALL |neq| |eq1| (QREFELT % 61))
                             (LETT |neq| (SPADCALL |neq| (QREFELT % 128)))))
                           (EXIT (LETT |res| (CONS |neq| |res|))))
                      (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                 (LETT |resSys| NIL) (LETT |resJM| |jm|)
                 (SEQ (LETT |i| (LENGTH |res|)) (LETT |oeq| NIL)
                      (LETT #7# (NREVERSE |osys|)) (LETT #8# |res|) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |neq| (CAR #8#)) NIL)
                            (ATOM #7#) (PROGN (LETT |oeq| (CAR #7#)) NIL)
                            (< |i| 1))
                        (GO G191)))
                      (SEQ
                       (COND
                        ((SPADCALL |neq| |oeq| (QREFELT % 61))
                         (SEQ
                          (LETT |njm| (SPADCALL (LIST |neq|) (QREFELT % 98)))
                          (EXIT
                           (SPADCALL |resJM| |i|
                                     (SPADCALL |njm| 1 (QREFELT % 109))
                                     (QREFELT % 132))))))
                       (EXIT (LETT |resSys| (CONS |neq| |resSys|))))
                      (LETT #8#
                            (PROG1 (CDR #8#)
                              (LETT #7#
                                    (PROG1 (CDR #7#) (LETT |i| (+ |i| -1))))))
                      (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (VECTOR |resSys| |resJM|
                          (CONS 1
                                (PROGN
                                 (LETT #9# NIL)
                                 (SEQ (LETT |i| 1)
                                      (LETT #10# (LENGTH |resSys|)) G190
                                      (COND
                                       ((|greater_SI| |i| #10#) (GO G191)))
                                      (SEQ
                                       (EXIT (LETT #9# (CONS (LIST |i|) #9#))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT (NREVERSE #9#))))))))))))) 

(SDEFUN |JBFC-;reduceMod;3L;40|
        ((|sys1| (|List| S)) (|sys2| (|List| S)) (% (|List| S)))
        (SPROG
         ((|eq2| NIL) (#1=#:G472 NIL) (|ls| (|Union| S "failed")) (|jv| NIL)
          (#2=#:G473 NIL) (|i| (|NonNegativeInteger|)) (LD (|List| JB))
          (LS (|List| S)) (|newSys| (|List| S)) (|eq1| NIL) (#3=#:G474 NIL)
          (|eq| (S)) (|oeq| (S)) (#4=#:G475 NIL) (|ld| (JB)) (|neq| (S))
          (LD1 (|List| JB)) (LS1 (|List| S)) (|res| (|List| S)))
         (SEQ
          (COND ((OR (NULL |sys1|) (NULL |sys2|)) |sys1|)
                ('T
                 (SEQ (LETT LD NIL) (LETT LS NIL)
                      (SEQ (LETT |eq2| NIL) (LETT #1# |sys2|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |eq2| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |ld| (SPADCALL |eq2| (QREFELT % 51)))
                                (LETT |ls|
                                      (SPADCALL |eq2| |ld| (QREFELT % 126)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |ls| 0)
                                   (SEQ (LETT |i| 1)
                                        (SEQ (LETT |jv| NIL) (LETT #2# LD) G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |jv| (CAR #2#))
                                                    NIL)
                                                   (NULL
                                                    (SPADCALL |jv| |ld|
                                                              (QREFELT % 77))))
                                               (GO G191)))
                                             (SEQ (EXIT (LETT |i| (+ |i| 1))))
                                             (LETT #2# (CDR #2#)) (GO G190)
                                             G191 (EXIT NIL))
                                        (LETT LD
                                              (SPADCALL |ld| LD |i|
                                                        (QREFELT % 139)))
                                        (EXIT
                                         (LETT LS
                                               (SPADCALL (QCDR |ls|) LS |i|
                                                         (QREFELT %
                                                                  140)))))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (LETT |newSys|
                            (SPADCALL (ELT % 128) |sys1| (QREFELT % 142)))
                      (EXIT
                       (COND ((NULL LD) |newSys|)
                             ('T
                              (SEQ (LETT |res| NIL)
                                   (SEQ (LETT |eq1| NIL) (LETT #3# |newSys|)
                                        G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |eq1| (CAR #3#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ (LETT |eq| |eq1|)
                                             (LETT |oeq| (|spadConstant| % 60))
                                             (LETT |neq| |eq1|)
                                             (SEQ G190
                                                  (COND
                                                   ((NULL
                                                     (SPADCALL |neq| |oeq|
                                                               (QREFELT % 61)))
                                                    (GO G191)))
                                                  (SEQ (LETT |oeq| |neq|)
                                                       (LETT LD1 LD)
                                                       (LETT LS1 LS)
                                                       (EXIT
                                                        (SEQ (LETT #4# NIL)
                                                             G190
                                                             (COND
                                                              (#4# (GO G191)))
                                                             (SEQ
                                                              (LETT |ld|
                                                                    (SPADCALL
                                                                     |neq|
                                                                     (QREFELT %
                                                                              51)))
                                                              (SEQ G190
                                                                   (COND
                                                                    ((NULL
                                                                      (COND
                                                                       ((NULL
                                                                         LD1)
                                                                        NIL)
                                                                       ('T
                                                                        (SPADCALL
                                                                         (|SPADfirst|
                                                                          LD1)
                                                                         |ld|
                                                                         (QREFELT
                                                                          %
                                                                          77)))))
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (LETT LD1
                                                                          (CDR
                                                                           LD1))
                                                                    (EXIT
                                                                     (LETT LS1
                                                                           (CDR
                                                                            LS1))))
                                                                   NIL
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                              (EXIT
                                                               (COND
                                                                ((NULL
                                                                  (NULL LD1))
                                                                 (SEQ
                                                                  (LETT |neq|
                                                                        (SPADCALL
                                                                         |neq|
                                                                         (|SPADfirst|
                                                                          LD1)
                                                                         (|SPADfirst|
                                                                          LS1)
                                                                         (QREFELT
                                                                          %
                                                                          146)))
                                                                  (LETT LD1
                                                                        (CDR
                                                                         LD1))
                                                                  (EXIT
                                                                   (LETT LS1
                                                                         (CDR
                                                                          LS1))))))))
                                                             (LETT #4#
                                                                   (NULL LD1))
                                                             (GO G190) G191
                                                             (EXIT NIL))))
                                                  NIL (GO G190) G191
                                                  (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |neq|
                                                           (QREFELT % 84)))
                                                (COND
                                                 ((SPADCALL |neq| |eq|
                                                            (QREFELT % 147))
                                                  (LETT |res|
                                                        (CONS |neq| |res|)))
                                                 ('T
                                                  (LETT |res|
                                                        (CONS
                                                         (SPADCALL |neq|
                                                                   (QREFELT %
                                                                            128))
                                                         |res|))))))))
                                        (LETT #3# (CDR #3#)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT
                                    (SPADCALL (NREVERSE |res|)
                                              (QREFELT % 143))))))))))))) 

(SDEFUN |JBFC-;autoReduce;2L;41| ((|sys| (|List| S)) (% (|List| S)))
        (SPROG
         ((#1=#:G534 NIL) (|ld| (JB)) (|su| (|Union| S "failed"))
          (|sub|
           #2=(|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                        (|:| |Dep| (|List| (|NonNegativeInteger|)))
                        (|:| |Fun| S)))
          (|osl|
           #3=(|List|
               #4=(|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                            (|:| |Dep| (|List| (|NonNegativeInteger|)))
                            (|:| |Fun| S))))
          (|rec| #2#) (#5=#:G533 NIL) (#6=#:G535 NIL)
          (|d| (|List| (|NonNegativeInteger|)))
          (|tmp|
           (|List|
            (|Record| (|:| LD JB) (|:| |Fake?| (|Boolean|))
                      (|:| |Dep| (|List| (|NonNegativeInteger|)))
                      (|:| |Fun| S))))
          (|ic| (S)) (|sl| #3#) (#7=#:G536 NIL) (#8=#:G537 NIL)
          (|nsl| (|List| S)) (#9=#:G538 NIL) (#10=#:G539 NIL) (|seq| (S))
          (|ol| (|List| S)) (|nl| (|List| S)) (#11=#:G540 NIL) (|eq| NIL)
          (#12=#:G541 NIL) (#13=#:G542 NIL) (#14=#:G543 NIL)
          (|tmp2| (|List| #4#)) (|tmp1| (|List| #4#)) (#15=#:G544 NIL)
          (#16=#:G545 NIL))
         (SEQ
          (COND ((NULL |sys|) NIL) ((EQL (LENGTH |sys|) 1) |sys|)
                ('T
                 (SEQ (LETT |nl| (SPADCALL (ELT % 128) |sys| (QREFELT % 142)))
                      (LETT |nsl| NIL) (LETT |sl| NIL) (LETT |osl| |sl|)
                      (SEQ G190 (COND ((NULL (NULL (NULL |nl|))) (GO G191)))
                           (SEQ
                            (SEQ (LETT |eq| NIL) (LETT #1# |nl|) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |eq| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |ld| (SPADCALL |eq| (QREFELT % 51)))
                                  (LETT |su|
                                        (SPADCALL |eq| |ld| (QREFELT % 126)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |su| 1)
                                     (LETT |nsl| (CONS |eq| |nsl|)))
                                    ('T
                                     (LETT |sl|
                                           (SPADCALL
                                            (CONS (|function| |JBFC-;greater|)
                                                  %)
                                            |sl|
                                            (LIST
                                             (VECTOR |ld| 'T NIL (QCDR |su|)))
                                            (QREFELT % 149)))))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |nl| NIL) (LETT |osl| NIL)
                            (LETT |sl| (NREVERSE |sl|))
                            (SEQ G190
                                 (COND ((NULL (NULL (NULL |sl|))) (GO G191)))
                                 (SEQ (LETT |sub| (|SPADfirst| |sl|))
                                      (LETT |osl| (CONS |sub| |osl|))
                                      (LETT |sl| (CDR |sl|))
                                      (SEQ
                                       (EXIT
                                        (SEQ G190
                                             (COND
                                              ((NULL (NULL (NULL |sl|)))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |rec| (|SPADfirst| |sl|))
                                              (EXIT
                                               (COND
                                                ((SPADCALL (QVELT |rec| 0)
                                                           (QVELT |sub| 0)
                                                           (QREFELT % 77))
                                                 (PROGN
                                                  (LETT #5# 1)
                                                  (GO #17=#:G496)))
                                                ('T
                                                 (SEQ (LETT |sl| (CDR |sl|))
                                                      (LETT |ic|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QVELT |rec| 3)
                                                              (QVELT |sub| 3)
                                                              (QREFELT % 150))
                                                             (QREFELT % 128)))
                                                      (EXIT
                                                       (COND
                                                        ((NULL
                                                          (SPADCALL |ic|
                                                                    (QREFELT %
                                                                             84)))
                                                         (LETT |nl|
                                                               (CONS |ic|
                                                                     |nl|))))))))))
                                             NIL (GO G190) G191 (EXIT NIL)))
                                       #17# (EXIT #5#))
                                      (LETT |tmp| NIL)
                                      (SEQ (LETT #6# |sl|) G190
                                           (COND
                                            ((OR (ATOM #6#)
                                                 (PROGN
                                                  (LETT |rec| (CAR #6#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |d|
                                                  (SPADCALL (QVELT |rec| 0)
                                                            (QVELT |sub| 0)
                                                            (QREFELT % 62)))
                                            (EXIT
                                             (COND
                                              ((NULL |d|)
                                               (SEQ
                                                (LETT |seq|
                                                      (SPADCALL (QVELT |rec| 3)
                                                                (QVELT |sub| 0)
                                                                (QVELT |sub| 3)
                                                                (QREFELT %
                                                                         146)))
                                                (EXIT
                                                 (LETT |tmp|
                                                       (CONS
                                                        (VECTOR (QVELT |rec| 0)
                                                                'T NIL |seq|)
                                                        |tmp|)))))
                                              ('T
                                               (SEQ
                                                (LETT |ic|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QVELT |sub| 3) |d|
                                                         (QREFELT % 63))
                                                        (QVELT |rec| 3)
                                                        (QREFELT % 150))
                                                       (QVELT |sub| 0)
                                                       (QVELT |sub| 3)
                                                       (QREFELT % 146)))
                                                (LETT |ic|
                                                      (SPADCALL |ic|
                                                                (QREFELT %
                                                                         128)))
                                                (EXIT
                                                 (COND
                                                  ((NULL
                                                    (SPADCALL |ic|
                                                              (QREFELT % 84)))
                                                   (LETT |nl|
                                                         (CONS |ic|
                                                               |nl|))))))))))
                                           (LETT #6# (CDR #6#)) (GO G190) G191
                                           (EXIT NIL))
                                      (EXIT (LETT |sl| (NREVERSE |tmp|))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (LETT |sl| |osl|) (LETT |ol| NIL)
                            (SEQ (LETT |eq| NIL) (LETT #7# |nsl|) G190
                                 (COND
                                  ((OR (ATOM #7#)
                                       (PROGN (LETT |eq| (CAR #7#)) NIL))
                                   (GO G191)))
                                 (SEQ (LETT |seq| |eq|)
                                      (SEQ (LETT #8# |sl|) G190
                                           (COND
                                            ((OR (ATOM #8#)
                                                 (PROGN
                                                  (LETT |sub| (CAR #8#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT |seq|
                                                   (SPADCALL |seq|
                                                             (QVELT |sub| 0)
                                                             (QVELT |sub| 3)
                                                             (QREFELT %
                                                                      146)))))
                                           (LETT #8# (CDR #8#)) (GO G190) G191
                                           (EXIT NIL))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |seq| |eq| (QREFELT % 147))
                                         (LETT |ol| (CONS |eq| |ol|)))
                                        ((NULL (SPADCALL |seq| (QREFELT % 84)))
                                         (LETT |nl|
                                               (CONS
                                                (SPADCALL |seq|
                                                          (QREFELT % 128))
                                                |nl|))))))
                                 (LETT #7# (CDR #7#)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |nsl| |ol|) (LETT |ol| NIL)
                            (SEQ (LETT |eq| NIL) (LETT #9# |nl|) G190
                                 (COND
                                  ((OR (ATOM #9#)
                                       (PROGN (LETT |eq| (CAR #9#)) NIL))
                                   (GO G191)))
                                 (SEQ (LETT |seq| |eq|)
                                      (SEQ (LETT #10# |sl|) G190
                                           (COND
                                            ((OR (ATOM #10#)
                                                 (PROGN
                                                  (LETT |sub| (CAR #10#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT |seq|
                                                   (SPADCALL |seq|
                                                             (QVELT |sub| 0)
                                                             (QVELT |sub| 3)
                                                             (QREFELT %
                                                                      146)))))
                                           (LETT #10# (CDR #10#)) (GO G190)
                                           G191 (EXIT NIL))
                                      (EXIT
                                       (COND
                                        ((NULL (SPADCALL |seq| (QREFELT % 84)))
                                         (LETT |ol|
                                               (CONS
                                                (SPADCALL |seq|
                                                          (QREFELT % 128))
                                                |ol|))))))
                                 (LETT #9# (CDR #9#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT (LETT |nl| |ol|)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |tmp1|
                            (PROGN
                             (LETT #11# NIL)
                             (SEQ (LETT |eq| NIL) (LETT #12# |nsl|) G190
                                  (COND
                                   ((OR (ATOM #12#)
                                        (PROGN (LETT |eq| (CAR #12#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #11#
                                          (CONS
                                           (VECTOR
                                            (SPADCALL |eq| (QREFELT % 51)) 'T
                                            NIL |eq|)
                                           #11#))))
                                  (LETT #12# (CDR #12#)) (GO G190) G191
                                  (EXIT (NREVERSE #11#)))))
                      (LETT |tmp2|
                            (PROGN
                             (LETT #13# NIL)
                             (SEQ (LETT #14# |sl|) G190
                                  (COND
                                   ((OR (ATOM #14#)
                                        (PROGN (LETT |rec| (CAR #14#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #13#
                                          (CONS
                                           (VECTOR (QVELT |rec| 0) 'T NIL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QVELT |rec| 0)
                                                               (QREFELT % 12))
                                                     (QVELT |rec| 3)
                                                     (QREFELT % 150))
                                                    (QREFELT % 128)))
                                           #13#))))
                                  (LETT #14# (CDR #14#)) (GO G190) G191
                                  (EXIT (NREVERSE #13#)))))
                      (LETT |tmp1|
                            (SPADCALL (CONS (|function| |JBFC-;greater|) %)
                                      (SPADCALL |tmp1| |tmp2| (QREFELT % 151))
                                      (QREFELT % 122)))
                      (EXIT
                       (PROGN
                        (LETT #15# NIL)
                        (SEQ (LETT #16# |tmp1|) G190
                             (COND
                              ((OR (ATOM #16#)
                                   (PROGN (LETT |rec| (CAR #16#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT (LETT #15# (CONS (QVELT |rec| 3) #15#))))
                             (LETT #16# (CDR #16#)) (GO G190) G191
                             (EXIT (NREVERSE #15#))))))))))) 

(DECLAIM (NOTINLINE |JetBundleFunctionCategory&;|)) 

(DEFUN |JetBundleFunctionCategory&| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|JetBundleFunctionCategory&| DV$1 DV$2))
          (LETT % (GETREFV 153))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 10 (SPADCALL (QREFELT % 9)))
          (QSETREFV % 73 (|HasCategory| |#1| '(|lazyRepresentation|)))
          %))) 

(MAKEPROP '|JetBundleFunctionCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |numIndVar|) '|nn| (4 . X)
              (9 . |coerce|) |JBFC-;X;PiS;1| (14 . U) |JBFC-;U;PiS;2|
              (|List| 25) (19 . P) |JBFC-;P;PiLS;3| (25 . X) |JBFC-;X;S;4|
              (29 . U) |JBFC-;U;S;5| (33 . P) |JBFC-;P;LS;6|
              (|NonNegativeInteger|) (38 . P) |JBFC-;P;PiNniS;7| (44 . P)
              |JBFC-;P;NniS;8| (|Symbol|) (49 . |setNotation|) (|Void|)
              |JBFC-;setNotation;SV;9| (54 . |getNotation|)
              |JBFC-;getNotation;S;10| |JBFC-;numIndVar;Pi;11|
              (58 . |numDepVar|) |JBFC-;numDepVar;Pi;12| (62 . |One|)
              |JBFC-;gcd;3S;13| (|List| 7) (66 . |jetVariables|)
              (71 . |differentiate|) (|Boolean|) (77 . |one?|)
              (|Union| 7 '"failed") |JBFC-;retractIfCan;SU;14| (82 . |One|)
              (86 . =) |JBFC-;const?;SB;15| (92 . |leadingDer|) (97 . |order|)
              |JBFC-;order;SNni;16| (102 . |class|) |JBFC-;class;SNni;17|
              |JBFC-;leadingDer;SJB;18| (107 . |member?|)
              |JBFC-;freeOf?;SJBB;19| |JBFC-;characteristic;Nni;20|
              (113 . |Zero|) (117 . ~=) (123 . |derivativeOf?|)
              (129 . |formalDiff|) (135 . |subst|) (142 . <)
              |JBFC-;dSubst;SJB2S;21| (148 . |dimJ|) (|List| %)
              (|SparseEchelonMatrix| 7 %) |JBFC-;dimension;LSem2Nni;22|
              (153 . |dimS|) |JBFC-;orderDim;LSem2Nni;23| '|noChecks?|
              (|List| 41) (158 . |jacobiMatrix|) |JBFC-;jacobiMatrix;LSem;24|
              (164 . >) (|Mapping| 44 7 7) (170 . |merge|)
              (177 . |removeDuplicates!|) (|Integer|)
              (|SparseEchelonMatrix| 7 6) (182 . |new|) (188 . |zero?|)
              (|List| 6) (193 . |setRow!|) |JBFC-;jacobiMatrix;LLSem;25|
              (201 . |max|) (207 . |max|) (213 . |max|) (|Mapping| 25 25 25)
              (219 . |reduce|) |JBFC-;symbol;LSem;26| (226 . |allIndices|)
              (|Record| (|:| |Left| %) (|:| |Right| %)) (231 . |horizSplit|)
              |JBFC-;extractSymbol;2Sem;27| (237 . |jacobiMatrix|)
              (|Record| (|:| |DSys| 68) (|:| |JVars| 74)) (242 . |formalDiff2|)
              |JBFC-;formalDiff;LPiL;28| (249 . |formalDiff|)
              |JBFC-;formalDiff;SPiS;29|
              (|Record| (|:| |DPhi| %) (|:| |JVars| 41)) (255 . |formalDiff2|)
              |JBFC-;formalDiff;SLS;30| (262 . |nrows|)
              (|Record| (|:| |Indices| 41) (|:| |Entries| 85)) (267 . |row|)
              (|Union| % '#1="0") (273 . |differentiate|) (|Union| 7 '#1#)
              (279 . =) (285 . +) (291 . *) (297 . |sort!|)
              |JBFC-;formalDiff2;LPiSemR;31| |JBFC-;formalDiff2;SPiSemR;32|
              (|Record| (|:| LD 7) (|:| |Fake?| 44) (|:| |Dep| 16)
                        (|:| |Fun| 6))
              (|Mapping| 44 119 119) (|List| 119) (303 . |sort!|)
              |JBFC-;sortLD;2L;34| (309 . ~=) (|Union| % '"failed")
              (315 . |solveFor|) (321 . ~=) (327 . |simpOne|) (332 . |append|)
              (338 . |merge|) (345 . |second|) (350 . |setRow!|) (357 . |#|)
              (|Union| '#2="failed" (|List| 16))
              (|Record| (|:| |Sys| 68) (|:| JM 69) (|:| |Depend| 134))
              |JBFC-;simplify;LSemR;36| (362 . |numerator|)
              |JBFC-;simpOne;2S;37| (367 . |insert|) (374 . |insert|)
              (|Mapping| 6 6) (381 . |map|) (387 . |sortLD|)
              |JBFC-;simpMod;3L;38| |JBFC-;simpMod;LSemLR;39| (392 . |dSubst|)
              (399 . =) |JBFC-;reduceMod;3L;40| (405 . |merge!|) (412 . -)
              (418 . |concat!|) |JBFC-;autoReduce;2L;41|)
           '#(|symbol| 424 |sortLD| 429 |simplify| 434 |simpOne| 440 |simpMod|
              445 |setNotation| 458 |retractIfCan| 463 |reduceMod| 468
              |orderDim| 474 |order| 481 |numIndVar| 486 |numDepVar| 490
              |leadingDer| 494 |jacobiMatrix| 499 |getNotation| 510 |gcd| 514
              |freeOf?| 520 |formalDiff2| 526 |formalDiff| 540 |extractSymbol|
              558 |dimension| 563 |dSubst| 570 |const?| 577 |class| 582
              |characteristic| 587 |autoReduce| 591 X 596 U 605 P 614)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|autoReduce| ((|List| |#1|) (|List| |#1|))) T)
                              '((|reduceMod|
                                 ((|List| |#1|) (|List| |#1|) (|List| |#1|)))
                                T)
                              '((|simpMod|
                                 ((|Record| (|:| |Sys| (|List| |#1|))
                                            (|:| JM
                                                 (|SparseEchelonMatrix| |#2|
                                                                        |#1|))
                                            (|:| |Depend|
                                                 (|Union| #2#
                                                          (|List|
                                                           (|List|
                                                            (|NonNegativeInteger|))))))
                                  (|List| |#1|)
                                  (|SparseEchelonMatrix| |#2| |#1|)
                                  (|List| |#1|)))
                                T)
                              '((|simpMod|
                                 ((|List| |#1|) (|List| |#1|) (|List| |#1|)))
                                T)
                              '((|simpOne| (|#1| |#1|)) T)
                              '((|simplify|
                                 ((|Record| (|:| |Sys| (|List| |#1|))
                                            (|:| JM
                                                 (|SparseEchelonMatrix| |#2|
                                                                        |#1|))
                                            (|:| |Depend|
                                                 (|Union| #2#
                                                          (|List|
                                                           (|List|
                                                            (|NonNegativeInteger|))))))
                                  (|List| |#1|)
                                  (|SparseEchelonMatrix| |#2| |#1|)))
                                T)
                              '((|dSubst| (|#1| |#1| |#2| |#1|)) T)
                              '((|sortLD| ((|List| |#1|) (|List| |#1|))) T)
                              '((|leadingDer| (|#2| |#1|)) T)
                              '((|freeOf?| ((|Boolean|) |#1| |#2|)) T)
                              '((|orderDim|
                                 ((|NonNegativeInteger|) (|List| |#1|)
                                  (|SparseEchelonMatrix| |#2| |#1|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|dimension|
                                 ((|NonNegativeInteger|) (|List| |#1|)
                                  (|SparseEchelonMatrix| |#2| |#1|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|formalDiff2|
                                 ((|Record| (|:| |DSys| (|List| |#1|))
                                            (|:| |JVars|
                                                 (|List| (|List| |#2|))))
                                  (|List| |#1|) (|PositiveInteger|)
                                  (|SparseEchelonMatrix| |#2| |#1|)))
                                T)
                              '((|formalDiff2|
                                 ((|Record| (|:| |DPhi| |#1|)
                                            (|:| |JVars| (|List| |#2|)))
                                  |#1| (|PositiveInteger|)
                                  (|SparseEchelonMatrix| |#2| |#1|)))
                                T)
                              '((|formalDiff|
                                 ((|List| |#1|) (|List| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|formalDiff|
                                 (|#1| |#1| (|List| (|NonNegativeInteger|))))
                                T)
                              '((|formalDiff| (|#1| |#1| (|PositiveInteger|)))
                                T)
                              '((|symbol|
                                 ((|SparseEchelonMatrix| |#2| |#1|)
                                  (|List| |#1|)))
                                T)
                              '((|extractSymbol|
                                 ((|SparseEchelonMatrix| |#2| |#1|)
                                  (|SparseEchelonMatrix| |#2| |#1|)))
                                T)
                              '((|jacobiMatrix|
                                 ((|SparseEchelonMatrix| |#2| |#1|)
                                  (|List| |#1|) (|List| (|List| |#2|))))
                                T)
                              '((|jacobiMatrix|
                                 ((|SparseEchelonMatrix| |#2| |#1|)
                                  (|List| |#1|)))
                                T)
                              '((|class| ((|NonNegativeInteger|) |#1|)) T)
                              '((|order| ((|NonNegativeInteger|) |#1|)) T)
                              '((|const?| ((|Boolean|) |#1|)) T)
                              '((|numDepVar| ((|PositiveInteger|))) T)
                              '((|numIndVar| ((|PositiveInteger|))) T)
                              '((|getNotation| ((|Symbol|))) T)
                              '((|setNotation| ((|Void|) (|Symbol|))) T)
                              '((P (|#1| (|NonNegativeInteger|))) T)
                              '((P
                                 (|#1| (|PositiveInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((P (|#1| (|List| (|NonNegativeInteger|)))) T)
                              '((U (|#1|)) T) '((X (|#1|)) T)
                              '((P
                                 (|#1| (|PositiveInteger|)
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((U (|#1| (|PositiveInteger|))) T)
                              '((X (|#1| (|PositiveInteger|))) T)
                              '((|retractIfCan| ((|Union| |#2| "failed") |#1|))
                                T)
                              '((|gcd| (|#1| |#1| |#1|)) T)
                              '((|gcd| (|#1| (|List| |#1|))) T)
                              '((|characteristic| ((|NonNegativeInteger|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 152
                                            '(0 7 8 9 1 7 0 8 11 1 6 0 7 12 1 7
                                              0 8 14 2 7 0 8 16 17 0 7 0 19 0 7
                                              0 21 1 7 0 16 23 2 7 0 8 25 26 1
                                              7 0 25 28 1 7 30 30 31 0 7 30 34
                                              0 7 8 37 0 6 0 39 1 6 41 0 42 2 6
                                              0 0 7 43 1 6 44 0 45 0 7 0 48 2 7
                                              44 0 0 49 1 6 7 0 51 1 7 25 0 52
                                              1 7 25 0 54 2 41 44 7 0 57 0 6 0
                                              60 2 6 44 0 0 61 2 7 16 0 0 62 2
                                              6 0 0 16 63 3 6 0 0 7 0 64 2 7 44
                                              0 0 65 1 7 25 25 67 1 7 25 25 71
                                              2 6 69 68 74 75 2 7 44 0 0 77 3
                                              41 0 78 0 0 79 1 41 0 0 80 2 82 0
                                              41 81 83 1 6 44 0 84 4 82 32 0 81
                                              41 85 86 2 7 0 0 0 88 2 41 0 0 0
                                              89 2 25 0 0 0 90 3 16 25 91 0 25
                                              92 1 82 41 0 94 2 82 95 0 7 96 1
                                              6 69 68 98 3 6 99 68 8 69 100 2 6
                                              68 68 8 102 3 6 104 0 8 69 105 1
                                              82 25 0 107 2 82 108 0 81 109 2 7
                                              110 0 8 111 2 112 44 0 0 113 2 6
                                              0 0 0 114 2 6 0 0 0 115 2 41 0 78
                                              0 116 2 121 0 120 0 122 2 7 44 0
                                              0 124 2 6 125 0 7 126 2 119 44 0
                                              0 127 1 6 0 0 128 2 16 0 0 0 129
                                              3 121 0 120 0 0 130 1 41 7 0 131
                                              3 82 32 0 81 108 132 1 16 25 0
                                              133 1 6 0 0 137 3 41 0 7 0 81 139
                                              3 85 0 6 0 81 140 2 85 0 141 0
                                              142 1 6 68 68 143 3 6 0 0 7 0 146
                                              2 6 44 0 0 147 3 121 0 120 0 0
                                              149 2 6 0 0 0 150 2 121 0 0 0 151
                                              1 0 69 68 93 1 0 68 68 123 2 0
                                              135 68 69 136 1 0 0 0 138 2 0 68
                                              68 68 144 3 0 135 68 69 68 145 1
                                              0 32 30 33 1 0 46 0 47 2 0 68 68
                                              68 148 3 0 25 68 69 25 72 1 0 25
                                              0 53 0 0 8 36 0 0 8 38 1 0 7 0 56
                                              1 0 69 68 76 2 0 69 68 74 87 0 0
                                              30 35 2 0 0 0 0 40 2 0 44 0 7 58
                                              3 0 104 0 8 69 118 3 0 99 68 8 69
                                              117 2 0 0 0 16 106 2 0 0 0 8 103
                                              2 0 68 68 8 101 1 0 69 69 97 3 0
                                              25 68 69 25 70 3 0 0 0 7 0 66 1 0
                                              44 0 50 1 0 25 0 55 0 0 25 59 1 0
                                              68 68 152 1 0 0 8 13 0 0 0 20 1 0
                                              0 8 15 0 0 0 22 2 0 0 8 16 18 1 0
                                              0 16 24 1 0 0 25 29 2 0 0 8 25
                                              27)))))
           '|lookupComplete|)) 
