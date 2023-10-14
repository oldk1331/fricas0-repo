
(DEFUN |MATCAT-;square?;SB;1| (|x| $)
  (EQL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |x| (QREFELT $ 12)))) 

(DEFUN |MATCAT-;diagonal?;SB;2| (|x| $)
  (PROG (#1=#:G173 #2=#:G176 #3=#:G178 |j| #4=#:G177 |i|)
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
  (PROG (#1=#:G180 #2=#:G184 #3=#:G186 |j| #4=#:G185 |i| |mc| |mr| |nRows|)
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
  (PROG (#1=#:G188 #2=#:G192 #3=#:G194 |j| #4=#:G193 |i| |mc| |mr| |nRows|)
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

(DEFUN |MATCAT-;zero?;SB;5| (|x| $)
  (PROG (#1=#:G199 #2=#:G201 |j| #3=#:G200 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #4=(|MATCAT-;zero?;SB;5|))
         (LETT #3# (SPADCALL |x| (QREFELT $ 18)) . #4#) G190
         (COND ((> |i| #3#) (GO G191)))
         (SEQ
          (EXIT
           (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #4#)
                (LETT #2# (SPADCALL |x| (QREFELT $ 20)) . #4#) G190
                (COND ((> |j| #2#) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 22))
                              (|spadConstant| $ 29) (QREFELT $ 25))
                    (PROGN (LETT #1# 'NIL . #4#) (GO #1#))))))
                (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))))
         (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |MATCAT-;zero;2NniS;6| (|rows| |cols| $)
  (SPADCALL |rows| |cols| (|spadConstant| $ 29) (QREFELT $ 31))) 

(DEFUN |MATCAT-;matrix;LS;7| (|l| $)
  (PROG (#1=#:G212 |j| #2=#:G213 |r| #3=#:G210 |i| #4=#:G211 |ll| |ans| |rows|
         #5=#:G209 |cols|)
    (RETURN
     (SEQ
      (COND ((NULL |l|) (SPADCALL 0 0 (|spadConstant| $ 29) (QREFELT $ 31)))
            ('T
             (SEQ (LETT |rows| 1 . #6=(|MATCAT-;matrix;LS;7|))
                  (LETT |cols| (LENGTH (|SPADfirst| |l|)) . #6#)
                  (SEQ (LETT |ll| NIL . #6#) (LETT #5# (CDR |l|) . #6#) G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |ll| (CAR #5#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |cols| (LENGTH |ll|) (QREFELT $ 33))
                           (|error| "matrix: rows of different lengths"))
                          ('T (LETT |rows| (+ |rows| 1) . #6#)))))
                       (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                  (LETT |ans|
                        (SPADCALL |rows| |cols| (|spadConstant| $ 29)
                                  (QREFELT $ 31))
                        . #6#)
                  (SEQ (LETT |ll| NIL . #6#) (LETT #4# |l| . #6#)
                       (LETT |i| (SPADCALL |ans| (QREFELT $ 17)) . #6#)
                       (LETT #3# (SPADCALL |ans| (QREFELT $ 18)) . #6#) G190
                       (COND
                        ((OR (> |i| #3#) (ATOM #4#)
                             (PROGN (LETT |ll| (CAR #4#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |r| NIL . #6#) (LETT #2# |ll| . #6#)
                              (LETT |j| (SPADCALL |ans| (QREFELT $ 19)) . #6#)
                              (LETT #1# (SPADCALL |ans| (QREFELT $ 20)) . #6#)
                              G190
                              (COND
                               ((OR (> |j| #1#) (ATOM #2#)
                                    (PROGN (LETT |r| (CAR #2#) . #6#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |ans| |i| |j| |r| (QREFELT $ 34))))
                              (LETT |j|
                                    (PROG1 (+ |j| 1)
                                      (LETT #2# (CDR #2#) . #6#))
                                    . #6#)
                              (GO G190) G191 (EXIT NIL))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT #4# (CDR #4#) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;matrix;2NniMS;8| (|n| |m| |f| $)
  (PROG (#1=#:G220 |j| #2=#:G219 |i| |mat|)
    (RETURN
     (SEQ
      (LETT |mat| (SPADCALL |n| |m| (|spadConstant| $ 29) (QREFELT $ 31))
            . #3=(|MATCAT-;matrix;2NniMS;8|))
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
                              (QREFELT $ 34))))
                  (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |mat|))))) 

(DEFUN |MATCAT-;scalarMatrix;NniRS;9| (|n| |r| $)
  (PROG (#1=#:G224 |i| #2=#:G225 |j| |ans|)
    (RETURN
     (SEQ
      (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 39))
            . #3=(|MATCAT-;scalarMatrix;NniRS;9|))
      (SEQ (LETT |j| (SPADCALL |ans| (QREFELT $ 19)) . #3#)
           (LETT #2# (SPADCALL |ans| (QREFELT $ 20)) . #3#)
           (LETT |i| (SPADCALL |ans| (QREFELT $ 17)) . #3#)
           (LETT #1# (SPADCALL |ans| (QREFELT $ 18)) . #3#) G190
           (COND ((OR (> |i| #1#) (> |j| #2#)) (GO G191)))
           (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT $ 34))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |MATCAT-;diagonalMatrix;LS;10| (|l| $)
  (PROG (#1=#:G229 |i| #2=#:G230 |j| #3=#:G231 |r| |ans| |n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |l|) . #4=(|MATCAT-;diagonalMatrix;LS;10|))
          (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 39)) . #4#)
          (SEQ (LETT |r| NIL . #4#) (LETT #3# |l| . #4#)
               (LETT |j| (SPADCALL |ans| (QREFELT $ 19)) . #4#)
               (LETT #2# (SPADCALL |ans| (QREFELT $ 20)) . #4#)
               (LETT |i| (SPADCALL |ans| (QREFELT $ 17)) . #4#)
               (LETT #1# (SPADCALL |ans| (QREFELT $ 18)) . #4#) G190
               (COND
                ((OR (> |i| #1#) (> |j| #2#) (ATOM #3#)
                     (PROGN (LETT |r| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT $ 34))))
               (LETT |i|
                     (PROG1 (+ |i| 1)
                       (LETT |j| (PROG1 (+ |j| 1) (LETT #3# (CDR #3#) . #4#))
                             . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |MATCAT-;get_dims| (|l| $)
  (PROG (#1=#:G238 |a| #2=#:G237)
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

(DEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;12|
       (|res| |k| |dl| |l| |r_off| |c_off| |mu| $)
  (PROG (|c_off1| |mm| |aij| |j| |i| |c_step| #1=#:G272 |rc| #2=#:G271 |r_step|
         #3=#:G270 #4=#:G269 |c_ind| |m| |a| |nc| |nr| |dp|)
    (RETURN
     (SEQ
      (LETT |dp| (|SPADfirst| |dl|)
            . #5=(|MATCAT-;kronecker_prod1;SILL2NniUV;12|))
      (LETT |nr| (SPADCALL |dp| 1 (QREFELT $ 46)) . #5#)
      (LETT |nc| (SPADCALL |dp| 2 (QREFELT $ 46)) . #5#)
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
                                                             (QREFELT $ 47))
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
                    (SPADCALL (ELT $ 48)
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
                                             (SPADCALL |rc| 1 (QREFELT $ 46))
                                             #4#)
                                            . #5#)))
                                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #4#))))
                              (QREFELT $ 50))
                    . #5#)
              (LETT |c_step|
                    (SPADCALL (ELT $ 48)
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
                                             (SPADCALL |rc| 2 (QREFELT $ 46))
                                             #2#)
                                            . #5#)))
                                    (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 50))
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
                                                          (QREFELT $ 47))))
                                         . #5#)
                                   (SPADCALL |res| (- |k| 1) |dl| |l| |r_off|
                                             |c_off1| (CONS 0 |mm|)
                                             (QREFELT $ 55))
                                   (EXIT
                                    (LETT |c_off1| (+ |c_off1| |c_step|)
                                          . #5#)))
                              (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (LETT |r_off| (+ |r_off| |r_step|) . #5#)))
                    (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                    (EXIT NIL))))))))))) 

(DEFUN |MATCAT-;kroneckerProduct;LS;13| (|l| $)
  (PROG (#1=#:G299 |a| |res| |nc| #2=#:G298 |rc| #3=#:G297 |nr| #4=#:G296
         #5=#:G295 |dl| |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #6=(|MATCAT-;kroneckerProduct;LS;13|))
          (EXIT
           (COND
            ((EQL |k| 0)
             (COND
              ((QEQCAR (QREFELT $ 44) 0)
               (MAKE_MATRIX1 1 1 (QCDR (QREFELT $ 44))))
              (#7='T (|error| "need 1"))))
            ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 57)))
            (#7#
             (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| $) . #6#)
                  (LETT |nr|
                        (SPADCALL (ELT $ 48)
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
                                                           (QREFELT $ 46))
                                                 #5#)
                                                . #6#)))
                                        (LETT #4# (CDR #4#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  (QREFELT $ 50))
                        . #6#)
                  (LETT |nc|
                        (SPADCALL (ELT $ 48)
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
                                                           (QREFELT $ 46))
                                                 #3#)
                                                . #6#)))
                                        (LETT #2# (CDR #2#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #3#))))
                                  (QREFELT $ 50))
                        . #6#)
                  (LETT |res| (SPADCALL |nr| |nc| (QREFELT $ 39)) . #6#)
                  (SEQ (LETT |a| NIL . #6#) (LETT #1# |l| . #6#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                   (QREFELT $ 55))))
                       (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))))) 

(DEFUN |MATCAT-;kroneckerProduct;3S;14| (|a| |b| $)
  (SPADCALL (LIST |a| |b|) (QREFELT $ 59))) 

(DEFUN |MATCAT-;kroneckerSum;LS;15| (|l| $)
  (PROG (|n0| |off0| |off_r| |ind_c| |vv| |j| |i| |m| |step0| |n2| |dl| |nr|
         #1=#:G335 |a| |res| |nrs| #2=#:G334 #3=#:G333 |nc| #4=#:G332 |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #5=(|MATCAT-;kroneckerSum;LS;15|))
          (EXIT
           (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT $ 39)))
                 ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 57)))
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
                                   ((SPADCALL |nr| |nc| (QREFELT $ 33))
                                    (|error| "kroneckerSum: nonsquare matrix"))
                                   ('T (LETT |dl| (CONS |nr| |dl|) . #5#)))))
                            (LETT #4# (CDR #4#) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |dl| (NREVERSE |dl|) . #5#)
                       (LETT |nrs|
                             (SPADCALL (ELT $ 48)
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
                                       (QREFELT $ 50))
                             . #5#)
                       (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT $ 39)) . #5#)
                       (LETT |n0| 1 . #5#)
                       (SEQ (LETT |a| NIL . #5#) (LETT #1# |l| . #5#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |a| (CAR #1#) . #5#) NIL))
                              (GO G191)))
                            (SEQ (LETT |off0| 0 . #5#)
                                 (LETT |nr| (SPADCALL |dl| 1 (QREFELT $ 46))
                                       . #5#)
                                 (LETT |dl| (CDR |dl|) . #5#)
                                 (LETT |n2|
                                       (SPADCALL (ELT $ 48) |dl| 1
                                                 (QREFELT $ 61))
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
                                                                              62))
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

(DEFUN |MATCAT-;kroneckerSum;3S;16| (|a| |b| $)
  (SPADCALL (LIST |a| |b|) (QREFELT $ 64))) 

(DEFUN |MATCAT-;diagonalMatrix;LS;17| (|list| $)
  (PROG (|loC| |loR| |j| #1=#:G348 |l| |i| #2=#:G347 |k| |hiC| |hiR| #3=#:G346
         |mat| |ans| |cols| |rows| #4=#:G345)
    (RETURN
     (SEQ (LETT |rows| 0 . #5=(|MATCAT-;diagonalMatrix;LS;17|))
          (LETT |cols| 0 . #5#)
          (SEQ (LETT |mat| NIL . #5#) (LETT #4# |list| . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |mat| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |rows| (+ |rows| (ANROWS |mat|)) . #5#)
                    (EXIT (LETT |cols| (+ |cols| (ANCOLS |mat|)) . #5#)))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |ans| (SPADCALL |rows| |cols| (QREFELT $ 39)) . #5#)
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

(DEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;18|
       (|res| |k| |dl| |l| |r_off| |c_off| |mu| $)
  (PROG (|c_off1| |mm| |aij| |j| |i| |c_step| #1=#:G382 |rc| #2=#:G381 |r_step|
         #3=#:G380 #4=#:G379 |c_ind| |m| |a| |nc| |nr| |dp|)
    (RETURN
     (SEQ
      (LETT |dp| (|SPADfirst| |dl|)
            . #5=(|MATCAT-;kronecker_prod1;SILL2NniUV;18|))
      (LETT |nr| (SPADCALL |dp| 1 (QREFELT $ 46)) . #5#)
      (LETT |nc| (SPADCALL |dp| 2 (QREFELT $ 46)) . #5#)
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
                                                           (QREFELT $ 47))
                                                 (QREFELT $ 34))
                                       (EXIT
                                        (LETT |c_ind| (+ |c_ind| 1) . #5#)))
                                      (LETT |j| (|inc_SI| |j|) . #5#) (GO G190)
                                      G191 (EXIT NIL))))
                           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                           (EXIT NIL)))))))
        (#6#
         (SEQ (LETT |dl| (CDR |dl|) . #5#) (LETT |l| (CDR |l|) . #5#)
              (LETT |r_step|
                    (SPADCALL (ELT $ 48)
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
                                             (SPADCALL |rc| 1 (QREFELT $ 46))
                                             #4#)
                                            . #5#)))
                                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #4#))))
                              (QREFELT $ 50))
                    . #5#)
              (LETT |c_step|
                    (SPADCALL (ELT $ 48)
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
                                             (SPADCALL |rc| 2 (QREFELT $ 46))
                                             #2#)
                                            . #5#)))
                                    (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 50))
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
                                                      (QREFELT $ 47))))
                                     . #5#)
                               (SPADCALL |res| (- |k| 1) |dl| |l| |r_off|
                                         |c_off1| (CONS 0 |mm|) (QREFELT $ 55))
                               (EXIT
                                (LETT |c_off1| (+ |c_off1| |c_step|) . #5#)))
                              (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (LETT |r_off| (+ |r_off| |r_step|) . #5#)))
                    (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                    (EXIT NIL))))))))))) 

(DEFUN |MATCAT-;kroneckerProduct;LS;19| (|l| $)
  (PROG (#1=#:G409 |a| |res| |nc| #2=#:G408 |rc| #3=#:G407 |nr| #4=#:G406
         #5=#:G405 |dl| |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #6=(|MATCAT-;kroneckerProduct;LS;19|))
          (EXIT
           (COND
            ((EQL |k| 0)
             (COND
              ((QEQCAR (QREFELT $ 44) 0)
               (SPADCALL 1 1 (QCDR (QREFELT $ 44)) (QREFELT $ 31)))
              (#7='T (|error| "need 1"))))
            ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 57)))
            (#7#
             (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| $) . #6#)
                  (LETT |nr|
                        (SPADCALL (ELT $ 48)
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
                                                           (QREFELT $ 46))
                                                 #5#)
                                                . #6#)))
                                        (LETT #4# (CDR #4#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  (QREFELT $ 50))
                        . #6#)
                  (LETT |nc|
                        (SPADCALL (ELT $ 48)
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
                                                           (QREFELT $ 46))
                                                 #3#)
                                                . #6#)))
                                        (LETT #2# (CDR #2#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #3#))))
                                  (QREFELT $ 50))
                        . #6#)
                  (LETT |res| (SPADCALL |nr| |nc| (QREFELT $ 39)) . #6#)
                  (SEQ (LETT |a| NIL . #6#) (LETT #1# |l| . #6#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                   (QREFELT $ 55))))
                       (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))))) 

(DEFUN |MATCAT-;kroneckerProduct;3S;20| (|a| |b| $)
  (SPADCALL (LIST |a| |b|) (QREFELT $ 59))) 

(DEFUN |MATCAT-;kroneckerSum;LS;21| (|l| $)
  (PROG (|n0| |off0| |off_r| |ind_c| |vv| |j| |i| |m| |step0| |n2| |dl| |nr|
         #1=#:G445 |a| |res| |nrs| #2=#:G444 #3=#:G443 |nc| #4=#:G442 |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #5=(|MATCAT-;kroneckerSum;LS;21|))
          (EXIT
           (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT $ 39)))
                 ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 57)))
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
                               ((SPADCALL |nr| |nc| (QREFELT $ 33))
                                (|error| "kroneckerSum: nonsquare matrix"))
                               ('T (LETT |dl| (CONS |nr| |dl|) . #5#)))))
                            (LETT #4# (CDR #4#) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |dl| (NREVERSE |dl|) . #5#)
                       (LETT |nrs|
                             (SPADCALL (ELT $ 48)
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
                                       (QREFELT $ 50))
                             . #5#)
                       (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT $ 39)) . #5#)
                       (LETT |n0| 1 . #5#)
                       (SEQ (LETT |a| NIL . #5#) (LETT #1# |l| . #5#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |a| (CAR #1#) . #5#) NIL))
                              (GO G191)))
                            (SEQ (LETT |off0| 0 . #5#)
                                 (LETT |nr| (SPADCALL |dl| 1 (QREFELT $ 46))
                                       . #5#)
                                 (LETT |dl| (CDR |dl|) . #5#)
                                 (LETT |n2|
                                       (SPADCALL (ELT $ 48) |dl| 1
                                                 (QREFELT $ 61))
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
                                                                              62))
                                                                    . #5#)
                                                              (SPADCALL |res|
                                                                        |off_r|
                                                                        |ind_c|
                                                                        |vv|
                                                                        (QREFELT
                                                                         $ 34))
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

(DEFUN |MATCAT-;kroneckerSum;3S;22| (|a| |b| $)
  (SPADCALL (LIST |a| |b|) (QREFELT $ 64))) 

(DEFUN |MATCAT-;diagonalMatrix;LS;23| (|list| $)
  (PROG (|loC| |loR| |j| #1=#:G458 |l| |i| #2=#:G457 |k| |hiC| |hiR| #3=#:G456
         |mat| |ans| |cols| |rows| #4=#:G455)
    (RETURN
     (SEQ (LETT |rows| 0 . #5=(|MATCAT-;diagonalMatrix;LS;23|))
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
          (LETT |ans| (SPADCALL |rows| |cols| (QREFELT $ 39)) . #5#)
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
                                        (QREFELT $ 34))))
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

(DEFUN |MATCAT-;coerce;ColS;24| (|v| $)
  (PROG (#1=#:G462 |i| #2=#:G463 |k| |one| |x|)
    (RETURN
     (SEQ
      (LETT |x|
            (SPADCALL (SPADCALL |v| (QREFELT $ 67)) 1 (|spadConstant| $ 29)
                      (QREFELT $ 31))
            . #3=(|MATCAT-;coerce;ColS;24|))
      (LETT |one| (SPADCALL |x| (QREFELT $ 19)) . #3#)
      (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 68)) . #3#)
           (LETT #2# (SPADCALL |v| (QREFELT $ 69)) . #3#)
           (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #3#)
           (LETT #1# (SPADCALL |x| (QREFELT $ 18)) . #3#) G190
           (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |x| |i| |one| (SPADCALL |v| |k| (QREFELT $ 70))
                       (QREFELT $ 34))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |MATCAT-;transpose;RowS;25| (|v| $)
  (PROG (#1=#:G467 |j| #2=#:G468 |k| |one| |x|)
    (RETURN
     (SEQ
      (LETT |x|
            (SPADCALL 1 (SPADCALL |v| (QREFELT $ 72)) (|spadConstant| $ 29)
                      (QREFELT $ 31))
            . #3=(|MATCAT-;transpose;RowS;25|))
      (LETT |one| (SPADCALL |x| (QREFELT $ 17)) . #3#)
      (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 73)) . #3#)
           (LETT #2# (SPADCALL |v| (QREFELT $ 74)) . #3#)
           (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #3#)
           (LETT #1# (SPADCALL |x| (QREFELT $ 20)) . #3#) G190
           (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |x| |one| |j| (SPADCALL |v| |k| (QREFELT $ 75))
                       (QREFELT $ 34))))
           (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |MATCAT-;transpose;2S;26| (|x| $)
  (PROG (#1=#:G474 |j| #2=#:G473 |i| |ans|)
    (RETURN
     (SEQ
      (LETT |ans|
            (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                      (SPADCALL |x| (QREFELT $ 11)) (|spadConstant| $ 29)
                      (QREFELT $ 31))
            . #3=(|MATCAT-;transpose;2S;26|))
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
                              (QREFELT $ 34))))
                  (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |MATCAT-;squareTop;2S;27| (|x| $)
  (PROG (#1=#:G481 |j| #2=#:G480 |i| |ans| |cols|)
    (RETURN
     (SEQ
      (COND
       ((< (SPADCALL |x| (QREFELT $ 11))
           (LETT |cols| (SPADCALL |x| (QREFELT $ 12))
                 . #3=(|MATCAT-;squareTop;2S;27|)))
        (|error| "squareTop: number of columns exceeds number of rows"))
       ('T
        (SEQ
         (LETT |ans|
               (SPADCALL |cols| |cols| (|spadConstant| $ 29) (QREFELT $ 31))
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
                                 (QREFELT $ 34))))
                     (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;horizConcat;3S;28| (|x| |y| $)
  (PROG (#1=#:G492 |j| #2=#:G491 |i| #3=#:G490 #4=#:G489 |ans| |cols| |rows|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |rows| (SPADCALL |x| (QREFELT $ 11))
               . #5=(|MATCAT-;horizConcat;3S;28|))
         (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 33))
        (|error| "HConcat: matrices must have same number of rows"))
       ('T
        (SEQ
         (LETT |ans|
               (SPADCALL |rows|
                         (+ (LETT |cols| (SPADCALL |x| (QREFELT $ 12)) . #5#)
                            (SPADCALL |y| (QREFELT $ 12)))
                         (|spadConstant| $ 29) (QREFELT $ 31))
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
                                 (QREFELT $ 34))))
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
                                 (QREFELT $ 34))))
                     (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;vertConcat;3S;29| (|x| |y| $)
  (PROG (#1=#:G503 |j| #2=#:G502 |i| #3=#:G501 #4=#:G500 |ans| |rows| |cols|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |cols| (SPADCALL |x| (QREFELT $ 12))
               . #5=(|MATCAT-;vertConcat;3S;29|))
         (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 33))
        (|error| "HConcat: matrices must have same number of columns"))
       ('T
        (SEQ
         (LETT |ans|
               (SPADCALL
                (+ (LETT |rows| (SPADCALL |x| (QREFELT $ 11)) . #5#)
                   (SPADCALL |y| (QREFELT $ 11)))
                |cols| (|spadConstant| $ 29) (QREFELT $ 31))
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
                                 (QREFELT $ 34))))
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
                                 (QREFELT $ 34))))
                     (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;listOfLists;SL;30| (|x| $)
  (PROG (|ll| |l| #1=#:G510 |j| #2=#:G509 |i|)
    (RETURN
     (SEQ (LETT |ll| NIL . #3=(|MATCAT-;listOfLists;SL;30|))
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

(DEFUN |MATCAT-;swapRows!;S2IS;31| (|x| |i1| |i2| $)
  (PROG (|r| #1=#:G520 |j|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |i1| (SPADCALL |x| (QREFELT $ 17)))
            (OR (SPADCALL |i1| (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 82))
                (OR (< |i2| (SPADCALL |x| (QREFELT $ 17)))
                    (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 18))
                              (QREFELT $ 82)))))
        (|error| "swapRows!: index out of range"))
       ('T
        (COND ((EQL |i1| |i2|) |x|)
              ('T
               (SEQ
                (SEQ
                 (LETT |j| (SPADCALL |x| (QREFELT $ 19))
                       . #2=(|MATCAT-;swapRows!;S2IS;31|))
                 (LETT #1# (SPADCALL |x| (QREFELT $ 20)) . #2#) G190
                 (COND ((> |j| #1#) (GO G191)))
                 (SEQ (LETT |r| (SPADCALL |x| |i1| |j| (QREFELT $ 22)) . #2#)
                      (SPADCALL |x| |i1| |j|
                                (SPADCALL |x| |i2| |j| (QREFELT $ 22))
                                (QREFELT $ 34))
                      (EXIT (SPADCALL |x| |i2| |j| |r| (QREFELT $ 34))))
                 (LETT |j| (+ |j| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))))))))) 

(DEFUN |MATCAT-;swapColumns!;S2IS;32| (|x| |j1| |j2| $)
  (PROG (|r| #1=#:G530 |i|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |j1| (SPADCALL |x| (QREFELT $ 19)))
            (OR (SPADCALL |j1| (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 82))
                (OR (< |j2| (SPADCALL |x| (QREFELT $ 19)))
                    (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 20))
                              (QREFELT $ 82)))))
        (|error| "swapColumns!: index out of range"))
       ('T
        (COND ((EQL |j1| |j2|) |x|)
              ('T
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |x| (QREFELT $ 17))
                       . #2=(|MATCAT-;swapColumns!;S2IS;32|))
                 (LETT #1# (SPADCALL |x| (QREFELT $ 18)) . #2#) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ (LETT |r| (SPADCALL |x| |i| |j1| (QREFELT $ 22)) . #2#)
                      (SPADCALL |x| |i| |j1|
                                (SPADCALL |x| |i| |j2| (QREFELT $ 22))
                                (QREFELT $ 34))
                      (EXIT (SPADCALL |x| |i| |j2| |r| (QREFELT $ 34))))
                 (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))))))))) 

(DEFUN |MATCAT-;elt;S2LS;33| (|x| |rowList| |colList| $)
  (PROG (#1=#:G545 |ej| #2=#:G546 |j| #3=#:G543 |ei| #4=#:G544 |i| |y|
         #5=#:G536 #6=#:G542 #7=#:G533 #8=#:G541)
    (RETURN
     (SEQ
      (SEQ
       (EXIT
        (SEQ (LETT |ei| NIL . #9=(|MATCAT-;elt;S2LS;33|))
             (LETT #8# |rowList| . #9#) G190
             (COND
              ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#) . #9#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((OR (< |ei| (SPADCALL |x| (QREFELT $ 17)))
                     (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 18))
                               (QREFELT $ 82)))
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
                               (QREFELT $ 82)))
                 (PROGN
                  (LETT #5# (|error| "elt: index out of range") . #9#)
                  (GO #5#))))))
             (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL)))
       #5# (EXIT #5#))
      (LETT |y|
            (SPADCALL (LENGTH |rowList|) (LENGTH |colList|)
                      (|spadConstant| $ 29) (QREFELT $ 31))
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
                              (QREFELT $ 34))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #9#)) . #9#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1) . #9#)) . #9#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |y|))))) 

(DEFUN |MATCAT-;setelt;S2L2S;34| (|x| |rowList| |colList| |y| $)
  (PROG (#1=#:G563 |ej| #2=#:G564 |j| #3=#:G561 |ei| #4=#:G562 |i| #5=#:G552
         #6=#:G560 #7=#:G549 #8=#:G559)
    (RETURN
     (SEQ
      (SEQ
       (EXIT
        (SEQ (LETT |ei| NIL . #9=(|MATCAT-;setelt;S2L2S;34|))
             (LETT #8# |rowList| . #9#) G190
             (COND
              ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#) . #9#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((OR (< |ei| (SPADCALL |x| (QREFELT $ 17)))
                     (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 18))
                               (QREFELT $ 82)))
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
                               (QREFELT $ 82)))
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
                              (QREFELT $ 34))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #9#)) . #9#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1) . #9#)) . #9#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |y|))))) 

(DEFUN |MATCAT-;subMatrix;S4IS;35| (|x| |i1| |i2| |j1| |j2| $)
  (PROG (#1=#:G576 |j| |l| #2=#:G575 |i| |k| |y| |cols| |rows|)
    (RETURN
     (SEQ
      (COND ((< (+ |i2| 1) |i1|) (|error| "subMatrix: bad row indices"))
            ((< (+ |j2| 1) |j1|) (|error| "subMatrix: bad column indices"))
            ('T
             (SEQ
              (LETT |rows| (+ (- |i2| |i1|) 1)
                    . #3=(|MATCAT-;subMatrix;S4IS;35|))
              (LETT |cols| (+ (- |j2| |j1|) 1) . #3#)
              (LETT |y|
                    (SPADCALL |rows| |cols| (|spadConstant| $ 29)
                              (QREFELT $ 31))
                    . #3#)
              (COND ((OR (EQL |rows| 0) (EQL |cols| 0)) (EXIT |y|)))
              (COND
               ((OR (< |i1| (SPADCALL |x| (QREFELT $ 17)))
                    (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 18))
                              (QREFELT $ 82)))
                (EXIT (|error| "subMatrix: index out of range"))))
              (COND
               ((OR (< |j1| (SPADCALL |x| (QREFELT $ 19)))
                    (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 20))
                              (QREFELT $ 82)))
                (EXIT (|error| "subMatrix: index out of range"))))
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
                                      (QREFELT $ 34))))
                          (LETT |j|
                                (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #3#))
                                . #3#)
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))))))) 

(DEFUN |MATCAT-;setsubMatrix!;S2I2S;36| (|x| |i1| |j1| |y| $)
  (PROG (#1=#:G586 |j| |l| #2=#:G585 |i| |k| |j2| |i2|)
    (RETURN
     (SEQ
      (LETT |i2| (- (+ |i1| (SPADCALL |y| (QREFELT $ 11))) 1)
            . #3=(|MATCAT-;setsubMatrix!;S2I2S;36|))
      (LETT |j2| (- (+ |j1| (SPADCALL |y| (QREFELT $ 12))) 1) . #3#)
      (COND
       ((OR (< |i1| (SPADCALL |x| (QREFELT $ 17)))
            (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 82)))
        (EXIT
         (|error|
          "setsubMatrix!: inserted matrix too big, use subMatrix to restrict it"))))
      (COND
       ((OR (< |j1| (SPADCALL |x| (QREFELT $ 19)))
            (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 82)))
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
                              (QREFELT $ 34))))
                  (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #3#)) . #3#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |MATCAT-;+;3S;37| (|x| |y| $)
  (PROG (#1=#:G596 |j| #2=#:G595 |i| |ans| |c| |r|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (SPADCALL
          (LETT |r| (SPADCALL |x| (QREFELT $ 11)) . #3=(|MATCAT-;+;3S;37|))
          (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 33))
         (SPADCALL (LETT |c| (SPADCALL |x| (QREFELT $ 12)) . #3#)
                   (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 33)))
        (|error| "can't add matrices of different dimensions"))
       ('T
        (SEQ
         (LETT |ans| (SPADCALL |r| |c| (|spadConstant| $ 29) (QREFELT $ 31))
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
                                  (QREFELT $ 62))
                                 (QREFELT $ 34))))
                     (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;-;3S;38| (|x| |y| $)
  (PROG (#1=#:G606 |j| #2=#:G605 |i| |ans| |c| |r|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (SPADCALL
          (LETT |r| (SPADCALL |x| (QREFELT $ 11)) . #3=(|MATCAT-;-;3S;38|))
          (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 33))
         (SPADCALL (LETT |c| (SPADCALL |x| (QREFELT $ 12)) . #3#)
                   (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 33)))
        (|error| "can't subtract matrices of different dimensions"))
       ('T
        (SEQ
         (LETT |ans| (SPADCALL |r| |c| (|spadConstant| $ 29) (QREFELT $ 31))
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
                                  (QREFELT $ 91))
                                 (QREFELT $ 34))))
                     (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;-;2S;39| (|x| $) (SPADCALL (ELT $ 27) |x| (QREFELT $ 94))) 

(DEFUN |MATCAT-;*;I2S;40| (|m| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|MATCAT-;*;I2S;40!0| (VECTOR $ |m|)) |x|
               (QREFELT $ 94))))) 

(DEFUN |MATCAT-;*;I2S;40!0| (|r1| $$)
  (PROG (|m| $)
    (LETT |m| (QREFELT $$ 1) . #1=(|MATCAT-;*;I2S;40|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |m| |r1| (QREFELT $ 96)))))) 

(DEFUN |MATCAT-;*;R2S;41| (|a| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|MATCAT-;*;R2S;41!0| (VECTOR $ |a|)) |x|
               (QREFELT $ 94))))) 

(DEFUN |MATCAT-;*;R2S;41!0| (|r1| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1) . #1=(|MATCAT-;*;R2S;41|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a| |r1| (QREFELT $ 47)))))) 

(DEFUN |MATCAT-;*;SRS;42| (|x| |a| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|MATCAT-;*;SRS;42!0| (VECTOR $ |a|)) |x|
               (QREFELT $ 94))))) 

(DEFUN |MATCAT-;*;SRS;42!0| (|r1| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1) . #1=(|MATCAT-;*;SRS;42|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |a| (QREFELT $ 47)))))) 

(DEFUN |MATCAT-;*;3S;43| (|x| |y| $)
  (PROG (|entry| |sum| #1=#:G624 |k| #2=#:G625 |l| #3=#:G623 |j| #4=#:G622 |i|
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
                         (QREFELT $ 31))
               . #5=(|MATCAT-;*;3S;43|))
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
                                                     (QREFELT $ 47))
                                                    (QREFELT $ 62))
                                          . #5#)))
                                  (LETT |k|
                                        (PROG1 (+ |k| 1)
                                          (LETT |l| (+ |l| 1) . #5#))
                                        . #5#)
                                  (GO G190) G191 (EXIT NIL))
                                 (EXIT |sum|))
                            . #5#)
                      (EXIT (SPADCALL |ans| |i| |j| |entry| (QREFELT $ 34))))
                     (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |MATCAT-;positivePower;SIS;44| (|x| |n| $)
  (PROG (|y|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 1) |x|)
            ((ODDP |n|)
             (SPADCALL |x| (SPADCALL |x| (- |n| 1) (QREFELT $ 101))
                       (QREFELT $ 102)))
            ('T
             (SEQ
              (LETT |y| (SPADCALL |x| (QUOTIENT2 |n| 2) (QREFELT $ 101))
                    |MATCAT-;positivePower;SIS;44|)
              (EXIT (SPADCALL |y| |y| (QREFELT $ 102)))))))))) 

(DEFUN |MATCAT-;^;SNniS;45| (|x| |n| $)
  (PROG (|nn|)
    (RETURN
     (COND
      ((NULL
        (EQL (LETT |nn| (SPADCALL |x| (QREFELT $ 11)) |MATCAT-;^;SNniS;45|)
             (SPADCALL |x| (QREFELT $ 12))))
       (|error| "^: matrix must be square"))
      ('T
       (COND
        ((ZEROP |n|) (SPADCALL |nn| (|spadConstant| $ 43) (QREFELT $ 104)))
        ('T (SPADCALL |x| |n| (QREFELT $ 101))))))))) 

(DEFUN |MATCAT-;*;S2Col;46| (|x| |v| $)
  (PROG (|sum| #1=#:G640 |j| #2=#:G641 |l| #3=#:G638 |i| #4=#:G639 |k| |w|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |x| (QREFELT $ 12)) (SPADCALL |v| (QREFELT $ 67))
                  (QREFELT $ 21))
        (|error| "can't multiply matrix A and vector v if #cols A ~= #v"))
       ('T
        (SEQ
         (LETT |w|
               (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (|spadConstant| $ 29)
                         (QREFELT $ 106))
               . #5=(|MATCAT-;*;S2Col;46|))
         (SEQ (LETT |k| (SPADCALL |w| (QREFELT $ 68)) . #5#)
              (LETT #4# (SPADCALL |w| (QREFELT $ 69)) . #5#)
              (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #5#)
              (LETT #3# (SPADCALL |x| (QREFELT $ 18)) . #5#) G190
              (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
              (SEQ
               (EXIT
                (SPADCALL |w| |k|
                          (SEQ (LETT |sum| (|spadConstant| $ 29) . #5#)
                               (SEQ
                                (LETT |l| (SPADCALL |v| (QREFELT $ 68)) . #5#)
                                (LETT #2# (SPADCALL |v| (QREFELT $ 69)) . #5#)
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
                                                             (QREFELT $ 107))
                                                   (QREFELT $ 47))
                                                  (QREFELT $ 62))
                                        . #5#)))
                                (LETT |j|
                                      (PROG1 (+ |j| 1)
                                        (LETT |l| (+ |l| 1) . #5#))
                                      . #5#)
                                (GO G190) G191 (EXIT NIL))
                               (EXIT |sum|))
                          (QREFELT $ 108))))
              (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #5#)) . #5#)
              (GO G190) G191 (EXIT NIL))
         (EXIT |w|)))))))) 

(DEFUN |MATCAT-;*;RowSRow;47| (|v| |x| $)
  (PROG (|sum| #1=#:G650 |i| #2=#:G651 |l| #3=#:G648 |j| #4=#:G649 |k| |w|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |v| (QREFELT $ 72))
                  (QREFELT $ 21))
        (|error| "can't multiply vector v and matrix A if #rows A ~= #v"))
       ('T
        (SEQ
         (LETT |w|
               (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (|spadConstant| $ 29)
                         (QREFELT $ 110))
               . #5=(|MATCAT-;*;RowSRow;47|))
         (SEQ (LETT |k| (SPADCALL |w| (QREFELT $ 73)) . #5#)
              (LETT #4# (SPADCALL |w| (QREFELT $ 74)) . #5#)
              (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #5#)
              (LETT #3# (SPADCALL |x| (QREFELT $ 20)) . #5#) G190
              (COND ((OR (> |j| #3#) (> |k| #4#)) (GO G191)))
              (SEQ
               (EXIT
                (SPADCALL |w| |k|
                          (SEQ (LETT |sum| (|spadConstant| $ 29) . #5#)
                               (SEQ
                                (LETT |l| (SPADCALL |v| (QREFELT $ 73)) . #5#)
                                (LETT #2# (SPADCALL |v| (QREFELT $ 74)) . #5#)
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
                                                             (QREFELT $ 111))
                                                   (QREFELT $ 47))
                                                  (QREFELT $ 62))
                                        . #5#)))
                                (LETT |i|
                                      (PROG1 (+ |i| 1)
                                        (LETT |l| (+ |l| 1) . #5#))
                                      . #5#)
                                (GO G190) G191 (EXIT NIL))
                               (EXIT |sum|))
                          (QREFELT $ 112))))
              (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #5#)) . #5#)
              (GO G190) G191 (EXIT NIL))
         (EXIT |w|)))))))) 

(DEFUN |MATCAT-;columnSpace;SL;48| (M $)
  (PROG (|indRow| |basis| |k| |m| |n| M2)
    (RETURN
     (SEQ
      (LETT M2 (SPADCALL M (QREFELT $ 114)) . #1=(|MATCAT-;columnSpace;SL;48|))
      (LETT |basis| NIL . #1#) (LETT |n| (SPADCALL M (QREFELT $ 12)) . #1#)
      (LETT |m| (SPADCALL M (QREFELT $ 11)) . #1#) (LETT |indRow| 1 . #1#)
      (SEQ (LETT |k| 1 . #1#) G190
           (COND
            ((OR (|greater_SI| |k| |n|)
                 (NULL (SPADCALL |indRow| |m| (QREFELT $ 115))))
             (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((NULL
                (SPADCALL (SPADCALL M2 |indRow| |k| (QREFELT $ 116))
                          (QREFELT $ 23)))
               (SEQ
                (LETT |basis| (CONS (SPADCALL M |k| (QREFELT $ 117)) |basis|)
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
                                         (SPADCALL (|spadConstant| $ 43)
                                                   (QREFELT $ 27)))
                                        ((EQL |i| (- |j| 1))
                                         (COND
                                          ((ODDP |i|) (|spadConstant| $ 43))
                                          ('T (|spadConstant| $ 29))))
                                        ('T (|spadConstant| $ 29))))
                                      ((EQL |i| (- |j| 1))
                                       (COND ((ODDP |i|) (|spadConstant| $ 43))
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
       (QREFELT $ 120)))))) 

(DEFUN |MATCAT-;PfChar| (A $)
  (PROG (|res| #1=#:G679 |e| #2=#:G680 |k| |c| |i| #3=#:G678 |j| |g| C B
         #4=#:G668 |d| |p| |s| |r| M |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL A (QREFELT $ 11)) . #5=(|MATCAT-;PfChar|))
          (EXIT
           (COND
            ((EQL |n| 2)
             (SPADCALL (SPADCALL (|spadConstant| $ 43) 2 (QREFELT $ 122))
                       (SPADCALL (SPADCALL A 1 2 (QREFELT $ 22))
                                 (QREFELT $ 123))
                       (QREFELT $ 124)))
            ('T
             (SEQ (LETT M (SPADCALL A 3 |n| 3 |n| (QREFELT $ 125)) . #5#)
                  (LETT |r| (SPADCALL A 1 1 3 |n| (QREFELT $ 125)) . #5#)
                  (LETT |s| (SPADCALL A 3 |n| 2 2 (QREFELT $ 125)) . #5#)
                  (LETT |p| (|MATCAT-;PfChar| M $) . #5#)
                  (LETT |d| (SPADCALL |p| (QREFELT $ 126)) . #5#)
                  (LETT B
                        (|MATCAT-;B0|
                         (PROG1 (LETT #4# (- |n| 2) . #5#)
                           (|check_subtype| (> #4# 0) '(|PositiveInteger|)
                                            #4#))
                         $)
                        . #5#)
                  (LETT C (SPADCALL |r| B (QREFELT $ 102)) . #5#)
                  (LETT |g|
                        (LIST
                         (SPADCALL (SPADCALL C |s| (QREFELT $ 102)) 1 1
                                   (QREFELT $ 22))
                         (SPADCALL A 1 2 (QREFELT $ 22)) (|spadConstant| $ 43))
                        . #5#)
                  (COND
                   ((>= |d| 4)
                    (SEQ (LETT B (SPADCALL M B (QREFELT $ 102)) . #5#)
                         (EXIT
                          (SEQ (LETT |i| 4 . #5#) G190
                               (COND ((> |i| |d|) (GO G191)))
                               (SEQ
                                (LETT C (SPADCALL C B (QREFELT $ 102)) . #5#)
                                (EXIT
                                 (LETT |g|
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL C |s| (QREFELT $ 102)) 1 1
                                         (QREFELT $ 22))
                                        |g|)
                                       . #5#)))
                               (LETT |i| (+ |i| 2) . #5#) (GO G190) G191
                               (EXIT NIL))))))
                  (LETT |g| (NREVERSE |g|) . #5#)
                  (LETT |res| (|spadConstant| $ 127) . #5#)
                  (SEQ (LETT |j| 2 . #5#) (LETT #3# (+ |d| 2) . #5#)
                       (LETT |i| 0 . #5#) G190
                       (COND
                        ((OR (> |i| |d|) (|greater_SI| |j| #3#)) (GO G191)))
                       (SEQ (LETT |c| (SPADCALL |p| |i| (QREFELT $ 128)) . #5#)
                            (EXIT
                             (SEQ (LETT |k| 2 . #5#) (LETT #2# (- |d|) . #5#)
                                  (LETT |e| NIL . #5#)
                                  (LETT #1# (SPADCALL |g| |j| (QREFELT $ 129))
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
                                                               (QREFELT $ 47))
                                                     (+ |k| |i|)
                                                     (QREFELT $ 122))
                                                    (QREFELT $ 124))
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

(DEFUN |MATCAT-;Pfaffian;SR;51| (A $)
  (COND
   ((SPADCALL A (QREFELT $ 130))
    (COND ((ODDP (SPADCALL A (QREFELT $ 11))) (|spadConstant| $ 29))
          (#1='T
           (SPADCALL (|MATCAT-;PfChar| A $) (|spadConstant| $ 29)
                     (QREFELT $ 131)))))
   (#1# (|error| "Pfaffian: only defined for antisymmetric square matrices!")))) 

(DEFUN |MATCAT-;exquo;SRU;52| (|x| |a| $)
  (PROG (|entry| #1=#:G695 |r| #2=#:G697 |j| #3=#:G696 |i| |ans|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ans|
              (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                        (SPADCALL |x| (QREFELT $ 12)) (|spadConstant| $ 29)
                        (QREFELT $ 31))
              . #4=(|MATCAT-;exquo;SRU;52|))
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
                                   (QREFELT $ 134))
                                  . #4#)
                            (EXIT
                             (COND
                              ((QEQCAR |r| 1)
                               (PROGN
                                (LETT #1# (CONS 1 "failed") . #4#)
                                (GO #1#)))
                              ('T (QCDR |r|)))))
                           . #4#)
                     (EXIT (SPADCALL |ans| |i| |j| |entry| (QREFELT $ 34))))
                    (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))))
             (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |ans|))))
      #1# (EXIT #1#))))) 

(DEFUN |MATCAT-;/;SRS;53| (|x| |r| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|MATCAT-;/;SRS;53!0| (VECTOR $ |r|)) |x|
               (QREFELT $ 94))))) 

(DEFUN |MATCAT-;/;SRS;53!0| (|r1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|MATCAT-;/;SRS;53|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |r| (QREFELT $ 136)))))) 

(DEFUN |MATCAT-;^;SIS;54| (|x| |n| $)
  (PROG (|xInv| |nn|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (EQL
          (LETT |nn| (SPADCALL |x| (QREFELT $ 11)) . #1=(|MATCAT-;^;SIS;54|))
          (SPADCALL |x| (QREFELT $ 12))))
        (|error| "^: matrix must be square"))
       ('T
        (COND
         ((ZEROP |n|) (SPADCALL |nn| (|spadConstant| $ 43) (QREFELT $ 104)))
         ((SPADCALL |n| (QREFELT $ 138)) (SPADCALL |x| |n| (QREFELT $ 101)))
         (#2='T
          (SEQ (LETT |xInv| (SPADCALL |x| (QREFELT $ 139)) . #1#)
               (EXIT
                (COND
                 ((QEQCAR |xInv| 1) (|error| "^: matrix must be invertible"))
                 (#2#
                  (SPADCALL (QCDR |xInv|) (- |n|) (QREFELT $ 101)))))))))))))) 

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
      (LETT $ (GETREFV 142) . #1#)
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
      (QSETREFV $ 44
                (COND
                 ((|HasCategory| |#2| '(|SemiRing|))
                  (CONS 0 (|spadConstant| $ 43)))
                 ('T (CONS 1 "one"))))
      (COND
       ((|domainEqual| |#1| (|Matrix| |#2|))
        (PROGN
         (QSETREFV $ 56
                   (CONS
                    (|dispatchFunction|
                     |MATCAT-;kronecker_prod1;SILL2NniUV;12|)
                    $))
         (QSETREFV $ 58
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;LS;13|)
                         $))
         (QSETREFV $ 60
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;3S;14|)
                         $))
         (QSETREFV $ 63
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;15|) $))
         (QSETREFV $ 65
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;16|) $))
         (QSETREFV $ 66
                   (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;17|)
                         $))))
       ('T
        (PROGN
         (QSETREFV $ 56
                   (CONS
                    (|dispatchFunction|
                     |MATCAT-;kronecker_prod1;SILL2NniUV;18|)
                    $))
         (QSETREFV $ 58
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;LS;19|)
                         $))
         (QSETREFV $ 60
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;3S;20|)
                         $))
         (QSETREFV $ 63
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;21|) $))
         (QSETREFV $ 65
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;22|) $))
         (QSETREFV $ 66
                   (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;23|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 6)
        (PROGN
         (QSETREFV $ 92 (CONS (|dispatchFunction| |MATCAT-;-;3S;38|) $))
         (QSETREFV $ 95 (CONS (|dispatchFunction| |MATCAT-;-;2S;39|) $))
         (QSETREFV $ 97 (CONS (|dispatchFunction| |MATCAT-;*;I2S;40|) $)))))
      (COND
       ((|testBitVector| |pv$| 5)
        (QSETREFV $ 105 (CONS (|dispatchFunction| |MATCAT-;^;SNniS;45|) $))))
      (COND
       ((|HasCategory| |#4| '(|shallowlyMutable|))
        (QSETREFV $ 109 (CONS (|dispatchFunction| |MATCAT-;*;S2Col;46|) $))))
      (COND
       ((|HasCategory| |#3| '(|shallowlyMutable|))
        (QSETREFV $ 113 (CONS (|dispatchFunction| |MATCAT-;*;RowSRow;47|) $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (QSETREFV $ 119
                  (CONS (|dispatchFunction| |MATCAT-;columnSpace;SL;48|) $))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 132
                   (CONS (|dispatchFunction| |MATCAT-;Pfaffian;SR;51|) $)))))
      (COND
       ((|testBitVector| |pv$| 4)
        (QSETREFV $ 135 (CONS (|dispatchFunction| |MATCAT-;exquo;SRU;52|) $))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 137 (CONS (|dispatchFunction| |MATCAT-;/;SRS;53|) $))
         (QSETREFV $ 140 (CONS (|dispatchFunction| |MATCAT-;^;SIS;54|) $)))))
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
              (64 . |antisymmetric?|) (69 . |Zero|) |MATCAT-;zero?;SB;5|
              (73 . |new|) |MATCAT-;zero;2NniS;6| (80 . ~=) (86 . |qsetelt!|)
              (|List| 41) |MATCAT-;matrix;LS;7| (|Mapping| 7 16 16)
              |MATCAT-;matrix;2NniMS;8| (94 . |zero|)
              |MATCAT-;scalarMatrix;NniRS;9| (|List| 7)
              |MATCAT-;diagonalMatrix;LS;10| (100 . |One|) '|maybe_1|
              (|List| 10) (104 . |elt|) (110 . *) (116 . *)
              (|Mapping| 10 10 10) (122 . |reduce|) (|Void|) (|List| 45)
              (|List| $) (|Union| 7 '"one") (128 . |kronecker_prod1|)
              (139 . |kronecker_prod1|) (150 . |copy|)
              (155 . |kroneckerProduct|) (160 . |kroneckerProduct|)
              (165 . |kroneckerProduct|) (171 . |reduce|) (178 . +)
              (184 . |kroneckerSum|) (189 . |kroneckerSum|)
              (194 . |kroneckerSum|) (200 . |diagonalMatrix|) (205 . |#|)
              (210 . |minIndex|) (215 . |maxIndex|) (220 . |qelt|)
              |MATCAT-;coerce;ColS;24| (226 . |#|) (231 . |minIndex|)
              (236 . |maxIndex|) (241 . |qelt|) |MATCAT-;transpose;RowS;25|
              |MATCAT-;transpose;2S;26| |MATCAT-;squareTop;2S;27|
              |MATCAT-;horizConcat;3S;28| |MATCAT-;vertConcat;3S;29|
              |MATCAT-;listOfLists;SL;30| (247 . >) |MATCAT-;swapRows!;S2IS;31|
              |MATCAT-;swapColumns!;S2IS;32| (|List| 16) |MATCAT-;elt;S2LS;33|
              |MATCAT-;setelt;S2L2S;34| |MATCAT-;subMatrix;S4IS;35|
              |MATCAT-;setsubMatrix!;S2I2S;36| |MATCAT-;+;3S;37| (253 . -)
              (259 . -) (|Mapping| 7 7) (265 . |map|) (271 . -) (276 . *)
              (282 . *) |MATCAT-;*;R2S;41| |MATCAT-;*;SRS;42| |MATCAT-;*;3S;43|
              (288 . |positivePower|) (294 . *) |MATCAT-;positivePower;SIS;44|
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
           '#(|zero?| 499 |zero| 504 |vertConcat| 510 |transpose| 516
              |symmetric?| 526 |swapRows!| 531 |swapColumns!| 538 |subMatrix|
              545 |squareTop| 554 |square?| 559 |setsubMatrix!| 564 |setelt|
              572 |scalarMatrix| 580 |positivePower| 586 |matrix| 592
              |listOfLists| 604 |kronecker_prod1| 609 |kroneckerSum| 620
              |kroneckerProduct| 631 |horizConcat| 642 |exquo| 648 |elt| 654
              |diagonalMatrix| 661 |diagonal?| 671 |columnSpace| 676 |coerce|
              681 |antisymmetric?| 686 ^ 691 |Pfaffian| 703 / 708 - 714 + 725 *
              731)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 140
                                                 '(1 6 10 0 11 1 6 10 0 12 1 6
                                                   13 0 15 1 6 16 0 17 1 6 16 0
                                                   18 1 6 16 0 19 1 6 16 0 20 2
                                                   16 13 0 0 21 3 6 7 0 16 16
                                                   22 1 7 13 0 23 2 7 13 0 0 25
                                                   1 7 0 0 27 1 0 13 0 28 0 7 0
                                                   29 3 6 0 10 10 7 31 2 10 13
                                                   0 0 33 4 6 7 0 16 16 7 34 2
                                                   6 0 10 10 39 0 7 0 43 2 45
                                                   10 0 16 46 2 7 0 0 0 47 2 10
                                                   0 10 0 48 2 45 10 49 0 50 7
                                                   6 51 0 16 52 53 10 10 54 55
                                                   7 0 51 0 16 52 53 10 10 54
                                                   56 1 6 0 0 57 1 0 0 53 58 1
                                                   6 0 53 59 2 0 0 0 0 60 3 45
                                                   10 49 0 10 61 2 7 0 0 0 62 1
                                                   0 0 53 63 1 6 0 53 64 2 0 0
                                                   0 0 65 1 0 0 53 66 1 9 10 0
                                                   67 1 9 16 0 68 1 9 16 0 69 2
                                                   9 7 0 16 70 1 8 10 0 72 1 8
                                                   16 0 73 1 8 16 0 74 2 8 7 0
                                                   16 75 2 16 13 0 0 82 2 7 0 0
                                                   0 91 2 0 0 0 0 92 2 6 0 93 0
                                                   94 1 0 0 0 95 2 7 0 16 0 96
                                                   2 0 0 16 0 97 2 6 0 0 16 101
                                                   2 6 0 0 0 102 2 6 0 10 7 104
                                                   2 0 0 0 10 105 2 9 0 10 7
                                                   106 2 9 7 0 16 107 3 9 7 0
                                                   16 7 108 2 0 9 0 9 109 2 8 0
                                                   10 7 110 2 8 7 0 16 111 3 8
                                                   7 0 16 7 112 2 0 8 8 0 113 1
                                                   6 0 0 114 2 16 13 0 0 115 3
                                                   6 7 0 16 16 116 2 6 9 0 16
                                                   117 1 0 118 0 119 1 6 0 35
                                                   120 2 121 0 7 10 122 1 121 0
                                                   7 123 2 121 0 0 0 124 5 6 0
                                                   0 16 16 16 16 125 1 121 10 0
                                                   126 0 121 0 127 2 121 7 0 10
                                                   128 2 41 0 0 10 129 1 6 13 0
                                                   130 2 121 7 0 7 131 1 0 7 0
                                                   132 2 7 133 0 0 134 2 0 133
                                                   0 7 135 2 7 0 0 0 136 2 0 0
                                                   0 7 137 1 16 13 0 138 1 6
                                                   133 0 139 2 0 0 0 16 140 1 0
                                                   13 0 30 2 0 0 10 10 32 2 0 0
                                                   0 0 80 1 0 0 0 77 1 0 0 8 76
                                                   1 0 13 0 26 3 0 0 0 16 16 83
                                                   3 0 0 0 16 16 84 5 0 0 0 16
                                                   16 16 16 88 1 0 0 0 78 1 0
                                                   13 0 14 4 0 0 0 16 16 0 89 4
                                                   0 0 0 85 85 0 87 2 0 0 10 7
                                                   40 2 0 0 0 16 103 1 0 0 35
                                                   36 3 0 0 10 10 37 38 1 0 35
                                                   0 81 7 0 51 0 16 52 53 10 10
                                                   54 56 1 0 0 53 63 2 0 0 0 0
                                                   65 1 0 0 53 58 2 0 0 0 0 60
                                                   2 0 0 0 0 79 2 0 133 0 7 135
                                                   3 0 0 0 85 85 86 1 0 0 41 42
                                                   1 0 0 53 66 1 0 13 0 24 1 0
                                                   118 0 119 1 0 0 9 71 1 0 13
                                                   0 28 2 0 0 0 16 140 2 0 0 0
                                                   10 105 1 0 7 0 132 2 0 0 0 7
                                                   137 1 0 0 0 95 2 0 0 0 0 92
                                                   2 0 0 0 0 90 2 0 8 8 0 113 2
                                                   0 9 0 9 109 2 0 0 7 0 98 2 0
                                                   0 0 7 99 2 0 0 0 0 100 2 0 0
                                                   16 0 97)))))
           '|lookupComplete|)) 
