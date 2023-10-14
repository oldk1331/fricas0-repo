
(/VERSIONCHECK 2) 

(DEFUN |EUCDOM-;sizeLess?;2SB;1| (|x| |y| $)
  (COND ((SPADCALL |y| (QREFELT $ 8)) 'NIL) ((SPADCALL |x| (QREFELT $ 8)) 'T)
        ('T (< (SPADCALL |x| (QREFELT $ 10)) (SPADCALL |y| (QREFELT $ 10)))))) 

(DEFUN |EUCDOM-;quo;3S;2| (|x| |y| $) (QCAR (SPADCALL |x| |y| (QREFELT $ 13)))) 

(DEFUN |EUCDOM-;rem;3S;3| (|x| |y| $) (QCDR (SPADCALL |x| |y| (QREFELT $ 13)))) 

(DEFUN |EUCDOM-;exquo;2SU;4| (|x| |y| $)
  (PROG (|qr|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |y| (QREFELT $ 8)) (CONS 1 "failed"))
            (#1='T
             (SEQ
              (LETT |qr| (SPADCALL |x| |y| (QREFELT $ 13))
                    |EUCDOM-;exquo;2SU;4|)
              (EXIT
               (COND
                ((SPADCALL (QCDR |qr|) (QREFELT $ 8)) (CONS 0 (QCAR |qr|)))
                (#1# (CONS 1 "failed"))))))))))) 

(DEFUN |EUCDOM-;gcd;3S;5| (|x| |y| $)
  (PROG (|#G14| |#G13|)
    (RETURN
     (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 18)) . #1=(|EUCDOM-;gcd;3S;5|))
          (LETT |y| (SPADCALL |y| (QREFELT $ 18)) . #1#)
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |y| (QREFELT $ 8)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ
                (PROGN
                 (LETT |#G13| |y| . #1#)
                 (LETT |#G14| (SPADCALL |x| |y| (QREFELT $ 19)) . #1#)
                 (LETT |x| |#G13| . #1#)
                 (LETT |y| |#G14| . #1#))
                (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 18)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |x|))))) 

(DEFUN |EUCDOM-;unitNormalizeIdealElt| (|s| $)
  (PROG (|a| |c| |u| |#G16|)
    (RETURN
     (SEQ
      (PROGN
       (LETT |#G16| (SPADCALL (QVELT |s| 2) (QREFELT $ 22))
             . #1=(|EUCDOM-;unitNormalizeIdealElt|))
       (LETT |u| (QVELT |#G16| 0) . #1#)
       (LETT |c| (QVELT |#G16| 1) . #1#)
       (LETT |a| (QVELT |#G16| 2) . #1#)
       |#G16|)
      (EXIT
       (COND ((SPADCALL |a| (|spadConstant| $ 23) (QREFELT $ 24)) |s|)
             ('T
              (VECTOR (SPADCALL |a| (QVELT |s| 0) (QREFELT $ 25))
                      (SPADCALL |a| (QVELT |s| 1) (QREFELT $ 25)) |c|)))))))) 

(DEFUN |EUCDOM-;extendedEuclidean;2SR;7| (|x| |y| $)
  (PROG (|s1| |qr| |s2| |s3|)
    (RETURN
     (SEQ
      (LETT |s1|
            (|EUCDOM-;unitNormalizeIdealElt|
             (VECTOR (|spadConstant| $ 23) (|spadConstant| $ 26) |x|) $)
            . #1=(|EUCDOM-;extendedEuclidean;2SR;7|))
      (LETT |s2|
            (|EUCDOM-;unitNormalizeIdealElt|
             (VECTOR (|spadConstant| $ 26) (|spadConstant| $ 23) |y|) $)
            . #1#)
      (EXIT
       (COND ((SPADCALL |y| (QREFELT $ 8)) |s1|)
             ((SPADCALL |x| (QREFELT $ 8)) |s2|)
             ('T
              (SEQ
               (SEQ G190
                    (COND
                     ((NULL
                       (COND ((SPADCALL (QVELT |s2| 2) (QREFELT $ 8)) 'NIL)
                             ('T 'T)))
                      (GO G191)))
                    (SEQ
                     (LETT |qr|
                           (SPADCALL (QVELT |s1| 2) (QVELT |s2| 2)
                                     (QREFELT $ 13))
                           . #1#)
                     (LETT |s3|
                           (VECTOR
                            (SPADCALL (QVELT |s1| 0)
                                      (SPADCALL (QCAR |qr|) (QVELT |s2| 0)
                                                (QREFELT $ 25))
                                      (QREFELT $ 27))
                            (SPADCALL (QVELT |s1| 1)
                                      (SPADCALL (QCAR |qr|) (QVELT |s2| 1)
                                                (QREFELT $ 25))
                                      (QREFELT $ 27))
                            (QCDR |qr|))
                           . #1#)
                     (LETT |s1| |s2| . #1#)
                     (EXIT
                      (LETT |s2| (|EUCDOM-;unitNormalizeIdealElt| |s3| $)
                            . #1#)))
                    NIL (GO G190) G191 (EXIT NIL))
               (COND
                ((NULL (SPADCALL (QVELT |s1| 0) (QREFELT $ 8)))
                 (COND
                  ((NULL (SPADCALL (QVELT |s1| 0) |y| (QREFELT $ 28)))
                   (SEQ
                    (LETT |qr| (SPADCALL (QVELT |s1| 0) |y| (QREFELT $ 13))
                          . #1#)
                    (QSETVELT |s1| 0 (QCDR |qr|))
                    (QSETVELT |s1| 1
                              (SPADCALL (QVELT |s1| 1)
                                        (SPADCALL (QCAR |qr|) |x|
                                                  (QREFELT $ 25))
                                        (QREFELT $ 29)))
                    (EXIT
                     (LETT |s1| (|EUCDOM-;unitNormalizeIdealElt| |s1| $)
                           . #1#)))))))
               (EXIT |s1|))))))))) 

(DEFUN |EUCDOM-;extendedEuclidean;3SU;8| (|x| |y| |z| $)
  (PROG (|qr| |w| |s|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 8))
        (CONS 0 (CONS (|spadConstant| $ 26) (|spadConstant| $ 26))))
       (#1='T
        (SEQ
         (LETT |s| (SPADCALL |x| |y| (QREFELT $ 32))
               . #2=(|EUCDOM-;extendedEuclidean;3SU;8|))
         (LETT |w| (SPADCALL |z| (QVELT |s| 2) (QREFELT $ 33)) . #2#)
         (EXIT
          (COND ((QEQCAR |w| 1) (CONS 1 "failed"))
                ((SPADCALL |y| (QREFELT $ 8))
                 (CONS 0
                       (CONS (SPADCALL (QVELT |s| 0) (QCDR |w|) (QREFELT $ 25))
                             (SPADCALL (QVELT |s| 1) (QCDR |w|)
                                       (QREFELT $ 25)))))
                (#1#
                 (SEQ
                  (LETT |qr|
                        (SPADCALL
                         (SPADCALL (QVELT |s| 0) (QCDR |w|) (QREFELT $ 25)) |y|
                         (QREFELT $ 13))
                        . #2#)
                  (EXIT
                   (CONS 0
                         (CONS (QCDR |qr|)
                               (SPADCALL
                                (SPADCALL (QVELT |s| 1) (QCDR |w|)
                                          (QREFELT $ 25))
                                (SPADCALL (QCAR |qr|) |x| (QREFELT $ 25))
                                (QREFELT $ 29)))))))))))))))) 

(DEFUN |EUCDOM-;principalIdeal;LR;9| (|l| $)
  (PROG (#1=#:G222 |vv| #2=#:G221 |u| |v| |uca|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |l| NIL (QREFELT $ 38))
        (|error| "empty list passed to principalIdeal"))
       ((SPADCALL (CDR |l|) NIL (QREFELT $ 38))
        (SEQ
         (LETT |uca| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 22))
               . #3=(|EUCDOM-;principalIdeal;LR;9|))
         (EXIT (CONS (LIST (QVELT |uca| 0)) (QVELT |uca| 1)))))
       ((SPADCALL (CDR (CDR |l|)) NIL (QREFELT $ 38))
        (SEQ
         (LETT |u|
               (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 39))
                         (QREFELT $ 32))
               . #3#)
         (EXIT (CONS (LIST (QVELT |u| 0) (QVELT |u| 1)) (QVELT |u| 2)))))
       ('T
        (SEQ (LETT |v| (SPADCALL (CDR |l|) (QREFELT $ 42)) . #3#)
             (LETT |u| (SPADCALL (|SPADfirst| |l|) (QCDR |v|) (QREFELT $ 32))
                   . #3#)
             (EXIT
              (CONS
               (CONS (QVELT |u| 0)
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |vv| NIL . #3#) (LETT #1# (QCAR |v|) . #3#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |vv| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL (QVELT |u| 1) |vv|
                                              (QREFELT $ 25))
                                    #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#)))))
               (QVELT |u| 2)))))))))) 

(DEFUN |EUCDOM-;expressIdealMember;LSU;10| (|l| |z| $)
  (PROG (#1=#:G240 |v| #2=#:G239 |q| |pid| #3=#:G238 #4=#:G237)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (|spadConstant| $ 26) (QREFELT $ 24))
        (CONS 0
              (PROGN
               (LETT #4# NIL . #5=(|EUCDOM-;expressIdealMember;LSU;10|))
               (SEQ (LETT |v| NIL . #5#) (LETT #3# |l| . #5#) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT (LETT #4# (CONS (|spadConstant| $ 26) #4#) . #5#)))
                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                    (EXIT (NREVERSE #4#))))))
       (#6='T
        (SEQ (LETT |pid| (SPADCALL |l| (QREFELT $ 42)) . #5#)
             (LETT |q| (SPADCALL |z| (QCDR |pid|) (QREFELT $ 33)) . #5#)
             (EXIT
              (COND ((QEQCAR |q| 1) (CONS 1 "failed"))
                    (#6#
                     (CONS 0
                           (PROGN
                            (LETT #2# NIL . #5#)
                            (SEQ (LETT |v| NIL . #5#)
                                 (LETT #1# (QCAR |pid|) . #5#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |v| (CAR #1#) . #5#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (SPADCALL (QCDR |q|) |v|
                                                    (QREFELT $ 25))
                                          #2#)
                                         . #5#)))
                                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))))))))))))) 

(DEFUN |EUCDOM-;multiEuclidean;LSU;11| (|l| |z| $)
  (PROG (|v2| |v1| |u| #1=#:G248 #2=#:G247 #3=#:G249 #4=#:G260 #5=#:G128
         #6=#:G245 #7=#:G244 #8=#:G246 #9=#:G259 #10=#:G127 |l2| |l1| |n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |l|) . #11=(|EUCDOM-;multiEuclidean;LSU;11|))
          (EXIT
           (COND ((ZEROP |n|) (|error| "empty list passed to multiEuclidean"))
                 ((EQL |n| 1) (CONS 0 (LIST |z|)))
                 (#12='T
                  (SEQ (LETT |l1| (SPADCALL |l| (QREFELT $ 46)) . #11#)
                       (LETT |l2|
                             (SPADCALL |l1| (QUOTIENT2 |n| 2) (QREFELT $ 48))
                             . #11#)
                       (LETT |u|
                             (SPADCALL
                              (PROGN
                               (LETT #6# NIL . #11#)
                               (SEQ (LETT #10# NIL . #11#)
                                    (LETT #9# |l1| . #11#) G190
                                    (COND
                                     ((OR (ATOM #9#)
                                          (PROGN
                                           (LETT #10# (CAR #9#) . #11#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #8# #10# . #11#)
                                       (COND
                                        (#6#
                                         (LETT #7#
                                               (SPADCALL #7# #8#
                                                         (QREFELT $ 25))
                                               . #11#))
                                        ('T
                                         (PROGN
                                          (LETT #7# #8# . #11#)
                                          (LETT #6# 'T . #11#)))))))
                                    (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#6# #7#) (#12# (|spadConstant| $ 23))))
                              (PROGN
                               (LETT #1# NIL . #11#)
                               (SEQ (LETT #5# NIL . #11#)
                                    (LETT #4# |l2| . #11#) G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN
                                           (LETT #5# (CAR #4#) . #11#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #3# #5# . #11#)
                                       (COND
                                        (#1#
                                         (LETT #2#
                                               (SPADCALL #2# #3#
                                                         (QREFELT $ 25))
                                               . #11#))
                                        ('T
                                         (PROGN
                                          (LETT #2# #3# . #11#)
                                          (LETT #1# 'T . #11#)))))))
                                    (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#1# #2#) (#12# (|spadConstant| $ 23))))
                              |z| (QREFELT $ 49))
                             . #11#)
                       (EXIT
                        (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                              (#12#
                               (SEQ
                                (LETT |v1|
                                      (SPADCALL |l1| (QCDR (QCDR |u|))
                                                (QREFELT $ 50))
                                      . #11#)
                                (EXIT
                                 (COND ((QEQCAR |v1| 1) (CONS 1 "failed"))
                                       (#12#
                                        (SEQ
                                         (LETT |v2|
                                               (SPADCALL |l2| (QCAR (QCDR |u|))
                                                         (QREFELT $ 50))
                                               . #11#)
                                         (EXIT
                                          (COND
                                           ((QEQCAR |v2| 1) (CONS 1 "failed"))
                                           (#12#
                                            (CONS 0
                                                  (SPADCALL (QCDR |v1|)
                                                            (QCDR |v2|)
                                                            (QREFELT $
                                                                     51)))))))))))))))))))))) 

(DECLAIM (NOTINLINE |EuclideanDomain&;|)) 

(DEFUN |EuclideanDomain&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|EuclideanDomain&|))
      (LETT |dv$| (LIST '|EuclideanDomain&| DV$1) . #1#)
      (LETT $ (GETREFV 53) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|EuclideanDomain&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (0 . |zero?|)
              (|NonNegativeInteger|) (5 . |euclideanSize|)
              |EUCDOM-;sizeLess?;2SB;1|
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (10 . |divide|)
              |EUCDOM-;quo;3S;2| |EUCDOM-;rem;3S;3| (|Union| $ '"failed")
              |EUCDOM-;exquo;2SU;4| (16 . |unitCanonical|) (21 . |rem|)
              |EUCDOM-;gcd;3S;5|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (27 . |unitNormal|) (32 . |One|) (36 . =) (42 . *) (48 . |Zero|)
              (52 . -) (58 . |sizeLess?|) (64 . +)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              |EUCDOM-;extendedEuclidean;2SR;7| (70 . |extendedEuclidean|)
              (76 . |exquo|) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 34 '"failed") |EUCDOM-;extendedEuclidean;3SU;8|
              (|List| 6) (82 . =) (88 . |second|)
              (|Record| (|:| |coef| 41) (|:| |generator| $)) (|List| $)
              (93 . |principalIdeal|) |EUCDOM-;principalIdeal;LR;9|
              (|Union| 41 '"failed") |EUCDOM-;expressIdealMember;LSU;10|
              (98 . |copy|) (|Integer|) (103 . |split!|)
              (109 . |extendedEuclidean|) (116 . |multiEuclidean|)
              (122 . |concat|) |EUCDOM-;multiEuclidean;LSU;11|)
           '#(|sizeLess?| 128 |rem| 134 |quo| 140 |principalIdeal| 146
              |multiEuclidean| 151 |gcd| 157 |extendedEuclidean| 163 |exquo|
              176 |expressIdealMember| 182)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 52
                                                 '(1 6 7 0 8 1 6 9 0 10 2 6 12
                                                   0 0 13 1 6 0 0 18 2 6 0 0 0
                                                   19 1 6 21 0 22 0 6 0 23 2 6
                                                   7 0 0 24 2 6 0 0 0 25 0 6 0
                                                   26 2 6 0 0 0 27 2 6 7 0 0 28
                                                   2 6 0 0 0 29 2 6 30 0 0 32 2
                                                   6 16 0 0 33 2 37 7 0 0 38 1
                                                   37 6 0 39 1 6 40 41 42 1 37
                                                   0 0 46 2 37 0 0 47 48 3 6 35
                                                   0 0 0 49 2 6 44 41 0 50 2 37
                                                   0 0 0 51 2 0 7 0 0 11 2 0 0
                                                   0 0 15 2 0 0 0 0 14 1 0 40
                                                   41 43 2 0 44 41 0 52 2 0 0 0
                                                   0 20 3 0 35 0 0 0 36 2 0 30
                                                   0 0 31 2 0 16 0 0 17 2 0 44
                                                   41 0 45)))))
           '|lookupComplete|)) 
