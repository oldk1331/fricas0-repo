
(/VERSIONCHECK 2) 

(DEFUN |EFULS;nthRootUTS| (|uts| |n| $)
  (COND
   ((OR
     (SPADCALL (SPADCALL |uts| 0 (QREFELT $ 15)) (|spadConstant| $ 16)
               (QREFELT $ 18))
     (QREFELT $ 9))
    (CONS 0
          (SPADCALL |uts|
                    (SPADCALL (SPADCALL |n| (QREFELT $ 21)) (QREFELT $ 22))
                    (QREFELT $ 23))))
   ('T (CONS 1 "failed")))) 

(DEFUN |EFULS;nthRootIfCan;ULSNniU;2| (|uls| |nn| $)
  (PROG (|root| |uts| |k| |coef| |deg| |n|)
    (RETURN
     (SEQ (LETT |n| |nn| . #1=(|EFULS;nthRootIfCan;ULSNniU;2|))
          (EXIT
           (COND ((< |n| 1) (|error| "nthRootIfCan: n must be positive"))
                 ((EQL |n| 1) (CONS 0 |uls|))
                 (#2='T
                  (SEQ (LETT |deg| (SPADCALL |uls| (QREFELT $ 25)) . #1#)
                       (COND
                        ((SPADCALL
                          (LETT |coef| (SPADCALL |uls| |deg| (QREFELT $ 26))
                                . #1#)
                          (QREFELT $ 27))
                         (SEQ
                          (LETT |uls| (SPADCALL 1000 |uls| (QREFELT $ 28))
                                . #1#)
                          (LETT |deg| (SPADCALL |uls| (QREFELT $ 25)) . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL
                              (LETT |coef|
                                    (SPADCALL |uls| |deg| (QREFELT $ 26))
                                    . #1#)
                              (QREFELT $ 27))
                             (|error|
                              "root of series with many leading zero coefficients")))))))
                       (LETT |k| (SPADCALL |deg| |n| (QREFELT $ 30)) . #1#)
                       (EXIT
                        (COND ((QEQCAR |k| 1) (CONS 1 "failed"))
                              (#2#
                               (SEQ
                                (LETT |uts|
                                      (SPADCALL
                                       (SPADCALL |uls|
                                                 (SPADCALL
                                                  (|spadConstant| $ 16)
                                                  (- |deg|) (QREFELT $ 31))
                                                 (QREFELT $ 32))
                                       (QREFELT $ 33))
                                      . #1#)
                                (LETT |root| (|EFULS;nthRootUTS| |uts| |n| $)
                                      . #1#)
                                (EXIT
                                 (COND ((QEQCAR |root| 1) (CONS 1 "failed"))
                                       (#2#
                                        (CONS 0
                                              (SPADCALL
                                               (SPADCALL (|spadConstant| $ 16)
                                                         (QCDR |k|)
                                                         (QREFELT $ 31))
                                               (SPADCALL (QCDR |root|)
                                                         (QREFELT $ 34))
                                               (QREFELT $ 32)))))))))))))))))) 

(DEFUN |EFULS;^;ULSFULS;3| (|uls| |r| $)
  (PROG (|uts| |k| |coef| |deg| |den| |num|)
    (RETURN
     (SEQ (LETT |num| (SPADCALL |r| (QREFELT $ 37)) . #1=(|EFULS;^;ULSFULS;3|))
          (LETT |den| (SPADCALL |r| (QREFELT $ 38)) . #1#)
          (EXIT
           (COND ((EQL |den| 1) (SPADCALL |uls| |num| (QREFELT $ 39)))
                 (#2='T
                  (SEQ (LETT |deg| (SPADCALL |uls| (QREFELT $ 25)) . #1#)
                       (COND
                        ((SPADCALL
                          (LETT |coef| (SPADCALL |uls| |deg| (QREFELT $ 26))
                                . #1#)
                          (QREFELT $ 27))
                         (SEQ
                          (LETT |uls| (SPADCALL 1000 |uls| (QREFELT $ 28))
                                . #1#)
                          (LETT |deg| (SPADCALL |uls| (QREFELT $ 25)) . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL
                              (LETT |coef|
                                    (SPADCALL |uls| |deg| (QREFELT $ 26))
                                    . #1#)
                              (QREFELT $ 27))
                             (|error|
                              "power of series with many leading zero coefficients")))))))
                       (LETT |k| (SPADCALL |deg| |den| (QREFELT $ 30)) . #1#)
                       (EXIT
                        (COND
                         ((QEQCAR |k| 1)
                          (|error| "^: rational power does not exist"))
                         (#2#
                          (SEQ
                           (LETT |uts|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |uls|
                                             (SPADCALL (|spadConstant| $ 16)
                                                       (- |deg|)
                                                       (QREFELT $ 31))
                                             (QREFELT $ 32))
                                   (QREFELT $ 33))
                                  |r| (QREFELT $ 23))
                                 . #1#)
                           (EXIT
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 16)
                                       (* (QCDR |k|) |num|) (QREFELT $ 31))
                             (SPADCALL |uts| (QREFELT $ 34))
                             (QREFELT $ 32))))))))))))))) 

(DEFUN |EFULS;applyIfCan| (|fcn| |uls| $)
  (PROG (|uts|)
    (RETURN
     (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT $ 42)) |EFULS;applyIfCan|)
          (EXIT
           (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (SPADCALL (SPADCALL (QCDR |uts|) |fcn|)
                                  (QREFELT $ 34)))))))))) 

(DEFUN |EFULS;expIfCan;ULSU;5| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 43) |uls| $)) 

(DEFUN |EFULS;sinIfCan;ULSU;6| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 45) |uls| $)) 

(DEFUN |EFULS;cosIfCan;ULSU;7| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 47) |uls| $)) 

(DEFUN |EFULS;asinIfCan;ULSU;8| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 49) |uls| $)) 

(DEFUN |EFULS;acosIfCan;ULSU;9| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 51) |uls| $)) 

(DEFUN |EFULS;asecIfCan;ULSU;10| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 53) |uls| $)) 

(DEFUN |EFULS;acscIfCan;ULSU;11| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 55) |uls| $)) 

(DEFUN |EFULS;sinhIfCan;ULSU;12| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 57) |uls| $)) 

(DEFUN |EFULS;coshIfCan;ULSU;13| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 59) |uls| $)) 

(DEFUN |EFULS;asinhIfCan;ULSU;14| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 61) |uls| $)) 

(DEFUN |EFULS;acoshIfCan;ULSU;15| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 63) |uls| $)) 

(DEFUN |EFULS;atanhIfCan;ULSU;16| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 65) |uls| $)) 

(DEFUN |EFULS;acothIfCan;ULSU;17| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 67) |uls| $)) 

(DEFUN |EFULS;asechIfCan;ULSU;18| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 69) |uls| $)) 

(DEFUN |EFULS;acschIfCan;ULSU;19| (|uls| $)
  (|EFULS;applyIfCan| (ELT $ 71) |uls| $)) 

(DEFUN |EFULS;logIfCan;ULSU;20| (|uls| $)
  (PROG (|ts| |uts|)
    (RETURN
     (SEQ
      (LETT |uts| (SPADCALL |uls| (QREFELT $ 42))
            . #1=(|EFULS;logIfCan;ULSU;20|))
      (EXIT
       (COND
        ((OR (QEQCAR |uts| 1)
             (SPADCALL
              (SPADCALL (LETT |ts| (QCDR |uts|) . #1#) 0 (QREFELT $ 15))
              (QREFELT $ 27)))
         (CONS 1 "failed"))
        ('T
         (CONS 0
               (SPADCALL (SPADCALL |ts| (QREFELT $ 73)) (QREFELT $ 34)))))))))) 

(DEFUN |EFULS;tanIfCan;ULSU;21| (|uls| $)
  (PROG (|cosInv| |sc| |uts|)
    (RETURN
     (SEQ
      (LETT |uts| (SPADCALL |uls| (QREFELT $ 42))
            . #1=(|EFULS;tanIfCan;ULSU;21|))
      (EXIT
       (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |sc|
                     (SPADCALL (SPADCALL (QCDR |uts|) (QREFELT $ 76))
                               (QREFELT $ 79))
                     . #1#)
               (LETT |cosInv|
                     (SPADCALL
                      (SPADCALL (SPADCALL (QCDR |sc|) (QREFELT $ 80))
                                (QREFELT $ 34))
                      (QREFELT $ 81))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |cosInv| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCAR |sc|) (QREFELT $ 80))
                                        (QREFELT $ 34))
                              (QCDR |cosInv|) (QREFELT $ 32)))))))))))))) 

(DEFUN |EFULS;cotIfCan;ULSU;22| (|uls| $)
  (PROG (|sinInv| |sc| |uts|)
    (RETURN
     (SEQ
      (LETT |uts| (SPADCALL |uls| (QREFELT $ 42))
            . #1=(|EFULS;cotIfCan;ULSU;22|))
      (EXIT
       (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |sc|
                     (SPADCALL (SPADCALL (QCDR |uts|) (QREFELT $ 76))
                               (QREFELT $ 79))
                     . #1#)
               (LETT |sinInv|
                     (SPADCALL
                      (SPADCALL (SPADCALL (QCAR |sc|) (QREFELT $ 80))
                                (QREFELT $ 34))
                      (QREFELT $ 81))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |sinInv| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCDR |sc|) (QREFELT $ 80))
                                        (QREFELT $ 34))
                              (QCDR |sinInv|) (QREFELT $ 32)))))))))))))) 

(DEFUN |EFULS;secIfCan;ULSU;23| (|uls| $)
  (PROG (|cosInv| |cos|)
    (RETURN
     (SEQ
      (LETT |cos| (SPADCALL |uls| (QREFELT $ 48))
            . #1=(|EFULS;secIfCan;ULSU;23|))
      (EXIT
       (COND ((QEQCAR |cos| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ (LETT |cosInv| (SPADCALL (QCDR |cos|) (QREFELT $ 81)) . #1#)
                   (EXIT
                    (COND ((QEQCAR |cosInv| 1) (CONS 1 "failed"))
                          (#2# (CONS 0 (QCDR |cosInv|))))))))))))) 

(DEFUN |EFULS;cscIfCan;ULSU;24| (|uls| $)
  (PROG (|sinInv| |sin|)
    (RETURN
     (SEQ
      (LETT |sin| (SPADCALL |uls| (QREFELT $ 46))
            . #1=(|EFULS;cscIfCan;ULSU;24|))
      (EXIT
       (COND ((QEQCAR |sin| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ (LETT |sinInv| (SPADCALL (QCDR |sin|) (QREFELT $ 81)) . #1#)
                   (EXIT
                    (COND ((QEQCAR |sinInv| 1) (CONS 1 "failed"))
                          (#2# (CONS 0 (QCDR |sinInv|))))))))))))) 

(DEFUN |EFULS;atanIfCan;ULSU;25| (|uls| $)
  (PROG (|z| |cc| #1=#:G279 |rat| |lc| #2=#:G278 |ord| |coef|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (EXIT
         (SEQ
          (LETT |coef| (SPADCALL |uls| 0 (QREFELT $ 26))
                . #3=(|EFULS;atanIfCan;ULSU;25|))
          (SEQ (LETT |ord| (SPADCALL |uls| 0 (QREFELT $ 86)) . #3#)
               (EXIT
                (COND
                 ((EQL |ord| 0)
                  (COND
                   ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 87))
                              (SPADCALL (|spadConstant| $ 16) (QREFELT $ 88))
                              (QREFELT $ 18))
                    (PROGN (LETT #2# (CONS 1 "failed") . #3#) (GO #2#))))))))
          (LETT |cc|
                (COND
                 ((< |ord| 0)
                  (COND
                   ((QREFELT $ 10)
                    (COND
                     ((QREFELT $ 11)
                      (SEQ
                       (LETT |lc| (SPADCALL |uls| |ord| (QREFELT $ 26)) . #3#)
                       (LETT |rat| (SPADCALL |lc| (QREFELT $ 90)) . #3#)
                       (EXIT
                        (COND
                         ((OR (QEQCAR |rat| 1)
                              (SPADCALL (QCDR |rat|) (|spadConstant| $ 94)
                                        (QREFELT $ 95)))
                          (SPADCALL (SPADCALL 1 2 (QREFELT $ 91))
                                    (SPADCALL (QREFELT $ 92)) (QREFELT $ 93)))
                         ('T
                          (SPADCALL
                           (SPADCALL (SPADCALL 1 2 (QREFELT $ 91))
                                     (QREFELT $ 97))
                           (SPADCALL (QREFELT $ 92)) (QREFELT $ 93)))))))
                     (#4='T
                      (SPADCALL (SPADCALL 1 2 (QREFELT $ 91))
                                (SPADCALL (QREFELT $ 92)) (QREFELT $ 93)))))
                   (#4# (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))))
                 ((SPADCALL |coef| (|spadConstant| $ 12) (QREFELT $ 18))
                  (|spadConstant| $ 12))
                 ((QREFELT $ 10) (SPADCALL |coef| (QREFELT $ 98)))
                 (#4# (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#))))
                . #3#)
          (LETT |z|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 96)
                           (SPADCALL |uls| |uls| (QREFELT $ 32))
                           (QREFELT $ 99))
                 (QREFELT $ 81))
                . #3#)
          (EXIT
           (COND ((QEQCAR |z| 1) (CONS 1 "failed"))
                 (#4#
                  (CONS 0
                        (SPADCALL (SPADCALL |cc| (QREFELT $ 100))
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |uls| (QREFELT $ 101))
                                             (QCDR |z|) (QREFELT $ 32))
                                   (QREFELT $ 102))
                                  (QREFELT $ 99))))))))
        #2# (EXIT #2#)))
      #1# (EXIT #1#))))) 

(DEFUN |EFULS;acotIfCan;ULSU;26| (|uls| $)
  (PROG (|z| |cc| #1=#:G290 |rat| |lc| #2=#:G289 |ord| |coef|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (EXIT
         (SEQ
          (LETT |coef| (SPADCALL |uls| 0 (QREFELT $ 26))
                . #3=(|EFULS;acotIfCan;ULSU;26|))
          (SEQ (LETT |ord| (SPADCALL |uls| 0 (QREFELT $ 86)) . #3#)
               (EXIT
                (COND
                 ((EQL |ord| 0)
                  (COND
                   ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 87))
                              (SPADCALL (|spadConstant| $ 16) (QREFELT $ 88))
                              (QREFELT $ 18))
                    (PROGN (LETT #2# (CONS 1 "failed") . #3#) (GO #2#))))))))
          (LETT |cc|
                (COND
                 ((< |ord| 0)
                  (COND
                   ((QREFELT $ 11)
                    (SEQ
                     (LETT |lc| (SPADCALL |uls| |ord| (QREFELT $ 26)) . #3#)
                     (LETT |rat| (SPADCALL |lc| (QREFELT $ 90)) . #3#)
                     (EXIT
                      (COND
                       ((OR (QEQCAR |rat| 1)
                            (SPADCALL (QCDR |rat|) (|spadConstant| $ 94)
                                      (QREFELT $ 95)))
                        (|spadConstant| $ 12))
                       ((QREFELT $ 10) (SPADCALL (QREFELT $ 92)))
                       (#4='T
                        (PROGN
                         (LETT #1# (CONS 1 "failed") . #3#)
                         (GO #1#)))))))
                   (#4# (|spadConstant| $ 12))))
                 ((QREFELT $ 10) (SPADCALL |coef| (QREFELT $ 104)))
                 (#4# (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#))))
                . #3#)
          (LETT |z|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 96)
                           (SPADCALL |uls| |uls| (QREFELT $ 32))
                           (QREFELT $ 99))
                 (QREFELT $ 81))
                . #3#)
          (EXIT
           (COND ((QEQCAR |z| 1) (CONS 1 "failed"))
                 (#4#
                  (CONS 0
                        (SPADCALL (SPADCALL |cc| (QREFELT $ 100))
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |uls| (QREFELT $ 101))
                                             (QCDR |z|) (QREFELT $ 32))
                                   (QREFELT $ 102))
                                  (QREFELT $ 105))))))))
        #2# (EXIT #2#)))
      #1# (EXIT #1#))))) 

(DEFUN |EFULS;tanhIfCan;ULSU;27| (|uls| $)
  (PROG (|coshInv| |sc| |uts|)
    (RETURN
     (SEQ
      (LETT |uts| (SPADCALL |uls| (QREFELT $ 42))
            . #1=(|EFULS;tanhIfCan;ULSU;27|))
      (EXIT
       (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |sc|
                     (SPADCALL (SPADCALL (QCDR |uts|) (QREFELT $ 76))
                               (QREFELT $ 108))
                     . #1#)
               (LETT |coshInv|
                     (SPADCALL
                      (SPADCALL (SPADCALL (QCDR |sc|) (QREFELT $ 80))
                                (QREFELT $ 34))
                      (QREFELT $ 81))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |coshInv| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCAR |sc|) (QREFELT $ 80))
                                        (QREFELT $ 34))
                              (QCDR |coshInv|) (QREFELT $ 32)))))))))))))) 

(DEFUN |EFULS;cothIfCan;ULSU;28| (|uls| $)
  (PROG (|sinhInv| |sc| |uts|)
    (RETURN
     (SEQ
      (LETT |uts| (SPADCALL |uls| (QREFELT $ 42))
            . #1=(|EFULS;cothIfCan;ULSU;28|))
      (EXIT
       (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |sc|
                     (SPADCALL (SPADCALL (QCDR |uts|) (QREFELT $ 76))
                               (QREFELT $ 108))
                     . #1#)
               (LETT |sinhInv|
                     (SPADCALL
                      (SPADCALL (SPADCALL (QCAR |sc|) (QREFELT $ 80))
                                (QREFELT $ 34))
                      (QREFELT $ 81))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |sinhInv| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCDR |sc|) (QREFELT $ 80))
                                        (QREFELT $ 34))
                              (QCDR |sinhInv|) (QREFELT $ 32)))))))))))))) 

(DEFUN |EFULS;sechIfCan;ULSU;29| (|uls| $)
  (PROG (|coshInv| |cosh|)
    (RETURN
     (SEQ
      (LETT |cosh| (SPADCALL |uls| (QREFELT $ 60))
            . #1=(|EFULS;sechIfCan;ULSU;29|))
      (EXIT
       (COND ((QEQCAR |cosh| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |coshInv| (SPADCALL (QCDR |cosh|) (QREFELT $ 81)) . #1#)
               (EXIT
                (COND ((QEQCAR |coshInv| 1) (CONS 1 "failed"))
                      (#2# (CONS 0 (QCDR |coshInv|))))))))))))) 

(DEFUN |EFULS;cschIfCan;ULSU;30| (|uls| $)
  (PROG (|sinhInv| |sinh|)
    (RETURN
     (SEQ
      (LETT |sinh| (SPADCALL |uls| (QREFELT $ 58))
            . #1=(|EFULS;cschIfCan;ULSU;30|))
      (EXIT
       (COND ((QEQCAR |sinh| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |sinhInv| (SPADCALL (QCDR |sinh|) (QREFELT $ 81)) . #1#)
               (EXIT
                (COND ((QEQCAR |sinhInv| 1) (CONS 1 "failed"))
                      (#2# (CONS 0 (QCDR |sinhInv|))))))))))))) 

(DEFUN |EFULS;applyOrError| (|fcn| |name| |uls| $)
  (PROG (|ans|)
    (RETURN
     (SEQ (LETT |ans| (SPADCALL |uls| |fcn|) |EFULS;applyOrError|)
          (EXIT
           (COND
            ((QEQCAR |ans| 1)
             (|error|
              (SPADCALL (STRCONC |name| " of function with singularity")
                        (QREFELT $ 115))))
            ('T (QCDR |ans|)))))))) 

(DEFUN |EFULS;exp;2ULS;32| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 44) "exp" |uls| $)) 

(DEFUN |EFULS;log;2ULS;33| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 74) "log" |uls| $)) 

(DEFUN |EFULS;sin;2ULS;34| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 46) "sin" |uls| $)) 

(DEFUN |EFULS;cos;2ULS;35| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 48) "cos" |uls| $)) 

(DEFUN |EFULS;tan;2ULS;36| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 82) "tan" |uls| $)) 

(DEFUN |EFULS;cot;2ULS;37| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 83) "cot" |uls| $)) 

(DEFUN |EFULS;sec;2ULS;38| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 84) "sec" |uls| $)) 

(DEFUN |EFULS;csc;2ULS;39| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 85) "csc" |uls| $)) 

(DEFUN |EFULS;asin;2ULS;40| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 50) "asin" |uls| $)) 

(DEFUN |EFULS;acos;2ULS;41| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 52) "acos" |uls| $)) 

(DEFUN |EFULS;asec;2ULS;42| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 54) "asec" |uls| $)) 

(DEFUN |EFULS;acsc;2ULS;43| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 56) "acsc" |uls| $)) 

(DEFUN |EFULS;sinh;2ULS;44| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 58) "sinh" |uls| $)) 

(DEFUN |EFULS;cosh;2ULS;45| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 60) "cosh" |uls| $)) 

(DEFUN |EFULS;tanh;2ULS;46| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 109) "tanh" |uls| $)) 

(DEFUN |EFULS;coth;2ULS;47| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 110) "coth" |uls| $)) 

(DEFUN |EFULS;sech;2ULS;48| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 111) "sech" |uls| $)) 

(DEFUN |EFULS;csch;2ULS;49| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 112) "csch" |uls| $)) 

(DEFUN |EFULS;asinh;2ULS;50| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 62) "asinh" |uls| $)) 

(DEFUN |EFULS;acosh;2ULS;51| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 64) "acosh" |uls| $)) 

(DEFUN |EFULS;atanh;2ULS;52| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 66) "atanh" |uls| $)) 

(DEFUN |EFULS;acoth;2ULS;53| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 68) "acoth" |uls| $)) 

(DEFUN |EFULS;asech;2ULS;54| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 70) "asech" |uls| $)) 

(DEFUN |EFULS;acsch;2ULS;55| (|uls| $)
  (|EFULS;applyOrError| (ELT $ 72) "acsch" |uls| $)) 

(DEFUN |EFULS;atan;2ULS;56| (|uls| $)
  (PROG (|z| |cc| |rat| |lc| #1=#:G457 |ord| |coef|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |coef| (SPADCALL |uls| 0 (QREFELT $ 26))
              . #2=(|EFULS;atan;2ULS;56|))
        (SEQ (LETT |ord| (SPADCALL |uls| 0 (QREFELT $ 86)) . #2#)
             (EXIT
              (COND
               ((EQL |ord| 0)
                (COND
                 ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 87))
                            (SPADCALL (|spadConstant| $ 16) (QREFELT $ 88))
                            (QREFELT $ 18))
                  (PROGN
                   (LETT #1#
                         (|error|
                          "atan: series expansion has logarithmic term")
                         . #2#)
                   (GO #1#))))))))
        (LETT |cc|
              (COND
               ((< |ord| 0)
                (COND
                 ((QREFELT $ 10)
                  (COND
                   ((QREFELT $ 11)
                    (SEQ
                     (LETT |lc| (SPADCALL |uls| |ord| (QREFELT $ 26)) . #2#)
                     (LETT |rat| (SPADCALL |lc| (QREFELT $ 90)) . #2#)
                     (EXIT
                      (COND
                       ((OR (QEQCAR |rat| 1)
                            (SPADCALL (QCDR |rat|) (|spadConstant| $ 94)
                                      (QREFELT $ 95)))
                        (SPADCALL (SPADCALL 1 2 (QREFELT $ 91))
                                  (SPADCALL (QREFELT $ 92)) (QREFELT $ 93)))
                       ('T
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 2 (QREFELT $ 91))
                                   (QREFELT $ 97))
                         (SPADCALL (QREFELT $ 92)) (QREFELT $ 93)))))))
                   (#3='T
                    (SPADCALL (SPADCALL 1 2 (QREFELT $ 91))
                              (SPADCALL (QREFELT $ 92)) (QREFELT $ 93)))))
                 (#3#
                  (|error|
                   "atan: series expansion involves transcendental constants"))))
               ((SPADCALL |coef| (|spadConstant| $ 12) (QREFELT $ 18))
                (|spadConstant| $ 12))
               ((QREFELT $ 10) (SPADCALL |coef| (QREFELT $ 98)))
               (#3#
                (|error|
                 "atan: series expansion involves transcendental constants")))
              . #2#)
        (LETT |z|
              (SPADCALL
               (SPADCALL (|spadConstant| $ 96)
                         (SPADCALL |uls| |uls| (QREFELT $ 32)) (QREFELT $ 99))
               (QREFELT $ 81))
              . #2#)
        (EXIT
         (COND
          ((QEQCAR |z| 1) (|error| "atan: leading coefficient not invertible"))
          (#3#
           (SPADCALL (SPADCALL |cc| (QREFELT $ 100))
                     (SPADCALL
                      (SPADCALL (SPADCALL |uls| (QREFELT $ 101)) (QCDR |z|)
                                (QREFELT $ 32))
                      (QREFELT $ 102))
                     (QREFELT $ 99)))))))
      #1# (EXIT #1#))))) 

(DEFUN |EFULS;acot;2ULS;57| (|uls| $)
  (PROG (|z| |cc| |rat| |lc| #1=#:G468 |ord| |coef|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |coef| (SPADCALL |uls| 0 (QREFELT $ 26))
              . #2=(|EFULS;acot;2ULS;57|))
        (SEQ (LETT |ord| (SPADCALL |uls| 0 (QREFELT $ 86)) . #2#)
             (EXIT
              (COND
               ((EQL |ord| 0)
                (COND
                 ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 87))
                            (SPADCALL (|spadConstant| $ 16) (QREFELT $ 88))
                            (QREFELT $ 18))
                  (PROGN
                   (LETT #1#
                         (|error|
                          "acot: series expansion has logarithmic term")
                         . #2#)
                   (GO #1#))))))))
        (LETT |cc|
              (COND
               ((< |ord| 0)
                (COND
                 ((QREFELT $ 11)
                  (SEQ (LETT |lc| (SPADCALL |uls| |ord| (QREFELT $ 26)) . #2#)
                       (LETT |rat| (SPADCALL |lc| (QREFELT $ 90)) . #2#)
                       (EXIT
                        (COND
                         ((OR (QEQCAR |rat| 1)
                              (SPADCALL (QCDR |rat|) (|spadConstant| $ 94)
                                        (QREFELT $ 95)))
                          (|spadConstant| $ 12))
                         ((QREFELT $ 10) (SPADCALL (QREFELT $ 92)))
                         (#3='T
                          (|error|
                           "acot: series expansion involves transcendental constants"))))))
                 (#3# (|spadConstant| $ 12))))
               ((QREFELT $ 10) (SPADCALL |coef| (QREFELT $ 104)))
               (#3#
                (|error|
                 "acot: series expansion involves transcendental constants")))
              . #2#)
        (LETT |z|
              (SPADCALL
               (SPADCALL (|spadConstant| $ 96)
                         (SPADCALL |uls| |uls| (QREFELT $ 32)) (QREFELT $ 99))
               (QREFELT $ 81))
              . #2#)
        (EXIT
         (COND
          ((QEQCAR |z| 1) (|error| "acot: leading coefficient not invertible"))
          (#3#
           (SPADCALL (SPADCALL |cc| (QREFELT $ 100))
                     (SPADCALL
                      (SPADCALL (SPADCALL |uls| (QREFELT $ 101)) (QCDR |z|)
                                (QREFELT $ 32))
                      (QREFELT $ 102))
                     (QREFELT $ 105)))))))
      #1# (EXIT #1#))))) 

(DECLAIM (NOTINLINE |ElementaryFunctionsUnivariateLaurentSeries;|)) 

(DEFUN |ElementaryFunctionsUnivariateLaurentSeries| (&REST #1=#:G470)
  (PROG ()
    (RETURN
     (PROG (#2=#:G471)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ElementaryFunctionsUnivariateLaurentSeries|)
                                           '|domainEqualList|)
                . #3=(|ElementaryFunctionsUnivariateLaurentSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function| |ElementaryFunctionsUnivariateLaurentSeries;|)
                   #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|ElementaryFunctionsUnivariateLaurentSeries|))))))))))) 

(DEFUN |ElementaryFunctionsUnivariateLaurentSeries;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|ElementaryFunctionsUnivariateLaurentSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$|
            (LIST '|ElementaryFunctionsUnivariateLaurentSeries| DV$1 DV$2 DV$3)
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
                  '|ElementaryFunctionsUnivariateLaurentSeries|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9
                (|HasSignature| |#1|
                                (LIST '^
                                      (LIST (|devaluate| |#1|)
                                            (|devaluate| |#1|)
                                            '(|Fraction| (|Integer|))))))
      (QSETREFV $ 10 (|HasCategory| |#1| '(|TranscendentalFunctionCategory|)))
      (QSETREFV $ 11
                (|HasSignature| |#1|
                                (LIST '|retractIfCan|
                                      (LIST
                                       (LIST '|Union| '(|Fraction| (|Integer|))
                                             (|devaluate| "failed"))
                                       (|devaluate| |#1|)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 40 (CONS (|dispatchFunction| |EFULS;^;ULSFULS;3|) $))))
      $)))) 

(MAKEPROP '|ElementaryFunctionsUnivariateLaurentSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) 'RATPOWERS 'TRANSFCN 'RATS (0 . |Zero|)
              (4 . |Zero|) (|NonNegativeInteger|) (8 . |coefficient|)
              (14 . |One|) (|Boolean|) (18 . =) (|Integer|) (|Fraction| 19)
              (24 . |coerce|) (29 . |inv|) (34 . ^) (40 . |One|)
              (44 . |degree|) (49 . |coefficient|) (55 . |zero?|)
              (60 . |removeZeroes|) (|Union| $ '"failed") (66 . |exquo|)
              (72 . |monomial|) (78 . *) (84 . |taylor|) (89 . |coerce|)
              (|Union| 8 '"failed") |EFULS;nthRootIfCan;ULSNniU;2|
              (94 . |numer|) (99 . |denom|) (104 . ^) (110 . ^)
              (|Union| 7 '"failed") (116 . |taylorIfCan|) (121 . |exp|)
              |EFULS;expIfCan;ULSU;5| (126 . |sin|) |EFULS;sinIfCan;ULSU;6|
              (131 . |cos|) |EFULS;cosIfCan;ULSU;7| (136 . |asin|)
              |EFULS;asinIfCan;ULSU;8| (141 . |acos|) |EFULS;acosIfCan;ULSU;9|
              (146 . |asec|) |EFULS;asecIfCan;ULSU;10| (151 . |acsc|)
              |EFULS;acscIfCan;ULSU;11| (156 . |sinh|)
              |EFULS;sinhIfCan;ULSU;12| (161 . |cosh|)
              |EFULS;coshIfCan;ULSU;13| (166 . |asinh|)
              |EFULS;asinhIfCan;ULSU;14| (171 . |acosh|)
              |EFULS;acoshIfCan;ULSU;15| (176 . |atanh|)
              |EFULS;atanhIfCan;ULSU;16| (181 . |acoth|)
              |EFULS;acothIfCan;ULSU;17| (186 . |asech|)
              |EFULS;asechIfCan;ULSU;18| (191 . |acsch|)
              |EFULS;acschIfCan;ULSU;19| (196 . |log|) |EFULS;logIfCan;ULSU;20|
              (|Stream| 6) (201 . |coefficients|)
              (|Record| (|:| |sin| 75) (|:| |cos| 75))
              (|StreamTranscendentalFunctions| 6) (206 . |sincos|)
              (211 . |series|) (216 . |recip|) |EFULS;tanIfCan;ULSU;21|
              |EFULS;cotIfCan;ULSU;22| |EFULS;secIfCan;ULSU;23|
              |EFULS;cscIfCan;ULSU;24| (221 . |order|) (227 . *) (233 . -)
              (|Union| 20 '"failed") (238 . |retractIfCan|) (243 . /)
              (249 . |pi|) (253 . *) (259 . |Zero|) (263 . >) (269 . |One|)
              (273 . -) (278 . |atan|) (283 . +) (289 . |coerce|)
              (294 . |differentiate|) (299 . |integrate|)
              |EFULS;atanIfCan;ULSU;25| (304 . |acot|) (309 . -)
              |EFULS;acotIfCan;ULSU;26|
              (|Record| (|:| |sinh| 75) (|:| |cosh| 75)) (315 . |sinhcosh|)
              |EFULS;tanhIfCan;ULSU;27| |EFULS;cothIfCan;ULSU;28|
              |EFULS;sechIfCan;ULSU;29| |EFULS;cschIfCan;ULSU;30|
              (|OutputForm|) (|String|) (320 . |coerce|) |EFULS;exp;2ULS;32|
              |EFULS;log;2ULS;33| |EFULS;sin;2ULS;34| |EFULS;cos;2ULS;35|
              |EFULS;tan;2ULS;36| |EFULS;cot;2ULS;37| |EFULS;sec;2ULS;38|
              |EFULS;csc;2ULS;39| |EFULS;asin;2ULS;40| |EFULS;acos;2ULS;41|
              |EFULS;asec;2ULS;42| |EFULS;acsc;2ULS;43| |EFULS;sinh;2ULS;44|
              |EFULS;cosh;2ULS;45| |EFULS;tanh;2ULS;46| |EFULS;coth;2ULS;47|
              |EFULS;sech;2ULS;48| |EFULS;csch;2ULS;49| |EFULS;asinh;2ULS;50|
              |EFULS;acosh;2ULS;51| |EFULS;atanh;2ULS;52| |EFULS;acoth;2ULS;53|
              |EFULS;asech;2ULS;54| |EFULS;acsch;2ULS;55| (325 . |One|)
              |EFULS;atan;2ULS;56| |EFULS;acot;2ULS;57|)
           '#(|tanhIfCan| 329 |tanh| 334 |tanIfCan| 339 |tan| 344 |sinhIfCan|
              349 |sinh| 354 |sinIfCan| 359 |sin| 364 |sechIfCan| 369 |sech|
              374 |secIfCan| 379 |sec| 384 |nthRootIfCan| 389 |logIfCan| 395
              |log| 400 |expIfCan| 405 |exp| 410 |cschIfCan| 415 |csch| 420
              |cscIfCan| 425 |csc| 430 |cothIfCan| 435 |coth| 440 |cotIfCan|
              445 |cot| 450 |coshIfCan| 455 |cosh| 460 |cosIfCan| 465 |cos| 470
              |atanhIfCan| 475 |atanh| 480 |atanIfCan| 485 |atan| 490
              |asinhIfCan| 495 |asinh| 500 |asinIfCan| 505 |asin| 510
              |asechIfCan| 515 |asech| 520 |asecIfCan| 525 |asec| 530
              |acschIfCan| 535 |acsch| 540 |acscIfCan| 545 |acsc| 550
              |acothIfCan| 555 |acoth| 560 |acotIfCan| 565 |acot| 570
              |acoshIfCan| 575 |acosh| 580 |acosIfCan| 585 |acos| 590 ^ 595)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|PartialTranscendentalFunctions| 8))
                             (|makeByteWordVec2| 142
                                                 '(0 6 0 12 0 7 0 13 2 7 6 0 14
                                                   15 0 6 0 16 2 6 17 0 0 18 1
                                                   20 0 19 21 1 20 0 0 22 2 7 0
                                                   0 20 23 0 7 0 24 1 8 19 0 25
                                                   2 8 6 0 19 26 1 6 17 0 27 2
                                                   8 0 19 0 28 2 19 29 0 0 30 2
                                                   8 0 6 19 31 2 8 0 0 0 32 1 8
                                                   7 0 33 1 8 0 7 34 1 20 19 0
                                                   37 1 20 19 0 38 2 8 0 0 19
                                                   39 2 0 8 8 20 40 1 8 41 0 42
                                                   1 7 0 0 43 1 7 0 0 45 1 7 0
                                                   0 47 1 7 0 0 49 1 7 0 0 51 1
                                                   7 0 0 53 1 7 0 0 55 1 7 0 0
                                                   57 1 7 0 0 59 1 7 0 0 61 1 7
                                                   0 0 63 1 7 0 0 65 1 7 0 0 67
                                                   1 7 0 0 69 1 7 0 0 71 1 7 0
                                                   0 73 1 7 75 0 76 1 78 77 75
                                                   79 1 7 0 75 80 1 8 29 0 81 2
                                                   8 19 0 19 86 2 6 0 0 0 87 1
                                                   6 0 0 88 1 6 89 0 90 2 20 0
                                                   19 19 91 0 6 0 92 2 6 0 20 0
                                                   93 0 20 0 94 2 20 17 0 0 95
                                                   0 8 0 96 1 20 0 0 97 1 6 0 0
                                                   98 2 8 0 0 0 99 1 8 0 6 100
                                                   1 8 0 0 101 1 8 0 0 102 1 6
                                                   0 0 104 2 8 0 0 0 105 1 78
                                                   107 75 108 1 114 113 0 115 0
                                                   20 0 140 1 0 35 8 109 1 0 8
                                                   8 130 1 0 35 8 82 1 0 8 8
                                                   120 1 0 35 8 58 1 0 8 8 128
                                                   1 0 35 8 46 1 0 8 8 118 1 0
                                                   35 8 111 1 0 8 8 132 1 0 35
                                                   8 84 1 0 8 8 122 2 0 35 8 14
                                                   36 1 0 35 8 74 1 0 8 8 117 1
                                                   0 35 8 44 1 0 8 8 116 1 0 35
                                                   8 112 1 0 8 8 133 1 0 35 8
                                                   85 1 0 8 8 123 1 0 35 8 110
                                                   1 0 8 8 131 1 0 35 8 83 1 0
                                                   8 8 121 1 0 35 8 60 1 0 8 8
                                                   129 1 0 35 8 48 1 0 8 8 119
                                                   1 0 35 8 66 1 0 8 8 136 1 0
                                                   35 8 103 1 0 8 8 141 1 0 35
                                                   8 62 1 0 8 8 134 1 0 35 8 50
                                                   1 0 8 8 124 1 0 35 8 70 1 0
                                                   8 8 138 1 0 35 8 54 1 0 8 8
                                                   126 1 0 35 8 72 1 0 8 8 139
                                                   1 0 35 8 56 1 0 8 8 127 1 0
                                                   35 8 68 1 0 8 8 137 1 0 35 8
                                                   106 1 0 8 8 142 1 0 35 8 64
                                                   1 0 8 8 135 1 0 35 8 52 1 0
                                                   8 8 125 2 1 8 8 20 40)))))
           '|lookupComplete|)) 
