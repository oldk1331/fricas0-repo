
(/VERSIONCHECK 2) 

(DEFUN |FSINT;K2KG| (|k| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 19))) (QREFELT $ 22))
    (QREFELT $ 23))
   (QREFELT $ 25))) 

(DEFUN |FSINT;tan2temp| (|k| $)
  (SPADCALL (QREFELT $ 16) (SPADCALL |k| (QREFELT $ 19))
            (SPADCALL |k| (QREFELT $ 26)) (QREFELT $ 27))) 

(DEFUN |FSINT;trans?| (|f| $)
  (SPADCALL (CONS #'|FSINT;trans?!0| $) (SPADCALL |f| (QREFELT $ 32))
            (QREFELT $ 34))) 

(DEFUN |FSINT;trans?!0| (|x1| $)
  (COND
   ((OR (SPADCALL |x1| '|log| (QREFELT $ 29))
        (SPADCALL |x1| '|exp| (QREFELT $ 29)))
    (|spadConstant| $ 30))
   ('T (SPADCALL |x1| '|atan| (QREFELT $ 29))))) 

(DEFUN |FSINT;mkPrimh| (|f| |x| |h| $)
  (PROG (|g|)
    (RETURN
     (SEQ (LETT |g| (SPADCALL |f| |x| (QREFELT $ 36)) |FSINT;mkPrimh|)
          (COND
           (|h|
            (COND
             ((|FSINT;trans?| |g| $) (EXIT (SPADCALL |g| (QREFELT $ 38)))))))
          (EXIT |g|))))) 

(DEFUN |FSINT;rinteg| (|i| |f| |x| |h| $)
  (PROG (|l| #1=#:G141 #2=#:G140)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |i| (QREFELT $ 40)))
        (CONS 0 (SPADCALL |f| |x| (QREFELT $ 41))))
       ('T
        (COND
         ((NULL
           (CDR
            (LETT |l|
                  (PROGN
                   (LETT #2# NIL . #3=(|FSINT;rinteg|))
                   (SEQ (LETT |f| NIL . #3#)
                        (LETT #1# (SPADCALL |i| (QREFELT $ 43)) . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (|FSINT;mkPrimh| |f| |x| |h| $) #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  . #3#)))
          (CONS 0 (|SPADfirst| |l|)))
         ('T (CONS 1 |l|))))))))) 

(DEFUN |FSINT;halfangle| (|a| $)
  (SEQ (LETT |a| (SPADCALL 2 |a| (QREFELT $ 45)) |FSINT;halfangle|)
       (EXIT
        (SPADCALL
         (SPADCALL (|spadConstant| $ 47) (SPADCALL |a| (QREFELT $ 48))
                   (QREFELT $ 49))
         (SPADCALL (|spadConstant| $ 47) (SPADCALL |a| (QREFELT $ 48))
                   (QREFELT $ 50))
         (QREFELT $ 51))))) 

(DEFUN |FSINT;Khalf| (|k| $)
  (PROG (|a|)
    (RETURN
     (SEQ
      (LETT |a|
            (SPADCALL 2 (|SPADfirst| (SPADCALL |k| (QREFELT $ 19)))
                      (QREFELT $ 45))
            |FSINT;Khalf|)
      (EXIT
       (SPADCALL (SPADCALL |a| (QREFELT $ 52))
                 (SPADCALL (|spadConstant| $ 47) (SPADCALL |a| (QREFELT $ 48))
                           (QREFELT $ 50))
                 (QREFELT $ 51))))))) 

(DEFUN |FSINT;find_int| (|i| |t| $)
  (PROG (#1=#:G151 |akl| #2=#:G152 |k| |ii| |k0| |ail|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |ail| (SPADCALL |i| (QREFELT $ 19)) . #3=(|FSINT;find_int|))
            (LETT |k0| (LENGTH |ail|) . #3#)
            (LETT |ii| (SPADCALL |i| (QREFELT $ 53)) . #3#)
            (SEQ (LETT |k| NIL . #3#) (LETT #2# |t| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |k| (QREFELT $ 54)) '|%iint|
                               (QREFELT $ 29))
                     (SEQ (LETT |akl| (SPADCALL |k| (QREFELT $ 19)) . #3#)
                          (EXIT
                           (COND
                            ((SPADCALL (LENGTH |akl|) |k0| (QREFELT $ 55))
                             "iterate")
                            ((SPADCALL
                              (SPADCALL
                               (SPADCALL |ii| (SPADCALL |k| (QREFELT $ 53))
                                         (QREFELT $ 49))
                               (QREFELT $ 57))
                              (|spadConstant| $ 58) (QREFELT $ 59))
                             (PROGN (LETT #1# |k| . #3#) (GO #1#))))))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT |i|)))
      #1# (EXIT #1#))))) 

(DEFUN |FSINT;postSubst| (|f| |lv| |lk| |ltan| |x| $)
  (PROG (#1=#:G177 |k| #2=#:G176 #3=#:G175 #4=#:G174 |ltemp| #5=#:G173
         #6=#:G172 |uk| |tf| |u| #7=#:G170 |v| #8=#:G171)
    (RETURN
     (SEQ
      (SEQ (LETT |k| NIL . #9=(|FSINT;postSubst|)) (LETT #8# |lk| . #9#)
           (LETT |v| NIL . #9#) (LETT #7# |lv| . #9#) G190
           (COND
            ((OR (ATOM #7#) (PROGN (LETT |v| (CAR #7#) . #9#) NIL) (ATOM #8#)
                 (PROGN (LETT |k| (CAR #8#) . #9#) NIL))
             (GO G191)))
           (SEQ (LETT |u| (SPADCALL |v| (QREFELT $ 61)) . #9#)
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (SEQ (LETT |uk| (QCDR |u|) . #9#)
                        (COND
                         ((SPADCALL (SPADCALL |uk| (QREFELT $ 54))
                                    (QREFELT $ 11) (QREFELT $ 62))
                          (LETT |f|
                                (SPADCALL
                                 (SPADCALL |f| |uk|
                                           (SPADCALL |uk| (QREFELT $ 64))
                                           (QREFELT $ 67))
                                 (SPADCALL |uk| (QREFELT $ 53)) (QREFELT $ 68))
                                . #9#)))
                        (COND
                         ((SPADCALL (SPADCALL |uk| (QREFELT $ 54)) '|%iint|
                                    (QREFELT $ 29))
                          (COND
                           ((NULL
                             (SPADCALL |uk|
                                       (LETT |tf| (SPADCALL |f| (QREFELT $ 70))
                                             . #9#)
                                       (QREFELT $ 72)))
                            (LETT |uk| (|FSINT;find_int| |uk| |tf| $)
                                  . #9#)))))
                        (EXIT
                         (LETT |f|
                               (SPADCALL |f| (LIST |uk|)
                                         (LIST (SPADCALL |k| (QREFELT $ 53)))
                                         (QREFELT $ 74))
                               . #9#)))))))
           (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #9#)) . #9#)
           (GO G190) G191 (EXIT NIL))
      (COND
       ((NULL (NULL |ltan|))
        (SEQ
         (LETT |ltemp|
               (PROGN
                (LETT #6# NIL . #9#)
                (SEQ (LETT |k| NIL . #9#) (LETT #5# |ltan| . #9#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |k| (CAR #5#) . #9#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #6# (CONS (|FSINT;tan2temp| |k| $) #6#) . #9#)))
                     (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                     (EXIT (NREVERSE #6#))))
               . #9#)
         (LETT |f|
               (SPADCALL |f| |ltan|
                         (PROGN
                          (LETT #4# NIL . #9#)
                          (SEQ (LETT |k| NIL . #9#) (LETT #3# |ltemp| . #9#)
                               G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |k| (CAR #3#) . #9#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4#
                                       (CONS (SPADCALL |k| (QREFELT $ 53)) #4#)
                                       . #9#)))
                               (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                               (EXIT (NREVERSE #4#))))
                         (QREFELT $ 74))
               . #9#)
         (LETT |f|
               (SPADCALL |f| '|%temptan| 2
                         (CONS (|function| |FSINT;halfangle|) $)
                         (QREFELT $ 76))
               . #9#)
         (EXIT
          (LETT |f|
                (SPADCALL |f| |ltemp|
                          (PROGN
                           (LETT #2# NIL . #9#)
                           (SEQ (LETT |k| NIL . #9#) (LETT #1# |ltemp| . #9#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |k| (CAR #1#) . #9#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2# (CONS (|FSINT;Khalf| |k| $) #2#)
                                        . #9#)))
                                (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 74))
                . #9#)))))
      (LETT |f| (SPADCALL |f| (QREFELT $ 78)) . #9#)
      (LETT |f| (SPADCALL |f| (QREFELT $ 79)) . #9#)
      (EXIT (SPADCALL |f| |x| (QREFELT $ 80))))))) 

(DEFUN |FSINT;inv_lst| (|lt| |le| $)
  (PROG (|rese| |resk| |ie| |ik| |k1| |e1| #1=#:G189 |k| #2=#:G190 |e| |im|)
    (RETURN
     (SEQ (LETT |resk| NIL . #3=(|FSINT;inv_lst|)) (LETT |rese| NIL . #3#)
          (LETT |im|
                (SPADCALL (|spadConstant| $ 81) (|spadConstant| $ 46)
                          (QREFELT $ 83))
                . #3#)
          (SEQ (LETT |e| NIL . #3#) (LETT #2# |le| . #3#) (LETT |k| NIL . #3#)
               (LETT #1# |lt| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL)
                     (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (COND
                 ((NULL (SPADCALL |k| '|atan| (QREFELT $ 85)))
                  (COND
                   ((NULL (SPADCALL |k| '|tan| (QREFELT $ 85)))
                    (EXIT "iterate")))))
                (COND
                 ((SPADCALL |k| '|atan| (QREFELT $ 85))
                  (SEQ
                   (LETT |ik|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 2 |im| (QREFELT $ 86)) |e|
                                     (QREFELT $ 87))
                           (QREFELT $ 88))
                          (QREFELT $ 25))
                         . #3#)
                   (EXIT
                    (LETT |ie|
                          (SPADCALL
                           (SPADCALL (SPADCALL 2 |im| (QREFELT $ 86))
                                     (SPADCALL |k| (QREFELT $ 89))
                                     (QREFELT $ 87))
                           (QREFELT $ 88))
                          . #3#)))))
                (COND
                 ((SPADCALL |k| '|tan| (QREFELT $ 85))
                  (SEQ (LETT |e1| (SPADCALL |im| |e| (QREFELT $ 87)) . #3#)
                       (LETT |k1|
                             (SPADCALL |im| (SPADCALL |k| (QREFELT $ 89))
                                       (QREFELT $ 87))
                             . #3#)
                       (LETT |ik|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |e1| (|spadConstant| $ 90)
                                          (QREFELT $ 91))
                                (SPADCALL |e1| (|spadConstant| $ 90)
                                          (QREFELT $ 92))
                                (QREFELT $ 93))
                               (QREFELT $ 88))
                              (QREFELT $ 25))
                             . #3#)
                       (EXIT
                        (LETT |ie|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |k1| (|spadConstant| $ 90)
                                          (QREFELT $ 91))
                                (SPADCALL |k1| (|spadConstant| $ 90)
                                          (QREFELT $ 92))
                                (QREFELT $ 93))
                               (QREFELT $ 88))
                              . #3#)))))
                (LETT |resk| (CONS |ik| |resk|) . #3#)
                (EXIT (LETT |rese| (CONS |ie| |rese|) . #3#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS (REVERSE |resk|) (REVERSE |rese|))))))) 

(DEFUN |FSINT;goComplex?| (|rt| |l| |ltan| $)
  (COND ((NULL |ltan|) |rt|) ((NULL (CDR (CDR |l|))) 'NIL) ('T 'T))) 

(DEFUN |FSINT;integrate;FSU;12| (|f| |x| $)
  (PROG (#1=#:G232 |h| #2=#:G231 |u| |ovals| |okers| |ltg| |i| |gg| |rtg1|
         |tgg1| #3=#:G230 |k| #4=#:G229 |tgg0| |gg0| |el| |rtg| |tg| #5=#:G228
         #6=#:G227 |g| |rec| |evals| |ekers| |vk| |vu| #7=#:G225 #8=#:G226 |v|
         |etf| #9=#:G224 #10=#:G223 |ht| |ltf| |tf|)
    (RETURN
     (SEQ
      (COND
       ((OR (|HasSignature| (QREFELT $ 6) (LIST '|imaginary| (LIST '$)))
            (|domainEqual| (QREFELT $ 6) (|AlgebraicNumber|)))
        (CONS 0 (SPADCALL |f| |x| (QREFELT $ 95))))
       ((NULL (SPADCALL |f| (QREFELT $ 96)))
        (CONS 0 (SPADCALL |f| |x| (QREFELT $ 95))))
       ('T
        (SEQ
         (LETT |f| (SPADCALL |f| (SPADCALL |x| (QREFELT $ 97)) (QREFELT $ 98))
               . #11=(|FSINT;integrate;FSU;12|))
         (LETT |tf| (SPADCALL |f| (QREFELT $ 70)) . #11#)
         (LETT |ltf|
               (SPADCALL (CONS #'|FSINT;integrate;FSU;12!0| $) |tf|
                         (QREFELT $ 100))
               . #11#)
         (LETT |ht|
               (SPADCALL
                (CONS #'|FSINT;integrate;FSU;12!1| (VECTOR (QREFELT $ 9) $))
                |tf| (QREFELT $ 101))
               . #11#)
         (LETT |etf|
               (PROGN
                (LETT #10# NIL . #11#)
                (SEQ (LETT |k| NIL . #11#) (LETT #9# |tf| . #11#) G190
                     (COND
                      ((OR (ATOM #9#) (PROGN (LETT |k| (CAR #9#) . #11#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #10#
                             (CONS
                              (SPADCALL (SPADCALL |k| (QREFELT $ 53)) |x|
                                        (QREFELT $ 102))
                              #10#)
                             . #11#)))
                     (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                     (EXIT (NREVERSE #10#))))
               . #11#)
         (LETT |ekers| NIL . #11#) (LETT |evals| NIL . #11#)
         (SEQ (LETT |v| NIL . #11#) (LETT #8# |etf| . #11#)
              (LETT |k| NIL . #11#) (LETT #7# |tf| . #11#) G190
              (COND
               ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#) . #11#) NIL)
                    (ATOM #8#) (PROGN (LETT |v| (CAR #8#) . #11#) NIL))
                (GO G191)))
              (SEQ (LETT |vu| (SPADCALL |v| (QREFELT $ 61)) . #11#)
                   (EXIT
                    (COND
                     ((QEQCAR |vu| 0)
                      (SEQ (LETT |vk| (QCDR |vu|) . #11#)
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |vk| (QREFELT $ 54)) '|%iint|
                                        (QREFELT $ 29))
                              (SEQ (LETT |ekers| (CONS |k| |ekers|) . #11#)
                                   (EXIT
                                    (LETT |evals| (CONS |v| |evals|)
                                          . #11#)))))))))))
              (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #11#)) . #11#)
              (GO G190) G191 (EXIT NIL))
         (LETT |rec|
               (SPADCALL (SPADCALL |f| |tf| |etf| (QREFELT $ 74)) |x|
                         (QREFELT $ 104))
               . #11#)
         (LETT |g| (SPADCALL (QVELT |rec| 0) (QREFELT $ 106)) . #11#)
         (LETT |tg|
               (PROGN
                (LETT #6# NIL . #11#)
                (SEQ (LETT |k| NIL . #11#)
                     (LETT #5# (SPADCALL |g| (QREFELT $ 70)) . #11#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |k| (CAR #5#) . #11#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x|
                                   (SPADCALL (SPADCALL |k| (QREFELT $ 53))
                                             (QREFELT $ 108))
                                   (QREFELT $ 109))
                         (LETT #6# (CONS |k| #6#) . #11#)))))
                     (LETT #5# (CDR #5#) . #11#) (GO G190) G191
                     (EXIT (NREVERSE #6#))))
               . #11#)
         (LETT |ltg|
               (SPADCALL (CONS #'|FSINT;integrate;FSU;12!2| $) |tg|
                         (QREFELT $ 100))
               . #11#)
         (LETT |rtg|
               (SPADCALL
                (CONS #'|FSINT;integrate;FSU;12!3| (VECTOR (QREFELT $ 8) $))
                |tg| (QREFELT $ 101))
               . #11#)
         (LETT |el|
               (SPADCALL
                (CONS #'|FSINT;integrate;FSU;12!4| (VECTOR (QREFELT $ 10) $))
                |tg| (QREFELT $ 101))
               . #11#)
         (COND
          ((|FSINT;goComplex?| |rtg| |tg| |ltg| $)
           (SEQ (LETT |gg0| (SPADCALL |g| (QREFELT $ 22)) . #11#)
                (LETT |tgg0| (SPADCALL |gg0| (QREFELT $ 110)) . #11#)
                (LETT |tgg1|
                      (PROGN
                       (LETT #4# NIL . #11#)
                       (SEQ (LETT |k| NIL . #11#) (LETT #3# |tgg0| . #11#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |k| (CAR #3#) . #11#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS
                                     (SPADCALL (SPADCALL |k| (QREFELT $ 89))
                                               NIL (QREFELT $ 112))
                                     #4#)
                                    . #11#)))
                            (LETT #3# (CDR #3#) . #11#) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      . #11#)
                (LETT |rtg1| (|FSINT;inv_lst| |tgg0| |tgg1| $) . #11#)
                (LETT |gg| (SPADCALL |gg0| |tgg0| |tgg1| (QREFELT $ 113))
                      . #11#)
                (EXIT
                 (LETT |i|
                       (SPADCALL
                        (CONS #'|FSINT;integrate;FSU;12!5| (VECTOR $ |rtg1|))
                        (SPADCALL |gg| |x| (QREFELT $ 117)) (QREFELT $ 120))
                       . #11#))))
          (#12='T (LETT |i| (SPADCALL |g| |x| (QREFELT $ 122)) . #11#)))
         (LETT |ltg| (SPADCALL |ltg| |ltf| (QREFELT $ 123)) . #11#)
         (LETT |okers| (SPADCALL (QVELT |rec| 1) |ekers| (QREFELT $ 124))
               . #11#)
         (LETT |ovals| (SPADCALL (QVELT |rec| 2) |evals| (QREFELT $ 125))
               . #11#)
         (LETT |u|
               (|FSINT;rinteg| |i| |f| |x| (COND (|el| |ht|) (#12# 'NIL)) $)
               . #11#)
         (EXIT
          (COND
           ((QEQCAR |u| 0)
            (CONS 0
                  (|FSINT;postSubst| (QCDR |u|) |ovals| |okers| |ltg| |x| $)))
           (#12#
            (CONS 1
                  (PROGN
                   (LETT #2# NIL . #11#)
                   (SEQ (LETT |h| NIL . #11#) (LETT #1# (QCDR |u|) . #11#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |h| (CAR #1#) . #11#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (|FSINT;postSubst| |h| |ovals| |okers| |ltg|
                                  |x| $)
                                 #2#)
                                . #11#)))
                        (LETT #1# (CDR #1#) . #11#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))))))))) 

(DEFUN |FSINT;integrate;FSU;12!5| (|fg| $$)
  (PROG (|rtg1| $)
    (LETT |rtg1| (QREFELT $$ 1) . #1=(|FSINT;integrate;FSU;12|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |fg| (QCAR |rtg1|) (QCDR |rtg1|) (QREFELT $ 113))
                (QREFELT $ 114)))))) 

(DEFUN |FSINT;integrate;FSU;12!4| (|x1| $$)
  (PROG ($ ELEM)
    (LETT $ (QREFELT $$ 1) . #1=(|FSINT;integrate;FSU;12|))
    (LETT ELEM (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |x1| (QREFELT $ 54)) ELEM (QREFELT $ 62)))))) 

(DEFUN |FSINT;integrate;FSU;12!3| (|x1| $$)
  (PROG ($ RTRIG)
    (LETT $ (QREFELT $$ 1) . #1=(|FSINT;integrate;FSU;12|))
    (LETT RTRIG (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |x1| (QREFELT $ 54)) RTRIG (QREFELT $ 62)))))) 

(DEFUN |FSINT;integrate;FSU;12!2| (|x1| $)
  (SPADCALL (SPADCALL |x1| (QREFELT $ 54)) '|tan| (QREFELT $ 29))) 

(DEFUN |FSINT;integrate;FSU;12!1| (|x1| $$)
  (PROG ($ HTRIG)
    (LETT $ (QREFELT $$ 1) . #1=(|FSINT;integrate;FSU;12|))
    (LETT HTRIG (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |x1| (QREFELT $ 54)) HTRIG (QREFELT $ 62)))))) 

(DEFUN |FSINT;integrate;FSU;12!0| (|x1| $)
  (SPADCALL (SPADCALL |x1| (QREFELT $ 54)) '|tan| (QREFELT $ 29))) 

(DECLAIM (NOTINLINE |FunctionSpaceIntegration;|)) 

(DEFUN |FunctionSpaceIntegration| (&REST #1=#:G233)
  (PROG ()
    (RETURN
     (PROG (#2=#:G234)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FunctionSpaceIntegration|)
                                           '|domainEqualList|)
                . #3=(|FunctionSpaceIntegration|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |FunctionSpaceIntegration;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|FunctionSpaceIntegration|))))))))))) 

(DEFUN |FunctionSpaceIntegration;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionSpaceIntegration|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|FunctionSpaceIntegration| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 128) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FunctionSpaceIntegration|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 '|rtrig|)
      (QSETREFV $ 9 '|htrig|)
      (QSETREFV $ 10 '|elem|)
      (QSETREFV $ 11 '|%alg|)
      (QSETREFV $ 16 (SPADCALL '|%temptan| 1 (QREFELT $ 15)))
      $)))) 

(MAKEPROP '|FunctionSpaceIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'RTRIG
              'HTRIG 'ELEM 'ALGOP (|Symbol|) (|NonNegativeInteger|)
              (|BasicOperator|) (0 . |operator|) '|optemp| (|List| 7)
              (|Kernel| 7) (6 . |argument|) (|Expression| 82)
              (|InnerTrigonometricManipulations| 6 7 20) (11 . F2FG)
              (16 . |tan|) (|Kernel| $) (21 . |retract|) (26 . |height|)
              (31 . |kernel|) (|Boolean|) (38 . |is?|) (44 . |true|)
              (|List| 14) (48 . |operators|) (|Mapping| 28 14) (53 . |any?|)
              (|IntegrationTools| 6 7) (59 . |mkPrim|)
              (|TranscendentalManipulations| 6 7) (65 . |htrigs|)
              (|IntegrationResult| 7) (70 . |elem?|) (75 . |integral|)
              (|IntegrationResultToFunction| 6 7) (81 . |expand|)
              (|PositiveInteger|) (86 . *) (92 . |One|) (96 . |One|)
              (100 . |cos|) (105 . -) (111 . +) (117 . /) (123 . |sin|)
              (128 . |coerce|) (133 . |operator|) (138 . ~=)
              (|ElementaryFunctionStructurePackage| 6 7) (144 . |normalize|)
              (149 . |Zero|) (153 . =) (|Union| 24 '"failed")
              (159 . |retractIfCan|) (164 . |has?|)
              (|SparseUnivariatePolynomial| $) (170 . |minPoly|)
              (|SparseUnivariatePolynomial| 7)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 18) 18
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 18)
                                                     7)
              (175 . |univariate|) (182 . |elt|) (|List| 24) (188 . |tower|)
              (|List| 18) (193 . |member?|) (|List| $) (199 . |eval|)
              (|Mapping| $ $) (206 . |eval|) (|TrigonometricManipulations| 6 7)
              (214 . |real|) (219 . |removeSinSq|) (224 . |removeConstantTerm|)
              (230 . |Zero|) (|Complex| 6) (234 . |complex|) (|Kernel| 20)
              (240 . |is?|) (246 . *) (252 . *) (258 . -) (263 . |coerce|)
              (268 . |One|) (272 . +) (278 . -) (284 . /)
              (|FunctionSpaceComplexIntegration| 6 7)
              (290 . |complexIntegrate|) (296 . |real?|) (301 . |coerce|)
              (306 . |distribute|) (|Mapping| 28 18) (312 . |select|)
              (318 . |any?|) (324 . |realLiouvillian|)
              (|Record| (|:| |func| 7) (|:| |kers| 71) (|:| |vals| 17))
              (330 . |rischNormalize|) (|AlgebraicManipulations| 6 7)
              (336 . |rootSimp|) (|List| 12) (341 . |variables|)
              (346 . |member?|) (352 . |tower|) (|List| 84)
              (357 . |trigs2explogs|) (363 . |eval|) (370 . FG2F)
              (|IntegrationResult| 20) (|ElementaryIntegration| 82 20)
              (375 . |lfintegrate|) (|Mapping| 7 20)
              (|IntegrationResultFunctions2| 20 7) (381 . |map|)
              (|ElementaryIntegration| 6 7) (387 . |lfintegrate|)
              (393 . |setDifference|) (399 . |concat|) (405 . |concat|)
              (|Union| 7 17) |FSINT;integrate;FSU;12|)
           '#(|integrate| 411) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 127
                                                 '(2 14 0 12 13 15 1 18 17 0 19
                                                   1 21 20 7 22 1 20 0 0 23 1
                                                   20 24 0 25 1 18 13 0 26 3 18
                                                   0 14 17 13 27 2 14 28 0 12
                                                   29 0 28 0 30 1 7 31 0 32 2
                                                   31 28 33 0 34 2 35 7 7 12 36
                                                   1 37 7 7 38 1 39 28 0 40 2 7
                                                   0 0 12 41 1 42 17 39 43 2 7
                                                   0 44 0 45 0 6 0 46 0 7 0 47
                                                   1 7 0 0 48 2 7 0 0 0 49 2 7
                                                   0 0 0 50 2 7 0 0 0 51 1 7 0
                                                   0 52 1 7 0 24 53 1 18 14 0
                                                   54 2 13 28 0 0 55 1 56 7 7
                                                   57 0 7 0 58 2 7 28 0 0 59 1
                                                   7 60 0 61 2 14 28 0 12 62 1
                                                   7 63 24 64 3 66 65 7 18 65
                                                   67 2 65 7 0 7 68 1 7 69 0 70
                                                   2 71 28 18 0 72 3 7 0 0 69
                                                   73 74 4 7 0 0 12 13 75 76 1
                                                   77 7 7 78 1 37 7 7 79 2 35 7
                                                   7 12 80 0 6 0 81 2 82 0 6 6
                                                   83 2 84 28 0 12 85 2 82 0 44
                                                   0 86 2 20 0 82 0 87 1 20 0 0
                                                   88 1 20 0 24 89 0 20 0 90 2
                                                   20 0 0 0 91 2 20 0 0 0 92 2
                                                   20 0 0 0 93 2 94 7 7 12 95 1
                                                   77 28 7 96 1 7 0 12 97 2 7 0
                                                   0 0 98 2 71 0 99 0 100 2 71
                                                   28 99 0 101 2 56 7 7 12 102
                                                   2 56 103 7 12 104 1 105 7 7
                                                   106 1 7 107 0 108 2 107 28
                                                   12 0 109 1 20 69 0 110 2 21
                                                   20 20 111 112 3 20 0 0 69 73
                                                   113 1 21 7 20 114 2 116 115
                                                   20 12 117 2 119 39 118 115
                                                   120 2 121 39 7 12 122 2 71 0
                                                   0 0 123 2 71 0 0 0 124 2 17
                                                   0 0 0 125 2 0 126 7 12
                                                   127)))))
           '|lookupComplete|)) 
