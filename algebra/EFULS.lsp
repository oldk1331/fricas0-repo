
(SDEFUN |EFULS;nthRootUTS|
        ((|uts| (UTS)) (|n| (|Integer|)) (% (|Union| UTS "failed")))
        (COND
         ((OR
           (SPADCALL (SPADCALL |uts| 0 (QREFELT % 15)) (|spadConstant| % 16)
                     (QREFELT % 18))
           (QREFELT % 9))
          (CONS 0
                (SPADCALL |uts|
                          (SPADCALL (SPADCALL |n| (QREFELT % 21))
                                    (QREFELT % 22))
                          (QREFELT % 23))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |EFULS;nthRootIfCan;ULSNniU;2|
        ((|uls| (ULS)) (|nn| (|NonNegativeInteger|))
         (% (|Union| ULS "failed")))
        (SPROG
         ((|root| (|Union| UTS "failed")) (|uts| (UTS))
          (|k| (|Union| (|Integer|) "failed")) (|coef| (|Coef|))
          (|deg| (|Integer|)) (|n| (|Integer|)))
         (SEQ (LETT |n| |nn|)
              (EXIT
               (COND ((< |n| 1) (|error| "nthRootIfCan: n must be positive"))
                     ((EQL |n| 1) (CONS 0 |uls|))
                     (#1='T
                      (SEQ (LETT |deg| (SPADCALL |uls| (QREFELT % 25)))
                           (COND
                            ((SPADCALL
                              (LETT |coef|
                                    (SPADCALL |uls| |deg| (QREFELT % 26)))
                              (QREFELT % 27))
                             (SEQ
                              (LETT |uls| (SPADCALL 1000 |uls| (QREFELT % 28)))
                              (LETT |deg| (SPADCALL |uls| (QREFELT % 25)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |coef|
                                        (SPADCALL |uls| |deg| (QREFELT % 26)))
                                  (QREFELT % 27))
                                 (|error|
                                  "root of series with many leading zero coefficients")))))))
                           (LETT |k| (|exquo_INT| |deg| |n|))
                           (EXIT
                            (COND ((QEQCAR |k| 1) (CONS 1 "failed"))
                                  (#1#
                                   (SEQ
                                    (LETT |uts|
                                          (SPADCALL
                                           (SPADCALL |uls|
                                                     (SPADCALL
                                                      (|spadConstant| % 16)
                                                      (- |deg|) (QREFELT % 29))
                                                     (QREFELT % 30))
                                           (QREFELT % 31)))
                                    (LETT |root|
                                          (|EFULS;nthRootUTS| |uts| |n| %))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |root| 1) (CONS 1 "failed"))
                                      (#1#
                                       (CONS 0
                                             (SPADCALL
                                              (SPADCALL (|spadConstant| % 16)
                                                        (QCDR |k|)
                                                        (QREFELT % 29))
                                              (SPADCALL (QCDR |root|)
                                                        (QREFELT % 32))
                                              (QREFELT % 30))))))))))))))))) 

(SDEFUN |EFULS;^;ULSFULS;3|
        ((|uls| (ULS)) (|r| (|Fraction| (|Integer|))) (% (ULS)))
        (SPROG
         ((|uts| (UTS)) (|k| (|Union| (|Integer|) "failed")) (|coef| (|Coef|))
          (|deg| (|Integer|)) (|den| (|Integer|)) (|num| (|Integer|)))
         (SEQ (LETT |num| (SPADCALL |r| (QREFELT % 35)))
              (LETT |den| (SPADCALL |r| (QREFELT % 36)))
              (EXIT
               (COND ((EQL |den| 1) (SPADCALL |uls| |num| (QREFELT % 37)))
                     (#1='T
                      (SEQ (LETT |deg| (SPADCALL |uls| (QREFELT % 25)))
                           (COND
                            ((SPADCALL
                              (LETT |coef|
                                    (SPADCALL |uls| |deg| (QREFELT % 26)))
                              (QREFELT % 27))
                             (SEQ
                              (LETT |uls| (SPADCALL 1000 |uls| (QREFELT % 28)))
                              (LETT |deg| (SPADCALL |uls| (QREFELT % 25)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |coef|
                                        (SPADCALL |uls| |deg| (QREFELT % 26)))
                                  (QREFELT % 27))
                                 (|error|
                                  "power of series with many leading zero coefficients")))))))
                           (LETT |k| (|exquo_INT| |deg| |den|))
                           (EXIT
                            (COND
                             ((QEQCAR |k| 1)
                              (|error| "^: rational power does not exist"))
                             (#1#
                              (SEQ
                               (LETT |uts|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |uls|
                                                 (SPADCALL
                                                  (|spadConstant| % 16)
                                                  (- |deg|) (QREFELT % 29))
                                                 (QREFELT % 30))
                                       (QREFELT % 31))
                                      |r| (QREFELT % 23)))
                               (EXIT
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 16)
                                           (* (QCDR |k|) |num|) (QREFELT % 29))
                                 (SPADCALL |uts| (QREFELT % 32))
                                 (QREFELT % 30)))))))))))))) 

(SDEFUN |EFULS;applyIfCan|
        ((|fcn| (|Mapping| UTS UTS)) (|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG ((|uts| (|Union| UTS "failed")))
               (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 40)))
                    (EXIT
                     (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                           ('T
                            (CONS 0
                                  (SPADCALL (SPADCALL (QCDR |uts|) |fcn|)
                                            (QREFELT % 32))))))))) 

(SDEFUN |EFULS;expIfCan;ULSU;5| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 41) |uls| %)) 

(SDEFUN |EFULS;sinIfCan;ULSU;6| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 43) |uls| %)) 

(SDEFUN |EFULS;cosIfCan;ULSU;7| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 45) |uls| %)) 

(SDEFUN |EFULS;asinIfCan;ULSU;8| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 47) |uls| %)) 

(SDEFUN |EFULS;acosIfCan;ULSU;9| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 49) |uls| %)) 

(SDEFUN |EFULS;asecIfCan;ULSU;10| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 51) |uls| %)) 

(SDEFUN |EFULS;acscIfCan;ULSU;11| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 53) |uls| %)) 

(SDEFUN |EFULS;sinhIfCan;ULSU;12| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 55) |uls| %)) 

(SDEFUN |EFULS;coshIfCan;ULSU;13| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 57) |uls| %)) 

(SDEFUN |EFULS;asinhIfCan;ULSU;14| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 59) |uls| %)) 

(SDEFUN |EFULS;acoshIfCan;ULSU;15| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 61) |uls| %)) 

(SDEFUN |EFULS;atanhIfCan;ULSU;16| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 63) |uls| %)) 

(SDEFUN |EFULS;acothIfCan;ULSU;17| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 65) |uls| %)) 

(SDEFUN |EFULS;asechIfCan;ULSU;18| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 67) |uls| %)) 

(SDEFUN |EFULS;acschIfCan;ULSU;19| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 69) |uls| %)) 

(SDEFUN |EFULS;logIfCan;ULSU;20| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG ((|ts| (UTS)) (|uts| (|Union| UTS "failed")))
               (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 40)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |uts| 1)
                           (SPADCALL
                            (SPADCALL (LETT |ts| (QCDR |uts|)) 0
                                      (QREFELT % 15))
                            (QREFELT % 27)))
                       (CONS 1 "failed"))
                      ('T
                       (CONS 0
                             (SPADCALL (SPADCALL |ts| (QREFELT % 71))
                                       (QREFELT % 32))))))))) 

(SDEFUN |EFULS;tanIfCan;ULSU;21| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG
         ((|cosInv| (|Union| ULS "failed"))
          (|sc|
           (|Record| (|:| |sin| (|Stream| |Coef|))
                     (|:| |cos| (|Stream| |Coef|))))
          (|uts| (|Union| UTS "failed")))
         (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 40)))
              (EXIT
               (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ
                       (LETT |sc|
                             (SPADCALL (SPADCALL (QCDR |uts|) (QREFELT % 74))
                                       (QREFELT % 77)))
                       (LETT |cosInv|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCDR |sc|) (QREFELT % 78))
                                        (QREFELT % 32))
                              (QREFELT % 80)))
                       (EXIT
                        (COND ((QEQCAR |cosInv| 1) (CONS 1 "failed"))
                              (#1#
                               (CONS 0
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QCAR |sc|) (QREFELT % 78))
                                       (QREFELT % 32))
                                      (QCDR |cosInv|) (QREFELT % 30))))))))))))) 

(SDEFUN |EFULS;cotIfCan;ULSU;22| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG
         ((|sinInv| (|Union| ULS "failed"))
          (|sc|
           (|Record| (|:| |sin| (|Stream| |Coef|))
                     (|:| |cos| (|Stream| |Coef|))))
          (|uts| (|Union| UTS "failed")))
         (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 40)))
              (EXIT
               (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ
                       (LETT |sc|
                             (SPADCALL (SPADCALL (QCDR |uts|) (QREFELT % 74))
                                       (QREFELT % 77)))
                       (LETT |sinInv|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCAR |sc|) (QREFELT % 78))
                                        (QREFELT % 32))
                              (QREFELT % 80)))
                       (EXIT
                        (COND ((QEQCAR |sinInv| 1) (CONS 1 "failed"))
                              (#1#
                               (CONS 0
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QCDR |sc|) (QREFELT % 78))
                                       (QREFELT % 32))
                                      (QCDR |sinInv|) (QREFELT % 30))))))))))))) 

(SDEFUN |EFULS;secIfCan;ULSU;23| ((|uls| (ULS)) (% (|Union| ULS #1="failed")))
        (SPROG ((|cosInv| (|Union| ULS "failed")) (|cos| (|Union| ULS #1#)))
               (SEQ (LETT |cos| (SPADCALL |uls| (QREFELT % 46)))
                    (EXIT
                     (COND ((QEQCAR |cos| 1) (CONS 1 "failed"))
                           (#2='T
                            (SEQ
                             (LETT |cosInv|
                                   (SPADCALL (QCDR |cos|) (QREFELT % 80)))
                             (EXIT
                              (COND ((QEQCAR |cosInv| 1) (CONS 1 "failed"))
                                    (#2# (CONS 0 (QCDR |cosInv|)))))))))))) 

(SDEFUN |EFULS;cscIfCan;ULSU;24| ((|uls| (ULS)) (% (|Union| ULS #1="failed")))
        (SPROG ((|sinInv| (|Union| ULS "failed")) (|sin| (|Union| ULS #1#)))
               (SEQ (LETT |sin| (SPADCALL |uls| (QREFELT % 44)))
                    (EXIT
                     (COND ((QEQCAR |sin| 1) (CONS 1 "failed"))
                           (#2='T
                            (SEQ
                             (LETT |sinInv|
                                   (SPADCALL (QCDR |sin|) (QREFELT % 80)))
                             (EXIT
                              (COND ((QEQCAR |sinInv| 1) (CONS 1 "failed"))
                                    (#2# (CONS 0 (QCDR |sinInv|)))))))))))) 

(SDEFUN |EFULS;atanIfCan;ULSU;25| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG
         ((|z| (|Union| ULS "failed")) (|cc| (|Coef|)) (#1=#:G183 NIL)
          (|rat| (|Union| (|Fraction| (|Integer|)) "failed")) (|lc| (|Coef|))
          (#2=#:G182 NIL) (|ord| (|Integer|)) (|coef| (|Coef|)))
         (SEQ
          (EXIT
           (SEQ
            (EXIT
             (SEQ (LETT |coef| (SPADCALL |uls| 0 (QREFELT % 26)))
                  (SEQ (LETT |ord| (SPADCALL |uls| 0 (QREFELT % 85)))
                       (EXIT
                        (COND
                         ((EQL |ord| 0)
                          (COND
                           ((SPADCALL (SPADCALL |coef| |coef| (QREFELT % 86))
                                      (SPADCALL (|spadConstant| % 16)
                                                (QREFELT % 87))
                                      (QREFELT % 18))
                            (PROGN
                             (LETT #2# (CONS 1 "failed"))
                             (GO #3=#:G180))))))))
                  (LETT |cc|
                        (COND
                         ((< |ord| 0)
                          (COND
                           ((QREFELT % 10)
                            (COND
                             ((QREFELT % 11)
                              (SEQ
                               (LETT |lc|
                                     (SPADCALL |uls| |ord| (QREFELT % 26)))
                               (LETT |rat| (SPADCALL |lc| (QREFELT % 89)))
                               (EXIT
                                (COND
                                 ((OR (QEQCAR |rat| 1)
                                      (SPADCALL (QCDR |rat|)
                                                (|spadConstant| % 93)
                                                (QREFELT % 94)))
                                  (SPADCALL (SPADCALL 1 2 (QREFELT % 90))
                                            (SPADCALL (QREFELT % 91))
                                            (QREFELT % 92)))
                                 ('T
                                  (SPADCALL
                                   (SPADCALL (SPADCALL 1 2 (QREFELT % 90))
                                             (QREFELT % 96))
                                   (SPADCALL (QREFELT % 91))
                                   (QREFELT % 92)))))))
                             (#4='T
                              (SPADCALL (SPADCALL 1 2 (QREFELT % 90))
                                        (SPADCALL (QREFELT % 91))
                                        (QREFELT % 92)))))
                           (#4#
                            (PROGN
                             (LETT #1# (CONS 1 "failed"))
                             (GO #5=#:G181)))))
                         ((SPADCALL |coef| (|spadConstant| % 12)
                                    (QREFELT % 18))
                          (|spadConstant| % 12))
                         ((QREFELT % 10) (SPADCALL |coef| (QREFELT % 97)))
                         (#4# (PROGN (LETT #1# (CONS 1 "failed")) (GO #5#)))))
                  (LETT |z|
                        (SPADCALL
                         (SPADCALL (|spadConstant| % 95)
                                   (SPADCALL |uls| |uls| (QREFELT % 30))
                                   (QREFELT % 98))
                         (QREFELT % 80)))
                  (EXIT
                   (COND ((QEQCAR |z| 1) (CONS 1 "failed"))
                         (#4#
                          (CONS 0
                                (SPADCALL (SPADCALL |cc| (QREFELT % 99))
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |uls| (QREFELT % 100))
                                            (QCDR |z|) (QREFELT % 30))
                                           (QREFELT % 101))
                                          (QREFELT % 98))))))))
            #3# (EXIT #2#)))
          #5# (EXIT #1#)))) 

(SDEFUN |EFULS;acotIfCan;ULSU;26| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG
         ((|z| (|Union| ULS "failed")) (|cc| (|Coef|)) (#1=#:G197 NIL)
          (|rat| (|Union| (|Fraction| (|Integer|)) "failed")) (|lc| (|Coef|))
          (#2=#:G196 NIL) (|ord| (|Integer|)) (|coef| (|Coef|)))
         (SEQ
          (EXIT
           (SEQ
            (EXIT
             (SEQ (LETT |coef| (SPADCALL |uls| 0 (QREFELT % 26)))
                  (SEQ (LETT |ord| (SPADCALL |uls| 0 (QREFELT % 85)))
                       (EXIT
                        (COND
                         ((EQL |ord| 0)
                          (COND
                           ((SPADCALL (SPADCALL |coef| |coef| (QREFELT % 86))
                                      (SPADCALL (|spadConstant| % 16)
                                                (QREFELT % 87))
                                      (QREFELT % 18))
                            (PROGN
                             (LETT #2# (CONS 1 "failed"))
                             (GO #3=#:G194))))))))
                  (LETT |cc|
                        (COND
                         ((< |ord| 0)
                          (COND
                           ((QREFELT % 11)
                            (SEQ
                             (LETT |lc| (SPADCALL |uls| |ord| (QREFELT % 26)))
                             (LETT |rat| (SPADCALL |lc| (QREFELT % 89)))
                             (EXIT
                              (COND
                               ((OR (QEQCAR |rat| 1)
                                    (SPADCALL (QCDR |rat|)
                                              (|spadConstant| % 93)
                                              (QREFELT % 94)))
                                (|spadConstant| % 12))
                               ((QREFELT % 10) (SPADCALL (QREFELT % 91)))
                               (#4='T
                                (PROGN
                                 (LETT #1# (CONS 1 "failed"))
                                 (GO #5=#:G195)))))))
                           (#4# (|spadConstant| % 12))))
                         ((QREFELT % 10) (SPADCALL |coef| (QREFELT % 103)))
                         (#4# (PROGN (LETT #1# (CONS 1 "failed")) (GO #5#)))))
                  (LETT |z|
                        (SPADCALL
                         (SPADCALL (|spadConstant| % 95)
                                   (SPADCALL |uls| |uls| (QREFELT % 30))
                                   (QREFELT % 98))
                         (QREFELT % 80)))
                  (EXIT
                   (COND ((QEQCAR |z| 1) (CONS 1 "failed"))
                         (#4#
                          (CONS 0
                                (SPADCALL (SPADCALL |cc| (QREFELT % 99))
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |uls| (QREFELT % 100))
                                            (QCDR |z|) (QREFELT % 30))
                                           (QREFELT % 101))
                                          (QREFELT % 104))))))))
            #3# (EXIT #2#)))
          #5# (EXIT #1#)))) 

(SDEFUN |EFULS;tanhIfCan;ULSU;27| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG
         ((|coshInv| (|Union| ULS "failed"))
          (|sc|
           (|Record| (|:| |sinh| (|Stream| |Coef|))
                     (|:| |cosh| (|Stream| |Coef|))))
          (|uts| (|Union| UTS "failed")))
         (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 40)))
              (EXIT
               (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ
                       (LETT |sc|
                             (SPADCALL (SPADCALL (QCDR |uts|) (QREFELT % 74))
                                       (QREFELT % 107)))
                       (LETT |coshInv|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCDR |sc|) (QREFELT % 78))
                                        (QREFELT % 32))
                              (QREFELT % 80)))
                       (EXIT
                        (COND ((QEQCAR |coshInv| 1) (CONS 1 "failed"))
                              (#1#
                               (CONS 0
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QCAR |sc|) (QREFELT % 78))
                                       (QREFELT % 32))
                                      (QCDR |coshInv|)
                                      (QREFELT % 30))))))))))))) 

(SDEFUN |EFULS;cothIfCan;ULSU;28| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG
         ((|sinhInv| (|Union| ULS "failed"))
          (|sc|
           (|Record| (|:| |sinh| (|Stream| |Coef|))
                     (|:| |cosh| (|Stream| |Coef|))))
          (|uts| (|Union| UTS "failed")))
         (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 40)))
              (EXIT
               (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ
                       (LETT |sc|
                             (SPADCALL (SPADCALL (QCDR |uts|) (QREFELT % 74))
                                       (QREFELT % 107)))
                       (LETT |sinhInv|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCAR |sc|) (QREFELT % 78))
                                        (QREFELT % 32))
                              (QREFELT % 80)))
                       (EXIT
                        (COND ((QEQCAR |sinhInv| 1) (CONS 1 "failed"))
                              (#1#
                               (CONS 0
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QCDR |sc|) (QREFELT % 78))
                                       (QREFELT % 32))
                                      (QCDR |sinhInv|)
                                      (QREFELT % 30))))))))))))) 

(SDEFUN |EFULS;sechIfCan;ULSU;29| ((|uls| (ULS)) (% (|Union| ULS #1="failed")))
        (SPROG ((|coshInv| (|Union| ULS "failed")) (|cosh| (|Union| ULS #1#)))
               (SEQ (LETT |cosh| (SPADCALL |uls| (QREFELT % 58)))
                    (EXIT
                     (COND ((QEQCAR |cosh| 1) (CONS 1 "failed"))
                           (#2='T
                            (SEQ
                             (LETT |coshInv|
                                   (SPADCALL (QCDR |cosh|) (QREFELT % 80)))
                             (EXIT
                              (COND ((QEQCAR |coshInv| 1) (CONS 1 "failed"))
                                    (#2# (CONS 0 (QCDR |coshInv|)))))))))))) 

(SDEFUN |EFULS;cschIfCan;ULSU;30| ((|uls| (ULS)) (% (|Union| ULS #1="failed")))
        (SPROG ((|sinhInv| (|Union| ULS "failed")) (|sinh| (|Union| ULS #1#)))
               (SEQ (LETT |sinh| (SPADCALL |uls| (QREFELT % 56)))
                    (EXIT
                     (COND ((QEQCAR |sinh| 1) (CONS 1 "failed"))
                           (#2='T
                            (SEQ
                             (LETT |sinhInv|
                                   (SPADCALL (QCDR |sinh|) (QREFELT % 80)))
                             (EXIT
                              (COND ((QEQCAR |sinhInv| 1) (CONS 1 "failed"))
                                    (#2# (CONS 0 (QCDR |sinhInv|)))))))))))) 

(SDEFUN |EFULS;applyOrError|
        ((|fcn| (|Mapping| #1=(|Union| ULS "failed") ULS)) (|name| (|String|))
         (|uls| (ULS)) (% (ULS)))
        (SPROG ((|ans| #1#))
               (SEQ (LETT |ans| (SPADCALL |uls| |fcn|))
                    (EXIT
                     (COND
                      ((QEQCAR |ans| 1)
                       (|error|
                        (STRCONC |name| " of function with singularity")))
                      ('T (QCDR |ans|))))))) 

(SDEFUN |EFULS;exp;2ULS;32| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 42) "exp" |uls| %)) 

(SDEFUN |EFULS;log;2ULS;33| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 72) "log" |uls| %)) 

(SDEFUN |EFULS;sin;2ULS;34| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 44) "sin" |uls| %)) 

(SDEFUN |EFULS;cos;2ULS;35| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 46) "cos" |uls| %)) 

(SDEFUN |EFULS;tan;2ULS;36| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 81) "tan" |uls| %)) 

(SDEFUN |EFULS;cot;2ULS;37| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 82) "cot" |uls| %)) 

(SDEFUN |EFULS;sec;2ULS;38| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 83) "sec" |uls| %)) 

(SDEFUN |EFULS;csc;2ULS;39| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 84) "csc" |uls| %)) 

(SDEFUN |EFULS;asin;2ULS;40| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 48) "asin" |uls| %)) 

(SDEFUN |EFULS;acos;2ULS;41| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 50) "acos" |uls| %)) 

(SDEFUN |EFULS;asec;2ULS;42| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 52) "asec" |uls| %)) 

(SDEFUN |EFULS;acsc;2ULS;43| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 54) "acsc" |uls| %)) 

(SDEFUN |EFULS;sinh;2ULS;44| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 56) "sinh" |uls| %)) 

(SDEFUN |EFULS;cosh;2ULS;45| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 58) "cosh" |uls| %)) 

(SDEFUN |EFULS;tanh;2ULS;46| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 108) "tanh" |uls| %)) 

(SDEFUN |EFULS;coth;2ULS;47| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 109) "coth" |uls| %)) 

(SDEFUN |EFULS;sech;2ULS;48| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 110) "sech" |uls| %)) 

(SDEFUN |EFULS;csch;2ULS;49| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 111) "csch" |uls| %)) 

(SDEFUN |EFULS;asinh;2ULS;50| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 60) "asinh" |uls| %)) 

(SDEFUN |EFULS;acosh;2ULS;51| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 62) "acosh" |uls| %)) 

(SDEFUN |EFULS;atanh;2ULS;52| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 64) "atanh" |uls| %)) 

(SDEFUN |EFULS;acoth;2ULS;53| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 66) "acoth" |uls| %)) 

(SDEFUN |EFULS;asech;2ULS;54| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 68) "asech" |uls| %)) 

(SDEFUN |EFULS;acsch;2ULS;55| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 70) "acsch" |uls| %)) 

(SDEFUN |EFULS;atan;2ULS;56| ((|uls| (ULS)) (% (ULS)))
        (SPROG
         ((|z| (|Union| ULS "failed")) (|cc| (|Coef|))
          (|rat| (|Union| (|Fraction| (|Integer|)) "failed")) (|lc| (|Coef|))
          (#1=#:G367 NIL) (|ord| (|Integer|)) (|coef| (|Coef|)))
         (SEQ
          (EXIT
           (SEQ (LETT |coef| (SPADCALL |uls| 0 (QREFELT % 26)))
                (SEQ (LETT |ord| (SPADCALL |uls| 0 (QREFELT % 85)))
                     (EXIT
                      (COND
                       ((EQL |ord| 0)
                        (COND
                         ((SPADCALL (SPADCALL |coef| |coef| (QREFELT % 86))
                                    (SPADCALL (|spadConstant| % 16)
                                              (QREFELT % 87))
                                    (QREFELT % 18))
                          (PROGN
                           (LETT #1#
                                 (|error|
                                  "atan: series expansion has logarithmic term"))
                           (GO #2=#:G365))))))))
                (LETT |cc|
                      (COND
                       ((< |ord| 0)
                        (COND
                         ((QREFELT % 10)
                          (COND
                           ((QREFELT % 11)
                            (SEQ
                             (LETT |lc| (SPADCALL |uls| |ord| (QREFELT % 26)))
                             (LETT |rat| (SPADCALL |lc| (QREFELT % 89)))
                             (EXIT
                              (COND
                               ((OR (QEQCAR |rat| 1)
                                    (SPADCALL (QCDR |rat|)
                                              (|spadConstant| % 93)
                                              (QREFELT % 94)))
                                (SPADCALL (SPADCALL 1 2 (QREFELT % 90))
                                          (SPADCALL (QREFELT % 91))
                                          (QREFELT % 92)))
                               ('T
                                (SPADCALL
                                 (SPADCALL (SPADCALL 1 2 (QREFELT % 90))
                                           (QREFELT % 96))
                                 (SPADCALL (QREFELT % 91)) (QREFELT % 92)))))))
                           (#3='T
                            (SPADCALL (SPADCALL 1 2 (QREFELT % 90))
                                      (SPADCALL (QREFELT % 91))
                                      (QREFELT % 92)))))
                         (#3#
                          (|error|
                           "atan: series expansion involves transcendental constants"))))
                       ((SPADCALL |coef| (|spadConstant| % 12) (QREFELT % 18))
                        (|spadConstant| % 12))
                       ((QREFELT % 10) (SPADCALL |coef| (QREFELT % 97)))
                       (#3#
                        (|error|
                         "atan: series expansion involves transcendental constants"))))
                (LETT |z|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 95)
                                 (SPADCALL |uls| |uls| (QREFELT % 30))
                                 (QREFELT % 98))
                       (QREFELT % 80)))
                (EXIT
                 (COND
                  ((QEQCAR |z| 1)
                   (|error| "atan: leading coefficient not invertible"))
                  (#3#
                   (SPADCALL (SPADCALL |cc| (QREFELT % 99))
                             (SPADCALL
                              (SPADCALL (SPADCALL |uls| (QREFELT % 100))
                                        (QCDR |z|) (QREFELT % 30))
                              (QREFELT % 101))
                             (QREFELT % 98)))))))
          #2# (EXIT #1#)))) 

(SDEFUN |EFULS;acot;2ULS;57| ((|uls| (ULS)) (% (ULS)))
        (SPROG
         ((|z| (|Union| ULS "failed")) (|cc| (|Coef|))
          (|rat| (|Union| (|Fraction| (|Integer|)) "failed")) (|lc| (|Coef|))
          (#1=#:G380 NIL) (|ord| (|Integer|)) (|coef| (|Coef|)))
         (SEQ
          (EXIT
           (SEQ (LETT |coef| (SPADCALL |uls| 0 (QREFELT % 26)))
                (SEQ (LETT |ord| (SPADCALL |uls| 0 (QREFELT % 85)))
                     (EXIT
                      (COND
                       ((EQL |ord| 0)
                        (COND
                         ((SPADCALL (SPADCALL |coef| |coef| (QREFELT % 86))
                                    (SPADCALL (|spadConstant| % 16)
                                              (QREFELT % 87))
                                    (QREFELT % 18))
                          (PROGN
                           (LETT #1#
                                 (|error|
                                  "acot: series expansion has logarithmic term"))
                           (GO #2=#:G378))))))))
                (LETT |cc|
                      (COND
                       ((< |ord| 0)
                        (COND
                         ((QREFELT % 11)
                          (SEQ
                           (LETT |lc| (SPADCALL |uls| |ord| (QREFELT % 26)))
                           (LETT |rat| (SPADCALL |lc| (QREFELT % 89)))
                           (EXIT
                            (COND
                             ((OR (QEQCAR |rat| 1)
                                  (SPADCALL (QCDR |rat|) (|spadConstant| % 93)
                                            (QREFELT % 94)))
                              (|spadConstant| % 12))
                             ((QREFELT % 10) (SPADCALL (QREFELT % 91)))
                             (#3='T
                              (|error|
                               "acot: series expansion involves transcendental constants"))))))
                         (#3# (|spadConstant| % 12))))
                       ((QREFELT % 10) (SPADCALL |coef| (QREFELT % 103)))
                       (#3#
                        (|error|
                         "acot: series expansion involves transcendental constants"))))
                (LETT |z|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 95)
                                 (SPADCALL |uls| |uls| (QREFELT % 30))
                                 (QREFELT % 98))
                       (QREFELT % 80)))
                (EXIT
                 (COND
                  ((QEQCAR |z| 1)
                   (|error| "acot: leading coefficient not invertible"))
                  (#3#
                   (SPADCALL (SPADCALL |cc| (QREFELT % 99))
                             (SPADCALL
                              (SPADCALL (SPADCALL |uls| (QREFELT % 100))
                                        (QCDR |z|) (QREFELT % 30))
                              (QREFELT % 101))
                             (QREFELT % 104)))))))
          #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |ElementaryFunctionsUnivariateLaurentSeries;|)) 

(DEFUN |ElementaryFunctionsUnivariateLaurentSeries;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$|
                (LIST '|ElementaryFunctionsUnivariateLaurentSeries| DV$1 DV$2
                      DV$3))
          (LETT % (GETREFV 138))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|Field|))))))
          (|haddProp| |$ConstructorCache|
                      '|ElementaryFunctionsUnivariateLaurentSeries|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9
                    (|HasSignature| |#1|
                                    (LIST '^
                                          (LIST (|devaluate| |#1|)
                                                (|devaluate| |#1|)
                                                '(|Fraction| (|Integer|))))))
          (QSETREFV % 10
                    (|HasCategory| |#1| '(|TranscendentalFunctionCategory|)))
          (QSETREFV % 11
                    (|HasSignature| |#1|
                                    (LIST '|retractIfCan|
                                          (LIST
                                           (LIST '|Union|
                                                 '(|Fraction| (|Integer|))
                                                 (|devaluate| "failed"))
                                           (|devaluate| |#1|)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 38 (CONS (|dispatchFunction| |EFULS;^;ULSFULS;3|) %))))
          %))) 

(DEFUN |ElementaryFunctionsUnivariateLaurentSeries| (&REST #1=#:G381)
  (SPROG NIL
         (PROG (#2=#:G382)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunctionsUnivariateLaurentSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |ElementaryFunctionsUnivariateLaurentSeries;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ElementaryFunctionsUnivariateLaurentSeries|)))))))))) 

(MAKEPROP '|ElementaryFunctionsUnivariateLaurentSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) 'RATPOWERS 'TRANSFCN 'RATS (0 . |Zero|)
              (4 . |Zero|) (|NonNegativeInteger|) (8 . |coefficient|)
              (14 . |One|) (|Boolean|) (18 . =) (|Integer|) (|Fraction| 19)
              (24 . |coerce|) (29 . |inv|) (34 . ^) (40 . |One|)
              (44 . |degree|) (49 . |coefficient|) (55 . |zero?|)
              (60 . |removeZeroes|) (66 . |monomial|) (72 . *) (78 . |taylor|)
              (83 . |coerce|) (|Union| 8 '"failed")
              |EFULS;nthRootIfCan;ULSNniU;2| (88 . |numer|) (93 . |denom|)
              (98 . ^) (104 . ^) (|Union| 7 '"failed") (110 . |taylorIfCan|)
              (115 . |exp|) |EFULS;expIfCan;ULSU;5| (120 . |sin|)
              |EFULS;sinIfCan;ULSU;6| (125 . |cos|) |EFULS;cosIfCan;ULSU;7|
              (130 . |asin|) |EFULS;asinIfCan;ULSU;8| (135 . |acos|)
              |EFULS;acosIfCan;ULSU;9| (140 . |asec|) |EFULS;asecIfCan;ULSU;10|
              (145 . |acsc|) |EFULS;acscIfCan;ULSU;11| (150 . |sinh|)
              |EFULS;sinhIfCan;ULSU;12| (155 . |cosh|)
              |EFULS;coshIfCan;ULSU;13| (160 . |asinh|)
              |EFULS;asinhIfCan;ULSU;14| (165 . |acosh|)
              |EFULS;acoshIfCan;ULSU;15| (170 . |atanh|)
              |EFULS;atanhIfCan;ULSU;16| (175 . |acoth|)
              |EFULS;acothIfCan;ULSU;17| (180 . |asech|)
              |EFULS;asechIfCan;ULSU;18| (185 . |acsch|)
              |EFULS;acschIfCan;ULSU;19| (190 . |log|) |EFULS;logIfCan;ULSU;20|
              (|Stream| 6) (195 . |coefficients|)
              (|Record| (|:| |sin| 73) (|:| |cos| 73))
              (|StreamTranscendentalFunctions| 6) (200 . |sincos|)
              (205 . |series|) (|Union| % '"failed") (210 . |recip|)
              |EFULS;tanIfCan;ULSU;21| |EFULS;cotIfCan;ULSU;22|
              |EFULS;secIfCan;ULSU;23| |EFULS;cscIfCan;ULSU;24| (215 . |order|)
              (221 . *) (227 . -) (|Union| 20 '"failed") (232 . |retractIfCan|)
              (237 . /) (243 . |pi|) (247 . *) (253 . |Zero|) (257 . >)
              (263 . |One|) (267 . -) (272 . |atan|) (277 . +) (283 . |coerce|)
              (288 . |differentiate|) (293 . |integrate|)
              |EFULS;atanIfCan;ULSU;25| (298 . |acot|) (303 . -)
              |EFULS;acotIfCan;ULSU;26|
              (|Record| (|:| |sinh| 73) (|:| |cosh| 73)) (309 . |sinhcosh|)
              |EFULS;tanhIfCan;ULSU;27| |EFULS;cothIfCan;ULSU;28|
              |EFULS;sechIfCan;ULSU;29| |EFULS;cschIfCan;ULSU;30|
              |EFULS;exp;2ULS;32| |EFULS;log;2ULS;33| |EFULS;sin;2ULS;34|
              |EFULS;cos;2ULS;35| |EFULS;tan;2ULS;36| |EFULS;cot;2ULS;37|
              |EFULS;sec;2ULS;38| |EFULS;csc;2ULS;39| |EFULS;asin;2ULS;40|
              |EFULS;acos;2ULS;41| |EFULS;asec;2ULS;42| |EFULS;acsc;2ULS;43|
              |EFULS;sinh;2ULS;44| |EFULS;cosh;2ULS;45| |EFULS;tanh;2ULS;46|
              |EFULS;coth;2ULS;47| |EFULS;sech;2ULS;48| |EFULS;csch;2ULS;49|
              |EFULS;asinh;2ULS;50| |EFULS;acosh;2ULS;51| |EFULS;atanh;2ULS;52|
              |EFULS;acoth;2ULS;53| |EFULS;asech;2ULS;54| |EFULS;acsch;2ULS;55|
              |EFULS;atan;2ULS;56| |EFULS;acot;2ULS;57|)
           '#(|tanhIfCan| 314 |tanh| 319 |tanIfCan| 324 |tan| 329 |sinhIfCan|
              334 |sinh| 339 |sinIfCan| 344 |sin| 349 |sechIfCan| 354 |sech|
              359 |secIfCan| 364 |sec| 369 |nthRootIfCan| 374 |logIfCan| 380
              |log| 385 |expIfCan| 390 |exp| 395 |cschIfCan| 400 |csch| 405
              |cscIfCan| 410 |csc| 415 |cothIfCan| 420 |coth| 425 |cotIfCan|
              430 |cot| 435 |coshIfCan| 440 |cosh| 445 |cosIfCan| 450 |cos| 455
              |atanhIfCan| 460 |atanh| 465 |atanIfCan| 470 |atan| 475
              |asinhIfCan| 480 |asinh| 485 |asinIfCan| 490 |asin| 495
              |asechIfCan| 500 |asech| 505 |asecIfCan| 510 |asec| 515
              |acschIfCan| 520 |acsch| 525 |acscIfCan| 530 |acsc| 535
              |acothIfCan| 540 |acoth| 545 |acotIfCan| 550 |acot| 555
              |acoshIfCan| 560 |acosh| 565 |acosIfCan| 570 |acos| 575 ^ 580)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|PartialTranscendentalFunctions| 8))
                             (|makeByteWordVec2| 137
                                                 '(0 6 0 12 0 7 0 13 2 7 6 0 14
                                                   15 0 6 0 16 2 6 17 0 0 18 1
                                                   20 0 19 21 1 20 0 0 22 2 7 0
                                                   0 20 23 0 7 0 24 1 8 19 0 25
                                                   2 8 6 0 19 26 1 6 17 0 27 2
                                                   8 0 19 0 28 2 8 0 6 19 29 2
                                                   8 0 0 0 30 1 8 7 0 31 1 8 0
                                                   7 32 1 20 19 0 35 1 20 19 0
                                                   36 2 8 0 0 19 37 2 0 8 8 20
                                                   38 1 8 39 0 40 1 7 0 0 41 1
                                                   7 0 0 43 1 7 0 0 45 1 7 0 0
                                                   47 1 7 0 0 49 1 7 0 0 51 1 7
                                                   0 0 53 1 7 0 0 55 1 7 0 0 57
                                                   1 7 0 0 59 1 7 0 0 61 1 7 0
                                                   0 63 1 7 0 0 65 1 7 0 0 67 1
                                                   7 0 0 69 1 7 0 0 71 1 7 73 0
                                                   74 1 76 75 73 77 1 7 0 73 78
                                                   1 8 79 0 80 2 8 19 0 19 85 2
                                                   6 0 0 0 86 1 6 0 0 87 1 6 88
                                                   0 89 2 20 0 19 19 90 0 6 0
                                                   91 2 6 0 20 0 92 0 20 0 93 2
                                                   20 17 0 0 94 0 8 0 95 1 20 0
                                                   0 96 1 6 0 0 97 2 8 0 0 0 98
                                                   1 8 0 6 99 1 8 0 0 100 1 8 0
                                                   0 101 1 6 0 0 103 2 8 0 0 0
                                                   104 1 76 106 73 107 1 0 33 8
                                                   108 1 0 8 8 126 1 0 33 8 81
                                                   1 0 8 8 116 1 0 33 8 56 1 0
                                                   8 8 124 1 0 33 8 44 1 0 8 8
                                                   114 1 0 33 8 110 1 0 8 8 128
                                                   1 0 33 8 83 1 0 8 8 118 2 0
                                                   33 8 14 34 1 0 33 8 72 1 0 8
                                                   8 113 1 0 33 8 42 1 0 8 8
                                                   112 1 0 33 8 111 1 0 8 8 129
                                                   1 0 33 8 84 1 0 8 8 119 1 0
                                                   33 8 109 1 0 8 8 127 1 0 33
                                                   8 82 1 0 8 8 117 1 0 33 8 58
                                                   1 0 8 8 125 1 0 33 8 46 1 0
                                                   8 8 115 1 0 33 8 64 1 0 8 8
                                                   132 1 0 33 8 102 1 0 8 8 136
                                                   1 0 33 8 60 1 0 8 8 130 1 0
                                                   33 8 48 1 0 8 8 120 1 0 33 8
                                                   68 1 0 8 8 134 1 0 33 8 52 1
                                                   0 8 8 122 1 0 33 8 70 1 0 8
                                                   8 135 1 0 33 8 54 1 0 8 8
                                                   123 1 0 33 8 66 1 0 8 8 133
                                                   1 0 33 8 105 1 0 8 8 137 1 0
                                                   33 8 62 1 0 8 8 131 1 0 33 8
                                                   50 1 0 8 8 121 2 1 8 8 20
                                                   38)))))
           '|lookupComplete|)) 
