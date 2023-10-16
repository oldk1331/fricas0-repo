
(SDEFUN |EFSTRUC;realElem| ((|f| F) (|l| |List| (|Symbol|)) ($ F))
        (SPROG NIL
               (SPADCALL (CONS #'|EFSTRUC;realElem!0| (VECTOR $ |l|)) |f|
                         (QREFELT $ 18)))) 

(SDEFUN |EFSTRUC;realElem!0| ((|k| NIL) ($$ NIL))
        (PROG (|l| $)
          (LETT |l| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
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
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|EFSTRUC;k_to_liou1| |k| |x| $))))) 

(SDEFUN |EFSTRUC;toY| ((|ker| |List| (|Kernel| F)) ($ |List| F))
        (SPROG ((|func| (F)) (#1=#:G228 NIL) (|k| NIL) (#2=#:G227 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #1# |ker|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |func| (|EFSTRUC;ktoY| |k| $))
                                    (|spadConstant| $ 26) (QREFELT $ 28))
                          (LETT #2# (CONS |func| #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;toZ| ((|ker| |List| (|Kernel| F)) ($ |List| F))
        (SPROG ((|func| (F)) (#1=#:G232 NIL) (|k| NIL) (#2=#:G231 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #1# |ker|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |func| (|EFSTRUC;ktoZ| |k| $))
                                    (|spadConstant| $ 26) (QREFELT $ 28))
                          (LETT #2# (CONS |func| #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;toU| ((|ker| |List| (|Kernel| F)) ($ |List| F))
        (SPROG ((|func| (F)) (#1=#:G236 NIL) (|k| NIL) (#2=#:G235 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #1# |ker|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |func| (|EFSTRUC;ktoU| |k| $))
                                    (|spadConstant| $ 26) (QREFELT $ 28))
                          (LETT #2# (CONS |func| #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;toV| ((|ker| |List| (|Kernel| F)) ($ |List| F))
        (SPROG ((|func| (F)) (#1=#:G240 NIL) (|k| NIL) (#2=#:G239 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #1# |ker|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |func| (|EFSTRUC;ktoV| |k| $))
                                    (|spadConstant| $ 26) (QREFELT $ 28))
                          (LETT #2# (CONS |func| #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;toR|
        ((|ker| |List| (|Kernel| F)) (|x| F) ($ |List| (|Kernel| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|EFSTRUC;toR!0| (VECTOR |x| $)) |ker|
                         (QREFELT $ 37)))) 

(SDEFUN |EFSTRUC;toR!0| ((|s| NIL) ($$ NIL))
        (PROG ($ |x|)
          (LETT $ (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |s| '|nthRoot| (QREFELT $ 30))
              (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 32)) (QREFELT $ 33))
                        |x| (QREFELT $ 34)))
             ('T NIL)))))) 

(SDEFUN |EFSTRUC;tanQ;F2F;11| ((|c| |Fraction| (|Integer|)) (|x| F) ($ F))
        (SPROG ((#1=#:G245 NIL))
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |x|
                            (PROG1 (LETT #1# (SPADCALL |c| (QREFELT $ 39)))
                              (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                                '(|Integer|) #1#))
                            (QREFELT $ 43))
                  (QREFELT $ 45))
                 (QREFELT $ 47))
                (SPADCALL |c| (QREFELT $ 48)) (QREFELT $ 49)))) 

(SDEFUN |EFSTRUC;tanQ;F2F;12| ((|c| |Fraction| (|Integer|)) (|x| F) ($ F))
        (SPROG ((#1=#:G248 NIL))
               (SPADCALL
                (SPADCALL
                 (SPADCALL |x|
                           (PROG1 (LETT #1# (SPADCALL |c| (QREFELT $ 39)))
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 43))
                 (QREFELT $ 45))
                (SPADCALL |c| (QREFELT $ 48)) (QREFELT $ 49)))) 

(SDEFUN |EFSTRUC;tanSum| ((|c| F) (|l| |List| F) ($ F))
        (SPROG ((#1=#:G257 NIL) (|r| (|Union| (|Integer|) "failed")) (|k| (F)))
               (SEQ
                (EXIT
                 (SEQ (LETT |k| (SPADCALL |c| (QREFELT $ 16) (QREFELT $ 15)))
                      (SEQ (LETT |r| (SPADCALL |k| (QREFELT $ 52)))
                           (EXIT
                            (COND
                             ((QEQCAR |r| 0)
                              (COND
                               ((ODDP (QCDR |r|))
                                (PROGN
                                 (LETT #1#
                                       (SPADCALL
                                        (SPADCALL (SPADCALL |l| (QREFELT $ 53))
                                                  (QREFELT $ 54))
                                        (QREFELT $ 14)))
                                 (GO #2=#:G255))))))))
                      (EXIT
                       (SPADCALL (CONS (SPADCALL |c| (QREFELT $ 55)) |l|)
                                 (QREFELT $ 53)))))
                #2# (EXIT #1#)))) 

(SDEFUN |EFSTRUC;findQRelation|
        ((|lv| . #1=(|List| (|Symbol|))) (|lpar| |List| (|Symbol|))
         (|lk| |List| F) (|ker| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|u| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (#2=#:G282 NIL) (|j| NIL) (#3=#:G283 NIL) (|k| NIL) (#4=#:G280 NIL)
          (|i| NIL) (#5=#:G281 NIL) (|var| NIL) (|mat| (|Matrix| F))
          (|isconstant| (|Boolean|)) (#6=#:G278 NIL) (#7=#:G279 NIL)
          (|v| (|Vector| F)) (|lvv| #1#) (|m| (|NonNegativeInteger|))
          (#8=#:G276 NIL) (#9=#:G277 NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |lk|) (CONS 2 'T))
                (#10='T
                 (SEQ (LETT |isconstant| 'T) (LETT |m| (LENGTH |lv|))
                      (LETT |lvv| |lv|) (LETT |n| (LENGTH |lk|))
                      (LETT |v| (MAKEARR1 |m| (|spadConstant| $ 26)))
                      (SEQ (LETT |var| NIL) (LETT #9# |lv|) (LETT |i| 1)
                           (LETT #8# |m|) G190
                           (COND
                            ((OR (|greater_SI| |i| #8#) (ATOM #9#)
                                 (PROGN (LETT |var| (CAR #9#)) NIL))
                             (GO G191)))
                           (SEQ
                            (SPADCALL |v| |i|
                                      (SPADCALL |ker| |var| (QREFELT $ 57))
                                      (QREFELT $ 59))
                            (EXIT
                             (COND
                              (|isconstant|
                               (LETT |isconstant|
                                     (SPADCALL
                                      (SPADCALL |v| |i| (QREFELT $ 60))
                                      (|spadConstant| $ 26)
                                      (QREFELT $ 34)))))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|) (LETT #9# (CDR #9#))))
                           (GO G190) G191 (EXIT NIL))
                      (COND
                       (|isconstant|
                        (SEQ (LETT |m| (LENGTH |lpar|)) (LETT |lvv| |lpar|)
                             (LETT |v| (MAKEARR1 |m| (|spadConstant| $ 26)))
                             (EXIT
                              (SEQ (LETT |var| NIL) (LETT #7# |lpar|)
                                   (LETT |i| 1) (LETT #6# |m|) G190
                                   (COND
                                    ((OR (|greater_SI| |i| #6#) (ATOM #7#)
                                         (PROGN (LETT |var| (CAR #7#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |v| |i|
                                              (SPADCALL |ker| |var|
                                                        (QREFELT $ 57))
                                              (QREFELT $ 59))
                                    (EXIT
                                     (COND
                                      (|isconstant|
                                       (LETT |isconstant|
                                             (SPADCALL
                                              (SPADCALL |v| |i| (QREFELT $ 60))
                                              (|spadConstant| $ 26)
                                              (QREFELT $ 34)))))))
                                   (LETT |i|
                                         (PROG1 (|inc_SI| |i|)
                                           (LETT #7# (CDR #7#))))
                                   (GO G190) G191 (EXIT NIL))))))
                      (EXIT
                       (COND
                        (|isconstant|
                         (SEQ
                          (SPADCALL (SPADCALL |ker| (QREFELT $ 62))
                                    (QREFELT $ 64))
                          (EXIT (|error| "Hidden constant detected"))))
                        (#10#
                         (SEQ
                          (LETT |mat|
                                (MAKE_MATRIX1 |m| |n| (|spadConstant| $ 26)))
                          (SEQ (LETT |var| NIL) (LETT #5# |lvv|) (LETT |i| 1)
                               (LETT #4# |m|) G190
                               (COND
                                ((OR (|greater_SI| |i| #4#) (ATOM #5#)
                                     (PROGN (LETT |var| (CAR #5#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |k| NIL) (LETT #3# |lk|)
                                      (LETT |j| 1) (LETT #2# |n|) G190
                                      (COND
                                       ((OR (|greater_SI| |j| #2#) (ATOM #3#)
                                            (PROGN (LETT |k| (CAR #3#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |mat| |i| |j|
                                                  (SPADCALL |k| |var|
                                                            (QREFELT $ 57))
                                                  (QREFELT $ 66))))
                                      (LETT |j|
                                            (PROG1 (|inc_SI| |j|)
                                              (LETT #3# (CDR #3#))))
                                      (GO G190) G191 (EXIT NIL))))
                               (LETT |i|
                                     (PROG1 (|inc_SI| |i|)
                                       (LETT #5# (CDR #5#))))
                               (GO G190) G191 (EXIT NIL))
                          (LETT |u| (SPADCALL |mat| |v| (QREFELT $ 69)))
                          (EXIT
                           (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                                 (#10# (CONS 2 'T)))))))))))))) 

(SDEFUN |EFSTRUC;findLinearRelation1|
        ((|lk| |List| F) (|ker| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|u| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (#1=#:G292 NIL) (|j| NIL) (#2=#:G293 NIL) (|k| NIL)
          (|v| (|Vector| F)) (|mat| (|Matrix| F)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |lk|) (CONS 2 'T))
                (#3='T
                 (SEQ (LETT |n| (LENGTH |lk|))
                      (LETT |mat| (MAKE_MATRIX1 1 |n| (|spadConstant| $ 26)))
                      (LETT |v| (MAKEARR1 1 |ker|))
                      (SEQ (LETT |k| NIL) (LETT #2# |lk|) (LETT |j| 1)
                           (LETT #1# |n|) G190
                           (COND
                            ((OR (|greater_SI| |j| #1#) (ATOM #2#)
                                 (PROGN (LETT |k| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL (SPADCALL |k| (QREFELT $ 22)))
                               (SPADCALL |mat| 1 |j| |k| (QREFELT $ 66)))
                              ('T
                               (SPADCALL |mat| 1 |j| (|spadConstant| $ 26)
                                         (QREFELT $ 66))))))
                           (LETT |j|
                                 (PROG1 (|inc_SI| |j|) (LETT #2# (CDR #2#))))
                           (GO G190) G191 (EXIT NIL))
                      (LETT |u| (SPADCALL |mat| |v| (QREFELT $ 69)))
                      (EXIT
                       (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                             (#3# (CONS 2 'T)))))))))) 

(SDEFUN |EFSTRUC;transkers| ((|x| |List| (|Kernel| F)) ($ |List| (|Kernel| F)))
        (SPROG ((#1=#:G298 NIL) (|k| NIL) (#2=#:G297 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #1# |x|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL
                           (SPADCALL (SPADCALL |k| (QREFELT $ 74))
                                     (QREFELT $ 72) (QREFELT $ 75)))
                          (LETT #2# (CONS |k| #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
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
                                      (QREFELT $ 76)))
                      (LETT |qu| (SPADCALL |z| (QREFELT $ 78)))
                      (EXIT
                       (COND ((QEQCAR |qu| 0) (QCDR |qu|))
                             ('T (|spadConstant| $ 79))))))))))
                (EXIT (|spadConstant| $ 79))))) 

(SDEFUN |EFSTRUC;toQ|
        ((|lk| |List| (|Kernel| F)) ($ |List| (|Fraction| (|Integer|))))
        (SPROG ((#1=#:G310 NIL) (|k| NIL) (#2=#:G309 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #1# |lk|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND ((SPADCALL |k| '|log| (QREFELT $ 30)) 'T)
                                ('T (SPADCALL |k| '|exp| (QREFELT $ 30))))
                          (LETT #2# (CONS (|EFSTRUC;ktoQ| |k| $) #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;findLinearRelation2|
        ((|lk| |List| (|Kernel| F)) (|lz| |List| F) (|ker| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|nz| (F)) (|ly| (|List| F)) (#1=#:G352 NIL) (|x| NIL)
          (#2=#:G351 NIL) (#3=#:G350 NIL) (#4=#:G349 NIL)
          (|lpars1f| (|List| F)) (#5=#:G348 NIL) (|s| NIL) (#6=#:G347 NIL)
          (|lpars1| (|List| (|Symbol|))) (#7=#:G346 NIL) (|k| NIL)
          (#8=#:G345 NIL) (|lpars0| #9=(|List| (|Kernel| F))) (#10=#:G342 NIL)
          (|vv| (|Vector| (|Fraction| (|Integer|)))) (|lz1tonq| (F))
          (|kertond| (F)) (|nd| (|Integer|)) (|nq| (|Integer|))
          (|qratio| (|Fraction| (|Integer|)))
          (|fratio| (|Union| (|Float|) "failed")) (|Fratio| (F))
          (#11=#:G343 NIL) (|z1| NIL) (#12=#:G344 NIL) (|i| NIL)
          (|m| (|NonNegativeInteger|)) (|kerF| (F))
          (|u| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|q| (|Fraction| (|Integer|))) (|zkers| #9#) (|z| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |z|
                  (SPADCALL (SPADCALL |ker| (QREFELT $ 32)) 1 (QREFELT $ 76)))
            (LETT |zkers|
                  (|EFSTRUC;transkers| (SPADCALL |z| (QREFELT $ 81)) $))
            (EXIT
             (COND
              ((NULL |zkers|)
               (SEQ (LETT |q| (|EFSTRUC;ktoQ| |ker| $))
                    (COND
                     ((NULL
                       (SPADCALL |q| (|spadConstant| $ 79) (QREFELT $ 82)))
                      (COND
                       ((NULL
                         (SPADCALL |q|
                                   (SPADCALL (|spadConstant| $ 79)
                                             (QREFELT $ 83))
                                   (QREFELT $ 82)))
                        (EXIT
                         (SEQ
                          (LETT |u|
                                (SPADCALL (|EFSTRUC;toQ| |lk| $) |q|
                                          (QREFELT $ 86)))
                          (EXIT
                           (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                                 (#13='T (CONS 2 'T))))))))))
                    (LETT |kerF| (SPADCALL |ker| (QREFELT $ 88)))
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
                             (SEQ (LETT |m| (LENGTH |lz|))
                                  (SEQ (LETT |i| 1) (LETT #12# |m|)
                                       (LETT |z1| NIL) (LETT #11# |lz|) G190
                                       (COND
                                        ((OR (ATOM #11#)
                                             (PROGN (LETT |z1| (CAR #11#)) NIL)
                                             (|greater_SI| |i| #12#))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |Fratio|
                                              (SPADCALL |kerF|
                                                        (SPADCALL |z1|
                                                                  (QREFELT $
                                                                           89))
                                                        (QREFELT $ 15)))
                                        (LETT |fratio|
                                              (SPADCALL |Fratio| 20
                                                        (QREFELT $ 93)))
                                        (EXIT
                                         (COND
                                          ((QEQCAR |fratio| 0)
                                           (SEQ
                                            (LETT |qratio|
                                                  (SPADCALL (QCDR |fratio|) 8
                                                            (QREFELT $ 96)))
                                            (COND
                                             ((OR
                                               (SPADCALL |qratio|
                                                         (|spadConstant| $ 97)
                                                         (QREFELT $ 82))
                                               (OR
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QCDR |fratio|)
                                                             (SPADCALL |qratio|
                                                                       (QREFELT
                                                                        $ 98))
                                                             (QREFELT $ 99))
                                                   (SPADCALL 1 0 10
                                                             (QREFELT $ 100))
                                                   (QREFELT $ 101))
                                                  (QREFELT $ 102))
                                                 (SPADCALL 1 -16 10
                                                           (QREFELT $ 100))
                                                 (QREFELT $ 103))
                                                (OR
                                                 (SPADCALL
                                                  (ABS
                                                   (LETT |nq|
                                                         (SPADCALL |qratio|
                                                                   (QREFELT $
                                                                            48))))
                                                  100 (QREFELT $ 104))
                                                 (SPADCALL
                                                  (ABS
                                                   (LETT |nd|
                                                         (SPADCALL |qratio|
                                                                   (QREFELT $
                                                                            39))))
                                                  100 (QREFELT $ 104)))))
                                              (EXIT "iterate")))
                                            (LETT |kertond|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |ker|
                                                              (QREFELT $ 32))
                                                    1 (QREFELT $ 76))
                                                   |nd| (QREFELT $ 105)))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |nq| 0
                                                         (QREFELT $ 104))
                                               (SEQ
                                                (LETT |lz1tonq|
                                                      (SPADCALL |z1| |nq|
                                                                (QREFELT $
                                                                         105)))
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL |kertond|
                                                             |lz1tonq|
                                                             (QREFELT $ 34))
                                                   (SEQ
                                                    (LETT |vv|
                                                          (SPADCALL |m|
                                                                    (QREFELT $
                                                                             107)))
                                                    (QSETAREF1O |vv| |i|
                                                                |qratio| 1)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #10# (CONS 0 |vv|))
                                                      (GO #14=#:G341)))))))))
                                              ('T
                                               (SEQ
                                                (LETT |lz1tonq|
                                                      (SPADCALL |z1| (- |nq|)
                                                                (QREFELT $
                                                                         105)))
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL
                                                    (SPADCALL |kertond|
                                                              |lz1tonq|
                                                              (QREFELT $ 108))
                                                    (|spadConstant| $ 71)
                                                    (QREFELT $ 34))
                                                   (SEQ
                                                    (LETT |vv|
                                                          (SPADCALL |m|
                                                                    (QREFELT $
                                                                             107)))
                                                    (QSETAREF1O |vv| |i|
                                                                |qratio| 1)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #10# (CONS 0 |vv|))
                                                      (GO #14#))))))))))))))))
                                       (LETT #11#
                                             (PROG1 (CDR #11#)
                                               (LETT |i| (|inc_SI| |i|))))
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT (CONS 2 'T))))))))))))
                    (EXIT (CONS 2 'T))))
              (#13#
               (SEQ (LETT |lpars0| (|EFSTRUC;transkers| |lk| $))
                    (LETT |lpars1|
                          (PROGN
                           (LETT #8# NIL)
                           (SEQ (LETT |k| NIL) (LETT #7# |lpars0|) G190
                                (COND
                                 ((OR (ATOM #7#)
                                      (PROGN (LETT |k| (CAR #7#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #8#
                                        (CONS (SPADCALL (QREFELT $ 109))
                                              #8#))))
                                (LETT #7# (CDR #7#)) (GO G190) G191
                                (EXIT (NREVERSE #8#)))))
                    (LETT |lpars1f|
                          (PROGN
                           (LETT #6# NIL)
                           (SEQ (LETT |s| NIL) (LETT #5# |lpars1|) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |s| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |s| (QREFELT $ 110))
                                          (QREFELT $ 88))
                                         #6#))))
                                (LETT #5# (CDR #5#)) (GO G190) G191
                                (EXIT (NREVERSE #6#)))))
                    (COND
                     ((SPADCALL |ker| '|log| (QREFELT $ 30))
                      (SEQ
                       (LETT |ly|
                             (PROGN
                              (LETT #4# NIL)
                              (SEQ (LETT |x| NIL) (LETT #3# |lz|) G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN (LETT |x| (CAR #3#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |x| |lpars0| |lpars1f|
                                                       (QREFELT $ 112))
                                             (QREFELT $ 89))
                                            #4#))))
                                   (LETT #3# (CDR #3#)) (GO G190) G191
                                   (EXIT (NREVERSE #4#)))))
                       (EXIT
                        (LETT |nz|
                              (SPADCALL
                               (SPADCALL |z| |lpars0| |lpars1f|
                                         (QREFELT $ 112))
                               (QREFELT $ 89))))))
                     ((NULL (SPADCALL |ker| '|atan| (QREFELT $ 30)))
                      (|error|
                       "findLinearRelation2: kernel should be log or atan"))
                     ('T
                      (SEQ
                       (LETT |ly|
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |x| NIL) (LETT #1# |lz|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |x| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |x| |lpars0| |lpars1f|
                                                       (QREFELT $ 112))
                                             (QREFELT $ 113))
                                            #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#)))))
                       (EXIT
                        (LETT |nz|
                              (SPADCALL
                               (SPADCALL |z| |lpars0| |lpars1f|
                                         (QREFELT $ 112))
                               (QREFELT $ 113)))))))
                    (EXIT
                     (|EFSTRUC;findQRelation| NIL |lpars1| |ly| |nz| $))))))))
          #14# (EXIT #10#)))) 

(SDEFUN |EFSTRUC;findRelation|
        ((|lv| |List| (|Symbol|)) (|lpar| |List| (|Symbol|))
         (|lk| |List| (|Kernel| F)) (|ker| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG ((#1=#:G372 NIL) (|x| NIL) (#2=#:G371 NIL))
               (SEQ
                (COND
                 ((OR (SPADCALL |ker| '|log| (QREFELT $ 30))
                      (SPADCALL |ker| '|exp| (QREFELT $ 30)))
                  (COND
                   ((NULL
                     (SPADCALL (SPADCALL |ker| (QREFELT $ 88)) (QREFELT $ 22)))
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
                     (SPADCALL (SPADCALL |ker| (QREFELT $ 88)) (QREFELT $ 22)))
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
                            (LETT #2# NIL)
                            (SEQ (LETT |x| NIL) (LETT #1# |lk|) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |x| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((COND
                                      ((SPADCALL |x| '|factorial|
                                                 (QREFELT $ 30))
                                       (SPADCALL |x| |ker| (QREFELT $ 114)))
                                      (#3# NIL))
                                     (LETT #2# (CONS |x| #2#))))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           |ker| $))))))
                     (EXIT (CONS 2 'T)))))))))) 

(SDEFUN |EFSTRUC;ktoY| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|log| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 88)))
         ((SPADCALL |k| '|exp| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ((SPADCALL |k| '|lambertW| (QREFELT $ 30))
          (SPADCALL |k| (QREFELT $ 88)))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;ktoZ| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|log| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ((SPADCALL |k| '|exp| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 88)))
         ((SPADCALL |k| '|lambertW| (QREFELT $ 30))
          (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                    (SPADCALL |k| (QREFELT $ 88)) (QREFELT $ 15)))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;ktoU| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|atan| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 88)))
         ((SPADCALL |k| '|tan| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;ktoV| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|tan| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 88)))
         ((SPADCALL |k| '|atan| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;smp_map|
        ((|f| |Mapping| F (|Kernel| F))
         (|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPADCALL |f| (ELT $ 115) |p| (QREFELT $ 119))) 

(SDEFUN |EFSTRUC;rmap;M2F;26| ((|f| |Mapping| F (|Kernel| F)) (|e| F) ($ F))
        (SPADCALL (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 121)) $)
                  (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 122)) $)
                  (QREFELT $ 15))) 

(SDEFUN |EFSTRUC;k2Elem0|
        ((|k| |Kernel| F) (|op| |BasicOperator|) (|args| |List| F) ($ F))
        (SPROG ((|tz2| (F)) (|iez| (F)) (|ez| (F)) (|z| (F)))
               (SEQ (LETT |z| (|SPADfirst| |args|))
                    (EXIT
                     (COND
                      ((SPADCALL |op| '|%power| (QREFELT $ 128))
                       (COND
                        ((SPADCALL |z| (QREFELT $ 129)) (|spadConstant| $ 26))
                        (#1='T
                         (SPADCALL
                          (SPADCALL (SPADCALL |args| (QREFELT $ 130))
                                    (SPADCALL |z| (QREFELT $ 89))
                                    (QREFELT $ 108))
                          (QREFELT $ 131)))))
                      ((SPADCALL |op| '|cot| (QREFELT $ 128))
                       (SPADCALL (SPADCALL |z| (QREFELT $ 55)) (QREFELT $ 54)))
                      ((SPADCALL |op| '|acot| (QREFELT $ 128))
                       (SPADCALL (SPADCALL |z| (QREFELT $ 54))
                                 (QREFELT $ 113)))
                      ((SPADCALL |op| '|asin| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL |z|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 71)
                                             (SPADCALL |z| 2 (QREFELT $ 132))
                                             (QREFELT $ 133))
                                   (QREFELT $ 134))
                                  (QREFELT $ 15))
                        (QREFELT $ 113)))
                      ((SPADCALL |op| '|acos| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 71)
                                    (SPADCALL |z| 2 (QREFELT $ 132))
                                    (QREFELT $ 133))
                          (QREFELT $ 134))
                         |z| (QREFELT $ 15))
                        (QREFELT $ 113)))
                      ((SPADCALL |op| '|asec| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |z| 2 (QREFELT $ 132))
                                   (|spadConstant| $ 71) (QREFELT $ 133))
                         (QREFELT $ 134))
                        (QREFELT $ 113)))
                      ((SPADCALL |op| '|acsc| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| 2 (QREFELT $ 132))
                                    (|spadConstant| $ 71) (QREFELT $ 133))
                          (QREFELT $ 134))
                         (QREFELT $ 54))
                        (QREFELT $ 113)))
                      ((SPADCALL |op| '|asinh| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 71)
                                    (SPADCALL |z| 2 (QREFELT $ 132))
                                    (QREFELT $ 135))
                          (QREFELT $ 134))
                         |z| (QREFELT $ 135))
                        (QREFELT $ 89)))
                      ((SPADCALL |op| '|acosh| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| 2 (QREFELT $ 132))
                                    (|spadConstant| $ 71) (QREFELT $ 133))
                          (QREFELT $ 134))
                         |z| (QREFELT $ 135))
                        (QREFELT $ 89)))
                      ((SPADCALL |op| '|atanh| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |z| (|spadConstant| $ 71) (QREFELT $ 135))
                          (SPADCALL (|spadConstant| $ 71) |z| (QREFELT $ 133))
                          (QREFELT $ 15))
                         (QREFELT $ 89))
                        (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                      ((SPADCALL |op| '|acoth| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |z| (|spadConstant| $ 71) (QREFELT $ 135))
                          (SPADCALL |z| (|spadConstant| $ 71) (QREFELT $ 133))
                          (QREFELT $ 15))
                         (QREFELT $ 89))
                        (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                      ((SPADCALL |op| '|asech| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL (SPADCALL |z| (QREFELT $ 54))
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |z| 2 (QREFELT $ 132))
                                              (QREFELT $ 54))
                                    (|spadConstant| $ 71) (QREFELT $ 133))
                                   (QREFELT $ 134))
                                  (QREFELT $ 135))
                        (QREFELT $ 89)))
                      ((SPADCALL |op| '|acsch| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL (SPADCALL |z| (QREFELT $ 54))
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 71)
                                             (SPADCALL
                                              (SPADCALL |z| 2 (QREFELT $ 132))
                                              (QREFELT $ 54))
                                             (QREFELT $ 135))
                                   (QREFELT $ 134))
                                  (QREFELT $ 135))
                        (QREFELT $ 89)))
                      ((OR (SPADCALL |op| '|%paren| (QREFELT $ 128))
                           (SPADCALL |op| '|%box| (QREFELT $ 128)))
                       (COND ((NULL (CDR |args|)) |z|)
                             (#1# (SPADCALL |k| (QREFELT $ 88)))))
                      ('T
                       (SEQ
                        (COND
                         ((SPADCALL |op| (QREFELT $ 8) (QREFELT $ 75))
                          (LETT |iez|
                                (SPADCALL
                                 (LETT |ez| (SPADCALL |z| (QREFELT $ 131)))
                                 (QREFELT $ 54)))))
                        (EXIT
                         (COND
                          ((SPADCALL |op| '|sinh| (QREFELT $ 128))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 133))
                                     (SPADCALL 2 (QREFELT $ 13))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|cosh| (QREFELT $ 128))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 135))
                                     (SPADCALL 2 (QREFELT $ 13))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|tanh| (QREFELT $ 128))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 133))
                                     (SPADCALL |ez| |iez| (QREFELT $ 135))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|coth| (QREFELT $ 128))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 135))
                                     (SPADCALL |ez| |iez| (QREFELT $ 133))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|sech| (QREFELT $ 128))
                           (SPADCALL 2
                                     (SPADCALL
                                      (SPADCALL |ez| |iez| (QREFELT $ 135))
                                      (QREFELT $ 54))
                                     (QREFELT $ 136)))
                          ((SPADCALL |op| '|csch| (QREFELT $ 128))
                           (SPADCALL 2
                                     (SPADCALL
                                      (SPADCALL |ez| |iez| (QREFELT $ 133))
                                      (QREFELT $ 54))
                                     (QREFELT $ 136)))
                          (#1#
                           (SEQ
                            (COND
                             ((SPADCALL |op| (QREFELT $ 9) (QREFELT $ 75))
                              (LETT |tz2|
                                    (SPADCALL
                                     (SPADCALL |z| (SPADCALL 2 (QREFELT $ 13))
                                               (QREFELT $ 15))
                                     (QREFELT $ 55)))))
                            (EXIT
                             (COND
                              ((SPADCALL |op| '|sin| (QREFELT $ 128))
                               (SPADCALL (SPADCALL 2 |tz2| (QREFELT $ 136))
                                         (SPADCALL (|spadConstant| $ 71)
                                                   (SPADCALL |tz2| 2
                                                             (QREFELT $ 132))
                                                   (QREFELT $ 135))
                                         (QREFELT $ 15)))
                              ((SPADCALL |op| '|cos| (QREFELT $ 128))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 71)
                                          (SPADCALL |tz2| 2 (QREFELT $ 132))
                                          (QREFELT $ 133))
                                (SPADCALL (|spadConstant| $ 71)
                                          (SPADCALL |tz2| 2 (QREFELT $ 132))
                                          (QREFELT $ 135))
                                (QREFELT $ 15)))
                              ((SPADCALL |op| '|sec| (QREFELT $ 128))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 71)
                                          (SPADCALL |tz2| 2 (QREFELT $ 132))
                                          (QREFELT $ 135))
                                (SPADCALL (|spadConstant| $ 71)
                                          (SPADCALL |tz2| 2 (QREFELT $ 132))
                                          (QREFELT $ 133))
                                (QREFELT $ 15)))
                              ((SPADCALL |op| '|csc| (QREFELT $ 128))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 71)
                                          (SPADCALL |tz2| 2 (QREFELT $ 132))
                                          (QREFELT $ 135))
                                (SPADCALL 2 |tz2| (QREFELT $ 136))
                                (QREFELT $ 15)))
                              (#1#
                               (SPADCALL |op| |args|
                                         (QREFELT $ 138)))))))))))))))) 

(SDEFUN |EFSTRUC;do_int| ((|op| |BasicOperator|) (|args| |List| F) ($ F))
        (SPROG
         ((|dvs| (|List| F)) (#1=#:G433 NIL) (|v| NIL) (#2=#:G432 NIL)
          (|vfs| (|List| F)) (#3=#:G431 NIL) (#4=#:G430 NIL)
          (|vars| (|List| (|Symbol|))) (|kf1| (F)))
         (SEQ (LETT |kf1| (SPADCALL |op| |args| (QREFELT $ 138)))
              (LETT |vars| (SPADCALL |kf1| (QREFELT $ 22)))
              (LETT |vfs|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |v| NIL) (LETT #3# |vars|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS (SPADCALL |v| (QREFELT $ 139)) #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (LETT |dvs|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |v| NIL) (LETT #1# |vars|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL |kf1| |v| (QREFELT $ 140))
                                    (QREFELT $ 24))
                                   #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT
               (SPADCALL (QREFELT $ 127) (SPADCALL |vfs| |dvs| (QREFELT $ 141))
                         (QREFELT $ 142)))))) 

(SDEFUN |EFSTRUC;k_to_liou| ((|k| |Kernel| F) ($ F))
        (SPROG
         ((#1=#:G448 NIL) (#2=#:G447 NIL) (|i| (|Integer|))
          (|iu| (|Union| (|Integer|) "failed")) (|nm| (|Symbol|))
          (|args| (|List| F)) (#3=#:G450 NIL) (|a| NIL) (#4=#:G449 NIL)
          (|op| (|BasicOperator|)))
         (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 74)))
              (LETT |args|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |a| NIL)
                          (LETT #3# (SPADCALL |k| (QREFELT $ 32))) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS (SPADCALL |a| (QREFELT $ 24)) #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (EXIT
               (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 88)))
                     ('T
                      (SEQ
                       (EXIT
                        (SEQ
                         (COND
                          ((SPADCALL |op| '|prim| (QREFELT $ 75))
                           (COND
                            ((NULL (SPADCALL |op| '|%iint| (QREFELT $ 128)))
                             (EXIT (|EFSTRUC;do_int| |op| |args| $))))))
                         (LETT |nm| (SPADCALL |op| (QREFELT $ 143)))
                         (COND
                          ((EQUAL |nm| '|polylog|)
                           (SEQ
                            (LETT |iu|
                                  (SPADCALL (|SPADfirst| |args|)
                                            (QREFELT $ 52)))
                            (EXIT
                             (COND
                              ((QEQCAR |iu| 0)
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (EXIT
                                        (SEQ
                                         (SEQ (LETT |i| (QCDR |iu|))
                                              (EXIT
                                               (COND
                                                ((SPADCALL |i| 0
                                                           (QREFELT $ 104))
                                                 (COND
                                                  ((< |i| 10)
                                                   (PROGN
                                                    (LETT #2#
                                                          (|EFSTRUC;do_int|
                                                           |op| |args| $))
                                                    (GO #5=#:G441))))))))
                                         (EXIT
                                          (|EFSTRUC;k2Elem0| |k| |op| |args|
                                           $))))
                                       #5# (EXIT #2#)))
                                (GO #6=#:G444))))))))
                         (EXIT (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                       #6# (EXIT #1#)))))))) 

(SDEFUN |EFSTRUC;do_int1|
        ((|op| |BasicOperator|) (|args| |List| F) (|x| . #1=(|Symbol|)) ($ F))
        (SPROG
         ((|dvs| (|List| F)) (#2=#:G458 NIL) (|v| NIL) (#3=#:G457 NIL)
          (|vfs| (|List| F)) (#4=#:G456 NIL) (#5=#:G455 NIL)
          (|vars| (|List| #1#)) (|kf1| (F)))
         (SEQ (LETT |kf1| (SPADCALL |op| |args| (QREFELT $ 138)))
              (LETT |vars| (LIST |x|))
              (LETT |vfs|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |v| NIL) (LETT #4# |vars|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |v| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS (SPADCALL |v| (QREFELT $ 139)) #5#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT |dvs|
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |v| NIL) (LETT #2# |vars|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL |kf1| |v| (QREFELT $ 140)) |x|
                                    (QREFELT $ 25))
                                   #3#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))
              (EXIT
               (SPADCALL (QREFELT $ 127) (SPADCALL |vfs| |dvs| (QREFELT $ 141))
                         (QREFELT $ 142)))))) 

(SDEFUN |EFSTRUC;k_to_liou1| ((|k| |Kernel| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((#1=#:G482 NIL) (#2=#:G481 NIL) (|i| (|Integer|))
          (|iu| (|Union| (|Integer|) "failed")) (|nm| (|Symbol|))
          (|args| (|List| F)) (#3=#:G484 NIL) (|a| NIL) (#4=#:G483 NIL)
          (|op| (|BasicOperator|)))
         (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 74)))
              (LETT |args|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |a| NIL)
                          (LETT #3# (SPADCALL |k| (QREFELT $ 32))) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS (SPADCALL |a| |x| (QREFELT $ 25))
                                        #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (EXIT
               (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 88)))
                     ('T
                      (SEQ
                       (EXIT
                        (SEQ
                         (COND
                          ((SPADCALL |op| '|prim| (QREFELT $ 75))
                           (COND
                            ((NULL (SPADCALL |op| '|%iint| (QREFELT $ 128)))
                             (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                         (LETT |nm| (SPADCALL |op| (QREFELT $ 143)))
                         (COND
                          ((EQUAL |nm| '|Gamma2|)
                           (COND
                            ((SPADCALL
                              (SPADCALL (|SPADfirst| |args|) |x|
                                        (QREFELT $ 140))
                              (|spadConstant| $ 26) (QREFELT $ 34))
                             (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                         (COND
                          ((EQUAL |nm| '|polylog|)
                           (SEQ
                            (LETT |iu|
                                  (SPADCALL (|SPADfirst| |args|)
                                            (QREFELT $ 52)))
                            (EXIT
                             (COND
                              ((QEQCAR |iu| 0)
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (EXIT
                                        (SEQ
                                         (SEQ (LETT |i| (QCDR |iu|))
                                              (EXIT
                                               (COND
                                                ((SPADCALL |i| 0
                                                           (QREFELT $ 104))
                                                 (COND
                                                  ((< |i| 10)
                                                   (PROGN
                                                    (LETT #2#
                                                          (|EFSTRUC;do_int|
                                                           |op| |args| $))
                                                    (GO #5=#:G468))))))))
                                         (EXIT
                                          (|EFSTRUC;k2Elem0| |k| |op| |args|
                                           $))))
                                       #5# (EXIT #2#)))
                                (GO #6=#:G478))))))))
                         (COND
                          ((OR (EQUAL |nm| '|ellipticE2|)
                               (EQUAL |nm| '|ellipticF|))
                           (COND
                            ((SPADCALL
                              (SPADCALL (SPADCALL |args| 2 (QREFELT $ 76)) |x|
                                        (QREFELT $ 140))
                              (|spadConstant| $ 26) (QREFELT $ 34))
                             (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                         (COND
                          ((EQUAL |nm| '|ellipticPi|)
                           (COND
                            ((SPADCALL
                              (SPADCALL (SPADCALL |args| 2 (QREFELT $ 76)) |x|
                                        (QREFELT $ 140))
                              (|spadConstant| $ 26) (QREFELT $ 34))
                             (COND
                              ((SPADCALL
                                (SPADCALL (SPADCALL |args| 3 (QREFELT $ 76))
                                          |x| (QREFELT $ 140))
                                (|spadConstant| $ 26) (QREFELT $ 34))
                               (EXIT
                                (|EFSTRUC;do_int1| |op| |args| |x| $))))))))
                         (EXIT (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                       #6# (EXIT #1#)))))))) 

(SDEFUN |EFSTRUC;k2Elem| ((|k| |Kernel| F) (|l| |List| (|Symbol|)) ($ F))
        (SPROG
         ((|args| (|List| F)) (#1=#:G489 NIL) (|a| NIL) (#2=#:G488 NIL)
          (|op| (|BasicOperator|)))
         (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 74)))
              (LETT |args|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |a| NIL)
                          (LETT #1# (SPADCALL |k| (QREFELT $ 32))) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (|EFSTRUC;realElem| |a| |l| $) #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT
               (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 88)))
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
           (SPADCALL |v| (SPADCALL |v| (QREFELT $ 144)) (QREFELT $ 145)) $))
         ('T (VECTOR |lf| NIL NIL)))) 

(SDEFUN |EFSTRUC;rooteval|
        ((|lf| |List| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|n| |Fraction| (|Integer|))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#1=#:G508 NIL) (|f| NIL) (#2=#:G507 NIL)
          (|lv| (|List| F)) (#3=#:G506 NIL) (|r| NIL) (#4=#:G505 NIL)
          (|l| (|List| (|Kernel| F))) (#5=#:G504 NIL) (#6=#:G503 NIL)
          (|nv| (F)) (|m| (|Integer|)) (|x| (F)))
         (SEQ
          (LETT |nv|
                (SPADCALL
                 (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
                 (LETT |m| (SPADCALL |n| (QREFELT $ 146))) (QREFELT $ 147)))
          (LETT |l|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |r| NIL)
                      (LETT #5# (CONS |k| (|EFSTRUC;toR| |lk| |x| $))) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |r| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |r| (QREFELT $ 32))
                                      (QREFELT $ 148))
                            (QREFELT $ 149))
                           |m| (QREFELT $ 150))
                          (LETT #6# (CONS |r| #6#))))))
                      (LETT #5# (CDR #5#)) (GO G190) G191
                      (EXIT (NREVERSE #6#)))))
          (LETT |lv|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |r| NIL) (LETT #3# |l|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#)) NIL))
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
                                                      (QREFELT $ 148))
                                                     (QREFELT $ 149))
                                                    (QREFELT $ 151))
                                                   (QREFELT $ 152))
                                         (QREFELT $ 153))
                               #4#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (LETT |nlf|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |f| |l| |lv| (QREFELT $ 112))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT (VECTOR |nlf| |l| |lv|))))) 

(SDEFUN |EFSTRUC;ataneval|
        ((|lf| |List| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#1=#:G524 NIL) (|f| NIL) (#2=#:G523 NIL)
          (|g| (F)) (|h| (F)) (|d| (F)) (#3=#:G512 NIL) (#4=#:G511 (F))
          (#5=#:G513 (F)) (#6=#:G521 NIL) (|i| NIL) (#7=#:G522 NIL) (|x| NIL)
          (|s| (F)) (#8=#:G519 NIL) (#9=#:G520 NIL) (#10=#:G518 NIL) (|w| (F)))
         (SEQ (LETT |w| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
              (LETT |s|
                    (SPADCALL
                     (PROGN
                      (LETT #10# NIL)
                      (SEQ (LETT |x| NIL) (LETT #9# (|EFSTRUC;toV| |lk| $))
                           (LETT |i| (SPADCALL |v| (QREFELT $ 144)))
                           (LETT #8# (QVSIZE |v|)) G190
                           (COND
                            ((OR (> |i| #8#) (ATOM #9#)
                                 (PROGN (LETT |x| (CAR #9#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #10#
                                   (CONS
                                    (SPADCALL (QAREF1O |v| |i| 1) |x|
                                              (QREFELT $ 50))
                                    #10#))))
                           (LETT |i| (PROG1 (+ |i| 1) (LETT #9# (CDR #9#))))
                           (GO G190) G191 (EXIT (NREVERSE #10#))))
                     (QREFELT $ 53)))
              (LETT |g|
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |x| NIL) (LETT #7# (|EFSTRUC;toU| |lk| $))
                          (LETT |i| (SPADCALL |v| (QREFELT $ 144)))
                          (LETT #6# (QVSIZE |v|)) G190
                          (COND
                           ((OR (> |i| #6#) (ATOM #7#)
                                (PROGN (LETT |x| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #5#
                                   (SPADCALL (QAREF1O |v| |i| 1) |x|
                                             (QREFELT $ 154)))
                             (COND
                              (#3#
                               (LETT #4# (SPADCALL #4# #5# (QREFELT $ 135))))
                              ('T (PROGN (LETT #4# #5#) (LETT #3# 'T)))))))
                          (LETT |i| (PROG1 (+ |i| 1) (LETT #7# (CDR #7#))))
                          (GO G190) G191 (EXIT NIL))
                     (COND (#3# #4#) (#11='T (|spadConstant| $ 26)))))
              (LETT |h|
                    (COND
                     ((SPADCALL
                       (LETT |d|
                             (SPADCALL (|spadConstant| $ 71)
                                       (SPADCALL |s| |w| (QREFELT $ 108))
                                       (QREFELT $ 135)))
                       (QREFELT $ 129))
                      (QREFELT $ 16))
                     (#11#
                      (SPADCALL
                       (SPADCALL (SPADCALL |w| |s| (QREFELT $ 133)) |d|
                                 (QREFELT $ 15))
                       (QREFELT $ 113)))))
              (LETT |g| (SPADCALL |g| |h| (QREFELT $ 135)))
              (LETT |nlf|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL |f| (LIST |k|) (LIST |g|)
                                             (QREFELT $ 112))
                                   #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT (VECTOR |nlf| (LIST |k|) (LIST |g|)))))) 

(SDEFUN |EFSTRUC;gdCoef?|
        ((|c| |Fraction| (|Integer|)) (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Boolean|))
        (SPROG ((#1=#:G532 NIL) (#2=#:G533 NIL) (#3=#:G534 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 144)))
                         (LETT #3# (QVSIZE |v|)) G190
                         (COND ((> |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((QEQCAR
                              (SPADCALL
                               (SPADCALL (QAREF1O |v| |i| 1) |c|
                                         (QREFELT $ 152))
                               (QREFELT $ 155))
                              1)
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G531)))
                              (GO #5=#:G529))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |EFSTRUC;goodCoef|
        ((|v| |Vector| (|Fraction| (|Integer|))) (|l| |List| (|Kernel| F))
         (|s| |Symbol|)
         ($ |Union|
          (|Record| (|:| |index| (|Integer|)) (|:| |ker| (|Kernel| F)))
          "failed"))
        (SPROG
         ((#1=#:G565 NIL) (#2=#:G566 NIL)
          (|r| (|Union| (|Fraction| (|Integer|)) "failed")) (#3=#:G570 NIL)
          (|i| NIL) (#4=#:G571 NIL) (|k| NIL) (|h| (|NonNegativeInteger|))
          (|j| (|Integer|)) (|h1| (|NonNegativeInteger|)) (#5=#:G568 NIL)
          (#6=#:G569 NIL) (|ll| (|List| (|Kernel| F))) (#7=#:G567 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |h| 0) (LETT |j| 0) (LETT |ll| NIL)
                (SEQ (LETT |k| NIL) (LETT #7# |l|) G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((OR (SPADCALL |k| '|log| (QREFELT $ 30))
                             (OR (SPADCALL |k| '|exp| (QREFELT $ 30))
                                 (OR (SPADCALL |k| '|tan| (QREFELT $ 30))
                                     (SPADCALL |k| '|atan| (QREFELT $ 30)))))
                         (SEQ (LETT |ll| (CONS |k| |ll|))
                              (EXIT (LETT |h| (+ |h| 1))))))))
                     (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((NULL
                   (EQL |h|
                        (+ (- (QVSIZE |v|) (SPADCALL |v| (QREFELT $ 144))) 1)))
                  (EXIT (CONS 1 "failed"))))
                (LETT |h| 0) (LETT |ll| (REVERSE |ll|))
                (SEQ (LETT |k| NIL) (LETT #6# |ll|)
                     (LETT |i| (SPADCALL |v| (QREFELT $ 144)))
                     (LETT #5# (QVSIZE |v|)) G190
                     (COND
                      ((OR (> |i| #5#) (ATOM #6#)
                           (PROGN (LETT |k| (CAR #6#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |h1| (SPADCALL |k| (QREFELT $ 156)))
                          (EXIT
                           (COND
                            ((SPADCALL |h1| |h| (QREFELT $ 157))
                             (SEQ (LETT |j| |i|) (EXIT (LETT |h| |h1|)))))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT #6# (CDR #6#))))
                     (GO G190) G191 (EXIT NIL))
                (SEQ
                 (EXIT
                  (SEQ (LETT |k| NIL) (LETT #4# |ll|)
                       (LETT |i| (SPADCALL |v| (QREFELT $ 144)))
                       (LETT #3# (QVSIZE |v|)) G190
                       (COND
                        ((OR (> |i| #3#) (ATOM #4#)
                             (PROGN (LETT |k| (CAR #4#)) NIL))
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
                                              (QREFELT $ 159)))
                              (EXIT
                               (COND
                                ((QEQCAR |r| 0)
                                 (COND
                                  ((QEQCAR
                                    (SPADCALL (QCDR |r|) (QREFELT $ 155)) 0)
                                   (COND
                                    ((|EFSTRUC;gdCoef?| (QAREF1O |v| |i| 1) |v|
                                      $)
                                     (PROGN
                                      (LETT #1#
                                            (PROGN
                                             (LETT #2# (CONS 0 (CONS |i| |k|)))
                                             (GO #8=#:G564)))
                                      (GO #9=#:G562))))))))))))))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT #4# (CDR #4#))))
                       (GO G190) G191 (EXIT NIL)))
                 #9# (EXIT #1#))
                (EXIT (CONS 1 "failed"))))
          #8# (EXIT #2#)))) 

(SDEFUN |EFSTRUC;taneval|
        ((|lf| |List| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#2=#:G597 NIL) (|f| NIL) (#3=#:G596 NIL)
          (|g| (F)) (#4=#:G594 NIL) (|a| NIL) (#5=#:G595 NIL) (|x| NIL)
          (#6=#:G593 NIL) (|l| (|List| #1#)) (#7=#:G592 NIL) (|kk| NIL)
          (#8=#:G591 NIL) (|lv| (|List| (|Fraction| (|Integer|))))
          (#9=#:G590 NIL) (|i| NIL) (#10=#:G589 NIL) (|v0| (|Integer|))
          (|rec|
           (|Union|
            (|Record| (|:| |index| (|Integer|)) (|:| |ker| (|Kernel| F)))
            "failed"))
          (|c| (F)) (#11=#:G574 NIL) (#12=#:G573 (F)) (#13=#:G575 (F))
          (#14=#:G587 NIL) (#15=#:G588 NIL) (|fns| (|List| F)) (|u| (F)))
         (SEQ (LETT |u| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
              (LETT |fns| (|EFSTRUC;toU| |lk| $))
              (LETT |c|
                    (SPADCALL |u|
                              (PROGN
                               (LETT #11# NIL)
                               (SEQ (LETT |x| NIL) (LETT #15# |fns|)
                                    (LETT |i| (SPADCALL |v| (QREFELT $ 144)))
                                    (LETT #14# (QVSIZE |v|)) G190
                                    (COND
                                     ((OR (> |i| #14#) (ATOM #15#)
                                          (PROGN (LETT |x| (CAR #15#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #13#
                                             (SPADCALL (QAREF1O |v| |i| 1) |x|
                                                       (QREFELT $ 154)))
                                       (COND
                                        (#11#
                                         (LETT #12#
                                               (SPADCALL #12# #13#
                                                         (QREFELT $ 135))))
                                        ('T
                                         (PROGN
                                          (LETT #12# #13#)
                                          (LETT #11# 'T)))))))
                                    (LETT |i|
                                          (PROG1 (+ |i| 1)
                                            (LETT #15# (CDR #15#))))
                                    (GO G190) G191 (EXIT NIL))
                               (COND (#11# #12#)
                                     (#16='T (|spadConstant| $ 26))))
                              (QREFELT $ 133)))
              (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|tan| $))
              (EXIT
               (COND
                ((QEQCAR |rec| 1)
                 (|EFSTRUC;tannosimp| |lf| |lk| |k| |v| |fns| |c| $))
                (#16#
                 (SEQ
                  (LETT |v0|
                        (SPADCALL
                         (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1)
                                   (QREFELT $ 160))
                         (QREFELT $ 146)))
                  (LETT |lv|
                        (PROGN
                         (LETT #10# NIL)
                         (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 144)))
                              (LETT #9# (QVSIZE |v|)) G190
                              (COND ((> |i| #9#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |i| (QCAR (QCDR |rec|))
                                            (QREFELT $ 150))
                                  (LETT #10#
                                        (CONS (QAREF1O |v| |i| 1) #10#))))))
                              (LETT |i| (+ |i| 1)) (GO G190) G191
                              (EXIT (NREVERSE #10#)))))
                  (LETT |l|
                        (PROGN
                         (LETT #8# NIL)
                         (SEQ (LETT |kk| NIL) (LETT #7# |lk|) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |kk| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |kk| (QCDR (QCDR |rec|))
                                            (QREFELT $ 114))
                                  (LETT #8# (CONS |kk| #8#))))))
                              (LETT #7# (CDR #7#)) (GO G190) G191
                              (EXIT (NREVERSE #8#)))))
                  (LETT |g|
                        (|EFSTRUC;tanSum|
                         (SPADCALL (SPADCALL |v0| |c| (QREFELT $ 161))
                                   (QREFELT $ 14))
                         (CONS
                          (SPADCALL (SPADCALL |k| (QREFELT $ 88)) |v0|
                                    (QREFELT $ 49))
                          (PROGN
                           (LETT #6# NIL)
                           (SEQ (LETT |x| NIL) (LETT #5# (|EFSTRUC;toV| |l| $))
                                (LETT |a| NIL) (LETT #4# |lv|) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |a| (CAR #4#)) NIL)
                                      (ATOM #5#)
                                      (PROGN (LETT |x| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS
                                         (SPADCALL |x|
                                                   (-
                                                    (SPADCALL
                                                     (SPADCALL |a| |v0|
                                                               (QREFELT $ 162))
                                                     (QREFELT $ 146)))
                                                   (QREFELT $ 49))
                                         #6#))))
                                (LETT #4#
                                      (PROG1 (CDR #4#) (LETT #5# (CDR #5#))))
                                (GO G190) G191 (EXIT (NREVERSE #6#)))))
                         $))
                  (LETT |nlf|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |f| NIL) (LETT #2# |lf|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |f| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (SPADCALL |f| (LIST (QCDR (QCDR |rec|)))
                                                 (LIST |g|) (QREFELT $ 112))
                                       #3#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #3#)))))
                  (EXIT
                   (VECTOR |nlf| (LIST (QCDR (QCDR |rec|))) (LIST |g|)))))))))) 

(SDEFUN |EFSTRUC;tannosimp|
        ((|lf| |List| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|))) (|fns| |List| F) (|c| F)
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#2=#:G640 NIL) (|f| NIL) (#3=#:G639 NIL)
          (|h| (F)) (#4=#:G637 NIL) (|i| NIL) (#5=#:G638 NIL) (|x| NIL)
          (#6=#:G636 NIL) (#7=#:G635 NIL) (#8=#:G634 NIL) (|lk1| (|List| #1#))
          (|newtan| (|List| F)) (#9=#:G632 NIL) (#10=#:G633 NIL) (|t| NIL)
          (#11=#:G631 NIL) (|li| (|List| (|NonNegativeInteger|)))
          (#12=#:G630 NIL) (#13=#:G629 NIL) (#14=#:G628 NIL) (#15=#:G627 NIL)
          (|newt| (|List| F)) (#16=#:G625 NIL) (|u| NIL) (#17=#:G626 NIL)
          (#18=#:G624 NIL) (|dd| (F)) (|d| #19=(|Integer|))
          (|cd| (|Record| (|:| |num| (|Vector| (|Integer|))) (|:| |den| #19#)))
          (#20=#:G622 NIL) (#21=#:G623 NIL) (#22=#:G621 NIL) (#23=#:G620 NIL)
          (#24=#:G619 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (QVSIZE |v|))
              (LETT |lk|
                    (PROGN
                     (LETT #24# NIL)
                     (SEQ (LETT |x| NIL) (LETT #23# |lk|) G190
                          (COND
                           ((OR (ATOM #23#) (PROGN (LETT |x| (CAR #23#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND ((SPADCALL |x| '|tan| (QREFELT $ 30)) 'T)
                                    (#25='T
                                     (SPADCALL |x| '|atan| (QREFELT $ 30))))
                              (LETT #24# (CONS |x| #24#))))))
                          (LETT #23# (CDR #23#)) (GO G190) G191
                          (EXIT (NREVERSE #24#)))))
              (LETT |lk1|
                    (PROGN
                     (LETT #22# NIL)
                     (SEQ (LETT |i| 1) (LETT #21# |n|) (LETT |x| NIL)
                          (LETT #20# |lk|) G190
                          (COND
                           ((OR (ATOM #20#) (PROGN (LETT |x| (CAR #20#)) NIL)
                                (|greater_SI| |i| #21#))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (SPADCALL (QAREF1O |v| |i| 1)
                                         (|spadConstant| $ 97) (QREFELT $ 82)))
                              (LETT #22# (CONS |x| #22#))))))
                          (LETT #20#
                                (PROG1 (CDR #20#) (LETT |i| (|inc_SI| |i|))))
                          (GO G190) G191 (EXIT (NREVERSE #22#)))))
              (EXIT
               (COND
                ((SPADCALL (CONS #'|EFSTRUC;tannosimp!0| $) |lk1|
                           (QREFELT $ 163))
                 (SEQ
                  (LETT |dd|
                        (SPADCALL
                         (LETT |d|
                               (QCDR
                                (LETT |cd| (SPADCALL |v| (QREFELT $ 166)))))
                         (QREFELT $ 13)))
                  (LETT |newt|
                        (PROGN
                         (LETT #18# NIL)
                         (SEQ (LETT |i| 1) (LETT #17# |n|) (LETT |u| NIL)
                              (LETT #16# |fns|) G190
                              (COND
                               ((OR (ATOM #16#)
                                    (PROGN (LETT |u| (CAR #16#)) NIL)
                                    (|greater_SI| |i| #17#))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((NULL
                                   (SPADCALL (QAREF1O |v| |i| 1)
                                             (|spadConstant| $ 97)
                                             (QREFELT $ 82)))
                                  (LETT #18#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |u| |dd| (QREFELT $ 15))
                                          (QREFELT $ 55))
                                         #18#))))))
                              (LETT #16#
                                    (PROG1 (CDR #16#)
                                      (LETT |i| (|inc_SI| |i|))))
                              (GO G190) G191 (EXIT (NREVERSE #18#)))))
                  (LETT |newtan|
                        (PROGN
                         (LETT #15# NIL)
                         (SEQ (LETT |t| NIL) (LETT #14# |newt|) G190
                              (COND
                               ((OR (ATOM #14#)
                                    (PROGN (LETT |t| (CAR #14#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #15#
                                      (CONS (SPADCALL |t| |d| (QREFELT $ 49))
                                            #15#))))
                              (LETT #14# (CDR #14#)) (GO G190) G191
                              (EXIT (NREVERSE #15#)))))
                  (LETT |li|
                        (PROGN
                         (LETT #13# NIL)
                         (SEQ (LETT |i| 1) (LETT #12# |n|) G190
                              (COND ((|greater_SI| |i| #12#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((NULL
                                   (SPADCALL (QAREF1O |v| |i| 1)
                                             (|spadConstant| $ 97)
                                             (QREFELT $ 82)))
                                  (LETT #13# (CONS |i| #13#))))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT (NREVERSE #13#)))))
                  (LETT |h|
                        (|EFSTRUC;tanSum| |c|
                         (PROGN
                          (LETT #11# NIL)
                          (SEQ (LETT |t| NIL) (LETT #10# |newt|) (LETT |i| NIL)
                               (LETT #9# |li|) G190
                               (COND
                                ((OR (ATOM #9#)
                                     (PROGN (LETT |i| (CAR #9#)) NIL)
                                     (ATOM #10#)
                                     (PROGN (LETT |t| (CAR #10#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #11#
                                       (CONS
                                        (SPADCALL |t|
                                                  (QAREF1O (QCAR |cd|) |i| 1)
                                                  (QREFELT $ 49))
                                        #11#))))
                               (LETT #9#
                                     (PROG1 (CDR #9#) (LETT #10# (CDR #10#))))
                               (GO G190) G191 (EXIT (NREVERSE #11#))))
                         $))
                  (LETT |newtan| (CONS |h| |newtan|))
                  (LETT |lk1| (CONS |k| |lk1|))
                  (LETT |nlf|
                        (PROGN
                         (LETT #8# NIL)
                         (SEQ (LETT |f| NIL) (LETT #7# |lf|) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |f| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #8#
                                      (CONS
                                       (SPADCALL |f| |lk1| |newtan|
                                                 (QREFELT $ 112))
                                       #8#))))
                              (LETT #7# (CDR #7#)) (GO G190) G191
                              (EXIT (NREVERSE #8#)))))
                  (EXIT (VECTOR |nlf| |lk1| |newtan|))))
                (#25#
                 (SEQ
                  (LETT |h|
                        (|EFSTRUC;tanSum| |c|
                         (PROGN
                          (LETT #6# NIL)
                          (SEQ (LETT |x| NIL) (LETT #5# (|EFSTRUC;toV| |lk| $))
                               (LETT |i| 1) (LETT #4# |n|) G190
                               (COND
                                ((OR (|greater_SI| |i| #4#) (ATOM #5#)
                                     (PROGN (LETT |x| (CAR #5#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #6#
                                       (CONS
                                        (SPADCALL (QAREF1O |v| |i| 1) |x|
                                                  (QREFELT $ 50))
                                        #6#))))
                               (LETT |i|
                                     (PROG1 (|inc_SI| |i|)
                                       (LETT #5# (CDR #5#))))
                               (GO G190) G191 (EXIT (NREVERSE #6#))))
                         $))
                  (LETT |nlf|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |f| NIL) (LETT #2# |lf|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |f| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (SPADCALL |f| (LIST |k|) (LIST |h|)
                                                 (QREFELT $ 112))
                                       #3#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #3#)))))
                  (EXIT (VECTOR |nlf| (LIST |k|) (LIST |h|)))))))))) 

(SDEFUN |EFSTRUC;tannosimp!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| '|tan| (QREFELT $ 30))) 

(SDEFUN |EFSTRUC;expnosimp|
        ((|lf| |List| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|))) (|fns| |List| F) (|g| F)
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#1=#:G659 NIL) (|f| NIL) (#2=#:G658 NIL)
          (|lexp| (|List| F)) (|lke| (|List| (|Kernel| F))) (|h| (F))
          (|nui| (F)) (|di| (|Integer|)) (|vi| (|Fraction| (|Integer|)))
          (#3=#:G655 NIL) (|i| NIL) (#4=#:G656 NIL) (|k1| NIL) (#5=#:G657 NIL)
          (|y| NIL) (|vnum| #6=(|Vector| (|Integer|))) (|d| #7=(|Integer|))
          (|cd| (|Record| (|:| |num| #6#) (|:| |den| #7#))) (#8=#:G654 NIL)
          (|x| NIL) (#9=#:G653 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (QVSIZE |v|))
              (LETT |lk|
                    (PROGN
                     (LETT #9# NIL)
                     (SEQ (LETT |x| NIL) (LETT #8# |lk|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |x| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((OR (SPADCALL |x| '|exp| (QREFELT $ 30))
                                    (SPADCALL |x| '|log| (QREFELT $ 30)))
                                'T)
                               ('T (SPADCALL |x| '|lambertW| (QREFELT $ 30))))
                              (LETT #9# (CONS |x| #9#))))))
                          (LETT #8# (CDR #8#)) (GO G190) G191
                          (EXIT (NREVERSE #9#)))))
              (LETT |d| (QCDR (LETT |cd| (SPADCALL |v| (QREFELT $ 166)))))
              (LETT |vnum| (QCAR |cd|)) (LETT |h| |g|) (LETT |lke| NIL)
              (LETT |lexp| NIL)
              (SEQ (LETT |y| NIL) (LETT #5# |fns|) (LETT |k1| NIL)
                   (LETT #4# |lk|) (LETT |i| 1) (LETT #3# |n|) G190
                   (COND
                    ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                         (PROGN (LETT |k1| (CAR #4#)) NIL) (ATOM #5#)
                         (PROGN (LETT |y| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |vi| (QAREF1O |v| |i| 1))
                        (EXIT
                         (COND
                          ((SPADCALL |vi| (|spadConstant| $ 97) (QREFELT $ 82))
                           "iterate")
                          ('T
                           (SEQ (LETT |di| (SPADCALL |vi| (QREFELT $ 39)))
                                (COND
                                 ((OR (SPADCALL |k1| '|log| (QREFELT $ 30))
                                      (EQL |di| 1))
                                  (EXIT
                                   (LETT |h|
                                         (SPADCALL |h|
                                                   (SPADCALL
                                                    (SPADCALL |y|
                                                              (QREFELT $ 131))
                                                    |vi| (QREFELT $ 153))
                                                   (QREFELT $ 108))))))
                                (LETT |lke| (CONS |k1| |lke|))
                                (LETT |nui|
                                      (SPADCALL
                                       (SPADCALL |y|
                                                 (SPADCALL |di| (QREFELT $ 13))
                                                 (QREFELT $ 15))
                                       (QREFELT $ 131)))
                                (LETT |lexp|
                                      (CONS
                                       (SPADCALL |nui| |di| (QREFELT $ 105))
                                       |lexp|))
                                (EXIT
                                 (LETT |h|
                                       (SPADCALL |h|
                                                 (SPADCALL |nui|
                                                           (SPADCALL |vi|
                                                                     (QREFELT $
                                                                              48))
                                                           (QREFELT $ 105))
                                                 (QREFELT $ 108)))))))))
                   (LETT |i|
                         (PROG1 (|inc_SI| |i|)
                           (LETT #4# (PROG1 (CDR #4#) (LETT #5# (CDR #5#))))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |lke| (CONS |k| |lke|)) (LETT |lexp| (CONS |h| |lexp|))
              (LETT |nlf|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL |f| |lke| |lexp| (QREFELT $ 112))
                                   #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT (VECTOR |nlf| |lke| |lexp|))))) 

(SDEFUN |EFSTRUC;logeval|
        ((|lf| |List| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#1=#:G684 NIL) (|f| NIL) (#2=#:G683 NIL)
          (|g| (F)) (#3=#:G672 NIL) (#4=#:G671 (F)) (#5=#:G673 (F))
          (#6=#:G681 NIL) (|i| NIL) (#7=#:G682 NIL) (|x| NIL) (|c| (F))
          (#8=#:G663 NIL) (#9=#:G662 (F)) (#10=#:G664 (F)) (#11=#:G679 NIL)
          (#12=#:G680 NIL) (|dd| (|Integer|)) (#13=#:G678 NIL) (#14=#:G677 NIL)
          (|z| (F)))
         (SEQ (LETT |z| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
              (LETT |dd|
                    (SPADCALL
                     (PROGN
                      (LETT #14# NIL)
                      (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 144)))
                           (LETT #13# (QVSIZE |v|)) G190
                           (COND ((> |i| #13#) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #14#
                                   (CONS
                                    (SPADCALL (QAREF1O |v| |i| 1)
                                              (QREFELT $ 39))
                                    #14#))))
                           (LETT |i| (+ |i| 1)) (GO G190) G191
                           (EXIT (NREVERSE #14#))))
                     (QREFELT $ 167)))
              (LETT |c|
                    (SPADCALL (SPADCALL |z| |dd| (QREFELT $ 105))
                              (PROGN
                               (LETT #8# NIL)
                               (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 144)))
                                    (LETT #12# (QVSIZE |v|)) (LETT |x| NIL)
                                    (LETT #11# (|EFSTRUC;toZ| |lk| $)) G190
                                    (COND
                                     ((OR (ATOM #11#)
                                          (PROGN (LETT |x| (CAR #11#)) NIL)
                                          (> |i| #12#))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #10#
                                             (SPADCALL |x|
                                                       (SPADCALL |dd|
                                                                 (QAREF1O |v|
                                                                          |i|
                                                                          1)
                                                                 (QREFELT $
                                                                          168))
                                                       (QREFELT $ 153)))
                                       (COND
                                        (#8#
                                         (LETT #9#
                                               (SPADCALL #9# #10#
                                                         (QREFELT $ 108))))
                                        ('T
                                         (PROGN
                                          (LETT #9# #10#)
                                          (LETT #8# 'T)))))))
                                    (LETT #11#
                                          (PROG1 (CDR #11#)
                                            (LETT |i| (+ |i| 1))))
                                    (GO G190) G191 (EXIT NIL))
                               (COND (#8# #9#) (#15='T (|spadConstant| $ 71))))
                              (QREFELT $ 15)))
              (LETT |g|
                    (SPADCALL
                     (PROGN
                      (LETT #3# NIL)
                      (SEQ (LETT |x| NIL) (LETT #7# (|EFSTRUC;toY| |lk| $))
                           (LETT |i| (SPADCALL |v| (QREFELT $ 144)))
                           (LETT #6# (QVSIZE |v|)) G190
                           (COND
                            ((OR (> |i| #6#) (ATOM #7#)
                                 (PROGN (LETT |x| (CAR #7#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #5#
                                    (SPADCALL (QAREF1O |v| |i| 1) |x|
                                              (QREFELT $ 154)))
                              (COND
                               (#3#
                                (LETT #4# (SPADCALL #4# #5# (QREFELT $ 135))))
                               ('T (PROGN (LETT #4# #5#) (LETT #3# 'T)))))))
                           (LETT |i| (PROG1 (+ |i| 1) (LETT #7# (CDR #7#))))
                           (GO G190) G191 (EXIT NIL))
                      (COND (#3# #4#) (#15# (|spadConstant| $ 26))))
                     (SPADCALL (SPADCALL |c| (QREFELT $ 89))
                               (SPADCALL (SPADCALL |dd| (QREFELT $ 169))
                                         (QREFELT $ 115))
                               (QREFELT $ 15))
                     (QREFELT $ 135)))
              (LETT |nlf|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL |f| (LIST |k|) (LIST |g|)
                                             (QREFELT $ 112))
                                   #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT (VECTOR |nlf| (LIST |k|) (LIST |g|)))))) 

(SDEFUN |EFSTRUC;rischNormalize;LLR;42|
        ((|lf| |List| F) (|vars| |List| (|Symbol|))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((#1=#:G697 NIL)
          (|rn|
           (|Record| (|:| |funcs| (|List| F))
                     (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (|nlf| (|List| F)) (#2=#:G701 NIL) (|f| NIL) (#3=#:G700 NIL)
          (#4=#:G696 NIL)
          (|rec|
           (|Record| (|:| |funcs| (|List| F))
                     (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (|c|
           (|Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
                    (|:| |func| F) (|:| |fail| (|Boolean|))))
          (|klist| (|List| (|Kernel| F))) (#5=#:G698 NIL) (|i| NIL)
          (#6=#:G699 NIL) (|kk| NIL) (|n| (|NonNegativeInteger|))
          (|pars| (|List| (|Symbol|))) (|funs| (|List| (|Kernel| F))))
         (SEQ
          (EXIT
           (SEQ (LETT |funs| (SPADCALL |lf| (QREFELT $ 170)))
                (LETT |pars| (SPADCALL |lf| (QREFELT $ 171)))
                (LETT |pars| (SPADCALL |pars| |vars| (QREFELT $ 172)))
                (EXIT
                 (COND ((NULL |funs|) (VECTOR |lf| NIL NIL))
                       ('T
                        (SEQ (LETT |n| (LENGTH |funs|))
                             (SEQ (LETT |kk| NIL) (LETT #6# (CDR |funs|))
                                  (LETT |i| 1) (LETT #5# |n|) G190
                                  (COND
                                   ((OR (|greater_SI| |i| #5#) (ATOM #6#)
                                        (PROGN (LETT |kk| (CAR #6#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (LETT |klist|
                                           (SPADCALL |funs| |i|
                                                     (QREFELT $ 173)))
                                     (SEQ
                                      (LETT |c|
                                            (|EFSTRUC;findRelation| |vars|
                                             |pars| |klist| |kk| $))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |c| 0)
                                         (COND
                                          ((NULL
                                            (SPADCALL (CDR |c|)
                                                      (QREFELT $ 174)))
                                           (PROGN
                                            (LETT #4#
                                                  (SEQ
                                                   (LETT |rec|
                                                         (|EFSTRUC;depeval|
                                                          |lf| |klist| |kk|
                                                          (CDR |c|) $))
                                                   (LETT |rn|
                                                         (SPADCALL
                                                          (QVELT |rec| 0)
                                                          |vars|
                                                          (QREFELT $ 176)))
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #1#
                                                           (VECTOR
                                                            (QVELT |rn| 0)
                                                            (SPADCALL
                                                             (QVELT |rec| 1)
                                                             (QVELT |rn| 1)
                                                             (QREFELT $ 177))
                                                            (SPADCALL
                                                             (QVELT |rec| 2)
                                                             (QVELT |rn| 2)
                                                             (QREFELT $ 141))))
                                                     (GO #7=#:G695)))))
                                            (GO #8=#:G691))))))))
                                     (EXIT
                                      (COND
                                       ((QEQCAR |c| 1)
                                        (SEQ
                                         (LETT |nlf|
                                               (PROGN
                                                (LETT #3# NIL)
                                                (SEQ (LETT |f| NIL)
                                                     (LETT #2# |lf|) G190
                                                     (COND
                                                      ((OR (ATOM #2#)
                                                           (PROGN
                                                            (LETT |f|
                                                                  (CAR #2#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #3#
                                                             (CONS
                                                              (SPADCALL |f|
                                                                        (LIST
                                                                         |kk|)
                                                                        (LIST
                                                                         (CDR
                                                                          |c|))
                                                                        (QREFELT
                                                                         $
                                                                         112))
                                                              #3#))))
                                                     (LETT #2# (CDR #2#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #3#)))))
                                         (LETT |rn|
                                               (SPADCALL |nlf| |vars|
                                                         (QREFELT $ 176)))
                                         (EXIT
                                          (PROGN
                                           (LETT #1#
                                                 (VECTOR (QVELT |rn| 0)
                                                         (CONS |kk|
                                                               (QVELT |rn| 1))
                                                         (CONS (CDR |c|)
                                                               (QVELT |rn|
                                                                      2))))
                                           (GO #7#)))))))))
                                   #8# (EXIT #4#))
                                  (LETT |i|
                                        (PROG1 (|inc_SI| |i|)
                                          (LETT #6# (CDR #6#))))
                                  (GO G190) G191 (EXIT NIL))
                             (EXIT (VECTOR |lf| NIL NIL))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |EFSTRUC;rischNormalize;FLR;43|
        ((|f| F) (|vars| |List| (|Symbol|))
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPROG
         ((|rn|
           (|Record| (|:| |funcs| (|List| F))
                     (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F)))))
         (SEQ (LETT |rn| (SPADCALL (LIST |f|) |vars| (QREFELT $ 176)))
              (EXIT
               (VECTOR (|SPADfirst| (QVELT |rn| 0)) (QVELT |rn| 1)
                       (QVELT |rn| 2)))))) 

(SDEFUN |EFSTRUC;rischNormalize;FSR;44|
        ((|f| F) (|v| |Symbol|)
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPADCALL |f| (LIST |v|) (QREFELT $ 179))) 

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
                 (|EFSTRUC;toR| (SPADCALL |f| (QREFELT $ 181))
                  (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) $)
                 |k| $))
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
         (SEQ (LETT |c| (|EFSTRUC;rootDep| |l| |k| $))
              (EXIT
               (COND
                ((QEQCAR |c| 0)
                 (CONS 0
                       (|EFSTRUC;rooteval| |lf| |l| |k|
                        (SPADCALL (CDR |c|)
                                  (SPADCALL (CDR |c|) (QREFELT $ 144))
                                  (QREFELT $ 145))
                        $)))
                ('T (CONS 1 "failed"))))))) 

(SDEFUN |EFSTRUC;validExponential;LFSU;47|
        ((|twr| |List| (|Kernel| F)) (|eta| F) (|x| |Symbol|)
         ($ |Union| F "failed"))
        (SPROG
         ((#1=#:G756 NIL) (#2=#:G755 (F)) (#3=#:G757 (F)) (#4=#:G768 NIL)
          (|i| NIL) (#5=#:G769 NIL) (|yy| NIL) (|g| (F)) (#6=#:G729 NIL)
          (#7=#:G728 (F)) (#8=#:G730 (F)) (#9=#:G766 NIL) (#10=#:G767 NIL)
          (|v| (|Vector| (|Fraction| (|Integer|))))
          (|c| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (#11=#:G765 NIL) (|fns| (|List| F)) (#12=#:G764 NIL))
         (SEQ
          (LETT |c|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #12# NIL)
                   (SEQ (LETT |g| NIL)
                        (LETT #11# (LETT |fns| (|EFSTRUC;toY| |twr| $))) G190
                        (COND
                         ((OR (ATOM #11#) (PROGN (LETT |g| (CAR #11#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #12#
                                (CONS (SPADCALL |g| |x| (QREFELT $ 57))
                                      #12#))))
                        (LETT #11# (CDR #11#)) (GO G190) G191
                        (EXIT (NREVERSE #12#))))
                  (QREFELT $ 183))
                 (SPADCALL |eta| |x| (QREFELT $ 57)) (QREFELT $ 184)))
          (EXIT
           (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
                 (#13='T
                  (SEQ (LETT |v| (QCDR |c|))
                       (LETT |g|
                             (SPADCALL |eta|
                                       (PROGN
                                        (LETT #6# NIL)
                                        (SEQ (LETT |yy| NIL) (LETT #10# |fns|)
                                             (LETT |i|
                                                   (SPADCALL |v|
                                                             (QREFELT $ 144)))
                                             (LETT #9# (QVSIZE |v|)) G190
                                             (COND
                                              ((OR (> |i| #9#) (ATOM #10#)
                                                   (PROGN
                                                    (LETT |yy| (CAR #10#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (PROGN
                                                (LETT #8#
                                                      (SPADCALL
                                                       (QAREF1O |v| |i| 1) |yy|
                                                       (QREFELT $ 154)))
                                                (COND
                                                 (#6#
                                                  (LETT #7#
                                                        (SPADCALL #7# #8#
                                                                  (QREFELT $
                                                                           135))))
                                                 ('T
                                                  (PROGN
                                                   (LETT #7# #8#)
                                                   (LETT #6# 'T)))))))
                                             (LETT |i|
                                                   (PROG1 (+ |i| 1)
                                                     (LETT #10# (CDR #10#))))
                                             (GO G190) G191 (EXIT NIL))
                                        (COND (#6# #7#)
                                              (#13# (|spadConstant| $ 26))))
                                       (QREFELT $ 133)))
                       (EXIT
                        (CONS 0
                              (SPADCALL
                               (PROGN
                                (LETT #1# NIL)
                                (SEQ (LETT |yy| NIL) (LETT #5# |fns|)
                                     (LETT |i| (SPADCALL |v| (QREFELT $ 144)))
                                     (LETT #4# (QVSIZE |v|)) G190
                                     (COND
                                      ((OR (> |i| #4#) (ATOM #5#)
                                           (PROGN (LETT |yy| (CAR #5#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #3#
                                              (SPADCALL
                                               (SPADCALL |yy| (QREFELT $ 131))
                                               (QAREF1O |v| |i| 1)
                                               (QREFELT $ 153)))
                                        (COND
                                         (#1#
                                          (LETT #2#
                                                (SPADCALL #2# #3#
                                                          (QREFELT $ 108))))
                                         ('T
                                          (PROGN
                                           (LETT #2# #3#)
                                           (LETT #1# 'T)))))))
                                     (LETT |i|
                                           (PROG1 (+ |i| 1)
                                             (LETT #5# (CDR #5#))))
                                     (GO G190) G191 (EXIT NIL))
                                (COND (#1# #2#) (#13# (|spadConstant| $ 71))))
                               (SPADCALL |g| (QREFELT $ 131))
                               (QREFELT $ 108))))))))))) 

(SDEFUN |EFSTRUC;irootDep;KU;48|
        ((|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|nv| (F)) (|nk| (F)) (|nr| (F)) (|nf| (F))
          (|pr|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (|n| (|NonNegativeInteger|)) (#1=#:G770 NIL))
         (SEQ
          (LETT |n|
                (PROG1
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |k| (QREFELT $ 32))
                                     (QREFELT $ 148))
                           (QREFELT $ 149)))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |pr|
                (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) |n|
                          (QREFELT $ 189)))
          (COND
           ((SPADCALL (QVELT |pr| 1) (|spadConstant| $ 71) (QREFELT $ 34))
            (COND
             ((NULL (EQL (QVELT |pr| 0) |n|))
              (EXIT
               (COND
                ((EQL (QVELT |pr| 0) 1)
                 (CONS 1
                       (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2)
                                 (QREFELT $ 108))))
                (#2='T
                 (SEQ (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)))
                      (LETT |nr| (QVELT |pr| 2))
                      (LETT |nk|
                            (SPADCALL (SPADCALL |k| (QREFELT $ 74))
                                      (LIST |nr| |nf|) (QREFELT $ 142)))
                      (LETT |nv|
                            (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 108)))
                      (EXIT (CONS 1 |nv|)))))))))
           (#2#
            (EXIT
             (COND
              ((EQL (QVELT |pr| 0) 1)
               (CONS 1
                     (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2) (QREFELT $ 108))))
              (#2#
               (SEQ (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)))
                    (LETT |nr| (QVELT |pr| 2))
                    (LETT |nk|
                          (SPADCALL (SPADCALL |k| (QREFELT $ 74))
                                    (LIST |nr| |nf|) (QREFELT $ 142)))
                    (LETT |nv| (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 108)))
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
         ((#1=#:G806 NIL) (#2=#:G805 #3=(|Integer|)) (#4=#:G807 #3#)
          (#5=#:G810 NIL) (|r| NIL))
         (SEQ
          (COND
           ((NULL
             (LETT |ker|
                   (|EFSTRUC;toR| |ker|
                    (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) $)))
            (SPADCALL |k| (QREFELT $ 191)))
           (#6='T
            (CONS 0
                  (MAKEARR1 1
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |k| (QREFELT $ 32))
                                         (QREFELT $ 148))
                               (QREFELT $ 149))
                              (PROGN
                               (LETT #1# NIL)
                               (SEQ (LETT |r| NIL) (LETT #5# |ker|) G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN (LETT |r| (CAR #5#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #4#
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |r| (QREFELT $ 32))
                                               (QREFELT $ 148))
                                              (QREFELT $ 149)))
                                       (COND
                                        (#1#
                                         (LETT #2#
                                               (SPADCALL #2# #4#
                                                         (QREFELT $ 192))))
                                        ('T
                                         (PROGN
                                          (LETT #2# #4#)
                                          (LETT #1# 'T)))))))
                                    (LETT #5# (CDR #5#)) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#1# #2#) (#6# 1)))
                              (QREFELT $ 192))
                             (QREFELT $ 151))))))))) 

(SDEFUN |EFSTRUC;expeval|
        ((|lf| |List| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#2=#:G837 NIL) (|f| NIL) (#3=#:G836 NIL)
          (|h| (F)) (#4=#:G822 NIL) (#5=#:G821 (F)) (#6=#:G823 (F))
          (#7=#:G834 NIL) (|a| NIL) (#8=#:G835 NIL) (|z| NIL)
          (|l| (|List| #1#)) (#9=#:G833 NIL) (|kk| NIL) (#10=#:G832 NIL)
          (|lv| (|List| (|Fraction| (|Integer|)))) (#11=#:G831 NIL) (|i| NIL)
          (#12=#:G830 NIL) (|v0| (|Integer|))
          (|rec|
           (|Union|
            (|Record| (|:| |index| (|Integer|)) (|:| |ker| (|Kernel| F)))
            "failed"))
          (|g| (F)) (#13=#:G813 NIL) (#14=#:G812 (F)) (#15=#:G814 (F))
          (#16=#:G828 NIL) (#17=#:G829 NIL) (|fns| (|List| F)) (|y| (F)))
         (SEQ (LETT |y| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
              (LETT |fns| (|EFSTRUC;toY| |lk| $))
              (LETT |g|
                    (SPADCALL |y|
                              (PROGN
                               (LETT #13# NIL)
                               (SEQ (LETT |z| NIL) (LETT #17# |fns|)
                                    (LETT |i| (SPADCALL |v| (QREFELT $ 144)))
                                    (LETT #16# (QVSIZE |v|)) G190
                                    (COND
                                     ((OR (> |i| #16#) (ATOM #17#)
                                          (PROGN (LETT |z| (CAR #17#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #15#
                                             (SPADCALL (QAREF1O |v| |i| 1) |z|
                                                       (QREFELT $ 154)))
                                       (COND
                                        (#13#
                                         (LETT #14#
                                               (SPADCALL #14# #15#
                                                         (QREFELT $ 135))))
                                        ('T
                                         (PROGN
                                          (LETT #14# #15#)
                                          (LETT #13# 'T)))))))
                                    (LETT |i|
                                          (PROG1 (+ |i| 1)
                                            (LETT #17# (CDR #17#))))
                                    (GO G190) G191 (EXIT NIL))
                               (COND (#13# #14#)
                                     (#18='T (|spadConstant| $ 26))))
                              (QREFELT $ 133)))
              (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|exp| $))
              (EXIT
               (COND
                ((QEQCAR |rec| 1)
                 (|EFSTRUC;expnosimp| |lf| |lk| |k| |v| |fns|
                  (SPADCALL |g| (QREFELT $ 131)) $))
                (#18#
                 (SEQ
                  (LETT |v0|
                        (SPADCALL
                         (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1)
                                   (QREFELT $ 160))
                         (QREFELT $ 146)))
                  (LETT |lv|
                        (PROGN
                         (LETT #12# NIL)
                         (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 144)))
                              (LETT #11# (QVSIZE |v|)) G190
                              (COND ((> |i| #11#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |i| (QCAR (QCDR |rec|))
                                            (QREFELT $ 150))
                                  (LETT #12#
                                        (CONS (QAREF1O |v| |i| 1) #12#))))))
                              (LETT |i| (+ |i| 1)) (GO G190) G191
                              (EXIT (NREVERSE #12#)))))
                  (LETT |l|
                        (PROGN
                         (LETT #10# NIL)
                         (SEQ (LETT |kk| NIL) (LETT #9# |lk|) G190
                              (COND
                               ((OR (ATOM #9#)
                                    (PROGN (LETT |kk| (CAR #9#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |kk| (QCDR (QCDR |rec|))
                                            (QREFELT $ 114))
                                  (LETT #10# (CONS |kk| #10#))))))
                              (LETT #9# (CDR #9#)) (GO G190) G191
                              (EXIT (NREVERSE #10#)))))
                  (LETT |h|
                        (PROGN
                         (LETT #4# NIL)
                         (SEQ (LETT |z| NIL) (LETT #8# (|EFSTRUC;toY| |l| $))
                              (LETT |a| NIL) (LETT #7# |lv|) G190
                              (COND
                               ((OR (ATOM #7#) (PROGN (LETT |a| (CAR #7#)) NIL)
                                    (ATOM #8#)
                                    (PROGN (LETT |z| (CAR #8#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6#
                                       (SPADCALL (SPADCALL |z| (QREFELT $ 131))
                                                 (-
                                                  (SPADCALL
                                                   (SPADCALL |a| |v0|
                                                             (QREFELT $ 162))
                                                   (QREFELT $ 146)))
                                                 (QREFELT $ 105)))
                                 (COND
                                  (#4#
                                   (LETT #5#
                                         (SPADCALL #5# #6# (QREFELT $ 108))))
                                  ('T (PROGN (LETT #5# #6#) (LETT #4# 'T)))))))
                              (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#))))
                              (GO G190) G191 (EXIT NIL))
                         (COND (#4# #5#) (#18# (|spadConstant| $ 71)))))
                  (LETT |h|
                        (SPADCALL
                         (SPADCALL |h|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |v0| |g| (QREFELT $ 161))
                                     (QREFELT $ 14))
                                    (QREFELT $ 131))
                                   (QREFELT $ 108))
                         (SPADCALL (SPADCALL |k| (QREFELT $ 88)) |v0|
                                   (QREFELT $ 105))
                         (QREFELT $ 108)))
                  (LETT |nlf|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |f| NIL) (LETT #2# |lf|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |f| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (SPADCALL |f| (LIST (QCDR (QCDR |rec|)))
                                                 (LIST |h|) (QREFELT $ 112))
                                       #3#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #3#)))))
                  (EXIT
                   (VECTOR |nlf| (LIST (QCDR (QCDR |rec|))) (LIST |h|)))))))))) 

(SDEFUN |EFSTRUC;normalize;2F;52| ((|f| F) ($ F))
        (|SPADfirst| (SPADCALL (LIST |f|) NIL (QREFELT $ 193)))) 

(SDEFUN |EFSTRUC;normalize;2L;53| ((|lf| |List| F) ($ |List| F))
        (SPADCALL |lf| NIL (QREFELT $ 193))) 

(SDEFUN |EFSTRUC;normalize;FSF;54| ((|f| F) (|x| |Symbol|) ($ F))
        (|SPADfirst| (SPADCALL (LIST |f|) (LIST |x|) (QREFELT $ 193)))) 

(SDEFUN |EFSTRUC;normalize;LLL;55|
        ((|lf| |List| F) (|lx| |List| (|Symbol|)) ($ |List| F))
        (SPROG ((|lf2| (|List| F)) (#1=#:G846 NIL) (|f| NIL) (#2=#:G845 NIL))
               (SEQ
                (LETT |lf2|
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (SPADCALL (SPADCALL |f| (QREFELT $ 23))
                                               (QREFELT $ 197))
                                     #2#))))
                            (LETT #1# (CDR #1#)) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))
                (EXIT (QVELT (SPADCALL |lf2| |lx| (QREFELT $ 176)) 0))))) 

(SDEFUN |EFSTRUC;factdeprel|
        ((|l| |List| (|Kernel| F)) (|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((#1=#:G885 NIL) (#2=#:G887 NIL) (#3=#:G879 NIL) (#4=#:G878 (F))
          (#5=#:G880 (F)) (#6=#:G889 NIL) (|i| NIL)
          (|r| (|Union| (|Integer|) "failed")) (|m| (F)) (#7=#:G888 NIL)
          (|x| NIL) (#8=#:G886 NIL) (|n| (F)))
         (SEQ
          (EXIT
           (SEQ
            (EXIT
             (SEQ
              (SEQ
               (LETT |r|
                     (SPADCALL
                      (LETT |n| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
                      (QREFELT $ 52)))
               (EXIT
                (COND
                 ((QEQCAR |r| 0)
                  (COND
                   ((SPADCALL (QCDR |r|) 0 (QREFELT $ 104))
                    (PROGN
                     (LETT #8#
                           (CONS 1
                                 (SPADCALL
                                  (SPADCALL (QCDR |r|) (QREFELT $ 198))
                                  (QREFELT $ 13))))
                     (GO #9=#:G883))))))))
              (SEQ (LETT |x| NIL) (LETT #7# |l|) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ
                      (LETT |m| (|SPADfirst| (SPADCALL |x| (QREFELT $ 32))))
                      (LETT |r|
                            (SPADCALL (SPADCALL |n| |m| (QREFELT $ 133))
                                      (QREFELT $ 52)))
                      (EXIT
                       (COND
                        ((QEQCAR |r| 0)
                         (PROGN
                          (LETT #1#
                                (COND
                                 ((SPADCALL (QCDR |r|) 0 (QREFELT $ 104))
                                  (PROGN
                                   (LETT #2#
                                         (CONS 1
                                               (SPADCALL
                                                (PROGN
                                                 (LETT #3# NIL)
                                                 (SEQ (LETT |i| 1)
                                                      (LETT #6# (QCDR |r|))
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
                                                                          135)))
                                                         (COND
                                                          (#3#
                                                           (LETT #4#
                                                                 (SPADCALL #4#
                                                                           #5#
                                                                           (QREFELT
                                                                            $
                                                                            108))))
                                                          ('T
                                                           (PROGN
                                                            (LETT #4# #5#)
                                                            (LETT #3# 'T)))))))
                                                      (LETT |i| (|inc_SI| |i|))
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (COND (#3# #4#)
                                                       ('T
                                                        (|spadConstant| $
                                                                        71))))
                                                (SPADCALL |x| (QREFELT $ 88))
                                                (QREFELT $ 108))))
                                   (GO #10=#:G884)))
                                 ('T (|error| "bad order of factorials"))))
                          (GO #11=#:G881)))))))
                    #11# (EXIT #1#))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 2 'T))))
            #9# (EXIT #8#)))
          #10# (EXIT #2#)))) 

(SDEFUN |EFSTRUC;normalize;LLL;57|
        ((|lf| |List| F) (|lx| |List| (|Symbol|)) ($ |List| F))
        (SPROG ((|lf2| (|List| F)) (#1=#:G895 NIL) (|f| NIL) (#2=#:G894 NIL))
               (SEQ
                (LETT |lf2|
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |f| (QREFELT $ 23)) #2#))))
                            (LETT #1# (CDR #1#)) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))
                (EXIT (QVELT (SPADCALL |lf2| |lx| (QREFELT $ 176)) 0))))) 

(DECLAIM (NOTINLINE |ElementaryFunctionStructurePackage;|)) 

(DEFUN |ElementaryFunctionStructurePackage| (&REST #1=#:G896)
  (SPROG NIL
         (PROG (#2=#:G897)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunctionStructurePackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |ElementaryFunctionStructurePackage;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ElementaryFunctionStructurePackage|)))))))))) 

(DEFUN |ElementaryFunctionStructurePackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ElementaryFunctionStructurePackage| DV$1 DV$2))
          (LETT $ (GETREFV 199))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
            (QSETREFV $ 50
                      (CONS (|dispatchFunction| |EFSTRUC;tanQ;F2F;11|) $)))
           ('T
            (QSETREFV $ 50
                      (CONS (|dispatchFunction| |EFSTRUC;tanQ;F2F;12|) $))))
          (QSETREFV $ 72 '|%alg|)
          (QSETREFV $ 127
                    (SPADCALL (SPADCALL '|%iint| (QREFELT $ 124))
                              (QREFELT $ 126)))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (QSETREFV $ 191
                       (CONS (|dispatchFunction| |EFSTRUC;irootDep;KU;48|)
                             $))))
           ('T
            (QSETREFV $ 191
                      (CONS (|dispatchFunction| |EFSTRUC;irootDep;KU;49|) $))))
          (COND
           ((|HasCategory| |#2| '(|CombinatorialOpsCategory|))
            (PROGN
             (QSETREFV $ 193
                       (CONS (|dispatchFunction| |EFSTRUC;normalize;LLL;55|)
                             $))))
           ('T
            (QSETREFV $ 193
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
              (|Mapping| 27 29) (|List| 29) (57 . |select|) (|Fraction| 12)
              (63 . |denom|) (|SparseUnivariatePolynomial| 7)
              (|PositiveInteger|) (|TangentExpansions| 7) (68 . |tanAn|)
              (|SparseUnivariatePolynomial| $) (74 . |zeroOf|)
              (|AlgebraicManipulations| 6 7) (79 . |rootSimp|) (84 . |numer|)
              (89 . |tanNa|) (95 . |tanQ|) (|Union| 12 '#1="failed")
              (101 . |retractIfCan|) (106 . |tanSum|) (111 . |inv|)
              (116 . |tan|) (121 . |Zero|) (125 . |differentiate|) (|Vector| 7)
              (131 . |setelt!|) (138 . |elt|) (|OutputForm|) (144 . |coerce|)
              (|Void|) (149 . |print|) (|Matrix| 7) (154 . |setelt!|)
              (|Union| 106 '"failed") (|IntegerLinearDependence| 7)
              (162 . |particularSolutionOverQ|) (168 . |One|) (172 . |One|)
              'ALGOP (|BasicOperator|) (176 . |operator|) (181 . |has?|)
              (187 . |elt|) (|Union| 38 '#1#) (193 . |retractIfCan|)
              (198 . |One|) (|List| 87) (202 . |kernels|) (207 . =) (213 . -)
              (|List| 38) (|MultiplicativeDependence|) (218 . |logDependenceQ|)
              (|Kernel| $) (224 . |coerce|) (229 . |log|)
              (|Union| 95 '"failed") (|Expression| 6) (|Numeric| 6)
              (234 . |numericIfCan|) (|NonNegativeInteger|) (|Float|)
              (240 . |rationalApproximation|) (246 . |Zero|) (250 . |coerce|)
              (255 . /) (261 . |float|) (268 . -) (274 . |abs|) (279 . >)
              (285 . >) (291 . ^) (|Vector| 38) (297 . |zero|) (302 . *)
              (308 . |new|) (312 . |kernel|) (|List| $) (317 . |eval|)
              (324 . |atan|) (329 . ~=) (335 . |coerce|) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 29)
              (|PolynomialCategoryLifting| (|IndexedExponents| 29) 29 6 117 7)
              (340 . |map|) (|SparseMultivariatePolynomial| 6 87)
              (347 . |numer|) (352 . |denom|) (|CommonOperators|)
              (357 . |operator|) (|LiouvillianFunction| 6 7) (362 . |operator|)
              '|opint| (367 . |is?|) (373 . |zero?|) (378 . |last|)
              (383 . |exp|) (388 . ^) (394 . -) (400 . |sqrt|) (405 . +)
              (411 . *) (417 . |One|) (421 . |elt|) (427 . |coerce|) (432 . D)
              (438 . |concat|) (444 . |kernel|) (450 . |name|)
              (455 . |minIndex|) (460 . |elt|) (466 . |retract|)
              (471 . |nthRoot|) (477 . |second|) (482 . |retract|) (487 . ~=)
              (493 . |coerce|) (498 . /) (504 . ^) (510 . *)
              (516 . |retractIfCan|) (521 . |height|) (526 . >)
              (|Union| $ '"failed") (532 . |recip|) (537 . |inv|) (542 . *)
              (548 . *) (554 . |every?|)
              (|Record| (|:| |num| (|Vector| 12)) (|:| |den| 12))
              (|InnerCommonDenominator| 12 38 (|Vector| 12) 106)
              (560 . |splitDenominator|) (565 . |lcm|) (570 . *)
              (576 . |coerce|) (581 . |tower|) (586 . |variables|)
              (591 . |setDifference|) (597 . |first|) (603 . |empty?|)
              (|Record| (|:| |funcs| 31) (|:| |kers| 36) (|:| |vals| 31))
              |EFSTRUC;rischNormalize;LLR;42| (608 . |concat|)
              (|Record| (|:| |func| 7) (|:| |kers| 36) (|:| |vals| 31))
              |EFSTRUC;rischNormalize;FLR;43| |EFSTRUC;rischNormalize;FSR;44|
              (614 . |tower|) |EFSTRUC;rootNormalize;FKF;45|
              (619 . |construct|) (624 . |particularSolutionOverQ|)
              (|Union| 7 '#2="failed") |EFSTRUC;validExponential;LFSU;47|
              (|Record| (|:| |exponent| 94) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 29) 29 6 117 7)
              (630 . |froot|)
              (|Union| (|:| |vec| 106) (|:| |func| 7) (|:| |fail| 27))
              (636 . |irootDep|) (641 . |lcm|) (647 . |normalize|)
              |EFSTRUC;normalize;2F;52| |EFSTRUC;normalize;2L;53|
              |EFSTRUC;normalize;FSF;54| (653 . |factorials|)
              (658 . |factorial|))
           '#(|validExponential| 663 |tanQ| 670 |rootNormalize| 676 |rmap| 682
              |rischNormalize| 688 |realLiouvillian| 706 |realElementary| 717
              |normalize| 728 |irootDep| 750)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|normalize| (|#2| |#2|)) T)
                                   '((|normalize|
                                      ((|List| |#2|) (|List| |#2|)))
                                     T)
                                   '((|normalize| (|#2| |#2| (|Symbol|))) T)
                                   '((|normalize|
                                      ((|List| |#2|) (|List| |#2|)
                                       (|List| (|Symbol|))))
                                     T)
                                   '((|rischNormalize|
                                      ((|Record| (|:| |func| |#2|)
                                                 (|:| |kers|
                                                      (|List| (|Kernel| |#2|)))
                                                 (|:| |vals| (|List| |#2|)))
                                       |#2| (|Symbol|)))
                                     T)
                                   '((|rischNormalize|
                                      ((|Record| (|:| |func| |#2|)
                                                 (|:| |kers|
                                                      (|List| (|Kernel| |#2|)))
                                                 (|:| |vals| (|List| |#2|)))
                                       |#2| (|List| (|Symbol|))))
                                     T)
                                   '((|rischNormalize|
                                      ((|Record| (|:| |funcs| (|List| |#2|))
                                                 (|:| |kers|
                                                      (|List| (|Kernel| |#2|)))
                                                 (|:| |vals| (|List| |#2|)))
                                       (|List| |#2|) (|List| (|Symbol|))))
                                     T)
                                   '((|realElementary| (|#2| |#2|)) T)
                                   '((|realLiouvillian| (|#2| |#2|)) T)
                                   '((|realLiouvillian| (|#2| |#2| (|Symbol|)))
                                     T)
                                   '((|realElementary| (|#2| |#2| (|Symbol|)))
                                     T)
                                   '((|validExponential|
                                      ((|Union| |#2| #2#)
                                       (|List| (|Kernel| |#2|)) |#2|
                                       (|Symbol|)))
                                     T)
                                   '((|rootNormalize|
                                      (|#2| |#2| (|Kernel| |#2|)))
                                     T)
                                   '((|rmap|
                                      (|#2| (|Mapping| |#2| (|Kernel| |#2|))
                                       |#2|))
                                     T)
                                   '((|tanQ|
                                      (|#2| (|Fraction| (|Integer|)) |#2|))
                                     T)
                                   '((|irootDep|
                                      ((|Union|
                                        (|:| |vec|
                                             (|Vector|
                                              (|Fraction| (|Integer|))))
                                        (|:| |func| |#2|)
                                        (|:| |fail| (|Boolean|)))
                                       (|Kernel| |#2|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 198
                                            '(0 7 0 11 1 7 0 12 13 1 7 0 0 14 2
                                              7 0 0 0 15 1 7 21 0 22 0 7 0 26 2
                                              7 27 0 0 28 2 29 27 0 19 30 1 29
                                              31 0 32 1 31 7 0 33 2 7 27 0 0 34
                                              2 36 0 35 0 37 1 38 12 0 39 2 42
                                              40 7 41 43 1 7 0 44 45 1 46 7 7
                                              47 1 38 12 0 48 2 42 7 7 12 49 2
                                              0 7 38 7 50 1 7 51 0 52 1 42 7 31
                                              53 1 7 0 0 54 1 7 0 0 55 0 6 0 56
                                              2 7 0 0 19 57 3 58 7 0 12 7 59 2
                                              58 7 0 12 60 1 7 61 0 62 1 61 63
                                              0 64 4 65 7 0 12 12 7 66 2 68 67
                                              65 58 69 0 6 0 70 0 7 0 71 1 29
                                              73 0 74 2 73 27 0 19 75 2 31 7 0
                                              12 76 1 7 77 0 78 0 38 0 79 1 7
                                              80 0 81 2 38 27 0 0 82 1 38 0 0
                                              83 2 85 67 84 38 86 1 7 0 87 88 1
                                              7 0 0 89 2 92 90 91 41 93 2 95 38
                                              0 94 96 0 38 0 97 1 95 0 38 98 2
                                              95 0 0 0 99 3 95 0 12 12 41 100 2
                                              95 0 0 0 101 1 95 0 0 102 2 95 27
                                              0 0 103 2 12 27 0 0 104 2 7 0 0
                                              12 105 1 106 0 94 107 2 7 0 0 0
                                              108 0 19 0 109 1 29 0 19 110 3 7
                                              0 0 80 111 112 1 7 0 0 113 2 29
                                              27 0 0 114 1 7 0 6 115 3 118 7 17
                                              116 117 119 1 7 120 0 121 1 7 120
                                              0 122 1 123 73 19 124 1 125 73 73
                                              126 2 73 27 0 19 128 1 7 27 0 129
                                              1 31 7 0 130 1 7 0 0 131 2 7 0 0
                                              41 132 2 7 0 0 0 133 1 7 0 0 134
                                              2 7 0 0 0 135 2 7 0 41 0 136 0
                                              117 0 137 2 7 0 73 111 138 1 7 0
                                              19 139 2 7 0 0 19 140 2 31 0 0 0
                                              141 2 7 0 73 111 142 1 73 19 0
                                              143 1 106 12 0 144 2 106 38 0 12
                                              145 1 38 12 0 146 2 7 0 0 12 147
                                              1 31 7 0 148 1 7 12 0 149 2 12 27
                                              0 0 150 1 38 0 12 151 2 38 0 0 0
                                              152 2 7 0 0 38 153 2 7 0 38 0 154
                                              1 38 51 0 155 1 29 94 0 156 2 94
                                              27 0 0 157 1 38 158 0 159 1 38 0
                                              0 160 2 7 0 12 0 161 2 38 0 0 12
                                              162 2 36 27 35 0 163 1 165 164
                                              106 166 1 12 0 111 167 2 38 0 12
                                              0 168 1 6 0 12 169 1 7 80 111 170
                                              1 7 21 111 171 2 21 0 0 0 172 2
                                              36 0 0 94 173 1 106 27 0 174 2 36
                                              0 0 0 177 1 7 80 0 181 1 58 0 31
                                              183 2 68 67 58 7 184 2 188 187 7
                                              94 189 1 0 190 29 191 2 12 0 0 0
                                              192 2 0 31 31 21 193 1 7 0 0 197
                                              1 12 0 0 198 3 0 185 36 7 19 186
                                              2 0 7 38 7 50 2 0 7 7 29 182 2 0
                                              7 17 7 18 2 0 178 7 21 179 2 0
                                              178 7 19 180 2 0 175 31 21 176 2
                                              0 7 7 19 25 1 0 7 7 24 1 0 7 7 23
                                              2 0 7 7 19 20 1 0 31 31 195 1 0 7
                                              7 194 2 0 31 31 21 193 2 0 7 7 19
                                              196 1 0 190 29 191)))))
           '|lookupComplete|)) 
