
(/VERSIONCHECK 2) 

(DEFUN |ROIRC;size;$TheField;1| (|rootCode| $)
  (SPADCALL (QVELT |rootCode| 1) (QVELT |rootCode| 0) (QREFELT $ 9))) 

(DEFUN |ROIRC;relativeApprox;ThePolDom$2TheField;2|
       (|pval| |rootCode| |prec| $)
  (PROG (|b| |a| |r| |l| |dpval| |c| |dPol|)
    (RETURN
     (SEQ
      (LETT |dPol| (QVELT |rootCode| 2)
            . #1=(|ROIRC;relativeApprox;ThePolDom$2TheField;2|))
      (EXIT
       (COND
        ((EQL (SPADCALL |dPol| (QREFELT $ 12)) 1)
         (SEQ
          (LETT |c|
                (SPADCALL
                 (SPADCALL (SPADCALL |dPol| 0 (QREFELT $ 16))
                           (SPADCALL |dPol| (QREFELT $ 17)) (QREFELT $ 18))
                 (QREFELT $ 19))
                . #1#)
          (EXIT (SPADCALL |pval| |c| (QREFELT $ 20)))))
        (#2='T
         (SEQ (LETT |pval| (SPADCALL |pval| |dPol| (QREFELT $ 21)) . #1#)
              (EXIT
               (COND
                ((EQL (SPADCALL |pval| (QREFELT $ 12)) 0)
                 (SPADCALL |pval| (QREFELT $ 17)))
                ((SPADCALL |pval| |rootCode| (QREFELT $ 23))
                 (|spadConstant| $ 14))
                (#2#
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL (SPADCALL |pval| |rootCode| (QREFELT $ 24)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |rootCode| (SPADCALL |rootCode| (QREFELT $ 25))
                               . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |dpval| (SPADCALL |pval| (QREFELT $ 26)) . #1#)
                  (EXIT
                   (COND
                    ((EQL (SPADCALL |dpval| (QREFELT $ 12)) 0)
                     (SEQ (LETT |l| (SPADCALL |rootCode| (QREFELT $ 27)) . #1#)
                          (LETT |r| (SPADCALL |rootCode| (QREFELT $ 28)) . #1#)
                          (LETT |a| (SPADCALL |pval| |l| (QREFELT $ 20)) . #1#)
                          (LETT |b| (SPADCALL |pval| |r| (QREFELT $ 20)) . #1#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL 2
                                               (SPADCALL |a| |b| (QREFELT $ 9))
                                               (QREFELT $ 30))
                                     (SPADCALL |a| |b| (QREFELT $ 31))
                                     (QREFELT $ 18))
                                    (QREFELT $ 32))
                                   |prec| (QREFELT $ 33)))
                                 (GO G191)))
                               (SEQ
                                (LETT |rootCode|
                                      (SPADCALL |rootCode| (QREFELT $ 25))
                                      . #1#)
                                (LETT |l| (SPADCALL |rootCode| (QREFELT $ 27))
                                      . #1#)
                                (LETT |r| (SPADCALL |rootCode| (QREFELT $ 28))
                                      . #1#)
                                (LETT |a| (SPADCALL |pval| |l| (QREFELT $ 20))
                                      . #1#)
                                (EXIT
                                 (LETT |b| (SPADCALL |pval| |r| (QREFELT $ 20))
                                       . #1#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (SPADCALL (SPADCALL |a| |b| (QREFELT $ 31))
                                     (SPADCALL 2 (QREFELT $ 35))
                                     (QREFELT $ 18)))))
                    ((SPADCALL |dpval| |rootCode| (QREFELT $ 23))
                     (SPADCALL |pval|
                               (VECTOR (SPADCALL |rootCode| (QREFELT $ 27))
                                       (SPADCALL |rootCode| (QREFELT $ 28))
                                       (SPADCALL |dpval| (QVELT |rootCode| 2)
                                                 (QREFELT $ 36)))
                               |prec| (QREFELT $ 37)))
                    (#2#
                     (SEQ
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL |dpval| |rootCode| (QREFELT $ 24)))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |rootCode|
                                   (SPADCALL |rootCode| (QREFELT $ 25))
                                   . #1#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |l| (SPADCALL |rootCode| (QREFELT $ 27)) . #1#)
                      (LETT |r| (SPADCALL |rootCode| (QREFELT $ 28)) . #1#)
                      (LETT |a| (SPADCALL |pval| |l| (QREFELT $ 20)) . #1#)
                      (LETT |b| (SPADCALL |pval| |r| (QREFELT $ 20)) . #1#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL 2 (SPADCALL |a| |b| (QREFELT $ 9))
                                           (QREFELT $ 30))
                                 (SPADCALL |a| |b| (QREFELT $ 31))
                                 (QREFELT $ 18))
                                (QREFELT $ 32))
                               |prec| (QREFELT $ 33)))
                             (GO G191)))
                           (SEQ
                            (LETT |rootCode|
                                  (SPADCALL |rootCode| (QREFELT $ 25)) . #1#)
                            (LETT |l| (SPADCALL |rootCode| (QREFELT $ 27))
                                  . #1#)
                            (LETT |r| (SPADCALL |rootCode| (QREFELT $ 28))
                                  . #1#)
                            (LETT |a| (SPADCALL |pval| |l| (QREFELT $ 20))
                                  . #1#)
                            (EXIT
                             (LETT |b| (SPADCALL |pval| |r| (QREFELT $ 20))
                                   . #1#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (SPADCALL (SPADCALL |a| |b| (QREFELT $ 31))
                                 (SPADCALL 2 (QREFELT $ 35))
                                 (QREFELT $ 18))))))))))))))))))) 

(DEFUN |ROIRC;approximate;ThePolDom$2TheField;3| (|pval| |rootCode| |prec| $)
  (PROG (|r| |l| |b| |a| |dpval| |c| |dPol|)
    (RETURN
     (SEQ
      (LETT |dPol| (QVELT |rootCode| 2)
            . #1=(|ROIRC;approximate;ThePolDom$2TheField;3|))
      (EXIT
       (COND
        ((EQL (SPADCALL |dPol| (QREFELT $ 12)) 1)
         (SEQ
          (LETT |c|
                (SPADCALL
                 (SPADCALL (SPADCALL |dPol| 0 (QREFELT $ 16))
                           (SPADCALL |dPol| (QREFELT $ 17)) (QREFELT $ 18))
                 (QREFELT $ 19))
                . #1#)
          (EXIT (SPADCALL |pval| |c| (QREFELT $ 20)))))
        (#2='T
         (SEQ (LETT |pval| (SPADCALL |pval| |dPol| (QREFELT $ 21)) . #1#)
              (EXIT
               (COND
                ((EQL (SPADCALL |pval| (QREFELT $ 12)) 0)
                 (SPADCALL |pval| (QREFELT $ 17)))
                (#2#
                 (SEQ (LETT |dpval| (SPADCALL |pval| (QREFELT $ 26)) . #1#)
                      (EXIT
                       (COND
                        ((EQL (SPADCALL |dpval| (QREFELT $ 12)) 0)
                         (SEQ
                          (LETT |l| (SPADCALL |rootCode| (QREFELT $ 27)) . #1#)
                          (LETT |r| (SPADCALL |rootCode| (QREFELT $ 28)) . #1#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (LETT |a|
                                           (SPADCALL |pval| |l| (QREFELT $ 20))
                                           . #1#)
                                     (LETT |b|
                                           (SPADCALL |pval| |r| (QREFELT $ 20))
                                           . #1#)
                                     (QREFELT $ 9))
                                    (QREFELT $ 32))
                                   |prec| (QREFELT $ 33)))
                                 (GO G191)))
                               (SEQ
                                (LETT |rootCode|
                                      (SPADCALL |rootCode| (QREFELT $ 25))
                                      . #1#)
                                (LETT |l| (SPADCALL |rootCode| (QREFELT $ 27))
                                      . #1#)
                                (EXIT
                                 (LETT |r| (SPADCALL |rootCode| (QREFELT $ 28))
                                       . #1#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (SPADCALL (SPADCALL |a| |b| (QREFELT $ 31))
                                     (SPADCALL 2 (QREFELT $ 35))
                                     (QREFELT $ 18)))))
                        ((SPADCALL |dpval| |rootCode| (QREFELT $ 23))
                         (SPADCALL |pval|
                                   (VECTOR (SPADCALL |rootCode| (QREFELT $ 27))
                                           (SPADCALL |rootCode| (QREFELT $ 28))
                                           (SPADCALL |dpval|
                                                     (QVELT |rootCode| 2)
                                                     (QREFELT $ 36)))
                                   |prec| (QREFELT $ 38)))
                        (#2#
                         (SEQ
                          (SEQ G190
                               (COND
                                ((NULL
                                  (SPADCALL |dpval| |rootCode| (QREFELT $ 24)))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |rootCode|
                                       (SPADCALL |rootCode| (QREFELT $ 25))
                                       . #1#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |l| (SPADCALL |rootCode| (QREFELT $ 27)) . #1#)
                          (LETT |r| (SPADCALL |rootCode| (QREFELT $ 28)) . #1#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (LETT |a|
                                           (SPADCALL |pval| |l| (QREFELT $ 20))
                                           . #1#)
                                     (LETT |b|
                                           (SPADCALL |pval| |r| (QREFELT $ 20))
                                           . #1#)
                                     (QREFELT $ 9))
                                    (QREFELT $ 32))
                                   |prec| (QREFELT $ 33)))
                                 (GO G191)))
                               (SEQ
                                (LETT |rootCode|
                                      (SPADCALL |rootCode| (QREFELT $ 25))
                                      . #1#)
                                (LETT |l| (SPADCALL |rootCode| (QREFELT $ 27))
                                      . #1#)
                                (EXIT
                                 (LETT |r| (SPADCALL |rootCode| (QREFELT $ 28))
                                       . #1#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (SPADCALL (SPADCALL |a| |b| (QREFELT $ 31))
                                     (SPADCALL 2 (QREFELT $ 35))
                                     (QREFELT $ 18))))))))))))))))))) 

(DEFUN |ROIRC;addOne| (|p| $)
  (SPADCALL |p|
            (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 40))
                      (|spadConstant| $ 39) (QREFELT $ 41))
            (QREFELT $ 42))) 

(DEFUN |ROIRC;minus| (|p| $)
  (SPADCALL |p|
            (SPADCALL (SPADCALL (|spadConstant| $ 13) (QREFELT $ 19)) 1
                      (QREFELT $ 40))
            (QREFELT $ 42))) 

(DEFUN |ROIRC;translate| (|p| |a| $)
  (SPADCALL |p|
            (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 40))
                      (SPADCALL |a| (QREFELT $ 43)) (QREFELT $ 41))
            (QREFELT $ 42))) 

(DEFUN |ROIRC;dilate| (|p| |a| $)
  (SPADCALL |p| (SPADCALL |a| 1 (QREFELT $ 40)) (QREFELT $ 42))) 

(DEFUN |ROIRC;evalOne| (|p| $)
  (PROG (#1=#:G221 #2=#:G220 #3=#:G222 #4=#:G224 #5=#:G127)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #6=(|ROIRC;evalOne|))
       (SEQ (LETT #5# NIL . #6#) (LETT #4# (SPADCALL |p| (QREFELT $ 45)) . #6#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) . #6#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# #5# . #6#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 31)) . #6#))
                     ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
            (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 14)))))))) 

(DEFUN |ROIRC;invert| (|p| $)
  (PROG (|d|)
    (RETURN
     (SEQ (LETT |d| (SPADCALL |p| (QREFELT $ 12)) |ROIRC;invert|)
          (EXIT
           (SPADCALL (CONS #'|ROIRC;invert!0| (VECTOR $ |d|)) |p|
                     (QREFELT $ 48))))))) 

(DEFUN |ROIRC;invert!0| (|z| $$)
  (PROG (|d| $)
    (LETT |d| (QREFELT $$ 1) . #1=(|ROIRC;invert|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G225)
        (RETURN
         (PROG1 (LETT #2# (SPADCALL |d| |z| (QREFELT $ 46)) NIL)
           (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#)))))))) 

(DEFUN |ROIRC;rootBound| (|p| $)
  (PROG (|res| |raw|)
    (RETURN
     (SEQ (LETT |res| (|spadConstant| $ 13) . #1=(|ROIRC;rootBound|))
          (LETT |raw|
                (SPADCALL (|spadConstant| $ 13) (SPADCALL |p| (QREFELT $ 50))
                          (QREFELT $ 31))
                . #1#)
          (SEQ G190
               (COND ((NULL (SPADCALL |res| |raw| (QREFELT $ 51))) (GO G191)))
               (SEQ
                (EXIT (LETT |res| (SPADCALL 2 |res| (QREFELT $ 30)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |ROIRC;sturmNthRoot| (|lp| |l| |r| |vl| |vr| |n| $)
  (PROG (#1=#:G238 |o| |vi| |lt| #2=#:G242 |t| |int| |nv| #3=#:G236)
    (RETURN
     (SEQ
      (LETT |nv|
            (PROG1 (LETT #3# (- |vl| |vr|) . #4=(|ROIRC;sturmNthRoot|))
              (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
            . #4#)
      (EXIT
       (COND ((< |nv| |n|) (CONS 1 "failed"))
             (#5='T
              (SEQ
               (COND
                ((EQL |nv| 1)
                 (COND ((EQL |n| 1) (EXIT (CONS 0 (CONS |l| |r|)))))))
               (LETT |int|
                     (SPADCALL (SPADCALL |l| |r| (QREFELT $ 31))
                               (SPADCALL 2 (QREFELT $ 35)) (QREFELT $ 18))
                     . #4#)
               (LETT |lt| NIL . #4#)
               (SEQ (LETT |t| NIL . #4#) (LETT #2# |lp| . #4#) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #4#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT |lt|
                            (CONS (SPADCALL |t| |int| (QREFELT $ 20)) |lt|)
                            . #4#)))
                    (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
               (LETT |vi| (SPADCALL (NREVERSE |lt|) (QREFELT $ 52)) . #4#)
               (LETT |o| (+ (- |n| |vl|) |vi|) . #4#)
               (EXIT
                (COND
                 ((SPADCALL |o| 0 (QREFELT $ 53))
                  (|ROIRC;sturmNthRoot| |lp| |int| |r| |vi| |vr|
                   (PROG1 (LETT #1# |o| . #4#)
                     (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                   $))
                 (#5#
                  (|ROIRC;sturmNthRoot| |lp| |l| |int| |vl| |vi| |n|
                   $)))))))))))) 

(DEFUN |ROIRC;sturmIsolate| (|lp| |l| |r| |vl| |vr| $)
  (PROG (|vi| #1=#:G251 |t| #2=#:G250 |int| |n| #3=#:G244)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |r| |l| (QREFELT $ 54))
        (|error| "ROIRC: sturmIsolate: bad bounds"))
       (#4='T
        (SEQ
         (LETT |n|
               (PROG1 (LETT #3# (- |vl| |vr|) . #5=(|ROIRC;sturmIsolate|))
                 (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
               . #5#)
         (EXIT
          (COND ((ZEROP |n|) NIL) ((EQL |n| 1) (LIST (CONS |l| |r|)))
                (#4#
                 (SEQ
                  (LETT |int|
                        (SPADCALL (SPADCALL |l| |r| (QREFELT $ 31))
                                  (SPADCALL 2 (QREFELT $ 35)) (QREFELT $ 18))
                        . #5#)
                  (LETT |vi|
                        (SPADCALL
                         (PROGN
                          (LETT #2# NIL . #5#)
                          (SEQ (LETT |t| NIL . #5#) (LETT #1# |lp| . #5#) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |t| (CAR #1#) . #5#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (SPADCALL |t| |int| (QREFELT $ 20))
                                        #2#)
                                       . #5#)))
                               (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 52))
                        . #5#)
                  (EXIT
                   (APPEND (|ROIRC;sturmIsolate| |lp| |l| |int| |vl| |vi| $)
                           (|ROIRC;sturmIsolate| |lp| |int| |r| |vi| |vr|
                            $)))))))))))))) 

(DEFUN |ROIRC;isolate| (|lp| $)
  (PROG (|l2| |l1| |#G41| |#G40| |#G39| |#G38| #1=#:G257 |t| |#G36| |#G35| |b|)
    (RETURN
     (SEQ
      (LETT |b| (|ROIRC;rootBound| (|SPADfirst| |lp|) $)
            . #2=(|ROIRC;isolate|))
      (PROGN
       (LETT |#G35| NIL . #2#)
       (LETT |#G36| NIL . #2#)
       (LETT |l1| |#G35| . #2#)
       (LETT |l2| |#G36| . #2#))
      (SEQ (LETT |t| NIL . #2#) (LETT #1# (REVERSE |lp|) . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((ODDP (SPADCALL |t| (QREFELT $ 12)))
               (PROGN
                (LETT |#G38|
                      (CONS
                       (SPADCALL (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 19))
                       |l1|)
                      . #2#)
                (LETT |#G39| (CONS (SPADCALL |t| (QREFELT $ 17)) |l2|) . #2#)
                (LETT |l1| |#G38| . #2#)
                (LETT |l2| |#G39| . #2#)))
              ('T
               (PROGN
                (LETT |#G40| (CONS (SPADCALL |t| (QREFELT $ 17)) |l1|) . #2#)
                (LETT |#G41| (CONS (SPADCALL |t| (QREFELT $ 17)) |l2|) . #2#)
                (LETT |l1| |#G40| . #2#)
                (LETT |l2| |#G41| . #2#))))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (|ROIRC;sturmIsolate| |lp| (SPADCALL |b| (QREFELT $ 19)) |b|
        (SPADCALL |l1| (QREFELT $ 52)) (SPADCALL |l2| (QREFELT $ 52)) $)))))) 

(DEFUN |ROIRC;rootOf;ThePolDomPiU;14| (|pol| |n| $)
  (PROG (|res| |l2| |l1| |#G54| |#G53| |#G52| |#G51| #1=#:G275 |t| |#G49|
         |#G48| |b| |ls|)
    (RETURN
     (SEQ
      (LETT |ls| (SPADCALL |pol| (QREFELT $ 56))
            . #2=(|ROIRC;rootOf;ThePolDomPiU;14|))
      (LETT |pol| (SPADCALL (|SPADfirst| |ls|) (QREFELT $ 57)) . #2#)
      (EXIT
       (COND ((EQL (SPADCALL |pol| (QREFELT $ 12)) 0) (CONS 1 "failed"))
             ((EQL (SPADCALL |pol| (QREFELT $ 58)) 1)
              (CONS 0
                    (VECTOR (|spadConstant| $ 14) (|spadConstant| $ 13)
                            (SPADCALL (|spadConstant| $ 13) 1
                                      (QREFELT $ 40)))))
             (#3='T
              (SEQ (LETT |b| (|ROIRC;rootBound| |pol| $) . #2#)
                   (PROGN
                    (LETT |#G48| NIL . #2#)
                    (LETT |#G49| NIL . #2#)
                    (LETT |l1| |#G48| . #2#)
                    (LETT |l2| |#G49| . #2#))
                   (SEQ (LETT |t| NIL . #2#) (LETT #1# (REVERSE |ls|) . #2#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((ODDP (SPADCALL |t| (QREFELT $ 12)))
                            (PROGN
                             (LETT |#G51|
                                   (CONS (SPADCALL |t| (QREFELT $ 17)) |l1|)
                                   . #2#)
                             (LETT |#G52|
                                   (CONS
                                    (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                                              (QREFELT $ 19))
                                    |l2|)
                                   . #2#)
                             (LETT |l1| |#G51| . #2#)
                             (LETT |l2| |#G52| . #2#)))
                           ('T
                            (PROGN
                             (LETT |#G53|
                                   (CONS (SPADCALL |t| (QREFELT $ 17)) |l1|)
                                   . #2#)
                             (LETT |#G54|
                                   (CONS (SPADCALL |t| (QREFELT $ 17)) |l2|)
                                   . #2#)
                             (LETT |l1| |#G53| . #2#)
                             (LETT |l2| |#G54| . #2#))))))
                        (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                   (LETT |res|
                         (|ROIRC;sturmNthRoot| |ls|
                          (SPADCALL |b| (QREFELT $ 19)) |b|
                          (SPADCALL |l2| (QREFELT $ 52))
                          (SPADCALL |l1| (QREFELT $ 52)) |n| $)
                         . #2#)
                   (EXIT
                    (COND ((QEQCAR |res| 1) (CONS 1 "failed"))
                          (#3#
                           (CONS 0
                                 (|ROIRC;makeChar| (QCAR (QCDR |res|))
                                  (QCDR (QCDR |res|)) |pol| $))))))))))))) 

(DEFUN |ROIRC;allRootsOf;ThePolDomL;15| (|pol| $)
  (PROG (#1=#:G283 |term| #2=#:G282 |ls|)
    (RETURN
     (SEQ
      (LETT |ls| (SPADCALL (SPADCALL |pol| (QREFELT $ 57)) (QREFELT $ 56))
            . #3=(|ROIRC;allRootsOf;ThePolDomL;15|))
      (LETT |pol| (SPADCALL (|SPADfirst| |ls|) (QREFELT $ 57)) . #3#)
      (EXIT
       (COND ((EQL (SPADCALL |pol| (QREFELT $ 12)) 0) NIL)
             ((EQL (SPADCALL |pol| (QREFELT $ 58)) 1)
              (LIST
               (VECTOR (|spadConstant| $ 14) (|spadConstant| $ 13)
                       (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 40)))))
             ('T
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |term| NIL . #3#)
                    (LETT #1# (|ROIRC;isolate| |ls| $) . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (|ROIRC;makeChar| (QCAR |term|) (QCDR |term|)
                              |pol| $)
                             #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(DEFUN |ROIRC;hasVarsl| (|l| $)
  (PROG (#1=#:G287 #2=#:G288 |term| |f|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |l|) 'NIL)
             ('T
              (SEQ
               (LETT |f| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 63))
                     . #3=(|ROIRC;hasVarsl|))
               (SEQ (LETT |term| NIL . #3#) (LETT #2# (CDR |l|) . #3#) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |term| (CAR #2#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |f| |term| (QREFELT $ 64))
                                  (|spadConstant| $ 14) (QREFELT $ 51))
                        (PROGN (LETT #1# 'T . #3#) (GO #1#))))))
                    (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
               (EXIT 'NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |ROIRC;hasVars| (|p| $)
  (COND
   ((SPADCALL |p| (QREFELT $ 65)) (|error| "ROIRC: hasVars: null polynonial"))
   ((SPADCALL (SPADCALL |p| 0 (QREFELT $ 16)) (QREFELT $ 66)) 'T)
   ('T (|ROIRC;hasVarsl| (SPADCALL |p| (QREFELT $ 45)) $)))) 

(DEFUN |ROIRC;mightHaveRoots;ThePolDom$B;18| (|p| |rootChar| $)
  (PROG (|q| |a|)
    (RETURN
     (SEQ
      (LETT |a| (QVELT |rootChar| 0)
            . #1=(|ROIRC;mightHaveRoots;ThePolDom$B;18|))
      (LETT |q| (|ROIRC;translate| |p| |a| $) . #1#)
      (COND ((NULL (|ROIRC;hasVars| |q| $)) (EXIT 'NIL)))
      (LETT |a| (SPADCALL (QVELT |rootChar| 1) |a| (QREFELT $ 9)) . #1#)
      (LETT |q| (|ROIRC;dilate| |q| |a| $) . #1#)
      (EXIT
       (COND
        ((SPADCALL
          (* (SPADCALL (SPADCALL |q| 0 (QREFELT $ 16)) (QREFELT $ 63))
             (SPADCALL (|ROIRC;evalOne| |q| $) (QREFELT $ 63)))
          0 (QREFELT $ 67))
         'T)
        ('T
         (SEQ (LETT |q| (|ROIRC;minus| (|ROIRC;addOne| |q| $) $) . #1#)
              (COND ((NULL (|ROIRC;hasVars| |q| $)) (EXIT 'NIL)))
              (LETT |q| (|ROIRC;invert| |q| $) . #1#)
              (EXIT (|ROIRC;hasVars| (|ROIRC;addOne| |q| $) $)))))))))) 

(DEFUN |ROIRC;coerce;$Of;19| (|rootChar| $)
  (SPADCALL
   (LIST
    (SPADCALL "[" (SPADCALL (QVELT |rootChar| 0) (QREFELT $ 69))
              (QREFELT $ 70))
    (SPADCALL (SPADCALL (QVELT |rootChar| 1) (QREFELT $ 69)) "["
              (QREFELT $ 70)))
   (QREFELT $ 71))) 

(DEFUN |ROIRC;=;2$B;20| (|c1| |c2| $)
  (PROG (|rr| |Mm| |mM|)
    (RETURN
     (SEQ
      (LETT |mM| (SPADCALL (QVELT |c1| 0) (QVELT |c2| 0) (QREFELT $ 73))
            . #1=(|ROIRC;=;2$B;20|))
      (LETT |Mm| (SPADCALL (QVELT |c1| 1) (QVELT |c2| 1) (QREFELT $ 74)) . #1#)
      (EXIT
       (COND ((SPADCALL |mM| |Mm| (QREFELT $ 75)) 'NIL)
             (#2='T
              (SEQ
               (LETT |rr|
                     (SPADCALL (QVELT |c1| 2) (QVELT |c2| 2) (QREFELT $ 36))
                     . #1#)
               (EXIT
                (COND ((EQL (SPADCALL |rr| (QREFELT $ 12)) 0) 'NIL)
                      (#2#
                       (SPADCALL
                        (*
                         (SPADCALL (SPADCALL |rr| |mM| (QREFELT $ 20))
                                   (QREFELT $ 63))
                         (SPADCALL (SPADCALL |rr| |Mm| (QREFELT $ 20))
                                   (QREFELT $ 63)))
                        0 (QREFELT $ 67))))))))))))) 

(DEFUN |ROIRC;makeChar| (|left| |right| |pol| $)
  (PROG (|res|)
    (RETURN
     (SEQ
      (LETT |res|
            (VECTOR |left| |right|
                    (SPADCALL (SPADCALL |pol| (QREFELT $ 77))
                              (SPADCALL |pol| (QREFELT $ 78)) (QREFELT $ 41)))
            |ROIRC;makeChar|)
      (SEQ G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |pol| (QVELT |res| 1) (QREFELT $ 20))
                        (QREFELT $ 66)))
             (GO G191)))
           (SEQ (EXIT (|ROIRC;refine!| |res| $))) NIL (GO G190) G191
           (EXIT NIL))
      (SEQ G190
           (COND
            ((NULL
              (SPADCALL
               (SPADCALL (QVELT |res| 1) (QVELT |res| 0) (QREFELT $ 79))
               (|spadConstant| $ 14) (QREFELT $ 51)))
             (GO G191)))
           (SEQ (EXIT (|ROIRC;refine!| |res| $))) NIL (GO G190) G191
           (EXIT NIL))
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |pol| (QVELT |res| 0) (QREFELT $ 20))
                   (QREFELT $ 66))
         (VECTOR (QVELT |res| 0) (QVELT |res| 1)
                 (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 40))
                           (SPADCALL (QVELT |res| 0) (QREFELT $ 43))
                           (QREFELT $ 80))))
        ('T |res|))))))) 

(PUT '|ROIRC;definingPolynomial;$ThePolDom;22| '|SPADreplace|
     '(XLAM (|rootChar|) (QVELT |rootChar| 2))) 

(DEFUN |ROIRC;definingPolynomial;$ThePolDom;22| (|rootChar| $)
  (QVELT |rootChar| 2)) 

(DEFUN |ROIRC;linearRecip| (|toTest| |rootChar| $)
  (PROG (#1=#:G308 |newPol| |r| |c|)
    (RETURN
     (SEQ
      (LETT |c|
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL |toTest| (QREFELT $ 17)) (QREFELT $ 82))
              (SPADCALL |toTest| 0 (QREFELT $ 16)) (QREFELT $ 79))
             (QREFELT $ 19))
            . #2=(|ROIRC;linearRecip|))
      (LETT |r|
            (SPADCALL (SPADCALL (QVELT |rootChar| 2) |c| (QREFELT $ 20))
                      (QREFELT $ 83))
            . #2#)
      (EXIT
       (COND
        ((QEQCAR |r| 1)
         (COND
          ((SPADCALL
            (SPADCALL (SPADCALL |c| (QVELT |rootChar| 0) (QREFELT $ 9))
                      (SPADCALL |c| (QVELT |rootChar| 1) (QREFELT $ 9))
                      (QREFELT $ 79))
            (|spadConstant| $ 14) (QREFELT $ 54))
           (CONS 1 "failed"))
          (#3='T
           (SEQ
            (LETT |newPol|
                  (PROG2
                      (LETT #1#
                            (SPADCALL (QVELT |rootChar| 2) |toTest|
                                      (QREFELT $ 84))
                            . #2#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                  . #2#)
            (EXIT
             (CONS 0
                   (PROG2
                       (LETT #1#
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 39)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |newPol| |c|
                                                    (QREFELT $ 20))
                                          (QREFELT $ 82))
                                         |newPol| (QREFELT $ 85))
                                        (QREFELT $ 80))
                              |toTest| (QREFELT $ 84))
                             . #2#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))))))))
        (#3#
         (CONS 0
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 39)
                                    (SPADCALL (QCDR |r|) (QVELT |rootChar| 2)
                                              (QREFELT $ 85))
                                    (QREFELT $ 80))
                          |toTest| (QREFELT $ 84))
                         . #2#)
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#)))))))))) 

(DEFUN |ROIRC;recip;ThePolDom$U;24| (|toTest| |rootChar| $)
  (PROG (|d| #1=#:G318 |c| |newPol|)
    (RETURN
     (SEQ
      (COND
       ((OR (EQL (SPADCALL |toTest| (QREFELT $ 12)) 0)
            (SPADCALL (SPADCALL (QVELT |rootChar| 2) (QREFELT $ 12))
                      (SPADCALL |toTest| (QREFELT $ 12)) (QREFELT $ 86)))
        (|error| "IRC: recip: Not reduced"))
       ('T
        (COND
         ((EQL (SPADCALL (QVELT |rootChar| 2) (QREFELT $ 12)) 1)
          (|error| "IRC: recip: Linear Defining Polynomial"))
         ((EQL (SPADCALL |toTest| (QREFELT $ 12)) 1)
          (|ROIRC;linearRecip| |toTest| |rootChar| $))
         (#2='T
          (SEQ
           (LETT |d| (SPADCALL (QVELT |rootChar| 2) |toTest| (QREFELT $ 88))
                 . #3=(|ROIRC;recip;ThePolDom$U;24|))
           (EXIT
            (COND
             ((EQL (SPADCALL (QVELT |d| 2) (QREFELT $ 12)) 0)
              (CONS 0 (QVELT |d| 1)))
             (#2#
              (SEQ (QSETVELT |d| 2 (SPADCALL (QVELT |d| 2) (QREFELT $ 57)))
                   (EXIT
                    (COND
                     ((SPADCALL
                       (SPADCALL
                        (SPADCALL (QVELT |d| 2) (QVELT |rootChar| 0)
                                  (QREFELT $ 20))
                        (SPADCALL (QVELT |d| 2) (QVELT |rootChar| 1)
                                  (QREFELT $ 20))
                        (QREFELT $ 79))
                       (|spadConstant| $ 14) (QREFELT $ 54))
                      (CONS 1 "failed"))
                     (#2#
                      (SEQ
                       (LETT |newPol|
                             (PROG2
                                 (LETT #1#
                                       (SPADCALL (QVELT |rootChar| 2)
                                                 (QVELT |d| 2) (QREFELT $ 84))
                                       . #3#)
                                 (QCDR #1#)
                               (|check_union| (QEQCAR #1# 0) (QREFELT $ 7)
                                              #1#))
                             . #3#)
                       (EXIT
                        (COND
                         ((EQL (SPADCALL |newPol| (QREFELT $ 12)) 1)
                          (SEQ
                           (LETT |c|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |newPol| (QREFELT $ 17))
                                             (QREFELT $ 82))
                                   (SPADCALL |newPol| 0 (QREFELT $ 16))
                                   (QREFELT $ 79))
                                  (QREFELT $ 19))
                                 . #3#)
                           (EXIT
                            (CONS 0
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |toTest| |c| (QREFELT $ 20))
                                    (QREFELT $ 82))
                                   (QREFELT $ 43))))))
                         ((EQL (SPADCALL |toTest| (QREFELT $ 12)) 1)
                          (SEQ
                           (LETT |c|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |toTest| 0 (QREFELT $ 16))
                                   (SPADCALL |toTest| (QREFELT $ 17))
                                   (QREFELT $ 18))
                                  (QREFELT $ 19))
                                 . #3#)
                           (EXIT
                            (CONS 0
                                  (PROG2
                                      (LETT #1#
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| $ 39)
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL |newPol| |c|
                                                                   (QREFELT $
                                                                            20))
                                                         (QREFELT $ 82))
                                                        |newPol|
                                                        (QREFELT $ 85))
                                                       (QREFELT $ 80))
                                             |toTest| (QREFELT $ 84))
                                            . #3#)
                                      (QCDR #1#)
                                    (|check_union| (QEQCAR #1# 0) (QREFELT $ 7)
                                                   #1#))))))
                         (#2#
                          (SEQ
                           (LETT |d|
                                 (SPADCALL |newPol| |toTest| (QREFELT $ 88))
                                 . #3#)
                           (EXIT (CONS 0 (QVELT |d| 1)))))))))))))))))))))))) 

(DEFUN |ROIRC;linearSign| (|toTest| |rootChar| $)
  (PROG (|ev| |c|)
    (RETURN
     (SEQ
      (LETT |c|
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL |toTest| (QREFELT $ 17)) (QREFELT $ 82))
              (SPADCALL |toTest| 0 (QREFELT $ 16)) (QREFELT $ 79))
             (QREFELT $ 19))
            . #1=(|ROIRC;linearSign|))
      (LETT |ev|
            (SPADCALL (SPADCALL (QVELT |rootChar| 2) |c| (QREFELT $ 20))
                      (QREFELT $ 63))
            . #1#)
      (EXIT
       (COND
        ((ZEROP |ev|)
         (COND
          ((SPADCALL
            (SPADCALL (SPADCALL |c| (QVELT |rootChar| 0) (QREFELT $ 9))
                      (SPADCALL |c| (QVELT |rootChar| 1) (QREFELT $ 9))
                      (QREFELT $ 79))
            (|spadConstant| $ 14) (QREFELT $ 54))
           0)
          (#2='T
           (SPADCALL (SPADCALL |toTest| (QVELT |rootChar| 1) (QREFELT $ 20))
                     (QREFELT $ 63)))))
        ((SPADCALL
          (* |ev|
             (SPADCALL
              (SPADCALL (QVELT |rootChar| 2) (QVELT |rootChar| 1)
                        (QREFELT $ 20))
              (QREFELT $ 63)))
          0 (QREFELT $ 67))
         (SPADCALL (SPADCALL |toTest| (QVELT |rootChar| 1) (QREFELT $ 20))
                   (QREFELT $ 63)))
        (#2#
         (SPADCALL (SPADCALL |toTest| (QVELT |rootChar| 0) (QREFELT $ 20))
                   (QREFELT $ 63))))))))) 

(DEFUN |ROIRC;sign;ThePolDom$I;26| (|toTest| |rootChar| $)
  (PROG (|newChar| #1=#:G345 #2=#:G356 |delta| |s|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (EQL (SPADCALL |toTest| (QREFELT $ 12)) 0)
             (SPADCALL (SPADCALL (QVELT |rootChar| 2) (QREFELT $ 12))
                       (SPADCALL |toTest| (QREFELT $ 12)) (QREFELT $ 67)))
         (|error| "IRC: sign: Not reduced"))
        ('T
         (COND
          ((EQL (SPADCALL (QVELT |rootChar| 2) (QREFELT $ 12)) 1)
           (|error| "IRC: sign: Linear Defining Polynomial"))
          ((EQL (SPADCALL |toTest| (QREFELT $ 12)) 1)
           (|ROIRC;linearSign| |toTest| |rootChar| $))
          (#3='T
           (SEQ
            (LETT |s|
                  (SPADCALL (SPADCALL |toTest| (QREFELT $ 17)) (QREFELT $ 63))
                  . #4=(|ROIRC;sign;ThePolDom$I;26|))
            (LETT |toTest|
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 13)
                             (SPADCALL |toTest| (QREFELT $ 12)) (QREFELT $ 40))
                   (SPADCALL
                    (SPADCALL (SPADCALL |toTest| (QREFELT $ 17))
                              (QREFELT $ 82))
                    (SPADCALL |toTest| (QREFELT $ 78)) (QREFELT $ 85))
                   (QREFELT $ 41))
                  . #4#)
            (LETT |delta|
                  (SPADCALL |toTest| (QVELT |rootChar| 2) (QREFELT $ 36))
                  . #4#)
            (LETT |newChar|
                  (VECTOR (QVELT |rootChar| 0) (QVELT |rootChar| 1)
                          (QVELT |rootChar| 2))
                  . #4#)
            (COND
             ((SPADCALL (SPADCALL |delta| (QREFELT $ 12)) 0 (QREFELT $ 91))
              (COND
               ((SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL |delta| (QVELT |rootChar| 0) (QREFELT $ 20))
                   (SPADCALL |delta| (QVELT |rootChar| 1) (QREFELT $ 20))
                   (QREFELT $ 79))
                  (QREFELT $ 63))
                 0 (QREFELT $ 67))
                (PROGN (LETT #2# 0 . #4#) (GO #2#)))
               (#3#
                (SEQ
                 (QSETVELT |newChar| 2
                           (PROG2
                               (LETT #1#
                                     (SPADCALL (QVELT |newChar| 2) |delta|
                                               (QREFELT $ 84))
                                     . #4#)
                               (QCDR #1#)
                             (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#)))
                 (EXIT
                  (LETT |toTest|
                        (SPADCALL |toTest| (QVELT |newChar| 2) (QREFELT $ 21))
                        . #4#)))))))
            (EXIT
             (COND
              ((EQL (SPADCALL |toTest| (QREFELT $ 12)) 0)
               (* |s|
                  (SPADCALL (SPADCALL |toTest| (QREFELT $ 17))
                            (QREFELT $ 63))))
              ((EQL (SPADCALL |toTest| (QREFELT $ 12)) 1)
               (* |s| (|ROIRC;linearSign| |toTest| |newChar| $)))
              (#3#
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |toTest| |newChar| (QREFELT $ 24)))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |newChar| (SPADCALL |newChar| (QREFELT $ 25))
                             . #4#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (* |s|
                    (SPADCALL
                     (SPADCALL |toTest| (QVELT |newChar| 0) (QREFELT $ 20))
                     (QREFELT $ 63))))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |ROIRC;linearZero?| (|c| |rootChar| $)
  (COND
   ((SPADCALL (SPADCALL (QVELT |rootChar| 2) |c| (QREFELT $ 20))
              (QREFELT $ 66))
    (SPADCALL
     (SPADCALL (SPADCALL |c| (QVELT |rootChar| 0) (QREFELT $ 9))
               (SPADCALL |c| (QVELT |rootChar| 1) (QREFELT $ 9))
               (QREFELT $ 79))
     (|spadConstant| $ 14) (QREFELT $ 54)))
   ('T 'NIL))) 

(DEFUN |ROIRC;zero?;ThePolDom$B;28| (|toTest| |rootChar| $)
  (PROG (|delta|)
    (RETURN
     (SEQ
      (COND
       ((OR (EQL (SPADCALL |toTest| (QREFELT $ 12)) 0)
            (SPADCALL (SPADCALL (QVELT |rootChar| 2) (QREFELT $ 12))
                      (SPADCALL |toTest| (QREFELT $ 12)) (QREFELT $ 86)))
        (|error| "IRC: zero?: Not reduced"))
       ('T
        (COND
         ((EQL (SPADCALL (QVELT |rootChar| 2) (QREFELT $ 12)) 1)
          (|error| "IRC: zero?: Linear Defining Polynomial"))
         ((EQL (SPADCALL |toTest| (QREFELT $ 12)) 1)
          (|ROIRC;linearZero?|
           (SPADCALL
            (SPADCALL
             (SPADCALL (SPADCALL |toTest| (QREFELT $ 17)) (QREFELT $ 82))
             (SPADCALL |toTest| 0 (QREFELT $ 16)) (QREFELT $ 79))
            (QREFELT $ 19))
           |rootChar| $))
         (#1='T
          (SEQ
           (LETT |toTest|
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 13)
                            (SPADCALL |toTest| (QREFELT $ 12)) (QREFELT $ 40))
                  (SPADCALL
                   (SPADCALL (SPADCALL |toTest| (QREFELT $ 17)) (QREFELT $ 82))
                   (SPADCALL |toTest| (QREFELT $ 78)) (QREFELT $ 85))
                  (QREFELT $ 41))
                 . #2=(|ROIRC;zero?;ThePolDom$B;28|))
           (LETT |delta|
                 (SPADCALL |toTest| (QVELT |rootChar| 2) (QREFELT $ 36)) . #2#)
           (EXIT
            (COND ((EQL (SPADCALL |delta| (QREFELT $ 12)) 0) 'NIL)
                  (#1#
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |delta| (QVELT |rootChar| 0) (QREFELT $ 20))
                      (SPADCALL |delta| (QVELT |rootChar| 1) (QREFELT $ 20))
                      (QREFELT $ 79))
                     (QREFELT $ 63))
                    0 (QREFELT $ 67)))))))))))))) 

(DEFUN |ROIRC;refine!| (|rootChar| $)
  (PROG (|s2| |s1| |int|)
    (RETURN
     (SEQ
      (LETT |int| (SPADCALL |rootChar| (QREFELT $ 93)) . #1=(|ROIRC;refine!|))
      (LETT |s1|
            (SPADCALL
             (SPADCALL (QVELT |rootChar| 2) (QVELT |rootChar| 0)
                       (QREFELT $ 20))
             (QREFELT $ 63))
            . #1#)
      (EXIT
       (COND
        ((ZEROP |s1|)
         (SEQ (QSETVELT |rootChar| 1 |int|)
              (QSETVELT |rootChar| 2
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 40))
                         (SPADCALL (QVELT |rootChar| 0) (QREFELT $ 43))
                         (QREFELT $ 80)))
              (EXIT |rootChar|)))
        (#2='T
         (SEQ
          (LETT |s2|
                (SPADCALL (SPADCALL (QVELT |rootChar| 2) |int| (QREFELT $ 20))
                          (QREFELT $ 63))
                . #1#)
          (EXIT
           (COND
            ((ZEROP |s2|)
             (SEQ (QSETVELT |rootChar| 0 |int|)
                  (QSETVELT |rootChar| 2
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 40))
                             (SPADCALL |int| (QREFELT $ 43)) (QREFELT $ 80)))
                  (EXIT |rootChar|)))
            (#2#
             (SEQ
              (COND ((< (* |s1| |s2|) 0) (QSETVELT |rootChar| 1 |int|))
                    (#2# (QSETVELT |rootChar| 0 |int|)))
              (EXIT |rootChar|))))))))))))) 

(DEFUN |ROIRC;refine;2$;30| (|rootChar| $)
  (PROG (|s| |int|)
    (RETURN
     (SEQ
      (LETT |int| (SPADCALL |rootChar| (QREFELT $ 93))
            . #1=(|ROIRC;refine;2$;30|))
      (LETT |s|
            (SPADCALL (SPADCALL (QVELT |rootChar| 2) |int| (QREFELT $ 20))
                      (SPADCALL (QVELT |rootChar| 2) (QVELT |rootChar| 1)
                                (QREFELT $ 20))
                      (QREFELT $ 79))
            . #1#)
      (EXIT
       (COND
        ((SPADCALL |s| (QREFELT $ 66))
         (VECTOR |int| (QVELT |rootChar| 1)
                 (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 40))
                           (SPADCALL |int| (QREFELT $ 43)) (QREFELT $ 80))))
        ((SPADCALL |s| (|spadConstant| $ 14) (QREFELT $ 51))
         (VECTOR |int| (QVELT |rootChar| 1) (QVELT |rootChar| 2)))
        ('T (VECTOR (QVELT |rootChar| 0) |int| (QVELT |rootChar| 2))))))))) 

(PUT '|ROIRC;left;$TheField;31| '|SPADreplace|
     '(XLAM (|rootChar|) (QVELT |rootChar| 0))) 

(DEFUN |ROIRC;left;$TheField;31| (|rootChar| $) (QVELT |rootChar| 0)) 

(PUT '|ROIRC;right;$TheField;32| '|SPADreplace|
     '(XLAM (|rootChar|) (QVELT |rootChar| 1))) 

(DEFUN |ROIRC;right;$TheField;32| (|rootChar| $) (QVELT |rootChar| 1)) 

(DEFUN |ROIRC;middle;$TheField;33| (|rootChar| $)
  (SPADCALL (SPADCALL (QVELT |rootChar| 0) (QVELT |rootChar| 1) (QREFELT $ 31))
            (SPADCALL 2 (QREFELT $ 35)) (QREFELT $ 18))) 

(DEFUN |RightOpenIntervalRootCharacterization| (&REST #1=#:G378)
  (PROG ()
    (RETURN
     (PROG (#2=#:G379)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|RightOpenIntervalRootCharacterization|)
                                           '|domainEqualList|)
                . #3=(|RightOpenIntervalRootCharacterization|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |RightOpenIntervalRootCharacterization;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|RightOpenIntervalRootCharacterization|))))))))))) 

(DEFUN |RightOpenIntervalRootCharacterization;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|RightOpenIntervalRootCharacterization|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|RightOpenIntervalRootCharacterization| DV$1 DV$2)
            . #1#)
      (LETT $ (GETREFV 97) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|RightOpenIntervalRootCharacterization|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8
                (|Record| (|:| |low| |#1|) (|:| |high| |#1|)
                          (|:| |defPol| |#2|)))
      $)))) 

(MAKEPROP '|RightOpenIntervalRootCharacterization| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (0 . -) |ROIRC;size;$TheField;1| (|NonNegativeInteger|)
              (6 . |degree|) (11 . |One|) (15 . |Zero|) (19 . |Zero|)
              (23 . |coefficient|) (29 . |leadingCoefficient|) (34 . /)
              (40 . -) (45 . |elt|) (51 . |rem|) (|Boolean|)
              |ROIRC;zero?;ThePolDom$B;28|
              |ROIRC;mightHaveRoots;ThePolDom$B;18| |ROIRC;refine;2$;30|
              (57 . |differentiate|) |ROIRC;left;$TheField;31|
              |ROIRC;right;$TheField;32| (|PositiveInteger|) (62 . *) (68 . +)
              (74 . |abs|) (79 . >) (|Integer|) (85 . |coerce|) (90 . |gcd|)
              |ROIRC;relativeApprox;ThePolDom$2TheField;2|
              |ROIRC;approximate;ThePolDom$2TheField;3| (96 . |One|)
              (100 . |monomial|) (106 . +) (112 . |elt|) (118 . |coerce|)
              (|List| 6) (123 . |coefficients|) (128 . -) (|Mapping| 11 11)
              (134 . |mapExponents|) (|RealPolynomialUtilitiesPackage| 6 7)
              (140 . |boundOfCauchy|) (145 . <) (151 . |sturmVariationsOf|)
              (156 . >) (162 . <=) (|List| 7) (168 . |sturmSequence|)
              (173 . |unitCanonical|) (178 . |numberOfMonomials|)
              (|Union| $ '#1="failed") |ROIRC;rootOf;ThePolDomPiU;14|
              (|List| $) |ROIRC;allRootsOf;ThePolDomL;15| (183 . |sign|)
              (188 . *) (194 . |zero?|) (199 . |zero?|) (204 . <=)
              (|OutputForm|) (210 . |coerce|) (215 . |hconcat|)
              (221 . |commaSeparate|) |ROIRC;coerce;$Of;19| (226 . |max|)
              (232 . |min|) (238 . >=) |ROIRC;=;2$B;20|
              (244 . |leadingMonomial|) (249 . |reductum|) (254 . *) (260 . -)
              |ROIRC;definingPolynomial;$ThePolDom;22| (266 . |inv|)
              (271 . |recip|) (276 . |exquo|) (282 . *) (288 . <=)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (294 . |extendedEuclidean|) (|Union| 7 '#1#)
              |ROIRC;recip;ThePolDom$U;24| (300 . >)
              |ROIRC;sign;ThePolDom$I;26| |ROIRC;middle;$TheField;33|
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 306 |zero?| 312 |size| 318 |sign| 323 |rootOf| 329 |right| 335
              |relativeApprox| 340 |refine| 347 |recip| 352 |positive?| 358
              |negative?| 364 |mightHaveRoots| 370 |middle| 376 |left| 381
              |latex| 386 |hashUpdate!| 391 |hash| 397 |definingPolynomial| 402
              |coerce| 407 |approximate| 412 |allRootsOf| 419 = 424)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS
                  '#(|RealRootCharacterizationCategory&| |SetCategory&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|RealRootCharacterizationCategory| 6 7) (|SetCategory|)
                      (|BasicType|) (|CoercibleTo| 68))
                   (|makeByteWordVec2| 96
                                       '(2 6 0 0 0 9 1 7 11 0 12 0 6 0 13 0 6 0
                                         14 0 7 0 15 2 7 6 0 11 16 1 7 6 0 17 2
                                         6 0 0 0 18 1 6 0 0 19 2 7 6 0 6 20 2 7
                                         0 0 0 21 1 7 0 0 26 2 6 0 29 0 30 2 6
                                         0 0 0 31 1 6 0 0 32 2 6 22 0 0 33 1 6
                                         0 34 35 2 7 0 0 0 36 0 7 0 39 2 7 0 6
                                         11 40 2 7 0 0 0 41 2 7 0 0 0 42 1 7 0
                                         6 43 1 7 44 0 45 2 34 0 0 0 46 2 7 0
                                         47 0 48 1 49 6 7 50 2 6 22 0 0 51 1 49
                                         11 44 52 2 34 22 0 0 53 2 6 22 0 0 54
                                         1 49 55 7 56 1 7 0 0 57 1 7 11 0 58 1
                                         6 34 0 63 2 6 0 34 0 64 1 7 22 0 65 1
                                         6 22 0 66 2 34 22 0 0 67 1 6 68 0 69 2
                                         68 0 0 0 70 1 68 0 61 71 2 6 0 0 0 73
                                         2 6 0 0 0 74 2 6 22 0 0 75 1 7 0 0 77
                                         1 7 0 0 78 2 6 0 0 0 79 2 7 0 0 0 80 1
                                         6 0 0 82 1 6 59 0 83 2 7 59 0 0 84 2 7
                                         0 6 0 85 2 11 22 0 0 86 2 7 87 0 0 88
                                         2 11 22 0 0 91 2 0 22 0 0 1 2 0 22 7 0
                                         23 1 0 6 0 10 2 0 34 7 0 92 2 0 59 7
                                         29 60 1 0 6 0 28 3 0 6 7 0 6 37 1 0 0
                                         0 25 2 0 89 7 0 90 2 0 22 7 0 1 2 0 22
                                         7 0 1 2 0 22 7 0 24 1 0 6 0 93 1 0 6 0
                                         27 1 0 94 0 1 2 0 96 96 0 1 1 0 95 0 1
                                         1 0 7 0 81 1 0 68 0 72 3 0 6 7 0 6 38
                                         1 0 61 7 62 2 0 22 0 0 76)))))
           '|lookupComplete|)) 
