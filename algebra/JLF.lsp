
(/VERSIONCHECK 2) 

(DEFUN |JLF;statistics;V;1| ($)
  (SEQ
   (SPADCALL
    (SPADCALL "Number of lazy differentiations"
              (SPADCALL (QREFELT $ 8) (QREFELT $ 12)) (QREFELT $ 13))
    (QREFELT $ 15))
   (SPADCALL
    (SPADCALL "Number of subsequent evaluations"
              (SPADCALL (QREFELT $ 9) (QREFELT $ 12)) (QREFELT $ 13))
    (QREFELT $ 15))
   (EXIT (SPADCALL (QREFELT $ 16))))) 

(DEFUN |JLF;emptyDer?| (|der| $)
  (PROG (#1=#:G212)
    (RETURN
     (COND
      ((OR (SPADCALL (QVELT |der| 1) (CONS 1 '|0|) (QREFELT $ 33))
           (QEQCAR (QVELT |der| 2) 1))
       'NIL)
      ('T
       (SPADCALL
        (PROG2 (LETT #1# (QVELT |der| 2) |JLF;emptyDer?|)
            (QCDR #1#)
          (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
        (QREFELT $ 34))))))) 

(DEFUN |JLF;groundFlag?| (|exp| $) (QVELT (SPADCALL |exp| (QREFELT $ 35)) 2)) 

(DEFUN |JLF;extract| (|exp| $)
  (PROG (#1=#:G212)
    (RETURN
     (PROG2
         (LETT #1#
               (QVELT
                (SPADCALL
                 (|SPADfirst| (QVELT (SPADCALL |exp| (QREFELT $ 35)) 5))
                 (QREFELT $ 36))
                3)
               |JLF;extract|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))))) 

(DEFUN |JLF;jetVars| (|f| $)
  (COND ((QEQCAR |f| 0) (SPADCALL (QCDR |f|) (QREFELT $ 38)))
        ('T (SPADCALL (QCDR |f|) (QREFELT $ 39))))) 

(DEFUN |JLF;greater| (|lt1| |lt2| $)
  (SPADCALL (QVELT (SPADCALL |lt1| (QREFELT $ 36)) 0)
            (QVELT (SPADCALL |lt2| (QREFELT $ 36)) 0) (QREFELT $ 40))) 

(DEFUN |JLF;lazyTerm| (|d| $)
  (VECTOR (SPADCALL |d| (QREFELT $ 41)) 'T 'T (CONS 0 |d|)
          (SPADCALL (QREFELT $ 23) (QREFELT $ 27)))) 

(DEFUN |JLF;convert| (|lt| $)
  (PROG (JV)
    (RETURN
     (SEQ
      (LETT JV
            (SPADCALL
             (SPADCALL (ELT $ 40) (|JLF;jetVars| (QVELT |lt| 3) $)
                       (|JLF;jetVars|
                        (QVELT (SPADCALL (QVELT |lt| 4) (QREFELT $ 42)) 2) $)
                       (QREFELT $ 44))
             (QREFELT $ 45))
            |JLF;convert|)
      (EXIT
       (SPADCALL
        (VECTOR (QVELT |lt| 0) (QVELT |lt| 1) (QVELT |lt| 2) NIL JV
                (LIST (SPADCALL |lt| (QREFELT $ 29))))
        (QREFELT $ 46))))))) 

(DEFUN |JLF;adapt| (|rec| |newLazy| $)
  (PROG (|newJV2| |newJV1| |newSharp?| |newLD| |lt|)
    (RETURN
     (SEQ
      (COND ((NULL |newLazy|) (QREFELT $ 30))
            (#1='T
             (SEQ
              (LETT |lt| (SPADCALL (|SPADfirst| |newLazy|) (QREFELT $ 36))
                    . #2=(|JLF;adapt|))
              (LETT |newLD| (QVELT |lt| 0) . #2#)
              (LETT |newSharp?|
                    (COND
                     ((QVELT |lt| 1)
                      (COND ((NULL (CDR |newLazy|)) 'T)
                            (#1#
                             (SPADCALL |newLD|
                                       (QVELT
                                        (SPADCALL
                                         (SPADCALL |newLazy| (QREFELT $ 48))
                                         (QREFELT $ 36))
                                        0)
                                       (QREFELT $ 40)))))
                     (#1# 'NIL))
                    . #2#)
              (LETT |newJV1| (QVELT |rec| 3) . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((NULL |newJV1|) 'NIL)
                            ('T
                             (SPADCALL (|SPADfirst| |newJV1|) |newLD|
                                       (QREFELT $ 40)))))
                     (GO G191)))
                   (SEQ (EXIT (LETT |newJV1| (CDR |newJV1|) . #2#))) NIL
                   (GO G190) G191 (EXIT NIL))
              (LETT |newJV2| (QVELT |rec| 4) . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((NULL |newJV2|) 'NIL)
                            ('T
                             (SPADCALL (|SPADfirst| |newJV2|) |newLD|
                                       (QREFELT $ 40)))))
                     (GO G191)))
                   (SEQ (EXIT (LETT |newJV2| (CDR |newJV2|) . #2#))) NIL
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (VECTOR |newLD| |newSharp?| (QVELT |rec| 2) |newJV1| |newJV2|
                       |newLazy|))))))))) 

(DEFUN |JLF;zeroU?| (|f| $)
  (COND ((QEQCAR |f| 0) (SPADCALL (QCDR |f|) (QREFELT $ 49)))
        ('T (SPADCALL (QCDR |f|) (QREFELT $ 50))))) 

(DEFUN |JLF;oneU?| (|f| $)
  (COND ((QEQCAR |f| 0) (SPADCALL (QCDR |f|) (QREFELT $ 34)))
        ('T (SPADCALL (QCDR |f|) (QREFELT $ 51))))) 

(DEFUN |JLF;minus| (|f| $)
  (PROG (|fs|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |f| 0) (CONS 0 (SPADCALL (QCDR |f|) (QREFELT $ 52))))
            (#1='T
             (SEQ (LETT |fs| (QCDR |f|) |JLF;minus|)
                  (EXIT
                   (COND
                    ((|JLF;groundFlag?| (QCDR |f|) $)
                     (CONS 0 (SPADCALL (|JLF;extract| |fs| $) (QREFELT $ 52))))
                    (#1# (CONS 1 (SPADCALL |fs| (QREFELT $ 53))))))))))))) 

(DEFUN |JLF;mult| (|f| |g| $)
  (PROG (|gs| |fs| |fd|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |f| 0)
        (SEQ (LETT |fd| (QCDR |f|) . #1=(|JLF;mult|))
             (EXIT
              (COND
               ((QEQCAR |g| 0)
                (CONS 0 (SPADCALL |fd| (QCDR |g|) (QREFELT $ 54))))
               (#2='T
                (SEQ (LETT |gs| (QCDR |g|) . #1#)
                     (EXIT
                      (COND
                       ((|JLF;groundFlag?| |gs| $)
                        (CONS 0
                              (SPADCALL |fd| (|JLF;extract| |gs| $)
                                        (QREFELT $ 54))))
                       (#2#
                        (CONS 1 (SPADCALL |fd| |gs| (QREFELT $ 55))))))))))))
       (#2#
        (SEQ (LETT |fs| (QCDR |f|) . #1#)
             (EXIT
              (COND
               ((QEQCAR |g| 0)
                (CONS 1 (SPADCALL (QCDR |g|) |fs| (QREFELT $ 55))))
               (#2#
                (SEQ (LETT |gs| (QCDR |g|) . #1#)
                     (EXIT
                      (COND
                       ((|JLF;groundFlag?| |gs| $)
                        (CONS 1
                              (SPADCALL (|JLF;extract| |gs| $) |fs|
                                        (QREFELT $ 55))))
                       (#2#
                        (CONS 1
                              (SPADCALL |fs| |gs| (QREFELT $ 56))))))))))))))))) 

(DEFUN |JLF;multLazy| (|rlt1| |rlt2| $)
  (PROG (|resDer| |resCoeff| |resEval?| |resSharp?| |resLD| |lt2| |lt1|)
    (RETURN
     (SEQ (LETT |lt1| (SPADCALL |rlt1| (QREFELT $ 36)) . #1=(|JLF;multLazy|))
          (LETT |lt2| (SPADCALL |rlt2| (QREFELT $ 36)) . #1#)
          (COND
           ((SPADCALL (QVELT |lt1| 0) (QVELT |lt2| 0) (QREFELT $ 40))
            (SEQ (LETT |resLD| (QVELT |lt1| 0) . #1#)
                 (EXIT (LETT |resSharp?| (QVELT |lt1| 1) . #1#))))
           ((SPADCALL (QVELT |lt1| 0) (QVELT |lt2| 0) (QREFELT $ 57))
            (SEQ (LETT |resLD| (QVELT |lt2| 0) . #1#)
                 (EXIT (LETT |resSharp?| (QVELT |lt2| 1) . #1#))))
           (#2='T
            (SEQ (LETT |resLD| (QVELT |lt1| 0) . #1#)
                 (EXIT
                  (LETT |resSharp?|
                        (COND ((QVELT |lt1| 1) 'T) (#2# (QVELT |lt2| 1)))
                        . #1#)))))
          (LETT |resEval?| 'NIL . #1#)
          (COND
           ((QVELT |lt1| 2)
            (SEQ
             (LETT |resCoeff| (|JLF;mult| (QVELT |lt1| 3) (QVELT |lt2| 3) $)
                   . #1#)
             (EXIT
              (COND
               ((QVELT |lt2| 2)
                (SEQ
                 (LETT |resDer| (SPADCALL (QREFELT $ 23) (QREFELT $ 27)) . #1#)
                 (EXIT (LETT |resEval?| 'T . #1#))))
               (#2# (LETT |resDer| (QVELT |lt2| 4) . #1#))))))
           ((QVELT |lt2| 2)
            (SEQ
             (LETT |resCoeff| (|JLF;mult| (QVELT |lt1| 3) (QVELT |lt2| 3) $)
                   . #1#)
             (EXIT (LETT |resDer| (QVELT |lt1| 4) . #1#))))
           (#2#
            (SEQ
             (LETT |resCoeff|
                   (|JLF;mult| (CONS 1 (|JLF;convert| |lt1| $)) (QVELT |lt2| 3)
                    $)
                   . #1#)
             (EXIT (LETT |resDer| (QVELT |lt2| 4) . #1#)))))
          (EXIT
           (SPADCALL
            (VECTOR |resLD| |resSharp?| |resEval?| |resCoeff| |resDer|)
            (QREFELT $ 29))))))) 

(DEFUN |JLF;coerce;JB$;15| (|jv| $)
  (SPADCALL
   (VECTOR |jv| 'T 'T (LIST |jv|) NIL
           (LIST
            (SPADCALL
             (VECTOR |jv| 'T 'T (CONS 0 (SPADCALL |jv| (QREFELT $ 58)))
                     (SPADCALL (QREFELT $ 23) (QREFELT $ 27)))
             (QREFELT $ 29))))
   (QREFELT $ 46))) 

(DEFUN |JLF;coerce;D$;16| (|d| $)
  (PROG (JV |ld|)
    (RETURN
     (SEQ (LETT |ld| (SPADCALL |d| (QREFELT $ 41)) . #1=(|JLF;coerce;D$;16|))
          (LETT JV (SPADCALL |d| (QREFELT $ 38)) . #1#)
          (EXIT
           (SPADCALL
            (VECTOR |ld| 'T 'T JV NIL
                    (LIST
                     (SPADCALL
                      (VECTOR |ld| 'T 'T (CONS 0 |d|)
                              (SPADCALL (QREFELT $ 23) (QREFELT $ 27)))
                      (QREFELT $ 29))))
            (QREFELT $ 46))))))) 

(DEFUN |JLF;coerce;$D;17| (|exp| $)
  (SEQ (LETT |exp| (SPADCALL |exp| (QREFELT $ 61)) |JLF;coerce;$D;17|)
       (EXIT (|JLF;extract| |exp| $)))) 

(DEFUN |JLF;printFun| (|fun| $)
  (COND ((QEQCAR |fun| 0) (SPADCALL (QCDR |fun|) (QREFELT $ 63)))
        ('T (SPADCALL (QCDR |fun|) (QREFELT $ 64))))) 

(DEFUN |JLF;printDiff| (|der| $)
  (COND ((QVELT |der| 0) (|JLF;printFun| (QVELT |der| 2) $))
        ('T
         (SPADCALL (SPADCALL "diff" (QREFELT $ 66))
                   (LIST (|JLF;printFun| (QVELT |der| 2) $)
                         (SPADCALL (QVELT |der| 1) (QREFELT $ 67)))
                   (QREFELT $ 69))))) 

(DEFUN |JLF;printLazyTerm| (|lt| $)
  (PROG (|co|)
    (RETURN
     (SEQ
      (COND ((QVELT |lt| 2) (|JLF;printFun| (QVELT |lt| 3) $))
            ('T
             (SEQ (LETT |co| (QVELT |lt| 3) |JLF;printLazyTerm|)
                  (EXIT
                   (SPADCALL (|JLF;printFun| |co| $)
                             (|JLF;printDiff|
                              (SPADCALL (QVELT |lt| 4) (QREFELT $ 42)) $)
                             (QREFELT $ 70)))))))))) 

(DEFUN |JLF;printLazy| (|llt| $)
  (COND
   ((EQL (LENGTH |llt|) 1)
    (|JLF;printLazyTerm| (SPADCALL (|SPADfirst| |llt|) (QREFELT $ 36)) $))
   ('T
    (SPADCALL
     (|JLF;printLazyTerm| (SPADCALL (|SPADfirst| |llt|) (QREFELT $ 36)) $)
     (|JLF;printLazy| (CDR |llt|) $) (QREFELT $ 71))))) 

(DEFUN |JLF;coerce;$Of;22| (|exp| $)
  (COND
   ((|JLF;groundFlag?| |exp| $)
    (SPADCALL (|JLF;extract| |exp| $) (QREFELT $ 63)))
   ('T (|JLF;printLazy| (QVELT (SPADCALL |exp| (QREFELT $ 35)) 5) $)))) 

(DEFUN |JLF;collect;2$;23| (|exp| $)
  (PROG (|rec| |newLazy| |res| |co| #1=#:G213 |newSharp?| |newLD| |newCoeff|
         |newEval?| |d| #2=#:G212 |prod| |der| |lt| #3=#:G301 |rlt|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL |exp| (QREFELT $ 35)) . #4=(|JLF;collect;2$;23|))
      (EXIT
       (COND
        ((NULL (QVELT |rec| 5))
         (SEQ (SPADCALL |exp| (QREFELT $ 30) (QREFELT $ 72)) (EXIT |exp|)))
        ('T
         (SEQ (LETT |d| (|spadConstant| $ 25) . #4#) (LETT |res| 'T . #4#)
              (LETT |newLazy| NIL . #4#)
              (SEQ (LETT |rlt| NIL . #4#) (LETT #3# (QVELT |rec| 5) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |rlt| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |lt| (SPADCALL |rlt| (QREFELT $ 36)) . #4#)
                        (EXIT
                         (COND
                          ((QVELT |lt| 2)
                           (LETT |d|
                                 (SPADCALL |d|
                                           (PROG2
                                               (LETT #2# (QVELT |lt| 3) . #4#)
                                               (QCDR #2#)
                                             (|check_union| (QEQCAR #2# 0)
                                                            (QREFELT $ 7) #2#))
                                           (QREFELT $ 74))
                                 . #4#))
                          ('T
                           (SEQ
                            (LETT |der|
                                  (SPADCALL (QVELT |lt| 4) (QREFELT $ 42))
                                  . #4#)
                            (EXIT
                             (COND
                              ((QVELT |der| 0)
                               (SEQ
                                (COND
                                 ((|JLF;emptyDer?| |der| $)
                                  (LETT |prod| (QVELT |lt| 3) . #4#))
                                 ('T
                                  (LETT |prod|
                                        (|JLF;mult| (QVELT |der| 2)
                                         (QVELT |lt| 3) $)
                                        . #4#)))
                                (COND
                                 ((OR (QEQCAR |prod| 0)
                                      (SPADCALL (QCDR |prod|) (QREFELT $ 75)))
                                  (SEQ
                                   (COND
                                    ((QEQCAR |prod| 0)
                                     (LETT |newCoeff| |prod| . #4#))
                                    ('T
                                     (LETT |newCoeff|
                                           (CONS 0
                                                 (|JLF;extract| (QCDR |prod|)
                                                  $))
                                           . #4#)))
                                   (LETT |newEval?| 'T . #4#)
                                   (LETT |newLD|
                                         (SPADCALL
                                          (PROG2 (LETT #2# |newCoeff| . #4#)
                                              (QCDR #2#)
                                            (|check_union| (QEQCAR #2# 0)
                                                           (QREFELT $ 7) #2#))
                                          (QREFELT $ 41))
                                         . #4#)
                                   (LETT |newSharp?| 'T . #4#)
                                   (EXIT
                                    (LETT |d|
                                          (SPADCALL |d|
                                                    (PROG2
                                                        (LETT #2# |newCoeff|
                                                              . #4#)
                                                        (QCDR #2#)
                                                      (|check_union|
                                                       (QEQCAR #2# 0)
                                                       (QREFELT $ 7) #2#))
                                                    (QREFELT $ 74))
                                          . #4#))))
                                 ('T
                                  (SEQ (LETT |newEval?| 'NIL . #4#)
                                       (LETT |newCoeff| |prod| . #4#)
                                       (LETT |newLD| (QVELT |lt| 0) . #4#)
                                       (LETT |newSharp?| (QVELT |lt| 1) . #4#)
                                       (EXIT (LETT |res| 'NIL . #4#)))))
                                (SPADCALL |rlt|
                                          (VECTOR |newLD| |newSharp?|
                                                  |newEval?| |newCoeff|
                                                  (SPADCALL (QREFELT $ 23)
                                                            (QREFELT $ 27)))
                                          (QREFELT $ 76))
                                (EXIT
                                 (COND
                                  ((NULL |newEval?|)
                                   (LETT |newLazy|
                                         (APPEND |newLazy| (LIST |rlt|))
                                         . #4#))))))
                              ((QEQCAR (QVELT |lt| 3) 1)
                               (COND
                                ((SPADCALL
                                  (PROG2 (LETT #1# (QVELT |lt| 3) . #4#)
                                      (QCDR #1#)
                                    (|check_union| (QEQCAR #1# 1) $ #1#))
                                  (QREFELT $ 75))
                                 (SEQ
                                  (LETT |co|
                                        (|JLF;extract|
                                         (PROG2 (LETT #1# (QVELT |lt| 3) . #4#)
                                             (QCDR #1#)
                                           (|check_union| (QEQCAR #1# 1) $
                                                          #1#))
                                         $)
                                        . #4#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL |co| (QREFELT $ 49))
                                     (SPADCALL |rlt|
                                               (|JLF;lazyTerm|
                                                (|spadConstant| $ 25) $)
                                               (QREFELT $ 76)))
                                    ('T
                                     (SEQ (QSETVELT |lt| 3 (CONS 0 |co|))
                                          (SPADCALL |rlt| |lt| (QREFELT $ 76))
                                          (LETT |res| 'NIL . #4#)
                                          (EXIT
                                           (LETT |newLazy|
                                                 (APPEND |newLazy|
                                                         (LIST |rlt|))
                                                 . #4#))))))))
                                ('T
                                 (SEQ (LETT |res| 'NIL . #4#)
                                      (EXIT
                                       (LETT |newLazy|
                                             (APPEND |newLazy| (LIST |rlt|))
                                             . #4#))))))
                              ('T
                               (SEQ (LETT |res| 'NIL . #4#)
                                    (EXIT
                                     (LETT |newLazy|
                                           (APPEND |newLazy| (LIST |rlt|))
                                           . #4#)))))))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL (SPADCALL |d| (QREFELT $ 49)))
                (LETT |newLazy|
                      (SPADCALL (CONS (|function| |JLF;greater|) $) |newLazy|
                                (LIST
                                 (SPADCALL (|JLF;lazyTerm| |d| $)
                                           (QREFELT $ 29)))
                                (QREFELT $ 78))
                      . #4#)))
              (LETT |rec| (|JLF;adapt| |rec| |newLazy| $) . #4#)
              (QSETVELT |rec| 2 |res|) (SPADCALL |exp| |rec| (QREFELT $ 72))
              (EXIT |exp|))))))))) 

(DEFUN |JLF;ground?;$B;24| (|exp| $)
  (|JLF;groundFlag?| (SPADCALL |exp| (QREFELT $ 79)) $)) 

(DEFUN |JLF;evalDeriv| (|rder| $)
  (PROG (|dfun| #1=#:G210 #2=#:G209 |fun| #3=#:G213 #4=#:G212 |der|)
    (RETURN
     (SEQ (LETT |der| (SPADCALL |rder| (QREFELT $ 42)) . #5=(|JLF;evalDeriv|))
          (EXIT
           (COND ((QVELT |der| 0) |rder|)
                 (#6='T
                  (SEQ
                   (COND
                    ((|JLF;zeroU?| (QVELT |der| 2) $)
                     (LETT |dfun| (|spadConstant| $ 25) . #5#))
                    (#6#
                     (SEQ
                      (LETT |fun|
                            (COND
                             ((QEQCAR (QVELT |der| 2) 0)
                              (PROG2 (LETT #4# (QVELT |der| 2) . #5#)
                                  (QCDR #4#)
                                (|check_union| (QEQCAR #4# 0) (QREFELT $ 7)
                                               #4#)))
                             (#6#
                              (SPADCALL
                               (PROG2 (LETT #3# (QVELT |der| 2) . #5#)
                                   (QCDR #3#)
                                 (|check_union| (QEQCAR #3# 1) $ #3#))
                               (QREFELT $ 62))))
                            . #5#)
                      (SETELT $ 9 (+ (QREFELT $ 9) 1))
                      (EXIT
                       (LETT |dfun|
                             (COND
                              ((QEQCAR (QVELT |der| 1) 0)
                               (SPADCALL |fun|
                                         (PROG2
                                             (LETT #2# (QVELT |der| 1) . #5#)
                                             (QCDR #2#)
                                           (|check_union| (QEQCAR #2# 0)
                                                          (QREFELT $ 6) #2#))
                                         (QREFELT $ 81)))
                              (#6#
                               (SPADCALL |fun|
                                         (PROG2
                                             (LETT #1# (QVELT |der| 1) . #5#)
                                             (QCDR #1#)
                                           (|check_union| (QEQCAR #1# 1)
                                                          (|Symbol|) #1#))
                                         (QREFELT $ 83))))
                             . #5#)))))
                   (SPADCALL |rder| (VECTOR 'T (CONS 1 '|0|) (CONS 0 |dfun|))
                             (QREFELT $ 84))
                   (EXIT |rder|))))))))) 

(DEFUN |JLF;evalTerm| (|rlt| $)
  (PROG (|res| #1=#:G212 |co| #2=#:G213 |lt|)
    (RETURN
     (SEQ (LETT |lt| (SPADCALL |rlt| (QREFELT $ 36)) . #3=(|JLF;evalTerm|))
          (EXIT
           (COND ((QVELT |lt| 2) |rlt|)
                 (#4='T
                  (SEQ
                   (LETT |co|
                         (COND
                          ((QEQCAR (QVELT |lt| 3) 0)
                           (PROG2 (LETT #1# (QVELT |lt| 3) . #3#)
                               (QCDR #1#)
                             (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#)))
                          (#4#
                           (SPADCALL
                            (PROG2 (LETT #2# (QVELT |lt| 3) . #3#)
                                (QCDR #2#)
                              (|check_union| (QEQCAR #2# 1) $ #2#))
                            (QREFELT $ 62))))
                         . #3#)
                   (EXIT
                    (COND
                     ((SPADCALL |co| (QREFELT $ 49))
                      (SEQ
                       (SPADCALL |rlt| (|JLF;lazyTerm| (|spadConstant| $ 25) $)
                                 (QREFELT $ 76))
                       (EXIT |rlt|)))
                     (#4#
                      (SEQ
                       (LETT |res|
                             (SPADCALL |co|
                                       (PROG2
                                           (LETT #1#
                                                 (QVELT
                                                  (SPADCALL
                                                   (|JLF;evalDeriv|
                                                    (QVELT |lt| 4) $)
                                                   (QREFELT $ 42))
                                                  2)
                                                 . #3#)
                                           (QCDR #1#)
                                         (|check_union| (QEQCAR #1# 0)
                                                        (QREFELT $ 7) #1#))
                                       (QREFELT $ 54))
                             . #3#)
                       (SPADCALL |rlt| (|JLF;lazyTerm| |res| $) (QREFELT $ 76))
                       (EXIT |rlt|))))))))))))) 

(DEFUN |JLF;eval1;2$;27| (|exp| $)
  (PROG (|lazy| |ld| |rlt| |d| |co| #1=#:G212 |rco| #2=#:G329 #3=#:G330 |rec|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |rec| (SPADCALL |exp| (QREFELT $ 35)) . #4=(|JLF;eval1;2$;27|))
        (EXIT
         (COND ((QVELT |rec| 2) |exp|)
               (#5='T
                (SEQ (LETT |lazy| (QVELT |rec| 5) . #4#)
                     (EXIT
                      (COND
                       ((NULL |lazy|)
                        (SEQ (SPADCALL |exp| (QREFELT $ 30) (QREFELT $ 72))
                             (EXIT |exp|)))
                       (#5#
                        (SEQ (LETT |rlt| (|SPADfirst| |lazy|) . #4#)
                             (LETT |rco| (SPADCALL |rlt| (QREFELT $ 36)) . #4#)
                             (LETT |d| (|spadConstant| $ 25) . #4#)
                             (LETT |ld| (QVELT |rco| 0) . #4#)
                             (SEQ (LETT #3# NIL . #4#) G190
                                  (COND (#3# (GO G191)))
                                  (SEQ
                                   (SEQ G190
                                        (COND
                                         ((NULL (QVELT |rco| 2)) (GO G191)))
                                        (SEQ
                                         (LETT |d|
                                               (SPADCALL |d|
                                                         (PROG2
                                                             (LETT #1#
                                                                   (QVELT |rco|
                                                                          3)
                                                                   . #4#)
                                                             (QCDR #1#)
                                                           (|check_union|
                                                            (QEQCAR #1# 0)
                                                            (QREFELT $ 7) #1#))
                                                         (QREFELT $ 74))
                                               . #4#)
                                         (LETT |lazy| (CDR |lazy|) . #4#)
                                         (EXIT
                                          (COND
                                           ((NULL |lazy|)
                                            (PROGN
                                             (LETT #2#
                                                   (SPADCALL |d|
                                                             (QREFELT $ 60))
                                                   . #4#)
                                             (GO #2#)))
                                           ('T
                                            (SEQ
                                             (LETT |rlt| (|SPADfirst| |lazy|)
                                                   . #4#)
                                             (EXIT
                                              (LETT |rco|
                                                    (SPADCALL |rlt|
                                                              (QREFELT $ 36))
                                                    . #4#)))))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (LETT |lazy| (CDR |lazy|) . #4#)
                                   (LETT |co|
                                         (PROG2
                                             (LETT #1#
                                                   (QVELT
                                                    (SPADCALL
                                                     (|JLF;evalTerm| |rlt| $)
                                                     (QREFELT $ 36))
                                                    3)
                                                   . #4#)
                                             (QCDR #1#)
                                           (|check_union| (QEQCAR #1# 0)
                                                          (QREFELT $ 7) #1#))
                                         . #4#)
                                   (LETT |d| (SPADCALL |d| |co| (QREFELT $ 74))
                                         . #4#)
                                   (LETT |rlt|
                                         (SPADCALL (|JLF;lazyTerm| |d| $)
                                                   (QREFELT $ 29))
                                         . #4#)
                                   (EXIT
                                    (LETT |ld|
                                          (QVELT
                                           (SPADCALL |rlt| (QREFELT $ 36)) 0)
                                          . #4#)))
                                  (LETT #3#
                                        (COND ((NULL |lazy|) 'T)
                                              (#5#
                                               (SPADCALL
                                                (QVELT
                                                 (SPADCALL (|SPADfirst| |lazy|)
                                                           (QREFELT $ 36))
                                                 0)
                                                |ld| (QREFELT $ 57))))
                                        . #4#)
                                  (GO G190) G191 (EXIT NIL))
                             (COND
                              ((NULL (SPADCALL |d| (QREFELT $ 49)))
                               (LETT |lazy|
                                     (SPADCALL
                                      (CONS (|function| |JLF;greater|) $)
                                      |lazy| (LIST |rlt|) (QREFELT $ 78))
                                     . #4#)))
                             (SPADCALL |exp| (|JLF;adapt| |rec| |lazy| $)
                                       (QREFELT $ 72))
                             (EXIT |exp|)))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |JLF;eval;2$;28| (|exp| $)
  (SEQ
   (SEQ G190
        (COND
         ((NULL (COND ((SPADCALL |exp| (QREFELT $ 75)) 'NIL) ('T 'T)))
          (GO G191)))
        (SEQ
         (EXIT (LETT |exp| (SPADCALL |exp| (QREFELT $ 85)) |JLF;eval;2$;28|)))
        NIL (GO G190) G191 (EXIT NIL))
   (EXIT |exp|))) 

(DEFUN |JLF;Zero;$;29| ($) (SPADCALL (QREFELT $ 30) (QREFELT $ 46))) 

(DEFUN |JLF;One;$;30| ($)
  (SPADCALL
   (VECTOR (SPADCALL (QREFELT $ 24)) 'T 'T NIL NIL
           (LIST
            (SPADCALL
             (VECTOR (SPADCALL (QREFELT $ 24)) 'T 'T
                     (CONS 0 (|spadConstant| $ 22))
                     (SPADCALL (QREFELT $ 23) (QREFELT $ 27)))
             (QREFELT $ 29))))
   (QREFELT $ 46))) 

(DEFUN |JLF;zero?;$B;31| (|exp| $)
  (PROG (|ld|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |exp| (QREFELT $ 75))
        (SPADCALL (|JLF;extract| |exp| $) (QREFELT $ 49)))
       (#1='T
        (SEQ (LETT |ld| (SPADCALL |exp| (QREFELT $ 87)) |JLF;zero?;$B;31|)
             (EXIT
              (COND
               ((EQUAL (SPADCALL |ld| (QREFELT $ 88)) '|Const|)
                (SPADCALL (|JLF;extract| (SPADCALL |exp| (QREFELT $ 61)) $)
                          (QREFELT $ 49)))
               (#1# 'NIL)))))))))) 

(DEFUN |JLF;eqRep?;2$B;32| (|x| |y| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 35)) (SPADCALL |y| (QREFELT $ 35))
            (QREFELT $ 89))) 

(DEFUN |JLF;=;2$B;33| (|x| |y| $)
  (COND ((SPADCALL |x| |y| (QREFELT $ 90)) 'T)
        ('T (SPADCALL (SPADCALL |x| |y| (QREFELT $ 91)) (QREFELT $ 50))))) 

(DEFUN |JLF;one?;$B;34| (|exp| $)
  (PROG (|ld|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |exp| (QREFELT $ 75))
        (SPADCALL (|JLF;extract| |exp| $) (QREFELT $ 34)))
       (#1='T
        (SEQ (LETT |ld| (SPADCALL |exp| (QREFELT $ 87)) |JLF;one?;$B;34|)
             (EXIT
              (COND
               ((EQUAL (SPADCALL |ld| (QREFELT $ 88)) '|Const|)
                (SPADCALL (|JLF;extract| (SPADCALL |exp| (QREFELT $ 61)) $)
                          (QREFELT $ 34)))
               (#1# 'NIL)))))))))) 

(PUT '|JLF;numerator;2$;35| '|SPADreplace| '(XLAM (|exp|) |exp|)) 

(DEFUN |JLF;numerator;2$;35| (|exp| $) |exp|) 

(DEFUN |JLF;denominator;2$;36| (|exp| $) (|spadConstant| $ 80)) 

(DEFUN |JLF;-;2$;37| (|x| $)
  (PROG (|resLazy| |lt| #1=#:G361 |rlt| #2=#:G360 |rec|)
    (RETURN
     (SEQ (LETT |rec| (SPADCALL |x| (QREFELT $ 35)) . #3=(|JLF;-;2$;37|))
          (LETT |resLazy|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |rlt| NIL . #3#) (LETT #1# (QVELT |rec| 5) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |rlt| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SEQ
                                (LETT |lt| (SPADCALL |rlt| (QREFELT $ 36))
                                      . #3#)
                                (EXIT
                                 (SPADCALL
                                  (VECTOR (QVELT |lt| 0) (QVELT |lt| 1)
                                          (QVELT |lt| 2)
                                          (|JLF;minus| (QVELT |lt| 3) $)
                                          (QVELT |lt| 4))
                                  (QREFELT $ 29))))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (SPADCALL
            (VECTOR (QVELT |rec| 0) (QVELT |rec| 1) (QVELT |rec| 2)
                    (QVELT |rec| 3) (QVELT |rec| 4) |resLazy|)
            (QREFELT $ 46))))))) 

(DEFUN |JLF;+;3$;38| (|x| |y| $)
  (PROG (|resJV2| |resJV1| |yJV| |xJV| |resSharp?| |resLD| |resLazy| |yrec|
         |xrec|)
    (RETURN
     (SEQ (LETT |xrec| (SPADCALL |x| (QREFELT $ 35)) . #1=(|JLF;+;3$;38|))
          (LETT |yrec| (SPADCALL |y| (QREFELT $ 35)) . #1#)
          (LETT |resLazy|
                (SPADCALL (CONS (|function| |JLF;greater|) $) (QVELT |xrec| 5)
                          (QVELT |yrec| 5) (QREFELT $ 78))
                . #1#)
          (COND
           ((SPADCALL (QVELT |xrec| 0) (QVELT |yrec| 0) (QREFELT $ 40))
            (SEQ (LETT |resLD| (QVELT |xrec| 0) . #1#)
                 (EXIT (LETT |resSharp?| (QVELT |xrec| 1) . #1#))))
           ((SPADCALL (QVELT |yrec| 0) (QVELT |xrec| 0) (QREFELT $ 40))
            (SEQ (LETT |resLD| (QVELT |yrec| 0) . #1#)
                 (EXIT (LETT |resSharp?| (QVELT |yrec| 1) . #1#))))
           ('T
            (SEQ (LETT |resLD| (QVELT |xrec| 0) . #1#)
                 (EXIT (LETT |resSharp?| 'NIL . #1#)))))
          (LETT |xJV|
                (SPADCALL (APPEND (QVELT |xrec| 3) (QVELT |xrec| 4))
                          (QREFELT $ 45))
                . #1#)
          (LETT |yJV|
                (SPADCALL (APPEND (QVELT |yrec| 3) (QVELT |yrec| 4))
                          (QREFELT $ 45))
                . #1#)
          (LETT |resJV1|
                (SPADCALL (ELT $ 40)
                          (SPADCALL
                           (SPADCALL (QVELT |xrec| 3) |yJV| (QREFELT $ 95))
                           (SPADCALL (QVELT |yrec| 3) |xJV| (QREFELT $ 95))
                           (QREFELT $ 96))
                          (QREFELT $ 97))
                . #1#)
          (LETT |resJV2|
                (SPADCALL (ELT $ 40)
                          (SPADCALL (SPADCALL |xJV| |yJV| (QREFELT $ 96))
                                    |resJV1| (QREFELT $ 95))
                          (QREFELT $ 97))
                . #1#)
          (EXIT
           (SPADCALL
            (VECTOR |resLD| |resSharp?| 'NIL |resJV1| |resJV2| |resLazy|)
            (QREFELT $ 46))))))) 

(DEFUN |JLF;*;I2$;39| (|i| |x| $)
  (PROG (|resLazy| |lt| #1=#:G380 |rlt| |rec|)
    (RETURN
     (SEQ (LETT |rec| (SPADCALL |x| (QREFELT $ 35)) . #2=(|JLF;*;I2$;39|))
          (LETT |resLazy| NIL . #2#)
          (SEQ (LETT |rlt| NIL . #2#) (LETT #1# (QVELT |rec| 5) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |rlt| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |lt| (SPADCALL |rlt| (QREFELT $ 36)) . #2#)
                    (EXIT
                     (LETT |resLazy|
                           (SPADCALL |resLazy|
                                     (LIST
                                      (SPADCALL
                                       (VECTOR (QVELT |lt| 0) (QVELT |lt| 1)
                                               (QVELT |lt| 2)
                                               (|JLF;mult|
                                                (CONS 0
                                                      (SPADCALL |i|
                                                                (QREFELT $
                                                                         100)))
                                                (QVELT |lt| 3) $)
                                               (QVELT |lt| 4))
                                       (QREFELT $ 29)))
                                     (QREFELT $ 101))
                           . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (VECTOR (QVELT |rec| 0) (QVELT |rec| 1) (QVELT |rec| 2)
                    (QVELT |rec| 3) (QVELT |rec| 4) |resLazy|)
            (QREFELT $ 46))))))) 

(DEFUN |JLF;*;D2$;40| (|d| |x| $)
  (SPADCALL (SPADCALL |d| (QREFELT $ 60)) |x| (QREFELT $ 56))) 

(DEFUN |JLF;*;3$;41| (|x| |y| $)
  (PROG (|resSharp?| |resLD| |resJV2| |resJV1| |resLazy| #1=#:G397 |ylt|
         #2=#:G396 |xlt| |yrec| |xrec|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |x| (|spadConstant| $ 86) (QREFELT $ 90))
            (SPADCALL |y| (|spadConstant| $ 86) (QREFELT $ 90)))
        (|spadConstant| $ 86))
       ('T
        (SEQ
         (COND
          ((SPADCALL |x| (QREFELT $ 75))
           (COND
            ((SPADCALL |y| (QREFELT $ 75))
             (EXIT
              (SPADCALL
               (SPADCALL (|JLF;extract| |x| $) (|JLF;extract| |y| $)
                         (QREFELT $ 54))
               (QREFELT $ 60)))))))
         (LETT |xrec| (SPADCALL |x| (QREFELT $ 35)) . #3=(|JLF;*;3$;41|))
         (LETT |yrec| (SPADCALL |y| (QREFELT $ 35)) . #3#)
         (LETT |resLazy| NIL . #3#)
         (SEQ (LETT |xlt| NIL . #3#) (LETT #2# (QVELT |xrec| 5) . #3#) G190
              (COND
               ((OR (ATOM #2#) (PROGN (LETT |xlt| (CAR #2#) . #3#) NIL))
                (GO G191)))
              (SEQ
               (SEQ (LETT |ylt| NIL . #3#) (LETT #1# (QVELT |yrec| 5) . #3#)
                    G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |ylt| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT |resLazy|
                            (SPADCALL (CONS (|function| |JLF;greater|) $)
                                      |resLazy|
                                      (LIST (|JLF;multLazy| |xlt| |ylt| $))
                                      (QREFELT $ 78))
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
               (LETT |resJV1|
                     (SPADCALL (APPEND (QVELT |xrec| 3) (QVELT |yrec| 3))
                               (QREFELT $ 45))
                     . #3#)
               (EXIT
                (LETT |resJV2|
                      (SPADCALL (APPEND (QVELT |xrec| 4) (QVELT |yrec| 4))
                                (QREFELT $ 45))
                      . #3#)))
              (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
         (COND
          ((OR (SPADCALL (QVELT |xrec| 0) (QVELT |yrec| 0) (QREFELT $ 40))
               (NULL
                (SPADCALL (QVELT |yrec| 0) (QVELT |xrec| 0) (QREFELT $ 40))))
           (LETT |resLD| (QVELT |xrec| 0) . #3#))
          ('T (LETT |resLD| (QVELT |yrec| 0) . #3#)))
         (LETT |resSharp?| (COND ((QVELT |xrec| 1) (QVELT |yrec| 1)) ('T 'NIL))
               . #3#)
         (EXIT
          (SPADCALL
           (VECTOR |resLD| |resSharp?| 'NIL |resJV1| |resJV2| |resLazy|)
           (QREFELT $ 46)))))))))) 

(DEFUN |JLF;recip;$U;42| (|exp| $)
  (PROG (|rd|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |exp| (QREFELT $ 75))
        (SEQ
         (LETT |rd| (SPADCALL (|JLF;extract| |exp| $) (QREFELT $ 104))
               |JLF;recip;$U;42|)
         (EXIT
          (COND ((QEQCAR |rd| 1) (CONS 1 "failed"))
                (#1='T (CONS 0 (SPADCALL (QCDR |rd|) (QREFELT $ 60))))))))
       (#1# (CONS 1 "failed"))))))) 

(DEFUN |JLF;const?;$B;43| (|exp| $)
  (PROG (|rec|)
    (RETURN
     (SEQ (LETT |rec| (SPADCALL |exp| (QREFELT $ 35)) |JLF;const?;$B;43|)
          (EXIT
           (COND
            ((NULL (QVELT |rec| 3))
             (SPADCALL (SPADCALL |exp| (QREFELT $ 62)) (QREFELT $ 106)))
            ('T 'NIL))))))) 

(DEFUN |JLF;order;$Nni;44| (|exp| $)
  (SPADCALL (SPADCALL |exp| (QREFELT $ 87)) (QREFELT $ 108))) 

(DEFUN |JLF;class;$Nni;45| (|exp| $)
  (SPADCALL (SPADCALL |exp| (QREFELT $ 87)) (QREFELT $ 110))) 

(DEFUN |JLF;jetVariables;$L;46| (|exp| $)
  (PROG (|rec|)
    (RETURN
     (SEQ (LETT |rec| (SPADCALL |exp| (QREFELT $ 35)) |JLF;jetVariables;$L;46|)
          (EXIT
           (SPADCALL (ELT $ 40) (QVELT |rec| 3) (QVELT |rec| 4)
                     (QREFELT $ 44))))))) 

(DEFUN |JLF;differentiate;$JB$;47| (|exp| |jv| $)
  (PROG (|newJV| |ld| |rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL |exp| (QREFELT $ 35))
            . #1=(|JLF;differentiate;$JB$;47|))
      (LETT |ld| (QVELT |rec| 0) . #1#)
      (EXIT
       (COND ((SPADCALL |jv| |ld| (QREFELT $ 40)) (|spadConstant| $ 86))
             ('T
              (SEQ
               (LETT |newJV|
                     (SPADCALL
                      (SPADCALL (ELT $ 40) (QVELT |rec| 3) (QVELT |rec| 4)
                                (QREFELT $ 44))
                      (QREFELT $ 45))
                     . #1#)
               (COND
                ((NULL (SPADCALL |jv| |newJV| (QREFELT $ 112)))
                 (EXIT (|spadConstant| $ 86))))
               (SETELT $ 8 (+ (QREFELT $ 8) 1))
               (EXIT
                (SPADCALL
                 (VECTOR |ld| 'NIL 'NIL NIL |newJV|
                         (LIST
                          (SPADCALL
                           (VECTOR |ld| 'NIL 'NIL
                                   (CONS 0 (|spadConstant| $ 22))
                                   (SPADCALL
                                    (VECTOR 'NIL (CONS 0 |jv|) (CONS 1 |exp|))
                                    (QREFELT $ 27)))
                           (QREFELT $ 29))))
                 (QREFELT $ 46))))))))))) 

(DEFUN |JLF;differentiate;$S$;48| (|exp| |x| $)
  (PROG (|newJV| |ld| |rec|)
    (RETURN
     (SEQ (SETELT $ 8 (+ (QREFELT $ 8) 1))
          (LETT |rec| (SPADCALL |exp| (QREFELT $ 35))
                . #1=(|JLF;differentiate;$S$;48|))
          (LETT |ld| (QVELT |rec| 0) . #1#)
          (LETT |newJV|
                (SPADCALL
                 (SPADCALL (ELT $ 40) (QVELT |rec| 3) (QVELT |rec| 4)
                           (QREFELT $ 44))
                 (QREFELT $ 45))
                . #1#)
          (EXIT
           (SPADCALL
            (VECTOR |ld| 'NIL 'NIL NIL |newJV|
                    (LIST
                     (SPADCALL
                      (VECTOR |ld| 'NIL 'NIL (CONS 0 (|spadConstant| $ 22))
                              (SPADCALL
                               (VECTOR 'NIL (CONS 1 |x|) (CONS 1 |exp|))
                               (QREFELT $ 27)))
                      (QREFELT $ 29))))
            (QREFELT $ 46))))))) 

(DEFUN |JLF;formalDiff2;LPiSemR;49| (|Sys| |i| JM $)
  (PROG (LJV JV |LRes| |res| |djv| #1=#:G453 |df| #2=#:G454 |jv| |r| #3=#:G451
         |l| #4=#:G452 |f| #5=#:G450 |eq| #6=#:G449 #7=#:G448 #8=#:G447 |inds|)
    (RETURN
     (SEQ
      (LETT |inds| (SPADCALL JM (QREFELT $ 116))
            . #9=(|JLF;formalDiff2;LPiSemR;49|))
      (EXIT
       (COND
        ((NULL |inds|)
         (CONS
          (PROGN
           (LETT #8# NIL . #9#)
           (SEQ (LETT |eq| NIL . #9#) (LETT #7# |Sys| . #9#) G190
                (COND
                 ((OR (ATOM #7#) (PROGN (LETT |eq| (CAR #7#) . #9#) NIL))
                  (GO G191)))
                (SEQ (EXIT (LETT #8# (CONS (|spadConstant| $ 86) #8#) . #9#)))
                (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                (EXIT (NREVERSE #8#))))
          (PROGN
           (LETT #6# NIL . #9#)
           (SEQ (LETT |eq| NIL . #9#) (LETT #5# |Sys| . #9#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |eq| (CAR #5#) . #9#) NIL))
                  (GO G191)))
                (SEQ (EXIT (LETT #6# (CONS NIL #6#) . #9#)))
                (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                (EXIT (NREVERSE #6#))))))
        ('T
         (SEQ (LETT |LRes| (SPADCALL (QREFELT $ 118)) . #9#)
              (LETT LJV NIL . #9#)
              (SEQ (LETT |f| NIL . #9#) (LETT #4# |Sys| . #9#)
                   (LETT |l| 1 . #9#)
                   (LETT #3# (SPADCALL JM (QREFELT $ 119)) . #9#) G190
                   (COND
                    ((OR (|greater_SI| |l| #3#) (ATOM #4#)
                         (PROGN (LETT |f| (CAR #4#) . #9#) NIL))
                     (GO G191)))
                   (SEQ (LETT |r| (SPADCALL JM |l| (QREFELT $ 121)) . #9#)
                        (LETT |res| (|spadConstant| $ 86) . #9#)
                        (LETT JV NIL . #9#)
                        (SEQ (LETT |jv| NIL . #9#)
                             (LETT #2# (REVERSE (QCAR |r|)) . #9#)
                             (LETT |df| NIL . #9#)
                             (LETT #1# (SPADCALL (QCDR |r|) (QREFELT $ 122))
                                   . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |df| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |jv| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL |df| (|spadConstant| $ 86)
                                            (QREFELT $ 90)))
                                 (SEQ
                                  (LETT |djv|
                                        (SPADCALL |jv| |i| (QREFELT $ 125))
                                        . #9#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |djv| 1)
                                     (LETT JV (CONS |jv| JV) . #9#))
                                    ((SPADCALL (QCDR |djv|) (QREFELT $ 126))
                                     (SEQ
                                      (LETT |res|
                                            (SPADCALL |res| |df|
                                                      (QREFELT $ 98))
                                            . #9#)
                                      (EXIT (LETT JV (CONS |jv| JV) . #9#))))
                                    ('T
                                     (SEQ
                                      (LETT |res|
                                            (SPADCALL |res|
                                                      (SPADCALL |df|
                                                                (SPADCALL
                                                                 (QCDR |djv|)
                                                                 (QREFELT $
                                                                          59))
                                                                (QREFELT $ 56))
                                                      (QREFELT $ 98))
                                            . #9#)
                                      (EXIT
                                       (LETT JV
                                             (APPEND (LIST |jv| (QCDR |djv|))
                                                     JV)
                                             . #9#)))))))))))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT NIL))
                        (COND
                         ((QVELT (SPADCALL |f| (QREFELT $ 35)) 1)
                          (QSETVELT (SPADCALL |res| (QREFELT $ 35)) 1 'T)))
                        (LETT |LRes| (SPADCALL |res| |LRes| (QREFELT $ 127))
                              . #9#)
                        (LETT JV
                              (SPADCALL (ELT $ 40) (SPADCALL JV (QREFELT $ 45))
                                        (QREFELT $ 97))
                              . #9#)
                        (EXIT (LETT LJV (CONS JV LJV) . #9#)))
                   (LETT |l| (PROG1 (|inc_SI| |l|) (LETT #4# (CDR #4#) . #9#))
                         . #9#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS (SPADCALL |LRes| (QREFELT $ 128)) (NREVERSE LJV))))))))))) 

(DEFUN |JLF;leadingDer;$JB;50| (|exp| $)
  (PROG (|rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL |exp| (QREFELT $ 35))
            . #1=(|JLF;leadingDer;$JB;50|))
      (SEQ G190
           (COND
            ((NULL
              (COND ((OR (QVELT |rec| 1) (SPADCALL |exp| (QREFELT $ 75))) 'NIL)
                    ('T 'T)))
             (GO G191)))
           (SEQ (LETT |exp| (SPADCALL |exp| (QREFELT $ 85)) . #1#)
                (EXIT (LETT |rec| (SPADCALL |exp| (QREFELT $ 35)) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND ((QVELT |rec| 1) (QVELT |rec| 0))
             ('T
              (SPADCALL (SPADCALL |exp| (QREFELT $ 62)) (QREFELT $ 41))))))))) 

(DEFUN |JLF;freeOf?;$JBB;51| (|exp| |jv| $)
  (SEQ
   (SEQ G190
        (COND
         ((NULL
           (COND
            ((OR
              (SPADCALL |jv| (QVELT (SPADCALL |exp| (QREFELT $ 35)) 3)
                        (QREFELT $ 112))
              (SPADCALL |exp| (QREFELT $ 75)))
             'NIL)
            ('T 'T)))
          (GO G191)))
        (SEQ
         (EXIT
          (LETT |exp| (SPADCALL |exp| (QREFELT $ 85)) |JLF;freeOf?;$JBB;51|)))
        NIL (GO G190) G191 (EXIT NIL))
   (EXIT
    (COND
     ((SPADCALL |jv| (QVELT (SPADCALL |exp| (QREFELT $ 35)) 3) (QREFELT $ 112))
      'NIL)
     ('T (SPADCALL (SPADCALL |exp| (QREFELT $ 62)) |jv| (QREFELT $ 132))))))) 

(DEFUN |JLF;solveFor;$JBU;52| (|exp| |jv| $)
  (PROG (|sf|)
    (RETURN
     (SEQ
      (LETT |sf|
            (SPADCALL (SPADCALL |exp| (QREFELT $ 62)) |jv| (QREFELT $ 134))
            |JLF;solveFor;$JBU;52|)
      (EXIT
       (COND ((QEQCAR |sf| 1) (CONS 1 "failed"))
             ('T (CONS 0 (SPADCALL (QCDR |sf|) (QREFELT $ 60)))))))))) 

(DEFUN |JLF;subst;$JB2$;53| (|exp| |jv| |sub| $)
  (SPADCALL
   (SPADCALL (SPADCALL |exp| (QREFELT $ 62)) |jv|
             (SPADCALL |sub| (QREFELT $ 62)) (QREFELT $ 136))
   (QREFELT $ 60))) 

(DEFUN |JLF;ld| (|r| $) (QVELT (SPADCALL (QCDR |r|) (QREFELT $ 35)) 0)) 

(DEFUN |JLF;greaterLD| (|r1| |r2| $)
  (SPADCALL (|JLF;ld| |r1| $) (|JLF;ld| |r2| $) (QREFELT $ 40))) 

(DEFUN |JLF;simpLD| (|l| $)
  (PROG (|newL| #1=#:G536 |deq| #2=#:G537 |dep| #3=#:G535 |newDep| |ndep|
         #4=#:G534 |d| #5=#:G533 #6=#:G503 #7=#:G532 |eq| #8=#:G531 |tmp|
         |oldDep| #9=#:G530 #10=#:G529 |sys| #11=#:G528 #12=#:G527 |newld|
         |neweq| #13=#:G486 #14=#:G526 |seq| |solvable?| |s| #15=#:G524
         #16=#:G525 |eqLD| |fl| |cld| |cur|)
    (RETURN
     (SEQ
      (COND ((< (LENGTH |l|) 2) |l|)
            (#17='T
             (SEQ
              (LETT |cur| (SPADCALL |l| (QREFELT $ 140)) . #18=(|JLF;simpLD|))
              (LETT |cld| (|JLF;ld| |cur| $) . #18#)
              (LETT |l| (CDR |l|) . #18#)
              (EXIT
               (COND
                ((SPADCALL |cld| (|JLF;ld| (SPADCALL |l| (QREFELT $ 140)) $)
                           (QREFELT $ 141))
                 (SPADCALL |cur| (|JLF;simpLD| |l| $) (QREFELT $ 142)))
                (#17#
                 (SEQ (LETT |eqLD| (LIST |cur|) . #18#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (COND ((NULL |l|) 'NIL)
                                    ('T
                                     (SPADCALL |cld|
                                               (|JLF;ld|
                                                (LETT |fl|
                                                      (SPADCALL |l|
                                                                (QREFELT $
                                                                         140))
                                                      . #18#)
                                                $)
                                               (QREFELT $ 143)))))
                             (GO G191)))
                           (SEQ
                            (LETT |eqLD| (SPADCALL |fl| |eqLD| (QREFELT $ 142))
                                  . #18#)
                            (EXIT (LETT |l| (CDR |l|) . #18#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |solvable?| 'NIL . #18#)
                      (SEQ (LETT #16# NIL . #18#) (LETT |eq| NIL . #18#)
                           (LETT #15# |eqLD| . #18#) G190
                           (COND
                            ((OR (ATOM #15#)
                                 (PROGN (LETT |eq| (CAR #15#) . #18#) NIL)
                                 #16#)
                             (GO G191)))
                           (SEQ
                            (LETT |s|
                                  (SPADCALL (QCDR |eq|) |cld| (QREFELT $ 135))
                                  . #18#)
                            (LETT |solvable?| (QEQCAR |s| 0) . #18#)
                            (EXIT (LETT |seq| |eq| . #18#)))
                           (LETT #15#
                                 (PROG1 (CDR #15#)
                                   (LETT #16# |solvable?| . #18#))
                                 . #18#)
                           (GO G190) G191 (EXIT NIL))
                      (LETT |newL| NIL . #18#)
                      (COND
                       (|solvable?|
                        (SEQ (LETT |eq| NIL . #18#) (LETT #14# |eqLD| . #18#)
                             G190
                             (COND
                              ((OR (ATOM #14#)
                                   (PROGN (LETT |eq| (CAR #14#) . #18#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |eq| |seq| (QREFELT $ 144))
                                 (SEQ
                                  (LETT |neweq|
                                        (SPADCALL
                                         (SPADCALL (QCDR |eq|) |cld|
                                                   (PROG2
                                                       (LETT #13# |s| . #18#)
                                                       (QCDR #13#)
                                                     (|check_union|
                                                      (QEQCAR #13# 0) $ #13#))
                                                   (QREFELT $ 137))
                                         (QREFELT $ 93))
                                        . #18#)
                                  (EXIT
                                   (COND
                                    ((NULL (SPADCALL |neweq| (QREFELT $ 50)))
                                     (SEQ
                                      (LETT |newld|
                                            (SPADCALL |neweq| (QREFELT $ 87))
                                            . #18#)
                                      (EXIT
                                       (LETT |newL|
                                             (SPADCALL
                                              (CONS
                                               (|function| |JLF;greaterLD|) $)
                                              |newL|
                                              (LIST
                                               (CONS
                                                (APPEND (QCAR |eq|)
                                                        (QCAR |seq|))
                                                |neweq|))
                                              (QREFELT $ 146))
                                             . #18#)))))))))))
                             (LETT #14# (CDR #14#) . #18#) (GO G190) G191
                             (EXIT NIL)))
                       (#17#
                        (SEQ
                         (LETT |sys|
                               (PROGN
                                (LETT #12# NIL . #18#)
                                (SEQ (LETT |eq| NIL . #18#)
                                     (LETT #11# |eqLD| . #18#) G190
                                     (COND
                                      ((OR (ATOM #11#)
                                           (PROGN
                                            (LETT |eq| (CAR #11#) . #18#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #12#
                                             (CONS
                                              (SPADCALL (QCDR |eq|)
                                                        (QREFELT $ 62))
                                              #12#)
                                             . #18#)))
                                     (LETT #11# (CDR #11#) . #18#) (GO G190)
                                     G191 (EXIT (NREVERSE #12#))))
                               . #18#)
                         (LETT |oldDep|
                               (PROGN
                                (LETT #10# NIL . #18#)
                                (SEQ (LETT |eq| NIL . #18#)
                                     (LETT #9# |eqLD| . #18#) G190
                                     (COND
                                      ((OR (ATOM #9#)
                                           (PROGN
                                            (LETT |eq| (CAR #9#) . #18#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #10# (CONS (QCAR |eq|) #10#)
                                             . #18#)))
                                     (LETT #9# (CDR #9#) . #18#) (GO G190) G191
                                     (EXIT (NREVERSE #10#))))
                               . #18#)
                         (LETT |tmp|
                               (SPADCALL |sys| (SPADCALL |sys| (QREFELT $ 147))
                                         (QREFELT $ 150))
                               . #18#)
                         (COND
                          ((SPADCALL (QVELT |tmp| 2) (CONS 0 "failed")
                                     (QREFELT $ 151))
                           (SEQ
                            (LETT |dep|
                                  (SPADCALL
                                   (SPADCALL (ELT $ 153) |oldDep| NIL
                                             (QREFELT $ 156))
                                   (QREFELT $ 157))
                                  . #18#)
                            (EXIT
                             (LETT |newDep|
                                   (PROGN
                                    (LETT #8# NIL . #18#)
                                    (SEQ (LETT |eq| NIL . #18#)
                                         (LETT #7# (QVELT |tmp| 0) . #18#) G190
                                         (COND
                                          ((OR (ATOM #7#)
                                               (PROGN
                                                (LETT |eq| (CAR #7#) . #18#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #8# (CONS |dep| #8#) . #18#)))
                                         (LETT #7# (CDR #7#) . #18#) (GO G190)
                                         G191 (EXIT (NREVERSE #8#))))
                                   . #18#))))
                          (#17#
                           (SEQ (LETT |newDep| NIL . #18#)
                                (SEQ (LETT |dep| NIL . #18#)
                                     (LETT #5#
                                           (PROG2
                                               (LETT #6# (QVELT |tmp| 2)
                                                     . #18#)
                                               (QCDR #6#)
                                             (|check_union| (QEQCAR #6# 1)
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|)))
                                                            #6#))
                                           . #18#)
                                     G190
                                     (COND
                                      ((OR (ATOM #5#)
                                           (PROGN
                                            (LETT |dep| (CAR #5#) . #18#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ (LETT |ndep| NIL . #18#)
                                          (SEQ (LETT |d| NIL . #18#)
                                               (LETT #4# |dep| . #18#) G190
                                               (COND
                                                ((OR (ATOM #4#)
                                                     (PROGN
                                                      (LETT |d| (CAR #4#)
                                                            . #18#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT |ndep|
                                                       (SPADCALL
                                                        (SPADCALL |ndep|
                                                                  (SPADCALL
                                                                   |oldDep| |d|
                                                                   (QREFELT $
                                                                            158))
                                                                  (QREFELT $
                                                                           159))
                                                        (QREFELT $ 157))
                                                       . #18#)))
                                               (LETT #4# (CDR #4#) . #18#)
                                               (GO G190) G191 (EXIT NIL))
                                          (EXIT
                                           (LETT |newDep|
                                                 (CONS |ndep| |newDep|)
                                                 . #18#)))
                                     (LETT #5# (CDR #5#) . #18#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (LETT |newDep| (NREVERSE |newDep|) . #18#)))))
                         (LETT |newL|
                               (PROGN
                                (LETT #3# NIL . #18#)
                                (SEQ (LETT |dep| NIL . #18#)
                                     (LETT #2# |newDep| . #18#)
                                     (LETT |deq| NIL . #18#)
                                     (LETT #1# (QVELT |tmp| 0) . #18#) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |deq| (CAR #1#) . #18#)
                                            NIL)
                                           (ATOM #2#)
                                           (PROGN
                                            (LETT |dep| (CAR #2#) . #18#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #3#
                                             (CONS
                                              (CONS |dep|
                                                    (SPADCALL |deq|
                                                              (QREFELT $ 60)))
                                              #3#)
                                             . #18#)))
                                     (LETT #1#
                                           (PROG1 (CDR #1#)
                                             (LETT #2# (CDR #2#) . #18#))
                                           . #18#)
                                     (GO G190) G191 (EXIT (NREVERSE #3#))))
                               . #18#)
                         (EXIT
                          (LETT |newL|
                                (SPADCALL (CONS (|function| |JLF;greaterLD|) $)
                                          |newL| (QREFELT $ 160))
                                . #18#)))))
                      (EXIT
                       (SPADCALL |seq|
                                 (|JLF;simpLD|
                                  (SPADCALL
                                   (CONS (|function| |JLF;greaterLD|) $) |l|
                                   |newL| (QREFELT $ 146))
                                  $)
                                 (QREFELT $ 142)))))))))))))) 

(DEFUN |JLF;simplify;LSemR;57| (|sys| |jm| $)
  (PROG (|r| |tmp| #1=#:G562 |eq| #2=#:G563 |dep| |i| |resJM| |inds| |resDep|
         #3=#:G561 |l| #4=#:G560 |resSys| #5=#:G559 #6=#:G558 |sl| #7=#:G557
         |f| #8=#:G556)
    (RETURN
     (SEQ
      (LETT |sl|
            (PROGN
             (LETT #8# NIL . #9=(|JLF;simplify;LSemR;57|))
             (SEQ (LETT |i| 1 . #9#) (LETT |f| NIL . #9#)
                  (LETT #7# |sys| . #9#) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT (LETT #8# (CONS (CONS (LIST |i|) |f|) #8#) . #9#)))
                  (LETT #7# (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|) . #9#))
                        . #9#)
                  (GO G190) G191 (EXIT (NREVERSE #8#))))
            . #9#)
      (LETT |sl|
            (|JLF;simpLD|
             (SPADCALL (CONS (|function| |JLF;greaterLD|) $) |sl|
                       (QREFELT $ 160))
             $)
            . #9#)
      (LETT |resSys|
            (PROGN
             (LETT #6# NIL . #9#)
             (SEQ (LETT |l| NIL . #9#) (LETT #5# |sl| . #9#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #6# (CONS (SPADCALL (QCDR |l|) (QREFELT $ 79)) #6#)
                          . #9#)))
                  (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #9#)
      (LETT |resDep|
            (PROGN
             (LETT #4# NIL . #9#)
             (SEQ (LETT |l| NIL . #9#) (LETT #3# |sl| . #9#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |l| (CAR #3#) . #9#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #4# (CONS (QCAR |l|) #4#) . #9#)))
                  (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #9#)
      (LETT |inds| (SPADCALL |jm| (QREFELT $ 116)) . #9#)
      (LETT |resJM| (SPADCALL |inds| (LENGTH |sl|) (QREFELT $ 161)) . #9#)
      (SEQ (LETT |i| 1 . #9#) (LETT |dep| NIL . #9#) (LETT #2# |resDep| . #9#)
           (LETT |eq| NIL . #9#) (LETT #1# |resSys| . #9#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #9#) NIL) (ATOM #2#)
                 (PROGN (LETT |dep| (CAR #2#) . #9#) NIL))
             (GO G191)))
           (SEQ
            (COND
             ((EQL (SPADCALL |dep| (QREFELT $ 162)) 1)
              (LETT |r| (SPADCALL |jm| (|SPADfirst| |dep|) (QREFELT $ 121))
                    . #9#))
             ('T
              (SEQ
               (LETT |tmp| (SPADCALL (LIST |eq|) (LIST |inds|) (QREFELT $ 164))
                     . #9#)
               (EXIT (LETT |r| (SPADCALL |tmp| 1 (QREFELT $ 121)) . #9#)))))
            (EXIT (SPADCALL |resJM| |i| |r| (QREFELT $ 165))))
           (LETT #1#
                 (PROG1 (CDR #1#)
                   (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #9#))
                         . #9#))
                 . #9#)
           (GO G190) G191 (EXIT NIL))
      (EXIT (VECTOR |resSys| |resJM| (CONS 1 |resDep|))))))) 

(DEFUN |JLF;reduceMod;3L;58| (|sys1| |sys2| $)
  (PROG (#1=#:G574 |d| #2=#:G573 |sys2D| #3=#:G572 |exp| #4=#:G571 |sys1D|
         #5=#:G570 #6=#:G569)
    (RETURN
     (SEQ
      (LETT |sys1D|
            (PROGN
             (LETT #6# NIL . #7=(|JLF;reduceMod;3L;58|))
             (SEQ (LETT |exp| NIL . #7#) (LETT #5# |sys1| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |exp| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #6#
                          (CONS
                           (|JLF;extract| (SPADCALL |exp| (QREFELT $ 61)) $)
                           #6#)
                          . #7#)))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (LETT |sys2D|
            (PROGN
             (LETT #4# NIL . #7#)
             (SEQ (LETT |exp| NIL . #7#) (LETT #3# |sys2| . #7#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |exp| (CAR #3#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (|JLF;extract| (SPADCALL |exp| (QREFELT $ 61)) $)
                           #4#)
                          . #7#)))
                  (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #7#)
      (EXIT
       (PROGN
        (LETT #2# NIL . #7#)
        (SEQ (LETT |d| NIL . #7#)
             (LETT #1# (SPADCALL |sys1D| |sys2D| (QREFELT $ 167)) . #7#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |d| (CAR #1#) . #7#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (SPADCALL |d| (QREFELT $ 60)) #2#) . #7#)))
             (LETT #1# (CDR #1#) . #7#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |JLF;autoReduce;2L;59| (|sys| $)
  (PROG (#1=#:G582 |d| #2=#:G581 |sysD| #3=#:G580 |exp| #4=#:G579)
    (RETURN
     (SEQ
      (LETT |sysD|
            (PROGN
             (LETT #4# NIL . #5=(|JLF;autoReduce;2L;59|))
             (SEQ (LETT |exp| NIL . #5#) (LETT #3# |sys| . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |exp| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (|JLF;extract| (SPADCALL |exp| (QREFELT $ 61)) $)
                           #4#)
                          . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (EXIT
       (PROGN
        (LETT #2# NIL . #5#)
        (SEQ (LETT |d| NIL . #5#)
             (LETT #1# (SPADCALL |sysD| (QREFELT $ 169)) . #5#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |d| (CAR #1#) . #5#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (SPADCALL |d| (QREFELT $ 60)) #2#) . #5#)))
             (LETT #1# (CDR #1#) . #5#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |JetLazyFunction| (&REST #1=#:G589)
  (PROG ()
    (RETURN
     (PROG (#2=#:G590)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|JetLazyFunction|)
                                           '|domainEqualList|)
                . #3=(|JetLazyFunction|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |JetLazyFunction;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|JetLazyFunction|))))))))))) 

(DEFUN |JetLazyFunction;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|JetLazyFunction|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|JetLazyFunction| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 179) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|JetLazyFunction| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 0)
      (QSETREFV $ 9 0)
      (QSETREFV $ 18
                (|Record| (|:| |DEval?| (|Boolean|))
                          (|:| DX (|Union| |#1| (|Symbol|)))
                          (|:| |DFun| (|Union| |#2| $))))
      (QSETREFV $ 19
                (|Record| (|:| LLD |#1|) (|:| |LSharp?| (|Boolean|))
                          (|:| |LEval?| (|Boolean|))
                          (|:| |LCoeff| (|Union| |#2| $))
                          (|:| |LDer| (|Reference| (QREFELT $ 18)))))
      (QSETREFV $ 20
                (|Record| (|:| LD |#1|) (|:| |Sharp?| (|Boolean|))
                          (|:| |Ground?| (|Boolean|)) (|:| JV1 (|List| |#1|))
                          (|:| JV2 (|List| |#1|))
                          (|:| |Lazy| (|List| (|Reference| (QREFELT $ 19))))))
      (QSETREFV $ 21 (|Reference| (QREFELT $ 20)))
      (QSETREFV $ 23 (VECTOR 'T (CONS 1 '|0|) (CONS 0 (|spadConstant| $ 22))))
      (QSETREFV $ 30
                (VECTOR (SPADCALL (QREFELT $ 24)) 'T 'T NIL NIL
                        (LIST
                         (SPADCALL
                          (VECTOR (SPADCALL (QREFELT $ 24)) 'T 'T
                                  (CONS 0 (|spadConstant| $ 25))
                                  (SPADCALL (QREFELT $ 23) (QREFELT $ 27)))
                          (QREFELT $ 29)))))
      $)))) 

(MAKEPROP '|JetLazyFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|LazyDiff|
              '|LazyEval| (|OutputForm|) (|NonNegativeInteger|) (0 . |coerce|)
              (5 . |assign|) (|Void|) (11 . |print|) (16 . |void|)
              |JLF;statistics;V;1| '|LazyDer| '|LazyTerm| '|RepRec| '|Rep|
              (20 . |One|) '|emptyDer| (24 . |One|) (28 . |Zero|)
              (|Reference| 18) (32 . |ref|) (|Reference| 19) (37 . |ref|)
              '|zeroRec| (|Boolean|) (|Union| 6 82) (42 . ~=) (48 . |one?|)
              (53 . |deref|) (58 . |deref|) (|List| 6) (63 . |jetVariables|)
              |JLF;jetVariables;$L;46| (68 . >) (74 . |leadingDer|)
              (79 . |deref|) (|Mapping| 31 6 6) (84 . |merge|)
              (91 . |removeDuplicates!|) (96 . |ref|) (|List| 28)
              (101 . |second|) (106 . |zero?|) |JLF;zero?;$B;31|
              |JLF;one?;$B;34| (111 . -) |JLF;-;2$;37| (116 . *) |JLF;*;D2$;40|
              |JLF;*;3$;41| (122 . <) (128 . |coerce|) |JLF;coerce;JB$;15|
              |JLF;coerce;D$;16| |JLF;eval;2$;28| |JLF;coerce;$D;17|
              (133 . |coerce|) |JLF;coerce;$Of;22| (|String|) (138 . |message|)
              (143 . |coerce|) (|List| $) (148 . |prefix|) (154 . *) (160 . +)
              (166 . |setref|) (172 . |empty|) (176 . +) |JLF;ground?;$B;24|
              (182 . |setref|) (|Mapping| 31 28 28) (188 . |merge|)
              |JLF;collect;2$;23|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JLF;One;$;30|) $))
              (195 . |differentiate|) (|Symbol|) (201 . |differentiate|)
              (207 . |setref|) |JLF;eval1;2$;27|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JLF;Zero;$;29|) $))
              |JLF;leadingDer;$JB;50| (213 . |type|) (218 . =)
              |JLF;eqRep?;2$B;32| (224 . -) |JLF;=;2$B;33|
              |JLF;numerator;2$;35| |JLF;denominator;2$;36|
              (230 . |setDifference|) (236 . |concat!|) (242 . |sort!|)
              |JLF;+;3$;38| (|Integer|) (248 . |coerce|) (253 . |concat!|)
              |JLF;*;I2$;39| (|Union| $ '"failed") (259 . |recip|)
              |JLF;recip;$U;42| (264 . |const?|) |JLF;const?;$B;43|
              (269 . |order|) |JLF;order;$Nni;44| (274 . |class|)
              |JLF;class;$Nni;45| (279 . |member?|) |JLF;differentiate;$JB$;47|
              |JLF;differentiate;$S$;48| (|SparseEchelonMatrix| 6 $$)
              (285 . |allIndices|) (|List| $$) (290 . |empty|) (294 . |nrows|)
              (|Record| (|:| |Indices| 37) (|:| |Entries| 117)) (299 . |row|)
              (305 . |reverse|) (|Union| $ '"0") (|PositiveInteger|)
              (310 . |differentiate|) (316 . |one?|) (321 . |cons|)
              (327 . |reverse!|) (|Record| (|:| |DSys| 68) (|:| |JVars| 163))
              (|SparseEchelonMatrix| 6 $) |JLF;formalDiff2;LPiSemR;49|
              (332 . |freeOf?|) |JLF;freeOf?;$JBB;51| (338 . |solveFor|)
              |JLF;solveFor;$JBU;52| (344 . |subst|) |JLF;subst;$JB2$;53|
              (|Record| (|:| |Dep| 152) (|:| |Fun| $$)) (|List| 138)
              (351 . |first|) (356 . ~=) (362 . |cons|) (368 . =) (374 . ~=)
              (|Mapping| 31 138 138) (380 . |merge|) (387 . |jacobiMatrix|)
              (|Union| '"failed" 155)
              (|Record| (|:| |Sys| 68) (|:| JM 130) (|:| |Depend| 148))
              (392 . |simplify|) (398 . =) (|List| 11) (404 . |append|)
              (|Mapping| 152 152 152) (|List| 152) (410 . |reduce|)
              (417 . |removeDuplicates!|) (422 . |qelt|) (428 . |concat!|)
              (434 . |sort!|) (440 . |new|) (446 . |#|) (|List| 37)
              (451 . |jacobiMatrix|) (457 . |setRow!|) |JLF;simplify;LSemR;57|
              (464 . |reduceMod|) |JLF;reduceMod;3L;58| (470 . |autoReduce|)
              |JLF;autoReduce;2L;59| (|Record| (|:| |DPhi| $) (|:| |JVars| 37))
              (|Union| 6 '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 82) (|SparseUnivariatePolynomial| $) (|HashState|)
              (|SingleInteger|))
           '#(~= 475 |zero?| 481 |unitNormal| 486 |unitCanonical| 491 |unit?|
              496 |symbol| 501 |subtractIfCan| 506 |subst| 512 |statistics| 519
              |sortLD| 523 |solveFor| 528 |simplify| 534 |simpOne| 540
              |simpMod| 545 |setNotation| 558 |sample| 563 |retractIfCan| 567
              |retract| 572 |reduceMod| 577 |recip| 583 |orderDim| 588 |order|
              595 |one?| 600 |numerator| 605 |numIndVar| 610 |numDepVar| 614
              |leadingDer| 618 |lcmCoef| 623 |lcm| 629 |latex| 640
              |jetVariables| 645 |jacobiMatrix| 650 |hashUpdate!| 661 |hash|
              667 |ground?| 672 |getNotation| 677 |gcdPolynomial| 681 |gcd| 687
              |freeOf?| 698 |formalDiff2| 704 |formalDiff| 718 |extractSymbol|
              736 |exquo| 741 |eval1| 747 |eval| 752 |eqRep?| 757 |dimension|
              763 |differentiate| 770 |denominator| 802 |dSubst| 807 |const?|
              814 |collect| 819 |coerce| 824 |class| 854 |characteristic| 859
              |autoReduce| 863 |associates?| 868 ^ 874 |Zero| 886 X 890 U 899 P
              908 |One| 930 = 934 - 940 + 951 * 957 |#2| 987)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0))
            (CONS
             '#(|JetBundleFunctionCategory&| |GcdDomain&| NIL NIL |Algebra&|
                |PartialDifferentialRing&| |EntireRing&| |Module&| NIL NIL
                |Ring&| NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| |SetCategory&|
                NIL |RetractableTo&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|JetBundleFunctionCategory| 6) (|GcdDomain|)
                 (|IntegralDomain|) (|LeftOreRing|) (|Algebra| $$)
                 (|PartialDifferentialRing| 82) (|EntireRing|) (|Module| $$)
                 (|CommutativeRing|) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| $$) (|RightModule| $$) (|Rng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|lazyRepresentation|) (|RetractableTo| 6)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 10))
              (|makeByteWordVec2| 178
                                  '(1 11 10 0 12 2 10 0 0 0 13 1 10 14 0 15 0
                                    14 0 16 0 7 0 22 0 6 0 24 0 7 0 25 1 26 0
                                    18 27 1 28 0 19 29 2 32 31 0 0 33 1 7 31 0
                                    34 1 21 20 0 35 1 28 19 0 36 1 7 37 0 38 2
                                    6 31 0 0 40 1 7 6 0 41 1 26 18 0 42 3 37 0
                                    43 0 0 44 1 37 0 0 45 1 21 0 20 46 1 47 28
                                    0 48 1 7 31 0 49 1 7 0 0 52 2 7 0 0 0 54 2
                                    6 31 0 0 57 1 7 0 6 58 1 7 10 0 63 1 10 0
                                    65 66 1 32 10 0 67 2 10 0 0 68 69 2 10 0 0
                                    0 70 2 10 0 0 0 71 2 21 20 0 20 72 0 10 0
                                    73 2 7 0 0 0 74 2 28 19 0 19 76 3 47 0 77 0
                                    0 78 2 7 0 0 6 81 2 7 0 0 82 83 2 26 18 0
                                    18 84 1 6 82 0 88 2 20 31 0 0 89 2 0 0 0 0
                                    91 2 37 0 0 0 95 2 37 0 0 0 96 2 37 0 43 0
                                    97 1 7 0 99 100 2 47 0 0 0 101 1 7 103 0
                                    104 1 7 31 0 106 1 6 11 0 108 1 6 11 0 110
                                    2 37 31 6 0 112 1 115 37 0 116 0 117 0 118
                                    1 115 11 0 119 2 115 120 0 99 121 1 117 0 0
                                    122 2 6 123 0 124 125 1 6 31 0 126 2 117 0
                                    2 0 127 1 117 0 0 128 2 7 31 0 6 132 2 7
                                    103 0 6 134 3 7 0 0 6 0 136 1 139 138 0 140
                                    2 6 31 0 0 141 2 139 0 138 0 142 2 6 31 0 0
                                    143 2 138 31 0 0 144 3 139 0 145 0 0 146 1
                                    7 130 68 147 2 7 149 68 130 150 2 148 31 0
                                    0 151 2 152 0 0 0 153 3 155 152 154 0 152
                                    156 1 152 0 0 157 2 155 152 0 99 158 2 152
                                    0 0 0 159 2 139 0 145 0 160 2 115 0 37 99
                                    161 1 152 11 0 162 2 0 130 68 163 164 3 115
                                    14 0 99 120 165 2 7 68 68 68 167 1 7 68 68
                                    169 2 0 31 0 0 1 1 0 31 0 50 1 0 173 0 1 1
                                    0 0 0 1 1 0 31 0 1 1 0 130 68 1 2 0 103 0 0
                                    1 3 0 0 0 6 0 137 0 0 14 17 1 0 68 68 1 2 0
                                    103 0 6 135 2 0 149 68 130 166 1 0 0 0 1 3
                                    0 149 68 130 68 1 2 0 68 68 68 1 1 0 14 82
                                    1 0 0 0 1 1 0 172 0 1 1 0 6 0 1 2 0 68 68
                                    68 168 1 0 103 0 105 3 0 11 68 130 11 1 1 0
                                    11 0 109 1 0 31 0 51 1 0 0 0 93 0 0 124 1 0
                                    0 124 1 1 0 6 0 87 2 0 174 0 0 1 2 0 0 0 0
                                    1 1 0 0 68 1 1 0 65 0 1 1 0 37 0 39 1 0 130
                                    68 1 2 0 130 68 163 164 2 0 177 177 0 1 1 0
                                    178 0 1 1 0 31 0 75 0 0 82 1 2 0 176 176
                                    176 1 2 0 0 0 0 1 1 0 0 68 1 2 0 31 0 6 133
                                    3 0 129 68 124 130 131 3 0 171 0 124 130 1
                                    2 0 0 0 152 1 2 0 68 68 124 1 2 0 0 0 124 1
                                    1 0 130 130 1 2 0 103 0 0 1 1 0 0 0 85 1 0
                                    0 0 61 2 0 31 0 0 90 3 0 11 68 130 11 1 2 0
                                    0 0 6 113 3 0 0 0 175 152 1 2 0 0 0 175 1 3
                                    0 0 0 82 11 1 2 0 0 0 82 114 1 0 0 0 94 3 0
                                    0 0 6 0 1 1 0 31 0 107 1 0 0 0 79 1 0 0 7
                                    60 1 0 7 0 62 1 0 0 0 1 1 0 0 6 59 1 0 0 99
                                    1 1 0 10 0 64 1 0 11 0 111 0 0 11 1 1 0 68
                                    68 170 2 0 31 0 0 1 2 0 0 0 11 1 2 0 0 0
                                    124 1 0 0 0 86 0 0 0 1 1 0 0 124 1 0 0 0 1
                                    1 0 0 124 1 2 0 0 124 11 1 1 0 0 11 1 1 0 0
                                    152 1 2 0 0 124 152 1 0 0 0 80 2 0 31 0 0
                                    92 1 0 0 0 53 2 0 0 0 0 91 2 0 0 0 0 98 2 0
                                    0 7 0 55 2 0 0 0 0 56 2 0 0 99 0 102 2 0 0
                                    11 0 1 2 0 0 124 0 1 3 0 0 0 175 152 1 3 0
                                    0 0 82 11 1 2 0 0 0 82 1 2 0 0 0 175 1)))))
           '|lookupComplete|)) 
