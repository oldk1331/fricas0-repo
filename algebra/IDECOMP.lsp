
(/VERSIONCHECK 2) 

(DEFUN |IDECOMP;convertQF| (|a| $)
  (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 9)) (QREFELT $ 11))
            (SPADCALL (SPADCALL |a| (QREFELT $ 12)) (QREFELT $ 11))
            (QREFELT $ 13))) 

(DEFUN |IDECOMP;convertFQ| (|a| $)
  (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 15)) (QREFELT $ 16))
            (SPADCALL (SPADCALL |a| (QREFELT $ 17)) (QREFELT $ 16))
            (QREFELT $ 18))) 

(DEFUN |IDECOMP;internalForm| (I $)
  (PROG (|nId| #1=#:G145 |poly| #2=#:G144 |Id|)
    (RETURN
     (SEQ (LETT |Id| (SPADCALL I (QREFELT $ 21)) . #3=(|IDECOMP;internalForm|))
          (LETT |nId|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |poly| NIL . #3#) (LETT #1# |Id| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |poly| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (CONS (|function| |IDECOMP;convertQF|) $)
                                |poly| (QREFELT $ 26))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND ((SPADCALL I (QREFELT $ 28)) (SPADCALL |nId| (QREFELT $ 31)))
                 ('T (SPADCALL |nId| (QREFELT $ 32))))))))) 

(DEFUN |IDECOMP;externalForm| (I $)
  (PROG (|nId| #1=#:G151 |poly| #2=#:G150 |Id|)
    (RETURN
     (SEQ (LETT |Id| (SPADCALL I (QREFELT $ 33)) . #3=(|IDECOMP;externalForm|))
          (LETT |nId|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |poly| NIL . #3#) (LETT #1# |Id| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |poly| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (CONS (|function| |IDECOMP;convertFQ|) $)
                                |poly| (QREFELT $ 36))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND ((SPADCALL I (QREFELT $ 37)) (SPADCALL |nId| (QREFELT $ 38)))
                 ('T (SPADCALL |nId| (QREFELT $ 39))))))))) 

(DEFUN |IDECOMP;deleteunit| (|lI| $)
  (PROG (#1=#:G161 I #2=#:G160)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|IDECOMP;deleteunit|))
       (SEQ (LETT I NIL . #3#) (LETT #1# |lI| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT I (CAR #1#) . #3#) NIL)) (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((COND ((SPADCALL (|spadConstant| $ 47) I (QREFELT $ 48)) 'NIL)
                      ('T 'T))
                (LETT #2# (CONS I #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |IDECOMP;rearrange| (|vlist| $)
  (COND ((SPADCALL |vlist| NIL (QREFELT $ 50)) |vlist|)
        ('T
         (SPADCALL (ELT $ 51)
                   (SPADCALL (QREFELT $ 44)
                             (SPADCALL (QREFELT $ 44) |vlist| (QREFELT $ 52))
                             (QREFELT $ 52))
                   (QREFELT $ 54))))) 

(DEFUN |IDECOMP;zeroRadComp| (I |truelist| $)
  (PROG (|ris| #1=#:G178 |h| #2=#:G177 |lf| |Id| #3=#:G176 #4=#:G175 |pw| |pv|
         |val| |g| #5=#:G164 |f| |py| |px| |y| |x|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |truelist| NIL (QREFELT $ 50)) I)
            (#6='T
             (SEQ
              (LETT |Id| (SPADCALL I (QREFELT $ 33))
                    . #7=(|IDECOMP;zeroRadComp|))
              (LETT |x| (SPADCALL |truelist| '|last| (QREFELT $ 56)) . #7#)
              (EXIT
               (COND
                ((EQL (LENGTH |Id|) 1)
                 (SEQ (LETT |f| (|SPADfirst| |Id|) . #7#)
                      (LETT |g|
                            (PROG2
                                (LETT #5#
                                      (SPADCALL |f|
                                                (SPADCALL |f|
                                                          (SPADCALL |f| |x|
                                                                    (QREFELT $
                                                                             57))
                                                          (QREFELT $ 58))
                                                (QREFELT $ 59))
                                      . #7#)
                                (QCDR #5#)
                              (|check_union| (QEQCAR #5# 0)
                                             (|DistributedMultivariatePolynomial|
                                              (QREFELT $ 6)
                                              (|Fraction|
                                               (|Polynomial| (|Integer|))))
                                             #5#))
                            . #7#)
                      (EXIT (SPADCALL (LIST |g|) (QREFELT $ 31)))))
                (#6#
                 (SEQ (LETT |y| (|SPADfirst| |truelist|) . #7#)
                      (LETT |px| (SPADCALL |x| (QREFELT $ 60)) . #7#)
                      (LETT |py| (SPADCALL |y| (QREFELT $ 60)) . #7#)
                      (LETT |f| (SPADCALL |Id| '|last| (QREFELT $ 61)) . #7#)
                      (LETT |g|
                            (PROG2
                                (LETT #5#
                                      (SPADCALL |f|
                                                (SPADCALL |f|
                                                          (SPADCALL |f| |x|
                                                                    (QREFELT $
                                                                             57))
                                                          (QREFELT $ 58))
                                                (QREFELT $ 59))
                                      . #7#)
                                (QCDR #5#)
                              (|check_union| (QEQCAR #5# 0)
                                             (|DistributedMultivariatePolynomial|
                                              (QREFELT $ 6)
                                              (|Fraction|
                                               (|Polynomial| (|Integer|))))
                                             #5#))
                            . #7#)
                      (LETT |Id|
                            (SPADCALL
                             (CONS |g| (SPADCALL |f| |Id| (QREFELT $ 62)))
                             (QREFELT $ 64))
                            . #7#)
                      (LETT |lf| (|SPADfirst| |Id|) . #7#)
                      (LETT |pv| (|spadConstant| $ 65) . #7#)
                      (LETT |pw| (|spadConstant| $ 65) . #7#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL (SPADCALL |lf| |y| (QREFELT $ 67)) 1
                                        (QREFELT $ 68)))
                             (GO G191)))
                           (SEQ (LETT |val| (RANDOM 23) . #7#)
                                (LETT |pv|
                                      (SPADCALL |px|
                                                (SPADCALL |val| |py|
                                                          (QREFELT $ 69))
                                                (QREFELT $ 70))
                                      . #7#)
                                (LETT |pw|
                                      (SPADCALL |px|
                                                (SPADCALL |val| |py|
                                                          (QREFELT $ 69))
                                                (QREFELT $ 71))
                                      . #7#)
                                (LETT |Id|
                                      (SPADCALL
                                       (PROGN
                                        (LETT #4# NIL . #7#)
                                        (SEQ (LETT |h| NIL . #7#)
                                             (LETT #3# |Id| . #7#) G190
                                             (COND
                                              ((OR (ATOM #3#)
                                                   (PROGN
                                                    (LETT |h| (CAR #3#) . #7#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #4#
                                                     (CONS
                                                      (SPADCALL
                                                       (SPADCALL |h| |x|
                                                                 (QREFELT $
                                                                          73))
                                                       |pv| (QREFELT $ 75))
                                                      #4#)
                                                     . #7#)))
                                             (LETT #3# (CDR #3#) . #7#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #4#))))
                                       (QREFELT $ 64))
                                      . #7#)
                                (EXIT (LETT |lf| (|SPADfirst| |Id|) . #7#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |ris|
                            (SPADCALL
                             (|IDECOMP;zeroRadComp|
                              (SPADCALL (CDR |Id|) (QREFELT $ 31))
                              (CDR |truelist|) $)
                             (QREFELT $ 33))
                            . #7#)
                      (LETT |ris| (CONS |lf| |ris|) . #7#)
                      (COND
                       ((SPADCALL |pv| (|spadConstant| $ 65) (QREFELT $ 78))
                        (LETT |ris|
                              (PROGN
                               (LETT #2# NIL . #7#)
                               (SEQ (LETT |h| NIL . #7#) (LETT #1# |ris| . #7#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |h| (CAR #1#) . #7#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |h| |x| (QREFELT $ 73))
                                              |pw| (QREFELT $ 75))
                                             #2#)
                                            . #7#)))
                                    (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              . #7#)))
                      (EXIT
                       (SPADCALL (SPADCALL |ris| (QREFELT $ 64))
                                 (QREFELT $ 31)))))))))))))) 

(DEFUN |IDECOMP;goodPower| (|s| I $)
  (PROG (|f| #1=#:G186 |g| #2=#:G185 J JJ)
    (RETURN
     (SEQ (LETT |f| |s| . #3=(|IDECOMP;goodPower|))
          (LETT I (SPADCALL I (QREFELT $ 79)) . #3#)
          (LETT J
                (SPADCALL (LETT JJ (SPADCALL I |s| (QREFELT $ 80)) . #3#)
                          (QREFELT $ 33))
                . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL
                     (SPADCALL
                      (PROGN
                       (LETT #2# NIL . #3#)
                       (SEQ (LETT |g| NIL . #3#) (LETT #1# J . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |g| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |f| |g| (QREFELT $ 81))
                                          #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      (QREFELT $ 32))
                     I (QREFELT $ 82))
                    'NIL)
                   ('T 'T)))
                 (GO G191)))
               (SEQ (EXIT (LETT |f| (SPADCALL |s| |f| (QREFELT $ 81)) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |f| JJ)))))) 

(DEFUN |IDECOMP;zerodimcase| (J |truelist| $)
  (PROG (#1=#:G197 |Jd| #2=#:G153 |y| |f| #3=#:G198 |x| |n|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL (|spadConstant| $ 47) J (QREFELT $ 48))
             (SPADCALL |truelist| NIL (QREFELT $ 50)))
         'T)
        ('T
         (SEQ (LETT |n| (LENGTH |truelist|) . #4=(|IDECOMP;zerodimcase|))
              (LETT |Jd| (SPADCALL (SPADCALL J (QREFELT $ 33)) (QREFELT $ 64))
                    . #4#)
              (SEQ (LETT |x| NIL . #4#) (LETT #3# |truelist| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL)
                         (NULL (SPADCALL |Jd| NIL (QREFELT $ 84))))
                     (GO G191)))
                   (SEQ (LETT |f| (|SPADfirst| |Jd|) . #4#)
                        (LETT |Jd| (CDR |Jd|) . #4#)
                        (SEQ (LETT |y| (SPADCALL |f| (QREFELT $ 86)) . #4#)
                             (EXIT
                              (COND
                               ((OR (QEQCAR |y| 1)
                                    (OR
                                     (SPADCALL (QCDR |y|) |x| (QREFELT $ 87))
                                     (NULL (|IDECOMP;ismonic| |f| |x| $))))
                                (PROGN (LETT #1# 'NIL . #4#) (GO #1#))))))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((SPADCALL |Jd| NIL (QREFELT $ 84))
                                  (SPADCALL
                                   (PROG2
                                       (LETT #2#
                                             (SPADCALL (|SPADfirst| |Jd|)
                                                       (QREFELT $ 86))
                                             . #4#)
                                       (QCDR #2#)
                                     (|check_union| (QEQCAR #2# 0)
                                                    (|OrderedVariableList|
                                                     (QREFELT $ 6))
                                                    #2#))
                                   |x| (QREFELT $ 88)))
                                 ('T 'NIL)))
                               (GO G191)))
                             (SEQ (EXIT (LETT |Jd| (CDR |Jd|) . #4#))) NIL
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |Jd| NIL (QREFELT $ 89))
                           (COND
                            ((< (SPADCALL |x| |truelist| (QREFELT $ 90)) |n|)
                             (PROGN (LETT #1# 'NIL . #4#) (GO #1#))))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT 'T)))))
      #1# (EXIT #1#))))) 

(DEFUN |IDECOMP;findvar| (J |truelist| $)
  (PROG (|badvar| |lmonicvar| |vt| |t| #1=#:G203 |f|)
    (RETURN
     (SEQ (LETT |lmonicvar| NIL . #2=(|IDECOMP;findvar|))
          (SEQ (LETT |f| NIL . #2#)
               (LETT #1# (SPADCALL J (QREFELT $ 33)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |t|
                      (SPADCALL |f| (SPADCALL |f| (QREFELT $ 91))
                                (QREFELT $ 71))
                      . #2#)
                (LETT |vt| (SPADCALL |t| (QREFELT $ 92)) . #2#)
                (EXIT
                 (COND
                  ((EQL (LENGTH |vt|) 1)
                   (LETT |lmonicvar| (SPADCALL |vt| |lmonicvar| (QREFELT $ 93))
                         . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |badvar| (SPADCALL |truelist| |lmonicvar| (QREFELT $ 52))
                . #2#)
          (EXIT (|SPADfirst| |badvar|)))))) 

(DEFUN |IDECOMP;reduceDim| (|flag| J |truelist| $)
  (PROG (|res1| #1=#:G234 JJ |sresult| |sideal| |good| #2=#:G233 II #3=#:G232
         |s| #4=#:G214 #5=#:G213 #6=#:G215 #7=#:G231 |f| #8=#:G230 #9=#:G229
         #10=#:G228 |idp| #11=#:G227 |Jc| |Jnew| #12=#:G226 #13=#:G225 |x|)
    (RETURN
     (SEQ
      (COND ((SPADCALL (|spadConstant| $ 47) J (QREFELT $ 48)) (LIST J))
            ((|IDECOMP;zerodimcase| J |truelist| $)
             (COND
              ((QEQCAR |flag| 0) (|IDECOMP;zeroPrimDecomp| J |truelist| $))
              ((QEQCAR |flag| 1)
               (LIST (|IDECOMP;zeroRadComp| J |truelist| $)))))
            (#14='T
             (SEQ
              (LETT |x| (|IDECOMP;findvar| J |truelist| $)
                    . #15=(|IDECOMP;reduceDim|))
              (LETT |Jnew|
                    (PROGN
                     (LETT #13# NIL . #15#)
                     (SEQ (LETT |f| NIL . #15#)
                          (LETT #12# (SPADCALL J (QREFELT $ 33)) . #15#) G190
                          (COND
                           ((OR (ATOM #12#)
                                (PROGN (LETT |f| (CAR #12#) . #15#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS (|IDECOMP;pushdown| |f| |x| $) #13#)
                                  . #15#)))
                          (LETT #12# (CDR #12#) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #13#))))
                    . #15#)
              (LETT |Jc| NIL . #15#)
              (LETT |Jc|
                    (|IDECOMP;reduceDim| |flag|
                     (SPADCALL |Jnew| (QREFELT $ 31))
                     (SPADCALL |x| |truelist| (QREFELT $ 94)) $)
                    . #15#)
              (LETT |res1|
                    (PROGN
                     (LETT #11# NIL . #15#)
                     (SEQ (LETT |idp| NIL . #15#) (LETT #10# |Jc| . #15#) G190
                          (COND
                           ((OR (ATOM #10#)
                                (PROGN (LETT |idp| (CAR #10#) . #15#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #11#
                                  (CONS
                                   (SPADCALL
                                    (PROGN
                                     (LETT #9# NIL . #15#)
                                     (SEQ (LETT |f| NIL . #15#)
                                          (LETT #8#
                                                (SPADCALL |idp| (QREFELT $ 33))
                                                . #15#)
                                          G190
                                          (COND
                                           ((OR (ATOM #8#)
                                                (PROGN
                                                 (LETT |f| (CAR #8#) . #15#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #9#
                                                  (CONS
                                                   (|IDECOMP;pushup| |f| |x| $)
                                                   #9#)
                                                  . #15#)))
                                          (LETT #8# (CDR #8#) . #15#) (GO G190)
                                          G191 (EXIT (NREVERSE #9#))))
                                    (QREFELT $ 32))
                                   #11#)
                                  . #15#)))
                          (LETT #10# (CDR #10#) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #11#))))
                    . #15#)
              (LETT |s|
                    (|IDECOMP;pushup|
                     (SPADCALL
                      (PROGN
                       (LETT #4# NIL . #15#)
                       (SEQ (LETT |f| NIL . #15#) (LETT #7# |Jnew| . #15#) G190
                            (COND
                             ((OR (ATOM #7#)
                                  (PROGN (LETT |f| (CAR #7#) . #15#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #6# (SPADCALL |f| (QREFELT $ 95)) . #15#)
                               (COND
                                (#4#
                                 (LETT #5# (SPADCALL #5# #6# (QREFELT $ 96))
                                       . #15#))
                                ('T
                                 (PROGN
                                  (LETT #5# #6# . #15#)
                                  (LETT #4# 'T . #15#)))))))
                            (LETT #7# (CDR #7#) . #15#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#4# #5#) (#14# (|spadConstant| $ 45))))
                      (QREFELT $ 97))
                     |x| $)
                    . #15#)
              (EXIT
               (COND ((EQL (SPADCALL |s| |x| (QREFELT $ 67)) 0) |res1|)
                     (#14#
                      (SEQ
                       (LETT |res1|
                             (PROGN
                              (LETT #3# NIL . #15#)
                              (SEQ (LETT II NIL . #15#)
                                   (LETT #2# |res1| . #15#) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN
                                          (LETT II (CAR #2#) . #15#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #3#
                                           (CONS
                                            (SPADCALL II |s| (QREFELT $ 80))
                                            #3#)
                                           . #15#)))
                                   (LETT #2# (CDR #2#) . #15#) (GO G190) G191
                                   (EXIT (NREVERSE #3#))))
                             . #15#)
                       (LETT |good| (|IDECOMP;goodPower| |s| J $) . #15#)
                       (LETT |sideal|
                             (SPADCALL
                              (SPADCALL
                               (CONS (QCAR |good|) (SPADCALL J (QREFELT $ 33)))
                               (QREFELT $ 64))
                              (QREFELT $ 31))
                             . #15#)
                       (EXIT
                        (COND
                         ((SPADCALL (QCDR |good|) |sideal| (QREFELT $ 82))
                          |res1|)
                         (#14#
                          (SEQ
                           (LETT |sresult|
                                 (|IDECOMP;reduceDim| |flag| |sideal|
                                  |truelist| $)
                                 . #15#)
                           (SEQ (LETT JJ NIL . #15#)
                                (LETT #1# |sresult| . #15#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT JJ (CAR #1#) . #15#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (SPADCALL (QCDR |good|) JJ
                                               (QREFELT $ 82)))
                                    (LETT |res1| (CONS JJ |res1|) . #15#)))))
                                (LETT #1# (CDR #1#) . #15#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |res1|)))))))))))))))) 

(DEFUN |IDECOMP;zeroPrimDecomp| (I |truelist| $)
  (PROG (|ris| #1=#:G242 J1 |g| #2=#:G237 #3=#:G243 |ef| |lfact| |Jd| |x| J
         |lval| |newJ|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |truelist| NIL (QREFELT $ 50)) (SPADCALL I (QREFELT $ 99)))
        ('T
         (SEQ
          (LETT |newJ| (|IDECOMP;genPosLastVar| I |truelist| $)
                . #4=(|IDECOMP;zeroPrimDecomp|))
          (LETT |lval| (QCAR |newJ|) . #4#)
          (LETT J (SPADCALL (QCDR |newJ|) (QREFELT $ 79)) . #4#)
          (LETT |x| (SPADCALL |truelist| '|last| (QREFELT $ 56)) . #4#)
          (LETT |Jd| (SPADCALL J (QREFELT $ 33)) . #4#)
          (LETT |g| (SPADCALL |Jd| '|last| (QREFELT $ 61)) . #4#)
          (LETT |lfact|
                (SPADCALL (SPADCALL |g| (QREFELT $ 102)) (QREFELT $ 105))
                . #4#)
          (LETT |ris| NIL . #4#)
          (SEQ (LETT |ef| NIL . #4#) (LETT #3# |lfact| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ef| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |g|
                      (SPADCALL (QCAR |ef|)
                                (PROG1 (LETT #2# (QCDR |ef|) . #4#)
                                  (|check_subtype| (>= #2# 0)
                                                   '(|NonNegativeInteger|)
                                                   #2#))
                                (QREFELT $ 106))
                      . #4#)
                (LETT J1
                      (SPADCALL (SPADCALL (CONS |g| |Jd|) (QREFELT $ 64))
                                (QREFELT $ 31))
                      . #4#)
                (COND
                 ((NULL (|IDECOMP;is0dimprimary| J1 |truelist| $))
                  (PROGN
                   (LETT #1# (|IDECOMP;zeroPrimDecomp| I |truelist| $) . #4#)
                   (GO #1#))))
                (EXIT
                 (LETT |ris|
                       (CONS
                        (SPADCALL (|IDECOMP;backGenPos| J1 |lval| |truelist| $)
                                  (QREFELT $ 79))
                        |ris|)
                       . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |ris|)))))
      #1# (EXIT #1#))))) 

(DEFUN |IDECOMP;radical;2Pi;13| (I $)
  (PROG (#1=#:G251 #2=#:G250 #3=#:G252 #4=#:G256 #5=#:G103 |truelist| #6=#:G245
         #7=#:G244 #8=#:G246 #9=#:G255 |f| J)
    (RETURN
     (SEQ
      (LETT J (SPADCALL (|IDECOMP;internalForm| I $) (QREFELT $ 79))
            . #10=(|IDECOMP;radical;2Pi;13|))
      (LETT |truelist|
            (|IDECOMP;rearrange|
             (PROGN
              (LETT #6# NIL . #10#)
              (SEQ (LETT |f| NIL . #10#)
                   (LETT #9# (SPADCALL J (QREFELT $ 33)) . #10#) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |f| (CAR #9#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #8# (SPADCALL |f| (QREFELT $ 92)) . #10#)
                      (COND
                       (#6#
                        (LETT #7# (SPADCALL #7# #8# (QREFELT $ 93)) . #10#))
                       ('T
                        (PROGN (LETT #7# #8# . #10#) (LETT #6# 'T . #10#)))))))
                   (LETT #9# (CDR #9#) . #10#) (GO G190) G191 (EXIT NIL))
              (COND (#6# #7#) (#11='T (|IdentityError| '|setUnion|))))
             $)
            . #10#)
      (EXIT
       (COND
        ((SPADCALL |truelist| NIL (QREFELT $ 50)) (|IDECOMP;externalForm| J $))
        (#11#
         (|IDECOMP;externalForm|
          (PROGN
           (LETT #1# NIL . #10#)
           (SEQ (LETT #5# NIL . #10#)
                (LETT #4#
                      (|IDECOMP;reduceDim| (CONS 1 "zeroRadComp") J |truelist|
                       $)
                      . #10#)
                G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) . #10#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3# #5# . #10#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 107)) . #10#))
                    ('T (PROGN (LETT #2# #3# . #10#) (LETT #1# 'T . #10#)))))))
                (LETT #4# (CDR #4#) . #10#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) (#11# (|IdentityError| '|intersect|))))
          $)))))))) 

(DEFUN |IDECOMP;pushdown| (|g| |x| $)
  (PROG (|rf| |g1| |i|)
    (RETURN
     (SEQ (LETT |rf| (|spadConstant| $ 65) . #1=(|IDECOMP;pushdown|))
          (LETT |i| (SPADCALL |x| (QREFELT $ 44) (QREFELT $ 90)) . #1#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |g| (|spadConstant| $ 65) (QREFELT $ 78)))
                 (GO G191)))
               (SEQ (LETT |g1| (SPADCALL |g| (QREFELT $ 91)) . #1#)
                    (LETT |rf|
                          (SPADCALL |rf|
                                    (|IDECOMP;pushdterm|
                                     (SPADCALL |g| |g1| (QREFELT $ 71)) |x| |i|
                                     $)
                                    (QREFELT $ 70))
                          . #1#)
                    (EXIT (LETT |g| |g1| . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |rf|))))) 

(DEFUN |IDECOMP;pushdterm| (|t| |x| |i| $)
  (PROG (#1=#:G262 |newt| |cf| |xp| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |t| |x| (QREFELT $ 67)) . #2=(|IDECOMP;pushdterm|))
      (LETT |xp| (SPADCALL |x| (QREFELT $ 109)) . #2#)
      (LETT |cf|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 110) |xp| |n| (QREFELT $ 111))
             (QREFELT $ 112))
            . #2#)
      (LETT |newt|
            (SPADCALL |t|
                      (SPADCALL (|spadConstant| $ 47) |x| |n| (QREFELT $ 113))
                      (QREFELT $ 59))
            . #2#)
      (EXIT
       (SPADCALL |cf|
                 (PROG2 (LETT #1# |newt| . #2#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0)
                                  (|DistributedMultivariatePolynomial|
                                   (QREFELT $ 6)
                                   (|Fraction| (|Polynomial| (|Integer|))))
                                  #1#))
                 (QREFELT $ 114))))))) 

(DEFUN |IDECOMP;pushup| (|f| |x| $)
  (PROG (|rf| |g| |h| |xp|)
    (RETURN
     (SEQ (LETT |h| (|spadConstant| $ 110) . #1=(|IDECOMP;pushup|))
          (LETT |rf| (|spadConstant| $ 65) . #1#) (LETT |g| |f| . #1#)
          (LETT |xp| (SPADCALL |x| (QREFELT $ 109)) . #1#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |g| (|spadConstant| $ 65) (QREFELT $ 78)))
                 (GO G191)))
               (SEQ
                (LETT |h|
                      (SPADCALL
                       (|IDECOMP;trueden|
                        (SPADCALL (SPADCALL |g| (QREFELT $ 95)) (QREFELT $ 17))
                        |xp| $)
                       |h| (QREFELT $ 115))
                      . #1#)
                (EXIT (LETT |g| (SPADCALL |g| (QREFELT $ 91)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |f|
                (SPADCALL (SPADCALL |h| (QREFELT $ 112)) |f| (QREFELT $ 114))
                . #1#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |f| (|spadConstant| $ 65) (QREFELT $ 78)))
                 (GO G191)))
               (SEQ (LETT |g| (SPADCALL |f| (QREFELT $ 91)) . #1#)
                    (LETT |rf|
                          (SPADCALL |rf|
                                    (|IDECOMP;pushuterm|
                                     (SPADCALL |f| |g| (QREFELT $ 71)) |xp| |x|
                                     $)
                                    (QREFELT $ 70))
                          . #1#)
                    (EXIT (LETT |f| |g| . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |rf|))))) 

(DEFUN |IDECOMP;trueden| (|c| |x| $)
  (COND ((EQL (SPADCALL |c| |x| (QREFELT $ 116)) 0) (|spadConstant| $ 110))
        ('T |c|))) 

(DEFUN |IDECOMP;pushuterm| (|t| |xp| |x| $)
  (SPADCALL
   (|IDECOMP;pushucoef|
    (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT $ 95)) (QREFELT $ 15)) |xp|
              (QREFELT $ 117))
    |x| $)
   (SPADCALL
    (SPADCALL
     (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT $ 95)) (QREFELT $ 17))
               (QREFELT $ 112))
     (QREFELT $ 118))
    (SPADCALL |t| (QREFELT $ 120)) (QREFELT $ 121))
   (QREFELT $ 81))) 

(DEFUN |IDECOMP;pushucoef| (|c| |x| $)
  (COND
   ((SPADCALL |c| (|spadConstant| $ 123) (QREFELT $ 124))
    (|spadConstant| $ 65))
   ('T
    (SPADCALL
     (SPADCALL
      (SPADCALL (SPADCALL (SPADCALL |c| (QREFELT $ 125)) (QREFELT $ 112))
                (QREFELT $ 97))
      |x| (SPADCALL |c| (QREFELT $ 126)) (QREFELT $ 113))
     (|IDECOMP;pushucoef| (SPADCALL |c| (QREFELT $ 127)) |x| $)
     (QREFELT $ 70))))) 

(DEFUN |IDECOMP;is0dimprimary| (J |truelist| $)
  (PROG (JP #1=#:G292 JM |i| #2=#:G281 |x| #3=#:G293 |f| JR |Jd|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL (|spadConstant| $ 47) J (QREFELT $ 48)) 'T)
             (#4='T
              (SEQ
               (LETT |Jd| (SPADCALL (SPADCALL J (QREFELT $ 79)) (QREFELT $ 33))
                     . #5=(|IDECOMP;is0dimprimary|))
               (EXIT
                (COND
                 ((SPADCALL
                   (LENGTH
                    (SPADCALL
                     (SPADCALL (SPADCALL |Jd| '|last| (QREFELT $ 61))
                               (QREFELT $ 102))
                     (QREFELT $ 105)))
                   1 (QREFELT $ 68))
                  (PROGN (LETT #1# 'NIL . #5#) (GO #1#)))
                 (#4#
                  (SEQ
                   (LETT |i| (SPADCALL (LENGTH |truelist|) 1 (QREFELT $ 128))
                         . #5#)
                   (EXIT
                    (COND ((QEQCAR |i| 1) (PROGN (LETT #1# 'T . #5#) (GO #1#)))
                          (#4#
                           (SEQ (LETT JR (REVERSE |Jd|) . #5#)
                                (LETT JM
                                      (SPADCALL (LIST (|SPADfirst| JR))
                                                (QREFELT $ 31))
                                      . #5#)
                                (LETT JP NIL . #5#)
                                (SEQ (LETT |f| NIL . #5#)
                                     (LETT #3# (CDR JR) . #5#) G190
                                     (COND
                                      ((OR (ATOM #3#)
                                           (PROGN
                                            (LETT |f| (CAR #3#) . #5#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((|IDECOMP;ismonic| |f|
                                          (SPADCALL |truelist| (QCDR |i|)
                                                    (QREFELT $ 129))
                                          $)
                                         (SEQ
                                          (LETT |x|
                                                (SPADCALL |truelist| (QCDR |i|)
                                                          (QREFELT $ 129))
                                                . #5#)
                                          (LETT |i|
                                                (CONS 0
                                                      (PROG1
                                                          (LETT #2#
                                                                (- (QCDR |i|)
                                                                   1)
                                                                . #5#)
                                                        (|check_subtype|
                                                         (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         #2#)))
                                                . #5#)
                                          (COND
                                           ((NULL
                                             (|IDECOMP;testPower|
                                              (SPADCALL |f| |x| (QREFELT $ 73))
                                              |x| JM $))
                                            (PROGN
                                             (LETT #1# 'NIL . #5#)
                                             (GO #1#))))
                                          (EXIT
                                           (LETT JM
                                                 (SPADCALL
                                                  (APPEND (CONS |f| JP)
                                                          (SPADCALL JM
                                                                    (QREFELT $
                                                                             33)))
                                                  (QREFELT $ 31))
                                                 . #5#))))
                                        ('T
                                         (SEQ
                                          (COND
                                           ((NULL
                                             (SPADCALL |f| JM (QREFELT $ 130)))
                                            (PROGN
                                             (LETT #1# 'NIL . #5#)
                                             (GO #1#))))
                                          (EXIT
                                           (LETT JP (CONS |f| JP) . #5#)))))))
                                     (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT 'T)))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |IDECOMP;genPosLastVar| (J |truelist| $)
  (PROG (#1=#:G307 |p| #2=#:G306 |val| #3=#:G297 #4=#:G296 #5=#:G298 #6=#:G304
         |vv| #7=#:G305 |rv| |ranvals| #8=#:G303 #9=#:G302 |lv1| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL |truelist| (QREFELT $ 131))
            . #10=(|IDECOMP;genPosLastVar|))
      (LETT |lv1| (SPADCALL |x| |truelist| (QREFELT $ 94)) . #10#)
      (LETT |ranvals|
            (PROGN
             (LETT #9# NIL . #10#)
             (SEQ (LETT |vv| NIL . #10#) (LETT #8# |lv1| . #10#) G190
                  (COND
                   ((OR (ATOM #8#) (PROGN (LETT |vv| (CAR #8#) . #10#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #9# (CONS (RANDOM 23) #9#) . #10#)))
                  (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                  (EXIT (NREVERSE #9#))))
            . #10#)
      (LETT |val|
            (PROGN
             (LETT #3# NIL . #10#)
             (SEQ (LETT |rv| NIL . #10#) (LETT #7# |ranvals| . #10#)
                  (LETT |vv| NIL . #10#) (LETT #6# |lv1| . #10#) G190
                  (COND
                   ((OR (ATOM #6#) (PROGN (LETT |vv| (CAR #6#) . #10#) NIL)
                        (ATOM #7#) (PROGN (LETT |rv| (CAR #7#) . #10#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #5#
                           (SPADCALL |rv| (SPADCALL |vv| (QREFELT $ 60))
                                     (QREFELT $ 69))
                           . #10#)
                     (COND
                      (#3# (LETT #4# (SPADCALL #4# #5# (QREFELT $ 70)) . #10#))
                      ('T
                       (PROGN (LETT #4# #5# . #10#) (LETT #3# 'T . #10#)))))))
                  (LETT #6# (PROG1 (CDR #6#) (LETT #7# (CDR #7#) . #10#))
                        . #10#)
                  (GO G190) G191 (EXIT NIL))
             (COND (#3# #4#) ('T (|spadConstant| $ 65))))
            . #10#)
      (LETT |val| (SPADCALL |val| (SPADCALL |x| (QREFELT $ 60)) (QREFELT $ 70))
            . #10#)
      (EXIT
       (CONS |ranvals|
             (SPADCALL
              (SPADCALL
               (PROGN
                (LETT #2# NIL . #10#)
                (SEQ (LETT |p| NIL . #10#)
                     (LETT #1# (SPADCALL J (QREFELT $ 33)) . #10#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #10#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (SPADCALL (SPADCALL |p| |x| (QREFELT $ 73)) |val|
                                        (QREFELT $ 75))
                              #2#)
                             . #10#)))
                     (LETT #1# (CDR #1#) . #10#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               (QREFELT $ 64))
              (QREFELT $ 31)))))))) 

(DEFUN |IDECOMP;backGenPos| (I |lval| |truelist| $)
  (PROG (#1=#:G326 |p| #2=#:G325 |val| #3=#:G318 #4=#:G317 #5=#:G319 #6=#:G323
         |vv| #7=#:G324 |rv| |lv1| |x|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |lval| NIL (QREFELT $ 133)) I)
            (#8='T
             (SEQ
              (LETT |x| (SPADCALL |truelist| (QREFELT $ 131))
                    . #9=(|IDECOMP;backGenPos|))
              (LETT |lv1| (SPADCALL |x| |truelist| (QREFELT $ 94)) . #9#)
              (LETT |val|
                    (SPADCALL
                     (PROGN
                      (LETT #3# NIL . #9#)
                      (SEQ (LETT |rv| NIL . #9#) (LETT #7# |lval| . #9#)
                           (LETT |vv| NIL . #9#) (LETT #6# |lv1| . #9#) G190
                           (COND
                            ((OR (ATOM #6#)
                                 (PROGN (LETT |vv| (CAR #6#) . #9#) NIL)
                                 (ATOM #7#)
                                 (PROGN (LETT |rv| (CAR #7#) . #9#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #5#
                                    (SPADCALL |rv|
                                              (SPADCALL |vv| (QREFELT $ 60))
                                              (QREFELT $ 69))
                                    . #9#)
                              (COND
                               (#3#
                                (LETT #4# (SPADCALL #4# #5# (QREFELT $ 70))
                                      . #9#))
                               ('T
                                (PROGN
                                 (LETT #4# #5# . #9#)
                                 (LETT #3# 'T . #9#)))))))
                           (LETT #6#
                                 (PROG1 (CDR #6#) (LETT #7# (CDR #7#) . #9#))
                                 . #9#)
                           (GO G190) G191 (EXIT NIL))
                      (COND (#3# #4#) (#8# (|spadConstant| $ 65))))
                     (QREFELT $ 134))
                    . #9#)
              (LETT |val|
                    (SPADCALL |val| (SPADCALL |x| (QREFELT $ 60))
                              (QREFELT $ 70))
                    . #9#)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #9#)
                  (SEQ (LETT |p| NIL . #9#)
                       (LETT #1# (SPADCALL I (QREFELT $ 33)) . #9#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |p| |x| (QREFELT $ 73))
                                          |val| (QREFELT $ 75))
                                #2#)
                               . #9#)))
                       (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 64))
                (QREFELT $ 31)))))))))) 

(DEFUN |IDECOMP;ismonic| (|f| |x| $)
  (SPADCALL (SPADCALL (SPADCALL |f| |x| (QREFELT $ 73)) (QREFELT $ 135))
            (QREFELT $ 136))) 

(DEFUN |IDECOMP;testPower| (|uf| |x| J $)
  (PROG (|g| |linp| |trailp| #1=#:G329 |df| #2=#:G328)
    (RETURN
     (SEQ
      (LETT |df|
            (PROG1
                (LETT #2# (SPADCALL |uf| (QREFELT $ 137))
                      . #3=(|IDECOMP;testPower|))
              (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
            . #3#)
      (LETT |trailp|
            (SPADCALL (SPADCALL (SPADCALL |df| (QREFELT $ 11)) (QREFELT $ 118))
                      (SPADCALL |uf|
                                (PROG1 (LETT #1# (- |df| 1) . #3#)
                                  (|check_subtype| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                                (QREFELT $ 138))
                      (QREFELT $ 114))
            . #3#)
      (LETT |linp|
            (SPADCALL
             (SPADCALL (SPADCALL (|spadConstant| $ 47) 1 (QREFELT $ 139))
                       (SPADCALL |trailp| 0 (QREFELT $ 139)) (QREFELT $ 140))
             |df| (QREFELT $ 141))
            . #3#)
      (LETT |g|
            (SPADCALL (SPADCALL |uf| |linp| (QREFELT $ 142)) |x|
                      (QREFELT $ 143))
            . #3#)
      (EXIT (SPADCALL |g| J (QREFELT $ 130))))))) 

(DEFUN |IDECOMP;zeroDimPrime?;PiB;25| (I $)
  (PROG (|lfact| |g| |i| #1=#:G341 #2=#:G342 |f| |Jd| |n| J)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT J
              (SPADCALL
               (QCDR
                (|IDECOMP;genPosLastVar| (|IDECOMP;internalForm| I $)
                 (QREFELT $ 44) $))
               (QREFELT $ 79))
              . #3=(|IDECOMP;zeroDimPrime?;PiB;25|))
        (EXIT
         (COND ((SPADCALL (|spadConstant| $ 47) J (QREFELT $ 48)) 'T)
               (#4='T
                (SEQ (LETT |n| (LENGTH (QREFELT $ 6)) . #3#) (LETT |i| 1 . #3#)
                     (LETT |Jd| (SPADCALL J (QREFELT $ 33)) . #3#)
                     (EXIT
                      (COND ((SPADCALL (LENGTH |Jd|) |n| (QREFELT $ 68)) 'NIL)
                            (#4#
                             (SEQ
                              (SEQ (LETT |f| NIL . #3#) (LETT #2# |Jd| . #3#)
                                   G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN
                                          (LETT |f| (CAR #2#) . #3#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (COND
                                     ((NULL
                                       (|IDECOMP;ismonic| |f|
                                        (SPADCALL (QREFELT $ 44) |i|
                                                  (QREFELT $ 129))
                                        $))
                                      (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))
                                    (COND
                                     ((< |i| |n|)
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL
                                          (SPADCALL |f|
                                                    (SPADCALL (QREFELT $ 44)
                                                              |i|
                                                              (QREFELT $ 129))
                                                    (QREFELT $ 73))
                                          (QREFELT $ 137))
                                         1 (QREFELT $ 68))
                                        (PROGN
                                         (LETT #1# 'NIL . #3#)
                                         (GO #1#))))))
                                    (EXIT (LETT |i| (+ |i| 1) . #3#)))
                                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |g| (SPADCALL |Jd| |n| (QREFELT $ 144))
                                    . #3#)
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LENGTH
                                   (LETT |lfact|
                                         (SPADCALL
                                          (SPADCALL |g| (QREFELT $ 102))
                                          (QREFELT $ 105))
                                         . #3#))
                                  1 (QREFELT $ 145))
                                 'NIL)
                                (#4#
                                 (EQL
                                  (QCDR (SPADCALL |lfact| 1 (QREFELT $ 146)))
                                  1))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |IDECOMP;zeroDimPrimary?;PiB;26| (J $)
  (|IDECOMP;is0dimprimary| (|IDECOMP;internalForm| J $) (QREFELT $ 44) $)) 

(DEFUN |IDECOMP;primaryDecomp;PiL;27| (I $)
  (PROG (#1=#:G355 II #2=#:G354 |truelist| #3=#:G345 #4=#:G344 #5=#:G346
         #6=#:G353 |f| J)
    (RETURN
     (SEQ
      (LETT J (SPADCALL (|IDECOMP;internalForm| I $) (QREFELT $ 79))
            . #7=(|IDECOMP;primaryDecomp;PiL;27|))
      (LETT |truelist|
            (|IDECOMP;rearrange|
             (PROGN
              (LETT #3# NIL . #7#)
              (SEQ (LETT |f| NIL . #7#)
                   (LETT #6# (SPADCALL J (QREFELT $ 33)) . #7#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |f| (CAR #6#) . #7#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #5# (SPADCALL |f| (QREFELT $ 92)) . #7#)
                      (COND
                       (#3# (LETT #4# (SPADCALL #4# #5# (QREFELT $ 93)) . #7#))
                       ('T
                        (PROGN (LETT #4# #5# . #7#) (LETT #3# 'T . #7#)))))))
                   (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
              (COND (#3# #4#) (#8='T (|IdentityError| '|setUnion|))))
             $)
            . #7#)
      (EXIT
       (COND
        ((SPADCALL |truelist| NIL (QREFELT $ 50))
         (LIST (|IDECOMP;externalForm| J $)))
        (#8#
         (PROGN
          (LETT #2# NIL . #7#)
          (SEQ (LETT II NIL . #7#)
               (LETT #1#
                     (|IDECOMP;reduceDim| (CONS 0 "zeroPrimDecomp") J
                      |truelist| $)
                     . #7#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT II (CAR #1#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT #2# (CONS (|IDECOMP;externalForm| II $) #2#) . #7#)))
               (LETT #1# (CDR #1#) . #7#) (GO G190) G191
               (EXIT (NREVERSE #2#))))))))))) 

(DEFUN |IDECOMP;contract;PiLPi;28| (I |lvar| $)
  (PROG (#1=#:G385 |gg| #2=#:G384 |fullPol| #3=#:G383 |vv| #4=#:G382 J
         #5=#:G153 #6=#:G381 |f| #7=#:G380 |lJ| #8=#:G379 |g| #9=#:G378
         |subsVars| #10=#:G377 #11=#:G376 |newVars| #12=#:G375 #13=#:G374 |n|
         |fullVars| #14=#:G357 #15=#:G356 #16=#:G358 #17=#:G373 |Id|)
    (RETURN
     (SEQ
      (LETT |Id| (SPADCALL (SPADCALL I (QREFELT $ 151)) (QREFELT $ 21))
            . #18=(|IDECOMP;contract;PiLPi;28|))
      (EXIT
       (COND ((NULL |Id|) I)
             (#19='T
              (SEQ
               (LETT |fullVars|
                     (PROGN
                      (LETT #14# NIL . #18#)
                      (SEQ (LETT |g| NIL . #18#) (LETT #17# |Id| . #18#) G190
                           (COND
                            ((OR (ATOM #17#)
                                 (PROGN (LETT |g| (CAR #17#) . #18#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #16# (SPADCALL |g| (QREFELT $ 152)) . #18#)
                              (COND
                               (#14#
                                (LETT #15# (SPADCALL #15# #16# (QREFELT $ 93))
                                      . #18#))
                               ('T
                                (PROGN
                                 (LETT #15# #16# . #18#)
                                 (LETT #14# 'T . #18#)))))))
                           (LETT #17# (CDR #17#) . #18#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#14# #15#) (#19# (|IdentityError| '|setUnion|))))
                     . #18#)
               (EXIT
                (COND ((SPADCALL |fullVars| |lvar| (QREFELT $ 50)) I)
                      (#19#
                       (SEQ (LETT |n| (LENGTH |lvar|) . #18#)
                            (EXIT
                             (COND
                              ((< (LENGTH |fullVars|) |n|)
                               (|error| "wrong vars"))
                              ((EQL |n| 0) I)
                              (#19#
                               (SEQ
                                (LETT |newVars|
                                      (APPEND
                                       (PROGN
                                        (LETT #13# NIL . #18#)
                                        (SEQ (LETT |vv| NIL . #18#)
                                             (LETT #12# |fullVars| . #18#) G190
                                             (COND
                                              ((OR (ATOM #12#)
                                                   (PROGN
                                                    (LETT |vv| (CAR #12#)
                                                          . #18#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((COND
                                                  ((SPADCALL |vv| |lvar|
                                                             (QREFELT $ 153))
                                                   'NIL)
                                                  (#19# 'T))
                                                 (LETT #13# (CONS |vv| #13#)
                                                       . #18#)))))
                                             (LETT #12# (CDR #12#) . #18#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #13#))))
                                       |lvar|)
                                      . #18#)
                                (LETT |subsVars|
                                      (PROGN
                                       (LETT #11# NIL . #18#)
                                       (SEQ (LETT |vv| NIL . #18#)
                                            (LETT #10# |newVars| . #18#) G190
                                            (COND
                                             ((OR (ATOM #10#)
                                                  (PROGN
                                                   (LETT |vv| (CAR #10#)
                                                         . #18#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #11#
                                                    (CONS
                                                     (SPADCALL
                                                      (|spadConstant| $ 154)
                                                      |vv| 1 (QREFELT $ 155))
                                                     #11#)
                                                    . #18#)))
                                            (LETT #10# (CDR #10#) . #18#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #11#))))
                                      . #18#)
                                (LETT |lJ|
                                      (PROGN
                                       (LETT #9# NIL . #18#)
                                       (SEQ (LETT |g| NIL . #18#)
                                            (LETT #8# |Id| . #18#) G190
                                            (COND
                                             ((OR (ATOM #8#)
                                                  (PROGN
                                                   (LETT |g| (CAR #8#) . #18#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #9#
                                                    (CONS
                                                     (SPADCALL |g| |fullVars|
                                                               |subsVars|
                                                               (QREFELT $ 157))
                                                     #9#)
                                                    . #18#)))
                                            (LETT #8# (CDR #8#) . #18#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #9#))))
                                      . #18#)
                                (LETT J (SPADCALL |lJ| (QREFELT $ 159)) . #18#)
                                (EXIT
                                 (COND
                                  ((SPADCALL J (LIST (|spadConstant| $ 154))
                                             (QREFELT $ 160))
                                   (SPADCALL J (QREFELT $ 38)))
                                  ((SPADCALL J (LIST (|spadConstant| $ 161))
                                             (QREFELT $ 160))
                                   (SPADCALL NIL (QREFELT $ 38)))
                                  (#19#
                                   (SEQ
                                    (LETT J
                                          (PROGN
                                           (LETT #7# NIL . #18#)
                                           (SEQ (LETT |f| NIL . #18#)
                                                (LETT #6# J . #18#) G190
                                                (COND
                                                 ((OR (ATOM #6#)
                                                      (PROGN
                                                       (LETT |f| (CAR #6#)
                                                             . #18#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL
                                                     (PROG2
                                                         (LETT #5#
                                                               (SPADCALL |f|
                                                                         (QREFELT
                                                                          $
                                                                          162))
                                                               . #18#)
                                                         (QCDR #5#)
                                                       (|check_union|
                                                        (QEQCAR #5# 0)
                                                        (|OrderedVariableList|
                                                         (QREFELT $ 6))
                                                        #5#))
                                                     |newVars| (QREFELT $ 153))
                                                    (LETT #7# (CONS |f| #7#)
                                                          . #18#)))))
                                                (LETT #6# (CDR #6#) . #18#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #7#))))
                                          . #18#)
                                    (LETT |fullPol|
                                          (PROGN
                                           (LETT #4# NIL . #18#)
                                           (SEQ (LETT |vv| NIL . #18#)
                                                (LETT #3# |fullVars| . #18#)
                                                G190
                                                (COND
                                                 ((OR (ATOM #3#)
                                                      (PROGN
                                                       (LETT |vv| (CAR #3#)
                                                             . #18#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #4#
                                                        (CONS
                                                         (SPADCALL
                                                          (|spadConstant| $
                                                                          154)
                                                          |vv| 1
                                                          (QREFELT $ 155))
                                                         #4#)
                                                        . #18#)))
                                                (LETT #3# (CDR #3#) . #18#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #4#))))
                                          . #18#)
                                    (EXIT
                                     (SPADCALL
                                      (PROGN
                                       (LETT #2# NIL . #18#)
                                       (SEQ (LETT |gg| NIL . #18#)
                                            (LETT #1# J . #18#) G190
                                            (COND
                                             ((OR (ATOM #1#)
                                                  (PROGN
                                                   (LETT |gg| (CAR #1#) . #18#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #2#
                                                    (CONS
                                                     (SPADCALL |gg| |newVars|
                                                               |fullPol|
                                                               (QREFELT $ 157))
                                                     #2#)
                                                    . #18#)))
                                            (LETT #1# (CDR #1#) . #18#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #2#))))
                                      (QREFELT $ 38))))))))))))))))))))))) 

(DECLAIM (NOTINLINE |IdealDecompositionPackage;|)) 

(DEFUN |IdealDecompositionPackage| (#1=#:G388)
  (PROG ()
    (RETURN
     (PROG (#2=#:G389)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|IdealDecompositionPackage|)
                                           '|domainEqualList|)
                . #3=(|IdealDecompositionPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|IdealDecompositionPackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|IdealDecompositionPackage|))))))))))) 

(DEFUN |IdealDecompositionPackage;| (|#1|)
  (PROG (#1=#:G156 #2=#:G153 #3=#:G387 |xx| #4=#:G386 |pv$| $ |dv$| DV$1)
    (RETURN
     (SEQ
      (PROGN
       (LETT DV$1 (|devaluate| |#1|) . #5=(|IdealDecompositionPackage|))
       (LETT |dv$| (LIST '|IdealDecompositionPackage| DV$1) . #5#)
       (LETT $ (GETREFV 164) . #5#)
       (QSETREFV $ 0 |dv$|)
       (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #5#))
       (|haddProp| |$ConstructorCache| '|IdealDecompositionPackage| (LIST DV$1)
                   (CONS 1 $))
       (|stuffDomainSlots| $)
       (QSETREFV $ 6 |#1|)
       (SETF |pv$| (QREFELT $ 3))
       (QSETREFV $ 44
                 (PROGN
                  (LETT #4# NIL . #5#)
                  (SEQ (LETT |xx| NIL . #5#) (LETT #3# |#1| . #5#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |xx| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4#
                               (CONS
                                (PROG2
                                    (LETT #2# (SPADCALL |xx| (QREFELT $ 43))
                                          . #5#)
                                    (QCDR #2#)
                                  (|check_union| (QEQCAR #2# 0)
                                                 (|OrderedVariableList|
                                                  (SPADCALL |xx|
                                                            (QREFELT $ 43)))
                                                 #2#))
                                #4#)
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #4#)))))
       (QSETREFV $ 46
                 (PROG1 (LETT #1# (- (LENGTH (QREFELT $ 44)) 1) . #5#)
                   (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))
       $))))) 

(MAKEPROP '|IdealDecompositionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|) (|Fraction| 7)
              (0 . |numer|) (|Fraction| 14) (5 . |coerce|) (10 . |denom|)
              (15 . /) (|Polynomial| 7) (21 . |numer|) (26 . |ground|)
              (31 . |denom|) (36 . /) (|List| 24)
              (|PolynomialIdeal| 8 119 42 24) (42 . |generators|)
              (|DistributedMultivariatePolynomial| 6 10) (|Mapping| 10 8)
              (|DistributedMultivariatePolynomial| 6 8)
              (|MPolyCatFunctions2| 42 119 119 8 10 24 22) (47 . |map|)
              (|Boolean|) (53 . |groebner?|) (|List| 22)
              (|PolynomialIdeal| 10 119 42 22) (58 . |groebnerIdeal|)
              (63 . |ideal|) (68 . |generators|) (|Mapping| 8 10)
              (|MPolyCatFunctions2| 42 119 119 10 8 22 24) (73 . |map|)
              (79 . |groebner?|) (84 . |groebnerIdeal|) (89 . |ideal|)
              (|Union| $ '"failed") (|Symbol|) (|OrderedVariableList| 6)
              (94 . |variable|) '|lvint| (99 . |One|) '|nvint1| (103 . |One|)
              (107 . |element?|) (|List| 42) (113 . =) (119 . >)
              (125 . |setDifference|) (|Mapping| 27 42 42) (131 . |sort|)
              '"last" (137 . |elt|) (143 . |differentiate|) (149 . |gcd|)
              (155 . |exquo|) (161 . |coerce|) (166 . |elt|) (172 . |remove|)
              (|GroebnerPackage| 10 119 42 22) (178 . |groebner|)
              (183 . |Zero|) (|NonNegativeInteger|) (187 . |degree|) (193 . ~=)
              (199 . *) (205 . +) (211 . -) (|SparseUnivariatePolynomial| $)
              (217 . |univariate|) (|SparseUnivariatePolynomial| 22)
              (223 . |elt|) (229 . |Zero|) (233 . |Zero|) (237 . ~=)
              (243 . |groebner|) (248 . |saturate|) (254 . *) (260 . |in?|)
              (266 . |One|) (270 . ~=) (|Union| 42 '"failed")
              (276 . |mainVariable|) (281 . ~=) (287 . =) (293 . =)
              (299 . |position|) (305 . |reductum|) (310 . |variables|)
              (315 . |setUnion|) (321 . |remove|) (327 . |leadingCoefficient|)
              (332 . *) (338 . |coerce|) (|List| 30) (343 . |list|)
              (|Factored| 22)
              (|MPolyCatRationalFunctionFactorizer| 119 42 7 22)
              (348 . |factor|) (|Record| (|:| |factor| 22) (|:| |exponent| 7))
              (|List| 103) (353 . |factors|) (358 . ^) (364 . |intersect|)
              |IDECOMP;radical;2Pi;13| (370 . |convert|) (375 . |One|)
              (379 . |monomial|) (386 . |coerce|) (391 . |monomial|) (398 . *)
              (404 . |lcm|) (410 . |degree|) (416 . |univariate|) (422 . |inv|)
              (|DirectProduct| (NRTEVAL (LENGTH (QREFELT $ 6))) 66)
              (427 . |degree|) (432 . |monomial|)
              (|SparseUnivariatePolynomial| 14) (438 . |Zero|) (442 . =)
              (448 . |leadingCoefficient|) (453 . |degree|) (458 . |reductum|)
              (463 . |subtractIfCan|) (469 . |elt|) (475 . |inRadical?|)
              (481 . |last|) (|List| 7) (486 . =) (492 . -)
              (497 . |leadingCoefficient|) (502 . |ground?|) (507 . |degree|)
              (512 . |coefficient|) (518 . |monomial|) (524 . +) (530 . ^)
              (536 . -) (542 . |multivariate|) (548 . |elt|) (554 . >)
              (560 . |elt|) |IDECOMP;zeroDimPrime?;PiB;25|
              |IDECOMP;zeroDimPrimary?;PiB;26| (|List| 20)
              |IDECOMP;primaryDecomp;PiL;27| (566 . |groebner|)
              (571 . |variables|) (576 . |member?|) (582 . |One|)
              (586 . |monomial|) (|List| $) (593 . |eval|)
              (|GroebnerPackage| 8 119 42 24) (600 . |groebner|) (605 . =)
              (611 . |Zero|) (615 . |mainVariable|)
              |IDECOMP;contract;PiLPi;28|)
           '#(|zeroDimPrime?| 620 |zeroDimPrimary?| 625 |radical| 630 |prime?|
              635 |primaryDecomp| 640 |contract| 645)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 163
                                                 '(1 8 7 0 9 1 10 0 7 11 1 8 7
                                                   0 12 2 10 0 0 0 13 1 10 14 0
                                                   15 1 14 7 0 16 1 10 14 0 17
                                                   2 8 0 7 7 18 1 20 19 0 21 2
                                                   25 22 23 24 26 1 20 27 0 28
                                                   1 30 0 29 31 1 30 0 29 32 1
                                                   30 29 0 33 2 35 24 34 22 36
                                                   1 30 27 0 37 1 20 0 19 38 1
                                                   20 0 19 39 1 42 40 41 43 0
                                                   10 0 45 0 22 0 47 2 30 27 22
                                                   0 48 2 49 27 0 0 50 2 42 27
                                                   0 0 51 2 49 0 0 0 52 2 49 0
                                                   53 0 54 2 49 42 0 55 56 2 22
                                                   0 0 42 57 2 22 0 0 0 58 2 22
                                                   40 0 0 59 1 22 0 42 60 2 29
                                                   22 0 55 61 2 29 0 22 0 62 1
                                                   63 29 29 64 0 22 0 65 2 22
                                                   66 0 42 67 2 66 27 0 0 68 2
                                                   22 0 7 0 69 2 22 0 0 0 70 2
                                                   22 0 0 0 71 2 22 72 0 42 73
                                                   2 74 22 0 22 75 0 10 0 76 0
                                                   8 0 77 2 22 27 0 0 78 1 30 0
                                                   0 79 2 30 0 0 22 80 2 22 0 0
                                                   0 81 2 30 27 0 0 82 0 8 0 83
                                                   2 29 27 0 0 84 1 22 85 0 86
                                                   2 42 27 0 0 87 2 42 27 0 0
                                                   88 2 29 27 0 0 89 2 49 7 42
                                                   0 90 1 22 0 0 91 1 22 49 0
                                                   92 2 49 0 0 0 93 2 49 0 42 0
                                                   94 1 22 10 0 95 2 10 0 0 0
                                                   96 1 22 0 10 97 1 98 0 30 99
                                                   1 101 100 22 102 1 100 104 0
                                                   105 2 22 0 0 66 106 2 30 0 0
                                                   0 107 1 42 41 0 109 0 14 0
                                                   110 3 14 0 0 41 66 111 1 10
                                                   0 14 112 3 22 0 0 42 66 113
                                                   2 22 0 10 0 114 2 14 0 0 0
                                                   115 2 14 66 0 41 116 2 14 72
                                                   0 41 117 1 10 0 0 118 1 22
                                                   119 0 120 2 22 0 10 119 121
                                                   0 122 0 123 2 122 27 0 0 124
                                                   1 122 14 0 125 1 122 66 0
                                                   126 1 122 0 0 127 2 66 40 0
                                                   0 128 2 49 42 0 7 129 2 30
                                                   27 22 0 130 1 49 42 0 131 2
                                                   132 27 0 0 133 1 22 0 0 134
                                                   1 74 22 0 135 1 22 27 0 136
                                                   1 74 66 0 137 2 74 22 0 66
                                                   138 2 74 0 22 66 139 2 74 0
                                                   0 0 140 2 74 0 0 66 141 2 74
                                                   0 0 0 142 2 22 0 72 42 143 2
                                                   29 22 0 7 144 2 66 27 0 0
                                                   145 2 104 103 0 7 146 1 20 0
                                                   0 151 1 24 49 0 152 2 49 27
                                                   42 0 153 0 24 0 154 3 24 0 0
                                                   42 66 155 3 24 0 0 49 156
                                                   157 1 158 19 19 159 2 19 27
                                                   0 0 160 0 24 0 161 1 24 85 0
                                                   162 1 0 27 20 147 1 0 27 20
                                                   148 1 0 20 20 108 1 0 27 20
                                                   1 1 0 149 20 150 2 0 20 20
                                                   49 163)))))
           '|lookupComplete|)) 
