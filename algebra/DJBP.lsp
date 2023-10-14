
(/VERSIONCHECK 2) 

(DEFUN |DJBP;lookup| (|jv| $)
  (PROG (#1=#:G161 #2=#:G162 |i| #3=#:G163 |ljv|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |ljv| NIL . #4=(|DJBP;lookup|))
             (LETT #3# (QREFELT $ 8) . #4#) (LETT |i| 1 . #4#)
             (LETT #2# (QREFELT $ 13) . #4#) G190
             (COND
              ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                   (PROGN (LETT |ljv| (CAR #3#) . #4#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |ljv| |jv| (QREFELT $ 17))
                 (PROGN (LETT #1# |i| . #4#) (GO #1#))))))
             (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #4#)) . #4#)
             (GO G190) G191 (EXIT NIL))
        (EXIT (|error| "illegal jet variable"))))
      #1# (EXIT #1#))))) 

(DEFUN |DJBP;monomial;$JBNni$;2| (|p| |jv| |e| $)
  (PROG (|v| |j|)
    (RETURN
     (SEQ (LETT |j| (|DJBP;lookup| |jv| $) . #1=(|DJBP;monomial;$JBNni$;2|))
          (LETT |v| (SPADCALL (QREFELT $ 13) (QREFELT $ 20)) . #1#)
          (QSETAREF1O |v| |j| |e| 1)
          (EXIT
           (SPADCALL |p|
                     (SPADCALL (|spadConstant| $ 23)
                               (SPADCALL |v| (QREFELT $ 24)) (QREFELT $ 25))
                     (QREFELT $ 26))))))) 

(DEFUN |DJBP;coerce;JB$;3| (|jv| $)
  (SPADCALL (|spadConstant| $ 22) |jv| 1 (QREFELT $ 27))) 

(PUT '|DJBP;zero?;$B;4| '|SPADreplace| 'NULL) 

(DEFUN |DJBP;zero?;$B;4| (|p| $) (NULL |p|)) 

(DEFUN |DJBP;ground?;$B;5| (|p| $) (QEQCAR (SPADCALL |p| (QREFELT $ 31)) 1)) 

(DEFUN |DJBP;monomial?;$B;6| (|p| $)
  (PROG (|l|)
    (RETURN
     (SEQ (LETT |l| |p| |DJBP;monomial?;$B;6|)
          (EXIT (COND ((NULL |l|) 'T) ('T (NULL (CDR |l|))))))))) 

(DEFUN |DJBP;numberOfMonomials;$Nni;7| (|p| $)
  (PROG (|l|)
    (RETURN
     (SEQ (LETT |l| |p| |DJBP;numberOfMonomials;$Nni;7|)
          (EXIT (COND ((NULL |l|) 1) ('T (LENGTH |l|)))))))) 

(DEFUN |DJBP;mainVariable;$U;8| (|p| $)
  (PROG (#1=#:G184 #2=#:G185 |i| #3=#:G186 |jv| |tdeg|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |p| (QREFELT $ 29)) (CONS 1 "failed"))
             ('T
              (SEQ
               (LETT |tdeg| (SPADCALL |p| (QREFELT $ 35))
                     . #4=(|DJBP;mainVariable;$U;8|))
               (SEQ (LETT |jv| NIL . #4#) (LETT #3# (QREFELT $ 8) . #4#)
                    (LETT |i| 1 . #4#) (LETT #2# (QREFELT $ 13) . #4#) G190
                    (COND
                     ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                          (PROGN (LETT |jv| (CAR #3#) . #4#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((NULL (ZEROP (SPADCALL |tdeg| |i| (QREFELT $ 37))))
                        (PROGN (LETT #1# (CONS 0 |jv|) . #4#) (GO #1#))))))
                    (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #4#))
                          . #4#)
                    (GO G190) G191 (EXIT NIL))
               (EXIT (CONS 1 "failed"))))))
      #1# (EXIT #1#))))) 

(DEFUN |DJBP;variables;$L;9| (|p| $)
  (PROG (#1=#:G197 |jv| #2=#:G198 |i| #3=#:G196 #4=#:G195 |tdeg| |maxdeg|)
    (RETURN
     (SEQ
      (LETT |maxdeg| (SPADCALL (QREFELT $ 13) 0 (QREFELT $ 40))
            . #5=(|DJBP;variables;$L;9|))
      (SEQ G190
           (COND
            ((NULL (COND ((SPADCALL |p| (QREFELT $ 29)) 'NIL) ('T 'T)))
             (GO G191)))
           (SEQ (LETT |tdeg| (SPADCALL |p| (QREFELT $ 35)) . #5#)
                (LETT |p| (SPADCALL |p| (QREFELT $ 41)) . #5#)
                (EXIT
                 (SEQ (LETT |i| 1 . #5#) (LETT #4# (QREFELT $ 13) . #5#) G190
                      (COND ((|greater_SI| |i| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |maxdeg| |i|
                                  (MAX (SPADCALL |maxdeg| |i| (QREFELT $ 42))
                                       (SPADCALL |tdeg| |i| (QREFELT $ 37)))
                                  (QREFELT $ 43))))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT NIL))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (PROGN
        (LETT #3# NIL . #5#)
        (SEQ (LETT |i| 1 . #5#) (LETT #2# (QREFELT $ 13) . #5#)
             (LETT |jv| NIL . #5#) (LETT #1# (QREFELT $ 8) . #5#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |jv| (CAR #1#) . #5#) NIL)
                   (|greater_SI| |i| #2#))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |maxdeg| |i| (QREFELT $ 42)) 0
                           (QREFELT $ 44))
                 (LETT #3# (CONS |jv| #3#) . #5#)))))
             (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #5#)) . #5#)
             (GO G190) G191 (EXIT (NREVERSE #3#))))))))) 

(DEFUN |DJBP;coerce;$Of;10| (|p| $)
  (PROG (|lt| |l| #1=#:G215 |i| #2=#:G214 |t|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 29))
        (SPADCALL (|spadConstant| $ 39) (QREFELT $ 47)))
       (#3='T
        (SEQ (LETT |lt| NIL . #4=(|DJBP;coerce;$Of;10|))
             (SEQ (LETT |t| NIL . #4#) (LETT #2# (REVERSE |p|) . #4#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #4#) NIL))
                    (GO G191)))
                  (SEQ (LETT |l| NIL . #4#)
                       (SEQ (LETT |i| 1 . #4#) (LETT #1# (QREFELT $ 13) . #4#)
                            G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((EQL (SPADCALL (QCAR |t|) |i| (QREFELT $ 37))
                                     0)
                                |l|)
                               ((EQL (SPADCALL (QCAR |t|) |i| (QREFELT $ 37))
                                     1)
                                (LETT |l|
                                      (CONS
                                       (SPADCALL (QREFELT $ 12) |i|
                                                 (QREFELT $ 51))
                                       |l|)
                                      . #4#))
                               ('T
                                (LETT |l|
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL (QREFELT $ 12) |i|
                                                  (QREFELT $ 51))
                                        (SPADCALL
                                         (SPADCALL (QCAR |t|) |i|
                                                   (QREFELT $ 37))
                                         (QREFELT $ 52))
                                        (QREFELT $ 53))
                                       |l|)
                                      . #4#)))))
                            (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |l| (REVERSE |l|) . #4#)
                       (COND
                        ((OR
                          (SPADCALL (QCDR |t|) (|spadConstant| $ 23)
                                    (QREFELT $ 54))
                          (NULL |l|))
                         (LETT |l|
                               (CONS (SPADCALL (QCDR |t|) (QREFELT $ 47)) |l|)
                               . #4#)))
                       (EXIT
                        (COND
                         ((EQL (LENGTH |l|) 1)
                          (LETT |lt| (CONS (|SPADfirst| |l|) |lt|) . #4#))
                         ('T
                          (LETT |lt|
                                (CONS (SPADCALL (ELT $ 55) |l| (QREFELT $ 57))
                                      |lt|)
                                . #4#)))))
                  (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (COND ((EQL (LENGTH |lt|) 1) (|SPADfirst| |lt|))
                    (#3# (SPADCALL (ELT $ 58) |lt| (QREFELT $ 57)))))))))))) 

(DEFUN |DJBP;convert;Jbp$;11| (|p| $)
  (PROG (|up| |res| |x| |cc| |xx|)
    (RETURN
     (SEQ
      (LETT |xx| (SPADCALL |p| (QREFELT $ 61)) . #1=(|DJBP;convert;Jbp$;11|))
      (EXIT
       (COND
        ((QEQCAR |xx| 1)
         (SEQ (LETT |cc| (SPADCALL |p| (QREFELT $ 62)) . #1#)
              (EXIT (SPADCALL |cc| (QREFELT $ 63)))))
        ('T
         (SEQ (LETT |x| (QCDR |xx|) . #1#)
              (COND
               ((NULL (SPADCALL |x| (QREFELT $ 8) (QREFELT $ 64)))
                (EXIT (|error| "illegal jet variable"))))
              (LETT |up| (SPADCALL |p| |x| (QREFELT $ 66)) . #1#)
              (LETT |res| (|spadConstant| $ 38) . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((SPADCALL |up| (QREFELT $ 68)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (LETT |res|
                          (SPADCALL |res|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |up| (QREFELT $ 69))
                                               (QREFELT $ 70))
                                     |x| (SPADCALL |up| (QREFELT $ 71))
                                     (QREFELT $ 27))
                                    (QREFELT $ 72))
                          . #1#)
                    (EXIT (LETT |up| (SPADCALL |up| (QREFELT $ 73)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|))))))))) 

(DEFUN |DJBP;convert;$Jbp;12| (|p| $)
  (PROG (|up| |res| |x| |cc| |xx|)
    (RETURN
     (SEQ
      (LETT |xx| (SPADCALL |p| (QREFELT $ 31)) . #1=(|DJBP;convert;$Jbp;12|))
      (EXIT
       (COND
        ((QEQCAR |xx| 1)
         (SEQ (LETT |cc| (SPADCALL |p| (QREFELT $ 74)) . #1#)
              (EXIT (SPADCALL |cc| (QREFELT $ 75)))))
        ('T
         (SEQ (LETT |x| (QCDR |xx|) . #1#)
              (LETT |up| (SPADCALL |p| |x| (QREFELT $ 76)) . #1#)
              (LETT |res| (|spadConstant| $ 77) . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((SPADCALL |up| (QREFELT $ 79)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (LETT |res|
                          (SPADCALL |res|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |up| (QREFELT $ 80))
                                               (QREFELT $ 81))
                                     |x| (SPADCALL |up| (QREFELT $ 82))
                                     (QREFELT $ 83))
                                    (QREFELT $ 84))
                          . #1#)
                    (EXIT (LETT |up| (SPADCALL |up| (QREFELT $ 85)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|))))))))) 

(DEFUN |DJBP;const;$R;13| (|p| $)
  (COND ((NULL (SPADCALL |p| (QREFELT $ 32))) (|error| "not a constant"))
        ('T (SPADCALL |p| (QREFELT $ 86))))) 

(DEFUN |DJBP;retractIfCan;$U;14| (|p| $)
  (COND ((SPADCALL |p| (QREFELT $ 32)) (CONS 0 (SPADCALL |p| (QREFELT $ 86))))
        ('T (CONS 1 "failed")))) 

(DEFUN |DJBP;retract;$R;15| (|p| $) (SPADCALL |p| (QREFELT $ 87))) 

(DEFUN |DJBP;univariate;$JBSup;16| (|p| |jv| $)
  (PROG (|nexp| |deg| #1=#:G254 #2=#:G256 |i| #3=#:G255 |j| |exp|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 29)) (|spadConstant| $ 90))
            ('T
             (SEQ
              (LETT |exp| (SPADCALL |p| (QREFELT $ 35))
                    . #4=(|DJBP;univariate;$JBSup;16|))
              (LETT |j| (|DJBP;lookup| |jv| $) . #4#) (LETT |deg| 0 . #4#)
              (LETT |nexp|
                    (SPADCALL
                     (PROGN
                      (LETT #3# (GETREFV #5=(QREFELT $ 13)) . #4#)
                      (SEQ (LETT |i| 1 . #4#) (LETT #2# #5# . #4#)
                           (LETT #1# 0 . #4#) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SETELT #3# #1#
                                     (COND
                                      ((EQL |j| |i|)
                                       (SEQ
                                        (LETT |deg|
                                              (SPADCALL |exp| |i|
                                                        (QREFELT $ 37))
                                              . #4#)
                                        (EXIT 0)))
                                      ('T
                                       (SPADCALL |exp| |i| (QREFELT $ 37)))))))
                           (LETT #1#
                                 (PROG1 (|inc_SI| #1#)
                                   (LETT |i| (|inc_SI| |i|) . #4#))
                                 . #4#)
                           (GO G190) G191 (EXIT NIL))
                      #3#)
                     (QREFELT $ 24))
                    . #4#)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 86)) |nexp| (QREFELT $ 25))
                 |deg| (QREFELT $ 91))
                (SPADCALL (SPADCALL |p| (QREFELT $ 41)) |jv| (QREFELT $ 76))
                (QREFELT $ 92)))))))))) 

(DEFUN |DJBP;univariate;$Sup;17| (|p| $)
  (PROG (|up| |res| |pv|)
    (RETURN
     (SEQ
      (LETT |pv| (SPADCALL |p| (QREFELT $ 31))
            . #1=(|DJBP;univariate;$Sup;17|))
      (EXIT
       (COND
        ((QEQCAR |pv| 1)
         (SPADCALL (SPADCALL |p| (QREFELT $ 86)) 0 (QREFELT $ 94)))
        ('T
         (SEQ (LETT |up| (SPADCALL |p| (QCDR |pv|) (QREFELT $ 76)) . #1#)
              (LETT |res| (|spadConstant| $ 95) . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((SPADCALL |up| (QREFELT $ 79)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (LETT |res|
                          (SPADCALL |res|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |up| (QREFELT $ 80))
                                               (QREFELT $ 87))
                                     (SPADCALL |up| (QREFELT $ 82))
                                     (QREFELT $ 94))
                                    (QREFELT $ 96))
                          . #1#)
                    (EXIT (LETT |up| (SPADCALL |up| (QREFELT $ 85)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|))))))))) 

(DEFUN |DJBP;multivariate;SupJB$;18| (|p1| |jv| $)
  (COND ((SPADCALL |p1| (QREFELT $ 79)) (|spadConstant| $ 38))
        ((ZEROP (SPADCALL |p1| (QREFELT $ 82))) (SPADCALL |p1| (QREFELT $ 80)))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL |p1| (QREFELT $ 80))
                    (SPADCALL (SPADCALL |jv| (QREFELT $ 28))
                              (SPADCALL |p1| (QREFELT $ 82)) (QREFELT $ 98))
                    (QREFELT $ 26))
          (SPADCALL (SPADCALL |p1| (QREFELT $ 85)) |jv| (QREFELT $ 99))
          (QREFELT $ 72))))) 

(DEFUN |DJBP;multivariate;SupJB$;19| (|p| |jv| $)
  (COND ((SPADCALL |p| (QREFELT $ 100)) (|spadConstant| $ 38))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL |p| (QREFELT $ 101))
                    (SPADCALL (|spadConstant| $ 22) |jv|
                              (SPADCALL |p| (QREFELT $ 102)) (QREFELT $ 27))
                    (QREFELT $ 103))
          (SPADCALL (SPADCALL |p| (QREFELT $ 104)) |jv| (QREFELT $ 105))
          (QREFELT $ 72))))) 

(DEFUN |DJBP;totalDegree;$Nni;20| (|p| $)
  (PROG (#1=#:G272 #2=#:G271 #3=#:G273 #4=#:G278 |t|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 29)) 0)
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|DJBP;totalDegree;$Nni;20|))
              (SEQ (LETT |t| NIL . #6#) (LETT #4# |p| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (SPADCALL (ELT $ 107)
                                      (SPADCALL (QCAR |t|) (QREFELT $ 106)) 0
                                      (QREFELT $ 109))
                            . #6#)
                      (COND (#1# (LETT #2# (MAX #2# #3#) . #6#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #6#)
                              (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# (|IdentityError| '|max|)))))))))) 

(DEFUN |DJBP;degree;$JBNni;21| (|p| |jv| $)
  (SPADCALL (SPADCALL |p| |jv| (QREFELT $ 76)) (QREFELT $ 82))) 

(DEFUN |DJBP;degree;$LL;22| (|p| |ljv| $)
  (PROG (#1=#:G283 |jv| #2=#:G282)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|DJBP;degree;$LL;22|))
       (SEQ (LETT |jv| NIL . #3#) (LETT #1# |ljv| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |jv| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |p| |jv| (QREFELT $ 111)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |DJBP;minimumDegree;$JBNni;23| (|p| |jv| $)
  (SPADCALL (SPADCALL |p| |jv| (QREFELT $ 76)) (QREFELT $ 114))) 

(DEFUN |DJBP;minimumDegree;$LL;24| (|p| |ljv| $)
  (PROG (#1=#:G288 |jv| #2=#:G287)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|DJBP;minimumDegree;$LL;24|))
       (SEQ (LETT |jv| NIL . #3#) (LETT #1# |ljv| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |jv| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |p| |jv| (QREFELT $ 115)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |DJBP;eval;$JB2$;25| (|p| |jv| |val| $)
  (SPADCALL (SPADCALL |p| |jv| (QREFELT $ 76)) |val| (QREFELT $ 117))) 

(DEFUN |DJBP;eval;$JBR$;26| (|p| |jv| |val| $)
  (SPADCALL |p| |jv| (SPADCALL |val| (QREFELT $ 63)) (QREFELT $ 118))) 

(DEFUN |DJBP;eval;$LL$;27| (|p| |ljv| |lval| $)
  (COND ((NULL |ljv|) |p|)
        ('T
         (SPADCALL
          (SPADCALL |p| (|SPADfirst| |ljv|)
                    (SPADCALL (|SPADfirst| |lval|) (QREFELT $ 63))
                    (QREFELT $ 118))
          (CDR |ljv|) (CDR |lval|) (QREFELT $ 121))))) 

(DEFUN |DJBP;evalSortedVarlist| (|p| |Ljvar| |Lpval| $)
  (PROG (|pts| |pval| |mvar| |pv| |j|)
    (RETURN
     (SEQ
      (LETT |j| (SPADCALL |p| (QREFELT $ 31)) . #1=(|DJBP;evalSortedVarlist|))
      (EXIT
       (COND ((QEQCAR |j| 1) |p|)
             (#2='T
              (SEQ (LETT |pv| (QCDR |j|) . #1#)
                   (COND
                    ((OR (NULL |Ljvar|) (SPADCALL |Lpval| (QREFELT $ 123)))
                     (EXIT |p|)))
                   (LETT |mvar| (|SPADfirst| |Ljvar|) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL |mvar| |pv| (QREFELT $ 124))
                      (|DJBP;evalSortedVarlist| |p| (CDR |Ljvar|)
                       (SPADCALL |Lpval| '|rest| (QREFELT $ 126)) $))
                     (#2#
                      (SEQ
                       (LETT |pval| (SPADCALL |Lpval| '|first| (QREFELT $ 128))
                             . #1#)
                       (LETT |pts|
                             (SPADCALL
                              (CONS #'|DJBP;evalSortedVarlist!0|
                                    (VECTOR $ |Lpval| |Ljvar|))
                              (SPADCALL |p| |pv| (QREFELT $ 76))
                              (QREFELT $ 130))
                             . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |mvar| |pv| (QREFELT $ 17))
                          (SPADCALL |pts| |pval| (QREFELT $ 117)))
                         (#2#
                          (SPADCALL |pts| |pv| (QREFELT $ 99))))))))))))))))) 

(DEFUN |DJBP;evalSortedVarlist!0| (|x| $$)
  (PROG (|Ljvar| |Lpval| $)
    (LETT |Ljvar| (QREFELT $$ 2) . #1=(|DJBP;evalSortedVarlist|))
    (LETT |Lpval| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|DJBP;evalSortedVarlist| |x| |Ljvar| |Lpval| $))))) 

(DEFUN |DJBP;eval;$LL$;29| (|p| |Ljvar| |Lpval| $)
  (PROG (|nlpval| #1=#:G308 |mvar| #2=#:G307 |nljvar|)
    (RETURN
     (SEQ
      (LETT |nljvar|
            (SPADCALL (CONS #'|DJBP;eval;$LL$;29!0| $) |Ljvar| (QREFELT $ 133))
            . #3=(|DJBP;eval;$LL$;29|))
      (LETT |nlpval|
            (COND ((SPADCALL |Ljvar| |nljvar| (QREFELT $ 134)) |Lpval|)
                  ('T
                   (LETT |nlpval|
                         (PROGN
                          (LETT #2# NIL . #3#)
                          (SEQ (LETT |mvar| NIL . #3#)
                               (LETT #1# |nljvar| . #3#) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |mvar| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (SPADCALL |Lpval|
                                                  (SPADCALL |mvar| |Ljvar|
                                                            (QREFELT $ 135))
                                                  (QREFELT $ 136))
                                        #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #3#)))
            . #3#)
      (EXIT (|DJBP;evalSortedVarlist| |p| |nljvar| |nlpval| $)))))) 

(DEFUN |DJBP;eval;$LL$;29!0| (|x| |y| $)
  (SPADCALL (|DJBP;lookup| |x| $) (|DJBP;lookup| |y| $) (QREFELT $ 131))) 

(DEFUN |DJBP;differentiate;$JB$;30| (|p| |jv| $)
  (SPADCALL (SPADCALL (SPADCALL |p| |jv| (QREFELT $ 76)) (QREFELT $ 139)) |jv|
            (QREFELT $ 99))) 

(DEFUN |DJBP;/;$R$;31| (|p| |r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 141)) |p| (QREFELT $ 103))) 

(DEFUN |DJBP;content;$R;32| (|p| $)
  (PROG (#1=#:G312 #2=#:G311 #3=#:G313 #4=#:G316 |t|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 29)) (|spadConstant| $ 39))
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|DJBP;content;$R;32|))
              (SEQ (LETT |t| NIL . #6#) (LETT #4# |p| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3# (QCDR |t|) . #6#)
                      (COND
                       (#1#
                        (LETT #2# (SPADCALL #2# #3# (QREFELT $ 143)) . #6#))
                       ('T
                        (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# (|spadConstant| $ 39)))))))))) 

(DEFUN |DJBP;gcd;3$;33| (|p1| |p2| $)
  (PROG (|r| |pv2| |pv1|)
    (RETURN
     (SEQ (LETT |pv1| (SPADCALL |p1| (QREFELT $ 31)) . #1=(|DJBP;gcd;3$;33|))
          (EXIT
           (COND
            ((QEQCAR |pv1| 1)
             (COND
              ((SPADCALL (LETT |r| (SPADCALL |p1| (QREFELT $ 86)) . #1#)
                         (QREFELT $ 145))
               |p2|)
              (#2='T
               (SPADCALL
                (SPADCALL |r| (SPADCALL |p2| (QREFELT $ 144)) (QREFELT $ 143))
                (QREFELT $ 63)))))
            (#2#
             (SEQ (LETT |pv2| (SPADCALL |p2| (QREFELT $ 31)) . #1#)
                  (EXIT
                   (COND
                    ((QEQCAR |pv2| 1)
                     (COND
                      ((SPADCALL
                        (LETT |r| (SPADCALL |p2| (QREFELT $ 86)) . #1#)
                        (QREFELT $ 145))
                       |p1|)
                      (#2#
                       (SPADCALL
                        (SPADCALL |r| (SPADCALL |p1| (QREFELT $ 144))
                                  (QREFELT $ 143))
                        (QREFELT $ 63)))))
                    ((SPADCALL (QCDR |pv1|) (QCDR |pv2|) (QREFELT $ 146))
                     (SPADCALL |p1|
                               (SPADCALL
                                (SPADCALL |p2| (QCDR |pv2|) (QREFELT $ 76))
                                (QREFELT $ 147))
                               (QREFELT $ 148)))
                    ((SPADCALL (QCDR |pv2|) (QCDR |pv1|) (QREFELT $ 146))
                     (SPADCALL |p2|
                               (SPADCALL
                                (SPADCALL |p1| (QCDR |pv1|) (QREFELT $ 76))
                                (QREFELT $ 147))
                               (QREFELT $ 148)))
                    (#2#
                     (SPADCALL
                      (SPADCALL (SPADCALL |p1| (QCDR |pv1|) (QREFELT $ 76))
                                (SPADCALL |p2| (QCDR |pv2|) (QREFELT $ 76))
                                (QREFELT $ 149))
                      (QCDR |pv1|) (QREFELT $ 99))))))))))))) 

(DEFUN |DJBP;gcd;3$;34| (|p1| |p2| $) (SPADCALL |p1| |p2| (QREFELT $ 151))) 

(DEFUN |DJBP;gcd;3$;35| (|p1| |p2| $)
  (PROG (|r| |pv2| |pv1|)
    (RETURN
     (SEQ (LETT |pv1| (SPADCALL |p1| (QREFELT $ 31)) . #1=(|DJBP;gcd;3$;35|))
          (EXIT
           (COND
            ((QEQCAR |pv1| 1)
             (COND
              ((SPADCALL (LETT |r| (SPADCALL |p1| (QREFELT $ 86)) . #1#)
                         (QREFELT $ 145))
               |p2|)
              (#2='T
               (SPADCALL
                (SPADCALL |r| (SPADCALL |p2| (QREFELT $ 144)) (QREFELT $ 143))
                (QREFELT $ 63)))))
            (#2#
             (SEQ (LETT |pv2| (SPADCALL |p2| (QREFELT $ 31)) . #1#)
                  (EXIT
                   (COND
                    ((QEQCAR |pv2| 1)
                     (COND
                      ((SPADCALL
                        (LETT |r| (SPADCALL |p2| (QREFELT $ 86)) . #1#)
                        (QREFELT $ 145))
                       |p1|)
                      (#2#
                       (SPADCALL
                        (SPADCALL |r| (SPADCALL |p1| (QREFELT $ 144))
                                  (QREFELT $ 143))
                        (QREFELT $ 63)))))
                    ((SPADCALL (QCDR |pv1|) (QCDR |pv2|) (QREFELT $ 146))
                     (SPADCALL |p1|
                               (SPADCALL
                                (SPADCALL |p2| (QCDR |pv2|) (QREFELT $ 76))
                                (QREFELT $ 147))
                               (QREFELT $ 148)))
                    ((SPADCALL (QCDR |pv2|) (QCDR |pv1|) (QREFELT $ 146))
                     (SPADCALL |p2|
                               (SPADCALL
                                (SPADCALL |p1| (QCDR |pv1|) (QREFELT $ 76))
                                (QREFELT $ 147))
                               (QREFELT $ 148)))
                    (#2#
                     (SPADCALL
                      (SPADCALL (SPADCALL |p1| (QCDR |pv1|) (QREFELT $ 76))
                                (SPADCALL |p2| (QCDR |pv2|) (QREFELT $ 76))
                                (QREFELT $ 149))
                      (QCDR |pv1|) (QREFELT $ 99))))))))))))) 

(DEFUN |DJBP;groebner;2L;36| (|lp| $)
  (SEQ (SPADCALL "groebner$DJBP" (QREFELT $ 153))
       (EXIT (SPADCALL |lp| (QREFELT $ 155))))) 

(DEFUN |DistributedJetBundlePolynomial| (&REST #1=#:G370)
  (PROG ()
    (RETURN
     (PROG (#2=#:G371)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|DistributedJetBundlePolynomial|)
                                           '|domainEqualList|)
                . #3=(|DistributedJetBundlePolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |DistributedJetBundlePolynomial;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|DistributedJetBundlePolynomial|))))))))))) 

(DEFUN |DistributedJetBundlePolynomial;| (|#1| |#2| |#3| |#4|)
  (PROG (#1=#:G369 |jv| #2=#:G368 #3=#:G367 |pv$| #4=#:G365 #5=#:G366 $ |dv$|
         DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (SEQ
      (PROGN
       (LETT DV$1 (|devaluate| |#1|) . #6=(|DistributedJetBundlePolynomial|))
       (LETT DV$2 (|devaluate| |#2|) . #6#)
       (LETT DV$3 (|devaluate| |#3|) . #6#)
       (LETT DV$4 (|devaluate| |#4|) . #6#)
       (LETT |dv$| (LIST '|DistributedJetBundlePolynomial| DV$1 DV$2 DV$3 DV$4)
             . #6#)
       (LETT $ (GETREFV 191) . #6#)
       (QSETREFV $ 0 |dv$|)
       (QSETREFV $ 3
                 (LETT |pv$|
                       (|buildPredVector| 0 0
                                          (LIST
                                           (|HasCategory| |#1|
                                                          '(|PolynomialFactorizationExplicit|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (LETT #5#
                                                 (|HasCategory| |#1|
                                                                '(|GcdDomain|))
                                                 . #6#)
                                           (OR #5#
                                               (|HasCategory| |#1|
                                                              '(|IntegralDomain|))
                                               (|HasCategory| |#1|
                                                              '(|PolynomialFactorizationExplicit|)))
                                           (OR #5#
                                               (|HasCategory| |#1|
                                                              '(|PolynomialFactorizationExplicit|)))
                                           (OR #5#
                                               (|HasCategory| |#1|
                                                              '(|IntegralDomain|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|PatternMatchable|
                                                             (|Float|)))
                                            (|HasCategory| |#2|
                                                           '(|PatternMatchable|
                                                             (|Float|))))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|PatternMatchable|
                                                             (|Integer|)))
                                            (|HasCategory| |#2|
                                                           '(|PatternMatchable|
                                                             (|Integer|))))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|ConvertibleTo|
                                                             (|Pattern|
                                                              (|Float|))))
                                            (|HasCategory| |#2|
                                                           '(|ConvertibleTo|
                                                             (|Pattern|
                                                              (|Float|)))))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|ConvertibleTo|
                                                             (|Pattern|
                                                              (|Integer|))))
                                            (|HasCategory| |#2|
                                                           '(|ConvertibleTo|
                                                             (|Pattern|
                                                              (|Integer|)))))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|ConvertibleTo|
                                                             (|InputForm|)))
                                            (|HasCategory| |#2|
                                                           '(|ConvertibleTo|
                                                             (|InputForm|))))
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Integer|)))
                                           (|HasCategory| |#1|
                                                          '(|canonicalUnitNormal|))
                                           (|HasCategory| |#1| '(|Comparable|))
                                           (|HasCategory| |#1|
                                                          '(|LinearlyExplicitRingOver|
                                                            (|Integer|)))
                                           (OR
                                            (|HasCategory| |#1|
                                                           '(|Algebra|
                                                             (|Fraction|
                                                              (|Integer|))))
                                            (|HasCategory| |#1|
                                                           '(|RetractableTo|
                                                             (|Fraction|
                                                              (|Integer|)))))
                                           (|HasCategory| |#1| '(|Field|))
                                           (LETT #4#
                                                 (|HasCategory| |#1|
                                                                '(|CommutativeRing|))
                                                 . #6#)
                                           (OR #4# #5#
                                               (|HasCategory| |#1|
                                                              '(|IntegralDomain|))
                                               (|HasCategory| |#1|
                                                              '(|PolynomialFactorizationExplicit|)))
                                           (OR #4#
                                               (|HasCategory| |#1|
                                                              '(|IntegralDomain|)))
                                           (OR #4# #5#
                                               (|HasCategory| |#1|
                                                              '(|IntegralDomain|)))))
                       . #6#))
       (|haddProp| |$ConstructorCache| '|DistributedJetBundlePolynomial|
                   (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
       (|stuffDomainSlots| $)
       (QSETREFV $ 6 |#1|)
       (QSETREFV $ 7 |#2|)
       (QSETREFV $ 8 |#3|)
       (QSETREFV $ 9 |#4|)
       (AND (|HasCategory| $ '(|CommutativeRing|))
            (|augmentPredVector| $ 33554432))
       (AND
        (LETT #3#
              (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                   (|HasCategory| $ '(|CharacteristicNonZero|)))
              . #6#)
        (|augmentPredVector| $ 67108864))
       (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #3#)
            (|augmentPredVector| $ 134217728))
       (AND
        (OR #5#
            (AND (|HasCategory| |#1| '(|IntegralDomain|))
                 (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
        (|augmentPredVector| $ 268435456))
       (SETF |pv$| (QREFELT $ 3))
       (QSETREFV $ 12
                 (PROGN
                  (LETT #2# NIL . #6#)
                  (SEQ (LETT |jv| NIL . #6#) (LETT #1# |#3| . #6#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |jv| (CAR #1#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |jv| (QREFELT $ 11)) #2#)
                               . #6#)))
                       (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))
       (QSETREFV $ 13 (LENGTH |#3|))
       (QSETREFV $ 14 (|Record| (|:| |k| |#4|) (|:| |c| |#1|)))
       (QSETREFV $ 15 (|List| (QREFELT $ 14)))
       (COND
        ((|testBitVector| |pv$| 21)
         (QSETREFV $ 142 (CONS (|dispatchFunction| |DJBP;/;$R$;31|) $))))
       (COND
        ((|testBitVector| |pv$| 3)
         (PROGN
          (QSETREFV $ 144 (CONS (|dispatchFunction| |DJBP;content;$R;32|) $))
          (COND
           ((|HasCategory| |#1| '(|EuclideanDomain|))
            (COND
             ((|testBitVector| |pv$| 21)
              (QSETREFV $ 148 (CONS (|dispatchFunction| |DJBP;gcd;3$;33|) $)))
             ('T
              (QSETREFV $ 148
                        (CONS (|dispatchFunction| |DJBP;gcd;3$;34|) $)))))
           ('T
            (QSETREFV $ 148 (CONS (|dispatchFunction| |DJBP;gcd;3$;35|) $))))
          (QSETREFV $ 156
                    (CONS (|dispatchFunction| |DJBP;groebner;2L;36|) $)))))
       $))))) 

(MAKEPROP '|DistributedJetBundlePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 9) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|) (|OutputForm|)
              (0 . |coerce|) 'LJVO '|nl| '|Term| '|Rep| (|Boolean|) (5 . =)
              (|NonNegativeInteger|) (|Vector| 18) (11 . |zero|) (16 . |One|)
              (20 . |One|) (24 . |One|) (28 . |directProduct|)
              (33 . |monomial|) (39 . *) |DJBP;monomial;$JBNni$;2|
              |DJBP;coerce;JB$;3| |DJBP;zero?;$B;4| (|Union| 7 '"failed")
              |DJBP;mainVariable;$U;8| |DJBP;ground?;$B;5|
              |DJBP;monomial?;$B;6| |DJBP;numberOfMonomials;$Nni;7|
              (45 . |degree|) (|Integer|) (50 . |elt|) (56 . |Zero|)
              (60 . |Zero|) (64 . |new|) (70 . |reductum|) (75 . |elt|)
              (81 . |setelt|) (88 . ~=) (|List| 7) |DJBP;variables;$L;9|
              (94 . |coerce|) (99 . |empty|) (103 . |empty|) (|List| 10)
              (107 . |elt|) (113 . |coerce|) (118 . ^) (124 . ~=) (130 . *)
              (|Mapping| 10 10 10) (136 . |reduce|) (142 . +)
              |DJBP;coerce;$Of;10| (|JetBundlePolynomial| 6 7)
              (148 . |mainVariable|) (153 . |retract|) (158 . |coerce|)
              (163 . |member?|) (|SparseUnivariatePolynomial| $)
              (169 . |univariate|) (|SparseUnivariatePolynomial| 60)
              (175 . |zero?|) (180 . |leadingCoefficient|)
              |DJBP;convert;Jbp$;11| (185 . |degree|) (190 . +)
              (196 . |reductum|) |DJBP;retract;$R;15| (201 . |coerce|)
              |DJBP;univariate;$JBSup;16| (206 . |Zero|)
              (|SparseUnivariatePolynomial| $$) (210 . |zero?|)
              (215 . |leadingCoefficient|) |DJBP;convert;$Jbp;12|
              (220 . |degree|) (225 . |monomial|) (232 . +) (238 . |reductum|)
              (243 . |leadingCoefficient|) |DJBP;const;$R;13|
              (|Union| 6 '"failed") |DJBP;retractIfCan;$U;14| (248 . |Zero|)
              (252 . |monomial|) (258 . +) (|SparseUnivariatePolynomial| 6)
              (264 . |monomial|) (270 . |Zero|) (274 . +)
              |DJBP;univariate;$Sup;17| (280 . ^) |DJBP;multivariate;SupJB$;18|
              (286 . |zero?|) (291 . |leadingCoefficient|) (296 . |degree|)
              (301 . *) (307 . |reductum|) |DJBP;multivariate;SupJB$;19|
              (312 . |coerce|) (317 . +) (|Mapping| 18 18 18) (323 . |reduce|)
              |DJBP;totalDegree;$Nni;20| |DJBP;degree;$JBNni;21| (|List| 18)
              |DJBP;degree;$LL;22| (330 . |minimumDegree|)
              |DJBP;minimumDegree;$JBNni;23| |DJBP;minimumDegree;$LL;24|
              (335 . |elt|) |DJBP;eval;$JB2$;25| |DJBP;eval;$JBR$;26|
              (|List| 6) |DJBP;eval;$LL$;27| (|List| $$) (341 . |empty?|)
              (346 . >) '"rest" (352 . |elt|) '"first" (358 . |elt|)
              (|Mapping| $$ $$) (364 . |map|) (370 . <) (|Mapping| 16 7 7)
              (376 . |sort|) (382 . =) (388 . |position|) (394 . |elt|)
              (|List| $) |DJBP;eval;$LL$;29| (400 . |differentiate|)
              |DJBP;differentiate;$JB$;30| (405 . |inv|) (410 . /)
              (416 . |gcd|) (422 . |content|) (427 . |zero?|) (432 . <)
              (438 . |content|) (443 . |gcd|) (449 . |gcd|)
              (|PolynomialGcdPackage| 9 7 6 $$) (455 . |gcd|) (|Void|)
              (461 . |print|) (|GroebnerPackage| 6 9 7 $$) (466 . |groebner|)
              (471 . |groebner|) (|Union| 170 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 36)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 36 $)
              (|Union| $ '#1#) (|Fraction| 36)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |mat| 171) (|:| |vec| (|Vector| 36))) (|Vector| $)
              (|Matrix| 36) (|Factored| 65) (|Union| 174 '#1#) (|List| 65)
              (|Union| 165 '#2="failed") (|Union| 36 '#2#)
              (|Record| (|:| |var| 7) (|:| |exponent| 18))
              (|Union| 177 '#3="failed") (|Union| 137 '#3#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|Equation| $)
              (|List| 181) (|Mapping| 6 6) (|Mapping| 9 9) (|Matrix| 6)
              (|Record| (|:| |mat| 185) (|:| |vec| (|Vector| 6)))
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 476 |zero?| 482 |variables| 487 |univariate| 492 |unitNormal|
              503 |unitCanonical| 508 |unit?| 513 |totalDegreeSorted| 518
              |totalDegree| 524 |subtractIfCan| 535 |squareFreePolynomial| 541
              |squareFreePart| 546 |squareFree| 551
              |solveLinearPolynomialEquation| 556 |smaller?| 562 |sample| 568
              |retractIfCan| 572 |retract| 592 |resultant| 612 |reductum| 619
              |reducedSystem| 624 |recip| 646 |primitivePart| 651
              |primitiveMonomials| 662 |prime?| 667 |pomopo!| 672
              |patternMatch| 680 |one?| 694 |numberOfMonomials| 699
              |multivariate| 704 |monomials| 716 |monomial?| 721 |monomial| 726
              |monicDivide| 746 |minimumDegree| 753 |mapExponents| 770 |map|
              776 |mainVariable| 782 |leadingMonomial| 787 |leadingCoefficient|
              792 |lcmCoef| 797 |lcm| 803 |latex| 814 |isTimes| 819 |isPlus|
              824 |isExpt| 829 |hashUpdate!| 834 |hash| 840 |ground?| 845
              |ground| 850 |groebner| 855 |gcdPolynomial| 860 |gcd| 866
              |factorSquareFreePolynomial| 877 |factorPolynomial| 882 |factor|
              887 |exquo| 892 |eval| 904 |discriminant| 958 |differentiate| 964
              |degree| 990 |convert| 1007 |content| 1032 |const| 1043
              |conditionP| 1048 |coerce| 1053 |coefficients| 1083 |coefficient|
              1088 |charthRoot| 1108 |characteristic| 1113 |binomThmExpt| 1117
              |associates?| 1124 ^ 1130 |Zero| 1142 |One| 1146 D 1150 = 1176 /
              1182 - 1188 + 1199 * 1205)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 1 0 1 0 5 4 0 6 3 12 23 0 0 23 6 12 13 14
                                  23 6 19 0 0 12 25 0 0 0 0 24 12 12 0 0 0 0 0
                                  0 0 0 7 8 18 0 0 0 0 0 0 0 0 0 0 0 0 25 2 9
                                  10 11 15 16 17))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |FullyLinearlyExplicitRingOver&| |Algebra&| NIL |Algebra&|
                |Algebra&| |PartialDifferentialRing&| NIL NIL |Module&|
                |Module&| NIL NIL |Module&| |EntireRing&| NIL |Ring&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                NIL NIL NIL |Evalable&| |FullyRetractableTo&| |SetCategory&|
                NIL |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|PolynomialCategory| 6 9 7)
                 (|MaybeSkewPolynomialCategory| 6 9 7)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 9) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 9) (|GcdDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|Algebra| 165) (|Algebra| 6)
                 (|PartialDifferentialRing| 7) (|LinearlyExplicitRingOver| 6)
                 (|CommutativeRing|) (|Module| $$) (|Module| 165)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|EntireRing|) (|LinearlyExplicitRingOver| 36) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| 165 165) (|BiModule| $$ $$)
                 (|Rng|) (|LeftModule| 6) (|RightModule| 6) (|LeftModule| $$)
                 (|RightModule| $$) (|LeftModule| 165) (|RightModule| 165)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 36) (|Comparable|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|)
                 (|VariablesCommuteWithCoefficients|) (|RetractableTo| 7)
                 (|InnerEvalable| 7 $$) (|InnerEvalable| 7 6)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 10) (|CommutativeStar|)
                 (|noZeroDivisors|) (|ConvertibleTo| 160) (|ConvertibleTo| 161)
                 (|ConvertibleTo| 159) (|RetractableTo| 165)
                 (|RetractableTo| 36) (|canonicalUnitNormal|))
              (|makeByteWordVec2| 190
                                  '(1 7 10 0 11 2 7 16 0 0 17 1 19 0 18 20 0 7
                                    0 21 0 0 0 22 0 6 0 23 1 9 0 19 24 2 0 0 6
                                    9 25 2 0 0 0 0 26 1 0 9 0 35 2 9 18 0 36 37
                                    0 0 0 38 0 6 0 39 2 19 0 18 18 40 1 0 0 0
                                    41 2 19 18 0 36 42 3 19 18 0 36 18 43 2 18
                                    16 0 0 44 1 6 10 0 47 0 9 0 48 0 10 0 49 2
                                    50 10 0 36 51 1 18 10 0 52 2 10 0 0 0 53 2
                                    6 16 0 0 54 2 10 0 0 0 55 2 50 10 56 0 57 2
                                    10 0 0 0 58 1 60 30 0 61 1 60 6 0 62 1 0 0
                                    6 63 2 45 16 7 0 64 2 60 65 0 7 66 1 67 16
                                    0 68 1 67 60 0 69 1 67 18 0 71 2 0 0 0 0 72
                                    1 67 0 0 73 1 60 0 6 75 0 60 0 77 1 78 16 0
                                    79 1 78 2 0 80 1 78 18 0 82 3 60 0 0 7 18
                                    83 2 60 0 0 0 84 1 78 0 0 85 1 0 6 0 86 0
                                    78 0 90 2 78 0 2 18 91 2 78 0 0 0 92 2 93 0
                                    6 18 94 0 93 0 95 2 93 0 0 0 96 2 0 0 0 18
                                    98 1 93 16 0 100 1 93 6 0 101 1 93 18 0 102
                                    2 0 0 6 0 103 1 93 0 0 104 1 9 19 0 106 2
                                    18 0 0 0 107 3 19 18 108 0 18 109 1 78 18 0
                                    114 2 78 2 0 2 117 1 122 16 0 123 2 7 16 0
                                    0 124 2 122 0 0 125 126 2 122 2 0 127 128 2
                                    78 0 129 0 130 2 18 16 0 0 131 2 45 0 132 0
                                    133 2 45 16 0 0 134 2 45 36 7 0 135 2 122 2
                                    0 36 136 1 78 0 0 139 1 6 0 0 141 2 0 0 0 6
                                    142 2 6 0 0 0 143 1 0 6 0 144 1 6 16 0 145
                                    2 7 16 0 0 146 1 78 2 0 147 2 0 0 0 0 148 2
                                    78 0 0 0 149 2 150 2 2 2 151 1 10 152 0 153
                                    1 154 122 122 155 1 0 137 137 156 2 0 16 0
                                    0 1 1 0 16 0 29 1 0 45 0 46 1 0 93 0 97 2 0
                                    65 0 7 76 1 2 168 0 1 1 2 0 0 1 1 2 16 0 1
                                    2 0 18 0 45 1 1 0 18 0 110 2 0 18 0 45 1 2
                                    0 164 0 0 1 1 1 172 65 1 1 3 0 0 1 1 3 167
                                    0 1 2 1 173 174 65 1 2 18 16 0 0 1 0 0 0 1
                                    1 15 175 0 1 1 16 176 0 1 1 0 30 0 1 1 0 88
                                    0 89 1 15 165 0 1 1 16 36 0 1 1 0 7 0 1 1 0
                                    6 0 74 3 22 0 0 0 7 1 1 0 0 0 41 2 19 169
                                    158 170 1 1 19 171 158 1 1 0 185 158 1 2 0
                                    186 158 170 1 1 0 164 0 1 2 3 0 0 7 1 1 3 0
                                    0 1 1 0 137 0 1 1 1 16 0 1 4 0 0 0 6 9 0 1
                                    3 7 162 0 160 162 1 3 8 163 0 161 163 1 1 0
                                    16 0 1 1 0 18 0 34 2 0 0 93 7 105 2 0 0 65
                                    7 99 1 0 137 0 1 1 0 16 0 33 2 0 0 6 9 25 3
                                    0 0 0 45 112 1 3 0 0 0 7 18 27 3 0 180 0 0
                                    7 1 2 0 112 0 45 116 2 0 18 0 7 115 1 0 9 0
                                    1 2 0 0 184 0 1 2 0 0 183 0 1 1 0 30 0 31 1
                                    0 0 0 1 1 0 6 0 86 2 3 166 0 0 1 2 3 0 0 0
                                    1 1 3 0 137 1 1 0 188 0 1 1 0 179 0 1 1 0
                                    179 0 1 1 0 178 0 1 2 0 190 190 0 1 1 0 189
                                    0 1 1 0 16 0 32 1 0 6 0 1 1 3 137 137 156 2
                                    3 65 65 65 1 2 3 0 0 0 148 1 3 0 137 1 1 1
                                    172 65 1 1 1 172 65 1 1 1 167 0 1 2 2 164 0
                                    0 1 2 2 164 0 6 1 3 0 0 0 45 137 138 3 0 0
                                    0 45 120 121 3 0 0 0 7 0 118 3 0 0 0 137
                                    137 1 3 0 0 0 7 6 119 2 0 0 0 181 1 3 0 0 0
                                    0 0 1 2 0 0 0 182 1 2 22 0 0 7 1 3 0 0 0 45
                                    112 1 2 0 0 0 45 1 3 0 0 0 7 18 1 2 0 0 0 7
                                    140 1 0 9 0 35 2 0 112 0 45 113 2 0 18 0 7
                                    111 1 11 159 0 1 1 9 160 0 1 1 10 161 0 1 1
                                    0 0 60 70 1 0 60 0 81 2 3 0 0 7 1 1 3 6 0
                                    144 1 0 6 0 87 1 27 157 158 1 1 29 0 0 1 1
                                    20 0 165 1 1 0 0 7 28 1 0 0 6 63 1 0 0 36 1
                                    1 0 10 0 59 1 0 120 0 1 2 0 6 0 9 1 3 0 0 0
                                    45 112 1 3 0 0 0 7 18 1 1 28 164 0 1 0 0 18
                                    1 3 26 0 0 0 18 1 2 2 16 0 0 1 2 0 0 0 18
                                    98 2 0 0 0 187 1 0 0 0 38 0 0 0 22 3 0 0 0
                                    45 112 1 2 0 0 0 45 1 3 0 0 0 7 18 1 2 0 0
                                    0 7 1 2 0 16 0 0 1 2 21 0 0 6 142 2 0 0 0 0
                                    1 1 0 0 0 1 2 0 0 0 0 72 2 12 0 0 165 1 2
                                    12 0 165 0 1 2 0 0 0 6 1 2 0 0 6 0 103 2 0
                                    0 0 0 26 2 0 0 36 0 1 2 0 0 18 0 1 2 0 0
                                    187 0 1)))))
           '|lookupComplete|)) 
