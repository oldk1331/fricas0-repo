
(/VERSIONCHECK 2) 

(DEFUN |IDECOMP;convertQF| (|a| $)
  (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 10)) (QREFELT $ 12))
            (SPADCALL (SPADCALL |a| (QREFELT $ 13)) (QREFELT $ 12))
            (QREFELT $ 14))) 

(DEFUN |IDECOMP;convertFQ| (|a| $)
  (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 16)) (QREFELT $ 17))
            (SPADCALL (SPADCALL |a| (QREFELT $ 18)) (QREFELT $ 17))
            (QREFELT $ 19))) 

(DEFUN |IDECOMP;internalForm| (I $)
  (PROG (|nId| #1=#:G167 |poly| #2=#:G166 |Id|)
    (RETURN
     (SEQ (LETT |Id| (SPADCALL I (QREFELT $ 22)) . #3=(|IDECOMP;internalForm|))
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
                                |poly| (QREFELT $ 27))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND ((SPADCALL I (QREFELT $ 29)) (SPADCALL |nId| (QREFELT $ 32)))
                 ('T (SPADCALL |nId| (QREFELT $ 33))))))))) 

(DEFUN |IDECOMP;externalForm| (I $)
  (PROG (|nId| #1=#:G173 |poly| #2=#:G172 |Id|)
    (RETURN
     (SEQ (LETT |Id| (SPADCALL I (QREFELT $ 34)) . #3=(|IDECOMP;externalForm|))
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
                                |poly| (QREFELT $ 37))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND ((SPADCALL I (QREFELT $ 38)) (SPADCALL |nId| (QREFELT $ 39)))
                 ('T (SPADCALL |nId| (QREFELT $ 40))))))))) 

(DEFUN |IDECOMP;deleteunit| (|lI| $)
  (PROG (#1=#:G183 I #2=#:G182)
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
                   (SPADCALL (QREFELT $ 45)
                             (SPADCALL (QREFELT $ 45) |vlist| (QREFELT $ 52))
                             (QREFELT $ 52))
                   (QREFELT $ 54))))) 

(DEFUN |IDECOMP;zeroRadComp| (I |truelist| $)
  (PROG (|ris| #1=#:G200 |h| #2=#:G199 |lf| |Id| #3=#:G198 #4=#:G197 |pw| |pv|
         |val| |g| #5=#:G186 |f| |py| |px| |y| |x|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |truelist| NIL (QREFELT $ 50)) I)
            (#6='T
             (SEQ
              (LETT |Id| (SPADCALL I (QREFELT $ 34))
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
                      (EXIT (SPADCALL (LIST |g|) (QREFELT $ 32)))))
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
                              (SPADCALL (CDR |Id|) (QREFELT $ 32))
                              (CDR |truelist|) $)
                             (QREFELT $ 34))
                            . #7#)
                      (LETT |ris| (CONS |lf| |ris|) . #7#)
                      (COND
                       ((SPADCALL |pv| (|spadConstant| $ 65) (QREFELT $ 76))
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
                                 (QREFELT $ 32)))))))))))))) 

(DEFUN |IDECOMP;goodPower| (|s| I $)
  (PROG (|f| #1=#:G208 |g| #2=#:G207 J JJ)
    (RETURN
     (SEQ (LETT |f| |s| . #3=(|IDECOMP;goodPower|))
          (LETT I (SPADCALL I (QREFELT $ 77)) . #3#)
          (LETT J
                (SPADCALL (LETT JJ (SPADCALL I |s| (QREFELT $ 78)) . #3#)
                          (QREFELT $ 34))
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
                                    (CONS (SPADCALL |f| |g| (QREFELT $ 79))
                                          #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      (QREFELT $ 33))
                     I (QREFELT $ 80))
                    'NIL)
                   ('T 'T)))
                 (GO G191)))
               (SEQ (EXIT (LETT |f| (SPADCALL |s| |f| (QREFELT $ 79)) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |f| JJ)))))) 

(DEFUN |IDECOMP;zerodimcase| (J |truelist| $)
  (PROG (#1=#:G219 |Jd| #2=#:G175 |y| |f| #3=#:G220 |x| |n|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL (|spadConstant| $ 47) J (QREFELT $ 48))
             (SPADCALL |truelist| NIL (QREFELT $ 50)))
         'T)
        ('T
         (SEQ (LETT |n| (LENGTH |truelist|) . #4=(|IDECOMP;zerodimcase|))
              (LETT |Jd| (SPADCALL (SPADCALL J (QREFELT $ 34)) (QREFELT $ 64))
                    . #4#)
              (SEQ (LETT |x| NIL . #4#) (LETT #3# |truelist| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL)
                         (NULL (SPADCALL |Jd| NIL (QREFELT $ 81))))
                     (GO G191)))
                   (SEQ (LETT |f| (|SPADfirst| |Jd|) . #4#)
                        (LETT |Jd| (CDR |Jd|) . #4#)
                        (SEQ (LETT |y| (SPADCALL |f| (QREFELT $ 83)) . #4#)
                             (EXIT
                              (COND
                               ((OR (QEQCAR |y| 1)
                                    (OR
                                     (SPADCALL (QCDR |y|) |x| (QREFELT $ 84))
                                     (NULL (|IDECOMP;ismonic| |f| |x| $))))
                                (PROGN (LETT #1# 'NIL . #4#) (GO #1#))))))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((SPADCALL |Jd| NIL (QREFELT $ 81))
                                  (SPADCALL
                                   (PROG2
                                       (LETT #2#
                                             (SPADCALL (|SPADfirst| |Jd|)
                                                       (QREFELT $ 83))
                                             . #4#)
                                       (QCDR #2#)
                                     (|check_union| (QEQCAR #2# 0)
                                                    (|OrderedVariableList|
                                                     (QREFELT $ 6))
                                                    #2#))
                                   |x| (QREFELT $ 85)))
                                 ('T 'NIL)))
                               (GO G191)))
                             (SEQ (EXIT (LETT |Jd| (CDR |Jd|) . #4#))) NIL
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |Jd| NIL (QREFELT $ 86))
                           (COND
                            ((< (SPADCALL |x| |truelist| (QREFELT $ 87)) |n|)
                             (PROGN (LETT #1# 'NIL . #4#) (GO #1#))))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT 'T)))))
      #1# (EXIT #1#))))) 

(DEFUN |IDECOMP;findvar| (J |truelist| $)
  (PROG (|badvar| |lmonicvar| |vt| |t| #1=#:G225 |f|)
    (RETURN
     (SEQ (LETT |lmonicvar| NIL . #2=(|IDECOMP;findvar|))
          (SEQ (LETT |f| NIL . #2#)
               (LETT #1# (SPADCALL J (QREFELT $ 34)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |t|
                      (SPADCALL |f| (SPADCALL |f| (QREFELT $ 88))
                                (QREFELT $ 71))
                      . #2#)
                (LETT |vt| (SPADCALL |t| (QREFELT $ 89)) . #2#)
                (EXIT
                 (COND
                  ((EQL (LENGTH |vt|) 1)
                   (LETT |lmonicvar| (SPADCALL |vt| |lmonicvar| (QREFELT $ 90))
                         . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |badvar| (SPADCALL |truelist| |lmonicvar| (QREFELT $ 52))
                . #2#)
          (EXIT (|SPADfirst| |badvar|)))))) 

(DEFUN |IDECOMP;reduceDim| (|flag| J |truelist| $)
  (PROG (|res1| #1=#:G256 JJ |sresult| |sideal| |good| #2=#:G255 II #3=#:G254
         |s| #4=#:G236 #5=#:G235 #6=#:G237 #7=#:G253 |f| #8=#:G252 #9=#:G251
         #10=#:G250 |idp| #11=#:G249 |Jc| |Jnew| #12=#:G248 #13=#:G247 |x|)
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
                          (LETT #12# (SPADCALL J (QREFELT $ 34)) . #15#) G190
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
                     (SPADCALL |Jnew| (QREFELT $ 32))
                     (SPADCALL |x| |truelist| (QREFELT $ 91)) $)
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
                                                (SPADCALL |idp| (QREFELT $ 34))
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
                                    (QREFELT $ 33))
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
                               (LETT #6# (SPADCALL |f| (QREFELT $ 92)) . #15#)
                               (COND
                                (#4#
                                 (LETT #5# (SPADCALL #5# #6# (QREFELT $ 93))
                                       . #15#))
                                ('T
                                 (PROGN
                                  (LETT #5# #6# . #15#)
                                  (LETT #4# 'T . #15#)))))))
                            (LETT #7# (CDR #7#) . #15#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#4# #5#) (#14# (|spadConstant| $ 94))))
                      (QREFELT $ 95))
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
                                            (SPADCALL II |s| (QREFELT $ 78))
                                            #3#)
                                           . #15#)))
                                   (LETT #2# (CDR #2#) . #15#) (GO G190) G191
                                   (EXIT (NREVERSE #3#))))
                             . #15#)
                       (LETT |good| (|IDECOMP;goodPower| |s| J $) . #15#)
                       (LETT |sideal|
                             (SPADCALL
                              (SPADCALL
                               (CONS (QCAR |good|) (SPADCALL J (QREFELT $ 34)))
                               (QREFELT $ 64))
                              (QREFELT $ 32))
                             . #15#)
                       (EXIT
                        (COND
                         ((SPADCALL (QCDR |good|) |sideal| (QREFELT $ 80))
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
                                               (QREFELT $ 80)))
                                    (LETT |res1| (CONS JJ |res1|) . #15#)))))
                                (LETT #1# (CDR #1#) . #15#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |res1|)))))))))))))))) 

(DEFUN |IDECOMP;zeroPrimDecomp| (I |truelist| $)
  (PROG (|ris| #1=#:G264 J1 |g| #2=#:G259 #3=#:G265 |ef| |lfact| |Jd| |x| J
         |lval| |newJ|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |truelist| NIL (QREFELT $ 50)) (SPADCALL I (QREFELT $ 97)))
        ('T
         (SEQ
          (LETT |newJ| (|IDECOMP;genPosLastVar| I |truelist| $)
                . #4=(|IDECOMP;zeroPrimDecomp|))
          (LETT |lval| (QCAR |newJ|) . #4#)
          (LETT J (SPADCALL (QCDR |newJ|) (QREFELT $ 77)) . #4#)
          (LETT |x| (SPADCALL |truelist| '|last| (QREFELT $ 56)) . #4#)
          (LETT |Jd| (SPADCALL J (QREFELT $ 34)) . #4#)
          (LETT |g| (SPADCALL |Jd| '|last| (QREFELT $ 61)) . #4#)
          (LETT |lfact|
                (SPADCALL (SPADCALL |g| (QREFELT $ 100)) (QREFELT $ 103))
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
                                (QREFELT $ 104))
                      . #4#)
                (LETT J1
                      (SPADCALL (SPADCALL (CONS |g| |Jd|) (QREFELT $ 64))
                                (QREFELT $ 32))
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
                                  (QREFELT $ 77))
                        |ris|)
                       . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |ris|)))))
      #1# (EXIT #1#))))) 

(DEFUN |IDECOMP;radical;2Pi;13| (I $)
  (PROG (#1=#:G273 #2=#:G272 #3=#:G274 #4=#:G278 #5=#:G125 |truelist| #6=#:G267
         #7=#:G266 #8=#:G268 #9=#:G277 |f| J)
    (RETURN
     (SEQ
      (LETT J (SPADCALL (|IDECOMP;internalForm| I $) (QREFELT $ 77))
            . #10=(|IDECOMP;radical;2Pi;13|))
      (LETT |truelist|
            (|IDECOMP;rearrange|
             (PROGN
              (LETT #6# NIL . #10#)
              (SEQ (LETT |f| NIL . #10#)
                   (LETT #9# (SPADCALL J (QREFELT $ 34)) . #10#) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |f| (CAR #9#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #8# (SPADCALL |f| (QREFELT $ 89)) . #10#)
                      (COND
                       (#6#
                        (LETT #7# (SPADCALL #7# #8# (QREFELT $ 90)) . #10#))
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
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 105)) . #10#))
                    ('T (PROGN (LETT #2# #3# . #10#) (LETT #1# 'T . #10#)))))))
                (LETT #4# (CDR #4#) . #10#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) (#11# (|IdentityError| '|intersect|))))
          $)))))))) 

(DEFUN |IDECOMP;pushdown| (|g| |x| $)
  (PROG (|rf| |g1| |i|)
    (RETURN
     (SEQ (LETT |rf| (|spadConstant| $ 65) . #1=(|IDECOMP;pushdown|))
          (LETT |i| (SPADCALL |x| (QREFELT $ 45) (QREFELT $ 87)) . #1#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |g| (|spadConstant| $ 65) (QREFELT $ 76)))
                 (GO G191)))
               (SEQ (LETT |g1| (SPADCALL |g| (QREFELT $ 88)) . #1#)
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
  (PROG (#1=#:G284 |newt| |cf| |xp| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |t| |x| (QREFELT $ 67)) . #2=(|IDECOMP;pushdterm|))
      (LETT |xp| (SPADCALL |x| (QREFELT $ 107)) . #2#)
      (LETT |cf|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 108) |xp| |n| (QREFELT $ 109))
             (QREFELT $ 110))
            . #2#)
      (LETT |newt|
            (SPADCALL |t|
                      (SPADCALL (|spadConstant| $ 47) |x| |n| (QREFELT $ 111))
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
                 (QREFELT $ 112))))))) 

(DEFUN |IDECOMP;pushup| (|f| |x| $)
  (PROG (|rf| |g| |h| |xp|)
    (RETURN
     (SEQ (LETT |h| (|spadConstant| $ 108) . #1=(|IDECOMP;pushup|))
          (LETT |rf| (|spadConstant| $ 65) . #1#) (LETT |g| |f| . #1#)
          (LETT |xp| (SPADCALL |x| (QREFELT $ 107)) . #1#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |g| (|spadConstant| $ 65) (QREFELT $ 76)))
                 (GO G191)))
               (SEQ
                (LETT |h|
                      (SPADCALL
                       (|IDECOMP;trueden|
                        (SPADCALL (SPADCALL |g| (QREFELT $ 92)) (QREFELT $ 18))
                        |xp| $)
                       |h| (QREFELT $ 113))
                      . #1#)
                (EXIT (LETT |g| (SPADCALL |g| (QREFELT $ 88)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |f|
                (SPADCALL (SPADCALL |h| (QREFELT $ 110)) |f| (QREFELT $ 112))
                . #1#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |f| (|spadConstant| $ 65) (QREFELT $ 76)))
                 (GO G191)))
               (SEQ (LETT |g| (SPADCALL |f| (QREFELT $ 88)) . #1#)
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
  (COND ((EQL (SPADCALL |c| |x| (QREFELT $ 114)) 0) (|spadConstant| $ 108))
        ('T |c|))) 

(DEFUN |IDECOMP;pushuterm| (|t| |xp| |x| $)
  (SPADCALL
   (|IDECOMP;pushucoef|
    (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT $ 92)) (QREFELT $ 16)) |xp|
              (QREFELT $ 115))
    |x| $)
   (SPADCALL
    (SPADCALL
     (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT $ 92)) (QREFELT $ 18))
               (QREFELT $ 110))
     (QREFELT $ 116))
    (SPADCALL |t| (QREFELT $ 118)) (QREFELT $ 119))
   (QREFELT $ 79))) 

(DEFUN |IDECOMP;pushucoef| (|c| |x| $)
  (COND
   ((SPADCALL |c| (|spadConstant| $ 121) (QREFELT $ 122))
    (|spadConstant| $ 65))
   ('T
    (SPADCALL
     (SPADCALL
      (SPADCALL (SPADCALL (SPADCALL |c| (QREFELT $ 123)) (QREFELT $ 110))
                (QREFELT $ 95))
      |x| (SPADCALL |c| (QREFELT $ 124)) (QREFELT $ 111))
     (|IDECOMP;pushucoef| (SPADCALL |c| (QREFELT $ 125)) |x| $)
     (QREFELT $ 70))))) 

(DEFUN |IDECOMP;is0dimprimary| (J |truelist| $)
  (PROG (JP #1=#:G314 JM |i| #2=#:G303 |x| #3=#:G315 |f| JR |Jd|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL (|spadConstant| $ 47) J (QREFELT $ 48)) 'T)
             (#4='T
              (SEQ
               (LETT |Jd| (SPADCALL (SPADCALL J (QREFELT $ 77)) (QREFELT $ 34))
                     . #5=(|IDECOMP;is0dimprimary|))
               (EXIT
                (COND
                 ((SPADCALL
                   (LENGTH
                    (SPADCALL
                     (SPADCALL (SPADCALL |Jd| '|last| (QREFELT $ 61))
                               (QREFELT $ 100))
                     (QREFELT $ 103)))
                   1 (QREFELT $ 68))
                  (PROGN (LETT #1# 'NIL . #5#) (GO #1#)))
                 (#4#
                  (SEQ
                   (LETT |i| (SPADCALL (LENGTH |truelist|) 1 (QREFELT $ 126))
                         . #5#)
                   (EXIT
                    (COND ((QEQCAR |i| 1) (PROGN (LETT #1# 'T . #5#) (GO #1#)))
                          (#4#
                           (SEQ (LETT JR (REVERSE |Jd|) . #5#)
                                (LETT JM
                                      (SPADCALL (LIST (|SPADfirst| JR))
                                                (QREFELT $ 32))
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
                                                    (QREFELT $ 127))
                                          $)
                                         (SEQ
                                          (LETT |x|
                                                (SPADCALL |truelist| (QCDR |i|)
                                                          (QREFELT $ 127))
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
                                                                             34)))
                                                  (QREFELT $ 32))
                                                 . #5#))))
                                        ('T
                                         (SEQ
                                          (COND
                                           ((NULL
                                             (SPADCALL |f| JM (QREFELT $ 128)))
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
  (PROG (#1=#:G329 |p| #2=#:G328 |val| #3=#:G319 #4=#:G318 #5=#:G320 #6=#:G326
         |vv| #7=#:G327 |rv| |ranvals| #8=#:G325 #9=#:G324 |lv1| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL |truelist| (QREFELT $ 129))
            . #10=(|IDECOMP;genPosLastVar|))
      (LETT |lv1| (SPADCALL |x| |truelist| (QREFELT $ 91)) . #10#)
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
                     (LETT #1# (SPADCALL J (QREFELT $ 34)) . #10#) G190
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
              (QREFELT $ 32)))))))) 

(DEFUN |IDECOMP;backGenPos| (I |lval| |truelist| $)
  (PROG (#1=#:G348 |p| #2=#:G347 |val| #3=#:G340 #4=#:G339 #5=#:G341 #6=#:G345
         |vv| #7=#:G346 |rv| |lv1| |x|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |lval| NIL (QREFELT $ 131)) I)
            (#8='T
             (SEQ
              (LETT |x| (SPADCALL |truelist| (QREFELT $ 129))
                    . #9=(|IDECOMP;backGenPos|))
              (LETT |lv1| (SPADCALL |x| |truelist| (QREFELT $ 91)) . #9#)
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
                     (QREFELT $ 132))
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
                       (LETT #1# (SPADCALL I (QREFELT $ 34)) . #9#) G190
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
                (QREFELT $ 32)))))))))) 

(DEFUN |IDECOMP;ismonic| (|f| |x| $)
  (SPADCALL (SPADCALL (SPADCALL |f| |x| (QREFELT $ 73)) (QREFELT $ 133))
            (QREFELT $ 134))) 

(DEFUN |IDECOMP;testPower| (|uf| |x| J $)
  (PROG (|g| |linp| |trailp| #1=#:G351 |df| #2=#:G350)
    (RETURN
     (SEQ
      (LETT |df|
            (PROG1
                (LETT #2# (SPADCALL |uf| (QREFELT $ 135))
                      . #3=(|IDECOMP;testPower|))
              (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
            . #3#)
      (LETT |trailp|
            (SPADCALL (SPADCALL (SPADCALL |df| (QREFELT $ 12)) (QREFELT $ 116))
                      (SPADCALL |uf|
                                (PROG1 (LETT #1# (- |df| 1) . #3#)
                                  (|check_subtype| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                                (QREFELT $ 136))
                      (QREFELT $ 112))
            . #3#)
      (LETT |linp|
            (SPADCALL
             (SPADCALL (SPADCALL (|spadConstant| $ 47) 1 (QREFELT $ 137))
                       (SPADCALL |trailp| 0 (QREFELT $ 137)) (QREFELT $ 138))
             |df| (QREFELT $ 139))
            . #3#)
      (LETT |g|
            (SPADCALL (SPADCALL |uf| |linp| (QREFELT $ 140)) |x|
                      (QREFELT $ 141))
            . #3#)
      (EXIT (SPADCALL |g| J (QREFELT $ 128))))))) 

(DEFUN |IDECOMP;zeroDimPrime?;PiB;25| (I $)
  (PROG (|lfact| |g| |i| #1=#:G363 #2=#:G364 |f| |Jd| |n| J)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT J
              (SPADCALL
               (QCDR
                (|IDECOMP;genPosLastVar| (|IDECOMP;internalForm| I $)
                 (QREFELT $ 45) $))
               (QREFELT $ 77))
              . #3=(|IDECOMP;zeroDimPrime?;PiB;25|))
        (EXIT
         (COND ((SPADCALL (|spadConstant| $ 47) J (QREFELT $ 48)) 'T)
               (#4='T
                (SEQ (LETT |n| (LENGTH (QREFELT $ 6)) . #3#) (LETT |i| 1 . #3#)
                     (LETT |Jd| (SPADCALL J (QREFELT $ 34)) . #3#)
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
                                        (SPADCALL (QREFELT $ 45) |i|
                                                  (QREFELT $ 127))
                                        $))
                                      (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))
                                    (COND
                                     ((< |i| |n|)
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL
                                          (SPADCALL |f|
                                                    (SPADCALL (QREFELT $ 45)
                                                              |i|
                                                              (QREFELT $ 127))
                                                    (QREFELT $ 73))
                                          (QREFELT $ 135))
                                         1 (QREFELT $ 68))
                                        (PROGN
                                         (LETT #1# 'NIL . #3#)
                                         (GO #1#))))))
                                    (EXIT (LETT |i| (+ |i| 1) . #3#)))
                                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |g| (SPADCALL |Jd| |n| (QREFELT $ 142))
                                    . #3#)
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LENGTH
                                   (LETT |lfact|
                                         (SPADCALL
                                          (SPADCALL |g| (QREFELT $ 100))
                                          (QREFELT $ 103))
                                         . #3#))
                                  1 (QREFELT $ 143))
                                 'NIL)
                                (#4#
                                 (EQL
                                  (QCDR (SPADCALL |lfact| 1 (QREFELT $ 144)))
                                  1))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |IDECOMP;zeroDimPrimary?;PiB;26| (J $)
  (|IDECOMP;is0dimprimary| (|IDECOMP;internalForm| J $) (QREFELT $ 45) $)) 

(DEFUN |IDECOMP;primaryDecomp;PiL;27| (I $)
  (PROG (#1=#:G377 II #2=#:G376 |truelist| #3=#:G367 #4=#:G366 #5=#:G368
         #6=#:G375 |f| J)
    (RETURN
     (SEQ
      (LETT J (SPADCALL (|IDECOMP;internalForm| I $) (QREFELT $ 77))
            . #7=(|IDECOMP;primaryDecomp;PiL;27|))
      (LETT |truelist|
            (|IDECOMP;rearrange|
             (PROGN
              (LETT #3# NIL . #7#)
              (SEQ (LETT |f| NIL . #7#)
                   (LETT #6# (SPADCALL J (QREFELT $ 34)) . #7#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |f| (CAR #6#) . #7#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #5# (SPADCALL |f| (QREFELT $ 89)) . #7#)
                      (COND
                       (#3# (LETT #4# (SPADCALL #4# #5# (QREFELT $ 90)) . #7#))
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
  (PROG (#1=#:G407 |gg| #2=#:G406 |fullPol| #3=#:G405 |vv| #4=#:G404 J
         #5=#:G175 #6=#:G403 |f| #7=#:G402 |lJ| #8=#:G401 |g| #9=#:G400
         |subsVars| #10=#:G399 #11=#:G398 |newVars| #12=#:G397 #13=#:G396 |n|
         |fullVars| #14=#:G379 #15=#:G378 #16=#:G380 #17=#:G395 |Id|)
    (RETURN
     (SEQ
      (LETT |Id| (SPADCALL (SPADCALL I (QREFELT $ 149)) (QREFELT $ 22))
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
                              (LETT #16# (SPADCALL |g| (QREFELT $ 150)) . #18#)
                              (COND
                               (#14#
                                (LETT #15# (SPADCALL #15# #16# (QREFELT $ 90))
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
                                                             (QREFELT $ 151))
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
                                                      (|spadConstant| $ 152)
                                                      |vv| 1 (QREFELT $ 153))
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
                                                               (QREFELT $ 155))
                                                     #9#)
                                                    . #18#)))
                                            (LETT #8# (CDR #8#) . #18#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #9#))))
                                      . #18#)
                                (LETT J (SPADCALL |lJ| (QREFELT $ 157)) . #18#)
                                (EXIT
                                 (COND
                                  ((SPADCALL J (LIST (|spadConstant| $ 152))
                                             (QREFELT $ 158))
                                   (SPADCALL J (QREFELT $ 39)))
                                  ((SPADCALL J (LIST (|spadConstant| $ 159))
                                             (QREFELT $ 158))
                                   (SPADCALL NIL (QREFELT $ 39)))
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
                                                                          160))
                                                               . #18#)
                                                         (QCDR #5#)
                                                       (|check_union|
                                                        (QEQCAR #5# 0)
                                                        (|OrderedVariableList|
                                                         (QREFELT $ 6))
                                                        #5#))
                                                     |newVars| (QREFELT $ 151))
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
                                                                          152)
                                                          |vv| 1
                                                          (QREFELT $ 153))
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
                                                               (QREFELT $ 155))
                                                     #2#)
                                                    . #18#)))
                                            (LETT #1# (CDR #1#) . #18#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #2#))))
                                      (QREFELT $ 39))))))))))))))))))))))) 

(DEFUN |IdealDecompositionPackage| (&REST #1=#:G410)
  (PROG ()
    (RETURN
     (PROG (#2=#:G411)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|IdealDecompositionPackage|)
                                           '|domainEqualList|)
                . #3=(|IdealDecompositionPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |IdealDecompositionPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|IdealDecompositionPackage|))))))))))) 

(DEFUN |IdealDecompositionPackage;| (|#1| |#2|)
  (PROG (#1=#:G178 #2=#:G175 #3=#:G409 |xx| #4=#:G408 |pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (SEQ
      (PROGN
       (LETT DV$1 (|devaluate| |#1|) . #5=(|IdealDecompositionPackage|))
       (LETT DV$2 (|devaluate| |#2|) . #5#)
       (LETT |dv$| (LIST '|IdealDecompositionPackage| DV$1 DV$2) . #5#)
       (LETT $ (GETREFV 162) . #5#)
       (QSETREFV $ 0 |dv$|)
       (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #5#))
       (|haddProp| |$ConstructorCache| '|IdealDecompositionPackage|
                   (LIST DV$1 DV$2) (CONS 1 $))
       (|stuffDomainSlots| $)
       (QSETREFV $ 6 |#1|)
       (QSETREFV $ 7 |#2|)
       (SETF |pv$| (QREFELT $ 3))
       (QSETREFV $ 45
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
                                    (LETT #2# (SPADCALL |xx| (QREFELT $ 44))
                                          . #5#)
                                    (QCDR #2#)
                                  (|check_union| (QEQCAR #2# 0)
                                                 (|OrderedVariableList|
                                                  (SPADCALL |xx|
                                                            (QREFELT $ 44)))
                                                 #2#))
                                #4#)
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #4#)))))
       (QSETREFV $ 46
                 (PROG1 (LETT #1# (- (LENGTH (QREFELT $ 45)) 1) . #5#)
                   (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))
       $))))) 

(MAKEPROP '|IdealDecompositionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (|Fraction| 8) (0 . |numer|) (|Fraction| 15) (5 . |coerce|)
              (10 . |denom|) (15 . /) (|Polynomial| 8) (21 . |numer|)
              (26 . |ground|) (31 . |denom|) (36 . /) (|List| 25)
              (|PolynomialIdeal| 9 (|DirectProduct| 7 66) 43 25)
              (42 . |generators|) (|DistributedMultivariatePolynomial| 6 11)
              (|Mapping| 11 9) (|DistributedMultivariatePolynomial| 6 9)
              (|MPolyCatFunctions2| 43 (|DirectProduct| 7 66)
                                    (|DirectProduct| 7 66) 9 11 25 23)
              (47 . |map|) (|Boolean|) (53 . |groebner?|) (|List| 23)
              (|PolynomialIdeal| 11 (|DirectProduct| 7 66) 43 23)
              (58 . |groebnerIdeal|) (63 . |ideal|) (68 . |generators|)
              (|Mapping| 9 11)
              (|MPolyCatFunctions2| 43 (|DirectProduct| 7 66)
                                    (|DirectProduct| 7 66) 11 9 23 25)
              (73 . |map|) (79 . |groebner?|) (84 . |groebnerIdeal|)
              (89 . |ideal|) (|Union| $ '"failed") (|Symbol|)
              (|OrderedVariableList| 6) (94 . |variable|) '|lvint| '|nvint1|
              (99 . |One|) (103 . |element?|) (|List| 43) (109 . =) (115 . >)
              (121 . |setDifference|) (|Mapping| 28 43 43) (127 . |sort|)
              '"last" (133 . |elt|) (139 . |differentiate|) (145 . |gcd|)
              (151 . |exquo|) (157 . |coerce|) (162 . |elt|) (168 . |remove|)
              (|GroebnerPackage| 11 (|DirectProduct| 7 66) 43 23)
              (174 . |groebner|) (179 . |Zero|) (|NonNegativeInteger|)
              (183 . |degree|) (189 . ~=) (195 . *) (201 . +) (207 . -)
              (|SparseUnivariatePolynomial| $) (213 . |univariate|)
              (|SparseUnivariatePolynomial| 23) (219 . |elt|) (225 . ~=)
              (231 . |groebner|) (236 . |saturate|) (242 . *) (248 . |in?|)
              (254 . ~=) (|Union| 43 '"failed") (260 . |mainVariable|)
              (265 . ~=) (271 . =) (277 . =) (283 . |position|)
              (289 . |reductum|) (294 . |variables|) (299 . |setUnion|)
              (305 . |remove|) (311 . |leadingCoefficient|) (316 . *)
              (322 . |One|) (326 . |coerce|) (|List| 31) (331 . |list|)
              (|Factored| 23)
              (|MPolyCatRationalFunctionFactorizer| (|DirectProduct| 7 66) 43 8
                                                    23)
              (336 . |factor|) (|Record| (|:| |factor| 23) (|:| |exponent| 8))
              (|List| 101) (341 . |factors|) (346 . ^) (352 . |intersect|)
              |IDECOMP;radical;2Pi;13| (358 . |convert|) (363 . |One|)
              (367 . |monomial|) (374 . |coerce|) (379 . |monomial|) (386 . *)
              (392 . |lcm|) (398 . |degree|) (404 . |univariate|) (410 . |inv|)
              (|DirectProduct| (NRTEVAL (LENGTH (QREFELT $ 6))) 66)
              (415 . |degree|) (420 . |monomial|)
              (|SparseUnivariatePolynomial| 15) (426 . |Zero|) (430 . =)
              (436 . |leadingCoefficient|) (441 . |degree|) (446 . |reductum|)
              (451 . |subtractIfCan|) (457 . |elt|) (463 . |inRadical?|)
              (469 . |last|) (|List| 8) (474 . =) (480 . -)
              (485 . |leadingCoefficient|) (490 . |ground?|) (495 . |degree|)
              (500 . |coefficient|) (506 . |monomial|) (512 . +) (518 . ^)
              (524 . -) (530 . |multivariate|) (536 . |elt|) (542 . >)
              (548 . |elt|) |IDECOMP;zeroDimPrime?;PiB;25|
              |IDECOMP;zeroDimPrimary?;PiB;26| (|List| 21)
              |IDECOMP;primaryDecomp;PiL;27| (554 . |groebner|)
              (559 . |variables|) (564 . |member?|) (570 . |One|)
              (574 . |monomial|) (|List| $) (581 . |eval|)
              (|GroebnerPackage| 9 (|DirectProduct| 7 66) 43 25)
              (588 . |groebner|) (593 . =) (599 . |Zero|)
              (603 . |mainVariable|) |IDECOMP;contract;PiLPi;28|)
           '#(|zeroDimPrime?| 608 |zeroDimPrimary?| 613 |radical| 618 |prime?|
              623 |primaryDecomp| 628 |contract| 633)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 161
                                                 '(1 9 8 0 10 1 11 0 8 12 1 9 8
                                                   0 13 2 11 0 0 0 14 1 11 15 0
                                                   16 1 15 8 0 17 1 11 15 0 18
                                                   2 9 0 8 8 19 1 21 20 0 22 2
                                                   26 23 24 25 27 1 21 28 0 29
                                                   1 31 0 30 32 1 31 0 30 33 1
                                                   31 30 0 34 2 36 25 35 23 37
                                                   1 31 28 0 38 1 21 0 20 39 1
                                                   21 0 20 40 1 43 41 42 44 0
                                                   23 0 47 2 31 28 23 0 48 2 49
                                                   28 0 0 50 2 43 28 0 0 51 2
                                                   49 0 0 0 52 2 49 0 53 0 54 2
                                                   49 43 0 55 56 2 23 0 0 43 57
                                                   2 23 0 0 0 58 2 23 41 0 0 59
                                                   1 23 0 43 60 2 30 23 0 55 61
                                                   2 30 0 23 0 62 1 63 30 30 64
                                                   0 23 0 65 2 23 66 0 43 67 2
                                                   66 28 0 0 68 2 23 0 8 0 69 2
                                                   23 0 0 0 70 2 23 0 0 0 71 2
                                                   23 72 0 43 73 2 74 23 0 23
                                                   75 2 23 28 0 0 76 1 31 0 0
                                                   77 2 31 0 0 23 78 2 23 0 0 0
                                                   79 2 31 28 0 0 80 2 30 28 0
                                                   0 81 1 23 82 0 83 2 43 28 0
                                                   0 84 2 43 28 0 0 85 2 30 28
                                                   0 0 86 2 49 8 43 0 87 1 23 0
                                                   0 88 1 23 49 0 89 2 49 0 0 0
                                                   90 2 49 0 43 0 91 1 23 11 0
                                                   92 2 11 0 0 0 93 0 11 0 94 1
                                                   23 0 11 95 1 96 0 31 97 1 99
                                                   98 23 100 1 98 102 0 103 2
                                                   23 0 0 66 104 2 31 0 0 0 105
                                                   1 43 42 0 107 0 15 0 108 3
                                                   15 0 0 42 66 109 1 11 0 15
                                                   110 3 23 0 0 43 66 111 2 23
                                                   0 11 0 112 2 15 0 0 0 113 2
                                                   15 66 0 42 114 2 15 72 0 42
                                                   115 1 11 0 0 116 1 23 117 0
                                                   118 2 23 0 11 117 119 0 120
                                                   0 121 2 120 28 0 0 122 1 120
                                                   15 0 123 1 120 66 0 124 1
                                                   120 0 0 125 2 66 41 0 0 126
                                                   2 49 43 0 8 127 2 31 28 23 0
                                                   128 1 49 43 0 129 2 130 28 0
                                                   0 131 1 23 0 0 132 1 74 23 0
                                                   133 1 23 28 0 134 1 74 66 0
                                                   135 2 74 23 0 66 136 2 74 0
                                                   23 66 137 2 74 0 0 0 138 2
                                                   74 0 0 66 139 2 74 0 0 0 140
                                                   2 23 0 72 43 141 2 30 23 0 8
                                                   142 2 66 28 0 0 143 2 102
                                                   101 0 8 144 1 21 0 0 149 1
                                                   25 49 0 150 2 49 28 43 0 151
                                                   0 25 0 152 3 25 0 0 43 66
                                                   153 3 25 0 0 49 154 155 1
                                                   156 20 20 157 2 20 28 0 0
                                                   158 0 25 0 159 1 25 82 0 160
                                                   1 0 28 21 145 1 0 28 21 146
                                                   1 0 21 21 106 1 0 28 21 1 1
                                                   0 147 21 148 2 0 21 21 49
                                                   161)))))
           '|lookupComplete|)) 
