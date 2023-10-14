
(/VERSIONCHECK 2) 

(DEFUN |MATCAT-;square?;SB;1| (|x| $)
  (EQL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |x| (QREFELT $ 12)))) 

(DEFUN |MATCAT-;diagonal?;SB;2| (|x| $)
  (PROG (#1=#:G170 #2=#:G173 #3=#:G175 |j| #4=#:G174 |i|)
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
  (PROG (#1=#:G177 #2=#:G181 #3=#:G183 |j| #4=#:G182 |i| |mc| |mr| |nRows|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL
          (LETT |nRows| (SPADCALL |x| (QREFELT $ 11))
                . #5=(|MATCAT-;symmetric?;SB;3|))
          (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 21))
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
                               (QREFELT $ 25))
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
  (PROG (#1=#:G185 #2=#:G189 #3=#:G191 |j| #4=#:G190 |i| |mc| |mr| |nRows|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL
          (LETT |nRows| (SPADCALL |x| (QREFELT $ 11))
                . #5=(|MATCAT-;antisymmetric?;SB;4|))
          (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 21))
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
                                (QREFELT $ 27))
                               (QREFELT $ 25))
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
  (SPADCALL |rows| |cols| (|spadConstant| $ 29) (QREFELT $ 30))) 

(DEFUN |MATCAT-;matrix;LS;6| (|l| $)
  (PROG (#1=#:G203 |j| #2=#:G204 |r| #3=#:G201 |i| #4=#:G202 |ll| |ans| |rows|
         #5=#:G200 |cols|)
    (RETURN
     (SEQ
      (COND ((NULL |l|) (SPADCALL 0 0 (|spadConstant| $ 29) (QREFELT $ 30)))
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
                              ((SPADCALL |cols| (LENGTH |ll|) (QREFELT $ 32))
                               (|error| "matrix: rows of different lengths"))
                              ('T (LETT |rows| (+ |rows| 1) . #7#)))))
                           (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |ans|
                            (SPADCALL |rows| |cols| (|spadConstant| $ 29)
                                      (QREFELT $ 30))
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

(DEFUN |MATCAT-;matrix;2NniMS;7| (|n| |m| |f| $)
  (PROG (#1=#:G211 |j| #2=#:G210 |i| |mat|)
    (RETURN
     (SEQ
      (LETT |mat| (SPADCALL |n| |m| (|spadConstant| $ 29) (QREFELT $ 30))
            . #3=(|MATCAT-;matrix;2NniMS;7|))
      (SEQ (LETT |i| (SPADCALL |mat| (QREFELT $ 17)) . #3#)
           (LETT #2# (SPADCALL |mat| (QREFELT $ 18)) . #3#) G190
           (COND ((> |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| (SPADCALL |mat| (QREFELT $ 19)) . #3#)
                  (LETT #1# (SPADCALL |mat| (QREFELT $ 20)) . #3#) G190
                  (COND ((> |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |mat| |i| |j| (SPADCALL |i| |j| |f|)
                              (QREFELT $ 33))))
                  (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |mat|))))) 

(DEFUN |MATCAT-;scalarMatrix;NniRS;8| (|n| |r| $)
  (PROG (#1=#:G215 |i| #2=#:G216 |j| |ans|)
    (RETURN
     (SEQ
      (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 38))
            . #3=(|MATCAT-;scalarMatrix;NniRS;8|))
      (SEQ (LETT |j| (SPADCALL |ans| (QREFELT $ 19)) . #3#)
           (LETT #2# (SPADCALL |ans| (QREFELT $ 20)) . #3#)
           (LETT |i| (SPADCALL |ans| (QREFELT $ 17)) . #3#)
           (LETT #1# (SPADCALL |ans| (QREFELT $ 18)) . #3#) G190
           (COND ((OR (> |i| #1#) (> |j| #2#)) (GO G191)))
           (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT $ 33))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |MATCAT-;diagonalMatrix;LS;9| (|l| $)
  (PROG (#1=#:G220 |i| #2=#:G221 |j| #3=#:G222 |r| |ans| |n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |l|) . #4=(|MATCAT-;diagonalMatrix;LS;9|))
          (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 38)) . #4#)
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
  (PROG (#1=#:G229 |a| #2=#:G228)
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

(DEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;11|
       (|res| |k| |dl| |l| |r_off| |c_off| |mu| $)
  (PROG (|c_off1| |mm| |aij| |j| |i| |c_step| #1=#:G263 |rc| #2=#:G262 |r_step|
         #3=#:G261 #4=#:G260 |c_ind| |m| |a| |nc| |nr| |dp|)
    (RETURN
     (SEQ
      (LETT |dp| (|SPADfirst| |dl|)
            . #5=(|MATCAT-;kronecker_prod1;SILL2NniUV;11|))
      (LETT |nr| (SPADCALL |dp| 1 (QREFELT $ 45)) . #5#)
      (LETT |nc| (SPADCALL |dp| 2 (QREFELT $ 45)) . #5#)
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
                                                             (QREFELT $ 46))
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
                    (SPADCALL (ELT $ 47)
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
                                             (SPADCALL |rc| 1 (QREFELT $ 45))
                                             #4#)
                                            . #5#)))
                                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #4#))))
                              (QREFELT $ 49))
                    . #5#)
              (LETT |c_step|
                    (SPADCALL (ELT $ 47)
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
                                             (SPADCALL |rc| 2 (QREFELT $ 45))
                                             #2#)
                                            . #5#)))
                                    (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 49))
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
                                                          (QREFELT $ 46))))
                                         . #5#)
                                   (SPADCALL |res| (- |k| 1) |dl| |l| |r_off|
                                             |c_off1| (CONS 0 |mm|)
                                             (QREFELT $ 54))
                                   (EXIT
                                    (LETT |c_off1| (+ |c_off1| |c_step|)
                                          . #5#)))
                              (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (LETT |r_off| (+ |r_off| |r_step|) . #5#)))
                    (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                    (EXIT NIL))))))))))) 

(DEFUN |MATCAT-;kroneckerProduct;LS;12| (|l| $)
  (PROG (#1=#:G290 |a| |res| |nc| #2=#:G289 |rc| #3=#:G288 |nr| #4=#:G287
         #5=#:G286 |dl| |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #6=(|MATCAT-;kroneckerProduct;LS;12|))
          (EXIT
           (COND
            ((EQL |k| 0)
             (COND
              ((QEQCAR (QREFELT $ 43) 0)
               (MAKE_MATRIX1 1 1 (QCDR (QREFELT $ 43))))
              (#7='T (|error| "need 1"))))
            ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 56)))
            (#7#
             (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| $) . #6#)
                  (LETT |nr|
                        (SPADCALL (ELT $ 47)
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
                                                           (QREFELT $ 45))
                                                 #5#)
                                                . #6#)))
                                        (LETT #4# (CDR #4#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  (QREFELT $ 49))
                        . #6#)
                  (LETT |nc|
                        (SPADCALL (ELT $ 47)
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
                                                           (QREFELT $ 45))
                                                 #3#)
                                                . #6#)))
                                        (LETT #2# (CDR #2#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #3#))))
                                  (QREFELT $ 49))
                        . #6#)
                  (LETT |res| (SPADCALL |nr| |nc| (QREFELT $ 38)) . #6#)
                  (SEQ (LETT |a| NIL . #6#) (LETT #1# |l| . #6#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                   (QREFELT $ 54))))
                       (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))))) 

(DEFUN |MATCAT-;kroneckerProduct;3S;13| (|a| |b| $)
  (SPADCALL (LIST |a| |b|) (QREFELT $ 58))) 

(DEFUN |MATCAT-;kroneckerSum;LS;14| (|l| $)
  (PROG (|n0| |off0| |off_r| |ind_c| |vv| |j| |i| |m| |step0| |n2| |dl| |nr|
         #1=#:G326 |a| |res| |nrs| #2=#:G325 #3=#:G324 |nc| #4=#:G323 |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #5=(|MATCAT-;kroneckerSum;LS;14|))
          (EXIT
           (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT $ 38)))
                 ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 56)))
                 ('T
                  (SEQ (LETT |dl| NIL . #5#)
                       (SEQ (LETT |a| NIL . #5#) (LETT #4# |l| . #5#) G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |a| (CAR #4#) . #5#) NIL))
                              (GO G191)))
                            (SEQ (LETT |nr| (ANROWS |a|) . #5#)
                                 (LETT |nc| (ANCOLS |a|) . #5#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |nr| |nc| (QREFELT $ 32))
                                    (|error| "kroneckerSum: nonsquare matrix"))
                                   ('T (LETT |dl| (CONS |nr| |dl|) . #5#)))))
                            (LETT #4# (CDR #4#) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |dl| (NREVERSE |dl|) . #5#)
                       (LETT |nrs|
                             (SPADCALL (ELT $ 47)
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
                                       (QREFELT $ 49))
                             . #5#)
                       (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT $ 38)) . #5#)
                       (LETT |n0| 1 . #5#)
                       (SEQ (LETT |a| NIL . #5#) (LETT #1# |l| . #5#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |a| (CAR #1#) . #5#) NIL))
                              (GO G191)))
                            (SEQ (LETT |off0| 0 . #5#)
                                 (LETT |nr| (SPADCALL |dl| 1 (QREFELT $ 45))
                                       . #5#)
                                 (LETT |dl| (CDR |dl|) . #5#)
                                 (LETT |n2|
                                       (SPADCALL (ELT $ 47) |dl| 1
                                                 (QREFELT $ 60))
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
                                                                              61))
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

(DEFUN |MATCAT-;kroneckerSum;3S;15| (|a| |b| $)
  (SPADCALL (LIST |a| |b|) (QREFELT $ 63))) 

(DEFUN |MATCAT-;diagonalMatrix;LS;16| (|list| $)
  (PROG (|loC| |loR| |j| #1=#:G339 |l| |i| #2=#:G338 |k| |hiC| |hiR| #3=#:G337
         |mat| |ans| |cols| |rows| #4=#:G336)
    (RETURN
     (SEQ (LETT |rows| 0 . #5=(|MATCAT-;diagonalMatrix;LS;16|))
          (LETT |cols| 0 . #5#)
          (SEQ (LETT |mat| NIL . #5#) (LETT #4# |list| . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |mat| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |rows| (+ |rows| (ANROWS |mat|)) . #5#)
                    (EXIT (LETT |cols| (+ |cols| (ANCOLS |mat|)) . #5#)))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |ans| (SPADCALL |rows| |cols| (QREFELT $ 38)) . #5#)
          (LETT |loR| 1 . #5#) (LETT |loC| 1 . #5#)
          (SEQ (LETT |mat| NIL . #5#) (LETT #3# |list| . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |mat| (CAR #3#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |hiR| (- (+ |loR| (ANROWS |mat|)) 1) . #5#)
                    (LETT |hiC| (- (+ |loC| (ANROWS |mat|)) 1) . #5#)
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

(DEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;17|
       (|res| |k| |dl| |l| |r_off| |c_off| |mu| $)
  (PROG (|c_off1| |mm| |aij| |j| |i| |c_step| #1=#:G373 |rc| #2=#:G372 |r_step|
         #3=#:G371 #4=#:G370 |c_ind| |m| |a| |nc| |nr| |dp|)
    (RETURN
     (SEQ
      (LETT |dp| (|SPADfirst| |dl|)
            . #5=(|MATCAT-;kronecker_prod1;SILL2NniUV;17|))
      (LETT |nr| (SPADCALL |dp| 1 (QREFELT $ 45)) . #5#)
      (LETT |nc| (SPADCALL |dp| 2 (QREFELT $ 45)) . #5#)
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
                                                           (QREFELT $ 46))
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
                    (SPADCALL (ELT $ 47)
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
                                             (SPADCALL |rc| 1 (QREFELT $ 45))
                                             #4#)
                                            . #5#)))
                                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #4#))))
                              (QREFELT $ 49))
                    . #5#)
              (LETT |c_step|
                    (SPADCALL (ELT $ 47)
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
                                             (SPADCALL |rc| 2 (QREFELT $ 45))
                                             #2#)
                                            . #5#)))
                                    (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 49))
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
                                                      (QREFELT $ 46))))
                                     . #5#)
                               (SPADCALL |res| (- |k| 1) |dl| |l| |r_off|
                                         |c_off1| (CONS 0 |mm|) (QREFELT $ 54))
                               (EXIT
                                (LETT |c_off1| (+ |c_off1| |c_step|) . #5#)))
                              (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (LETT |r_off| (+ |r_off| |r_step|) . #5#)))
                    (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                    (EXIT NIL))))))))))) 

(DEFUN |MATCAT-;kroneckerProduct;LS;18| (|l| $)
  (PROG (#1=#:G400 |a| |res| |nc| #2=#:G399 |rc| #3=#:G398 |nr| #4=#:G397
         #5=#:G396 |dl| |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #6=(|MATCAT-;kroneckerProduct;LS;18|))
          (EXIT
           (COND
            ((EQL |k| 0)
             (COND
              ((QEQCAR (QREFELT $ 43) 0)
               (SPADCALL 1 1 (QCDR (QREFELT $ 43)) (QREFELT $ 30)))
              (#7='T (|error| "need 1"))))
            ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 56)))
            (#7#
             (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| $) . #6#)
                  (LETT |nr|
                        (SPADCALL (ELT $ 47)
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
                                                           (QREFELT $ 45))
                                                 #5#)
                                                . #6#)))
                                        (LETT #4# (CDR #4#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  (QREFELT $ 49))
                        . #6#)
                  (LETT |nc|
                        (SPADCALL (ELT $ 47)
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
                                                           (QREFELT $ 45))
                                                 #3#)
                                                . #6#)))
                                        (LETT #2# (CDR #2#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #3#))))
                                  (QREFELT $ 49))
                        . #6#)
                  (LETT |res| (SPADCALL |nr| |nc| (QREFELT $ 38)) . #6#)
                  (SEQ (LETT |a| NIL . #6#) (LETT #1# |l| . #6#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                   (QREFELT $ 54))))
                       (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))))) 

(DEFUN |MATCAT-;kroneckerProduct;3S;19| (|a| |b| $)
  (SPADCALL (LIST |a| |b|) (QREFELT $ 58))) 

(DEFUN |MATCAT-;kroneckerSum;LS;20| (|l| $)
  (PROG (|n0| |off0| |off_r| |ind_c| |vv| |j| |i| |m| |step0| |n2| |dl| |nr|
         #1=#:G436 |a| |res| |nrs| #2=#:G435 #3=#:G434 |nc| #4=#:G433 |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #5=(|MATCAT-;kroneckerSum;LS;20|))
          (EXIT
           (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT $ 38)))
                 ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 56)))
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
                               ((SPADCALL |nr| |nc| (QREFELT $ 32))
                                (|error| "kroneckerSum: nonsquare matrix"))
                               ('T (LETT |dl| (CONS |nr| |dl|) . #5#)))))
                            (LETT #4# (CDR #4#) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |dl| (NREVERSE |dl|) . #5#)
                       (LETT |nrs|
                             (SPADCALL (ELT $ 47)
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
                                       (QREFELT $ 49))
                             . #5#)
                       (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT $ 38)) . #5#)
                       (LETT |n0| 1 . #5#)
                       (SEQ (LETT |a| NIL . #5#) (LETT #1# |l| . #5#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |a| (CAR #1#) . #5#) NIL))
                              (GO G191)))
                            (SEQ (LETT |off0| 0 . #5#)
                                 (LETT |nr| (SPADCALL |dl| 1 (QREFELT $ 45))
                                       . #5#)
                                 (LETT |dl| (CDR |dl|) . #5#)
                                 (LETT |n2|
                                       (SPADCALL (ELT $ 47) |dl| 1
                                                 (QREFELT $ 60))
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
                                                                              61))
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

(DEFUN |MATCAT-;kroneckerSum;3S;21| (|a| |b| $)
  (SPADCALL (LIST |a| |b|) (QREFELT $ 63))) 

(DEFUN |MATCAT-;diagonalMatrix;LS;22| (|list| $)
  (PROG (|loC| |loR| |j| #1=#:G449 |l| |i| #2=#:G448 |k| |hiC| |hiR| #3=#:G447
         |mat| |ans| |cols| |rows| #4=#:G446)
    (RETURN
     (SEQ (LETT |rows| 0 . #5=(|MATCAT-;diagonalMatrix;LS;22|))
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
          (LETT |ans| (SPADCALL |rows| |cols| (QREFELT $ 38)) . #5#)
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

(DEFUN |MATCAT-;coerce;ColS;23| (|v| $)
  (PROG (#1=#:G453 |i| #2=#:G454 |k| |one| |x|)
    (RETURN
     (SEQ
      (LETT |x|
            (SPADCALL (SPADCALL |v| (QREFELT $ 66)) 1 (|spadConstant| $ 29)
                      (QREFELT $ 30))
            . #3=(|MATCAT-;coerce;ColS;23|))
      (LETT |one| (SPADCALL |x| (QREFELT $ 19)) . #3#)
      (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 67)) . #3#)
           (LETT #2# (SPADCALL |v| (QREFELT $ 68)) . #3#)
           (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #3#)
           (LETT #1# (SPADCALL |x| (QREFELT $ 18)) . #3#) G190
           (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |x| |i| |one| (SPADCALL |v| |k| (QREFELT $ 69))
                       (QREFELT $ 33))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |MATCAT-;transpose;RowS;24| (|v| $)
  (PROG (#1=#:G458 |j| #2=#:G459 |k| |one| |x|)
    (RETURN
     (SEQ
      (LETT |x|
            (SPADCALL 1 (SPADCALL |v| (QREFELT $ 71)) (|spadConstant| $ 29)
                      (QREFELT $ 30))
            . #3=(|MATCAT-;transpose;RowS;24|))
      (LETT |one| (SPADCALL |x| (QREFELT $ 17)) . #3#)
      (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 72)) . #3#)
           (LETT #2# (SPADCALL |v| (QREFELT $ 73)) . #3#)
           (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #3#)
           (LETT #1# (SPADCALL |x| (QREFELT $ 20)) . #3#) G190
           (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |x| |one| |j| (SPADCALL |v| |k| (QREFELT $ 74))
                       (QREFELT $ 33))))
           (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |MATCAT-;transpose;2S;25| (|x| $)
  (PROG (#1=#:G465 |j| #2=#:G464 |i| |ans|)
    (RETURN
     (SEQ
      (LETT |ans|
            (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                      (SPADCALL |x| (QREFELT $ 11)) (|spadConstant| $ 29)
                      (QREFELT $ 30))
            . #3=(|MATCAT-;transpose;2S;25|))
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

(DEFUN |MATCAT-;squareTop;2S;26| (|x| $)
  (PROG (#1=#:G472 |j| #2=#:G471 |i| |ans| |cols|)
    (RETURN
     (SEQ
      (COND
       ((< (SPADCALL |x| (QREFELT $ 11))
           (LETT |cols| (SPADCALL |x| (QREFELT $ 12))
                 . #3=(|MATCAT-;squareTop;2S;26|)))
        (|error| "squareTop: number of columns exceeds number of rows"))
       ('T
        (SEQ
         (LETT |ans|
               (SPADCALL |cols| |cols| (|spadConstant| $ 29) (QREFELT $ 30))
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

(DEFUN |MATCAT-;horizConcat;3S;27| (|x| |y| $)
  (PROG (#1=#:G483 |j| #2=#:G482 |i| #3=#:G481 #4=#:G480 |ans| |cols| |rows|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |rows| (SPADCALL |x| (QREFELT $ 11))
               . #5=(|MATCAT-;horizConcat;3S;27|))
         (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 32))
        (|error| "HConcat: matrices must have same number of rows"))
       ('T
        (SEQ
         (LETT |ans|
               (SPADCALL |rows|
                         (+ (LETT |cols| (SPADCALL |x| (QREFELT $ 12)) . #5#)
                            (SPADCALL |y| (QREFELT $ 12)))
                         (|spadConstant| $ 29) (QREFELT $ 30))
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

(DEFUN |MATCAT-;vertConcat;3S;28| (|x| |y| $)
  (PROG (#1=#:G494 |j| #2=#:G493 |i| #3=#:G492 #4=#:G491 |ans| |rows| |cols|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |cols| (SPADCALL |x| (QREFELT $ 12))
               . #5=(|MATCAT-;vertConcat;3S;28|))
         (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 32))
        (|error| "HConcat: matrices must have same number of columns"))
       ('T
        (SEQ
         (LETT |ans|
               (SPADCALL
                (+ (LETT |rows| (SPADCALL |x| (QREFELT $ 11)) . #5#)
                   (SPADCALL |y| (QREFELT $ 11)))
                |cols| (|spadConstant| $ 29) (QREFELT $ 30))
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

(DEFUN |MATCAT-;listOfLists;SL;29| (|x| $)
  (PROG (|ll| |l| #1=#:G501 |j| #2=#:G500 |i|)
    (RETURN
     (SEQ (LETT |ll| NIL . #3=(|MATCAT-;listOfLists;SL;29|))
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

(DEFUN |MATCAT-;swapRows!;S2IS;30| (|x| |i1| |i2| $)
  (PROG (|r| #1=#:G511 |j|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |i1| (SPADCALL |x| (QREFELT $ 17)))
            (OR (SPADCALL |i1| (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 81))
                (OR (< |i2| (SPADCALL |x| (QREFELT $ 17)))
                    (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 18))
                              (QREFELT $ 81)))))
        (|error| "swapRows!: index out of range"))
       ('T
        (COND ((EQL |i1| |i2|) |x|)
              ('T
               (SEQ
                (SEQ
                 (LETT |j| (SPADCALL |x| (QREFELT $ 19))
                       . #2=(|MATCAT-;swapRows!;S2IS;30|))
                 (LETT #1# (SPADCALL |x| (QREFELT $ 20)) . #2#) G190
                 (COND ((> |j| #1#) (GO G191)))
                 (SEQ (LETT |r| (SPADCALL |x| |i1| |j| (QREFELT $ 22)) . #2#)
                      (SPADCALL |x| |i1| |j|
                                (SPADCALL |x| |i2| |j| (QREFELT $ 22))
                                (QREFELT $ 33))
                      (EXIT (SPADCALL |x| |i2| |j| |r| (QREFELT $ 33))))
                 (LETT |j| (+ |j| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))))))))) 

(DEFUN |MATCAT-;swapColumns!;S2IS;31| (|x| |j1| |j2| $)
  (PROG (|r| #1=#:G521 |i|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |j1| (SPADCALL |x| (QREFELT $ 19)))
            (OR (SPADCALL |j1| (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 81))
                (OR (< |j2| (SPADCALL |x| (QREFELT $ 19)))
                    (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 20))
                              (QREFELT $ 81)))))
        (|error| "swapColumns!: index out of range"))
       ('T
        (COND ((EQL |j1| |j2|) |x|)
              ('T
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |x| (QREFELT $ 17))
                       . #2=(|MATCAT-;swapColumns!;S2IS;31|))
                 (LETT #1# (SPADCALL |x| (QREFELT $ 18)) . #2#) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ (LETT |r| (SPADCALL |x| |i| |j1| (QREFELT $ 22)) . #2#)
                      (SPADCALL |x| |i| |j1|
                                (SPADCALL |x| |i| |j2| (QREFELT $ 22))
                                (QREFELT $ 33))
                      (EXIT (SPADCALL |x| |i| |j2| |r| (QREFELT $ 33))))
                 (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))))))))) 

(DEFUN |MATCAT-;elt;S2LS;32| (|x| |rowList| |colList| $)
  (PROG (#1=#:G536 |ej| #2=#:G537 |j| #3=#:G534 |ei| #4=#:G535 |i| |y|
         #5=#:G527 #6=#:G533 #7=#:G524 #8=#:G532)
    (RETURN
     (SEQ
      (SEQ
       (EXIT
        (SEQ (LETT |ei| NIL . #9=(|MATCAT-;elt;S2LS;32|))
             (LETT #8# |rowList| . #9#) G190
             (COND
              ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#) . #9#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((OR (< |ei| (SPADCALL |x| (QREFELT $ 17)))
                     (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 18))
                               (QREFELT $ 81)))
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
                               (QREFELT $ 81)))
                 (PROGN
                  (LETT #5# (|error| "elt: index out of range") . #9#)
                  (GO #5#))))))
             (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL)))
       #5# (EXIT #5#))
      (LETT |y|
            (SPADCALL (LENGTH |rowList|) (LENGTH |colList|)
                      (|spadConstant| $ 29) (QREFELT $ 30))
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

(DEFUN |MATCAT-;setelt;S2L2S;33| (|x| |rowList| |colList| |y| $)
  (PROG (#1=#:G554 |ej| #2=#:G555 |j| #3=#:G552 |ei| #4=#:G553 |i| #5=#:G543
         #6=#:G551 #7=#:G540 #8=#:G550)
    (RETURN
     (SEQ
      (SEQ
       (EXIT
        (SEQ (LETT |ei| NIL . #9=(|MATCAT-;setelt;S2L2S;33|))
             (LETT #8# |rowList| . #9#) G190
             (COND
              ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#) . #9#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((OR (< |ei| (SPADCALL |x| (QREFELT $ 17)))
                     (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 18))
                               (QREFELT $ 81)))
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
                               (QREFELT $ 81)))
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

(DEFUN |MATCAT-;subMatrix;S4IS;34| (|x| |i1| |i2| |j1| |j2| $)
  (PROG (#1=#:G565 |j| |l| #2=#:G564 |i| |k| |y| |cols| |rows|)
    (RETURN
     (SEQ
      (COND ((< |i2| |i1|) (|error| "subMatrix: bad row indices"))
            ((< |j2| |j1|) (|error| "subMatrix: bad column indices"))
            ('T
             (COND
              ((OR (< |i1| (SPADCALL |x| (QREFELT $ 17)))
                   (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 18))
                             (QREFELT $ 81)))
               (|error| "subMatrix: index out of range"))
              ((OR (< |j1| (SPADCALL |x| (QREFELT $ 19)))
                   (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 20))
                             (QREFELT $ 81)))
               (|error| "subMatrix: index out of range"))
              ('T
               (SEQ
                (LETT |rows| (+ (- |i2| |i1|) 1)
                      . #3=(|MATCAT-;subMatrix;S4IS;34|))
                (LETT |cols| (+ (- |j2| |j1|) 1) . #3#)
                (LETT |y|
                      (SPADCALL |rows| |cols| (|spadConstant| $ 29)
                                (QREFELT $ 30))
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

(DEFUN |MATCAT-;setsubMatrix!;S2I2S;35| (|x| |i1| |j1| |y| $)
  (PROG (#1=#:G575 |j| |l| #2=#:G574 |i| |k| |j2| |i2|)
    (RETURN
     (SEQ
      (LETT |i2| (- (+ |i1| (SPADCALL |y| (QREFELT $ 11))) 1)
            . #3=(|MATCAT-;setsubMatrix!;S2I2S;35|))
      (LETT |j2| (- (+ |j1| (SPADCALL |y| (QREFELT $ 12))) 1) . #3#)
      (COND
       ((OR (< |i1| (SPADCALL |x| (QREFELT $ 17)))
            (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 81)))
        (EXIT
         (|error|
          "setsubMatrix!: inserted matrix too big, use subMatrix to restrict it"))))
      (COND
       ((OR (< |j1| (SPADCALL |x| (QREFELT $ 19)))
            (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 81)))
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

(DEFUN |MATCAT-;+;3S;36| (|x| |y| $)
  (PROG (#1=#:G585 |j| #2=#:G584 |i| |ans| |c| |r|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (SPADCALL
          (LETT |r| (SPADCALL |x| (QREFELT $ 11)) . #3=(|MATCAT-;+;3S;36|))
          (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 32))
         (SPADCALL (LETT |c| (SPADCALL |x| (QREFELT $ 12)) . #3#)
                   (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 32)))
        (|error| "can't add matrices of different dimensions"))
       ('T
        (SEQ
         (LETT |ans| (SPADCALL |r| |c| (|spadConstant| $ 29) (QREFELT $ 30))
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
                                  (QREFELT $ 61))
                                 (QREFELT $ 33))))
                     (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;-;3S;37| (|x| |y| $)
  (PROG (#1=#:G595 |j| #2=#:G594 |i| |ans| |c| |r|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (SPADCALL
          (LETT |r| (SPADCALL |x| (QREFELT $ 11)) . #3=(|MATCAT-;-;3S;37|))
          (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 32))
         (SPADCALL (LETT |c| (SPADCALL |x| (QREFELT $ 12)) . #3#)
                   (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 32)))
        (|error| "can't subtract matrices of different dimensions"))
       ('T
        (SEQ
         (LETT |ans| (SPADCALL |r| |c| (|spadConstant| $ 29) (QREFELT $ 30))
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
                                  (QREFELT $ 90))
                                 (QREFELT $ 33))))
                     (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;-;2S;38| (|x| $) (SPADCALL (ELT $ 27) |x| (QREFELT $ 93))) 

(DEFUN |MATCAT-;*;I2S;39| (|m| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|MATCAT-;*;I2S;39!0| (VECTOR $ |m|)) |x|
               (QREFELT $ 93))))) 

(DEFUN |MATCAT-;*;I2S;39!0| (|r1| $$)
  (PROG (|m| $)
    (LETT |m| (QREFELT $$ 1) . #1=(|MATCAT-;*;I2S;39|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |m| |r1| (QREFELT $ 95)))))) 

(DEFUN |MATCAT-;*;R2S;40| (|a| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|MATCAT-;*;R2S;40!0| (VECTOR $ |a|)) |x|
               (QREFELT $ 93))))) 

(DEFUN |MATCAT-;*;R2S;40!0| (|r1| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1) . #1=(|MATCAT-;*;R2S;40|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a| |r1| (QREFELT $ 46)))))) 

(DEFUN |MATCAT-;*;SRS;41| (|x| |a| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|MATCAT-;*;SRS;41!0| (VECTOR $ |a|)) |x|
               (QREFELT $ 93))))) 

(DEFUN |MATCAT-;*;SRS;41!0| (|r1| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1) . #1=(|MATCAT-;*;SRS;41|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |a| (QREFELT $ 46)))))) 

(DEFUN |MATCAT-;*;3S;42| (|x| |y| $)
  (PROG (|entry| |sum| #1=#:G613 |k| #2=#:G614 |l| #3=#:G612 |j| #4=#:G611 |i|
         |ans|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |x| (QREFELT $ 12)) (SPADCALL |y| (QREFELT $ 11))
                  (QREFELT $ 21))
        (|error| "can't multiply matrices of incompatible dimensions"))
       ('T
        (SEQ
         (LETT |ans|
               (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                         (SPADCALL |y| (QREFELT $ 12)) (|spadConstant| $ 29)
                         (QREFELT $ 30))
               . #5=(|MATCAT-;*;3S;42|))
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
                            (SEQ (LETT |sum| (|spadConstant| $ 29) . #5#)
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
                                                     (QREFELT $ 46))
                                                    (QREFELT $ 61))
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

(DEFUN |MATCAT-;positivePower;SIS;43| (|x| |n| $)
  (PROG (|y|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 1) |x|)
            ((ODDP |n|)
             (SPADCALL |x| (SPADCALL |x| (- |n| 1) (QREFELT $ 100))
                       (QREFELT $ 101)))
            ('T
             (SEQ
              (LETT |y| (SPADCALL |x| (QUOTIENT2 |n| 2) (QREFELT $ 100))
                    |MATCAT-;positivePower;SIS;43|)
              (EXIT (SPADCALL |y| |y| (QREFELT $ 101)))))))))) 

(DEFUN |MATCAT-;^;SNniS;44| (|x| |n| $)
  (PROG (|nn|)
    (RETURN
     (COND
      ((NULL
        (EQL (LETT |nn| (SPADCALL |x| (QREFELT $ 11)) |MATCAT-;^;SNniS;44|)
             (SPADCALL |x| (QREFELT $ 12))))
       (|error| "^: matrix must be square"))
      ('T
       (COND
        ((ZEROP |n|) (SPADCALL |nn| (|spadConstant| $ 42) (QREFELT $ 103)))
        ('T (SPADCALL |x| |n| (QREFELT $ 100))))))))) 

(DEFUN |MATCAT-;*;S2Col;45| (|x| |v| $)
  (PROG (|sum| #1=#:G629 |j| #2=#:G630 |l| #3=#:G627 |i| #4=#:G628 |k| |w|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |x| (QREFELT $ 12)) (SPADCALL |v| (QREFELT $ 66))
                  (QREFELT $ 21))
        (|error| "can't multiply matrix A and vector v if #cols A ~= #v"))
       ('T
        (SEQ
         (LETT |w|
               (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (|spadConstant| $ 29)
                         (QREFELT $ 105))
               . #5=(|MATCAT-;*;S2Col;45|))
         (SEQ (LETT |k| (SPADCALL |w| (QREFELT $ 67)) . #5#)
              (LETT #4# (SPADCALL |w| (QREFELT $ 68)) . #5#)
              (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #5#)
              (LETT #3# (SPADCALL |x| (QREFELT $ 18)) . #5#) G190
              (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
              (SEQ
               (EXIT
                (SPADCALL |w| |k|
                          (SEQ (LETT |sum| (|spadConstant| $ 29) . #5#)
                               (SEQ
                                (LETT |l| (SPADCALL |v| (QREFELT $ 67)) . #5#)
                                (LETT #2# (SPADCALL |v| (QREFELT $ 68)) . #5#)
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
                                                             (QREFELT $ 106))
                                                   (QREFELT $ 46))
                                                  (QREFELT $ 61))
                                        . #5#)))
                                (LETT |j|
                                      (PROG1 (+ |j| 1)
                                        (LETT |l| (+ |l| 1) . #5#))
                                      . #5#)
                                (GO G190) G191 (EXIT NIL))
                               (EXIT |sum|))
                          (QREFELT $ 107))))
              (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #5#)) . #5#)
              (GO G190) G191 (EXIT NIL))
         (EXIT |w|)))))))) 

(DEFUN |MATCAT-;*;RowSRow;46| (|v| |x| $)
  (PROG (|sum| #1=#:G639 |i| #2=#:G640 |l| #3=#:G637 |j| #4=#:G638 |k| |w|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |v| (QREFELT $ 71))
                  (QREFELT $ 21))
        (|error| "can't multiply vector v and matrix A if #rows A ~= #v"))
       ('T
        (SEQ
         (LETT |w|
               (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (|spadConstant| $ 29)
                         (QREFELT $ 109))
               . #5=(|MATCAT-;*;RowSRow;46|))
         (SEQ (LETT |k| (SPADCALL |w| (QREFELT $ 72)) . #5#)
              (LETT #4# (SPADCALL |w| (QREFELT $ 73)) . #5#)
              (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #5#)
              (LETT #3# (SPADCALL |x| (QREFELT $ 20)) . #5#) G190
              (COND ((OR (> |j| #3#) (> |k| #4#)) (GO G191)))
              (SEQ
               (EXIT
                (SPADCALL |w| |k|
                          (SEQ (LETT |sum| (|spadConstant| $ 29) . #5#)
                               (SEQ
                                (LETT |l| (SPADCALL |v| (QREFELT $ 72)) . #5#)
                                (LETT #2# (SPADCALL |v| (QREFELT $ 73)) . #5#)
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
                                                             (QREFELT $ 110))
                                                   (QREFELT $ 46))
                                                  (QREFELT $ 61))
                                        . #5#)))
                                (LETT |i|
                                      (PROG1 (+ |i| 1)
                                        (LETT |l| (+ |l| 1) . #5#))
                                      . #5#)
                                (GO G190) G191 (EXIT NIL))
                               (EXIT |sum|))
                          (QREFELT $ 111))))
              (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #5#)) . #5#)
              (GO G190) G191 (EXIT NIL))
         (EXIT |w|)))))))) 

(DEFUN |MATCAT-;columnSpace;SL;47| (M $)
  (PROG (|indRow| |basis| |k| |m| |n| M2)
    (RETURN
     (SEQ
      (LETT M2 (SPADCALL M (QREFELT $ 113)) . #1=(|MATCAT-;columnSpace;SL;47|))
      (LETT |basis| NIL . #1#) (LETT |n| (SPADCALL M (QREFELT $ 12)) . #1#)
      (LETT |m| (SPADCALL M (QREFELT $ 11)) . #1#) (LETT |indRow| 1 . #1#)
      (SEQ (LETT |k| 1 . #1#) G190
           (COND
            ((OR (|greater_SI| |k| |n|)
                 (NULL (SPADCALL |indRow| |m| (QREFELT $ 114))))
             (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((NULL
                (SPADCALL (SPADCALL M2 |indRow| |k| (QREFELT $ 115))
                          (QREFELT $ 23)))
               (SEQ
                (LETT |basis| (CONS (SPADCALL M |k| (QREFELT $ 116)) |basis|)
                      . #1#)
                (EXIT (LETT |indRow| (+ |indRow| 1) . #1#)))))))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (NREVERSE |basis|)))))) 

(DEFUN |MATCAT-;B0| (|n| $)
  (PROG (|j| #1=#:G656 |i| #2=#:G655)
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
                                         (SPADCALL (|spadConstant| $ 42)
                                                   (QREFELT $ 27)))
                                        ((EQL |i| (- |j| 1))
                                         (COND
                                          ((ODDP |i|) (|spadConstant| $ 42))
                                          ('T (|spadConstant| $ 29))))
                                        ('T (|spadConstant| $ 29))))
                                      ((EQL |i| (- |j| 1))
                                       (COND ((ODDP |i|) (|spadConstant| $ 42))
                                             ('T (|spadConstant| $ 29))))
                                      ('T (|spadConstant| $ 29)))
                                     #1#)
                                    . #3#)))
                            (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #1#))))
                      #2#)
                     . #3#)))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
             (EXIT (NREVERSE #2#))))
       (QREFELT $ 119)))))) 

(DEFUN |MATCAT-;PfChar| (A $)
  (PROG (|res| #1=#:G668 |e| #2=#:G669 |k| |c| |i| #3=#:G667 |j| |g| C B
         #4=#:G657 |d| |p| |s| |r| M |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL A (QREFELT $ 11)) . #5=(|MATCAT-;PfChar|))
          (EXIT
           (COND
            ((EQL |n| 2)
             (SPADCALL (SPADCALL (|spadConstant| $ 42) 2 (QREFELT $ 121))
                       (SPADCALL (SPADCALL A 1 2 (QREFELT $ 22))
                                 (QREFELT $ 122))
                       (QREFELT $ 123)))
            ('T
             (SEQ (LETT M (SPADCALL A 3 |n| 3 |n| (QREFELT $ 124)) . #5#)
                  (LETT |r| (SPADCALL A 1 1 3 |n| (QREFELT $ 124)) . #5#)
                  (LETT |s| (SPADCALL A 3 |n| 2 2 (QREFELT $ 124)) . #5#)
                  (LETT |p| (|MATCAT-;PfChar| M $) . #5#)
                  (LETT |d| (SPADCALL |p| (QREFELT $ 125)) . #5#)
                  (LETT B
                        (|MATCAT-;B0|
                         (PROG1 (LETT #4# (- |n| 2) . #5#)
                           (|check_subtype| (> #4# 0) '(|PositiveInteger|)
                                            #4#))
                         $)
                        . #5#)
                  (LETT C (SPADCALL |r| B (QREFELT $ 101)) . #5#)
                  (LETT |g|
                        (LIST
                         (SPADCALL (SPADCALL C |s| (QREFELT $ 101)) 1 1
                                   (QREFELT $ 22))
                         (SPADCALL A 1 2 (QREFELT $ 22)) (|spadConstant| $ 42))
                        . #5#)
                  (COND
                   ((>= |d| 4)
                    (SEQ (LETT B (SPADCALL M B (QREFELT $ 101)) . #5#)
                         (EXIT
                          (SEQ (LETT |i| 4 . #5#) G190
                               (COND ((> |i| |d|) (GO G191)))
                               (SEQ
                                (LETT C (SPADCALL C B (QREFELT $ 101)) . #5#)
                                (EXIT
                                 (LETT |g|
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL C |s| (QREFELT $ 101)) 1 1
                                         (QREFELT $ 22))
                                        |g|)
                                       . #5#)))
                               (LETT |i| (+ |i| 2) . #5#) (GO G190) G191
                               (EXIT NIL))))))
                  (LETT |g| (NREVERSE |g|) . #5#)
                  (LETT |res| (|spadConstant| $ 126) . #5#)
                  (SEQ (LETT |j| 2 . #5#) (LETT #3# (+ |d| 2) . #5#)
                       (LETT |i| 0 . #5#) G190
                       (COND
                        ((OR (> |i| |d|) (|greater_SI| |j| #3#)) (GO G191)))
                       (SEQ (LETT |c| (SPADCALL |p| |i| (QREFELT $ 127)) . #5#)
                            (EXIT
                             (SEQ (LETT |k| 2 . #5#) (LETT #2# (- |d|) . #5#)
                                  (LETT |e| NIL . #5#)
                                  (LETT #1# (SPADCALL |g| |j| (QREFELT $ 128))
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
                                                               (QREFELT $ 46))
                                                     (+ |k| |i|)
                                                     (QREFELT $ 121))
                                                    (QREFELT $ 123))
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

(DEFUN |MATCAT-;Pfaffian;SR;50| (A $)
  (COND
   ((SPADCALL A (QREFELT $ 129))
    (COND ((ODDP (SPADCALL A (QREFELT $ 11))) (|spadConstant| $ 29))
          (#1='T
           (SPADCALL (|MATCAT-;PfChar| A $) (|spadConstant| $ 29)
                     (QREFELT $ 130)))))
   (#1# (|error| "Pfaffian: only defined for antisymmetric square matrices!")))) 

(DEFUN |MATCAT-;exquo;SRU;51| (|x| |a| $)
  (PROG (|entry| #1=#:G684 |r| #2=#:G686 |j| #3=#:G685 |i| |ans|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ans|
              (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                        (SPADCALL |x| (QREFELT $ 12)) (|spadConstant| $ 29)
                        (QREFELT $ 30))
              . #4=(|MATCAT-;exquo;SRU;51|))
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
                                   (QREFELT $ 133))
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

(DEFUN |MATCAT-;/;SRS;52| (|x| |r| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|MATCAT-;/;SRS;52!0| (VECTOR $ |r|)) |x|
               (QREFELT $ 93))))) 

(DEFUN |MATCAT-;/;SRS;52!0| (|r1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|MATCAT-;/;SRS;52|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |r| (QREFELT $ 135)))))) 

(DEFUN |MATCAT-;^;SIS;53| (|x| |n| $)
  (PROG (|xInv| |nn|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (EQL
          (LETT |nn| (SPADCALL |x| (QREFELT $ 11)) . #1=(|MATCAT-;^;SIS;53|))
          (SPADCALL |x| (QREFELT $ 12))))
        (|error| "^: matrix must be square"))
       ('T
        (COND
         ((ZEROP |n|) (SPADCALL |nn| (|spadConstant| $ 42) (QREFELT $ 103)))
         ((SPADCALL |n| (QREFELT $ 137)) (SPADCALL |x| |n| (QREFELT $ 100)))
         (#2='T
          (SEQ (LETT |xInv| (SPADCALL |x| (QREFELT $ 138)) . #1#)
               (EXIT
                (COND
                 ((QEQCAR |xInv| 1) (|error| "^: matrix must be invertible"))
                 (#2#
                  (SPADCALL (QCDR |xInv|) (- |n|) (QREFELT $ 100)))))))))))))) 

(DECLAIM (NOTINLINE |MatrixCategory&;|)) 

(DEFUN |MatrixCategory&| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MatrixCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|MatrixCategory&| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 141) . #1#)
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
        (QSETREFV $ 28
                  (CONS (|dispatchFunction| |MATCAT-;antisymmetric?;SB;4|)
                        $))))
      (QSETREFV $ 43
                (COND
                 ((|HasCategory| |#2| '(|SemiRing|))
                  (CONS 0 (|spadConstant| $ 42)))
                 ('T (CONS 1 "one"))))
      (COND
       ((|domainEqual| |#1| (|Matrix| |#2|))
        (PROGN
         (QSETREFV $ 55
                   (CONS
                    (|dispatchFunction|
                     |MATCAT-;kronecker_prod1;SILL2NniUV;11|)
                    $))
         (QSETREFV $ 57
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;LS;12|)
                         $))
         (QSETREFV $ 59
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;3S;13|)
                         $))
         (QSETREFV $ 62
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;14|) $))
         (QSETREFV $ 64
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;15|) $))
         (QSETREFV $ 65
                   (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;16|)
                         $))))
       ('T
        (PROGN
         (QSETREFV $ 55
                   (CONS
                    (|dispatchFunction|
                     |MATCAT-;kronecker_prod1;SILL2NniUV;17|)
                    $))
         (QSETREFV $ 57
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;LS;18|)
                         $))
         (QSETREFV $ 59
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;3S;19|)
                         $))
         (QSETREFV $ 62
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;20|) $))
         (QSETREFV $ 64
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;21|) $))
         (QSETREFV $ 65
                   (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;22|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 6)
        (PROGN
         (QSETREFV $ 91 (CONS (|dispatchFunction| |MATCAT-;-;3S;37|) $))
         (QSETREFV $ 94 (CONS (|dispatchFunction| |MATCAT-;-;2S;38|) $))
         (QSETREFV $ 96 (CONS (|dispatchFunction| |MATCAT-;*;I2S;39|) $)))))
      (COND
       ((|testBitVector| |pv$| 5)
        (QSETREFV $ 104 (CONS (|dispatchFunction| |MATCAT-;^;SNniS;44|) $))))
      (COND
       ((|HasCategory| |#4| '(|shallowlyMutable|))
        (QSETREFV $ 108 (CONS (|dispatchFunction| |MATCAT-;*;S2Col;45|) $))))
      (COND
       ((|HasCategory| |#3| '(|shallowlyMutable|))
        (QSETREFV $ 112 (CONS (|dispatchFunction| |MATCAT-;*;RowSRow;46|) $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (QSETREFV $ 118
                  (CONS (|dispatchFunction| |MATCAT-;columnSpace;SL;47|) $))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 131
                   (CONS (|dispatchFunction| |MATCAT-;Pfaffian;SR;50|) $)))))
      (COND
       ((|testBitVector| |pv$| 4)
        (QSETREFV $ 134 (CONS (|dispatchFunction| |MATCAT-;exquo;SRU;51|) $))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 136 (CONS (|dispatchFunction| |MATCAT-;/;SRS;52|) $))
         (QSETREFV $ 139 (CONS (|dispatchFunction| |MATCAT-;^;SIS;53|) $)))))
      $)))) 

(MAKEPROP '|MatrixCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|NonNegativeInteger|)
              (0 . |nrows|) (5 . |ncols|) (|Boolean|) |MATCAT-;square?;SB;1|
              (10 . |square?|) (|Integer|) (15 . |minRowIndex|)
              (20 . |maxRowIndex|) (25 . |minColIndex|) (30 . |maxColIndex|)
              (35 . ~=) (41 . |qelt|) (48 . |zero?|) |MATCAT-;diagonal?;SB;2|
              (53 . ~=) |MATCAT-;symmetric?;SB;3| (59 . -)
              (64 . |antisymmetric?|) (69 . |Zero|) (73 . |new|)
              |MATCAT-;zero;2NniS;5| (80 . ~=) (86 . |qsetelt!|) (|List| 40)
              |MATCAT-;matrix;LS;6| (|Mapping| 7 16 16)
              |MATCAT-;matrix;2NniMS;7| (94 . |zero|)
              |MATCAT-;scalarMatrix;NniRS;8| (|List| 7)
              |MATCAT-;diagonalMatrix;LS;9| (100 . |One|) '|maybe_1|
              (|List| 10) (104 . |elt|) (110 . *) (116 . *)
              (|Mapping| 10 10 10) (122 . |reduce|) (|Void|) (|List| 44)
              (|List| $) (|Union| 7 '"one") (128 . |kronecker_prod1|)
              (139 . |kronecker_prod1|) (150 . |copy|)
              (155 . |kroneckerProduct|) (160 . |kroneckerProduct|)
              (165 . |kroneckerProduct|) (171 . |reduce|) (178 . +)
              (184 . |kroneckerSum|) (189 . |kroneckerSum|)
              (194 . |kroneckerSum|) (200 . |diagonalMatrix|) (205 . |#|)
              (210 . |minIndex|) (215 . |maxIndex|) (220 . |qelt|)
              |MATCAT-;coerce;ColS;23| (226 . |#|) (231 . |minIndex|)
              (236 . |maxIndex|) (241 . |qelt|) |MATCAT-;transpose;RowS;24|
              |MATCAT-;transpose;2S;25| |MATCAT-;squareTop;2S;26|
              |MATCAT-;horizConcat;3S;27| |MATCAT-;vertConcat;3S;28|
              |MATCAT-;listOfLists;SL;29| (247 . >) |MATCAT-;swapRows!;S2IS;30|
              |MATCAT-;swapColumns!;S2IS;31| (|List| 16) |MATCAT-;elt;S2LS;32|
              |MATCAT-;setelt;S2L2S;33| |MATCAT-;subMatrix;S4IS;34|
              |MATCAT-;setsubMatrix!;S2I2S;35| |MATCAT-;+;3S;36| (253 . -)
              (259 . -) (|Mapping| 7 7) (265 . |map|) (271 . -) (276 . *)
              (282 . *) |MATCAT-;*;R2S;40| |MATCAT-;*;SRS;41| |MATCAT-;*;3S;42|
              (288 . |positivePower|) (294 . *) |MATCAT-;positivePower;SIS;43|
              (300 . |scalarMatrix|) (306 . ^) (312 . |new|) (318 . |elt|)
              (324 . |setelt|) (331 . *) (337 . |new|) (343 . |elt|)
              (349 . |setelt|) (356 . *) (362 . |rowEchelon|) (367 . <=)
              (373 . |elt|) (380 . |column|) (|List| 9) (386 . |columnSpace|)
              (391 . |matrix|) (|SparseUnivariatePolynomial| 7)
              (396 . |monomial|) (402 . |coerce|) (407 . +) (413 . |subMatrix|)
              (422 . |degree|) (427 . |Zero|) (431 . |coefficient|)
              (437 . |first|) (443 . |antisymmetric?|) (448 . |elt|)
              (454 . |Pfaffian|) (|Union| $ '"failed") (459 . |exquo|)
              (465 . |exquo|) (471 . /) (477 . /) (483 . |positive?|)
              (488 . |inverse|) (493 . ^) (|OutputForm|))
           '#(|zero| 499 |vertConcat| 505 |transpose| 511 |symmetric?| 521
              |swapRows!| 526 |swapColumns!| 533 |subMatrix| 540 |squareTop|
              549 |square?| 554 |setsubMatrix!| 559 |setelt| 567 |scalarMatrix|
              575 |positivePower| 581 |matrix| 587 |listOfLists| 599
              |kronecker_prod1| 604 |kroneckerSum| 615 |kroneckerProduct| 626
              |horizConcat| 637 |exquo| 643 |elt| 649 |diagonalMatrix| 656
              |diagonal?| 666 |columnSpace| 671 |coerce| 676 |antisymmetric?|
              681 ^ 686 |Pfaffian| 698 / 703 - 709 + 720 * 726)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 139
                                                 '(1 6 10 0 11 1 6 10 0 12 1 6
                                                   13 0 15 1 6 16 0 17 1 6 16 0
                                                   18 1 6 16 0 19 1 6 16 0 20 2
                                                   16 13 0 0 21 3 6 7 0 16 16
                                                   22 1 7 13 0 23 2 7 13 0 0 25
                                                   1 7 0 0 27 1 0 13 0 28 0 7 0
                                                   29 3 6 0 10 10 7 30 2 10 13
                                                   0 0 32 4 6 7 0 16 16 7 33 2
                                                   6 0 10 10 38 0 7 0 42 2 44
                                                   10 0 16 45 2 7 0 0 0 46 2 10
                                                   0 10 0 47 2 44 10 48 0 49 7
                                                   6 50 0 16 51 52 10 10 53 54
                                                   7 0 50 0 16 51 52 10 10 53
                                                   55 1 6 0 0 56 1 0 0 52 57 1
                                                   6 0 52 58 2 0 0 0 0 59 3 44
                                                   10 48 0 10 60 2 7 0 0 0 61 1
                                                   0 0 52 62 1 6 0 52 63 2 0 0
                                                   0 0 64 1 0 0 52 65 1 9 10 0
                                                   66 1 9 16 0 67 1 9 16 0 68 2
                                                   9 7 0 16 69 1 8 10 0 71 1 8
                                                   16 0 72 1 8 16 0 73 2 8 7 0
                                                   16 74 2 16 13 0 0 81 2 7 0 0
                                                   0 90 2 0 0 0 0 91 2 6 0 92 0
                                                   93 1 0 0 0 94 2 7 0 16 0 95
                                                   2 0 0 16 0 96 2 6 0 0 16 100
                                                   2 6 0 0 0 101 2 6 0 10 7 103
                                                   2 0 0 0 10 104 2 9 0 10 7
                                                   105 2 9 7 0 16 106 3 9 7 0
                                                   16 7 107 2 0 9 0 9 108 2 8 0
                                                   10 7 109 2 8 7 0 16 110 3 8
                                                   7 0 16 7 111 2 0 8 8 0 112 1
                                                   6 0 0 113 2 16 13 0 0 114 3
                                                   6 7 0 16 16 115 2 6 9 0 16
                                                   116 1 0 117 0 118 1 6 0 34
                                                   119 2 120 0 7 10 121 1 120 0
                                                   7 122 2 120 0 0 0 123 5 6 0
                                                   0 16 16 16 16 124 1 120 10 0
                                                   125 0 120 0 126 2 120 7 0 10
                                                   127 2 40 0 0 10 128 1 6 13 0
                                                   129 2 120 7 0 7 130 1 0 7 0
                                                   131 2 7 132 0 0 133 2 0 132
                                                   0 7 134 2 7 0 0 0 135 2 0 0
                                                   0 7 136 1 16 13 0 137 1 6
                                                   132 0 138 2 0 0 0 16 139 2 0
                                                   0 10 10 31 2 0 0 0 0 79 1 0
                                                   0 0 76 1 0 0 8 75 1 0 13 0
                                                   26 3 0 0 0 16 16 82 3 0 0 0
                                                   16 16 83 5 0 0 0 16 16 16 16
                                                   87 1 0 0 0 77 1 0 13 0 14 4
                                                   0 0 0 16 16 0 88 4 0 0 0 84
                                                   84 0 86 2 0 0 10 7 39 2 0 0
                                                   0 16 102 1 0 0 34 35 3 0 0
                                                   10 10 36 37 1 0 34 0 80 7 0
                                                   50 0 16 51 52 10 10 53 55 1
                                                   0 0 52 62 2 0 0 0 0 64 1 0 0
                                                   52 57 2 0 0 0 0 59 2 0 0 0 0
                                                   78 2 0 132 0 7 134 3 0 0 0
                                                   84 84 85 1 0 0 40 41 1 0 0
                                                   52 65 1 0 13 0 24 1 0 117 0
                                                   118 1 0 0 9 70 1 0 13 0 28 2
                                                   0 0 0 16 139 2 0 0 0 10 104
                                                   1 0 7 0 131 2 0 0 0 7 136 1
                                                   0 0 0 94 2 0 0 0 0 91 2 0 0
                                                   0 0 89 2 0 8 8 0 112 2 0 9 0
                                                   9 108 2 0 0 7 0 97 2 0 0 0 7
                                                   98 2 0 0 0 0 99 2 0 0 16 0
                                                   96)))))
           '|lookupComplete|)) 
