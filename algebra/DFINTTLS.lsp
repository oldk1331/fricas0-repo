
(SDEFUN |DFINTTLS;variation|
        ((|p| |SparseUnivariatePolynomial| F) (|a| F)
         ($ |Union| (|Integer|) "failed"))
        (|DFINTTLS;var|
         (SPADCALL |p|
                   (SPADCALL (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 12))
                             (SPADCALL |a| (QREFELT $ 13)) (QREFELT $ 14))
                   (QREFELT $ 15))
         $)) 

(SDEFUN |DFINTTLS;keeprec?|
        ((|a| |Fraction| (|Integer|))
         (|rec| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         ($ |Boolean|))
        (COND ((SPADCALL |a| (QCDR |rec|) (QREFELT $ 18)) 'T)
              ('T (SPADCALL |a| (QCAR |rec|) (QREFELT $ 19))))) 

(SDEFUN |DFINTTLS;checkHalfAx|
        ((|p| |SparseUnivariatePolynomial| F) (|a| F) (|d| |Integer|)
         (|incl?| |Boolean|) ($ |Union| (|Boolean|) "failed"))
        (|DFINTTLS;posRoot|
         (SPADCALL |p|
                   (SPADCALL |d|
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 12))
                              (SPADCALL |a| (QREFELT $ 13)) (QREFELT $ 14))
                             (QREFELT $ 21))
                   (QREFELT $ 15))
         |incl?| $)) 

(SDEFUN |DFINTTLS;ignore?;SB;4| ((|str| |String|) ($ |Boolean|))
        (COND ((EQUAL |str| "noPole") 'T)
              ('T (|error| "integrate: last argument must be 'noPole'")))) 

(SDEFUN |DFINTTLS;computeInt;KF2OcBU;5|
        ((|k| |Kernel| F) (|f| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) (|eval?| |Boolean|)
         ($ |Union| (|OrderedCompletion| F) "failed"))
        (SPROG
         ((#1=#:G139 NIL) (|ia| #2=(|Union| (|OrderedCompletion| F) "failed"))
          (|ib| #2#))
         (SEQ
          (COND ((SPADCALL |f| '|integral| (QREFELT $ 25)) (CONS 1 "failed"))
                (#3='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (COND
                     ((NULL |eval?|)
                      (LETT |f| (|DFINTTLS;mkLogPos| |f| $)
                            . #4=(|DFINTTLS;computeInt;KF2OcBU;5|))))
                    (SEQ
                     (LETT |ib|
                           (|DFINTTLS;findLimit| |f| |k| |b| "left" |eval?| $)
                           . #4#)
                     (EXIT
                      (COND
                       ((QEQCAR |ib| 1)
                        (PROGN (LETT #1# (CONS 1 #5="failed") . #4#) (GO #1#)))
                       (#3#
                        (SEQ
                         (LETT |ia|
                               (|DFINTTLS;findLimit| |f| |k| |a| "right"
                                |eval?| $)
                               . #4#)
                         (EXIT
                          (COND
                           ((QEQCAR |ia| 1)
                            (PROGN
                             (LETT #1# (CONS 1 #5#) . #4#)
                             (GO #1#))))))))))
                    (COND
                     ((SPADCALL (QCDR |ia|) (QREFELT $ 27))
                      (COND
                       ((SPADCALL (QCDR |ia|) (QCDR |ib|) (QREFELT $ 28))
                        (EXIT (CONS 1 "failed"))))))
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |ib|) (QCDR |ia|)
                                     (QREFELT $ 29))))))
                  #1# (EXIT #1#))))))) 

(SDEFUN |DFINTTLS;findLimit|
        ((|f| F) (|k| |Kernel| F) (|a| |OrderedCompletion| F) (|dir| |String|)
         (|eval?| |Boolean|) ($ |Union| (|OrderedCompletion| F) "failed"))
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
         (SEQ
          (LETT |r| (SPADCALL |a| (QREFELT $ 34)) . #2=(|DFINTTLS;findLimit|))
          (EXIT
           (COND
            ((QEQCAR |r| 0)
             (COND
              (|eval?|
               (CONS 0
                     (SPADCALL
                      (|DFINTTLS;mkLogPos|
                       (SPADCALL |f| |k| (QCDR |r|) (QREFELT $ 36)) $)
                      (QREFELT $ 37))))
              (#3='T
               (SEQ
                (LETT |u|
                      (SPADCALL |f|
                                (SPADCALL (SPADCALL |k| (QREFELT $ 38))
                                          (QCDR |r|) (QREFELT $ 40))
                                |dir| (QREFELT $ 42))
                      . #2#)
                (EXIT
                 (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                       (#3# (CONS 1 "failed"))))))))
            (#3#
             (SEQ
              (LETT |u|
                    (SPADCALL |f|
                              (SPADCALL
                               (SPADCALL (SPADCALL |k| (QREFELT $ 38))
                                         (QREFELT $ 37))
                               |a| (QREFELT $ 44))
                              (QREFELT $ 47))
                    . #2#)
              (EXIT
               (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                     (#3# (CONS 1 "failed"))))))))))) 

(SDEFUN |DFINTTLS;mkLogPos| ((|f| F) ($ F))
        (SPROG
         ((|lv| (|List| F)) (|lk| (|List| (|Kernel| F)))
          (|v| (|Union| F "positive")) (#1=#:G168 NIL) (|k| NIL))
         (SEQ (LETT |lk| NIL . #2=(|DFINTTLS;mkLogPos|)) (LETT |lv| NIL . #2#)
              (SEQ (LETT |k| NIL . #2#)
                   (LETT #1# (SPADCALL |f| (QREFELT $ 49)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |k| '|log| (QREFELT $ 50))
                       (SEQ (LETT |v| (|DFINTTLS;mkKerPos| |k| $) . #2#)
                            (EXIT
                             (COND
                              ((QEQCAR |v| 0)
                               (SEQ (LETT |lk| (CONS |k| |lk|) . #2#)
                                    (EXIT
                                     (LETT |lv| (CONS (QCDR |v|) |lv|)
                                           . #2#)))))))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |f| |lk| |lv| (QREFELT $ 52)))))) 

(SDEFUN |DFINTTLS;mkKerPos| ((|k| |Kernel| F) ($ |Union| F "positive"))
        (SPROG ((|u| (|Union| (|Boolean|) "failed")) (|f| (F)))
               (SEQ
                (LETT |u|
                      (|DFINTTLS;negative|
                       (LETT |f| (|SPADfirst| (SPADCALL |k| (QREFELT $ 54)))
                             . #1=(|DFINTTLS;mkKerPos|))
                       $)
                      . #1#)
                (EXIT
                 (COND
                  ((QEQCAR |u| 1)
                   (CONS 0
                         (SPADCALL
                          (SPADCALL (SPADCALL |f| 2 (QREFELT $ 56))
                                    (QREFELT $ 57))
                          (SPADCALL 2 (QREFELT $ 58)) (QREFELT $ 59))))
                  ((QCDR |u|)
                   (CONS 0
                         (SPADCALL (SPADCALL |f| (QREFELT $ 60))
                                   (QREFELT $ 57))))
                  ('T (CONS 1 "positive"))))))) 

(SDEFUN |DFINTTLS;negative| ((|f| F) ($ |Union| (|Boolean|) "failed"))
        (SPROG ((|u| (|Union| (|Integer|) "failed")))
               (SEQ
                (LETT |u| (SPADCALL |f| (QREFELT $ 63)) |DFINTTLS;negative|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (CONS 0 (< (QCDR |u|) 0)))))))) 

(SDEFUN |DFINTTLS;checkForZero;PS2OcBU;10|
        ((|p| |Polynomial| R) (|x| |Symbol|) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) (|incl?| |Boolean|)
         ($ |Union| (|Boolean|) "failed"))
        (SPADCALL
         (SPADCALL (ELT $ 67) (SPADCALL |p| |x| (QREFELT $ 69)) (QREFELT $ 73))
         |a| |b| |incl?| (QREFELT $ 75))) 

(SDEFUN |DFINTTLS;checkForZero;Sup2OcBU;11|
        ((|q| |SparseUnivariatePolynomial| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) (|incl?| |Boolean|)
         ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((|u| (|Union| (|Boolean|) "failed")) (#1=#:G204 NIL)
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
          (COND ((SPADCALL |q| (QREFELT $ 77)) (CONS 0 'NIL))
                (#2='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ
                     (LETT |d| (|DFINTTLS;maprat| |q| $)
                           . #3=(|DFINTTLS;checkForZero;Sup2OcBU;11|))
                     (EXIT
                      (COND
                       ((QEQCAR |d| 0)
                        (SEQ (LETT |i| (|DFINTTLS;intrat| |a| |b| $) . #3#)
                             (EXIT
                              (COND
                               ((NULL (QEQCAR |i| 3))
                                (PROGN
                                 (LETT #1#
                                       (COND
                                        ((NULL
                                          (|DFINTTLS;findRealZero| (QCDR |d|)
                                           |i| |incl?| $))
                                         (CONS 0 'NIL))
                                        (#2# (CONS 0 'T)))
                                       . #3#)
                                 (GO #1#))))))))))
                    (LETT |u| (|DFINTTLS;checkBudan| |q| |a| |b| |incl?| $)
                          . #3#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 1)
                       (COND (|incl?| (|DFINTTLS;checkDeriv| |q| |a| |b| $))
                             (#2# (CONS 1 "failed"))))
                      (#2# (CONS 0 (QCDR |u|)))))))
                  #1# (EXIT #1#))))))) 

(SDEFUN |DFINTTLS;maprat|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |Union| (|SparseUnivariatePolynomial| (|Integer|)) "failed"))
        (SPROG
         ((|ans| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (#1=#:G219 NIL) (|r| (|Union| (|Fraction| (|Integer|)) "failed"))
          (|c| (F)))
         (SEQ
          (EXIT
           (SEQ (LETT |ans| (|spadConstant| $ 79) . #2=(|DFINTTLS;maprat|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |p| (|spadConstant| $ 80) (QREFELT $ 81)))
                       (GO G191)))
                     (SEQ
                      (LETT |r|
                            (SPADCALL
                             (LETT |c| (SPADCALL |p| (QREFELT $ 82)) . #2#)
                             (QREFELT $ 84))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |r| 1)
                         (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
                        ('T
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL (QCDR |r|)
                                                    (SPADCALL |p|
                                                              (QREFELT $ 85))
                                                    (QREFELT $ 86))
                                          (QREFELT $ 87))
                                . #2#)
                          (EXIT
                           (LETT |p| (SPADCALL |p| (QREFELT $ 88)) . #2#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (CONS 0
                       (SPADCALL (ELT $ 89)
                                 (QCAR (SPADCALL |ans| (QREFELT $ 92)))
                                 (QREFELT $ 96))))))
          #1# (EXIT #1#)))) 

(SDEFUN |DFINTTLS;intrat|
        ((|a| |OrderedCompletion| F) (|b| |OrderedCompletion| F)
         ($ |Union|
          (|:| |fin|
               (|Record| (|:| |left| (|Fraction| (|Integer|)))
                         (|:| |right| (|Fraction| (|Integer|)))))
          (|:| |halfinf|
               (|Record| (|:| |endpoint| (|Fraction| (|Integer|)))
                         (|:| |dir| (|Integer|))))
          (|:| |all| #1="all") (|:| |failed| #2="failed")))
        (SPROG
         ((|t| #3=(|Union| (|Fraction| (|Integer|)) "failed"))
          (|n| (|SingleInteger|)) (|q| #3#) (|r| (|Union| F "failed")))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |n| (SPADCALL |a| (QREFELT $ 98)) . #4=(|DFINTTLS;intrat|))
             0 (QREFELT $ 99))
            (SEQ (LETT |r| (SPADCALL |b| (QREFELT $ 34)) . #4#)
                 (EXIT
                  (COND ((QEQCAR |r| 1) (CONS 2 #1#))
                        (#5='T
                         (SEQ
                          (LETT |q| (SPADCALL (QCDR |r|) (QREFELT $ 84)) . #4#)
                          (EXIT
                           (COND ((QEQCAR |q| 1) (CONS 3 #2#))
                                 (#5# (CONS 1 (CONS (QCDR |q|) |n|)))))))))))
           (#5#
            (SEQ
             (LETT |q| (SPADCALL (SPADCALL |a| (QREFELT $ 100)) (QREFELT $ 84))
                   . #4#)
             (EXIT
              (COND ((QEQCAR |q| 1) (CONS 3 #2#))
                    ((SPADCALL (LETT |n| (SPADCALL |b| (QREFELT $ 98)) . #4#) 0
                               (QREFELT $ 99))
                     (CONS 1 (CONS (QCDR |q|) |n|)))
                    (#5#
                     (SEQ
                      (LETT |t|
                            (SPADCALL (SPADCALL |b| (QREFELT $ 100))
                                      (QREFELT $ 84))
                            . #4#)
                      (EXIT
                       (COND ((QEQCAR |t| 1) (CONS 3 #2#))
                             (#5#
                              (CONS 0 (CONS (QCDR |q|) (QCDR |t|)))))))))))))))) 

(SDEFUN |DFINTTLS;findRealZero|
        ((|p| |SparseUnivariatePolynomial| (|Integer|))
         (|i| |Union|
          (|:| |fin|
               #1=(|Record| (|:| |left| (|Fraction| (|Integer|)))
                            (|:| |right| (|Fraction| (|Integer|)))))
          (|:| |halfinf|
               (|Record| (|:| |endpoint| #2=(|Fraction| (|Integer|)))
                         (|:| |dir| (|Integer|))))
          (|:| |all| "all") (|:| |failed| "failed"))
         (|incl?| |Boolean|)
         ($ |List|
          (|Record| (|:| |left| #3=(|Fraction| (|Integer|)))
                    (|:| |right| #4=(|Fraction| (|Integer|))))))
        (SPROG
         ((|ep| #2#) (#5=#:G242 NIL)
          (|l|
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (#6=#:G256 NIL)
          (|u|
           (|Union|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))
            "failed"))
          (#7=#:G268 NIL) (|t| NIL) (#8=#:G267 NIL)
          (|bounds|
           (|Record| (|:| |left| (|Fraction| (|Integer|)))
                     (|:| |right| (|Fraction| (|Integer|)))))
          (#9=#:G252 NIL) (#10=#:G251 #3#) (#11=#:G253 #3#) (#12=#:G266 NIL)
          (#13=#:G249 NIL) (#14=#:G248 #4#) (#15=#:G250 #4#) (#16=#:G265 NIL)
          (|r| #1#))
         (SEQ
          (LETT |p| (SPADCALL |p| (QREFELT $ 101))
                . #17=(|DFINTTLS;findRealZero|))
          (EXIT
           (COND
            ((QEQCAR |i| 0)
             (SEQ
              (LETT |l|
                    (SPADCALL |p| (LETT |r| (CDR |i|) . #17#) (QREFELT $ 105))
                    . #17#)
              (EXIT
               (COND (|incl?| |l|)
                     (#18='T
                      (SPADCALL
                       (CONS #'|DFINTTLS;findRealZero!0| (VECTOR $ |r|)) |l|
                       (QREFELT $ 108)))))))
            ((QEQCAR |i| 2) (SPADCALL |p| (QREFELT $ 109)))
            ((QEQCAR |i| 1)
             (COND
              ((NULL (LETT |l| (SPADCALL |p| (QREFELT $ 109)) . #17#)) NIL)
              (#18#
               (SEQ
                (LETT |bounds|
                      (COND
                       ((SPADCALL
                         (QCDR
                          (PROG2 (LETT #5# |i| . #17#)
                              (QCDR #5#)
                            (|check_union| (QEQCAR #5# 1)
                                           (|Record|
                                            (|:| |endpoint|
                                                 (|Fraction| (|Integer|)))
                                            (|:| |dir| (|Integer|)))
                                           #5#)))
                         0 (QREFELT $ 110))
                        (CONS
                         (QCAR
                          (PROG2 (LETT #5# |i| . #17#)
                              (QCDR #5#)
                            (|check_union| (QEQCAR #5# 1)
                                           (|Record|
                                            (|:| |endpoint|
                                                 (|Fraction| (|Integer|)))
                                            (|:| |dir| (|Integer|)))
                                           #5#)))
                         (PROGN
                          (LETT #13# NIL . #17#)
                          (SEQ (LETT |t| NIL . #17#) (LETT #16# |l| . #17#)
                               G190
                               (COND
                                ((OR (ATOM #16#)
                                     (PROGN (LETT |t| (CAR #16#) . #17#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #15# (QCDR |t|) . #17#)
                                  (COND
                                   (#13#
                                    (LETT #14#
                                          (SPADCALL #14# #15# (QREFELT $ 111))
                                          . #17#))
                                   ('T
                                    (PROGN
                                     (LETT #14# #15# . #17#)
                                     (LETT #13# 'T . #17#)))))))
                               (LETT #16# (CDR #16#) . #17#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#13# #14#) (#18# (|IdentityError| '|max|))))))
                       (#18#
                        (CONS
                         (PROGN
                          (LETT #9# NIL . #17#)
                          (SEQ (LETT |t| NIL . #17#) (LETT #12# |l| . #17#)
                               G190
                               (COND
                                ((OR (ATOM #12#)
                                     (PROGN (LETT |t| (CAR #12#) . #17#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #11# (QCAR |t|) . #17#)
                                  (COND
                                   (#9#
                                    (LETT #10#
                                          (SPADCALL #10# #11# (QREFELT $ 112))
                                          . #17#))
                                   ('T
                                    (PROGN
                                     (LETT #10# #11# . #17#)
                                     (LETT #9# 'T . #17#)))))))
                               (LETT #12# (CDR #12#) . #17#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#9# #10#) (#18# (|IdentityError| '|min|))))
                         (QCAR
                          (PROG2 (LETT #5# |i| . #17#)
                              (QCDR #5#)
                            (|check_union| (QEQCAR #5# 1)
                                           (|Record|
                                            (|:| |endpoint|
                                                 (|Fraction| (|Integer|)))
                                            (|:| |dir| (|Integer|)))
                                           #5#))))))
                      . #17#)
                (LETT |l|
                      (PROGN
                       (LETT #8# NIL . #17#)
                       (SEQ (LETT |t| NIL . #17#) (LETT #7# |l| . #17#) G190
                            (COND
                             ((OR (ATOM #7#)
                                  (PROGN (LETT |t| (CAR #7#) . #17#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((QEQCAR
                                 (LETT |u|
                                       (SPADCALL |p| |t| |bounds|
                                                 (QREFELT $ 114))
                                       . #17#)
                                 0)
                                (LETT #8#
                                      (CONS
                                       (PROG2 (LETT #6# |u| . #17#)
                                           (QCDR #6#)
                                         (|check_union| (QEQCAR #6# 0)
                                                        (|Record|
                                                         (|:| |left|
                                                              (|Fraction|
                                                               (|Integer|)))
                                                         (|:| |right|
                                                              (|Fraction|
                                                               (|Integer|))))
                                                        #6#))
                                       #8#)
                                      . #17#)))))
                            (LETT #7# (CDR #7#) . #17#) (GO G190) G191
                            (EXIT (NREVERSE #8#))))
                      . #17#)
                (EXIT
                 (COND (|incl?| |l|)
                       (#18#
                        (SEQ
                         (LETT |ep|
                               (QCAR
                                (PROG2 (LETT #5# |i| . #17#)
                                    (QCDR #5#)
                                  (|check_union| (QEQCAR #5# 1)
                                                 (|Record|
                                                  (|:| |endpoint|
                                                       (|Fraction|
                                                        (|Integer|)))
                                                  (|:| |dir| (|Integer|)))
                                                 #5#)))
                               . #17#)
                         (EXIT
                          (SPADCALL
                           (CONS #'|DFINTTLS;findRealZero!1| (VECTOR $ |ep|))
                           |l| (QREFELT $ 108)))))))))))
            (#18# (|error| "findRealZero: should not happpen"))))))) 

(SDEFUN |DFINTTLS;findRealZero!1| ((|s| NIL) ($$ NIL))
        (PROG (|ep| $)
          (LETT |ep| (QREFELT $$ 1) . #1=(|DFINTTLS;findRealZero|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|DFINTTLS;keeprec?| |ep| |s| $))))) 

(SDEFUN |DFINTTLS;findRealZero!0| ((|s| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|DFINTTLS;findRealZero|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((|DFINTTLS;keeprec?| (QCAR |r|) |s| $)
              (|DFINTTLS;keeprec?| (QCDR |r|) |s| $))
             ('T (|spadConstant| $ 106))))))) 

(SDEFUN |DFINTTLS;checkBudan|
        ((|p| |SparseUnivariatePolynomial| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) (|incl?| |Boolean|)
         ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((|v| (|Integer|)) (|m| (|Integer|)) (#1=#:G285 NIL)
          (|vb| #2=(|Union| (|Integer|) "failed")) (|va| #2#)
          (|zb?| #3=(|Boolean|)) (|bb| (F)) (#4=#:G273 NIL)
          (|n| (|SingleInteger|)) (#5=#:G286 NIL) (|za?| #3#) (|aa| (F))
          (|r| (|Union| F "failed")))
         (SEQ
          (LETT |r| (SPADCALL |b| (QREFELT $ 34)) . #6=(|DFINTTLS;checkBudan|))
          (EXIT
           (COND
            ((SPADCALL (LETT |n| (SPADCALL |a| (QREFELT $ 98)) . #6#) 0
                       (QREFELT $ 99))
             (COND ((QEQCAR |r| 1) (|DFINTTLS;realRoot| |p| $))
                   (#7='T
                    (|DFINTTLS;checkHalfAx| |p| (QCDR |r|) |n| |incl?| $))))
            (#7#
             (SEQ
              (EXIT
               (SEQ
                (SEQ
                 (LETT |za?|
                       (SPADCALL
                        (SPADCALL |p|
                                  (LETT |aa| (SPADCALL |a| (QREFELT $ 100))
                                        . #6#)
                                  (QREFELT $ 115))
                        (QREFELT $ 116))
                       . #6#)
                 (EXIT
                  (COND
                   (|za?|
                    (COND
                     (|incl?|
                      (PROGN (LETT #5# (CONS 0 'T) . #6#) (GO #5#))))))))
                (EXIT
                 (COND
                  ((SPADCALL (LETT |n| (SPADCALL |b| (QREFELT $ 98)) . #6#) 0
                             (QREFELT $ 99))
                   (|DFINTTLS;checkHalfAx| |p| |aa| |n| |incl?| $))
                  (#7#
                   (SEQ
                    (EXIT
                     (SEQ
                      (SEQ
                       (LETT |zb?|
                             (SPADCALL
                              (SPADCALL |p|
                                        (LETT |bb|
                                              (PROG2 (LETT #4# |r| . #6#)
                                                  (QCDR #4#)
                                                (|check_union| (QEQCAR #4# 0)
                                                               (QREFELT $ 7)
                                                               #4#))
                                              . #6#)
                                        (QREFELT $ 115))
                              (QREFELT $ 116))
                             . #6#)
                       (EXIT
                        (COND
                         (|zb?|
                          (COND
                           (|incl?|
                            (PROGN (LETT #1# (CONS 0 'T) . #6#) (GO #1#))))))))
                      (SEQ (LETT |va| (|DFINTTLS;variation| |p| |aa| $) . #6#)
                           (EXIT
                            (COND
                             ((QEQCAR |va| 1)
                              (PROGN
                               (LETT #1# (CONS 1 #8="failed") . #6#)
                               (GO #1#)))
                             (#7#
                              (SEQ
                               (LETT |vb| (|DFINTTLS;variation| |p| |bb| $)
                                     . #6#)
                               (EXIT
                                (COND
                                 ((QEQCAR |vb| 1)
                                  (PROGN
                                   (LETT #1# (CONS 1 #8#) . #6#)
                                   (GO #1#))))))))))
                      (LETT |m| 0 . #6#)
                      (COND (|za?| (LETT |m| (+ |m| 1) . #6#)))
                      (COND (|zb?| (LETT |m| (+ |m| 1) . #6#)))
                      (EXIT
                       (COND
                        ((ODDP (LETT |v| (- (QCDR |va|) (QCDR |vb|)) . #6#))
                         (COND
                          ((OR |incl?| (SPADCALL |m| (QREFELT $ 117)))
                           (CONS 0 'T))
                          ((EQL |v| 1) (CONS 0 'NIL)) (#7# (CONS 1 "failed"))))
                        ((ZEROP |v|) (CONS 0 'NIL)) ((EQL |m| 1) (CONS 0 'T))
                        (#7# (CONS 1 "failed"))))))
                    #1# (EXIT #1#)))))))
              #5# (EXIT #5#)))))))) 

(SDEFUN |DFINTTLS;checkDeriv|
        ((|p| |SparseUnivariatePolynomial| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) ($ |Union| (|Boolean|) #1="failed"))
        (SPROG
         ((|u| (|Union| (|Boolean|) #1#)) (|s| (|Union| (|Boolean|) "failed"))
          (|r| (|Union| F "failed")))
         (SEQ
          (LETT |r| (SPADCALL |p| (QREFELT $ 118))
                . #2=(|DFINTTLS;checkDeriv|))
          (EXIT
           (COND
            ((QEQCAR |r| 0) (CONS 0 (SPADCALL (QCDR |r|) (QREFELT $ 116))))
            (#3='T
             (SEQ (LETT |s| (|DFINTTLS;sameSign| |p| |a| |b| $) . #2#)
                  (EXIT
                   (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                         ((QCDR |s|)
                          (SEQ
                           (LETT |u|
                                 (|DFINTTLS;checkDeriv|
                                  (SPADCALL |p| (QREFELT $ 119)) |a| |b| $)
                                 . #2#)
                           (EXIT
                            (COND
                             ((OR (QEQCAR |u| 1) (QCDR |u|)) (CONS 1 "failed"))
                             ('T (CONS 0 'NIL))))))
                         (#3# (CONS 0 'T))))))))))) 

(SDEFUN |DFINTTLS;realRoot|
        ((|p| |SparseUnivariatePolynomial| F) ($ |Union| (|Boolean|) "failed"))
        (SPROG ((|b| (|Union| (|Boolean|) "failed")))
               (SEQ
                (LETT |b| (|DFINTTLS;posRoot| |p| 'T $) |DFINTTLS;realRoot|)
                (EXIT
                 (COND ((QEQCAR |b| 1) (CONS 1 "failed"))
                       ((QCDR |b|) (CONS 0 'T))
                       ('T
                        (|DFINTTLS;posRoot|
                         (SPADCALL |p|
                                   (SPADCALL |p|
                                             (SPADCALL (|spadConstant| $ 9) 1
                                                       (QREFELT $ 12))
                                             (QREFELT $ 14))
                                   (QREFELT $ 15))
                         'T $))))))) 

(SDEFUN |DFINTTLS;sameSign|
        ((|p| |SparseUnivariatePolynomial| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((|s| (|Union| (|Integer|) "failed")) (|eb| #1=(|Union| F "failed"))
          (|ea| #1#))
         (SEQ
          (LETT |ea| (|DFINTTLS;infeval| |p| |a| $) . #2=(|DFINTTLS;sameSign|))
          (EXIT
           (COND ((QEQCAR |ea| 1) (CONS 1 "failed"))
                 (#3='T
                  (SEQ (LETT |eb| (|DFINTTLS;infeval| |p| |b| $) . #2#)
                       (EXIT
                        (COND ((QEQCAR |eb| 1) (CONS 1 "failed"))
                              (#3#
                               (SEQ
                                (LETT |s|
                                      (SPADCALL
                                       (SPADCALL (QCDR |ea|) (QCDR |eb|)
                                                 (QREFELT $ 120))
                                       (QREFELT $ 63))
                                      . #2#)
                                (EXIT
                                 (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                                       (#3#
                                        (CONS 0
                                              (SPADCALL (QCDR |s|) 0
                                                        (QREFELT $
                                                                 110))))))))))))))))) 

(SDEFUN |DFINTTLS;posRoot|
        ((|p| |SparseUnivariatePolynomial| F) (|incl0?| |Boolean|)
         ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((|v| (|Union| (|Integer|) "failed")) (#1=#:G327 NIL)
          (|z0?| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |z0?|
                   (SPADCALL (SPADCALL |p| 0 (QREFELT $ 121)) (QREFELT $ 116))
                   . #2=(|DFINTTLS;posRoot|))
             (EXIT
              (COND
               (|z0?|
                (COND
                 (|incl0?| (PROGN (LETT #1# (CONS 0 'T) . #2#) (GO #1#))))))))
            (LETT |v| (|DFINTTLS;var| |p| $) . #2#)
            (EXIT
             (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                   ((ODDP (QCDR |v|))
                    (COND ((OR |incl0?| (NULL |z0?|)) (CONS 0 'T))
                          ((EQL (QCDR |v|) 1) (CONS 0 'NIL))
                          (#3='T (CONS 1 "failed"))))
                   ((ZEROP (QCDR |v|)) (CONS 0 'NIL)) (|z0?| (CONS 0 'T))
                   (#3# (CONS 1 "failed"))))))
          #1# (EXIT #1#)))) 

(SDEFUN |DFINTTLS;infeval|
        ((|p| |SparseUnivariatePolynomial| F) (|a| |OrderedCompletion| F)
         ($ |Union| F "failed"))
        (SPROG ((|u| (|Union| (|Integer|) "failed")) (|n| (|SingleInteger|)))
               (SEQ
                (COND
                 ((|zero?_SI|
                   (LETT |n| (SPADCALL |a| (QREFELT $ 98))
                         . #1=(|DFINTTLS;infeval|)))
                  (CONS 0
                        (SPADCALL |p| (SPADCALL |a| (QREFELT $ 100))
                                  (QREFELT $ 115))))
                 (#2='T
                  (SEQ
                   (LETT |u| (SPADCALL |p| |n| (ELT $ 63) (QREFELT $ 124))
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                          (#2#
                           (CONS 0
                                 (SPADCALL (QCDR |u|) (QREFELT $ 58)))))))))))) 

(SDEFUN |DFINTTLS;var|
        ((|q| |SparseUnivariatePolynomial| F) ($ |Union| (|Integer|) "failed"))
        (SPROG
         ((|lastCoef| #1=(|Union| (|Boolean|) "failed")) (|i| (|Integer|))
          (#2=#:G350 NIL) (|next| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |i| 0 . #3=(|DFINTTLS;var|))
                (LETT |lastCoef|
                      (|DFINTTLS;negative| (SPADCALL |q| (QREFELT $ 82)) $)
                      . #3#)
                (EXIT
                 (COND ((QEQCAR |lastCoef| 1) (CONS 1 "failed"))
                       ('T
                        (SEQ
                         (SEQ G190
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (LETT |q| (SPADCALL |q| (QREFELT $ 88))
                                        . #3#)
                                  (|spadConstant| $ 80) (QREFELT $ 81)))
                                (GO G191)))
                              (SEQ
                               (LETT |next|
                                     (|DFINTTLS;negative|
                                      (SPADCALL |q| (QREFELT $ 82)) $)
                                     . #3#)
                               (EXIT
                                (COND
                                 ((QEQCAR |next| 1)
                                  (PROGN
                                   (LETT #2# (CONS 1 "failed") . #3#)
                                   (GO #2#)))
                                 ('T
                                  (SEQ
                                   (COND
                                    ((QCDR |lastCoef|)
                                     (COND
                                      ((NULL (QCDR |next|))
                                       (COND
                                        ((QCDR |lastCoef|)
                                         (LETT |i| (+ |i| 1) . #3#))))))
                                    ((OR (QCDR |next|) (QCDR |lastCoef|))
                                     (LETT |i| (+ |i| 1) . #3#)))
                                   (EXIT (LETT |lastCoef| |next| . #3#)))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (CONS 0 |i|))))))))
          #2# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |DefiniteIntegrationTools;|)) 

(DEFUN |DefiniteIntegrationTools| (&REST #1=#:G351)
  (SPROG NIL
         (PROG (#2=#:G352)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DefiniteIntegrationTools|)
                                               '|domainEqualList|)
                    . #3=(|DefiniteIntegrationTools|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DefiniteIntegrationTools;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|DefiniteIntegrationTools|)))))))))) 

(DEFUN |DefiniteIntegrationTools;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|DefiniteIntegrationTools|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|DefiniteIntegrationTools| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 125) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
              (55 . |infinite?|) (60 . =) (66 . -) (|Union| 26 '"failed")
              (|Kernel| 7) |DFINTTLS;computeInt;KF2OcBU;5|
              (|Union| 7 '"failed") (72 . |retractIfCan|) (|Kernel| $)
              (77 . |eval|) (84 . |coerce|) (89 . |coerce|) (|Equation| 7)
              (94 . |equation|) (|PowerSeriesLimitPackage| 6 7) (100 . |limit|)
              (|Equation| 26) (107 . |equation|)
              (|Record| (|:| |leftHandLimit| 30) (|:| |rightHandLimit| 30))
              (|Union| 26 45 '"failed") (113 . |limit|) (|List| 35)
              (119 . |kernels|) (124 . |is?|) (|List| $) (130 . |eval|)
              (|List| 7) (137 . |argument|) (|PositiveInteger|) (142 . ^)
              (148 . |log|) (153 . |coerce|) (158 . /) (164 . -)
              (|Union| 20 '"failed") (|ElementaryFunctionSign| 6 7)
              (169 . |sign|) (174 . |Zero|) (178 . |Zero|) (|Polynomial| 6)
              (182 . |coerce|) (|SparseUnivariatePolynomial| $)
              (187 . |univariate|) (|Mapping| 7 66)
              (|SparseUnivariatePolynomial| 66)
              (|SparseUnivariatePolynomialFunctions2| 66 7) (193 . |map|)
              (|Union| 16 '"failed") |DFINTTLS;checkForZero;Sup2OcBU;11|
              |DFINTTLS;checkForZero;PS2OcBU;10| (199 . |ground?|)
              (|SparseUnivariatePolynomial| 17) (204 . |Zero|) (208 . |Zero|)
              (212 . ~=) (218 . |leadingCoefficient|) (|Union| 17 '"failed")
              (223 . |retractIfCan|) (228 . |degree|) (233 . |monomial|)
              (239 . +) (245 . |reductum|) (250 . |numer|)
              (|Record| (|:| |num| 78) (|:| |den| 20))
              (|UnivariatePolynomialCommonDenominator| 20 17 78)
              (255 . |splitDenominator|) (|SparseUnivariatePolynomial| 20)
              (|Mapping| 20 17) (|SparseUnivariatePolynomialFunctions2| 17 20)
              (260 . |map|) (|SingleInteger|) (266 . |whatInfinity|) (271 . ~=)
              (277 . |retract|) (282 . |squareFreePart|)
              (|Record| (|:| |left| 17) (|:| |right| 17)) (|List| 102)
              (|RealZeroPackage| 93) (287 . |realZeros|) (293 . |false|)
              (|Mapping| 16 102) (297 . |select!|) (303 . |realZeros|)
              (308 . >) (314 . |max|) (320 . |min|) (|Union| 102 '"failed")
              (326 . |refine|) (333 . |elt|) (339 . |zero?|) (344 . |even?|)
              (349 . |retractIfCan|) (354 . |differentiate|) (359 . *)
              (365 . |coefficient|) (|Mapping| 61 7) (|InnerPolySign| 7 11)
              (371 . |signAround|))
           '#(|ignore?| 378 |computeInt| 383 |checkForZero| 392) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 124
                                                 '(0 6 0 8 0 7 0 9 2 11 0 7 10
                                                   12 1 11 0 7 13 2 11 0 0 0 14
                                                   2 11 0 0 0 15 2 17 16 0 0 18
                                                   2 17 16 0 0 19 2 11 0 20 0
                                                   21 2 7 16 0 24 25 1 26 16 0
                                                   27 2 26 16 0 0 28 2 26 0 0 0
                                                   29 1 26 33 0 34 3 7 0 0 35 0
                                                   36 1 26 0 7 37 1 7 0 35 38 2
                                                   39 0 7 7 40 3 41 30 7 39 22
                                                   42 2 43 0 26 26 44 2 41 46 7
                                                   43 47 1 7 48 0 49 2 31 16 0
                                                   24 50 3 7 0 0 48 51 52 1 31
                                                   53 0 54 2 7 0 0 55 56 1 7 0
                                                   0 57 1 7 0 20 58 2 7 0 0 0
                                                   59 1 7 0 0 60 1 62 61 7 63 0
                                                   6 0 64 0 7 0 65 1 7 0 66 67
                                                   2 66 68 0 24 69 2 72 11 70
                                                   71 73 1 11 16 0 77 0 78 0 79
                                                   0 11 0 80 2 11 16 0 0 81 1
                                                   11 7 0 82 1 7 83 0 84 1 11
                                                   10 0 85 2 78 0 17 10 86 2 78
                                                   0 0 0 87 1 11 0 0 88 1 17 20
                                                   0 89 1 91 90 78 92 2 95 93
                                                   94 78 96 1 26 97 0 98 2 97
                                                   16 0 0 99 1 26 7 0 100 1 93
                                                   0 0 101 2 104 103 93 102 105
                                                   0 16 0 106 2 103 0 107 0 108
                                                   1 104 103 93 109 2 20 16 0 0
                                                   110 2 17 0 0 0 111 2 17 0 0
                                                   0 112 3 104 113 93 102 102
                                                   114 2 11 7 0 7 115 1 7 16 0
                                                   116 1 20 16 0 117 1 11 33 0
                                                   118 1 11 0 0 119 2 7 0 0 0
                                                   120 2 11 7 0 10 121 3 123 61
                                                   11 20 122 124 1 0 16 22 23 5
                                                   0 30 31 7 26 26 16 32 4 0 74
                                                   11 26 26 16 75 5 0 74 66 24
                                                   26 26 16 76)))))
           '|lookupComplete|)) 
