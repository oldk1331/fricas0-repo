
(/VERSIONCHECK 2) 

(DEFUN |LGROBP;reduceRow| (M |v| |lastRow| |pivots| $)
  (PROG (|a1| #1=#:G138 |kk| #2=#:G146 |vk| |b| |k| |mj| |j| |dim|)
    (RETURN
     (SEQ (LETT |a1| (|spadConstant| $ 13) . #3=(|LGROBP;reduceRow|))
          (LETT |b| (|spadConstant| $ 14) . #3#)
          (LETT |dim| (QVSIZE |v|) . #3#)
          (SEQ (LETT |j| 1 . #3#) G190
               (COND ((|greater_SI| |j| |lastRow|) (GO G191)))
               (SEQ (LETT |mj| (SPADCALL M |j| (QREFELT $ 18)) . #3#)
                    (LETT |k| (SPADCALL |pivots| |j| (QREFELT $ 20)) . #3#)
                    (LETT |b| (SPADCALL |mj| |k| (QREFELT $ 21)) . #3#)
                    (LETT |vk| (SPADCALL |v| |k| (QREFELT $ 21)) . #3#)
                    (SEQ (LETT |kk| 1 . #3#) (LETT #2# (- |k| 1) . #3#) G190
                         (COND ((|greater_SI| |kk| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |v| |kk|
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |b|
                                                           (SPADCALL |v| |kk|
                                                                     (QREFELT $
                                                                              21))
                                                           (QREFELT $ 22))
                                                 (QREFELT $ 23))
                                                |a1| (QREFELT $ 24))
                                               . #3#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (QREFELT $ 7) #1#))
                                     (QREFELT $ 25))))
                         (LETT |kk| (|inc_SI| |kk|) . #3#) (GO G190) G191
                         (EXIT NIL))
                    (SEQ (LETT |kk| |k| . #3#) G190
                         (COND ((> |kk| |dim|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |v| |kk|
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |vk|
                                                           (SPADCALL |mj| |kk|
                                                                     (QREFELT $
                                                                              21))
                                                           (QREFELT $ 22))
                                                 (SPADCALL |b|
                                                           (SPADCALL |v| |kk|
                                                                     (QREFELT $
                                                                              21))
                                                           (QREFELT $ 22))
                                                 (QREFELT $ 26))
                                                |a1| (QREFELT $ 24))
                                               . #3#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (QREFELT $ 7) #1#))
                                     (QREFELT $ 25))))
                         (LETT |kk| (+ |kk| 1) . #3#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (LETT |a1| |b| . #3#)))
               (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |v|))))) 

(DEFUN |LGROBP;rRedPol| (|f| B $)
  (PROG (|ggm| |gg| |gm|)
    (RETURN
     (SEQ (LETT |gm| (SPADCALL |f| B (QREFELT $ 31)) . #1=(|LGROBP;rRedPol|))
          (EXIT
           (COND
            ((SPADCALL (QCAR |gm|) (|spadConstant| $ 32) (QREFELT $ 34)) |gm|)
            ('T
             (SEQ (LETT |gg| (SPADCALL (QCAR |gm|) (QREFELT $ 35)) . #1#)
                  (LETT |ggm| (|LGROBP;rRedPol| |gg| B $) . #1#)
                  (EXIT
                   (CONS
                    (SPADCALL
                     (SPADCALL (QCDR |ggm|)
                               (SPADCALL (QCAR |gm|) |gg| (QREFELT $ 36))
                               (QREFELT $ 37))
                     (QCAR |ggm|) (QREFELT $ 38))
                    (SPADCALL (QCDR |ggm|) (QCDR |gm|) (QREFELT $ 22)))))))))))) 

(DEFUN |LGROBP;totolex;LL;3| (B $)
  (PROG (|nBasis| |i| |ltresult| |result| |antc| #1=#:G169 #2=#:G168 #3=#:G170
         #4=#:G179 |c| #5=#:G180 |b| |cordlist| #6=#:G178 |k| #7=#:G177 |j|
         |lm| |orecfmon| |ofirstmon| |veccoef| #8=#:G161 #9=#:G158 |cc|
         |recfmon| |v| |firstmon| |pivots| |linmat| |ndim1| |ndim| #10=#:G151
         |vBasis|)
    (RETURN
     (SEQ (LETT |result| NIL . #11=(|LGROBP;totolex;LL;3|))
          (LETT |ltresult| NIL . #11#)
          (LETT |vBasis| (SPADCALL B (QREFELT $ 39)) . #11#)
          (LETT |nBasis| (LIST (|spadConstant| $ 41)) . #11#)
          (LETT |ndim|
                (PROG1 (LETT #10# (LENGTH |vBasis|) . #11#)
                  (|check_subtype| (> #10# 0) '(|PositiveInteger|) #10#))
                . #11#)
          (LETT |ndim1| (+ |ndim| 1) . #11#)
          (LETT |linmat| (SPADCALL |ndim| (+ (* 2 |ndim|) 1) (QREFELT $ 44))
                . #11#)
          (SPADCALL |linmat| 1 1 (|spadConstant| $ 13) (QREFELT $ 45))
          (SPADCALL |linmat| 1 |ndim1| (|spadConstant| $ 13) (QREFELT $ 45))
          (LETT |pivots| (MAKEARR1 |ndim| 0) . #11#)
          (SPADCALL |pivots| 1 1 (QREFELT $ 46))
          (LETT |firstmon| (|spadConstant| $ 41) . #11#)
          (LETT |ofirstmon| (|spadConstant| $ 41) . #11#)
          (LETT |orecfmon| (CONS (|spadConstant| $ 42) (|spadConstant| $ 13))
                . #11#)
          (LETT |i| 2 . #11#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL
                   (LETT |firstmon|
                         (SPADCALL |firstmon| |ltresult| (QREFELT $ 48))
                         . #11#)
                   (|spadConstant| $ 41) (QREFELT $ 49)))
                 (GO G191)))
               (SEQ
                (SEQ
                 (LETT |v| (SPADCALL |firstmon| |ofirstmon| (QREFELT $ 50))
                       . #11#)
                 (EXIT
                  (COND
                   ((QEQCAR |v| 1)
                    (LETT |recfmon|
                          (|LGROBP;rRedPol|
                           (SPADCALL |firstmon| (QREFELT $ 51)) B $)
                          . #11#))
                   ('T
                    (SEQ
                     (LETT |recfmon|
                           (|LGROBP;rRedPol|
                            (SPADCALL (SPADCALL (QCDR |v|) (QREFELT $ 51))
                                      (QCAR |orecfmon|) (QREFELT $ 52))
                            B $)
                           . #11#)
                     (EXIT
                      (PROGN
                       (RPLACD |recfmon|
                               (SPADCALL (QCDR |recfmon|) (QCDR |orecfmon|)
                                         (QREFELT $ 22)))
                       (QCDR |recfmon|))))))))
                (LETT |cc|
                      (SPADCALL (SPADCALL (QCAR |recfmon|) (QREFELT $ 53))
                                (QCDR |recfmon|) (QREFELT $ 54))
                      . #11#)
                (PROGN
                 (RPLACA |recfmon|
                         (PROG2
                             (LETT #9#
                                   (SPADCALL (QCAR |recfmon|) |cc|
                                             (QREFELT $ 55))
                                   . #11#)
                             (QCDR #9#)
                           (|check_union| (QEQCAR #9# 0)
                                          (|HomogeneousDistributedMultivariatePolynomial|
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          #9#)))
                 (QCAR |recfmon|))
                (PROGN
                 (RPLACD |recfmon|
                         (PROG2
                             (LETT #8#
                                   (SPADCALL (QCDR |recfmon|) |cc|
                                             (QREFELT $ 24))
                                   . #11#)
                             (QCDR #8#)
                           (|check_union| (QEQCAR #8# 0) (QREFELT $ 7) #8#)))
                 (QCDR |recfmon|))
                (LETT |veccoef|
                      (SPADCALL (QCAR |recfmon|) |vBasis| (QREFELT $ 56))
                      . #11#)
                (LETT |ofirstmon| |firstmon| . #11#)
                (LETT |orecfmon| |recfmon| . #11#)
                (LETT |lm| (SPADCALL (+ (* 2 |ndim|) 1) (QREFELT $ 57)) . #11#)
                (SEQ (LETT |j| 1 . #11#) G190
                     (COND ((|greater_SI| |j| |ndim|) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |lm| |j|
                                 (SPADCALL |veccoef| |j| (QREFELT $ 21))
                                 (QREFELT $ 25))))
                     (LETT |j| (|inc_SI| |j|) . #11#) (GO G190) G191
                     (EXIT NIL))
                (SPADCALL |lm| (+ |ndim| |i|) (QCDR |recfmon|) (QREFELT $ 25))
                (LETT |lm|
                      (|LGROBP;reduceRow| |linmat| |lm| (- |i| 1) |pivots| $)
                      . #11#)
                (COND ((EQL |i| |ndim1|) (LETT |j| |ndim1| . #11#))
                      ('T
                       (SEQ (LETT |j| 1 . #11#)
                            (EXIT
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL |lm| |j| (QREFELT $ 21))
                                        (|spadConstant| $ 14) (QREFELT $ 58))
                                       (< |j| |ndim1|))
                                      ('T 'NIL)))
                                    (GO G191)))
                                  (SEQ (EXIT (LETT |j| (+ |j| 1) . #11#))) NIL
                                  (GO G190) G191 (EXIT NIL))))))
                (EXIT
                 (COND
                  ((EQL |j| |ndim1|)
                   (SEQ
                    (LETT |cordlist|
                          (PROGN
                           (LETT #7# NIL . #11#)
                           (SEQ (LETT |k| |ndim1| . #11#)
                                (LETT #6# (+ |ndim1| (LENGTH |nBasis|)) . #11#)
                                G190 (COND ((> |k| #6#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #7#
                                        (CONS
                                         (SPADCALL |lm| |k| (QREFELT $ 21))
                                         #7#)
                                        . #11#)))
                                (LETT |k| (+ |k| 1) . #11#) (GO G190) G191
                                (EXIT (NREVERSE #7#))))
                          . #11#)
                    (LETT |antc|
                          (PROGN
                           (LETT #1# NIL . #11#)
                           (SEQ (LETT |b| NIL . #11#)
                                (LETT #5# (CONS |firstmon| |nBasis|) . #11#)
                                (LETT |c| NIL . #11#)
                                (LETT #4# (REVERSE |cordlist|) . #11#) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |c| (CAR #4#) . #11#) NIL)
                                      (ATOM #5#)
                                      (PROGN (LETT |b| (CAR #5#) . #11#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #3# (SPADCALL |c| |b| (QREFELT $ 59))
                                         . #11#)
                                   (COND
                                    (#1#
                                     (LETT #2#
                                           (SPADCALL #2# #3# (QREFELT $ 60))
                                           . #11#))
                                    ('T
                                     (PROGN
                                      (LETT #2# #3# . #11#)
                                      (LETT #1# 'T . #11#)))))))
                                (LETT #4#
                                      (PROG1 (CDR #4#)
                                        (LETT #5# (CDR #5#) . #11#))
                                      . #11#)
                                (GO G190) G191 (EXIT NIL))
                           (COND (#1# #2#) ('T (|spadConstant| $ 61))))
                          . #11#)
                    (LETT |antc| (SPADCALL |antc| (QREFELT $ 62)) . #11#)
                    (LETT |result| (CONS |antc| |result|) . #11#)
                    (EXIT
                     (LETT |ltresult|
                           (CONS
                            (SPADCALL |antc| (SPADCALL |antc| (QREFELT $ 63))
                                      (QREFELT $ 64))
                            |ltresult|)
                           . #11#))))
                  ('T
                   (SEQ (SPADCALL |pivots| |i| |j| (QREFELT $ 46))
                        (SPADCALL |linmat| |i| |lm| (QREFELT $ 65))
                        (LETT |i| (+ |i| 1) . #11#)
                        (EXIT
                         (LETT |nBasis| (CONS |firstmon| |nBasis|)
                               . #11#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |result|))))) 

(DEFUN |LGROBP;minPol;LOvlHdmp;4| (|oldBasis| |x| $)
  (PROG (|algBasis|)
    (RETURN
     (SEQ
      (LETT |algBasis| (SPADCALL |oldBasis| (QREFELT $ 39))
            |LGROBP;minPol;LOvlHdmp;4|)
      (EXIT (SPADCALL |oldBasis| |algBasis| |x| (QREFELT $ 67))))))) 

(DEFUN |LGROBP;minPol;2LOvlHdmp;5| (|oldBasis| |algBasis| |x| $)
  (PROG (#1=#:G199 |g| #2=#:G193 #3=#:G200 |k| |j| |lm| |veccoef| |omult|
         #4=#:G188 |f| #5=#:G185 |cc| |recf| |i| |pivots| |linmat| |ndim1|
         |ndim| #6=#:G183 |nvp|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nvp| (SPADCALL |x| (QREFELT $ 69))
              . #7=(|LGROBP;minPol;2LOvlHdmp;5|))
        (LETT |f| (|spadConstant| $ 42) . #7#)
        (LETT |omult| (|spadConstant| $ 13) . #7#)
        (LETT |ndim|
              (PROG1 (LETT #6# (LENGTH |algBasis|) . #7#)
                (|check_subtype| (> #6# 0) '(|PositiveInteger|) #6#))
              . #7#)
        (LETT |ndim1| (+ |ndim| 1) . #7#)
        (LETT |linmat| (SPADCALL |ndim| (+ (* 2 |ndim|) 1) (QREFELT $ 44))
              . #7#)
        (SPADCALL |linmat| 1 1 (|spadConstant| $ 13) (QREFELT $ 45))
        (SPADCALL |linmat| 1 |ndim1| (|spadConstant| $ 13) (QREFELT $ 45))
        (LETT |pivots| (MAKEARR1 |ndim| 0) . #7#)
        (SPADCALL |pivots| 1 1 (QREFELT $ 46))
        (EXIT
         (SEQ (LETT |i| 2 . #7#) G190
              (COND ((|greater_SI| |i| |ndim1|) (GO G191)))
              (SEQ
               (LETT |recf|
                     (|LGROBP;rRedPol| (SPADCALL |f| |nvp| (QREFELT $ 52))
                      |oldBasis| $)
                     . #7#)
               (LETT |omult| (SPADCALL (QCDR |recf|) |omult| (QREFELT $ 22))
                     . #7#)
               (LETT |f| (QCAR |recf|) . #7#)
               (LETT |cc|
                     (SPADCALL (SPADCALL |f| (QREFELT $ 53)) |omult|
                               (QREFELT $ 54))
                     . #7#)
               (LETT |f|
                     (PROG2 (LETT #5# (SPADCALL |f| |cc| (QREFELT $ 55)) . #7#)
                         (QCDR #5#)
                       (|check_union| (QEQCAR #5# 0)
                                      (|HomogeneousDistributedMultivariatePolynomial|
                                       (QREFELT $ 6) (QREFELT $ 7))
                                      #5#))
                     . #7#)
               (LETT |omult|
                     (PROG2
                         (LETT #4# (SPADCALL |omult| |cc| (QREFELT $ 24))
                               . #7#)
                         (QCDR #4#)
                       (|check_union| (QEQCAR #4# 0) (QREFELT $ 7) #4#))
                     . #7#)
               (LETT |veccoef| (SPADCALL |f| |algBasis| (QREFELT $ 56)) . #7#)
               (LETT |lm| (SPADCALL (+ (* 2 |ndim|) 1) (QREFELT $ 57)) . #7#)
               (SEQ (LETT |j| 1 . #7#) G190
                    (COND ((|greater_SI| |j| |ndim|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |lm| |j|
                                (SPADCALL |veccoef| |j| (QREFELT $ 21))
                                (QREFELT $ 25))))
                    (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191 (EXIT NIL))
               (SPADCALL |lm| (+ |ndim| |i|) |omult| (QREFELT $ 25))
               (LETT |lm|
                     (|LGROBP;reduceRow| |linmat| |lm| (- |i| 1) |pivots| $)
                     . #7#)
               (LETT |j| 1 . #7#)
               (SEQ G190
                    (COND
                     ((NULL
                       (COND
                        ((SPADCALL (SPADCALL |lm| |j| (QREFELT $ 21))
                                   (|spadConstant| $ 14) (QREFELT $ 58))
                         (< |j| |ndim1|))
                        ('T 'NIL)))
                      (GO G191)))
                    (SEQ (EXIT (LETT |j| (+ |j| 1) . #7#))) NIL (GO G190) G191
                    (EXIT NIL))
               (COND
                ((EQL |j| |ndim1|)
                 (PROGN
                  (LETT #1#
                        (SEQ (LETT |g| (|spadConstant| $ 32) . #7#)
                             (SEQ (LETT |k| |ndim1| . #7#)
                                  (LETT #3# (+ (* 2 |ndim|) 1) . #7#) G190
                                  (COND ((> |k| #3#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |g|
                                          (SPADCALL |g|
                                                    (SPADCALL
                                                     (SPADCALL |lm| |k|
                                                               (QREFELT $ 21))
                                                     (SPADCALL |nvp|
                                                               (PROG1
                                                                   (LETT #2#
                                                                         (- |k|
                                                                            |ndim1|)
                                                                         . #7#)
                                                                 (|check_subtype|
                                                                  (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #2#))
                                                               (QREFELT $ 70))
                                                     (QREFELT $ 37))
                                                    (QREFELT $ 38))
                                          . #7#)))
                                  (LETT |k| (+ |k| 1) . #7#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (SPADCALL |g| (QREFELT $ 71))))
                        . #7#)
                  (GO #1#))))
               (SPADCALL |pivots| |i| |j| (QREFELT $ 46))
               (EXIT (SPADCALL |linmat| |i| |lm| (QREFELT $ 65))))
              (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |LGROBP;transform;DmpHdmp;6| (|dpol| $)
  (COND
   ((SPADCALL |dpol| (|spadConstant| $ 61) (QREFELT $ 72))
    (|spadConstant| $ 32))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |dpol| (QREFELT $ 73))
               (SPADCALL
                (SPADCALL (SPADCALL |dpol| (QREFELT $ 75)) (QREFELT $ 77))
                (QREFELT $ 79))
               (QREFELT $ 80))
     (SPADCALL (SPADCALL |dpol| (QREFELT $ 63)) (QREFELT $ 51))
     (QREFELT $ 38))))) 

(DEFUN |LGROBP;computeBasis;2L;7| (B $)
  (PROG (|result| |part| #1=#:G209 |var| |mB| #2=#:G208 |f| #3=#:G207)
    (RETURN
     (SEQ
      (LETT |mB|
            (PROGN
             (LETT #3# NIL . #4=(|LGROBP;computeBasis;2L;7|))
             (SEQ (LETT |f| NIL . #4#) (LETT #2# B . #4#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #3#
                          (CONS
                           (SPADCALL (|spadConstant| $ 13)
                                     (SPADCALL |f| (QREFELT $ 81))
                                     (QREFELT $ 80))
                           #3#)
                          . #4#)))
                  (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #3#))))
            . #4#)
      (LETT |result| (LIST (|spadConstant| $ 42)) . #4#)
      (SEQ (LETT |var| NIL . #4#) (LETT #1# (QREFELT $ 12) . #4#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |var| (CAR #1#) . #4#) NIL))
             (GO G191)))
           (SEQ
            (LETT |part| (SPADCALL |var| |result| |mB| (QREFELT $ 82)) . #4#)
            (EXIT
             (LETT |result| (SPADCALL |result| |part| (QREFELT $ 83)) . #4#)))
           (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT |result|))))) 

(DEFUN |LGROBP;intcompBasis;Ovl3L;8| (|x| |lr| |mB| $)
  (PROG (|part| |g| #1=#:G214 |f|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |lr| NIL (QREFELT $ 84)) |lr|)
            ('T
             (SEQ (LETT |part| NIL . #2=(|LGROBP;intcompBasis;Ovl3L;8|))
                  (SEQ (LETT |f| NIL . #2#) (LETT #1# |lr| . #2#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |g|
                              (SPADCALL (SPADCALL |x| (QREFELT $ 69)) |f|
                                        (QREFELT $ 52))
                              . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL (QCAR (SPADCALL |g| |mB| (QREFELT $ 31)))
                                     (|spadConstant| $ 32) (QREFELT $ 85))
                           (LETT |part| (CONS |g| |part|) . #2#)))))
                       (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL |part| (SPADCALL |x| |part| |mB| (QREFELT $ 82))
                             (QREFELT $ 83)))))))))) 

(DEFUN |LGROBP;coord;HdmpLV;9| (|f| B $)
  (PROG (|i| |lcf| |lf| |rf| |vv| |ndim|)
    (RETURN
     (SEQ (LETT |ndim| (LENGTH B) . #1=(|LGROBP;coord;HdmpLV;9|))
          (LETT |vv| (MAKEARR1 |ndim| (|spadConstant| $ 14)) . #1#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |f| (|spadConstant| $ 32) (QREFELT $ 85)))
                 (GO G191)))
               (SEQ (LETT |rf| (SPADCALL |f| (QREFELT $ 35)) . #1#)
                    (LETT |lf| (SPADCALL |f| |rf| (QREFELT $ 36)) . #1#)
                    (LETT |lcf| (SPADCALL |f| (QREFELT $ 86)) . #1#)
                    (LETT |i|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 13)
                                     (SPADCALL |lf| (QREFELT $ 81))
                                     (QREFELT $ 80))
                           B (QREFELT $ 87))
                          . #1#)
                    (SPADCALL |vv| |i| |lcf| (QREFELT $ 25))
                    (EXIT (LETT |f| |rf| . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |vv|))))) 

(DEFUN |LGROBP;anticoord;LDmpLDmp;10| (|vv| |mf| B $)
  (PROG (#1=#:G226 |f| #2=#:G227 |c|)
    (RETURN
     (SEQ
      (SEQ (LETT |c| NIL . #3=(|LGROBP;anticoord;LDmpLDmp;10|))
           (LETT #2# |vv| . #3#) (LETT |f| NIL . #3#) (LETT #1# B . #3#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL) (ATOM #2#)
                 (PROGN (LETT |c| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |mf|
                   (SPADCALL |mf| (SPADCALL |c| |f| (QREFELT $ 59))
                             (QREFELT $ 64))
                   . #3#)))
           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |mf|))))) 

(DEFUN |LGROBP;choosemon;DmpLDmp;11| (|mf| |nB| $)
  (PROG (#1=#:G231 |dx| #2=#:G236 |xx| #3=#:G237 |x|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |nB| NIL (QREFELT $ 90))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT $ 12) '|last| (QREFELT $ 93))
                    (QREFELT $ 94))
          |mf| (QREFELT $ 95)))
        ('T
         (SEQ
          (SEQ (LETT |x| NIL . #4=(|LGROBP;choosemon;DmpLDmp;11|))
               (LETT #3# (REVERSE (QREFELT $ 12)) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |xx| (SPADCALL |x| (QREFELT $ 94)) . #4#)
                    (LETT |mf| (SPADCALL |xx| |mf| (QREFELT $ 95)) . #4#)
                    (COND
                     ((SPADCALL (QCAR (SPADCALL |mf| |nB| (QREFELT $ 98)))
                                (|spadConstant| $ 61) (QREFELT $ 49))
                      (PROGN (LETT #2# |mf| . #4#) (GO #2#))))
                    (LETT |dx| (SPADCALL |mf| |x| (QREFELT $ 99)) . #4#)
                    (EXIT
                     (LETT |mf|
                           (PROG2
                               (LETT #1#
                                     (SPADCALL |mf|
                                               (SPADCALL |xx| |dx|
                                                         (QREFELT $ 100))
                                               (QREFELT $ 50))
                                     . #4#)
                               (QCDR #1#)
                             (|check_union| (QEQCAR #1# 0)
                                            (|DistributedMultivariatePolynomial|
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            #1#))
                           . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |mf|)))))
      #2# (EXIT #2#))))) 

(DEFUN |LGROBP;linGenPos;LR;12| (B $)
  (PROG (|nBasis| |i| |ltresult| |result| |antc| #1=#:G262 #2=#:G261 #3=#:G263
         #4=#:G276 |c| #5=#:G277 |b| |cordlist| #6=#:G275 |j| #7=#:G274 |lm|
         |orecfmon| |ofirstmon| |veccoef| #8=#:G255 #9=#:G252 |cc| |recfmon|
         |v| |firstmon| |lx| |nval| #10=#:G244 #11=#:G243 #12=#:G245 #13=#:G272
         |r| #14=#:G273 |vv| |rval| #15=#:G271 |ii| |pivots| |linmat| |ndim1|
         |ndim| #16=#:G239 |vBasis|)
    (RETURN
     (SEQ (LETT |result| NIL . #17=(|LGROBP;linGenPos;LR;12|))
          (LETT |ltresult| NIL . #17#)
          (LETT |vBasis| (SPADCALL B (QREFELT $ 39)) . #17#)
          (LETT |nBasis| (LIST (|spadConstant| $ 41)) . #17#)
          (LETT |ndim|
                (PROG1 (LETT #16# (LENGTH |vBasis|) . #17#)
                  (|check_subtype| (> #16# 0) '(|PositiveInteger|) #16#))
                . #17#)
          (LETT |ndim1| (+ |ndim| 1) . #17#)
          (LETT |linmat| (SPADCALL |ndim| (+ (* 2 |ndim|) 1) (QREFELT $ 44))
                . #17#)
          (SPADCALL |linmat| 1 1 (|spadConstant| $ 13) (QREFELT $ 45))
          (SPADCALL |linmat| 1 |ndim1| (|spadConstant| $ 13) (QREFELT $ 45))
          (LETT |pivots| (MAKEARR1 |ndim| 0) . #17#)
          (SPADCALL |pivots| 1 1 (QREFELT $ 46)) (LETT |i| 2 . #17#)
          (LETT |rval| NIL . #17#)
          (SEQ (LETT |ii| 1 . #17#)
               (LETT #15# (- (LENGTH (QREFELT $ 12)) 1) . #17#) G190
               (COND ((|greater_SI| |ii| #15#) (GO G191)))
               (SEQ (LETT |c| 0 . #17#)
                    (SEQ G190 (COND ((NULL (EQL |c| 0)) (GO G191)))
                         (SEQ (EXIT (LETT |c| (RANDOM 11) . #17#))) NIL
                         (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |rval| (CONS |c| |rval|) . #17#)))
               (LETT |ii| (|inc_SI| |ii|) . #17#) (GO G190) G191 (EXIT NIL))
          (LETT |nval|
                (SPADCALL
                 (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 101))
                           (QREFELT $ 94))
                 (PROGN
                  (LETT #10# NIL . #17#)
                  (SEQ (LETT |vv| NIL . #17#) (LETT #14# (QREFELT $ 12) . #17#)
                       (LETT |r| NIL . #17#) (LETT #13# |rval| . #17#) G190
                       (COND
                        ((OR (ATOM #13#)
                             (PROGN (LETT |r| (CAR #13#) . #17#) NIL)
                             (ATOM #14#)
                             (PROGN (LETT |vv| (CAR #14#) . #17#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #12#
                                (SPADCALL |r| (SPADCALL |vv| (QREFELT $ 94))
                                          (QREFELT $ 102))
                                . #17#)
                          (COND
                           (#10#
                            (LETT #11# (SPADCALL #11# #12# (QREFELT $ 60))
                                  . #17#))
                           ('T
                            (PROGN
                             (LETT #11# #12# . #17#)
                             (LETT #10# 'T . #17#)))))))
                       (LETT #13#
                             (PROG1 (CDR #13#) (LETT #14# (CDR #14#) . #17#))
                             . #17#)
                       (GO G190) G191 (EXIT NIL))
                  (COND (#10# #11#) ('T (|spadConstant| $ 61))))
                 (QREFELT $ 64))
                . #17#)
          (LETT |firstmon| (|spadConstant| $ 41) . #17#)
          (LETT |ofirstmon| (|spadConstant| $ 41) . #17#)
          (LETT |orecfmon| (CONS (|spadConstant| $ 42) (|spadConstant| $ 13))
                . #17#)
          (LETT |lx| (SPADCALL (QREFELT $ 12) '|last| (QREFELT $ 93)) . #17#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL
                   (LETT |firstmon|
                         (SPADCALL |firstmon| |ltresult| (QREFELT $ 48))
                         . #17#)
                   (|spadConstant| $ 41) (QREFELT $ 49)))
                 (GO G191)))
               (SEQ
                (SEQ
                 (LETT |v| (SPADCALL |firstmon| |ofirstmon| (QREFELT $ 50))
                       . #17#)
                 (EXIT
                  (COND
                   ((QEQCAR |v| 1)
                    (LETT |recfmon|
                          (|LGROBP;rRedPol|
                           (SPADCALL
                            (SPADCALL |firstmon| |lx| |nval| (QREFELT $ 103))
                            (QREFELT $ 51))
                           B $)
                          . #17#))
                   ('T
                    (SEQ
                     (LETT |recfmon|
                           (|LGROBP;rRedPol|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (QCDR |v|) |lx| |nval| (QREFELT $ 103))
                              (QREFELT $ 51))
                             (QCAR |orecfmon|) (QREFELT $ 52))
                            B $)
                           . #17#)
                     (EXIT
                      (PROGN
                       (RPLACD |recfmon|
                               (SPADCALL (QCDR |recfmon|) (QCDR |orecfmon|)
                                         (QREFELT $ 22)))
                       (QCDR |recfmon|))))))))
                (LETT |cc|
                      (SPADCALL (SPADCALL (QCAR |recfmon|) (QREFELT $ 53))
                                (QCDR |recfmon|) (QREFELT $ 54))
                      . #17#)
                (PROGN
                 (RPLACA |recfmon|
                         (PROG2
                             (LETT #9#
                                   (SPADCALL (QCAR |recfmon|) |cc|
                                             (QREFELT $ 55))
                                   . #17#)
                             (QCDR #9#)
                           (|check_union| (QEQCAR #9# 0)
                                          (|HomogeneousDistributedMultivariatePolynomial|
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          #9#)))
                 (QCAR |recfmon|))
                (PROGN
                 (RPLACD |recfmon|
                         (PROG2
                             (LETT #8#
                                   (SPADCALL (QCDR |recfmon|) |cc|
                                             (QREFELT $ 24))
                                   . #17#)
                             (QCDR #8#)
                           (|check_union| (QEQCAR #8# 0) (QREFELT $ 7) #8#)))
                 (QCDR |recfmon|))
                (LETT |veccoef|
                      (SPADCALL (QCAR |recfmon|) |vBasis| (QREFELT $ 56))
                      . #17#)
                (LETT |ofirstmon| |firstmon| . #17#)
                (LETT |orecfmon| |recfmon| . #17#)
                (LETT |lm| (SPADCALL (+ (* 2 |ndim|) 1) (QREFELT $ 57)) . #17#)
                (SEQ (LETT |j| 1 . #17#) G190
                     (COND ((|greater_SI| |j| |ndim|) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |lm| |j|
                                 (SPADCALL |veccoef| |j| (QREFELT $ 21))
                                 (QREFELT $ 25))))
                     (LETT |j| (|inc_SI| |j|) . #17#) (GO G190) G191
                     (EXIT NIL))
                (SPADCALL |lm| (+ |ndim| |i|) (QCDR |recfmon|) (QREFELT $ 25))
                (LETT |lm|
                      (|LGROBP;reduceRow| |linmat| |lm| (- |i| 1) |pivots| $)
                      . #17#)
                (LETT |j| 1 . #17#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND
                         ((SPADCALL (SPADCALL |lm| |j| (QREFELT $ 21))
                                    (|spadConstant| $ 14) (QREFELT $ 58))
                          (< |j| |ndim1|))
                         ('T 'NIL)))
                       (GO G191)))
                     (SEQ (EXIT (LETT |j| (+ |j| 1) . #17#))) NIL (GO G190)
                     G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((EQL |j| |ndim1|)
                   (SEQ
                    (LETT |cordlist|
                          (PROGN
                           (LETT #7# NIL . #17#)
                           (SEQ (LETT |j| |ndim1| . #17#)
                                (LETT #6# (+ |ndim1| (LENGTH |nBasis|)) . #17#)
                                G190 (COND ((> |j| #6#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #7#
                                        (CONS
                                         (SPADCALL |lm| |j| (QREFELT $ 21))
                                         #7#)
                                        . #17#)))
                                (LETT |j| (+ |j| 1) . #17#) (GO G190) G191
                                (EXIT (NREVERSE #7#))))
                          . #17#)
                    (LETT |antc|
                          (PROGN
                           (LETT #1# NIL . #17#)
                           (SEQ (LETT |b| NIL . #17#)
                                (LETT #5# (CONS |firstmon| |nBasis|) . #17#)
                                (LETT |c| NIL . #17#)
                                (LETT #4# (REVERSE |cordlist|) . #17#) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |c| (CAR #4#) . #17#) NIL)
                                      (ATOM #5#)
                                      (PROGN (LETT |b| (CAR #5#) . #17#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #3# (SPADCALL |c| |b| (QREFELT $ 59))
                                         . #17#)
                                   (COND
                                    (#1#
                                     (LETT #2#
                                           (SPADCALL #2# #3# (QREFELT $ 60))
                                           . #17#))
                                    ('T
                                     (PROGN
                                      (LETT #2# #3# . #17#)
                                      (LETT #1# 'T . #17#)))))))
                                (LETT #4#
                                      (PROG1 (CDR #4#)
                                        (LETT #5# (CDR #5#) . #17#))
                                      . #17#)
                                (GO G190) G191 (EXIT NIL))
                           (COND (#1# #2#) ('T (|spadConstant| $ 61))))
                          . #17#)
                    (LETT |result|
                          (CONS (SPADCALL |antc| (QREFELT $ 62)) |result|)
                          . #17#)
                    (EXIT
                     (LETT |ltresult|
                           (CONS
                            (SPADCALL |antc| (SPADCALL |antc| (QREFELT $ 63))
                                      (QREFELT $ 64))
                            |ltresult|)
                           . #17#))))
                  ('T
                   (SEQ (SPADCALL |pivots| |i| |j| (QREFELT $ 46))
                        (SPADCALL |linmat| |i| |lm| (QREFELT $ 65))
                        (LETT |i| (+ |i| 1) . #17#)
                        (EXIT
                         (LETT |nBasis| (CONS |firstmon| |nBasis|)
                               . #17#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |result| |rval|)))))) 

(DEFUN |LGROBP;groebgen;LR;13| (L $)
  (PROG (LL #1=#:G290 |f| #2=#:G289 |val| #3=#:G282 #4=#:G281 #5=#:G283 |i|
         |ll| #6=#:G288 |nvar1| #7=#:G279 |xn|)
    (RETURN
     (SEQ
      (LETT |xn| (SPADCALL (QREFELT $ 12) '|last| (QREFELT $ 93))
            . #8=(|LGROBP;groebgen;LR;13|))
      (LETT |val| (SPADCALL |xn| (QREFELT $ 94)) . #8#)
      (LETT |nvar1|
            (PROG1 (LETT #7# (- (LENGTH (QREFELT $ 12)) 1) . #8#)
              (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|) #7#))
            . #8#)
      (LETT |ll|
            (PROGN
             (LETT #6# NIL . #8#)
             (SEQ (LETT |i| 1 . #8#) G190
                  (COND ((|greater_SI| |i| |nvar1|) (GO G191)))
                  (SEQ (EXIT (LETT #6# (CONS (RANDOM 11) #6#) . #8#)))
                  (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #8#)
      (LETT |val|
            (SPADCALL |val|
                      (PROGN
                       (LETT #3# NIL . #8#)
                       (SEQ (LETT |i| 1 . #8#) G190
                            (COND ((|greater_SI| |i| |nvar1|) (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #5#
                                     (SPADCALL
                                      (SPADCALL |ll| |i| (QREFELT $ 107))
                                      (SPADCALL
                                       (SPADCALL (QREFELT $ 12) |i|
                                                 (QREFELT $ 108))
                                       (QREFELT $ 94))
                                      (QREFELT $ 102))
                                     . #8#)
                               (COND
                                (#3#
                                 (LETT #4# (SPADCALL #4# #5# (QREFELT $ 60))
                                       . #8#))
                                ('T
                                 (PROGN
                                  (LETT #4# #5# . #8#)
                                  (LETT #3# 'T . #8#)))))))
                            (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#3# #4#) ('T (|spadConstant| $ 61))))
                      (QREFELT $ 60))
            . #8#)
      (LETT LL
            (PROGN
             (LETT #2# NIL . #8#)
             (SEQ (LETT |f| NIL . #8#) (LETT #1# L . #8#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #8#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL (SPADCALL |f| |xn| (QREFELT $ 110)) |val|
                                     (QREFELT $ 112))
                           #2#)
                          . #8#)))
                  (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #8#)
      (LETT LL (SPADCALL LL (QREFELT $ 114)) . #8#) (EXIT (CONS LL |ll|)))))) 

(DECLAIM (NOTINLINE |LinGroebnerPackage;|)) 

(DEFUN |LinGroebnerPackage| (&REST #1=#:G293)
  (PROG ()
    (RETURN
     (PROG (#2=#:G294)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|LinGroebnerPackage|)
                                           '|domainEqualList|)
                . #3=(|LinGroebnerPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |LinGroebnerPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|LinGroebnerPackage|))))))))))) 

(DEFUN |LinGroebnerPackage;| (|#1| |#2|)
  (PROG (#1=#:G134 #2=#:G292 |yx| #3=#:G291 |pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (SEQ
      (PROGN
       (LETT DV$1 (|devaluate| |#1|) . #4=(|LinGroebnerPackage|))
       (LETT DV$2 (|devaluate| |#2|) . #4#)
       (LETT |dv$| (LIST '|LinGroebnerPackage| DV$1 DV$2) . #4#)
       (LETT $ (GETREFV 117) . #4#)
       (QSETREFV $ 0 |dv$|)
       (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #4#))
       (|haddProp| |$ConstructorCache| '|LinGroebnerPackage| (LIST DV$1 DV$2)
                   (CONS 1 $))
       (|stuffDomainSlots| $)
       (QSETREFV $ 6 |#1|)
       (QSETREFV $ 7 |#2|)
       (SETF |pv$| (QREFELT $ 3))
       (QSETREFV $ 12
                 (PROGN
                  (LETT #3# NIL . #4#)
                  (SEQ (LETT |yx| NIL . #4#) (LETT #2# |#1| . #4#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |yx| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #3#
                               (CONS
                                (PROG2
                                    (LETT #1# (SPADCALL |yx| (QREFELT $ 11))
                                          . #4#)
                                    (QCDR #1#)
                                  (|check_union| (QEQCAR #1# 0)
                                                 (|OrderedVariableList|
                                                  (SPADCALL |yx|
                                                            (QREFELT $ 11)))
                                                 #1#))
                                #3#)
                               . #4#)))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #3#)))))
       $))))) 

(MAKEPROP '|LinGroebnerPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Union| $ '"failed") (|Symbol|) (|OrderedVariableList| 6)
              (0 . |variable|) '|lvar| (5 . |One|) (9 . |Zero|) (|Vector| 7)
              (|Integer|) (|Matrix| 7) (13 . |row|) (|Vector| 16) (19 . |elt|)
              (25 . |elt|) (31 . *) (37 . -) (42 . |exquo|) (48 . |setelt|)
              (55 . -) (|Record| (|:| |poly| 28) (|:| |mult| 7))
              (|HomogeneousDistributedMultivariatePolynomial| 6 7) (|List| 28)
              (|GroebnerInternalPackage| 7 78 10 28) (61 . |redPo|)
              (67 . |Zero|) (|Boolean|) (71 . =) (77 . |reductum|) (82 . -)
              (88 . *) (94 . +) |LGROBP;computeBasis;2L;7|
              (|DistributedMultivariatePolynomial| 6 7) (100 . |One|)
              (104 . |One|) (|NonNegativeInteger|) (108 . |zero|)
              (114 . |setelt|) (122 . |setelt|) (|List| 40)
              |LGROBP;choosemon;DmpLDmp;11| (129 . ~=) (135 . |exquo|)
              |LGROBP;transform;DmpHdmp;6| (141 . *) (147 . |content|)
              (152 . |gcd|) (158 . |exquo|) |LGROBP;coord;HdmpLV;9|
              (164 . |zero|) (169 . =) (175 . *) (181 . +) (187 . |Zero|)
              (191 . |primitivePart|) (196 . |reductum|) (201 . -)
              (207 . |setRow!|) |LGROBP;totolex;LL;3|
              |LGROBP;minPol;2LOvlHdmp;5| |LGROBP;minPol;LOvlHdmp;4|
              (214 . |coerce|) (219 . ^) (225 . |primitivePart|) (230 . =)
              (236 . |leadingCoefficient|)
              (|DirectProduct| (NRTEVAL (LENGTH (QREFELT $ 6))) 43)
              (241 . |degree|) (|Vector| 43) (246 . |coerce|)
              (|HomogeneousDirectProduct| (NRTEVAL (LENGTH (QREFELT $ 6))) 43)
              (251 . |directProduct|) (256 . |monomial|) (262 . |degree|)
              |LGROBP;intcompBasis;Ovl3L;8| (267 . |concat|) (273 . =)
              (279 . ~=) (285 . |leadingCoefficient|) (290 . |position|)
              (|List| 7) |LGROBP;anticoord;LDmpLDmp;10| (296 . =) '"last"
              (|List| 10) (302 . |elt|) (308 . |coerce|) (313 . *)
              (|Record| (|:| |poly| 40) (|:| |mult| 7))
              (|GroebnerInternalPackage| 7 74 10 40) (319 . |redPo|)
              (325 . |degree|) (331 . ^) (337 . |last|) (342 . *)
              (348 . |eval|) (|Record| (|:| |gblist| 47) (|:| |gvlist| 106))
              |LGROBP;linGenPos;LR;12| (|List| 16) (355 . |elt|) (361 . |elt|)
              (|SparseUnivariatePolynomial| $) (367 . |univariate|)
              (|SparseUnivariatePolynomial| 40) (373 . |elt|)
              (|GroebnerPackage| 7 74 10 40) (379 . |groebner|)
              (|Record| (|:| |glbase| 47) (|:| |glval| 106))
              |LGROBP;groebgen;LR;13|)
           '#(|transform| 384 |totolex| 389 |minPol| 394 |linGenPos| 407
              |intcompBasis| 412 |groebgen| 419 |coord| 424 |computeBasis| 430
              |choosemon| 435 |anticoord| 441)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 116
                                                 '(1 10 8 9 11 0 7 0 13 0 7 0
                                                   14 2 17 15 0 16 18 2 19 16 0
                                                   16 20 2 15 7 0 16 21 2 7 0 0
                                                   0 22 1 7 0 0 23 2 7 8 0 0 24
                                                   3 15 7 0 16 7 25 2 7 0 0 0
                                                   26 2 30 27 28 29 31 0 28 0
                                                   32 2 28 33 0 0 34 1 28 0 0
                                                   35 2 28 0 0 0 36 2 28 0 7 0
                                                   37 2 28 0 0 0 38 0 40 0 41 0
                                                   28 0 42 2 17 0 43 43 44 4 17
                                                   7 0 16 16 7 45 3 19 16 0 16
                                                   16 46 2 40 33 0 0 49 2 40 8
                                                   0 0 50 2 28 0 0 0 52 1 28 7
                                                   0 53 2 7 0 0 0 54 2 28 8 0 7
                                                   55 1 15 0 43 57 2 7 33 0 0
                                                   58 2 40 0 7 0 59 2 40 0 0 0
                                                   60 0 40 0 61 1 40 0 0 62 1
                                                   40 0 0 63 2 40 0 0 0 64 3 17
                                                   0 0 16 15 65 1 28 0 10 69 2
                                                   28 0 0 43 70 1 28 0 0 71 2
                                                   40 33 0 0 72 1 40 7 0 73 1
                                                   40 74 0 75 1 74 76 0 77 1 78
                                                   0 76 79 2 28 0 7 78 80 1 28
                                                   78 0 81 2 29 0 0 0 83 2 29
                                                   33 0 0 84 2 28 33 0 0 85 1
                                                   28 7 0 86 2 29 16 28 0 87 2
                                                   47 33 0 0 90 2 92 10 0 91 93
                                                   1 40 0 10 94 2 40 0 0 0 95 2
                                                   97 96 40 47 98 2 40 43 0 10
                                                   99 2 40 0 0 43 100 1 92 10 0
                                                   101 2 40 0 16 0 102 3 40 0 0
                                                   10 0 103 2 106 16 0 16 107 2
                                                   92 10 0 16 108 2 40 109 0 10
                                                   110 2 111 40 0 40 112 1 113
                                                   47 47 114 1 0 28 40 51 1 0
                                                   47 29 66 2 0 28 29 10 68 3 0
                                                   28 29 29 10 67 1 0 104 29
                                                   105 3 0 29 10 29 29 82 1 0
                                                   115 47 116 2 0 15 28 29 56 1
                                                   0 29 29 39 2 0 40 40 47 48 3
                                                   0 40 88 40 47 89)))))
           '|lookupComplete|)) 
