
(/VERSIONCHECK 2) 

(DEFUN |EFUPXS;nthRootIfCan;UPXSNniU;1| (|upxs| |n| $)
  (PROG (|ulsRoot| |uls| |coef| |deg| |r|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 1) (CONS 0 |upxs|))
            (#1='T
             (SEQ
              (LETT |r| (SPADCALL |upxs| (QREFELT $ 14))
                    . #2=(|EFUPXS;nthRootIfCan;UPXSNniU;1|))
              (LETT |uls| (SPADCALL |upxs| (QREFELT $ 15)) . #2#)
              (LETT |deg| (SPADCALL |uls| (QREFELT $ 17)) . #2#)
              (COND
               ((SPADCALL
                 (LETT |coef| (SPADCALL |uls| |deg| (QREFELT $ 18)) . #2#)
                 (QREFELT $ 20))
                (SEQ
                 (LETT |deg| (SPADCALL |uls| (+ |deg| 1000) (QREFELT $ 21))
                       . #2#)
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LETT |coef| (SPADCALL |uls| |deg| (QREFELT $ 18)) . #2#)
                     (QREFELT $ 20))
                    (|error|
                     "root of series with many leading zero coefficients")))))))
              (LETT |uls|
                    (SPADCALL |uls|
                              (SPADCALL (|spadConstant| $ 11) (- |deg|)
                                        (QREFELT $ 22))
                              (QREFELT $ 23))
                    . #2#)
              (LETT |ulsRoot| (SPADCALL |uls| |n| (QREFELT $ 26)) . #2#)
              (EXIT
               (COND ((QEQCAR |ulsRoot| 1) (CONS 1 "failed"))
                     (#1#
                      (CONS 0
                            (SPADCALL
                             (SPADCALL |r| (QCDR |ulsRoot|) (QREFELT $ 27))
                             (SPADCALL (|spadConstant| $ 11)
                                       (SPADCALL
                                        (SPADCALL |deg| |r| (QREFELT $ 28))
                                        (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                                                  (QREFELT $ 30))
                                        (QREFELT $ 31))
                                       (QREFELT $ 32))
                             (QREFELT $ 33))))))))))))) 

(DEFUN |EFUPXS;^;UPXSFUPXS;2| (|upxs| |q| $)
  (PROG (|ulsPow| |coef| |deg| |uls| |r| |den| |num|)
    (RETURN
     (SEQ
      (LETT |num| (SPADCALL |q| (QREFELT $ 36)) . #1=(|EFUPXS;^;UPXSFUPXS;2|))
      (LETT |den| (SPADCALL |q| (QREFELT $ 37)) . #1#)
      (EXIT
       (COND ((EQL |den| 1) (SPADCALL |upxs| |num| (QREFELT $ 38)))
             ('T
              (SEQ (LETT |r| (SPADCALL |upxs| (QREFELT $ 14)) . #1#)
                   (LETT |uls| (SPADCALL |upxs| (QREFELT $ 15)) . #1#)
                   (LETT |deg| (SPADCALL |uls| (QREFELT $ 17)) . #1#)
                   (COND
                    ((SPADCALL
                      (LETT |coef| (SPADCALL |uls| |deg| (QREFELT $ 18)) . #1#)
                      (QREFELT $ 20))
                     (SEQ
                      (LETT |deg|
                            (SPADCALL |uls| (+ |deg| 1000) (QREFELT $ 21))
                            . #1#)
                      (EXIT
                       (COND
                        ((SPADCALL
                          (LETT |coef| (SPADCALL |uls| |deg| (QREFELT $ 18))
                                . #1#)
                          (QREFELT $ 20))
                         (|error|
                          "power of series with many leading zero coefficients")))))))
                   (LETT |ulsPow|
                         (SPADCALL
                          (SPADCALL |uls|
                                    (SPADCALL (|spadConstant| $ 11) (- |deg|)
                                              (QREFELT $ 22))
                                    (QREFELT $ 23))
                          |q| (QREFELT $ 39))
                         . #1#)
                   (EXIT
                    (SPADCALL (SPADCALL |r| |ulsPow| (QREFELT $ 27))
                              (SPADCALL (|spadConstant| $ 11)
                                        (SPADCALL
                                         (SPADCALL |deg| |q| (QREFELT $ 28))
                                         |r| (QREFELT $ 31))
                                        (QREFELT $ 32))
                              (QREFELT $ 33))))))))))) 

(DEFUN |EFUPXS;applyIfCan| (|fcn| |upxs| $)
  (PROG (|uls|)
    (RETURN
     (SEQ
      (LETT |uls| (SPADCALL (SPADCALL |upxs| (QREFELT $ 15)) |fcn|)
            |EFUPXS;applyIfCan|)
      (EXIT
       (COND ((QEQCAR |uls| 1) (CONS 1 "failed"))
             ('T
              (CONS 0
                    (SPADCALL (SPADCALL |upxs| (QREFELT $ 14)) (QCDR |uls|)
                              (QREFELT $ 27)))))))))) 

(DEFUN |EFUPXS;expIfCan;UPXSU;4| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 41) |upxs| $)) 

(DEFUN |EFUPXS;logIfCan;UPXSU;5| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 43) |upxs| $)) 

(DEFUN |EFUPXS;sinIfCan;UPXSU;6| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 45) |upxs| $)) 

(DEFUN |EFUPXS;cosIfCan;UPXSU;7| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 47) |upxs| $)) 

(DEFUN |EFUPXS;tanIfCan;UPXSU;8| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 49) |upxs| $)) 

(DEFUN |EFUPXS;cotIfCan;UPXSU;9| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 51) |upxs| $)) 

(DEFUN |EFUPXS;secIfCan;UPXSU;10| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 53) |upxs| $)) 

(DEFUN |EFUPXS;cscIfCan;UPXSU;11| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 55) |upxs| $)) 

(DEFUN |EFUPXS;atanIfCan;UPXSU;12| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 57) |upxs| $)) 

(DEFUN |EFUPXS;acotIfCan;UPXSU;13| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 59) |upxs| $)) 

(DEFUN |EFUPXS;sinhIfCan;UPXSU;14| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 61) |upxs| $)) 

(DEFUN |EFUPXS;coshIfCan;UPXSU;15| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 63) |upxs| $)) 

(DEFUN |EFUPXS;tanhIfCan;UPXSU;16| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 65) |upxs| $)) 

(DEFUN |EFUPXS;cothIfCan;UPXSU;17| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 67) |upxs| $)) 

(DEFUN |EFUPXS;sechIfCan;UPXSU;18| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 69) |upxs| $)) 

(DEFUN |EFUPXS;cschIfCan;UPXSU;19| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 71) |upxs| $)) 

(DEFUN |EFUPXS;asinhIfCan;UPXSU;20| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 73) |upxs| $)) 

(DEFUN |EFUPXS;acoshIfCan;UPXSU;21| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 75) |upxs| $)) 

(DEFUN |EFUPXS;atanhIfCan;UPXSU;22| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 77) |upxs| $)) 

(DEFUN |EFUPXS;acothIfCan;UPXSU;23| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 79) |upxs| $)) 

(DEFUN |EFUPXS;asechIfCan;UPXSU;24| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 81) |upxs| $)) 

(DEFUN |EFUPXS;acschIfCan;UPXSU;25| (|upxs| $)
  (|EFUPXS;applyIfCan| (ELT $ 83) |upxs| $)) 

(DEFUN |EFUPXS;asinIfCan;UPXSU;26| (|upxs| $)
  (PROG (|cc| |coef|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |upxs| (|spadConstant| $ 87) (QREFELT $ 88))
                  (|spadConstant| $ 87) (QREFELT $ 89))
        (CONS 1 "failed"))
       (#1='T
        (SEQ
         (LETT |coef| (SPADCALL |upxs| (|spadConstant| $ 87) (QREFELT $ 90))
               . #2=(|EFUPXS;asinIfCan;UPXSU;26|))
         (EXIT
          (COND
           ((SPADCALL |coef| (|spadConstant| $ 85) (QREFELT $ 91))
            (CONS 0
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 92)
                               (SPADCALL |upxs| |upxs| (QREFELT $ 33))
                               (QREFELT $ 93))
                     (SPADCALL (SPADCALL 1 2 (QREFELT $ 94)) (QREFELT $ 95))
                     (QREFELT $ 96))
                    (SPADCALL |upxs| (QREFELT $ 97)) (QREFELT $ 33))
                   (QREFELT $ 98))))
           ((QREFELT $ 10)
            (SEQ
             (LETT |cc|
                   (SPADCALL (SPADCALL |coef| (QREFELT $ 99)) (QREFELT $ 100))
                   . #2#)
             (EXIT
              (CONS 0
                    (SPADCALL |cc|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 92)
                                           (SPADCALL |upxs| |upxs|
                                                     (QREFELT $ 33))
                                           (QREFELT $ 93))
                                 (SPADCALL (SPADCALL 1 2 (QREFELT $ 94))
                                           (QREFELT $ 95))
                                 (QREFELT $ 96))
                                (SPADCALL |upxs| (QREFELT $ 97))
                                (QREFELT $ 33))
                               (QREFELT $ 98))
                              (QREFELT $ 101))))))
           (#1# (CONS 1 "failed"))))))))))) 

(DEFUN |EFUPXS;acosIfCan;UPXSU;27| (|upxs| $)
  (PROG (|cc|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (SPADCALL (SPADCALL |upxs| (|spadConstant| $ 87) (QREFELT $ 88))
                   (|spadConstant| $ 87) (QREFELT $ 89))
         (NULL (QREFELT $ 10)))
        (CONS 1 "failed"))
       ('T
        (SEQ
         (LETT |cc|
               (SPADCALL
                (SPADCALL
                 (SPADCALL |upxs| (|spadConstant| $ 87) (QREFELT $ 90))
                 (QREFELT $ 103))
                (QREFELT $ 100))
               |EFUPXS;acosIfCan;UPXSU;27|)
         (EXIT
          (CONS 0
                (SPADCALL |cc|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 92)
                                        (SPADCALL |upxs| |upxs| (QREFELT $ 33))
                                        (QREFELT $ 93))
                              (SPADCALL (SPADCALL 1 2 (QREFELT $ 94))
                                        (QREFELT $ 95))
                              (QREFELT $ 96))
                             (SPADCALL |upxs| (QREFELT $ 97)) (QREFELT $ 33))
                            (QREFELT $ 104))
                           (QREFELT $ 98))
                          (QREFELT $ 101))))))))))) 

(DEFUN |EFUPXS;asecIfCan;UPXSU;28| (|upxs| $)
  (PROG (|rec| |f| |cc|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (SPADCALL (SPADCALL |upxs| (|spadConstant| $ 87) (QREFELT $ 88))
                   (|spadConstant| $ 87) (QREFELT $ 89))
         (NULL (QREFELT $ 10)))
        (CONS 1 "failed"))
       ('T
        (SEQ
         (LETT |cc|
               (SPADCALL
                (SPADCALL
                 (SPADCALL |upxs| (|spadConstant| $ 87) (QREFELT $ 90))
                 (QREFELT $ 106))
                (QREFELT $ 100))
               . #1=(|EFUPXS;asecIfCan;UPXSU;28|))
         (LETT |f|
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |upxs| |upxs| (QREFELT $ 33))
                           (|spadConstant| $ 92) (QREFELT $ 93))
                 (SPADCALL (SPADCALL 1 2 (QREFELT $ 94)) (QREFELT $ 95))
                 (QREFELT $ 96))
                (SPADCALL |upxs| (QREFELT $ 97)) (QREFELT $ 33))
               . #1#)
         (LETT |rec| (SPADCALL |upxs| (QREFELT $ 108)) . #1#)
         (EXIT
          (COND ((QEQCAR |rec| 1) (CONS 1 "failed"))
                ('T
                 (CONS 0
                       (SPADCALL |cc|
                                 (SPADCALL
                                  (SPADCALL |f| (QCDR |rec|) (QREFELT $ 33))
                                  (QREFELT $ 98))
                                 (QREFELT $ 101))))))))))))) 

(DEFUN |EFUPXS;acscIfCan;UPXSU;29| (|upxs| $)
  (PROG (|rec| |f| |cc|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (SPADCALL (SPADCALL |upxs| (|spadConstant| $ 87) (QREFELT $ 88))
                   (|spadConstant| $ 87) (QREFELT $ 89))
         (NULL (QREFELT $ 10)))
        (CONS 1 "failed"))
       ('T
        (SEQ
         (LETT |cc|
               (SPADCALL
                (SPADCALL
                 (SPADCALL |upxs| (|spadConstant| $ 87) (QREFELT $ 90))
                 (QREFELT $ 110))
                (QREFELT $ 100))
               . #1=(|EFUPXS;acscIfCan;UPXSU;29|))
         (LETT |f|
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |upxs| |upxs| (QREFELT $ 33))
                            (|spadConstant| $ 92) (QREFELT $ 93))
                  (SPADCALL (SPADCALL 1 2 (QREFELT $ 94)) (QREFELT $ 95))
                  (QREFELT $ 96))
                 (SPADCALL |upxs| (QREFELT $ 97)) (QREFELT $ 33))
                (QREFELT $ 104))
               . #1#)
         (LETT |rec| (SPADCALL |upxs| (QREFELT $ 108)) . #1#)
         (EXIT
          (COND ((QEQCAR |rec| 1) (CONS 1 "failed"))
                ('T
                 (CONS 0
                       (SPADCALL |cc|
                                 (SPADCALL
                                  (SPADCALL |f| (QCDR |rec|) (QREFELT $ 33))
                                  (QREFELT $ 98))
                                 (QREFELT $ 101))))))))))))) 

(DEFUN |EFUPXS;asinhIfCan;UPXSU;30| (|upxs| $)
  (COND
   ((OR
     (SPADCALL (SPADCALL |upxs| (|spadConstant| $ 87) (QREFELT $ 88))
               (|spadConstant| $ 87) (QREFELT $ 89))
     (NULL
      (OR (QREFELT $ 10)
          (SPADCALL (SPADCALL |upxs| (|spadConstant| $ 87) (QREFELT $ 90))
                    (|spadConstant| $ 85) (QREFELT $ 91)))))
    (CONS 1 "failed"))
   ('T
    (CONS 0
          (SPADCALL
           (SPADCALL |upxs|
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 92)
                                (SPADCALL |upxs| |upxs| (QREFELT $ 33))
                                (QREFELT $ 101))
                      (SPADCALL 1 2 (QREFELT $ 94)) (QREFELT $ 96))
                     (QREFELT $ 101))
           (QREFELT $ 112)))))) 

(DEFUN |EFUPXS;acoshIfCan;UPXSU;31| (|upxs| $)
  (COND
   ((QREFELT $ 10)
    (COND
     ((SPADCALL (SPADCALL |upxs| (|spadConstant| $ 87) (QREFELT $ 88))
                (|spadConstant| $ 87) (QREFELT $ 89))
      (CONS 1 "failed"))
     (#1='T
      (CONS 0
            (SPADCALL
             (SPADCALL |upxs|
                       (SPADCALL
                        (SPADCALL (SPADCALL |upxs| |upxs| (QREFELT $ 33))
                                  (|spadConstant| $ 92) (QREFELT $ 93))
                        (SPADCALL 1 2 (QREFELT $ 94)) (QREFELT $ 96))
                       (QREFELT $ 101))
             (QREFELT $ 112))))))
   (#1# (CONS 1 "failed")))) 

(DEFUN |EFUPXS;asechIfCan;UPXSU;32| (|upxs| $)
  (PROG (|rec|)
    (RETURN
     (SEQ
      (COND
       ((QREFELT $ 10)
        (COND
         ((SPADCALL (SPADCALL |upxs| (|spadConstant| $ 87) (QREFELT $ 88))
                    (|spadConstant| $ 87) (QREFELT $ 89))
          (CONS 1 "failed"))
         (#1='T
          (SEQ
           (LETT |rec| (SPADCALL |upxs| (QREFELT $ 108))
                 |EFUPXS;asechIfCan;UPXSU;32|)
           (EXIT
            (COND ((QEQCAR |rec| 1) (CONS 1 "failed"))
                  (#1#
                   (CONS 0
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 92)
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 92)
                                                (SPADCALL |upxs| |upxs|
                                                          (QREFELT $ 33))
                                                (QREFELT $ 93))
                                      (SPADCALL 1 2 (QREFELT $ 94))
                                      (QREFELT $ 114))
                                     (QREFELT $ 101))
                           (QCDR |rec|) (QREFELT $ 33))
                          (QREFELT $ 112))))))))))
       (#1# (CONS 1 "failed"))))))) 

(DEFUN |EFUPXS;acschIfCan;UPXSU;33| (|upxs| $)
  (PROG (|rec|)
    (RETURN
     (SEQ
      (COND
       ((QREFELT $ 10)
        (COND
         ((SPADCALL (SPADCALL |upxs| (|spadConstant| $ 87) (QREFELT $ 88))
                    (|spadConstant| $ 87) (QREFELT $ 89))
          (CONS 1 "failed"))
         (#1='T
          (SEQ
           (LETT |rec| (SPADCALL |upxs| (QREFELT $ 108))
                 |EFUPXS;acschIfCan;UPXSU;33|)
           (EXIT
            (COND ((QEQCAR |rec| 1) (CONS 1 "failed"))
                  (#1#
                   (CONS 0
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 92)
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 92)
                                                (SPADCALL |upxs| |upxs|
                                                          (QREFELT $ 33))
                                                (QREFELT $ 101))
                                      (SPADCALL 1 2 (QREFELT $ 94))
                                      (QREFELT $ 114))
                                     (QREFELT $ 101))
                           (QCDR |rec|) (QREFELT $ 33))
                          (QREFELT $ 112))))))))))
       (#1# (CONS 1 "failed"))))))) 

(DEFUN |EFUPXS;applyOrError| (|fcn| |name| |upxs| $)
  (PROG (|ans|)
    (RETURN
     (SEQ (LETT |ans| (SPADCALL |upxs| |fcn|) |EFUPXS;applyOrError|)
          (EXIT
           (COND
            ((QEQCAR |ans| 1)
             (|error|
              (SPADCALL (STRCONC |name| " of function with singularity")
                        (QREFELT $ 117))))
            ('T (QCDR |ans|)))))))) 

(DEFUN |EFUPXS;exp;2UPXS;35| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 42) "exp" |upxs| $)) 

(DEFUN |EFUPXS;log;2UPXS;36| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 44) "log" |upxs| $)) 

(DEFUN |EFUPXS;sin;2UPXS;37| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 46) "sin" |upxs| $)) 

(DEFUN |EFUPXS;cos;2UPXS;38| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 48) "cos" |upxs| $)) 

(DEFUN |EFUPXS;tan;2UPXS;39| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 50) "tan" |upxs| $)) 

(DEFUN |EFUPXS;cot;2UPXS;40| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 52) "cot" |upxs| $)) 

(DEFUN |EFUPXS;sec;2UPXS;41| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 54) "sec" |upxs| $)) 

(DEFUN |EFUPXS;csc;2UPXS;42| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 56) "csc" |upxs| $)) 

(DEFUN |EFUPXS;asin;2UPXS;43| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 102) "asin" |upxs| $)) 

(DEFUN |EFUPXS;acos;2UPXS;44| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 105) "acos" |upxs| $)) 

(DEFUN |EFUPXS;atan;2UPXS;45| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 58) "atan" |upxs| $)) 

(DEFUN |EFUPXS;acot;2UPXS;46| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 60) "acot" |upxs| $)) 

(DEFUN |EFUPXS;asec;2UPXS;47| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 109) "asec" |upxs| $)) 

(DEFUN |EFUPXS;acsc;2UPXS;48| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 111) "acsc" |upxs| $)) 

(DEFUN |EFUPXS;sinh;2UPXS;49| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 62) "sinh" |upxs| $)) 

(DEFUN |EFUPXS;cosh;2UPXS;50| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 64) "cosh" |upxs| $)) 

(DEFUN |EFUPXS;tanh;2UPXS;51| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 66) "tanh" |upxs| $)) 

(DEFUN |EFUPXS;coth;2UPXS;52| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 68) "coth" |upxs| $)) 

(DEFUN |EFUPXS;sech;2UPXS;53| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 70) "sech" |upxs| $)) 

(DEFUN |EFUPXS;csch;2UPXS;54| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 72) "csch" |upxs| $)) 

(DEFUN |EFUPXS;asinh;2UPXS;55| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 74) "asinh" |upxs| $)) 

(DEFUN |EFUPXS;acosh;2UPXS;56| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 76) "acosh" |upxs| $)) 

(DEFUN |EFUPXS;atanh;2UPXS;57| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 78) "atanh" |upxs| $)) 

(DEFUN |EFUPXS;acoth;2UPXS;58| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 80) "acoth" |upxs| $)) 

(DEFUN |EFUPXS;asech;2UPXS;59| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 82) "asech" |upxs| $)) 

(DEFUN |EFUPXS;acsch;2UPXS;60| (|upxs| $)
  (|EFUPXS;applyOrError| (ELT $ 84) "acsch" |upxs| $)) 

(DECLAIM (NOTINLINE |ElementaryFunctionsUnivariatePuiseuxSeries;|)) 

(DEFUN |ElementaryFunctionsUnivariatePuiseuxSeries| (&REST #1=#:G502)
  (PROG ()
    (RETURN
     (PROG (#2=#:G503)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ElementaryFunctionsUnivariatePuiseuxSeries|)
                                           '|domainEqualList|)
                . #3=(|ElementaryFunctionsUnivariatePuiseuxSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function| |ElementaryFunctionsUnivariatePuiseuxSeries;|)
                   #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|ElementaryFunctionsUnivariatePuiseuxSeries|))))))))))) 

(DEFUN |ElementaryFunctionsUnivariatePuiseuxSeries;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|ElementaryFunctionsUnivariatePuiseuxSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$|
            (LIST '|ElementaryFunctionsUnivariatePuiseuxSeries| DV$1 DV$2 DV$3
                  DV$4)
            . #1#)
      (LETT $ (GETREFV 143) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1| '(|Field|))))
                      . #1#))
      (|haddProp| |$ConstructorCache|
                  '|ElementaryFunctionsUnivariatePuiseuxSeries|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (|HasCategory| |#1| '(|TranscendentalFunctionCategory|)))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 40 (CONS (|dispatchFunction| |EFUPXS;^;UPXSFUPXS;2|) $))))
      $)))) 

(MAKEPROP '|ElementaryFunctionsUnivariatePuiseuxSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) 'TRANSFCN (0 . |One|) (4 . |One|)
              (|Fraction| 16) (8 . |rationalPower|) (13 . |laurentRep|)
              (|Integer|) (18 . |degree|) (23 . |coefficient|) (|Boolean|)
              (29 . |zero?|) (34 . |order|) (40 . |monomial|) (46 . *)
              (|Union| 7 '#1="failed") (|NonNegativeInteger|)
              (52 . |nthRootIfCan|) (58 . |puiseux|) (64 . *) (70 . |coerce|)
              (75 . |inv|) (80 . *) (86 . |monomial|) (92 . *) (|Union| 8 '#1#)
              |EFUPXS;nthRootIfCan;UPXSNniU;1| (98 . |numer|) (103 . |denom|)
              (108 . ^) (114 . ^) (120 . ^) (126 . |expIfCan|)
              |EFUPXS;expIfCan;UPXSU;4| (131 . |logIfCan|)
              |EFUPXS;logIfCan;UPXSU;5| (136 . |sinIfCan|)
              |EFUPXS;sinIfCan;UPXSU;6| (141 . |cosIfCan|)
              |EFUPXS;cosIfCan;UPXSU;7| (146 . |tanIfCan|)
              |EFUPXS;tanIfCan;UPXSU;8| (151 . |cotIfCan|)
              |EFUPXS;cotIfCan;UPXSU;9| (156 . |secIfCan|)
              |EFUPXS;secIfCan;UPXSU;10| (161 . |cscIfCan|)
              |EFUPXS;cscIfCan;UPXSU;11| (166 . |atanIfCan|)
              |EFUPXS;atanIfCan;UPXSU;12| (171 . |acotIfCan|)
              |EFUPXS;acotIfCan;UPXSU;13| (176 . |sinhIfCan|)
              |EFUPXS;sinhIfCan;UPXSU;14| (181 . |coshIfCan|)
              |EFUPXS;coshIfCan;UPXSU;15| (186 . |tanhIfCan|)
              |EFUPXS;tanhIfCan;UPXSU;16| (191 . |cothIfCan|)
              |EFUPXS;cothIfCan;UPXSU;17| (196 . |sechIfCan|)
              |EFUPXS;sechIfCan;UPXSU;18| (201 . |cschIfCan|)
              |EFUPXS;cschIfCan;UPXSU;19| (206 . |asinhIfCan|)
              |EFUPXS;asinhIfCan;UPXSU;30| (211 . |acoshIfCan|)
              |EFUPXS;acoshIfCan;UPXSU;31| (216 . |atanhIfCan|)
              |EFUPXS;atanhIfCan;UPXSU;22| (221 . |acothIfCan|)
              |EFUPXS;acothIfCan;UPXSU;23| (226 . |asechIfCan|)
              |EFUPXS;asechIfCan;UPXSU;32| (231 . |acschIfCan|)
              |EFUPXS;acschIfCan;UPXSU;33| (236 . |Zero|) (240 . |Zero|)
              (244 . |Zero|) (248 . |order|) (254 . <) (260 . |coefficient|)
              (266 . =) (272 . |One|) (276 . -) (282 . /) (288 . -) (293 . ^)
              (299 . |differentiate|) (304 . |integrate|) (309 . |asin|)
              (314 . |coerce|) (319 . +) |EFUPXS;asinIfCan;UPXSU;26|
              (325 . |acos|) (330 . -) |EFUPXS;acosIfCan;UPXSU;27|
              (335 . |asec|) (|Union| $ '"failed") (340 . |recip|)
              |EFUPXS;asecIfCan;UPXSU;28| (345 . |acsc|)
              |EFUPXS;acscIfCan;UPXSU;29| |EFUPXS;log;2UPXS;36| (350 . |One|)
              (354 . *) (|OutputForm|) (|String|) (360 . |coerce|)
              |EFUPXS;exp;2UPXS;35| |EFUPXS;sin;2UPXS;37| |EFUPXS;cos;2UPXS;38|
              |EFUPXS;tan;2UPXS;39| |EFUPXS;cot;2UPXS;40| |EFUPXS;sec;2UPXS;41|
              |EFUPXS;csc;2UPXS;42| |EFUPXS;asin;2UPXS;43|
              |EFUPXS;acos;2UPXS;44| |EFUPXS;atan;2UPXS;45|
              |EFUPXS;acot;2UPXS;46| |EFUPXS;asec;2UPXS;47|
              |EFUPXS;acsc;2UPXS;48| |EFUPXS;sinh;2UPXS;49|
              |EFUPXS;cosh;2UPXS;50| |EFUPXS;tanh;2UPXS;51|
              |EFUPXS;coth;2UPXS;52| |EFUPXS;sech;2UPXS;53|
              |EFUPXS;csch;2UPXS;54| |EFUPXS;asinh;2UPXS;55|
              |EFUPXS;acosh;2UPXS;56| |EFUPXS;atanh;2UPXS;57|
              |EFUPXS;acoth;2UPXS;58| |EFUPXS;asech;2UPXS;59|
              |EFUPXS;acsch;2UPXS;60|)
           '#(|tanhIfCan| 365 |tanh| 370 |tanIfCan| 375 |tan| 380 |sinhIfCan|
              385 |sinh| 390 |sinIfCan| 395 |sin| 400 |sechIfCan| 405 |sech|
              410 |secIfCan| 415 |sec| 420 |nthRootIfCan| 425 |logIfCan| 431
              |log| 436 |expIfCan| 441 |exp| 446 |cschIfCan| 451 |csch| 456
              |cscIfCan| 461 |csc| 466 |cothIfCan| 471 |coth| 476 |cotIfCan|
              481 |cot| 486 |coshIfCan| 491 |cosh| 496 |cosIfCan| 501 |cos| 506
              |atanhIfCan| 511 |atanh| 516 |atanIfCan| 521 |atan| 526
              |asinhIfCan| 531 |asinh| 536 |asinIfCan| 541 |asin| 546
              |asechIfCan| 551 |asech| 556 |asecIfCan| 561 |asec| 566
              |acschIfCan| 571 |acsch| 576 |acscIfCan| 581 |acsc| 586
              |acothIfCan| 591 |acoth| 596 |acotIfCan| 601 |acot| 606
              |acoshIfCan| 611 |acosh| 616 |acosIfCan| 621 |acos| 626 ^ 631)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|PartialTranscendentalFunctions| 8))
                             (|makeByteWordVec2| 142
                                                 '(0 6 0 11 0 7 0 12 1 8 13 0
                                                   14 1 8 7 0 15 1 7 16 0 17 2
                                                   7 6 0 16 18 1 6 19 0 20 2 7
                                                   16 0 16 21 2 7 0 6 16 22 2 7
                                                   0 0 0 23 2 9 24 7 25 26 2 8
                                                   0 13 7 27 2 13 0 16 0 28 1
                                                   13 0 16 29 1 13 0 0 30 2 13
                                                   0 0 0 31 2 8 0 6 13 32 2 8 0
                                                   0 0 33 1 13 16 0 36 1 13 16
                                                   0 37 2 8 0 0 16 38 2 7 0 0
                                                   13 39 2 0 8 8 13 40 1 9 24 7
                                                   41 1 9 24 7 43 1 9 24 7 45 1
                                                   9 24 7 47 1 9 24 7 49 1 9 24
                                                   7 51 1 9 24 7 53 1 9 24 7 55
                                                   1 9 24 7 57 1 9 24 7 59 1 9
                                                   24 7 61 1 9 24 7 63 1 9 24 7
                                                   65 1 9 24 7 67 1 9 24 7 69 1
                                                   9 24 7 71 1 9 24 7 73 1 9 24
                                                   7 75 1 9 24 7 77 1 9 24 7 79
                                                   1 9 24 7 81 1 9 24 7 83 0 6
                                                   0 85 0 7 0 86 0 13 0 87 2 8
                                                   13 0 13 88 2 13 19 0 0 89 2
                                                   8 6 0 13 90 2 6 19 0 0 91 0
                                                   8 0 92 2 8 0 0 0 93 2 13 0
                                                   16 16 94 1 13 0 0 95 2 8 0 0
                                                   13 96 1 8 0 0 97 1 8 0 0 98
                                                   1 6 0 0 99 1 8 0 6 100 2 8 0
                                                   0 0 101 1 6 0 0 103 1 8 0 0
                                                   104 1 6 0 0 106 1 8 107 0
                                                   108 1 6 0 0 110 0 13 0 113 2
                                                   8 0 0 13 114 1 116 115 0 117
                                                   1 0 34 8 66 1 0 8 8 133 1 0
                                                   34 8 50 1 0 8 8 121 1 0 34 8
                                                   62 1 0 8 8 131 1 0 34 8 46 1
                                                   0 8 8 119 1 0 34 8 70 1 0 8
                                                   8 135 1 0 34 8 54 1 0 8 8
                                                   123 2 0 34 8 25 35 1 0 34 8
                                                   44 1 0 8 8 112 1 0 34 8 42 1
                                                   0 8 8 118 1 0 34 8 72 1 0 8
                                                   8 136 1 0 34 8 56 1 0 8 8
                                                   124 1 0 34 8 68 1 0 8 8 134
                                                   1 0 34 8 52 1 0 8 8 122 1 0
                                                   34 8 64 1 0 8 8 132 1 0 34 8
                                                   48 1 0 8 8 120 1 0 34 8 78 1
                                                   0 8 8 139 1 0 34 8 58 1 0 8
                                                   8 127 1 0 34 8 74 1 0 8 8
                                                   137 1 0 34 8 102 1 0 8 8 125
                                                   1 0 34 8 82 1 0 8 8 141 1 0
                                                   34 8 109 1 0 8 8 129 1 0 34
                                                   8 84 1 0 8 8 142 1 0 34 8
                                                   111 1 0 8 8 130 1 0 34 8 80
                                                   1 0 8 8 140 1 0 34 8 60 1 0
                                                   8 8 128 1 0 34 8 76 1 0 8 8
                                                   138 1 0 34 8 105 1 0 8 8 126
                                                   2 1 8 8 13 40)))))
           '|lookupComplete|)) 
