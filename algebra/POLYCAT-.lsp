
(/VERSIONCHECK 2) 

(DEFUN |POLYCAT-;eval;SLS;1| (|p| |l| $)
  (PROG (#1=#:G169 |e| #2=#:G168 |lvar| #3=#:G167 #4=#:G166 #5=#:G159
         #6=#:G165)
    (RETURN
     (SEQ
      (COND ((NULL |l|) |p|)
            ('T
             (SEQ
              (SEQ
               (EXIT
                (SEQ (LETT |e| NIL . #7=(|POLYCAT-;eval;SLS;1|))
                     (LETT #6# |l| . #7#) G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |e| (CAR #6#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((QEQCAR
                          (SPADCALL (SPADCALL |e| (QREFELT $ 11))
                                    (QREFELT $ 13))
                          1)
                         (PROGN
                          (LETT #5#
                                (|error| "cannot find a variable to evaluate")
                                . #7#)
                          (GO #5#))))))
                     (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL)))
               #5# (EXIT #5#))
              (LETT |lvar|
                    (PROGN
                     (LETT #4# NIL . #7#)
                     (SEQ (LETT |e| NIL . #7#) (LETT #3# |l| . #7#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |e| (CAR #3#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL (SPADCALL |e| (QREFELT $ 11))
                                             (QREFELT $ 14))
                                   #4#)
                                  . #7#)))
                          (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #7#)
              (EXIT
               (SPADCALL |p| |lvar|
                         (PROGN
                          (LETT #2# NIL . #7#)
                          (SEQ (LETT |e| NIL . #7#) (LETT #1# |l| . #7#) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |e| (CAR #1#) . #7#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (SPADCALL |e| (QREFELT $ 15)) #2#)
                                       . #7#)))
                               (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 18)))))))))) 

(DEFUN |POLYCAT-;monomials;SL;2| (|p| $)
  (PROG (|ml|)
    (RETURN
     (SEQ (LETT |ml| NIL . #1=(|POLYCAT-;monomials;SL;2|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 24)))
                 (GO G191)))
               (SEQ (LETT |ml| (CONS (SPADCALL |p| (QREFELT $ 25)) |ml|) . #1#)
                    (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 26)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (REVERSE |ml|)))))) 

(DEFUN |POLYCAT-;isPlus;SU;3| (|p| $)
  (PROG (|l|)
    (RETURN
     (COND
      ((NULL
        (CDR (LETT |l| (SPADCALL |p| (QREFELT $ 28)) |POLYCAT-;isPlus;SU;3|)))
       (CONS 1 "failed"))
      ('T (CONS 0 |l|)))))) 

(DEFUN |POLYCAT-;isTimes;SU;4| (|p| $)
  (PROG (|r| |l| #1=#:G192 |v| #2=#:G191 |lv|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (NULL
          (LETT |lv| (SPADCALL |p| (QREFELT $ 31))
                . #3=(|POLYCAT-;isTimes;SU;4|)))
         (NULL (SPADCALL |p| (QREFELT $ 32))))
        (CONS 1 "failed"))
       ('T
        (SEQ
         (LETT |l|
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |v| NIL . #3#) (LETT #1# |lv| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (SPADCALL (|spadConstant| $ 33) |v|
                                        (SPADCALL |p| |v| (QREFELT $ 36))
                                        (QREFELT $ 37))
                              #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               . #3#)
         (LETT |r| (SPADCALL |p| (QREFELT $ 38)) . #3#)
         (EXIT
          (COND
           ((SPADCALL |r| (|spadConstant| $ 34) (QREFELT $ 39))
            (COND ((NULL (CDR |lv|)) (CONS 1 "failed")) (#4='T (CONS 0 |l|))))
           (#4# (CONS 0 (CONS (SPADCALL |r| (QREFELT $ 40)) |l|)))))))))))) 

(DEFUN |POLYCAT-;isExpt;SU;5| (|p| $)
  (PROG (|d| |u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |p| (QREFELT $ 42)) . #1=(|POLYCAT-;isExpt;SU;5|))
      (EXIT
       (COND
        ((OR (QEQCAR |u| 1)
             (NULL
              (SPADCALL |p|
                        (SPADCALL (|spadConstant| $ 33) (QCDR |u|)
                                  (LETT |d|
                                        (SPADCALL |p| (QCDR |u|)
                                                  (QREFELT $ 36))
                                        . #1#)
                                  (QREFELT $ 37))
                        (QREFELT $ 43))))
         (CONS 1 "failed"))
        ('T (CONS 0 (CONS (QCDR |u|) |d|))))))))) 

(DEFUN |POLYCAT-;coefficient;SVarSetNniS;6| (|p| |v| |n| $)
  (SPADCALL (SPADCALL |p| |v| (QREFELT $ 48)) |n| (QREFELT $ 50))) 

(DEFUN |POLYCAT-;coefficient;SLLS;7| (|p| |lv| |ln| $)
  (COND
   ((NULL |lv|)
    (COND ((NULL |ln|) |p|)
          (#1='T (|error| "mismatched lists in coefficient"))))
   ((NULL |ln|) (|error| "mismatched lists in coefficient"))
   (#1#
    (SPADCALL
     (SPADCALL (SPADCALL |p| (|SPADfirst| |lv|) (QREFELT $ 48))
               (|SPADfirst| |ln|) (QREFELT $ 50))
     (CDR |lv|) (CDR |ln|) (QREFELT $ 53))))) 

(DEFUN |POLYCAT-;monomial;SLLS;8| (|p| |lv| |ln| $)
  (COND
   ((NULL |lv|)
    (COND ((NULL |ln|) |p|) (#1='T (|error| "mismatched lists in monomial"))))
   ((NULL |ln|) (|error| "mismatched lists in monomial"))
   (#1#
    (SPADCALL
     (SPADCALL |p| (|SPADfirst| |lv|) (|SPADfirst| |ln|) (QREFELT $ 37))
     (CDR |lv|) (CDR |ln|) (QREFELT $ 55))))) 

(DEFUN |POLYCAT-;retract;SVarSet;9| (|p| $)
  (PROG (|q| #1=#:G217)
    (RETURN
     (SEQ
      (LETT |q|
            (PROG2
                (LETT #1# (SPADCALL |p| (QREFELT $ 42))
                      . #2=(|POLYCAT-;retract;SVarSet;9|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
            . #2#)
      (EXIT
       (COND ((SPADCALL (SPADCALL |q| (QREFELT $ 57)) |p| (QREFELT $ 43)) |q|)
             ('T (|error| "Polynomial is not a single variable")))))))) 

(DEFUN |POLYCAT-;retractIfCan;SU;10| (|p| $)
  (PROG (#1=#:G225 |q|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |q| (SPADCALL |p| (QREFELT $ 42))
               . #2=(|POLYCAT-;retractIfCan;SU;10|))
         (EXIT
          (COND
           ((QEQCAR |q| 0)
            (COND
             ((SPADCALL (SPADCALL (QCDR |q|) (QREFELT $ 57)) |p|
                        (QREFELT $ 43))
              (PROGN (LETT #1# |q| . #2#) (GO #1#))))))))
        (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(DEFUN |POLYCAT-;mkPrim| (|p| $)
  (SPADCALL (|spadConstant| $ 34) (SPADCALL |p| (QREFELT $ 60)) (QREFELT $ 61))) 

(DEFUN |POLYCAT-;primitiveMonomials;SL;12| (|p| $)
  (PROG (#1=#:G231 |q| #2=#:G230)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|POLYCAT-;primitiveMonomials;SL;12|))
       (SEQ (LETT |q| NIL . #3#) (LETT #1# (SPADCALL |p| (QREFELT $ 28)) . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |q| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ (EXIT (LETT #2# (CONS (|POLYCAT-;mkPrim| |q| $) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |POLYCAT-;totalDegree;SNni;13| (|p| $)
  (PROG (|u| |d| #1=#:G233)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 63)) 0)
            ('T
             (SEQ
              (LETT |u|
                    (SPADCALL |p|
                              (PROG2
                                  (LETT #1# (SPADCALL |p| (QREFELT $ 42))
                                        . #2=(|POLYCAT-;totalDegree;SNni;13|))
                                  (QCDR #1#)
                                (|check_union| (QEQCAR #1# 0) (QREFELT $ 9)
                                               #1#))
                              (QREFELT $ 48))
                    . #2#)
              (LETT |d| 0 . #2#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |u| (|spadConstant| $ 64) (QREFELT $ 65)))
                     (GO G191)))
                   (SEQ
                    (LETT |d|
                          (MAX |d|
                               (+ (SPADCALL |u| (QREFELT $ 66))
                                  (SPADCALL (SPADCALL |u| (QREFELT $ 67))
                                            (QREFELT $ 68))))
                          . #2#)
                    (EXIT (LETT |u| (SPADCALL |u| (QREFELT $ 69)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |d|)))))))) 

(DEFUN |POLYCAT-;totalDegreeSorted;SLNni;14| (|p| |lv| $)
  (PROG (|u| |d| |w| |v0| |v| #1=#:G241)
    (RETURN
     (SEQ
      (COND ((OR (SPADCALL |p| (QREFELT $ 63)) (NULL |lv|)) 0)
            ('T
             (SEQ
              (LETT |u|
                    (SPADCALL |p|
                              (LETT |v|
                                    (PROG2
                                        (LETT #1# (SPADCALL |p| (QREFELT $ 42))
                                              . #2=(|POLYCAT-;totalDegreeSorted;SLNni;14|))
                                        (QCDR #1#)
                                      (|check_union| (QEQCAR #1# 0)
                                                     (QREFELT $ 9) #1#))
                                    . #2#)
                              (QREFELT $ 48))
                    . #2#)
              (LETT |d| 0 . #2#) (LETT |w| 0 . #2#)
              (LETT |v0| (|SPADfirst| |lv|) . #2#) (LETT |lv| (CDR |lv|) . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((NULL |lv|) 'NIL)
                            ('T (SPADCALL |v| |v0| (QREFELT $ 71)))))
                     (GO G191)))
                   (SEQ (LETT |v0| (|SPADfirst| |lv|) . #2#)
                        (EXIT (LETT |lv| (CDR |lv|) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND ((SPADCALL |v0| |v| (QREFELT $ 72)) (LETT |w| 1 . #2#)))
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |u| (|spadConstant| $ 64) (QREFELT $ 65)))
                     (GO G191)))
                   (SEQ
                    (LETT |d|
                          (MAX |d|
                               (+ (* |w| (SPADCALL |u| (QREFELT $ 66)))
                                  (SPADCALL (SPADCALL |u| (QREFELT $ 67)) |lv|
                                            (QREFELT $ 73))))
                          . #2#)
                    (EXIT (LETT |u| (SPADCALL |u| (QREFELT $ 69)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |d|)))))))) 

(DEFUN |POLYCAT-;totalDegree;SLNni;15| (|p| |lv| $)
  (PROG (|lv1|)
    (RETURN
     (SEQ
      (LETT |lv1|
            (SPADCALL (CONS #'|POLYCAT-;totalDegree;SLNni;15!0| $) |lv|
                      (QREFELT $ 76))
            |POLYCAT-;totalDegree;SLNni;15|)
      (EXIT (SPADCALL |p| |lv1| (QREFELT $ 73))))))) 

(DEFUN |POLYCAT-;totalDegree;SLNni;15!0| (|v1| |v2| $)
  (SPADCALL |v2| |v1| (QREFELT $ 71))) 

(DEFUN |POLYCAT-;resultant;2SVarSetS;16| (|p1| |p2| |mvar| $)
  (SPADCALL (SPADCALL |p1| |mvar| (QREFELT $ 48))
            (SPADCALL |p2| |mvar| (QREFELT $ 48)) (QREFELT $ 78))) 

(DEFUN |POLYCAT-;discriminant;SVarSetS;17| (|p| |var| $)
  (SPADCALL (SPADCALL |p| |var| (QREFELT $ 48)) (QREFELT $ 80))) 

(DEFUN |POLYCAT-;allMonoms| (|l| $)
  (PROG (#1=#:G262 |p| #2=#:G261)
    (RETURN
     (SEQ
      (SPADCALL
       (SPADCALL
        (PROGN
         (LETT #2# NIL . #3=(|POLYCAT-;allMonoms|))
         (SEQ (LETT |p| NIL . #3#) (LETT #1# |l| . #3#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 82)) #2#) . #3#)))
              (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
        (QREFELT $ 84))
       (QREFELT $ 85)))))) 

(DEFUN |POLYCAT-;P2R| (|p| |b| |n| $)
  (PROG (#1=#:G266 |i| #2=#:G267 |bj| |w|)
    (RETURN
     (SEQ (LETT |w| (MAKEARR1 |n| (|spadConstant| $ 22)) . #3=(|POLYCAT-;P2R|))
          (SEQ (LETT |bj| NIL . #3#) (LETT #2# |b| . #3#)
               (LETT |i| (SPADCALL |w| (QREFELT $ 88)) . #3#)
               (LETT #1# (QVSIZE |w|) . #3#) G190
               (COND
                ((OR (> |i| #1#) (ATOM #2#)
                     (PROGN (LETT |bj| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1O |w| |i| (SPADCALL |p| |bj| (QREFELT $ 89)) 1)))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #2# (CDR #2#) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |w|))))) 

(DEFUN |POLYCAT-;eq2R| (|l| |b| $)
  (PROG (#1=#:G274 |p| #2=#:G273 #3=#:G272 |bj| #4=#:G271)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #4# NIL . #5=(|POLYCAT-;eq2R|))
        (SEQ (LETT |bj| NIL . #5#) (LETT #3# |b| . #5#) G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |bj| (CAR #3#) . #5#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #4#
                     (CONS
                      (PROGN
                       (LETT #2# NIL . #5#)
                       (SEQ (LETT |p| NIL . #5#) (LETT #1# |l| . #5#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |p| (CAR #1#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |p| |bj| (QREFELT $ 89))
                                          #2#)
                                    . #5#)))
                            (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      #4#)
                     . #5#)))
             (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT (NREVERSE #4#))))
       (QREFELT $ 92)))))) 

(DEFUN |POLYCAT-;reducedSystem;MM;21| (|m| $)
  (PROG (|l| |mm| |d| #1=#:G287 |bj| #2=#:G286 |b| #3=#:G285 |r| #4=#:G284)
    (RETURN
     (SEQ
      (LETT |l| (SPADCALL |m| (QREFELT $ 95))
            . #5=(|POLYCAT-;reducedSystem;MM;21|))
      (LETT |b|
            (SPADCALL
             (SPADCALL
              (PROGN
               (LETT #4# NIL . #5#)
               (SEQ (LETT |r| NIL . #5#) (LETT #3# |l| . #5#) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #4# (CONS (|POLYCAT-;allMonoms| |r| $) #4#)
                            . #5#)))
                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                    (EXIT (NREVERSE #4#))))
              (QREFELT $ 84))
             (QREFELT $ 85))
            . #5#)
      (LETT |d|
            (PROGN
             (LETT #2# NIL . #5#)
             (SEQ (LETT |bj| NIL . #5#) (LETT #1# |b| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |bj| (CAR #1#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |bj| (QREFELT $ 60)) #2#)
                          . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #5#)
      (LETT |mm| (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| $) . #5#)
      (LETT |l| (CDR |l|) . #5#)
      (SEQ G190 (COND ((NULL (COND ((NULL |l|) 'NIL) ('T 'T))) (GO G191)))
           (SEQ
            (LETT |mm|
                  (SPADCALL |mm| (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| $)
                            (QREFELT $ 96))
                  . #5#)
            (EXIT (LETT |l| (CDR |l|) . #5#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |mm|))))) 

(DEFUN |POLYCAT-;reducedSystem;MVR;22| (|m| |v| $)
  (PROG (|r| |l| |w| |mm| |n| |d| #1=#:G302 |bj| #2=#:G301 |b| #3=#:G300 |s|
         #4=#:G299)
    (RETURN
     (SEQ
      (LETT |l| (SPADCALL |m| (QREFELT $ 95))
            . #5=(|POLYCAT-;reducedSystem;MVR;22|))
      (LETT |r| (SPADCALL |v| (QREFELT $ 100)) . #5#)
      (LETT |b|
            (SPADCALL
             (SPADCALL (|POLYCAT-;allMonoms| |r| $)
                       (SPADCALL
                        (PROGN
                         (LETT #4# NIL . #5#)
                         (SEQ (LETT |s| NIL . #5#) (LETT #3# |l| . #5#) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |s| (CAR #3#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS (|POLYCAT-;allMonoms| |s| $) #4#)
                                      . #5#)))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        (QREFELT $ 84))
                       (QREFELT $ 101))
             (QREFELT $ 85))
            . #5#)
      (LETT |d|
            (PROGN
             (LETT #2# NIL . #5#)
             (SEQ (LETT |bj| NIL . #5#) (LETT #1# |b| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |bj| (CAR #1#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |bj| (QREFELT $ 60)) #2#)
                          . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #5#)
      (LETT |n| (LENGTH |d|) . #5#)
      (LETT |mm| (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| $) . #5#)
      (LETT |w| (|POLYCAT-;P2R| (|SPADfirst| |r|) |d| |n| $) . #5#)
      (LETT |l| (CDR |l|) . #5#) (LETT |r| (CDR |r|) . #5#)
      (SEQ G190 (COND ((NULL (COND ((NULL |l|) 'NIL) ('T 'T))) (GO G191)))
           (SEQ
            (LETT |mm|
                  (SPADCALL |mm| (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| $)
                            (QREFELT $ 96))
                  . #5#)
            (LETT |w|
                  (SPADCALL |w| (|POLYCAT-;P2R| (|SPADfirst| |r|) |d| |n| $)
                            (QREFELT $ 102))
                  . #5#)
            (LETT |l| (CDR |l|) . #5#) (EXIT (LETT |r| (CDR |r|) . #5#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |mm| |w|)))))) 

(DEFUN |POLYCAT-;gcdPolynomial;3Sup;23| (|pp| |qq| $)
  (SPADCALL |pp| |qq| (QREFELT $ 107))) 

(DEFUN |POLYCAT-;solveLinearPolynomialEquation;LSupU;24| (|lpp| |pp| $)
  (SPADCALL |lpp| |pp| (QREFELT $ 112))) 

(DEFUN |POLYCAT-;factorPolynomial;SupF;25| (|pp| $)
  (SPADCALL |pp| (QREFELT $ 117))) 

(DEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;26| (|pp| $)
  (SPADCALL |pp| (QREFELT $ 120))) 

(DEFUN |POLYCAT-;factor;SF;27| (|p| $)
  (PROG (#1=#:G335 |ww| #2=#:G334 |ansSUP| |up| #3=#:G333 |w| #4=#:G332 |ansR|
         |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL |p| (QREFELT $ 42)) . #5=(|POLYCAT-;factor;SF;27|))
      (EXIT
       (COND
        ((QEQCAR |v| 1)
         (SEQ
          (LETT |ansR| (SPADCALL (SPADCALL |p| (QREFELT $ 38)) (QREFELT $ 123))
                . #5#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |ansR| (QREFELT $ 125)) (QREFELT $ 40))
            (PROGN
             (LETT #4# NIL . #5#)
             (SEQ (LETT |w| NIL . #5#)
                  (LETT #3# (SPADCALL |ansR| (QREFELT $ 129)) . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |w| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (VECTOR (QVELT |w| 0)
                                   (SPADCALL (QVELT |w| 1) (QREFELT $ 40))
                                   (QVELT |w| 2))
                           #4#)
                          . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            (QREFELT $ 133)))))
        ('T
         (SEQ (LETT |up| (SPADCALL |p| (QCDR |v|) (QREFELT $ 48)) . #5#)
              (LETT |ansSUP| (SPADCALL |up| (QREFELT $ 117)) . #5#)
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |ansSUP| (QREFELT $ 134)) (QCDR |v|)
                          (QREFELT $ 135))
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |ww| NIL . #5#)
                      (LETT #1# (SPADCALL |ansSUP| (QREFELT $ 138)) . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ww| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (VECTOR (QVELT |ww| 0)
                                       (SPADCALL (QVELT |ww| 1) (QCDR |v|)
                                                 (QREFELT $ 135))
                                       (QVELT |ww| 2))
                               #2#)
                              . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 133))))))))))) 

(DEFUN |POLYCAT-;conditionP;MU;28| (|mat| $)
  (PROG (#1=#:G358 #2=#:G357 #3=#:G359 |i| #4=#:G377 |m| #5=#:G374 #6=#:G376
         |mons| #7=#:G375 |ans| |monslist| |llR| #8=#:G372 |u| #9=#:G373 |v|
         #10=#:G371 |redmons| |deg1| #11=#:G346 #12=#:G363 |nd| #13=#:G370 |d|
         #14=#:G369 |degs| |vars| #15=#:G368 #16=#:G341 #17=#:G340 #18=#:G342
         #19=#:G367 #20=#:G366 |l| |ch| #21=#:G365 |z| #22=#:G364 |ll|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ll| (SPADCALL (SPADCALL |mat| (QREFELT $ 140)) (QREFELT $ 95))
              . #23=(|POLYCAT-;conditionP;MU;28|))
        (LETT |llR|
              (PROGN
               (LETT #22# NIL . #23#)
               (SEQ (LETT |z| NIL . #23#) (LETT #21# (|SPADfirst| |ll|) . #23#)
                    G190
                    (COND
                     ((OR (ATOM #21#) (PROGN (LETT |z| (CAR #21#) . #23#) NIL))
                      (GO G191)))
                    (SEQ (EXIT (LETT #22# (CONS NIL #22#) . #23#)))
                    (LETT #21# (CDR #21#) . #23#) (GO G190) G191
                    (EXIT (NREVERSE #22#))))
              . #23#)
        (LETT |monslist| NIL . #23#)
        (LETT |ch| (SPADCALL (QREFELT $ 141)) . #23#)
        (SEQ (LETT |l| NIL . #23#) (LETT #20# |ll| . #23#) G190
             (COND
              ((OR (ATOM #20#) (PROGN (LETT |l| (CAR #20#) . #23#) NIL))
               (GO G191)))
             (SEQ
              (LETT |mons|
                    (PROGN
                     (LETT #16# NIL . #23#)
                     (SEQ (LETT |u| NIL . #23#) (LETT #19# |l| . #23#) G190
                          (COND
                           ((OR (ATOM #19#)
                                (PROGN (LETT |u| (CAR #19#) . #23#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #18# (SPADCALL |u| (QREFELT $ 82)) . #23#)
                             (COND
                              (#16#
                               (LETT #17# (SPADCALL #17# #18# (QREFELT $ 142))
                                     . #23#))
                              ('T
                               (PROGN
                                (LETT #17# #18# . #23#)
                                (LETT #16# 'T . #23#)))))))
                          (LETT #19# (CDR #19#) . #23#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#16# #17#) ('T (|IdentityError| '|setUnion|))))
                    . #23#)
              (LETT |redmons| NIL . #23#)
              (SEQ (LETT |m| NIL . #23#) (LETT #15# |mons| . #23#) G190
                   (COND
                    ((OR (ATOM #15#) (PROGN (LETT |m| (CAR #15#) . #23#) NIL))
                     (GO G191)))
                   (SEQ (LETT |vars| (SPADCALL |m| (QREFELT $ 31)) . #23#)
                        (LETT |degs| (SPADCALL |m| |vars| (QREFELT $ 143))
                              . #23#)
                        (LETT |deg1|
                              (PROGN
                               (LETT #14# NIL . #23#)
                               (SEQ (LETT |d| NIL . #23#)
                                    (LETT #13# |degs| . #23#) G190
                                    (COND
                                     ((OR (ATOM #13#)
                                          (PROGN
                                           (LETT |d| (CAR #13#) . #23#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #14#
                                            (CONS
                                             (SEQ
                                              (LETT |nd|
                                                    (SPADCALL |d| |ch|
                                                              (QREFELT $ 145))
                                                    . #23#)
                                              (EXIT
                                               (COND
                                                ((QEQCAR |nd| 1)
                                                 (PROGN
                                                  (LETT #12# (CONS 1 "failed")
                                                        . #23#)
                                                  (GO #12#)))
                                                ('T
                                                 (PROG1
                                                     (LETT #11# (QCDR |nd|)
                                                           . #23#)
                                                   (|check_subtype| (>= #11# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    #11#))))))
                                             #14#)
                                            . #23#)))
                                    (LETT #13# (CDR #13#) . #23#) (GO G190)
                                    G191 (EXIT (NREVERSE #14#))))
                              . #23#)
                        (LETT |redmons|
                              (CONS
                               (SPADCALL (|spadConstant| $ 33) |vars| |deg1|
                                         (QREFELT $ 55))
                               |redmons|)
                              . #23#)
                        (EXIT
                         (LETT |llR|
                               (PROGN
                                (LETT #10# NIL . #23#)
                                (SEQ (LETT |v| NIL . #23#)
                                     (LETT #9# |llR| . #23#)
                                     (LETT |u| NIL . #23#)
                                     (LETT #8# |l| . #23#) G190
                                     (COND
                                      ((OR (ATOM #8#)
                                           (PROGN
                                            (LETT |u| (CAR #8#) . #23#)
                                            NIL)
                                           (ATOM #9#)
                                           (PROGN
                                            (LETT |v| (CAR #9#) . #23#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #10#
                                             (CONS
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL |u| |vars| |degs|
                                                          (QREFELT $ 53))
                                                (QREFELT $ 146))
                                               |v|)
                                              #10#)
                                             . #23#)))
                                     (LETT #8#
                                           (PROG1 (CDR #8#)
                                             (LETT #9# (CDR #9#) . #23#))
                                           . #23#)
                                     (GO G190) G191 (EXIT (NREVERSE #10#))))
                               . #23#)))
                   (LETT #15# (CDR #15#) . #23#) (GO G190) G191 (EXIT NIL))
              (EXIT (LETT |monslist| (CONS |redmons| |monslist|) . #23#)))
             (LETT #20# (CDR #20#) . #23#) (GO G190) G191 (EXIT NIL))
        (LETT |ans|
              (SPADCALL
               (SPADCALL (SPADCALL |llR| (QREFELT $ 92)) (QREFELT $ 147))
               (QREFELT $ 149))
              . #23#)
        (EXIT
         (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
               ('T
                (SEQ (LETT |i| 0 . #23#)
                     (EXIT
                      (CONS 0
                            (PROGN
                             (LETT #7# (GETREFV (SIZE |monslist|)) . #23#)
                             (SEQ (LETT |mons| NIL . #23#)
                                  (LETT #6# |monslist| . #23#)
                                  (LETT #5# 0 . #23#) G190
                                  (COND
                                   ((OR (ATOM #6#)
                                        (PROGN
                                         (LETT |mons| (CAR #6#) . #23#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SETELT #7# #5#
                                            (PROGN
                                             (LETT #1# NIL . #23#)
                                             (SEQ (LETT |m| NIL . #23#)
                                                  (LETT #4# |mons| . #23#) G190
                                                  (COND
                                                   ((OR (ATOM #4#)
                                                        (PROGN
                                                         (LETT |m| (CAR #4#)
                                                               . #23#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #3#
                                                           (SPADCALL |m|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QCDR
                                                                        |ans|)
                                                                       (LETT
                                                                        |i|
                                                                        (+ |i|
                                                                           1)
                                                                        . #23#)
                                                                       (QREFELT
                                                                        $ 150))
                                                                      (QREFELT
                                                                       $ 40))
                                                                     (QREFELT $
                                                                              151))
                                                           . #23#)
                                                     (COND
                                                      (#1#
                                                       (LETT #2#
                                                             (SPADCALL #2# #3#
                                                                       (QREFELT
                                                                        $ 152))
                                                             . #23#))
                                                      ('T
                                                       (PROGN
                                                        (LETT #2# #3# . #23#)
                                                        (LETT #1# 'T
                                                              . #23#)))))))
                                                  (LETT #4# (CDR #4#) . #23#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (COND (#1# #2#)
                                                   ('T
                                                    (|spadConstant| $ 21)))))))
                                  (LETT #5#
                                        (PROG1 (|inc_SI| #5#)
                                          (LETT #6# (CDR #6#) . #23#))
                                        . #23#)
                                  (GO G190) G191 (EXIT NIL))
                             #7#)))))))))
      #12# (EXIT #12#))))) 

(DEFUN |POLYCAT-;charthRoot;SU;29| (|p| $)
  (PROG (|ch| |ans| |vars|)
    (RETURN
     (SEQ
      (LETT |vars| (SPADCALL |p| (QREFELT $ 31))
            . #1=(|POLYCAT-;charthRoot;SU;29|))
      (EXIT
       (COND
        ((NULL |vars|)
         (SEQ
          (LETT |ans| (SPADCALL (SPADCALL |p| (QREFELT $ 146)) (QREFELT $ 154))
                . #1#)
          (EXIT
           (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                 (#2='T (CONS 0 (SPADCALL (QCDR |ans|) (QREFELT $ 40))))))))
        (#2#
         (SEQ (LETT |ch| (SPADCALL (QREFELT $ 141)) . #1#)
              (EXIT (|POLYCAT-;charthRootlv| |p| |vars| |ch| $)))))))))) 

(DEFUN |POLYCAT-;charthRootlv| (|p| |vars| |ch| $)
  (PROG (#1=#:G406 |ansx| |ans| #2=#:G399 |d| |cp| |dd| |v|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL |vars|)
         (SEQ
          (LETT |ans| (SPADCALL (SPADCALL |p| (QREFELT $ 146)) (QREFELT $ 154))
                . #3=(|POLYCAT-;charthRootlv|))
          (EXIT
           (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                 (#4='T (CONS 0 (SPADCALL (QCDR |ans|) (QREFELT $ 40))))))))
        (#4#
         (SEQ (LETT |v| (|SPADfirst| |vars|) . #3#)
              (LETT |vars| (CDR |vars|) . #3#)
              (LETT |d| (SPADCALL |p| |v| (QREFELT $ 36)) . #3#)
              (LETT |ans| (|spadConstant| $ 21) . #3#)
              (SEQ G190
                   (COND ((NULL (SPADCALL |d| 0 (QREFELT $ 156))) (GO G191)))
                   (SEQ (LETT |dd| (SPADCALL |d| |ch| (QREFELT $ 145)) . #3#)
                        (EXIT
                         (COND
                          ((QEQCAR |dd| 1)
                           (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                          ('T
                           (SEQ
                            (LETT |cp| (SPADCALL |p| |v| |d| (QREFELT $ 157))
                                  . #3#)
                            (LETT |p|
                                  (SPADCALL |p|
                                            (SPADCALL |cp| |v| |d|
                                                      (QREFELT $ 37))
                                            (QREFELT $ 158))
                                  . #3#)
                            (LETT |ansx|
                                  (|POLYCAT-;charthRootlv| |cp| |vars| |ch| $)
                                  . #3#)
                            (EXIT
                             (COND
                              ((QEQCAR |ansx| 1)
                               (PROGN
                                (LETT #1# (CONS 1 "failed") . #3#)
                                (GO #1#)))
                              ('T
                               (SEQ
                                (LETT |d| (SPADCALL |p| |v| (QREFELT $ 36))
                                      . #3#)
                                (EXIT
                                 (LETT |ans|
                                       (SPADCALL |ans|
                                                 (SPADCALL (QCDR |ansx|) |v|
                                                           (PROG1
                                                               (LETT #2#
                                                                     (QCDR
                                                                      |dd|)
                                                                     . #3#)
                                                             (|check_subtype|
                                                              (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              #2#))
                                                           (QREFELT $ 37))
                                                 (QREFELT $ 152))
                                       . #3#)))))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |ansx| (|POLYCAT-;charthRootlv| |p| |vars| |ch| $) . #3#)
              (EXIT
               (COND
                ((QEQCAR |ansx| 1)
                 (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                (#4#
                 (PROGN
                  (LETT #1#
                        (CONS 0 (SPADCALL |ans| (QCDR |ansx|) (QREFELT $ 152)))
                        . #3#)
                  (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |POLYCAT-;monicDivide;2SVarSetR;31| (|p1| |p2| |mvar| $)
  (PROG (|result|)
    (RETURN
     (SEQ
      (LETT |result|
            (SPADCALL (SPADCALL |p1| |mvar| (QREFELT $ 48))
                      (SPADCALL |p2| |mvar| (QREFELT $ 48)) (QREFELT $ 160))
            |POLYCAT-;monicDivide;2SVarSetR;31|)
      (EXIT
       (CONS (SPADCALL (QCAR |result|) |mvar| (QREFELT $ 135))
             (SPADCALL (QCDR |result|) |mvar| (QREFELT $ 135)))))))) 

(DEFUN |POLYCAT-;squareFree;SF;32| (|p| $) (SPADCALL |p| (QREFELT $ 163))) 

(DEFUN |POLYCAT-;squareFree;SF;33| (|p| $) (SPADCALL |p| (QREFELT $ 166))) 

(DEFUN |POLYCAT-;squareFree;SF;34| (|p| $) (SPADCALL |p| (QREFELT $ 166))) 

(DEFUN |POLYCAT-;squareFreePart;2S;35| (|p| $)
  (PROG (#1=#:G416 #2=#:G415 #3=#:G417 #4=#:G419 |f| |s|)
    (RETURN
     (SEQ
      (SPADCALL
       (SPADCALL
        (LETT |s| (SPADCALL |p| (QREFELT $ 167))
              . #5=(|POLYCAT-;squareFreePart;2S;35|))
        (QREFELT $ 168))
       (PROGN
        (LETT #1# NIL . #5#)
        (SEQ (LETT |f| NIL . #5#)
             (LETT #4# (SPADCALL |s| (QREFELT $ 171)) . #5#) G190
             (COND
              ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (PROGN
                (LETT #3# (QCAR |f|) . #5#)
                (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 151)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
             (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
        (COND (#1# #2#) ('T (|spadConstant| $ 33))))
       (QREFELT $ 151)))))) 

(DEFUN |POLYCAT-;content;SVarSetS;36| (|p| |v| $)
  (SPADCALL (SPADCALL |p| |v| (QREFELT $ 48)) (QREFELT $ 173))) 

(DEFUN |POLYCAT-;primitivePart;2S;37| (|p| $)
  (PROG (#1=#:G422)
    (RETURN
     (COND ((SPADCALL |p| (QREFELT $ 175)) |p|)
           ('T
            (QVELT
             (SPADCALL
              (PROG2
                  (LETT #1#
                        (SPADCALL |p| (SPADCALL |p| (QREFELT $ 176))
                                  (QREFELT $ 177))
                        |POLYCAT-;primitivePart;2S;37|)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
              (QREFELT $ 179))
             1)))))) 

(DEFUN |POLYCAT-;primitivePart;SVarSetS;38| (|p| |v| $)
  (PROG (#1=#:G428)
    (RETURN
     (COND ((SPADCALL |p| (QREFELT $ 175)) |p|)
           ('T
            (QVELT
             (SPADCALL
              (PROG2
                  (LETT #1#
                        (SPADCALL |p| (SPADCALL |p| |v| (QREFELT $ 181))
                                  (QREFELT $ 182))
                        |POLYCAT-;primitivePart;SVarSetS;38|)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
              (QREFELT $ 179))
             1)))))) 

(DEFUN |POLYCAT-;smaller?;2SB;39| (|p| |q| $)
  (PROG (|dq| |dp|)
    (RETURN
     (SEQ
      (LETT |dp| (SPADCALL |p| (QREFELT $ 60))
            . #1=(|POLYCAT-;smaller?;2SB;39|))
      (LETT |dq| (SPADCALL |q| (QREFELT $ 60)) . #1#)
      (EXIT
       (COND
        ((SPADCALL |dp| |dq| (QREFELT $ 184))
         (SPADCALL (|spadConstant| $ 22) (SPADCALL |q| (QREFELT $ 38))
                   (QREFELT $ 186)))
        ((SPADCALL |dq| |dp| (QREFELT $ 184))
         (SPADCALL (SPADCALL |p| (QREFELT $ 38)) (|spadConstant| $ 22)
                   (QREFELT $ 186)))
        ('T
         (SPADCALL (SPADCALL (SPADCALL |p| |q| (QREFELT $ 158)) (QREFELT $ 38))
                   (|spadConstant| $ 22) (QREFELT $ 186))))))))) 

(DEFUN |POLYCAT-;patternMatch;SP2Pmr;40| (|p| |pat| |l| $)
  (SPADCALL |p| |pat| |l| (QREFELT $ 191))) 

(DEFUN |POLYCAT-;patternMatch;SP2Pmr;41| (|p| |pat| |l| $)
  (SPADCALL |p| |pat| |l| (QREFELT $ 197))) 

(DEFUN |POLYCAT-;convert;SP;42| (|x| $)
  (SPADCALL (ELT $ 200) (ELT $ 201) |x| (QREFELT $ 205))) 

(DEFUN |POLYCAT-;convert;SP;43| (|x| $)
  (SPADCALL (ELT $ 207) (ELT $ 208) |x| (QREFELT $ 212))) 

(DEFUN |POLYCAT-;convert;SIf;44| (|p| $)
  (SPADCALL (ELT $ 215) (ELT $ 216) |p| (QREFELT $ 220))) 

(DEFUN |PolynomialCategory&| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|PolynomialCategory&| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 230) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|canonicalUnitNormal|))
                                          (|HasCategory| |#2| '(|GcdDomain|))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#4|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#4|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#4|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#4|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#4|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#2|
                                                         '(|Comparable|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 4)
        (PROGN
         (QSETREFV $ 79
                   (CONS (|dispatchFunction| |POLYCAT-;resultant;2SVarSetS;16|)
                         $))
         (QSETREFV $ 81
                   (CONS
                    (|dispatchFunction| |POLYCAT-;discriminant;SVarSetS;17|)
                    $)))))
      (COND
       ((|HasCategory| |#2| '(|IntegralDomain|))
        (PROGN
         (QSETREFV $ 98
                   (CONS (|dispatchFunction| |POLYCAT-;reducedSystem;MM;21|)
                         $))
         (QSETREFV $ 105
                   (CONS (|dispatchFunction| |POLYCAT-;reducedSystem;MVR;22|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 108
                   (CONS (|dispatchFunction| |POLYCAT-;gcdPolynomial;3Sup;23|)
                         $))
         (QSETREFV $ 115
                   (CONS
                    (|dispatchFunction|
                     |POLYCAT-;solveLinearPolynomialEquation;LSupU;24|)
                    $))
         (QSETREFV $ 119
                   (CONS
                    (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;25|)
                    $))
         (QSETREFV $ 121
                   (CONS
                    (|dispatchFunction|
                     |POLYCAT-;factorSquareFreePolynomial;SupF;26|)
                    $))
         (QSETREFV $ 139 (CONS (|dispatchFunction| |POLYCAT-;factor;SF;27|) $))
         (COND
          ((|HasCategory| |#2| '(|CharacteristicNonZero|))
           (PROGN
            (QSETREFV $ 153
                      (CONS (|dispatchFunction| |POLYCAT-;conditionP;MU;28|)
                            $))))))))
      (COND
       ((|HasCategory| |#2| '(|CharacteristicNonZero|))
        (PROGN
         (QSETREFV $ 155
                   (CONS (|dispatchFunction| |POLYCAT-;charthRoot;SU;29|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (COND
          ((|HasCategory| |#2| '(|EuclideanDomain|))
           (COND
            ((|HasCategory| |#2| '(|CharacteristicZero|))
             (QSETREFV $ 164
                       (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;32|)
                             $)))
            ('T
             (QSETREFV $ 164
                       (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;33|)
                             $)))))
          ('T
           (QSETREFV $ 164
                     (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;34|)
                           $))))
         (QSETREFV $ 172
                   (CONS (|dispatchFunction| |POLYCAT-;squareFreePart;2S;35|)
                         $))
         (QSETREFV $ 174
                   (CONS (|dispatchFunction| |POLYCAT-;content;SVarSetS;36|)
                         $))
         (QSETREFV $ 180
                   (CONS (|dispatchFunction| |POLYCAT-;primitivePart;2S;37|)
                         $))
         (QSETREFV $ 183
                   (CONS
                    (|dispatchFunction| |POLYCAT-;primitivePart;SVarSetS;38|)
                    $)))))
      (COND
       ((|testBitVector| |pv$| 15)
        (PROGN
         (QSETREFV $ 187
                   (CONS (|dispatchFunction| |POLYCAT-;smaller?;2SB;39|) $))
         (COND
          ((|testBitVector| |pv$| 8)
           (COND
            ((|testBitVector| |pv$| 7)
             (QSETREFV $ 193
                       (CONS
                        (|dispatchFunction| |POLYCAT-;patternMatch;SP2Pmr;40|)
                        $))))))
         (COND
          ((|testBitVector| |pv$| 6)
           (COND
            ((|testBitVector| |pv$| 5)
             (QSETREFV $ 199
                       (CONS
                        (|dispatchFunction| |POLYCAT-;patternMatch;SP2Pmr;41|)
                        $)))))))))
      (COND
       ((|testBitVector| |pv$| 12)
        (COND
         ((|testBitVector| |pv$| 11)
          (QSETREFV $ 206
                    (CONS (|dispatchFunction| |POLYCAT-;convert;SP;42|) $))))))
      (COND
       ((|testBitVector| |pv$| 10)
        (COND
         ((|testBitVector| |pv$| 9)
          (QSETREFV $ 213
                    (CONS (|dispatchFunction| |POLYCAT-;convert;SP;43|) $))))))
      (COND
       ((|testBitVector| |pv$| 14)
        (COND
         ((|testBitVector| |pv$| 13)
          (QSETREFV $ 221
                    (CONS (|dispatchFunction| |POLYCAT-;convert;SIf;44|)
                          $))))))
      $)))) 

(MAKEPROP '|PolynomialCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Equation| 6) (0 . |lhs|)
              (|Union| 9 '#1="failed") (5 . |retractIfCan|) (10 . |retract|)
              (15 . |rhs|) (|List| 9) (|List| $) (20 . |eval|) (|List| 225)
              |POLYCAT-;eval;SLS;1| (27 . |Zero|) (31 . |Zero|) (|Boolean|)
              (35 . ~=) (41 . |leadingMonomial|) (46 . |reductum|)
              |POLYCAT-;monomials;SL;2| (51 . |monomials|)
              (|Union| 17 '"failed") |POLYCAT-;isPlus;SU;3| (56 . |variables|)
              (61 . |monomial?|) (66 . |One|) (70 . |One|)
              (|NonNegativeInteger|) (74 . |degree|) (80 . |monomial|)
              (87 . |leadingCoefficient|) (92 . =) (98 . |coerce|)
              |POLYCAT-;isTimes;SU;4| (103 . |mainVariable|) (108 . =)
              (|Record| (|:| |var| 9) (|:| |exponent| 35))
              (|Union| 44 '"failed") |POLYCAT-;isExpt;SU;5|
              (|SparseUnivariatePolynomial| $) (114 . |univariate|)
              (|SparseUnivariatePolynomial| 6) (120 . |coefficient|)
              |POLYCAT-;coefficient;SVarSetNniS;6| (|List| 35)
              (126 . |coefficient|) |POLYCAT-;coefficient;SLLS;7|
              (133 . |monomial|) |POLYCAT-;monomial;SLLS;8| (140 . |coerce|)
              |POLYCAT-;retract;SVarSet;9| |POLYCAT-;retractIfCan;SU;10|
              (145 . |degree|) (150 . |monomial|)
              |POLYCAT-;primitiveMonomials;SL;12| (156 . |ground?|)
              (161 . |Zero|) (165 . ~=) (171 . |degree|)
              (176 . |leadingCoefficient|) (181 . |totalDegree|)
              (186 . |reductum|) |POLYCAT-;totalDegree;SNni;13| (191 . <)
              (197 . =) (203 . |totalDegreeSorted|)
              |POLYCAT-;totalDegreeSorted;SLNni;14| (|Mapping| 23 9 9)
              (209 . |sort|) |POLYCAT-;totalDegree;SLNni;15|
              (215 . |resultant|) (221 . |resultant|) (228 . |discriminant|)
              (233 . |discriminant|) (239 . |primitiveMonomials|) (|List| 6)
              (244 . |concat|) (249 . |removeDuplicates!|) (|Integer|)
              (|Vector| 7) (254 . |minIndex|) (259 . |coefficient|)
              (|List| 224) (|Matrix| 7) (265 . |matrix|) (|List| 83)
              (|Matrix| 6) (270 . |listOfLists|) (275 . |vertConcat|)
              (|Matrix| $) (281 . |reducedSystem|) (|Vector| 6)
              (286 . |entries|) (291 . |concat|) (297 . |concat|)
              (|Record| (|:| |mat| 91) (|:| |vec| 87)) (|Vector| $)
              (303 . |reducedSystem|) (|GeneralPolynomialGcdPackage| 8 9 7 6)
              (309 . |gcdPolynomial|) (315 . |gcdPolynomial|)
              (|Union| 110 '"failed") (|List| 49)
              (|PolynomialFactorizationByRecursion| 7 8 9 6)
              (321 . |solveLinearPolynomialEquationByRecursion|)
              (|Union| 114 '#2="failed") (|List| 47)
              (327 . |solveLinearPolynomialEquation|) (|Factored| 49)
              (333 . |factorByRecursion|) (|Factored| 47)
              (338 . |factorPolynomial|) (343 . |factorSquareFreeByRecursion|)
              (348 . |factorSquareFreePolynomial|) (|Factored| $)
              (353 . |factor|) (|Factored| 7) (358 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 126) (|:| |fctr| 7) (|:| |xpnt| 86))
              (|List| 127) (363 . |factorList|)
              (|Record| (|:| |flg| 126) (|:| |fctr| 6) (|:| |xpnt| 86))
              (|List| 130) (|Factored| 6) (368 . |makeFR|) (374 . |unit|)
              (379 . |multivariate|)
              (|Record| (|:| |flg| 126) (|:| |fctr| 49) (|:| |xpnt| 86))
              (|List| 136) (385 . |factorList|) (390 . |factor|)
              (395 . |transpose|) (400 . |characteristic|) (404 . |setUnion|)
              (410 . |degree|) (|Union| $ '"failed") (416 . |exquo|)
              (422 . |ground|) (427 . |transpose|) (|Union| 104 '#2#)
              (432 . |conditionP|) (437 . |elt|) (443 . *) (449 . +)
              (455 . |conditionP|) (460 . |charthRoot|) (465 . |charthRoot|)
              (470 . >) (476 . |coefficient|) (483 . -)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (489 . |monicDivide|) |POLYCAT-;monicDivide;2SVarSetR;31|
              (|MultivariateSquareFree| 8 9 7 6) (495 . |squareFree|)
              (500 . |squareFree|) (|PolynomialSquareFree| 9 8 7 6)
              (505 . |squareFree|) (510 . |squareFree|) (515 . |unit|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 86)) (|List| 169)
              (520 . |factors|) (525 . |squareFreePart|) (530 . |content|)
              (535 . |content|) (541 . |zero?|) (546 . |content|)
              (551 . |exquo|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (557 . |unitNormal|) (562 . |primitivePart|) (567 . |content|)
              (573 . |exquo|) (579 . |primitivePart|) (585 . <) (591 . |Zero|)
              (595 . |smaller?|) (601 . |smaller?|) (|PatternMatchResult| 86 6)
              (|Pattern| 86) (|PatternMatchPolynomialCategory| 86 8 9 7 6)
              (607 . |patternMatch|) (|PatternMatchResult| 86 $)
              (614 . |patternMatch|) (|PatternMatchResult| (|Float|) 6)
              (|Pattern| (|Float|))
              (|PatternMatchPolynomialCategory| (|Float|) 8 9 7 6)
              (621 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (628 . |patternMatch|) (635 . |convert|) (640 . |convert|)
              (|Mapping| 189 9) (|Mapping| 189 7)
              (|PolynomialCategoryLifting| 8 9 7 6 189) (645 . |map|)
              (652 . |convert|) (657 . |convert|) (662 . |convert|)
              (|Mapping| 195 9) (|Mapping| 195 7)
              (|PolynomialCategoryLifting| 8 9 7 6 195) (667 . |map|)
              (674 . |convert|) (|InputForm|) (679 . |convert|)
              (684 . |convert|) (|Mapping| 214 9) (|Mapping| 214 7)
              (|PolynomialCategoryLifting| 8 9 7 6 214) (689 . |map|)
              (696 . |convert|)
              (|Record| (|:| |mat| 223) (|:| |vec| (|Vector| 86)))
              (|Matrix| 86) (|List| 7) (|Equation| $) (|Union| 86 '#1#)
              (|Union| 228 '#1#) (|Fraction| 86) (|Union| 7 '#1#))
           '#(|totalDegreeSorted| 701 |totalDegree| 707 |squareFreePart| 718
              |squareFree| 723 |solveLinearPolynomialEquation| 728 |smaller?|
              734 |retractIfCan| 740 |retract| 745 |resultant| 750
              |reducedSystem| 757 |primitivePart| 768 |primitiveMonomials| 779
              |patternMatch| 784 |monomials| 798 |monomial| 803 |monicDivide|
              810 |isTimes| 817 |isPlus| 822 |isExpt| 827 |gcdPolynomial| 832
              |factorSquareFreePolynomial| 838 |factorPolynomial| 843 |factor|
              848 |eval| 853 |discriminant| 859 |convert| 865 |content| 880
              |conditionP| 886 |coefficient| 891 |charthRoot| 905)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 221
                                                 '(1 10 6 0 11 1 6 12 0 13 1 6
                                                   9 0 14 1 10 6 0 15 3 6 0 0
                                                   16 17 18 0 6 0 21 0 7 0 22 2
                                                   6 23 0 0 24 1 6 0 0 25 1 6 0
                                                   0 26 1 6 17 0 28 1 6 16 0 31
                                                   1 6 23 0 32 0 6 0 33 0 7 0
                                                   34 2 6 35 0 9 36 3 6 0 0 9
                                                   35 37 1 6 7 0 38 2 7 23 0 0
                                                   39 1 6 0 7 40 1 6 12 0 42 2
                                                   6 23 0 0 43 2 6 47 0 9 48 2
                                                   49 6 0 35 50 3 6 0 0 16 52
                                                   53 3 6 0 0 16 52 55 1 6 0 9
                                                   57 1 6 8 0 60 2 6 0 7 8 61 1
                                                   6 23 0 63 0 49 0 64 2 49 23
                                                   0 0 65 1 49 35 0 66 1 49 6 0
                                                   67 1 6 35 0 68 1 49 0 0 69 2
                                                   9 23 0 0 71 2 9 23 0 0 72 2
                                                   6 35 0 16 73 2 16 0 75 0 76
                                                   2 49 6 0 0 78 3 0 0 0 0 9 79
                                                   1 49 6 0 80 2 0 0 0 9 81 1 6
                                                   17 0 82 1 83 0 17 84 1 83 0
                                                   0 85 1 87 86 0 88 2 6 7 0 8
                                                   89 1 91 0 90 92 1 94 93 0 95
                                                   2 91 0 0 0 96 1 0 91 97 98 1
                                                   99 83 0 100 2 83 0 0 0 101 2
                                                   87 0 0 0 102 2 0 103 97 104
                                                   105 2 106 49 49 49 107 2 0
                                                   47 47 47 108 2 111 109 110
                                                   49 112 2 0 113 114 47 115 1
                                                   111 116 49 117 1 0 118 47
                                                   119 1 111 116 49 120 1 0 118
                                                   47 121 1 7 122 0 123 1 124 7
                                                   0 125 1 124 128 0 129 2 132
                                                   0 6 131 133 1 116 49 0 134 2
                                                   6 0 47 9 135 1 116 137 0 138
                                                   1 0 122 0 139 1 94 0 0 140 0
                                                   6 35 141 2 83 0 0 0 142 2 6
                                                   52 0 16 143 2 86 144 0 0 145
                                                   1 6 7 0 146 1 91 0 0 147 1 7
                                                   148 97 149 2 87 7 0 86 150 2
                                                   6 0 0 0 151 2 6 0 0 0 152 1
                                                   0 148 97 153 1 7 144 0 154 1
                                                   0 144 0 155 2 35 23 0 0 156
                                                   3 6 0 0 9 35 157 2 6 0 0 0
                                                   158 2 49 159 0 0 160 1 162
                                                   132 6 163 1 0 122 0 164 1
                                                   165 132 6 166 1 6 122 0 167
                                                   1 132 6 0 168 1 132 170 0
                                                   171 1 0 0 0 172 1 49 6 0 173
                                                   2 0 0 0 9 174 1 6 23 0 175 1
                                                   6 7 0 176 2 6 144 0 7 177 1
                                                   6 178 0 179 1 0 0 0 180 2 6
                                                   0 0 9 181 2 6 144 0 0 182 2
                                                   0 0 0 9 183 2 8 23 0 0 184 0
                                                   8 0 185 2 7 23 0 0 186 2 0
                                                   23 0 0 187 3 190 188 6 189
                                                   188 191 3 0 192 0 189 192
                                                   193 3 196 194 6 195 194 197
                                                   3 0 198 0 195 198 199 1 9
                                                   189 0 200 1 7 189 0 201 3
                                                   204 189 202 203 6 205 1 0
                                                   189 0 206 1 9 195 0 207 1 7
                                                   195 0 208 3 211 195 209 210
                                                   6 212 1 0 195 0 213 1 9 214
                                                   0 215 1 7 214 0 216 3 219
                                                   214 217 218 6 220 1 0 214 0
                                                   221 2 0 35 0 16 74 2 0 35 0
                                                   16 77 1 0 35 0 70 1 0 0 0
                                                   172 1 0 122 0 164 2 0 113
                                                   114 47 115 2 0 23 0 0 187 1
                                                   0 12 0 59 1 0 9 0 58 3 0 0 0
                                                   0 9 79 1 0 91 97 98 2 0 103
                                                   97 104 105 2 0 0 0 9 183 1 0
                                                   0 0 180 1 0 17 0 62 3 0 192
                                                   0 189 192 193 3 0 198 0 195
                                                   198 199 1 0 17 0 27 3 0 0 0
                                                   16 52 56 3 0 159 0 0 9 161 1
                                                   0 29 0 41 1 0 29 0 30 1 0 45
                                                   0 46 2 0 47 47 47 108 1 0
                                                   118 47 121 1 0 118 47 119 1
                                                   0 122 0 139 2 0 0 0 19 20 2
                                                   0 0 0 9 81 1 0 189 0 206 1 0
                                                   214 0 221 1 0 195 0 213 2 0
                                                   0 0 9 174 1 0 148 97 153 3 0
                                                   0 0 16 52 54 3 0 0 0 9 35 51
                                                   1 0 144 0 155)))))
           '|lookupComplete|)) 
