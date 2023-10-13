
(/VERSIONCHECK 2) 

(DEFUN |MATCAT-;square?;SB;1| (|x| $)
  (EQL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |x| (QREFELT $ 12)))) 

(DEFUN |MATCAT-;diagonal?;SB;2| (|x| $)
  (PROG (#1=#:G192 #2=#:G195 #3=#:G197 |j| #4=#:G196 |i|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL (SPADCALL |x| (QREFELT $ 15))) 'NIL)
             ('T
              (SEQ
               (SEQ
                (LETT |i| (SPADCALL |x| (QREFELT $ 17))
                      . #5=(|MATCAT-;diagonal?;SB;2|))
                (LETT #4# (SPADCALL |x| (QREFELT $ 18)) . #5#) G190
                (COND ((> |i| #4#) (GO G191)))
                (SEQ
                 (EXIT
                  (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #5#)
                       (LETT #3# (SPADCALL |x| (QREFELT $ 20)) . #5#) G190
                       (COND ((> |j| #3#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (- |j| (SPADCALL |x| (QREFELT $ 19)))
                                     (- |i| (SPADCALL |x| (QREFELT $ 17)))
                                     (QREFELT $ 21))
                           (COND
                            ((NULL
                              (SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                        (QREFELT $ 23)))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# 'NIL . #5#) (GO #2#))
                                    . #5#)
                              (GO #1#))))))))
                       (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
                 #1# (EXIT #1#))
                (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
               (EXIT 'T)))))
      #2# (EXIT #2#))))) 

(DEFUN |MATCAT-;symmetric?;SB;3| (|x| $)
  (PROG (#1=#:G199 #2=#:G203 #3=#:G205 |j| #4=#:G204 |i| |mc| |mr| |nRows|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL
          (LETT |nRows| (SPADCALL |x| (QREFELT $ 11))
                . #5=(|MATCAT-;symmetric?;SB;3|))
          (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 25))
         'NIL)
        ('T
         (SEQ (LETT |mr| (SPADCALL |x| (QREFELT $ 17)) . #5#)
              (LETT |mc| (SPADCALL |x| (QREFELT $ 19)) . #5#)
              (SEQ (LETT |i| 0 . #5#) (LETT #4# (- |nRows| 1) . #5#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (+ |i| 1) . #5#)
                          (LETT #3# (- |nRows| 1) . #5#) G190
                          (COND ((> |j| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL |x| (+ |mr| |i|) (+ |mc| |j|)
                                         (QREFELT $ 22))
                               (SPADCALL |x| (+ |mr| |j|) (+ |mc| |i|)
                                         (QREFELT $ 22))
                               (QREFELT $ 26))
                              (PROGN
                               (LETT #1# (PROGN (LETT #2# 'NIL . #5#) (GO #2#))
                                     . #5#)
                               (GO #1#))))))
                          (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                          (EXIT NIL)))
                    #1# (EXIT #1#))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT 'T)))))
      #2# (EXIT #2#))))) 

(DEFUN |MATCAT-;antisymmetric?;SB;4| (|x| $)
  (PROG (#1=#:G207 #2=#:G211 #3=#:G213 |j| #4=#:G212 |i| |mc| |mr| |nRows|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL
          (LETT |nRows| (SPADCALL |x| (QREFELT $ 11))
                . #5=(|MATCAT-;antisymmetric?;SB;4|))
          (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 25))
         'NIL)
        ('T
         (SEQ (LETT |mr| (SPADCALL |x| (QREFELT $ 17)) . #5#)
              (LETT |mc| (SPADCALL |x| (QREFELT $ 19)) . #5#)
              (SEQ (LETT |i| 0 . #5#) (LETT #4# (- |nRows| 1) . #5#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| |i| . #5#) (LETT #3# (- |nRows| 1) . #5#)
                          G190 (COND ((> |j| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL |x| (+ |mr| |i|) (+ |mc| |j|)
                                         (QREFELT $ 22))
                               (SPADCALL
                                (SPADCALL |x| (+ |mr| |j|) (+ |mc| |i|)
                                          (QREFELT $ 22))
                                (QREFELT $ 28))
                               (QREFELT $ 26))
                              (PROGN
                               (LETT #1# (PROGN (LETT #2# 'NIL . #5#) (GO #2#))
                                     . #5#)
                               (GO #1#))))))
                          (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                          (EXIT NIL)))
                    #1# (EXIT #1#))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT 'T)))))
      #2# (EXIT #2#))))) 

(DEFUN |MATCAT-;zero;2NniS;5| (|rows| |cols| $)
  (SPADCALL |rows| |cols| (|spadConstant| $ 30) (QREFELT $ 31))) 

(DEFUN |MATCAT-;matrix;LS;6| (|l| $)
  (PROG (#1=#:G225 |j| #2=#:G226 |r| #3=#:G223 |i| #4=#:G224 |ll| |ans| |rows|
         #5=#:G222 |cols|)
    (RETURN
     (SEQ
      (COND ((NULL |l|) (SPADCALL 0 0 (|spadConstant| $ 30) (QREFELT $ 31)))
            (#6='T
             (SEQ (LETT |rows| 1 . #7=(|MATCAT-;matrix;LS;6|))
                  (LETT |cols| (LENGTH (|SPADfirst| |l|)) . #7#)
                  (EXIT
                   (COND
                    ((EQL |cols| 0)
                     (|error| "matrices with zero columns are not supported"))
                    (#6#
                     (SEQ
                      (SEQ (LETT |ll| NIL . #7#) (LETT #5# (CDR |l|) . #7#)
                           G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |ll| (CAR #5#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |cols| (LENGTH |ll|) (QREFELT $ 25))
                               (|error| "matrix: rows of different lengths"))
                              ('T (LETT |rows| (+ |rows| 1) . #7#)))))
                           (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |ans|
                            (SPADCALL |rows| |cols| (|spadConstant| $ 30)
                                      (QREFELT $ 31))
                            . #7#)
                      (SEQ (LETT |ll| NIL . #7#) (LETT #4# |l| . #7#)
                           (LETT |i| (SPADCALL |ans| (QREFELT $ 17)) . #7#)
                           (LETT #3# (SPADCALL |ans| (QREFELT $ 18)) . #7#)
                           G190
                           (COND
                            ((OR (> |i| #3#) (ATOM #4#)
                                 (PROGN (LETT |ll| (CAR #4#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |r| NIL . #7#) (LETT #2# |ll| . #7#)
                                  (LETT |j| (SPADCALL |ans| (QREFELT $ 19))
                                        . #7#)
                                  (LETT #1# (SPADCALL |ans| (QREFELT $ 20))
                                        . #7#)
                                  G190
                                  (COND
                                   ((OR (> |j| #1#) (ATOM #2#)
                                        (PROGN (LETT |r| (CAR #2#) . #7#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |ans| |i| |j| |r|
                                              (QREFELT $ 33))))
                                  (LETT |j|
                                        (PROG1 (+ |j| 1)
                                          (LETT #2# (CDR #2#) . #7#))
                                        . #7#)
                                  (GO G190) G191 (EXIT NIL))))
                           (LETT |i|
                                 (PROG1 (+ |i| 1) (LETT #4# (CDR #4#) . #7#))
                                 . #7#)
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |ans|)))))))))))) 

(DEFUN |MATCAT-;scalarMatrix;NniRS;7| (|n| |r| $)
  (PROG (#1=#:G230 |i| #2=#:G231 |j| |ans|)
    (RETURN
     (SEQ
      (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 36))
            . #3=(|MATCAT-;scalarMatrix;NniRS;7|))
      (SEQ (LETT |j| (SPADCALL |ans| (QREFELT $ 19)) . #3#)
           (LETT #2# (SPADCALL |ans| (QREFELT $ 20)) . #3#)
           (LETT |i| (SPADCALL |ans| (QREFELT $ 17)) . #3#)
           (LETT #1# (SPADCALL |ans| (QREFELT $ 18)) . #3#) G190
           (COND ((OR (> |i| #1#) (> |j| #2#)) (GO G191)))
           (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT $ 33))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |MATCAT-;diagonalMatrix;LS;8| (|l| $)
  (PROG (#1=#:G235 |i| #2=#:G236 |j| #3=#:G237 |r| |ans| |n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |l|) . #4=(|MATCAT-;diagonalMatrix;LS;8|))
          (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 36)) . #4#)
          (SEQ (LETT |r| NIL . #4#) (LETT #3# |l| . #4#)
               (LETT |j| (SPADCALL |ans| (QREFELT $ 19)) . #4#)
               (LETT #2# (SPADCALL |ans| (QREFELT $ 20)) . #4#)
               (LETT |i| (SPADCALL |ans| (QREFELT $ 17)) . #4#)
               (LETT #1# (SPADCALL |ans| (QREFELT $ 18)) . #4#) G190
               (COND
                ((OR (> |i| #1#) (> |j| #2#) (ATOM #3#)
                     (PROGN (LETT |r| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT $ 33))))
               (LETT |i|
                     (PROG1 (+ |i| 1)
                       (LETT |j| (PROG1 (+ |j| 1) (LETT #3# (CDR #3#) . #4#))
                             . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |MATCAT-;get_dims| (|l| $)
  (PROG (#1=#:G244 |a| #2=#:G243)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|MATCAT-;get_dims|))
       (SEQ (LETT |a| NIL . #3#) (LETT #1# |l| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS
                     (LIST (SPADCALL |a| (QREFELT $ 11))
                           (SPADCALL |a| (QREFELT $ 12)))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;10|
       (|res| |k| |dl| |l| |r_off| |c_off| |mu| $)
  (PROG (|c_off1| |mm| |aij| |j| |i| |c_step| #1=#:G278 |rc| #2=#:G277 |r_step|
         #3=#:G276 #4=#:G275 |c_ind| |m| |a| |nc| |nr| |dp|)
    (RETURN
     (SEQ
      (LETT |dp| (|SPADfirst| |dl|)
            . #5=(|MATCAT-;kronecker_prod1;SILL2NniUV;10|))
      (LETT |nr| (SPADCALL |dp| 1 (QREFELT $ 43)) . #5#)
      (LETT |nc| (SPADCALL |dp| 2 (QREFELT $ 43)) . #5#)
      (LETT |a| (|SPADfirst| |l|) . #5#)
      (COND ((QEQCAR |mu| 1) (COND ((EQL |k| 1) (EXIT |a|)))))
      (EXIT
       (COND
        ((EQL |k| 1)
         (COND ((QEQCAR |mu| 1) (|error| "kronecker_prod1: impossible"))
               (#6='T
                (SEQ (LETT |m| (QCDR |mu|) . #5#)
                     (EXIT
                      (SEQ (LETT |i| 1 . #5#) G190
                           (COND ((|greater_SI| |i| |nr|) (GO G191)))
                           (SEQ (LETT |r_off| (+ |r_off| 1) . #5#)
                                (LETT |c_ind| (+ |c_off| 1) . #5#)
                                (EXIT
                                 (SEQ (LETT |j| 1 . #5#) G190
                                      (COND
                                       ((|greater_SI| |j| |nc|) (GO G191)))
                                      (SEQ
                                       (QSETAREF2O |res| |r_off| |c_ind|
                                                   (SPADCALL |m|
                                                             (QAREF2O |a| |i|
                                                                      |j| 1 1)
                                                             (QREFELT $ 44))
                                                   1 1)
                                       (EXIT
                                        (LETT |c_ind| (+ |c_ind| 1) . #5#)))
                                      (LETT |j| (|inc_SI| |j|) . #5#) (GO G190)
                                      G191 (EXIT NIL))))
                           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                           (EXIT NIL)))))))
        (#6#
         (SEQ (LETT |dl| (CDR |dl|) . #5#) (LETT |l| (CDR |l|) . #5#)
              (LETT |r_step|
                    (SPADCALL (ELT $ 45)
                              (PROGN
                               (LETT #4# NIL . #5#)
                               (SEQ (LETT |rc| NIL . #5#) (LETT #3# |dl| . #5#)
                                    G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |rc| (CAR #3#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS
                                             (SPADCALL |rc| 1 (QREFELT $ 43))
                                             #4#)
                                            . #5#)))
                                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #4#))))
                              (QREFELT $ 47))
                    . #5#)
              (LETT |c_step|
                    (SPADCALL (ELT $ 45)
                              (PROGN
                               (LETT #2# NIL . #5#)
                               (SEQ (LETT |rc| NIL . #5#) (LETT #1# |dl| . #5#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |rc| (CAR #1#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |rc| 2 (QREFELT $ 43))
                                             #2#)
                                            . #5#)))
                                    (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 47))
                    . #5#)
              (EXIT
               (SEQ (LETT |i| 1 . #5#) G190
                    (COND ((|greater_SI| |i| |nr|) (GO G191)))
                    (SEQ (LETT |c_off1| |c_off| . #5#)
                         (SEQ (LETT |j| 1 . #5#) G190
                              (COND ((|greater_SI| |j| |nc|) (GO G191)))
                              (SEQ (LETT |aij| (QAREF2O |a| |i| |j| 1 1) . #5#)
                                   (LETT |mm|
                                         (COND ((QEQCAR |mu| 1) |aij|)
                                               ('T
                                                (SPADCALL (QCDR |mu|) |aij|
                                                          (QREFELT $ 44))))
                                         . #5#)
                                   (SPADCALL |res| (- |k| 1) |dl| |l| |r_off|
                                             |c_off1| (CONS 0 |mm|)
                                             (QREFELT $ 52))
                                   (EXIT
                                    (LETT |c_off1| (+ |c_off1| |c_step|)
                                          . #5#)))
                              (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (LETT |r_off| (+ |r_off| |r_step|) . #5#)))
                    (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                    (EXIT NIL))))))))))) 

(DEFUN |MATCAT-;kroneckerProduct;LS;11| (|l| $)
  (PROG (#1=#:G305 |a| |res| |nc| #2=#:G304 |rc| #3=#:G303 |nr| #4=#:G302
         #5=#:G301 |dl| |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #6=(|MATCAT-;kroneckerProduct;LS;11|))
          (EXIT
           (COND
            ((EQL |k| 0)
             (COND
              ((QEQCAR (QREFELT $ 41) 0)
               (SPADCALL 1 1 (QCDR (QREFELT $ 41)) (QREFELT $ 31)))
              (#7='T (|error| "need 1"))))
            ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 54)))
            (#7#
             (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| $) . #6#)
                  (LETT |nr|
                        (SPADCALL (ELT $ 45)
                                  (PROGN
                                   (LETT #5# NIL . #6#)
                                   (SEQ (LETT |rc| NIL . #6#)
                                        (LETT #4# |dl| . #6#) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |rc| (CAR #4#) . #6#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL |rc| 1
                                                           (QREFELT $ 43))
                                                 #5#)
                                                . #6#)))
                                        (LETT #4# (CDR #4#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  (QREFELT $ 47))
                        . #6#)
                  (LETT |nc|
                        (SPADCALL (ELT $ 45)
                                  (PROGN
                                   (LETT #3# NIL . #6#)
                                   (SEQ (LETT |rc| NIL . #6#)
                                        (LETT #2# |dl| . #6#) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |rc| (CAR #2#) . #6#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (SPADCALL |rc| 2
                                                           (QREFELT $ 43))
                                                 #3#)
                                                . #6#)))
                                        (LETT #2# (CDR #2#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #3#))))
                                  (QREFELT $ 47))
                        . #6#)
                  (LETT |res| (SPADCALL |nr| |nc| (QREFELT $ 36)) . #6#)
                  (SEQ (LETT |a| NIL . #6#) (LETT #1# |l| . #6#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                   (QREFELT $ 52))))
                       (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))))) 

(DEFUN |MATCAT-;kroneckerProduct;3S;12| (|a| |b| $)
  (SPADCALL (LIST |a| |b|) (QREFELT $ 56))) 

(DEFUN |MATCAT-;kroneckerSum;LS;13| (|l| $)
  (PROG (|n0| |off0| |off_r| |ind_c| |vv| |j| |i| |m| |step0| |n2| |dl| |nr|
         #1=#:G341 |a| |res| |nrs| #2=#:G340 #3=#:G339 |nc| #4=#:G338 |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #5=(|MATCAT-;kroneckerSum;LS;13|))
          (EXIT
           (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT $ 36)))
                 ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 54)))
                 ('T
                  (SEQ (LETT |dl| NIL . #5#)
                       (SEQ (LETT |a| NIL . #5#) (LETT #4# |l| . #5#) G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |a| (CAR #4#) . #5#) NIL))
                              (GO G191)))
                            (SEQ (LETT |nr| (QVSIZE |a|) . #5#)
                                 (LETT |nc| (SPADCALL |a| (QREFELT $ 12))
                                       . #5#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |nr| |nc| (QREFELT $ 25))
                                    (|error| "kroneckerSum: nonsquare matrix"))
                                   ('T (LETT |dl| (CONS |nr| |dl|) . #5#)))))
                            (LETT #4# (CDR #4#) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |dl| (NREVERSE |dl|) . #5#)
                       (LETT |nrs|
                             (SPADCALL (ELT $ 45)
                                       (PROGN
                                        (LETT #3# NIL . #5#)
                                        (SEQ (LETT |nr| NIL . #5#)
                                             (LETT #2# |dl| . #5#) G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |nr| (CAR #2#) . #5#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #3# (CONS |nr| #3#)
                                                     . #5#)))
                                             (LETT #2# (CDR #2#) . #5#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #3#))))
                                       (QREFELT $ 47))
                             . #5#)
                       (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT $ 36)) . #5#)
                       (LETT |n0| 1 . #5#)
                       (SEQ (LETT |a| NIL . #5#) (LETT #1# |l| . #5#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |a| (CAR #1#) . #5#) NIL))
                              (GO G191)))
                            (SEQ (LETT |off0| 0 . #5#)
                                 (LETT |nr| (SPADCALL |dl| 1 (QREFELT $ 43))
                                       . #5#)
                                 (LETT |dl| (CDR |dl|) . #5#)
                                 (LETT |n2|
                                       (SPADCALL (ELT $ 45) |dl| 1
                                                 (QREFELT $ 58))
                                       . #5#)
                                 (LETT |step0| (* |nr| |n2|) . #5#)
                                 (SEQ (LETT |m| 1 . #5#) G190
                                      (COND
                                       ((|greater_SI| |m| |n0|) (GO G191)))
                                      (SEQ (LETT |off_r| (+ |off0| 1) . #5#)
                                           (SEQ (LETT |i| 1 . #5#) G190
                                                (COND
                                                 ((|greater_SI| |i| |nr|)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (SEQ (LETT |l| 1 . #5#) G190
                                                       (COND
                                                        ((|greater_SI| |l|
                                                                       |n2|)
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |ind_c|
                                                              (+ |off0| |l|)
                                                              . #5#)
                                                        (SEQ (LETT |j| 1 . #5#)
                                                             G190
                                                             (COND
                                                              ((|greater_SI|
                                                                |j| |nr|)
                                                               (GO G191)))
                                                             (SEQ
                                                              (LETT |vv|
                                                                    (SPADCALL
                                                                     (QAREF2O
                                                                      |res|
                                                                      |off_r|
                                                                      |ind_c| 1
                                                                      1)
                                                                     (QAREF2O
                                                                      |a| |i|
                                                                      |j| 1 1)
                                                                     (QREFELT $
                                                                              59))
                                                                    . #5#)
                                                              (QSETAREF2O |res|
                                                                          |off_r|
                                                                          |ind_c|
                                                                          |vv|
                                                                          1 1)
                                                              (EXIT
                                                               (LETT |ind_c|
                                                                     (+ |ind_c|
                                                                        |n2|)
                                                                     . #5#)))
                                                             (LETT |j|
                                                                   (|inc_SI|
                                                                    |j|)
                                                                   . #5#)
                                                             (GO G190) G191
                                                             (EXIT NIL))
                                                        (EXIT
                                                         (LETT |off_r|
                                                               (+ |off_r| 1)
                                                               . #5#)))
                                                       (LETT |l| (|inc_SI| |l|)
                                                             . #5#)
                                                       (GO G190) G191
                                                       (EXIT NIL))))
                                                (LETT |i| (|inc_SI| |i|) . #5#)
                                                (GO G190) G191 (EXIT NIL))
                                           (EXIT
                                            (LETT |off0| (+ |off0| |step0|)
                                                  . #5#)))
                                      (LETT |m| (|inc_SI| |m|) . #5#) (GO G190)
                                      G191 (EXIT NIL))
                                 (EXIT (LETT |n0| (* |n0| |nr|) . #5#)))
                            (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |res|))))))))) 

(DEFUN |MATCAT-;kroneckerSum;3S;14| (|a| |b| $)
  (SPADCALL (LIST |a| |b|) (QREFELT $ 61))) 

(DEFUN |MATCAT-;diagonalMatrix;LS;15| (|list| $)
  (PROG (|loC| |loR| |j| #1=#:G354 |l| |i| #2=#:G353 |k| |hiC| |hiR| #3=#:G352
         |mat| |ans| |cols| |rows| #4=#:G351)
    (RETURN
     (SEQ (LETT |rows| 0 . #5=(|MATCAT-;diagonalMatrix;LS;15|))
          (LETT |cols| 0 . #5#)
          (SEQ (LETT |mat| NIL . #5#) (LETT #4# |list| . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |mat| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |rows| (+ |rows| (QVSIZE |mat|)) . #5#)
                    (EXIT
                     (LETT |cols| (+ |cols| (SPADCALL |mat| (QREFELT $ 12)))
                           . #5#)))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |ans| (SPADCALL |rows| |cols| (QREFELT $ 36)) . #5#)
          (LETT |loR| 1 . #5#) (LETT |loC| 1 . #5#)
          (SEQ (LETT |mat| NIL . #5#) (LETT #3# |list| . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |mat| (CAR #3#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |hiR| (- (+ |loR| (QVSIZE |mat|)) 1) . #5#)
                    (LETT |hiC| (- (+ |loC| (QVSIZE |mat|)) 1) . #5#)
                    (SEQ (LETT |k| 1 . #5#)
                         (LETT #2# (SPADCALL |mat| (QREFELT $ 18)) . #5#)
                         (LETT |i| |loR| . #5#) G190
                         (COND
                          ((OR (> |i| |hiR|) (|greater_SI| |k| #2#))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |l| 1 . #5#)
                                (LETT #1# (SPADCALL |mat| (QREFELT $ 20))
                                      . #5#)
                                (LETT |j| |loC| . #5#) G190
                                (COND
                                 ((OR (> |j| |hiC|) (|greater_SI| |l| #1#))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |ans| |i| |j|
                                              (QAREF2O |mat| |k| |l| 1 1) 1
                                              1)))
                                (LETT |j|
                                      (PROG1 (+ |j| 1)
                                        (LETT |l| (|inc_SI| |l|) . #5#))
                                      . #5#)
                                (GO G190) G191 (EXIT NIL))))
                         (LETT |i|
                               (PROG1 (+ |i| 1)
                                 (LETT |k| (|inc_SI| |k|) . #5#))
                               . #5#)
                         (GO G190) G191 (EXIT NIL))
                    (LETT |loR| (+ |hiR| 1) . #5#)
                    (EXIT (LETT |loC| (+ |hiC| 1) . #5#)))
               (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;16|
       (|res| |k| |dl| |l| |r_off| |c_off| |mu| $)
  (PROG (|c_off1| |mm| |aij| |j| |i| |c_step| #1=#:G388 |rc| #2=#:G387 |r_step|
         #3=#:G386 #4=#:G385 |c_ind| |m| |a| |nc| |nr| |dp|)
    (RETURN
     (SEQ
      (LETT |dp| (|SPADfirst| |dl|)
            . #5=(|MATCAT-;kronecker_prod1;SILL2NniUV;16|))
      (LETT |nr| (SPADCALL |dp| 1 (QREFELT $ 43)) . #5#)
      (LETT |nc| (SPADCALL |dp| 2 (QREFELT $ 43)) . #5#)
      (LETT |a| (|SPADfirst| |l|) . #5#)
      (COND ((QEQCAR |mu| 1) (COND ((EQL |k| 1) (EXIT |a|)))))
      (EXIT
       (COND
        ((EQL |k| 1)
         (COND ((QEQCAR |mu| 1) (|error| "kronecker_prod1: impossible"))
               (#6='T
                (SEQ (LETT |m| (QCDR |mu|) . #5#)
                     (EXIT
                      (SEQ (LETT |i| 1 . #5#) G190
                           (COND ((|greater_SI| |i| |nr|) (GO G191)))
                           (SEQ (LETT |r_off| (+ |r_off| 1) . #5#)
                                (LETT |c_ind| (+ |c_off| 1) . #5#)
                                (EXIT
                                 (SEQ (LETT |j| 1 . #5#) G190
                                      (COND
                                       ((|greater_SI| |j| |nc|) (GO G191)))
                                      (SEQ
                                       (SPADCALL |res| |r_off| |c_ind|
                                                 (SPADCALL |m|
                                                           (SPADCALL |a| |i|
                                                                     |j|
                                                                     (QREFELT $
                                                                              22))
                                                           (QREFELT $ 44))
                                                 (QREFELT $ 33))
                                       (EXIT
                                        (LETT |c_ind| (+ |c_ind| 1) . #5#)))
                                      (LETT |j| (|inc_SI| |j|) . #5#) (GO G190)
                                      G191 (EXIT NIL))))
                           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                           (EXIT NIL)))))))
        (#6#
         (SEQ (LETT |dl| (CDR |dl|) . #5#) (LETT |l| (CDR |l|) . #5#)
              (LETT |r_step|
                    (SPADCALL (ELT $ 45)
                              (PROGN
                               (LETT #4# NIL . #5#)
                               (SEQ (LETT |rc| NIL . #5#) (LETT #3# |dl| . #5#)
                                    G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |rc| (CAR #3#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS
                                             (SPADCALL |rc| 1 (QREFELT $ 43))
                                             #4#)
                                            . #5#)))
                                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #4#))))
                              (QREFELT $ 47))
                    . #5#)
              (LETT |c_step|
                    (SPADCALL (ELT $ 45)
                              (PROGN
                               (LETT #2# NIL . #5#)
                               (SEQ (LETT |rc| NIL . #5#) (LETT #1# |dl| . #5#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |rc| (CAR #1#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |rc| 2 (QREFELT $ 43))
                                             #2#)
                                            . #5#)))
                                    (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 47))
                    . #5#)
              (EXIT
               (SEQ (LETT |i| 1 . #5#) G190
                    (COND ((|greater_SI| |i| |nr|) (GO G191)))
                    (SEQ (LETT |c_off1| |c_off| . #5#)
                         (SEQ (LETT |j| 1 . #5#) G190
                              (COND ((|greater_SI| |j| |nc|) (GO G191)))
                              (SEQ
                               (LETT |aij|
                                     (SPADCALL |a| |i| |j| (QREFELT $ 22))
                                     . #5#)
                               (LETT |mm|
                                     (COND ((QEQCAR |mu| 1) |aij|)
                                           ('T
                                            (SPADCALL (QCDR |mu|) |aij|
                                                      (QREFELT $ 44))))
                                     . #5#)
                               (SPADCALL |res| (- |k| 1) |dl| |l| |r_off|
                                         |c_off1| (CONS 0 |mm|) (QREFELT $ 52))
                               (EXIT
                                (LETT |c_off1| (+ |c_off1| |c_step|) . #5#)))
                              (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (LETT |r_off| (+ |r_off| |r_step|) . #5#)))
                    (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                    (EXIT NIL))))))))))) 

(DEFUN |MATCAT-;kroneckerProduct;LS;17| (|l| $)
  (PROG (#1=#:G415 |a| |res| |nc| #2=#:G414 |rc| #3=#:G413 |nr| #4=#:G412
         #5=#:G411 |dl| |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #6=(|MATCAT-;kroneckerProduct;LS;17|))
          (EXIT
           (COND
            ((EQL |k| 0)
             (COND
              ((QEQCAR (QREFELT $ 41) 0)
               (SPADCALL 1 1 (QCDR (QREFELT $ 41)) (QREFELT $ 31)))
              (#7='T (|error| "need 1"))))
            ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 54)))
            (#7#
             (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| $) . #6#)
                  (LETT |nr|
                        (SPADCALL (ELT $ 45)
                                  (PROGN
                                   (LETT #5# NIL . #6#)
                                   (SEQ (LETT |rc| NIL . #6#)
                                        (LETT #4# |dl| . #6#) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |rc| (CAR #4#) . #6#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL |rc| 1
                                                           (QREFELT $ 43))
                                                 #5#)
                                                . #6#)))
                                        (LETT #4# (CDR #4#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  (QREFELT $ 47))
                        . #6#)
                  (LETT |nc|
                        (SPADCALL (ELT $ 45)
                                  (PROGN
                                   (LETT #3# NIL . #6#)
                                   (SEQ (LETT |rc| NIL . #6#)
                                        (LETT #2# |dl| . #6#) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |rc| (CAR #2#) . #6#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (SPADCALL |rc| 2
                                                           (QREFELT $ 43))
                                                 #3#)
                                                . #6#)))
                                        (LETT #2# (CDR #2#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #3#))))
                                  (QREFELT $ 47))
                        . #6#)
                  (LETT |res| (SPADCALL |nr| |nc| (QREFELT $ 36)) . #6#)
                  (SEQ (LETT |a| NIL . #6#) (LETT #1# |l| . #6#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                   (QREFELT $ 52))))
                       (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))))) 

(DEFUN |MATCAT-;kroneckerProduct;3S;18| (|a| |b| $)
  (SPADCALL (LIST |a| |b|) (QREFELT $ 56))) 

(DEFUN |MATCAT-;kroneckerSum;LS;19| (|l| $)
  (PROG (|n0| |off0| |off_r| |ind_c| |vv| |j| |i| |m| |step0| |n2| |dl| |nr|
         #1=#:G451 |a| |res| |nrs| #2=#:G450 #3=#:G449 |nc| #4=#:G448 |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #5=(|MATCAT-;kroneckerSum;LS;19|))
          (EXIT
           (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT $ 36)))
                 ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 54)))
                 ('T
                  (SEQ (LETT |dl| NIL . #5#)
                       (SEQ (LETT |a| NIL . #5#) (LETT #4# |l| . #5#) G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |a| (CAR #4#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |nr| (SPADCALL |a| (QREFELT $ 11)) . #5#)
                             (LETT |nc| (SPADCALL |a| (QREFELT $ 12)) . #5#)
                             (EXIT
                              (COND
                               ((SPADCALL |nr| |nc| (QREFELT $ 25))
                                (|error| "kroneckerSum: nonsquare matrix"))
                               ('T (LETT |dl| (CONS |nr| |dl|) . #5#)))))
                            (LETT #4# (CDR #4#) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |dl| (NREVERSE |dl|) . #5#)
                       (LETT |nrs|
                             (SPADCALL (ELT $ 45)
                                       (PROGN
                                        (LETT #3# NIL . #5#)
                                        (SEQ (LETT |nr| NIL . #5#)
                                             (LETT #2# |dl| . #5#) G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |nr| (CAR #2#) . #5#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #3# (CONS |nr| #3#)
                                                     . #5#)))
                                             (LETT #2# (CDR #2#) . #5#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #3#))))
                                       (QREFELT $ 47))
                             . #5#)
                       (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT $ 36)) . #5#)
                       (LETT |n0| 1 . #5#)
                       (SEQ (LETT |a| NIL . #5#) (LETT #1# |l| . #5#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |a| (CAR #1#) . #5#) NIL))
                              (GO G191)))
                            (SEQ (LETT |off0| 0 . #5#)
                                 (LETT |nr| (SPADCALL |dl| 1 (QREFELT $ 43))
                                       . #5#)
                                 (LETT |dl| (CDR |dl|) . #5#)
                                 (LETT |n2|
                                       (SPADCALL (ELT $ 45) |dl| 1
                                                 (QREFELT $ 58))
                                       . #5#)
                                 (LETT |step0| (* |nr| |n2|) . #5#)
                                 (SEQ (LETT |m| 1 . #5#) G190
                                      (COND
                                       ((|greater_SI| |m| |n0|) (GO G191)))
                                      (SEQ (LETT |off_r| (+ |off0| 1) . #5#)
                                           (SEQ (LETT |i| 1 . #5#) G190
                                                (COND
                                                 ((|greater_SI| |i| |nr|)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (SEQ (LETT |l| 1 . #5#) G190
                                                       (COND
                                                        ((|greater_SI| |l|
                                                                       |n2|)
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |ind_c|
                                                              (+ |off0| |l|)
                                                              . #5#)
                                                        (SEQ (LETT |j| 1 . #5#)
                                                             G190
                                                             (COND
                                                              ((|greater_SI|
                                                                |j| |nr|)
                                                               (GO G191)))
                                                             (SEQ
                                                              (LETT |vv|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |res|
                                                                      |off_r|
                                                                      |ind_c|
                                                                      (QREFELT
                                                                       $ 22))
                                                                     (SPADCALL
                                                                      |a| |i|
                                                                      |j|
                                                                      (QREFELT
                                                                       $ 22))
                                                                     (QREFELT $
                                                                              59))
                                                                    . #5#)
                                                              (SPADCALL |res|
                                                                        |off_r|
                                                                        |ind_c|
                                                                        |vv|
                                                                        (QREFELT
                                                                         $ 33))
                                                              (EXIT
                                                               (LETT |ind_c|
                                                                     (+ |ind_c|
                                                                        |n2|)
                                                                     . #5#)))
                                                             (LETT |j|
                                                                   (|inc_SI|
                                                                    |j|)
                                                                   . #5#)
                                                             (GO G190) G191
                                                             (EXIT NIL))
                                                        (EXIT
                                                         (LETT |off_r|
                                                               (+ |off_r| 1)
                                                               . #5#)))
                                                       (LETT |l| (|inc_SI| |l|)
                                                             . #5#)
                                                       (GO G190) G191
                                                       (EXIT NIL))))
                                                (LETT |i| (|inc_SI| |i|) . #5#)
                                                (GO G190) G191 (EXIT NIL))
                                           (EXIT
                                            (LETT |off0| (+ |off0| |step0|)
                                                  . #5#)))
                                      (LETT |m| (|inc_SI| |m|) . #5#) (GO G190)
                                      G191 (EXIT NIL))
                                 (EXIT (LETT |n0| (* |n0| |nr|) . #5#)))
                            (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |res|))))))))) 

(DEFUN |MATCAT-;kroneckerSum;3S;20| (|a| |b| $)
  (SPADCALL (LIST |a| |b|) (QREFELT $ 61))) 

(DEFUN |MATCAT-;diagonalMatrix;LS;21| (|list| $)
  (PROG (|loC| |loR| |j| #1=#:G464 |l| |i| #2=#:G463 |k| |hiC| |hiR| #3=#:G462
         |mat| |ans| |cols| |rows| #4=#:G461)
    (RETURN
     (SEQ (LETT |rows| 0 . #5=(|MATCAT-;diagonalMatrix;LS;21|))
          (LETT |cols| 0 . #5#)
          (SEQ (LETT |mat| NIL . #5#) (LETT #4# |list| . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |mat| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |rows| (+ |rows| (SPADCALL |mat| (QREFELT $ 11))) . #5#)
                (EXIT
                 (LETT |cols| (+ |cols| (SPADCALL |mat| (QREFELT $ 12)))
                       . #5#)))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |ans| (SPADCALL |rows| |cols| (QREFELT $ 36)) . #5#)
          (LETT |loR| (SPADCALL |ans| (QREFELT $ 17)) . #5#)
          (LETT |loC| (SPADCALL |ans| (QREFELT $ 19)) . #5#)
          (SEQ (LETT |mat| NIL . #5#) (LETT #3# |list| . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |mat| (CAR #3#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |hiR| (- (+ |loR| (SPADCALL |mat| (QREFELT $ 11))) 1)
                      . #5#)
                (LETT |hiC| (- (+ |loC| (SPADCALL |mat| (QREFELT $ 11))) 1)
                      . #5#)
                (SEQ (LETT |k| (SPADCALL |mat| (QREFELT $ 17)) . #5#)
                     (LETT #2# (SPADCALL |mat| (QREFELT $ 18)) . #5#)
                     (LETT |i| |loR| . #5#) G190
                     (COND ((OR (> |i| |hiR|) (> |k| #2#)) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |l| (SPADCALL |mat| (QREFELT $ 19)) . #5#)
                            (LETT #1# (SPADCALL |mat| (QREFELT $ 20)) . #5#)
                            (LETT |j| |loC| . #5#) G190
                            (COND ((OR (> |j| |hiC|) (> |l| #1#)) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |ans| |i| |j|
                                        (SPADCALL |mat| |k| |l| (QREFELT $ 22))
                                        (QREFELT $ 33))))
                            (LETT |j|
                                  (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #5#))
                                  . #5#)
                            (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #5#))
                           . #5#)
                     (GO G190) G191 (EXIT NIL))
                (LETT |loR| (+ |hiR| 1) . #5#)
                (EXIT (LETT |loC| (+ |hiC| 1) . #5#)))
               (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |MATCAT-;coerce;ColS;22| (|v| $)
  (PROG (#1=#:G468 |i| #2=#:G469 |k| |one| |x|)
    (RETURN
     (SEQ
      (LETT |x|
            (SPADCALL (SPADCALL |v| (QREFELT $ 64)) 1 (|spadConstant| $ 30)
                      (QREFELT $ 31))
            . #3=(|MATCAT-;coerce;ColS;22|))
      (LETT |one| (SPADCALL |x| (QREFELT $ 19)) . #3#)
      (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 65)) . #3#)
           (LETT #2# (SPADCALL |v| (QREFELT $ 66)) . #3#)
           (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #3#)
           (LETT #1# (SPADCALL |x| (QREFELT $ 18)) . #3#) G190
           (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |x| |i| |one| (SPADCALL |v| |k| (QREFELT $ 67))
                       (QREFELT $ 33))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |MATCAT-;transpose;RowS;23| (|v| $)
  (PROG (#1=#:G473 |j| #2=#:G474 |k| |one| |x|)
    (RETURN
     (SEQ
      (LETT |x|
            (SPADCALL 1 (SPADCALL |v| (QREFELT $ 69)) (|spadConstant| $ 30)
                      (QREFELT $ 31))
            . #3=(|MATCAT-;transpose;RowS;23|))
      (LETT |one| (SPADCALL |x| (QREFELT $ 17)) . #3#)
      (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 70)) . #3#)
           (LETT #2# (SPADCALL |v| (QREFELT $ 71)) . #3#)
           (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #3#)
           (LETT #1# (SPADCALL |x| (QREFELT $ 20)) . #3#) G190
           (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |x| |one| |j| (SPADCALL |v| |k| (QREFELT $ 72))
                       (QREFELT $ 33))))
           (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |MATCAT-;transpose;2S;24| (|x| $)
  (PROG (#1=#:G480 |j| #2=#:G479 |i| |ans|)
    (RETURN
     (SEQ
      (LETT |ans|
            (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                      (SPADCALL |x| (QREFELT $ 11)) (|spadConstant| $ 30)
                      (QREFELT $ 31))
            . #3=(|MATCAT-;transpose;2S;24|))
      (SEQ (LETT |i| (SPADCALL |ans| (QREFELT $ 17)) . #3#)
           (LETT #2# (SPADCALL |ans| (QREFELT $ 18)) . #3#) G190
           (COND ((> |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| (SPADCALL |ans| (QREFELT $ 19)) . #3#)
                  (LETT #1# (SPADCALL |ans| (QREFELT $ 20)) . #3#) G190
                  (COND ((> |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |ans| |i| |j|
                              (SPADCALL |x| |j| |i| (QREFELT $ 22))
                              (QREFELT $ 33))))
                  (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |MATCAT-;squareTop;2S;25| (|x| $)
  (PROG (#1=#:G487 |j| #2=#:G486 |i| |ans| |cols|)
    (RETURN
     (SEQ
      (COND
       ((< (SPADCALL |x| (QREFELT $ 11))
           (LETT |cols| (SPADCALL |x| (QREFELT $ 12))
                 . #3=(|MATCAT-;squareTop;2S;25|)))
        (|error| "squareTop: number of columns exceeds number of rows"))
       ('T
        (SEQ
         (LETT |ans|
               (SPADCALL |cols| |cols| (|spadConstant| $ 30) (QREFELT $ 31))
               . #3#)
         (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #3#)
              (LETT #2# (- (+ (SPADCALL |x| (QREFELT $ 17)) |cols|) 1) . #3#)
              G190 (COND ((> |i| #2#) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #3#)
                     (LETT #1# (SPADCALL |x| (QREFELT $ 20)) . #3#) G190
                     (COND ((> |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |ans| |i| |j|
                                 (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                 (QREFELT $ 33))))
                     (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;horizConcat;3S;26| (|x| |y| $)
  (PROG (#1=#:G498 |j| #2=#:G497 |i| #3=#:G496 #4=#:G495 |ans| |cols| |rows|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |rows| (SPADCALL |x| (QREFELT $ 11))
               . #5=(|MATCAT-;horizConcat;3S;26|))
         (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 25))
        (|error| "HConcat: matrices must have same number of rows"))
       ('T
        (SEQ
         (LETT |ans|
               (SPADCALL |rows|
                         (+ (LETT |cols| (SPADCALL |x| (QREFELT $ 12)) . #5#)
                            (SPADCALL |y| (QREFELT $ 12)))
                         (|spadConstant| $ 30) (QREFELT $ 31))
               . #5#)
         (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #5#)
              (LETT #4# (SPADCALL |x| (QREFELT $ 18)) . #5#) G190
              (COND ((> |i| #4#) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #5#)
                     (LETT #3# (SPADCALL |x| (QREFELT $ 20)) . #5#) G190
                     (COND ((> |j| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |ans| |i| |j|
                                 (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                 (QREFELT $ 33))))
                     (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
         (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 17)) . #5#)
              (LETT #2# (SPADCALL |y| (QREFELT $ 18)) . #5#) G190
              (COND ((> |i| #2#) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 19)) . #5#)
                     (LETT #1# (SPADCALL |y| (QREFELT $ 20)) . #5#) G190
                     (COND ((> |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |ans| |i| (+ |j| |cols|)
                                 (SPADCALL |y| |i| |j| (QREFELT $ 22))
                                 (QREFELT $ 33))))
                     (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;vertConcat;3S;27| (|x| |y| $)
  (PROG (#1=#:G509 |j| #2=#:G508 |i| #3=#:G507 #4=#:G506 |ans| |rows| |cols|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |cols| (SPADCALL |x| (QREFELT $ 12))
               . #5=(|MATCAT-;vertConcat;3S;27|))
         (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 25))
        (|error| "HConcat: matrices must have same number of columns"))
       ('T
        (SEQ
         (LETT |ans|
               (SPADCALL
                (+ (LETT |rows| (SPADCALL |x| (QREFELT $ 11)) . #5#)
                   (SPADCALL |y| (QREFELT $ 11)))
                |cols| (|spadConstant| $ 30) (QREFELT $ 31))
               . #5#)
         (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #5#)
              (LETT #4# (SPADCALL |x| (QREFELT $ 18)) . #5#) G190
              (COND ((> |i| #4#) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #5#)
                     (LETT #3# (SPADCALL |x| (QREFELT $ 20)) . #5#) G190
                     (COND ((> |j| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |ans| |i| |j|
                                 (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                 (QREFELT $ 33))))
                     (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
         (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 17)) . #5#)
              (LETT #2# (SPADCALL |y| (QREFELT $ 18)) . #5#) G190
              (COND ((> |i| #2#) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 19)) . #5#)
                     (LETT #1# (SPADCALL |y| (QREFELT $ 20)) . #5#) G190
                     (COND ((> |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |ans| (+ |i| |rows|) |j|
                                 (SPADCALL |y| |i| |j| (QREFELT $ 22))
                                 (QREFELT $ 33))))
                     (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;listOfLists;SL;28| (|x| $)
  (PROG (|ll| |l| #1=#:G516 |j| #2=#:G515 |i|)
    (RETURN
     (SEQ (LETT |ll| NIL . #3=(|MATCAT-;listOfLists;SL;28|))
          (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 18)) . #3#)
               (LETT #2# (SPADCALL |x| (QREFELT $ 17)) . #3#) G190
               (COND ((< |i| #2#) (GO G191)))
               (SEQ (LETT |l| NIL . #3#)
                    (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 20)) . #3#)
                         (LETT #1# (SPADCALL |x| (QREFELT $ 19)) . #3#) G190
                         (COND ((< |j| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |l|
                                 (CONS (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                       |l|)
                                 . #3#)))
                         (LETT |j| (+ |j| -1) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |ll| (CONS |l| |ll|) . #3#)))
               (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ll|))))) 

(DEFUN |MATCAT-;swapRows!;S2IS;29| (|x| |i1| |i2| $)
  (PROG (|r| #1=#:G526 |j|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |i1| (SPADCALL |x| (QREFELT $ 17)))
            (OR (SPADCALL |i1| (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 79))
                (OR (< |i2| (SPADCALL |x| (QREFELT $ 17)))
                    (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 18))
                              (QREFELT $ 79)))))
        (|error| "swapRows!: index out of range"))
       ('T
        (COND ((EQL |i1| |i2|) |x|)
              ('T
               (SEQ
                (SEQ
                 (LETT |j| (SPADCALL |x| (QREFELT $ 19))
                       . #2=(|MATCAT-;swapRows!;S2IS;29|))
                 (LETT #1# (SPADCALL |x| (QREFELT $ 20)) . #2#) G190
                 (COND ((> |j| #1#) (GO G191)))
                 (SEQ (LETT |r| (SPADCALL |x| |i1| |j| (QREFELT $ 22)) . #2#)
                      (SPADCALL |x| |i1| |j|
                                (SPADCALL |x| |i2| |j| (QREFELT $ 22))
                                (QREFELT $ 33))
                      (EXIT (SPADCALL |x| |i2| |j| |r| (QREFELT $ 33))))
                 (LETT |j| (+ |j| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))))))))) 

(DEFUN |MATCAT-;swapColumns!;S2IS;30| (|x| |j1| |j2| $)
  (PROG (|r| #1=#:G536 |i|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |j1| (SPADCALL |x| (QREFELT $ 19)))
            (OR (SPADCALL |j1| (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 79))
                (OR (< |j2| (SPADCALL |x| (QREFELT $ 19)))
                    (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 20))
                              (QREFELT $ 79)))))
        (|error| "swapColumns!: index out of range"))
       ('T
        (COND ((EQL |j1| |j2|) |x|)
              ('T
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |x| (QREFELT $ 17))
                       . #2=(|MATCAT-;swapColumns!;S2IS;30|))
                 (LETT #1# (SPADCALL |x| (QREFELT $ 18)) . #2#) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ (LETT |r| (SPADCALL |x| |i| |j1| (QREFELT $ 22)) . #2#)
                      (SPADCALL |x| |i| |j1|
                                (SPADCALL |x| |i| |j2| (QREFELT $ 22))
                                (QREFELT $ 33))
                      (EXIT (SPADCALL |x| |i| |j2| |r| (QREFELT $ 33))))
                 (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))))))))) 

(DEFUN |MATCAT-;elt;S2LS;31| (|x| |rowList| |colList| $)
  (PROG (#1=#:G551 |ej| #2=#:G552 |j| #3=#:G549 |ei| #4=#:G550 |i| |y|
         #5=#:G542 #6=#:G548 #7=#:G539 #8=#:G547)
    (RETURN
     (SEQ
      (SEQ
       (EXIT
        (SEQ (LETT |ei| NIL . #9=(|MATCAT-;elt;S2LS;31|))
             (LETT #8# |rowList| . #9#) G190
             (COND
              ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#) . #9#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((OR (< |ei| (SPADCALL |x| (QREFELT $ 17)))
                     (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 18))
                               (QREFELT $ 79)))
                 (PROGN
                  (LETT #7# (|error| "elt: index out of range") . #9#)
                  (GO #7#))))))
             (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL)))
       #7# (EXIT #7#))
      (SEQ
       (EXIT
        (SEQ (LETT |ej| NIL . #9#) (LETT #6# |colList| . #9#) G190
             (COND
              ((OR (ATOM #6#) (PROGN (LETT |ej| (CAR #6#) . #9#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((OR (< |ej| (SPADCALL |x| (QREFELT $ 19)))
                     (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 20))
                               (QREFELT $ 79)))
                 (PROGN
                  (LETT #5# (|error| "elt: index out of range") . #9#)
                  (GO #5#))))))
             (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL)))
       #5# (EXIT #5#))
      (LETT |y|
            (SPADCALL (LENGTH |rowList|) (LENGTH |colList|)
                      (|spadConstant| $ 30) (QREFELT $ 31))
            . #9#)
      (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 17)) . #9#)
           (LETT #4# (SPADCALL |y| (QREFELT $ 18)) . #9#) (LETT |ei| NIL . #9#)
           (LETT #3# |rowList| . #9#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |ei| (CAR #3#) . #9#) NIL)
                 (> |i| #4#))
             (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 19)) . #9#)
                  (LETT #2# (SPADCALL |y| (QREFELT $ 20)) . #9#)
                  (LETT |ej| NIL . #9#) (LETT #1# |colList| . #9#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#) . #9#) NIL)
                        (> |j| #2#))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |y| |i| |j|
                              (SPADCALL |x| |ei| |ej| (QREFELT $ 22))
                              (QREFELT $ 33))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #9#)) . #9#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1) . #9#)) . #9#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |y|))))) 

(DEFUN |MATCAT-;setelt;S2L2S;32| (|x| |rowList| |colList| |y| $)
  (PROG (#1=#:G569 |ej| #2=#:G570 |j| #3=#:G567 |ei| #4=#:G568 |i| #5=#:G558
         #6=#:G566 #7=#:G555 #8=#:G565)
    (RETURN
     (SEQ
      (SEQ
       (EXIT
        (SEQ (LETT |ei| NIL . #9=(|MATCAT-;setelt;S2L2S;32|))
             (LETT #8# |rowList| . #9#) G190
             (COND
              ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#) . #9#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((OR (< |ei| (SPADCALL |x| (QREFELT $ 17)))
                     (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 18))
                               (QREFELT $ 79)))
                 (PROGN
                  (LETT #7# (|error| "setelt: index out of range") . #9#)
                  (GO #7#))))))
             (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL)))
       #7# (EXIT #7#))
      (SEQ
       (EXIT
        (SEQ (LETT |ej| NIL . #9#) (LETT #6# |colList| . #9#) G190
             (COND
              ((OR (ATOM #6#) (PROGN (LETT |ej| (CAR #6#) . #9#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((OR (< |ej| (SPADCALL |x| (QREFELT $ 19)))
                     (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 20))
                               (QREFELT $ 79)))
                 (PROGN
                  (LETT #5# (|error| "setelt: index out of range") . #9#)
                  (GO #5#))))))
             (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL)))
       #5# (EXIT #5#))
      (COND
       ((OR
         (SPADCALL (LENGTH |rowList|) (SPADCALL |y| (QREFELT $ 11))
                   (QREFELT $ 21))
         (SPADCALL (LENGTH |colList|) (SPADCALL |y| (QREFELT $ 12))
                   (QREFELT $ 21)))
        (EXIT (|error| "setelt: matrix has bad dimensions"))))
      (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 17)) . #9#)
           (LETT #4# (SPADCALL |y| (QREFELT $ 18)) . #9#) (LETT |ei| NIL . #9#)
           (LETT #3# |rowList| . #9#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |ei| (CAR #3#) . #9#) NIL)
                 (> |i| #4#))
             (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 19)) . #9#)
                  (LETT #2# (SPADCALL |y| (QREFELT $ 20)) . #9#)
                  (LETT |ej| NIL . #9#) (LETT #1# |colList| . #9#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#) . #9#) NIL)
                        (> |j| #2#))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |x| |ei| |ej|
                              (SPADCALL |y| |i| |j| (QREFELT $ 22))
                              (QREFELT $ 33))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #9#)) . #9#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1) . #9#)) . #9#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |y|))))) 

(DEFUN |MATCAT-;subMatrix;S4IS;33| (|x| |i1| |i2| |j1| |j2| $)
  (PROG (#1=#:G580 |j| |l| #2=#:G579 |i| |k| |y| |cols| |rows|)
    (RETURN
     (SEQ
      (COND ((< |i2| |i1|) (|error| "subMatrix: bad row indices"))
            ((< |j2| |j1|) (|error| "subMatrix: bad column indices"))
            ('T
             (COND
              ((OR (< |i1| (SPADCALL |x| (QREFELT $ 17)))
                   (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 18))
                             (QREFELT $ 79)))
               (|error| "subMatrix: index out of range"))
              ((OR (< |j1| (SPADCALL |x| (QREFELT $ 19)))
                   (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 20))
                             (QREFELT $ 79)))
               (|error| "subMatrix: index out of range"))
              ('T
               (SEQ
                (LETT |rows| (+ (- |i2| |i1|) 1)
                      . #3=(|MATCAT-;subMatrix;S4IS;33|))
                (LETT |cols| (+ (- |j2| |j1|) 1) . #3#)
                (LETT |y|
                      (SPADCALL |rows| |cols| (|spadConstant| $ 30)
                                (QREFELT $ 31))
                      . #3#)
                (SEQ (LETT |k| |i1| . #3#)
                     (LETT |i| (SPADCALL |y| (QREFELT $ 17)) . #3#)
                     (LETT #2# (SPADCALL |y| (QREFELT $ 18)) . #3#) G190
                     (COND ((OR (> |i| #2#) (> |k| |i2|)) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |l| |j1| . #3#)
                            (LETT |j| (SPADCALL |y| (QREFELT $ 19)) . #3#)
                            (LETT #1# (SPADCALL |y| (QREFELT $ 20)) . #3#) G190
                            (COND ((OR (> |j| #1#) (> |l| |j2|)) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |y| |i| |j|
                                        (SPADCALL |x| |k| |l| (QREFELT $ 22))
                                        (QREFELT $ 33))))
                            (LETT |j|
                                  (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #3#))
                                  . #3#)
                            (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#))
                           . #3#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT |y|)))))))))) 

(DEFUN |MATCAT-;setsubMatrix!;S2I2S;34| (|x| |i1| |j1| |y| $)
  (PROG (#1=#:G590 |j| |l| #2=#:G589 |i| |k| |j2| |i2|)
    (RETURN
     (SEQ
      (LETT |i2| (- (+ |i1| (SPADCALL |y| (QREFELT $ 11))) 1)
            . #3=(|MATCAT-;setsubMatrix!;S2I2S;34|))
      (LETT |j2| (- (+ |j1| (SPADCALL |y| (QREFELT $ 12))) 1) . #3#)
      (COND
       ((OR (< |i1| (SPADCALL |x| (QREFELT $ 17)))
            (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 79)))
        (EXIT
         (|error|
          "setsubMatrix!: inserted matrix too big, use subMatrix to restrict it"))))
      (COND
       ((OR (< |j1| (SPADCALL |x| (QREFELT $ 19)))
            (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 79)))
        (EXIT
         (|error|
          "setsubMatrix!: inserted matrix too big, use subMatrix to restrict it"))))
      (SEQ (LETT |k| |i1| . #3#) (LETT |i| (SPADCALL |y| (QREFELT $ 17)) . #3#)
           (LETT #2# (SPADCALL |y| (QREFELT $ 18)) . #3#) G190
           (COND ((OR (> |i| #2#) (> |k| |i2|)) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |l| |j1| . #3#)
                  (LETT |j| (SPADCALL |y| (QREFELT $ 19)) . #3#)
                  (LETT #1# (SPADCALL |y| (QREFELT $ 20)) . #3#) G190
                  (COND ((OR (> |j| #1#) (> |l| |j2|)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |x| |k| |l| (SPADCALL |y| |i| |j| (QREFELT $ 22))
                              (QREFELT $ 33))))
                  (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #3#)) . #3#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |MATCAT-;+;3S;35| (|x| |y| $)
  (PROG (#1=#:G598 |j| #2=#:G597 |i| |ans| |c| |r|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (SPADCALL
          (LETT |r| (SPADCALL |x| (QREFELT $ 11)) . #3=(|MATCAT-;+;3S;35|))
          (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 25))
         (SPADCALL (LETT |c| (SPADCALL |x| (QREFELT $ 12)) . #3#)
                   (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 25)))
        (|error| "can't add matrices of different dimensions"))
       ('T
        (SEQ
         (LETT |ans| (SPADCALL |r| |c| (|spadConstant| $ 30) (QREFELT $ 31))
               . #3#)
         (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #3#)
              (LETT #2# (SPADCALL |x| (QREFELT $ 18)) . #3#) G190
              (COND ((> |i| #2#) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #3#)
                     (LETT #1# (SPADCALL |x| (QREFELT $ 20)) . #3#) G190
                     (COND ((> |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |ans| |i| |j|
                                 (SPADCALL
                                  (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                  (SPADCALL |y| |i| |j| (QREFELT $ 22))
                                  (QREFELT $ 59))
                                 (QREFELT $ 33))))
                     (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;-;3S;36| (|x| |y| $)
  (PROG (#1=#:G606 |j| #2=#:G605 |i| |ans| |c| |r|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (SPADCALL
          (LETT |r| (SPADCALL |x| (QREFELT $ 11)) . #3=(|MATCAT-;-;3S;36|))
          (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 25))
         (SPADCALL (LETT |c| (SPADCALL |x| (QREFELT $ 12)) . #3#)
                   (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 25)))
        (|error| "can't subtract matrices of different dimensions"))
       ('T
        (SEQ
         (LETT |ans| (SPADCALL |r| |c| (|spadConstant| $ 30) (QREFELT $ 31))
               . #3#)
         (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #3#)
              (LETT #2# (SPADCALL |x| (QREFELT $ 18)) . #3#) G190
              (COND ((> |i| #2#) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #3#)
                     (LETT #1# (SPADCALL |x| (QREFELT $ 20)) . #3#) G190
                     (COND ((> |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |ans| |i| |j|
                                 (SPADCALL
                                  (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                  (SPADCALL |y| |i| |j| (QREFELT $ 22))
                                  (QREFELT $ 88))
                                 (QREFELT $ 33))))
                     (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;-;2S;37| (|x| $) (SPADCALL (ELT $ 28) |x| (QREFELT $ 91))) 

(DEFUN |MATCAT-;*;I2S;38| (|m| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|MATCAT-;*;I2S;38!0| (VECTOR $ |m|)) |x|
               (QREFELT $ 91))))) 

(DEFUN |MATCAT-;*;I2S;38!0| (|r1| $$)
  (PROG (|m| $)
    (LETT |m| (QREFELT $$ 1) . #1=(|MATCAT-;*;I2S;38|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |m| |r1| (QREFELT $ 93)))))) 

(DEFUN |MATCAT-;*;R2S;39| (|a| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|MATCAT-;*;R2S;39!0| (VECTOR $ |a|)) |x|
               (QREFELT $ 91))))) 

(DEFUN |MATCAT-;*;R2S;39!0| (|r1| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1) . #1=(|MATCAT-;*;R2S;39|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a| |r1| (QREFELT $ 44)))))) 

(DEFUN |MATCAT-;*;SRS;40| (|x| |a| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|MATCAT-;*;SRS;40!0| (VECTOR $ |a|)) |x|
               (QREFELT $ 91))))) 

(DEFUN |MATCAT-;*;SRS;40!0| (|r1| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1) . #1=(|MATCAT-;*;SRS;40|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |a| (QREFELT $ 44)))))) 

(DEFUN |MATCAT-;*;3S;41| (|x| |y| $)
  (PROG (|entry| |sum| #1=#:G624 |k| #2=#:G625 |l| #3=#:G623 |j| #4=#:G622 |i|
         |ans|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |x| (QREFELT $ 12)) (SPADCALL |y| (QREFELT $ 11))
                  (QREFELT $ 25))
        (|error| "can't multiply matrices of incompatible dimensions"))
       ('T
        (SEQ
         (LETT |ans|
               (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                         (SPADCALL |y| (QREFELT $ 12)) (|spadConstant| $ 30)
                         (QREFELT $ 31))
               . #5=(|MATCAT-;*;3S;41|))
         (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #5#)
              (LETT #4# (SPADCALL |x| (QREFELT $ 18)) . #5#) G190
              (COND ((> |i| #4#) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 19)) . #5#)
                     (LETT #3# (SPADCALL |y| (QREFELT $ 20)) . #5#) G190
                     (COND ((> |j| #3#) (GO G191)))
                     (SEQ
                      (LETT |entry|
                            (SEQ (LETT |sum| (|spadConstant| $ 30) . #5#)
                                 (SEQ
                                  (LETT |l| (SPADCALL |x| (QREFELT $ 19))
                                        . #5#)
                                  (LETT #2# (SPADCALL |x| (QREFELT $ 20))
                                        . #5#)
                                  (LETT |k| (SPADCALL |y| (QREFELT $ 17))
                                        . #5#)
                                  (LETT #1# (SPADCALL |y| (QREFELT $ 18))
                                        . #5#)
                                  G190
                                  (COND
                                   ((OR (> |k| #1#) (> |l| #2#)) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |sum|
                                          (SPADCALL |sum|
                                                    (SPADCALL
                                                     (SPADCALL |x| |i| |l|
                                                               (QREFELT $ 22))
                                                     (SPADCALL |y| |k| |j|
                                                               (QREFELT $ 22))
                                                     (QREFELT $ 44))
                                                    (QREFELT $ 59))
                                          . #5#)))
                                  (LETT |k|
                                        (PROG1 (+ |k| 1)
                                          (LETT |l| (+ |l| 1) . #5#))
                                        . #5#)
                                  (GO G190) G191 (EXIT NIL))
                                 (EXIT |sum|))
                            . #5#)
                      (EXIT (SPADCALL |ans| |i| |j| |entry| (QREFELT $ 33))))
                     (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;positivePower;SIS;42| (|x| |n| $)
  (PROG (|y|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 1) |x|)
            ((ODDP |n|)
             (SPADCALL |x| (SPADCALL |x| (- |n| 1) (QREFELT $ 98))
                       (QREFELT $ 99)))
            ('T
             (SEQ
              (LETT |y| (SPADCALL |x| (QUOTIENT2 |n| 2) (QREFELT $ 98))
                    |MATCAT-;positivePower;SIS;42|)
              (EXIT (SPADCALL |y| |y| (QREFELT $ 99)))))))))) 

(DEFUN |MATCAT-;^;SNniS;43| (|x| |n| $)
  (PROG (|nn|)
    (RETURN
     (COND
      ((NULL
        (EQL (LETT |nn| (SPADCALL |x| (QREFELT $ 11)) |MATCAT-;^;SNniS;43|)
             (SPADCALL |x| (QREFELT $ 12))))
       (|error| "^: matrix must be square"))
      ('T
       (COND
        ((ZEROP |n|) (SPADCALL |nn| (|spadConstant| $ 40) (QREFELT $ 101)))
        ('T (SPADCALL |x| |n| (QREFELT $ 98))))))))) 

(DEFUN |MATCAT-;*;S2Col;44| (|x| |v| $)
  (PROG (|sum| #1=#:G640 |j| #2=#:G641 |l| #3=#:G638 |i| #4=#:G639 |k| |w|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |x| (QREFELT $ 12)) (SPADCALL |v| (QREFELT $ 64))
                  (QREFELT $ 25))
        (|error| "can't multiply matrix A and vector v if #cols A ~= #v"))
       ('T
        (SEQ
         (LETT |w|
               (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (|spadConstant| $ 30)
                         (QREFELT $ 103))
               . #5=(|MATCAT-;*;S2Col;44|))
         (SEQ (LETT |k| (SPADCALL |w| (QREFELT $ 65)) . #5#)
              (LETT #4# (SPADCALL |w| (QREFELT $ 66)) . #5#)
              (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #5#)
              (LETT #3# (SPADCALL |x| (QREFELT $ 18)) . #5#) G190
              (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
              (SEQ
               (EXIT
                (SPADCALL |w| |k|
                          (SEQ (LETT |sum| (|spadConstant| $ 30) . #5#)
                               (SEQ
                                (LETT |l| (SPADCALL |v| (QREFELT $ 65)) . #5#)
                                (LETT #2# (SPADCALL |v| (QREFELT $ 66)) . #5#)
                                (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #5#)
                                (LETT #1# (SPADCALL |x| (QREFELT $ 20)) . #5#)
                                G190
                                (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |sum|
                                        (SPADCALL |sum|
                                                  (SPADCALL
                                                   (SPADCALL |x| |i| |j|
                                                             (QREFELT $ 22))
                                                   (SPADCALL |v| |l|
                                                             (QREFELT $ 104))
                                                   (QREFELT $ 44))
                                                  (QREFELT $ 59))
                                        . #5#)))
                                (LETT |j|
                                      (PROG1 (+ |j| 1)
                                        (LETT |l| (+ |l| 1) . #5#))
                                      . #5#)
                                (GO G190) G191 (EXIT NIL))
                               (EXIT |sum|))
                          (QREFELT $ 105))))
              (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #5#)) . #5#)
              (GO G190) G191 (EXIT NIL))
         (EXIT |w|)))))))) 

(DEFUN |MATCAT-;*;RowSRow;45| (|v| |x| $)
  (PROG (|sum| #1=#:G650 |i| #2=#:G651 |l| #3=#:G648 |j| #4=#:G649 |k| |w|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |v| (QREFELT $ 69))
                  (QREFELT $ 25))
        (|error| "can't multiply vector v and matrix A if #rows A ~= #v"))
       ('T
        (SEQ
         (LETT |w|
               (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (|spadConstant| $ 30)
                         (QREFELT $ 107))
               . #5=(|MATCAT-;*;RowSRow;45|))
         (SEQ (LETT |k| (SPADCALL |w| (QREFELT $ 70)) . #5#)
              (LETT #4# (SPADCALL |w| (QREFELT $ 71)) . #5#)
              (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #5#)
              (LETT #3# (SPADCALL |x| (QREFELT $ 20)) . #5#) G190
              (COND ((OR (> |j| #3#) (> |k| #4#)) (GO G191)))
              (SEQ
               (EXIT
                (SPADCALL |w| |k|
                          (SEQ (LETT |sum| (|spadConstant| $ 30) . #5#)
                               (SEQ
                                (LETT |l| (SPADCALL |v| (QREFELT $ 70)) . #5#)
                                (LETT #2# (SPADCALL |v| (QREFELT $ 71)) . #5#)
                                (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #5#)
                                (LETT #1# (SPADCALL |x| (QREFELT $ 18)) . #5#)
                                G190
                                (COND ((OR (> |i| #1#) (> |l| #2#)) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |sum|
                                        (SPADCALL |sum|
                                                  (SPADCALL
                                                   (SPADCALL |x| |i| |j|
                                                             (QREFELT $ 22))
                                                   (SPADCALL |v| |l|
                                                             (QREFELT $ 108))
                                                   (QREFELT $ 44))
                                                  (QREFELT $ 59))
                                        . #5#)))
                                (LETT |i|
                                      (PROG1 (+ |i| 1)
                                        (LETT |l| (+ |l| 1) . #5#))
                                      . #5#)
                                (GO G190) G191 (EXIT NIL))
                               (EXIT |sum|))
                          (QREFELT $ 109))))
              (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #5#)) . #5#)
              (GO G190) G191 (EXIT NIL))
         (EXIT |w|)))))))) 

(DEFUN |MATCAT-;columnSpace;SL;46| (M $)
  (PROG (|indRow| |basis| |k| |m| |n| M2)
    (RETURN
     (SEQ
      (LETT M2 (SPADCALL M (QREFELT $ 111)) . #1=(|MATCAT-;columnSpace;SL;46|))
      (LETT |basis| NIL . #1#) (LETT |n| (SPADCALL M (QREFELT $ 12)) . #1#)
      (LETT |m| (SPADCALL M (QREFELT $ 11)) . #1#) (LETT |indRow| 1 . #1#)
      (SEQ (LETT |k| 1 . #1#) G190
           (COND
            ((OR (|greater_SI| |k| |n|)
                 (NULL (SPADCALL |indRow| |m| (QREFELT $ 112))))
             (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((NULL
                (SPADCALL (SPADCALL M2 |indRow| |k| (QREFELT $ 113))
                          (QREFELT $ 23)))
               (SEQ
                (LETT |basis| (CONS (SPADCALL M |k| (QREFELT $ 114)) |basis|)
                      . #1#)
                (EXIT (LETT |indRow| (+ |indRow| 1) . #1#)))))))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (NREVERSE |basis|)))))) 

(DEFUN |MATCAT-;B0| (|n| $)
  (PROG (|j| #1=#:G667 |i| #2=#:G666)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|MATCAT-;B0|))
        (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS
                      (PROGN
                       (LETT #1# NIL . #3#)
                       (SEQ (LETT |j| 1 . #3#) G190
                            (COND ((|greater_SI| |j| |n|) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #1#
                                    (CONS
                                     (COND
                                      ((EQL |i| (+ |j| 1))
                                       (COND
                                        ((ODDP |j|)
                                         (SPADCALL (|spadConstant| $ 40)
                                                   (QREFELT $ 28)))
                                        ((EQL |i| (- |j| 1))
                                         (COND
                                          ((ODDP |i|) (|spadConstant| $ 40))
                                          ('T (|spadConstant| $ 30))))
                                        ('T (|spadConstant| $ 30))))
                                      ((EQL |i| (- |j| 1))
                                       (COND ((ODDP |i|) (|spadConstant| $ 40))
                                             ('T (|spadConstant| $ 30))))
                                      ('T (|spadConstant| $ 30)))
                                     #1#)
                                    . #3#)))
                            (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #1#))))
                      #2#)
                     . #3#)))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
             (EXIT (NREVERSE #2#))))
       (QREFELT $ 117)))))) 

(DEFUN |MATCAT-;PfChar| (A $)
  (PROG (|res| #1=#:G679 |e| #2=#:G680 |k| |c| |i| #3=#:G678 |j| |g| C B
         #4=#:G668 |d| |p| |s| |r| M |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL A (QREFELT $ 11)) . #5=(|MATCAT-;PfChar|))
          (EXIT
           (COND
            ((EQL |n| 2)
             (SPADCALL (SPADCALL (|spadConstant| $ 40) 2 (QREFELT $ 119))
                       (SPADCALL (SPADCALL A 1 2 (QREFELT $ 22))
                                 (QREFELT $ 121))
                       (QREFELT $ 122)))
            ('T
             (SEQ (LETT M (SPADCALL A 3 |n| 3 |n| (QREFELT $ 123)) . #5#)
                  (LETT |r| (SPADCALL A 1 1 3 |n| (QREFELT $ 123)) . #5#)
                  (LETT |s| (SPADCALL A 3 |n| 2 2 (QREFELT $ 123)) . #5#)
                  (LETT |p| (|MATCAT-;PfChar| M $) . #5#)
                  (LETT |d| (SPADCALL |p| (QREFELT $ 124)) . #5#)
                  (LETT B
                        (|MATCAT-;B0|
                         (PROG1 (LETT #4# (- |n| 2) . #5#)
                           (|check_subtype| (> #4# 0) '(|PositiveInteger|)
                                            #4#))
                         $)
                        . #5#)
                  (LETT C (SPADCALL |r| B (QREFELT $ 99)) . #5#)
                  (LETT |g|
                        (LIST
                         (SPADCALL (SPADCALL C |s| (QREFELT $ 99)) 1 1
                                   (QREFELT $ 22))
                         (SPADCALL A 1 2 (QREFELT $ 22)) (|spadConstant| $ 40))
                        . #5#)
                  (COND
                   ((>= |d| 4)
                    (SEQ (LETT B (SPADCALL M B (QREFELT $ 99)) . #5#)
                         (EXIT
                          (SEQ (LETT |i| 4 . #5#) G190
                               (COND ((> |i| |d|) (GO G191)))
                               (SEQ
                                (LETT C (SPADCALL C B (QREFELT $ 99)) . #5#)
                                (EXIT
                                 (LETT |g|
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL C |s| (QREFELT $ 99)) 1 1
                                         (QREFELT $ 22))
                                        |g|)
                                       . #5#)))
                               (LETT |i| (+ |i| 2) . #5#) (GO G190) G191
                               (EXIT NIL))))))
                  (LETT |g| (NREVERSE |g|) . #5#)
                  (LETT |res| (|spadConstant| $ 125) . #5#)
                  (SEQ (LETT |j| 2 . #5#) (LETT #3# (+ |d| 2) . #5#)
                       (LETT |i| 0 . #5#) G190
                       (COND
                        ((OR (> |i| |d|) (|greater_SI| |j| #3#)) (GO G191)))
                       (SEQ (LETT |c| (SPADCALL |p| |i| (QREFELT $ 126)) . #5#)
                            (EXIT
                             (SEQ (LETT |k| 2 . #5#) (LETT #2# (- |d|) . #5#)
                                  (LETT |e| NIL . #5#)
                                  (LETT #1# (SPADCALL |g| |j| (QREFELT $ 127))
                                        . #5#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |e| (CAR #1#) . #5#) NIL)
                                        (< |k| #2#))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |res|
                                          (SPADCALL |res|
                                                    (SPADCALL
                                                     (SPADCALL |c| |e|
                                                               (QREFELT $ 44))
                                                     (+ |k| |i|)
                                                     (QREFELT $ 119))
                                                    (QREFELT $ 122))
                                          . #5#)))
                                  (LETT #1#
                                        (PROG1 (CDR #1#)
                                          (LETT |k| (+ |k| -2) . #5#))
                                        . #5#)
                                  (GO G190) G191 (EXIT NIL))))
                       (LETT |i|
                             (PROG1 (+ |i| 2) (LETT |j| (|inc_SI| |j|) . #5#))
                             . #5#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))))) 

(DEFUN |MATCAT-;Pfaffian;SR;49| (A $)
  (COND
   ((SPADCALL A (QREFELT $ 128))
    (COND ((ODDP (SPADCALL A (QREFELT $ 11))) (|spadConstant| $ 30))
          (#1='T
           (SPADCALL (|MATCAT-;PfChar| A $) (|spadConstant| $ 30)
                     (QREFELT $ 129)))))
   (#1# (|error| "Pfaffian: only defined for antisymmetric square matrices!")))) 

(DEFUN |MATCAT-;exquo;SRU;50| (|x| |a| $)
  (PROG (|entry| #1=#:G695 |r| #2=#:G697 |j| #3=#:G696 |i| |ans|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ans|
              (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                        (SPADCALL |x| (QREFELT $ 12)) (|spadConstant| $ 30)
                        (QREFELT $ 31))
              . #4=(|MATCAT-;exquo;SRU;50|))
        (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #4#)
             (LETT #3# (SPADCALL |x| (QREFELT $ 18)) . #4#) G190
             (COND ((> |i| #3#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #4#)
                    (LETT #2# (SPADCALL |x| (QREFELT $ 20)) . #4#) G190
                    (COND ((> |j| #2#) (GO G191)))
                    (SEQ
                     (LETT |entry|
                           (SEQ
                            (LETT |r|
                                  (SPADCALL
                                   (SPADCALL |x| |i| |j| (QREFELT $ 22)) |a|
                                   (QREFELT $ 132))
                                  . #4#)
                            (EXIT
                             (COND
                              ((QEQCAR |r| 1)
                               (PROGN
                                (LETT #1# (CONS 1 "failed") . #4#)
                                (GO #1#)))
                              ('T (QCDR |r|)))))
                           . #4#)
                     (EXIT (SPADCALL |ans| |i| |j| |entry| (QREFELT $ 33))))
                    (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))))
             (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |ans|))))
      #1# (EXIT #1#))))) 

(DEFUN |MATCAT-;/;SRS;51| (|x| |r| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|MATCAT-;/;SRS;51!0| (VECTOR $ |r|)) |x|
               (QREFELT $ 91))))) 

(DEFUN |MATCAT-;/;SRS;51!0| (|r1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|MATCAT-;/;SRS;51|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |r| (QREFELT $ 134)))))) 

(DEFUN |MATCAT-;^;SIS;52| (|x| |n| $)
  (PROG (|xInv| |nn|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (EQL
          (LETT |nn| (SPADCALL |x| (QREFELT $ 11)) . #1=(|MATCAT-;^;SIS;52|))
          (SPADCALL |x| (QREFELT $ 12))))
        (|error| "^: matrix must be square"))
       ('T
        (COND
         ((ZEROP |n|) (SPADCALL |nn| (|spadConstant| $ 40) (QREFELT $ 101)))
         ((SPADCALL |n| (QREFELT $ 136)) (SPADCALL |x| |n| (QREFELT $ 98)))
         (#2='T
          (SEQ (LETT |xInv| (SPADCALL |x| (QREFELT $ 137)) . #1#)
               (EXIT
                (COND
                 ((QEQCAR |xInv| 1) (|error| "^: matrix must be invertible"))
                 (#2#
                  (SPADCALL (QCDR |xInv|) (- |n|) (QREFELT $ 98)))))))))))))) 

(DEFUN |MatrixCategory&| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MatrixCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|MatrixCategory&| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 140) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|EuclideanDomain|))
                                          (|HasCategory| |#2| '(|Field|))
                                          (|HasCategory| |#2|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#2| '(|Monoid|))
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 6)
        (QSETREFV $ 29
                  (CONS (|dispatchFunction| |MATCAT-;antisymmetric?;SB;4|)
                        $))))
      (QSETREFV $ 41
                (COND
                 ((|HasCategory| |#2| '(|SemiRing|))
                  (CONS 0 (|spadConstant| $ 40)))
                 ('T (CONS 1 "one"))))
      (COND
       ((|domainEqual| |#1| (|Matrix| |#2|))
        (PROGN
         (QSETREFV $ 53
                   (CONS
                    (|dispatchFunction|
                     |MATCAT-;kronecker_prod1;SILL2NniUV;10|)
                    $))
         (QSETREFV $ 55
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;LS;11|)
                         $))
         (QSETREFV $ 57
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;3S;12|)
                         $))
         (QSETREFV $ 60
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;13|) $))
         (QSETREFV $ 62
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;14|) $))
         (QSETREFV $ 63
                   (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;15|)
                         $))))
       ('T
        (PROGN
         (QSETREFV $ 53
                   (CONS
                    (|dispatchFunction|
                     |MATCAT-;kronecker_prod1;SILL2NniUV;16|)
                    $))
         (QSETREFV $ 55
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;LS;17|)
                         $))
         (QSETREFV $ 57
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;3S;18|)
                         $))
         (QSETREFV $ 60
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;19|) $))
         (QSETREFV $ 62
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;20|) $))
         (QSETREFV $ 63
                   (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;21|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 6)
        (PROGN
         (QSETREFV $ 89 (CONS (|dispatchFunction| |MATCAT-;-;3S;36|) $))
         (QSETREFV $ 92 (CONS (|dispatchFunction| |MATCAT-;-;2S;37|) $))
         (QSETREFV $ 94 (CONS (|dispatchFunction| |MATCAT-;*;I2S;38|) $)))))
      (COND
       ((|testBitVector| |pv$| 5)
        (QSETREFV $ 102 (CONS (|dispatchFunction| |MATCAT-;^;SNniS;43|) $))))
      (COND
       ((|HasCategory| |#4| '(|shallowlyMutable|))
        (QSETREFV $ 106 (CONS (|dispatchFunction| |MATCAT-;*;S2Col;44|) $))))
      (COND
       ((|HasCategory| |#3| '(|shallowlyMutable|))
        (QSETREFV $ 110 (CONS (|dispatchFunction| |MATCAT-;*;RowSRow;45|) $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (QSETREFV $ 116
                  (CONS (|dispatchFunction| |MATCAT-;columnSpace;SL;46|) $))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 130
                   (CONS (|dispatchFunction| |MATCAT-;Pfaffian;SR;49|) $)))))
      (COND
       ((|testBitVector| |pv$| 4)
        (QSETREFV $ 133 (CONS (|dispatchFunction| |MATCAT-;exquo;SRU;50|) $))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 135 (CONS (|dispatchFunction| |MATCAT-;/;SRS;51|) $))
         (QSETREFV $ 138 (CONS (|dispatchFunction| |MATCAT-;^;SIS;52|) $)))))
      $)))) 

(MAKEPROP '|MatrixCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|NonNegativeInteger|)
              (0 . |nrows|) (5 . |ncols|) (|Boolean|) |MATCAT-;square?;SB;1|
              (10 . |square?|) (|Integer|) (15 . |minRowIndex|)
              (20 . |maxRowIndex|) (25 . |minColIndex|) (30 . |maxColIndex|)
              (35 . ~=) (41 . |qelt|) (48 . |zero?|) |MATCAT-;diagonal?;SB;2|
              (53 . ~=) (59 . ~=) |MATCAT-;symmetric?;SB;3| (65 . -)
              (70 . |antisymmetric?|) (75 . |Zero|) (79 . |new|)
              |MATCAT-;zero;2NniS;5| (86 . |qsetelt!|) (|List| 38)
              |MATCAT-;matrix;LS;6| (94 . |zero|)
              |MATCAT-;scalarMatrix;NniRS;7| (|List| 7)
              |MATCAT-;diagonalMatrix;LS;8| (100 . |One|) '|maybe_1|
              (|List| 10) (104 . |elt|) (110 . *) (116 . *)
              (|Mapping| 10 10 10) (122 . |reduce|) (|Void|) (|List| 42)
              (|List| $) (|Union| 7 '"one") (128 . |kronecker_prod1|)
              (139 . |kronecker_prod1|) (150 . |copy|)
              (155 . |kroneckerProduct|) (160 . |kroneckerProduct|)
              (165 . |kroneckerProduct|) (171 . |reduce|) (178 . +)
              (184 . |kroneckerSum|) (189 . |kroneckerSum|)
              (194 . |kroneckerSum|) (200 . |diagonalMatrix|) (205 . |#|)
              (210 . |minIndex|) (215 . |maxIndex|) (220 . |qelt|)
              |MATCAT-;coerce;ColS;22| (226 . |#|) (231 . |minIndex|)
              (236 . |maxIndex|) (241 . |qelt|) |MATCAT-;transpose;RowS;23|
              |MATCAT-;transpose;2S;24| |MATCAT-;squareTop;2S;25|
              |MATCAT-;horizConcat;3S;26| |MATCAT-;vertConcat;3S;27|
              |MATCAT-;listOfLists;SL;28| (247 . >) |MATCAT-;swapRows!;S2IS;29|
              |MATCAT-;swapColumns!;S2IS;30| (|List| 16) |MATCAT-;elt;S2LS;31|
              |MATCAT-;setelt;S2L2S;32| |MATCAT-;subMatrix;S4IS;33|
              |MATCAT-;setsubMatrix!;S2I2S;34| |MATCAT-;+;3S;35| (253 . -)
              (259 . -) (|Mapping| 7 7) (265 . |map|) (271 . -) (276 . *)
              (282 . *) |MATCAT-;*;R2S;39| |MATCAT-;*;SRS;40| |MATCAT-;*;3S;41|
              (288 . |positivePower|) (294 . *) |MATCAT-;positivePower;SIS;42|
              (300 . |scalarMatrix|) (306 . ^) (312 . |new|) (318 . |elt|)
              (324 . |setelt|) (331 . *) (337 . |new|) (343 . |elt|)
              (349 . |setelt|) (356 . *) (362 . |rowEchelon|) (367 . <=)
              (373 . |elt|) (380 . |column|) (|List| 9) (386 . |columnSpace|)
              (391 . |matrix|) (|SparseUnivariatePolynomial| 7)
              (396 . |monomial|) (402 . |One|) (406 . |coerce|) (411 . +)
              (417 . |subMatrix|) (426 . |degree|) (431 . |Zero|)
              (435 . |coefficient|) (441 . |first|) (447 . |antisymmetric?|)
              (452 . |elt|) (458 . |Pfaffian|) (|Union| $ '"failed")
              (463 . |exquo|) (469 . |exquo|) (475 . /) (481 . /)
              (487 . |positive?|) (492 . |inverse|) (497 . ^) (|OutputForm|))
           '#(|zero| 503 |vertConcat| 509 |transpose| 515 |symmetric?| 525
              |swapRows!| 530 |swapColumns!| 537 |subMatrix| 544 |squareTop|
              553 |square?| 558 |setsubMatrix!| 563 |setelt| 571 |scalarMatrix|
              579 |positivePower| 585 |matrix| 591 |listOfLists| 596
              |kronecker_prod1| 601 |kroneckerSum| 612 |kroneckerProduct| 623
              |horizConcat| 634 |exquo| 640 |elt| 646 |diagonalMatrix| 653
              |diagonal?| 663 |columnSpace| 668 |coerce| 673 |antisymmetric?|
              678 ^ 683 |Pfaffian| 695 / 700 - 706 + 717 * 723)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 138
                                                 '(1 6 10 0 11 1 6 10 0 12 1 6
                                                   13 0 15 1 6 16 0 17 1 6 16 0
                                                   18 1 6 16 0 19 1 6 16 0 20 2
                                                   16 13 0 0 21 3 6 7 0 16 16
                                                   22 1 7 13 0 23 2 10 13 0 0
                                                   25 2 7 13 0 0 26 1 7 0 0 28
                                                   1 0 13 0 29 0 7 0 30 3 6 0
                                                   10 10 7 31 4 6 7 0 16 16 7
                                                   33 2 6 0 10 10 36 0 7 0 40 2
                                                   42 10 0 16 43 2 7 0 0 0 44 2
                                                   10 0 10 0 45 2 42 10 46 0 47
                                                   7 6 48 0 16 49 50 10 10 51
                                                   52 7 0 48 0 16 49 50 10 10
                                                   51 53 1 6 0 0 54 1 0 0 50 55
                                                   1 6 0 50 56 2 0 0 0 0 57 3
                                                   42 10 46 0 10 58 2 7 0 0 0
                                                   59 1 0 0 50 60 1 6 0 50 61 2
                                                   0 0 0 0 62 1 0 0 50 63 1 9
                                                   10 0 64 1 9 16 0 65 1 9 16 0
                                                   66 2 9 7 0 16 67 1 8 10 0 69
                                                   1 8 16 0 70 1 8 16 0 71 2 8
                                                   7 0 16 72 2 16 13 0 0 79 2 7
                                                   0 0 0 88 2 0 0 0 0 89 2 6 0
                                                   90 0 91 1 0 0 0 92 2 7 0 16
                                                   0 93 2 0 0 16 0 94 2 6 0 0
                                                   16 98 2 6 0 0 0 99 2 6 0 10
                                                   7 101 2 0 0 0 10 102 2 9 0
                                                   10 7 103 2 9 7 0 16 104 3 9
                                                   7 0 16 7 105 2 0 9 0 9 106 2
                                                   8 0 10 7 107 2 8 7 0 16 108
                                                   3 8 7 0 16 7 109 2 0 8 8 0
                                                   110 1 6 0 0 111 2 16 13 0 0
                                                   112 3 6 7 0 16 16 113 2 6 9
                                                   0 16 114 1 0 115 0 116 1 6 0
                                                   34 117 2 118 0 7 10 119 0
                                                   118 0 120 1 118 0 7 121 2
                                                   118 0 0 0 122 5 6 0 0 16 16
                                                   16 16 123 1 118 10 0 124 0
                                                   118 0 125 2 118 7 0 10 126 2
                                                   38 0 0 10 127 1 6 13 0 128 2
                                                   118 7 0 7 129 1 0 7 0 130 2
                                                   7 131 0 0 132 2 0 131 0 7
                                                   133 2 7 0 0 0 134 2 0 0 0 7
                                                   135 1 16 13 0 136 1 6 131 0
                                                   137 2 0 0 0 16 138 2 0 0 10
                                                   10 32 2 0 0 0 0 77 1 0 0 8
                                                   73 1 0 0 0 74 1 0 13 0 27 3
                                                   0 0 0 16 16 80 3 0 0 0 16 16
                                                   81 5 0 0 0 16 16 16 16 85 1
                                                   0 0 0 75 1 0 13 0 14 4 0 0 0
                                                   16 16 0 86 4 0 0 0 82 82 0
                                                   84 2 0 0 10 7 37 2 0 0 0 16
                                                   100 1 0 0 34 35 1 0 34 0 78
                                                   7 0 48 0 16 49 50 10 10 51
                                                   53 2 0 0 0 0 62 1 0 0 50 60
                                                   1 0 0 50 55 2 0 0 0 0 57 2 0
                                                   0 0 0 76 2 0 131 0 7 133 3 0
                                                   0 0 82 82 83 1 0 0 50 63 1 0
                                                   0 38 39 1 0 13 0 24 1 0 115
                                                   0 116 1 0 0 9 68 1 0 13 0 29
                                                   2 0 0 0 16 138 2 0 0 0 10
                                                   102 1 0 7 0 130 2 0 0 0 7
                                                   135 1 0 0 0 92 2 0 0 0 0 89
                                                   2 0 0 0 0 87 2 0 8 8 0 110 2
                                                   0 0 0 7 96 2 0 9 0 9 106 2 0
                                                   0 7 0 95 2 0 0 16 0 94 2 0 0
                                                   0 0 97)))))
           '|lookupComplete|)) 
