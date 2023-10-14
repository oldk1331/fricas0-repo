
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
        (SPROG ((|func| (F)) (#1=#:G228 NIL) (|k| NIL) (#2=#:G227 NIL))
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
        (SPROG ((|func| (F)) (#1=#:G232 NIL) (|k| NIL) (#2=#:G231 NIL))
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
        (SPROG ((|func| (F)) (#1=#:G236 NIL) (|k| NIL) (#2=#:G235 NIL))
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
        (SPROG ((|func| (F)) (#1=#:G240 NIL) (|k| NIL) (#2=#:G239 NIL))
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

(SDEFUN |EFSTRUC;rtNormalize| ((|f| F) ($ F))
        (QVELT (|EFSTRUC;rootNormalize0| |f| $) 0)) 

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

(SDEFUN |EFSTRUC;tanQ;F2F;12| ((|c| |Fraction| (|Integer|)) (|x| F) ($ F))
        (SPROG ((#1=#:G247 NIL))
               (SPADCALL
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
                 (QREFELT $ 48))
                (SPADCALL |c| (QREFELT $ 49)) (QREFELT $ 50)))) 

(SDEFUN |EFSTRUC;tanQ;F2F;13| ((|c| |Fraction| (|Integer|)) (|x| F) ($ F))
        (SPROG ((#1=#:G250 NIL))
               (SPADCALL
                (SPADCALL
                 (SPADCALL |x|
                           (PROG1
                               (LETT #1# (SPADCALL |c| (QREFELT $ 40))
                                     |EFSTRUC;tanQ;F2F;13|)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 44))
                 (QREFELT $ 46))
                (SPADCALL |c| (QREFELT $ 49)) (QREFELT $ 50)))) 

(SDEFUN |EFSTRUC;tanSum| ((|c| F) (|l| |List| F) ($ F))
        (SPROG ((#1=#:G259 NIL) (|r| (|Union| (|Integer|) "failed")) (|k| (F)))
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
                             (GO #3=#:G257))))))))
                  (EXIT
                   (SPADCALL (CONS (SPADCALL |c| (QREFELT $ 56)) |l|)
                             (QREFELT $ 54)))))
                #3# (EXIT #1#)))) 

(SDEFUN |EFSTRUC;rootNormalize0|
        ((|f| F)
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPROG
         ((#1=#:G273 NIL) (#2=#:G274 NIL)
          (|rn|
           (|Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (|rec|
           (|Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (|u|
           (|Union|
            (|Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
                      (|:| |vals| (|List| F)))
            "failed"))
          (|i| NIL) (#3=#:G275 NIL) (|kk| NIL) (|n| (|Integer|))
          (|ker| (|List| (|Kernel| F))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ker|
                  (SPADCALL (CONS #'|EFSTRUC;rootNormalize0!0| $)
                            (SPADCALL |f| (QREFELT $ 59)) (QREFELT $ 60))
                  . #4=(|EFSTRUC;rootNormalize0|))
            (EXIT
             (COND ((NULL |ker|) (VECTOR |f| NIL NIL))
                   (#5='T
                    (SEQ (LETT |n| (- (LENGTH |ker|) 1) . #4#)
                         (EXIT
                          (COND ((< |n| 1) (VECTOR |f| NIL NIL))
                                (#5#
                                 (SEQ
                                  (SEQ
                                   (EXIT
                                    (SEQ (LETT |kk| NIL . #4#)
                                         (LETT #3# (CDR |ker|) . #4#)
                                         (LETT |i| 1 . #4#) G190
                                         (COND
                                          ((OR (|greater_SI| |i| |n|)
                                               (ATOM #3#)
                                               (PROGN
                                                (LETT |kk| (CAR #3#) . #4#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |u|
                                                (|EFSTRUC;rootKernelNormalize|
                                                 |f|
                                                 (SPADCALL |ker| |i|
                                                           (QREFELT $ 64))
                                                 |kk| $)
                                                . #4#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |u| 0)
                                             (PROGN
                                              (LETT #1#
                                                    (SEQ
                                                     (LETT |rec| (QCDR |u|)
                                                           . #4#)
                                                     (LETT |rn|
                                                           (|EFSTRUC;rootNormalize0|
                                                            (QVELT |rec| 0) $)
                                                           . #4#)
                                                     (EXIT
                                                      (PROGN
                                                       (LETT #2#
                                                             (VECTOR
                                                              (QVELT |rn| 0)
                                                              (SPADCALL
                                                               (QVELT |rec| 1)
                                                               (QVELT |rn| 1)
                                                               (QREFELT $ 65))
                                                              (SPADCALL
                                                               (QVELT |rec| 2)
                                                               (QVELT |rn| 2)
                                                               (QREFELT $ 66)))
                                                             . #4#)
                                                       (GO #6=#:G272))))
                                                    . #4#)
                                              (GO #7=#:G268))))))
                                         (LETT |i|
                                               (PROG1 (|inc_SI| |i|)
                                                 (LETT #3# (CDR #3#) . #4#))
                                               . #4#)
                                         (GO G190) G191 (EXIT NIL)))
                                   #7# (EXIT #1#))
                                  (EXIT (VECTOR |f| NIL NIL))))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |EFSTRUC;rootNormalize0!0| ((|x| NIL) ($ NIL))
        (COND
         ((SPADCALL |x| '|nthRoot| (QREFELT $ 30))
          (SPADCALL
           (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 33))
                     (QREFELT $ 22))
           (QREFELT $ 57)))
         ('T (|spadConstant| $ 35)))) 

(SDEFUN |EFSTRUC;findQRelation|
        ((|lv| . #1=(|List| (|Symbol|))) (|lpar| |List| (|Symbol|))
         (|lk| |List| F) (|ker| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|u| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|j| NIL) (#2=#:G296 NIL) (|k| NIL) (|i| NIL) (#3=#:G295 NIL)
          (|var| NIL) (|mat| (|Matrix| F)) (|isconstant| (|Boolean|))
          (#4=#:G294 NIL) (|v| (|Vector| F)) (|lvv| #1#)
          (|m| (|NonNegativeInteger|)) (#5=#:G293 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |lk|) (CONS 2 'T))
                (#6='T
                 (SEQ (LETT |isconstant| 'T . #7=(|EFSTRUC;findQRelation|))
                      (LETT |m| (LENGTH |lv|) . #7#) (LETT |lvv| |lv| . #7#)
                      (LETT |n| (LENGTH |lk|) . #7#)
                      (LETT |v| (MAKEARR1 |m| (|spadConstant| $ 26)) . #7#)
                      (SEQ (LETT |var| NIL . #7#) (LETT #5# |lv| . #7#)
                           (LETT |i| 1 . #7#) G190
                           (COND
                            ((OR (|greater_SI| |i| |m|) (ATOM #5#)
                                 (PROGN (LETT |var| (CAR #5#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (SPADCALL |v| |i|
                                      (SPADCALL |ker| |var| (QREFELT $ 68))
                                      (QREFELT $ 70))
                            (EXIT
                             (COND
                              (|isconstant|
                               (LETT |isconstant|
                                     (SPADCALL
                                      (SPADCALL |v| |i| (QREFELT $ 71))
                                      (|spadConstant| $ 26) (QREFELT $ 34))
                                     . #7#)))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|)
                                   (LETT #5# (CDR #5#) . #7#))
                                 . #7#)
                           (GO G190) G191 (EXIT NIL))
                      (COND
                       (|isconstant|
                        (SEQ (LETT |m| (LENGTH |lpar|) . #7#)
                             (LETT |lvv| |lpar| . #7#)
                             (LETT |v| (MAKEARR1 |m| (|spadConstant| $ 26))
                                   . #7#)
                             (EXIT
                              (SEQ (LETT |var| NIL . #7#)
                                   (LETT #4# |lpar| . #7#) (LETT |i| 1 . #7#)
                                   G190
                                   (COND
                                    ((OR (|greater_SI| |i| |m|) (ATOM #4#)
                                         (PROGN
                                          (LETT |var| (CAR #4#) . #7#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |v| |i|
                                              (SPADCALL |ker| |var|
                                                        (QREFELT $ 68))
                                              (QREFELT $ 70))
                                    (EXIT
                                     (COND
                                      (|isconstant|
                                       (LETT |isconstant|
                                             (SPADCALL
                                              (SPADCALL |v| |i| (QREFELT $ 71))
                                              (|spadConstant| $ 26)
                                              (QREFELT $ 34))
                                             . #7#)))))
                                   (LETT |i|
                                         (PROG1 (|inc_SI| |i|)
                                           (LETT #4# (CDR #4#) . #7#))
                                         . #7#)
                                   (GO G190) G191 (EXIT NIL))))))
                      (EXIT
                       (COND
                        (|isconstant|
                         (SEQ
                          (SPADCALL (SPADCALL |ker| (QREFELT $ 73))
                                    (QREFELT $ 75))
                          (EXIT (|error| "Hidden constant detected"))))
                        (#6#
                         (SEQ
                          (LETT |mat|
                                (MAKE_MATRIX1 |m| |n| (|spadConstant| $ 26))
                                . #7#)
                          (SEQ (LETT |var| NIL . #7#) (LETT #3# |lvv| . #7#)
                               (LETT |i| 1 . #7#) G190
                               (COND
                                ((OR (|greater_SI| |i| |m|) (ATOM #3#)
                                     (PROGN (LETT |var| (CAR #3#) . #7#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |k| NIL . #7#)
                                      (LETT #2# |lk| . #7#) (LETT |j| 1 . #7#)
                                      G190
                                      (COND
                                       ((OR (|greater_SI| |j| |n|) (ATOM #2#)
                                            (PROGN
                                             (LETT |k| (CAR #2#) . #7#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |mat| |i| |j|
                                                  (SPADCALL |k| |var|
                                                            (QREFELT $ 68))
                                                  (QREFELT $ 77))))
                                      (LETT |j|
                                            (PROG1 (|inc_SI| |j|)
                                              (LETT #2# (CDR #2#) . #7#))
                                            . #7#)
                                      (GO G190) G191 (EXIT NIL))))
                               (LETT |i|
                                     (PROG1 (|inc_SI| |i|)
                                       (LETT #3# (CDR #3#) . #7#))
                                     . #7#)
                               (GO G190) G191 (EXIT NIL))
                          (LETT |u| (SPADCALL |mat| |v| (QREFELT $ 80)) . #7#)
                          (EXIT
                           (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                                 (#6# (CONS 2 'T)))))))))))))) 

(SDEFUN |EFSTRUC;findLinearRelation1|
        ((|lk| |List| F) (|ker| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|u| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|j| NIL) (#1=#:G304 NIL) (|k| NIL) (|v| (|Vector| F))
          (|mat| (|Matrix| F)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |lk|) (CONS 2 'T))
                (#2='T
                 (SEQ
                  (LETT |n| (LENGTH |lk|) . #3=(|EFSTRUC;findLinearRelation1|))
                  (LETT |mat| (MAKE_MATRIX1 1 |n| (|spadConstant| $ 26)) . #3#)
                  (LETT |v| (MAKEARR1 1 |ker|) . #3#)
                  (SEQ (LETT |k| NIL . #3#) (LETT #1# |lk| . #3#)
                       (LETT |j| 1 . #3#) G190
                       (COND
                        ((OR (|greater_SI| |j| |n|) (ATOM #1#)
                             (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |k| (QREFELT $ 22)))
                           (SPADCALL |mat| 1 |j| |k| (QREFELT $ 77)))
                          ('T
                           (SPADCALL |mat| 1 |j| (|spadConstant| $ 26)
                                     (QREFELT $ 77))))))
                       (LETT |j|
                             (PROG1 (|inc_SI| |j|) (LETT #1# (CDR #1#) . #3#))
                             . #3#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |u| (SPADCALL |mat| |v| (QREFELT $ 80)) . #3#)
                  (EXIT
                   (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                         (#2# (CONS 2 'T)))))))))) 

(SDEFUN |EFSTRUC;transkers| ((|x| |List| (|Kernel| F)) ($ |List| (|Kernel| F)))
        (SPROG ((#1=#:G309 NIL) (|k| NIL) (#2=#:G308 NIL))
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
                           ((SPADCALL (SPADCALL |k| (QREFELT $ 84))
                                      (QREFELT $ 82) (QREFELT $ 85))
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
                                      (QREFELT $ 86))
                            . #1=(|EFSTRUC;ktoQ|))
                      (LETT |qu| (SPADCALL |z| (QREFELT $ 88)) . #1#)
                      (EXIT
                       (COND ((QEQCAR |qu| 0) (QCDR |qu|))
                             ('T (|spadConstant| $ 81))))))))))
                (EXIT (|spadConstant| $ 81))))) 

(SDEFUN |EFSTRUC;toQ|
        ((|lk| |List| (|Kernel| F)) ($ |List| (|Fraction| (|Integer|))))
        (SPROG ((#1=#:G321 NIL) (|k| NIL) (#2=#:G320 NIL))
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
         ((|nz| (F)) (|ly| (|List| F)) (#1=#:G362 NIL) (|x| NIL)
          (#2=#:G361 NIL) (#3=#:G360 NIL) (#4=#:G359 NIL)
          (|lpars1f| (|List| F)) (#5=#:G358 NIL) (|s| NIL) (#6=#:G357 NIL)
          (|lpars1| (|List| (|Symbol|))) (#7=#:G356 NIL) (|k| NIL)
          (#8=#:G355 NIL) (|lpars0| #9=(|List| (|Kernel| F))) (#10=#:G353 NIL)
          (|vv| (|Vector| (|Fraction| (|Integer|)))) (|lz1tonq| (F))
          (|kertond| (F)) (|nd| (|Integer|)) (|nq| (|Integer|))
          (|qratio| (|Fraction| (|Integer|)))
          (|fratio| (|Union| (|Float|) "failed")) (|Fratio| (F))
          (#11=#:G354 NIL) (|z1| NIL) (|i| NIL) (|m| (|NonNegativeInteger|))
          (|kerF| (F))
          (|u| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|q| (|Fraction| (|Integer|))) (|zkers| #9#) (|z| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |z|
                  (SPADCALL (SPADCALL |ker| (QREFELT $ 32)) 1 (QREFELT $ 86))
                  . #12=(|EFSTRUC;findLinearRelation2|))
            (LETT |zkers| (|EFSTRUC;transkers| (SPADCALL |z| (QREFELT $ 89)) $)
                  . #12#)
            (EXIT
             (COND
              ((NULL |zkers|)
               (SEQ (LETT |q| (|EFSTRUC;ktoQ| |ker| $) . #12#)
                    (COND
                     ((NULL
                       (SPADCALL |q| (|spadConstant| $ 81) (QREFELT $ 90)))
                      (COND
                       ((NULL
                         (SPADCALL |q|
                                   (SPADCALL (|spadConstant| $ 81)
                                             (QREFELT $ 91))
                                   (QREFELT $ 90)))
                        (EXIT
                         (SEQ
                          (LETT |u|
                                (SPADCALL (|EFSTRUC;toQ| |lk| $) |q|
                                          (QREFELT $ 94))
                                . #12#)
                          (EXIT
                           (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                                 (#13='T (CONS 2 'T))))))))))
                    (LETT |kerF| (SPADCALL |ker| (QREFELT $ 96)) . #12#)
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
                             (SEQ (LETT |m| (LENGTH |lz|) . #12#)
                                  (SEQ (LETT |i| 1 . #12#)
                                       (LETT |z1| NIL . #12#)
                                       (LETT #11# |lz| . #12#) G190
                                       (COND
                                        ((OR (ATOM #11#)
                                             (PROGN
                                              (LETT |z1| (CAR #11#) . #12#)
                                              NIL)
                                             (|greater_SI| |i| |m|))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |Fratio|
                                              (SPADCALL |kerF|
                                                        (SPADCALL |z1|
                                                                  (QREFELT $
                                                                           97))
                                                        (QREFELT $ 15))
                                              . #12#)
                                        (LETT |fratio|
                                              (SPADCALL |Fratio| 20
                                                        (QREFELT $ 101))
                                              . #12#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |fratio| 0)
                                           (SEQ
                                            (LETT |qratio|
                                                  (SPADCALL (QCDR |fratio|) 8
                                                            (QREFELT $ 103))
                                                  . #12#)
                                            (COND
                                             ((OR
                                               (SPADCALL |qratio|
                                                         (|spadConstant| $ 104)
                                                         (QREFELT $ 90))
                                               (OR
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QCDR |fratio|)
                                                             (SPADCALL |qratio|
                                                                       (QREFELT
                                                                        $ 105))
                                                             (QREFELT $ 106))
                                                   (SPADCALL 1 0 10
                                                             (QREFELT $ 107))
                                                   (QREFELT $ 108))
                                                  (QREFELT $ 109))
                                                 (SPADCALL 1 -16 10
                                                           (QREFELT $ 107))
                                                 (QREFELT $ 110))
                                                (OR
                                                 (SPADCALL
                                                  (ABS
                                                   (LETT |nq|
                                                         (SPADCALL |qratio|
                                                                   (QREFELT $
                                                                            49))
                                                         . #12#))
                                                  100 (QREFELT $ 111))
                                                 (SPADCALL
                                                  (ABS
                                                   (LETT |nd|
                                                         (SPADCALL |qratio|
                                                                   (QREFELT $
                                                                            40))
                                                         . #12#))
                                                  100 (QREFELT $ 111)))))
                                              (EXIT "iterate")))
                                            (LETT |kertond|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |ker|
                                                              (QREFELT $ 32))
                                                    1 (QREFELT $ 86))
                                                   |nd| (QREFELT $ 112))
                                                  . #12#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL |nq| 0
                                                         (QREFELT $ 111))
                                               (SEQ
                                                (LETT |lz1tonq|
                                                      (SPADCALL |z1| |nq|
                                                                (QREFELT $
                                                                         112))
                                                      . #12#)
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL |kertond|
                                                             |lz1tonq|
                                                             (QREFELT $ 34))
                                                   (SEQ
                                                    (LETT |vv|
                                                          (SPADCALL |m|
                                                                    (QREFELT $
                                                                             114))
                                                          . #12#)
                                                    (QSETAREF1O |vv| |i|
                                                                |qratio| 1)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #10# (CONS 0 |vv|)
                                                            . #12#)
                                                      (GO #14=#:G352)))))))))
                                              ('T
                                               (SEQ
                                                (LETT |lz1tonq|
                                                      (SPADCALL |z1| (- |nq|)
                                                                (QREFELT $
                                                                         112))
                                                      . #12#)
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL
                                                    (SPADCALL |kertond|
                                                              |lz1tonq|
                                                              (QREFELT $ 115))
                                                    (|spadConstant| $ 62)
                                                    (QREFELT $ 34))
                                                   (SEQ
                                                    (LETT |vv|
                                                          (SPADCALL |m|
                                                                    (QREFELT $
                                                                             114))
                                                          . #12#)
                                                    (QSETAREF1O |vv| |i|
                                                                |qratio| 1)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #10# (CONS 0 |vv|)
                                                            . #12#)
                                                      (GO #14#))))))))))))))))
                                       (LETT #11#
                                             (PROG1 (CDR #11#)
                                               (LETT |i| (|inc_SI| |i|)
                                                     . #12#))
                                             . #12#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT (CONS 2 'T))))))))))))
                    (EXIT (CONS 2 'T))))
              (#13#
               (SEQ (LETT |lpars0| (|EFSTRUC;transkers| |lk| $) . #12#)
                    (LETT |lpars1|
                          (PROGN
                           (LETT #8# NIL . #12#)
                           (SEQ (LETT |k| NIL . #12#)
                                (LETT #7# |lpars0| . #12#) G190
                                (COND
                                 ((OR (ATOM #7#)
                                      (PROGN (LETT |k| (CAR #7#) . #12#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #8#
                                        (CONS (SPADCALL (QREFELT $ 116)) #8#)
                                        . #12#)))
                                (LETT #7# (CDR #7#) . #12#) (GO G190) G191
                                (EXIT (NREVERSE #8#))))
                          . #12#)
                    (LETT |lpars1f|
                          (PROGN
                           (LETT #6# NIL . #12#)
                           (SEQ (LETT |s| NIL . #12#)
                                (LETT #5# |lpars1| . #12#) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |s| (CAR #5#) . #12#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |s| (QREFELT $ 117))
                                          (QREFELT $ 96))
                                         #6#)
                                        . #12#)))
                                (LETT #5# (CDR #5#) . #12#) (GO G190) G191
                                (EXIT (NREVERSE #6#))))
                          . #12#)
                    (COND
                     ((SPADCALL |ker| '|log| (QREFELT $ 30))
                      (SEQ
                       (LETT |ly|
                             (PROGN
                              (LETT #4# NIL . #12#)
                              (SEQ (LETT |x| NIL . #12#) (LETT #3# |lz| . #12#)
                                   G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN
                                          (LETT |x| (CAR #3#) . #12#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |x| |lpars0| |lpars1f|
                                                       (QREFELT $ 119))
                                             (QREFELT $ 97))
                                            #4#)
                                           . #12#)))
                                   (LETT #3# (CDR #3#) . #12#) (GO G190) G191
                                   (EXIT (NREVERSE #4#))))
                             . #12#)
                       (EXIT
                        (LETT |nz|
                              (SPADCALL
                               (SPADCALL |z| |lpars0| |lpars1f|
                                         (QREFELT $ 119))
                               (QREFELT $ 97))
                              . #12#))))
                     ((NULL (SPADCALL |ker| '|atan| (QREFELT $ 30)))
                      (|error|
                       "findLinearRelation2: kernel should be log or atan"))
                     ('T
                      (SEQ
                       (LETT |ly|
                             (PROGN
                              (LETT #2# NIL . #12#)
                              (SEQ (LETT |x| NIL . #12#) (LETT #1# |lz| . #12#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |x| (CAR #1#) . #12#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |x| |lpars0| |lpars1f|
                                                       (QREFELT $ 119))
                                             (QREFELT $ 120))
                                            #2#)
                                           . #12#)))
                                   (LETT #1# (CDR #1#) . #12#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             . #12#)
                       (EXIT
                        (LETT |nz|
                              (SPADCALL
                               (SPADCALL |z| |lpars0| |lpars1f|
                                         (QREFELT $ 119))
                               (QREFELT $ 120))
                              . #12#)))))
                    (EXIT
                     (|EFSTRUC;findQRelation| NIL |lpars1| |ly| |nz| $))))))))
          #14# (EXIT #10#)))) 

(SDEFUN |EFSTRUC;findRelation|
        ((|lv| |List| (|Symbol|)) (|lpar| |List| (|Symbol|))
         (|lk| |List| (|Kernel| F)) (|ker| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG ((#1=#:G382 NIL) (|x| NIL) (#2=#:G381 NIL))
               (SEQ
                (COND
                 ((OR (SPADCALL |ker| '|log| (QREFELT $ 30))
                      (SPADCALL |ker| '|exp| (QREFELT $ 30)))
                  (COND
                   ((NULL
                     (SPADCALL (SPADCALL |ker| (QREFELT $ 96)) (QREFELT $ 22)))
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
                     (SPADCALL (SPADCALL |ker| (QREFELT $ 96)) (QREFELT $ 22)))
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
                                       (SPADCALL |x| |ker| (QREFELT $ 121)))
                                      (#3# 'NIL))
                                     (LETT #2# (CONS |x| #2#) . #4#)))))
                                 (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           |ker| $))))))
                     (EXIT (CONS 2 'T)))))))))) 

(SDEFUN |EFSTRUC;ktoY| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|log| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 96)))
         ((SPADCALL |k| '|exp| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;ktoZ| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|log| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ((SPADCALL |k| '|exp| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 96)))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;ktoU| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|atan| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 96)))
         ((SPADCALL |k| '|tan| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;ktoV| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|tan| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 96)))
         ((SPADCALL |k| '|atan| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;smp_map|
        ((|f| |Mapping| F (|Kernel| F))
         (|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPADCALL |f| (ELT $ 122) |p| (QREFELT $ 126))) 

(SDEFUN |EFSTRUC;rmap;M2F;28| ((|f| |Mapping| F (|Kernel| F)) (|e| F) ($ F))
        (SPADCALL (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 128)) $)
                  (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 129)) $)
                  (QREFELT $ 15))) 

(SDEFUN |EFSTRUC;k2Elem0|
        ((|k| |Kernel| F) (|op| |BasicOperator|) (|args| |List| F) ($ F))
        (SPROG ((|tz2| (F)) (|iez| (F)) (|ez| (F)) (|z| (F)))
               (SEQ (LETT |z| (|SPADfirst| |args|) . #1=(|EFSTRUC;k2Elem0|))
                    (EXIT
                     (COND
                      ((SPADCALL |op| '|%power| (QREFELT $ 135))
                       (COND
                        ((SPADCALL |z| (QREFELT $ 136)) (|spadConstant| $ 26))
                        (#2='T
                         (SPADCALL
                          (SPADCALL (SPADCALL |args| (QREFELT $ 137))
                                    (SPADCALL |z| (QREFELT $ 97))
                                    (QREFELT $ 115))
                          (QREFELT $ 138)))))
                      ((SPADCALL |op| '|cot| (QREFELT $ 135))
                       (SPADCALL (SPADCALL |z| (QREFELT $ 56)) (QREFELT $ 55)))
                      ((SPADCALL |op| '|acot| (QREFELT $ 135))
                       (SPADCALL (SPADCALL |z| (QREFELT $ 55))
                                 (QREFELT $ 120)))
                      ((SPADCALL |op| '|asin| (QREFELT $ 135))
                       (SPADCALL
                        (SPADCALL |z|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 62)
                                             (SPADCALL |z| 2 (QREFELT $ 139))
                                             (QREFELT $ 140))
                                   (QREFELT $ 141))
                                  (QREFELT $ 15))
                        (QREFELT $ 120)))
                      ((SPADCALL |op| '|acos| (QREFELT $ 135))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 62)
                                    (SPADCALL |z| 2 (QREFELT $ 139))
                                    (QREFELT $ 140))
                          (QREFELT $ 141))
                         |z| (QREFELT $ 15))
                        (QREFELT $ 120)))
                      ((SPADCALL |op| '|asec| (QREFELT $ 135))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |z| 2 (QREFELT $ 139))
                                   (|spadConstant| $ 62) (QREFELT $ 140))
                         (QREFELT $ 141))
                        (QREFELT $ 120)))
                      ((SPADCALL |op| '|acsc| (QREFELT $ 135))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| 2 (QREFELT $ 139))
                                    (|spadConstant| $ 62) (QREFELT $ 140))
                          (QREFELT $ 141))
                         (QREFELT $ 55))
                        (QREFELT $ 120)))
                      ((SPADCALL |op| '|asinh| (QREFELT $ 135))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 62)
                                    (SPADCALL |z| 2 (QREFELT $ 139))
                                    (QREFELT $ 142))
                          (QREFELT $ 141))
                         |z| (QREFELT $ 142))
                        (QREFELT $ 97)))
                      ((SPADCALL |op| '|acosh| (QREFELT $ 135))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| 2 (QREFELT $ 139))
                                    (|spadConstant| $ 62) (QREFELT $ 140))
                          (QREFELT $ 141))
                         |z| (QREFELT $ 142))
                        (QREFELT $ 97)))
                      ((SPADCALL |op| '|atanh| (QREFELT $ 135))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |z| (|spadConstant| $ 62) (QREFELT $ 142))
                          (SPADCALL (|spadConstant| $ 62) |z| (QREFELT $ 140))
                          (QREFELT $ 15))
                         (QREFELT $ 97))
                        (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                      ((SPADCALL |op| '|acoth| (QREFELT $ 135))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |z| (|spadConstant| $ 62) (QREFELT $ 142))
                          (SPADCALL |z| (|spadConstant| $ 62) (QREFELT $ 140))
                          (QREFELT $ 15))
                         (QREFELT $ 97))
                        (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                      ((SPADCALL |op| '|asech| (QREFELT $ 135))
                       (SPADCALL
                        (SPADCALL (SPADCALL |z| (QREFELT $ 55))
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |z| 2 (QREFELT $ 139))
                                              (QREFELT $ 55))
                                    (|spadConstant| $ 62) (QREFELT $ 140))
                                   (QREFELT $ 141))
                                  (QREFELT $ 142))
                        (QREFELT $ 97)))
                      ((SPADCALL |op| '|acsch| (QREFELT $ 135))
                       (SPADCALL
                        (SPADCALL (SPADCALL |z| (QREFELT $ 55))
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 62)
                                             (SPADCALL
                                              (SPADCALL |z| 2 (QREFELT $ 139))
                                              (QREFELT $ 55))
                                             (QREFELT $ 142))
                                   (QREFELT $ 141))
                                  (QREFELT $ 142))
                        (QREFELT $ 97)))
                      ((OR (SPADCALL |op| '|%paren| (QREFELT $ 135))
                           (SPADCALL |op| '|%box| (QREFELT $ 135)))
                       (COND ((NULL (CDR |args|)) |z|)
                             (#2# (SPADCALL |k| (QREFELT $ 96)))))
                      ('T
                       (SEQ
                        (COND
                         ((SPADCALL |op| (QREFELT $ 8) (QREFELT $ 85))
                          (LETT |iez|
                                (SPADCALL
                                 (LETT |ez| (SPADCALL |z| (QREFELT $ 138))
                                       . #1#)
                                 (QREFELT $ 55))
                                . #1#)))
                        (EXIT
                         (COND
                          ((SPADCALL |op| '|sinh| (QREFELT $ 135))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 140))
                                     (SPADCALL 2 (QREFELT $ 13))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|cosh| (QREFELT $ 135))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 142))
                                     (SPADCALL 2 (QREFELT $ 13))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|tanh| (QREFELT $ 135))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 140))
                                     (SPADCALL |ez| |iez| (QREFELT $ 142))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|coth| (QREFELT $ 135))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 142))
                                     (SPADCALL |ez| |iez| (QREFELT $ 140))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|sech| (QREFELT $ 135))
                           (SPADCALL 2
                                     (SPADCALL
                                      (SPADCALL |ez| |iez| (QREFELT $ 142))
                                      (QREFELT $ 55))
                                     (QREFELT $ 143)))
                          ((SPADCALL |op| '|csch| (QREFELT $ 135))
                           (SPADCALL 2
                                     (SPADCALL
                                      (SPADCALL |ez| |iez| (QREFELT $ 140))
                                      (QREFELT $ 55))
                                     (QREFELT $ 143)))
                          (#2#
                           (SEQ
                            (COND
                             ((SPADCALL |op| (QREFELT $ 9) (QREFELT $ 85))
                              (LETT |tz2|
                                    (SPADCALL
                                     (SPADCALL |z| (SPADCALL 2 (QREFELT $ 13))
                                               (QREFELT $ 15))
                                     (QREFELT $ 56))
                                    . #1#)))
                            (EXIT
                             (COND
                              ((SPADCALL |op| '|sin| (QREFELT $ 135))
                               (SPADCALL (SPADCALL 2 |tz2| (QREFELT $ 143))
                                         (SPADCALL (|spadConstant| $ 62)
                                                   (SPADCALL |tz2| 2
                                                             (QREFELT $ 139))
                                                   (QREFELT $ 142))
                                         (QREFELT $ 15)))
                              ((SPADCALL |op| '|cos| (QREFELT $ 135))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 62)
                                          (SPADCALL |tz2| 2 (QREFELT $ 139))
                                          (QREFELT $ 140))
                                (SPADCALL (|spadConstant| $ 62)
                                          (SPADCALL |tz2| 2 (QREFELT $ 139))
                                          (QREFELT $ 142))
                                (QREFELT $ 15)))
                              ((SPADCALL |op| '|sec| (QREFELT $ 135))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 62)
                                          (SPADCALL |tz2| 2 (QREFELT $ 139))
                                          (QREFELT $ 142))
                                (SPADCALL (|spadConstant| $ 62)
                                          (SPADCALL |tz2| 2 (QREFELT $ 139))
                                          (QREFELT $ 140))
                                (QREFELT $ 15)))
                              ((SPADCALL |op| '|csc| (QREFELT $ 135))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 62)
                                          (SPADCALL |tz2| 2 (QREFELT $ 139))
                                          (QREFELT $ 142))
                                (SPADCALL 2 |tz2| (QREFELT $ 143))
                                (QREFELT $ 15)))
                              (#2#
                               (SPADCALL |op| |args|
                                         (QREFELT $ 145)))))))))))))))) 

(SDEFUN |EFSTRUC;do_int| ((|op| |BasicOperator|) (|args| |List| F) ($ F))
        (SPROG
         ((|dvs| (|List| F)) (#1=#:G441 NIL) (|v| NIL) (#2=#:G440 NIL)
          (|vfs| (|List| F)) (#3=#:G439 NIL) (#4=#:G438 NIL)
          (|vars| (|List| (|Symbol|))) (|kf1| (F)))
         (SEQ
          (LETT |kf1| (SPADCALL |op| |args| (QREFELT $ 145))
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
                        (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 146)) #4#)
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
                               (SPADCALL (SPADCALL |kf1| |v| (QREFELT $ 147))
                                         (QREFELT $ 24))
                               #2#)
                              . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #5#)
          (EXIT
           (SPADCALL (QREFELT $ 134) (SPADCALL |vfs| |dvs| (QREFELT $ 66))
                     (QREFELT $ 148)))))) 

(SDEFUN |EFSTRUC;k_to_liou| ((|k| |Kernel| F) ($ F))
        (SPROG
         ((#1=#:G456 NIL) (#2=#:G455 NIL) (|i| (|Integer|))
          (|iu| (|Union| (|Integer|) "failed")) (|nm| (|Symbol|))
          (|args| (|List| F)) (#3=#:G458 NIL) (|a| NIL) (#4=#:G457 NIL)
          (|op| (|BasicOperator|)))
         (SEQ
          (LETT |op| (SPADCALL |k| (QREFELT $ 84)) . #5=(|EFSTRUC;k_to_liou|))
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
           (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 96)))
                 ('T
                  (SEQ
                   (EXIT
                    (SEQ
                     (COND
                      ((SPADCALL |op| '|prim| (QREFELT $ 85))
                       (COND
                        ((NULL (SPADCALL |op| '|%iint| (QREFELT $ 135)))
                         (EXIT (|EFSTRUC;do_int| |op| |args| $))))))
                     (LETT |nm| (SPADCALL |op| (QREFELT $ 149)) . #5#)
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
                                            ((SPADCALL |i| 0 (QREFELT $ 111))
                                             (COND
                                              ((< |i| 10)
                                               (PROGN
                                                (LETT #2#
                                                      (|EFSTRUC;do_int| |op|
                                                       |args| $)
                                                      . #5#)
                                                (GO #6=#:G449))))))))
                                     (EXIT
                                      (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                                   #6# (EXIT #2#))
                                  . #5#)
                            (GO #7=#:G452))))))))
                     (EXIT (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                   #7# (EXIT #1#)))))))) 

(SDEFUN |EFSTRUC;do_int1|
        ((|op| |BasicOperator|) (|args| |List| F) (|x| . #1=(|Symbol|)) ($ F))
        (SPROG
         ((|dvs| (|List| F)) (#2=#:G466 NIL) (|v| NIL) (#3=#:G465 NIL)
          (|vfs| (|List| F)) (#4=#:G464 NIL) (#5=#:G463 NIL)
          (|vars| (|List| #1#)) (|kf1| (F)))
         (SEQ
          (LETT |kf1| (SPADCALL |op| |args| (QREFELT $ 145))
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
                        (LETT #5# (CONS (SPADCALL |v| (QREFELT $ 146)) #5#)
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
                               (SPADCALL (SPADCALL |kf1| |v| (QREFELT $ 147))
                                         |x| (QREFELT $ 25))
                               #3#)
                              . #6#)))
                      (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #6#)
          (EXIT
           (SPADCALL (QREFELT $ 134) (SPADCALL |vfs| |dvs| (QREFELT $ 66))
                     (QREFELT $ 148)))))) 

(SDEFUN |EFSTRUC;k_to_liou1| ((|k| |Kernel| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((#1=#:G490 NIL) (#2=#:G489 NIL) (|i| (|Integer|))
          (|iu| (|Union| (|Integer|) "failed")) (|nm| (|Symbol|))
          (|args| (|List| F)) (#3=#:G492 NIL) (|a| NIL) (#4=#:G491 NIL)
          (|op| (|BasicOperator|)))
         (SEQ
          (LETT |op| (SPADCALL |k| (QREFELT $ 84)) . #5=(|EFSTRUC;k_to_liou1|))
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
           (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 96)))
                 ('T
                  (SEQ
                   (EXIT
                    (SEQ
                     (COND
                      ((SPADCALL |op| '|prim| (QREFELT $ 85))
                       (COND
                        ((NULL (SPADCALL |op| '|%iint| (QREFELT $ 135)))
                         (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                     (LETT |nm| (SPADCALL |op| (QREFELT $ 149)) . #5#)
                     (COND
                      ((EQUAL |nm| '|Gamma2|)
                       (COND
                        ((SPADCALL
                          (SPADCALL (|SPADfirst| |args|) |x| (QREFELT $ 147))
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
                                            ((SPADCALL |i| 0 (QREFELT $ 111))
                                             (COND
                                              ((< |i| 10)
                                               (PROGN
                                                (LETT #2#
                                                      (|EFSTRUC;do_int| |op|
                                                       |args| $)
                                                      . #5#)
                                                (GO #6=#:G476))))))))
                                     (EXIT
                                      (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                                   #6# (EXIT #2#))
                                  . #5#)
                            (GO #7=#:G486))))))))
                     (COND
                      ((OR (EQUAL |nm| '|ellipticE2|)
                           (EQUAL |nm| '|ellipticF|))
                       (COND
                        ((SPADCALL
                          (SPADCALL (SPADCALL |args| 2 (QREFELT $ 86)) |x|
                                    (QREFELT $ 147))
                          (|spadConstant| $ 26) (QREFELT $ 34))
                         (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                     (COND
                      ((EQUAL |nm| '|ellipticPi|)
                       (COND
                        ((SPADCALL
                          (SPADCALL (SPADCALL |args| 2 (QREFELT $ 86)) |x|
                                    (QREFELT $ 147))
                          (|spadConstant| $ 26) (QREFELT $ 34))
                         (COND
                          ((SPADCALL
                            (SPADCALL (SPADCALL |args| 3 (QREFELT $ 86)) |x|
                                      (QREFELT $ 147))
                            (|spadConstant| $ 26) (QREFELT $ 34))
                           (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))))
                     (EXIT (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                   #7# (EXIT #1#)))))))) 

(SDEFUN |EFSTRUC;k2Elem| ((|k| |Kernel| F) (|l| |List| (|Symbol|)) ($ F))
        (SPROG
         ((|args| (|List| F)) (#1=#:G497 NIL) (|a| NIL) (#2=#:G496 NIL)
          (|op| (|BasicOperator|)))
         (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 84)) . #3=(|EFSTRUC;k2Elem|))
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
               (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 96)))
                     ('T (|EFSTRUC;k2Elem0| |k| |op| |args| $))))))) 

(SDEFUN |EFSTRUC;depeval|
        ((|f| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (COND
         ((SPADCALL |k| '|log| (QREFELT $ 30))
          (|EFSTRUC;logeval| |f| |lk| |k| |v| $))
         ((SPADCALL |k| '|exp| (QREFELT $ 30))
          (|EFSTRUC;expeval| |f| |lk| |k| |v| $))
         ((SPADCALL |k| '|tan| (QREFELT $ 30))
          (|EFSTRUC;taneval| |f| |lk| |k| |v| $))
         ((SPADCALL |k| '|atan| (QREFELT $ 30))
          (|EFSTRUC;ataneval| |f| |lk| |k| |v| $))
         ((SPADCALL |k| '|nthRoot| (QREFELT $ 30))
          (|EFSTRUC;rooteval| |f| |lk| |k|
           (SPADCALL |v| (SPADCALL |v| (QREFELT $ 150)) (QREFELT $ 151)) $))
         ('T (VECTOR |f| NIL NIL)))) 

(SDEFUN |EFSTRUC;rooteval|
        ((|f| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|n| |Fraction| (|Integer|))
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPROG
         ((|lv| (|List| F)) (#1=#:G513 NIL) (|r| NIL) (#2=#:G512 NIL)
          (|l| (|List| (|Kernel| F))) (#3=#:G511 NIL) (#4=#:G510 NIL)
          (|nv| (F)) (|m| (|Integer|)) (|x| (F)))
         (SEQ
          (LETT |nv|
                (SPADCALL
                 (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                       . #5=(|EFSTRUC;rooteval|))
                 (LETT |m| (SPADCALL |n| (QREFELT $ 152)) . #5#)
                 (QREFELT $ 153))
                . #5#)
          (LETT |l|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |r| NIL . #5#)
                      (LETT #3# (CONS |k| (|EFSTRUC;toR| |lk| |x| $)) . #5#)
                      G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |r| (QREFELT $ 32))
                                      (QREFELT $ 154))
                            (QREFELT $ 155))
                           |m| (QREFELT $ 156))
                          (LETT #4# (CONS |r| #4#) . #5#)))))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |lv|
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |r| NIL . #5#) (LETT #1# |l| . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |nv|
                                         (SPADCALL |n|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |r|
                                                                (QREFELT $ 32))
                                                      (QREFELT $ 154))
                                                     (QREFELT $ 155))
                                                    (QREFELT $ 157))
                                                   (QREFELT $ 158))
                                         (QREFELT $ 159))
                               #2#)
                              . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #5#)
          (EXIT (VECTOR (SPADCALL |f| |l| |lv| (QREFELT $ 119)) |l| |lv|))))) 

(SDEFUN |EFSTRUC;ataneval|
        ((|f| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPROG
         ((|g| (F)) (|h| (F)) (|d| (F)) (#1=#:G517 NIL) (#2=#:G516 (F))
          (#3=#:G518 (F)) (#4=#:G525 NIL) (|i| NIL) (#5=#:G526 NIL) (|x| NIL)
          (|s| (F)) (#6=#:G523 NIL) (#7=#:G524 NIL) (#8=#:G522 NIL) (|w| (F)))
         (SEQ
          (LETT |w| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                . #9=(|EFSTRUC;ataneval|))
          (LETT |s|
                (SPADCALL
                 (PROGN
                  (LETT #8# NIL . #9#)
                  (SEQ (LETT |x| NIL . #9#)
                       (LETT #7# (|EFSTRUC;toV| |lk| $) . #9#)
                       (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #9#)
                       (LETT #6# (QVSIZE |v|) . #9#) G190
                       (COND
                        ((OR (> |i| #6#) (ATOM #7#)
                             (PROGN (LETT |x| (CAR #7#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #8#
                               (CONS
                                (SPADCALL (QAREF1O |v| |i| 1) |x|
                                          (QREFELT $ 51))
                                #8#)
                               . #9#)))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT #7# (CDR #7#) . #9#))
                             . #9#)
                       (GO G190) G191 (EXIT (NREVERSE #8#))))
                 (QREFELT $ 54))
                . #9#)
          (LETT |g|
                (PROGN
                 (LETT #1# NIL . #9#)
                 (SEQ (LETT |x| NIL . #9#)
                      (LETT #5# (|EFSTRUC;toU| |lk| $) . #9#)
                      (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #9#)
                      (LETT #4# (QVSIZE |v|) . #9#) G190
                      (COND
                       ((OR (> |i| #4#) (ATOM #5#)
                            (PROGN (LETT |x| (CAR #5#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (SPADCALL (QAREF1O |v| |i| 1) |x|
                                         (QREFELT $ 160))
                               . #9#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 142)) . #9#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #9#)
                            (LETT #1# 'T . #9#)))))))
                      (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) (#10='T (|spadConstant| $ 26))))
                . #9#)
          (LETT |h|
                (COND
                 ((SPADCALL
                   (LETT |d|
                         (SPADCALL (|spadConstant| $ 62)
                                   (SPADCALL |s| |w| (QREFELT $ 115))
                                   (QREFELT $ 142))
                         . #9#)
                   (QREFELT $ 136))
                  (QREFELT $ 16))
                 (#10#
                  (SPADCALL
                   (SPADCALL (SPADCALL |w| |s| (QREFELT $ 140)) |d|
                             (QREFELT $ 15))
                   (QREFELT $ 120))))
                . #9#)
          (LETT |g| (SPADCALL |g| |h| (QREFELT $ 142)) . #9#)
          (EXIT
           (VECTOR (SPADCALL |f| (LIST |k|) (LIST |g|) (QREFELT $ 119))
                   (LIST |k|) (LIST |g|)))))) 

(SDEFUN |EFSTRUC;gdCoef?|
        ((|c| |Fraction| (|Integer|)) (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Boolean|))
        (SPROG ((#1=#:G534 NIL) (#2=#:G535 NIL) (#3=#:G536 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |i| (SPADCALL |v| (QREFELT $ 150))
                           . #4=(|EFSTRUC;gdCoef?|))
                     (LETT #3# (QVSIZE |v|) . #4#) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((QEQCAR
                          (SPADCALL
                           (SPADCALL (QAREF1O |v| |i| 1) |c| (QREFELT $ 158))
                           (QREFELT $ 161))
                          1)
                         (PROGN
                          (LETT #1#
                                (PROGN (LETT #2# 'NIL . #4#) (GO #5=#:G533))
                                . #4#)
                          (GO #6=#:G531))))))
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
         ((#1=#:G567 NIL) (#2=#:G568 NIL)
          (|r| (|Union| (|Fraction| (|Integer|)) "failed")) (#3=#:G572 NIL)
          (|i| NIL) (#4=#:G573 NIL) (|k| NIL) (|h| (|NonNegativeInteger|))
          (|j| (|Integer|)) (|h1| (|NonNegativeInteger|)) (#5=#:G570 NIL)
          (#6=#:G571 NIL) (|ll| (|List| (|Kernel| F))) (#7=#:G569 NIL))
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
                        (+ (- (QVSIZE |v|) (SPADCALL |v| (QREFELT $ 150))) 1)))
                  (EXIT (CONS 1 "failed"))))
                (LETT |h| 0 . #8#) (LETT |ll| (REVERSE |ll|) . #8#)
                (SEQ (LETT |k| NIL . #8#) (LETT #6# |ll| . #8#)
                     (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #8#)
                     (LETT #5# (QVSIZE |v|) . #8#) G190
                     (COND
                      ((OR (> |i| #5#) (ATOM #6#)
                           (PROGN (LETT |k| (CAR #6#) . #8#) NIL))
                       (GO G191)))
                     (SEQ (LETT |h1| (SPADCALL |k| (QREFELT $ 162)) . #8#)
                          (EXIT
                           (COND
                            ((SPADCALL |h1| |h| (QREFELT $ 163))
                             (SEQ (LETT |j| |i| . #8#)
                                  (EXIT (LETT |h| |h1| . #8#)))))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT #6# (CDR #6#) . #8#))
                           . #8#)
                     (GO G190) G191 (EXIT NIL))
                (SEQ
                 (EXIT
                  (SEQ (LETT |k| NIL . #8#) (LETT #4# |ll| . #8#)
                       (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #8#)
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
                                              (QREFELT $ 165))
                                    . #8#)
                              (EXIT
                               (COND
                                ((QEQCAR |r| 0)
                                 (COND
                                  ((QEQCAR
                                    (SPADCALL (QCDR |r|) (QREFELT $ 161)) 0)
                                   (COND
                                    ((|EFSTRUC;gdCoef?| (QAREF1O |v| |i| 1) |v|
                                      $)
                                     (PROGN
                                      (LETT #1#
                                            (PROGN
                                             (LETT #2# (CONS 0 (CONS |i| |k|))
                                                   . #8#)
                                             (GO #9=#:G566))
                                            . #8#)
                                      (GO #10=#:G564))))))))))))))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT #4# (CDR #4#) . #8#))
                             . #8#)
                       (GO G190) G191 (EXIT NIL)))
                 #10# (EXIT #1#))
                (EXIT (CONS 1 "failed"))))
          #9# (EXIT #2#)))) 

(SDEFUN |EFSTRUC;taneval|
        ((|f| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPROG
         ((|g| (F)) (#2=#:G595 NIL) (|a| NIL) (#3=#:G596 NIL) (|x| NIL)
          (#4=#:G594 NIL) (|l| (|List| #1#)) (#5=#:G593 NIL) (|kk| NIL)
          (#6=#:G592 NIL) (|lv| (|List| (|Fraction| (|Integer|))))
          (#7=#:G591 NIL) (|i| NIL) (#8=#:G590 NIL) (|v0| (|Integer|))
          (|rec|
           (|Union|
            (|Record| (|:| |index| (|Integer|)) (|:| |ker| (|Kernel| F)))
            "failed"))
          (|c| (F)) (#9=#:G576 NIL) (#10=#:G575 (F)) (#11=#:G577 (F))
          (#12=#:G588 NIL) (#13=#:G589 NIL) (|fns| (|List| F)) (|u| (F)))
         (SEQ
          (LETT |u| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                . #14=(|EFSTRUC;taneval|))
          (LETT |fns| (|EFSTRUC;toU| |lk| $) . #14#)
          (LETT |c|
                (SPADCALL |u|
                          (PROGN
                           (LETT #9# NIL . #14#)
                           (SEQ (LETT |x| NIL . #14#) (LETT #13# |fns| . #14#)
                                (LETT |i| (SPADCALL |v| (QREFELT $ 150))
                                      . #14#)
                                (LETT #12# (QVSIZE |v|) . #14#) G190
                                (COND
                                 ((OR (> |i| #12#) (ATOM #13#)
                                      (PROGN (LETT |x| (CAR #13#) . #14#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #11#
                                         (SPADCALL (QAREF1O |v| |i| 1) |x|
                                                   (QREFELT $ 160))
                                         . #14#)
                                   (COND
                                    (#9#
                                     (LETT #10#
                                           (SPADCALL #10# #11# (QREFELT $ 142))
                                           . #14#))
                                    ('T
                                     (PROGN
                                      (LETT #10# #11# . #14#)
                                      (LETT #9# 'T . #14#)))))))
                                (LETT |i|
                                      (PROG1 (+ |i| 1)
                                        (LETT #13# (CDR #13#) . #14#))
                                      . #14#)
                                (GO G190) G191 (EXIT NIL))
                           (COND (#9# #10#) (#15='T (|spadConstant| $ 26))))
                          (QREFELT $ 140))
                . #14#)
          (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|tan| $) . #14#)
          (EXIT
           (COND
            ((QEQCAR |rec| 1)
             (|EFSTRUC;tannosimp| |f| |lk| |k| |v| |fns| |c| $))
            (#15#
             (SEQ
              (LETT |v0|
                    (SPADCALL
                     (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1)
                               (QREFELT $ 166))
                     (QREFELT $ 152))
                    . #14#)
              (LETT |lv|
                    (PROGN
                     (LETT #8# NIL . #14#)
                     (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #14#)
                          (LETT #7# (QVSIZE |v|) . #14#) G190
                          (COND ((> |i| #7#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |i| (QCAR (QCDR |rec|))
                                        (QREFELT $ 156))
                              (LETT #8# (CONS (QAREF1O |v| |i| 1) #8#)
                                    . #14#)))))
                          (LETT |i| (+ |i| 1) . #14#) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    . #14#)
              (LETT |l|
                    (PROGN
                     (LETT #6# NIL . #14#)
                     (SEQ (LETT |kk| NIL . #14#) (LETT #5# |lk| . #14#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |kk| (CAR #5#) . #14#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |kk| (QCDR (QCDR |rec|))
                                        (QREFELT $ 121))
                              (LETT #6# (CONS |kk| #6#) . #14#)))))
                          (LETT #5# (CDR #5#) . #14#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #14#)
              (LETT |g|
                    (|EFSTRUC;tanSum|
                     (SPADCALL (SPADCALL |v0| |c| (QREFELT $ 167))
                               (QREFELT $ 14))
                     (CONS
                      (SPADCALL (SPADCALL |k| (QREFELT $ 96)) |v0|
                                (QREFELT $ 50))
                      (PROGN
                       (LETT #4# NIL . #14#)
                       (SEQ (LETT |x| NIL . #14#)
                            (LETT #3# (|EFSTRUC;toV| |l| $) . #14#)
                            (LETT |a| NIL . #14#) (LETT #2# |lv| . #14#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |a| (CAR #2#) . #14#) NIL)
                                  (ATOM #3#)
                                  (PROGN (LETT |x| (CAR #3#) . #14#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS
                                     (SPADCALL |x|
                                               (-
                                                (SPADCALL
                                                 (SPADCALL |a| |v0|
                                                           (QREFELT $ 168))
                                                 (QREFELT $ 152)))
                                               (QREFELT $ 50))
                                     #4#)
                                    . #14#)))
                            (LETT #2#
                                  (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #14#))
                                  . #14#)
                            (GO G190) G191 (EXIT (NREVERSE #4#)))))
                     $)
                    . #14#)
              (EXIT
               (VECTOR
                (SPADCALL |f| (LIST (QCDR (QCDR |rec|))) (LIST |g|)
                          (QREFELT $ 119))
                (LIST (QCDR (QCDR |rec|))) (LIST |g|)))))))))) 

(SDEFUN |EFSTRUC;tannosimp|
        ((|f| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|))) (|fns| |List| F) (|c| F)
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPROG
         ((|h| (F)) (|i| NIL) (#2=#:G629 NIL) (|x| NIL) (#3=#:G628 NIL)
          (|lk1| (|List| #1#)) (|newtan| (|List| F)) (#4=#:G626 NIL)
          (#5=#:G627 NIL) (|t| NIL) (#6=#:G625 NIL)
          (|li| (|List| (|NonNegativeInteger|))) (#7=#:G624 NIL)
          (#8=#:G623 NIL) (#9=#:G622 NIL) (|newt| (|List| F)) (#10=#:G621 NIL)
          (|u| NIL) (#11=#:G620 NIL) (|dd| (F)) (|d| #12=(|Integer|))
          (|cd| (|Record| (|:| |num| (|Vector| (|Integer|))) (|:| |den| #12#)))
          (#13=#:G619 NIL) (#14=#:G618 NIL) (#15=#:G617 NIL) (#16=#:G616 NIL)
          (|n| (|Integer|)))
         (SEQ (LETT |n| (QVSIZE |v|) . #17=(|EFSTRUC;tannosimp|))
              (LETT |lk|
                    (PROGN
                     (LETT #16# NIL . #17#)
                     (SEQ (LETT |x| NIL . #17#) (LETT #15# |lk| . #17#) G190
                          (COND
                           ((OR (ATOM #15#)
                                (PROGN (LETT |x| (CAR #15#) . #17#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND ((SPADCALL |x| '|tan| (QREFELT $ 30)) 'T)
                                    (#18='T
                                     (SPADCALL |x| '|atan| (QREFELT $ 30))))
                              (LETT #16# (CONS |x| #16#) . #17#)))))
                          (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                          (EXIT (NREVERSE #16#))))
                    . #17#)
              (LETT |lk1|
                    (PROGN
                     (LETT #14# NIL . #17#)
                     (SEQ (LETT |i| 1 . #17#) (LETT |x| NIL . #17#)
                          (LETT #13# |lk| . #17#) G190
                          (COND
                           ((OR (ATOM #13#)
                                (PROGN (LETT |x| (CAR #13#) . #17#) NIL)
                                (|greater_SI| |i| |n|))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((SPADCALL (QAREF1O |v| |i| 1)
                                          (|spadConstant| $ 104)
                                          (QREFELT $ 90))
                                'NIL)
                               (#18# 'T))
                              (LETT #14# (CONS |x| #14#) . #17#)))))
                          (LETT #13#
                                (PROG1 (CDR #13#)
                                  (LETT |i| (|inc_SI| |i|) . #17#))
                                . #17#)
                          (GO G190) G191 (EXIT (NREVERSE #14#))))
                    . #17#)
              (EXIT
               (COND
                ((SPADCALL (CONS #'|EFSTRUC;tannosimp!0| $) |lk1|
                           (QREFELT $ 169))
                 (SEQ
                  (LETT |dd|
                        (SPADCALL
                         (LETT |d|
                               (QCDR
                                (LETT |cd| (SPADCALL |v| (QREFELT $ 172))
                                      . #17#))
                               . #17#)
                         (QREFELT $ 13))
                        . #17#)
                  (LETT |newt|
                        (PROGN
                         (LETT #11# NIL . #17#)
                         (SEQ (LETT |i| 1 . #17#) (LETT |u| NIL . #17#)
                              (LETT #10# |fns| . #17#) G190
                              (COND
                               ((OR (ATOM #10#)
                                    (PROGN (LETT |u| (CAR #10#) . #17#) NIL)
                                    (|greater_SI| |i| |n|))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((COND
                                   ((SPADCALL (QAREF1O |v| |i| 1)
                                              (|spadConstant| $ 104)
                                              (QREFELT $ 90))
                                    'NIL)
                                   (#18# 'T))
                                  (LETT #11#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |u| |dd| (QREFELT $ 15))
                                          (QREFELT $ 56))
                                         #11#)
                                        . #17#)))))
                              (LETT #10#
                                    (PROG1 (CDR #10#)
                                      (LETT |i| (|inc_SI| |i|) . #17#))
                                    . #17#)
                              (GO G190) G191 (EXIT (NREVERSE #11#))))
                        . #17#)
                  (LETT |newtan|
                        (PROGN
                         (LETT #9# NIL . #17#)
                         (SEQ (LETT |t| NIL . #17#) (LETT #8# |newt| . #17#)
                              G190
                              (COND
                               ((OR (ATOM #8#)
                                    (PROGN (LETT |t| (CAR #8#) . #17#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #9#
                                      (CONS (SPADCALL |t| |d| (QREFELT $ 50))
                                            #9#)
                                      . #17#)))
                              (LETT #8# (CDR #8#) . #17#) (GO G190) G191
                              (EXIT (NREVERSE #9#))))
                        . #17#)
                  (LETT |li|
                        (PROGN
                         (LETT #7# NIL . #17#)
                         (SEQ (LETT |i| 1 . #17#) G190
                              (COND ((|greater_SI| |i| |n|) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((COND
                                   ((SPADCALL (QAREF1O |v| |i| 1)
                                              (|spadConstant| $ 104)
                                              (QREFELT $ 90))
                                    'NIL)
                                   (#18# 'T))
                                  (LETT #7# (CONS |i| #7#) . #17#)))))
                              (LETT |i| (|inc_SI| |i|) . #17#) (GO G190) G191
                              (EXIT (NREVERSE #7#))))
                        . #17#)
                  (LETT |h|
                        (|EFSTRUC;tanSum| |c|
                         (PROGN
                          (LETT #6# NIL . #17#)
                          (SEQ (LETT |t| NIL . #17#) (LETT #5# |newt| . #17#)
                               (LETT |i| NIL . #17#) (LETT #4# |li| . #17#)
                               G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |i| (CAR #4#) . #17#) NIL)
                                     (ATOM #5#)
                                     (PROGN (LETT |t| (CAR #5#) . #17#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #6#
                                       (CONS
                                        (SPADCALL |t|
                                                  (QAREF1O (QCAR |cd|) |i| 1)
                                                  (QREFELT $ 50))
                                        #6#)
                                       . #17#)))
                               (LETT #4#
                                     (PROG1 (CDR #4#)
                                       (LETT #5# (CDR #5#) . #17#))
                                     . #17#)
                               (GO G190) G191 (EXIT (NREVERSE #6#))))
                         $)
                        . #17#)
                  (LETT |newtan| (CONS |h| |newtan|) . #17#)
                  (LETT |lk1| (CONS |k| |lk1|) . #17#)
                  (EXIT
                   (VECTOR (SPADCALL |f| |lk1| |newtan| (QREFELT $ 119)) |lk1|
                           |newtan|))))
                (#18#
                 (SEQ
                  (LETT |h|
                        (|EFSTRUC;tanSum| |c|
                         (PROGN
                          (LETT #3# NIL . #17#)
                          (SEQ (LETT |x| NIL . #17#)
                               (LETT #2# (|EFSTRUC;toV| |lk| $) . #17#)
                               (LETT |i| 1 . #17#) G190
                               (COND
                                ((OR (|greater_SI| |i| |n|) (ATOM #2#)
                                     (PROGN (LETT |x| (CAR #2#) . #17#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #3#
                                       (CONS
                                        (SPADCALL (QAREF1O |v| |i| 1) |x|
                                                  (QREFELT $ 51))
                                        #3#)
                                       . #17#)))
                               (LETT |i|
                                     (PROG1 (|inc_SI| |i|)
                                       (LETT #2# (CDR #2#) . #17#))
                                     . #17#)
                               (GO G190) G191 (EXIT (NREVERSE #3#))))
                         $)
                        . #17#)
                  (EXIT
                   (VECTOR (SPADCALL |f| (LIST |k|) (LIST |h|) (QREFELT $ 119))
                           (LIST |k|) (LIST |h|)))))))))) 

(SDEFUN |EFSTRUC;tannosimp!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| '|tan| (QREFELT $ 30))) 

(SDEFUN |EFSTRUC;expnosimp|
        ((|f| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|))) (|fns| |List| F) (|g| F)
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPROG
         ((|h| (F)) (#2=#:G726 NIL) (#3=#:G725 (F)) (#4=#:G727 (F))
          (#5=#:G742 NIL) (|i| NIL) (#6=#:G743 NIL) (|y| NIL)
          (|newexp| (|List| F)) (|lk1| (|List| #1#)) (#7=#:G683 NIL)
          (#8=#:G682 (F)) (#9=#:G684 (F)) (#10=#:G740 NIL) (#11=#:G741 NIL)
          (|e| NIL) (|li| (|List| (|NonNegativeInteger|))) (#12=#:G739 NIL)
          (#13=#:G738 NIL) (#14=#:G737 NIL) (|newe| (|List| F))
          (#15=#:G736 NIL) (#16=#:G735 NIL) (|dd| (F)) (|d| #17=(|Integer|))
          (|cd| (|Record| (|:| |num| (|Vector| (|Integer|))) (|:| |den| #17#)))
          (#18=#:G734 NIL) (|x| NIL) (#19=#:G733 NIL) (#20=#:G732 NIL)
          (#21=#:G731 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (QVSIZE |v|) . #22=(|EFSTRUC;expnosimp|))
              (LETT |lk|
                    (PROGN
                     (LETT #21# NIL . #22#)
                     (SEQ (LETT |x| NIL . #22#) (LETT #20# |lk| . #22#) G190
                          (COND
                           ((OR (ATOM #20#)
                                (PROGN (LETT |x| (CAR #20#) . #22#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND ((SPADCALL |x| '|exp| (QREFELT $ 30)) 'T)
                                    (#23='T
                                     (SPADCALL |x| '|log| (QREFELT $ 30))))
                              (LETT #21# (CONS |x| #21#) . #22#)))))
                          (LETT #20# (CDR #20#) . #22#) (GO G190) G191
                          (EXIT (NREVERSE #21#))))
                    . #22#)
              (LETT |lk1|
                    (PROGN
                     (LETT #19# NIL . #22#)
                     (SEQ (LETT |i| 1 . #22#) (LETT |x| NIL . #22#)
                          (LETT #18# |lk| . #22#) G190
                          (COND
                           ((OR (ATOM #18#)
                                (PROGN (LETT |x| (CAR #18#) . #22#) NIL)
                                (|greater_SI| |i| |n|))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((SPADCALL (QAREF1O |v| |i| 1)
                                          (|spadConstant| $ 104)
                                          (QREFELT $ 90))
                                'NIL)
                               (#23# 'T))
                              (LETT #19# (CONS |x| #19#) . #22#)))))
                          (LETT #18#
                                (PROG1 (CDR #18#)
                                  (LETT |i| (|inc_SI| |i|) . #22#))
                                . #22#)
                          (GO G190) G191 (EXIT (NREVERSE #19#))))
                    . #22#)
              (EXIT
               (COND
                ((SPADCALL (CONS #'|EFSTRUC;expnosimp!0| $) |lk1|
                           (QREFELT $ 169))
                 (SEQ
                  (LETT |dd|
                        (SPADCALL
                         (LETT |d|
                               (QCDR
                                (LETT |cd| (SPADCALL |v| (QREFELT $ 172))
                                      . #22#))
                               . #22#)
                         (QREFELT $ 13))
                        . #22#)
                  (LETT |newe|
                        (PROGN
                         (LETT #16# NIL . #22#)
                         (SEQ (LETT |i| 1 . #22#) (LETT |y| NIL . #22#)
                              (LETT #15# |fns| . #22#) G190
                              (COND
                               ((OR (ATOM #15#)
                                    (PROGN (LETT |y| (CAR #15#) . #22#) NIL)
                                    (|greater_SI| |i| |n|))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((COND
                                   ((SPADCALL (QAREF1O |v| |i| 1)
                                              (|spadConstant| $ 104)
                                              (QREFELT $ 90))
                                    'NIL)
                                   (#23# 'T))
                                  (LETT #16#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |y| |dd| (QREFELT $ 15))
                                          (QREFELT $ 138))
                                         #16#)
                                        . #22#)))))
                              (LETT #15#
                                    (PROG1 (CDR #15#)
                                      (LETT |i| (|inc_SI| |i|) . #22#))
                                    . #22#)
                              (GO G190) G191 (EXIT (NREVERSE #16#))))
                        . #22#)
                  (LETT |newexp|
                        (PROGN
                         (LETT #14# NIL . #22#)
                         (SEQ (LETT |e| NIL . #22#) (LETT #13# |newe| . #22#)
                              G190
                              (COND
                               ((OR (ATOM #13#)
                                    (PROGN (LETT |e| (CAR #13#) . #22#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #14#
                                      (CONS (SPADCALL |e| |d| (QREFELT $ 112))
                                            #14#)
                                      . #22#)))
                              (LETT #13# (CDR #13#) . #22#) (GO G190) G191
                              (EXIT (NREVERSE #14#))))
                        . #22#)
                  (LETT |li|
                        (PROGN
                         (LETT #12# NIL . #22#)
                         (SEQ (LETT |i| 1 . #22#) G190
                              (COND ((|greater_SI| |i| |n|) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((COND
                                   ((SPADCALL (QAREF1O |v| |i| 1)
                                              (|spadConstant| $ 104)
                                              (QREFELT $ 90))
                                    'NIL)
                                   (#23# 'T))
                                  (LETT #12# (CONS |i| #12#) . #22#)))))
                              (LETT |i| (|inc_SI| |i|) . #22#) (GO G190) G191
                              (EXIT (NREVERSE #12#))))
                        . #22#)
                  (LETT |h|
                        (SPADCALL
                         (PROGN
                          (LETT #7# NIL . #22#)
                          (SEQ (LETT |e| NIL . #22#) (LETT #11# |newe| . #22#)
                               (LETT |i| NIL . #22#) (LETT #10# |li| . #22#)
                               G190
                               (COND
                                ((OR (ATOM #10#)
                                     (PROGN (LETT |i| (CAR #10#) . #22#) NIL)
                                     (ATOM #11#)
                                     (PROGN (LETT |e| (CAR #11#) . #22#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #9#
                                        (SPADCALL |e|
                                                  (QAREF1O (QCAR |cd|) |i| 1)
                                                  (QREFELT $ 112))
                                        . #22#)
                                  (COND
                                   (#7#
                                    (LETT #8#
                                          (SPADCALL #8# #9# (QREFELT $ 115))
                                          . #22#))
                                   ('T
                                    (PROGN
                                     (LETT #8# #9# . #22#)
                                     (LETT #7# 'T . #22#)))))))
                               (LETT #10#
                                     (PROG1 (CDR #10#)
                                       (LETT #11# (CDR #11#) . #22#))
                                     . #22#)
                               (GO G190) G191 (EXIT NIL))
                          (COND (#7# #8#) (#23# (|spadConstant| $ 62))))
                         |g| (QREFELT $ 115))
                        . #22#)
                  (LETT |lk1| (CONS |k| |lk1|) . #22#)
                  (LETT |newexp| (CONS |h| |newexp|) . #22#)
                  (EXIT
                   (VECTOR (SPADCALL |f| |lk1| |newexp| (QREFELT $ 119)) |lk1|
                           |newexp|))))
                (#23#
                 (SEQ
                  (LETT |h|
                        (SPADCALL
                         (PROGN
                          (LETT #2# NIL . #22#)
                          (SEQ (LETT |y| NIL . #22#) (LETT #6# |fns| . #22#)
                               (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #22#)
                               (LETT #5# (QVSIZE |v|) . #22#) G190
                               (COND
                                ((OR (> |i| #5#) (ATOM #6#)
                                     (PROGN (LETT |y| (CAR #6#) . #22#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #4#
                                        (SPADCALL
                                         (SPADCALL |y| (QREFELT $ 138))
                                         (QAREF1O |v| |i| 1) (QREFELT $ 159))
                                        . #22#)
                                  (COND
                                   (#2#
                                    (LETT #3#
                                          (SPADCALL #3# #4# (QREFELT $ 115))
                                          . #22#))
                                   ('T
                                    (PROGN
                                     (LETT #3# #4# . #22#)
                                     (LETT #2# 'T . #22#)))))))
                               (LETT |i|
                                     (PROG1 (+ |i| 1)
                                       (LETT #6# (CDR #6#) . #22#))
                                     . #22#)
                               (GO G190) G191 (EXIT NIL))
                          (COND (#2# #3#) (#23# (|spadConstant| $ 62))))
                         |g| (QREFELT $ 115))
                        . #22#)
                  (EXIT
                   (VECTOR (SPADCALL |f| (LIST |k|) (LIST |h|) (QREFELT $ 119))
                           (LIST |k|) (LIST |h|)))))))))) 

(SDEFUN |EFSTRUC;expnosimp!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| '|exp| (QREFELT $ 30))) 

(SDEFUN |EFSTRUC;logeval|
        ((|f| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPROG
         ((|g| (F)) (#1=#:G756 NIL) (#2=#:G755 (F)) (#3=#:G757 (F))
          (#4=#:G764 NIL) (|i| NIL) (#5=#:G765 NIL) (|x| NIL) (|c| (F))
          (#6=#:G747 NIL) (#7=#:G746 (F)) (#8=#:G748 (F)) (#9=#:G762 NIL)
          (#10=#:G763 NIL) (|dd| (|Integer|)) (#11=#:G761 NIL) (#12=#:G760 NIL)
          (|z| (F)))
         (SEQ
          (LETT |z| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                . #13=(|EFSTRUC;logeval|))
          (LETT |dd|
                (SPADCALL
                 (PROGN
                  (LETT #12# NIL . #13#)
                  (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #13#)
                       (LETT #11# (QVSIZE |v|) . #13#) G190
                       (COND ((> |i| #11#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #12#
                               (CONS
                                (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 40))
                                #12#)
                               . #13#)))
                       (LETT |i| (+ |i| 1) . #13#) (GO G190) G191
                       (EXIT (NREVERSE #12#))))
                 (QREFELT $ 173))
                . #13#)
          (LETT |c|
                (SPADCALL (SPADCALL |z| |dd| (QREFELT $ 112))
                          (PROGN
                           (LETT #6# NIL . #13#)
                           (SEQ
                            (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #13#)
                            (LETT #10# (QVSIZE |v|) . #13#)
                            (LETT |x| NIL . #13#)
                            (LETT #9# (|EFSTRUC;toZ| |lk| $) . #13#) G190
                            (COND
                             ((OR (ATOM #9#)
                                  (PROGN (LETT |x| (CAR #9#) . #13#) NIL)
                                  (> |i| #10#))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #8#
                                     (SPADCALL |x|
                                               (SPADCALL |dd|
                                                         (QAREF1O |v| |i| 1)
                                                         (QREFELT $ 174))
                                               (QREFELT $ 159))
                                     . #13#)
                               (COND
                                (#6#
                                 (LETT #7# (SPADCALL #7# #8# (QREFELT $ 115))
                                       . #13#))
                                ('T
                                 (PROGN
                                  (LETT #7# #8# . #13#)
                                  (LETT #6# 'T . #13#)))))))
                            (LETT #9#
                                  (PROG1 (CDR #9#) (LETT |i| (+ |i| 1) . #13#))
                                  . #13#)
                            (GO G190) G191 (EXIT NIL))
                           (COND (#6# #7#) (#14='T (|spadConstant| $ 62))))
                          (QREFELT $ 15))
                . #13#)
          (LETT |g|
                (SPADCALL
                 (PROGN
                  (LETT #1# NIL . #13#)
                  (SEQ (LETT |x| NIL . #13#)
                       (LETT #5# (|EFSTRUC;toY| |lk| $) . #13#)
                       (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #13#)
                       (LETT #4# (QVSIZE |v|) . #13#) G190
                       (COND
                        ((OR (> |i| #4#) (ATOM #5#)
                             (PROGN (LETT |x| (CAR #5#) . #13#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (SPADCALL (QAREF1O |v| |i| 1) |x|
                                          (QREFELT $ 160))
                                . #13#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 142))
                                  . #13#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #13#)
                             (LETT #1# 'T . #13#)))))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #13#))
                             . #13#)
                       (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#14# (|spadConstant| $ 26))))
                 (SPADCALL (SPADCALL |c| (QREFELT $ 97))
                           (SPADCALL (SPADCALL |dd| (QREFELT $ 175))
                                     (QREFELT $ 122))
                           (QREFELT $ 15))
                 (QREFELT $ 142))
                . #13#)
          (EXIT
           (VECTOR (SPADCALL |f| (LIST |k|) (LIST |g|) (QREFELT $ 119))
                   (LIST |k|) (LIST |g|)))))) 

(SDEFUN |EFSTRUC;rischNormalize;FLR;44|
        ((|f| F) (|vars| |List| (|Symbol|))
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPROG
         ((#1=#:G777 NIL)
          (|rn|
           (|Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (#2=#:G776 NIL)
          (|rec|
           (|Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (|c|
           (|Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
                    (|:| |func| F) (|:| |fail| (|Boolean|))))
          (|klist| (|List| (|Kernel| F))) (|i| NIL) (#3=#:G778 NIL) (|kk| NIL)
          (|n| (|NonNegativeInteger|)) (|pars| (|List| (|Symbol|)))
          (|funs| #4=(|List| (|Kernel| F))) (|lk| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lk| (SPADCALL |f| (QREFELT $ 59))
                  . #5=(|EFSTRUC;rischNormalize;FLR;44|))
            (LETT |funs| |lk| . #5#)
            (LETT |pars| (SPADCALL |f| (QREFELT $ 22)) . #5#)
            (LETT |pars| (SPADCALL |pars| |vars| (QREFELT $ 176)) . #5#)
            (EXIT
             (COND ((NULL |funs|) (VECTOR |f| NIL NIL))
                   ('T
                    (SEQ (LETT |n| (LENGTH |funs|) . #5#)
                         (SEQ (LETT |kk| NIL . #5#)
                              (LETT #3# (CDR |funs|) . #5#) (LETT |i| 1 . #5#)
                              G190
                              (COND
                               ((OR (|greater_SI| |i| |n|) (ATOM #3#)
                                    (PROGN (LETT |kk| (CAR #3#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ
                                 (LETT |klist|
                                       (SPADCALL |funs| |i| (QREFELT $ 64))
                                       . #5#)
                                 (SEQ
                                  (LETT |c|
                                        (|EFSTRUC;findRelation| |vars| |pars|
                                         |klist| |kk| $)
                                        . #5#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |c| 0)
                                     (COND
                                      ((NULL
                                        (SPADCALL (CDR |c|) (QREFELT $ 177)))
                                       (PROGN
                                        (LETT #2#
                                              (SEQ
                                               (LETT |rec|
                                                     (|EFSTRUC;depeval| |f|
                                                      |klist| |kk| (CDR |c|) $)
                                                     . #5#)
                                               (LETT |rn|
                                                     (SPADCALL (QVELT |rec| 0)
                                                               |vars|
                                                               (QREFELT $ 179))
                                                     . #5#)
                                               (EXIT
                                                (PROGN
                                                 (LETT #1#
                                                       (VECTOR (QVELT |rn| 0)
                                                               (SPADCALL
                                                                (QVELT |rec| 1)
                                                                (QVELT |rn| 1)
                                                                (QREFELT $ 65))
                                                               (SPADCALL
                                                                (QVELT |rec| 2)
                                                                (QVELT |rn| 2)
                                                                (QREFELT $
                                                                         66)))
                                                       . #5#)
                                                 (GO #6=#:G775))))
                                              . #5#)
                                        (GO #7=#:G771))))))))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |c| 1)
                                    (SEQ
                                     (LETT |rn|
                                           (SPADCALL
                                            (SPADCALL |f| (LIST |kk|)
                                                      (LIST (CDR |c|))
                                                      (QREFELT $ 119))
                                            |vars| (QREFELT $ 179))
                                           . #5#)
                                     (EXIT
                                      (PROGN
                                       (LETT #1#
                                             (VECTOR (QVELT |rn| 0)
                                                     (CONS |kk| (QVELT |rn| 1))
                                                     (CONS (CDR |c|)
                                                           (QVELT |rn| 2)))
                                             . #5#)
                                       (GO #6#)))))))))
                               #7# (EXIT #2#))
                              (LETT |i|
                                    (PROG1 (|inc_SI| |i|)
                                      (LETT #3# (CDR #3#) . #5#))
                                    . #5#)
                              (GO G190) G191 (EXIT NIL))
                         (EXIT (VECTOR |f| NIL NIL))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |EFSTRUC;rischNormalize;FSR;45|
        ((|f| F) (|v| |Symbol|)
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPADCALL |f| (LIST |v|) (QREFELT $ 179))) 

(SDEFUN |EFSTRUC;rootNormalize;FKF;46| ((|f| F) (|k| |Kernel| F) ($ F))
        (SPROG
         ((|u|
           (|Union|
            (|Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
                      (|:| |vals| (|List| F)))
            "failed")))
         (SEQ
          (LETT |u|
                (|EFSTRUC;rootKernelNormalize| |f|
                 (|EFSTRUC;toR| (SPADCALL |f| (QREFELT $ 59))
                  (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) $)
                 |k| $)
                |EFSTRUC;rootNormalize;FKF;46|)
          (EXIT (COND ((QEQCAR |u| 1) |f|) ('T (QVELT (QCDR |u|) 0))))))) 

(SDEFUN |EFSTRUC;rootKernelNormalize|
        ((|f| F) (|l| |List| (|Kernel| F)) (|k| |Kernel| F)
         ($ |Union|
          (|Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
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
                   (|EFSTRUC;rooteval| |f| |l| |k|
                    (SPADCALL (CDR |c|) (SPADCALL (CDR |c|) (QREFELT $ 150))
                              (QREFELT $ 151))
                    $)))
            ('T (CONS 1 "failed"))))))) 

(SDEFUN |EFSTRUC;localnorm| ((|f| F) ($ F))
        (QVELT (SPADCALL |f| NIL (QREFELT $ 179)) 0)) 

(SDEFUN |EFSTRUC;validExponential;LFSU;49|
        ((|twr| |List| (|Kernel| F)) (|eta| F) (|x| |Symbol|)
         ($ |Union| F "failed"))
        (SPROG
         ((#1=#:G830 NIL) (#2=#:G829 (F)) (#3=#:G831 (F)) (#4=#:G842 NIL)
          (|i| NIL) (#5=#:G843 NIL) (|yy| NIL) (|g| (F)) (#6=#:G803 NIL)
          (#7=#:G802 (F)) (#8=#:G804 (F)) (#9=#:G840 NIL) (#10=#:G841 NIL)
          (|v| (|Vector| (|Fraction| (|Integer|))))
          (|c| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (#11=#:G839 NIL) (|fns| (|List| F)) (#12=#:G838 NIL))
         (SEQ
          (LETT |c|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #12# NIL . #13=(|EFSTRUC;validExponential;LFSU;49|))
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
                                (CONS (SPADCALL |g| |x| (QREFELT $ 68)) #12#)
                                . #13#)))
                        (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                        (EXIT (NREVERSE #12#))))
                  (QREFELT $ 182))
                 (SPADCALL |eta| |x| (QREFELT $ 68)) (QREFELT $ 183))
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
                                                             (QREFELT $ 150))
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
                                                       (QREFELT $ 160))
                                                      . #13#)
                                                (COND
                                                 (#6#
                                                  (LETT #7#
                                                        (SPADCALL #7# #8#
                                                                  (QREFELT $
                                                                           142))
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
                                       (QREFELT $ 140))
                             . #13#)
                       (EXIT
                        (CONS 0
                              (SPADCALL
                               (PROGN
                                (LETT #1# NIL . #13#)
                                (SEQ (LETT |yy| NIL . #13#)
                                     (LETT #5# |fns| . #13#)
                                     (LETT |i| (SPADCALL |v| (QREFELT $ 150))
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
                                               (SPADCALL |yy| (QREFELT $ 138))
                                               (QAREF1O |v| |i| 1)
                                               (QREFELT $ 159))
                                              . #13#)
                                        (COND
                                         (#1#
                                          (LETT #2#
                                                (SPADCALL #2# #3#
                                                          (QREFELT $ 115))
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
                                (COND (#1# #2#) (#14# (|spadConstant| $ 62))))
                               (SPADCALL |g| (QREFELT $ 138))
                               (QREFELT $ 115))))))))))) 

(SDEFUN |EFSTRUC;irootDep;KU;50|
        ((|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|nv| (F)) (|nk| (F)) (|nr| (F)) (|nf| (F))
          (|pr|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (|n| (|NonNegativeInteger|)) (#1=#:G844 NIL))
         (SEQ
          (LETT |n|
                (PROG1
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |k| (QREFELT $ 32))
                                     (QREFELT $ 154))
                           (QREFELT $ 155))
                          . #2=(|EFSTRUC;irootDep;KU;50|))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#))
                . #2#)
          (LETT |pr|
                (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) |n|
                          (QREFELT $ 188))
                . #2#)
          (COND
           ((SPADCALL (QVELT |pr| 1) (|spadConstant| $ 62) (QREFELT $ 34))
            (COND
             ((NULL (EQL (QVELT |pr| 0) |n|))
              (EXIT
               (COND
                ((EQL (QVELT |pr| 0) 1)
                 (CONS 1
                       (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2)
                                 (QREFELT $ 115))))
                (#3='T
                 (SEQ
                  (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)) . #2#)
                  (LETT |nr| (QVELT |pr| 2) . #2#)
                  (LETT |nk|
                        (SPADCALL (SPADCALL |k| (QREFELT $ 84))
                                  (LIST |nr| |nf|) (QREFELT $ 148))
                        . #2#)
                  (LETT |nv| (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 115))
                        . #2#)
                  (EXIT (CONS 1 |nv|)))))))))
           (#3#
            (EXIT
             (COND
              ((EQL (QVELT |pr| 0) 1)
               (CONS 1
                     (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2) (QREFELT $ 115))))
              (#3#
               (SEQ (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)) . #2#)
                    (LETT |nr| (QVELT |pr| 2) . #2#)
                    (LETT |nk|
                          (SPADCALL (SPADCALL |k| (QREFELT $ 84))
                                    (LIST |nr| |nf|) (QREFELT $ 148))
                          . #2#)
                    (LETT |nv| (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 115))
                          . #2#)
                    (EXIT (CONS 1 |nv|))))))))
          (EXIT (CONS 2 'T))))) 

(SDEFUN |EFSTRUC;irootDep;KU;51|
        ((|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (CONS 2 'T)) 

(SDEFUN |EFSTRUC;rootDep|
        ((|ker| |List| (|Kernel| F)) (|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((#1=#:G880 NIL) (#2=#:G879 #3=(|Integer|)) (#4=#:G881 #3#)
          (#5=#:G884 NIL) (|r| NIL))
         (SEQ
          (COND
           ((NULL
             (LETT |ker|
                   (|EFSTRUC;toR| |ker|
                    (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) $)
                   . #6=(|EFSTRUC;rootDep|)))
            (SPADCALL |k| (QREFELT $ 190)))
           (#7='T
            (CONS 0
                  (MAKEARR1 1
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |k| (QREFELT $ 32))
                                         (QREFELT $ 154))
                               (QREFELT $ 155))
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
                                               (QREFELT $ 154))
                                              (QREFELT $ 155))
                                             . #6#)
                                       (COND
                                        (#1#
                                         (LETT #2#
                                               (SPADCALL #2# #4#
                                                         (QREFELT $ 191))
                                               . #6#))
                                        ('T
                                         (PROGN
                                          (LETT #2# #4# . #6#)
                                          (LETT #1# 'T . #6#)))))))
                                    (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#1# #2#) (#7# 1)))
                              (QREFELT $ 191))
                             (QREFELT $ 157))))))))) 

(SDEFUN |EFSTRUC;expeval|
        ((|f| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPROG
         ((|h| (F)) (#2=#:G896 NIL) (#3=#:G895 (F)) (#4=#:G897 (F))
          (#5=#:G907 NIL) (|a| NIL) (#6=#:G908 NIL) (|z| NIL)
          (|l| (|List| #1#)) (#7=#:G906 NIL) (|kk| NIL) (#8=#:G905 NIL)
          (|lv| (|List| (|Fraction| (|Integer|)))) (#9=#:G904 NIL) (|i| NIL)
          (#10=#:G903 NIL) (|v0| (|Integer|))
          (|rec|
           (|Union|
            (|Record| (|:| |index| (|Integer|)) (|:| |ker| (|Kernel| F)))
            "failed"))
          (|g| (F)) (#11=#:G887 NIL) (#12=#:G886 (F)) (#13=#:G888 (F))
          (#14=#:G901 NIL) (#15=#:G902 NIL) (|fns| (|List| F)) (|y| (F)))
         (SEQ
          (LETT |y| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                . #16=(|EFSTRUC;expeval|))
          (LETT |fns| (|EFSTRUC;toY| |lk| $) . #16#)
          (LETT |g|
                (SPADCALL |y|
                          (PROGN
                           (LETT #11# NIL . #16#)
                           (SEQ (LETT |z| NIL . #16#) (LETT #15# |fns| . #16#)
                                (LETT |i| (SPADCALL |v| (QREFELT $ 150))
                                      . #16#)
                                (LETT #14# (QVSIZE |v|) . #16#) G190
                                (COND
                                 ((OR (> |i| #14#) (ATOM #15#)
                                      (PROGN (LETT |z| (CAR #15#) . #16#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #13#
                                         (SPADCALL (QAREF1O |v| |i| 1) |z|
                                                   (QREFELT $ 160))
                                         . #16#)
                                   (COND
                                    (#11#
                                     (LETT #12#
                                           (SPADCALL #12# #13# (QREFELT $ 142))
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
                          (QREFELT $ 140))
                . #16#)
          (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|exp| $) . #16#)
          (EXIT
           (COND
            ((QEQCAR |rec| 1)
             (|EFSTRUC;expnosimp| |f| |lk| |k| |v| |fns|
              (SPADCALL |g| (QREFELT $ 138)) $))
            (#17#
             (SEQ
              (LETT |v0|
                    (SPADCALL
                     (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1)
                               (QREFELT $ 166))
                     (QREFELT $ 152))
                    . #16#)
              (LETT |lv|
                    (PROGN
                     (LETT #10# NIL . #16#)
                     (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #16#)
                          (LETT #9# (QVSIZE |v|) . #16#) G190
                          (COND ((> |i| #9#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |i| (QCAR (QCDR |rec|))
                                        (QREFELT $ 156))
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
                                        (QREFELT $ 121))
                              (LETT #8# (CONS |kk| #8#) . #16#)))))
                          (LETT #7# (CDR #7#) . #16#) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    . #16#)
              (LETT |h|
                    (PROGN
                     (LETT #2# NIL . #16#)
                     (SEQ (LETT |z| NIL . #16#)
                          (LETT #6# (|EFSTRUC;toY| |l| $) . #16#)
                          (LETT |a| NIL . #16#) (LETT #5# |lv| . #16#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |a| (CAR #5#) . #16#) NIL)
                                (ATOM #6#)
                                (PROGN (LETT |z| (CAR #6#) . #16#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (SPADCALL (SPADCALL |z| (QREFELT $ 138))
                                             (-
                                              (SPADCALL
                                               (SPADCALL |a| |v0|
                                                         (QREFELT $ 168))
                                               (QREFELT $ 152)))
                                             (QREFELT $ 112))
                                   . #16#)
                             (COND
                              (#2#
                               (LETT #3# (SPADCALL #3# #4# (QREFELT $ 115))
                                     . #16#))
                              ('T
                               (PROGN
                                (LETT #3# #4# . #16#)
                                (LETT #2# 'T . #16#)))))))
                          (LETT #5#
                                (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #16#))
                                . #16#)
                          (GO G190) G191 (EXIT NIL))
                     (COND (#2# #3#) (#17# (|spadConstant| $ 62))))
                    . #16#)
              (LETT |h|
                    (SPADCALL
                     (SPADCALL |h|
                               (SPADCALL
                                (SPADCALL (SPADCALL |v0| |g| (QREFELT $ 167))
                                          (QREFELT $ 14))
                                (QREFELT $ 138))
                               (QREFELT $ 115))
                     (SPADCALL (SPADCALL |k| (QREFELT $ 96)) |v0|
                               (QREFELT $ 112))
                     (QREFELT $ 115))
                    . #16#)
              (EXIT
               (VECTOR
                (SPADCALL |f| (LIST (QCDR (QCDR |rec|))) (LIST |h|)
                          (QREFELT $ 119))
                (LIST (QCDR (QCDR |rec|))) (LIST |h|)))))))))) 

(SDEFUN |EFSTRUC;normalize;2F;54| ((|f| F) ($ F))
        (|EFSTRUC;rtNormalize|
         (|EFSTRUC;localnorm|
          (SPADCALL (SPADCALL |f| (QREFELT $ 23)) (QREFELT $ 192)) $)
         $)) 

(SDEFUN |EFSTRUC;normalize;FSF;55| ((|f| F) (|x| |Symbol|) ($ F))
        (|EFSTRUC;rtNormalize|
         (QVELT
          (SPADCALL
           (SPADCALL (SPADCALL |f| |x| (QREFELT $ 20)) |x| (QREFELT $ 194)) |x|
           (QREFELT $ 180))
          0)
         $)) 

(SDEFUN |EFSTRUC;factdeprel|
        ((|l| |List| (|Kernel| F)) (|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((#1=#:G950 NIL) (#2=#:G952 NIL) (#3=#:G944 NIL) (#4=#:G943 (F))
          (#5=#:G945 (F)) (#6=#:G954 NIL) (|i| NIL)
          (|r| (|Union| (|Integer|) "failed")) (|m| (F)) (#7=#:G953 NIL)
          (|x| NIL) (#8=#:G951 NIL) (|n| (F)))
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
                   ((SPADCALL (QCDR |r|) 0 (QREFELT $ 111))
                    (PROGN
                     (LETT #8#
                           (CONS 1
                                 (SPADCALL
                                  (SPADCALL (QCDR |r|) (QREFELT $ 196))
                                  (QREFELT $ 13)))
                           . #9#)
                     (GO #10=#:G948))))))))
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
                            (SPADCALL (SPADCALL |n| |m| (QREFELT $ 140))
                                      (QREFELT $ 53))
                            . #9#)
                      (EXIT
                       (COND
                        ((QEQCAR |r| 0)
                         (PROGN
                          (LETT #1#
                                (COND
                                 ((SPADCALL (QCDR |r|) 0 (QREFELT $ 111))
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
                                                                          142))
                                                               . #9#)
                                                         (COND
                                                          (#3#
                                                           (LETT #4#
                                                                 (SPADCALL #4#
                                                                           #5#
                                                                           (QREFELT
                                                                            $
                                                                            115))
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
                                                                        62))))
                                                (SPADCALL |x| (QREFELT $ 96))
                                                (QREFELT $ 115)))
                                         . #9#)
                                   (GO #11=#:G949)))
                                 ('T (|error| "bad order of factorials")))
                                . #9#)
                          (GO #12=#:G946)))))))
                    #12# (EXIT #1#))
                   (LETT #7# (CDR #7#) . #9#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 2 'T))))
            #10# (EXIT #8#)))
          #11# (EXIT #2#)))) 

(SDEFUN |EFSTRUC;normalize;2F;57| ((|f| F) ($ F))
        (|EFSTRUC;rtNormalize|
         (|EFSTRUC;localnorm| (SPADCALL |f| (QREFELT $ 23)) $) $)) 

(SDEFUN |EFSTRUC;normalize;FSF;58| ((|f| F) (|x| |Symbol|) ($ F))
        (|EFSTRUC;rtNormalize|
         (QVELT
          (SPADCALL (SPADCALL |f| |x| (QREFELT $ 20)) |x| (QREFELT $ 180)) 0)
         $)) 

(DECLAIM (NOTINLINE |ElementaryFunctionStructurePackage;|)) 

(DEFUN |ElementaryFunctionStructurePackage| (&REST #1=#:G958)
  (SPROG NIL
         (PROG (#2=#:G959)
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
          (LETT $ (GETREFV 197) . #1#)
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
                      (CONS (|dispatchFunction| |EFSTRUC;tanQ;F2F;12|) $)))
           ('T
            (QSETREFV $ 51
                      (CONS (|dispatchFunction| |EFSTRUC;tanQ;F2F;13|) $))))
          (QSETREFV $ 82 '|%alg|)
          (QSETREFV $ 134
                    (SPADCALL (SPADCALL '|%iint| (QREFELT $ 131))
                              (QREFELT $ 133)))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (QSETREFV $ 190
                       (CONS (|dispatchFunction| |EFSTRUC;irootDep;KU;50|)
                             $))))
           ('T
            (QSETREFV $ 190
                      (CONS (|dispatchFunction| |EFSTRUC;irootDep;KU;51|) $))))
          (COND
           ((|HasCategory| |#2| '(|CombinatorialOpsCategory|))
            (PROGN
             (QSETREFV $ 193
                       (CONS (|dispatchFunction| |EFSTRUC;normalize;2F;54|) $))
             (QSETREFV $ 195
                       (CONS (|dispatchFunction| |EFSTRUC;normalize;FSF;55|)
                             $))))
           ('T
            (PROGN
             (QSETREFV $ 193
                       (CONS (|dispatchFunction| |EFSTRUC;normalize;2F;57|) $))
             (QSETREFV $ 195
                       (CONS (|dispatchFunction| |EFSTRUC;normalize;FSF;58|)
                             $)))))
          $))) 

(MAKEPROP '|ElementaryFunctionStructurePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'HTRIG
              'TRIG '|comb?| (0 . |pi|) (|Integer|) (4 . |coerce|) (9 . -)
              (14 . /) '|mpiover2| (|Mapping| 7 29) |EFSTRUC;rmap;M2F;28|
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
              (120 . |tan|) (125 . |empty?|) (|List| 95) (130 . |tower|)
              (135 . |select!|) (141 . |One|) (145 . |One|)
              (|NonNegativeInteger|) (149 . |first|) (155 . |concat|)
              (161 . |concat|) (167 . |Zero|) (171 . |differentiate|)
              (|Vector| 7) (177 . |setelt!|) (184 . |elt|) (|OutputForm|)
              (190 . |coerce|) (|Void|) (195 . |print|) (|Matrix| 7)
              (200 . |setelt!|) (|Union| 113 '"failed")
              (|IntegerLinearDependence| 7) (208 . |particularSolutionOverQ|)
              (214 . |One|) 'ALGOP (|BasicOperator|) (218 . |operator|)
              (223 . |has?|) (229 . |elt|) (|Union| 39 '#1#)
              (235 . |retractIfCan|) (240 . |kernels|) (245 . =) (251 . -)
              (|List| 39) (|MultiplicativeDependence|) (256 . |logDependenceQ|)
              (|Kernel| $) (262 . |coerce|) (267 . |log|)
              (|Union| 102 '"failed") (|Expression| 6) (|Numeric| 6)
              (272 . |numericIfCan|) (|Float|) (278 . |rationalApproximation|)
              (284 . |Zero|) (288 . |coerce|) (293 . /) (299 . |float|)
              (306 . -) (312 . |abs|) (317 . >) (323 . >) (329 . ^)
              (|Vector| 39) (335 . |zero|) (340 . *) (346 . |new|)
              (350 . |kernel|) (|List| $) (355 . |eval|) (362 . |atan|)
              (367 . ~=) (373 . |coerce|) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 29)
              (|PolynomialCategoryLifting| (|IndexedExponents| 29) 29 6 124 7)
              (378 . |map|) (|SparseMultivariatePolynomial| 6 95)
              (385 . |numer|) (390 . |denom|) (|CommonOperators|)
              (395 . |operator|) (|LiouvillianFunction| 6 7) (400 . |operator|)
              '|opint| (405 . |is?|) (411 . |zero?|) (416 . |last|)
              (421 . |exp|) (426 . ^) (432 . -) (438 . |sqrt|) (443 . +)
              (449 . *) (455 . |One|) (459 . |elt|) (465 . |coerce|) (470 . D)
              (476 . |kernel|) (482 . |name|) (487 . |minIndex|) (492 . |elt|)
              (498 . |retract|) (503 . |nthRoot|) (509 . |second|)
              (514 . |retract|) (519 . ~=) (525 . |coerce|) (530 . /) (536 . ^)
              (542 . *) (548 . |retractIfCan|) (553 . |height|) (558 . >)
              (|Union| $ '"failed") (564 . |recip|) (569 . |inv|) (574 . *)
              (580 . *) (586 . |every?|)
              (|Record| (|:| |num| (|Vector| 12)) (|:| |den| 12))
              (|InnerCommonDenominator| 12 39 (|Vector| 12) 113)
              (592 . |splitDenominator|) (597 . |lcm|) (602 . *)
              (608 . |coerce|) (613 . |setDifference|) (619 . |empty?|)
              (|Record| (|:| |func| 7) (|:| |kers| 37) (|:| |vals| 31))
              |EFSTRUC;rischNormalize;FLR;44| |EFSTRUC;rischNormalize;FSR;45|
              |EFSTRUC;rootNormalize;FKF;46| (624 . |construct|)
              (629 . |particularSolutionOverQ|) (|Union| 7 '"failed")
              |EFSTRUC;validExponential;LFSU;49|
              (|Record| (|:| |exponent| 63) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 29) 29 6 124 7)
              (635 . |froot|)
              (|Union| (|:| |vec| 113) (|:| |func| 7) (|:| |fail| 27))
              (641 . |irootDep|) (646 . |lcm|) (652 . |factorials|)
              (657 . |normalize|) (662 . |factorials|) (668 . |normalize|)
              (674 . |factorial|))
           '#(|validExponential| 679 |tanQ| 686 |rootNormalize| 692 |rmap| 698
              |rischNormalize| 704 |realLiouvillian| 716 |realElementary| 727
              |normalize| 738 |irootDep| 749)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 196
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
                                                   0 0 55 1 7 0 0 56 1 21 27 0
                                                   57 1 7 58 0 59 2 37 0 36 0
                                                   60 0 6 0 61 0 7 0 62 2 37 0
                                                   0 63 64 2 37 0 0 0 65 2 31 0
                                                   0 0 66 0 6 0 67 2 7 0 0 19
                                                   68 3 69 7 0 12 7 70 2 69 7 0
                                                   12 71 1 7 72 0 73 1 72 74 0
                                                   75 4 76 7 0 12 12 7 77 2 79
                                                   78 76 69 80 0 39 0 81 1 29
                                                   83 0 84 2 83 27 0 19 85 2 31
                                                   7 0 12 86 1 7 87 0 88 1 7 58
                                                   0 89 2 39 27 0 0 90 1 39 0 0
                                                   91 2 93 78 92 39 94 1 7 0 95
                                                   96 1 7 0 0 97 2 100 98 99 42
                                                   101 2 102 39 0 63 103 0 39 0
                                                   104 1 102 0 39 105 2 102 0 0
                                                   0 106 3 102 0 12 12 42 107 2
                                                   102 0 0 0 108 1 102 0 0 109
                                                   2 102 27 0 0 110 2 12 27 0 0
                                                   111 2 7 0 0 12 112 1 113 0
                                                   63 114 2 7 0 0 0 115 0 19 0
                                                   116 1 29 0 19 117 3 7 0 0 58
                                                   118 119 1 7 0 0 120 2 29 27
                                                   0 0 121 1 7 0 6 122 3 125 7
                                                   17 123 124 126 1 7 127 0 128
                                                   1 7 127 0 129 1 130 83 19
                                                   131 1 132 83 83 133 2 83 27
                                                   0 19 135 1 7 27 0 136 1 31 7
                                                   0 137 1 7 0 0 138 2 7 0 0 42
                                                   139 2 7 0 0 0 140 1 7 0 0
                                                   141 2 7 0 0 0 142 2 7 0 42 0
                                                   143 0 124 0 144 2 7 0 83 118
                                                   145 1 7 0 19 146 2 7 0 0 19
                                                   147 2 7 0 83 118 148 1 83 19
                                                   0 149 1 113 12 0 150 2 113
                                                   39 0 12 151 1 39 12 0 152 2
                                                   7 0 0 12 153 1 31 7 0 154 1
                                                   7 12 0 155 2 12 27 0 0 156 1
                                                   39 0 12 157 2 39 0 0 0 158 2
                                                   7 0 0 39 159 2 7 0 39 0 160
                                                   1 39 52 0 161 1 29 63 0 162
                                                   2 63 27 0 0 163 1 39 164 0
                                                   165 1 39 0 0 166 2 7 0 12 0
                                                   167 2 39 0 0 12 168 2 37 27
                                                   36 0 169 1 171 170 113 172 1
                                                   12 0 118 173 2 39 0 12 0 174
                                                   1 6 0 12 175 2 21 0 0 0 176
                                                   1 113 27 0 177 1 69 0 31 182
                                                   2 79 78 69 7 183 2 187 186 7
                                                   63 188 1 0 189 29 190 2 12 0
                                                   0 0 191 1 7 0 0 192 1 0 7 7
                                                   193 2 7 0 0 19 194 2 0 7 7
                                                   19 195 1 12 0 0 196 3 0 184
                                                   37 7 19 185 2 0 7 39 7 51 2
                                                   0 7 7 29 181 2 0 7 17 7 18 2
                                                   0 178 7 19 180 2 0 178 7 21
                                                   179 1 0 7 7 24 2 0 7 7 19 25
                                                   1 0 7 7 23 2 0 7 7 19 20 1 0
                                                   7 7 193 2 0 7 7 19 195 1 0
                                                   189 29 190)))))
           '|lookupComplete|)) 
