
(DEFUN |CARTEN;sample;$;1| ($) (SPADCALL (QREFELT $ 16))) 

(DEFUN |CARTEN;int2index| (|n| |indv| $)
  (PROG (|qr| |i| |rnk|)
    (RETURN
     (SEQ
      (COND ((< |n| 0) (|error| "Index error (too small)"))
            (#1='T
             (SEQ (LETT |rnk| (QVSIZE |indv|) . #2=(|CARTEN;int2index|))
                  (SEQ (LETT |i| 1 . #2#) G190
                       (COND ((|greater_SI| |i| |rnk|) (GO G191)))
                       (SEQ (LETT |qr| (DIVIDE2 |n| (QREFELT $ 7)) . #2#)
                            (LETT |n| (QCAR |qr|) . #2#)
                            (EXIT
                             (SPADCALL |indv| (+ (- |rnk| |i|) 1)
                                       (+ (QCDR |qr|) (QREFELT $ 6))
                                       (QREFELT $ 20))))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT
                   (COND
                    ((SPADCALL |n| 0 (QREFELT $ 22))
                     (|error| "Index error (too big)"))
                    (#1# |indv|)))))))))) 

(DEFUN |CARTEN;index2int| (|indv| $)
  (PROG (|n| |ix| #1=#:G140 |i|)
    (RETURN
     (SEQ (LETT |n| 0 . #2=(|CARTEN;index2int|))
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVSIZE |indv|) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |ix|
                      (- (SPADCALL |indv| |i| (QREFELT $ 23)) (QREFELT $ 6))
                      . #2#)
                (COND
                 ((OR (< |ix| 0)
                      (SPADCALL |ix| (- (QREFELT $ 7) 1) (QREFELT $ 24)))
                  (EXIT (|error| "Index error (out of range)"))))
                (EXIT
                 (LETT |n| (+ (SPADCALL (QREFELT $ 7) |n| (QREFELT $ 25)) |ix|)
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |n|))))) 

(DEFUN |CARTEN;lengthRankOrElse| (|v| $)
  (PROG (|rx| |qr|)
    (RETURN
     (SEQ
      (COND ((EQL |v| 1) 0) ((EQL |v| (QREFELT $ 7)) 1)
            ((EQL |v| (QREFELT $ 13)) 2) ((EQL |v| (QREFELT $ 14)) 3)
            ((EQL |v| (QREFELT $ 15)) 4)
            ('T
             (SEQ (LETT |rx| 0 . #1=(|CARTEN;lengthRankOrElse|))
                  (SEQ G190
                       (COND
                        ((NULL (SPADCALL |v| 0 (QREFELT $ 22))) (GO G191)))
                       (SEQ (LETT |qr| (DIVIDE2 |v| (QREFELT $ 7)) . #1#)
                            (LETT |v| (QCAR |qr|) . #1#)
                            (EXIT
                             (COND
                              ((SPADCALL |v| 0 (QREFELT $ 22))
                               (COND
                                ((SPADCALL (QCDR |qr|) 0 (QREFELT $ 22))
                                 (|error| "Rank is not a whole number"))
                                ('T (LETT |rx| (+ |rx| 1) . #1#)))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |rx|)))))))) 

(DEFUN |CARTEN;mkPerm| (|n| |l| $)
  (PROG (#1=#:G150 |e| |i| #2=#:G154 |seen| |p|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LENGTH |l|) |n| (QREFELT $ 26))
        (|error| "The list is not a permutation."))
       ('T
        (SEQ (LETT |p| (MAKEARR1 |n| 0) . #3=(|CARTEN;mkPerm|))
             (LETT |seen| (MAKEARR1 |n| 'NIL) . #3#)
             (SEQ (LETT |e| NIL . #3#) (LETT #2# |l| . #3#) (LETT |i| 1 . #3#)
                  G190
                  (COND
                   ((OR (|greater_SI| |i| |n|) (ATOM #2#)
                        (PROGN (LETT |e| (CAR #2#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((OR (< |e| 1) (SPADCALL |e| |n| (QREFELT $ 24)))
                      (|error| "The list is not a permutation."))
                     ('T
                      (SEQ (SPADCALL |p| |i| |e| (QREFELT $ 20))
                           (EXIT (SPADCALL |seen| |e| 'T (QREFELT $ 28))))))))
                  (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                        . #3#)
                  (GO G190) G191 (EXIT NIL))
             (SEQ
              (EXIT
               (SEQ (LETT |e| 1 . #3#) G190
                    (COND ((|greater_SI| |e| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((NULL (SPADCALL |seen| |e| (QREFELT $ 29)))
                        (PROGN
                         (LETT #1# (|error| "The list is not a permutation.")
                               . #3#)
                         (GO #1#))))))
                    (LETT |e| (|inc_SI| |e|) . #3#) (GO G190) G191 (EXIT NIL)))
              #1# (EXIT #1#))
             (EXIT |p|)))))))) 

(DEFUN |CARTEN;permute!| (|t| |s| |p| $)
  (PROG (#1=#:G158 |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 1 . #2=(|CARTEN;permute!|)) (LETT #1# (QVSIZE |p|) . #2#)
           G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |t| |i|
                       (SPADCALL |s| (SPADCALL |p| |i| (QREFELT $ 23))
                                 (QREFELT $ 23))
                       (QREFELT $ 20))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |t|))))) 

(DEFUN |CARTEN;permsign!| (|v| $)
  (PROG (#1=#:G172 #2=#:G176 |i| |totTrans| |e| |nTrans| #3=#:G174 #4=#:G175
         |j| |n| #5=#:G173 |psum| #6=#:G160 |maxix|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |maxix| (- (+ (QREFELT $ 6) (QVSIZE |v|)) 1)
              . #7=(|CARTEN;permsign!|))
        (LETT |psum|
              (PROG2
                  (LETT #6#
                        (SPADCALL
                         (- (* (+ |maxix| 1) |maxix|)
                            (* (QREFELT $ 6) (- (QREFELT $ 6) 1)))
                         2 (QREFELT $ 31))
                        . #7#)
                  (QCDR #6#)
                (|check_union| (QEQCAR #6# 0) (|Integer|) #6#))
              . #7#)
        (LETT |n| 0 . #7#)
        (SEQ (LETT |i| 1 . #7#) (LETT #5# (QVSIZE |v|) . #7#) G190
             (COND ((|greater_SI| |i| #5#) (GO G191)))
             (SEQ
              (EXIT
               (LETT |n| (+ |n| (SPADCALL |v| |i| (QREFELT $ 23))) . #7#)))
             (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (COND ((SPADCALL |n| |psum| (QREFELT $ 22)) 0)
               (#8='T
                (SEQ (LETT |totTrans| 0 . #7#) (LETT |nTrans| 1 . #7#)
                     (SEQ G190
                          (COND
                           ((NULL (SPADCALL |nTrans| 0 (QREFELT $ 22)))
                            (GO G191)))
                          (SEQ (LETT |nTrans| 0 . #7#)
                               (SEQ (LETT |j| 2 . #7#)
                                    (LETT #4# (QVSIZE |v|) . #7#)
                                    (LETT |i| 1 . #7#)
                                    (LETT #3# (- (QVSIZE |v|) 1) . #7#) G190
                                    (COND
                                     ((OR (|greater_SI| |i| #3#)
                                          (|greater_SI| |j| #4#))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |v| |i| (QREFELT $ 23))
                                         (SPADCALL |v| |j| (QREFELT $ 23))
                                         (QREFELT $ 24))
                                        (SEQ
                                         (LETT |nTrans| (+ |nTrans| 1) . #7#)
                                         (LETT |e|
                                               (SPADCALL |v| |i|
                                                         (QREFELT $ 23))
                                               . #7#)
                                         (SPADCALL |v| |i|
                                                   (SPADCALL |v| |j|
                                                             (QREFELT $ 23))
                                                   (QREFELT $ 20))
                                         (EXIT
                                          (SPADCALL |v| |j| |e|
                                                    (QREFELT $ 20))))))))
                                    (LETT |i|
                                          (PROG1 (|inc_SI| |i|)
                                            (LETT |j| (|inc_SI| |j|) . #7#))
                                          . #7#)
                                    (GO G190) G191 (EXIT NIL))
                               (EXIT
                                (LETT |totTrans| (+ |totTrans| |nTrans|)
                                      . #7#)))
                          NIL (GO G190) G191 (EXIT NIL))
                     (SEQ (LETT |i| 1 . #7#) (LETT #2# (QREFELT $ 7) . #7#)
                          G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |v| |i| (QREFELT $ 23))
                                        (- (+ (QREFELT $ 6) |i|) 1)
                                        (QREFELT $ 22))
                              (PROGN (LETT #1# 0 . #7#) (GO #1#))))))
                          (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT (COND ((ODDP |totTrans|) -1) (#8# 1)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |CARTEN;ravel;$L;8| (|x| $)
  (PROG (#1=#:G180 |i| #2=#:G179)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|CARTEN;ravel;$L;8|))
       (SEQ (LETT |i| 0 . #3#)
            (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #3#) G190
            (COND ((|greater_SI| |i| #1#) (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |x| |i| (QREFELT $ 33)) #2#) . #3#)))
            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |CARTEN;unravel;L$;9| (|l| $)
  (PROG (#1=#:G184 |i| #2=#:G185 |r| |z| |nz|)
    (RETURN
     (SEQ (LETT |nz| (LENGTH |l|) . #3=(|CARTEN;unravel;L$;9|))
          (|CARTEN;lengthRankOrElse| |nz| $)
          (LETT |z| (SPADCALL |nz| (|spadConstant| $ 36) (QREFELT $ 37)) . #3#)
          (SEQ (LETT |r| NIL . #3#) (LETT #2# |l| . #3#) (LETT |i| 0 . #3#)
               (LETT #1# (- |nz| 1) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |r| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |z| |i| |r| (QREFELT $ 38))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |z|))))) 

(DEFUN |CARTEN;kroneckerDelta;$;10| ($)
  (PROG (#1=#:G189 |i| #2=#:G190 |zi| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL (QREFELT $ 13) (|spadConstant| $ 36) (QREFELT $ 37))
            . #3=(|CARTEN;kroneckerDelta;$;10|))
      (SEQ (LETT |zi| 0 . #3#) (LETT #2# (+ (QREFELT $ 7) 1) . #3#)
           (LETT |i| 1 . #3#) (LETT #1# (QREFELT $ 7) . #3#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (EXIT (SPADCALL |z| |zi| (|spadConstant| $ 40) (QREFELT $ 38))))
           (LETT |i|
                 (PROG1 (|inc_SI| |i|) (LETT |zi| (|add_SI| |zi| #2#) . #3#))
                 . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |CARTEN;leviCivitaSymbol;$;11| ($)
  (PROG (#1=#:G194 |i| |indv| |z| |nz|)
    (RETURN
     (SEQ
      (LETT |nz| (EXPT (QREFELT $ 7) (QREFELT $ 7))
            . #2=(|CARTEN;leviCivitaSymbol;$;11|))
      (LETT |z| (SPADCALL |nz| (|spadConstant| $ 36) (QREFELT $ 37)) . #2#)
      (LETT |indv| (MAKEARR1 (QREFELT $ 7) 0) . #2#)
      (SEQ (LETT |i| 0 . #2#) (LETT #1# (- |nz| 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |z| |i|
                       (SPADCALL
                        (|CARTEN;permsign!| (|CARTEN;int2index| |i| |indv| $)
                         $)
                        (QREFELT $ 41))
                       (QREFELT $ 38))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |CARTEN;degree;$Nni;12| (|x| $) (SPADCALL |x| (QREFELT $ 43))) 

(DEFUN |CARTEN;rank;$Nni;13| (|x| $)
  (PROG (|n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL |x| (QREFELT $ 32)) |CARTEN;rank;$Nni;13|)
          (EXIT (|CARTEN;lengthRankOrElse| |n| $)))))) 

(DEFUN |CARTEN;elt;$R;14| (|x| $)
  (COND
   ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) 1 (QREFELT $ 26))
    (|error| "Index error (the rank is not 0)"))
   ('T (SPADCALL |x| 0 (QREFELT $ 33))))) 

(DEFUN |CARTEN;elt;$IR;15| (|x| |i| $)
  (COND
   ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 7) (QREFELT $ 26))
    (|error| "Index error (the rank is not 1)"))
   ('T (SPADCALL |x| (- |i| (QREFELT $ 6)) (QREFELT $ 33))))) 

(DEFUN |CARTEN;elt;$2IR;16| (|x| |i| |j| $)
  (COND
   ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 13) (QREFELT $ 26))
    (|error| "Index error (the rank is not 2)"))
   ('T
    (SPADCALL |x|
              (+ (SPADCALL (QREFELT $ 7) (- |i| (QREFELT $ 6)) (QREFELT $ 25))
                 (- |j| (QREFELT $ 6)))
              (QREFELT $ 33))))) 

(DEFUN |CARTEN;elt;$3IR;17| (|x| |i| |j| |k| $)
  (COND
   ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 14) (QREFELT $ 26))
    (|error| "Index error (the rank is not 3)"))
   ('T
    (SPADCALL |x|
              (+
               (+
                (SPADCALL (QREFELT $ 13) (- |i| (QREFELT $ 6)) (QREFELT $ 25))
                (SPADCALL (QREFELT $ 7) (- |j| (QREFELT $ 6)) (QREFELT $ 25)))
               (- |k| (QREFELT $ 6)))
              (QREFELT $ 33))))) 

(DEFUN |CARTEN;elt;$4IR;18| (|x| |i| |j| |k| |l| $)
  (COND
   ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 15) (QREFELT $ 26))
    (|error| "Index error (the rank is not 4)"))
   ('T
    (SPADCALL |x|
              (+
               (+
                (+
                 (SPADCALL (QREFELT $ 14) (- |i| (QREFELT $ 6)) (QREFELT $ 25))
                 (SPADCALL (QREFELT $ 13) (- |j| (QREFELT $ 6))
                           (QREFELT $ 25)))
                (SPADCALL (QREFELT $ 7) (- |k| (QREFELT $ 6)) (QREFELT $ 25)))
               (- |l| (QREFELT $ 6)))
              (QREFELT $ 33))))) 

(DEFUN |CARTEN;elt;$LR;19| (|x| |i| $)
  (PROG (|n| |ix| #1=#:G214 |ii|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LENGTH |i|) (SPADCALL |x| (QREFELT $ 43)) (QREFELT $ 26))
        (|error| "Index error (wrong rank)"))
       ('T
        (SEQ (LETT |n| 0 . #2=(|CARTEN;elt;$LR;19|))
             (SEQ (LETT |ii| NIL . #2#) (LETT #1# |i| . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ii| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ (LETT |ix| (- |ii| (QREFELT $ 6)) . #2#)
                       (COND
                        ((OR (< |ix| 0)
                             (SPADCALL |ix| (- (QREFELT $ 7) 1)
                                       (QREFELT $ 24)))
                         (EXIT (|error| "Index error (out of range)"))))
                       (EXIT
                        (LETT |n|
                              (+ (SPADCALL (QREFELT $ 7) |n| (QREFELT $ 25))
                                 |ix|)
                              . #2#)))
                  (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |x| |n| (QREFELT $ 33)))))))))) 

(DEFUN |CARTEN;coerce;L$;20| (|lr| $)
  (PROG (#1=#:G219 |r| #2=#:G220 |i| |z|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LENGTH |lr|) (QREFELT $ 7) (QREFELT $ 26))
        (|error| "Incorrect number of components"))
       ('T
        (SEQ
         (LETT |z|
               (SPADCALL (QREFELT $ 7) (|spadConstant| $ 36) (QREFELT $ 37))
               . #3=(|CARTEN;coerce;L$;20|))
         (SEQ (LETT |i| 0 . #3#) (LETT #2# (- (QREFELT $ 7) 1) . #3#)
              (LETT |r| NIL . #3#) (LETT #1# |lr| . #3#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #3#) NIL)
                    (|greater_SI| |i| #2#))
                (GO G191)))
              (SEQ (EXIT (SPADCALL |z| |i| |r| (QREFELT $ 38))))
              (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #3#))
                    . #3#)
              (GO G190) G191 (EXIT NIL))
         (EXIT |z|)))))))) 

(DEFUN |CARTEN;coerce;L$;21| (|lx| $)
  (PROG (#1=#:G230 |i| #2=#:G229 |x| |offz| |z| |nx| #3=#:G222 #4=#:G228 |rx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |lx| (QREFELT $ 54)) (QREFELT $ 7) (QREFELT $ 26))
        (|error| "Incorrect number of slices"))
       ('T
        (SEQ
         (LETT |rx| (SPADCALL (SPADCALL |lx| (QREFELT $ 55)) (QREFELT $ 43))
               . #5=(|CARTEN;coerce;L$;21|))
         (SEQ
          (EXIT
           (SEQ (LETT |x| NIL . #5#) (LETT #4# |lx| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 43)) |rx|
                              (QREFELT $ 26))
                    (PROGN
                     (LETT #3# (|error| "Inhomogeneous slice ranks") . #5#)
                     (GO #3#))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
          #3# (EXIT #3#))
         (LETT |nx| (SPADCALL (SPADCALL |lx| (QREFELT $ 55)) (QREFELT $ 32))
               . #5#)
         (LETT |z|
               (SPADCALL (* (QREFELT $ 7) |nx|) (|spadConstant| $ 36)
                         (QREFELT $ 37))
               . #5#)
         (SEQ (LETT |offz| 0 . #5#) (LETT |x| NIL . #5#) (LETT #2# |lx| . #5#)
              G190
              (COND
               ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #5#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |i| 0 . #5#) (LETT #1# (- |nx| 1) . #5#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| (+ |offz| |i|)
                                 (SPADCALL |x| |i| (QREFELT $ 33))
                                 (QREFELT $ 38))))
                     (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                     (EXIT NIL))))
              (LETT #2#
                    (PROG1 (CDR #2#)
                      (LETT |offz| (|add_SI| |offz| |nx|) . #5#))
                    . #5#)
              (GO G190) G191 (EXIT NIL))
         (EXIT |z|)))))))) 

(DEFUN |CARTEN;retractIfCan;$U;22| (|x| $)
  (COND
   ((ZEROP (SPADCALL |x| (QREFELT $ 43)))
    (CONS 0 (SPADCALL |x| (QREFELT $ 45))))
   ('T (CONS 1 "failed")))) 

(DEFUN |CARTEN;mkOutf| (|x| |i0| |rnk| $)
  (PROG (#1=#:G251 |j| #2=#:G250 #3=#:G249 |i| #4=#:G248 |nskip| |rnk1|
         #5=#:G247 #6=#:G246)
    (RETURN
     (SEQ
      (COND
       ((ODDP |rnk|)
        (SEQ (LETT |rnk1| (- |rnk| 1) . #7=(|CARTEN;mkOutf|))
             (LETT |nskip| (EXPT (QREFELT $ 7) |rnk1|) . #7#)
             (EXIT
              (SPADCALL
               (PROGN
                (LETT #6# NIL . #7#)
                (SEQ (LETT |i| 0 . #7#) (LETT #5# (- (QREFELT $ 7) 1) . #7#)
                     G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #6#
                             (CONS
                              (|CARTEN;mkOutf| |x| (+ |i0| (* |nskip| |i|))
                               |rnk1| $)
                              #6#)
                             . #7#)))
                     (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                     (EXIT (NREVERSE #6#))))
               (QREFELT $ 62)))))
       ((EQL |rnk| 0)
        (SPADCALL (SPADCALL |x| |i0| (QREFELT $ 33)) (QREFELT $ 63)))
       ('T
        (SEQ (LETT |rnk1| (- |rnk| 2) . #7#)
             (LETT |nskip| (EXPT (QREFELT $ 7) |rnk1|) . #7#)
             (EXIT
              (SPADCALL
               (PROGN
                (LETT #4# NIL . #7#)
                (SEQ (LETT |i| 0 . #7#) (LETT #3# (- (QREFELT $ 7) 1) . #7#)
                     G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #4#
                             (CONS
                              (PROGN
                               (LETT #2# NIL . #7#)
                               (SEQ (LETT |j| 0 . #7#)
                                    (LETT #1# (- (QREFELT $ 7) 1) . #7#) G190
                                    (COND ((|greater_SI| |j| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (|CARTEN;mkOutf| |x|
                                              (+ |i0|
                                                 (* |nskip|
                                                    (+ (* (QREFELT $ 7) |i|)
                                                       |j|)))
                                              |rnk1| $)
                                             #2#)
                                            . #7#)))
                                    (LETT |j| (|inc_SI| |j|) . #7#) (GO G190)
                                    G191 (EXIT (NREVERSE #2#))))
                              #4#)
                             . #7#)))
                     (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                     (EXIT (NREVERSE #4#))))
               (QREFELT $ 65)))))))))) 

(DEFUN |CARTEN;coerce;$Of;24| (|x| $)
  (|CARTEN;mkOutf| |x| 0 (SPADCALL |x| (QREFELT $ 43)) $)) 

(DEFUN |CARTEN;Zero;$;25| ($) (SPADCALL (|spadConstant| $ 36) (QREFELT $ 67))) 

(DEFUN |CARTEN;One;$;26| ($) (SPADCALL (|spadConstant| $ 40) (QREFELT $ 67))) 

(DEFUN |CARTEN;coerce;R$;27| (|r| $) (SPADCALL 1 |r| (QREFELT $ 37))) 

(DEFUN |CARTEN;coerce;Dp$;28| (|v| $)
  (PROG (#1=#:G259 |i| #2=#:G260 |j| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL (QREFELT $ 7) (|spadConstant| $ 36) (QREFELT $ 37))
            . #3=(|CARTEN;coerce;Dp$;28|))
      (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 71)) . #3#)
           (LETT #2# (SPADCALL |v| (QREFELT $ 72)) . #3#) (LETT |i| 0 . #3#)
           (LETT #1# (- (QREFELT $ 7) 1) . #3#) G190
           (COND ((OR (|greater_SI| |i| #1#) (> |j| #2#)) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |z| |i| (SPADCALL |v| |j| (QREFELT $ 73))
                       (QREFELT $ 38))))
           (LETT |i| (PROG1 (|inc_SI| |i|) (LETT |j| (+ |j| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |CARTEN;coerce;Sm$;29| (|m| $)
  (PROG (|offz| #1=#:G267 |j| #2=#:G266 |i| |z|)
    (RETURN
     (SEQ
      (LETT |z|
            (SPADCALL (SPADCALL (QREFELT $ 7) 2 (QREFELT $ 12))
                      (|spadConstant| $ 36) (QREFELT $ 37))
            . #3=(|CARTEN;coerce;Sm$;29|))
      (LETT |offz| 0 . #3#)
      (SEQ (LETT |i| 0 . #3#) (LETT #2# (- (QREFELT $ 7) 1) . #3#) G190
           (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (SEQ (LETT |j| 0 . #3#) (LETT #1# (- (QREFELT $ 7) 1) . #3#) G190
                 (COND ((|greater_SI| |j| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SPADCALL |z| (+ |offz| |j|)
                             (SPADCALL |m| (+ |i| 1) (+ |j| 1) (QREFELT $ 76))
                             (QREFELT $ 38))))
                 (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (LETT |offz| (+ |offz| (QREFELT $ 7)) . #3#)))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |CARTEN;=;2$B;30| (|x| |y| $)
  (PROG (#1=#:G272 #2=#:G273 |i|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (SPADCALL |y| (QREFELT $ 32))
                   (QREFELT $ 26))
         'NIL)
        ('T
         (SEQ
          (SEQ (LETT |i| 0 . #3=(|CARTEN;=;2$B;30|))
               (LETT #2# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                             (SPADCALL |y| |i| (QREFELT $ 33)) (QREFELT $ 78))
                   (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT 'T)))))
      #1# (EXIT #1#))))) 

(DEFUN |CARTEN;+;3$;31| (|x| |y| $)
  (PROG (#1=#:G278 |i| |z|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (SPADCALL |y| (QREFELT $ 32))
                  (QREFELT $ 26))
        (|error| "Rank mismatch"))
       ('T
        (SEQ
         (LETT |z|
               (SPADCALL (SPADCALL |x| (QREFELT $ 32)) (|spadConstant| $ 36)
                         (QREFELT $ 37))
               . #2=(|CARTEN;+;3$;31|))
         (SEQ (LETT |i| 0 . #2#)
              (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#) G190
              (COND ((|greater_SI| |i| #1#) (GO G191)))
              (SEQ
               (EXIT
                (SPADCALL |z| |i|
                          (SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                                    (SPADCALL |y| |i| (QREFELT $ 33))
                                    (QREFELT $ 80))
                          (QREFELT $ 38))))
              (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT |z|)))))))) 

(DEFUN |CARTEN;-;3$;32| (|x| |y| $)
  (PROG (#1=#:G283 |i| |z|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (SPADCALL |y| (QREFELT $ 32))
                  (QREFELT $ 26))
        (|error| "Rank mismatch"))
       ('T
        (SEQ
         (LETT |z|
               (SPADCALL (SPADCALL |x| (QREFELT $ 32)) (|spadConstant| $ 36)
                         (QREFELT $ 37))
               . #2=(|CARTEN;-;3$;32|))
         (SEQ (LETT |i| 0 . #2#)
              (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#) G190
              (COND ((|greater_SI| |i| #1#) (GO G191)))
              (SEQ
               (EXIT
                (SPADCALL |z| |i|
                          (SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                                    (SPADCALL |y| |i| (QREFELT $ 33))
                                    (QREFELT $ 82))
                          (QREFELT $ 38))))
              (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT |z|)))))))) 

(DEFUN |CARTEN;-;2$;33| (|x| $)
  (PROG (#1=#:G287 |i| |z|)
    (RETURN
     (SEQ
      (LETT |z|
            (SPADCALL (SPADCALL |x| (QREFELT $ 32)) (|spadConstant| $ 36)
                      (QREFELT $ 37))
            . #2=(|CARTEN;-;2$;33|))
      (SEQ (LETT |i| 0 . #2#)
           (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |z| |i|
                       (SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                                 (QREFELT $ 84))
                       (QREFELT $ 38))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |CARTEN;*;I2$;34| (|n| |x| $)
  (PROG (#1=#:G291 |i| |z|)
    (RETURN
     (SEQ
      (LETT |z|
            (SPADCALL (SPADCALL |x| (QREFELT $ 32)) (|spadConstant| $ 36)
                      (QREFELT $ 37))
            . #2=(|CARTEN;*;I2$;34|))
      (SEQ (LETT |i| 0 . #2#)
           (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |z| |i|
                       (SPADCALL |n| (SPADCALL |x| |i| (QREFELT $ 33))
                                 (QREFELT $ 86))
                       (QREFELT $ 38))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |CARTEN;*;$I$;35| (|x| |n| $)
  (PROG (#1=#:G295 |i| |z|)
    (RETURN
     (SEQ
      (LETT |z|
            (SPADCALL (SPADCALL |x| (QREFELT $ 32)) (|spadConstant| $ 36)
                      (QREFELT $ 37))
            . #2=(|CARTEN;*;$I$;35|))
      (SEQ (LETT |i| 0 . #2#)
           (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |z| |i|
                       (SPADCALL |n| (SPADCALL |x| |i| (QREFELT $ 33))
                                 (QREFELT $ 86))
                       (QREFELT $ 38))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |CARTEN;*;R2$;36| (|r| |x| $)
  (PROG (#1=#:G299 |i| |z|)
    (RETURN
     (SEQ
      (LETT |z|
            (SPADCALL (SPADCALL |x| (QREFELT $ 32)) (|spadConstant| $ 36)
                      (QREFELT $ 37))
            . #2=(|CARTEN;*;R2$;36|))
      (SEQ (LETT |i| 0 . #2#)
           (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |z| |i|
                       (SPADCALL |r| (SPADCALL |x| |i| (QREFELT $ 33))
                                 (QREFELT $ 89))
                       (QREFELT $ 38))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |CARTEN;*;$R$;37| (|x| |r| $)
  (PROG (#1=#:G303 |i| |z|)
    (RETURN
     (SEQ
      (LETT |z|
            (SPADCALL (SPADCALL |x| (QREFELT $ 32)) (|spadConstant| $ 36)
                      (QREFELT $ 37))
            . #2=(|CARTEN;*;$R$;37|))
      (SEQ (LETT |i| 0 . #2#)
           (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |z| |i|
                       (SPADCALL |r| (SPADCALL |x| |i| (QREFELT $ 33))
                                 (QREFELT $ 89))
                       (QREFELT $ 38))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |CARTEN;product;3$;38| (|x| |y| $)
  (PROG (#1=#:G309 |j| #2=#:G308 |i| |ioff| |z| |ny| |nx|)
    (RETURN
     (SEQ
      (LETT |nx| (SPADCALL |x| (QREFELT $ 32)) . #3=(|CARTEN;product;3$;38|))
      (LETT |ny| (SPADCALL |y| (QREFELT $ 32)) . #3#)
      (LETT |z| (SPADCALL (* |nx| |ny|) (|spadConstant| $ 36) (QREFELT $ 37))
            . #3#)
      (SEQ (LETT |ioff| 0 . #3#) (LETT |i| 0 . #3#) (LETT #2# (- |nx| 1) . #3#)
           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 0 . #3#) (LETT #1# (- |ny| 1) . #3#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |z| (+ |ioff| |j|)
                              (SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                                        (SPADCALL |y| |j| (QREFELT $ 33))
                                        (QREFELT $ 89))
                              (QREFELT $ 38))))
                  (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i|
                 (PROG1 (|inc_SI| |i|)
                   (LETT |ioff| (|add_SI| |ioff| |ny|) . #3#))
                 . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |CARTEN;*;3$;39| (|x| |y| $)
  (PROG (|ry| |rx|)
    (RETURN
     (SEQ (LETT |rx| (SPADCALL |x| (QREFELT $ 43)) . #1=(|CARTEN;*;3$;39|))
          (LETT |ry| (SPADCALL |y| (QREFELT $ 43)) . #1#)
          (EXIT
           (COND
            ((EQL |rx| 0)
             (SPADCALL (SPADCALL |x| 0 (QREFELT $ 33)) |y| (QREFELT $ 90)))
            ((EQL |ry| 0)
             (SPADCALL |x| (SPADCALL |y| 0 (QREFELT $ 33)) (QREFELT $ 91)))
            ('T (SPADCALL |x| |rx| |y| 1 (QREFELT $ 93))))))))) 

(DEFUN |CARTEN;contract;$2I$;40| (|x| |i| |j| $)
  (PROG (#1=#:G319 |k| |xk| |l| |xl| |zl| |m| |xm| |zm| |h| |xh| |zh| |z| |xok|
         |xoh| |zoh| |nh| |rh| |xom| |zom| |nm| |rm| |xol| |zol| |nl| |rl|
         |#G111| |#G110| |rx|)
    (RETURN
     (SEQ
      (LETT |rx| (SPADCALL |x| (QREFELT $ 43))
            . #2=(|CARTEN;contract;$2I$;40|))
      (COND
       ((OR
         (OR (OR (OR (< |i| 1) (SPADCALL |i| |rx| (QREFELT $ 24))) (< |j| 1))
             (SPADCALL |j| |rx| (QREFELT $ 24)))
         (EQL |i| |j|))
        (EXIT (|error| "Improper index for contraction"))))
      (COND
       ((SPADCALL |i| |j| (QREFELT $ 24))
        (PROGN
         (LETT |#G110| |j| . #2#)
         (LETT |#G111| |i| . #2#)
         (LETT |i| |#G110| . #2#)
         (LETT |j| |#G111| . #2#))))
      (LETT |rl| (- |rx| |j|) . #2#)
      (LETT |nl| (EXPT (QREFELT $ 7) |rl|) . #2#) (LETT |zol| 1 . #2#)
      (LETT |xol| |zol| . #2#) (LETT |rm| (- (- |j| |i|) 1) . #2#)
      (LETT |nm| (EXPT (QREFELT $ 7) |rm|) . #2#) (LETT |zom| |nl| . #2#)
      (LETT |xom| (* |zom| (QREFELT $ 7)) . #2#) (LETT |rh| (- |i| 1) . #2#)
      (LETT |nh| (EXPT (QREFELT $ 7) |rh|) . #2#)
      (LETT |zoh| (* |nl| |nm|) . #2#)
      (LETT |xoh| (* |zoh| (SPADCALL (QREFELT $ 7) 2 (QREFELT $ 12))) . #2#)
      (LETT |xok| (* |nl| (+ 1 (* |nm| (QREFELT $ 7)))) . #2#)
      (LETT |z|
            (SPADCALL (* (* |nl| |nm|) |nh|) (|spadConstant| $ 36)
                      (QREFELT $ 37))
            . #2#)
      (SEQ (LETT |zh| 0 . #2#) (LETT |xh| 0 . #2#) (LETT |h| 1 . #2#) G190
           (COND ((|greater_SI| |h| |nh|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |zm| |zh| . #2#) (LETT |xm| |xh| . #2#)
                  (LETT |m| 1 . #2#) G190
                  (COND ((|greater_SI| |m| |nm|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |zl| |zm| . #2#) (LETT |xl| |xm| . #2#)
                         (LETT |l| 1 . #2#) G190
                         (COND ((|greater_SI| |l| |nl|) (GO G191)))
                         (SEQ
                          (SPADCALL |z| |zl| (|spadConstant| $ 36)
                                    (QREFELT $ 38))
                          (EXIT
                           (SEQ (LETT |xk| |xl| . #2#) (LETT |k| 1 . #2#)
                                (LETT #1# (QREFELT $ 7) . #2#) G190
                                (COND ((|greater_SI| |k| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |z| |zl|
                                            (SPADCALL
                                             (SPADCALL |z| |zl| (QREFELT $ 33))
                                             (SPADCALL |x| |xk| (QREFELT $ 33))
                                             (QREFELT $ 80))
                                            (QREFELT $ 38))))
                                (LETT |k|
                                      (PROG1 (|inc_SI| |k|)
                                        (LETT |xk| (+ |xk| |xok|) . #2#))
                                      . #2#)
                                (GO G190) G191 (EXIT NIL))))
                         (LETT |l|
                               (PROG1 (|inc_SI| |l|)
                                 (LETT |xl|
                                       (PROG1 (+ |xl| |xol|)
                                         (LETT |zl| (+ |zl| |zol|) . #2#))
                                       . #2#))
                               . #2#)
                         (GO G190) G191 (EXIT NIL))))
                  (LETT |m|
                        (PROG1 (|inc_SI| |m|)
                          (LETT |xm|
                                (PROG1 (+ |xm| |xom|)
                                  (LETT |zm| (+ |zm| |zom|) . #2#))
                                . #2#))
                        . #2#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT |h|
                 (PROG1 (|inc_SI| |h|)
                   (LETT |xh|
                         (PROG1 (|add_SI| |xh| |xoh|)
                           (LETT |zh| (|add_SI| |zh| |zoh|) . #2#))
                         . #2#))
                 . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |CARTEN;contract;$I$I$;41| (|x| |i| |y| |j| $)
  (PROG (#1=#:G328 |k| |xk| |yk| |dyl| |yl| |zly| |dyh| |yh| |zhy| |dxl| |xl|
         |zlx| |dxh| |xh| |zhx| |z| |zohx| |ohx| |nhx| |rhx| |zolx| |olx| |nlx|
         |rlx| |zohy| |ohy| |nhy| |rhy| |zoly| |oly| |nly| |rly| |ry| |rx|)
    (RETURN
     (SEQ
      (LETT |rx| (SPADCALL |x| (QREFELT $ 43))
            . #2=(|CARTEN;contract;$I$I$;41|))
      (LETT |ry| (SPADCALL |y| (QREFELT $ 43)) . #2#)
      (COND
       ((OR (OR (OR (< |i| 1) (SPADCALL |i| |rx| (QREFELT $ 24))) (< |j| 1))
            (SPADCALL |j| |ry| (QREFELT $ 24)))
        (EXIT (|error| "Improper index for contraction"))))
      (LETT |rly| (- |ry| |j|) . #2#)
      (LETT |nly| (EXPT (QREFELT $ 7) |rly|) . #2#) (LETT |oly| 1 . #2#)
      (LETT |zoly| 1 . #2#) (LETT |rhy| (- |j| 1) . #2#)
      (LETT |nhy| (EXPT (QREFELT $ 7) |rhy|) . #2#)
      (LETT |ohy| (* |nly| (QREFELT $ 7)) . #2#)
      (LETT |zohy| (SPADCALL |zoly| |nly| (QREFELT $ 96)) . #2#)
      (LETT |rlx| (- |rx| |i|) . #2#)
      (LETT |nlx| (EXPT (QREFELT $ 7) |rlx|) . #2#) (LETT |olx| 1 . #2#)
      (LETT |zolx| (* |zohy| |nhy|) . #2#) (LETT |rhx| (- |i| 1) . #2#)
      (LETT |nhx| (EXPT (QREFELT $ 7) |rhx|) . #2#)
      (LETT |ohx| (* |nlx| (QREFELT $ 7)) . #2#)
      (LETT |zohx| (* |zolx| |nlx|) . #2#)
      (LETT |z|
            (SPADCALL (* (* (* |nlx| |nhx|) |nly|) |nhy|) (|spadConstant| $ 36)
                      (QREFELT $ 37))
            . #2#)
      (SEQ (LETT |zhx| 0 . #2#) (LETT |xh| 0 . #2#) (LETT |dxh| 1 . #2#) G190
           (COND ((|greater_SI| |dxh| |nhx|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |zlx| |zhx| . #2#) (LETT |xl| |xh| . #2#)
                  (LETT |dxl| 1 . #2#) G190
                  (COND ((|greater_SI| |dxl| |nlx|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |zhy| |zlx| . #2#) (LETT |yh| 0 . #2#)
                         (LETT |dyh| 1 . #2#) G190
                         (COND ((|greater_SI| |dyh| |nhy|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |zly| |zhy| . #2#) (LETT |yl| |yh| . #2#)
                                (LETT |dyl| 1 . #2#) G190
                                (COND ((|greater_SI| |dyl| |nly|) (GO G191)))
                                (SEQ
                                 (SPADCALL |z| |zly| (|spadConstant| $ 36)
                                           (QREFELT $ 38))
                                 (EXIT
                                  (SEQ (LETT |yk| |yl| . #2#)
                                       (LETT |xk| |xl| . #2#)
                                       (LETT |k| 1 . #2#)
                                       (LETT #1# (QREFELT $ 7) . #2#) G190
                                       (COND
                                        ((|greater_SI| |k| #1#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |z| |zly|
                                                   (SPADCALL
                                                    (SPADCALL |z| |zly|
                                                              (QREFELT $ 33))
                                                    (SPADCALL
                                                     (SPADCALL |x| |xk|
                                                               (QREFELT $ 33))
                                                     (SPADCALL |y| |yk|
                                                               (QREFELT $ 33))
                                                     (QREFELT $ 89))
                                                    (QREFELT $ 80))
                                                   (QREFELT $ 38))))
                                       (LETT |k|
                                             (PROG1 (|inc_SI| |k|)
                                               (LETT |xk|
                                                     (PROG1 (+ |xk| |nlx|)
                                                       (LETT |yk|
                                                             (+ |yk| |nly|)
                                                             . #2#))
                                                     . #2#))
                                             . #2#)
                                       (GO G190) G191 (EXIT NIL))))
                                (LETT |dyl|
                                      (PROG1 (|inc_SI| |dyl|)
                                        (LETT |yl|
                                              (PROG1 (+ |yl| |oly|)
                                                (LETT |zly| (+ |zly| |zoly|)
                                                      . #2#))
                                              . #2#))
                                      . #2#)
                                (GO G190) G191 (EXIT NIL))))
                         (LETT |dyh|
                               (PROG1 (|inc_SI| |dyh|)
                                 (LETT |yh|
                                       (PROG1 (|add_SI| |yh| |ohy|)
                                         (LETT |zhy| (+ |zhy| |zohy|) . #2#))
                                       . #2#))
                               . #2#)
                         (GO G190) G191 (EXIT NIL))))
                  (LETT |dxl|
                        (PROG1 (|inc_SI| |dxl|)
                          (LETT |xl|
                                (PROG1 (+ |xl| |olx|)
                                  (LETT |zlx| (+ |zlx| |zolx|) . #2#))
                                . #2#))
                        . #2#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT |dxh|
                 (PROG1 (|inc_SI| |dxh|)
                   (LETT |xh|
                         (PROG1 (|add_SI| |xh| |ohx|)
                           (LETT |zhx| (|add_SI| |zhx| |zohx|) . #2#))
                         . #2#))
                 . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |CARTEN;transpose;2$;42| (|x| $)
  (SPADCALL |x| 1 (SPADCALL |x| (QREFELT $ 43)) (QREFELT $ 97))) 

(DEFUN |CARTEN;transpose;$2I$;43| (|x| |i| |j| $)
  (PROG (#1=#:G338 |q| |zq| |xq| #2=#:G337 |p| |zp| |xp| |l| |zl| |m| |zm| |h|
         |zh| |z| |zoh| |nh| |rh| |zoj| |zom| |nm| |rm| |zoi| |zol| |nl| |rl|
         |#G147| |#G146| |rx|)
    (RETURN
     (SEQ
      (LETT |rx| (SPADCALL |x| (QREFELT $ 43))
            . #3=(|CARTEN;transpose;$2I$;43|))
      (COND
       ((OR
         (OR (OR (OR (< |i| 1) (SPADCALL |i| |rx| (QREFELT $ 24))) (< |j| 1))
             (SPADCALL |j| |rx| (QREFELT $ 24)))
         (EQL |i| |j|))
        (EXIT (|error| "Improper indicies for transposition"))))
      (COND
       ((SPADCALL |i| |j| (QREFELT $ 24))
        (PROGN
         (LETT |#G146| |j| . #3#)
         (LETT |#G147| |i| . #3#)
         (LETT |i| |#G146| . #3#)
         (LETT |j| |#G147| . #3#))))
      (LETT |rl| (- |rx| |j|) . #3#)
      (LETT |nl| (EXPT (QREFELT $ 7) |rl|) . #3#) (LETT |zol| 1 . #3#)
      (LETT |zoi| (SPADCALL |zol| |nl| (QREFELT $ 96)) . #3#)
      (LETT |rm| (- (- |j| |i|) 1) . #3#)
      (LETT |nm| (EXPT (QREFELT $ 7) |rm|) . #3#)
      (LETT |zom| (* |nl| (QREFELT $ 7)) . #3#)
      (LETT |zoj| (* |zom| |nm|) . #3#) (LETT |rh| (- |i| 1) . #3#)
      (LETT |nh| (EXPT (QREFELT $ 7) |rh|) . #3#)
      (LETT |zoh| (* (* |nl| |nm|) (SPADCALL (QREFELT $ 7) 2 (QREFELT $ 12)))
            . #3#)
      (LETT |z|
            (SPADCALL (SPADCALL |x| (QREFELT $ 32)) (|spadConstant| $ 36)
                      (QREFELT $ 37))
            . #3#)
      (SEQ (LETT |zh| 0 . #3#) (LETT |h| 1 . #3#) G190
           (COND ((|greater_SI| |h| |nh|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |zm| |zh| . #3#) (LETT |m| 1 . #3#) G190
                  (COND ((|greater_SI| |m| |nm|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |zl| |zm| . #3#) (LETT |l| 1 . #3#) G190
                         (COND ((|greater_SI| |l| |nl|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |xp| |zl| . #3#) (LETT |zp| |zl| . #3#)
                                (LETT |p| 1 . #3#)
                                (LETT #2# (QREFELT $ 7) . #3#) G190
                                (COND ((|greater_SI| |p| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |xq| |xp| . #3#)
                                       (LETT |zq| |zp| . #3#)
                                       (LETT |q| 1 . #3#)
                                       (LETT #1# (QREFELT $ 7) . #3#) G190
                                       (COND
                                        ((|greater_SI| |q| #1#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |z| |zq|
                                                   (SPADCALL |x| |xq|
                                                             (QREFELT $ 33))
                                                   (QREFELT $ 38))))
                                       (LETT |q|
                                             (PROG1 (|inc_SI| |q|)
                                               (LETT |zq|
                                                     (PROG1 (+ |zq| |zoj|)
                                                       (LETT |xq|
                                                             (+ |xq| |zoi|)
                                                             . #3#))
                                                     . #3#))
                                             . #3#)
                                       (GO G190) G191 (EXIT NIL))))
                                (LETT |p|
                                      (PROG1 (|inc_SI| |p|)
                                        (LETT |zp|
                                              (PROG1 (+ |zp| |zoi|)
                                                (LETT |xp| (+ |xp| |zoj|)
                                                      . #3#))
                                              . #3#))
                                      . #3#)
                                (GO G190) G191 (EXIT NIL))))
                         (LETT |l|
                               (PROG1 (|inc_SI| |l|)
                                 (LETT |zl| (+ |zl| |zol|) . #3#))
                               . #3#)
                         (GO G190) G191 (EXIT NIL))))
                  (LETT |m|
                        (PROG1 (|inc_SI| |m|) (LETT |zm| (+ |zm| |zom|) . #3#))
                        . #3#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT |h|
                 (PROG1 (|inc_SI| |h|) (LETT |zh| (|add_SI| |zh| |zoh|) . #3#))
                 . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |CARTEN;reindex;$L$;44| (|x| |l| $)
  (PROG (|pi| #1=#:G343 |i| |ziv| |xiv| |p| |rx| |z| |nx|)
    (RETURN
     (SEQ
      (LETT |nx| (SPADCALL |x| (QREFELT $ 32)) . #2=(|CARTEN;reindex;$L$;44|))
      (LETT |z| (SPADCALL |nx| (|spadConstant| $ 36) (QREFELT $ 37)) . #2#)
      (LETT |rx| (SPADCALL |x| (QREFELT $ 43)) . #2#)
      (LETT |p| (|CARTEN;mkPerm| |rx| |l| $) . #2#)
      (LETT |xiv| (MAKEARR1 |rx| 0) . #2#) (LETT |ziv| (MAKEARR1 |rx| 0) . #2#)
      (SEQ (LETT |i| 0 . #2#)
           (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (LETT |pi|
                  (|CARTEN;index2int|
                   (|CARTEN;permute!| |ziv| (|CARTEN;int2index| |i| |xiv| $)
                    |p| $)
                   $)
                  . #2#)
            (EXIT
             (SPADCALL |z| |pi| (SPADCALL |x| |i| (QREFELT $ 33))
                       (QREFELT $ 38))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DECLAIM (NOTINLINE |CartesianTensor;|)) 

(DEFUN |CartesianTensor| (&REST #1=#:G344)
  (PROG ()
    (RETURN
     (PROG (#2=#:G345)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|CartesianTensor|)
                                           '|domainEqualList|)
                . #3=(|CartesianTensor|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |CartesianTensor;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|CartesianTensor|))))))))))) 

(DEFUN |CartesianTensor;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|CartesianTensor|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|CartesianTensor| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 103) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|CartesianTensor| (LIST DV$1 DV$2 DV$3)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (|IndexedVector| |#3| 0))
      (QSETREFV $ 13 (SPADCALL |#2| 2 (QREFELT $ 12)))
      (QSETREFV $ 14 (SPADCALL |#2| 3 (QREFELT $ 12)))
      (QSETREFV $ 15 (SPADCALL |#2| 4 (QREFELT $ 12)))
      $)))) 

(MAKEPROP '|CartesianTensor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| (|PositiveInteger|) (|NonNegativeInteger|)
              (0 . ^) '|dim2| '|dim3| '|dim4| |CARTEN;kroneckerDelta;$;10|
              |CARTEN;sample;$;1| (|Integer|) (|Vector| 18) (6 . |setelt|)
              (|Boolean|) (13 . ~=) (19 . |elt|) (25 . >) (31 . *) (37 . ~=)
              (|Vector| 21) (43 . |setelt|) (50 . |elt|) (|Union| $ '"failed")
              (56 . |exquo|) (62 . |#|) (67 . |elt|) (|List| 8)
              |CARTEN;ravel;$L;8| (73 . |Zero|) (77 . |new|) (83 . |setelt|)
              |CARTEN;unravel;L$;9| (90 . |One|) (94 . |coerce|)
              |CARTEN;leviCivitaSymbol;$;11| |CARTEN;rank;$Nni;13|
              |CARTEN;degree;$Nni;12| |CARTEN;elt;$R;14| |CARTEN;elt;$IR;15|
              |CARTEN;elt;$2IR;16| |CARTEN;elt;$3IR;17| |CARTEN;elt;$4IR;18|
              (|List| 18) |CARTEN;elt;$LR;19| |CARTEN;coerce;L$;20| (|List| $$)
              (99 . |#|) (104 . |first|) (|List| $) |CARTEN;coerce;L$;21|
              (|Union| 8 '"failed") |CARTEN;retractIfCan;$U;22| (|OutputForm|)
              (|List| 60) (109 . |coerce|) (114 . |coerce|) (|List| 56)
              (119 . |matrix|) |CARTEN;coerce;$Of;24| |CARTEN;coerce;R$;27|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CARTEN;Zero;$;25|) $))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CARTEN;One;$;26|) $))
              (|DirectProduct| 7 8) (124 . |minIndex|) (129 . |maxIndex|)
              (134 . |elt|) |CARTEN;coerce;Dp$;28| (|SquareMatrix| 7 8)
              (140 . |elt|) |CARTEN;coerce;Sm$;29| (147 . ~=) |CARTEN;=;2$B;30|
              (153 . +) |CARTEN;+;3$;31| (159 . -) |CARTEN;-;3$;32| (165 . -)
              |CARTEN;-;2$;33| (170 . *) |CARTEN;*;I2$;34| |CARTEN;*;$I$;35|
              (176 . *) |CARTEN;*;R2$;36| |CARTEN;*;$R$;37|
              |CARTEN;product;3$;38| |CARTEN;contract;$I$I$;41|
              |CARTEN;*;3$;39| |CARTEN;contract;$2I$;40| (182 . *)
              |CARTEN;transpose;$2I$;43| |CARTEN;transpose;2$;42|
              |CARTEN;reindex;$L$;44| (|String|) (|SingleInteger|)
              (|HashState|))
           '#(~= 188 |unravel| 194 |transpose| 199 |sample| 211 |retractIfCan|
              215 |retract| 220 |reindex| 225 |ravel| 231 |rank| 236 |product|
              241 |leviCivitaSymbol| 247 |latex| 251 |kroneckerDelta| 256
              |hashUpdate!| 260 |hash| 266 |elt| 271 |degree| 312 |contract|
              317 |coerce| 332 |Zero| 362 |One| 366 = 370 - 376 + 387 * 393)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|GradedAlgebra&| |GradedModule&| |GradedModule&|
                     |SetCategory&| |BasicType&| |RetractableTo&| NIL)
                  (CONS
                   '#((|GradedAlgebra| 8 11) (|GradedModule| 8 11)
                      (|GradedModule| 18 11) (|SetCategory|) (|BasicType|)
                      (|RetractableTo| 8) (|CoercibleTo| 60))
                   (|makeByteWordVec2| 102
                                       '(2 11 0 0 10 12 3 19 18 0 18 18 20 2 18
                                         21 0 0 22 2 19 18 0 18 23 2 18 21 0 0
                                         24 2 18 0 11 0 25 2 11 21 0 0 26 3 27
                                         21 0 18 21 28 2 27 21 0 18 29 2 18 30
                                         0 0 31 1 9 11 0 32 2 9 8 0 18 33 0 8 0
                                         36 2 9 0 11 8 37 3 9 8 0 18 8 38 0 8 0
                                         40 1 8 0 18 41 1 53 11 0 54 1 53 2 0
                                         55 1 61 60 0 62 1 8 60 0 63 1 60 0 64
                                         65 1 70 18 0 71 1 70 18 0 72 2 70 8 0
                                         18 73 3 75 8 0 18 18 76 2 8 21 0 0 78
                                         2 8 0 0 0 80 2 8 0 0 0 82 1 8 0 0 84 2
                                         8 0 18 0 86 2 8 0 0 0 89 2 11 0 10 0
                                         96 2 0 21 0 0 1 1 0 0 34 39 3 0 0 0 18
                                         18 97 1 0 0 0 98 0 0 0 17 1 0 58 0 59
                                         1 0 8 0 1 2 0 0 0 50 99 1 0 34 0 35 1
                                         0 11 0 43 2 0 0 0 0 92 0 0 0 42 1 0
                                         100 0 1 0 0 0 16 2 0 102 102 0 1 1 0
                                         101 0 1 2 0 8 0 50 51 5 0 8 0 18 18 18
                                         18 49 3 0 8 0 18 18 47 4 0 8 0 18 18
                                         18 48 2 0 8 0 18 46 1 0 8 0 45 1 0 11
                                         0 44 4 0 0 0 18 0 18 93 3 0 0 0 18 18
                                         95 1 0 0 56 57 1 0 0 75 77 1 0 0 34 52
                                         1 0 0 70 74 1 0 0 8 67 1 0 60 0 66 0 0
                                         0 68 0 0 0 69 2 0 21 0 0 79 2 0 0 0 0
                                         83 1 0 0 0 85 2 0 0 0 0 81 2 0 0 0 0
                                         94 2 0 0 18 0 87 2 0 0 0 18 88 2 0 0 0
                                         8 91 2 0 0 8 0 90)))))
           '|lookupComplete|)) 
