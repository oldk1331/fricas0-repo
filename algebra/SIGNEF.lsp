
(/VERSIONCHECK 2) 

(DEFUN |SIGNEF;sign;FSOcU;1| (|f| |x| |a| $)
  (COND ((NULL (SPADCALL |f| (QREFELT $ 10))) (CONS 1 "failed"))
        ('T (|SIGNEF;insign| |f| |x| |a| 0 $)))) 

(DEFUN |SIGNEF;sign;FSFSU;2| (|f| |x| |a| |st| $)
  (COND ((NULL (SPADCALL |f| (QREFELT $ 10))) (CONS 1 "failed"))
        ('T (|SIGNEF;psign| |f| |x| |a| |st| 0 $)))) 

(DEFUN |SIGNEF;sign;FU;3| (|f| $)
  (PROG (#1=#:G200 |r| |f2| |f2u| |mapfun| #2=#:G199 |ud| |un|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (EXIT
         (COND ((NULL (SPADCALL |f| (QREFELT $ 10))) (CONS 1 "failed"))
               ('T
                (SEQ
                 (SEQ
                  (LETT |un| (|SIGNEF;smpsign| (SPADCALL |f| (QREFELT $ 18)) $)
                        . #3=(|SIGNEF;sign;FU;3|))
                  (EXIT
                   (COND
                    ((QEQCAR |un| 0)
                     (SEQ
                      (LETT |ud|
                            (|SIGNEF;smpsign| (SPADCALL |f| (QREFELT $ 19)) $)
                            . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |ud| 0)
                         (PROGN
                          (LETT #2# (CONS 0 (* (QCDR |un|) (QCDR |ud|))) . #3#)
                          (GO #2#))))))))))
                 (COND
                  ((NULL (NULL (SPADCALL |f| (QREFELT $ 21))))
                   (EXIT (CONS 1 "failed"))))
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL "rootOf" (QREFELT $ 22))
                              (SPADCALL (ELT $ 24)
                                        (SPADCALL |f| (QREFELT $ 26))
                                        (QREFELT $ 29))
                              (QREFELT $ 30))
                    (CONS 1 "failed"))
                   (#4='T
                    (SEQ
                     (COND
                      ((|HasCategory| (QREFELT $ 6)
                                      (LIST '|ConvertibleTo| '(|Float|)))
                       (SEQ
                        (LETT |mapfun| (CONS #'|SIGNEF;sign;FU;3!0| $) . #3#)
                        (LETT |f2u|
                              (|trappedSpadEval|
                               (SPADCALL |mapfun| |f| (QREFELT $ 38)))
                              . #3#)
                        (EXIT
                         (COND ((QEQCAR |f2u| 1) "failed")
                               (#4#
                                (SEQ (LETT |f2| (QCDR |f2u|) . #3#)
                                     (LETT |r| (SPADCALL |f2| (QREFELT $ 40))
                                           . #3#)
                                     (COND
                                      ((QEQCAR |r| 1)
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed") . #3#)
                                        (GO #1#))))
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QCDR |r|) (QREFELT $ 41))
                                        (PROGN
                                         (LETT #1# (CONS 0 -1) . #3#)
                                         (GO #1#)))
                                       ((SPADCALL (QCDR |r|) (QREFELT $ 44))
                                        (PROGN
                                         (LETT #1# (CONS 0 1) . #3#)
                                         (GO #1#)))
                                       ((SPADCALL (QCDR |r|) (QREFELT $ 45))
                                        (PROGN
                                         (LETT #1# (CONS 0 0) . #3#)
                                         (GO #1#)))
                                       (#4# "failed"))))))))))
                     (EXIT (CONS 1 "failed"))))))))))
        #2# (EXIT #2#)))
      #1# (EXIT #1#))))) 

(DEFUN |SIGNEF;sign;FU;3!0| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 32)) (QREFELT $ 34))) 

(DEFUN |SIGNEF;overRF| (|a| $)
  (PROG (|u| |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL |a| (QREFELT $ 48)) . #1=(|SIGNEF;overRF|))
          (EXIT
           (COND
            ((|eql_SI| |n| 0)
             (SEQ
              (LETT |u| (SPADCALL (SPADCALL |a| (QREFELT $ 51)) (QREFELT $ 53))
                    . #1#)
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     (#2='T (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 56))))))))
            (#2#
             (CONS 0
                   (SPADCALL |n| (SPADCALL (QREFELT $ 57))
                             (QREFELT $ 59)))))))))) 

(DEFUN |SIGNEF;ofesign| (|a| $)
  (PROG (|n|)
    (RETURN
     (COND
      ((SPADCALL (LETT |n| (SPADCALL |a| (QREFELT $ 48)) |SIGNEF;ofesign|) 0
                 (QREFELT $ 60))
       (CONS 0 |n|))
      ('T (SPADCALL (SPADCALL |a| (QREFELT $ 51)) (QREFELT $ 46))))))) 

(DEFUN |SIGNEF;insign| (|f| |x| |a| |m| $)
  (PROG (|ur| #1=#:G235 |ul| |s| |v| |n| |u| |eq| #2=#:G241 |ua| |uf|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |m| 10 (QREFELT $ 62)) (CONS 1 "failed"))
            (#3='T
             (SEQ
              (EXIT
               (SEQ
                (SEQ
                 (LETT |uf| (SPADCALL |f| (QREFELT $ 53))
                       . #4=(|SIGNEF;insign|))
                 (EXIT
                  (COND
                   ((QEQCAR |uf| 0)
                    (SEQ (LETT |ua| (|SIGNEF;overRF| |a| $) . #4#)
                         (EXIT
                          (COND
                           ((QEQCAR |ua| 0)
                            (PROGN
                             (LETT #2#
                                   (SPADCALL (QCDR |uf|) |x| (QCDR |ua|)
                                             (QREFELT $ 64))
                                   . #4#)
                             (GO #2#))))))))))
                (LETT |eq|
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| (QREFELT $ 65)) (QREFELT $ 66))
                       |a| (QREFELT $ 68))
                      . #4#)
                (LETT |u| (SPADCALL |f| |eq| (QREFELT $ 73)) . #4#)
                (EXIT
                 (COND ((QEQCAR |u| 2) (CONS 1 "failed"))
                       ((QEQCAR |u| 0)
                        (COND
                         ((SPADCALL
                           (LETT |n| (SPADCALL (QCDR |u|) (QREFELT $ 48))
                                 . #4#)
                           0 (QREFELT $ 60))
                          (CONS 0 |n|))
                         (#3#
                          (SEQ
                           (LETT |v| (SPADCALL (QCDR |u|) (QREFELT $ 51))
                                 . #4#)
                           (EXIT
                            (COND
                             ((SPADCALL |v| (|spadConstant| $ 50)
                                        (QREFELT $ 74))
                              (SEQ
                               (LETT |s|
                                     (|SIGNEF;insign|
                                      (SPADCALL |f| |x| (QREFELT $ 75)) |x| |a|
                                      (+ |m| 1) $)
                                     . #4#)
                               (EXIT
                                (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                                      (#3# (CONS 0 (- (* (QCDR |s|) |n|))))))))
                             (#3# (SPADCALL |v| (QREFELT $ 46)))))))))
                       (#3#
                        (COND
                         ((OR (QEQCAR (QCAR (QCDR |u|)) 1)
                              (QEQCAR (QCDR (QCDR |u|)) 1))
                          (CONS 1 "failed"))
                         ('T
                          (SEQ
                           (LETT |ul|
                                 (|SIGNEF;ofesign|
                                  (PROG2 (LETT #1# (QCAR (QCDR |u|)) . #4#)
                                      (QCDR #1#)
                                    (|check_union| (QEQCAR #1# 0)
                                                   (|OrderedCompletion|
                                                    (QREFELT $ 7))
                                                   #1#))
                                  $)
                                 . #4#)
                           (EXIT
                            (COND ((QEQCAR |ul| 1) (CONS 1 "failed"))
                                  (#3#
                                   (SEQ
                                    (LETT |ur|
                                          (|SIGNEF;ofesign|
                                           (PROG2
                                               (LETT #1# (QCDR (QCDR |u|))
                                                     . #4#)
                                               (QCDR #1#)
                                             (|check_union| (QEQCAR #1# 0)
                                                            (|OrderedCompletion|
                                                             (QREFELT $ 7))
                                                            #1#))
                                           $)
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((OR (QEQCAR |ur| 1)
                                           (NULL
                                            (EQL (QCDR |ul|) (QCDR |ur|))))
                                       (CONS 1 "failed"))
                                      ('T |ul|)))))))))))))))
              #2# (EXIT #2#)))))))) 

(DEFUN |SIGNEF;psign| (|f| |x| |a| |st| |m| $)
  (PROG (|s| |v| |n| |u| |eq| #1=#:G257 |ua| |uf|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |m| 10 (QREFELT $ 62)) (CONS 1 "failed"))
            ((SPADCALL |f| (|spadConstant| $ 50) (QREFELT $ 74)) (CONS 0 0))
            (#2='T
             (SEQ
              (EXIT
               (SEQ
                (SEQ
                 (LETT |uf| (SPADCALL |f| (QREFELT $ 53))
                       . #3=(|SIGNEF;psign|))
                 (EXIT
                  (COND
                   ((QEQCAR |uf| 0)
                    (SEQ (LETT |ua| (SPADCALL |a| (QREFELT $ 53)) . #3#)
                         (EXIT
                          (COND
                           ((QEQCAR |ua| 0)
                            (PROGN
                             (LETT #1#
                                   (SPADCALL (QCDR |uf|) |x| (QCDR |ua|) |st|
                                             (QREFELT $ 76))
                                   . #3#)
                             (GO #1#))))))))))
                (LETT |eq|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 65)) |a|
                                (QREFELT $ 78))
                      . #3#)
                (LETT |u| (SPADCALL |f| |eq| |st| (QREFELT $ 79)) . #3#)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ((QEQCAR |u| 0)
                        (COND
                         ((SPADCALL
                           (LETT |n| (SPADCALL (QCDR |u|) (QREFELT $ 48))
                                 . #3#)
                           0 (QREFELT $ 60))
                          (CONS 0 |n|))
                         (#2#
                          (SEQ
                           (LETT |v| (SPADCALL (QCDR |u|) (QREFELT $ 51))
                                 . #3#)
                           (EXIT
                            (COND
                             ((SPADCALL |v| (|spadConstant| $ 50)
                                        (QREFELT $ 74))
                              (SEQ
                               (LETT |s|
                                     (|SIGNEF;psign|
                                      (SPADCALL |f| |x| (QREFELT $ 75)) |x| |a|
                                      |st| (+ |m| 1) $)
                                     . #3#)
                               (EXIT
                                (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                                      (#2#
                                       (CONS 0
                                             (* (SPADCALL |st| (QREFELT $ 81))
                                                (QCDR |s|))))))))
                             (#2# (SPADCALL |v| (QREFELT $ 46)))))))))))))
              #1# (EXIT #1#)))))))) 

(DEFUN |SIGNEF;smpsign2| (|p| $)
  (PROG (|ans| #1=#:G271 |u| #2=#:G272 |term| |s| |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |r| (SPADCALL |p| (QREFELT $ 84)) . #3=(|SIGNEF;smpsign2|))
            (EXIT
             (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 85)))
                   (#4='T
                    (SEQ
                     (LETT |u|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (LETT |s| (SPADCALL |p| (QREFELT $ 87)) . #3#)
                              (QREFELT $ 89))
                             (QREFELT $ 90))
                            (QREFELT $ 85))
                           . #3#)
                     (EXIT
                      (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                            (#4#
                             (SEQ (LETT |ans| (QCDR |u|) . #3#)
                                  (SEQ (LETT |term| NIL . #3#)
                                       (LETT #2# (SPADCALL |s| (QREFELT $ 94))
                                             . #3#)
                                       G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN
                                              (LETT |term| (CAR #2#) . #3#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((ODDP (QVELT |term| 2))
                                           (SEQ
                                            (LETT |u|
                                                  (|SIGNEF;sqfrSign|
                                                   (QVELT |term| 1) $)
                                                  . #3#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |u| 1)
                                               (PROGN
                                                (LETT #1# (CONS 1 "failed")
                                                      . #3#)
                                                (GO #1#)))
                                              ('T
                                               (LETT |ans| (* |ans| (QCDR |u|))
                                                     . #3#)))))))))
                                       (LETT #2# (CDR #2#) . #3#) (GO G190)
                                       G191 (EXIT NIL))
                                  (EXIT (CONS 0 |ans|))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |SIGNEF;smpsign| (|p| $)
  (PROG (|zu| |up| |b| |a| |x0| |s0| |k| |vl| |resu|)
    (RETURN
     (SEQ (LETT |resu| (|SIGNEF;smpsign2| |p| $) . #1=(|SIGNEF;smpsign|))
          (EXIT
           (COND ((QEQCAR |resu| 0) |resu|)
                 (#2='T
                  (SEQ (LETT |vl| (SPADCALL |p| (QREFELT $ 99)) . #1#)
                       (EXIT
                        (COND
                         ((EQL (LENGTH |vl|) 1)
                          (SEQ (LETT |k| (|SPADfirst| |vl|) . #1#)
                               (LETT |s0| (|SIGNEF;kerSign| |k| $) . #1#)
                               (LETT |a| (SPADCALL (QREFELT $ 100)) . #1#)
                               (LETT |b| (SPADCALL (QREFELT $ 101)) . #1#)
                               (LETT |x0| (|spadConstant| $ 50) . #1#)
                               (COND
                                ((QEQCAR |s0| 0)
                                 (SEQ
                                  (COND
                                   ((SPADCALL |s0| (CONS 0 1) (QREFELT $ 102))
                                    (LETT |a| (|spadConstant| $ 103) . #1#)))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |s0| (CONS 0 -1)
                                               (QREFELT $ 102))
                                     (LETT |b| (|spadConstant| $ 103)
                                           . #1#)))))))
                               (COND
                                ((SPADCALL |k| '|atan| (QREFELT $ 105))
                                 (SEQ
                                  (LETT |a|
                                        (COND
                                         ((SPADCALL |a| (|spadConstant| $ 103)
                                                    (QREFELT $ 106))
                                          |a|)
                                         (#2#
                                          (SPADCALL
                                           (SPADCALL (|spadConstant| $ 43)
                                                     (QREFELT $ 107))
                                           (QREFELT $ 66))))
                                        . #1#)
                                  (EXIT
                                   (LETT |b|
                                         (COND
                                          ((SPADCALL |b| (|spadConstant| $ 103)
                                                     (QREFELT $ 106))
                                           |b|)
                                          (#2#
                                           (SPADCALL (|spadConstant| $ 43)
                                                     (QREFELT $ 66))))
                                         . #1#)))))
                               (LETT |up|
                                     (SPADCALL (ELT $ 108)
                                               (SPADCALL |p| (QREFELT $ 110))
                                               (QREFELT $ 114))
                                     . #1#)
                               (LETT |zu|
                                     (SPADCALL |up| |a| |b| 'T (QREFELT $ 117))
                                     . #1#)
                               (EXIT
                                (COND
                                 ((OR (QEQCAR |zu| 1) (QCDR |zu|))
                                  (CONS 1 "failed"))
                                 ('T
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |up| (QREFELT $ 97) |x0|
                                              (QREFELT $ 118))
                                    (QREFELT $ 119))
                                   (QREFELT $ 46)))))))
                         (#2# (CONS 1 "failed")))))))))))) 

(DEFUN |SIGNEF;sqfrSign| (|p| $)
  (PROG (|u| |l|)
    (RETURN
     (SEQ
      (LETT |u|
            (|SIGNEF;termSign|
             (|SPADfirst|
              (LETT |l| (SPADCALL |p| (QREFELT $ 121))
                    . #1=(|SIGNEF;sqfrSign|)))
             $)
            . #1#)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T (|SIGNEF;listSign| (CDR |l|) (QCDR |u|) $)))))))) 

(DEFUN |SIGNEF;listSign| (|l| |s| $)
  (PROG (#1=#:G290 |u| #2=#:G291 |term|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |term| NIL . #3=(|SIGNEF;listSign|)) (LETT #2# |l| . #3#)
             G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |term| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ (LETT |u| (|SIGNEF;termSign| |term| $) . #3#)
                  (EXIT
                   (COND
                    ((OR (QEQCAR |u| 1) (NULL (EQL |s| (QCDR |u|))))
                     (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |s|))))
      #1# (EXIT #1#))))) 

(DEFUN |SIGNEF;termSign| (|term| $)
  (PROG (#1=#:G296 #2=#:G299 #3=#:G294 |vs| #4=#:G300 |lv| |var| |us|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |us| (SPADCALL (SPADCALL |term| (QREFELT $ 122)) (QREFELT $ 85))
              . #5=(|SIGNEF;termSign|))
        (EXIT
         (COND ((QEQCAR |us| 1) (CONS 1 "failed"))
               ('T
                (SEQ
                 (SEQ
                  (EXIT
                   (SEQ (LETT |var| NIL . #5#)
                        (LETT #4#
                              (LETT |lv| (SPADCALL |term| (QREFELT $ 99))
                                    . #5#)
                              . #5#)
                        G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |var| (CAR #4#) . #5#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((ODDP (SPADCALL |term| |var| (QREFELT $ 123)))
                            (PROGN
                             (LETT #1#
                                   (SEQ
                                    (EXIT
                                     (SEQ
                                      (COND
                                       ((NULL (CDR |lv|))
                                        (SEQ
                                         (LETT |vs|
                                               (|SIGNEF;kerSign|
                                                (|SPADfirst| |lv|) $)
                                               . #5#)
                                         (EXIT
                                          (COND
                                           ((QEQCAR |vs| 0)
                                            (PROGN
                                             (LETT #3#
                                                   (PROGN
                                                    (LETT #2#
                                                          (CONS 0
                                                                (* (QCDR |us|)
                                                                   (QCDR
                                                                    |vs|)))
                                                          . #5#)
                                                    (GO #2#))
                                                   . #5#)
                                             (GO #3#))))))))
                                      (EXIT
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed") . #5#)
                                        (GO #2#)))))
                                    #3# (EXIT #3#))
                                   . #5#)
                             (GO #1#))))))
                        (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
                  #1# (EXIT #1#))
                 (EXIT (CONS 0 (QCDR |us|)))))))))
      #2# (EXIT #2#))))) 

(DEFUN |SIGNEF;kerSign| (|k| $)
  (PROG (|s| |arg| |op|)
    (RETURN
     (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 124)) . #1=(|SIGNEF;kerSign|))
          (COND
           ((OR (SPADCALL |op| '|pi| (QREFELT $ 125))
                (OR (SPADCALL |op| '|exp| (QREFELT $ 125))
                    (OR (SPADCALL |op| '|cosh| (QREFELT $ 125))
                        (SPADCALL |op| '|sech| (QREFELT $ 125)))))
            (EXIT (CONS 0 1))))
          (EXIT
           (COND
            ((NULL (LETT |arg| (SPADCALL |k| (QREFELT $ 127)) . #1#))
             (CONS 1 "failed"))
            (#2='T
             (SEQ
              (LETT |s| (SPADCALL (|SPADfirst| |arg|) (QREFELT $ 46)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |s| 1)
                 (COND
                  ((SPADCALL |op| '|nthRoot| (QREFELT $ 125))
                   (COND
                    ((SPADCALL
                      (SPADCALL (SPADCALL |arg| (QREFELT $ 128))
                                (QREFELT $ 129))
                      (QREFELT $ 130))
                     (CONS 0 1))
                    (#2# (CONS 1 "failed"))))
                  (#2# (CONS 1 "failed"))))
                ((SPADCALL |op| '|log| (QREFELT $ 125))
                 (COND ((< (QCDR |s|) 0) (CONS 1 "failed"))
                       (#2#
                        (SPADCALL
                         (SPADCALL (|SPADfirst| |arg|) (|spadConstant| $ 43)
                                   (QREFELT $ 131))
                         (QREFELT $ 46)))))
                ((OR
                  (OR (SPADCALL |op| '|tanh| (QREFELT $ 125))
                      (OR (SPADCALL |op| '|sinh| (QREFELT $ 125))
                          (OR (SPADCALL |op| '|csch| (QREFELT $ 125))
                              (SPADCALL |op| '|coth| (QREFELT $ 125)))))
                  (OR (SPADCALL |op| '|atan| (QREFELT $ 125))
                      (OR (SPADCALL |op| '|Si| (QREFELT $ 125))
                          (OR (SPADCALL |op| '|fresnelS| (QREFELT $ 125))
                              (SPADCALL |op| '|fresnelC| (QREFELT $ 125))))))
                 |s|)
                ('T
                 (COND
                  ((SPADCALL |op| '|nthRoot| (QREFELT $ 125))
                   (COND
                    ((SPADCALL
                      (SPADCALL (SPADCALL |arg| (QREFELT $ 128))
                                (QREFELT $ 129))
                      (QREFELT $ 130))
                     (COND ((< (QCDR |s|) 0) (CONS 1 "failed")) (#2# |s|)))
                    (#2# |s|)))
                  (#2# (CONS 1 "failed")))))))))))))) 

(DECLAIM (NOTINLINE |ElementaryFunctionSign;|)) 

(DEFUN |ElementaryFunctionSign| (&REST #1=#:G321)
  (PROG ()
    (RETURN
     (PROG (#2=#:G322)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ElementaryFunctionSign|)
                                           '|domainEqualList|)
                . #3=(|ElementaryFunctionSign|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ElementaryFunctionSign;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ElementaryFunctionSign|))))))))))) 

(DEFUN |ElementaryFunctionSign;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryFunctionSign|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ElementaryFunctionSign| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 132) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ElementaryFunctionSign|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 97 (SPADCALL (QREFELT $ 96)))
      $)))) 

(MAKEPROP '|ElementaryFunctionSign| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (|TrigonometricManipulations| 6 7) (0 . |real?|)
              (|Union| 58 '"failed") (|Symbol|) (|OrderedCompletion| 7)
              |SIGNEF;sign;FSOcU;1| (|String|) |SIGNEF;sign;FSFSU;2|
              (|SparseMultivariatePolynomial| 6 (|Kernel| $)) (5 . |numer|)
              (10 . |denom|) (|List| 12) (15 . |variables|) (20 . |coerce|)
              (|BasicOperator|) (25 . |name|) (|List| 23) (30 . |operators|)
              (|Mapping| 12 23) (|ListFunctions2| 23 12) (35 . |map|)
              (41 . |member?|) (|Float|) (47 . |convert|) (|Interval| 31)
              (52 . |interval|) (|Expression| 33) (|Mapping| 33 6)
              (|FunctionSpaceFunctions2| 6 7 33 35) (57 . |map|)
              (|Union| 33 '"failed") (63 . |retractIfCan|) (68 . |negative?|)
              (73 . |One|) (77 . |One|) (81 . |positive?|) (86 . |zero?|)
              |SIGNEF;sign;FU;3| (|SingleInteger|) (91 . |whatInfinity|)
              (96 . |Zero|) (100 . |Zero|) (104 . |retract|)
              (|Union| 54 '"failed") (109 . |retractIfCan|)
              (|Fraction| (|Polynomial| 6)) (|OrderedCompletion| 54)
              (114 . |coerce|) (119 . |plusInfinity|) (|Integer|) (123 . *)
              (129 . ~=) (|NonNegativeInteger|) (135 . >)
              (|RationalFunctionSign| 6) (141 . |sign|) (148 . |coerce|)
              (153 . |coerce|) (|Equation| 13) (158 . |equation|)
              (|Union| 13 '"failed")
              (|Record| (|:| |leftHandLimit| 69) (|:| |rightHandLimit| 69))
              (|Union| 13 70 '"failed") (|PowerSeriesLimitPackage| 6 7)
              (164 . |limit|) (170 . =) (176 . |differentiate|) (182 . |sign|)
              (|Equation| 7) (190 . |equation|) (196 . |limit|)
              (|ToolsForSign| 6) (203 . |direction|) (|Union| 6 '"failed")
              (|SparseMultivariatePolynomial| 6 104) (208 . |retractIfCan|)
              (213 . |sign|) (|Factored| $) (218 . |squareFree|)
              (|Factored| 83) (223 . |unit|) (228 . |retract|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 91) (|:| |fctr| 83) (|:| |xpnt| 58))
              (|List| 92) (233 . |factorList|) (|SingletonAsOrderedSet|)
              (238 . |create|) '|sas| (|List| 104) (242 . |variables|)
              (247 . |minusInfinity|) (251 . |plusInfinity|) (255 . =)
              (261 . |Zero|) (|Kernel| 7) (265 . |is?|) (271 . =) (277 . -)
              (282 . |coerce|) (|SparseUnivariatePolynomial| 6)
              (287 . |univariate|) (|SparseUnivariatePolynomial| 7)
              (|Mapping| 7 6) (|SparseUnivariatePolynomialFunctions2| 6 7)
              (292 . |map|) (|Union| 8 '"failed")
              (|DefiniteIntegrationTools| 6 7) (298 . |checkForZero|)
              (306 . |eval|) (313 . |retract|) (|List| $) (318 . |monomials|)
              (323 . |leadingCoefficient|) (328 . |degree|) (334 . |operator|)
              (339 . |is?|) (|List| 7) (345 . |argument|) (350 . |second|)
              (355 . |retract|) (360 . |even?|) (365 . -))
           '#(|sign| 371) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 131
                                                 '(1 9 8 7 10 1 7 17 0 18 1 7
                                                   17 0 19 1 7 20 0 21 1 12 0
                                                   15 22 1 23 12 0 24 1 7 25 0
                                                   26 2 28 20 27 25 29 2 20 8
                                                   12 0 30 1 6 31 0 32 1 33 0
                                                   31 34 2 37 35 36 7 38 1 35
                                                   39 0 40 1 33 8 0 41 0 6 0 42
                                                   0 7 0 43 1 33 8 0 44 1 33 8
                                                   0 45 1 13 47 0 48 0 6 0 49 0
                                                   7 0 50 1 13 7 0 51 1 7 52 0
                                                   53 1 55 0 54 56 0 55 0 57 2
                                                   55 0 58 0 59 2 58 8 0 0 60 2
                                                   61 8 0 0 62 3 63 11 54 12 55
                                                   64 1 7 0 12 65 1 13 0 7 66 2
                                                   67 0 13 13 68 2 72 71 7 67
                                                   73 2 7 8 0 0 74 2 7 0 0 12
                                                   75 4 63 11 54 12 54 15 76 2
                                                   77 0 7 7 78 3 72 69 7 77 15
                                                   79 1 80 58 15 81 1 83 82 0
                                                   84 1 80 11 6 85 1 83 86 0 87
                                                   1 88 83 0 89 1 83 6 0 90 1
                                                   88 93 0 94 0 95 0 96 1 83 98
                                                   0 99 0 13 0 100 0 13 0 101 2
                                                   11 8 0 0 102 0 13 0 103 2
                                                   104 8 0 12 105 2 13 8 0 0
                                                   106 1 7 0 0 107 1 7 0 6 108
                                                   1 83 109 0 110 2 113 111 112
                                                   109 114 4 116 115 111 13 13
                                                   8 117 3 111 0 0 95 7 118 1
                                                   111 7 0 119 1 83 120 0 121 1
                                                   83 6 0 122 2 83 61 0 104 123
                                                   1 104 23 0 124 2 23 8 0 12
                                                   125 1 104 126 0 127 1 126 7
                                                   0 128 1 7 58 0 129 1 58 8 0
                                                   130 2 7 0 0 0 131 1 0 11 7
                                                   46 4 0 11 7 12 7 15 16 3 0
                                                   11 7 12 13 14)))))
           '|lookupComplete|)) 
