
(/VERSIONCHECK 2) 

(DEFUN |CYCLES;trm| (|pt| $)
  (SPADCALL
   (SPADCALL (SPADCALL (SPADCALL |pt| (QREFELT $ 8)) (QREFELT $ 10))
             (QREFELT $ 11))
   |pt| (QREFELT $ 13))) 

(DEFUN |CYCLES;list| (|st| $)
  (SPADCALL (SPADCALL |st| (QREFELT $ 15)) (QREFELT $ 17))) 

(DEFUN |CYCLES;complete;ISp;3| (|i| $)
  (PROG (#1=#:G141 #2=#:G140 #3=#:G142 #4=#:G144 |pt|)
    (RETURN
     (SEQ
      (COND ((EQL |i| 0) (|spadConstant| $ 19))
            ((< |i| 0) (|spadConstant| $ 18))
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|CYCLES;complete;ISp;3|))
              (SEQ (LETT |pt| NIL . #6#)
                   (LETT #4# (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21)) $)
                         . #6#)
                   G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |pt| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3# (|CYCLES;trm| (SPADCALL |pt| (QREFELT $ 23)) $)
                            . #6#)
                      (COND
                       (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 24)) . #6#))
                       ('T
                        (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# (|spadConstant| $ 18)))))))))) 

(DEFUN |CYCLES;even?| (|li| $)
  (PROG (#1=#:G149 |i| #2=#:G148)
    (RETURN
     (SEQ
      (SPADCALL
       (LENGTH
        (PROGN
         (LETT #2# NIL . #3=(|CYCLES;even?|))
         (SEQ (LETT |i| NIL . #3#) (LETT #1# |li| . #3#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL |i| (QREFELT $ 27))
                  (LETT #2# (CONS |i| #2#) . #3#)))))
              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
              (EXIT (NREVERSE #2#)))))
       (QREFELT $ 27)))))) 

(DEFUN |CYCLES;alternating;ISp;5| (|i| $)
  (PROG (#1=#:G151 #2=#:G150 #3=#:G152 #4=#:G154 |li|)
    (RETURN
     (SEQ
      (SPADCALL 2
                (PROGN
                 (LETT #1# NIL . #5=(|CYCLES;alternating;ISp;5|))
                 (SEQ (LETT |li| NIL . #5#)
                      (LETT #4# (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21)) $)
                            . #5#)
                      G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |li| (CAR #4#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((|CYCLES;even?| |li| $)
                          (PROGN
                           (LETT #3#
                                 (|CYCLES;trm| (SPADCALL |li| (QREFELT $ 23))
                                  $)
                                 . #5#)
                           (COND
                            (#1#
                             (LETT #2# (SPADCALL #2# #3# (QREFELT $ 24))
                                   . #5#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #5#)
                              (LETT #1# 'T . #5#)))))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|spadConstant| $ 18))))
                (QREFELT $ 29)))))) 

(DEFUN |CYCLES;elementary;ISp;6| (|i| $)
  (PROG (#1=#:G156 #2=#:G155 #3=#:G157 |spol| #4=#:G160 |pt|)
    (RETURN
     (SEQ
      (COND ((EQL |i| 0) (|spadConstant| $ 19))
            ((< |i| 0) (|spadConstant| $ 18))
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|CYCLES;elementary;ISp;6|))
              (SEQ (LETT |pt| NIL . #6#)
                   (LETT #4# (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21)) $)
                         . #6#)
                   G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |pt| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (SEQ
                             (LETT |spol|
                                   (|CYCLES;trm| (SPADCALL |pt| (QREFELT $ 23))
                                    $)
                                   . #6#)
                             (EXIT
                              (COND ((|CYCLES;even?| |pt| $) |spol|)
                                    ('T (SPADCALL |spol| (QREFELT $ 31))))))
                            . #6#)
                      (COND
                       (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 24)) . #6#))
                       ('T
                        (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# (|spadConstant| $ 18)))))))))) 

(DEFUN |CYCLES;divisors| (|n| $)
  (PROG (|c| #1=#:G163 #2=#:G162 #3=#:G164 #4=#:G171 |j| #5=#:G170 #6=#:G169
         |a| |b|)
    (RETURN
     (SEQ
      (LETT |b| (SPADCALL (SPADCALL |n| (QREFELT $ 34)) (QREFELT $ 37))
            . #7=(|CYCLES;divisors|))
      (LETT |c|
            (CONS 1
                  (PROGN
                   (LETT #1# NIL . #7#)
                   (SEQ (LETT |a| NIL . #7#) (LETT #6# |b| . #7#) G190
                        (COND
                         ((OR (ATOM #6#)
                              (PROGN (LETT |a| (CAR #6#) . #7#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #3#
                                 (PROGN
                                  (LETT #5# NIL . #7#)
                                  (SEQ (LETT |j| 1 . #7#)
                                       (LETT #4# (QCDR |a|) . #7#) G190
                                       (COND
                                        ((|greater_SI| |j| #4#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #5#
                                               (CONS (EXPT (QCAR |a|) |j|) #5#)
                                               . #7#)))
                                       (LETT |j| (|inc_SI| |j|) . #7#)
                                       (GO G190) G191 (EXIT (NREVERSE #5#))))
                                 . #7#)
                           (COND (#1# (LETT #2# (APPEND #2# #3#) . #7#))
                                 ('T
                                  (PROGN
                                   (LETT #2# #3# . #7#)
                                   (LETT #1# 'T . #7#)))))))
                        (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
                   (COND (#1# #2#) (#8='T NIL))))
            . #7#)
      (EXIT (COND ((EQL (LENGTH |b|) 1) |c|) (#8# (CONS |n| |c|)))))))) 

(DEFUN |CYCLES;ss| (|n| |m| $)
  (PROG (|li| |j| #1=#:G175)
    (RETURN
     (SEQ
      (LETT |li|
            (PROGN
             (LETT #1# NIL . #2=(|CYCLES;ss|))
             (SEQ (LETT |j| 1 . #2#) G190
                  (COND ((|greater_SI| |j| |m|) (GO G191)))
                  (SEQ (EXIT (LETT #1# (CONS |n| #1#) . #2#)))
                  (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                  (EXIT (NREVERSE #1#))))
            . #2#)
      (EXIT
       (SPADCALL (|spadConstant| $ 39) (SPADCALL |li| (QREFELT $ 23))
                 (QREFELT $ 13))))))) 

(DEFUN |CYCLES;powerSum;ISp;9| (|n| $) (|CYCLES;ss| |n| 1 $)) 

(DEFUN |CYCLES;cyclic;ISp;10| (|n| $)
  (PROG (#1=#:G178 #2=#:G177 #3=#:G179 #4=#:G181 |i|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 1) (SPADCALL 1 (QREFELT $ 40)))
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|CYCLES;cyclic;ISp;10|))
              (SEQ (LETT |i| NIL . #6#)
                   (LETT #4# (|CYCLES;divisors| |n| $) . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (SPADCALL
                             (SPADCALL (SPADCALL |i| (QREFELT $ 42)) |n|
                                       (QREFELT $ 43))
                             (|CYCLES;ss| |i|
                              (SPADCALL (SPADCALL |n| |i| (QREFELT $ 43))
                                        (QREFELT $ 44))
                              $)
                             (QREFELT $ 45))
                            . #6#)
                      (COND
                       (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 24)) . #6#))
                       ('T
                        (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# (|spadConstant| $ 18)))))))))) 

(DEFUN |CYCLES;dihedral;ISp;11| (|n| $)
  (PROG (|k|)
    (RETURN
     (SEQ (LETT |k| (QUOTIENT2 |n| 2) |CYCLES;dihedral;ISp;11|)
          (EXIT
           (COND
            ((ODDP |n|)
             (SPADCALL
              (SPADCALL (SPADCALL 1 2 (QREFELT $ 43))
                        (SPADCALL |n| (QREFELT $ 46)) (QREFELT $ 45))
              (SPADCALL
               (SPADCALL (SPADCALL 1 2 (QREFELT $ 43)) (|CYCLES;ss| 2 |k| $)
                         (QREFELT $ 45))
               (SPADCALL 1 (QREFELT $ 40)) (QREFELT $ 47))
              (QREFELT $ 24)))
            ('T
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL 1 2 (QREFELT $ 43))
                         (SPADCALL |n| (QREFELT $ 46)) (QREFELT $ 45))
               (SPADCALL (SPADCALL 1 4 (QREFELT $ 43)) (|CYCLES;ss| 2 |k| $)
                         (QREFELT $ 45))
               (QREFELT $ 24))
              (SPADCALL
               (SPADCALL (SPADCALL 1 4 (QREFELT $ 43))
                         (|CYCLES;ss| 2 (- |k| 1) $) (QREFELT $ 45))
               (|CYCLES;ss| 1 2 $) (QREFELT $ 47))
              (QREFELT $ 24))))))))) 

(DEFUN |CYCLES;trm2| (|li| $)
  (PROG (|prod| |prod2| |r1| |r0| #1=#:G192 |r| |c| |k| |ll1| |ll0| #2=#:G191
         |ll| |xx| |lli|)
    (RETURN
     (SEQ (LETT |lli| (SPADCALL |li| (QREFELT $ 49)) . #3=(|CYCLES;trm2|))
          (LETT |xx|
                (SPADCALL 1
                          (SPADCALL (SPADCALL |li| (QREFELT $ 23))
                                    (QREFELT $ 8))
                          (QREFELT $ 43))
                . #3#)
          (LETT |prod| (|spadConstant| $ 19) . #3#)
          (SEQ (LETT |ll| NIL . #3#) (LETT #2# |lli| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |ll| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |ll0| (|SPADfirst| |ll|) . #3#)
                    (LETT |ll1| (SPADCALL |ll| (QREFELT $ 50)) . #3#)
                    (LETT |k| (QUOTIENT2 |ll0| 2) . #3#)
                    (LETT |c|
                          (COND
                           ((ODDP |ll0|) (|CYCLES;ss| |ll0| (* |ll1| |k|) $))
                           ('T
                            (SPADCALL (|CYCLES;ss| |k| |ll1| $)
                                      (|CYCLES;ss| |ll0| (* |ll1| (- |k| 1)) $)
                                      (QREFELT $ 47))))
                          . #3#)
                    (LETT |c|
                          (SPADCALL |c|
                                    (|CYCLES;ss| |ll0|
                                     (* |ll0|
                                        (QUOTIENT2 (* |ll1| (- |ll1| 1)) 2))
                                     $)
                                    (QREFELT $ 47))
                          . #3#)
                    (LETT |prod2| (|spadConstant| $ 19) . #3#)
                    (SEQ (LETT |r| NIL . #3#) (LETT #1# |lli| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |r| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((< (|SPADfirst| |r|) |ll0|)
                             (SEQ (LETT |r0| (|SPADfirst| |r|) . #3#)
                                  (LETT |r1| (SPADCALL |r| (QREFELT $ 50))
                                        . #3#)
                                  (EXIT
                                   (LETT |prod2|
                                         (SPADCALL
                                          (|CYCLES;ss|
                                           (SPADCALL |r0| |ll0| (QREFELT $ 51))
                                           (* (* (GCD |r0| |ll0|) |r1|) |ll1|)
                                           $)
                                          |prod2| (QREFELT $ 47))
                                         . #3#)))))))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |prod|
                           (SPADCALL (SPADCALL |c| |prod2| (QREFELT $ 47))
                                     |prod| (QREFELT $ 47))
                           . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |xx| |prod| (QREFELT $ 45))))))) 

(DEFUN |CYCLES;graphs;ISp;13| (|n| $)
  (PROG (#1=#:G194 #2=#:G193 #3=#:G195 #4=#:G197 |li|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|CYCLES;graphs;ISp;13|))
       (SEQ (LETT |li| NIL . #5#)
            (LETT #4# (|CYCLES;list| (SPADCALL |n| (QREFELT $ 21)) $) . #5#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |li| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# (|CYCLES;trm2| |li| $) . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 24)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 18)))))))) 

(DEFUN |CYCLES;cupp| (|pt| |spol| $)
  (PROG (|dg|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |spol| (QREFELT $ 53)) (|spadConstant| $ 18))
            (#1='T
             (SEQ (LETT |dg| (SPADCALL |spol| (QREFELT $ 54)) |CYCLES;cupp|)
                  (EXIT
                   (COND
                    ((SPADCALL |dg| |pt| (QREFELT $ 55)) (|spadConstant| $ 18))
                    ((SPADCALL |dg| |pt| (QREFELT $ 56))
                     (SPADCALL (SPADCALL |pt| (QREFELT $ 8))
                               (SPADCALL (SPADCALL |spol| (QREFELT $ 57)) |dg|
                                         (QREFELT $ 13))
                               (QREFELT $ 58)))
                    (#1#
                     (|CYCLES;cupp| |pt| (SPADCALL |spol| (QREFELT $ 59))
                      $))))))))))) 

(DEFUN |CYCLES;cup;3Sp;15| (|spol1| |spol2| $)
  (PROG (|p|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |spol1| (QREFELT $ 53)) (|spadConstant| $ 18))
            ('T
             (SEQ
              (LETT |p|
                    (SPADCALL (SPADCALL |spol1| (QREFELT $ 57))
                              (|CYCLES;cupp| (SPADCALL |spol1| (QREFELT $ 54))
                               |spol2| $)
                              (QREFELT $ 45))
                    |CYCLES;cup;3Sp;15|)
              (EXIT
               (SPADCALL |p|
                         (SPADCALL (SPADCALL |spol1| (QREFELT $ 59)) |spol2|
                                   (QREFELT $ 60))
                         (QREFELT $ 24)))))))))) 

(DEFUN |CYCLES;eval;SpF;16| (|spol| $)
  (COND ((SPADCALL |spol| (QREFELT $ 53)) (|spadConstant| $ 61))
        ('T
         (SPADCALL (SPADCALL |spol| (QREFELT $ 57))
                   (SPADCALL (SPADCALL |spol| (QREFELT $ 59)) (QREFELT $ 62))
                   (QREFELT $ 63))))) 

(DEFUN |CYCLES;cap;2SpF;17| (|spol1| |spol2| $)
  (SPADCALL (SPADCALL |spol1| |spol2| (QREFELT $ 60)) (QREFELT $ 62))) 

(DEFUN |CYCLES;mtpol| (|n| |spol| $)
  (PROG (|deg| #1=#:G213 |k| #2=#:G212)
    (RETURN
     (SEQ
      (COND ((SPADCALL |spol| (QREFELT $ 53)) (|spadConstant| $ 18))
            ('T
             (SEQ
              (LETT |deg|
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL . #3=(|CYCLES;mtpol|))
                      (SEQ (LETT |k| NIL . #3#)
                           (LETT #1#
                                 (SPADCALL (SPADCALL |spol| (QREFELT $ 54))
                                           (QREFELT $ 65))
                                 . #3#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ (EXIT (LETT #2# (CONS (* |n| |k|) #2#) . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 23))
                    . #3#)
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |spol| (QREFELT $ 57)) |deg|
                          (QREFELT $ 13))
                (|CYCLES;mtpol| |n| (SPADCALL |spol| (QREFELT $ 59)) $)
                (QREFELT $ 24)))))))))) 

(DEFUN |CYCLES;evspol| (|fn2| |spol| $)
  (PROG (|prod| #1=#:G215 #2=#:G214 #3=#:G216 #4=#:G221 |i| |lc|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |spol| (QREFELT $ 53)) (|spadConstant| $ 18))
            (#5='T
             (SEQ
              (LETT |lc| (SPADCALL |spol| (QREFELT $ 57))
                    . #6=(|CYCLES;evspol|))
              (LETT |prod|
                    (PROGN
                     (LETT #1# NIL . #6#)
                     (SEQ (LETT |i| NIL . #6#)
                          (LETT #4#
                                (SPADCALL (SPADCALL |spol| (QREFELT $ 54))
                                          (QREFELT $ 65))
                                . #6#)
                          G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |i| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3# (SPADCALL |i| |fn2|) . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 47))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) (#5# (|spadConstant| $ 19))))
                    . #6#)
              (EXIT
               (SPADCALL (SPADCALL |lc| |prod| (QREFELT $ 45))
                         (|CYCLES;evspol| |fn2|
                          (SPADCALL |spol| (QREFELT $ 59)) $)
                         (QREFELT $ 24)))))))))) 

(DEFUN |CYCLES;wreath;3Sp;20| (|spol1| |spol2| $)
  (PROG ()
    (RETURN
     (|CYCLES;evspol| (CONS #'|CYCLES;wreath;3Sp;20!0| (VECTOR $ |spol2|))
      |spol1| $)))) 

(DEFUN |CYCLES;wreath;3Sp;20!0| (|x| $$)
  (PROG (|spol2| $)
    (LETT |spol2| (QREFELT $$ 1) . #1=(|CYCLES;wreath;3Sp;20|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|CYCLES;mtpol| |x| |spol2| $))))) 

(DEFUN |CYCLES;hh| (|n| $)
  (COND ((EQL |n| 0) (|spadConstant| $ 19)) ((< |n| 0) (|spadConstant| $ 18))
        ('T (SPADCALL |n| (QREFELT $ 25))))) 

(DEFUN |CYCLES;SFunction;LSp;22| (|li| $)
  (PROG (|a| #1=#:G232 |k| #2=#:G233 |j| #3=#:G231 #4=#:G230 |i| #5=#:G229)
    (RETURN
     (SEQ
      (LETT |a|
            (SPADCALL
             (PROGN
              (LETT #5# NIL . #6=(|CYCLES;SFunction;LSp;22|))
              (SEQ (LETT |i| 1 . #6#) (LETT #4# (LENGTH |li|) . #6#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #5#
                           (CONS
                            (PROGN
                             (LETT #3# NIL . #6#)
                             (SEQ (LETT |j| 1 . #6#)
                                  (LETT #2# (LENGTH |li|) . #6#)
                                  (LETT |k| NIL . #6#) (LETT #1# |li| . #6#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |k| (CAR #1#) . #6#) NIL)
                                        (|greater_SI| |j| #2#))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (|CYCLES;hh| (+ (- |k| |j|) |i|) $)
                                           #3#)
                                          . #6#)))
                                  (LETT #1#
                                        (PROG1 (CDR #1#)
                                          (LETT |j| (|inc_SI| |j|) . #6#))
                                        . #6#)
                                  (GO G190) G191 (EXIT (NREVERSE #3#))))
                            #5#)
                           . #6#)))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                   (EXIT (NREVERSE #5#))))
             (QREFELT $ 69))
            . #6#)
      (EXIT (SPADCALL |a| (QREFELT $ 70))))))) 

(DEFUN |CYCLES;roundup| (|li1| |li2| $)
  (COND
   ((SPADCALL (LENGTH |li1|) (LENGTH |li2|) (QREFELT $ 72))
    (|CYCLES;roundup| |li1| (SPADCALL |li2| 0 (QREFELT $ 73)) $))
   ('T |li2|))) 

(DEFUN |CYCLES;skewSFunction;2LSp;24| (|li1| |li2| $)
  (PROG (|a| #1=#:G244 |k| #2=#:G245 |j| #3=#:G243 #4=#:G242 |i| #5=#:G241)
    (RETURN
     (SEQ
      (COND
       ((< (LENGTH |li1|) (LENGTH |li2|))
        (|error| "skewSFunction: partition1 does not include partition2"))
       ('T
        (SEQ
         (LETT |li2| (|CYCLES;roundup| |li1| |li2| $)
               . #6=(|CYCLES;skewSFunction;2LSp;24|))
         (LETT |a|
               (SPADCALL
                (PROGN
                 (LETT #5# NIL . #6#)
                 (SEQ (LETT |i| 1 . #6#) (LETT #4# (LENGTH |li1|) . #6#) G190
                      (COND ((|greater_SI| |i| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS
                               (PROGN
                                (LETT #3# NIL . #6#)
                                (SEQ (LETT |j| 1 . #6#)
                                     (LETT #2# (LENGTH |li1|) . #6#)
                                     (LETT |k| NIL . #6#)
                                     (LETT #1# |li1| . #6#) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |k| (CAR #1#) . #6#)
                                            NIL)
                                           (|greater_SI| |j| #2#))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #3#
                                             (CONS
                                              (|CYCLES;hh|
                                               (+
                                                (-
                                                 (- |k|
                                                    (SPADCALL |li2| |i|
                                                              (QREFELT $ 74)))
                                                 |j|)
                                                |i|)
                                               $)
                                              #3#)
                                             . #6#)))
                                     (LETT #1#
                                           (PROG1 (CDR #1#)
                                             (LETT |j| (|inc_SI| |j|) . #6#))
                                           . #6#)
                                     (GO G190) G191 (EXIT (NREVERSE #3#))))
                               #5#)
                              . #6#)))
                      (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                (QREFELT $ 69))
               . #6#)
         (EXIT (SPADCALL |a| (QREFELT $ 70)))))))))) 

(DEFUN |CycleIndicators| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G247)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|CycleIndicators|)
                . #2=(|CycleIndicators|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|CycleIndicators|
                         (LIST (CONS NIL (CONS 1 (|CycleIndicators;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|CycleIndicators|))))))))))) 

(DEFUN |CycleIndicators;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|CycleIndicators|) . #1=(|CycleIndicators|))
      (LETT $ (GETREFV 76) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|CycleIndicators| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| (|SymmetricPolynomial| (|Fraction| (|Integer|)))
                       '(|CommutativeRing|))
        (PROGN
         (QSETREFV $ 71
                   (CONS (|dispatchFunction| |CYCLES;SFunction;LSp;22|) $))
         NIL
         (QSETREFV $ 75
                   (CONS (|dispatchFunction| |CYCLES;skewSFunction;2LSp;24|)
                         $)))))
      $)))) 

(MAKEPROP '|CycleIndicators| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Partition|) (0 . |pdct|)
              (|Fraction| 6) (5 . |coerce|) (10 . |inv|)
              (|SymmetricPolynomial| 9) (15 . |monomial|) (|Stream| 22)
              (21 . |complete|) (|List| 22) (26 . |entries|) (31 . |Zero|)
              (35 . |One|) (|PartitionsAndPermutations|) (39 . |partitions|)
              (|List| 6) (44 . |partition|) (49 . +) |CYCLES;complete;ISp;3|
              (|Boolean|) (55 . |even?|) (|PositiveInteger|) (60 . *)
              |CYCLES;alternating;ISp;5| (66 . -) |CYCLES;elementary;ISp;6|
              (|Factored| 6) (71 . |coerce|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 6)) (|List| 35)
              (76 . |factors|) (81 . |One|) (85 . |One|)
              |CYCLES;powerSum;ISp;9| (|IntegerNumberTheoryFunctions|)
              (89 . |eulerPhi|) (94 . /) (100 . |numer|) (105 . *)
              |CYCLES;cyclic;ISp;10| (111 . *) |CYCLES;dihedral;ISp;11|
              (117 . |powers|) (122 . |second|) (127 . |lcm|)
              |CYCLES;graphs;ISp;13| (133 . |zero?|) (138 . |degree|) (143 . <)
              (149 . =) (155 . |leadingCoefficient|) (160 . *)
              (166 . |reductum|) |CYCLES;cup;3Sp;15| (171 . |Zero|)
              |CYCLES;eval;SpF;16| (175 . +) |CYCLES;cap;2SpF;17|
              (181 . |coerce|) |CYCLES;wreath;3Sp;20| (|List| (|List| 12))
              (|Matrix| 12) (186 . |matrix|) (191 . |determinant|)
              (196 . |SFunction|) (201 . >) (207 . |concat|) (213 . |elt|)
              (219 . |skewSFunction|))
           '#(|wreath| 225 |skewSFunction| 231 |powerSum| 237 |graphs| 242
              |eval| 247 |elementary| 252 |dihedral| 257 |cyclic| 262 |cup| 267
              |complete| 273 |cap| 278 |alternating| 284 |SFunction| 289)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 75
                                                 '(1 7 6 0 8 1 9 0 6 10 1 9 0 0
                                                   11 2 12 0 9 7 13 1 14 0 0 15
                                                   1 14 16 0 17 0 12 0 18 0 12
                                                   0 19 1 20 14 6 21 1 7 0 22
                                                   23 2 12 0 0 0 24 1 6 26 0 27
                                                   2 12 0 28 0 29 1 12 0 0 31 1
                                                   33 0 6 34 1 33 36 0 37 0 33
                                                   0 38 0 9 0 39 1 41 6 6 42 2
                                                   9 0 6 6 43 1 9 6 0 44 2 12 0
                                                   9 0 45 2 12 0 0 0 47 1 7 16
                                                   22 49 1 22 6 0 50 2 6 0 0 0
                                                   51 1 12 26 0 53 1 12 7 0 54
                                                   2 7 26 0 0 55 2 7 26 0 0 56
                                                   1 12 9 0 57 2 12 0 6 0 58 1
                                                   12 0 0 59 0 9 0 61 2 9 0 0 0
                                                   63 1 7 22 0 65 1 68 0 67 69
                                                   1 68 12 0 70 1 0 12 22 71 2
                                                   6 26 0 0 72 2 22 0 0 6 73 2
                                                   22 6 0 6 74 2 0 12 22 22 75
                                                   2 0 12 12 12 66 2 0 12 22 22
                                                   75 1 0 12 6 40 1 0 12 6 52 1
                                                   0 9 12 62 1 0 12 6 32 1 0 12
                                                   6 48 1 0 12 6 46 2 0 12 12
                                                   12 60 1 0 12 6 25 2 0 9 12
                                                   12 64 1 0 12 6 30 1 0 12 22
                                                   71)))))
           '|lookupComplete|)) 

(MAKEPROP '|CycleIndicators| 'NILADIC T) 
