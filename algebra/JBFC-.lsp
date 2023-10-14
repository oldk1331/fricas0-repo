
(DEFUN |JBFC-;X;PiS;1| (|i| $)
  (SPADCALL (SPADCALL |i| (QREFELT $ 11)) (QREFELT $ 12))) 

(DEFUN |JBFC-;U;PiS;2| (|i| $)
  (SPADCALL (SPADCALL |i| (QREFELT $ 14)) (QREFELT $ 12))) 

(DEFUN |JBFC-;P;PiLS;3| (|i| |l| $)
  (SPADCALL (SPADCALL |i| |l| (QREFELT $ 17)) (QREFELT $ 12))) 

(DEFUN |JBFC-;X;S;4| ($) (SPADCALL (SPADCALL (QREFELT $ 19)) (QREFELT $ 12))) 

(DEFUN |JBFC-;U;S;5| ($) (SPADCALL (SPADCALL (QREFELT $ 21)) (QREFELT $ 12))) 

(DEFUN |JBFC-;P;LS;6| (|l| $)
  (SPADCALL (SPADCALL |l| (QREFELT $ 23)) (QREFELT $ 12))) 

(DEFUN |JBFC-;P;PiNniS;7| (|i| |l| $)
  (SPADCALL (SPADCALL |i| |l| (QREFELT $ 26)) (QREFELT $ 12))) 

(DEFUN |JBFC-;P;NniS;8| (|i| $)
  (SPADCALL (SPADCALL |i| (QREFELT $ 28)) (QREFELT $ 12))) 

(DEFUN |JBFC-;setNotation;SV;9| (|s| $) (SPADCALL |s| (QREFELT $ 31))) 

(DEFUN |JBFC-;getNotation;S;10| ($) (SPADCALL (QREFELT $ 34))) 

(DEFUN |JBFC-;numIndVar;Pi;11| ($) (SPADCALL (QREFELT $ 9))) 

(DEFUN |JBFC-;numDepVar;Pi;12| ($) (SPADCALL (QREFELT $ 37))) 

(DEFUN |JBFC-;gcd;3S;13| (|f1| |f2| $) (|spadConstant| $ 39)) 

(DEFUN |JBFC-;retractIfCan;SU;14| (|f| $)
  (PROG (|jv| JV)
    (RETURN
     (SEQ
      (LETT JV (SPADCALL |f| (QREFELT $ 42)) . #1=(|JBFC-;retractIfCan;SU;14|))
      (EXIT
       (COND
        ((EQL (LENGTH JV) 1)
         (SEQ (LETT |jv| (|SPADfirst| JV) . #1#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |f| |jv| (QREFELT $ 43)) (QREFELT $ 45))
                 (CONS 0 |jv|))
                (#2='T (CONS 1 "failed"))))))
        (#2# (CONS 1 "failed")))))))) 

(DEFUN |JBFC-;const?;SB;15| (|Phi| $)
  (PROG (JV)
    (RETURN
     (SEQ (LETT JV (SPADCALL |Phi| (QREFELT $ 42)) |JBFC-;const?;SB;15|)
          (EXIT
           (COND ((NULL JV) 'T) ((SPADCALL (LENGTH JV) 1 (QREFELT $ 48)) 'NIL)
                 ('T
                  (SPADCALL (|SPADfirst| JV) (SPADCALL (QREFELT $ 49))
                            (QREFELT $ 50))))))))) 

(DEFUN |JBFC-;order;SNni;16| (|Phi| $)
  (SPADCALL (SPADCALL |Phi| (QREFELT $ 52)) (QREFELT $ 53))) 

(DEFUN |JBFC-;class;SNni;17| (|Phi| $)
  (SPADCALL (SPADCALL |Phi| (QREFELT $ 52)) (QREFELT $ 55))) 

(DEFUN |JBFC-;leadingDer;SJB;18| (|fun| $)
  (PROG (JV)
    (RETURN
     (SEQ (LETT JV (SPADCALL |fun| (QREFELT $ 42)) |JBFC-;leadingDer;SJB;18|)
          (EXIT
           (COND ((NULL JV) (SPADCALL (QREFELT $ 49)))
                 ('T (|SPADfirst| JV)))))))) 

(DEFUN |JBFC-;freeOf?;SJBB;19| (|fun| |jv| $)
  (COND ((SPADCALL |jv| (SPADCALL |fun| (QREFELT $ 42)) (QREFELT $ 58)) 'NIL)
        ('T 'T))) 

(PUT '|JBFC-;characteristic;Nni;20| '|SPADreplace| '(XLAM NIL 0)) 

(DEFUN |JBFC-;characteristic;Nni;20| ($) 0) 

(DEFUN |JBFC-;dSubst;SJB2S;21| (|f| |jv| |exp| $)
  (PROG (|nf| |dexp| |d| #1=#:G204 |jvar| #2=#:G205 |JVar| |of|)
    (RETURN
     (SEQ (LETT |of| (|spadConstant| $ 61) . #3=(|JBFC-;dSubst;SJB2S;21|))
          (LETT |nf| |f| . #3#)
          (SEQ G190
               (COND ((NULL (SPADCALL |nf| |of| (QREFELT $ 62))) (GO G191)))
               (SEQ (LETT |of| |nf| . #3#)
                    (LETT |JVar| (SPADCALL |of| (QREFELT $ 42)) . #3#)
                    (EXIT
                     (SEQ (LETT #2# NIL . #3#) (LETT |jvar| NIL . #3#)
                          (LETT #1# |JVar| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |jvar| (CAR #1#) . #3#) NIL) #2#)
                            (GO G191)))
                          (SEQ
                           (LETT |d| (SPADCALL |jvar| |jv| (QREFELT $ 63))
                                 . #3#)
                           (EXIT
                            (COND
                             ((NULL (NULL |d|))
                              (SEQ
                               (LETT |dexp| (SPADCALL |exp| |d| (QREFELT $ 64))
                                     . #3#)
                               (EXIT
                                (LETT |nf|
                                      (SPADCALL |nf| |jvar| |dexp|
                                                (QREFELT $ 65))
                                      . #3#)))))))
                          (LETT #1#
                                (PROG1 (CDR #1#)
                                  (LETT #2#
                                        (SPADCALL |jvar| |jv| (QREFELT $ 66))
                                        . #3#))
                                . #3#)
                          (GO G190) G191 (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |nf|))))) 

(DEFUN |JBFC-;dimension;LSem2Nni;22| (|sys| |jm| |q| $)
  (PROG (#1=#:G206)
    (RETURN
     (PROG1
         (LETT #1# (- (SPADCALL |q| (QREFELT $ 68)) (LENGTH |sys|))
               |JBFC-;dimension;LSem2Nni;22|)
       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))) 

(DEFUN |JBFC-;orderDim;LSem2Nni;23| (|sys| |jm| |q| $)
  (PROG (#1=#:G208)
    (RETURN
     (PROG1
         (LETT #1# (- (SPADCALL |q| (QREFELT $ 72)) (LENGTH |sys|))
               |JBFC-;orderDim;LSem2Nni;23|)
       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))) 

(DEFUN |JBFC-;jacobiMatrix;LSem;24| (|funs| $)
  (PROG (#1=#:G213 |fun| #2=#:G212)
    (RETURN
     (SEQ
      (SPADCALL |funs|
                (PROGN
                 (LETT #2# NIL . #3=(|JBFC-;jacobiMatrix;LSem;24|))
                 (SEQ (LETT |fun| NIL . #3#) (LETT #1# |funs| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |fun| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |fun| (QREFELT $ 42)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 76)))))) 

(DEFUN |JBFC-;jacobiMatrix;LLSem;25| (|funs| |varlist| $)
  (PROG (|inds| |ents| |df| #1=#:G229 |jv| #2=#:G227 |f| #3=#:G228 |vars| |i|
         JM |JvList| #4=#:G226)
    (RETURN
     (SEQ
      (LETT |JvList| (|SPADfirst| |varlist|)
            . #5=(|JBFC-;jacobiMatrix;LLSem;25|))
      (SEQ (LETT |vars| NIL . #5#) (LETT #4# (CDR |varlist|) . #5#) G190
           (COND
            ((OR (ATOM #4#) (PROGN (LETT |vars| (CAR #4#) . #5#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |JvList|
                   (SPADCALL
                    (SPADCALL (ELT $ 78) |JvList| |vars| (QREFELT $ 80))
                    (QREFELT $ 81))
                   . #5#)))
           (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
      (LETT JM (SPADCALL |JvList| (LENGTH |funs|) (QREFELT $ 84)) . #5#)
      (SEQ (LETT |i| 1 . #5#) (LETT |vars| NIL . #5#)
           (LETT #3# |varlist| . #5#) (LETT |f| NIL . #5#)
           (LETT #2# |funs| . #5#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #5#) NIL) (ATOM #3#)
                 (PROGN (LETT |vars| (CAR #3#) . #5#) NIL))
             (GO G191)))
           (SEQ (LETT |ents| NIL . #5#) (LETT |inds| NIL . #5#)
                (SEQ (LETT |jv| NIL . #5#) (LETT #1# |vars| . #5#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |jv| (CAR #1#) . #5#) NIL))
                       (GO G191)))
                     (SEQ (LETT |df| (SPADCALL |f| |jv| (QREFELT $ 43)) . #5#)
                          (EXIT
                           (COND
                            ((OR (QREFELT $ 74)
                                 (NULL (SPADCALL |df| (QREFELT $ 85))))
                             (SEQ (LETT |ents| (CONS |df| |ents|) . #5#)
                                  (EXIT
                                   (LETT |inds| (CONS |jv| |inds|) . #5#)))))))
                     (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL JM |i| (NREVERSE |inds|) (NREVERSE |ents|)
                           (QREFELT $ 87))))
           (LETT #2#
                 (PROG1 (CDR #2#)
                   (LETT #3# (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|) . #5#))
                         . #5#))
                 . #5#)
           (GO G190) G191 (EXIT NIL))
      (EXIT JM))))) 

(DEFUN |JBFC-;symbol;LSem;26| (|funs| $)
  (PROG (|inds| |ents| |df| #1=#:G264 |jv| #2=#:G262 |f| #3=#:G263 |ojl| |i|
         |symb| |oJV| |allJV| |jl| #4=#:G261 |ord| |ol| #5=#:G260 #6=#:G259 JVL
         #7=#:G258 |fun| #8=#:G257)
    (RETURN
     (SEQ
      (LETT JVL
            (PROGN
             (LETT #8# NIL . #9=(|JBFC-;symbol;LSem;26|))
             (SEQ (LETT |fun| NIL . #9#) (LETT #7# |funs| . #9#) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |fun| (CAR #7#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #8# (CONS (SPADCALL |fun| (QREFELT $ 42)) #8#)
                          . #9#)))
                  (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                  (EXIT (NREVERSE #8#))))
            . #9#)
      (LETT |ol|
            (PROGN
             (LETT #6# NIL . #9#)
             (SEQ (LETT |jl| NIL . #9#) (LETT #5# JVL . #9#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |jl| (CAR #5#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #6#
                          (CONS (SPADCALL (|SPADfirst| |jl|) (QREFELT $ 53))
                                #6#)
                          . #9#)))
                  (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #9#)
      (LETT |ord| (SPADCALL (ELT $ 91) |ol| 0 (QREFELT $ 93)) . #9#)
      (LETT |oJV| NIL . #9#) (LETT |allJV| NIL . #9#)
      (SEQ (LETT |jl| NIL . #9#) (LETT #4# JVL . #9#) G190
           (COND
            ((OR (ATOM #4#) (PROGN (LETT |jl| (CAR #4#) . #9#) NIL))
             (GO G191)))
           (SEQ (LETT |ojl| NIL . #9#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND
                         ((OR (NULL |jl|)
                              (< (SPADCALL (|SPADfirst| |jl|) (QREFELT $ 53))
                                 |ord|))
                          'NIL)
                         ('T 'T)))
                       (GO G191)))
                     (SEQ (LETT |ojl| (CONS (|SPADfirst| |jl|) |ojl|) . #9#)
                          (EXIT (LETT |jl| (CDR |jl|) . #9#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |ojl| (NREVERSE |ojl|) . #9#)
                (LETT |oJV| (CONS |ojl| |oJV|) . #9#)
                (EXIT
                 (LETT |allJV|
                       (SPADCALL
                        (SPADCALL (ELT $ 78) |allJV| |ojl| (QREFELT $ 80))
                        (QREFELT $ 81))
                       . #9#)))
           (LETT #4# (CDR #4#) . #9#) (GO G190) G191 (EXIT NIL))
      (LETT |oJV| (NREVERSE |oJV|) . #9#)
      (LETT |symb| (SPADCALL |allJV| (LENGTH |funs|) (QREFELT $ 84)) . #9#)
      (SEQ (LETT |i| 1 . #9#) (LETT |ojl| NIL . #9#) (LETT #3# |oJV| . #9#)
           (LETT |f| NIL . #9#) (LETT #2# |funs| . #9#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #9#) NIL) (ATOM #3#)
                 (PROGN (LETT |ojl| (CAR #3#) . #9#) NIL))
             (GO G191)))
           (SEQ (LETT |ents| NIL . #9#) (LETT |inds| NIL . #9#)
                (SEQ (LETT |jv| NIL . #9#) (LETT #1# |ojl| . #9#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |jv| (CAR #1#) . #9#) NIL))
                       (GO G191)))
                     (SEQ (LETT |df| (SPADCALL |f| |jv| (QREFELT $ 43)) . #9#)
                          (EXIT
                           (COND
                            ((OR (QREFELT $ 74)
                                 (NULL (SPADCALL |df| (QREFELT $ 85))))
                             (SEQ (LETT |ents| (CONS |df| |ents|) . #9#)
                                  (EXIT
                                   (LETT |inds| (CONS |jv| |inds|) . #9#)))))))
                     (LETT #1# (CDR #1#) . #9#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL |symb| |i| (NREVERSE |inds|) (NREVERSE |ents|)
                           (QREFELT $ 87))))
           (LETT #2#
                 (PROG1 (CDR #2#)
                   (LETT #3# (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|) . #9#))
                         . #9#))
                 . #9#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |symb|))))) 

(DEFUN |JBFC-;extractSymbol;2Sem;27| (|jm| $)
  (PROG (|inds| |o|)
    (RETURN
     (SEQ
      (LETT |inds| (SPADCALL |jm| (QREFELT $ 95))
            . #1=(|JBFC-;extractSymbol;2Sem;27|))
      (LETT |o| (SPADCALL (|SPADfirst| |inds|) (QREFELT $ 53)) . #1#)
      (LETT |inds| (CDR |inds|) . #1#)
      (SEQ G190
           (COND
            ((NULL
              (COND ((NULL |inds|) 'NIL)
                    ('T
                     (EQL (SPADCALL (|SPADfirst| |inds|) (QREFELT $ 53))
                          |o|))))
             (GO G191)))
           (SEQ (EXIT (LETT |inds| (CDR |inds|) . #1#))) NIL (GO G190) G191
           (EXIT NIL))
      (EXIT
       (COND ((NULL |inds|) |jm|)
             ('T
              (QCAR (SPADCALL |jm| (|SPADfirst| |inds|) (QREFELT $ 97)))))))))) 

(DEFUN |JBFC-;formalDiff;LPiL;28| (|Sys| |i| $)
  (PROG (JM)
    (RETURN
     (SEQ (LETT JM (SPADCALL |Sys| (QREFELT $ 99)) |JBFC-;formalDiff;LPiL;28|)
          (EXIT (QCAR (SPADCALL |Sys| |i| JM (QREFELT $ 101)))))))) 

(DEFUN |JBFC-;formalDiff;SPiS;29| (|Eq| |i| $)
  (|SPADfirst| (SPADCALL (LIST |Eq|) |i| (QREFELT $ 103)))) 

(DEFUN |JBFC-;formalDiff;SLS;30| (|f| |mu| $)
  (PROG (JV |df| |tmp| #1=#:G275 |jm| |k| #2=#:G282 |i| #3=#:G283 |j|)
    (RETURN
     (SEQ
      (LETT JV (SPADCALL |f| (QREFELT $ 42)) . #4=(|JBFC-;formalDiff;SLS;30|))
      (LETT |df| |f| . #4#)
      (SEQ (LETT |j| NIL . #4#) (LETT #3# |mu| . #4#) (LETT |i| 1 . #4#)
           (LETT #2# (QREFELT $ 10) . #4#) G190
           (COND
            ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                 (PROGN (LETT |j| (CAR #3#) . #4#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |k| 1 . #4#) G190
                  (COND ((|greater_SI| |k| |j|) (GO G191)))
                  (SEQ
                   (LETT |jm| (SPADCALL (LIST |df|) (LIST JV) (QREFELT $ 76))
                         . #4#)
                   (LETT |tmp|
                         (SPADCALL |df|
                                   (PROG1 (LETT #1# |i| . #4#)
                                     (|check_subtype| (> #1# 0)
                                                      '(|PositiveInteger|)
                                                      #1#))
                                   |jm| (QREFELT $ 106))
                         . #4#)
                   (LETT |df| (QCAR |tmp|) . #4#)
                   (EXIT (LETT JV (QCDR |tmp|) . #4#)))
                  (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #4#)) . #4#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |df|))))) 

(DEFUN |JBFC-;formalDiff2;LPiSemR;31| (|Sys| |i| JM $)
  (PROG (LJV JV |LRes| |res| |djv| #1=#:G314 |df| #2=#:G315 |jv| |r| #3=#:G313
         |l| #4=#:G312 |eq| #5=#:G311 #6=#:G310 #7=#:G309 |inds|)
    (RETURN
     (SEQ
      (LETT |inds| (SPADCALL JM (QREFELT $ 95))
            . #8=(|JBFC-;formalDiff2;LPiSemR;31|))
      (EXIT
       (COND
        ((NULL |inds|)
         (CONS
          (PROGN
           (LETT #7# NIL . #8#)
           (SEQ (LETT |eq| NIL . #8#) (LETT #6# |Sys| . #8#) G190
                (COND
                 ((OR (ATOM #6#) (PROGN (LETT |eq| (CAR #6#) . #8#) NIL))
                  (GO G191)))
                (SEQ (EXIT (LETT #7# (CONS (|spadConstant| $ 61) #7#) . #8#)))
                (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                (EXIT (NREVERSE #7#))))
          (PROGN
           (LETT #5# NIL . #8#)
           (SEQ (LETT |eq| NIL . #8#) (LETT #4# |Sys| . #8#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |eq| (CAR #4#) . #8#) NIL))
                  (GO G191)))
                (SEQ (EXIT (LETT #5# (CONS NIL #5#) . #8#)))
                (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                (EXIT (NREVERSE #5#))))))
        ('T
         (SEQ (LETT |LRes| NIL . #8#) (LETT LJV NIL . #8#)
              (SEQ (LETT |l| 1 . #8#)
                   (LETT #3# (SPADCALL JM (QREFELT $ 108)) . #8#) G190
                   (COND ((|greater_SI| |l| #3#) (GO G191)))
                   (SEQ (LETT |r| (SPADCALL JM |l| (QREFELT $ 110)) . #8#)
                        (LETT |res| (|spadConstant| $ 61) . #8#)
                        (LETT JV NIL . #8#)
                        (SEQ (LETT |jv| NIL . #8#)
                             (LETT #2# (REVERSE (QCAR |r|)) . #8#)
                             (LETT |df| NIL . #8#)
                             (LETT #1# (REVERSE (QCDR |r|)) . #8#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |df| (CAR #1#) . #8#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |jv| (CAR #2#) . #8#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((OR (QREFELT $ 74)
                                     (NULL (SPADCALL |df| (QREFELT $ 85))))
                                 (SEQ
                                  (LETT |djv|
                                        (SPADCALL |jv| |i| (QREFELT $ 112))
                                        . #8#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |djv| 1)
                                     (LETT JV (CONS |jv| JV) . #8#))
                                    ((SPADCALL |djv|
                                               (CONS 0
                                                     (SPADCALL (QREFELT $ 49)))
                                               (QREFELT $ 114))
                                     (SEQ
                                      (LETT |res|
                                            (SPADCALL |res| |df|
                                                      (QREFELT $ 115))
                                            . #8#)
                                      (EXIT (LETT JV (CONS |jv| JV) . #8#))))
                                    ('T
                                     (SEQ
                                      (LETT |res|
                                            (SPADCALL |res|
                                                      (SPADCALL |df|
                                                                (SPADCALL
                                                                 (QCDR |djv|)
                                                                 (QREFELT $
                                                                          12))
                                                                (QREFELT $
                                                                         116))
                                                      (QREFELT $ 115))
                                            . #8#)
                                      (EXIT
                                       (LETT JV
                                             (CONS (QCDR |djv|) (CONS |jv| JV))
                                             . #8#)))))))))))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #8#))
                                   . #8#)
                             (GO G190) G191 (EXIT NIL))
                        (LETT |LRes| (CONS |res| |LRes|) . #8#)
                        (LETT JV
                              (SPADCALL (ELT $ 78) (SPADCALL JV (QREFELT $ 81))
                                        (QREFELT $ 117))
                              . #8#)
                        (EXIT (LETT LJV (CONS JV LJV) . #8#)))
                   (LETT |l| (|inc_SI| |l|) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |LRes|) (NREVERSE LJV))))))))))) 

(DEFUN |JBFC-;formalDiff2;SPiSemR;32| (|Eq| |i| JM $)
  (PROG (|tmp|)
    (RETURN
     (SEQ
      (LETT |tmp| (SPADCALL (LIST |Eq|) |i| JM (QREFELT $ 101))
            |JBFC-;formalDiff2;SPiSemR;32|)
      (EXIT (CONS (|SPADfirst| (QCAR |tmp|)) (|SPADfirst| (QCDR |tmp|)))))))) 

(DEFUN |JBFC-;greater| (|r1| |r2| $)
  (SPADCALL (QVELT |r1| 0) (QVELT |r2| 0) (QREFELT $ 78))) 

(DEFUN |JBFC-;sortLD;2L;34| (|sys| $)
  (PROG (#1=#:G334 |l| #2=#:G333 |sl| #3=#:G332 |f| #4=#:G331)
    (RETURN
     (SEQ
      (LETT |sl|
            (PROGN
             (LETT #4# NIL . #5=(|JBFC-;sortLD;2L;34|))
             (SEQ (LETT |f| NIL . #5#) (LETT #3# |sys| . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (VECTOR (SPADCALL |f| (QREFELT $ 52)) 'NIL (LIST 1)
                                   |f|)
                           #4#)
                          . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |sl|
            (SPADCALL (CONS (|function| |JBFC-;greater|) $) |sl|
                      (QREFELT $ 123))
            . #5#)
      (EXIT
       (PROGN
        (LETT #2# NIL . #5#)
        (SEQ (LETT |l| NIL . #5#) (LETT #1# |sl| . #5#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#) . #5#) NIL))
               (GO G191)))
             (SEQ (EXIT (LETT #2# (CONS (QVELT |l| 3) #2#) . #5#)))
             (LETT #1# (CDR #1#) . #5#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |JBFC-;simpLD| (|l| $)
  (PROG (|newL| |newld| #1=#:G376 |eq| #2=#:G377 JV |sjv| #3=#:G374 #4=#:G375
         |lJV| |minlen| |sj| |seq| |len| #5=#:G373 |neweq| #6=#:G342 #7=#:G372
         |solvable?| |s| #8=#:G370 #9=#:G371 |eqLD| |fl| |cur|)
    (RETURN
     (SEQ
      (COND ((< (LENGTH |l|) 2) |l|)
            (#10='T
             (SEQ (LETT |cur| (|SPADfirst| |l|) . #11=(|JBFC-;simpLD|))
                  (LETT |l| (CDR |l|) . #11#)
                  (EXIT
                   (COND
                    ((SPADCALL (QVELT |cur| 0) (QVELT (|SPADfirst| |l|) 0)
                               (QREFELT $ 125))
                     (CONS |cur| (|JBFC-;simpLD| |l| $)))
                    (#10#
                     (SEQ (LETT |eqLD| (LIST |cur|) . #11#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND ((NULL |l|) 'NIL)
                                        ('T
                                         (SPADCALL (QVELT |cur| 0)
                                                   (QVELT
                                                    (LETT |fl|
                                                          (|SPADfirst| |l|)
                                                          . #11#)
                                                    0)
                                                   (QREFELT $ 50)))))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((QVELT |fl| 1)
                                   (|error| #12="cannot simplify"))
                                  ('T
                                   (SEQ (LETT |eqLD| (CONS |fl| |eqLD|) . #11#)
                                        (EXIT (LETT |l| (CDR |l|) . #11#)))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |solvable?| 'NIL . #11#)
                          (SEQ (LETT #9# NIL . #11#) (LETT |eq| NIL . #11#)
                               (LETT #8# |eqLD| . #11#) G190
                               (COND
                                ((OR (ATOM #8#)
                                     (PROGN (LETT |eq| (CAR #8#) . #11#) NIL)
                                     #9#)
                                 (GO G191)))
                               (SEQ
                                (LETT |s|
                                      (SPADCALL (QVELT |eq| 3) (QVELT |cur| 0)
                                                (QREFELT $ 127))
                                      . #11#)
                                (LETT |solvable?| (QEQCAR |s| 0) . #11#)
                                (EXIT (LETT |seq| |eq| . #11#)))
                               (LETT #8#
                                     (PROG1 (CDR #8#)
                                       (LETT #9# |solvable?| . #11#))
                                     . #11#)
                               (GO G190) G191 (EXIT NIL))
                          (LETT |newL| NIL . #11#)
                          (COND
                           (|solvable?|
                            (SEQ (LETT |eq| NIL . #11#)
                                 (LETT #7# |eqLD| . #11#) G190
                                 (COND
                                  ((OR (ATOM #7#)
                                       (PROGN
                                        (LETT |eq| (CAR #7#) . #11#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL |eq| |seq| (QREFELT $ 130))
                                     (SEQ
                                      (LETT |neweq|
                                            (SPADCALL
                                             (SPADCALL (QVELT |eq| 3)
                                                       (QVELT |cur| 0)
                                                       (PROG2
                                                           (LETT #6# |s|
                                                                 . #11#)
                                                           (QCDR #6#)
                                                         (|check_union|
                                                          (QEQCAR #6# 0)
                                                          (QREFELT $ 6) #6#))
                                                       (QREFELT $ 65))
                                             (QREFELT $ 131))
                                            . #11#)
                                      (EXIT
                                       (COND
                                        ((NULL
                                          (SPADCALL |neweq| (QREFELT $ 85)))
                                         (SEQ
                                          (LETT |newld|
                                                (SPADCALL |neweq|
                                                          (QREFELT $ 52))
                                                . #11#)
                                          (EXIT
                                           (LETT |newL|
                                                 (SPADCALL
                                                  (CONS
                                                   (|function| |JBFC-;greater|)
                                                   $)
                                                  |newL|
                                                  (LIST
                                                   (VECTOR |newld| 'NIL
                                                           (APPEND
                                                            (QVELT |eq| 2)
                                                            (QVELT |seq| 2))
                                                           |neweq|))
                                                  (QREFELT $ 132))
                                                 . #11#)))))))))))
                                 (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                                 (EXIT NIL)))
                           (#10#
                            (SEQ (LETT |seq| (|SPADfirst| |eqLD|) . #11#)
                                 (LETT |sj|
                                       (SPADCALL (QVELT |seq| 3)
                                                 (QREFELT $ 42))
                                       . #11#)
                                 (LETT |minlen| (LENGTH |sj|) . #11#)
                                 (LETT |lJV| (LIST |sj|) . #11#)
                                 (SEQ (LETT |eq| NIL . #11#)
                                      (LETT #5# (CDR |eqLD|) . #11#) G190
                                      (COND
                                       ((OR (ATOM #5#)
                                            (PROGN
                                             (LETT |eq| (CAR #5#) . #11#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT JV
                                             (SPADCALL (QVELT |eq| 3)
                                                       (QREFELT $ 42))
                                             . #11#)
                                       (LETT |len| (LENGTH JV) . #11#)
                                       (LETT |lJV| (CONS JV |lJV|) . #11#)
                                       (EXIT
                                        (COND
                                         ((< |len| |minlen|)
                                          (SEQ (LETT |seq| |eq| . #11#)
                                               (LETT |sj| JV . #11#)
                                               (EXIT
                                                (LETT |minlen| |len|
                                                      . #11#)))))))
                                      (LETT #5# (CDR #5#) . #11#) (GO G190)
                                      G191 (EXIT NIL))
                                 (LETT |lJV| (NREVERSE |lJV|) . #11#)
                                 (EXIT
                                  (COND
                                   ((EQL |minlen| 1)
                                    (SEQ (LETT JV NIL . #11#)
                                         (LETT #4# |lJV| . #11#)
                                         (LETT |eq| NIL . #11#)
                                         (LETT #3# |eqLD| . #11#) G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |eq| (CAR #3#) . #11#)
                                                NIL)
                                               (ATOM #4#)
                                               (PROGN
                                                (LETT JV (CAR #4#) . #11#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((SPADCALL |eq| |seq|
                                                       (QREFELT $ 130))
                                             (COND
                                              ((EQL (LENGTH JV) 1)
                                               (|error| #12#))
                                              ('T
                                               (LETT |newL|
                                                     (SPADCALL
                                                      (CONS
                                                       (|function|
                                                        |JBFC-;greater|)
                                                       $)
                                                      |newL|
                                                      (LIST
                                                       (VECTOR
                                                        (SPADCALL JV
                                                                  (QREFELT $
                                                                           133))
                                                        'T (QVELT |eq| 2)
                                                        (QVELT |eq| 3)))
                                                      (QREFELT $ 132))
                                                     . #11#)))))))
                                         (LETT #3#
                                               (PROG1 (CDR #3#)
                                                 (LETT #4# (CDR #4#) . #11#))
                                               . #11#)
                                         (GO G190) G191 (EXIT NIL)))
                                   (#10#
                                    (SEQ
                                     (LETT |sjv|
                                           (SPADCALL |sj| (QREFELT $ 133))
                                           . #11#)
                                     (EXIT
                                      (SEQ (LETT JV NIL . #11#)
                                           (LETT #2# |lJV| . #11#)
                                           (LETT |eq| NIL . #11#)
                                           (LETT #1# |eqLD| . #11#) G190
                                           (COND
                                            ((OR (ATOM #1#)
                                                 (PROGN
                                                  (LETT |eq| (CAR #1#) . #11#)
                                                  NIL)
                                                 (ATOM #2#)
                                                 (PROGN
                                                  (LETT JV (CAR #2#) . #11#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((SPADCALL |eq| |seq|
                                                         (QREFELT $ 130))
                                               (SEQ
                                                (LETT |newld|
                                                      (SPADCALL
                                                       (SPADCALL JV
                                                                 (QREFELT $
                                                                          133))
                                                       |sjv| (QREFELT $ 89))
                                                      . #11#)
                                                (EXIT
                                                 (LETT |newL|
                                                       (SPADCALL
                                                        (CONS
                                                         (|function|
                                                          |JBFC-;greater|)
                                                         $)
                                                        |newL|
                                                        (LIST
                                                         (VECTOR |newld| 'T
                                                                 (QVELT |eq| 2)
                                                                 (QVELT |eq|
                                                                        3)))
                                                        (QREFELT $ 132))
                                                       . #11#)))))))
                                           (LETT #1#
                                                 (PROG1 (CDR #1#)
                                                   (LETT #2# (CDR #2#) . #11#))
                                                 . #11#)
                                           (GO G190) G191 (EXIT NIL))))))))))
                          (EXIT
                           (CONS |seq|
                                 (|JBFC-;simpLD|
                                  (SPADCALL
                                   (CONS (|function| |JBFC-;greater|) $) |l|
                                   |newL| (QREFELT $ 132))
                                  $)))))))))))))) 

(DEFUN |JBFC-;simplify;LSemR;36| (|sys| |jm| $)
  (PROG (|r| |tmp| #1=#:G412 |eq| #2=#:G413 |dep| |i| |resJM| |inds| |resDep|
         #3=#:G411 |l| #4=#:G410 |resSys| #5=#:G409 #6=#:G408 |sl| #7=#:G407
         |f| #8=#:G406 |newSys| |jmi| |neq| #9=#:G405)
    (RETURN
     (SEQ (LETT |newSys| NIL . #10=(|JBFC-;simplify;LSemR;36|))
          (SEQ (LETT |i| 1 . #10#) (LETT |eq| NIL . #10#)
               (LETT #9# |sys| . #10#) G190
               (COND
                ((OR (ATOM #9#) (PROGN (LETT |eq| (CAR #9#) . #10#) NIL))
                 (GO G191)))
               (SEQ (LETT |neq| (SPADCALL |eq| (QREFELT $ 131)) . #10#)
                    (COND
                     ((SPADCALL |neq| |eq| (QREFELT $ 62))
                      (SEQ
                       (LETT |jmi| (SPADCALL (LIST |neq|) (QREFELT $ 99))
                             . #10#)
                       (EXIT
                        (SPADCALL |jm| |i| (SPADCALL |jmi| 1 (QREFELT $ 110))
                                  (QREFELT $ 134))))))
                    (EXIT (LETT |newSys| (CONS |neq| |newSys|) . #10#)))
               (LETT #9# (PROG1 (CDR #9#) (LETT |i| (|inc_SI| |i|) . #10#))
                     . #10#)
               (GO G190) G191 (EXIT NIL))
          (LETT |newSys| (NREVERSE |newSys|) . #10#)
          (LETT |sl|
                (PROGN
                 (LETT #8# NIL . #10#)
                 (SEQ (LETT |i| 1 . #10#) (LETT |f| NIL . #10#)
                      (LETT #7# |newSys| . #10#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#) . #10#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8#
                              (CONS
                               (VECTOR
                                (|SPADfirst|
                                 (QCAR (SPADCALL |jm| |i| (QREFELT $ 110))))
                                'NIL (LIST |i|) |f|)
                               #8#)
                              . #10#)))
                      (LETT #7#
                            (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|) . #10#))
                            . #10#)
                      (GO G190) G191 (EXIT (NREVERSE #8#))))
                . #10#)
          (LETT |sl|
                (|JBFC-;simpLD|
                 (SPADCALL (CONS (|function| |JBFC-;greater|) $) |sl|
                           (QREFELT $ 123))
                 $)
                . #10#)
          (LETT |resSys|
                (PROGN
                 (LETT #6# NIL . #10#)
                 (SEQ (LETT |l| NIL . #10#) (LETT #5# |sl| . #10#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#) . #10#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #6# (CONS (QVELT |l| 3) #6#) . #10#)))
                      (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #10#)
          (LETT |resDep|
                (PROGN
                 (LETT #4# NIL . #10#)
                 (SEQ (LETT |l| NIL . #10#) (LETT #3# |sl| . #10#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |l| (CAR #3#) . #10#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #4# (CONS (QVELT |l| 2) #4#) . #10#)))
                      (LETT #3# (CDR #3#) . #10#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #10#)
          (LETT |inds| (SPADCALL |jm| (QREFELT $ 95)) . #10#)
          (LETT |resJM| (SPADCALL |inds| (LENGTH |sl|) (QREFELT $ 84)) . #10#)
          (SEQ (LETT |i| 1 . #10#) (LETT |dep| NIL . #10#)
               (LETT #2# |resDep| . #10#) (LETT |eq| NIL . #10#)
               (LETT #1# |resSys| . #10#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #10#) NIL)
                     (ATOM #2#) (PROGN (LETT |dep| (CAR #2#) . #10#) NIL))
                 (GO G191)))
               (SEQ
                (COND
                 ((EQL (SPADCALL |dep| (QREFELT $ 135)) 1)
                  (LETT |r| (SPADCALL |jm| (|SPADfirst| |dep|) (QREFELT $ 110))
                        . #10#))
                 ('T
                  (SEQ
                   (LETT |tmp|
                         (SPADCALL (LIST |eq|) (LIST |inds|) (QREFELT $ 76))
                         . #10#)
                   (EXIT
                    (LETT |r| (SPADCALL |tmp| 1 (QREFELT $ 110)) . #10#)))))
                (EXIT (SPADCALL |resJM| |i| |r| (QREFELT $ 134))))
               (LETT #1#
                     (PROG1 (CDR #1#)
                       (LETT #2#
                             (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #10#))
                             . #10#))
                     . #10#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |resSys| |resJM| (CONS 1 |resDep|))))))) 

(DEFUN |JBFC-;simpOne;2S;37| (|f| $) (SPADCALL |f| (QREFELT $ 139))) 

(DEFUN |JBFC-;simpMod;3L;38| (|sys1| |sys2| $)
  (PROG (|res| |neq| LS1 LD1 |ld| #1=#:G440 #2=#:G439 |eq1| |newSys| LS LD |i|
         #3=#:G438 |jv| |ls| #4=#:G437 |eq2|)
    (RETURN
     (SEQ
      (COND ((OR (NULL |sys1|) (NULL |sys2|)) |sys1|)
            ('T
             (SEQ (LETT LD NIL . #5=(|JBFC-;simpMod;3L;38|))
                  (LETT LS NIL . #5#)
                  (SEQ (LETT |eq2| NIL . #5#) (LETT #4# |sys2| . #5#) G190
                       (COND
                        ((OR (ATOM #4#)
                             (PROGN (LETT |eq2| (CAR #4#) . #5#) NIL))
                         (GO G191)))
                       (SEQ (LETT |ld| (SPADCALL |eq2| (QREFELT $ 52)) . #5#)
                            (LETT |ls| (SPADCALL |eq2| |ld| (QREFELT $ 127))
                                  . #5#)
                            (EXIT
                             (COND
                              ((QEQCAR |ls| 0)
                               (SEQ (LETT |i| 1 . #5#)
                                    (SEQ (LETT |jv| NIL . #5#)
                                         (LETT #3# LD . #5#) G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |jv| (CAR #3#) . #5#)
                                                NIL)
                                               (NULL
                                                (SPADCALL |jv| |ld|
                                                          (QREFELT $ 78))))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT (LETT |i| (+ |i| 1) . #5#)))
                                         (LETT #3# (CDR #3#) . #5#) (GO G190)
                                         G191 (EXIT NIL))
                                    (LETT LD
                                          (SPADCALL |ld| LD |i|
                                                    (QREFELT $ 141))
                                          . #5#)
                                    (EXIT
                                     (LETT LS
                                           (SPADCALL (QCDR |ls|) LS |i|
                                                     (QREFELT $ 142))
                                           . #5#)))))))
                       (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                  (LETT |newSys| (SPADCALL (ELT $ 131) |sys1| (QREFELT $ 144))
                        . #5#)
                  (EXIT
                   (COND ((NULL LD) |newSys|)
                         ('T
                          (SEQ (LETT |res| NIL . #5#)
                               (SEQ (LETT |eq1| NIL . #5#)
                                    (LETT #2# |newSys| . #5#) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN
                                           (LETT |eq1| (CAR #2#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ (LETT |neq| |eq1| . #5#)
                                         (LETT LD1 LD . #5#)
                                         (LETT LS1 LS . #5#)
                                         (SEQ (LETT #1# NIL . #5#) G190
                                              (COND (#1# (GO G191)))
                                              (SEQ
                                               (LETT |ld|
                                                     (SPADCALL |neq|
                                                               (QREFELT $ 52))
                                                     . #5#)
                                               (SEQ G190
                                                    (COND
                                                     ((NULL
                                                       (COND ((NULL LD1) 'NIL)
                                                             ('T
                                                              (SPADCALL
                                                               (|SPADfirst|
                                                                LD1)
                                                               |ld|
                                                               (QREFELT $
                                                                        78)))))
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT LD1 (CDR LD1) . #5#)
                                                     (EXIT
                                                      (LETT LS1 (CDR LS1)
                                                            . #5#)))
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
                                                                   (QREFELT $
                                                                            65))
                                                         . #5#)
                                                   (LETT LD1 (CDR LD1) . #5#)
                                                   (EXIT
                                                    (LETT LS1 (CDR LS1)
                                                          . #5#)))))))
                                              (LETT #1# (NULL LD1) . #5#)
                                              (GO G190) G191 (EXIT NIL))
                                         (COND
                                          ((SPADCALL |neq| |eq1|
                                                     (QREFELT $ 62))
                                           (LETT |neq|
                                                 (SPADCALL |neq|
                                                           (QREFELT $ 131))
                                                 . #5#)))
                                         (EXIT
                                          (COND
                                           ((NULL
                                             (SPADCALL |neq| (QREFELT $ 85)))
                                            (LETT |res| (CONS |neq| |res|)
                                                  . #5#)))))
                                    (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (SPADCALL (NREVERSE |res|)
                                          (QREFELT $ 145)))))))))))))) 

(DEFUN |JBFC-;simpMod;LSemLR;39| (|sys1| |jm| |sys2| $)
  (PROG (#1=#:G483 |i| #2=#:G482 |resSys| |njm| #3=#:G480 |neq| #4=#:G481 |oeq|
         |resJM| |res| LS1 LD1 |ld| #5=#:G479 #6=#:G478 |eq1| |newSys| LS LD
         #7=#:G477 |jv| |ls| #8=#:G476 |eq2| |osys| #9=#:G475 #10=#:G474)
    (RETURN
     (SEQ
      (COND
       ((OR (NULL |sys1|) (NULL |sys2|))
        (VECTOR |sys1| |jm|
                (CONS 1
                      (PROGN
                       (LETT #10# NIL . #11=(|JBFC-;simpMod;LSemLR;39|))
                       (SEQ (LETT |i| 1 . #11#)
                            (LETT #9# (LENGTH |sys1|) . #11#) G190
                            (COND ((|greater_SI| |i| #9#) (GO G191)))
                            (SEQ
                             (EXIT (LETT #10# (CONS (LIST |i|) #10#) . #11#)))
                            (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                            (EXIT (NREVERSE #10#)))))))
       ('T
        (SEQ (LETT |osys| |sys1| . #11#) (LETT LD NIL . #11#)
             (LETT LS NIL . #11#)
             (SEQ (LETT |eq2| NIL . #11#) (LETT #8# |sys2| . #11#) G190
                  (COND
                   ((OR (ATOM #8#) (PROGN (LETT |eq2| (CAR #8#) . #11#) NIL))
                    (GO G191)))
                  (SEQ (LETT |ld| (SPADCALL |eq2| (QREFELT $ 52)) . #11#)
                       (LETT |ls| (SPADCALL |eq2| |ld| (QREFELT $ 127)) . #11#)
                       (EXIT
                        (COND
                         ((QEQCAR |ls| 0)
                          (SEQ (LETT |i| 1 . #11#)
                               (SEQ (LETT |jv| NIL . #11#) (LETT #7# LD . #11#)
                                    G190
                                    (COND
                                     ((OR (ATOM #7#)
                                          (PROGN
                                           (LETT |jv| (CAR #7#) . #11#)
                                           NIL)
                                          (NULL
                                           (SPADCALL |jv| |ld|
                                                     (QREFELT $ 78))))
                                      (GO G191)))
                                    (SEQ (EXIT (LETT |i| (+ |i| 1) . #11#)))
                                    (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                                    (EXIT NIL))
                               (LETT LD (SPADCALL |ld| LD |i| (QREFELT $ 141))
                                     . #11#)
                               (EXIT
                                (LETT LS
                                      (SPADCALL (QCDR |ls|) LS |i|
                                                (QREFELT $ 142))
                                      . #11#)))))))
                  (LETT #8# (CDR #8#) . #11#) (GO G190) G191 (EXIT NIL))
             (LETT |newSys| (SPADCALL (ELT $ 131) |sys1| (QREFELT $ 144))
                   . #11#)
             (LETT |res| NIL . #11#)
             (SEQ (LETT |eq1| NIL . #11#) (LETT #6# |newSys| . #11#) G190
                  (COND
                   ((OR (ATOM #6#) (PROGN (LETT |eq1| (CAR #6#) . #11#) NIL))
                    (GO G191)))
                  (SEQ (LETT |neq| |eq1| . #11#) (LETT LD1 LD . #11#)
                       (LETT LS1 LS . #11#)
                       (SEQ (LETT #5# NIL . #11#) G190 (COND (#5# (GO G191)))
                            (SEQ
                             (LETT |ld| (SPADCALL |neq| (QREFELT $ 52)) . #11#)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND ((NULL LD1) 'NIL)
                                           ('T
                                            (SPADCALL (|SPADfirst| LD1) |ld|
                                                      (QREFELT $ 78)))))
                                    (GO G191)))
                                  (SEQ (LETT LD1 (CDR LD1) . #11#)
                                       (EXIT (LETT LS1 (CDR LS1) . #11#)))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (COND
                               ((NULL (NULL LD1))
                                (SEQ
                                 (LETT |neq|
                                       (SPADCALL |neq| (|SPADfirst| LD1)
                                                 (|SPADfirst| LS1)
                                                 (QREFELT $ 65))
                                       . #11#)
                                 (LETT LD1 (CDR LD1) . #11#)
                                 (EXIT (LETT LS1 (CDR LS1) . #11#)))))))
                            (LETT #5# (NULL LD1) . #11#) (GO G190) G191
                            (EXIT NIL))
                       (COND
                        ((SPADCALL |neq| |eq1| (QREFELT $ 62))
                         (LETT |neq| (SPADCALL |neq| (QREFELT $ 131)) . #11#)))
                       (EXIT (LETT |res| (CONS |neq| |res|) . #11#)))
                  (LETT #6# (CDR #6#) . #11#) (GO G190) G191 (EXIT NIL))
             (LETT |resSys| NIL . #11#) (LETT |resJM| |jm| . #11#)
             (SEQ (LETT |i| (LENGTH |res|) . #11#) (LETT |oeq| NIL . #11#)
                  (LETT #4# (NREVERSE |osys|) . #11#) (LETT |neq| NIL . #11#)
                  (LETT #3# |res| . #11#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |neq| (CAR #3#) . #11#) NIL)
                        (ATOM #4#) (PROGN (LETT |oeq| (CAR #4#) . #11#) NIL)
                        (< |i| 1))
                    (GO G191)))
                  (SEQ
                   (COND
                    ((SPADCALL |neq| |oeq| (QREFELT $ 62))
                     (SEQ
                      (LETT |njm| (SPADCALL (LIST |neq|) (QREFELT $ 99))
                            . #11#)
                      (EXIT
                       (SPADCALL |resJM| |i| (SPADCALL |njm| 1 (QREFELT $ 110))
                                 (QREFELT $ 134))))))
                   (EXIT (LETT |resSys| (CONS |neq| |resSys|) . #11#)))
                  (LETT #3#
                        (PROG1 (CDR #3#)
                          (LETT #4#
                                (PROG1 (CDR #4#) (LETT |i| (+ |i| -1) . #11#))
                                . #11#))
                        . #11#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT
              (VECTOR |resSys| |resJM|
                      (CONS 1
                            (PROGN
                             (LETT #2# NIL . #11#)
                             (SEQ (LETT |i| 1 . #11#)
                                  (LETT #1# (LENGTH |resSys|) . #11#) G190
                                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2# (CONS (LIST |i|) #2#) . #11#)))
                                  (LETT |i| (|inc_SI| |i|) . #11#) (GO G190)
                                  G191 (EXIT (NREVERSE #2#)))))))))))))) 

(DEFUN |JBFC-;reduceMod;3L;40| (|sys1| |sys2| $)
  (PROG (|res| LS1 LD1 |neq| |ld| #1=#:G510 |oeq| |eq| #2=#:G509 |eq1| |newSys|
         LS LD |i| #3=#:G508 |jv| |ls| #4=#:G507 |eq2|)
    (RETURN
     (SEQ
      (COND ((OR (NULL |sys1|) (NULL |sys2|)) |sys1|)
            ('T
             (SEQ (LETT LD NIL . #5=(|JBFC-;reduceMod;3L;40|))
                  (LETT LS NIL . #5#)
                  (SEQ (LETT |eq2| NIL . #5#) (LETT #4# |sys2| . #5#) G190
                       (COND
                        ((OR (ATOM #4#)
                             (PROGN (LETT |eq2| (CAR #4#) . #5#) NIL))
                         (GO G191)))
                       (SEQ (LETT |ld| (SPADCALL |eq2| (QREFELT $ 52)) . #5#)
                            (LETT |ls| (SPADCALL |eq2| |ld| (QREFELT $ 127))
                                  . #5#)
                            (EXIT
                             (COND
                              ((QEQCAR |ls| 0)
                               (SEQ (LETT |i| 1 . #5#)
                                    (SEQ (LETT |jv| NIL . #5#)
                                         (LETT #3# LD . #5#) G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |jv| (CAR #3#) . #5#)
                                                NIL)
                                               (NULL
                                                (SPADCALL |jv| |ld|
                                                          (QREFELT $ 78))))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT (LETT |i| (+ |i| 1) . #5#)))
                                         (LETT #3# (CDR #3#) . #5#) (GO G190)
                                         G191 (EXIT NIL))
                                    (LETT LD
                                          (SPADCALL |ld| LD |i|
                                                    (QREFELT $ 141))
                                          . #5#)
                                    (EXIT
                                     (LETT LS
                                           (SPADCALL (QCDR |ls|) LS |i|
                                                     (QREFELT $ 142))
                                           . #5#)))))))
                       (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                  (LETT |newSys| (SPADCALL (ELT $ 131) |sys1| (QREFELT $ 144))
                        . #5#)
                  (EXIT
                   (COND ((NULL LD) |newSys|)
                         ('T
                          (SEQ (LETT |res| NIL . #5#)
                               (SEQ (LETT |eq1| NIL . #5#)
                                    (LETT #2# |newSys| . #5#) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN
                                           (LETT |eq1| (CAR #2#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ (LETT |eq| |eq1| . #5#)
                                         (LETT |oeq| (|spadConstant| $ 61)
                                               . #5#)
                                         (LETT |neq| |eq1| . #5#)
                                         (SEQ G190
                                              (COND
                                               ((NULL
                                                 (SPADCALL |neq| |oeq|
                                                           (QREFELT $ 62)))
                                                (GO G191)))
                                              (SEQ (LETT |oeq| |neq| . #5#)
                                                   (LETT LD1 LD . #5#)
                                                   (LETT LS1 LS . #5#)
                                                   (EXIT
                                                    (SEQ (LETT #1# NIL . #5#)
                                                         G190
                                                         (COND (#1# (GO G191)))
                                                         (SEQ
                                                          (LETT |ld|
                                                                (SPADCALL |neq|
                                                                          (QREFELT
                                                                           $
                                                                           52))
                                                                . #5#)
                                                          (SEQ G190
                                                               (COND
                                                                ((NULL
                                                                  (COND
                                                                   ((NULL LD1)
                                                                    'NIL)
                                                                   ('T
                                                                    (SPADCALL
                                                                     (|SPADfirst|
                                                                      LD1)
                                                                     |ld|
                                                                     (QREFELT $
                                                                              78)))))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (LETT LD1
                                                                      (CDR LD1)
                                                                      . #5#)
                                                                (EXIT
                                                                 (LETT LS1
                                                                       (CDR
                                                                        LS1)
                                                                       . #5#)))
                                                               NIL (GO G190)
                                                               G191 (EXIT NIL))
                                                          (EXIT
                                                           (COND
                                                            ((NULL (NULL LD1))
                                                             (SEQ
                                                              (LETT |neq|
                                                                    (SPADCALL
                                                                     |neq|
                                                                     (|SPADfirst|
                                                                      LD1)
                                                                     (|SPADfirst|
                                                                      LS1)
                                                                     (QREFELT $
                                                                              148))
                                                                    . #5#)
                                                              (LETT LD1
                                                                    (CDR LD1)
                                                                    . #5#)
                                                              (EXIT
                                                               (LETT LS1
                                                                     (CDR LS1)
                                                                     . #5#)))))))
                                                         (LETT #1# (NULL LD1)
                                                               . #5#)
                                                         (GO G190) G191
                                                         (EXIT NIL))))
                                              NIL (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (COND
                                           ((NULL
                                             (SPADCALL |neq| (QREFELT $ 85)))
                                            (COND
                                             ((SPADCALL |neq| |eq|
                                                        (QREFELT $ 149))
                                              (LETT |res| (CONS |neq| |res|)
                                                    . #5#))
                                             ('T
                                              (LETT |res|
                                                    (CONS
                                                     (SPADCALL |neq|
                                                               (QREFELT $ 131))
                                                     |res|)
                                                    . #5#)))))))
                                    (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (SPADCALL (NREVERSE |res|)
                                          (QREFELT $ 145)))))))))))))) 

(DEFUN |JBFC-;autoReduce;2L;41| (|sys| $)
  (PROG (#1=#:G564 |rec| #2=#:G563 |tmp1| |tmp2| #3=#:G562 #4=#:G561 #5=#:G560
         |eq| #6=#:G559 |nl| |ol| |seq| #7=#:G558 |sub| #8=#:G557 |nsl|
         #9=#:G556 #10=#:G555 |sl| |ic| |tmp| |d| #11=#:G554 #12=#:G526 |osl|
         |su| |ld| #13=#:G553)
    (RETURN
     (SEQ
      (COND ((NULL |sys|) NIL) ((EQL (LENGTH |sys|) 1) |sys|)
            ('T
             (SEQ
              (LETT |nl| (SPADCALL (ELT $ 131) |sys| (QREFELT $ 144))
                    . #14=(|JBFC-;autoReduce;2L;41|))
              (LETT |nsl| NIL . #14#) (LETT |sl| NIL . #14#)
              (LETT |osl| |sl| . #14#)
              (SEQ G190
                   (COND ((NULL (COND ((NULL |nl|) 'NIL) ('T 'T))) (GO G191)))
                   (SEQ
                    (SEQ (LETT |eq| NIL . #14#) (LETT #13# |nl| . #14#) G190
                         (COND
                          ((OR (ATOM #13#)
                               (PROGN (LETT |eq| (CAR #13#) . #14#) NIL))
                           (GO G191)))
                         (SEQ (LETT |ld| (SPADCALL |eq| (QREFELT $ 52)) . #14#)
                              (LETT |su| (SPADCALL |eq| |ld| (QREFELT $ 127))
                                    . #14#)
                              (EXIT
                               (COND
                                ((QEQCAR |su| 1)
                                 (LETT |nsl| (CONS |eq| |nsl|) . #14#))
                                ('T
                                 (LETT |sl|
                                       (SPADCALL
                                        (CONS (|function| |JBFC-;greater|) $)
                                        |sl|
                                        (LIST (VECTOR |ld| 'T NIL (QCDR |su|)))
                                        (QREFELT $ 151))
                                       . #14#)))))
                         (LETT #13# (CDR #13#) . #14#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |nl| NIL . #14#) (LETT |osl| NIL . #14#)
                    (LETT |sl| (NREVERSE |sl|) . #14#)
                    (SEQ G190
                         (COND
                          ((NULL (COND ((NULL |sl|) 'NIL) ('T 'T))) (GO G191)))
                         (SEQ (LETT |sub| (|SPADfirst| |sl|) . #14#)
                              (LETT |osl| (CONS |sub| |osl|) . #14#)
                              (LETT |sl| (CDR |sl|) . #14#)
                              (SEQ
                               (EXIT
                                (SEQ G190
                                     (COND
                                      ((NULL (COND ((NULL |sl|) 'NIL) ('T 'T)))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |rec| (|SPADfirst| |sl|) . #14#)
                                      (EXIT
                                       (COND
                                        ((SPADCALL (QVELT |rec| 0)
                                                   (QVELT |sub| 0)
                                                   (QREFELT $ 78))
                                         (PROGN
                                          (LETT #12# |$NoValue| . #14#)
                                          (GO #12#)))
                                        ('T
                                         (SEQ (LETT |sl| (CDR |sl|) . #14#)
                                              (LETT |ic|
                                                    (SPADCALL
                                                     (SPADCALL (QVELT |rec| 3)
                                                               (QVELT |sub| 3)
                                                               (QREFELT $ 152))
                                                     (QREFELT $ 131))
                                                    . #14#)
                                              (EXIT
                                               (COND
                                                ((NULL
                                                  (SPADCALL |ic|
                                                            (QREFELT $ 85)))
                                                 (LETT |nl| (CONS |ic| |nl|)
                                                       . #14#)))))))))
                                     NIL (GO G190) G191 (EXIT NIL)))
                               #12# (EXIT #12#))
                              (LETT |tmp| NIL . #14#)
                              (SEQ (LETT |rec| NIL . #14#)
                                   (LETT #11# |sl| . #14#) G190
                                   (COND
                                    ((OR (ATOM #11#)
                                         (PROGN
                                          (LETT |rec| (CAR #11#) . #14#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |d|
                                          (SPADCALL (QVELT |rec| 0)
                                                    (QVELT |sub| 0)
                                                    (QREFELT $ 63))
                                          . #14#)
                                    (EXIT
                                     (COND
                                      ((NULL |d|)
                                       (SEQ
                                        (LETT |seq|
                                              (SPADCALL (QVELT |rec| 3)
                                                        (QVELT |sub| 0)
                                                        (QVELT |sub| 3)
                                                        (QREFELT $ 148))
                                              . #14#)
                                        (EXIT
                                         (LETT |tmp|
                                               (CONS
                                                (VECTOR (QVELT |rec| 0) 'T NIL
                                                        |seq|)
                                                |tmp|)
                                               . #14#))))
                                      ('T
                                       (SEQ
                                        (LETT |ic|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (QVELT |sub| 3) |d|
                                                          (QREFELT $ 64))
                                                (QVELT |rec| 3)
                                                (QREFELT $ 152))
                                               (QVELT |sub| 0) (QVELT |sub| 3)
                                               (QREFELT $ 148))
                                              . #14#)
                                        (LETT |ic|
                                              (SPADCALL |ic| (QREFELT $ 131))
                                              . #14#)
                                        (EXIT
                                         (COND
                                          ((NULL
                                            (SPADCALL |ic| (QREFELT $ 85)))
                                           (LETT |nl| (CONS |ic| |nl|)
                                                 . #14#)))))))))
                                   (LETT #11# (CDR #11#) . #14#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT (LETT |sl| (NREVERSE |tmp|) . #14#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |sl| |osl| . #14#) (LETT |ol| NIL . #14#)
                    (SEQ (LETT |eq| NIL . #14#) (LETT #10# |nsl| . #14#) G190
                         (COND
                          ((OR (ATOM #10#)
                               (PROGN (LETT |eq| (CAR #10#) . #14#) NIL))
                           (GO G191)))
                         (SEQ (LETT |seq| |eq| . #14#)
                              (SEQ (LETT |sub| NIL . #14#)
                                   (LETT #9# |sl| . #14#) G190
                                   (COND
                                    ((OR (ATOM #9#)
                                         (PROGN
                                          (LETT |sub| (CAR #9#) . #14#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |seq|
                                           (SPADCALL |seq| (QVELT |sub| 0)
                                                     (QVELT |sub| 3)
                                                     (QREFELT $ 148))
                                           . #14#)))
                                   (LETT #9# (CDR #9#) . #14#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (COND
                                ((SPADCALL |seq| |eq| (QREFELT $ 149))
                                 (LETT |ol| (CONS |eq| |ol|) . #14#))
                                ((NULL (SPADCALL |seq| (QREFELT $ 85)))
                                 (LETT |nl|
                                       (CONS (SPADCALL |seq| (QREFELT $ 131))
                                             |nl|)
                                       . #14#)))))
                         (LETT #10# (CDR #10#) . #14#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |nsl| |ol| . #14#) (LETT |ol| NIL . #14#)
                    (SEQ (LETT |eq| NIL . #14#) (LETT #8# |nl| . #14#) G190
                         (COND
                          ((OR (ATOM #8#)
                               (PROGN (LETT |eq| (CAR #8#) . #14#) NIL))
                           (GO G191)))
                         (SEQ (LETT |seq| |eq| . #14#)
                              (SEQ (LETT |sub| NIL . #14#)
                                   (LETT #7# |sl| . #14#) G190
                                   (COND
                                    ((OR (ATOM #7#)
                                         (PROGN
                                          (LETT |sub| (CAR #7#) . #14#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |seq|
                                           (SPADCALL |seq| (QVELT |sub| 0)
                                                     (QVELT |sub| 3)
                                                     (QREFELT $ 148))
                                           . #14#)))
                                   (LETT #7# (CDR #7#) . #14#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |seq| (QREFELT $ 85)))
                                 (LETT |ol|
                                       (CONS (SPADCALL |seq| (QREFELT $ 131))
                                             |ol|)
                                       . #14#)))))
                         (LETT #8# (CDR #8#) . #14#) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |nl| |ol| . #14#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |tmp1|
                    (PROGN
                     (LETT #6# NIL . #14#)
                     (SEQ (LETT |eq| NIL . #14#) (LETT #5# |nsl| . #14#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |eq| (CAR #5#) . #14#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (VECTOR (SPADCALL |eq| (QREFELT $ 52)) 'T
                                           NIL |eq|)
                                   #6#)
                                  . #14#)))
                          (LETT #5# (CDR #5#) . #14#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #14#)
              (LETT |tmp2|
                    (PROGN
                     (LETT #4# NIL . #14#)
                     (SEQ (LETT |rec| NIL . #14#) (LETT #3# |sl| . #14#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |rec| (CAR #3#) . #14#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (VECTOR (QVELT |rec| 0) 'T NIL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QVELT |rec| 0)
                                                       (QREFELT $ 12))
                                             (QVELT |rec| 3) (QREFELT $ 152))
                                            (QREFELT $ 131)))
                                   #4#)
                                  . #14#)))
                          (LETT #3# (CDR #3#) . #14#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #14#)
              (LETT |tmp1|
                    (SPADCALL (CONS (|function| |JBFC-;greater|) $)
                              (SPADCALL |tmp1| |tmp2| (QREFELT $ 153))
                              (QREFELT $ 123))
                    . #14#)
              (EXIT
               (PROGN
                (LETT #2# NIL . #14#)
                (SEQ (LETT |rec| NIL . #14#) (LETT #1# |tmp1| . #14#) G190
                     (COND
                      ((OR (ATOM #1#)
                           (PROGN (LETT |rec| (CAR #1#) . #14#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (LETT #2# (CONS (QVELT |rec| 3) #2#) . #14#)))
                     (LETT #1# (CDR #1#) . #14#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))))))) 

(DECLAIM (NOTINLINE |JetBundleFunctionCategory&;|)) 

(DEFUN |JetBundleFunctionCategory&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|JetBundleFunctionCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|JetBundleFunctionCategory&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 155) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
      (QSETREFV $ 74 (|HasCategory| |#1| '(|lazyRepresentation|)))
      $)))) 

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
              (|Union| 7 '"failed") |JBFC-;retractIfCan;SU;14| (82 . >)
              (88 . |One|) (92 . =) |JBFC-;const?;SB;15| (98 . |leadingDer|)
              (103 . |order|) |JBFC-;order;SNni;16| (108 . |class|)
              |JBFC-;class;SNni;17| |JBFC-;leadingDer;SJB;18| (113 . |member?|)
              |JBFC-;freeOf?;SJBB;19| |JBFC-;characteristic;Nni;20|
              (119 . |Zero|) (123 . ~=) (129 . |derivativeOf?|)
              (135 . |formalDiff|) (141 . |subst|) (148 . <)
              |JBFC-;dSubst;SJB2S;21| (154 . |dimJ|) (|List| $)
              (|SparseEchelonMatrix| 7 $) |JBFC-;dimension;LSem2Nni;22|
              (159 . |dimS|) |JBFC-;orderDim;LSem2Nni;23| '|noChecks?|
              (|List| 41) (164 . |jacobiMatrix|) |JBFC-;jacobiMatrix;LSem;24|
              (170 . >) (|Mapping| 44 7 7) (176 . |merge|)
              (183 . |removeDuplicates!|) (|Integer|)
              (|SparseEchelonMatrix| 7 6) (188 . |new|) (194 . |zero?|)
              (|List| 6) (199 . |setRow!|) |JBFC-;jacobiMatrix;LLSem;25|
              (207 . |max|) (213 . |max|) (219 . |max|) (|Mapping| 25 25 25)
              (225 . |reduce|) |JBFC-;symbol;LSem;26| (232 . |allIndices|)
              (|Record| (|:| |Left| $) (|:| |Right| $)) (237 . |horizSplit|)
              |JBFC-;extractSymbol;2Sem;27| (243 . |jacobiMatrix|)
              (|Record| (|:| |DSys| 69) (|:| |JVars| 75)) (248 . |formalDiff2|)
              |JBFC-;formalDiff;LPiL;28| (255 . |formalDiff|)
              |JBFC-;formalDiff;SPiS;29|
              (|Record| (|:| |DPhi| $) (|:| |JVars| 41)) (261 . |formalDiff2|)
              |JBFC-;formalDiff;SLS;30| (268 . |nrows|)
              (|Record| (|:| |Indices| 41) (|:| |Entries| 86)) (273 . |row|)
              (|Union| $ '#1="0") (279 . |differentiate|) (|Union| 7 '#1#)
              (285 . =) (291 . +) (297 . *) (303 . |sort!|)
              |JBFC-;formalDiff2;LPiSemR;31| |JBFC-;formalDiff2;SPiSemR;32|
              (|Record| (|:| LD 7) (|:| |Fake?| 44) (|:| |Dep| 16)
                        (|:| |Fun| 6))
              (|Mapping| 44 120 120) (|List| 120) (309 . |sort!|)
              |JBFC-;sortLD;2L;34| (315 . ~=) (|Union| $ '"failed")
              (321 . |solveFor|) (|OutputForm|) (327 . |empty|) (331 . ~=)
              (337 . |simpOne|) (342 . |merge|) (349 . |second|)
              (354 . |setRow!|) (361 . |#|) (|Union| '"failed" (|List| 16))
              (|Record| (|:| |Sys| 69) (|:| JM 70) (|:| |Depend| 136))
              |JBFC-;simplify;LSemR;36| (366 . |numerator|)
              |JBFC-;simpOne;2S;37| (371 . |insert|) (378 . |insert|)
              (|Mapping| 6 6) (385 . |map|) (391 . |sortLD|)
              |JBFC-;simpMod;3L;38| |JBFC-;simpMod;LSemLR;39| (396 . |dSubst|)
              (403 . =) |JBFC-;reduceMod;3L;40| (409 . |merge!|) (416 . -)
              (422 . |concat!|) |JBFC-;autoReduce;2L;41|)
           '#(|symbol| 428 |sortLD| 433 |simplify| 438 |simpOne| 444 |simpMod|
              449 |setNotation| 462 |retractIfCan| 467 |reduceMod| 472
              |orderDim| 478 |order| 485 |numIndVar| 490 |numDepVar| 494
              |leadingDer| 498 |jacobiMatrix| 503 |getNotation| 514 |gcd| 518
              |freeOf?| 524 |formalDiff2| 530 |formalDiff| 544 |extractSymbol|
              562 |dimension| 567 |dSubst| 574 |const?| 581 |class| 586
              |characteristic| 591 |autoReduce| 595 X 600 U 609 P 618)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 154
                                                 '(0 7 8 9 1 7 0 8 11 1 6 0 7
                                                   12 1 7 0 8 14 2 7 0 8 16 17
                                                   0 7 0 19 0 7 0 21 1 7 0 16
                                                   23 2 7 0 8 25 26 1 7 0 25 28
                                                   1 7 30 30 31 0 7 30 34 0 7 8
                                                   37 0 6 0 39 1 6 41 0 42 2 6
                                                   0 0 7 43 1 6 44 0 45 2 25 44
                                                   0 0 48 0 7 0 49 2 7 44 0 0
                                                   50 1 6 7 0 52 1 7 25 0 53 1
                                                   7 25 0 55 2 41 44 7 0 58 0 6
                                                   0 61 2 6 44 0 0 62 2 7 16 0
                                                   0 63 2 6 0 0 16 64 3 6 0 0 7
                                                   0 65 2 7 44 0 0 66 1 7 25 25
                                                   68 1 7 25 25 72 2 6 70 69 75
                                                   76 2 7 44 0 0 78 3 41 0 79 0
                                                   0 80 1 41 0 0 81 2 83 0 41
                                                   82 84 1 6 44 0 85 4 83 32 0
                                                   82 41 86 87 2 7 0 0 0 89 2
                                                   41 0 0 0 90 2 25 0 0 0 91 3
                                                   16 25 92 0 25 93 1 83 41 0
                                                   95 2 83 96 0 7 97 1 6 70 69
                                                   99 3 6 100 69 8 70 101 2 6
                                                   69 69 8 103 3 6 105 0 8 70
                                                   106 1 83 25 0 108 2 83 109 0
                                                   82 110 2 7 111 0 8 112 2 113
                                                   44 0 0 114 2 6 0 0 0 115 2 6
                                                   0 0 0 116 2 41 0 79 0 117 2
                                                   122 0 121 0 123 2 7 44 0 0
                                                   125 2 6 126 0 7 127 0 128 0
                                                   129 2 120 44 0 0 130 1 6 0 0
                                                   131 3 122 0 121 0 0 132 1 41
                                                   7 0 133 3 83 32 0 82 109 134
                                                   1 16 25 0 135 1 6 0 0 139 3
                                                   41 0 7 0 82 141 3 86 0 6 0
                                                   82 142 2 86 0 143 0 144 1 6
                                                   69 69 145 3 6 0 0 7 0 148 2
                                                   6 44 0 0 149 3 122 0 121 0 0
                                                   151 2 6 0 0 0 152 2 122 0 0
                                                   0 153 1 0 70 69 94 1 0 69 69
                                                   124 2 0 137 69 70 138 1 0 0
                                                   0 140 3 0 137 69 70 69 147 2
                                                   0 69 69 69 146 1 0 32 30 33
                                                   1 0 46 0 47 2 0 69 69 69 150
                                                   3 0 25 69 70 25 73 1 0 25 0
                                                   54 0 0 8 36 0 0 8 38 1 0 7 0
                                                   57 2 0 70 69 75 88 1 0 70 69
                                                   77 0 0 30 35 2 0 0 0 0 40 2
                                                   0 44 0 7 59 3 0 100 69 8 70
                                                   118 3 0 105 0 8 70 119 2 0
                                                   69 69 8 102 2 0 0 0 8 104 2
                                                   0 0 0 16 107 1 0 70 70 98 3
                                                   0 25 69 70 25 71 3 0 0 0 7 0
                                                   67 1 0 44 0 51 1 0 25 0 56 0
                                                   0 25 60 1 0 69 69 154 0 0 0
                                                   20 1 0 0 8 13 0 0 0 22 1 0 0
                                                   8 15 2 0 0 8 25 27 1 0 0 25
                                                   29 1 0 0 16 24 2 0 0 8 16
                                                   18)))))
           '|lookupComplete|)) 
