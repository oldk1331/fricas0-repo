
(SDEFUN |EFSTRUC;realElem| ((|f| F) (|l| |List| (|Symbol|)) ($ F))
        (SPROG NIL
               (SPADCALL (CONS #'|EFSTRUC;realElem!0| (VECTOR $ |l|)) |f|
                         (QREFELT $ 18)))) 

(SDEFUN |EFSTRUC;realElem!0| ((|k| NIL) ($$ NIL))
        (PROG (|l| $)
          (LETT |l| (QREFELT $$ 1) . #1=(|EFSTRUC;realElem|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|EFSTRUC;k2Elem| |k| |l| $))))) 

(SDEFUN |EFSTRUC;realElementary;FSF;2| ((|f| F) (|x| |Symbol|) ($ F))
        (|EFSTRUC;realElem| |f| (LIST |x|) $)) 

(SDEFUN |EFSTRUC;realElementary;2F;3| ((|f| F) ($ F))
        (|EFSTRUC;realElem| |f| (SPADCALL |f| (QREFELT $ 22)) $)) 

(SDEFUN |EFSTRUC;realLiouvillian;2F;4| ((|f| F) ($ F))
        (SPADCALL (CONS (|function| |EFSTRUC;k_to_liou|) $) |f| (QREFELT $ 18))) 

(SDEFUN |EFSTRUC;realLiouvillian;FSF;5| ((|f| F) (|x| |Symbol|) ($ F))
        (SPROG NIL
               (SPADCALL
                (CONS #'|EFSTRUC;realLiouvillian;FSF;5!0| (VECTOR $ |x|)) |f|
                (QREFELT $ 18)))) 

(SDEFUN |EFSTRUC;realLiouvillian;FSF;5!0| ((|k| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|EFSTRUC;realLiouvillian;FSF;5|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|EFSTRUC;k_to_liou1| |k| |x| $))))) 

(SDEFUN |EFSTRUC;toY| ((|ker| |List| (|Kernel| F)) ($ |List| F))
        (SPROG ((|func| (F)) (#1=#:G226 NIL) (|k| NIL) (#2=#:G225 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EFSTRUC;toY|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |func| (|EFSTRUC;ktoY| |k| $) . #3#)
                                    (|spadConstant| $ 26) (QREFELT $ 28))
                          (LETT #2# (CONS |func| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;toZ| ((|ker| |List| (|Kernel| F)) ($ |List| F))
        (SPROG ((|func| (F)) (#1=#:G230 NIL) (|k| NIL) (#2=#:G229 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EFSTRUC;toZ|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |func| (|EFSTRUC;ktoZ| |k| $) . #3#)
                                    (|spadConstant| $ 26) (QREFELT $ 28))
                          (LETT #2# (CONS |func| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;toU| ((|ker| |List| (|Kernel| F)) ($ |List| F))
        (SPROG ((|func| (F)) (#1=#:G234 NIL) (|k| NIL) (#2=#:G233 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EFSTRUC;toU|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |func| (|EFSTRUC;ktoU| |k| $) . #3#)
                                    (|spadConstant| $ 26) (QREFELT $ 28))
                          (LETT #2# (CONS |func| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;toV| ((|ker| |List| (|Kernel| F)) ($ |List| F))
        (SPROG ((|func| (F)) (#1=#:G238 NIL) (|k| NIL) (#2=#:G237 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EFSTRUC;toV|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |func| (|EFSTRUC;ktoV| |k| $) . #3#)
                                    (|spadConstant| $ 26) (QREFELT $ 28))
                          (LETT #2# (CONS |func| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;toR|
        ((|ker| |List| (|Kernel| F)) (|x| F) ($ |List| (|Kernel| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|EFSTRUC;toR!0| (VECTOR |x| $)) |ker|
                         (QREFELT $ 38)))) 

(SDEFUN |EFSTRUC;toR!0| ((|s| NIL) ($$ NIL))
        (PROG ($ |x|)
          (LETT $ (QREFELT $$ 1) . #1=(|EFSTRUC;toR|))
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |s| '|nthRoot| (QREFELT $ 30))
              (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 32)) (QREFELT $ 33))
                        |x| (QREFELT $ 34)))
             ('T (|spadConstant| $ 35))))))) 

(SDEFUN |EFSTRUC;tanQ;F2F;11| ((|c| |Fraction| (|Integer|)) (|x| F) ($ F))
        (SPROG ((#1=#:G243 NIL))
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |x|
                            (PROG1
                                (LETT #1# (SPADCALL |c| (QREFELT $ 40))
                                      |EFSTRUC;tanQ;F2F;11|)
                              (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                                '(|Integer|) #1#))
                            (QREFELT $ 44))
                  (QREFELT $ 46))
                 (QREFELT $ 48))
                (SPADCALL |c| (QREFELT $ 49)) (QREFELT $ 50)))) 

(SDEFUN |EFSTRUC;tanQ;F2F;12| ((|c| |Fraction| (|Integer|)) (|x| F) ($ F))
        (SPROG ((#1=#:G246 NIL))
               (SPADCALL
                (SPADCALL
                 (SPADCALL |x|
                           (PROG1
                               (LETT #1# (SPADCALL |c| (QREFELT $ 40))
                                     |EFSTRUC;tanQ;F2F;12|)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 44))
                 (QREFELT $ 46))
                (SPADCALL |c| (QREFELT $ 49)) (QREFELT $ 50)))) 

(SDEFUN |EFSTRUC;tanSum| ((|c| F) (|l| |List| F) ($ F))
        (SPROG ((#1=#:G255 NIL) (|r| (|Union| (|Integer|) "failed")) (|k| (F)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |k| (SPADCALL |c| (QREFELT $ 16) (QREFELT $ 15))
                        . #2=(|EFSTRUC;tanSum|))
                  (SEQ (LETT |r| (SPADCALL |k| (QREFELT $ 53)) . #2#)
                       (EXIT
                        (COND
                         ((QEQCAR |r| 0)
                          (COND
                           ((ODDP (QCDR |r|))
                            (PROGN
                             (LETT #1#
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |l| (QREFELT $ 54))
                                              (QREFELT $ 55))
                                    (QREFELT $ 14))
                                   . #2#)
                             (GO #3=#:G253))))))))
                  (EXIT
                   (SPADCALL (CONS (SPADCALL |c| (QREFELT $ 56)) |l|)
                             (QREFELT $ 54)))))
                #3# (EXIT #1#)))) 

(SDEFUN |EFSTRUC;findQRelation|
        ((|lv| . #1=(|List| (|Symbol|))) (|lpar| |List| (|Symbol|))
         (|lk| |List| F) (|ker| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|u| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (#2=#:G279 NIL) (|j| NIL) (#3=#:G280 NIL) (|k| NIL) (#4=#:G277 NIL)
          (|i| NIL) (#5=#:G278 NIL) (|var| NIL) (|mat| (|Matrix| F))
          (|isconstant| (|Boolean|)) (#6=#:G275 NIL) (#7=#:G276 NIL)
          (|v| (|Vector| F)) (|lvv| #1#) (|m| (|NonNegativeInteger|))
          (#8=#:G273 NIL) (#9=#:G274 NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |lk|) (CONS 2 'T))
                (#10='T
                 (SEQ (LETT |isconstant| 'T . #11=(|EFSTRUC;findQRelation|))
                      (LETT |m| (LENGTH |lv|) . #11#) (LETT |lvv| |lv| . #11#)
                      (LETT |n| (LENGTH |lk|) . #11#)
                      (LETT |v| (MAKEARR1 |m| (|spadConstant| $ 26)) . #11#)
                      (SEQ (LETT |var| NIL . #11#) (LETT #9# |lv| . #11#)
                           (LETT |i| 1 . #11#) (LETT #8# |m| . #11#) G190
                           (COND
                            ((OR (|greater_SI| |i| #8#) (ATOM #9#)
                                 (PROGN (LETT |var| (CAR #9#) . #11#) NIL))
                             (GO G191)))
                           (SEQ
                            (SPADCALL |v| |i|
                                      (SPADCALL |ker| |var| (QREFELT $ 58))
                                      (QREFELT $ 60))
                            (EXIT
                             (COND
                              (|isconstant|
                               (LETT |isconstant|
                                     (SPADCALL
                                      (SPADCALL |v| |i| (QREFELT $ 61))
                                      (|spadConstant| $ 26) (QREFELT $ 34))
                                     . #11#)))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|)
                                   (LETT #9# (CDR #9#) . #11#))
                                 . #11#)
                           (GO G190) G191 (EXIT NIL))
                      (COND
                       (|isconstant|
                        (SEQ (LETT |m| (LENGTH |lpar|) . #11#)
                             (LETT |lvv| |lpar| . #11#)
                             (LETT |v| (MAKEARR1 |m| (|spadConstant| $ 26))
                                   . #11#)
                             (EXIT
                              (SEQ (LETT |var| NIL . #11#)
                                   (LETT #7# |lpar| . #11#) (LETT |i| 1 . #11#)
                                   (LETT #6# |m| . #11#) G190
                                   (COND
                                    ((OR (|greater_SI| |i| #6#) (ATOM #7#)
                                         (PROGN
                                          (LETT |var| (CAR #7#) . #11#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |v| |i|
                                              (SPADCALL |ker| |var|
                                                        (QREFELT $ 58))
                                              (QREFELT $ 60))
                                    (EXIT
                                     (COND
                                      (|isconstant|
                                       (LETT |isconstant|
                                             (SPADCALL
                                              (SPADCALL |v| |i| (QREFELT $ 61))
                                              (|spadConstant| $ 26)
                                              (QREFELT $ 34))
                                             . #11#)))))
                                   (LETT |i|
                                         (PROG1 (|inc_SI| |i|)
                                           (LETT #7# (CDR #7#) . #11#))
                                         . #11#)
                                   (GO G190) G191 (EXIT NIL))))))
                      (EXIT
                       (COND
                        (|isconstant|
                         (SEQ
                          (SPADCALL (SPADCALL |ker| (QREFELT $ 63))
                                    (QREFELT $ 65))
                          (EXIT (|error| "Hidden constant detected"))))
                        (#10#
                         (SEQ
                          (LETT |mat|
                                (MAKE_MATRIX1 |m| |n| (|spadConstant| $ 26))
                                . #11#)
                          (SEQ (LETT |var| NIL . #11#) (LETT #5# |lvv| . #11#)
                               (LETT |i| 1 . #11#) (LETT #4# |m| . #11#) G190
                               (COND
                                ((OR (|greater_SI| |i| #4#) (ATOM #5#)
                                     (PROGN (LETT |var| (CAR #5#) . #11#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |k| NIL . #11#)
                                      (LETT #3# |lk| . #11#)
                                      (LETT |j| 1 . #11#) (LETT #2# |n| . #11#)
                                      G190
                                      (COND
                                       ((OR (|greater_SI| |j| #2#) (ATOM #3#)
                                            (PROGN
                                             (LETT |k| (CAR #3#) . #11#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |mat| |i| |j|
                                                  (SPADCALL |k| |var|
                                                            (QREFELT $ 58))
                                                  (QREFELT $ 67))))
                                      (LETT |j|
                                            (PROG1 (|inc_SI| |j|)
                                              (LETT #3# (CDR #3#) . #11#))
                                            . #11#)
                                      (GO G190) G191 (EXIT NIL))))
                               (LETT |i|
                                     (PROG1 (|inc_SI| |i|)
                                       (LETT #5# (CDR #5#) . #11#))
                                     . #11#)
                               (GO G190) G191 (EXIT NIL))
                          (LETT |u| (SPADCALL |mat| |v| (QREFELT $ 70)) . #11#)
                          (EXIT
                           (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                                 (#10# (CONS 2 'T)))))))))))))) 

(SDEFUN |EFSTRUC;findLinearRelation1|
        ((|lk| |List| F) (|ker| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|u| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (#1=#:G288 NIL) (|j| NIL) (#2=#:G289 NIL) (|k| NIL)
          (|v| (|Vector| F)) (|mat| (|Matrix| F)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |lk|) (CONS 2 'T))
                (#3='T
                 (SEQ
                  (LETT |n| (LENGTH |lk|) . #4=(|EFSTRUC;findLinearRelation1|))
                  (LETT |mat| (MAKE_MATRIX1 1 |n| (|spadConstant| $ 26)) . #4#)
                  (LETT |v| (MAKEARR1 1 |ker|) . #4#)
                  (SEQ (LETT |k| NIL . #4#) (LETT #2# |lk| . #4#)
                       (LETT |j| 1 . #4#) (LETT #1# |n| . #4#) G190
                       (COND
                        ((OR (|greater_SI| |j| #1#) (ATOM #2#)
                             (PROGN (LETT |k| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |k| (QREFELT $ 22)))
                           (SPADCALL |mat| 1 |j| |k| (QREFELT $ 67)))
                          ('T
                           (SPADCALL |mat| 1 |j| (|spadConstant| $ 26)
                                     (QREFELT $ 67))))))
                       (LETT |j|
                             (PROG1 (|inc_SI| |j|) (LETT #2# (CDR #2#) . #4#))
                             . #4#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |u| (SPADCALL |mat| |v| (QREFELT $ 70)) . #4#)
                  (EXIT
                   (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                         (#3# (CONS 2 'T)))))))))) 

(SDEFUN |EFSTRUC;transkers| ((|x| |List| (|Kernel| F)) ($ |List| (|Kernel| F)))
        (SPROG ((#1=#:G294 NIL) (|k| NIL) (#2=#:G293 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EFSTRUC;transkers|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |x| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND
                           ((SPADCALL (SPADCALL |k| (QREFELT $ 76))
                                      (QREFELT $ 74) (QREFELT $ 77))
                            'NIL)
                           ('T 'T))
                          (LETT #2# (CONS |k| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;ktoQ| ((|ker| |Kernel| F) ($ |Fraction| (|Integer|)))
        (SPROG ((|qu| (|Union| (|Fraction| (|Integer|)) "failed")) (|z| (F)))
               (SEQ
                (COND
                 ((SPADCALL |ker| '|log| (QREFELT $ 30))
                  (COND
                   ((|HasCategory| (QREFELT $ 7)
                                   (LIST '|RetractableTo|
                                         (LIST '|Fraction| '(|Integer|))))
                    (EXIT
                     (SEQ
                      (LETT |z|
                            (SPADCALL (SPADCALL |ker| (QREFELT $ 32)) 1
                                      (QREFELT $ 78))
                            . #1=(|EFSTRUC;ktoQ|))
                      (LETT |qu| (SPADCALL |z| (QREFELT $ 80)) . #1#)
                      (EXIT
                       (COND ((QEQCAR |qu| 0) (QCDR |qu|))
                             ('T (|spadConstant| $ 73))))))))))
                (EXIT (|spadConstant| $ 73))))) 

(SDEFUN |EFSTRUC;toQ|
        ((|lk| |List| (|Kernel| F)) ($ |List| (|Fraction| (|Integer|))))
        (SPROG ((#1=#:G306 NIL) (|k| NIL) (#2=#:G305 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EFSTRUC;toQ|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |lk| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND ((SPADCALL |k| '|log| (QREFELT $ 30)) 'T)
                                ('T (SPADCALL |k| '|exp| (QREFELT $ 30))))
                          (LETT #2# (CONS (|EFSTRUC;ktoQ| |k| $) #2#)
                                . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;findLinearRelation2|
        ((|lk| |List| (|Kernel| F)) (|lz| |List| F) (|ker| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|nz| (F)) (|ly| (|List| F)) (#1=#:G348 NIL) (|x| NIL)
          (#2=#:G347 NIL) (#3=#:G346 NIL) (#4=#:G345 NIL)
          (|lpars1f| (|List| F)) (#5=#:G344 NIL) (|s| NIL) (#6=#:G343 NIL)
          (|lpars1| (|List| (|Symbol|))) (#7=#:G342 NIL) (|k| NIL)
          (#8=#:G341 NIL) (|lpars0| #9=(|List| (|Kernel| F))) (#10=#:G338 NIL)
          (|vv| (|Vector| (|Fraction| (|Integer|)))) (|lz1tonq| (F))
          (|kertond| (F)) (|nd| (|Integer|)) (|nq| (|Integer|))
          (|qratio| (|Fraction| (|Integer|)))
          (|fratio| (|Union| (|Float|) "failed")) (|Fratio| (F))
          (#11=#:G339 NIL) (|z1| NIL) (#12=#:G340 NIL) (|i| NIL)
          (|m| (|NonNegativeInteger|)) (|kerF| (F))
          (|u| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|q| (|Fraction| (|Integer|))) (|zkers| #9#) (|z| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |z|
                  (SPADCALL (SPADCALL |ker| (QREFELT $ 32)) 1 (QREFELT $ 78))
                  . #13=(|EFSTRUC;findLinearRelation2|))
            (LETT |zkers| (|EFSTRUC;transkers| (SPADCALL |z| (QREFELT $ 82)) $)
                  . #13#)
            (EXIT
             (COND
              ((NULL |zkers|)
               (SEQ (LETT |q| (|EFSTRUC;ktoQ| |ker| $) . #13#)
                    (COND
                     ((NULL
                       (SPADCALL |q| (|spadConstant| $ 73) (QREFELT $ 83)))
                      (COND
                       ((NULL
                         (SPADCALL |q|
                                   (SPADCALL (|spadConstant| $ 73)
                                             (QREFELT $ 84))
                                   (QREFELT $ 83)))
                        (EXIT
                         (SEQ
                          (LETT |u|
                                (SPADCALL (|EFSTRUC;toQ| |lk| $) |q|
                                          (QREFELT $ 87))
                                . #13#)
                          (EXIT
                           (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                                 (#14='T (CONS 2 'T))))))))))
                    (LETT |kerF| (SPADCALL |ker| (QREFELT $ 89)) . #13#)
                    (COND
                     ((|domainEqual| (QREFELT $ 7)
                                     (|Expression| (QREFELT $ 6)))
                      (COND
                       ((|HasCategory| (QREFELT $ 6)
                                       (LIST '|ConvertibleTo| '(|Float|)))
                        (COND
                         ((|HasCategory| (QREFELT $ 6) '(|IntegralDomain|))
                          (COND
                           ((|HasCategory| (QREFELT $ 6) '(|OrderedSet|))
                            (EXIT
                             (SEQ (LETT |m| (LENGTH |lz|) . #13#)
                                  (SEQ (LETT |i| 1 . #13#)
                                       (LETT #12# |m| . #13#)
                                       (LETT |z1| NIL . #13#)
                                       (LETT #11# |lz| . #13#) G190
                                       (COND
                                        ((OR (ATOM #11#)
                                             (PROGN
                                              (LETT |z1| (CAR #11#) . #13#)
                                              NIL)
                                             (|greater_SI| |i| #12#))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |Fratio|
                                              (SPADCALL |kerF|
                                                        (SPADCALL |z1|
                                                                  (QREFELT $
                                                                           90))
                                                        (QREFELT $ 15))
                                              . #13#)
                                        (LETT |fratio|
                                              (SPADCALL |Fratio| 20
                                                        (QREFELT $ 94))
                                              . #13#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |fratio| 0)
                                           (SEQ
                                            (LETT |qratio|
                                                  (SPADCALL (QCDR |fratio|) 8
                                                            (QREFELT $ 97))
                                                  . #13#)
                                            (COND
                                             ((OR
                                               (SPADCALL |qratio|
                                                         (|spadConstant| $ 98)
                                                         (QREFELT $ 83))
                                               (OR
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QCDR |fratio|)
                                                             (SPADCALL |qratio|
                                                                       (QREFELT
                                                                        $ 99))
                                                             (QREFELT $ 100))
                                                   (SPADCALL 1 0 10
                                                             (QREFELT $ 101))
                                                   (QREFELT $ 102))
                                                  (QREFELT $ 103))
                                                 (SPADCALL 1 -16 10
                                                           (QREFELT $ 101))
                                                 (QREFELT $ 104))
                                                (OR
                                                 (SPADCALL
                                                  (ABS
                                                   (LETT |nq|
                                                         (SPADCALL |qratio|
                                                                   (QREFELT $
                                                                            49))
                                                         . #13#))
                                                  100 (QREFELT $ 105))
                                                 (SPADCALL
                                                  (ABS
                                                   (LETT |nd|
                                                         (SPADCALL |qratio|
                                                                   (QREFELT $
                                                                            40))
                                                         . #13#))
                                                  100 (QREFELT $ 105)))))
                                              (EXIT "iterate")))
                                            (LETT |kertond|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |ker|
                                                              (QREFELT $ 32))
                                                    1 (QREFELT $ 78))
                                                   |nd| (QREFELT $ 106))
                                                  . #13#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL |nq| 0
                                                         (QREFELT $ 105))
                                               (SEQ
                                                (LETT |lz1tonq|
                                                      (SPADCALL |z1| |nq|
                                                                (QREFELT $
                                                                         106))
                                                      . #13#)
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL |kertond|
                                                             |lz1tonq|
                                                             (QREFELT $ 34))
                                                   (SEQ
                                                    (LETT |vv|
                                                          (SPADCALL |m|
                                                                    (QREFELT $
                                                                             108))
                                                          . #13#)
                                                    (QSETAREF1O |vv| |i|
                                                                |qratio| 1)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #10# (CONS 0 |vv|)
                                                            . #13#)
                                                      (GO #15=#:G337)))))))))
                                              ('T
                                               (SEQ
                                                (LETT |lz1tonq|
                                                      (SPADCALL |z1| (- |nq|)
                                                                (QREFELT $
                                                                         106))
                                                      . #13#)
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL
                                                    (SPADCALL |kertond|
                                                              |lz1tonq|
                                                              (QREFELT $ 109))
                                                    (|spadConstant| $ 72)
                                                    (QREFELT $ 34))
                                                   (SEQ
                                                    (LETT |vv|
                                                          (SPADCALL |m|
                                                                    (QREFELT $
                                                                             108))
                                                          . #13#)
                                                    (QSETAREF1O |vv| |i|
                                                                |qratio| 1)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #10# (CONS 0 |vv|)
                                                            . #13#)
                                                      (GO #15#))))))))))))))))
                                       (LETT #11#
                                             (PROG1 (CDR #11#)
                                               (LETT |i| (|inc_SI| |i|)
                                                     . #13#))
                                             . #13#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT (CONS 2 'T))))))))))))
                    (EXIT (CONS 2 'T))))
              (#14#
               (SEQ (LETT |lpars0| (|EFSTRUC;transkers| |lk| $) . #13#)
                    (LETT |lpars1|
                          (PROGN
                           (LETT #8# NIL . #13#)
                           (SEQ (LETT |k| NIL . #13#)
                                (LETT #7# |lpars0| . #13#) G190
                                (COND
                                 ((OR (ATOM #7#)
                                      (PROGN (LETT |k| (CAR #7#) . #13#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #8#
                                        (CONS (SPADCALL (QREFELT $ 110)) #8#)
                                        . #13#)))
                                (LETT #7# (CDR #7#) . #13#) (GO G190) G191
                                (EXIT (NREVERSE #8#))))
                          . #13#)
                    (LETT |lpars1f|
                          (PROGN
                           (LETT #6# NIL . #13#)
                           (SEQ (LETT |s| NIL . #13#)
                                (LETT #5# |lpars1| . #13#) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |s| (CAR #5#) . #13#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |s| (QREFELT $ 111))
                                          (QREFELT $ 89))
                                         #6#)
                                        . #13#)))
                                (LETT #5# (CDR #5#) . #13#) (GO G190) G191
                                (EXIT (NREVERSE #6#))))
                          . #13#)
                    (COND
                     ((SPADCALL |ker| '|log| (QREFELT $ 30))
                      (SEQ
                       (LETT |ly|
                             (PROGN
                              (LETT #4# NIL . #13#)
                              (SEQ (LETT |x| NIL . #13#) (LETT #3# |lz| . #13#)
                                   G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN
                                          (LETT |x| (CAR #3#) . #13#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |x| |lpars0| |lpars1f|
                                                       (QREFELT $ 113))
                                             (QREFELT $ 90))
                                            #4#)
                                           . #13#)))
                                   (LETT #3# (CDR #3#) . #13#) (GO G190) G191
                                   (EXIT (NREVERSE #4#))))
                             . #13#)
                       (EXIT
                        (LETT |nz|
                              (SPADCALL
                               (SPADCALL |z| |lpars0| |lpars1f|
                                         (QREFELT $ 113))
                               (QREFELT $ 90))
                              . #13#))))
                     ((NULL (SPADCALL |ker| '|atan| (QREFELT $ 30)))
                      (|error|
                       "findLinearRelation2: kernel should be log or atan"))
                     ('T
                      (SEQ
                       (LETT |ly|
                             (PROGN
                              (LETT #2# NIL . #13#)
                              (SEQ (LETT |x| NIL . #13#) (LETT #1# |lz| . #13#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |x| (CAR #1#) . #13#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |x| |lpars0| |lpars1f|
                                                       (QREFELT $ 113))
                                             (QREFELT $ 114))
                                            #2#)
                                           . #13#)))
                                   (LETT #1# (CDR #1#) . #13#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             . #13#)
                       (EXIT
                        (LETT |nz|
                              (SPADCALL
                               (SPADCALL |z| |lpars0| |lpars1f|
                                         (QREFELT $ 113))
                               (QREFELT $ 114))
                              . #13#)))))
                    (EXIT
                     (|EFSTRUC;findQRelation| NIL |lpars1| |ly| |nz| $))))))))
          #15# (EXIT #10#)))) 

(SDEFUN |EFSTRUC;findRelation|
        ((|lv| |List| (|Symbol|)) (|lpar| |List| (|Symbol|))
         (|lk| |List| (|Kernel| F)) (|ker| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG ((#1=#:G368 NIL) (|x| NIL) (#2=#:G367 NIL))
               (SEQ
                (COND
                 ((OR (SPADCALL |ker| '|log| (QREFELT $ 30))
                      (SPADCALL |ker| '|exp| (QREFELT $ 30)))
                  (COND
                   ((NULL
                     (SPADCALL (SPADCALL |ker| (QREFELT $ 89)) (QREFELT $ 22)))
                    (COND
                     ((SPADCALL |ker| '|exp| (QREFELT $ 30))
                      (|EFSTRUC;findLinearRelation1| (|EFSTRUC;toY| |lk| $)
                       (|EFSTRUC;ktoY| |ker| $) $))
                     (#3='T
                      (|EFSTRUC;findLinearRelation2| |lk|
                       (|EFSTRUC;toZ| |lk| $) |ker| $))))
                   (#3#
                    (|EFSTRUC;findQRelation| |lv| |lpar| (|EFSTRUC;toY| |lk| $)
                     (|EFSTRUC;ktoY| |ker| $) $))))
                 ((OR (SPADCALL |ker| '|atan| (QREFELT $ 30))
                      (SPADCALL |ker| '|tan| (QREFELT $ 30)))
                  (COND
                   ((NULL
                     (SPADCALL (SPADCALL |ker| (QREFELT $ 89)) (QREFELT $ 22)))
                    (COND
                     ((SPADCALL |ker| '|tan| (QREFELT $ 30))
                      (|EFSTRUC;findLinearRelation1| (|EFSTRUC;toU| |lk| $)
                       (|EFSTRUC;ktoU| |ker| $) $))
                     (#3#
                      (|EFSTRUC;findLinearRelation2| |lk|
                       (|EFSTRUC;toV| |lk| $) |ker| $))))
                   (#3#
                    (|EFSTRUC;findQRelation| |lv| |lpar| (|EFSTRUC;toU| |lk| $)
                     (|EFSTRUC;ktoU| |ker| $) $))))
                 ('T
                  (COND
                   ((SPADCALL |ker| '|nthRoot| (QREFELT $ 30))
                    (|EFSTRUC;rootDep| |lk| |ker| $))
                   (#3#
                    (SEQ
                     (COND
                      ((QREFELT $ 10)
                       (COND
                        ((SPADCALL |ker| '|factorial| (QREFELT $ 30))
                         (EXIT
                          (|EFSTRUC;factdeprel|
                           (PROGN
                            (LETT #2# NIL . #4=(|EFSTRUC;findRelation|))
                            (SEQ (LETT |x| NIL . #4#) (LETT #1# |lk| . #4#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |x| (CAR #1#) . #4#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((COND
                                      ((SPADCALL |x| '|factorial|
                                                 (QREFELT $ 30))
                                       (SPADCALL |x| |ker| (QREFELT $ 115)))
                                      (#3# 'NIL))
                                     (LETT #2# (CONS |x| #2#) . #4#)))))
                                 (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           |ker| $))))))
                     (EXIT (CONS 2 'T)))))))))) 

(SDEFUN |EFSTRUC;ktoY| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|log| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 89)))
         ((SPADCALL |k| '|exp| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;ktoZ| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|log| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ((SPADCALL |k| '|exp| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 89)))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;ktoU| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|atan| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 89)))
         ((SPADCALL |k| '|tan| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;ktoV| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|tan| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 89)))
         ((SPADCALL |k| '|atan| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;smp_map|
        ((|f| |Mapping| F (|Kernel| F))
         (|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPADCALL |f| (ELT $ 116) |p| (QREFELT $ 120))) 

(SDEFUN |EFSTRUC;rmap;M2F;26| ((|f| |Mapping| F (|Kernel| F)) (|e| F) ($ F))
        (SPADCALL (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 122)) $)
                  (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 123)) $)
                  (QREFELT $ 15))) 

(SDEFUN |EFSTRUC;k2Elem0|
        ((|k| |Kernel| F) (|op| |BasicOperator|) (|args| |List| F) ($ F))
        (SPROG ((|tz2| (F)) (|iez| (F)) (|ez| (F)) (|z| (F)))
               (SEQ (LETT |z| (|SPADfirst| |args|) . #1=(|EFSTRUC;k2Elem0|))
                    (EXIT
                     (COND
                      ((SPADCALL |op| '|%power| (QREFELT $ 129))
                       (COND
                        ((SPADCALL |z| (QREFELT $ 130)) (|spadConstant| $ 26))
                        (#2='T
                         (SPADCALL
                          (SPADCALL (SPADCALL |args| (QREFELT $ 131))
                                    (SPADCALL |z| (QREFELT $ 90))
                                    (QREFELT $ 109))
                          (QREFELT $ 132)))))
                      ((SPADCALL |op| '|cot| (QREFELT $ 129))
                       (SPADCALL (SPADCALL |z| (QREFELT $ 56)) (QREFELT $ 55)))
                      ((SPADCALL |op| '|acot| (QREFELT $ 129))
                       (SPADCALL (SPADCALL |z| (QREFELT $ 55))
                                 (QREFELT $ 114)))
                      ((SPADCALL |op| '|asin| (QREFELT $ 129))
                       (SPADCALL
                        (SPADCALL |z|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 72)
                                             (SPADCALL |z| 2 (QREFELT $ 133))
                                             (QREFELT $ 134))
                                   (QREFELT $ 135))
                                  (QREFELT $ 15))
                        (QREFELT $ 114)))
                      ((SPADCALL |op| '|acos| (QREFELT $ 129))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 72)
                                    (SPADCALL |z| 2 (QREFELT $ 133))
                                    (QREFELT $ 134))
                          (QREFELT $ 135))
                         |z| (QREFELT $ 15))
                        (QREFELT $ 114)))
                      ((SPADCALL |op| '|asec| (QREFELT $ 129))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |z| 2 (QREFELT $ 133))
                                   (|spadConstant| $ 72) (QREFELT $ 134))
                         (QREFELT $ 135))
                        (QREFELT $ 114)))
                      ((SPADCALL |op| '|acsc| (QREFELT $ 129))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| 2 (QREFELT $ 133))
                                    (|spadConstant| $ 72) (QREFELT $ 134))
                          (QREFELT $ 135))
                         (QREFELT $ 55))
                        (QREFELT $ 114)))
                      ((SPADCALL |op| '|asinh| (QREFELT $ 129))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 72)
                                    (SPADCALL |z| 2 (QREFELT $ 133))
                                    (QREFELT $ 136))
                          (QREFELT $ 135))
                         |z| (QREFELT $ 136))
                        (QREFELT $ 90)))
                      ((SPADCALL |op| '|acosh| (QREFELT $ 129))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| 2 (QREFELT $ 133))
                                    (|spadConstant| $ 72) (QREFELT $ 134))
                          (QREFELT $ 135))
                         |z| (QREFELT $ 136))
                        (QREFELT $ 90)))
                      ((SPADCALL |op| '|atanh| (QREFELT $ 129))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |z| (|spadConstant| $ 72) (QREFELT $ 136))
                          (SPADCALL (|spadConstant| $ 72) |z| (QREFELT $ 134))
                          (QREFELT $ 15))
                         (QREFELT $ 90))
                        (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                      ((SPADCALL |op| '|acoth| (QREFELT $ 129))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |z| (|spadConstant| $ 72) (QREFELT $ 136))
                          (SPADCALL |z| (|spadConstant| $ 72) (QREFELT $ 134))
                          (QREFELT $ 15))
                         (QREFELT $ 90))
                        (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                      ((SPADCALL |op| '|asech| (QREFELT $ 129))
                       (SPADCALL
                        (SPADCALL (SPADCALL |z| (QREFELT $ 55))
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |z| 2 (QREFELT $ 133))
                                              (QREFELT $ 55))
                                    (|spadConstant| $ 72) (QREFELT $ 134))
                                   (QREFELT $ 135))
                                  (QREFELT $ 136))
                        (QREFELT $ 90)))
                      ((SPADCALL |op| '|acsch| (QREFELT $ 129))
                       (SPADCALL
                        (SPADCALL (SPADCALL |z| (QREFELT $ 55))
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 72)
                                             (SPADCALL
                                              (SPADCALL |z| 2 (QREFELT $ 133))
                                              (QREFELT $ 55))
                                             (QREFELT $ 136))
                                   (QREFELT $ 135))
                                  (QREFELT $ 136))
                        (QREFELT $ 90)))
                      ((OR (SPADCALL |op| '|%paren| (QREFELT $ 129))
                           (SPADCALL |op| '|%box| (QREFELT $ 129)))
                       (COND ((NULL (CDR |args|)) |z|)
                             (#2# (SPADCALL |k| (QREFELT $ 89)))))
                      ('T
                       (SEQ
                        (COND
                         ((SPADCALL |op| (QREFELT $ 8) (QREFELT $ 77))
                          (LETT |iez|
                                (SPADCALL
                                 (LETT |ez| (SPADCALL |z| (QREFELT $ 132))
                                       . #1#)
                                 (QREFELT $ 55))
                                . #1#)))
                        (EXIT
                         (COND
                          ((SPADCALL |op| '|sinh| (QREFELT $ 129))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 134))
                                     (SPADCALL 2 (QREFELT $ 13))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|cosh| (QREFELT $ 129))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 136))
                                     (SPADCALL 2 (QREFELT $ 13))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|tanh| (QREFELT $ 129))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 134))
                                     (SPADCALL |ez| |iez| (QREFELT $ 136))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|coth| (QREFELT $ 129))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 136))
                                     (SPADCALL |ez| |iez| (QREFELT $ 134))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|sech| (QREFELT $ 129))
                           (SPADCALL 2
                                     (SPADCALL
                                      (SPADCALL |ez| |iez| (QREFELT $ 136))
                                      (QREFELT $ 55))
                                     (QREFELT $ 137)))
                          ((SPADCALL |op| '|csch| (QREFELT $ 129))
                           (SPADCALL 2
                                     (SPADCALL
                                      (SPADCALL |ez| |iez| (QREFELT $ 134))
                                      (QREFELT $ 55))
                                     (QREFELT $ 137)))
                          (#2#
                           (SEQ
                            (COND
                             ((SPADCALL |op| (QREFELT $ 9) (QREFELT $ 77))
                              (LETT |tz2|
                                    (SPADCALL
                                     (SPADCALL |z| (SPADCALL 2 (QREFELT $ 13))
                                               (QREFELT $ 15))
                                     (QREFELT $ 56))
                                    . #1#)))
                            (EXIT
                             (COND
                              ((SPADCALL |op| '|sin| (QREFELT $ 129))
                               (SPADCALL (SPADCALL 2 |tz2| (QREFELT $ 137))
                                         (SPADCALL (|spadConstant| $ 72)
                                                   (SPADCALL |tz2| 2
                                                             (QREFELT $ 133))
                                                   (QREFELT $ 136))
                                         (QREFELT $ 15)))
                              ((SPADCALL |op| '|cos| (QREFELT $ 129))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 72)
                                          (SPADCALL |tz2| 2 (QREFELT $ 133))
                                          (QREFELT $ 134))
                                (SPADCALL (|spadConstant| $ 72)
                                          (SPADCALL |tz2| 2 (QREFELT $ 133))
                                          (QREFELT $ 136))
                                (QREFELT $ 15)))
                              ((SPADCALL |op| '|sec| (QREFELT $ 129))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 72)
                                          (SPADCALL |tz2| 2 (QREFELT $ 133))
                                          (QREFELT $ 136))
                                (SPADCALL (|spadConstant| $ 72)
                                          (SPADCALL |tz2| 2 (QREFELT $ 133))
                                          (QREFELT $ 134))
                                (QREFELT $ 15)))
                              ((SPADCALL |op| '|csc| (QREFELT $ 129))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 72)
                                          (SPADCALL |tz2| 2 (QREFELT $ 133))
                                          (QREFELT $ 136))
                                (SPADCALL 2 |tz2| (QREFELT $ 137))
                                (QREFELT $ 15)))
                              (#2#
                               (SPADCALL |op| |args|
                                         (QREFELT $ 139)))))))))))))))) 

(SDEFUN |EFSTRUC;do_int| ((|op| |BasicOperator|) (|args| |List| F) ($ F))
        (SPROG
         ((|dvs| (|List| F)) (#1=#:G427 NIL) (|v| NIL) (#2=#:G426 NIL)
          (|vfs| (|List| F)) (#3=#:G425 NIL) (#4=#:G424 NIL)
          (|vars| (|List| (|Symbol|))) (|kf1| (F)))
         (SEQ
          (LETT |kf1| (SPADCALL |op| |args| (QREFELT $ 139))
                . #5=(|EFSTRUC;do_int|))
          (LETT |vars| (SPADCALL |kf1| (QREFELT $ 22)) . #5#)
          (LETT |vfs|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |v| NIL . #5#) (LETT #3# |vars| . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 140)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |dvs|
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |v| NIL . #5#) (LETT #1# |vars| . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |kf1| |v| (QREFELT $ 141))
                                         (QREFELT $ 24))
                               #2#)
                              . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #5#)
          (EXIT
           (SPADCALL (QREFELT $ 128) (SPADCALL |vfs| |dvs| (QREFELT $ 142))
                     (QREFELT $ 143)))))) 

(SDEFUN |EFSTRUC;k_to_liou| ((|k| |Kernel| F) ($ F))
        (SPROG
         ((#1=#:G442 NIL) (#2=#:G441 NIL) (|i| (|Integer|))
          (|iu| (|Union| (|Integer|) "failed")) (|nm| (|Symbol|))
          (|args| (|List| F)) (#3=#:G444 NIL) (|a| NIL) (#4=#:G443 NIL)
          (|op| (|BasicOperator|)))
         (SEQ
          (LETT |op| (SPADCALL |k| (QREFELT $ 76)) . #5=(|EFSTRUC;k_to_liou|))
          (LETT |args|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |a| NIL . #5#)
                      (LETT #3# (SPADCALL |k| (QREFELT $ 32)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |a| (QREFELT $ 24)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT
           (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 89)))
                 ('T
                  (SEQ
                   (EXIT
                    (SEQ
                     (COND
                      ((SPADCALL |op| '|prim| (QREFELT $ 77))
                       (COND
                        ((NULL (SPADCALL |op| '|%iint| (QREFELT $ 129)))
                         (EXIT (|EFSTRUC;do_int| |op| |args| $))))))
                     (LETT |nm| (SPADCALL |op| (QREFELT $ 144)) . #5#)
                     (COND
                      ((EQUAL |nm| '|polylog|)
                       (SEQ
                        (LETT |iu|
                              (SPADCALL (|SPADfirst| |args|) (QREFELT $ 53))
                              . #5#)
                        (EXIT
                         (COND
                          ((QEQCAR |iu| 0)
                           (PROGN
                            (LETT #1#
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (SEQ (LETT |i| (QCDR |iu|) . #5#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL |i| 0 (QREFELT $ 105))
                                             (COND
                                              ((< |i| 10)
                                               (PROGN
                                                (LETT #2#
                                                      (|EFSTRUC;do_int| |op|
                                                       |args| $)
                                                      . #5#)
                                                (GO #6=#:G435))))))))
                                     (EXIT
                                      (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                                   #6# (EXIT #2#))
                                  . #5#)
                            (GO #7=#:G438))))))))
                     (EXIT (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                   #7# (EXIT #1#)))))))) 

(SDEFUN |EFSTRUC;do_int1|
        ((|op| |BasicOperator|) (|args| |List| F) (|x| . #1=(|Symbol|)) ($ F))
        (SPROG
         ((|dvs| (|List| F)) (#2=#:G452 NIL) (|v| NIL) (#3=#:G451 NIL)
          (|vfs| (|List| F)) (#4=#:G450 NIL) (#5=#:G449 NIL)
          (|vars| (|List| #1#)) (|kf1| (F)))
         (SEQ
          (LETT |kf1| (SPADCALL |op| |args| (QREFELT $ 139))
                . #6=(|EFSTRUC;do_int1|))
          (LETT |vars| (LIST |x|) . #6#)
          (LETT |vfs|
                (PROGN
                 (LETT #5# NIL . #6#)
                 (SEQ (LETT |v| NIL . #6#) (LETT #4# |vars| . #6#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |v| (CAR #4#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5# (CONS (SPADCALL |v| (QREFELT $ 140)) #5#)
                              . #6#)))
                      (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #6#)
          (LETT |dvs|
                (PROGN
                 (LETT #3# NIL . #6#)
                 (SEQ (LETT |v| NIL . #6#) (LETT #2# |vars| . #6#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL (SPADCALL |kf1| |v| (QREFELT $ 141))
                                         |x| (QREFELT $ 25))
                               #3#)
                              . #6#)))
                      (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #6#)
          (EXIT
           (SPADCALL (QREFELT $ 128) (SPADCALL |vfs| |dvs| (QREFELT $ 142))
                     (QREFELT $ 143)))))) 

(SDEFUN |EFSTRUC;k_to_liou1| ((|k| |Kernel| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((#1=#:G476 NIL) (#2=#:G475 NIL) (|i| (|Integer|))
          (|iu| (|Union| (|Integer|) "failed")) (|nm| (|Symbol|))
          (|args| (|List| F)) (#3=#:G478 NIL) (|a| NIL) (#4=#:G477 NIL)
          (|op| (|BasicOperator|)))
         (SEQ
          (LETT |op| (SPADCALL |k| (QREFELT $ 76)) . #5=(|EFSTRUC;k_to_liou1|))
          (LETT |args|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |a| NIL . #5#)
                      (LETT #3# (SPADCALL |k| (QREFELT $ 32)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |a| |x| (QREFELT $ 25)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT
           (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 89)))
                 ('T
                  (SEQ
                   (EXIT
                    (SEQ
                     (COND
                      ((SPADCALL |op| '|prim| (QREFELT $ 77))
                       (COND
                        ((NULL (SPADCALL |op| '|%iint| (QREFELT $ 129)))
                         (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                     (LETT |nm| (SPADCALL |op| (QREFELT $ 144)) . #5#)
                     (COND
                      ((EQUAL |nm| '|Gamma2|)
                       (COND
                        ((SPADCALL
                          (SPADCALL (|SPADfirst| |args|) |x| (QREFELT $ 141))
                          (|spadConstant| $ 26) (QREFELT $ 34))
                         (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                     (COND
                      ((EQUAL |nm| '|polylog|)
                       (SEQ
                        (LETT |iu|
                              (SPADCALL (|SPADfirst| |args|) (QREFELT $ 53))
                              . #5#)
                        (EXIT
                         (COND
                          ((QEQCAR |iu| 0)
                           (PROGN
                            (LETT #1#
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (SEQ (LETT |i| (QCDR |iu|) . #5#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL |i| 0 (QREFELT $ 105))
                                             (COND
                                              ((< |i| 10)
                                               (PROGN
                                                (LETT #2#
                                                      (|EFSTRUC;do_int| |op|
                                                       |args| $)
                                                      . #5#)
                                                (GO #6=#:G462))))))))
                                     (EXIT
                                      (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                                   #6# (EXIT #2#))
                                  . #5#)
                            (GO #7=#:G472))))))))
                     (COND
                      ((OR (EQUAL |nm| '|ellipticE2|)
                           (EQUAL |nm| '|ellipticF|))
                       (COND
                        ((SPADCALL
                          (SPADCALL (SPADCALL |args| 2 (QREFELT $ 78)) |x|
                                    (QREFELT $ 141))
                          (|spadConstant| $ 26) (QREFELT $ 34))
                         (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                     (COND
                      ((EQUAL |nm| '|ellipticPi|)
                       (COND
                        ((SPADCALL
                          (SPADCALL (SPADCALL |args| 2 (QREFELT $ 78)) |x|
                                    (QREFELT $ 141))
                          (|spadConstant| $ 26) (QREFELT $ 34))
                         (COND
                          ((SPADCALL
                            (SPADCALL (SPADCALL |args| 3 (QREFELT $ 78)) |x|
                                      (QREFELT $ 141))
                            (|spadConstant| $ 26) (QREFELT $ 34))
                           (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))))
                     (EXIT (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                   #7# (EXIT #1#)))))))) 

(SDEFUN |EFSTRUC;k2Elem| ((|k| |Kernel| F) (|l| |List| (|Symbol|)) ($ F))
        (SPROG
         ((|args| (|List| F)) (#1=#:G483 NIL) (|a| NIL) (#2=#:G482 NIL)
          (|op| (|BasicOperator|)))
         (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 76)) . #3=(|EFSTRUC;k2Elem|))
              (LETT |args|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |a| NIL . #3#)
                          (LETT #1# (SPADCALL |k| (QREFELT $ 32)) . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (|EFSTRUC;realElem| |a| |l| $) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT
               (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 89)))
                     ('T (|EFSTRUC;k2Elem0| |k| |op| |args| $))))))) 

(SDEFUN |EFSTRUC;depeval|
        ((|lf| |List| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (COND
         ((SPADCALL |k| '|log| (QREFELT $ 30))
          (|EFSTRUC;logeval| |lf| |lk| |k| |v| $))
         ((SPADCALL |k| '|exp| (QREFELT $ 30))
          (|EFSTRUC;expeval| |lf| |lk| |k| |v| $))
         ((SPADCALL |k| '|tan| (QREFELT $ 30))
          (|EFSTRUC;taneval| |lf| |lk| |k| |v| $))
         ((SPADCALL |k| '|atan| (QREFELT $ 30))
          (|EFSTRUC;ataneval| |lf| |lk| |k| |v| $))
         ((SPADCALL |k| '|nthRoot| (QREFELT $ 30))
          (|EFSTRUC;rooteval| |lf| |lk| |k|
           (SPADCALL |v| (SPADCALL |v| (QREFELT $ 145)) (QREFELT $ 146)) $))
         ('T (VECTOR |lf| NIL NIL)))) 

(SDEFUN |EFSTRUC;rooteval|
        ((|lf| |List| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|n| |Fraction| (|Integer|))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#1=#:G502 NIL) (|f| NIL) (#2=#:G501 NIL)
          (|lv| (|List| F)) (#3=#:G500 NIL) (|r| NIL) (#4=#:G499 NIL)
          (|l| (|List| (|Kernel| F))) (#5=#:G498 NIL) (#6=#:G497 NIL)
          (|nv| (F)) (|m| (|Integer|)) (|x| (F)))
         (SEQ
          (LETT |nv|
                (SPADCALL
                 (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                       . #7=(|EFSTRUC;rooteval|))
                 (LETT |m| (SPADCALL |n| (QREFELT $ 147)) . #7#)
                 (QREFELT $ 148))
                . #7#)
          (LETT |l|
                (PROGN
                 (LETT #6# NIL . #7#)
                 (SEQ (LETT |r| NIL . #7#)
                      (LETT #5# (CONS |k| (|EFSTRUC;toR| |lk| |x| $)) . #7#)
                      G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |r| (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |r| (QREFELT $ 32))
                                      (QREFELT $ 149))
                            (QREFELT $ 150))
                           |m| (QREFELT $ 151))
                          (LETT #6# (CONS |r| #6#) . #7#)))))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (LETT |lv|
                (PROGN
                 (LETT #4# NIL . #7#)
                 (SEQ (LETT |r| NIL . #7#) (LETT #3# |l| . #7#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL |nv|
                                         (SPADCALL |n|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |r|
                                                                (QREFELT $ 32))
                                                      (QREFELT $ 149))
                                                     (QREFELT $ 150))
                                                    (QREFELT $ 152))
                                                   (QREFELT $ 153))
                                         (QREFELT $ 154))
                               #4#)
                              . #7#)))
                      (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #7#)
          (LETT |nlf|
                (PROGN
                 (LETT #2# NIL . #7#)
                 (SEQ (LETT |f| NIL . #7#) (LETT #1# |lf| . #7#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |f| |l| |lv| (QREFELT $ 113))
                                    #2#)
                              . #7#)))
                      (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #7#)
          (EXIT (VECTOR |nlf| |l| |lv|))))) 

(SDEFUN |EFSTRUC;ataneval|
        ((|lf| |List| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#1=#:G518 NIL) (|f| NIL) (#2=#:G517 NIL)
          (|g| (F)) (|h| (F)) (|d| (F)) (#3=#:G506 NIL) (#4=#:G505 (F))
          (#5=#:G507 (F)) (#6=#:G515 NIL) (|i| NIL) (#7=#:G516 NIL) (|x| NIL)
          (|s| (F)) (#8=#:G513 NIL) (#9=#:G514 NIL) (#10=#:G512 NIL) (|w| (F)))
         (SEQ
          (LETT |w| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                . #11=(|EFSTRUC;ataneval|))
          (LETT |s|
                (SPADCALL
                 (PROGN
                  (LETT #10# NIL . #11#)
                  (SEQ (LETT |x| NIL . #11#)
                       (LETT #9# (|EFSTRUC;toV| |lk| $) . #11#)
                       (LETT |i| (SPADCALL |v| (QREFELT $ 145)) . #11#)
                       (LETT #8# (QVSIZE |v|) . #11#) G190
                       (COND
                        ((OR (> |i| #8#) (ATOM #9#)
                             (PROGN (LETT |x| (CAR #9#) . #11#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #10#
                               (CONS
                                (SPADCALL (QAREF1O |v| |i| 1) |x|
                                          (QREFELT $ 51))
                                #10#)
                               . #11#)))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT #9# (CDR #9#) . #11#))
                             . #11#)
                       (GO G190) G191 (EXIT (NREVERSE #10#))))
                 (QREFELT $ 54))
                . #11#)
          (LETT |g|
                (PROGN
                 (LETT #3# NIL . #11#)
                 (SEQ (LETT |x| NIL . #11#)
                      (LETT #7# (|EFSTRUC;toU| |lk| $) . #11#)
                      (LETT |i| (SPADCALL |v| (QREFELT $ 145)) . #11#)
                      (LETT #6# (QVSIZE |v|) . #11#) G190
                      (COND
                       ((OR (> |i| #6#) (ATOM #7#)
                            (PROGN (LETT |x| (CAR #7#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #5#
                               (SPADCALL (QAREF1O |v| |i| 1) |x|
                                         (QREFELT $ 155))
                               . #11#)
                         (COND
                          (#3#
                           (LETT #4# (SPADCALL #4# #5# (QREFELT $ 136))
                                 . #11#))
                          ('T
                           (PROGN
                            (LETT #4# #5# . #11#)
                            (LETT #3# 'T . #11#)))))))
                      (LETT |i| (PROG1 (+ |i| 1) (LETT #7# (CDR #7#) . #11#))
                            . #11#)
                      (GO G190) G191 (EXIT NIL))
                 (COND (#3# #4#) (#12='T (|spadConstant| $ 26))))
                . #11#)
          (LETT |h|
                (COND
                 ((SPADCALL
                   (LETT |d|
                         (SPADCALL (|spadConstant| $ 72)
                                   (SPADCALL |s| |w| (QREFELT $ 109))
                                   (QREFELT $ 136))
                         . #11#)
                   (QREFELT $ 130))
                  (QREFELT $ 16))
                 (#12#
                  (SPADCALL
                   (SPADCALL (SPADCALL |w| |s| (QREFELT $ 134)) |d|
                             (QREFELT $ 15))
                   (QREFELT $ 114))))
                . #11#)
          (LETT |g| (SPADCALL |g| |h| (QREFELT $ 136)) . #11#)
          (LETT |nlf|
                (PROGN
                 (LETT #2# NIL . #11#)
                 (SEQ (LETT |f| NIL . #11#) (LETT #1# |lf| . #11#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |f| (LIST |k|) (LIST |g|)
                                         (QREFELT $ 113))
                               #2#)
                              . #11#)))
                      (LETT #1# (CDR #1#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #11#)
          (EXIT (VECTOR |nlf| (LIST |k|) (LIST |g|)))))) 

(SDEFUN |EFSTRUC;gdCoef?|
        ((|c| |Fraction| (|Integer|)) (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Boolean|))
        (SPROG ((#1=#:G526 NIL) (#2=#:G527 NIL) (#3=#:G528 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |i| (SPADCALL |v| (QREFELT $ 145))
                           . #4=(|EFSTRUC;gdCoef?|))
                     (LETT #3# (QVSIZE |v|) . #4#) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((QEQCAR
                          (SPADCALL
                           (SPADCALL (QAREF1O |v| |i| 1) |c| (QREFELT $ 153))
                           (QREFELT $ 156))
                          1)
                         (PROGN
                          (LETT #1#
                                (PROGN (LETT #2# 'NIL . #4#) (GO #5=#:G525))
                                . #4#)
                          (GO #6=#:G523))))))
                     (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |EFSTRUC;goodCoef|
        ((|v| |Vector| (|Fraction| (|Integer|))) (|l| |List| (|Kernel| F))
         (|s| |Symbol|)
         ($ |Union|
          (|Record| (|:| |index| (|Integer|)) (|:| |ker| (|Kernel| F)))
          "failed"))
        (SPROG
         ((#1=#:G559 NIL) (#2=#:G560 NIL)
          (|r| (|Union| (|Fraction| (|Integer|)) "failed")) (#3=#:G564 NIL)
          (|i| NIL) (#4=#:G565 NIL) (|k| NIL) (|h| (|NonNegativeInteger|))
          (|j| (|Integer|)) (|h1| (|NonNegativeInteger|)) (#5=#:G562 NIL)
          (#6=#:G563 NIL) (|ll| (|List| (|Kernel| F))) (#7=#:G561 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |h| 0 . #8=(|EFSTRUC;goodCoef|)) (LETT |j| 0 . #8#)
                (LETT |ll| NIL . #8#)
                (SEQ (LETT |k| NIL . #8#) (LETT #7# |l| . #8#) G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#) . #8#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((OR (SPADCALL |k| '|log| (QREFELT $ 30))
                             (OR (SPADCALL |k| '|exp| (QREFELT $ 30))
                                 (OR (SPADCALL |k| '|tan| (QREFELT $ 30))
                                     (SPADCALL |k| '|atan| (QREFELT $ 30)))))
                         (SEQ (LETT |ll| (CONS |k| |ll|) . #8#)
                              (EXIT (LETT |h| (+ |h| 1) . #8#)))))))
                     (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((NULL
                   (EQL |h|
                        (+ (- (QVSIZE |v|) (SPADCALL |v| (QREFELT $ 145))) 1)))
                  (EXIT (CONS 1 "failed"))))
                (LETT |h| 0 . #8#) (LETT |ll| (REVERSE |ll|) . #8#)
                (SEQ (LETT |k| NIL . #8#) (LETT #6# |ll| . #8#)
                     (LETT |i| (SPADCALL |v| (QREFELT $ 145)) . #8#)
                     (LETT #5# (QVSIZE |v|) . #8#) G190
                     (COND
                      ((OR (> |i| #5#) (ATOM #6#)
                           (PROGN (LETT |k| (CAR #6#) . #8#) NIL))
                       (GO G191)))
                     (SEQ (LETT |h1| (SPADCALL |k| (QREFELT $ 157)) . #8#)
                          (EXIT
                           (COND
                            ((SPADCALL |h1| |h| (QREFELT $ 158))
                             (SEQ (LETT |j| |i| . #8#)
                                  (EXIT (LETT |h| |h1| . #8#)))))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT #6# (CDR #6#) . #8#))
                           . #8#)
                     (GO G190) G191 (EXIT NIL))
                (SEQ
                 (EXIT
                  (SEQ (LETT |k| NIL . #8#) (LETT #4# |ll| . #8#)
                       (LETT |i| (SPADCALL |v| (QREFELT $ 145)) . #8#)
                       (LETT #3# (QVSIZE |v|) . #8#) G190
                       (COND
                        ((OR (> |i| #3#) (ATOM #4#)
                             (PROGN (LETT |k| (CAR #4#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |k| |s| (QREFELT $ 30))
                           (COND
                            ((>= |i| |j|)
                             (SEQ
                              (LETT |r|
                                    (SPADCALL (QAREF1O |v| |i| 1)
                                              (QREFELT $ 160))
                                    . #8#)
                              (EXIT
                               (COND
                                ((QEQCAR |r| 0)
                                 (COND
                                  ((QEQCAR
                                    (SPADCALL (QCDR |r|) (QREFELT $ 156)) 0)
                                   (COND
                                    ((|EFSTRUC;gdCoef?| (QAREF1O |v| |i| 1) |v|
                                      $)
                                     (PROGN
                                      (LETT #1#
                                            (PROGN
                                             (LETT #2# (CONS 0 (CONS |i| |k|))
                                                   . #8#)
                                             (GO #9=#:G558))
                                            . #8#)
                                      (GO #10=#:G556))))))))))))))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT #4# (CDR #4#) . #8#))
                             . #8#)
                       (GO G190) G191 (EXIT NIL)))
                 #10# (EXIT #1#))
                (EXIT (CONS 1 "failed"))))
          #9# (EXIT #2#)))) 

(SDEFUN |EFSTRUC;taneval|
        ((|lf| |List| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#2=#:G591 NIL) (|f| NIL) (#3=#:G590 NIL)
          (|g| (F)) (#4=#:G588 NIL) (|a| NIL) (#5=#:G589 NIL) (|x| NIL)
          (#6=#:G587 NIL) (|l| (|List| #1#)) (#7=#:G586 NIL) (|kk| NIL)
          (#8=#:G585 NIL) (|lv| (|List| (|Fraction| (|Integer|))))
          (#9=#:G584 NIL) (|i| NIL) (#10=#:G583 NIL) (|v0| (|Integer|))
          (|rec|
           (|Union|
            (|Record| (|:| |index| (|Integer|)) (|:| |ker| (|Kernel| F)))
            "failed"))
          (|c| (F)) (#11=#:G568 NIL) (#12=#:G567 (F)) (#13=#:G569 (F))
          (#14=#:G581 NIL) (#15=#:G582 NIL) (|fns| (|List| F)) (|u| (F)))
         (SEQ
          (LETT |u| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                . #16=(|EFSTRUC;taneval|))
          (LETT |fns| (|EFSTRUC;toU| |lk| $) . #16#)
          (LETT |c|
                (SPADCALL |u|
                          (PROGN
                           (LETT #11# NIL . #16#)
                           (SEQ (LETT |x| NIL . #16#) (LETT #15# |fns| . #16#)
                                (LETT |i| (SPADCALL |v| (QREFELT $ 145))
                                      . #16#)
                                (LETT #14# (QVSIZE |v|) . #16#) G190
                                (COND
                                 ((OR (> |i| #14#) (ATOM #15#)
                                      (PROGN (LETT |x| (CAR #15#) . #16#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #13#
                                         (SPADCALL (QAREF1O |v| |i| 1) |x|
                                                   (QREFELT $ 155))
                                         . #16#)
                                   (COND
                                    (#11#
                                     (LETT #12#
                                           (SPADCALL #12# #13# (QREFELT $ 136))
                                           . #16#))
                                    ('T
                                     (PROGN
                                      (LETT #12# #13# . #16#)
                                      (LETT #11# 'T . #16#)))))))
                                (LETT |i|
                                      (PROG1 (+ |i| 1)
                                        (LETT #15# (CDR #15#) . #16#))
                                      . #16#)
                                (GO G190) G191 (EXIT NIL))
                           (COND (#11# #12#) (#17='T (|spadConstant| $ 26))))
                          (QREFELT $ 134))
                . #16#)
          (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|tan| $) . #16#)
          (EXIT
           (COND
            ((QEQCAR |rec| 1)
             (|EFSTRUC;tannosimp| |lf| |lk| |k| |v| |fns| |c| $))
            (#17#
             (SEQ
              (LETT |v0|
                    (SPADCALL
                     (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1)
                               (QREFELT $ 161))
                     (QREFELT $ 147))
                    . #16#)
              (LETT |lv|
                    (PROGN
                     (LETT #10# NIL . #16#)
                     (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 145)) . #16#)
                          (LETT #9# (QVSIZE |v|) . #16#) G190
                          (COND ((> |i| #9#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |i| (QCAR (QCDR |rec|))
                                        (QREFELT $ 151))
                              (LETT #10# (CONS (QAREF1O |v| |i| 1) #10#)
                                    . #16#)))))
                          (LETT |i| (+ |i| 1) . #16#) (GO G190) G191
                          (EXIT (NREVERSE #10#))))
                    . #16#)
              (LETT |l|
                    (PROGN
                     (LETT #8# NIL . #16#)
                     (SEQ (LETT |kk| NIL . #16#) (LETT #7# |lk| . #16#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |kk| (CAR #7#) . #16#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |kk| (QCDR (QCDR |rec|))
                                        (QREFELT $ 115))
                              (LETT #8# (CONS |kk| #8#) . #16#)))))
                          (LETT #7# (CDR #7#) . #16#) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    . #16#)
              (LETT |g|
                    (|EFSTRUC;tanSum|
                     (SPADCALL (SPADCALL |v0| |c| (QREFELT $ 162))
                               (QREFELT $ 14))
                     (CONS
                      (SPADCALL (SPADCALL |k| (QREFELT $ 89)) |v0|
                                (QREFELT $ 50))
                      (PROGN
                       (LETT #6# NIL . #16#)
                       (SEQ (LETT |x| NIL . #16#)
                            (LETT #5# (|EFSTRUC;toV| |l| $) . #16#)
                            (LETT |a| NIL . #16#) (LETT #4# |lv| . #16#) G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |a| (CAR #4#) . #16#) NIL)
                                  (ATOM #5#)
                                  (PROGN (LETT |x| (CAR #5#) . #16#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #6#
                                    (CONS
                                     (SPADCALL |x|
                                               (-
                                                (SPADCALL
                                                 (SPADCALL |a| |v0|
                                                           (QREFELT $ 163))
                                                 (QREFELT $ 147)))
                                               (QREFELT $ 50))
                                     #6#)
                                    . #16#)))
                            (LETT #4#
                                  (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #16#))
                                  . #16#)
                            (GO G190) G191 (EXIT (NREVERSE #6#)))))
                     $)
                    . #16#)
              (LETT |nlf|
                    (PROGN
                     (LETT #3# NIL . #16#)
                     (SEQ (LETT |f| NIL . #16#) (LETT #2# |lf| . #16#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |f| (CAR #2#) . #16#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL |f| (LIST (QCDR (QCDR |rec|)))
                                             (LIST |g|) (QREFELT $ 113))
                                   #3#)
                                  . #16#)))
                          (LETT #2# (CDR #2#) . #16#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #16#)
              (EXIT (VECTOR |nlf| (LIST (QCDR (QCDR |rec|))) (LIST |g|)))))))))) 

(SDEFUN |EFSTRUC;tannosimp|
        ((|lf| |List| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|))) (|fns| |List| F) (|c| F)
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#2=#:G634 NIL) (|f| NIL) (#3=#:G633 NIL)
          (|h| (F)) (#4=#:G631 NIL) (|i| NIL) (#5=#:G632 NIL) (|x| NIL)
          (#6=#:G630 NIL) (#7=#:G629 NIL) (#8=#:G628 NIL) (|lk1| (|List| #1#))
          (|newtan| (|List| F)) (#9=#:G626 NIL) (#10=#:G627 NIL) (|t| NIL)
          (#11=#:G625 NIL) (|li| (|List| (|NonNegativeInteger|)))
          (#12=#:G624 NIL) (#13=#:G623 NIL) (#14=#:G622 NIL) (#15=#:G621 NIL)
          (|newt| (|List| F)) (#16=#:G619 NIL) (|u| NIL) (#17=#:G620 NIL)
          (#18=#:G618 NIL) (|dd| (F)) (|d| #19=(|Integer|))
          (|cd| (|Record| (|:| |num| (|Vector| (|Integer|))) (|:| |den| #19#)))
          (#20=#:G616 NIL) (#21=#:G617 NIL) (#22=#:G615 NIL) (#23=#:G614 NIL)
          (#24=#:G613 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (QVSIZE |v|) . #25=(|EFSTRUC;tannosimp|))
              (LETT |lk|
                    (PROGN
                     (LETT #24# NIL . #25#)
                     (SEQ (LETT |x| NIL . #25#) (LETT #23# |lk| . #25#) G190
                          (COND
                           ((OR (ATOM #23#)
                                (PROGN (LETT |x| (CAR #23#) . #25#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND ((SPADCALL |x| '|tan| (QREFELT $ 30)) 'T)
                                    (#26='T
                                     (SPADCALL |x| '|atan| (QREFELT $ 30))))
                              (LETT #24# (CONS |x| #24#) . #25#)))))
                          (LETT #23# (CDR #23#) . #25#) (GO G190) G191
                          (EXIT (NREVERSE #24#))))
                    . #25#)
              (LETT |lk1|
                    (PROGN
                     (LETT #22# NIL . #25#)
                     (SEQ (LETT |i| 1 . #25#) (LETT #21# |n| . #25#)
                          (LETT |x| NIL . #25#) (LETT #20# |lk| . #25#) G190
                          (COND
                           ((OR (ATOM #20#)
                                (PROGN (LETT |x| (CAR #20#) . #25#) NIL)
                                (|greater_SI| |i| #21#))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((SPADCALL (QAREF1O |v| |i| 1)
                                          (|spadConstant| $ 98) (QREFELT $ 83))
                                'NIL)
                               (#26# 'T))
                              (LETT #22# (CONS |x| #22#) . #25#)))))
                          (LETT #20#
                                (PROG1 (CDR #20#)
                                  (LETT |i| (|inc_SI| |i|) . #25#))
                                . #25#)
                          (GO G190) G191 (EXIT (NREVERSE #22#))))
                    . #25#)
              (EXIT
               (COND
                ((SPADCALL (CONS #'|EFSTRUC;tannosimp!0| $) |lk1|
                           (QREFELT $ 164))
                 (SEQ
                  (LETT |dd|
                        (SPADCALL
                         (LETT |d|
                               (QCDR
                                (LETT |cd| (SPADCALL |v| (QREFELT $ 167))
                                      . #25#))
                               . #25#)
                         (QREFELT $ 13))
                        . #25#)
                  (LETT |newt|
                        (PROGN
                         (LETT #18# NIL . #25#)
                         (SEQ (LETT |i| 1 . #25#) (LETT #17# |n| . #25#)
                              (LETT |u| NIL . #25#) (LETT #16# |fns| . #25#)
                              G190
                              (COND
                               ((OR (ATOM #16#)
                                    (PROGN (LETT |u| (CAR #16#) . #25#) NIL)
                                    (|greater_SI| |i| #17#))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((COND
                                   ((SPADCALL (QAREF1O |v| |i| 1)
                                              (|spadConstant| $ 98)
                                              (QREFELT $ 83))
                                    'NIL)
                                   (#26# 'T))
                                  (LETT #18#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |u| |dd| (QREFELT $ 15))
                                          (QREFELT $ 56))
                                         #18#)
                                        . #25#)))))
                              (LETT #16#
                                    (PROG1 (CDR #16#)
                                      (LETT |i| (|inc_SI| |i|) . #25#))
                                    . #25#)
                              (GO G190) G191 (EXIT (NREVERSE #18#))))
                        . #25#)
                  (LETT |newtan|
                        (PROGN
                         (LETT #15# NIL . #25#)
                         (SEQ (LETT |t| NIL . #25#) (LETT #14# |newt| . #25#)
                              G190
                              (COND
                               ((OR (ATOM #14#)
                                    (PROGN (LETT |t| (CAR #14#) . #25#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #15#
                                      (CONS (SPADCALL |t| |d| (QREFELT $ 50))
                                            #15#)
                                      . #25#)))
                              (LETT #14# (CDR #14#) . #25#) (GO G190) G191
                              (EXIT (NREVERSE #15#))))
                        . #25#)
                  (LETT |li|
                        (PROGN
                         (LETT #13# NIL . #25#)
                         (SEQ (LETT |i| 1 . #25#) (LETT #12# |n| . #25#) G190
                              (COND ((|greater_SI| |i| #12#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((COND
                                   ((SPADCALL (QAREF1O |v| |i| 1)
                                              (|spadConstant| $ 98)
                                              (QREFELT $ 83))
                                    'NIL)
                                   (#26# 'T))
                                  (LETT #13# (CONS |i| #13#) . #25#)))))
                              (LETT |i| (|inc_SI| |i|) . #25#) (GO G190) G191
                              (EXIT (NREVERSE #13#))))
                        . #25#)
                  (LETT |h|
                        (|EFSTRUC;tanSum| |c|
                         (PROGN
                          (LETT #11# NIL . #25#)
                          (SEQ (LETT |t| NIL . #25#) (LETT #10# |newt| . #25#)
                               (LETT |i| NIL . #25#) (LETT #9# |li| . #25#)
                               G190
                               (COND
                                ((OR (ATOM #9#)
                                     (PROGN (LETT |i| (CAR #9#) . #25#) NIL)
                                     (ATOM #10#)
                                     (PROGN (LETT |t| (CAR #10#) . #25#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #11#
                                       (CONS
                                        (SPADCALL |t|
                                                  (QAREF1O (QCAR |cd|) |i| 1)
                                                  (QREFELT $ 50))
                                        #11#)
                                       . #25#)))
                               (LETT #9#
                                     (PROG1 (CDR #9#)
                                       (LETT #10# (CDR #10#) . #25#))
                                     . #25#)
                               (GO G190) G191 (EXIT (NREVERSE #11#))))
                         $)
                        . #25#)
                  (LETT |newtan| (CONS |h| |newtan|) . #25#)
                  (LETT |lk1| (CONS |k| |lk1|) . #25#)
                  (LETT |nlf|
                        (PROGN
                         (LETT #8# NIL . #25#)
                         (SEQ (LETT |f| NIL . #25#) (LETT #7# |lf| . #25#) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |f| (CAR #7#) . #25#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #8#
                                      (CONS
                                       (SPADCALL |f| |lk1| |newtan|
                                                 (QREFELT $ 113))
                                       #8#)
                                      . #25#)))
                              (LETT #7# (CDR #7#) . #25#) (GO G190) G191
                              (EXIT (NREVERSE #8#))))
                        . #25#)
                  (EXIT (VECTOR |nlf| |lk1| |newtan|))))
                (#26#
                 (SEQ
                  (LETT |h|
                        (|EFSTRUC;tanSum| |c|
                         (PROGN
                          (LETT #6# NIL . #25#)
                          (SEQ (LETT |x| NIL . #25#)
                               (LETT #5# (|EFSTRUC;toV| |lk| $) . #25#)
                               (LETT |i| 1 . #25#) (LETT #4# |n| . #25#) G190
                               (COND
                                ((OR (|greater_SI| |i| #4#) (ATOM #5#)
                                     (PROGN (LETT |x| (CAR #5#) . #25#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #6#
                                       (CONS
                                        (SPADCALL (QAREF1O |v| |i| 1) |x|
                                                  (QREFELT $ 51))
                                        #6#)
                                       . #25#)))
                               (LETT |i|
                                     (PROG1 (|inc_SI| |i|)
                                       (LETT #5# (CDR #5#) . #25#))
                                     . #25#)
                               (GO G190) G191 (EXIT (NREVERSE #6#))))
                         $)
                        . #25#)
                  (LETT |nlf|
                        (PROGN
                         (LETT #3# NIL . #25#)
                         (SEQ (LETT |f| NIL . #25#) (LETT #2# |lf| . #25#) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |f| (CAR #2#) . #25#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (SPADCALL |f| (LIST |k|) (LIST |h|)
                                                 (QREFELT $ 113))
                                       #3#)
                                      . #25#)))
                              (LETT #2# (CDR #2#) . #25#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #25#)
                  (EXIT (VECTOR |nlf| (LIST |k|) (LIST |h|)))))))))) 

(SDEFUN |EFSTRUC;tannosimp!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| '|tan| (QREFELT $ 30))) 

(SDEFUN |EFSTRUC;expnosimp|
        ((|lf| |List| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|))) (|fns| |List| F) (|g| F)
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#2=#:G757 NIL) (|f| NIL) (#3=#:G756 NIL)
          (|h| (F)) (#4=#:G732 NIL) (#5=#:G731 (F)) (#6=#:G733 (F))
          (#7=#:G754 NIL) (|i| NIL) (#8=#:G755 NIL) (|y| NIL) (#9=#:G753 NIL)
          (#10=#:G752 NIL) (|newexp| (|List| F)) (|lk1| (|List| #1#))
          (#11=#:G688 NIL) (#12=#:G687 (F)) (#13=#:G689 (F)) (#14=#:G750 NIL)
          (#15=#:G751 NIL) (|e| NIL) (|li| (|List| (|NonNegativeInteger|)))
          (#16=#:G749 NIL) (#17=#:G748 NIL) (#18=#:G747 NIL) (#19=#:G746 NIL)
          (|newe| (|List| F)) (#20=#:G744 NIL) (#21=#:G745 NIL)
          (#22=#:G743 NIL) (|dd| (F)) (|d| #23=(|Integer|))
          (|cd| (|Record| (|:| |num| (|Vector| (|Integer|))) (|:| |den| #23#)))
          (#24=#:G741 NIL) (|x| NIL) (#25=#:G742 NIL) (#26=#:G740 NIL)
          (#27=#:G739 NIL) (#28=#:G738 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (QVSIZE |v|) . #29=(|EFSTRUC;expnosimp|))
              (LETT |lk|
                    (PROGN
                     (LETT #28# NIL . #29#)
                     (SEQ (LETT |x| NIL . #29#) (LETT #27# |lk| . #29#) G190
                          (COND
                           ((OR (ATOM #27#)
                                (PROGN (LETT |x| (CAR #27#) . #29#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND ((SPADCALL |x| '|exp| (QREFELT $ 30)) 'T)
                                    (#30='T
                                     (SPADCALL |x| '|log| (QREFELT $ 30))))
                              (LETT #28# (CONS |x| #28#) . #29#)))))
                          (LETT #27# (CDR #27#) . #29#) (GO G190) G191
                          (EXIT (NREVERSE #28#))))
                    . #29#)
              (LETT |lk1|
                    (PROGN
                     (LETT #26# NIL . #29#)
                     (SEQ (LETT |i| 1 . #29#) (LETT #25# |n| . #29#)
                          (LETT |x| NIL . #29#) (LETT #24# |lk| . #29#) G190
                          (COND
                           ((OR (ATOM #24#)
                                (PROGN (LETT |x| (CAR #24#) . #29#) NIL)
                                (|greater_SI| |i| #25#))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((SPADCALL (QAREF1O |v| |i| 1)
                                          (|spadConstant| $ 98) (QREFELT $ 83))
                                'NIL)
                               (#30# 'T))
                              (LETT #26# (CONS |x| #26#) . #29#)))))
                          (LETT #24#
                                (PROG1 (CDR #24#)
                                  (LETT |i| (|inc_SI| |i|) . #29#))
                                . #29#)
                          (GO G190) G191 (EXIT (NREVERSE #26#))))
                    . #29#)
              (EXIT
               (COND
                ((SPADCALL (CONS #'|EFSTRUC;expnosimp!0| $) |lk1|
                           (QREFELT $ 164))
                 (SEQ
                  (LETT |dd|
                        (SPADCALL
                         (LETT |d|
                               (QCDR
                                (LETT |cd| (SPADCALL |v| (QREFELT $ 167))
                                      . #29#))
                               . #29#)
                         (QREFELT $ 13))
                        . #29#)
                  (LETT |newe|
                        (PROGN
                         (LETT #22# NIL . #29#)
                         (SEQ (LETT |i| 1 . #29#) (LETT #21# |n| . #29#)
                              (LETT |y| NIL . #29#) (LETT #20# |fns| . #29#)
                              G190
                              (COND
                               ((OR (ATOM #20#)
                                    (PROGN (LETT |y| (CAR #20#) . #29#) NIL)
                                    (|greater_SI| |i| #21#))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((COND
                                   ((SPADCALL (QAREF1O |v| |i| 1)
                                              (|spadConstant| $ 98)
                                              (QREFELT $ 83))
                                    'NIL)
                                   (#30# 'T))
                                  (LETT #22#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |y| |dd| (QREFELT $ 15))
                                          (QREFELT $ 132))
                                         #22#)
                                        . #29#)))))
                              (LETT #20#
                                    (PROG1 (CDR #20#)
                                      (LETT |i| (|inc_SI| |i|) . #29#))
                                    . #29#)
                              (GO G190) G191 (EXIT (NREVERSE #22#))))
                        . #29#)
                  (LETT |newexp|
                        (PROGN
                         (LETT #19# NIL . #29#)
                         (SEQ (LETT |e| NIL . #29#) (LETT #18# |newe| . #29#)
                              G190
                              (COND
                               ((OR (ATOM #18#)
                                    (PROGN (LETT |e| (CAR #18#) . #29#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #19#
                                      (CONS (SPADCALL |e| |d| (QREFELT $ 106))
                                            #19#)
                                      . #29#)))
                              (LETT #18# (CDR #18#) . #29#) (GO G190) G191
                              (EXIT (NREVERSE #19#))))
                        . #29#)
                  (LETT |li|
                        (PROGN
                         (LETT #17# NIL . #29#)
                         (SEQ (LETT |i| 1 . #29#) (LETT #16# |n| . #29#) G190
                              (COND ((|greater_SI| |i| #16#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((COND
                                   ((SPADCALL (QAREF1O |v| |i| 1)
                                              (|spadConstant| $ 98)
                                              (QREFELT $ 83))
                                    'NIL)
                                   (#30# 'T))
                                  (LETT #17# (CONS |i| #17#) . #29#)))))
                              (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191
                              (EXIT (NREVERSE #17#))))
                        . #29#)
                  (LETT |h|
                        (SPADCALL
                         (PROGN
                          (LETT #11# NIL . #29#)
                          (SEQ (LETT |e| NIL . #29#) (LETT #15# |newe| . #29#)
                               (LETT |i| NIL . #29#) (LETT #14# |li| . #29#)
                               G190
                               (COND
                                ((OR (ATOM #14#)
                                     (PROGN (LETT |i| (CAR #14#) . #29#) NIL)
                                     (ATOM #15#)
                                     (PROGN (LETT |e| (CAR #15#) . #29#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #13#
                                        (SPADCALL |e|
                                                  (QAREF1O (QCAR |cd|) |i| 1)
                                                  (QREFELT $ 106))
                                        . #29#)
                                  (COND
                                   (#11#
                                    (LETT #12#
                                          (SPADCALL #12# #13# (QREFELT $ 109))
                                          . #29#))
                                   ('T
                                    (PROGN
                                     (LETT #12# #13# . #29#)
                                     (LETT #11# 'T . #29#)))))))
                               (LETT #14#
                                     (PROG1 (CDR #14#)
                                       (LETT #15# (CDR #15#) . #29#))
                                     . #29#)
                               (GO G190) G191 (EXIT NIL))
                          (COND (#11# #12#) (#30# (|spadConstant| $ 72))))
                         |g| (QREFELT $ 109))
                        . #29#)
                  (LETT |lk1| (CONS |k| |lk1|) . #29#)
                  (LETT |newexp| (CONS |h| |newexp|) . #29#)
                  (LETT |nlf|
                        (PROGN
                         (LETT #10# NIL . #29#)
                         (SEQ (LETT |f| NIL . #29#) (LETT #9# |lf| . #29#) G190
                              (COND
                               ((OR (ATOM #9#)
                                    (PROGN (LETT |f| (CAR #9#) . #29#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #10#
                                      (CONS
                                       (SPADCALL |f| |lk1| |newexp|
                                                 (QREFELT $ 113))
                                       #10#)
                                      . #29#)))
                              (LETT #9# (CDR #9#) . #29#) (GO G190) G191
                              (EXIT (NREVERSE #10#))))
                        . #29#)
                  (EXIT (VECTOR |nlf| |lk1| |newexp|))))
                (#30#
                 (SEQ
                  (LETT |h|
                        (SPADCALL
                         (PROGN
                          (LETT #4# NIL . #29#)
                          (SEQ (LETT |y| NIL . #29#) (LETT #8# |fns| . #29#)
                               (LETT |i| (SPADCALL |v| (QREFELT $ 145)) . #29#)
                               (LETT #7# (QVSIZE |v|) . #29#) G190
                               (COND
                                ((OR (> |i| #7#) (ATOM #8#)
                                     (PROGN (LETT |y| (CAR #8#) . #29#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #6#
                                        (SPADCALL
                                         (SPADCALL |y| (QREFELT $ 132))
                                         (QAREF1O |v| |i| 1) (QREFELT $ 154))
                                        . #29#)
                                  (COND
                                   (#4#
                                    (LETT #5#
                                          (SPADCALL #5# #6# (QREFELT $ 109))
                                          . #29#))
                                   ('T
                                    (PROGN
                                     (LETT #5# #6# . #29#)
                                     (LETT #4# 'T . #29#)))))))
                               (LETT |i|
                                     (PROG1 (+ |i| 1)
                                       (LETT #8# (CDR #8#) . #29#))
                                     . #29#)
                               (GO G190) G191 (EXIT NIL))
                          (COND (#4# #5#) (#30# (|spadConstant| $ 72))))
                         |g| (QREFELT $ 109))
                        . #29#)
                  (LETT |nlf|
                        (PROGN
                         (LETT #3# NIL . #29#)
                         (SEQ (LETT |f| NIL . #29#) (LETT #2# |lf| . #29#) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |f| (CAR #2#) . #29#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (SPADCALL |f| (LIST |k|) (LIST |h|)
                                                 (QREFELT $ 113))
                                       #3#)
                                      . #29#)))
                              (LETT #2# (CDR #2#) . #29#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #29#)
                  (EXIT (VECTOR |nlf| (LIST |k|) (LIST |h|)))))))))) 

(SDEFUN |EFSTRUC;expnosimp!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| '|exp| (QREFELT $ 30))) 

(SDEFUN |EFSTRUC;logeval|
        ((|lf| |List| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#1=#:G782 NIL) (|f| NIL) (#2=#:G781 NIL)
          (|g| (F)) (#3=#:G770 NIL) (#4=#:G769 (F)) (#5=#:G771 (F))
          (#6=#:G779 NIL) (|i| NIL) (#7=#:G780 NIL) (|x| NIL) (|c| (F))
          (#8=#:G761 NIL) (#9=#:G760 (F)) (#10=#:G762 (F)) (#11=#:G777 NIL)
          (#12=#:G778 NIL) (|dd| (|Integer|)) (#13=#:G776 NIL) (#14=#:G775 NIL)
          (|z| (F)))
         (SEQ
          (LETT |z| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                . #15=(|EFSTRUC;logeval|))
          (LETT |dd|
                (SPADCALL
                 (PROGN
                  (LETT #14# NIL . #15#)
                  (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 145)) . #15#)
                       (LETT #13# (QVSIZE |v|) . #15#) G190
                       (COND ((> |i| #13#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #14#
                               (CONS
                                (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 40))
                                #14#)
                               . #15#)))
                       (LETT |i| (+ |i| 1) . #15#) (GO G190) G191
                       (EXIT (NREVERSE #14#))))
                 (QREFELT $ 168))
                . #15#)
          (LETT |c|
                (SPADCALL (SPADCALL |z| |dd| (QREFELT $ 106))
                          (PROGN
                           (LETT #8# NIL . #15#)
                           (SEQ
                            (LETT |i| (SPADCALL |v| (QREFELT $ 145)) . #15#)
                            (LETT #12# (QVSIZE |v|) . #15#)
                            (LETT |x| NIL . #15#)
                            (LETT #11# (|EFSTRUC;toZ| |lk| $) . #15#) G190
                            (COND
                             ((OR (ATOM #11#)
                                  (PROGN (LETT |x| (CAR #11#) . #15#) NIL)
                                  (> |i| #12#))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #10#
                                     (SPADCALL |x|
                                               (SPADCALL |dd|
                                                         (QAREF1O |v| |i| 1)
                                                         (QREFELT $ 169))
                                               (QREFELT $ 154))
                                     . #15#)
                               (COND
                                (#8#
                                 (LETT #9# (SPADCALL #9# #10# (QREFELT $ 109))
                                       . #15#))
                                ('T
                                 (PROGN
                                  (LETT #9# #10# . #15#)
                                  (LETT #8# 'T . #15#)))))))
                            (LETT #11#
                                  (PROG1 (CDR #11#)
                                    (LETT |i| (+ |i| 1) . #15#))
                                  . #15#)
                            (GO G190) G191 (EXIT NIL))
                           (COND (#8# #9#) (#16='T (|spadConstant| $ 72))))
                          (QREFELT $ 15))
                . #15#)
          (LETT |g|
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL . #15#)
                  (SEQ (LETT |x| NIL . #15#)
                       (LETT #7# (|EFSTRUC;toY| |lk| $) . #15#)
                       (LETT |i| (SPADCALL |v| (QREFELT $ 145)) . #15#)
                       (LETT #6# (QVSIZE |v|) . #15#) G190
                       (COND
                        ((OR (> |i| #6#) (ATOM #7#)
                             (PROGN (LETT |x| (CAR #7#) . #15#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #5#
                                (SPADCALL (QAREF1O |v| |i| 1) |x|
                                          (QREFELT $ 155))
                                . #15#)
                          (COND
                           (#3#
                            (LETT #4# (SPADCALL #4# #5# (QREFELT $ 136))
                                  . #15#))
                           ('T
                            (PROGN
                             (LETT #4# #5# . #15#)
                             (LETT #3# 'T . #15#)))))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT #7# (CDR #7#) . #15#))
                             . #15#)
                       (GO G190) G191 (EXIT NIL))
                  (COND (#3# #4#) (#16# (|spadConstant| $ 26))))
                 (SPADCALL (SPADCALL |c| (QREFELT $ 90))
                           (SPADCALL (SPADCALL |dd| (QREFELT $ 170))
                                     (QREFELT $ 116))
                           (QREFELT $ 15))
                 (QREFELT $ 136))
                . #15#)
          (LETT |nlf|
                (PROGN
                 (LETT #2# NIL . #15#)
                 (SEQ (LETT |f| NIL . #15#) (LETT #1# |lf| . #15#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |f| (LIST |k|) (LIST |g|)
                                         (QREFELT $ 113))
                               #2#)
                              . #15#)))
                      (LETT #1# (CDR #1#) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #15#)
          (EXIT (VECTOR |nlf| (LIST |k|) (LIST |g|)))))) 

(SDEFUN |EFSTRUC;rischNormalize;LLR;42|
        ((|lf| |List| F) (|vars| |List| (|Symbol|))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((#1=#:G795 NIL)
          (|rn|
           (|Record| (|:| |funcs| (|List| F))
                     (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (|nlf| (|List| F)) (#2=#:G799 NIL) (|f| NIL) (#3=#:G798 NIL)
          (#4=#:G794 NIL)
          (|rec|
           (|Record| (|:| |funcs| (|List| F))
                     (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (|c|
           (|Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
                    (|:| |func| F) (|:| |fail| (|Boolean|))))
          (|klist| (|List| (|Kernel| F))) (#5=#:G796 NIL) (|i| NIL)
          (#6=#:G797 NIL) (|kk| NIL) (|n| (|NonNegativeInteger|))
          (|pars| (|List| (|Symbol|))) (|funs| (|List| (|Kernel| F))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |funs| (SPADCALL |lf| (QREFELT $ 171))
                  . #7=(|EFSTRUC;rischNormalize;LLR;42|))
            (LETT |pars| (SPADCALL |lf| (QREFELT $ 172)) . #7#)
            (LETT |pars| (SPADCALL |pars| |vars| (QREFELT $ 173)) . #7#)
            (EXIT
             (COND ((NULL |funs|) (VECTOR |lf| NIL NIL))
                   ('T
                    (SEQ (LETT |n| (LENGTH |funs|) . #7#)
                         (SEQ (LETT |kk| NIL . #7#)
                              (LETT #6# (CDR |funs|) . #7#) (LETT |i| 1 . #7#)
                              (LETT #5# |n| . #7#) G190
                              (COND
                               ((OR (|greater_SI| |i| #5#) (ATOM #6#)
                                    (PROGN (LETT |kk| (CAR #6#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ
                                 (LETT |klist|
                                       (SPADCALL |funs| |i| (QREFELT $ 174))
                                       . #7#)
                                 (SEQ
                                  (LETT |c|
                                        (|EFSTRUC;findRelation| |vars| |pars|
                                         |klist| |kk| $)
                                        . #7#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |c| 0)
                                     (COND
                                      ((NULL
                                        (SPADCALL (CDR |c|) (QREFELT $ 175)))
                                       (PROGN
                                        (LETT #4#
                                              (SEQ
                                               (LETT |rec|
                                                     (|EFSTRUC;depeval| |lf|
                                                      |klist| |kk| (CDR |c|) $)
                                                     . #7#)
                                               (LETT |rn|
                                                     (SPADCALL (QVELT |rec| 0)
                                                               |vars|
                                                               (QREFELT $ 177))
                                                     . #7#)
                                               (EXIT
                                                (PROGN
                                                 (LETT #1#
                                                       (VECTOR (QVELT |rn| 0)
                                                               (SPADCALL
                                                                (QVELT |rec| 1)
                                                                (QVELT |rn| 1)
                                                                (QREFELT $
                                                                         178))
                                                               (SPADCALL
                                                                (QVELT |rec| 2)
                                                                (QVELT |rn| 2)
                                                                (QREFELT $
                                                                         142)))
                                                       . #7#)
                                                 (GO #8=#:G793))))
                                              . #7#)
                                        (GO #9=#:G789))))))))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |c| 1)
                                    (SEQ
                                     (LETT |nlf|
                                           (PROGN
                                            (LETT #3# NIL . #7#)
                                            (SEQ (LETT |f| NIL . #7#)
                                                 (LETT #2# |lf| . #7#) G190
                                                 (COND
                                                  ((OR (ATOM #2#)
                                                       (PROGN
                                                        (LETT |f| (CAR #2#)
                                                              . #7#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #3#
                                                         (CONS
                                                          (SPADCALL |f|
                                                                    (LIST |kk|)
                                                                    (LIST
                                                                     (CDR |c|))
                                                                    (QREFELT $
                                                                             113))
                                                          #3#)
                                                         . #7#)))
                                                 (LETT #2# (CDR #2#) . #7#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #3#))))
                                           . #7#)
                                     (LETT |rn|
                                           (SPADCALL |nlf| |vars|
                                                     (QREFELT $ 177))
                                           . #7#)
                                     (EXIT
                                      (PROGN
                                       (LETT #1#
                                             (VECTOR (QVELT |rn| 0)
                                                     (CONS |kk| (QVELT |rn| 1))
                                                     (CONS (CDR |c|)
                                                           (QVELT |rn| 2)))
                                             . #7#)
                                       (GO #8#)))))))))
                               #9# (EXIT #4#))
                              (LETT |i|
                                    (PROG1 (|inc_SI| |i|)
                                      (LETT #6# (CDR #6#) . #7#))
                                    . #7#)
                              (GO G190) G191 (EXIT NIL))
                         (EXIT (VECTOR |lf| NIL NIL))))))))
          #8# (EXIT #1#)))) 

(SDEFUN |EFSTRUC;rischNormalize;FLR;43|
        ((|f| F) (|vars| |List| (|Symbol|))
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPROG
         ((|rn|
           (|Record| (|:| |funcs| (|List| F))
                     (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F)))))
         (SEQ
          (LETT |rn| (SPADCALL (LIST |f|) |vars| (QREFELT $ 177))
                |EFSTRUC;rischNormalize;FLR;43|)
          (EXIT
           (VECTOR (|SPADfirst| (QVELT |rn| 0)) (QVELT |rn| 1)
                   (QVELT |rn| 2)))))) 

(SDEFUN |EFSTRUC;rischNormalize;FSR;44|
        ((|f| F) (|v| |Symbol|)
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPADCALL |f| (LIST |v|) (QREFELT $ 180))) 

(SDEFUN |EFSTRUC;rootNormalize;FKF;45| ((|f| F) (|k| |Kernel| F) ($ F))
        (SPROG
         ((|u|
           (|Union|
            (|Record| (|:| |funcs| (|List| F))
                      (|:| |kers| (|List| (|Kernel| F)))
                      (|:| |vals| (|List| F)))
            "failed")))
         (SEQ
          (LETT |u|
                (|EFSTRUC;rootKernelNormalize| (LIST |f|)
                 (|EFSTRUC;toR| (SPADCALL |f| (QREFELT $ 182))
                  (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) $)
                 |k| $)
                |EFSTRUC;rootNormalize;FKF;45|)
          (EXIT
           (COND ((QEQCAR |u| 1) |f|)
                 ('T (|SPADfirst| (QVELT (QCDR |u|) 0)))))))) 

(SDEFUN |EFSTRUC;rootKernelNormalize|
        ((|lf| |List| F) (|l| |List| (|Kernel| F)) (|k| |Kernel| F)
         ($ |Union|
          (|Record| (|:| |funcs| (|List| F)) (|:| |kers| (|List| (|Kernel| F)))
                    (|:| |vals| (|List| F)))
          "failed"))
        (SPROG
         ((|c|
           (|Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
                    (|:| |func| F) (|:| |fail| (|Boolean|)))))
         (SEQ
          (LETT |c| (|EFSTRUC;rootDep| |l| |k| $)
                |EFSTRUC;rootKernelNormalize|)
          (EXIT
           (COND
            ((QEQCAR |c| 0)
             (CONS 0
                   (|EFSTRUC;rooteval| |lf| |l| |k|
                    (SPADCALL (CDR |c|) (SPADCALL (CDR |c|) (QREFELT $ 145))
                              (QREFELT $ 146))
                    $)))
            ('T (CONS 1 "failed"))))))) 

(SDEFUN |EFSTRUC;validExponential;LFSU;47|
        ((|twr| |List| (|Kernel| F)) (|eta| F) (|x| |Symbol|)
         ($ |Union| F "failed"))
        (SPROG
         ((#1=#:G854 NIL) (#2=#:G853 (F)) (#3=#:G855 (F)) (#4=#:G866 NIL)
          (|i| NIL) (#5=#:G867 NIL) (|yy| NIL) (|g| (F)) (#6=#:G827 NIL)
          (#7=#:G826 (F)) (#8=#:G828 (F)) (#9=#:G864 NIL) (#10=#:G865 NIL)
          (|v| (|Vector| (|Fraction| (|Integer|))))
          (|c| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (#11=#:G863 NIL) (|fns| (|List| F)) (#12=#:G862 NIL))
         (SEQ
          (LETT |c|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #12# NIL . #13=(|EFSTRUC;validExponential;LFSU;47|))
                   (SEQ (LETT |g| NIL . #13#)
                        (LETT #11# (LETT |fns| (|EFSTRUC;toY| |twr| $) . #13#)
                              . #13#)
                        G190
                        (COND
                         ((OR (ATOM #11#)
                              (PROGN (LETT |g| (CAR #11#) . #13#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #12#
                                (CONS (SPADCALL |g| |x| (QREFELT $ 58)) #12#)
                                . #13#)))
                        (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                        (EXIT (NREVERSE #12#))))
                  (QREFELT $ 184))
                 (SPADCALL |eta| |x| (QREFELT $ 58)) (QREFELT $ 185))
                . #13#)
          (EXIT
           (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
                 (#14='T
                  (SEQ (LETT |v| (QCDR |c|) . #13#)
                       (LETT |g|
                             (SPADCALL |eta|
                                       (PROGN
                                        (LETT #6# NIL . #13#)
                                        (SEQ (LETT |yy| NIL . #13#)
                                             (LETT #10# |fns| . #13#)
                                             (LETT |i|
                                                   (SPADCALL |v|
                                                             (QREFELT $ 145))
                                                   . #13#)
                                             (LETT #9# (QVSIZE |v|) . #13#)
                                             G190
                                             (COND
                                              ((OR (> |i| #9#) (ATOM #10#)
                                                   (PROGN
                                                    (LETT |yy| (CAR #10#)
                                                          . #13#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (PROGN
                                                (LETT #8#
                                                      (SPADCALL
                                                       (QAREF1O |v| |i| 1) |yy|
                                                       (QREFELT $ 155))
                                                      . #13#)
                                                (COND
                                                 (#6#
                                                  (LETT #7#
                                                        (SPADCALL #7# #8#
                                                                  (QREFELT $
                                                                           136))
                                                        . #13#))
                                                 ('T
                                                  (PROGN
                                                   (LETT #7# #8# . #13#)
                                                   (LETT #6# 'T . #13#)))))))
                                             (LETT |i|
                                                   (PROG1 (+ |i| 1)
                                                     (LETT #10# (CDR #10#)
                                                           . #13#))
                                                   . #13#)
                                             (GO G190) G191 (EXIT NIL))
                                        (COND (#6# #7#)
                                              (#14# (|spadConstant| $ 26))))
                                       (QREFELT $ 134))
                             . #13#)
                       (EXIT
                        (CONS 0
                              (SPADCALL
                               (PROGN
                                (LETT #1# NIL . #13#)
                                (SEQ (LETT |yy| NIL . #13#)
                                     (LETT #5# |fns| . #13#)
                                     (LETT |i| (SPADCALL |v| (QREFELT $ 145))
                                           . #13#)
                                     (LETT #4# (QVSIZE |v|) . #13#) G190
                                     (COND
                                      ((OR (> |i| #4#) (ATOM #5#)
                                           (PROGN
                                            (LETT |yy| (CAR #5#) . #13#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #3#
                                              (SPADCALL
                                               (SPADCALL |yy| (QREFELT $ 132))
                                               (QAREF1O |v| |i| 1)
                                               (QREFELT $ 154))
                                              . #13#)
                                        (COND
                                         (#1#
                                          (LETT #2#
                                                (SPADCALL #2# #3#
                                                          (QREFELT $ 109))
                                                . #13#))
                                         ('T
                                          (PROGN
                                           (LETT #2# #3# . #13#)
                                           (LETT #1# 'T . #13#)))))))
                                     (LETT |i|
                                           (PROG1 (+ |i| 1)
                                             (LETT #5# (CDR #5#) . #13#))
                                           . #13#)
                                     (GO G190) G191 (EXIT NIL))
                                (COND (#1# #2#) (#14# (|spadConstant| $ 72))))
                               (SPADCALL |g| (QREFELT $ 132))
                               (QREFELT $ 109))))))))))) 

(SDEFUN |EFSTRUC;irootDep;KU;48|
        ((|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|nv| (F)) (|nk| (F)) (|nr| (F)) (|nf| (F))
          (|pr|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (|n| (|NonNegativeInteger|)) (#1=#:G868 NIL))
         (SEQ
          (LETT |n|
                (PROG1
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |k| (QREFELT $ 32))
                                     (QREFELT $ 149))
                           (QREFELT $ 150))
                          . #2=(|EFSTRUC;irootDep;KU;48|))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#))
                . #2#)
          (LETT |pr|
                (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) |n|
                          (QREFELT $ 190))
                . #2#)
          (COND
           ((SPADCALL (QVELT |pr| 1) (|spadConstant| $ 72) (QREFELT $ 34))
            (COND
             ((NULL (EQL (QVELT |pr| 0) |n|))
              (EXIT
               (COND
                ((EQL (QVELT |pr| 0) 1)
                 (CONS 1
                       (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2)
                                 (QREFELT $ 109))))
                (#3='T
                 (SEQ
                  (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)) . #2#)
                  (LETT |nr| (QVELT |pr| 2) . #2#)
                  (LETT |nk|
                        (SPADCALL (SPADCALL |k| (QREFELT $ 76))
                                  (LIST |nr| |nf|) (QREFELT $ 143))
                        . #2#)
                  (LETT |nv| (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 109))
                        . #2#)
                  (EXIT (CONS 1 |nv|)))))))))
           (#3#
            (EXIT
             (COND
              ((EQL (QVELT |pr| 0) 1)
               (CONS 1
                     (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2) (QREFELT $ 109))))
              (#3#
               (SEQ (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)) . #2#)
                    (LETT |nr| (QVELT |pr| 2) . #2#)
                    (LETT |nk|
                          (SPADCALL (SPADCALL |k| (QREFELT $ 76))
                                    (LIST |nr| |nf|) (QREFELT $ 143))
                          . #2#)
                    (LETT |nv| (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 109))
                          . #2#)
                    (EXIT (CONS 1 |nv|))))))))
          (EXIT (CONS 2 'T))))) 

(SDEFUN |EFSTRUC;irootDep;KU;49|
        ((|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (CONS 2 'T)) 

(SDEFUN |EFSTRUC;rootDep|
        ((|ker| |List| (|Kernel| F)) (|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((#1=#:G904 NIL) (#2=#:G903 #3=(|Integer|)) (#4=#:G905 #3#)
          (#5=#:G908 NIL) (|r| NIL))
         (SEQ
          (COND
           ((NULL
             (LETT |ker|
                   (|EFSTRUC;toR| |ker|
                    (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) $)
                   . #6=(|EFSTRUC;rootDep|)))
            (SPADCALL |k| (QREFELT $ 192)))
           (#7='T
            (CONS 0
                  (MAKEARR1 1
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |k| (QREFELT $ 32))
                                         (QREFELT $ 149))
                               (QREFELT $ 150))
                              (PROGN
                               (LETT #1# NIL . #6#)
                               (SEQ (LETT |r| NIL . #6#) (LETT #5# |ker| . #6#)
                                    G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN
                                           (LETT |r| (CAR #5#) . #6#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #4#
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |r| (QREFELT $ 32))
                                               (QREFELT $ 149))
                                              (QREFELT $ 150))
                                             . #6#)
                                       (COND
                                        (#1#
                                         (LETT #2#
                                               (SPADCALL #2# #4#
                                                         (QREFELT $ 193))
                                               . #6#))
                                        ('T
                                         (PROGN
                                          (LETT #2# #4# . #6#)
                                          (LETT #1# 'T . #6#)))))))
                                    (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#1# #2#) (#7# 1)))
                              (QREFELT $ 193))
                             (QREFELT $ 152))))))))) 

(SDEFUN |EFSTRUC;expeval|
        ((|lf| |List| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#2=#:G935 NIL) (|f| NIL) (#3=#:G934 NIL)
          (|h| (F)) (#4=#:G920 NIL) (#5=#:G919 (F)) (#6=#:G921 (F))
          (#7=#:G932 NIL) (|a| NIL) (#8=#:G933 NIL) (|z| NIL)
          (|l| (|List| #1#)) (#9=#:G931 NIL) (|kk| NIL) (#10=#:G930 NIL)
          (|lv| (|List| (|Fraction| (|Integer|)))) (#11=#:G929 NIL) (|i| NIL)
          (#12=#:G928 NIL) (|v0| (|Integer|))
          (|rec|
           (|Union|
            (|Record| (|:| |index| (|Integer|)) (|:| |ker| (|Kernel| F)))
            "failed"))
          (|g| (F)) (#13=#:G911 NIL) (#14=#:G910 (F)) (#15=#:G912 (F))
          (#16=#:G926 NIL) (#17=#:G927 NIL) (|fns| (|List| F)) (|y| (F)))
         (SEQ
          (LETT |y| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                . #18=(|EFSTRUC;expeval|))
          (LETT |fns| (|EFSTRUC;toY| |lk| $) . #18#)
          (LETT |g|
                (SPADCALL |y|
                          (PROGN
                           (LETT #13# NIL . #18#)
                           (SEQ (LETT |z| NIL . #18#) (LETT #17# |fns| . #18#)
                                (LETT |i| (SPADCALL |v| (QREFELT $ 145))
                                      . #18#)
                                (LETT #16# (QVSIZE |v|) . #18#) G190
                                (COND
                                 ((OR (> |i| #16#) (ATOM #17#)
                                      (PROGN (LETT |z| (CAR #17#) . #18#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #15#
                                         (SPADCALL (QAREF1O |v| |i| 1) |z|
                                                   (QREFELT $ 155))
                                         . #18#)
                                   (COND
                                    (#13#
                                     (LETT #14#
                                           (SPADCALL #14# #15# (QREFELT $ 136))
                                           . #18#))
                                    ('T
                                     (PROGN
                                      (LETT #14# #15# . #18#)
                                      (LETT #13# 'T . #18#)))))))
                                (LETT |i|
                                      (PROG1 (+ |i| 1)
                                        (LETT #17# (CDR #17#) . #18#))
                                      . #18#)
                                (GO G190) G191 (EXIT NIL))
                           (COND (#13# #14#) (#19='T (|spadConstant| $ 26))))
                          (QREFELT $ 134))
                . #18#)
          (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|exp| $) . #18#)
          (EXIT
           (COND
            ((QEQCAR |rec| 1)
             (|EFSTRUC;expnosimp| |lf| |lk| |k| |v| |fns|
              (SPADCALL |g| (QREFELT $ 132)) $))
            (#19#
             (SEQ
              (LETT |v0|
                    (SPADCALL
                     (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1)
                               (QREFELT $ 161))
                     (QREFELT $ 147))
                    . #18#)
              (LETT |lv|
                    (PROGN
                     (LETT #12# NIL . #18#)
                     (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 145)) . #18#)
                          (LETT #11# (QVSIZE |v|) . #18#) G190
                          (COND ((> |i| #11#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |i| (QCAR (QCDR |rec|))
                                        (QREFELT $ 151))
                              (LETT #12# (CONS (QAREF1O |v| |i| 1) #12#)
                                    . #18#)))))
                          (LETT |i| (+ |i| 1) . #18#) (GO G190) G191
                          (EXIT (NREVERSE #12#))))
                    . #18#)
              (LETT |l|
                    (PROGN
                     (LETT #10# NIL . #18#)
                     (SEQ (LETT |kk| NIL . #18#) (LETT #9# |lk| . #18#) G190
                          (COND
                           ((OR (ATOM #9#)
                                (PROGN (LETT |kk| (CAR #9#) . #18#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |kk| (QCDR (QCDR |rec|))
                                        (QREFELT $ 115))
                              (LETT #10# (CONS |kk| #10#) . #18#)))))
                          (LETT #9# (CDR #9#) . #18#) (GO G190) G191
                          (EXIT (NREVERSE #10#))))
                    . #18#)
              (LETT |h|
                    (PROGN
                     (LETT #4# NIL . #18#)
                     (SEQ (LETT |z| NIL . #18#)
                          (LETT #8# (|EFSTRUC;toY| |l| $) . #18#)
                          (LETT |a| NIL . #18#) (LETT #7# |lv| . #18#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |a| (CAR #7#) . #18#) NIL)
                                (ATOM #8#)
                                (PROGN (LETT |z| (CAR #8#) . #18#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #6#
                                   (SPADCALL (SPADCALL |z| (QREFELT $ 132))
                                             (-
                                              (SPADCALL
                                               (SPADCALL |a| |v0|
                                                         (QREFELT $ 163))
                                               (QREFELT $ 147)))
                                             (QREFELT $ 106))
                                   . #18#)
                             (COND
                              (#4#
                               (LETT #5# (SPADCALL #5# #6# (QREFELT $ 109))
                                     . #18#))
                              ('T
                               (PROGN
                                (LETT #5# #6# . #18#)
                                (LETT #4# 'T . #18#)))))))
                          (LETT #7#
                                (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #18#))
                                . #18#)
                          (GO G190) G191 (EXIT NIL))
                     (COND (#4# #5#) (#19# (|spadConstant| $ 72))))
                    . #18#)
              (LETT |h|
                    (SPADCALL
                     (SPADCALL |h|
                               (SPADCALL
                                (SPADCALL (SPADCALL |v0| |g| (QREFELT $ 162))
                                          (QREFELT $ 14))
                                (QREFELT $ 132))
                               (QREFELT $ 109))
                     (SPADCALL (SPADCALL |k| (QREFELT $ 89)) |v0|
                               (QREFELT $ 106))
                     (QREFELT $ 109))
                    . #18#)
              (LETT |nlf|
                    (PROGN
                     (LETT #3# NIL . #18#)
                     (SEQ (LETT |f| NIL . #18#) (LETT #2# |lf| . #18#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |f| (CAR #2#) . #18#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL |f| (LIST (QCDR (QCDR |rec|)))
                                             (LIST |h|) (QREFELT $ 113))
                                   #3#)
                                  . #18#)))
                          (LETT #2# (CDR #2#) . #18#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #18#)
              (EXIT (VECTOR |nlf| (LIST (QCDR (QCDR |rec|))) (LIST |h|)))))))))) 

(SDEFUN |EFSTRUC;normalize;2F;52| ((|f| F) ($ F))
        (|SPADfirst| (SPADCALL (LIST |f|) NIL (QREFELT $ 194)))) 

(SDEFUN |EFSTRUC;normalize;2L;53| ((|lf| |List| F) ($ |List| F))
        (SPADCALL |lf| NIL (QREFELT $ 194))) 

(SDEFUN |EFSTRUC;normalize;FSF;54| ((|f| F) (|x| |Symbol|) ($ F))
        (|SPADfirst| (SPADCALL (LIST |f|) (LIST |x|) (QREFELT $ 194)))) 

(SDEFUN |EFSTRUC;normalize;LLL;55|
        ((|lf| |List| F) (|lx| |List| (|Symbol|)) ($ |List| F))
        (SPROG ((|lf2| (|List| F)) (#1=#:G944 NIL) (|f| NIL) (#2=#:G943 NIL))
               (SEQ
                (LETT |lf2|
                      (PROGN
                       (LETT #2# NIL . #3=(|EFSTRUC;normalize;LLL;55|))
                       (SEQ (LETT |f| NIL . #3#) (LETT #1# |lf| . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (SPADCALL (SPADCALL |f| (QREFELT $ 23))
                                               (QREFELT $ 198))
                                     #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #3#)
                (EXIT (QVELT (SPADCALL |lf2| |lx| (QREFELT $ 177)) 0))))) 

(SDEFUN |EFSTRUC;factdeprel|
        ((|l| |List| (|Kernel| F)) (|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((#1=#:G983 NIL) (#2=#:G985 NIL) (#3=#:G977 NIL) (#4=#:G976 (F))
          (#5=#:G978 (F)) (#6=#:G987 NIL) (|i| NIL)
          (|r| (|Union| (|Integer|) "failed")) (|m| (F)) (#7=#:G986 NIL)
          (|x| NIL) (#8=#:G984 NIL) (|n| (F)))
         (SEQ
          (EXIT
           (SEQ
            (EXIT
             (SEQ
              (SEQ
               (LETT |r|
                     (SPADCALL
                      (LETT |n| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                            . #9=(|EFSTRUC;factdeprel|))
                      (QREFELT $ 53))
                     . #9#)
               (EXIT
                (COND
                 ((QEQCAR |r| 0)
                  (COND
                   ((SPADCALL (QCDR |r|) 0 (QREFELT $ 105))
                    (PROGN
                     (LETT #8#
                           (CONS 1
                                 (SPADCALL
                                  (SPADCALL (QCDR |r|) (QREFELT $ 199))
                                  (QREFELT $ 13)))
                           . #9#)
                     (GO #10=#:G981))))))))
              (SEQ (LETT |x| NIL . #9#) (LETT #7# |l| . #9#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ
                      (LETT |m| (|SPADfirst| (SPADCALL |x| (QREFELT $ 32)))
                            . #9#)
                      (LETT |r|
                            (SPADCALL (SPADCALL |n| |m| (QREFELT $ 134))
                                      (QREFELT $ 53))
                            . #9#)
                      (EXIT
                       (COND
                        ((QEQCAR |r| 0)
                         (PROGN
                          (LETT #1#
                                (COND
                                 ((SPADCALL (QCDR |r|) 0 (QREFELT $ 105))
                                  (PROGN
                                   (LETT #2#
                                         (CONS 1
                                               (SPADCALL
                                                (PROGN
                                                 (LETT #3# NIL . #9#)
                                                 (SEQ (LETT |i| 1 . #9#)
                                                      (LETT #6# (QCDR |r|)
                                                            . #9#)
                                                      G190
                                                      (COND
                                                       ((|greater_SI| |i| #6#)
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #5#
                                                               (SPADCALL |m|
                                                                         (SPADCALL
                                                                          |i|
                                                                          (QREFELT
                                                                           $
                                                                           13))
                                                                         (QREFELT
                                                                          $
                                                                          136))
                                                               . #9#)
                                                         (COND
                                                          (#3#
                                                           (LETT #4#
                                                                 (SPADCALL #4#
                                                                           #5#
                                                                           (QREFELT
                                                                            $
                                                                            109))
                                                                 . #9#))
                                                          ('T
                                                           (PROGN
                                                            (LETT #4# #5#
                                                                  . #9#)
                                                            (LETT #3# 'T
                                                                  . #9#)))))))
                                                      (LETT |i| (|inc_SI| |i|)
                                                            . #9#)
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (COND (#3# #4#)
                                                       ('T
                                                        (|spadConstant| $
                                                                        72))))
                                                (SPADCALL |x| (QREFELT $ 89))
                                                (QREFELT $ 109)))
                                         . #9#)
                                   (GO #11=#:G982)))
                                 ('T (|error| "bad order of factorials")))
                                . #9#)
                          (GO #12=#:G979)))))))
                    #12# (EXIT #1#))
                   (LETT #7# (CDR #7#) . #9#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 2 'T))))
            #10# (EXIT #8#)))
          #11# (EXIT #2#)))) 

(SDEFUN |EFSTRUC;normalize;LLL;57|
        ((|lf| |List| F) (|lx| |List| (|Symbol|)) ($ |List| F))
        (SPROG ((|lf2| (|List| F)) (#1=#:G993 NIL) (|f| NIL) (#2=#:G992 NIL))
               (SEQ
                (LETT |lf2|
                      (PROGN
                       (LETT #2# NIL . #3=(|EFSTRUC;normalize;LLL;57|))
                       (SEQ (LETT |f| NIL . #3#) (LETT #1# |lf| . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |f| (QREFELT $ 23)) #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #3#)
                (EXIT (QVELT (SPADCALL |lf2| |lx| (QREFELT $ 177)) 0))))) 

(DECLAIM (NOTINLINE |ElementaryFunctionStructurePackage;|)) 

(DEFUN |ElementaryFunctionStructurePackage| (&REST #1=#:G994)
  (SPROG NIL
         (PROG (#2=#:G995)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunctionStructurePackage|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryFunctionStructurePackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |ElementaryFunctionStructurePackage;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ElementaryFunctionStructurePackage|)))))))))) 

(DEFUN |ElementaryFunctionStructurePackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|ElementaryFunctionStructurePackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ElementaryFunctionStructurePackage| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 200) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ElementaryFunctionStructurePackage|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|htrig|)
          (QSETREFV $ 9 '|trig|)
          (QSETREFV $ 10 (|HasCategory| |#2| '(|CombinatorialOpsCategory|)))
          (QSETREFV $ 16
                    (SPADCALL (SPADCALL (QREFELT $ 11))
                              (SPADCALL (SPADCALL 2 (QREFELT $ 13))
                                        (QREFELT $ 14))
                              (QREFELT $ 15)))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (QSETREFV $ 51
                      (CONS (|dispatchFunction| |EFSTRUC;tanQ;F2F;11|) $)))
           ('T
            (QSETREFV $ 51
                      (CONS (|dispatchFunction| |EFSTRUC;tanQ;F2F;12|) $))))
          (QSETREFV $ 74 '|%alg|)
          (QSETREFV $ 128
                    (SPADCALL (SPADCALL '|%iint| (QREFELT $ 125))
                              (QREFELT $ 127)))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (QSETREFV $ 192
                       (CONS (|dispatchFunction| |EFSTRUC;irootDep;KU;48|)
                             $))))
           ('T
            (QSETREFV $ 192
                      (CONS (|dispatchFunction| |EFSTRUC;irootDep;KU;49|) $))))
          (COND
           ((|HasCategory| |#2| '(|CombinatorialOpsCategory|))
            (PROGN
             (QSETREFV $ 194
                       (CONS (|dispatchFunction| |EFSTRUC;normalize;LLL;55|)
                             $))))
           ('T
            (QSETREFV $ 194
                      (CONS (|dispatchFunction| |EFSTRUC;normalize;LLL;57|)
                            $))))
          $))) 

(MAKEPROP '|ElementaryFunctionStructurePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'HTRIG
              'TRIG '|comb?| (0 . |pi|) (|Integer|) (4 . |coerce|) (9 . -)
              (14 . /) '|mpiover2| (|Mapping| 7 29) |EFSTRUC;rmap;M2F;26|
              (|Symbol|) |EFSTRUC;realElementary;FSF;2| (|List| 19)
              (20 . |variables|) |EFSTRUC;realElementary;2F;3|
              |EFSTRUC;realLiouvillian;2F;4| |EFSTRUC;realLiouvillian;FSF;5|
              (25 . |Zero|) (|Boolean|) (29 . ~=) (|Kernel| 7) (35 . |is?|)
              (|List| 7) (41 . |argument|) (46 . |first|) (51 . =)
              (57 . |false|) (|Mapping| 27 29) (|List| 29) (61 . |select|)
              (|Fraction| 12) (67 . |denom|) (|SparseUnivariatePolynomial| 7)
              (|PositiveInteger|) (|TangentExpansions| 7) (72 . |tanAn|)
              (|SparseUnivariatePolynomial| $) (78 . |zeroOf|)
              (|AlgebraicManipulations| 6 7) (83 . |rootSimp|) (88 . |numer|)
              (93 . |tanNa|) (99 . |tanQ|) (|Union| 12 '#1="failed")
              (105 . |retractIfCan|) (110 . |tanSum|) (115 . |inv|)
              (120 . |tan|) (125 . |Zero|) (129 . |differentiate|) (|Vector| 7)
              (135 . |setelt!|) (142 . |elt|) (|OutputForm|) (148 . |coerce|)
              (|Void|) (153 . |print|) (|Matrix| 7) (158 . |setelt!|)
              (|Union| 107 '"failed") (|IntegerLinearDependence| 7)
              (166 . |particularSolutionOverQ|) (172 . |One|) (176 . |One|)
              (180 . |One|) 'ALGOP (|BasicOperator|) (184 . |operator|)
              (189 . |has?|) (195 . |elt|) (|Union| 39 '#1#)
              (201 . |retractIfCan|) (|List| 88) (206 . |kernels|) (211 . =)
              (217 . -) (|List| 39) (|MultiplicativeDependence|)
              (222 . |logDependenceQ|) (|Kernel| $) (228 . |coerce|)
              (233 . |log|) (|Union| 96 '"failed") (|Expression| 6)
              (|Numeric| 6) (238 . |numericIfCan|) (|NonNegativeInteger|)
              (|Float|) (244 . |rationalApproximation|) (250 . |Zero|)
              (254 . |coerce|) (259 . /) (265 . |float|) (272 . -)
              (278 . |abs|) (283 . >) (289 . >) (295 . ^) (|Vector| 39)
              (301 . |zero|) (306 . *) (312 . |new|) (316 . |kernel|)
              (|List| $) (321 . |eval|) (328 . |atan|) (333 . ~=)
              (339 . |coerce|) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 29)
              (|PolynomialCategoryLifting| (|IndexedExponents| 29) 29 6 118 7)
              (344 . |map|) (|SparseMultivariatePolynomial| 6 88)
              (351 . |numer|) (356 . |denom|) (|CommonOperators|)
              (361 . |operator|) (|LiouvillianFunction| 6 7) (366 . |operator|)
              '|opint| (371 . |is?|) (377 . |zero?|) (382 . |last|)
              (387 . |exp|) (392 . ^) (398 . -) (404 . |sqrt|) (409 . +)
              (415 . *) (421 . |One|) (425 . |elt|) (431 . |coerce|) (436 . D)
              (442 . |concat|) (448 . |kernel|) (454 . |name|)
              (459 . |minIndex|) (464 . |elt|) (470 . |retract|)
              (475 . |nthRoot|) (481 . |second|) (486 . |retract|) (491 . ~=)
              (497 . |coerce|) (502 . /) (508 . ^) (514 . *)
              (520 . |retractIfCan|) (525 . |height|) (530 . >)
              (|Union| $ '"failed") (536 . |recip|) (541 . |inv|) (546 . *)
              (552 . *) (558 . |every?|)
              (|Record| (|:| |num| (|Vector| 12)) (|:| |den| 12))
              (|InnerCommonDenominator| 12 39 (|Vector| 12) 107)
              (564 . |splitDenominator|) (569 . |lcm|) (574 . *)
              (580 . |coerce|) (585 . |tower|) (590 . |variables|)
              (595 . |setDifference|) (601 . |first|) (607 . |empty?|)
              (|Record| (|:| |funcs| 31) (|:| |kers| 37) (|:| |vals| 31))
              |EFSTRUC;rischNormalize;LLR;42| (612 . |concat|)
              (|Record| (|:| |func| 7) (|:| |kers| 37) (|:| |vals| 31))
              |EFSTRUC;rischNormalize;FLR;43| |EFSTRUC;rischNormalize;FSR;44|
              (618 . |tower|) |EFSTRUC;rootNormalize;FKF;45|
              (623 . |construct|) (628 . |particularSolutionOverQ|)
              (|Union| 7 '"failed") |EFSTRUC;validExponential;LFSU;47|
              (|Record| (|:| |exponent| 95) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 29) 29 6 118 7)
              (634 . |froot|)
              (|Union| (|:| |vec| 107) (|:| |func| 7) (|:| |fail| 27))
              (640 . |irootDep|) (645 . |lcm|) (651 . |normalize|)
              |EFSTRUC;normalize;2F;52| |EFSTRUC;normalize;2L;53|
              |EFSTRUC;normalize;FSF;54| (657 . |factorials|)
              (662 . |factorial|))
           '#(|validExponential| 667 |tanQ| 674 |rootNormalize| 680 |rmap| 686
              |rischNormalize| 692 |realLiouvillian| 710 |realElementary| 721
              |normalize| 732 |irootDep| 754)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 199
                                                 '(0 7 0 11 1 7 0 12 13 1 7 0 0
                                                   14 2 7 0 0 0 15 1 7 21 0 22
                                                   0 7 0 26 2 7 27 0 0 28 2 29
                                                   27 0 19 30 1 29 31 0 32 1 31
                                                   7 0 33 2 7 27 0 0 34 0 27 0
                                                   35 2 37 0 36 0 38 1 39 12 0
                                                   40 2 43 41 7 42 44 1 7 0 45
                                                   46 1 47 7 7 48 1 39 12 0 49
                                                   2 43 7 7 12 50 2 0 7 39 7 51
                                                   1 7 52 0 53 1 43 7 31 54 1 7
                                                   0 0 55 1 7 0 0 56 0 6 0 57 2
                                                   7 0 0 19 58 3 59 7 0 12 7 60
                                                   2 59 7 0 12 61 1 7 62 0 63 1
                                                   62 64 0 65 4 66 7 0 12 12 7
                                                   67 2 69 68 66 59 70 0 6 0 71
                                                   0 7 0 72 0 39 0 73 1 29 75 0
                                                   76 2 75 27 0 19 77 2 31 7 0
                                                   12 78 1 7 79 0 80 1 7 81 0
                                                   82 2 39 27 0 0 83 1 39 0 0
                                                   84 2 86 68 85 39 87 1 7 0 88
                                                   89 1 7 0 0 90 2 93 91 92 42
                                                   94 2 96 39 0 95 97 0 39 0 98
                                                   1 96 0 39 99 2 96 0 0 0 100
                                                   3 96 0 12 12 42 101 2 96 0 0
                                                   0 102 1 96 0 0 103 2 96 27 0
                                                   0 104 2 12 27 0 0 105 2 7 0
                                                   0 12 106 1 107 0 95 108 2 7
                                                   0 0 0 109 0 19 0 110 1 29 0
                                                   19 111 3 7 0 0 81 112 113 1
                                                   7 0 0 114 2 29 27 0 0 115 1
                                                   7 0 6 116 3 119 7 17 117 118
                                                   120 1 7 121 0 122 1 7 121 0
                                                   123 1 124 75 19 125 1 126 75
                                                   75 127 2 75 27 0 19 129 1 7
                                                   27 0 130 1 31 7 0 131 1 7 0
                                                   0 132 2 7 0 0 42 133 2 7 0 0
                                                   0 134 1 7 0 0 135 2 7 0 0 0
                                                   136 2 7 0 42 0 137 0 118 0
                                                   138 2 7 0 75 112 139 1 7 0
                                                   19 140 2 7 0 0 19 141 2 31 0
                                                   0 0 142 2 7 0 75 112 143 1
                                                   75 19 0 144 1 107 12 0 145 2
                                                   107 39 0 12 146 1 39 12 0
                                                   147 2 7 0 0 12 148 1 31 7 0
                                                   149 1 7 12 0 150 2 12 27 0 0
                                                   151 1 39 0 12 152 2 39 0 0 0
                                                   153 2 7 0 0 39 154 2 7 0 39
                                                   0 155 1 39 52 0 156 1 29 95
                                                   0 157 2 95 27 0 0 158 1 39
                                                   159 0 160 1 39 0 0 161 2 7 0
                                                   12 0 162 2 39 0 0 12 163 2
                                                   37 27 36 0 164 1 166 165 107
                                                   167 1 12 0 112 168 2 39 0 12
                                                   0 169 1 6 0 12 170 1 7 81
                                                   112 171 1 7 21 112 172 2 21
                                                   0 0 0 173 2 37 0 0 95 174 1
                                                   107 27 0 175 2 37 0 0 0 178
                                                   1 7 81 0 182 1 59 0 31 184 2
                                                   69 68 59 7 185 2 189 188 7
                                                   95 190 1 0 191 29 192 2 12 0
                                                   0 0 193 2 0 31 31 21 194 1 7
                                                   0 0 198 1 12 0 0 199 3 0 186
                                                   37 7 19 187 2 0 7 39 7 51 2
                                                   0 7 7 29 183 2 0 7 17 7 18 2
                                                   0 179 7 21 180 2 0 179 7 19
                                                   181 2 0 176 31 21 177 2 0 7
                                                   7 19 25 1 0 7 7 24 1 0 7 7
                                                   23 2 0 7 7 19 20 1 0 31 31
                                                   196 1 0 7 7 195 2 0 31 31 21
                                                   194 2 0 7 7 19 197 1 0 191
                                                   29 192)))))
           '|lookupComplete|)) 
