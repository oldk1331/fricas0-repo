
(SDEFUN |DFINTTLS;variation|
        ((|p| (|SparseUnivariatePolynomial| F)) (|a| (F))
         ($ (|Union| (|Integer|) "failed")))
        (|DFINTTLS;var|
         (SPADCALL |p|
                   (SPADCALL (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 12))
                             (SPADCALL |a| (QREFELT $ 13)) (QREFELT $ 14))
                   (QREFELT $ 15))
         $)) 

(SDEFUN |DFINTTLS;keeprec?|
        ((|a| (|Fraction| (|Integer|)))
         (|rec|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|)))))
         ($ (|Boolean|)))
        (COND ((SPADCALL |a| (QCDR |rec|) (QREFELT $ 18)) 'T)
              ('T (SPADCALL |a| (QCAR |rec|) (QREFELT $ 19))))) 

(SDEFUN |DFINTTLS;checkHalfAx|
        ((|p| (|SparseUnivariatePolynomial| F)) (|a| (F)) (|d| (|Integer|))
         (|incl?| (|Boolean|)) ($ (|Union| (|Boolean|) "failed")))
        (|DFINTTLS;posRoot|
         (SPADCALL |p|
                   (SPADCALL |d|
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 12))
                              (SPADCALL |a| (QREFELT $ 13)) (QREFELT $ 14))
                             (QREFELT $ 21))
                   (QREFELT $ 15))
         |incl?| $)) 

(SDEFUN |DFINTTLS;ignore?;SB;4| ((|str| (|String|)) ($ (|Boolean|)))
        (COND ((EQUAL |str| "noPole") 'T)
              ('T (|error| "integrate: last argument must be 'noPole'")))) 

(SDEFUN |DFINTTLS;computeInt;KF2OcBU;5|
        ((|k| (|Kernel| F)) (|f| (F)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) (|eval?| (|Boolean|))
         ($ (|Union| (|OrderedCompletion| F) "failed")))
        (SPROG
         ((#1=#:G161 NIL) (|ia| #2=(|Union| (|OrderedCompletion| F) "failed"))
          (|ib| #2#))
         (SEQ
          (COND ((SPADCALL |f| '|integral| (QREFELT $ 25)) (CONS 1 "failed"))
                (#3='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (COND
                     ((NULL |eval?|) (LETT |f| (|DFINTTLS;mkLogPos| |f| $))))
                    (SEQ
                     (LETT |ib|
                           (|DFINTTLS;findLimit| |f| |k| |b| "left" |eval?| $))
                     (EXIT
                      (COND
                       ((QEQCAR |ib| 1)
                        (PROGN (LETT #1# (CONS 1 #4="failed")) (GO #5=#:G155)))
                       (#3#
                        (SEQ
                         (LETT |ia|
                               (|DFINTTLS;findLimit| |f| |k| |a| "right"
                                |eval?| $))
                         (EXIT
                          (COND
                           ((QEQCAR |ia| 1)
                            (PROGN (LETT #1# (CONS 1 #4#)) (GO #5#))))))))))
                    (COND
                     ((SPADCALL (QCDR |ia|) (QREFELT $ 27))
                      (COND
                       ((SPADCALL (QCDR |ia|) (QCDR |ib|) (QREFELT $ 28))
                        (EXIT (CONS 1 "failed"))))))
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |ib|)
                                     (SPADCALL (QCDR |ia|) (QREFELT $ 29))
                                     (QREFELT $ 30))))))
                  #5# (EXIT #1#))))))) 

(SDEFUN |DFINTTLS;findLimit|
        ((|f| (F)) (|k| (|Kernel| F)) (|a| (|OrderedCompletion| F))
         (|dir| (|String|)) (|eval?| (|Boolean|))
         ($ (|Union| (|OrderedCompletion| F) "failed")))
        (SPROG
         ((|u|
           (|Union| (|OrderedCompletion| F)
                    (|Record|
                     (|:| |leftHandLimit|
                          (|Union| (|OrderedCompletion| F) #1="failed"))
                     (|:| |rightHandLimit|
                          (|Union| (|OrderedCompletion| F) #1#)))
                    "failed"))
          (|r| (|Union| F "failed")))
         (SEQ (LETT |r| (SPADCALL |a| (QREFELT $ 35)))
              (EXIT
               (COND
                ((QEQCAR |r| 0)
                 (COND
                  (|eval?|
                   (CONS 0
                         (SPADCALL
                          (|DFINTTLS;mkLogPos|
                           (SPADCALL |f| |k| (QCDR |r|) (QREFELT $ 37)) $)
                          (QREFELT $ 38))))
                  (#2='T
                   (SEQ
                    (LETT |u|
                          (SPADCALL |f|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 39))
                                              (QCDR |r|) (QREFELT $ 41))
                                    |dir| (QREFELT $ 43)))
                    (EXIT
                     (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                           (#2# (CONS 1 "failed"))))))))
                (#2#
                 (SEQ
                  (LETT |u|
                        (SPADCALL |f|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |k| (QREFELT $ 39))
                                             (QREFELT $ 38))
                                   |a| (QREFELT $ 45))
                                  (QREFELT $ 48)))
                  (EXIT
                   (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                         (#2# (CONS 1 "failed"))))))))))) 

(SDEFUN |DFINTTLS;mkLogPos| ((|f| (F)) ($ (F)))
        (SPROG
         ((|lv| (|List| F)) (|lk| (|List| (|Kernel| F)))
          (|v| (|Union| F "positive")) (#1=#:G186 NIL) (|k| NIL))
         (SEQ (LETT |lk| NIL) (LETT |lv| NIL)
              (SEQ (LETT |k| NIL) (LETT #1# (SPADCALL |f| (QREFELT $ 50))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |k| '|log| (QREFELT $ 51))
                       (SEQ (LETT |v| (|DFINTTLS;mkKerPos| |k| $))
                            (EXIT
                             (COND
                              ((QEQCAR |v| 0)
                               (SEQ (LETT |lk| (CONS |k| |lk|))
                                    (EXIT
                                     (LETT |lv|
                                           (CONS (QCDR |v|) |lv|))))))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |f| |lk| |lv| (QREFELT $ 53)))))) 

(SDEFUN |DFINTTLS;mkKerPos| ((|k| (|Kernel| F)) ($ (|Union| F "positive")))
        (SPROG ((|u| (|Union| (|Boolean|) "failed")) (|f| (F)))
               (SEQ
                (LETT |u|
                      (|DFINTTLS;negative|
                       (LETT |f| (|SPADfirst| (SPADCALL |k| (QREFELT $ 55))))
                       $))
                (EXIT
                 (COND
                  ((QEQCAR |u| 1)
                   (CONS 0
                         (SPADCALL
                          (SPADCALL (SPADCALL |f| 2 (QREFELT $ 57))
                                    (QREFELT $ 58))
                          (SPADCALL 2 (QREFELT $ 59)) (QREFELT $ 60))))
                  ((QCDR |u|)
                   (CONS 0
                         (SPADCALL (SPADCALL |f| (QREFELT $ 61))
                                   (QREFELT $ 58))))
                  ('T (CONS 1 "positive"))))))) 

(SDEFUN |DFINTTLS;negative| ((|f| (F)) ($ (|Union| (|Boolean|) "failed")))
        (SPROG ((|u| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |u| (SPADCALL |f| (QREFELT $ 64)))
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                           ('T (CONS 0 (< (QCDR |u|) 0)))))))) 

(SDEFUN |DFINTTLS;checkForZero;PS2OcBU;10|
        ((|p| (|Polynomial| R)) (|x| (|Symbol|)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) (|incl?| (|Boolean|))
         ($ (|Union| (|Boolean|) "failed")))
        (SPADCALL
         (SPADCALL (ELT $ 67) (SPADCALL |p| |x| (QREFELT $ 69)) (QREFELT $ 73))
         |a| |b| |incl?| (QREFELT $ 75))) 

(SDEFUN |DFINTTLS;checkForZero;Sup2OcBU;11|
        ((|q| (|SparseUnivariatePolynomial| F)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) (|incl?| (|Boolean|))
         ($ (|Union| (|Boolean|) "failed")))
        (SPROG
         ((|u| (|Union| (|Boolean|) "failed")) (#1=#:G225 NIL)
          (|i|
           (|Union|
            (|:| |fin|
                 (|Record| (|:| |left| (|Fraction| (|Integer|)))
                           (|:| |right| (|Fraction| (|Integer|)))))
            (|:| |halfinf|
                 (|Record| (|:| |endpoint| (|Fraction| (|Integer|)))
                           (|:| |dir| (|Integer|))))
            (|:| |all| "all") (|:| |failed| "failed")))
          (|d| (|Union| (|SparseUnivariatePolynomial| (|Integer|)) "failed")))
         (SEQ
          (COND ((SPADCALL |q| (QREFELT $ 77)) (CONS 0 NIL))
                (#2='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ (LETT |d| (|DFINTTLS;maprat| |q| $))
                         (EXIT
                          (COND
                           ((QEQCAR |d| 0)
                            (SEQ (LETT |i| (|DFINTTLS;intrat| |a| |b| $))
                                 (EXIT
                                  (COND
                                   ((NULL (QEQCAR |i| 3))
                                    (PROGN
                                     (LETT #1#
                                           (COND
                                            ((NULL
                                              (|DFINTTLS;findRealZero|
                                               (QCDR |d|) |i| |incl?| $))
                                             (CONS 0 NIL))
                                            (#2# (CONS 0 'T))))
                                     (GO #3=#:G222))))))))))
                    (LETT |u| (|DFINTTLS;checkBudan| |q| |a| |b| |incl?| $))
                    (EXIT
                     (COND
                      ((QEQCAR |u| 1)
                       (COND (|incl?| (|DFINTTLS;checkDeriv| |q| |a| |b| $))
                             (#2# (CONS 1 "failed"))))
                      (#2# (CONS 0 (QCDR |u|)))))))
                  #3# (EXIT #1#))))))) 

(SDEFUN |DFINTTLS;maprat|
        ((|p| (|SparseUnivariatePolynomial| F))
         ($ (|Union| (|SparseUnivariatePolynomial| (|Integer|)) "failed")))
        (SPROG
         ((|ans| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (#1=#:G240 NIL) (|r| (|Union| (|Fraction| (|Integer|)) "failed"))
          (|c| (F)))
         (SEQ
          (EXIT
           (SEQ (LETT |ans| (|spadConstant| $ 79))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |p| (|spadConstant| $ 80) (QREFELT $ 81)))
                       (GO G191)))
                     (SEQ
                      (LETT |r|
                            (SPADCALL (LETT |c| (SPADCALL |p| (QREFELT $ 82)))
                                      (QREFELT $ 84)))
                      (EXIT
                       (COND
                        ((QEQCAR |r| 1)
                         (PROGN (LETT #1# (CONS 1 "failed")) (GO #2=#:G239)))
                        ('T
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL (QCDR |r|)
                                                    (SPADCALL |p|
                                                              (QREFELT $ 85))
                                                    (QREFELT $ 86))
                                          (QREFELT $ 87)))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 88)))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (CONS 0
                       (SPADCALL (ELT $ 89)
                                 (QCAR (SPADCALL |ans| (QREFELT $ 92)))
                                 (QREFELT $ 96))))))
          #2# (EXIT #1#)))) 

(SDEFUN |DFINTTLS;intrat|
        ((|a| (|OrderedCompletion| F)) (|b| (|OrderedCompletion| F))
         ($
          (|Union|
           (|:| |fin|
                (|Record| (|:| |left| (|Fraction| (|Integer|)))
                          (|:| |right| (|Fraction| (|Integer|)))))
           (|:| |halfinf|
                (|Record| (|:| |endpoint| (|Fraction| (|Integer|)))
                          (|:| |dir| (|Integer|))))
           (|:| |all| #1="all") (|:| |failed| #2="failed"))))
        (SPROG
         ((|t| #3=(|Union| (|Fraction| (|Integer|)) "failed"))
          (|n| (|SingleInteger|)) (|q| #3#) (|r| (|Union| F "failed")))
         (SEQ
          (COND
           ((SPADCALL (LETT |n| (SPADCALL |a| (QREFELT $ 98))) 0
                      (QREFELT $ 99))
            (SEQ (LETT |r| (SPADCALL |b| (QREFELT $ 35)))
                 (EXIT
                  (COND ((QEQCAR |r| 1) (CONS 2 #1#))
                        (#4='T
                         (SEQ (LETT |q| (SPADCALL (QCDR |r|) (QREFELT $ 84)))
                              (EXIT
                               (COND ((QEQCAR |q| 1) (CONS 3 #2#))
                                     (#4#
                                      (CONS 1 (CONS (QCDR |q|) |n|)))))))))))
           (#4#
            (SEQ
             (LETT |q|
                   (SPADCALL (SPADCALL |a| (QREFELT $ 100)) (QREFELT $ 84)))
             (EXIT
              (COND ((QEQCAR |q| 1) (CONS 3 #2#))
                    ((SPADCALL (LETT |n| (SPADCALL |b| (QREFELT $ 98))) 0
                               (QREFELT $ 99))
                     (CONS 1 (CONS (QCDR |q|) |n|)))
                    (#4#
                     (SEQ
                      (LETT |t|
                            (SPADCALL (SPADCALL |b| (QREFELT $ 100))
                                      (QREFELT $ 84)))
                      (EXIT
                       (COND ((QEQCAR |t| 1) (CONS 3 #2#))
                             (#4#
                              (CONS 0 (CONS (QCDR |q|) (QCDR |t|)))))))))))))))) 

(SDEFUN |DFINTTLS;findRealZero|
        ((|p| (|SparseUnivariatePolynomial| (|Integer|)))
         (|i|
          (|Union|
           (|:| |fin|
                #1=(|Record| (|:| |left| (|Fraction| (|Integer|)))
                             (|:| |right| (|Fraction| (|Integer|)))))
           (|:| |halfinf|
                (|Record| (|:| |endpoint| #2=(|Fraction| (|Integer|)))
                          (|:| |dir| (|Integer|))))
           (|:| |all| #3="all") (|:| |failed| #4="failed")))
         (|incl?| (|Boolean|))
         ($
          (|List|
           (|Record| (|:| |left| #5=(|Fraction| (|Integer|)))
                     (|:| |right| #6=(|Fraction| (|Integer|)))))))
        (SPROG
         ((|ep| #2#) (#7=#:G263 NIL)
          (|l|
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (#8=#:G278 NIL)
          (|u|
           (|Union|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))
            #9="failed"))
          (#10=#:G290 NIL) (|t| NIL) (#11=#:G289 NIL)
          (|bounds|
           (|Record| (|:| |left| (|Fraction| (|Integer|)))
                     (|:| |right| (|Fraction| (|Integer|)))))
          (#12=#:G273 NIL) (#13=#:G272 #5#) (#14=#:G274 #5#) (#15=#:G288 NIL)
          (#16=#:G270 NIL) (#17=#:G269 #6#) (#18=#:G271 #6#) (#19=#:G287 NIL)
          (|r| #1#))
         (SEQ (LETT |p| (SPADCALL |p| (QREFELT $ 101)))
              (EXIT
               (COND
                ((QEQCAR |i| 0)
                 (SEQ
                  (LETT |l|
                        (SPADCALL |p| (LETT |r| (CDR |i|)) (QREFELT $ 105)))
                  (EXIT
                   (COND (|incl?| |l|)
                         (#20='T
                          (SPADCALL
                           (CONS #'|DFINTTLS;findRealZero!0| (VECTOR $ |r|))
                           |l| (QREFELT $ 107)))))))
                ((QEQCAR |i| 2) (SPADCALL |p| (QREFELT $ 108)))
                ((QEQCAR |i| 1)
                 (COND ((NULL (LETT |l| (SPADCALL |p| (QREFELT $ 108)))) NIL)
                       (#20#
                        (SEQ
                         (LETT |bounds|
                               (COND
                                ((>
                                  (QCDR
                                   (PROG2 (LETT #7# |i|)
                                       (QCDR #7#)
                                     (|check_union2| (QEQCAR #7# 1)
                                                     (|Record|
                                                      (|:| |endpoint|
                                                           (|Fraction|
                                                            (|Integer|)))
                                                      (|:| |dir| (|Integer|)))
                                                     (|Union|
                                                      (|:| |fin|
                                                           (|Record|
                                                            (|:| |left|
                                                                 (|Fraction|
                                                                  (|Integer|)))
                                                            (|:| |right|
                                                                 (|Fraction|
                                                                  (|Integer|)))))
                                                      (|:| |halfinf|
                                                           (|Record|
                                                            (|:| |endpoint|
                                                                 (|Fraction|
                                                                  (|Integer|)))
                                                            (|:| |dir|
                                                                 (|Integer|))))
                                                      (|:| |all| #3#)
                                                      (|:| |failed| #4#))
                                                     #7#)))
                                  0)
                                 (CONS
                                  (QCAR
                                   (PROG2 (LETT #7# |i|)
                                       (QCDR #7#)
                                     (|check_union2| (QEQCAR #7# 1)
                                                     (|Record|
                                                      (|:| |endpoint|
                                                           (|Fraction|
                                                            (|Integer|)))
                                                      (|:| |dir| (|Integer|)))
                                                     (|Union|
                                                      (|:| |fin|
                                                           (|Record|
                                                            (|:| |left|
                                                                 (|Fraction|
                                                                  (|Integer|)))
                                                            (|:| |right|
                                                                 (|Fraction|
                                                                  (|Integer|)))))
                                                      (|:| |halfinf|
                                                           (|Record|
                                                            (|:| |endpoint|
                                                                 (|Fraction|
                                                                  (|Integer|)))
                                                            (|:| |dir|
                                                                 (|Integer|))))
                                                      (|:| |all| #3#)
                                                      (|:| |failed| #4#))
                                                     #7#)))
                                  (PROGN
                                   (LETT #16# NIL)
                                   (SEQ (LETT |t| NIL) (LETT #19# |l|) G190
                                        (COND
                                         ((OR (ATOM #19#)
                                              (PROGN
                                               (LETT |t| (CAR #19#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #18# (QCDR |t|))
                                           (COND
                                            (#16#
                                             (LETT #17#
                                                   (SPADCALL #17# #18#
                                                             (QREFELT $ 109))))
                                            ('T
                                             (PROGN
                                              (LETT #17# #18#)
                                              (LETT #16# 'T)))))))
                                        (LETT #19# (CDR #19#)) (GO G190) G191
                                        (EXIT NIL))
                                   (COND (#16# #17#)
                                         (#20# (|IdentityError| '|max|))))))
                                (#20#
                                 (CONS
                                  (PROGN
                                   (LETT #12# NIL)
                                   (SEQ (LETT |t| NIL) (LETT #15# |l|) G190
                                        (COND
                                         ((OR (ATOM #15#)
                                              (PROGN
                                               (LETT |t| (CAR #15#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #14# (QCAR |t|))
                                           (COND
                                            (#12#
                                             (LETT #13#
                                                   (SPADCALL #13# #14#
                                                             (QREFELT $ 110))))
                                            ('T
                                             (PROGN
                                              (LETT #13# #14#)
                                              (LETT #12# 'T)))))))
                                        (LETT #15# (CDR #15#)) (GO G190) G191
                                        (EXIT NIL))
                                   (COND (#12# #13#)
                                         (#20# (|IdentityError| '|min|))))
                                  (QCAR
                                   (PROG2 (LETT #7# |i|)
                                       (QCDR #7#)
                                     (|check_union2| (QEQCAR #7# 1)
                                                     (|Record|
                                                      (|:| |endpoint|
                                                           (|Fraction|
                                                            (|Integer|)))
                                                      (|:| |dir| (|Integer|)))
                                                     (|Union|
                                                      (|:| |fin|
                                                           (|Record|
                                                            (|:| |left|
                                                                 (|Fraction|
                                                                  (|Integer|)))
                                                            (|:| |right|
                                                                 (|Fraction|
                                                                  (|Integer|)))))
                                                      (|:| |halfinf|
                                                           (|Record|
                                                            (|:| |endpoint|
                                                                 (|Fraction|
                                                                  (|Integer|)))
                                                            (|:| |dir|
                                                                 (|Integer|))))
                                                      (|:| |all| #3#)
                                                      (|:| |failed| #4#))
                                                     #7#)))))))
                         (LETT |l|
                               (PROGN
                                (LETT #11# NIL)
                                (SEQ (LETT |t| NIL) (LETT #10# |l|) G190
                                     (COND
                                      ((OR (ATOM #10#)
                                           (PROGN (LETT |t| (CAR #10#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((QEQCAR
                                          (LETT |u|
                                                (SPADCALL |p| |t| |bounds|
                                                          (QREFELT $ 112)))
                                          0)
                                         (LETT #11#
                                               (CONS
                                                (PROG2 (LETT #8# |u|)
                                                    (QCDR #8#)
                                                  (|check_union2|
                                                   (QEQCAR #8# 0)
                                                   (|Record|
                                                    (|:| |left|
                                                         (|Fraction|
                                                          (|Integer|)))
                                                    (|:| |right|
                                                         (|Fraction|
                                                          (|Integer|))))
                                                   (|Union|
                                                    (|Record|
                                                     (|:| |left|
                                                          (|Fraction|
                                                           (|Integer|)))
                                                     (|:| |right|
                                                          (|Fraction|
                                                           (|Integer|))))
                                                    #9#)
                                                   #8#))
                                                #11#))))))
                                     (LETT #10# (CDR #10#)) (GO G190) G191
                                     (EXIT (NREVERSE #11#)))))
                         (EXIT
                          (COND (|incl?| |l|)
                                (#20#
                                 (SEQ
                                  (LETT |ep|
                                        (QCAR
                                         (PROG2 (LETT #7# |i|)
                                             (QCDR #7#)
                                           (|check_union2| (QEQCAR #7# 1)
                                                           (|Record|
                                                            (|:| |endpoint|
                                                                 (|Fraction|
                                                                  (|Integer|)))
                                                            (|:| |dir|
                                                                 (|Integer|)))
                                                           (|Union|
                                                            (|:| |fin|
                                                                 (|Record|
                                                                  (|:| |left|
                                                                       (|Fraction|
                                                                        (|Integer|)))
                                                                  (|:| |right|
                                                                       (|Fraction|
                                                                        (|Integer|)))))
                                                            (|:| |halfinf|
                                                                 (|Record|
                                                                  (|:|
                                                                   |endpoint|
                                                                   (|Fraction|
                                                                    (|Integer|)))
                                                                  (|:| |dir|
                                                                       (|Integer|))))
                                                            (|:| |all| #3#)
                                                            (|:| |failed| #4#))
                                                           #7#))))
                                  (EXIT
                                   (SPADCALL
                                    (CONS #'|DFINTTLS;findRealZero!1|
                                          (VECTOR $ |ep|))
                                    |l| (QREFELT $ 107)))))))))))
                (#20# (|error| "findRealZero: should not happpen"))))))) 

(SDEFUN |DFINTTLS;findRealZero!1| ((|s| NIL) ($$ NIL))
        (PROG (|ep| $)
          (LETT |ep| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|DFINTTLS;keeprec?| |ep| |s| $))))) 

(SDEFUN |DFINTTLS;findRealZero!0| ((|s| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((|DFINTTLS;keeprec?| (QCAR |r|) |s| $)
              (|DFINTTLS;keeprec?| (QCDR |r|) |s| $))
             ('T NIL)))))) 

(SDEFUN |DFINTTLS;checkBudan|
        ((|p| (|SparseUnivariatePolynomial| F)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) (|incl?| (|Boolean|))
         ($ (|Union| (|Boolean|) "failed")))
        (SPROG
         ((|v| (|Integer|)) (|m| (|Integer|)) (#1=#:G311 NIL)
          (|vb| #2=(|Union| (|Integer|) "failed")) (|va| #2#)
          (|zb?| #3=(|Boolean|)) (|bb| (F)) (#4=#:G295 NIL)
          (|n| (|SingleInteger|)) (#5=#:G312 NIL) (|za?| #3#) (|aa| (F))
          (|r| (|Union| F "failed")))
         (SEQ (LETT |r| (SPADCALL |b| (QREFELT $ 35)))
              (EXIT
               (COND
                ((SPADCALL (LETT |n| (SPADCALL |a| (QREFELT $ 98))) 0
                           (QREFELT $ 99))
                 (COND ((QEQCAR |r| 1) (|DFINTTLS;realRoot| |p| $))
                       (#6='T
                        (|DFINTTLS;checkHalfAx| |p| (QCDR |r|) |n| |incl?|
                         $))))
                (#6#
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ
                     (LETT |za?|
                           (SPADCALL
                            (SPADCALL |p|
                                      (LETT |aa|
                                            (SPADCALL |a| (QREFELT $ 100)))
                                      (QREFELT $ 113))
                            (QREFELT $ 114)))
                     (EXIT
                      (COND
                       (|za?|
                        (COND
                         (|incl?|
                          (PROGN (LETT #5# (CONS 0 'T)) (GO #7=#:G308))))))))
                    (EXIT
                     (COND
                      ((SPADCALL (LETT |n| (SPADCALL |b| (QREFELT $ 98))) 0
                                 (QREFELT $ 99))
                       (|DFINTTLS;checkHalfAx| |p| |aa| |n| |incl?| $))
                      (#6#
                       (SEQ
                        (EXIT
                         (SEQ
                          (SEQ
                           (LETT |zb?|
                                 (SPADCALL
                                  (SPADCALL |p|
                                            (LETT |bb|
                                                  (PROG2 (LETT #4# |r|)
                                                      (QCDR #4#)
                                                    (|check_union2|
                                                     (QEQCAR #4# 0)
                                                     (QREFELT $ 7)
                                                     (|Union| (QREFELT $ 7)
                                                              "failed")
                                                     #4#)))
                                            (QREFELT $ 113))
                                  (QREFELT $ 114)))
                           (EXIT
                            (COND
                             (|zb?|
                              (COND
                               (|incl?|
                                (PROGN
                                 (LETT #1# (CONS 0 'T))
                                 (GO #8=#:G307))))))))
                          (SEQ (LETT |va| (|DFINTTLS;variation| |p| |aa| $))
                               (EXIT
                                (COND
                                 ((QEQCAR |va| 1)
                                  (PROGN
                                   (LETT #1# (CONS 1 #9="failed"))
                                   (GO #8#)))
                                 (#6#
                                  (SEQ
                                   (LETT |vb|
                                         (|DFINTTLS;variation| |p| |bb| $))
                                   (EXIT
                                    (COND
                                     ((QEQCAR |vb| 1)
                                      (PROGN
                                       (LETT #1# (CONS 1 #9#))
                                       (GO #8#))))))))))
                          (LETT |m| 0) (COND (|za?| (LETT |m| (+ |m| 1))))
                          (COND (|zb?| (LETT |m| (+ |m| 1))))
                          (EXIT
                           (COND
                            ((ODDP (LETT |v| (- (QCDR |va|) (QCDR |vb|))))
                             (COND ((OR |incl?| (EVENP |m|)) (CONS 0 'T))
                                   ((EQL |v| 1) (CONS 0 NIL))
                                   (#6# (CONS 1 "failed"))))
                            ((ZEROP |v|) (CONS 0 NIL))
                            ((EQL |m| 1) (CONS 0 'T))
                            (#6# (CONS 1 "failed"))))))
                        #8# (EXIT #1#)))))))
                  #7# (EXIT #5#)))))))) 

(SDEFUN |DFINTTLS;checkDeriv|
        ((|p| (|SparseUnivariatePolynomial| F)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) ($ (|Union| (|Boolean|) #1="failed")))
        (SPROG
         ((|u| (|Union| (|Boolean|) #1#)) (|s| (|Union| (|Boolean|) "failed"))
          (|r| (|Union| F "failed")))
         (SEQ (LETT |r| (SPADCALL |p| (QREFELT $ 115)))
              (EXIT
               (COND
                ((QEQCAR |r| 0) (CONS 0 (SPADCALL (QCDR |r|) (QREFELT $ 114))))
                (#2='T
                 (SEQ (LETT |s| (|DFINTTLS;sameSign| |p| |a| |b| $))
                      (EXIT
                       (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                             ((QCDR |s|)
                              (SEQ
                               (LETT |u|
                                     (|DFINTTLS;checkDeriv|
                                      (SPADCALL |p| (QREFELT $ 116)) |a| |b|
                                      $))
                               (EXIT
                                (COND
                                 ((OR (QEQCAR |u| 1) (QCDR |u|))
                                  (CONS 1 "failed"))
                                 ('T (CONS 0 NIL))))))
                             (#2# (CONS 0 'T))))))))))) 

(SDEFUN |DFINTTLS;realRoot|
        ((|p| (|SparseUnivariatePolynomial| F))
         ($ (|Union| (|Boolean|) "failed")))
        (SPROG ((|b| (|Union| (|Boolean|) "failed")))
               (SEQ (LETT |b| (|DFINTTLS;posRoot| |p| 'T $))
                    (EXIT
                     (COND ((QEQCAR |b| 1) (CONS 1 "failed"))
                           ((QCDR |b|) (CONS 0 'T))
                           ('T
                            (|DFINTTLS;posRoot|
                             (SPADCALL |p|
                                       (SPADCALL |p|
                                                 (SPADCALL (|spadConstant| $ 9)
                                                           1 (QREFELT $ 12))
                                                 (QREFELT $ 14))
                                       (QREFELT $ 15))
                             'T $))))))) 

(SDEFUN |DFINTTLS;sameSign|
        ((|p| (|SparseUnivariatePolynomial| F)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) ($ (|Union| (|Boolean|) "failed")))
        (SPROG
         ((|s| (|Union| (|Integer|) "failed")) (|eb| #1=(|Union| F "failed"))
          (|ea| #1#))
         (SEQ (LETT |ea| (|DFINTTLS;infeval| |p| |a| $))
              (EXIT
               (COND ((QEQCAR |ea| 1) (CONS 1 "failed"))
                     (#2='T
                      (SEQ (LETT |eb| (|DFINTTLS;infeval| |p| |b| $))
                           (EXIT
                            (COND ((QEQCAR |eb| 1) (CONS 1 "failed"))
                                  (#2#
                                   (SEQ
                                    (LETT |s|
                                          (SPADCALL
                                           (SPADCALL (QCDR |ea|) (QCDR |eb|)
                                                     (QREFELT $ 117))
                                           (QREFELT $ 64)))
                                    (EXIT
                                     (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                                           (#2#
                                            (CONS 0
                                                  (> (QCDR |s|)
                                                     0)))))))))))))))) 

(SDEFUN |DFINTTLS;posRoot|
        ((|p| (|SparseUnivariatePolynomial| F)) (|incl0?| (|Boolean|))
         ($ (|Union| (|Boolean|) "failed")))
        (SPROG
         ((|v| (|Union| (|Integer|) "failed")) (#1=#:G353 NIL)
          (|z0?| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |z0?|
                   (SPADCALL (SPADCALL |p| 0 (QREFELT $ 118)) (QREFELT $ 114)))
             (EXIT
              (COND
               (|z0?|
                (COND
                 (|incl0?| (PROGN (LETT #1# (CONS 0 'T)) (GO #2=#:G351))))))))
            (LETT |v| (|DFINTTLS;var| |p| $))
            (EXIT
             (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                   ((ODDP (QCDR |v|))
                    (COND ((OR |incl0?| (NULL |z0?|)) (CONS 0 'T))
                          ((EQL (QCDR |v|) 1) (CONS 0 NIL))
                          (#3='T (CONS 1 "failed"))))
                   ((ZEROP (QCDR |v|)) (CONS 0 NIL)) (|z0?| (CONS 0 'T))
                   (#3# (CONS 1 "failed"))))))
          #2# (EXIT #1#)))) 

(SDEFUN |DFINTTLS;infeval|
        ((|p| (|SparseUnivariatePolynomial| F)) (|a| (|OrderedCompletion| F))
         ($ (|Union| F "failed")))
        (SPROG ((|u| (|Union| (|Integer|) "failed")) (|n| (|SingleInteger|)))
               (SEQ
                (COND
                 ((|zero?_SI| (LETT |n| (SPADCALL |a| (QREFELT $ 98))))
                  (CONS 0
                        (SPADCALL |p| (SPADCALL |a| (QREFELT $ 100))
                                  (QREFELT $ 113))))
                 (#1='T
                  (SEQ (LETT |u| (SPADCALL |p| |n| (ELT $ 64) (QREFELT $ 121)))
                       (EXIT
                        (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                              (#1#
                               (CONS 0
                                     (SPADCALL (QCDR |u|)
                                               (QREFELT $ 59)))))))))))) 

(SDEFUN |DFINTTLS;var|
        ((|q| (|SparseUnivariatePolynomial| F))
         ($ (|Union| (|Integer|) "failed")))
        (SPROG
         ((|lastCoef| #1=(|Union| (|Boolean|) "failed")) (|i| (|Integer|))
          (#2=#:G377 NIL) (|next| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |i| 0)
                (LETT |lastCoef|
                      (|DFINTTLS;negative| (SPADCALL |q| (QREFELT $ 82)) $))
                (EXIT
                 (COND ((QEQCAR |lastCoef| 1) (CONS 1 "failed"))
                       ('T
                        (SEQ
                         (SEQ G190
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (LETT |q| (SPADCALL |q| (QREFELT $ 88)))
                                  (|spadConstant| $ 80) (QREFELT $ 81)))
                                (GO G191)))
                              (SEQ
                               (LETT |next|
                                     (|DFINTTLS;negative|
                                      (SPADCALL |q| (QREFELT $ 82)) $))
                               (EXIT
                                (COND
                                 ((QEQCAR |next| 1)
                                  (PROGN
                                   (LETT #2# (CONS 1 "failed"))
                                   (GO #3=#:G376)))
                                 ('T
                                  (SEQ
                                   (COND
                                    ((QCDR |lastCoef|)
                                     (COND
                                      ((NULL (QCDR |next|))
                                       (COND
                                        ((QCDR |lastCoef|)
                                         (LETT |i| (+ |i| 1)))))))
                                    ((OR (QCDR |next|) (QCDR |lastCoef|))
                                     (LETT |i| (+ |i| 1))))
                                   (EXIT (LETT |lastCoef| |next|)))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (CONS 0 |i|))))))))
          #3# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |DefiniteIntegrationTools;|)) 

(DEFUN |DefiniteIntegrationTools| (&REST #1=#:G378)
  (SPROG NIL
         (PROG (#2=#:G379)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DefiniteIntegrationTools|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DefiniteIntegrationTools;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|DefiniteIntegrationTools|)))))))))) 

(DEFUN |DefiniteIntegrationTools;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|DefiniteIntegrationTools| DV$1 DV$2))
          (LETT $ (GETREFV 122))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DefiniteIntegrationTools|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|DefiniteIntegrationTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (8 . |monomial|) (14 . |coerce|)
              (19 . -) (25 . |elt|) (|Boolean|) (|Fraction| 20) (31 . >)
              (37 . <) (|Integer|) (43 . *) (|String|) |DFINTTLS;ignore?;SB;4|
              (|Symbol|) (49 . |is?|) (|OrderedCompletion| 7)
              (55 . |infinite?|) (60 . =) (66 . -) (71 . +)
              (|Union| 26 '#1="failed") (|Kernel| 7)
              |DFINTTLS;computeInt;KF2OcBU;5| (|Union| 7 '"failed")
              (77 . |retractIfCan|) (|Kernel| $) (82 . |eval|) (89 . |coerce|)
              (94 . |coerce|) (|Equation| 7) (99 . |equation|)
              (|PowerSeriesLimitPackage| 6 7) (105 . |limit|) (|Equation| 26)
              (112 . |equation|)
              (|Record| (|:| |leftHandLimit| 31) (|:| |rightHandLimit| 31))
              (|Union| 26 46 '"failed") (118 . |limit|) (|List| 36)
              (124 . |kernels|) (129 . |is?|) (|List| $) (135 . |eval|)
              (|List| 7) (142 . |argument|) (|PositiveInteger|) (147 . ^)
              (153 . |log|) (158 . |coerce|) (163 . /) (169 . -)
              (|Union| 20 '"failed") (|ElementaryFunctionSign| 6 7)
              (174 . |sign|) (179 . |Zero|) (|Polynomial| 6) (183 . |coerce|)
              (|SparseUnivariatePolynomial| $) (188 . |univariate|)
              (|Mapping| 7 66) (|SparseUnivariatePolynomial| 66)
              (|SparseUnivariatePolynomialFunctions2| 66 7) (194 . |map|)
              (|Union| 16 '#2="failed") |DFINTTLS;checkForZero;Sup2OcBU;11|
              |DFINTTLS;checkForZero;PS2OcBU;10| (200 . |ground?|)
              (|SparseUnivariatePolynomial| 17) (205 . |Zero|) (209 . |Zero|)
              (213 . ~=) (219 . |leadingCoefficient|) (|Union| 17 '"failed")
              (224 . |retractIfCan|) (229 . |degree|) (234 . |monomial|)
              (240 . +) (246 . |reductum|) (251 . |numer|)
              (|Record| (|:| |num| 78) (|:| |den| 20))
              (|UnivariatePolynomialCommonDenominator| 20 17 78)
              (256 . |splitDenominator|) (|SparseUnivariatePolynomial| 20)
              (|Mapping| 20 17) (|SparseUnivariatePolynomialFunctions2| 17 20)
              (261 . |map|) (|SingleInteger|) (267 . |whatInfinity|) (272 . ~=)
              (278 . |retract|) (283 . |squareFreePart|)
              (|Record| (|:| |left| 17) (|:| |right| 17)) (|List| 102)
              (|RealZeroPackage| 93) (288 . |realZeros|) (|Mapping| 16 102)
              (294 . |select!|) (300 . |realZeros|) (305 . |max|) (311 . |min|)
              (|Union| 102 '"failed") (317 . |refine|) (324 . |elt|)
              (330 . |zero?|) (335 . |retractIfCan|) (340 . |differentiate|)
              (345 . *) (351 . |coefficient|) (|Mapping| 62 7)
              (|InnerPolySign| 7 11) (357 . |signAround|))
           '#(|ignore?| 364 |computeInt| 369 |checkForZero| 378) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|ignore?| ((|Boolean|) (|String|))) T)
                                   '((|computeInt|
                                      ((|Union| (|OrderedCompletion| |#2|) #1#)
                                       (|Kernel| |#2|) |#2|
                                       (|OrderedCompletion| |#2|)
                                       (|OrderedCompletion| |#2|) (|Boolean|)))
                                     T)
                                   '((|checkForZero|
                                      ((|Union| (|Boolean|) "failed")
                                       (|Polynomial| |#1|) (|Symbol|)
                                       (|OrderedCompletion| |#2|)
                                       (|OrderedCompletion| |#2|) (|Boolean|)))
                                     T)
                                   '((|checkForZero|
                                      ((|Union| (|Boolean|) #2#)
                                       (|SparseUnivariatePolynomial| |#2|)
                                       (|OrderedCompletion| |#2|)
                                       (|OrderedCompletion| |#2|) (|Boolean|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 121
                                            '(0 6 0 8 0 7 0 9 2 11 0 7 10 12 1
                                              11 0 7 13 2 11 0 0 0 14 2 11 0 0
                                              0 15 2 17 16 0 0 18 2 17 16 0 0
                                              19 2 11 0 20 0 21 2 7 16 0 24 25
                                              1 26 16 0 27 2 26 16 0 0 28 1 26
                                              0 0 29 2 26 0 0 0 30 1 26 34 0 35
                                              3 7 0 0 36 0 37 1 26 0 7 38 1 7 0
                                              36 39 2 40 0 7 7 41 3 42 31 7 40
                                              22 43 2 44 0 26 26 45 2 42 47 7
                                              44 48 1 7 49 0 50 2 32 16 0 24 51
                                              3 7 0 0 49 52 53 1 32 54 0 55 2 7
                                              0 0 56 57 1 7 0 0 58 1 7 0 20 59
                                              2 7 0 0 0 60 1 7 0 0 61 1 63 62 7
                                              64 0 6 0 65 1 7 0 66 67 2 66 68 0
                                              24 69 2 72 11 70 71 73 1 11 16 0
                                              77 0 78 0 79 0 11 0 80 2 11 16 0
                                              0 81 1 11 7 0 82 1 7 83 0 84 1 11
                                              10 0 85 2 78 0 17 10 86 2 78 0 0
                                              0 87 1 11 0 0 88 1 17 20 0 89 1
                                              91 90 78 92 2 95 93 94 78 96 1 26
                                              97 0 98 2 97 16 0 0 99 1 26 7 0
                                              100 1 93 0 0 101 2 104 103 93 102
                                              105 2 103 0 106 0 107 1 104 103
                                              93 108 2 17 0 0 0 109 2 17 0 0 0
                                              110 3 104 111 93 102 102 112 2 11
                                              7 0 7 113 1 7 16 0 114 1 11 34 0
                                              115 1 11 0 0 116 2 7 0 0 0 117 2
                                              11 7 0 10 118 3 120 62 11 20 119
                                              121 1 0 16 22 23 5 0 31 32 7 26
                                              26 16 33 4 0 74 11 26 26 16 75 5
                                              0 74 66 24 26 26 16 76)))))
           '|lookupComplete|)) 
