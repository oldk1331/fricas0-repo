
(/VERSIONCHECK 2) 

(DEFUN |IR2F;cmplex| (|alpha| |p| $)
  (SPADCALL |alpha|
            (SPADCALL (SPADCALL |p| |alpha| (QREFELT $ 9)) (QREFELT $ 10))
            (QREFELT $ 11))) 

(DEFUN |IR2F;IR2F| (|i| $)
  (SPADCALL
   (SPADCALL (SPADCALL |i| (QREFELT $ 13)) NIL (SPADCALL |i| (QREFELT $ 16))
             (QREFELT $ 19))
   (QREFELT $ 20))) 

(DEFUN |IR2F;pairprod| (|x| |l| $)
  (PROG (#1=#:G157 |y| #2=#:G156)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|IR2F;pairprod|))
       (SEQ (LETT |y| NIL . #3#) (LETT #1# |l| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |x| |y| (QREFELT $ 11)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |IR2F;evenRoots| (|x| $)
  (PROG (#1=#:G164 |k| #2=#:G163)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|IR2F;evenRoots|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# (SPADCALL |x| (QREFELT $ 22)) . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((COND
                 ((SPADCALL |k| '|nthRoot| (QREFELT $ 26))
                  (COND
                   ((SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |k| (QREFELT $ 28)) (QREFELT $ 29))
                      (QREFELT $ 31))
                     (QREFELT $ 32))
                    (COND
                     ((NULL
                       (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 28)))
                                 (QREFELT $ 34)))
                      'NIL)
                     (#4='T 'T)))
                   (#4# 'NIL)))
                 (#4# 'NIL))
                (LETT #2#
                      (CONS (|SPADfirst| (SPADCALL |k| (QREFELT $ 28))) #2#)
                      . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |IR2F;expand;IrL;5| (|i| $)
  (PROG (|j|)
    (RETURN
     (SEQ (LETT |j| (SPADCALL |i| (QREFELT $ 35)) |IR2F;expand;IrL;5|)
          (EXIT
           (|IR2F;pairsum| (LIST (|IR2F;IR2F| |j| $))
            (|IR2F;mkRealFunc| (SPADCALL |j| (QREFELT $ 36)) $) $)))))) 

(DEFUN |IR2F;split;2Ir;6| (|i| $)
  (PROG (#1=#:G173 |l| #2=#:G172)
    (RETURN
     (SEQ
      (SPADCALL (SPADCALL |i| (QREFELT $ 13))
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|IR2F;split;2Ir;6|))
                  (SEQ (LETT |l| NIL . #3#)
                       (LETT #1# (SPADCALL |i| (QREFELT $ 36)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|IR2F;nlogs| |l| $) #2#) . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 39))
                (SPADCALL |i| (QREFELT $ 16)) (QREFELT $ 19)))))) 

(DEFUN |IR2F;complexExpand;IrF;7| (|i| $)
  (PROG (#1=#:G176 #2=#:G175 #3=#:G177 #4=#:G180 |lg| |j|)
    (RETURN
     (SEQ
      (LETT |j| (SPADCALL |i| (QREFELT $ 35))
            . #5=(|IR2F;complexExpand;IrF;7|))
      (EXIT
       (SPADCALL (|IR2F;IR2F| |j| $)
                 (PROGN
                  (LETT #1# NIL . #5#)
                  (SEQ (LETT |lg| NIL . #5#)
                       (LETT #4# (SPADCALL |j| (QREFELT $ 36)) . #5#) G190
                       (COND
                        ((OR (ATOM #4#)
                             (PROGN (LETT |lg| (CAR #4#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (SPADCALL
                                 (SPADCALL (QVELT |lg| 0) (QREFELT $ 41))
                                 (|IR2F;lg2cfunc| |lg| $) (QREFELT $ 11))
                                . #5#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 42)) . #5#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #5#)
                             (LETT #1# 'T . #5#)))))))
                       (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) ('T (|spadConstant| $ 43))))
                 (QREFELT $ 42))))))) 

(DEFUN |IR2F;quadratic| (|p| |lg| $)
  (PROG (|nn| |sqrn| |pp| |sqrp| |s| |sqr| |lgp| |nrm| |f| |e| |q| |c| |d|
         |delta| |p0| |a| |b|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |delta|
               (SPADCALL
                (SPADCALL
                 (LETT |b| (SPADCALL |p| 1 (QREFELT $ 48))
                       . #1=(|IR2F;quadratic|))
                 2 (QREFELT $ 50))
                (SPADCALL
                 (SPADCALL 4 (LETT |a| (SPADCALL |p| 2 (QREFELT $ 48)) . #1#)
                           (QREFELT $ 51))
                 (LETT |p0| (SPADCALL |p| 0 (QREFELT $ 48)) . #1#)
                 (QREFELT $ 11))
                (QREFELT $ 53))
               . #1#)
         (QREFELT $ 54))
        (LIST
         (|IR2F;linear|
          (SPADCALL (SPADCALL (|spadConstant| $ 46) 1 (QREFELT $ 55))
                    (SPADCALL (SPADCALL |b| |a| (QREFELT $ 56)) (QREFELT $ 57))
                    (QREFELT $ 58))
          |lg| $)))
       (#2='T
        (SEQ
         (LETT |e|
               (QCAR
                (LETT |q|
                      (|IR2F;quadeval| |lg|
                       (LETT |c|
                             (SPADCALL
                              (SPADCALL |b|
                                        (LETT |d|
                                              (SPADCALL
                                               (SPADCALL 2 |a| (QREFELT $ 51))
                                               (QREFELT $ 59))
                                              . #1#)
                                        (QREFELT $ 11))
                              (QREFELT $ 60))
                             . #1#)
                       |d| |delta| $)
                      . #1#))
               . #1#)
         (LETT |lgp|
               (SPADCALL |c|
                         (SPADCALL
                          (LETT |nrm|
                                (SPADCALL (SPADCALL |e| 2 (QREFELT $ 50))
                                          (SPADCALL |delta|
                                                    (SPADCALL
                                                     (LETT |f| (QCDR |q|)
                                                           . #1#)
                                                     2 (QREFELT $ 50))
                                                    (QREFELT $ 11))
                                          (QREFELT $ 53))
                                . #1#)
                          (QREFELT $ 10))
                         (QREFELT $ 11))
               . #1#)
         (LETT |s| (QCAR (LETT |sqr| (|IR2F;insqrt| |delta| $) . #1#)) . #1#)
         (LETT |pp| (LETT |nn| (|spadConstant| $ 43) . #1#) . #1#)
         (COND
          ((>= (QCDR |sqr|) 0)
           (SEQ
            (LETT |sqrp|
                  (SPADCALL (QCAR |s|)
                            (SPADCALL (SPADCALL (QCDR |s|) (QREFELT $ 61))
                                      (QREFELT $ 63))
                            (QREFELT $ 11))
                  . #1#)
            (EXIT
             (LETT |pp|
                   (SPADCALL |lgp|
                             (SPADCALL (SPADCALL |d| |sqrp| (QREFELT $ 11))
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL 2 |e| (QREFELT $ 51)) |f|
                                            (QREFELT $ 11))
                                           |nrm| (QREFELT $ 56))
                                          |sqrp| (QREFELT $ 11))
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |e| 2 (QREFELT $ 50))
                                           (SPADCALL |delta|
                                                     (SPADCALL |f| 2
                                                               (QREFELT $ 50))
                                                     (QREFELT $ 11))
                                           (QREFELT $ 42))
                                          |nrm| (QREFELT $ 56))
                                         (QREFELT $ 42))
                                        (QREFELT $ 10))
                                       (QREFELT $ 11))
                             (QREFELT $ 42))
                   . #1#)))))
         (COND
          ((SPADCALL (QCDR |sqr|) 0 (QREFELT $ 64))
           (SEQ
            (LETT |sqrn|
                  (SPADCALL (QCAR |s|)
                            (SPADCALL
                             (SPADCALL (SPADCALL (QCDR |s|) (QREFELT $ 60))
                                       (QREFELT $ 61))
                             (QREFELT $ 63))
                            (QREFELT $ 11))
                  . #1#)
            (EXIT
             (LETT |nn|
                   (SPADCALL |lgp|
                             (SPADCALL (SPADCALL |d| |sqrn| (QREFELT $ 11))
                                       (|IR2F;ilog| |e|
                                        (SPADCALL |f| |sqrn| (QREFELT $ 11))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |a| (QREFELT $ 65))
                                          (SPADCALL |b| (QREFELT $ 65))
                                          (QREFELT $ 67))
                                         (SPADCALL |p0| (QREFELT $ 65))
                                         (QREFELT $ 67))
                                        $)
                                       (QREFELT $ 11))
                             (QREFELT $ 42))
                   . #1#)))))
         (EXIT
          (COND ((SPADCALL (QCDR |sqr|) 0 (QREFELT $ 68)) (LIST |pp|))
                ((< (QCDR |sqr|) 0) (LIST |nn|)) (#2# (LIST |pp| |nn|))))))))))) 

(DEFUN |IR2F;tantrick| (|a| |b| $)
  (COND
   ((QEQCAR (SPADCALL |a| (QREFELT $ 70)) 0)
    (SPADCALL 2
              (SPADCALL
               (SPADCALL (SPADCALL |b| |a| (QREFELT $ 56)) (QREFELT $ 60))
               (QREFELT $ 71))
              (QREFELT $ 51)))
   ('T
    (SPADCALL 2 (SPADCALL (SPADCALL |a| |b| (QREFELT $ 56)) (QREFELT $ 71))
              (QREFELT $ 51))))) 

(DEFUN |IR2F;ilog| (|a| |b| |lk| $)
  (PROG (|k| #1=#:G197 #2=#:G196 #3=#:G198 #4=#:G202 #5=#:G127 |l|)
    (RETURN
     (SEQ
      (LETT |l|
            (SPADCALL
             (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 73)) (QREFELT $ 75))
                       (SPADCALL (SPADCALL |b| (QREFELT $ 73)) (QREFELT $ 75))
                       (QREFELT $ 67))
             (SPADCALL |lk|
                       (SPADCALL
                        (SPADCALL (SPADCALL |a| (QREFELT $ 76)) (QREFELT $ 75))
                        (SPADCALL (SPADCALL |b| (QREFELT $ 76)) (QREFELT $ 75))
                        (QREFELT $ 67))
                       (QREFELT $ 67))
             (QREFELT $ 77))
            . #6=(|IR2F;ilog|))
      (EXIT
       (COND ((NULL |l|) (|IR2F;tantrick| |a| |b| $))
             (#7='T
              (SEQ
               (LETT |k|
                     (PROGN
                      (LETT #1# NIL . #6#)
                      (SEQ (LETT #5# NIL . #6#) (LETT #4# |l| . #6#) G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT #5# (CAR #4#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #3# #5# . #6#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #3# (QREFELT $ 78))
                                      . #6#))
                               ('T
                                (PROGN
                                 (LETT #2# #3# . #6#)
                                 (LETT #1# 'T . #6#)))))))
                           (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) (#7# (|IdentityError| '|max|))))
                     . #6#)
               (EXIT
                (|IR2F;ilog0| |a| |b|
                 (SPADCALL (SPADCALL |a| |k| (QREFELT $ 81)) (QREFELT $ 83))
                 (SPADCALL (SPADCALL |b| |k| (QREFELT $ 81)) (QREFELT $ 83))
                 (SPADCALL |k| (QREFELT $ 84)) $)))))))))) 

(DEFUN |IR2F;ilog0| (|a| |b| |upa| |upb| |k| $)
  (PROG (|bb| |aa| |qr| |g| |r| |#G33| |#G32| |#G31| |#G30|)
    (RETURN
     (SEQ
      (COND
       ((< (SPADCALL |upa| (QREFELT $ 85)) (SPADCALL |upb| (QREFELT $ 85)))
        (SEQ
         (PROGN
          (LETT |#G30| (SPADCALL |upb| (QREFELT $ 86)) . #1=(|IR2F;ilog0|))
          (LETT |#G31| |upa| . #1#)
          (LETT |upa| |#G30| . #1#)
          (LETT |upb| |#G31| . #1#))
         (EXIT
          (PROGN
           (LETT |#G32| (SPADCALL |b| (QREFELT $ 60)) . #1#)
           (LETT |#G33| |a| . #1#)
           (LETT |a| |#G32| . #1#)
           (LETT |b| |#G33| . #1#))))))
      (EXIT
       (COND
        ((ZEROP (SPADCALL |upb| (QREFELT $ 85))) (|IR2F;tantrick| |a| |b| $))
        (#2='T
         (SEQ (LETT |r| (SPADCALL |upa| |upb| (QREFELT $ 88)) . #1#)
              (LETT |g| (SPADCALL (QVELT |r| 2) (QREFELT $ 90)) . #1#)
              (EXIT
               (COND ((QEQCAR |g| 1) (|IR2F;tantrick| |a| |b| $))
                     (#2#
                      (SEQ
                       (COND
                        ((>= (SPADCALL (QVELT |r| 0) (QREFELT $ 85))
                             (SPADCALL |upb| (QREFELT $ 85)))
                         (SEQ
                          (LETT |qr|
                                (SPADCALL (QVELT |r| 0) |upb| (QREFELT $ 92))
                                . #1#)
                          (QSETVELT |r| 0 (QCDR |qr|))
                          (EXIT
                           (QSETVELT |r| 1
                                     (SPADCALL (QVELT |r| 1)
                                               (SPADCALL (QCAR |qr|) |upa|
                                                         (QREFELT $ 93))
                                               (QREFELT $ 58)))))))
                       (LETT |aa| (SPADCALL (QVELT |r| 1) |k| (QREFELT $ 9))
                             . #1#)
                       (LETT |bb|
                             (SPADCALL
                              (SPADCALL (QVELT |r| 0) |k| (QREFELT $ 9))
                              (QREFELT $ 60))
                             . #1#)
                       (EXIT
                        (SPADCALL
                         (|IR2F;tantrick|
                          (SPADCALL (SPADCALL |aa| |a| (QREFELT $ 11))
                                    (SPADCALL |bb| |b| (QREFELT $ 11))
                                    (QREFELT $ 42))
                          (QCDR |g|) $)
                         (|IR2F;ilog0| |aa| |bb| (QVELT |r| 1)
                          (SPADCALL (QVELT |r| 0) (QREFELT $ 86)) |k| $)
                         (QREFELT $ 42))))))))))))))) 

(DEFUN |IR2F;lg2func| (|lg| $)
  (PROG (#1=#:G225 #2=#:G221 |alpha| |r| |d| |p|)
    (RETURN
     (SEQ
      (COND
       ((ZEROP
         (LETT |d|
               (SPADCALL (LETT |p| (QVELT |lg| 1) . #3=(|IR2F;lg2func|))
                         (QREFELT $ 85))
               . #3#))
        (|error| "poly has degree 0"))
       ((EQL |d| 1) (LIST (|IR2F;linear| |p| (QVELT |lg| 2) $)))
       ((EQL |d| 2) (|IR2F;quadratic| |p| (QVELT |lg| 2) $))
       ('T
        (SEQ
         (EXIT
          (SEQ
           (COND
            ((ODDP |d|)
             (SEQ
              (LETT |r| (SPADCALL (SPADCALL |p| (QREFELT $ 94)) (QREFELT $ 90))
                    . #3#)
              (EXIT
               (COND
                ((QEQCAR |r| 0)
                 (PROGN
                  (LETT #1#
                        (|IR2F;pairsum|
                         (LIST
                          (|IR2F;cmplex|
                           (LETT |alpha|
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 96))
                                           (QREFELT $ 63))
                                 . #3#)
                           (QVELT |lg| 2) $))
                         (|IR2F;lg2func|
                          (VECTOR (QVELT |lg| 0)
                                  (PROG2
                                      (LETT #2#
                                            (SPADCALL |p|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (|spadConstant| $ 46) 1
                                                        (QREFELT $ 55))
                                                       (SPADCALL |alpha|
                                                                 (QREFELT $
                                                                          57))
                                                       (QREFELT $ 97))
                                                      (QREFELT $ 99))
                                            . #3#)
                                      (QCDR #2#)
                                    (|check_union| (QEQCAR #2# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 7))
                                                   #2#))
                                  (QVELT |lg| 2))
                          $)
                         $)
                        . #3#)
                  (GO #1#))))))))
           (EXIT (LIST (|IR2F;lg2cfunc| |lg| $)))))
         #1# (EXIT #1#)))))))) 

(DEFUN |IR2F;lg2cfunc| (|lg| $)
  (PROG (#1=#:G230 #2=#:G229 #3=#:G231 #4=#:G233 |alpha|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|IR2F;lg2cfunc|))
       (SEQ (LETT |alpha| NIL . #5#)
            (LETT #4# (SPADCALL (QVELT |lg| 1) (QREFELT $ 100)) . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |alpha| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# (|IR2F;cmplex| |alpha| (QVELT |lg| 2) $) . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 42)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 43)))))))) 

(DEFUN |IR2F;mkRealFunc| (|l| $)
  (PROG (|ans| #1=#:G238 |lg|)
    (RETURN
     (SEQ (LETT |ans| NIL . #2=(|IR2F;mkRealFunc|))
          (SEQ (LETT |lg| NIL . #2#) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |lg| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ans|
                       (|IR2F;pairsum| |ans|
                        (|IR2F;pairprod|
                         (SPADCALL (QVELT |lg| 0) (QREFELT $ 41))
                         (|IR2F;lg2func| |lg| $) $)
                        $)
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |IR2F;linear| (|p| |lg| $)
  (PROG (|alpha|)
    (RETURN
     (SEQ
      (LETT |alpha|
            (SPADCALL
             (SPADCALL (SPADCALL |p| 0 (QREFELT $ 48))
                       (SPADCALL |p| 1 (QREFELT $ 48)) (QREFELT $ 56))
             (QREFELT $ 60))
            |IR2F;linear|)
      (EXIT
       (SPADCALL |alpha|
                 (SPADCALL (SPADCALL |lg| |alpha| (QREFELT $ 9))
                           (QREFELT $ 10))
                 (QREFELT $ 11))))))) 

(DEFUN |IR2F;quadeval| (|p| |a| |b| |delta| $)
  (PROG (|ai| |bi| |temp| |d| |c| #1=#:G247 |i| |v|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 101))
        (CONS (|spadConstant| $ 43) (|spadConstant| $ 43)))
       ('T
        (SEQ
         (LETT |bi|
               (LETT |c|
                     (LETT |d| (|spadConstant| $ 43) . #2=(|IR2F;quadeval|))
                     . #2#)
               . #2#)
         (LETT |ai| (|spadConstant| $ 46) . #2#)
         (LETT |v|
               (SPADCALL |p| (+ 1 (SPADCALL |p| (QREFELT $ 85)))
                         (QREFELT $ 103))
               . #2#)
         (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 104)) . #2#)
              (LETT #1# (QVSIZE |v|) . #2#) G190 (COND ((> |i| #1#) (GO G191)))
              (SEQ
               (LETT |c|
                     (SPADCALL |c|
                               (SPADCALL (QAREF1O |v| |i| 1) |ai|
                                         (QREFELT $ 11))
                               (QREFELT $ 42))
                     . #2#)
               (LETT |d|
                     (SPADCALL |d|
                               (SPADCALL (QAREF1O |v| |i| 1) |bi|
                                         (QREFELT $ 11))
                               (QREFELT $ 42))
                     . #2#)
               (LETT |temp|
                     (SPADCALL (SPADCALL |a| |ai| (QREFELT $ 11))
                               (SPADCALL (SPADCALL |b| |bi| (QREFELT $ 11))
                                         |delta| (QREFELT $ 11))
                               (QREFELT $ 42))
                     . #2#)
               (LETT |bi|
                     (SPADCALL (SPADCALL |a| |bi| (QREFELT $ 11))
                               (SPADCALL |b| |ai| (QREFELT $ 11))
                               (QREFELT $ 42))
                     . #2#)
               (EXIT (LETT |ai| |temp| . #2#)))
              (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT (CONS |c| |d|))))))))) 

(DEFUN |IR2F;compatible?| (|lx| |ly| $)
  (PROG (#1=#:G252 #2=#:G256 |s| #3=#:G258 |y| #4=#:G257 |x|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |ly|) 'T)
             ('T
              (SEQ
               (SEQ (LETT |x| NIL . #5=(|IR2F;compatible?|))
                    (LETT #4# |lx| . #5#) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |y| NIL . #5#) (LETT #3# |ly| . #5#) G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |y| (CAR #3#) . #5#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |s|
                                  (SPADCALL (SPADCALL |x| |y| (QREFELT $ 11))
                                            (QREFELT $ 107))
                                  . #5#)
                            (EXIT
                             (COND
                              ((QEQCAR |s| 0)
                               (COND
                                ((< (QCDR |s|) 0)
                                 (PROGN
                                  (LETT #1#
                                        (PROGN (LETT #2# 'NIL . #5#) (GO #2#))
                                        . #5#)
                                  (GO #1#))))))))
                           (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                           (EXIT NIL)))
                     #1# (EXIT #1#))
                    (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
               (EXIT 'T)))))
      #2# (EXIT #2#))))) 

(DEFUN |IR2F;pairsum| (|lx| |ly| $)
  (PROG (|l| |ln| #1=#:G268 |y| #2=#:G267 |ls| #3=#:G266 |x|)
    (RETURN
     (SEQ
      (COND ((NULL |lx|) |ly|) ((NULL |ly|) |lx|)
            ('T
             (SEQ (LETT |l| NIL . #4=(|IR2F;pairsum|))
                  (SEQ (LETT |x| NIL . #4#) (LETT #3# |lx| . #4#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                         (GO G191)))
                       (SEQ (LETT |ls| (|IR2F;evenRoots| |x| $) . #4#)
                            (EXIT
                             (COND
                              ((NULL
                                (NULL
                                 (LETT |ln|
                                       (PROGN
                                        (LETT #2# NIL . #4#)
                                        (SEQ (LETT |y| NIL . #4#)
                                             (LETT #1# |ly| . #4#) G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |y| (CAR #1#) . #4#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((|IR2F;compatible?| |ls|
                                                  (|IR2F;evenRoots| |y| $) $)
                                                 (LETT #2#
                                                       (CONS
                                                        (SPADCALL |x| |y|
                                                                  (QREFELT $
                                                                           42))
                                                        #2#)
                                                       . #4#)))))
                                             (LETT #1# (CDR #1#) . #4#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #2#))))
                                       . #4#)))
                               (LETT |l|
                                     (SPADCALL
                                      (SPADCALL |l| |ln| (QREFELT $ 108))
                                      (QREFELT $ 109))
                                     . #4#)))))
                       (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT |l|)))))))) 

(DEFUN |IR2F;insqrt| (|y| $)
  (PROG (|s| |rec|)
    (RETURN
     (SEQ (LETT |rec| (SPADCALL |y| 2 (QREFELT $ 112)) . #1=(|IR2F;insqrt|))
          (EXIT
           (COND
            ((EQL (QVELT |rec| 0) 1)
             (CONS
              (CONS (SPADCALL (QVELT |rec| 1) (QVELT |rec| 2) (QREFELT $ 11))
                    (|spadConstant| $ 46))
              1))
            ((SPADCALL (QVELT |rec| 0) 2 (QREFELT $ 113))
             (|error| "Should not happen"))
            (#2='T
             (CONS (CONS (QVELT |rec| 1) (QVELT |rec| 2))
                   (SEQ
                    (LETT |s| (SPADCALL (QVELT |rec| 2) (QREFELT $ 107)) . #1#)
                    (EXIT (COND ((QEQCAR |s| 1) 0) (#2# (QCDR |s|))))))))))))) 

(DEFUN |IR2F;nlogs| (|lg| $)
  (PROG (#1=#:G284 |f| #2=#:G283)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|IR2F;nlogs|))
       (SEQ (LETT |f| NIL . #3#)
            (LETT #1#
                  (SPADCALL
                   (SPADCALL (SPADCALL (QVELT |lg| 1) (QREFELT $ 114))
                             (QREFELT $ 117))
                   (QREFELT $ 120))
                  . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS
                     (VECTOR
                      (SPADCALL (QCDR |f|) (QVELT |lg| 0) (QREFELT $ 121))
                      (QCAR |f|) (QVELT |lg| 2))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DECLAIM (NOTINLINE |IntegrationResultToFunction;|)) 

(DEFUN |IntegrationResultToFunction| (&REST #1=#:G285)
  (PROG ()
    (RETURN
     (PROG (#2=#:G286)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|IntegrationResultToFunction|)
                                           '|domainEqualList|)
                . #3=(|IntegrationResultToFunction|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |IntegrationResultToFunction;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|IntegrationResultToFunction|))))))))))) 

(DEFUN |IntegrationResultToFunction;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|IntegrationResultToFunction|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|IntegrationResultToFunction| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 122) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|IntegrationResultToFunction|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|IntegrationResultToFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SparseUnivariatePolynomial| 7) (0 . |elt|) (6 . |log|) (11 . *)
              (|IntegrationResult| 7) (17 . |ratpart|)
              (|Record| (|:| |integrand| 7) (|:| |intvar| 7)) (|List| 14)
              (22 . |notelem|)
              (|Record| (|:| |scalar| 40) (|:| |coeff| 8) (|:| |logand| 8))
              (|List| 17) (27 . |mkAnswer|) (34 . |retract|) (|List| 80)
              (39 . |tower|) (|Boolean|) (|Symbol|) (|Kernel| 7) (44 . |is?|)
              (|List| 7) (50 . |argument|) (55 . |second|) (|Integer|)
              (60 . |retract|) (65 . |even?|) (|List| 24) (70 . |variables|)
              |IR2F;split;2Ir;6| (75 . |logpart|) |IR2F;expand;IrL;5|
              (|List| $) (80 . |concat|) (|Fraction| 30) (85 . |coerce|)
              (90 . +) (96 . |Zero|) |IR2F;complexExpand;IrF;7| (100 . |One|)
              (104 . |One|) (|NonNegativeInteger|) (108 . |coefficient|)
              (|PositiveInteger|) (114 . ^) (120 . *) (126 . |Zero|) (130 . -)
              (136 . |zero?|) (141 . |monomial|) (147 . /) (153 . |coerce|)
              (158 . +) (164 . |inv|) (169 . -) (174 . |sqrt|)
              (|AlgebraicManipulations| 6 7) (179 . |rootSimp|) (184 . <=)
              (190 . |kernels|) (|List| 25) (195 . |setUnion|) (201 . >)
              (|Union| 40 '"failed") (207 . |retractIfCan|) (212 . |atan|)
              (|SparseMultivariatePolynomial| 6 80) (217 . |numer|)
              (|SparseMultivariatePolynomial| 6 25) (222 . |variables|)
              (227 . |denom|) (232 . |setDifference|) (238 . |max|)
              (|Fraction| 95) (|Kernel| $) (244 . |univariate|) (|Fraction| 8)
              (250 . |numer|) (255 . |coerce|) (260 . |degree|) (265 . -)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (270 . |extendedEuclidean|) (|Union| 7 '"failed")
              (276 . |retractIfCan|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (281 . |divide|) (287 . *) (293 . |reductum|)
              (|SparseUnivariatePolynomial| $) (298 . |zeroOf|) (303 . -)
              (|Union| $ '"failed") (309 . |exquo|) (315 . |zerosOf|)
              (320 . |zero?|) (|Vector| 7) (325 . |vectorise|)
              (331 . |minIndex|) (|Union| 30 '"failed")
              (|ElementaryFunctionSign| 6 7) (336 . |sign|) (341 . |concat|)
              (347 . |removeDuplicates|)
              (|Record| (|:| |exponent| 47) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 25) 25 6 74 7)
              (352 . |froot|) (358 . ~=) (364 . |primitivePart|) (|Factored| 8)
              (|FunctionSpaceUnivariatePolynomialFactor| 6 7 8)
              (369 . |ffactor|) (|Record| (|:| |factor| 8) (|:| |exponent| 30))
              (|List| 118) (374 . |factors|) (379 . *))
           '#(|split| 385 |expand| 390 |complexExpand| 395) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 121
                                                 '(2 8 7 0 7 9 1 7 0 0 10 2 7 0
                                                   0 0 11 1 12 7 0 13 1 12 15 0
                                                   16 3 12 0 7 18 15 19 1 12 7
                                                   0 20 1 7 21 0 22 2 25 23 0
                                                   24 26 1 25 27 0 28 1 27 7 0
                                                   29 1 7 30 0 31 1 30 23 0 32
                                                   1 7 33 0 34 1 12 18 0 36 1
                                                   18 0 38 39 1 7 0 40 41 2 7 0
                                                   0 0 42 0 7 0 43 0 6 0 45 0 7
                                                   0 46 2 8 7 0 47 48 2 7 0 0
                                                   49 50 2 7 0 49 0 51 0 6 0 52
                                                   2 7 0 0 0 53 1 7 23 0 54 2 8
                                                   0 7 47 55 2 7 0 0 0 56 1 8 0
                                                   7 57 2 8 0 0 0 58 1 7 0 0 59
                                                   1 7 0 0 60 1 7 0 0 61 1 62 7
                                                   7 63 2 30 23 0 0 64 1 7 21 0
                                                   65 2 66 0 0 0 67 2 30 23 0 0
                                                   68 1 7 69 0 70 1 7 0 0 71 1
                                                   7 72 0 73 1 74 66 0 75 1 7
                                                   72 0 76 2 66 0 0 0 77 2 25 0
                                                   0 0 78 2 7 79 0 80 81 1 82 8
                                                   0 83 1 7 0 80 84 1 8 47 0 85
                                                   1 8 0 0 86 2 8 87 0 0 88 1 8
                                                   89 0 90 2 8 91 0 0 92 2 8 0
                                                   0 0 93 1 8 0 0 94 1 7 0 95
                                                   96 2 8 0 0 0 97 2 8 98 0 0
                                                   99 1 7 38 95 100 1 8 23 0
                                                   101 2 8 102 0 47 103 1 102
                                                   30 0 104 1 106 105 7 107 2
                                                   27 0 0 0 108 1 27 0 0 109 2
                                                   111 110 7 47 112 2 47 23 0 0
                                                   113 1 8 0 0 114 1 116 115 8
                                                   117 1 115 119 0 120 2 40 0
                                                   30 0 121 1 0 12 12 35 1 0 27
                                                   12 37 1 0 7 12 44)))))
           '|lookupComplete|)) 
