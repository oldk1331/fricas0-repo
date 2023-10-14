
(/VERSIONCHECK 2) 

(DEFUN |RECOP;getINFOREC| (|infoOp| $)
  (PROG (#1=#:G141)
    (RETURN
     (PROG2
         (LETT #1# (SPADCALL |infoOp| '%INFOREC (QREFELT $ 18))
               |RECOP;getINFOREC|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0) (|None|) #1#))))) 

(DEFUN |RECOP;setINFOREC| (|infoOp| |rec| $)
  (SPADCALL |infoOp| '%INFOREC |rec| (QREFELT $ 16))) 

(DEFUN |RECOP;getINFOSER| (|infoOp| $)
  (PROG (#1=#:G147)
    (RETURN
     (PROG2
         (LETT #1# (SPADCALL |infoOp| '%INFOSER (QREFELT $ 18))
               |RECOP;getINFOSER|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0) (|None|) #1#))))) 

(DEFUN |RECOP;setINFOSER| (|infoOp| |ser| $)
  (SPADCALL |infoOp| '%INFOSER |ser| (QREFELT $ 16))) 

(DEFUN |RECOP;getShiftRec| (|op| |f| |n| $)
  (PROG (#1=#:G162 |num| |p| |a|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |a| (SPADCALL |f| (QREFELT $ 21)) . #2=(|RECOP;getShiftRec|))
            (COND
             ((SPADCALL (CONS #'|RECOP;getShiftRec!0| (VECTOR $ |n|)) |a|
                        (QREFELT $ 26))
              (PROGN (LETT #1# (CONS 0 0) . #2#) (GO #1#))))
            (COND
             ((SPADCALL (LENGTH |a|) 1 (QREFELT $ 28))
              (|error| "RECOP: operator should have only one argument")))
            (LETT |p|
                  (SPADCALL (SPADCALL |a| 1 (QREFELT $ 29))
                            (SPADCALL (SPADCALL |n| (QREFELT $ 22))
                                      (QREFELT $ 31))
                            (QREFELT $ 33))
                  . #2#)
            (COND
             ((SPADCALL (SPADCALL |p| (QREFELT $ 35)) (|spadConstant| $ 36)
                        (QREFELT $ 37))
              (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#))))
            (LETT |num| (SPADCALL |p| (QREFELT $ 39)) . #2#)
            (EXIT
             (COND
              ((EQL (SPADCALL |num| (QREFELT $ 41)) 1)
               (COND
                ((SPADCALL (SPADCALL |num| 1 (QREFELT $ 42))
                           (|spadConstant| $ 14) (QREFELT $ 43))
                 (COND
                  ((SPADCALL (CONS #'|RECOP;getShiftRec!1| (VECTOR $ |n|))
                             (SPADCALL |num| (QREFELT $ 44)) (QREFELT $ 26))
                   (PROGN
                    (LETT #1#
                          (SPADCALL (SPADCALL |num| 0 (QREFELT $ 42))
                                    (QREFELT $ 48))
                          . #2#)
                    (GO #1#)))
                  (#3='T
                   (PROGN (LETT #1# (CONS 1 #4="failed") . #2#) (GO #1#)))))
                (#3# (PROGN (LETT #1# (CONS 1 #4#) . #2#) (GO #1#)))))
              (#3# (PROGN (LETT #1# (CONS 1 #4#) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |RECOP;getShiftRec!1| (|z| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|RECOP;getShiftRec|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL |z| (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 24)))))) 

(DEFUN |RECOP;getShiftRec!0| (|z| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|RECOP;getShiftRec|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL |z| (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 24)))))) 

(DEFUN |RECOP;shiftInfoRec| (|op| |argsym| |eq| $)
  (PROG (#1=#:G174 #2=#:G176 |minShift| |nextKernel| |maxShift| |error?|
         |shift| #3=#:G177 |f|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |error?| 'T . #4=(|RECOP;shiftInfoRec|))
            (SEQ (LETT |f| NIL . #4#)
                 (LETT #3# (SPADCALL |eq| (QREFELT $ 50)) . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |f| |op| (QREFELT $ 51))
                     (SEQ
                      (LETT |shift| (|RECOP;getShiftRec| |op| |f| |argsym| $)
                            . #4#)
                      (EXIT
                       (COND
                        (|error?|
                         (SEQ (LETT |error?| 'NIL . #4#)
                              (LETT |nextKernel| |f| . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |shift| 0)
                                 (SEQ (LETT |maxShift| (QCDR |shift|) . #4#)
                                      (EXIT
                                       (LETT |minShift| (QCDR |shift|)
                                             . #4#))))
                                ('T
                                 (PROGN
                                  (LETT #2# (CONS 1 "failed") . #4#)
                                  (GO #2#)))))))
                        ((QEQCAR |shift| 0)
                         (SEQ
                          (COND
                           ((< |maxShift| (QCDR |shift|))
                            (SEQ (LETT |maxShift| (QCDR |shift|) . #4#)
                                 (EXIT (LETT |nextKernel| |f| . #4#)))))
                          (EXIT
                           (COND
                            ((SPADCALL |minShift| (QCDR |shift|)
                                       (QREFELT $ 52))
                             (LETT |minShift| (QCDR |shift|) . #4#))))))
                        ('T
                         (PROGN
                          (LETT #2# (CONS 1 "failed") . #4#)
                          (GO #2#))))))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (COND
             (|error?|
              (|error| "evalRec: equation does not contain operator")))
            (EXIT
             (CONS 0
                   (VECTOR
                    (PROG1 (LETT #1# (- |maxShift| |minShift|) . #4#)
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    |maxShift| |nextKernel|)))))
      #2# (EXIT #2#))))) 

(DEFUN |RECOP;makeRec;BoSFLSF;7| (|op| |argsym| |eq| |params| |values| $)
  (PROG (#1=#:G222 |info| |fn| |fl| #2=#:G226 |i| #3=#:G225 |ord1| |max1|
         |next| #4=#:G224 #5=#:G223 |uc1| |uc0| |c1| |c0| |argsymKer| |num| |p|
         |shiftInfo|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |shiftInfo| (|RECOP;shiftInfoRec| |op| |argsym| |eq| $)
              . #6=(|RECOP;makeRec;BoSFLSF;7|))
        (EXIT
         (COND
          ((QEQCAR |shiftInfo| 1)
           (SEQ
            (LETT |info|
                  (SPADCALL (SPADCALL '|inforec| (QREFELT $ 53)) 0
                            (QREFELT $ 54))
                  . #6#)
            (|RECOP;setINFOREC| |info|
             (VECTOR |eq| |argsym| |op| |params| |values| (CONS 1 "failed")
                     (CONS 1 "failed"))
             $)
            (EXIT
             (PROGN
              (LETT #1#
                    (SPADCALL (QREFELT $ 11)
                              (SPADCALL
                               (LIST (SPADCALL |argsym| (QREFELT $ 22))
                                     (SPADCALL |info| NIL (QREFELT $ 57)))
                               |params| (QREFELT $ 58))
                              (QREFELT $ 57))
                    . #6#)
              (GO #1#)))))
          (#7='T
           (SEQ
            (LETT |p|
                  (SPADCALL |eq| (QVELT (QCDR |shiftInfo|) 2) (QREFELT $ 33))
                  . #6#)
            (LETT |num| (SPADCALL |p| (QREFELT $ 39)) . #6#)
            (COND
             ((NULL (SPADCALL (SPADCALL |p| (QREFELT $ 59)) (QREFELT $ 60)))
              (|error|
               "makeRec assumes that the equation has no denominator")))
            (EXIT
             (COND
              ((EQL (SPADCALL |num| (QREFELT $ 41)) 1)
               (SEQ
                (LETT |argsymKer|
                      (SPADCALL (SPADCALL |argsym| (QREFELT $ 22))
                                (QREFELT $ 31))
                      . #6#)
                (LETT |c0| (SPADCALL |num| 0 (QREFELT $ 42)) . #6#)
                (LETT |c1| (SPADCALL |num| 1 (QREFELT $ 42)) . #6#)
                (EXIT
                 (COND
                  ((ZEROP (QVELT (QCDR |shiftInfo|) 0))
                   (COND
                    ((OR (SPADCALL |c1| |argsym| (QREFELT $ 61))
                         (NULL
                          (OR
                           (OR (SPADCALL |c0| (QREFELT $ 67))
                               (NULL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (LETT |uc0|
                                         (SPADCALL |c0| |argsymKer|
                                                   (QREFELT $ 33))
                                         . #6#)
                                   (QREFELT $ 39))
                                  (SPADCALL
                                   (LETT |uc1|
                                         (SPADCALL |c1| |argsymKer|
                                                   (QREFELT $ 33))
                                         . #6#)
                                   (QREFELT $ 39))
                                  (QREFELT $ 75))
                                 (QREFELT $ 60))))
                           (NULL
                            (SPADCALL
                             (SPADCALL (SPADCALL |uc0| (QREFELT $ 59))
                                       (SPADCALL |uc1| (QREFELT $ 59))
                                       (QREFELT $ 75))
                             (QREFELT $ 60))))))
                     (PROGN
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL (SPADCALL |c0| |c1| (QREFELT $ 62))
                                       (QREFELT $ 63))
                             (SPADCALL |argsym| (QREFELT $ 22))
                             (SPADCALL (SPADCALL |argsym| (QREFELT $ 22))
                                       (SPADCALL (QVELT (QCDR |shiftInfo|) 1)
                                                 (QREFELT $ 64))
                                       (QREFELT $ 65))
                             (QREFELT $ 66))
                            . #6#)
                      (GO #1#)))
                    ('T
                     (SEQ
                      (LETT |next|
                            (SPADCALL
                             (SPADCALL (SPADCALL |num| 0 (QREFELT $ 42))
                                       (SPADCALL |num| 1 (QREFELT $ 42))
                                       (QREFELT $ 62))
                             (QREFELT $ 63))
                            . #6#)
                      (LETT |max1| (QVELT (QCDR |shiftInfo|) 1) . #6#)
                      (LETT |ord1| (- (QVELT (QCDR |shiftInfo|) 0) 1) . #6#)
                      (LETT |fl|
                            (CONS (SPADCALL |argsym| (QREFELT $ 22))
                                  (PROGN
                                   (LETT #5# NIL . #6#)
                                   (SEQ (LETT |i| 1 . #6#)
                                        (LETT #4# (+ |ord1| 1) . #6#) G190
                                        (COND
                                         ((|greater_SI| |i| #4#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL |op|
                                                           (SPADCALL
                                                            (SPADCALL |argsym|
                                                                      (QREFELT
                                                                       $ 22))
                                                            (SPADCALL
                                                             (- |max1| |i|)
                                                             (QREFELT $ 64))
                                                            (QREFELT $ 68))
                                                           (QREFELT $ 69))
                                                 #5#)
                                                . #6#)))
                                        (LETT |i| (|inc_SI| |i|) . #6#)
                                        (GO G190) G191 (EXIT (NREVERSE #5#)))))
                            . #6#)
                      (COND
                       ((>= |ord1| 0)
                        (LETT |fn|
                              (CONS #'|RECOP;makeRec;BoSFLSF;7!0|
                                    (VECTOR |ord1| |fl| |next| $))
                              . #6#))
                       (#7#
                        (LETT |fn|
                              (CONS #'|RECOP;makeRec;BoSFLSF;7!1|
                                    (VECTOR |fl| |next| $))
                              . #6#)))
                      (LETT |info|
                            (SPADCALL (SPADCALL '|inforec| (QREFELT $ 53)) 0
                                      (QREFELT $ 54))
                            . #6#)
                      (|RECOP;setINFOREC| |info|
                       (VECTOR |eq| |argsym| |op| |params| |values|
                               (CONS 0 (QVELT (QCDR |shiftInfo|) 0))
                               (CONS 0 |fn|))
                       $)
                      (EXIT
                       (PROGN
                        (LETT #1#
                              (SPADCALL (QREFELT $ 11)
                                        (SPADCALL
                                         (LIST
                                          (SPADCALL |argsym| (QREFELT $ 22))
                                          (SPADCALL |info| NIL (QREFELT $ 57)))
                                         |params| (QREFELT $ 58))
                                        (QREFELT $ 57))
                              . #6#)
                        (GO #1#)))))))
                  (#7#
                   (SEQ
                    (LETT |next|
                          (SPADCALL
                           (SPADCALL (SPADCALL |num| 0 (QREFELT $ 42))
                                     (SPADCALL |num| 1 (QREFELT $ 42))
                                     (QREFELT $ 62))
                           (QREFELT $ 63))
                          . #6#)
                    (LETT |max1| (QVELT (QCDR |shiftInfo|) 1) . #6#)
                    (LETT |ord1| (- (QVELT (QCDR |shiftInfo|) 0) 1) . #6#)
                    (LETT |fl|
                          (CONS (SPADCALL |argsym| (QREFELT $ 22))
                                (PROGN
                                 (LETT #3# NIL . #6#)
                                 (SEQ (LETT |i| 1 . #6#)
                                      (LETT #2# (+ |ord1| 1) . #6#) G190
                                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #3#
                                              (CONS
                                               (SPADCALL |op|
                                                         (SPADCALL
                                                          (SPADCALL |argsym|
                                                                    (QREFELT $
                                                                             22))
                                                          (SPADCALL
                                                           (- |max1| |i|)
                                                           (QREFELT $ 64))
                                                          (QREFELT $ 68))
                                                         (QREFELT $ 69))
                                               #3#)
                                              . #6#)))
                                      (LETT |i| (|inc_SI| |i|) . #6#) (GO G190)
                                      G191 (EXIT (NREVERSE #3#)))))
                          . #6#)
                    (COND
                     ((>= |ord1| 0)
                      (LETT |fn|
                            (CONS #'|RECOP;makeRec;BoSFLSF;7!2|
                                  (VECTOR |ord1| |fl| |next| $))
                            . #6#))
                     (#7#
                      (LETT |fn|
                            (CONS #'|RECOP;makeRec;BoSFLSF;7!3|
                                  (VECTOR |fl| |next| $))
                            . #6#)))
                    (LETT |info|
                          (SPADCALL (SPADCALL '|inforec| (QREFELT $ 53)) 0
                                    (QREFELT $ 54))
                          . #6#)
                    (|RECOP;setINFOREC| |info|
                     (VECTOR |eq| |argsym| |op| |params| |values|
                             (CONS 0 (QVELT (QCDR |shiftInfo|) 0))
                             (CONS 0 |fn|))
                     $)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (SPADCALL (QREFELT $ 11)
                                      (SPADCALL
                                       (LIST (SPADCALL |argsym| (QREFELT $ 22))
                                             (SPADCALL |info| NIL
                                                       (QREFELT $ 57)))
                                       |params| (QREFELT $ 58))
                                      (QREFELT $ 57))
                            . #6#)
                      (GO #1#)))))))))
              (#7#
               (SEQ
                (LETT |info|
                      (SPADCALL (SPADCALL '|inforec| (QREFELT $ 53)) 0
                                (QREFELT $ 54))
                      . #6#)
                (|RECOP;setINFOREC| |info|
                 (VECTOR |eq| |argsym| |op| |params| |values|
                         (CONS 0 (QVELT (QCDR |shiftInfo|) 0))
                         (CONS 1 "failed"))
                 $)
                (EXIT
                 (PROGN
                  (LETT #1#
                        (SPADCALL (QREFELT $ 11)
                                  (SPADCALL
                                   (LIST (SPADCALL |argsym| (QREFELT $ 22))
                                         (SPADCALL |info| NIL (QREFELT $ 57)))
                                   |params| (QREFELT $ 58))
                                  (QREFELT $ 57))
                        . #6#)
                  (GO #1#)))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |RECOP;makeRec;BoSFLSF;7!3| (|l| $$)
  (PROG ($ |next| |fl|)
    (LETT $ (QREFELT $$ 2) . #1=(|RECOP;makeRec;BoSFLSF;7|))
    (LETT |next| (QREFELT $$ 1) . #1#)
    (LETT |fl| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (LIST
       (SPADCALL (SPADCALL |l| (QREFELT $ 70)) (|spadConstant| $ 14)
                 (QREFELT $ 68))
       (SPADCALL |next| |fl| |l| (QREFELT $ 71))))))) 

(DEFUN |RECOP;makeRec;BoSFLSF;7!2| (|l| $$)
  (PROG ($ |next| |fl| |ord1|)
    (LETT $ (QREFELT $$ 3) . #1=(|RECOP;makeRec;BoSFLSF;7|))
    (LETT |next| (QREFELT $$ 2) . #1#)
    (LETT |fl| (QREFELT $$ 1) . #1#)
    (LETT |ord1| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G214)
        (RETURN
         (SPADCALL
          (LIST
           (SPADCALL (SPADCALL |l| (QREFELT $ 70)) (|spadConstant| $ 14)
                     (QREFELT $ 68))
           (SPADCALL |next| |fl| |l| (QREFELT $ 71)))
          (SPADCALL (SPADCALL |l| (QREFELT $ 72))
                    (PROG1 (LETT #2# |ord1| NIL)
                      (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                    (QREFELT $ 73))
          (QREFELT $ 58)))))))) 

(DEFUN |RECOP;makeRec;BoSFLSF;7!1| (|l| $$)
  (PROG ($ |next| |fl|)
    (LETT $ (QREFELT $$ 2) . #1=(|RECOP;makeRec;BoSFLSF;7|))
    (LETT |next| (QREFELT $$ 1) . #1#)
    (LETT |fl| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (LIST
       (SPADCALL (SPADCALL |l| (QREFELT $ 70)) (|spadConstant| $ 14)
                 (QREFELT $ 68))
       (SPADCALL |next| |fl| |l| (QREFELT $ 71))))))) 

(DEFUN |RECOP;makeRec;BoSFLSF;7!0| (|l| $$)
  (PROG ($ |next| |fl| |ord1|)
    (LETT $ (QREFELT $$ 3) . #1=(|RECOP;makeRec;BoSFLSF;7|))
    (LETT |next| (QREFELT $$ 2) . #1#)
    (LETT |fl| (QREFELT $$ 1) . #1#)
    (LETT |ord1| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G189)
        (RETURN
         (SPADCALL
          (LIST
           (SPADCALL (SPADCALL |l| (QREFELT $ 70)) (|spadConstant| $ 14)
                     (QREFELT $ 68))
           (SPADCALL |next| |fl| |l| (QREFELT $ 71)))
          (SPADCALL (SPADCALL |l| (QREFELT $ 72))
                    (PROG1 (LETT #2# |ord1| NIL)
                      (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                    (QREFELT $ 73))
          (QREFELT $ 58)))))))) 

(DEFUN |RECOP;irecur| (|l| $)
  (PROG (#1=#:G250 |s| |ll| #2=#:G252 |i| #3=#:G251 |o| #4=#:G240 |g| #5=#:G236
         N #6=#:G234 |info| |n| |arg|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |arg| (|SPADfirst| |l|) . #7=(|RECOP;irecur|))
            (LETT |n| (SPADCALL |arg| (QREFELT $ 48)) . #7#)
            (EXIT
             (COND
              ((QEQCAR |n| 0)
               (COND
                ((>= (QCDR |n|) 0)
                 (SEQ
                  (LETT |info|
                        (|RECOP;getINFOREC|
                         (SPADCALL
                          (SPADCALL (SPADCALL |l| (QREFELT $ 78))
                                    (QREFELT $ 31))
                          (QREFELT $ 79))
                         $)
                        . #7#)
                  (COND
                   ((SPADCALL (QVELT |info| 4)
                              (+
                               (PROG1 (LETT #6# (QCDR |n|) . #7#)
                                 (|check_subtype| (>= #6# 0)
                                                  '(|NonNegativeInteger|) #6#))
                               1)
                              (QREFELT $ 80))
                    (COND
                     ((QEQCAR (QVELT |info| 6) 1)
                      (PROGN
                       (LETT #1# (SPADCALL (QREFELT $ 11) |l| (QREFELT $ 57))
                             . #7#)
                       (GO #1#)))
                     (#8='T
                      (SEQ
                       (LETT N (SPADCALL (QVELT |info| 4) (QREFELT $ 81))
                             . #7#)
                       (LETT |g|
                             (PROG2 (LETT #5# (QVELT |info| 6) . #7#)
                                 (QCDR #5#)
                               (|check_union| (QEQCAR #5# 0)
                                              (|Mapping| (|List| (QREFELT $ 7))
                                                         (|List|
                                                          (QREFELT $ 7)))
                                              #5#))
                             . #7#)
                       (LETT |o|
                             (PROG2 (LETT #4# (QVELT |info| 5) . #7#)
                                 (QCDR #4#)
                               (|check_union| (QEQCAR #4# 0)
                                              (|NonNegativeInteger|) #4#))
                             . #7#)
                       (LETT |ll|
                             (CONS
                              (SPADCALL (SPADCALL N (QREFELT $ 64))
                                        (SPADCALL |o| (QREFELT $ 64))
                                        (QREFELT $ 65))
                              (PROGN
                               (LETT #3# NIL . #7#)
                               (SEQ (LETT |i| 0 . #7#)
                                    (LETT #2# (- |o| 1) . #7#) G190
                                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #3#
                                            (CONS
                                             (SPADCALL (QVELT |info| 4)
                                                       (- N |i|)
                                                       (QREFELT $ 82))
                                             #3#)
                                            . #7#)))
                                    (LETT |i| (|inc_SI| |i|) . #7#) (GO G190)
                                    G191 (EXIT (NREVERSE #3#)))))
                             . #7#)
                       (LETT |s|
                             (SPADCALL (ELT $ 78)
                                       (SPADCALL
                                        (SPADCALL |g| |ll| (QREFELT $ 85))
                                        (QREFELT $ 86))
                                       (QREFELT $ 89))
                             . #7#)
                       (EXIT
                        (QSETVELT |info| 4
                                  (SPADCALL (QVELT |info| 4) |s|
                                            (QREFELT $ 90)))))))))
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (QVELT |info| 4) (+ (QCDR |n|) 1)
                                     (QREFELT $ 82))
                           (QVELT |info| 3) (SPADCALL |l| 2 (QREFELT $ 91))
                           (QREFELT $ 71))
                          . #7#)
                    (GO #1#)))))
                (#8#
                 (PROGN
                  (LETT #1# (SPADCALL (QREFELT $ 11) |l| (QREFELT $ 57)) . #7#)
                  (GO #1#)))))
              (#8#
               (PROGN
                (LETT #1# (SPADCALL (QREFELT $ 11) |l| (QREFELT $ 57)) . #7#)
                (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |RECOP;ddrec| (|l| $)
  (PROG (|RecList| #1=#:G262 |i| #2=#:G261 |RecEq| |RecCoeff| |v| #3=#:G255 |e|
         |lv| |lp| |f| |n0| |n| |info|)
    (RETURN
     (SEQ
      (LETT |info|
            (|RECOP;getINFOREC|
             (SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 78)) (QREFELT $ 31))
                       (QREFELT $ 79))
             $)
            . #4=(|RECOP;ddrec|))
      (LETT |n| (|SPADfirst| |l|) . #4#)
      (LETT |n0| (SPADCALL (QVELT |info| 1) (QREFELT $ 22)) . #4#)
      (LETT |f| (QVELT |info| 2) . #4#)
      (LETT |lp| (CONS |n0| (QVELT |info| 3)) . #4#)
      (LETT |lv| (CONS |n| (SPADCALL |l| 2 (QREFELT $ 91))) . #4#)
      (LETT |e| (SPADCALL (QVELT |info| 0) |lp| |lv| (QREFELT $ 71)) . #4#)
      (LETT |v| (SPADCALL (QREFELT $ 55)) . #4#)
      (COND
       ((QEQCAR (QVELT |info| 5) 0)
        (LETT |v|
              (MIN |v|
                   (PROG2 (LETT #3# (QVELT |info| 5) . #4#)
                       (QCDR #3#)
                     (|check_union| (QEQCAR #3# 0) (|NonNegativeInteger|)
                                    #3#)))
              . #4#)))
      (LETT |RecCoeff|
            (SPADCALL
             (SPADCALL (SPADCALL |f| |n| (QREFELT $ 69)) (QREFELT $ 95)) ": "
             (QREFELT $ 96))
            . #4#)
      (LETT |RecEq|
            (SPADCALL |RecCoeff|
                      (SPADCALL (SPADCALL |e| (QREFELT $ 95))
                                (SPADCALL (|spadConstant| $ 45) (QREFELT $ 97))
                                (QREFELT $ 98))
                      (QREFELT $ 96))
            . #4#)
      (LETT |RecList|
            (PROGN
             (LETT #2# NIL . #4#)
             (SEQ (LETT |i| 0 . #4#) (LETT #1# (- |v| 1) . #4#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL |f| (SPADCALL |i| (QREFELT $ 64))
                                       (QREFELT $ 69))
                             (QREFELT $ 95))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (QVELT |info| 4) (+ |i| 1)
                                        (QREFELT $ 82))
                              |lp| |lv| (QREFELT $ 71))
                             (QREFELT $ 95))
                            (QREFELT $ 98))
                           #2#)
                          . #4#)))
                  (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #4#)
      (EXIT
       (SPADCALL (SPADCALL (CONS |RecEq| |RecList|) (QREFELT $ 99))
                 (QREFELT $ 100))))))) 

(DEFUN |RECOP;diffRec| (|l| |x| $)
  (PROG (|xF| |dummyF|)
    (RETURN
     (SEQ
      (LETT |dummyF| (SPADCALL (SPADCALL (QREFELT $ 101)) (QREFELT $ 22))
            . #1=(|RECOP;diffRec|))
      (LETT |xF| (SPADCALL |x| (QREFELT $ 22)) . #1#)
      (EXIT
       (SPADCALL (QREFELT $ 104)
                 (LIST
                  (SPADCALL (SPADCALL (QREFELT $ 11) |l| (QREFELT $ 57)) |xF|
                            |dummyF| (QREFELT $ 66))
                  |dummyF| |xF|)
                 (QREFELT $ 57))))))) 

(DEFUN |RECOP;makeFEq;Bo2SFLSF;11| (|op| |v| |argsym| |eq| |params| |values| $)
  (PROG (#1=#:G306 |fn| |explicit?| |s| |a| |uts| |info| |den| |num| |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((NULL (SPADCALL |eq| |argsym| (QREFELT $ 61)))
          (|error|
           "RECOP: The argument should not be used in the equation of the ADE")))
        (LETT |p|
              (SPADCALL |eq|
                        (SPADCALL
                         (SPADCALL |op| (SPADCALL |v| (QREFELT $ 22))
                                   (QREFELT $ 69))
                         (QREFELT $ 31))
                        (QREFELT $ 33))
              . #2=(|RECOP;makeFEq;Bo2SFLSF;11|))
        (LETT |num| (SPADCALL |p| (QREFELT $ 39)) . #2#)
        (LETT |den| (SPADCALL |p| (QREFELT $ 59)) . #2#)
        (LETT |info|
              (SPADCALL (SPADCALL '|infoser| (QREFELT $ 53)) 0 (QREFELT $ 54))
              . #2#)
        (COND
         ((|HasCategory| (QREFELT $ 6) '(|GcdDomain|))
          (COND
           ((|HasCategory| (QREFELT $ 6) (LIST '|RetractableTo| '(|Integer|)))
            (COND
             ((|HasCategory| (QREFELT $ 6)
                             (LIST '|LinearlyExplicitRingOver| '(|Integer|)))
              (COND
               ((|HasCategory| (QREFELT $ 7) '(|AlgebraicallyClosedField|))
                (COND
                 ((|HasCategory| (QREFELT $ 7)
                                 '(|TranscendentalFunctionCategory|))
                  (COND
                   ((ZEROP (SPADCALL |den| (QREFELT $ 41)))
                    (COND
                     ((EQL (SPADCALL |num| (QREFELT $ 41)) 1)
                      (COND
                       ((SPADCALL (SPADCALL |den| 0 (QREFELT $ 42))
                                  (SPADCALL |op| (QREFELT $ 105))
                                  (QREFELT $ 61))
                        (COND
                         ((SPADCALL (SPADCALL |num| 0 (QREFELT $ 42))
                                    (SPADCALL |op| (QREFELT $ 105))
                                    (QREFELT $ 61))
                          (COND
                           ((SPADCALL (SPADCALL |num| 1 (QREFELT $ 42))
                                      (SPADCALL |op| (QREFELT $ 105))
                                      (QREFELT $ 61))
                            (SEQ (LETT |explicit?| 'T . #2#)
                                 (LETT |eq|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |num| 0 (QREFELT $ 42))
                                          (SPADCALL |num| 1 (QREFELT $ 42))
                                          (QREFELT $ 62))
                                         (SPADCALL |den| 0 (QREFELT $ 42))
                                         (QREFELT $ 62))
                                        (QREFELT $ 63))
                                       . #2#)
                                 (LETT |uts|
                                       (|UnivariateTaylorSeries| (QREFELT $ 7)
                                                                 |v|
                                                                 (|spadConstant|
                                                                  $ 46))
                                       . #2#)
                                 (LETT |a|
                                       (SPADCALL |eq|
                                                 (SPADCALL
                                                  (SPADCALL |v| (QREFELT $ 22))
                                                  (|spadConstant| $ 46)
                                                  (QREFELT $ 107))
                                                 (QREFELT $ 110))
                                       . #2#)
                                 (LETT |s|
                                       (SPADCALL |a|
                                                 (|compiledLookupCheck|
                                                  '|retract|
                                                  (LIST (|devaluate| |uts|)
                                                        (LIST '|Any|))
                                                  (|AnyFunctions1| |uts|)))
                                       . #2#)
                                 (EXIT
                                  (LETT |fn|
                                        (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!0|
                                              (VECTOR |uts| $ |s|))
                                        . #2#))))
                           (#3='T
                            (SEQ (LETT |explicit?| 'NIL . #2#)
                                 (EXIT
                                  (LETT |fn|
                                        (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!1|
                                              (VECTOR $ |values| |v| |op|
                                                      |eq|))
                                        . #2#))))))
                         (#3#
                          (SEQ (LETT |explicit?| 'NIL . #2#)
                               (EXIT
                                (LETT |fn|
                                      (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!2|
                                            (VECTOR $ |values| |v| |op| |eq|))
                                      . #2#))))))
                       (#3#
                        (SEQ (LETT |explicit?| 'NIL . #2#)
                             (EXIT
                              (LETT |fn|
                                    (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!3|
                                          (VECTOR $ |values| |v| |op| |eq|))
                                    . #2#))))))
                     (#3#
                      (SEQ (LETT |explicit?| 'NIL . #2#)
                           (EXIT
                            (LETT |fn|
                                  (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!4|
                                        (VECTOR $ |values| |v| |op| |eq|))
                                  . #2#))))))
                   (#3#
                    (SEQ (LETT |explicit?| 'NIL . #2#)
                         (EXIT
                          (LETT |fn|
                                (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!5|
                                      (VECTOR $ |values| |v| |op| |eq|))
                                . #2#))))))
                 (#3#
                  (SEQ (LETT |explicit?| 'NIL . #2#)
                       (EXIT
                        (LETT |fn|
                              (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!6|
                                    (VECTOR $ |values| |v| |op| |eq|))
                              . #2#))))))
               (#3#
                (SEQ (LETT |explicit?| 'NIL . #2#)
                     (EXIT
                      (LETT |fn|
                            (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!7|
                                  (VECTOR $ |values| |v| |op| |eq|))
                            . #2#))))))
             (#3#
              (SEQ (LETT |explicit?| 'NIL . #2#)
                   (EXIT
                    (LETT |fn|
                          (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!8|
                                (VECTOR $ |values| |v| |op| |eq|))
                          . #2#))))))
           (#3#
            (SEQ (LETT |explicit?| 'NIL . #2#)
                 (EXIT
                  (LETT |fn|
                        (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!9|
                              (VECTOR $ |values| |v| |op| |eq|))
                        . #2#))))))
         (#3#
          (SEQ (LETT |explicit?| 'NIL . #2#)
               (EXIT
                (LETT |fn|
                      (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!10|
                            (VECTOR $ |values| |v| |op| |eq|))
                      . #2#)))))
        (|RECOP;setINFOSER| |info|
         (VECTOR |eq| |argsym| |op| |v| |params| |values| (CONS 1 "failed")
                 (CONS 0 |fn|) |explicit?|)
         $)
        (EXIT
         (PROGN
          (LETT #1#
                (SPADCALL (QREFELT $ 12)
                          (SPADCALL
                           (LIST (SPADCALL |argsym| (QREFELT $ 22))
                                 (SPADCALL |info| NIL (QREFELT $ 57)))
                           |params| (QREFELT $ 58))
                          (QREFELT $ 57))
                . #2#)
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |RECOP;makeFEq;Bo2SFLSF;11!10| ($$)
  (PROG (|eq| |op| |v| |values| $)
    (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
    (LETT |op| (QREFELT $$ 3) . #1#)
    (LETT |v| (QREFELT $$ 2) . #1#)
    (LETT |values| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL |eq| |op| |v|
                 (SPADCALL (SPADCALL |values| (QREFELT $ 111)) (QREFELT $ 112))
                 (QREFELT $ 115))
       (QREFELT $ 116)))))) 

(DEFUN |RECOP;makeFEq;Bo2SFLSF;11!9| ($$)
  (PROG (|eq| |op| |v| |values| $)
    (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
    (LETT |op| (QREFELT $$ 3) . #1#)
    (LETT |v| (QREFELT $$ 2) . #1#)
    (LETT |values| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL |eq| |op| |v|
                 (SPADCALL (SPADCALL |values| (QREFELT $ 111)) (QREFELT $ 112))
                 (QREFELT $ 115))
       (QREFELT $ 116)))))) 

(DEFUN |RECOP;makeFEq;Bo2SFLSF;11!8| ($$)
  (PROG (|eq| |op| |v| |values| $)
    (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
    (LETT |op| (QREFELT $$ 3) . #1#)
    (LETT |v| (QREFELT $$ 2) . #1#)
    (LETT |values| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL |eq| |op| |v|
                 (SPADCALL (SPADCALL |values| (QREFELT $ 111)) (QREFELT $ 112))
                 (QREFELT $ 115))
       (QREFELT $ 116)))))) 

(DEFUN |RECOP;makeFEq;Bo2SFLSF;11!7| ($$)
  (PROG (|eq| |op| |v| |values| $)
    (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
    (LETT |op| (QREFELT $$ 3) . #1#)
    (LETT |v| (QREFELT $$ 2) . #1#)
    (LETT |values| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL |eq| |op| |v|
                 (SPADCALL (SPADCALL |values| (QREFELT $ 111)) (QREFELT $ 112))
                 (QREFELT $ 115))
       (QREFELT $ 116)))))) 

(DEFUN |RECOP;makeFEq;Bo2SFLSF;11!6| ($$)
  (PROG (|eq| |op| |v| |values| $)
    (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
    (LETT |op| (QREFELT $$ 3) . #1#)
    (LETT |v| (QREFELT $$ 2) . #1#)
    (LETT |values| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL |eq| |op| |v|
                 (SPADCALL (SPADCALL |values| (QREFELT $ 111)) (QREFELT $ 112))
                 (QREFELT $ 115))
       (QREFELT $ 116)))))) 

(DEFUN |RECOP;makeFEq;Bo2SFLSF;11!5| ($$)
  (PROG (|eq| |op| |v| |values| $)
    (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
    (LETT |op| (QREFELT $$ 3) . #1#)
    (LETT |v| (QREFELT $$ 2) . #1#)
    (LETT |values| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL |eq| |op| |v|
                 (SPADCALL (SPADCALL |values| (QREFELT $ 111)) (QREFELT $ 112))
                 (QREFELT $ 115))
       (QREFELT $ 116)))))) 

(DEFUN |RECOP;makeFEq;Bo2SFLSF;11!4| ($$)
  (PROG (|eq| |op| |v| |values| $)
    (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
    (LETT |op| (QREFELT $$ 3) . #1#)
    (LETT |v| (QREFELT $$ 2) . #1#)
    (LETT |values| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL |eq| |op| |v|
                 (SPADCALL (SPADCALL |values| (QREFELT $ 111)) (QREFELT $ 112))
                 (QREFELT $ 115))
       (QREFELT $ 116)))))) 

(DEFUN |RECOP;makeFEq;Bo2SFLSF;11!3| ($$)
  (PROG (|eq| |op| |v| |values| $)
    (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
    (LETT |op| (QREFELT $$ 3) . #1#)
    (LETT |v| (QREFELT $$ 2) . #1#)
    (LETT |values| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL |eq| |op| |v|
                 (SPADCALL (SPADCALL |values| (QREFELT $ 111)) (QREFELT $ 112))
                 (QREFELT $ 115))
       (QREFELT $ 116)))))) 

(DEFUN |RECOP;makeFEq;Bo2SFLSF;11!2| ($$)
  (PROG (|eq| |op| |v| |values| $)
    (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
    (LETT |op| (QREFELT $$ 3) . #1#)
    (LETT |v| (QREFELT $$ 2) . #1#)
    (LETT |values| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL |eq| |op| |v|
                 (SPADCALL (SPADCALL |values| (QREFELT $ 111)) (QREFELT $ 112))
                 (QREFELT $ 115))
       (QREFELT $ 116)))))) 

(DEFUN |RECOP;makeFEq;Bo2SFLSF;11!1| ($$)
  (PROG (|eq| |op| |v| |values| $)
    (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
    (LETT |op| (QREFELT $$ 3) . #1#)
    (LETT |v| (QREFELT $$ 2) . #1#)
    (LETT |values| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL |eq| |op| |v|
                 (SPADCALL (SPADCALL |values| (QREFELT $ 111)) (QREFELT $ 112))
                 (QREFELT $ 115))
       (QREFELT $ 116)))))) 

(DEFUN |RECOP;makeFEq;Bo2SFLSF;11!0| ($$)
  (PROG (|s| $ |uts|)
    (LETT |s| (QREFELT $$ 2) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |uts| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |s|
                (|compiledLookupCheck| '|coefficients|
                                       (LIST
                                        (LIST '|Stream|
                                              (|devaluate| (ELT $ 7)))
                                        '$)
                                       |uts|)))))) 

(DEFUN |RECOP;iADE| (|l| $)
  (PROG (#1=#:G323 |g| #2=#:G316 N #3=#:G314 |info| |n| |arg|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |arg| (|SPADfirst| |l|) . #4=(|RECOP;iADE|))
            (LETT |n| (SPADCALL |arg| (QREFELT $ 48)) . #4#)
            (EXIT
             (COND
              ((QEQCAR |n| 0)
               (COND
                ((>= (QCDR |n|) 0)
                 (SEQ
                  (LETT |info|
                        (|RECOP;getINFOSER|
                         (SPADCALL
                          (SPADCALL (SPADCALL |l| (QREFELT $ 78))
                                    (QREFELT $ 31))
                          (QREFELT $ 79))
                         $)
                        . #4#)
                  (COND
                   ((SPADCALL (QVELT |info| 5)
                              (+
                               (PROG1 (LETT #3# (QCDR |n|) . #4#)
                                 (|check_subtype| (>= #3# 0)
                                                  '(|NonNegativeInteger|) #3#))
                               1)
                              (QREFELT $ 80))
                    (COND
                     ((QEQCAR (QVELT |info| 7) 1)
                      (PROGN
                       (LETT #1# (SPADCALL (QREFELT $ 12) |l| (QREFELT $ 57))
                             . #4#)
                       (GO #1#)))
                     (#5='T
                      (SEQ
                       (LETT N (SPADCALL (QVELT |info| 5) (QREFELT $ 81))
                             . #4#)
                       (LETT |g|
                             (PROG2 (LETT #2# (QVELT |info| 7) . #4#)
                                 (QCDR #2#)
                               (|check_union| (QEQCAR #2# 0)
                                              (|Mapping|
                                               (|Stream| (QREFELT $ 7)))
                                              #2#))
                             . #4#)
                       (EXIT (QSETVELT |info| 5 (SPADCALL |g|))))))))
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (QVELT |info| 5) (+ (QCDR |n|) 1)
                                     (QREFELT $ 82))
                           (QVELT |info| 4) (SPADCALL |l| 2 (QREFELT $ 91))
                           (QREFELT $ 71))
                          . #4#)
                    (GO #1#)))))
                (#5#
                 (PROGN
                  (LETT #1# (SPADCALL (QREFELT $ 12) |l| (QREFELT $ 57)) . #4#)
                  (GO #1#)))))
              (#5#
               (PROGN
                (LETT #1# (SPADCALL (QREFELT $ 12) |l| (QREFELT $ 57)) . #4#)
                (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |RECOP;getEq;2F;13| (|f| $)
  (PROG (#1=#:G331 |info| |arg| |op| |kl|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |kl| (SPADCALL |f| (QREFELT $ 50)) . #2=(|RECOP;getEq;2F;13|))
        (COND
         ((EQL (LENGTH |kl|) 1)
          (SEQ (LETT |op| (SPADCALL (|SPADfirst| |kl|) (QREFELT $ 79)) . #2#)
               (LETT |arg| (SPADCALL (|SPADfirst| |kl|) (QREFELT $ 21)) . #2#)
               (COND
                ((SPADCALL |op| '|rootOfADE| (QREFELT $ 118))
                 (SEQ
                  (LETT |info|
                        (SPADCALL
                         (SPADCALL (SPADCALL |arg| (QREFELT $ 78))
                                   (QREFELT $ 31))
                         (QREFELT $ 79))
                        . #2#)
                  (EXIT
                   (PROGN
                    (LETT #1# (QVELT (|RECOP;getINFOSER| |info| $) 0) . #2#)
                    (GO #1#))))))
               (EXIT
                (COND
                 ((SPADCALL |op| '|rootOfRec| (QREFELT $ 118))
                  (SEQ
                   (LETT |info|
                         (SPADCALL
                          (SPADCALL (SPADCALL |arg| (QREFELT $ 78))
                                    (QREFELT $ 31))
                          (QREFELT $ 79))
                         . #2#)
                   (EXIT
                    (PROGN
                     (LETT #1# (QVELT (|RECOP;getINFOREC| |info| $) 0) . #2#)
                     (GO #1#))))))))))
        (EXIT
         (|error|
          "getEq: argument should be a single rootOfADE or rootOfRec object"))))
      #1# (EXIT #1#))))) 

(DEFUN |RECOP;eltable?;FB;14| (|f| $)
  (PROG (#1=#:G346 |info| |arg| |op| |kl|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |kl| (SPADCALL |f| (QREFELT $ 50)) . #2=(|RECOP;eltable?;FB;14|))
        (COND
         ((EQL (LENGTH |kl|) 1)
          (SEQ (LETT |op| (SPADCALL (|SPADfirst| |kl|) (QREFELT $ 79)) . #2#)
               (LETT |arg| (SPADCALL (|SPADfirst| |kl|) (QREFELT $ 21)) . #2#)
               (COND
                ((SPADCALL |op| '|rootOfADE| (QREFELT $ 118))
                 (SEQ
                  (LETT |info|
                        (SPADCALL
                         (SPADCALL (SPADCALL |arg| (QREFELT $ 78))
                                   (QREFELT $ 31))
                         (QREFELT $ 79))
                        . #2#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (COND
                           ((QEQCAR (QVELT (|RECOP;getINFOSER| |info| $) 7) 1)
                            'NIL)
                           (#3='T 'T))
                          . #2#)
                    (GO #1#))))))
               (EXIT
                (COND
                 ((SPADCALL |op| '|rootOfRec| (QREFELT $ 118))
                  (SEQ
                   (LETT |info|
                         (SPADCALL
                          (SPADCALL (SPADCALL |arg| (QREFELT $ 78))
                                    (QREFELT $ 31))
                          (QREFELT $ 79))
                         . #2#)
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (COND
                            ((QEQCAR (QVELT (|RECOP;getINFOREC| |info| $) 6) 1)
                             'NIL)
                            (#3# 'T))
                           . #2#)
                     (GO #1#))))))))))
        (EXIT
         (|error|
          "eltable?: argument should be a single rootOfADE or rootOfRec object"))))
      #1# (EXIT #1#))))) 

(DEFUN |RECOP;values;Nni;15| ($) (QREFELT $ 121)) 

(DEFUN |RECOP;values;2Nni;16| (|n| $)
  (PROG (|v|)
    (RETURN
     (SEQ (LETT |v| (SPADCALL (QREFELT $ 55)) |RECOP;values;2Nni;16|)
          (SETELT $ 121 |n|) (EXIT |v|))))) 

(DEFUN |RECOP;ddADE| (|l| $)
  (PROG (|TaylorPoly| |TaylorO| |TaylorList| |i| #1=#:G361 |v| #2=#:G351
         |DiffEq| |TaylorCoeff| |e| |f| |n| |x| |info|)
    (RETURN
     (SEQ
      (LETT |info|
            (|RECOP;getINFOSER|
             (SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 78)) (QREFELT $ 31))
                       (QREFELT $ 79))
             $)
            . #3=(|RECOP;ddADE|))
      (LETT |x| (SPADCALL (QVELT |info| 3) (QREFELT $ 22)) . #3#)
      (LETT |n| (|SPADfirst| |l|) . #3#) (LETT |f| (QVELT |info| 2) . #3#)
      (LETT |e| (QVELT |info| 0) . #3#)
      (LETT |TaylorCoeff|
            (SPADCALL
             (SPADCALL (SPADCALL |x| (QREFELT $ 95))
                       (SPADCALL |n| (QREFELT $ 95)) (QREFELT $ 123))
             (QREFELT $ 100))
            . #3#)
      (EXIT
       (COND
        ((QVELT |info| 8)
         (SPADCALL
          (SPADCALL |TaylorCoeff| (SPADCALL |e| (QREFELT $ 95)) (QREFELT $ 96))
          (QREFELT $ 100)))
        (#4='T
         (SEQ
          (LETT |DiffEq|
                (SPADCALL
                 (LIST |TaylorCoeff|
                       (SPADCALL (SPADCALL |f| |x| (QREFELT $ 69))
                                 (QREFELT $ 95))
                       ": "
                       (SPADCALL (SPADCALL |e| (QREFELT $ 95))
                                 (SPADCALL (|spadConstant| $ 45)
                                           (QREFELT $ 97))
                                 (QREFELT $ 98)))
                 (QREFELT $ 124))
                . #3#)
          (LETT |v| (SPADCALL (QREFELT $ 55)) . #3#)
          (COND
           ((QEQCAR (QVELT |info| 6) 0)
            (LETT |v|
                  (MIN |v|
                       (PROG2 (LETT #2# (QVELT |info| 6) . #3#)
                           (QCDR #2#)
                         (|check_union| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                        #2#)))
                  . #3#)))
          (LETT |TaylorList|
                (PROGN
                 (LETT #1# NIL . #3#)
                 (SEQ (LETT |i| 1 . #3#) G190
                      (COND ((|greater_SI| |i| |v|) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND
                           ((SPADCALL
                             (SPADCALL (QVELT |info| 5) |i| (QREFELT $ 82))
                             (QREFELT $ 67))
                            'NIL)
                           (#4# 'T))
                          (LETT #1#
                                (CONS
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (QVELT |info| 5) |i|
                                             (QREFELT $ 82))
                                   (SPADCALL |x| (- |i| 1) (QREFELT $ 125))
                                   (QREFELT $ 126))
                                  (QREFELT $ 95))
                                 #1#)
                                . #3#)))))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                . #3#)
          (LETT |TaylorO|
                (SPADCALL "O"
                          (LIST
                           (SPADCALL (SPADCALL |x| |v| (QREFELT $ 127))
                                     (QREFELT $ 95)))
                          (QREFELT $ 128))
                . #3#)
          (LETT |TaylorPoly|
                (SPADCALL
                 (SPADCALL (SPADCALL |f| |x| (QREFELT $ 69)) (QREFELT $ 95))
                 (SPADCALL (ELT $ 129)
                           (SPADCALL |TaylorList| |TaylorO| (QREFELT $ 131))
                           (QREFELT $ 133))
                 (QREFELT $ 98))
                . #3#)
          (EXIT
           (SPADCALL (SPADCALL (LIST |DiffEq| |TaylorPoly|) (QREFELT $ 99))
                     (QREFELT $ 100))))))))))) 

(DEFUN |RECOP;diffADE| (|l| |x| $)
  (PROG (|xF| |dummyF|)
    (RETURN
     (SEQ
      (LETT |dummyF| (SPADCALL (SPADCALL (QREFELT $ 101)) (QREFELT $ 22))
            . #1=(|RECOP;diffADE|))
      (LETT |xF| (SPADCALL |x| (QREFELT $ 22)) . #1#)
      (EXIT
       (SPADCALL (QREFELT $ 104)
                 (LIST
                  (SPADCALL (SPADCALL (QREFELT $ 12) |l| (QREFELT $ 57)) |xF|
                            |dummyF| (QREFELT $ 66))
                  |dummyF| |xF|)
                 (QREFELT $ 57))))))) 

(DECLAIM (NOTINLINE |RecurrenceOperator;|)) 

(DEFUN |RecurrenceOperator| (&REST #1=#:G370)
  (PROG ()
    (RETURN
     (PROG (#2=#:G371)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|RecurrenceOperator|)
                                           '|domainEqualList|)
                . #3=(|RecurrenceOperator|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |RecurrenceOperator;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|RecurrenceOperator|))))))))))) 

(DEFUN |RecurrenceOperator;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|RecurrenceOperator|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|RecurrenceOperator| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 134) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|RecurrenceOperator| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 11 (SPADCALL '|rootOfRec| (QREFELT $ 10)))
      (QSETREFV $ 12 (SPADCALL '|rootOfADE| (QREFELT $ 10)))
      (SPADCALL (QREFELT $ 11) '|%dummyVar| (|spadConstant| $ 13)
                (QREFELT $ 16))
      (SPADCALL (QREFELT $ 12) '|%dummyVar| (|spadConstant| $ 13)
                (QREFELT $ 16))
      (SPADCALL (QREFELT $ 11) (CONS (|function| |RECOP;irecur|) $)
                (QREFELT $ 93))
      (SPADCALL (QREFELT $ 11) '|%specialDisp|
                (CONS (|function| |RECOP;ddrec|) $) (QREFELT $ 16))
      (QSETREFV $ 102 (SPADCALL (QREFELT $ 101)))
      (QSETREFV $ 104
                (SPADCALL
                 (|SPADfirst|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT $ 101)) (QREFELT $ 10))
                     (SPADCALL (QREFELT $ 102) (QREFELT $ 22)) (QREFELT $ 69))
                    (QREFELT $ 102) (QREFELT $ 103))
                   (QREFELT $ 50)))
                 (QREFELT $ 79)))
      (SPADCALL (QREFELT $ 11) '|%specialDiff|
                (CONS (|function| |RECOP;diffRec|) $) (QREFELT $ 16))
      (SPADCALL (QREFELT $ 12) (CONS (|function| |RECOP;iADE|) $)
                (QREFELT $ 93))
      (QSETREFV $ 121 4)
      (SPADCALL (QREFELT $ 12) '|%specialDisp|
                (CONS (|function| |RECOP;ddADE|) $) (QREFELT $ 16))
      (SPADCALL (QREFELT $ 12) '|%specialDiff|
                (CONS (|function| |RECOP;diffADE|) $) (QREFELT $ 16))
      $)))) 

(MAKEPROP '|RecurrenceOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (|BasicOperator|) (0 . |operator|) '|oprecur| '|opADE|
              (5 . |One|) (9 . |One|) (|None|) (13 . |setProperty|)
              (|Union| 15 '"failed") (20 . |property|) (|List| 7) (|Kernel| 7)
              (26 . |argument|) (31 . |coerce|) (|Boolean|) (36 . |freeOf?|)
              (|Mapping| 23 7) (42 . |every?|) (|Integer|) (48 . ~=)
              (54 . |elt|) (|Kernel| $) (60 . |retract|) (|Fraction| 74)
              (65 . |univariate|) (|Fraction| 38) (71 . |denominator|)
              (76 . |One|) (80 . ~=) (|SparseUnivariatePolynomial| 7)
              (86 . |numer|) (|NonNegativeInteger|) (91 . |degree|)
              (96 . |coefficient|) (102 . =) (108 . |coefficients|)
              (113 . |Zero|) (117 . |Zero|) (|Union| 27 '"failed")
              (121 . |retractIfCan|) (|List| 30) (126 . |kernels|)
              (131 . |is?|) (137 . >) (143 . |new|) (148 . |operator|)
              |RECOP;values;Nni;15| (|List| $) (154 . |kernel|)
              (160 . |concat|) (166 . |denom|) (171 . |one?|) (176 . |freeOf?|)
              (182 . /) (188 . -) (193 . |coerce|) (198 . -) (204 . |eval|)
              (211 . |zero?|) (216 . +) (222 . |elt|) (228 . |first|)
              (233 . |eval|) (240 . |rest|) (245 . |first|)
              (|SparseUnivariatePolynomial| $) (251 . |gcdPolynomial|)
              (|Stream| 7) |RECOP;makeRec;BoSFLSF;7| (257 . |second|)
              (262 . |operator|) (267 . |less?|)
              (273 . |numberOfComputedEntries|) (278 . |elt|) (|Mapping| 19 19)
              (|Stream| 19) (284 . |stream|) (290 . |rest|) (|Mapping| 7 19)
              (|StreamFunctions2| 19 7) (295 . |map|) (301 . |concat|)
              (307 . |rest|) (|BasicOperatorFunctions1| 7) (313 . |evaluate|)
              (|OutputForm|) (319 . |coerce|) (324 . |hconcat|)
              (330 . |coerce|) (335 . =) (341 . |commaSeparate|)
              (346 . |bracket|) (351 . |new|) '|dummyArg| (355 . D) '|opdiff|
              (361 . |name|) (|Equation| 7) (366 . |equation|) (|Any|)
              (|ExpressionToUnivariatePowerSeries| 6 7) (372 . |taylor|)
              (378 . |complete|) (383 . |entries|)
              (|UnivariateFormalPowerSeries| 7)
              (|ExpressionSolve| 6 7 113
                                 (|UnivariateFormalPowerSeries|
                                  (|SparseMultivariatePolynomialExpressions|
                                   7)))
              (388 . |seriesSolve|) (396 . |coefficients|)
              |RECOP;makeFEq;Bo2SFLSF;11| (401 . |is?|) |RECOP;getEq;2F;13|
              |RECOP;eltable?;FB;14| '|vals| |RECOP;values;2Nni;16| (407 . ^)
              (413 . |hconcat|) (418 . ^) (424 . *) (430 . ^) (436 . |prefix|)
              (442 . +) (|List| 94) (448 . |concat|) (|Mapping| 94 94 94)
              (454 . |reduce|))
           '#(|values| 460 |makeRec| 469 |makeFEq| 478 |getEq| 488 |eltable?|
              493)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 133
                                                 '(1 9 0 8 10 0 6 0 13 0 7 0 14
                                                   3 9 0 0 8 15 16 2 9 17 0 8
                                                   18 1 20 19 0 21 1 7 0 8 22 2
                                                   7 23 0 0 24 2 19 23 25 0 26
                                                   2 27 23 0 0 28 2 19 7 0 27
                                                   29 1 7 30 0 31 2 7 32 0 30
                                                   33 1 34 0 0 35 0 34 0 36 2
                                                   34 23 0 0 37 1 34 38 0 39 1
                                                   38 40 0 41 2 38 7 0 40 42 2
                                                   7 23 0 0 43 1 38 19 0 44 0 6
                                                   0 45 0 7 0 46 1 7 47 0 48 1
                                                   7 49 0 50 2 20 23 0 9 51 2
                                                   27 23 0 0 52 1 8 0 0 53 2 9
                                                   0 8 40 54 2 7 0 9 56 57 2 19
                                                   0 0 0 58 1 34 38 0 59 1 38
                                                   23 0 60 2 7 23 0 8 61 2 7 0
                                                   0 0 62 1 7 0 0 63 1 7 0 27
                                                   64 2 7 0 0 0 65 3 7 0 0 0 0
                                                   66 1 7 23 0 67 2 7 0 0 0 68
                                                   2 7 0 9 0 69 1 19 7 0 70 3 7
                                                   0 0 56 56 71 1 19 0 0 72 2
                                                   19 0 0 40 73 2 7 74 74 74 75
                                                   1 19 7 0 78 1 20 9 0 79 2 76
                                                   23 0 40 80 1 76 40 0 81 2 76
                                                   7 0 27 82 2 84 0 83 19 85 1
                                                   84 0 0 86 2 88 76 87 84 89 2
                                                   76 0 0 0 90 2 19 0 0 40 91 2
                                                   92 9 9 87 93 1 7 94 0 95 2
                                                   94 0 0 0 96 1 6 94 0 97 2 94
                                                   0 0 0 98 1 94 0 56 99 1 94 0
                                                   0 100 0 8 0 101 2 7 0 0 8
                                                   103 1 9 8 0 105 2 106 0 7 7
                                                   107 2 109 108 7 106 110 1 76
                                                   0 0 111 1 76 19 0 112 4 114
                                                   113 7 9 8 19 115 1 113 76 0
                                                   116 2 9 23 0 8 118 2 94 0 0
                                                   0 123 1 94 0 56 124 2 7 0 0
                                                   27 125 2 7 0 0 0 126 2 7 0 0
                                                   40 127 2 94 0 0 56 128 2 94
                                                   0 0 0 129 2 130 0 0 94 131 2
                                                   130 94 132 0 133 0 0 40 55 1
                                                   0 40 40 122 5 0 7 9 8 7 19
                                                   76 77 6 0 7 9 8 8 7 19 76
                                                   117 1 0 7 7 119 1 0 23 7
                                                   120)))))
           '|lookupComplete|)) 
