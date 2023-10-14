
(/VERSIONCHECK 2) 

(DEFUN |POLYCAT-;eval;SLS;1| (|p| |l| $)
  (PROG (#1=#:G146 |e| #2=#:G145 |lvar| #3=#:G144 #4=#:G143 #5=#:G136
         #6=#:G142)
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

(DEFUN |POLYCAT-;isPlus;SU;2| (|p| $)
  (PROG (|l|)
    (RETURN
     (COND
      ((NULL
        (CDR (LETT |l| (SPADCALL |p| (QREFELT $ 21)) |POLYCAT-;isPlus;SU;2|)))
       (CONS 1 "failed"))
      ('T (CONS 0 |l|)))))) 

(DEFUN |POLYCAT-;isTimes;SU;3| (|p| $)
  (PROG (|r| |l| #1=#:G165 |v| #2=#:G164 |lv|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (NULL
          (LETT |lv| (SPADCALL |p| (QREFELT $ 24))
                . #3=(|POLYCAT-;isTimes;SU;3|)))
         (NULL (SPADCALL |p| (QREFELT $ 26))))
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
                              (SPADCALL (|spadConstant| $ 27) |v|
                                        (SPADCALL |p| |v| (QREFELT $ 30))
                                        (QREFELT $ 31))
                              #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               . #3#)
         (LETT |r| (SPADCALL |p| (QREFELT $ 32)) . #3#)
         (EXIT
          (COND
           ((SPADCALL |r| (|spadConstant| $ 28) (QREFELT $ 33))
            (COND ((NULL (CDR |lv|)) (CONS 1 "failed")) (#4='T (CONS 0 |l|))))
           (#4# (CONS 0 (CONS (SPADCALL |r| (QREFELT $ 34)) |l|)))))))))))) 

(DEFUN |POLYCAT-;isExpt;SU;4| (|p| $)
  (PROG (|d| |u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |p| (QREFELT $ 36)) . #1=(|POLYCAT-;isExpt;SU;4|))
      (EXIT
       (COND
        ((OR (QEQCAR |u| 1)
             (NULL
              (SPADCALL |p|
                        (SPADCALL (|spadConstant| $ 27) (QCDR |u|)
                                  (LETT |d|
                                        (SPADCALL |p| (QCDR |u|)
                                                  (QREFELT $ 30))
                                        . #1#)
                                  (QREFELT $ 31))
                        (QREFELT $ 37))))
         (CONS 1 "failed"))
        ('T (CONS 0 (CONS (QCDR |u|) |d|))))))))) 

(DEFUN |POLYCAT-;coefficient;SVarSetNniS;5| (|p| |v| |n| $)
  (SPADCALL (SPADCALL |p| |v| (QREFELT $ 42)) |n| (QREFELT $ 44))) 

(DEFUN |POLYCAT-;coefficient;SLLS;6| (|p| |lv| |ln| $)
  (COND
   ((NULL |lv|)
    (COND ((NULL |ln|) |p|)
          (#1='T (|error| "mismatched lists in coefficient"))))
   ((NULL |ln|) (|error| "mismatched lists in coefficient"))
   (#1#
    (SPADCALL
     (SPADCALL (SPADCALL |p| (|SPADfirst| |lv|) (QREFELT $ 42))
               (|SPADfirst| |ln|) (QREFELT $ 44))
     (CDR |lv|) (CDR |ln|) (QREFELT $ 47))))) 

(DEFUN |POLYCAT-;retract;SVarSet;7| (|p| $)
  (PROG (|q| #1=#:G186)
    (RETURN
     (SEQ
      (LETT |q|
            (PROG2
                (LETT #1# (SPADCALL |p| (QREFELT $ 36))
                      . #2=(|POLYCAT-;retract;SVarSet;7|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
            . #2#)
      (EXIT
       (COND ((SPADCALL (SPADCALL |q| (QREFELT $ 49)) |p| (QREFELT $ 37)) |q|)
             ('T (|error| "Polynomial is not a single variable")))))))) 

(DEFUN |POLYCAT-;retractIfCan;SU;8| (|p| $)
  (PROG (#1=#:G194 |q|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |q| (SPADCALL |p| (QREFELT $ 36))
               . #2=(|POLYCAT-;retractIfCan;SU;8|))
         (EXIT
          (COND
           ((QEQCAR |q| 0)
            (COND
             ((SPADCALL (SPADCALL (QCDR |q|) (QREFELT $ 49)) |p|
                        (QREFELT $ 37))
              (PROGN (LETT #1# |q| . #2#) (GO #1#))))))))
        (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(DEFUN |POLYCAT-;totalDegree;SNni;9| (|p| $)
  (PROG (|u| |d| #1=#:G197)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 52)) 0)
            ('T
             (SEQ
              (LETT |u|
                    (SPADCALL |p|
                              (PROG2
                                  (LETT #1# (SPADCALL |p| (QREFELT $ 36))
                                        . #2=(|POLYCAT-;totalDegree;SNni;9|))
                                  (QCDR #1#)
                                (|check_union| (QEQCAR #1# 0) (QREFELT $ 9)
                                               #1#))
                              (QREFELT $ 42))
                    . #2#)
              (LETT |d| 0 . #2#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |u| (|spadConstant| $ 55) (QREFELT $ 56)))
                     (GO G191)))
                   (SEQ
                    (LETT |d|
                          (MAX |d|
                               (+ (SPADCALL |u| (QREFELT $ 57))
                                  (SPADCALL (SPADCALL |u| (QREFELT $ 58))
                                            (QREFELT $ 59))))
                          . #2#)
                    (EXIT (LETT |u| (SPADCALL |u| (QREFELT $ 60)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |d|)))))))) 

(DEFUN |POLYCAT-;totalDegreeSorted;SLNni;10| (|p| |lv| $)
  (PROG (|u| |d| |w| |v0| |v| #1=#:G205)
    (RETURN
     (SEQ
      (COND ((OR (SPADCALL |p| (QREFELT $ 52)) (NULL |lv|)) 0)
            ('T
             (SEQ
              (LETT |u|
                    (SPADCALL |p|
                              (LETT |v|
                                    (PROG2
                                        (LETT #1# (SPADCALL |p| (QREFELT $ 36))
                                              . #2=(|POLYCAT-;totalDegreeSorted;SLNni;10|))
                                        (QCDR #1#)
                                      (|check_union| (QEQCAR #1# 0)
                                                     (QREFELT $ 9) #1#))
                                    . #2#)
                              (QREFELT $ 42))
                    . #2#)
              (LETT |d| 0 . #2#) (LETT |w| 0 . #2#)
              (LETT |v0| (|SPADfirst| |lv|) . #2#) (LETT |lv| (CDR |lv|) . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((NULL |lv|) 'NIL)
                            ('T (SPADCALL |v| |v0| (QREFELT $ 62)))))
                     (GO G191)))
                   (SEQ (LETT |v0| (|SPADfirst| |lv|) . #2#)
                        (EXIT (LETT |lv| (CDR |lv|) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND ((SPADCALL |v0| |v| (QREFELT $ 63)) (LETT |w| 1 . #2#)))
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |u| (|spadConstant| $ 55) (QREFELT $ 56)))
                     (GO G191)))
                   (SEQ
                    (LETT |d|
                          (MAX |d|
                               (+ (* |w| (SPADCALL |u| (QREFELT $ 57)))
                                  (SPADCALL (SPADCALL |u| (QREFELT $ 58)) |lv|
                                            (QREFELT $ 64))))
                          . #2#)
                    (EXIT (LETT |u| (SPADCALL |u| (QREFELT $ 60)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |d|)))))))) 

(DEFUN |POLYCAT-;totalDegree;SLNni;11| (|p| |lv| $)
  (PROG (|lv1|)
    (RETURN
     (SEQ
      (LETT |lv1|
            (SPADCALL (CONS #'|POLYCAT-;totalDegree;SLNni;11!0| $) |lv|
                      (QREFELT $ 67))
            |POLYCAT-;totalDegree;SLNni;11|)
      (EXIT (SPADCALL |p| |lv1| (QREFELT $ 64))))))) 

(DEFUN |POLYCAT-;totalDegree;SLNni;11!0| (|v1| |v2| $)
  (SPADCALL |v2| |v1| (QREFELT $ 62))) 

(DEFUN |POLYCAT-;resultant;2SVarSetS;12| (|p1| |p2| |mvar| $)
  (SPADCALL (SPADCALL |p1| |mvar| (QREFELT $ 42))
            (SPADCALL |p2| |mvar| (QREFELT $ 42)) (QREFELT $ 69))) 

(DEFUN |POLYCAT-;discriminant;SVarSetS;13| (|p| |var| $)
  (SPADCALL (SPADCALL |p| |var| (QREFELT $ 42)) (QREFELT $ 71))) 

(DEFUN |POLYCAT-;allMonoms| (|l| $)
  (PROG (#1=#:G226 |p| #2=#:G225)
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
                (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 73)) #2#) . #3#)))
              (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
        (QREFELT $ 75))
       (QREFELT $ 76)))))) 

(DEFUN |POLYCAT-;P2R| (|p| |b| |n| $)
  (PROG (#1=#:G230 |i| #2=#:G231 |bj| |w|)
    (RETURN
     (SEQ (LETT |w| (MAKEARR1 |n| (|spadConstant| $ 54)) . #3=(|POLYCAT-;P2R|))
          (SEQ (LETT |bj| NIL . #3#) (LETT #2# |b| . #3#)
               (LETT |i| (SPADCALL |w| (QREFELT $ 79)) . #3#)
               (LETT #1# (QVSIZE |w|) . #3#) G190
               (COND
                ((OR (> |i| #1#) (ATOM #2#)
                     (PROGN (LETT |bj| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1O |w| |i| (SPADCALL |p| |bj| (QREFELT $ 80)) 1)))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #2# (CDR #2#) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |w|))))) 

(DEFUN |POLYCAT-;eq2R| (|l| |b| $)
  (PROG (#1=#:G238 |p| #2=#:G237 #3=#:G236 |bj| #4=#:G235)
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
                                    (CONS (SPADCALL |p| |bj| (QREFELT $ 80))
                                          #2#)
                                    . #5#)))
                            (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      #4#)
                     . #5#)))
             (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT (NREVERSE #4#))))
       (QREFELT $ 83)))))) 

(DEFUN |POLYCAT-;reducedSystem;MM;17| (|m| $)
  (PROG (|l| |mm| |d| #1=#:G252 |bj| #2=#:G251 |b| #3=#:G250 |r| #4=#:G249)
    (RETURN
     (SEQ
      (LETT |l| (SPADCALL |m| (QREFELT $ 86))
            . #5=(|POLYCAT-;reducedSystem;MM;17|))
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
              (QREFELT $ 75))
             (QREFELT $ 76))
            . #5#)
      (EXIT
       (COND ((NULL |b|) (MAKE_MATRIX1 0 (ANCOLS |m|) (|spadConstant| $ 54)))
             ('T
              (SEQ
               (LETT |d|
                     (PROGN
                      (LETT #2# NIL . #5#)
                      (SEQ (LETT |bj| NIL . #5#) (LETT #1# |b| . #5#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |bj| (CAR #1#) . #5#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |bj| (QREFELT $ 87)) #2#)
                                   . #5#)))
                           (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     . #5#)
               (LETT |mm| (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| $) . #5#)
               (LETT |l| (CDR |l|) . #5#)
               (SEQ G190
                    (COND ((NULL (COND ((NULL |l|) 'NIL) ('T 'T))) (GO G191)))
                    (SEQ
                     (LETT |mm|
                           (SPADCALL |mm|
                                     (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| $)
                                     (QREFELT $ 88))
                           . #5#)
                     (EXIT (LETT |l| (CDR |l|) . #5#)))
                    NIL (GO G190) G191 (EXIT NIL))
               (EXIT |mm|))))))))) 

(DEFUN |POLYCAT-;reducedSystem;MVR;18| (|m| |v| $)
  (PROG (|r| |l| |w| |mm| |n| |d| #1=#:G268 |bj| #2=#:G267 |b| #3=#:G266 |s|
         #4=#:G265)
    (RETURN
     (SEQ
      (LETT |l| (SPADCALL |m| (QREFELT $ 86))
            . #5=(|POLYCAT-;reducedSystem;MVR;18|))
      (LETT |r| (SPADCALL |v| (QREFELT $ 92)) . #5#)
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
                        (QREFELT $ 75))
                       (QREFELT $ 93))
             (QREFELT $ 76))
            . #5#)
      (EXIT
       (COND
        ((NULL |b|)
         (CONS (MAKE_MATRIX1 0 (ANCOLS |m|) (|spadConstant| $ 54))
               (MAKEARR1 0 (|spadConstant| $ 54))))
        ('T
         (SEQ
          (LETT |d|
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |bj| NIL . #5#) (LETT #1# |b| . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |bj| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |bj| (QREFELT $ 87)) #2#)
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
                                (QREFELT $ 88))
                      . #5#)
                (LETT |w|
                      (SPADCALL |w|
                                (|POLYCAT-;P2R| (|SPADfirst| |r|) |d| |n| $)
                                (QREFELT $ 94))
                      . #5#)
                (LETT |l| (CDR |l|) . #5#) (EXIT (LETT |r| (CDR |r|) . #5#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |mm| |w|)))))))))) 

(DEFUN |POLYCAT-;gcdPolynomial;3Sup;19| (|pp| |qq| $)
  (SPADCALL |pp| |qq| (QREFELT $ 99))) 

(DEFUN |POLYCAT-;solveLinearPolynomialEquation;LSupU;20| (|lpp| |pp| $)
  (SPADCALL |lpp| |pp| (QREFELT $ 104))) 

(DEFUN |POLYCAT-;factorPolynomial;SupF;21| (|pp| $)
  (SPADCALL |pp| (QREFELT $ 109))) 

(DEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;22| (|pp| $)
  (SPADCALL |pp| (QREFELT $ 112))) 

(DEFUN |POLYCAT-;factor;SF;23| (|p| $)
  (PROG (#1=#:G301 |ww| #2=#:G300 |ansSUP| |up| #3=#:G299 |w| #4=#:G298 |ansR|
         |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL |p| (QREFELT $ 36)) . #5=(|POLYCAT-;factor;SF;23|))
      (EXIT
       (COND
        ((QEQCAR |v| 1)
         (SEQ
          (LETT |ansR| (SPADCALL (SPADCALL |p| (QREFELT $ 32)) (QREFELT $ 115))
                . #5#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |ansR| (QREFELT $ 117)) (QREFELT $ 34))
            (PROGN
             (LETT #4# NIL . #5#)
             (SEQ (LETT |w| NIL . #5#)
                  (LETT #3# (SPADCALL |ansR| (QREFELT $ 121)) . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |w| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (VECTOR (QVELT |w| 0)
                                   (SPADCALL (QVELT |w| 1) (QREFELT $ 34))
                                   (QVELT |w| 2))
                           #4#)
                          . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            (QREFELT $ 125)))))
        ('T
         (SEQ (LETT |up| (SPADCALL |p| (QCDR |v|) (QREFELT $ 42)) . #5#)
              (LETT |ansSUP| (SPADCALL |up| (QREFELT $ 109)) . #5#)
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |ansSUP| (QREFELT $ 126)) (QCDR |v|)
                          (QREFELT $ 127))
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |ww| NIL . #5#)
                      (LETT #1# (SPADCALL |ansSUP| (QREFELT $ 130)) . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ww| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (VECTOR (QVELT |ww| 0)
                                       (SPADCALL (QVELT |ww| 1) (QCDR |v|)
                                                 (QREFELT $ 127))
                                       (QVELT |ww| 2))
                               #2#)
                              . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 125))))))))))) 

(DEFUN |POLYCAT-;conditionP;MU;24| (|mat| $)
  (PROG (#1=#:G324 #2=#:G323 #3=#:G325 |i| #4=#:G343 |m| #5=#:G340 #6=#:G342
         |mons| #7=#:G341 |ans| |monslist| |llR| #8=#:G338 |u| #9=#:G339 |v|
         #10=#:G337 |redmons| |deg1| #11=#:G312 #12=#:G329 |nd| #13=#:G336 |d|
         #14=#:G335 |degs| |vars| #15=#:G334 #16=#:G307 #17=#:G306 #18=#:G308
         #19=#:G333 #20=#:G332 |l| |ch| #21=#:G331 |z| #22=#:G330 |ll|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ll| (SPADCALL (SPADCALL |mat| (QREFELT $ 132)) (QREFELT $ 86))
              . #23=(|POLYCAT-;conditionP;MU;24|))
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
        (LETT |ch| (SPADCALL (QREFELT $ 133)) . #23#)
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
                             (LETT #18# (SPADCALL |u| (QREFELT $ 73)) . #23#)
                             (COND
                              (#16#
                               (LETT #17# (SPADCALL #17# #18# (QREFELT $ 134))
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
                   (SEQ (LETT |vars| (SPADCALL |m| (QREFELT $ 24)) . #23#)
                        (LETT |degs| (SPADCALL |m| |vars| (QREFELT $ 135))
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
                                                              (QREFELT $ 137))
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
                               (SPADCALL (|spadConstant| $ 27) |vars| |deg1|
                                         (QREFELT $ 138))
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
                                                          (QREFELT $ 47))
                                                (QREFELT $ 139))
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
               (SPADCALL (SPADCALL |llR| (QREFELT $ 83)) (QREFELT $ 140))
               (QREFELT $ 142))
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
                                                                        $ 143))
                                                                      (QREFELT
                                                                       $ 34))
                                                                     (QREFELT $
                                                                              144))
                                                           . #23#)
                                                     (COND
                                                      (#1#
                                                       (LETT #2#
                                                             (SPADCALL #2# #3#
                                                                       (QREFELT
                                                                        $ 145))
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
                                                    (|spadConstant| $ 53)))))))
                                  (LETT #5#
                                        (PROG1 (|inc_SI| #5#)
                                          (LETT #6# (CDR #6#) . #23#))
                                        . #23#)
                                  (GO G190) G191 (EXIT NIL))
                             #7#)))))))))
      #12# (EXIT #12#))))) 

(DEFUN |POLYCAT-;charthRoot;SU;25| (|p| $)
  (PROG (|ch| |ans| |vars|)
    (RETURN
     (SEQ
      (LETT |vars| (SPADCALL |p| (QREFELT $ 24))
            . #1=(|POLYCAT-;charthRoot;SU;25|))
      (EXIT
       (COND
        ((NULL |vars|)
         (SEQ
          (LETT |ans| (SPADCALL (SPADCALL |p| (QREFELT $ 139)) (QREFELT $ 147))
                . #1#)
          (EXIT
           (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                 (#2='T (CONS 0 (SPADCALL (QCDR |ans|) (QREFELT $ 34))))))))
        (#2#
         (SEQ (LETT |ch| (SPADCALL (QREFELT $ 133)) . #1#)
              (EXIT (|POLYCAT-;charthRootlv| |p| |vars| |ch| $)))))))))) 

(DEFUN |POLYCAT-;charthRootlv| (|p| |vars| |ch| $)
  (PROG (#1=#:G372 |ansx| |ans| #2=#:G365 |d| |cp| |dd| |v|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL |vars|)
         (SEQ
          (LETT |ans| (SPADCALL (SPADCALL |p| (QREFELT $ 139)) (QREFELT $ 147))
                . #3=(|POLYCAT-;charthRootlv|))
          (EXIT
           (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                 (#4='T (CONS 0 (SPADCALL (QCDR |ans|) (QREFELT $ 34))))))))
        (#4#
         (SEQ (LETT |v| (|SPADfirst| |vars|) . #3#)
              (LETT |vars| (CDR |vars|) . #3#)
              (LETT |d| (SPADCALL |p| |v| (QREFELT $ 30)) . #3#)
              (LETT |ans| (|spadConstant| $ 53) . #3#)
              (SEQ G190
                   (COND ((NULL (SPADCALL |d| 0 (QREFELT $ 149))) (GO G191)))
                   (SEQ (LETT |dd| (SPADCALL |d| |ch| (QREFELT $ 137)) . #3#)
                        (EXIT
                         (COND
                          ((QEQCAR |dd| 1)
                           (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                          ('T
                           (SEQ
                            (LETT |cp| (SPADCALL |p| |v| |d| (QREFELT $ 150))
                                  . #3#)
                            (LETT |p|
                                  (SPADCALL |p|
                                            (SPADCALL |cp| |v| |d|
                                                      (QREFELT $ 31))
                                            (QREFELT $ 151))
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
                                (LETT |d| (SPADCALL |p| |v| (QREFELT $ 30))
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
                                                           (QREFELT $ 31))
                                                 (QREFELT $ 145))
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
                        (CONS 0 (SPADCALL |ans| (QCDR |ansx|) (QREFELT $ 145)))
                        . #3#)
                  (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |POLYCAT-;monicDivide;2SVarSetR;27| (|p1| |p2| |mvar| $)
  (PROG (|result|)
    (RETURN
     (SEQ
      (LETT |result|
            (SPADCALL (SPADCALL |p1| |mvar| (QREFELT $ 42))
                      (SPADCALL |p2| |mvar| (QREFELT $ 42)) (QREFELT $ 153))
            |POLYCAT-;monicDivide;2SVarSetR;27|)
      (EXIT
       (CONS (SPADCALL (QCAR |result|) |mvar| (QREFELT $ 127))
             (SPADCALL (QCDR |result|) |mvar| (QREFELT $ 127)))))))) 

(DEFUN |POLYCAT-;squareFree;SF;28| (|p| $) (SPADCALL |p| (QREFELT $ 156))) 

(DEFUN |POLYCAT-;squareFree;SF;29| (|p| $) (SPADCALL |p| (QREFELT $ 159))) 

(DEFUN |POLYCAT-;squareFree;SF;30| (|p| $) (SPADCALL |p| (QREFELT $ 159))) 

(DEFUN |POLYCAT-;squareFreePart;2S;31| (|p| $)
  (PROG (#1=#:G382 #2=#:G381 #3=#:G383 #4=#:G385 |f| |s|)
    (RETURN
     (SEQ
      (SPADCALL
       (SPADCALL
        (LETT |s| (SPADCALL |p| (QREFELT $ 160))
              . #5=(|POLYCAT-;squareFreePart;2S;31|))
        (QREFELT $ 161))
       (PROGN
        (LETT #1# NIL . #5#)
        (SEQ (LETT |f| NIL . #5#)
             (LETT #4# (SPADCALL |s| (QREFELT $ 164)) . #5#) G190
             (COND
              ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (PROGN
                (LETT #3# (QCAR |f|) . #5#)
                (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 144)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
             (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
        (COND (#1# #2#) ('T (|spadConstant| $ 27))))
       (QREFELT $ 144)))))) 

(DEFUN |POLYCAT-;content;SVarSetS;32| (|p| |v| $)
  (SPADCALL (SPADCALL |p| |v| (QREFELT $ 42)) (QREFELT $ 166))) 

(DEFUN |POLYCAT-;primitivePart;2S;33| (|p| $)
  (PROG (#1=#:G388)
    (RETURN
     (COND ((SPADCALL |p| (QREFELT $ 168)) |p|)
           ('T
            (QVELT
             (SPADCALL
              (PROG2
                  (LETT #1#
                        (SPADCALL |p| (SPADCALL |p| (QREFELT $ 169))
                                  (QREFELT $ 170))
                        |POLYCAT-;primitivePart;2S;33|)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
              (QREFELT $ 172))
             1)))))) 

(DEFUN |POLYCAT-;primitivePart;SVarSetS;34| (|p| |v| $)
  (PROG (#1=#:G394)
    (RETURN
     (COND ((SPADCALL |p| (QREFELT $ 168)) |p|)
           ('T
            (QVELT
             (SPADCALL
              (PROG2
                  (LETT #1#
                        (SPADCALL |p| (SPADCALL |p| |v| (QREFELT $ 174))
                                  (QREFELT $ 175))
                        |POLYCAT-;primitivePart;SVarSetS;34|)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
              (QREFELT $ 172))
             1)))))) 

(DEFUN |POLYCAT-;smaller?;2SB;35| (|p| |q| $)
  (PROG (|dq| |dp|)
    (RETURN
     (SEQ
      (LETT |dp| (SPADCALL |p| (QREFELT $ 87))
            . #1=(|POLYCAT-;smaller?;2SB;35|))
      (LETT |dq| (SPADCALL |q| (QREFELT $ 87)) . #1#)
      (EXIT
       (COND
        ((SPADCALL |dp| |dq| (QREFELT $ 177))
         (SPADCALL (|spadConstant| $ 54) (SPADCALL |q| (QREFELT $ 32))
                   (QREFELT $ 180)))
        ((SPADCALL |dq| |dp| (QREFELT $ 177))
         (SPADCALL (SPADCALL |p| (QREFELT $ 32)) (|spadConstant| $ 54)
                   (QREFELT $ 180)))
        ('T
         (SPADCALL (SPADCALL (SPADCALL |p| |q| (QREFELT $ 151)) (QREFELT $ 32))
                   (|spadConstant| $ 54) (QREFELT $ 180))))))))) 

(DEFUN |POLYCAT-;patternMatch;SP2Pmr;36| (|p| |pat| |l| $)
  (SPADCALL |p| |pat| |l| (QREFELT $ 185))) 

(DEFUN |POLYCAT-;patternMatch;SP2Pmr;37| (|p| |pat| |l| $)
  (SPADCALL |p| |pat| |l| (QREFELT $ 191))) 

(DEFUN |POLYCAT-;convert;SP;38| (|x| $)
  (SPADCALL (ELT $ 194) (ELT $ 195) |x| (QREFELT $ 199))) 

(DEFUN |POLYCAT-;convert;SP;39| (|x| $)
  (SPADCALL (ELT $ 201) (ELT $ 202) |x| (QREFELT $ 206))) 

(DEFUN |POLYCAT-;convert;SIf;40| (|p| $)
  (SPADCALL (ELT $ 209) (ELT $ 210) |p| (QREFELT $ 214))) 

(DECLAIM (NOTINLINE |PolynomialCategory&;|)) 

(DEFUN |PolynomialCategory&| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|PolynomialCategory&| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 224) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
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
                                                           (|InputForm|)))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|CommutativeRing|))
        (COND
         ((|testBitVector| |pv$| 3)
          (PROGN
           (QSETREFV $ 70
                     (CONS
                      (|dispatchFunction| |POLYCAT-;resultant;2SVarSetS;12|)
                      $))
           (QSETREFV $ 72
                     (CONS
                      (|dispatchFunction| |POLYCAT-;discriminant;SVarSetS;13|)
                      $)))))))
      (COND
       ((|HasCategory| |#2| '(|IntegralDomain|))
        (PROGN
         (QSETREFV $ 90
                   (CONS (|dispatchFunction| |POLYCAT-;reducedSystem;MM;17|)
                         $))
         (QSETREFV $ 97
                   (CONS (|dispatchFunction| |POLYCAT-;reducedSystem;MVR;18|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 100
                   (CONS (|dispatchFunction| |POLYCAT-;gcdPolynomial;3Sup;19|)
                         $))
         (QSETREFV $ 107
                   (CONS
                    (|dispatchFunction|
                     |POLYCAT-;solveLinearPolynomialEquation;LSupU;20|)
                    $))
         (QSETREFV $ 111
                   (CONS
                    (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;21|)
                    $))
         (QSETREFV $ 113
                   (CONS
                    (|dispatchFunction|
                     |POLYCAT-;factorSquareFreePolynomial;SupF;22|)
                    $))
         (QSETREFV $ 131 (CONS (|dispatchFunction| |POLYCAT-;factor;SF;23|) $))
         (COND
          ((|HasCategory| |#2| '(|CharacteristicNonZero|))
           (PROGN
            (QSETREFV $ 146
                      (CONS (|dispatchFunction| |POLYCAT-;conditionP;MU;24|)
                            $))))))))
      (COND
       ((|HasCategory| |#2| '(|CharacteristicNonZero|))
        (PROGN
         (QSETREFV $ 148
                   (CONS (|dispatchFunction| |POLYCAT-;charthRoot;SU;25|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (COND
          ((|HasCategory| |#2| '(|EuclideanDomain|))
           (COND
            ((|HasCategory| |#2| '(|CharacteristicZero|))
             (QSETREFV $ 157
                       (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;28|)
                             $)))
            ('T
             (QSETREFV $ 157
                       (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;29|)
                             $)))))
          ('T
           (QSETREFV $ 157
                     (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;30|)
                           $))))
         (QSETREFV $ 165
                   (CONS (|dispatchFunction| |POLYCAT-;squareFreePart;2S;31|)
                         $))
         (QSETREFV $ 167
                   (CONS (|dispatchFunction| |POLYCAT-;content;SVarSetS;32|)
                         $))
         (QSETREFV $ 173
                   (CONS (|dispatchFunction| |POLYCAT-;primitivePart;2S;33|)
                         $))
         (QSETREFV $ 176
                   (CONS
                    (|dispatchFunction| |POLYCAT-;primitivePart;SVarSetS;34|)
                    $)))))
      (COND
       ((|HasCategory| |#2| '(|Comparable|))
        (PROGN
         (QSETREFV $ 181
                   (CONS (|dispatchFunction| |POLYCAT-;smaller?;2SB;35|) $))
         (COND
          ((|testBitVector| |pv$| 7)
           (COND
            ((|testBitVector| |pv$| 6)
             (QSETREFV $ 187
                       (CONS
                        (|dispatchFunction| |POLYCAT-;patternMatch;SP2Pmr;36|)
                        $))))))
         (COND
          ((|testBitVector| |pv$| 5)
           (COND
            ((|testBitVector| |pv$| 4)
             (QSETREFV $ 193
                       (CONS
                        (|dispatchFunction| |POLYCAT-;patternMatch;SP2Pmr;37|)
                        $)))))))))
      (COND
       ((|testBitVector| |pv$| 11)
        (COND
         ((|testBitVector| |pv$| 10)
          (QSETREFV $ 200
                    (CONS (|dispatchFunction| |POLYCAT-;convert;SP;38|) $))))))
      (COND
       ((|testBitVector| |pv$| 9)
        (COND
         ((|testBitVector| |pv$| 8)
          (QSETREFV $ 207
                    (CONS (|dispatchFunction| |POLYCAT-;convert;SP;39|) $))))))
      (COND
       ((|testBitVector| |pv$| 13)
        (COND
         ((|testBitVector| |pv$| 12)
          (QSETREFV $ 215
                    (CONS (|dispatchFunction| |POLYCAT-;convert;SIf;40|)
                          $))))))
      $)))) 

(MAKEPROP '|PolynomialCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Equation| 6) (0 . |lhs|)
              (|Union| 9 '#1="failed") (5 . |retractIfCan|) (10 . |retract|)
              (15 . |rhs|) (|List| 9) (|List| $) (20 . |eval|) (|List| 217)
              |POLYCAT-;eval;SLS;1| (27 . |monomials|) (|Union| 17 '"failed")
              |POLYCAT-;isPlus;SU;2| (32 . |variables|) (|Boolean|)
              (37 . |monomial?|) (42 . |One|) (46 . |One|)
              (|NonNegativeInteger|) (50 . |degree|) (56 . |monomial|)
              (63 . |leadingCoefficient|) (68 . =) (74 . |coerce|)
              |POLYCAT-;isTimes;SU;3| (79 . |mainVariable|) (84 . =)
              (|Record| (|:| |var| 9) (|:| |exponent| 29))
              (|Union| 38 '"failed") |POLYCAT-;isExpt;SU;4|
              (|SparseUnivariatePolynomial| $) (90 . |univariate|)
              (|SparseUnivariatePolynomial| 6) (96 . |coefficient|)
              |POLYCAT-;coefficient;SVarSetNniS;5| (|List| 29)
              (102 . |coefficient|) |POLYCAT-;coefficient;SLLS;6|
              (109 . |coerce|) |POLYCAT-;retract;SVarSet;7|
              |POLYCAT-;retractIfCan;SU;8| (114 . |ground?|) (119 . |Zero|)
              (123 . |Zero|) (127 . |Zero|) (131 . ~=) (137 . |degree|)
              (142 . |leadingCoefficient|) (147 . |totalDegree|)
              (152 . |reductum|) |POLYCAT-;totalDegree;SNni;9| (157 . <)
              (163 . =) (169 . |totalDegreeSorted|)
              |POLYCAT-;totalDegreeSorted;SLNni;10| (|Mapping| 25 9 9)
              (175 . |sort|) |POLYCAT-;totalDegree;SLNni;11|
              (181 . |resultant|) (187 . |resultant|) (194 . |discriminant|)
              (199 . |discriminant|) (205 . |primitiveMonomials|) (|List| 6)
              (210 . |concat|) (215 . |removeDuplicates!|) (|Integer|)
              (|Vector| 7) (220 . |minIndex|) (225 . |coefficient|)
              (|List| 216) (|Matrix| 7) (231 . |matrix|) (|List| 74)
              (|Matrix| 6) (236 . |listOfLists|) (241 . |degree|)
              (246 . |vertConcat|) (|Matrix| $) (252 . |reducedSystem|)
              (|Vector| 6) (257 . |entries|) (262 . |concat|) (268 . |concat|)
              (|Record| (|:| |mat| 82) (|:| |vec| 78)) (|Vector| $)
              (274 . |reducedSystem|) (|GeneralPolynomialGcdPackage| 8 9 7 6)
              (280 . |gcdPolynomial|) (286 . |gcdPolynomial|)
              (|Union| 102 '"failed") (|List| 43)
              (|PolynomialFactorizationByRecursion| 7 8 9 6)
              (292 . |solveLinearPolynomialEquationByRecursion|)
              (|Union| 106 '#2="failed") (|List| 41)
              (298 . |solveLinearPolynomialEquation|) (|Factored| 43)
              (304 . |factorByRecursion|) (|Factored| 41)
              (309 . |factorPolynomial|) (314 . |factorSquareFreeByRecursion|)
              (319 . |factorSquareFreePolynomial|) (|Factored| $)
              (324 . |factor|) (|Factored| 7) (329 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 118) (|:| |fctr| 7) (|:| |xpnt| 77))
              (|List| 119) (334 . |factorList|)
              (|Record| (|:| |flg| 118) (|:| |fctr| 6) (|:| |xpnt| 77))
              (|List| 122) (|Factored| 6) (339 . |makeFR|) (345 . |unit|)
              (350 . |multivariate|)
              (|Record| (|:| |flg| 118) (|:| |fctr| 43) (|:| |xpnt| 77))
              (|List| 128) (356 . |factorList|) (361 . |factor|)
              (366 . |transpose|) (371 . |characteristic|) (375 . |setUnion|)
              (381 . |degree|) (|Union| $ '"failed") (387 . |exquo|)
              (393 . |monomial|) (400 . |ground|) (405 . |transpose|)
              (|Union| 96 '#2#) (410 . |conditionP|) (415 . |elt|) (421 . *)
              (427 . +) (433 . |conditionP|) (438 . |charthRoot|)
              (443 . |charthRoot|) (448 . >) (454 . |coefficient|) (461 . -)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (467 . |monicDivide|) |POLYCAT-;monicDivide;2SVarSetR;27|
              (|MultivariateSquareFree| 8 9 7 6) (473 . |squareFree|)
              (478 . |squareFree|) (|PolynomialSquareFree| 9 8 7 6)
              (483 . |squareFree|) (488 . |squareFree|) (493 . |unit|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 77)) (|List| 162)
              (498 . |factors|) (503 . |squareFreePart|) (508 . |content|)
              (513 . |content|) (519 . |zero?|) (524 . |content|)
              (529 . |exquo|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (535 . |unitNormal|) (540 . |primitivePart|) (545 . |content|)
              (551 . |exquo|) (557 . |primitivePart|) (563 . <) (569 . |Zero|)
              (573 . |Zero|) (577 . |smaller?|) (583 . |smaller?|)
              (|PatternMatchResult| 77 6) (|Pattern| 77)
              (|PatternMatchPolynomialCategory| 77 8 9 7 6)
              (589 . |patternMatch|) (|PatternMatchResult| 77 $)
              (596 . |patternMatch|) (|PatternMatchResult| (|Float|) 6)
              (|Pattern| (|Float|))
              (|PatternMatchPolynomialCategory| (|Float|) 8 9 7 6)
              (603 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (610 . |patternMatch|) (617 . |convert|) (622 . |convert|)
              (|Mapping| 183 9) (|Mapping| 183 7)
              (|PolynomialCategoryLifting| 8 9 7 6 183) (627 . |map|)
              (634 . |convert|) (639 . |convert|) (644 . |convert|)
              (|Mapping| 189 9) (|Mapping| 189 7)
              (|PolynomialCategoryLifting| 8 9 7 6 189) (649 . |map|)
              (656 . |convert|) (|InputForm|) (661 . |convert|)
              (666 . |convert|) (|Mapping| 208 9) (|Mapping| 208 7)
              (|PolynomialCategoryLifting| 8 9 7 6 208) (671 . |map|)
              (678 . |convert|) (|List| 7) (|Equation| $) (|Fraction| 77)
              (|Union| 77 '#1#) (|Union| 7 '#1#) (|Union| 218 '#1#)
              (|Matrix| 77)
              (|Record| (|:| |mat| 222) (|:| |vec| (|Vector| 77))))
           '#(|totalDegreeSorted| 683 |totalDegree| 689 |squareFreePart| 700
              |squareFree| 705 |solveLinearPolynomialEquation| 710 |smaller?|
              716 |retractIfCan| 722 |retract| 727 |resultant| 732
              |reducedSystem| 739 |primitivePart| 750 |patternMatch| 761
              |monicDivide| 775 |isTimes| 782 |isPlus| 787 |isExpt| 792
              |gcdPolynomial| 797 |factorSquareFreePolynomial| 803
              |factorPolynomial| 808 |factor| 813 |eval| 818 |discriminant| 824
              |convert| 830 |content| 845 |conditionP| 851 |coefficient| 856
              |charthRoot| 870)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 215
                                                 '(1 10 6 0 11 1 6 12 0 13 1 6
                                                   9 0 14 1 10 6 0 15 3 6 0 0
                                                   16 17 18 1 6 17 0 21 1 6 16
                                                   0 24 1 6 25 0 26 0 6 0 27 0
                                                   7 0 28 2 6 29 0 9 30 3 6 0 0
                                                   9 29 31 1 6 7 0 32 2 7 25 0
                                                   0 33 1 6 0 7 34 1 6 12 0 36
                                                   2 6 25 0 0 37 2 6 41 0 9 42
                                                   2 43 6 0 29 44 3 6 0 0 16 46
                                                   47 1 6 0 9 49 1 6 25 0 52 0
                                                   6 0 53 0 7 0 54 0 43 0 55 2
                                                   43 25 0 0 56 1 43 29 0 57 1
                                                   43 6 0 58 1 6 29 0 59 1 43 0
                                                   0 60 2 9 25 0 0 62 2 9 25 0
                                                   0 63 2 6 29 0 16 64 2 16 0
                                                   66 0 67 2 43 6 0 0 69 3 0 0
                                                   0 0 9 70 1 43 6 0 71 2 0 0 0
                                                   9 72 1 6 17 0 73 1 74 0 17
                                                   75 1 74 0 0 76 1 78 77 0 79
                                                   2 6 7 0 8 80 1 82 0 81 83 1
                                                   85 84 0 86 1 6 8 0 87 2 82 0
                                                   0 0 88 1 0 82 89 90 1 91 74
                                                   0 92 2 74 0 0 0 93 2 78 0 0
                                                   0 94 2 0 95 89 96 97 2 98 43
                                                   43 43 99 2 0 41 41 41 100 2
                                                   103 101 102 43 104 2 0 105
                                                   106 41 107 1 103 108 43 109
                                                   1 0 110 41 111 1 103 108 43
                                                   112 1 0 110 41 113 1 7 114 0
                                                   115 1 116 7 0 117 1 116 120
                                                   0 121 2 124 0 6 123 125 1
                                                   108 43 0 126 2 6 0 41 9 127
                                                   1 108 129 0 130 1 0 114 0
                                                   131 1 85 0 0 132 0 6 29 133
                                                   2 74 0 0 0 134 2 6 46 0 16
                                                   135 2 77 136 0 0 137 3 6 0 0
                                                   16 46 138 1 6 7 0 139 1 82 0
                                                   0 140 1 7 141 89 142 2 78 7
                                                   0 77 143 2 6 0 0 0 144 2 6 0
                                                   0 0 145 1 0 141 89 146 1 7
                                                   136 0 147 1 0 136 0 148 2 29
                                                   25 0 0 149 3 6 0 0 9 29 150
                                                   2 6 0 0 0 151 2 43 152 0 0
                                                   153 1 155 124 6 156 1 0 114
                                                   0 157 1 158 124 6 159 1 6
                                                   114 0 160 1 124 6 0 161 1
                                                   124 163 0 164 1 0 0 0 165 1
                                                   43 6 0 166 2 0 0 0 9 167 1 6
                                                   25 0 168 1 6 7 0 169 2 6 136
                                                   0 7 170 1 6 171 0 172 1 0 0
                                                   0 173 2 6 0 0 9 174 2 6 136
                                                   0 0 175 2 0 0 0 9 176 2 8 25
                                                   0 0 177 0 8 0 178 0 124 0
                                                   179 2 7 25 0 0 180 2 0 25 0
                                                   0 181 3 184 182 6 183 182
                                                   185 3 0 186 0 183 186 187 3
                                                   190 188 6 189 188 191 3 0
                                                   192 0 189 192 193 1 9 183 0
                                                   194 1 7 183 0 195 3 198 183
                                                   196 197 6 199 1 0 183 0 200
                                                   1 9 189 0 201 1 7 189 0 202
                                                   3 205 189 203 204 6 206 1 0
                                                   189 0 207 1 9 208 0 209 1 7
                                                   208 0 210 3 213 208 211 212
                                                   6 214 1 0 208 0 215 2 0 29 0
                                                   16 65 2 0 29 0 16 68 1 0 29
                                                   0 61 1 0 0 0 165 1 0 114 0
                                                   157 2 0 105 106 41 107 2 0
                                                   25 0 0 181 1 0 12 0 51 1 0 9
                                                   0 50 3 0 0 0 0 9 70 2 0 95
                                                   89 96 97 1 0 82 89 90 2 0 0
                                                   0 9 176 1 0 0 0 173 3 0 186
                                                   0 183 186 187 3 0 192 0 189
                                                   192 193 3 0 152 0 0 9 154 1
                                                   0 22 0 35 1 0 22 0 23 1 0 39
                                                   0 40 2 0 41 41 41 100 1 0
                                                   110 41 113 1 0 110 41 111 1
                                                   0 114 0 131 2 0 0 0 19 20 2
                                                   0 0 0 9 72 1 0 208 0 215 1 0
                                                   189 0 207 1 0 183 0 200 2 0
                                                   0 0 9 167 1 0 141 89 146 3 0
                                                   0 0 16 46 48 3 0 0 0 9 29 45
                                                   1 0 136 0 148)))))
           '|lookupComplete|)) 
