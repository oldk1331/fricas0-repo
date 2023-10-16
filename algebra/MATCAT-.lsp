
(SDEFUN |MATCAT-;square?;SB;1| ((|x| S) ($ |Boolean|))
        (EQL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |x| (QREFELT $ 12)))) 

(SDEFUN |MATCAT-;diagonal?;SB;2| ((|x| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G148 NIL) (#2=#:G149 NIL) (#3=#:G151 NIL) (|j| NIL)
          (#4=#:G150 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND ((NULL (SPADCALL |x| (QREFELT $ 15))) NIL)
                 ('T
                  (SEQ
                   (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)))
                        (LETT #4# (SPADCALL |x| (QREFELT $ 18))) G190
                        (COND ((> |i| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)))
                               (LETT #3# (SPADCALL |x| (QREFELT $ 20))) G190
                               (COND ((> |j| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (- |j| (SPADCALL |x| (QREFELT $ 19)))
                                    (- |i| (SPADCALL |x| (QREFELT $ 17)))
                                    (QREFELT $ 21))
                                   (COND
                                    ((NULL
                                      (SPADCALL
                                       (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                       (QREFELT $ 23)))
                                     (PROGN
                                      (LETT #1#
                                            (PROGN
                                             (LETT #2# NIL)
                                             (GO #5=#:G147)))
                                      (GO #6=#:G144))))))))
                               (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #1#))
                        (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                   (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |MATCAT-;symmetric?;SB;3| ((|x| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G158 NIL) (#2=#:G159 NIL) (#3=#:G161 NIL) (|j| NIL)
          (#4=#:G160 NIL) (|i| NIL) (|mc| (|Integer|)) (|mr| (|Integer|))
          (|nRows| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LETT |nRows| (SPADCALL |x| (QREFELT $ 11)))
                       (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 21))
             NIL)
            ('T
             (SEQ (LETT |mr| (SPADCALL |x| (QREFELT $ 17)))
                  (LETT |mc| (SPADCALL |x| (QREFELT $ 19)))
                  (SEQ (LETT |i| 0) (LETT #4# (- |nRows| 1)) G190
                       (COND ((|greater_SI| |i| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |j| (+ |i| 1)) (LETT #3# (- |nRows| 1))
                              G190 (COND ((> |j| #3#) (GO G191)))
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
                                   (LETT #1#
                                         (PROGN (LETT #2# NIL) (GO #5=#:G157)))
                                   (GO #6=#:G153))))))
                              (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                        #6# (EXIT #1#))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |MATCAT-;antisymmetric?;SB;4| ((|x| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G168 NIL) (#2=#:G169 NIL) (#3=#:G171 NIL) (|j| NIL)
          (#4=#:G170 NIL) (|i| NIL) (|mc| (|Integer|)) (|mr| (|Integer|))
          (|nRows| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LETT |nRows| (SPADCALL |x| (QREFELT $ 11)))
                       (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 21))
             NIL)
            ('T
             (SEQ (LETT |mr| (SPADCALL |x| (QREFELT $ 17)))
                  (LETT |mc| (SPADCALL |x| (QREFELT $ 19)))
                  (SEQ (LETT |i| 0) (LETT #4# (- |nRows| 1)) G190
                       (COND ((|greater_SI| |i| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |j| |i|) (LETT #3# (- |nRows| 1)) G190
                              (COND ((> |j| #3#) (GO G191)))
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
                                   (LETT #1#
                                         (PROGN (LETT #2# NIL) (GO #5=#:G167)))
                                   (GO #6=#:G163))))))
                              (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                        #6# (EXIT #1#))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |MATCAT-;zero?;SB;5| ((|x| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G177 NIL) (#2=#:G179 NIL) (|j| NIL) (#3=#:G178 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)))
                 (LETT #3# (SPADCALL |x| (QREFELT $ 18))) G190
                 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)))
                        (LETT #2# (SPADCALL |x| (QREFELT $ 20))) G190
                        (COND ((> |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                      (|spadConstant| $ 29) (QREFELT $ 25))
                            (PROGN (LETT #1# NIL) (GO #4=#:G176))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |MATCAT-;zero;2NniS;6|
        ((|rows| |NonNegativeInteger|) (|cols| |NonNegativeInteger|) ($ S))
        (SPADCALL |rows| |cols| (|spadConstant| $ 29) (QREFELT $ 31))) 

(SDEFUN |MATCAT-;matrix;LS;7| ((|l| |List| (|List| R)) ($ S))
        (SPROG
         ((#1=#:G191 NIL) (|j| NIL) (#2=#:G192 NIL) (|r| NIL) (#3=#:G189 NIL)
          (|i| NIL) (#4=#:G190 NIL) (|ll| NIL) (|ans| (S))
          (|rows| (|NonNegativeInteger|)) (#5=#:G188 NIL)
          (|cols| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((NULL |l|) (SPADCALL 0 0 (|spadConstant| $ 29) (QREFELT $ 31)))
           ('T
            (SEQ (LETT |rows| 1) (LETT |cols| (LENGTH (|SPADfirst| |l|)))
                 (SEQ (LETT |ll| NIL) (LETT #5# (CDR |l|)) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |ll| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |cols| (LENGTH |ll|) (QREFELT $ 33))
                          (|error| "matrix: rows of different lengths"))
                         ('T (LETT |rows| (+ |rows| 1))))))
                      (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                 (LETT |ans|
                       (SPADCALL |rows| |cols| (|spadConstant| $ 29)
                                 (QREFELT $ 31)))
                 (SEQ (LETT |ll| NIL) (LETT #4# |l|)
                      (LETT |i| (SPADCALL |ans| (QREFELT $ 17)))
                      (LETT #3# (SPADCALL |ans| (QREFELT $ 18))) G190
                      (COND
                       ((OR (> |i| #3#) (ATOM #4#)
                            (PROGN (LETT |ll| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |r| NIL) (LETT #2# |ll|)
                             (LETT |j| (SPADCALL |ans| (QREFELT $ 19)))
                             (LETT #1# (SPADCALL |ans| (QREFELT $ 20))) G190
                             (COND
                              ((OR (> |j| #1#) (ATOM #2#)
                                   (PROGN (LETT |r| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |ans| |i| |j| |r| (QREFELT $ 34))))
                             (LETT |j| (PROG1 (+ |j| 1) (LETT #2# (CDR #2#))))
                             (GO G190) G191 (EXIT NIL))))
                      (LETT |i| (PROG1 (+ |i| 1) (LETT #4# (CDR #4#))))
                      (GO G190) G191 (EXIT NIL))
                 (EXIT |ans|))))))) 

(SDEFUN |MATCAT-;matrix;2NniMS;8|
        ((|n| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         (|f| |Mapping| R (|Integer|) (|Integer|)) ($ S))
        (SPROG
         ((#1=#:G199 NIL) (|j| NIL) (#2=#:G198 NIL) (|i| NIL) (|mat| (S)))
         (SEQ
          (LETT |mat| (SPADCALL |n| |m| (|spadConstant| $ 29) (QREFELT $ 31)))
          (SEQ (LETT |i| (SPADCALL |mat| (QREFELT $ 17)))
               (LETT #2# (SPADCALL |mat| (QREFELT $ 18))) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |mat| (QREFELT $ 19)))
                      (LETT #1# (SPADCALL |mat| (QREFELT $ 20))) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |mat| |i| |j| (SPADCALL |i| |j| |f|)
                                  (QREFELT $ 34))))
                      (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |mat|)))) 

(SDEFUN |MATCAT-;scalarMatrix;NniRS;9|
        ((|n| |NonNegativeInteger|) (|r| R) ($ S))
        (SPROG
         ((#1=#:G203 NIL) (|i| NIL) (#2=#:G204 NIL) (|j| NIL) (|ans| (S)))
         (SEQ (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 39)))
              (SEQ (LETT |j| (SPADCALL |ans| (QREFELT $ 19)))
                   (LETT #2# (SPADCALL |ans| (QREFELT $ 20)))
                   (LETT |i| (SPADCALL |ans| (QREFELT $ 17)))
                   (LETT #1# (SPADCALL |ans| (QREFELT $ 18))) G190
                   (COND ((OR (> |i| #1#) (> |j| #2#)) (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT $ 34))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;10| ((|l| |List| R) ($ S))
        (SPROG
         ((#1=#:G208 NIL) (|i| NIL) (#2=#:G209 NIL) (|j| NIL) (#3=#:G210 NIL)
          (|r| NIL) (|ans| (S)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 39)))
              (SEQ (LETT |r| NIL) (LETT #3# |l|)
                   (LETT |j| (SPADCALL |ans| (QREFELT $ 19)))
                   (LETT #2# (SPADCALL |ans| (QREFELT $ 20)))
                   (LETT |i| (SPADCALL |ans| (QREFELT $ 17)))
                   (LETT #1# (SPADCALL |ans| (QREFELT $ 18))) G190
                   (COND
                    ((OR (> |i| #1#) (> |j| #2#) (ATOM #3#)
                         (PROGN (LETT |r| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT $ 34))))
                   (LETT |i|
                         (PROG1 (+ |i| 1)
                           (LETT |j| (PROG1 (+ |j| 1) (LETT #3# (CDR #3#))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;get_dims|
        ((|l| |List| S) ($ |List| (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G217 NIL) (|a| NIL) (#2=#:G216 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |a| NIL) (LETT #1# |l|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (LIST (SPADCALL |a| (QREFELT $ 11))
                                     (SPADCALL |a| (QREFELT $ 12)))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;12|
        ((|res| S) (|k| |Integer|)
         (|dl| |List| (|List| (|NonNegativeInteger|))) (|l| |List| S)
         (|r_off| |NonNegativeInteger|) (|c_off| |NonNegativeInteger|)
         (|mu| |Union| R "one") ($ |Void|))
        (SPROG
         ((|c_off1| (|NonNegativeInteger|)) (|mm| (R)) (|aij| (R))
          (#1=#:G255 NIL) (|j| NIL) (#2=#:G254 NIL) (|i| NIL)
          (|c_step| #3=(|NonNegativeInteger|)) (#4=#:G253 NIL) (|rc| NIL)
          (#5=#:G252 NIL) (|r_step| #3#) (#6=#:G251 NIL) (#7=#:G250 NIL)
          (|c_ind| (|NonNegativeInteger|)) (#8=#:G249 NIL) (#9=#:G248 NIL)
          (|m| (R)) (|a| (S)) (|nc| #10=(|NonNegativeInteger|)) (|nr| #10#)
          (|dp| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |dp| (|SPADfirst| |dl|))
              (LETT |nr| (SPADCALL |dp| 1 (QREFELT $ 46)))
              (LETT |nc| (SPADCALL |dp| 2 (QREFELT $ 46)))
              (LETT |a| (|SPADfirst| |l|))
              (COND ((QEQCAR |mu| 1) (COND ((EQL |k| 1) (EXIT |a|)))))
              (EXIT
               (COND
                ((EQL |k| 1)
                 (COND
                  ((QEQCAR |mu| 1) (|error| "kronecker_prod1: impossible"))
                  (#11='T
                   (SEQ (LETT |m| (QCDR |mu|))
                        (EXIT
                         (SEQ (LETT |i| 1) (LETT #9# |nr|) G190
                              (COND ((|greater_SI| |i| #9#) (GO G191)))
                              (SEQ (LETT |r_off| (+ |r_off| 1))
                                   (LETT |c_ind| (+ |c_off| 1))
                                   (EXIT
                                    (SEQ (LETT |j| 1) (LETT #8# |nc|) G190
                                         (COND
                                          ((|greater_SI| |j| #8#) (GO G191)))
                                         (SEQ
                                          (QSETAREF2O |res| |r_off| |c_ind|
                                                      (SPADCALL |m|
                                                                (QAREF2O |a|
                                                                         |i|
                                                                         |j| 1
                                                                         1)
                                                                (QREFELT $ 47))
                                                      1 1)
                                          (EXIT (LETT |c_ind| (+ |c_ind| 1))))
                                         (LETT |j| (|inc_SI| |j|)) (GO G190)
                                         G191 (EXIT NIL))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL)))))))
                (#11#
                 (SEQ (LETT |dl| (CDR |dl|)) (LETT |l| (CDR |l|))
                      (LETT |r_step|
                            (SPADCALL (ELT $ 48)
                                      (PROGN
                                       (LETT #7# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #6# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #6#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #6#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #7#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT $ 46))
                                                     #7#))))
                                            (LETT #6# (CDR #6#)) (GO G190) G191
                                            (EXIT (NREVERSE #7#))))
                                      (QREFELT $ 50)))
                      (LETT |c_step|
                            (SPADCALL (ELT $ 48)
                                      (PROGN
                                       (LETT #5# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #4# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #4#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #4#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT $ 46))
                                                     #5#))))
                                            (LETT #4# (CDR #4#)) (GO G190) G191
                                            (EXIT (NREVERSE #5#))))
                                      (QREFELT $ 50)))
                      (EXIT
                       (SEQ (LETT |i| 1) (LETT #2# |nr|) G190
                            (COND ((|greater_SI| |i| #2#) (GO G191)))
                            (SEQ (LETT |c_off1| |c_off|)
                                 (SEQ (LETT |j| 1) (LETT #1# |nc|) G190
                                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                                      (SEQ
                                       (LETT |aij| (QAREF2O |a| |i| |j| 1 1))
                                       (LETT |mm|
                                             (COND ((QEQCAR |mu| 1) |aij|)
                                                   ('T
                                                    (SPADCALL (QCDR |mu|) |aij|
                                                              (QREFELT $
                                                                       47)))))
                                       (SPADCALL |res| (- |k| 1) |dl| |l|
                                                 |r_off| |c_off1| (CONS 0 |mm|)
                                                 (QREFELT $ 55))
                                       (EXIT
                                        (LETT |c_off1| (+ |c_off1| |c_step|))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT (LETT |r_off| (+ |r_off| |r_step|))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL)))))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;LS;13| ((|l| |List| S) ($ S))
        (SPROG
         ((#1=#:G286 NIL) (|a| NIL) (|res| (S))
          (|nc| #2=(|NonNegativeInteger|)) (#3=#:G285 NIL) (|rc| NIL)
          (#4=#:G284 NIL) (|nr| #2#) (#5=#:G283 NIL) (#6=#:G282 NIL)
          (|dl| (|List| (|List| (|NonNegativeInteger|))))
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND
                ((EQL |k| 0)
                 (COND
                  ((QEQCAR (QREFELT $ 44) 0)
                   (MAKE_MATRIX1 1 1 (QCDR (QREFELT $ 44))))
                  (#7='T (|error| "need 1"))))
                ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 57)))
                (#7#
                 (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| $))
                      (LETT |nr|
                            (SPADCALL (ELT $ 48)
                                      (PROGN
                                       (LETT #6# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #5# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #6#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT $ 46))
                                                     #6#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #6#))))
                                      (QREFELT $ 50)))
                      (LETT |nc|
                            (SPADCALL (ELT $ 48)
                                      (PROGN
                                       (LETT #4# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #3# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #3#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #3#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT $ 46))
                                                     #4#))))
                                            (LETT #3# (CDR #3#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      (QREFELT $ 50)))
                      (LETT |res| (SPADCALL |nr| |nc| (QREFELT $ 39)))
                      (SEQ (LETT |a| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                       (QREFELT $ 55))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;3S;14| ((|a| S) (|b| S) ($ S))
        (SPADCALL (LIST |a| |b|) (QREFELT $ 59))) 

(SDEFUN |MATCAT-;kroneckerSum;LS;15| ((|l| |List| S) ($ S))
        (SPROG
         ((|n0| (|Integer|)) (|off0| (|NonNegativeInteger|))
          (|off_r| #1=(|NonNegativeInteger|)) (|ind_c| #1#) (|vv| (R))
          (#2=#:G326 NIL) (|j| NIL) (#3=#:G325 NIL) (#4=#:G324 NIL) (|i| NIL)
          (#5=#:G323 NIL) (|m| NIL) (|step0| (|NonNegativeInteger|))
          (|n2| (|NonNegativeInteger|)) (|dl| (|List| (|NonNegativeInteger|)))
          (|nr| (|NonNegativeInteger|)) (#6=#:G322 NIL) (|a| NIL) (|res| (S))
          (|nrs| (|NonNegativeInteger|)) (#7=#:G321 NIL) (#8=#:G320 NIL)
          (|nc| (|NonNegativeInteger|)) (#9=#:G319 NIL)
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT $ 39)))
                     ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 57)))
                     ('T
                      (SEQ (LETT |dl| NIL)
                           (SEQ (LETT |a| NIL) (LETT #9# |l|) G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN (LETT |a| (CAR #9#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |nr| (ANROWS |a|))
                                     (LETT |nc| (ANCOLS |a|))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |nr| |nc| (QREFELT $ 33))
                                        (|error|
                                         "kroneckerSum: nonsquare matrix"))
                                       ('T (LETT |dl| (CONS |nr| |dl|))))))
                                (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                           (LETT |dl| (NREVERSE |dl|))
                           (LETT |nrs|
                                 (SPADCALL (ELT $ 48)
                                           (PROGN
                                            (LETT #8# NIL)
                                            (SEQ (LETT |nr| NIL)
                                                 (LETT #7# |dl|) G190
                                                 (COND
                                                  ((OR (ATOM #7#)
                                                       (PROGN
                                                        (LETT |nr| (CAR #7#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #8# (CONS |nr| #8#))))
                                                 (LETT #7# (CDR #7#)) (GO G190)
                                                 G191 (EXIT (NREVERSE #8#))))
                                           (QREFELT $ 50)))
                           (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT $ 39)))
                           (LETT |n0| 1)
                           (SEQ (LETT |a| NIL) (LETT #6# |l|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |a| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |off0| 0)
                                     (LETT |nr|
                                           (SPADCALL |dl| 1 (QREFELT $ 46)))
                                     (LETT |dl| (CDR |dl|))
                                     (LETT |n2|
                                           (SPADCALL (ELT $ 48) |dl| 1
                                                     (QREFELT $ 61)))
                                     (LETT |step0| (* |nr| |n2|))
                                     (SEQ (LETT |m| 1) (LETT #5# |n0|) G190
                                          (COND
                                           ((|greater_SI| |m| #5#) (GO G191)))
                                          (SEQ (LETT |off_r| (+ |off0| 1))
                                               (SEQ (LETT |i| 1)
                                                    (LETT #4# |nr|) G190
                                                    (COND
                                                     ((|greater_SI| |i| #4#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |l| 1)
                                                           (LETT #3# |n2|) G190
                                                           (COND
                                                            ((|greater_SI| |l|
                                                                           #3#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |ind_c|
                                                                  (+ |off0|
                                                                     |l|))
                                                            (SEQ (LETT |j| 1)
                                                                 (LETT #2#
                                                                       |nr|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |j| #2#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (LETT |vv|
                                                                        (SPADCALL
                                                                         (QAREF2O
                                                                          |res|
                                                                          |off_r|
                                                                          |ind_c|
                                                                          1 1)
                                                                         (QAREF2O
                                                                          |a|
                                                                          |i|
                                                                          |j| 1
                                                                          1)
                                                                         (QREFELT
                                                                          $
                                                                          62)))
                                                                  (QSETAREF2O
                                                                   |res|
                                                                   |off_r|
                                                                   |ind_c| |vv|
                                                                   1 1)
                                                                  (EXIT
                                                                   (LETT
                                                                    |ind_c|
                                                                    (+ |ind_c|
                                                                       |n2|))))
                                                                 (LETT |j|
                                                                       (|inc_SI|
                                                                        |j|))
                                                                 (GO G190) G191
                                                                 (EXIT NIL))
                                                            (EXIT
                                                             (LETT |off_r|
                                                                   (+ |off_r|
                                                                      1))))
                                                           (LETT |l|
                                                                 (|inc_SI|
                                                                  |l|))
                                                           (GO G190) G191
                                                           (EXIT NIL))))
                                                    (LETT |i| (|inc_SI| |i|))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (LETT |off0|
                                                      (+ |off0| |step0|))))
                                          (LETT |m| (|inc_SI| |m|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT (LETT |n0| (* |n0| |nr|))))
                                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerSum;3S;16| ((|a| S) (|b| S) ($ S))
        (SPADCALL (LIST |a| |b|) (QREFELT $ 64))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;17| ((|list| |List| S) ($ S))
        (SPROG
         ((|loC| (|Integer|)) (|loR| (|Integer|)) (#1=#:G340 NIL) (|j| NIL)
          (#2=#:G341 NIL) (|l| NIL) (#3=#:G338 NIL) (|i| NIL) (#4=#:G339 NIL)
          (|k| NIL) (|hiC| #5=(|Integer|)) (|hiR| #5#) (#6=#:G337 NIL)
          (|mat| NIL) (|ans| (S)) (|cols| #7=(|NonNegativeInteger|))
          (|rows| #7#) (#8=#:G336 NIL))
         (SEQ (LETT |rows| 0) (LETT |cols| 0)
              (SEQ (LETT |mat| NIL) (LETT #8# |list|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |mat| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |rows| (+ |rows| (ANROWS |mat|)))
                        (EXIT (LETT |cols| (+ |cols| (ANCOLS |mat|)))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (SPADCALL |rows| |cols| (QREFELT $ 39)))
              (LETT |loR| (PROGN |ans| 1)) (LETT |loC| (PROGN |ans| 1))
              (SEQ (LETT |mat| NIL) (LETT #6# |list|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |mat| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |hiR| (- (+ |loR| (ANROWS |mat|)) 1))
                        (LETT |hiC| (- (+ |loC| (ANROWS |mat|)) 1))
                        (SEQ (LETT |k| (PROGN |mat| 1))
                             (LETT #4# (SPADCALL |mat| (QREFELT $ 18)))
                             (LETT |i| |loR|) (LETT #3# |hiR|) G190
                             (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| (PROGN |mat| 1))
                                    (LETT #2# (SPADCALL |mat| (QREFELT $ 20)))
                                    (LETT |j| |loC|) (LETT #1# |hiC|) G190
                                    (COND
                                     ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (QSETAREF2O |ans| |i| |j|
                                                  (QAREF2O |mat| |k| |l| 1 1) 1
                                                  1)))
                                    (LETT |j|
                                          (PROG1 (+ |j| 1)
                                            (LETT |l| (+ |l| 1))))
                                    (GO G190) G191 (EXIT NIL))))
                             (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1))))
                             (GO G190) G191 (EXIT NIL))
                        (LETT |loR| (+ |hiR| 1))
                        (EXIT (LETT |loC| (+ |hiC| 1))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;18|
        ((|res| S) (|k| |Integer|)
         (|dl| |List| (|List| (|NonNegativeInteger|))) (|l| |List| S)
         (|r_off| |NonNegativeInteger|) (|c_off| |NonNegativeInteger|)
         (|mu| |Union| R "one") ($ |Void|))
        (SPROG
         ((|c_off1| (|NonNegativeInteger|)) (|mm| (R)) (|aij| (R))
          (#1=#:G379 NIL) (|j| NIL) (#2=#:G378 NIL) (|i| NIL)
          (|c_step| #3=(|NonNegativeInteger|)) (#4=#:G377 NIL) (|rc| NIL)
          (#5=#:G376 NIL) (|r_step| #3#) (#6=#:G375 NIL) (#7=#:G374 NIL)
          (|c_ind| (|NonNegativeInteger|)) (#8=#:G373 NIL) (#9=#:G372 NIL)
          (|m| (R)) (|a| (S)) (|nc| #10=(|NonNegativeInteger|)) (|nr| #10#)
          (|dp| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |dp| (|SPADfirst| |dl|))
              (LETT |nr| (SPADCALL |dp| 1 (QREFELT $ 46)))
              (LETT |nc| (SPADCALL |dp| 2 (QREFELT $ 46)))
              (LETT |a| (|SPADfirst| |l|))
              (COND ((QEQCAR |mu| 1) (COND ((EQL |k| 1) (EXIT |a|)))))
              (EXIT
               (COND
                ((EQL |k| 1)
                 (COND
                  ((QEQCAR |mu| 1) (|error| "kronecker_prod1: impossible"))
                  (#11='T
                   (SEQ (LETT |m| (QCDR |mu|))
                        (EXIT
                         (SEQ (LETT |i| 1) (LETT #9# |nr|) G190
                              (COND ((|greater_SI| |i| #9#) (GO G191)))
                              (SEQ (LETT |r_off| (+ |r_off| 1))
                                   (LETT |c_ind| (+ |c_off| 1))
                                   (EXIT
                                    (SEQ (LETT |j| 1) (LETT #8# |nc|) G190
                                         (COND
                                          ((|greater_SI| |j| #8#) (GO G191)))
                                         (SEQ
                                          (SPADCALL |res| |r_off| |c_ind|
                                                    (SPADCALL |m|
                                                              (SPADCALL |a| |i|
                                                                        |j|
                                                                        (QREFELT
                                                                         $ 22))
                                                              (QREFELT $ 47))
                                                    (QREFELT $ 34))
                                          (EXIT (LETT |c_ind| (+ |c_ind| 1))))
                                         (LETT |j| (|inc_SI| |j|)) (GO G190)
                                         G191 (EXIT NIL))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL)))))))
                (#11#
                 (SEQ (LETT |dl| (CDR |dl|)) (LETT |l| (CDR |l|))
                      (LETT |r_step|
                            (SPADCALL (ELT $ 48)
                                      (PROGN
                                       (LETT #7# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #6# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #6#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #6#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #7#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT $ 46))
                                                     #7#))))
                                            (LETT #6# (CDR #6#)) (GO G190) G191
                                            (EXIT (NREVERSE #7#))))
                                      (QREFELT $ 50)))
                      (LETT |c_step|
                            (SPADCALL (ELT $ 48)
                                      (PROGN
                                       (LETT #5# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #4# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #4#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #4#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT $ 46))
                                                     #5#))))
                                            (LETT #4# (CDR #4#)) (GO G190) G191
                                            (EXIT (NREVERSE #5#))))
                                      (QREFELT $ 50)))
                      (EXIT
                       (SEQ (LETT |i| 1) (LETT #2# |nr|) G190
                            (COND ((|greater_SI| |i| #2#) (GO G191)))
                            (SEQ (LETT |c_off1| |c_off|)
                                 (SEQ (LETT |j| 1) (LETT #1# |nc|) G190
                                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                                      (SEQ
                                       (LETT |aij|
                                             (SPADCALL |a| |i| |j|
                                                       (QREFELT $ 22)))
                                       (LETT |mm|
                                             (COND ((QEQCAR |mu| 1) |aij|)
                                                   ('T
                                                    (SPADCALL (QCDR |mu|) |aij|
                                                              (QREFELT $
                                                                       47)))))
                                       (SPADCALL |res| (- |k| 1) |dl| |l|
                                                 |r_off| |c_off1| (CONS 0 |mm|)
                                                 (QREFELT $ 55))
                                       (EXIT
                                        (LETT |c_off1| (+ |c_off1| |c_step|))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT (LETT |r_off| (+ |r_off| |r_step|))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL)))))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;LS;19| ((|l| |List| S) ($ S))
        (SPROG
         ((#1=#:G410 NIL) (|a| NIL) (|res| (S))
          (|nc| #2=(|NonNegativeInteger|)) (#3=#:G409 NIL) (|rc| NIL)
          (#4=#:G408 NIL) (|nr| #2#) (#5=#:G407 NIL) (#6=#:G406 NIL)
          (|dl| (|List| (|List| (|NonNegativeInteger|))))
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND
                ((EQL |k| 0)
                 (COND
                  ((QEQCAR (QREFELT $ 44) 0)
                   (SPADCALL 1 1 (QCDR (QREFELT $ 44)) (QREFELT $ 31)))
                  (#7='T (|error| "need 1"))))
                ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 57)))
                (#7#
                 (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| $))
                      (LETT |nr|
                            (SPADCALL (ELT $ 48)
                                      (PROGN
                                       (LETT #6# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #5# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #6#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT $ 46))
                                                     #6#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #6#))))
                                      (QREFELT $ 50)))
                      (LETT |nc|
                            (SPADCALL (ELT $ 48)
                                      (PROGN
                                       (LETT #4# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #3# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #3#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #3#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT $ 46))
                                                     #4#))))
                                            (LETT #3# (CDR #3#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      (QREFELT $ 50)))
                      (LETT |res| (SPADCALL |nr| |nc| (QREFELT $ 39)))
                      (SEQ (LETT |a| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                       (QREFELT $ 55))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;3S;20| ((|a| S) (|b| S) ($ S))
        (SPADCALL (LIST |a| |b|) (QREFELT $ 59))) 

(SDEFUN |MATCAT-;kroneckerSum;LS;21| ((|l| |List| S) ($ S))
        (SPROG
         ((|n0| (|Integer|)) (|off0| (|NonNegativeInteger|))
          (|off_r| #1=(|NonNegativeInteger|)) (|ind_c| #1#) (|vv| (R))
          (#2=#:G450 NIL) (|j| NIL) (#3=#:G449 NIL) (#4=#:G448 NIL) (|i| NIL)
          (#5=#:G447 NIL) (|m| NIL) (|step0| (|NonNegativeInteger|))
          (|n2| (|NonNegativeInteger|)) (|dl| (|List| (|NonNegativeInteger|)))
          (|nr| (|NonNegativeInteger|)) (#6=#:G446 NIL) (|a| NIL) (|res| (S))
          (|nrs| (|NonNegativeInteger|)) (#7=#:G445 NIL) (#8=#:G444 NIL)
          (|nc| (|NonNegativeInteger|)) (#9=#:G443 NIL)
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT $ 39)))
                     ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 57)))
                     ('T
                      (SEQ (LETT |dl| NIL)
                           (SEQ (LETT |a| NIL) (LETT #9# |l|) G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN (LETT |a| (CAR #9#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |nr| (SPADCALL |a| (QREFELT $ 11)))
                                     (LETT |nc| (SPADCALL |a| (QREFELT $ 12)))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |nr| |nc| (QREFELT $ 33))
                                        (|error|
                                         "kroneckerSum: nonsquare matrix"))
                                       ('T (LETT |dl| (CONS |nr| |dl|))))))
                                (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                           (LETT |dl| (NREVERSE |dl|))
                           (LETT |nrs|
                                 (SPADCALL (ELT $ 48)
                                           (PROGN
                                            (LETT #8# NIL)
                                            (SEQ (LETT |nr| NIL)
                                                 (LETT #7# |dl|) G190
                                                 (COND
                                                  ((OR (ATOM #7#)
                                                       (PROGN
                                                        (LETT |nr| (CAR #7#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #8# (CONS |nr| #8#))))
                                                 (LETT #7# (CDR #7#)) (GO G190)
                                                 G191 (EXIT (NREVERSE #8#))))
                                           (QREFELT $ 50)))
                           (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT $ 39)))
                           (LETT |n0| 1)
                           (SEQ (LETT |a| NIL) (LETT #6# |l|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |a| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |off0| 0)
                                     (LETT |nr|
                                           (SPADCALL |dl| 1 (QREFELT $ 46)))
                                     (LETT |dl| (CDR |dl|))
                                     (LETT |n2|
                                           (SPADCALL (ELT $ 48) |dl| 1
                                                     (QREFELT $ 61)))
                                     (LETT |step0| (* |nr| |n2|))
                                     (SEQ (LETT |m| 1) (LETT #5# |n0|) G190
                                          (COND
                                           ((|greater_SI| |m| #5#) (GO G191)))
                                          (SEQ (LETT |off_r| (+ |off0| 1))
                                               (SEQ (LETT |i| 1)
                                                    (LETT #4# |nr|) G190
                                                    (COND
                                                     ((|greater_SI| |i| #4#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |l| 1)
                                                           (LETT #3# |n2|) G190
                                                           (COND
                                                            ((|greater_SI| |l|
                                                                           #3#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |ind_c|
                                                                  (+ |off0|
                                                                     |l|))
                                                            (SEQ (LETT |j| 1)
                                                                 (LETT #2#
                                                                       |nr|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |j| #2#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (LETT |vv|
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          |res|
                                                                          |off_r|
                                                                          |ind_c|
                                                                          (QREFELT
                                                                           $
                                                                           22))
                                                                         (SPADCALL
                                                                          |a|
                                                                          |i|
                                                                          |j|
                                                                          (QREFELT
                                                                           $
                                                                           22))
                                                                         (QREFELT
                                                                          $
                                                                          62)))
                                                                  (SPADCALL
                                                                   |res|
                                                                   |off_r|
                                                                   |ind_c| |vv|
                                                                   (QREFELT $
                                                                            34))
                                                                  (EXIT
                                                                   (LETT
                                                                    |ind_c|
                                                                    (+ |ind_c|
                                                                       |n2|))))
                                                                 (LETT |j|
                                                                       (|inc_SI|
                                                                        |j|))
                                                                 (GO G190) G191
                                                                 (EXIT NIL))
                                                            (EXIT
                                                             (LETT |off_r|
                                                                   (+ |off_r|
                                                                      1))))
                                                           (LETT |l|
                                                                 (|inc_SI|
                                                                  |l|))
                                                           (GO G190) G191
                                                           (EXIT NIL))))
                                                    (LETT |i| (|inc_SI| |i|))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (LETT |off0|
                                                      (+ |off0| |step0|))))
                                          (LETT |m| (|inc_SI| |m|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT (LETT |n0| (* |n0| |nr|))))
                                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerSum;3S;22| ((|a| S) (|b| S) ($ S))
        (SPADCALL (LIST |a| |b|) (QREFELT $ 64))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;23| ((|list| |List| S) ($ S))
        (SPROG
         ((|loC| (|Integer|)) (|loR| (|Integer|)) (#1=#:G464 NIL) (|j| NIL)
          (#2=#:G465 NIL) (|l| NIL) (#3=#:G462 NIL) (|i| NIL) (#4=#:G463 NIL)
          (|k| NIL) (|hiC| #5=(|Integer|)) (|hiR| #5#) (#6=#:G461 NIL)
          (|mat| NIL) (|ans| (S)) (|cols| #7=(|NonNegativeInteger|))
          (|rows| #7#) (#8=#:G460 NIL))
         (SEQ (LETT |rows| 0) (LETT |cols| 0)
              (SEQ (LETT |mat| NIL) (LETT #8# |list|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |mat| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |rows| (+ |rows| (SPADCALL |mat| (QREFELT $ 11))))
                    (EXIT
                     (LETT |cols| (+ |cols| (SPADCALL |mat| (QREFELT $ 12))))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (SPADCALL |rows| |cols| (QREFELT $ 39)))
              (LETT |loR| (SPADCALL |ans| (QREFELT $ 17)))
              (LETT |loC| (SPADCALL |ans| (QREFELT $ 19)))
              (SEQ (LETT |mat| NIL) (LETT #6# |list|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |mat| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |hiR|
                          (- (+ |loR| (SPADCALL |mat| (QREFELT $ 11))) 1))
                    (LETT |hiC|
                          (- (+ |loC| (SPADCALL |mat| (QREFELT $ 11))) 1))
                    (SEQ (LETT |k| (SPADCALL |mat| (QREFELT $ 17)))
                         (LETT #4# (SPADCALL |mat| (QREFELT $ 18)))
                         (LETT |i| |loR|) (LETT #3# |hiR|) G190
                         (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |l| (SPADCALL |mat| (QREFELT $ 19)))
                                (LETT #2# (SPADCALL |mat| (QREFELT $ 20)))
                                (LETT |j| |loC|) (LETT #1# |hiC|) G190
                                (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |ans| |i| |j|
                                            (SPADCALL |mat| |k| |l|
                                                      (QREFELT $ 22))
                                            (QREFELT $ 34))))
                                (LETT |j|
                                      (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1))))
                                (GO G190) G191 (EXIT NIL))))
                         (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1))))
                         (GO G190) G191 (EXIT NIL))
                    (LETT |loR| (+ |hiR| 1)) (EXIT (LETT |loC| (+ |hiC| 1))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;coerce;ColS;24| ((|v| |Col|) ($ S))
        (SPROG
         ((#1=#:G469 NIL) (|i| NIL) (#2=#:G470 NIL) (|k| NIL)
          (|one| (|Integer|)) (|x| (S)))
         (SEQ
          (LETT |x|
                (SPADCALL (SPADCALL |v| (QREFELT $ 67)) 1 (|spadConstant| $ 29)
                          (QREFELT $ 31)))
          (LETT |one| (SPADCALL |x| (QREFELT $ 19)))
          (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 68)))
               (LETT #2# (SPADCALL |v| (QREFELT $ 69)))
               (LETT |i| (SPADCALL |x| (QREFELT $ 17)))
               (LETT #1# (SPADCALL |x| (QREFELT $ 18))) G190
               (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |x| |i| |one| (SPADCALL |v| |k| (QREFELT $ 70))
                           (QREFELT $ 34))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |MATCAT-;transpose;RowS;25| ((|v| |Row|) ($ S))
        (SPROG
         ((#1=#:G474 NIL) (|j| NIL) (#2=#:G475 NIL) (|k| NIL)
          (|one| (|Integer|)) (|x| (S)))
         (SEQ
          (LETT |x|
                (SPADCALL 1 (SPADCALL |v| (QREFELT $ 72)) (|spadConstant| $ 29)
                          (QREFELT $ 31)))
          (LETT |one| (SPADCALL |x| (QREFELT $ 17)))
          (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 73)))
               (LETT #2# (SPADCALL |v| (QREFELT $ 74)))
               (LETT |j| (SPADCALL |x| (QREFELT $ 19)))
               (LETT #1# (SPADCALL |x| (QREFELT $ 20))) G190
               (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |x| |one| |j| (SPADCALL |v| |k| (QREFELT $ 75))
                           (QREFELT $ 34))))
               (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |MATCAT-;+;3S;26| ((|x| S) (|y| S) ($ S))
        (SPROG
         ((#1=#:G485 NIL) (|j| NIL) (#2=#:G484 NIL) (|i| NIL) (|ans| (S))
          (|c| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR
             (SPADCALL (LETT |r| (SPADCALL |x| (QREFELT $ 11)))
                       (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 33))
             (SPADCALL (LETT |c| (SPADCALL |x| (QREFELT $ 12)))
                       (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 33)))
            (|error| "can't add matrices of different dimensions"))
           ('T
            (SEQ
             (LETT |ans|
                   (SPADCALL |r| |c| (|spadConstant| $ 29) (QREFELT $ 31)))
             (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)))
                  (LETT #2# (SPADCALL |x| (QREFELT $ 18))) G190
                  (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)))
                         (LETT #1# (SPADCALL |x| (QREFELT $ 20))) G190
                         (COND ((> |j| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |ans| |i| |j|
                                     (SPADCALL
                                      (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                      (SPADCALL |y| |i| |j| (QREFELT $ 22))
                                      (QREFELT $ 62))
                                     (QREFELT $ 34))))
                         (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                  (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
             (EXIT |ans|))))))) 

(SDEFUN |MATCAT-;-;3S;27| ((|x| S) (|y| S) ($ S))
        (SPROG
         ((#1=#:G495 NIL) (|j| NIL) (#2=#:G494 NIL) (|i| NIL) (|ans| (S))
          (|c| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR
             (SPADCALL (LETT |r| (SPADCALL |x| (QREFELT $ 11)))
                       (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 33))
             (SPADCALL (LETT |c| (SPADCALL |x| (QREFELT $ 12)))
                       (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 33)))
            (|error| "can't subtract matrices of different dimensions"))
           ('T
            (SEQ
             (LETT |ans|
                   (SPADCALL |r| |c| (|spadConstant| $ 29) (QREFELT $ 31)))
             (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)))
                  (LETT #2# (SPADCALL |x| (QREFELT $ 18))) G190
                  (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)))
                         (LETT #1# (SPADCALL |x| (QREFELT $ 20))) G190
                         (COND ((> |j| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |ans| |i| |j|
                                     (SPADCALL
                                      (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                      (SPADCALL |y| |i| |j| (QREFELT $ 22))
                                      (QREFELT $ 78))
                                     (QREFELT $ 34))))
                         (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                  (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
             (EXIT |ans|))))))) 

(SDEFUN |MATCAT-;-;2S;28| ((|x| S) ($ S))
        (SPADCALL (ELT $ 27) |x| (QREFELT $ 81))) 

(SDEFUN |MATCAT-;*;I2S;29| ((|m| |Integer|) (|x| S) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|MATCAT-;*;I2S;29!0| (VECTOR $ |m|)) |x|
                         (QREFELT $ 81)))) 

(SDEFUN |MATCAT-;*;I2S;29!0| ((|r1| NIL) ($$ NIL))
        (PROG (|m| $)
          (LETT |m| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |m| |r1| (QREFELT $ 83)))))) 

(SDEFUN |MATCAT-;*;R2S;30| ((|a| R) (|x| S) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|MATCAT-;*;R2S;30!0| (VECTOR $ |a|)) |x|
                         (QREFELT $ 81)))) 

(SDEFUN |MATCAT-;*;R2S;30!0| ((|r1| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a| |r1| (QREFELT $ 47)))))) 

(SDEFUN |MATCAT-;*;SRS;31| ((|x| S) (|a| R) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|MATCAT-;*;SRS;31!0| (VECTOR $ |a|)) |x|
                         (QREFELT $ 81)))) 

(SDEFUN |MATCAT-;*;SRS;31!0| ((|r1| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |a| (QREFELT $ 47)))))) 

(SDEFUN |MATCAT-;*;3S;32| ((|x| S) (|y| S) ($ S))
        (SPROG
         ((|entry| (R)) (|sum| (R)) (#1=#:G513 NIL) (|k| NIL) (#2=#:G514 NIL)
          (|l| NIL) (#3=#:G512 NIL) (|j| NIL) (#4=#:G511 NIL) (|i| NIL)
          (|ans| (S)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT $ 12))
                      (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 21))
            (|error| "can't multiply matrices of incompatible dimensions"))
           ('T
            (SEQ
             (LETT |ans|
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL |y| (QREFELT $ 12))
                             (|spadConstant| $ 29) (QREFELT $ 31)))
             (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)))
                  (LETT #4# (SPADCALL |x| (QREFELT $ 18))) G190
                  (COND ((> |i| #4#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 19)))
                         (LETT #3# (SPADCALL |y| (QREFELT $ 20))) G190
                         (COND ((> |j| #3#) (GO G191)))
                         (SEQ
                          (LETT |entry|
                                (SEQ (LETT |sum| (|spadConstant| $ 29))
                                     (SEQ
                                      (LETT |l| (SPADCALL |x| (QREFELT $ 19)))
                                      (LETT #2# (SPADCALL |x| (QREFELT $ 20)))
                                      (LETT |k| (SPADCALL |y| (QREFELT $ 17)))
                                      (LETT #1# (SPADCALL |y| (QREFELT $ 18)))
                                      G190
                                      (COND
                                       ((OR (> |k| #1#) (> |l| #2#))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT |sum|
                                              (SPADCALL |sum|
                                                        (SPADCALL
                                                         (SPADCALL |x| |i| |l|
                                                                   (QREFELT $
                                                                            22))
                                                         (SPADCALL |y| |k| |j|
                                                                   (QREFELT $
                                                                            22))
                                                         (QREFELT $ 47))
                                                        (QREFELT $ 62)))))
                                      (LETT |k|
                                            (PROG1 (+ |k| 1)
                                              (LETT |l| (+ |l| 1))))
                                      (GO G190) G191 (EXIT NIL))
                                     (EXIT |sum|)))
                          (EXIT
                           (SPADCALL |ans| |i| |j| |entry| (QREFELT $ 34))))
                         (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                  (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
             (EXIT |ans|))))))) 

(SDEFUN |MATCAT-;positivePower;SIS;33| ((|x| S) (|n| |Integer|) ($ S))
        (SPROG ((|y| (S)))
               (SEQ
                (COND ((EQL |n| 1) |x|)
                      ((ODDP |n|)
                       (SPADCALL |x| (SPADCALL |x| (- |n| 1) (QREFELT $ 88))
                                 (QREFELT $ 89)))
                      ('T
                       (SEQ
                        (LETT |y|
                              (SPADCALL |x| (QUOTIENT2 |n| 2) (QREFELT $ 88)))
                        (EXIT (SPADCALL |y| |y| (QREFELT $ 89))))))))) 

(SDEFUN |MATCAT-;^;SNniS;34| ((|x| S) (|n| |NonNegativeInteger|) ($ S))
        (SPROG ((|nn| (|NonNegativeInteger|)))
               (COND
                ((NULL
                  (EQL (LETT |nn| (SPADCALL |x| (QREFELT $ 11)))
                       (SPADCALL |x| (QREFELT $ 12))))
                 (|error| "^: matrix must be square"))
                ('T
                 (COND
                  ((ZEROP |n|)
                   (SPADCALL |nn| (|spadConstant| $ 43) (QREFELT $ 91)))
                  ('T (SPADCALL |x| |n| (QREFELT $ 88)))))))) 

(SDEFUN |MATCAT-;*;S2Col;35| ((|x| S) (|v| |Col|) ($ |Col|))
        (SPROG
         ((|sum| (R)) (#1=#:G529 NIL) (|j| NIL) (#2=#:G530 NIL) (|l| NIL)
          (#3=#:G527 NIL) (|i| NIL) (#4=#:G528 NIL) (|k| NIL) (|w| (|Col|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT $ 12))
                      (SPADCALL |v| (QREFELT $ 67)) (QREFELT $ 21))
            (|error| "can't multiply matrix A and vector v if #cols A ~= #v"))
           ('T
            (SEQ
             (LETT |w|
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (|spadConstant| $ 29) (QREFELT $ 93)))
             (SEQ (LETT |k| (SPADCALL |w| (QREFELT $ 68)))
                  (LETT #4# (SPADCALL |w| (QREFELT $ 69)))
                  (LETT |i| (SPADCALL |x| (QREFELT $ 17)))
                  (LETT #3# (SPADCALL |x| (QREFELT $ 18))) G190
                  (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |w| |k|
                              (SEQ (LETT |sum| (|spadConstant| $ 29))
                                   (SEQ
                                    (LETT |l| (SPADCALL |v| (QREFELT $ 68)))
                                    (LETT #2# (SPADCALL |v| (QREFELT $ 69)))
                                    (LETT |j| (SPADCALL |x| (QREFELT $ 19)))
                                    (LETT #1# (SPADCALL |x| (QREFELT $ 20)))
                                    G190
                                    (COND
                                     ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |sum|
                                            (SPADCALL |sum|
                                                      (SPADCALL
                                                       (SPADCALL |x| |i| |j|
                                                                 (QREFELT $
                                                                          22))
                                                       (SPADCALL |v| |l|
                                                                 (QREFELT $
                                                                          94))
                                                       (QREFELT $ 47))
                                                      (QREFELT $ 62)))))
                                    (LETT |j|
                                          (PROG1 (+ |j| 1)
                                            (LETT |l| (+ |l| 1))))
                                    (GO G190) G191 (EXIT NIL))
                                   (EXIT |sum|))
                              (QREFELT $ 95))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT |w|))))))) 

(SDEFUN |MATCAT-;*;RowSRow;36| ((|v| |Row|) (|x| S) ($ |Row|))
        (SPROG
         ((|sum| (R)) (#1=#:G539 NIL) (|i| NIL) (#2=#:G540 NIL) (|l| NIL)
          (#3=#:G537 NIL) (|j| NIL) (#4=#:G538 NIL) (|k| NIL) (|w| (|Row|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT $ 11))
                      (SPADCALL |v| (QREFELT $ 72)) (QREFELT $ 21))
            (|error| "can't multiply vector v and matrix A if #rows A ~= #v"))
           ('T
            (SEQ
             (LETT |w|
                   (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                             (|spadConstant| $ 29) (QREFELT $ 97)))
             (SEQ (LETT |k| (SPADCALL |w| (QREFELT $ 73)))
                  (LETT #4# (SPADCALL |w| (QREFELT $ 74)))
                  (LETT |j| (SPADCALL |x| (QREFELT $ 19)))
                  (LETT #3# (SPADCALL |x| (QREFELT $ 20))) G190
                  (COND ((OR (> |j| #3#) (> |k| #4#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |w| |k|
                              (SEQ (LETT |sum| (|spadConstant| $ 29))
                                   (SEQ
                                    (LETT |l| (SPADCALL |v| (QREFELT $ 73)))
                                    (LETT #2# (SPADCALL |v| (QREFELT $ 74)))
                                    (LETT |i| (SPADCALL |x| (QREFELT $ 17)))
                                    (LETT #1# (SPADCALL |x| (QREFELT $ 18)))
                                    G190
                                    (COND
                                     ((OR (> |i| #1#) (> |l| #2#)) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |sum|
                                            (SPADCALL |sum|
                                                      (SPADCALL
                                                       (SPADCALL |x| |i| |j|
                                                                 (QREFELT $
                                                                          22))
                                                       (SPADCALL |v| |l|
                                                                 (QREFELT $
                                                                          98))
                                                       (QREFELT $ 47))
                                                      (QREFELT $ 62)))))
                                    (LETT |i|
                                          (PROG1 (+ |i| 1)
                                            (LETT |l| (+ |l| 1))))
                                    (GO G190) G191 (EXIT NIL))
                                   (EXIT |sum|))
                              (QREFELT $ 99))))
                  (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT |w|))))))) 

(SDEFUN |MATCAT-;columnSpace;SL;37| ((M S) ($ |List| |Col|))
        (SPROG
         ((|indRow| (|Integer|)) (|basis| (|List| |Col|)) (#1=#:G546 NIL)
          (|k| NIL) (|m| (|Integer|)) (|n| (|Integer|)) (M2 (S)))
         (SEQ (LETT M2 (SPADCALL M (QREFELT $ 101))) (LETT |basis| NIL)
              (LETT |n| (SPADCALL M (QREFELT $ 12)))
              (LETT |m| (SPADCALL M (QREFELT $ 11))) (LETT |indRow| 1)
              (SEQ (LETT |k| 1) (LETT #1# |n|) G190
                   (COND
                    ((OR (|greater_SI| |k| #1#)
                         (NULL (SPADCALL |indRow| |m| (QREFELT $ 102))))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL M2 |indRow| |k| (QREFELT $ 103))
                                  (QREFELT $ 23)))
                       (SEQ
                        (LETT |basis|
                              (CONS (SPADCALL M |k| (QREFELT $ 104)) |basis|))
                        (EXIT (LETT |indRow| (+ |indRow| 1))))))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |basis|))))) 

(SDEFUN |MATCAT-;B0| ((|n| |PositiveInteger|) ($ S))
        (SPROG
         ((#1=#:G559 NIL) (|j| NIL) (#2=#:G558 NIL) (#3=#:G557 NIL) (|i| NIL)
          (#4=#:G556 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |i| 1) (LETT #3# |n|) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |j| 1) (LETT #1# |n|) G190
                                (COND ((|greater_SI| |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (COND
                                          ((EQL |i| (+ |j| 1))
                                           (COND
                                            ((ODDP |j|)
                                             (SPADCALL (|spadConstant| $ 43)
                                                       (QREFELT $ 27)))
                                            ((EQL |i| (- |j| 1))
                                             (COND
                                              ((ODDP |i|)
                                               (|spadConstant| $ 43))
                                              ('T (|spadConstant| $ 29))))
                                            ('T (|spadConstant| $ 29))))
                                          ((EQL |i| (- |j| 1))
                                           (COND
                                            ((ODDP |i|) (|spadConstant| $ 43))
                                            ('T (|spadConstant| $ 29))))
                                          ('T (|spadConstant| $ 29)))
                                         #2#))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                 (EXIT (NREVERSE #4#))))
           (QREFELT $ 107))))) 

(SDEFUN |MATCAT-;PfChar| ((A S) ($ . #1=(|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| R)) (#2=#:G573 NIL) (|e| NIL)
          (#3=#:G574 NIL) (|k| NIL) (|c| (R)) (#4=#:G571 NIL) (|i| NIL)
          (#5=#:G572 NIL) (|j| NIL) (|g| (|List| R)) (C (S)) (#6=#:G570 NIL)
          (B (S)) (#7=#:G560 NIL) (|d| (|NonNegativeInteger|)) (|p| #1#)
          (|s| (S)) (|r| (S)) (M (S)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL A (QREFELT $ 11)))
              (EXIT
               (COND
                ((EQL |n| 2)
                 (SPADCALL (SPADCALL (|spadConstant| $ 43) 2 (QREFELT $ 109))
                           (SPADCALL (SPADCALL A 1 2 (QREFELT $ 22))
                                     (QREFELT $ 110))
                           (QREFELT $ 111)))
                ('T
                 (SEQ (LETT M (SPADCALL A 3 |n| 3 |n| (QREFELT $ 112)))
                      (LETT |r| (SPADCALL A 1 1 3 |n| (QREFELT $ 112)))
                      (LETT |s| (SPADCALL A 3 |n| 2 2 (QREFELT $ 112)))
                      (LETT |p| (|MATCAT-;PfChar| M $))
                      (LETT |d| (SPADCALL |p| (QREFELT $ 113)))
                      (LETT B
                            (|MATCAT-;B0|
                             (PROG1 (LETT #7# (- |n| 2))
                               (|check_subtype2| (> #7# 0) '(|PositiveInteger|)
                                                 '(|Integer|) #7#))
                             $))
                      (LETT C (SPADCALL |r| B (QREFELT $ 89)))
                      (LETT |g|
                            (LIST
                             (SPADCALL (SPADCALL C |s| (QREFELT $ 89)) 1 1
                                       (QREFELT $ 22))
                             (SPADCALL A 1 2 (QREFELT $ 22))
                             (|spadConstant| $ 43)))
                      (COND
                       ((>= |d| 4)
                        (SEQ (LETT B (SPADCALL M B (QREFELT $ 89)))
                             (EXIT
                              (SEQ (LETT |i| 4) (LETT #6# |d|) G190
                                   (COND ((> |i| #6#) (GO G191)))
                                   (SEQ (LETT C (SPADCALL C B (QREFELT $ 89)))
                                        (EXIT
                                         (LETT |g|
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL C |s|
                                                           (QREFELT $ 89))
                                                 1 1 (QREFELT $ 22))
                                                |g|))))
                                   (LETT |i| (+ |i| 2)) (GO G190) G191
                                   (EXIT NIL))))))
                      (LETT |g| (NREVERSE |g|))
                      (LETT |res| (|spadConstant| $ 114))
                      (SEQ (LETT |j| 2) (LETT #5# (+ |d| 2)) (LETT |i| 0)
                           (LETT #4# |d|) G190
                           (COND
                            ((OR (> |i| #4#) (|greater_SI| |j| #5#))
                             (GO G191)))
                           (SEQ (LETT |c| (SPADCALL |p| |i| (QREFELT $ 115)))
                                (EXIT
                                 (SEQ (LETT |k| 2) (LETT #3# (- |d|))
                                      (LETT |e| NIL)
                                      (LETT #2#
                                            (SPADCALL |g| |j| (QREFELT $ 116)))
                                      G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |e| (CAR #2#)) NIL)
                                            (< |k| #3#))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT |res|
                                              (SPADCALL |res|
                                                        (SPADCALL
                                                         (SPADCALL |c| |e|
                                                                   (QREFELT $
                                                                            47))
                                                         (+ |k| |i|)
                                                         (QREFELT $ 109))
                                                        (QREFELT $ 111)))))
                                      (LETT #2#
                                            (PROG1 (CDR #2#)
                                              (LETT |k| (+ |k| -2))))
                                      (GO G190) G191 (EXIT NIL))))
                           (LETT |i|
                                 (PROG1 (+ |i| 2) (LETT |j| (|inc_SI| |j|))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;Pfaffian;SR;40| ((A S) ($ R))
        (COND
         ((SPADCALL A (QREFELT $ 117))
          (COND ((ODDP (SPADCALL A (QREFELT $ 11))) (|spadConstant| $ 29))
                (#1='T
                 (SPADCALL (|MATCAT-;PfChar| A $) (|spadConstant| $ 29)
                           (QREFELT $ 118)))))
         (#1#
          (|error|
           "Pfaffian: only defined for antisymmetric square matrices!")))) 

(SDEFUN |MATCAT-;exquo;SRU;41| ((|x| S) (|a| R) ($ |Union| S "failed"))
        (SPROG
         ((|entry| (R)) (#1=#:G590 NIL) (|r| (|Union| R "failed"))
          (#2=#:G592 NIL) (|j| NIL) (#3=#:G591 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ans|
                  (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                            (SPADCALL |x| (QREFELT $ 12)) (|spadConstant| $ 29)
                            (QREFELT $ 31)))
            (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)))
                 (LETT #3# (SPADCALL |x| (QREFELT $ 18))) G190
                 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)))
                        (LETT #2# (SPADCALL |x| (QREFELT $ 20))) G190
                        (COND ((> |j| #2#) (GO G191)))
                        (SEQ
                         (LETT |entry|
                               (SEQ
                                (LETT |r|
                                      (SPADCALL
                                       (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                       |a| (QREFELT $ 121)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |r| 1)
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed"))
                                    (GO #4=#:G589)))
                                  ('T (QCDR |r|))))))
                         (EXIT
                          (SPADCALL |ans| |i| |j| |entry| (QREFELT $ 34))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ans|))))
          #4# (EXIT #1#)))) 

(SDEFUN |MATCAT-;/;SRS;42| ((|x| S) (|r| R) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|MATCAT-;/;SRS;42!0| (VECTOR $ |r|)) |x|
                         (QREFELT $ 81)))) 

(SDEFUN |MATCAT-;/;SRS;42!0| ((|r1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |r| (QREFELT $ 123)))))) 

(SDEFUN |MATCAT-;^;SIS;43| ((|x| S) (|n| |Integer|) ($ S))
        (SPROG ((|xInv| (|Union| S "failed")) (|nn| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((NULL
                   (EQL (LETT |nn| (SPADCALL |x| (QREFELT $ 11)))
                        (SPADCALL |x| (QREFELT $ 12))))
                  (|error| "^: matrix must be square"))
                 ('T
                  (COND
                   ((ZEROP |n|)
                    (SPADCALL |nn| (|spadConstant| $ 43) (QREFELT $ 91)))
                   ((SPADCALL |n| (QREFELT $ 125))
                    (SPADCALL |x| |n| (QREFELT $ 88)))
                   (#1='T
                    (SEQ (LETT |xInv| (SPADCALL |x| (QREFELT $ 126)))
                         (EXIT
                          (COND
                           ((QEQCAR |xInv| 1)
                            (|error| "^: matrix must be invertible"))
                           (#1#
                            (SPADCALL (QCDR |xInv|) (- |n|)
                                      (QREFELT $ 88))))))))))))) 

(DECLAIM (NOTINLINE |MatrixCategory&;|)) 

(DEFUN |MatrixCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|MatrixCategory&| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 129))
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
                                        (|HasCategory| |#2| '(|SemiRng|))
                                        (|HasCategory| |#2|
                                                       '(|AbelianGroup|))))))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 7)
      (QSETREFV $ 28
                (CONS (|dispatchFunction| |MATCAT-;antisymmetric?;SB;4|) $))))
    (QSETREFV $ 44
              (COND
               ((|HasCategory| |#2| '(|SemiRing|))
                (CONS 0 (|spadConstant| $ 43)))
               ('T (CONS 1 "one"))))
    (COND
     ((|domainEqual| |#1| (|Matrix| |#2|))
      (PROGN
       (COND
        ((|testBitVector| |pv$| 6)
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
                          $)))))
       (QSETREFV $ 63
                 (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;15|) $))
       (QSETREFV $ 65
                 (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;16|) $))
       (QSETREFV $ 66
                 (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;17|)
                       $))))
     ('T
      (PROGN
       (COND
        ((|testBitVector| |pv$| 6)
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
                          $)))))
       (QSETREFV $ 63
                 (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;21|) $))
       (QSETREFV $ 65
                 (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;22|) $))
       (QSETREFV $ 66
                 (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;23|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 79 (CONS (|dispatchFunction| |MATCAT-;-;3S;27|) $))
       (QSETREFV $ 82 (CONS (|dispatchFunction| |MATCAT-;-;2S;28|) $))
       (QSETREFV $ 84 (CONS (|dispatchFunction| |MATCAT-;*;I2S;29|) $)))))
    (COND
     ((|testBitVector| |pv$| 6)
      (PROGN
       (QSETREFV $ 85 (CONS (|dispatchFunction| |MATCAT-;*;R2S;30|) $))
       (QSETREFV $ 86 (CONS (|dispatchFunction| |MATCAT-;*;SRS;31|) $))
       (QSETREFV $ 87 (CONS (|dispatchFunction| |MATCAT-;*;3S;32|) $))
       (QSETREFV $ 90
                 (CONS (|dispatchFunction| |MATCAT-;positivePower;SIS;33|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 5)
      (QSETREFV $ 92 (CONS (|dispatchFunction| |MATCAT-;^;SNniS;34|) $))))
    (COND
     ((|HasCategory| |#4| '(|shallowlyMutable|))
      (QSETREFV $ 96 (CONS (|dispatchFunction| |MATCAT-;*;S2Col;35|) $))))
    (COND
     ((|HasCategory| |#3| '(|shallowlyMutable|))
      (QSETREFV $ 100 (CONS (|dispatchFunction| |MATCAT-;*;RowSRow;36|) $))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 106
                (CONS (|dispatchFunction| |MATCAT-;columnSpace;SL;37|) $))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 119
                 (CONS (|dispatchFunction| |MATCAT-;Pfaffian;SR;40|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 122 (CONS (|dispatchFunction| |MATCAT-;exquo;SRU;41|) $))))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 124 (CONS (|dispatchFunction| |MATCAT-;/;SRS;42|) $))
       (QSETREFV $ 127 (CONS (|dispatchFunction| |MATCAT-;^;SIS;43|) $)))))
    $))) 

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
              |MATCAT-;+;3S;26| (247 . -) (253 . -) (|Mapping| 7 7)
              (259 . |map|) (265 . -) (270 . *) (276 . *) (282 . *) (288 . *)
              (294 . *) (300 . |positivePower|) (306 . *)
              (312 . |positivePower|) (318 . |scalarMatrix|) (324 . ^)
              (330 . |new|) (336 . |elt|) (342 . |setelt!|) (349 . *)
              (355 . |new|) (361 . |elt|) (367 . |setelt!|) (374 . *)
              (380 . |rowEchelon|) (385 . <=) (391 . |elt|) (398 . |column|)
              (|List| 9) (404 . |columnSpace|) (409 . |matrix|)
              (|SparseUnivariatePolynomial| 7) (414 . |monomial|)
              (420 . |coerce|) (425 . +) (431 . |subMatrix|) (440 . |degree|)
              (445 . |Zero|) (449 . |coefficient|) (455 . |first|)
              (461 . |antisymmetric?|) (466 . |elt|) (472 . |Pfaffian|)
              (|Union| $ '"failed") (477 . |exquo|) (483 . |exquo|) (489 . /)
              (495 . /) (501 . |positive?|) (506 . |inverse|) (511 . ^)
              (|OutputForm|))
           '#(|zero?| 517 |zero| 522 |transpose| 528 |symmetric?| 533 |square?|
              538 |scalarMatrix| 543 |positivePower| 549 |matrix| 555
              |kronecker_prod1| 567 |kroneckerSum| 578 |kroneckerProduct| 589
              |exquo| 600 |diagonalMatrix| 606 |diagonal?| 616 |columnSpace|
              621 |coerce| 626 |antisymmetric?| 631 ^ 636 |Pfaffian| 648 / 653
              - 659 + 670 * 676)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 127
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
                                                   0 0 0 48 2 45 10 49 0 50 7 6
                                                   51 0 16 52 53 10 10 54 55 7
                                                   0 51 0 16 52 53 10 10 54 56
                                                   1 6 0 0 57 1 0 0 53 58 1 6 0
                                                   53 59 2 0 0 0 0 60 3 45 10
                                                   49 0 10 61 2 7 0 0 0 62 1 0
                                                   0 53 63 1 6 0 53 64 2 0 0 0
                                                   0 65 1 0 0 53 66 1 9 10 0 67
                                                   1 9 16 0 68 1 9 16 0 69 2 9
                                                   7 0 16 70 1 8 10 0 72 1 8 16
                                                   0 73 1 8 16 0 74 2 8 7 0 16
                                                   75 2 7 0 0 0 78 2 0 0 0 0 79
                                                   2 6 0 80 0 81 1 0 0 0 82 2 7
                                                   0 16 0 83 2 0 0 16 0 84 2 0
                                                   0 7 0 85 2 0 0 0 7 86 2 0 0
                                                   0 0 87 2 6 0 0 16 88 2 6 0 0
                                                   0 89 2 0 0 0 16 90 2 6 0 10
                                                   7 91 2 0 0 0 10 92 2 9 0 10
                                                   7 93 2 9 7 0 16 94 3 9 7 0
                                                   16 7 95 2 0 9 0 9 96 2 8 0
                                                   10 7 97 2 8 7 0 16 98 3 8 7
                                                   0 16 7 99 2 0 8 8 0 100 1 6
                                                   0 0 101 2 16 13 0 0 102 3 6
                                                   7 0 16 16 103 2 6 9 0 16 104
                                                   1 0 105 0 106 1 6 0 35 107 2
                                                   108 0 7 10 109 1 108 0 7 110
                                                   2 108 0 0 0 111 5 6 0 0 16
                                                   16 16 16 112 1 108 10 0 113
                                                   0 108 0 114 2 108 7 0 10 115
                                                   2 41 0 0 10 116 1 6 13 0 117
                                                   2 108 7 0 7 118 1 0 7 0 119
                                                   2 7 120 0 0 121 2 0 120 0 7
                                                   122 2 7 0 0 0 123 2 0 0 0 7
                                                   124 1 16 13 0 125 1 6 120 0
                                                   126 2 0 0 0 16 127 1 0 13 0
                                                   30 2 0 0 10 10 32 1 0 0 8 76
                                                   1 0 13 0 26 1 0 13 0 14 2 0
                                                   0 10 7 40 2 0 0 0 16 90 3 0
                                                   0 10 10 37 38 1 0 0 35 36 7
                                                   0 51 0 16 52 53 10 10 54 56
                                                   1 0 0 53 63 2 0 0 0 0 65 1 0
                                                   0 53 58 2 0 0 0 0 60 2 0 120
                                                   0 7 122 1 0 0 53 66 1 0 0 41
                                                   42 1 0 13 0 24 1 0 105 0 106
                                                   1 0 0 9 71 1 0 13 0 28 2 0 0
                                                   0 16 127 2 0 0 0 10 92 1 0 7
                                                   0 119 2 0 0 0 7 124 1 0 0 0
                                                   82 2 0 0 0 0 79 2 0 0 0 0 77
                                                   2 0 8 8 0 100 2 0 0 0 7 86 2
                                                   0 9 0 9 96 2 0 0 0 0 87 2 0
                                                   0 7 0 85 2 0 0 16 0 84)))))
           '|lookupComplete|)) 
