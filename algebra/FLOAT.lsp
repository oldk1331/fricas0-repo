
(SDEFUN |FLOAT;writeOMFloat| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 13))
             (SPADCALL |dev| "bigfloat1" "bigfloat" (QREFELT $ 15))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 18))
             (SPADCALL |dev| 2 (QREFELT $ 18))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 18))
             (EXIT (SPADCALL |dev| (QREFELT $ 20))))) 

(SDEFUN |FLOAT;OMwrite;$S;2| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| NIL))
               (SEQ (LETT |s| "" . #1=(|FLOAT;OMwrite;$S;2|))
                    (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
                    (LETT |dev|
                          (SPADCALL |sp| (SPADCALL (QREFELT $ 22))
                                    (QREFELT $ 23))
                          . #1#)
                    (SPADCALL |dev| (QREFELT $ 24))
                    (|FLOAT;writeOMFloat| |dev| |x| $)
                    (SPADCALL |dev| (QREFELT $ 25))
                    (SPADCALL |dev| (QREFELT $ 26))
                    (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|)))) 

(SDEFUN |FLOAT;OMwrite;$BS;3| ((|x| $) (|wholeObj| |Boolean|) ($ |String|))
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| NIL))
               (SEQ (LETT |s| "" . #1=(|FLOAT;OMwrite;$BS;3|))
                    (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
                    (LETT |dev|
                          (SPADCALL |sp| (SPADCALL (QREFELT $ 22))
                                    (QREFELT $ 23))
                          . #1#)
                    (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 24))))
                    (|FLOAT;writeOMFloat| |dev| |x| $)
                    (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 25))))
                    (SPADCALL |dev| (QREFELT $ 26))
                    (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|)))) 

(SDEFUN |FLOAT;OMwrite;Omd$V;4| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 24)) (|FLOAT;writeOMFloat| |dev| |x| $)
             (EXIT (SPADCALL |dev| (QREFELT $ 25))))) 

(SDEFUN |FLOAT;OMwrite;Omd$BV;5|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 24))))
             (|FLOAT;writeOMFloat| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 25))))))) 

(SDEFUN |FLOAT;shift2| ((|x| |Integer|) (|y| |Integer|) ($ |Integer|))
        (* (SPADCALL |x| (QREFELT $ 32))
           (ASH (* (SPADCALL |x| (QREFELT $ 32)) |x|) |y|))) 

(SDEFUN |FLOAT;asin;2$;7| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 33)) (|spadConstant| $ 34))
                      ((SPADCALL |x| (QREFELT $ 35))
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (QREFELT $ 37))
                        (QREFELT $ 36)))
                      ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 39))
                       (SPADCALL (SPADCALL (QREFELT $ 40)) 2 (QREFELT $ 41)))
                      ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 42))
                       (|error| "asin: argument > 1 in magnitude"))
                      ('T
                       (SEQ (SPADCALL 5 (QREFELT $ 43))
                            (LETT |r|
                                  (SPADCALL
                                   (SPADCALL |x|
                                             (SPADCALL
                                              (|FLOAT;sub|
                                               (|spadConstant| $ 38)
                                               (|FLOAT;times| |x| |x| $) $)
                                              (QREFELT $ 44))
                                             (QREFELT $ 45))
                                   (QREFELT $ 46))
                                  |FLOAT;asin;2$;7|)
                            (SPADCALL 5 (QREFELT $ 47))
                            (EXIT (SPADCALL |r| (QREFELT $ 48))))))))) 

(SDEFUN |FLOAT;acos;2$;8| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 33))
                  (SPADCALL (SPADCALL (QREFELT $ 40)) 2 (QREFELT $ 41)))
                 ((SPADCALL |x| (QREFELT $ 35))
                  (SEQ (SPADCALL 3 (QREFELT $ 43))
                       (LETT |r|
                             (SPADCALL (SPADCALL (QREFELT $ 40))
                                       (SPADCALL (SPADCALL |x| (QREFELT $ 36))
                                                 (QREFELT $ 49))
                                       (QREFELT $ 50))
                             . #1=(|FLOAT;acos;2$;8|))
                       (SPADCALL 3 (QREFELT $ 47))
                       (EXIT (SPADCALL |r| (QREFELT $ 48)))))
                 ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 39))
                  (|spadConstant| $ 34))
                 ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 42))
                  (|error| "acos: argument > 1 in magnitude"))
                 ('T
                  (SEQ (SPADCALL 5 (QREFELT $ 43))
                       (LETT |r|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (|FLOAT;sub| (|spadConstant| $ 38)
                                 (|FLOAT;times| |x| |x| $) $)
                                (QREFELT $ 44))
                               |x| (QREFELT $ 45))
                              (QREFELT $ 46))
                             . #1#)
                       (SPADCALL 5 (QREFELT $ 47))
                       (EXIT (SPADCALL |r| (QREFELT $ 48))))))))) 

(SDEFUN |FLOAT;atan;3$;9| ((|x| $) (|y| $) ($ $))
        (SPROG ((|theta| ($)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 39))
                  (COND
                   ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 42))
                    (SPADCALL (SPADCALL (QREFELT $ 40)) 2 (QREFELT $ 41)))
                   ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 51))
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT $ 40)) 2 (QREFELT $ 41))
                     (QREFELT $ 36)))
                   (#1='T (|spadConstant| $ 34))))
                 (#1#
                  (SEQ
                   (LETT |theta|
                         (SPADCALL
                          (SPADCALL (SPADCALL |y| |x| (QREFELT $ 45))
                                    (QREFELT $ 52))
                          (QREFELT $ 46))
                         . #2=(|FLOAT;atan;3$;9|))
                   (COND
                    ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 51))
                     (LETT |theta|
                           (SPADCALL (SPADCALL (QREFELT $ 40)) |theta|
                                     (QREFELT $ 50))
                           . #2#)))
                   (COND
                    ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 51))
                     (LETT |theta| (SPADCALL |theta| (QREFELT $ 36)) . #2#)))
                   (EXIT |theta|))))))) 

(SDEFUN |FLOAT;atan;2$;10| ((|x| $) ($ $))
        (SPROG
         ((|t| ($)) (|i| NIL) (|k| (|Integer|)) (#1=#:G233 NIL) (|r| ($)))
         (SEQ
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 33)) (|spadConstant| $ 34))
                 ((SPADCALL |x| (QREFELT $ 35))
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (QREFELT $ 46))
                   (QREFELT $ 36)))
                 (#2='T
                  (SEQ
                   (COND
                    ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 42))
                     (SEQ (SPADCALL 4 (QREFELT $ 43))
                          (LETT |r|
                                (COND
                                 ((SPADCALL (SPADCALL |x| (QREFELT $ 54))
                                            (QREFELT $ 33))
                                  (COND
                                   ((SPADCALL |x|
                                              (CONS (SPADCALL (QREFELT $ 55))
                                                    0)
                                              (QREFELT $ 51))
                                    (|FLOAT;atanInverse|
                                     (SPADCALL |x| (QREFELT $ 56)) $))
                                   (#2#
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 38) |x|
                                               (QREFELT $ 45))
                                     (QREFELT $ 46)))))
                                 (#2#
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 38) |x|
                                             (QREFELT $ 45))
                                   (QREFELT $ 46))))
                                . #3=(|FLOAT;atan;2$;10|))
                          (LETT |r|
                                (SPADCALL
                                 (SPADCALL (SPADCALL (QREFELT $ 40)) 2
                                           (QREFELT $ 41))
                                 |r| (QREFELT $ 50))
                                . #3#)
                          (SPADCALL 4 (QREFELT $ 47))
                          (EXIT
                           (PROGN
                            (LETT #1# (SPADCALL |r| (QREFELT $ 48)) . #3#)
                            (GO #1#))))))
                   (LETT |k|
                         (QUOTIENT2
                          (SPADCALL (- (SPADCALL (QREFELT $ 55)) 100)
                                    (QREFELT $ 58))
                          5)
                         . #3#)
                   (LETT |k|
                         (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 59))))
                         . #3#)
                   (SPADCALL (SPADCALL 2 |k| (QREFELT $ 60)) (QREFELT $ 43))
                   (SEQ (LETT |i| 1 . #3#) G190
                        (COND ((|greater_SI| |i| |k|) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |x|
                                (SPADCALL |x|
                                          (SPADCALL (|spadConstant| $ 38)
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (|spadConstant| $ 38)
                                                      (SPADCALL |x| |x|
                                                                (QREFELT $ 61))
                                                      (QREFELT $ 62))
                                                     (QREFELT $ 44))
                                                    (QREFELT $ 62))
                                          (QREFELT $ 45))
                                . #3#)))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |t| (|FLOAT;atanSeries| |x| $) . #3#)
                   (SPADCALL (SPADCALL 2 |k| (QREFELT $ 60)) (QREFELT $ 47))
                   (LETT |t| (SPADCALL |t| |k| (QREFELT $ 63)) . #3#)
                   (EXIT (SPADCALL |t| (QREFELT $ 48)))))))
          #1# (EXIT #1#)))) 

(SDEFUN |FLOAT;atanSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|i| NIL) (|m| #1#)
          (|y| ($)) (|d| #2#) (|p| (|PositiveInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT $ 55))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))))
                 2)
                . #3=(|FLOAT;atanSeries|))
          (LETT |s| (LETT |d| (ASH 1 |p|) . #3#) . #3#)
          (LETT |y| (|FLOAT;times| |x| |x| $) . #3#)
          (LETT |t|
                (LETT |m| (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) $))
                      . #3#)
                . #3#)
          (SEQ (LETT |i| 3 . #3#) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
               (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |i|)) . #3#)
                    (EXIT (LETT |t| (QUOTIENT2 (* |m| |t|) |d|) . #3#)))
               (LETT |i| (|add_SI| |i| 2) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| (CONS |s| (- |p|)) (QREFELT $ 61)))))) 

(SDEFUN |FLOAT;atanInverse| ((|n| |Integer|) ($ $))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #1#) (|k| NIL) (|e| (|Integer|))
          (|n2| (|Integer|)))
         (SEQ (LETT |n2| (- (* |n| |n|)) . #2=(|FLOAT;atanInverse|))
              (LETT |e|
                    (+
                     (+
                      (+ (SPADCALL (QREFELT $ 55))
                         (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))))
                      (INTEGER-LENGTH |n|))
                     1)
                    . #2#)
              (LETT |s| (QUOTIENT2 (ASH 1 |e|) |n|) . #2#)
              (LETT |t| (QUOTIENT2 |s| |n2|) . #2#)
              (SEQ (LETT |k| 3 . #2#) G190
                   (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
                   (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |k|)) . #2#)
                        (EXIT (LETT |t| (QUOTIENT2 |t| |n2|) . #2#)))
                   (LETT |k| (|add_SI| |k| 2) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (CONS |s| (- |e|)) (QREFELT $ 48)))))) 

(SDEFUN |FLOAT;sin;2$;13| ((|x| $) ($ $))
        (SPROG
         ((|r| ($)) (|i| NIL) (#1=#:G258 NIL) (|k| (|Integer|))
          (|s| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ (LETT |s| (SPADCALL |x| (QREFELT $ 65)) . #2=(|FLOAT;sin;2$;13|))
              (LETT |x| (SPADCALL |x| (QREFELT $ 52)) . #2#)
              (LETT |p| (SPADCALL (QREFELT $ 55)) . #2#)
              (SPADCALL 4 (QREFELT $ 43))
              (COND
               ((SPADCALL |x| (CONS 6 0) (QREFELT $ 42))
                (SEQ (SPADCALL |p| (QREFELT $ 43))
                     (LETT |x|
                           (SPADCALL
                            (SPADCALL 2 (SPADCALL (QREFELT $ 40))
                                      (QREFELT $ 66))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL |x| (SPADCALL (QREFELT $ 40))
                                        (QREFELT $ 45))
                              2 (QREFELT $ 41))
                             (QREFELT $ 54))
                            (QREFELT $ 61))
                           . #2#)
                     (EXIT (SPADCALL |p| (QREFELT $ 67))))))
              (COND
               ((SPADCALL |x| (CONS 3 0) (QREFELT $ 42))
                (SEQ (SPADCALL |p| (QREFELT $ 43)) (LETT |s| (- |s|) . #2#)
                     (LETT |x|
                           (SPADCALL |x| (SPADCALL (QREFELT $ 40))
                                     (QREFELT $ 50))
                           . #2#)
                     (EXIT (SPADCALL |p| (QREFELT $ 67))))))
              (COND
               ((SPADCALL |x| (CONS 3 -1) (QREFELT $ 42))
                (SEQ (SPADCALL |p| (QREFELT $ 43))
                     (LETT |x|
                           (SPADCALL (SPADCALL (QREFELT $ 40)) |x|
                                     (QREFELT $ 50))
                           . #2#)
                     (EXIT (SPADCALL |p| (QREFELT $ 47))))))
              (LETT |k|
                    (QUOTIENT2
                     (SPADCALL (- (SPADCALL (QREFELT $ 55)) 100)
                               (QREFELT $ 58))
                     4)
                    . #2#)
              (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 59))))
                    . #2#)
              (COND
               ((SPADCALL |k| 0 (QREFELT $ 68))
                (SEQ (SPADCALL |k| (QREFELT $ 43))
                     (EXIT
                      (LETT |x|
                            (SPADCALL |x|
                                      (EXPT 3
                                            (PROG1 (LETT #1# |k| . #2#)
                                              (|check_subtype| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               #1#)))
                                      (QREFELT $ 41))
                            . #2#)))))
              (LETT |r| (|FLOAT;sinSeries| |x| $) . #2#)
              (SEQ (LETT |i| 1 . #2#) G190
                   (COND ((|greater_SI| |i| |k|) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |r|
                           (SPADCALL (|FLOAT;itimes| 3 |r| $)
                                     (SPADCALL (SPADCALL |r| 3 (QREFELT $ 69))
                                               2 (QREFELT $ 63))
                                     (QREFELT $ 50))
                           . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (SPADCALL |p| (QREFELT $ 67))
              (EXIT (SPADCALL |s| |r| (QREFELT $ 70)))))) 

(SDEFUN |FLOAT;sinSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| (|Integer|)) (|s| #1=(|Integer|)) (|i| NIL) (|m| (|Integer|))
          (|d| #1#) (|y| ($)) (|p| (|PositiveInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT $ 55))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))))
                 2)
                . #2=(|FLOAT;sinSeries|))
          (LETT |y| (|FLOAT;times| |x| |x| $) . #2#)
          (LETT |s| (LETT |d| (ASH 1 |p|) . #2#) . #2#)
          (LETT |m| (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) $)) . #2#)
          (LETT |t| (QUOTIENT2 |m| 6) . #2#)
          (SEQ (LETT |i| 4 . #2#) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
               (SEQ (LETT |s| (+ |s| |t|) . #2#)
                    (LETT |t| (QUOTIENT2 (* |m| |t|) (* |i| (+ |i| 1))) . #2#)
                    (EXIT (LETT |t| (QUOTIENT2 |t| |d|) . #2#)))
               (LETT |i| (|add_SI| |i| 2) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| (CONS |s| (- |p|)) (QREFELT $ 61)))))) 

(SDEFUN |FLOAT;cos;2$;15| ((|x| $) ($ $))
        (SPROG
         ((|r| ($)) (|i| NIL) (|k| (|Integer|)) (#1=#:G278 NIL)
          (|s| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |s| 1 . #2=(|FLOAT;cos;2$;15|))
                (LETT |x| (SPADCALL |x| (QREFELT $ 52)) . #2#)
                (LETT |p| (SPADCALL (QREFELT $ 55)) . #2#)
                (SPADCALL 4 (QREFELT $ 43))
                (COND
                 ((SPADCALL |x| (CONS 6 0) (QREFELT $ 42))
                  (SEQ (SPADCALL |p| (QREFELT $ 43))
                       (LETT |x|
                             (SPADCALL
                              (SPADCALL 2 (SPADCALL (QREFELT $ 40))
                                        (QREFELT $ 66))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |x| (SPADCALL (QREFELT $ 40))
                                          (QREFELT $ 45))
                                2 (QREFELT $ 41))
                               (QREFELT $ 54))
                              (QREFELT $ 61))
                             . #2#)
                       (EXIT (SPADCALL |p| (QREFELT $ 47))))))
                (COND
                 ((SPADCALL |x| (CONS 3 0) (QREFELT $ 42))
                  (SEQ (SPADCALL |p| (QREFELT $ 43)) (LETT |s| (- |s|) . #2#)
                       (LETT |x|
                             (SPADCALL |x| (SPADCALL (QREFELT $ 40))
                                       (QREFELT $ 50))
                             . #2#)
                       (EXIT (SPADCALL |p| (QREFELT $ 47))))))
                (COND
                 ((SPADCALL |x| (CONS 1 0) (QREFELT $ 42))
                  (SEQ (SPADCALL |p| (QREFELT $ 43))
                       (LETT |x|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QREFELT $ 40)) 2
                                        (QREFELT $ 41))
                              |x| (QREFELT $ 50))
                             . #2#)
                       (SPADCALL |p| (QREFELT $ 67))
                       (LETT |x| (SPADCALL |x| (QREFELT $ 48)) . #2#)
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (SPADCALL |s| (SPADCALL |x| (QREFELT $ 71))
                                         (QREFELT $ 70))
                               . #2#)
                         (GO #1#))))))
                (LETT |k|
                      (QUOTIENT2
                       (SPADCALL (- (SPADCALL (QREFELT $ 55)) 100)
                                 (QREFELT $ 58))
                       3)
                      . #2#)
                (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 59))))
                      . #2#)
                (COND
                 ((SPADCALL |k| 0 (QREFELT $ 68))
                  (SEQ
                   (SPADCALL (+ |k| (EXPT (INTEGER-LENGTH |k|) 2))
                             (QREFELT $ 43))
                   (EXIT
                    (LETT |x| (SPADCALL |x| (- |k|) (QREFELT $ 63)) . #2#)))))
                (LETT |r| (|FLOAT;cosSeries| |x| $) . #2#)
                (SEQ (LETT |i| 1 . #2#) G190
                     (COND ((|greater_SI| |i| |k|) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |r|
                             (SPADCALL
                              (SPADCALL (SPADCALL |r| |r| (QREFELT $ 61)) 1
                                        (QREFELT $ 63))
                              (|spadConstant| $ 38) (QREFELT $ 50))
                             . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (SPADCALL |p| (QREFELT $ 67))
                (EXIT (SPADCALL |s| |r| (QREFELT $ 70)))))
          #1# (EXIT #1#)))) 

(SDEFUN |FLOAT;cosSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| (|Integer|)) (|s| #1=(|Integer|)) (|i| NIL) (|m| (|Integer|))
          (|d| #1#) (|y| ($)) (|p| (|PositiveInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT $ 55))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))))
                 1)
                . #2=(|FLOAT;cosSeries|))
          (LETT |y| (|FLOAT;times| |x| |x| $) . #2#)
          (LETT |s| (LETT |d| (ASH 1 |p|) . #2#) . #2#)
          (LETT |m| (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) $)) . #2#)
          (LETT |t| (QUOTIENT2 |m| 2) . #2#)
          (SEQ (LETT |i| 3 . #2#) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
               (SEQ (LETT |s| (+ |s| |t|) . #2#)
                    (LETT |t| (QUOTIENT2 (* |m| |t|) (* |i| (+ |i| 1))) . #2#)
                    (EXIT (LETT |t| (QUOTIENT2 |t| |d|) . #2#)))
               (LETT |i| (|add_SI| |i| 2) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (CONS |s| (- |p|)) (QREFELT $ 48)))))) 

(SDEFUN |FLOAT;tan;2$;17| ((|x| $) ($ $))
        (SPROG
         ((|t| ($)) (|c| ($)) (|s| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ (LETT |s| (SPADCALL |x| (QREFELT $ 65)) . #1=(|FLOAT;tan;2$;17|))
              (LETT |x| (SPADCALL |x| (QREFELT $ 52)) . #1#)
              (LETT |p| (SPADCALL (QREFELT $ 55)) . #1#)
              (SPADCALL 6 (QREFELT $ 43))
              (COND
               ((SPADCALL |x| (CONS 3 0) (QREFELT $ 42))
                (SEQ (SPADCALL |p| (QREFELT $ 43))
                     (LETT |x|
                           (SPADCALL (SPADCALL (QREFELT $ 40))
                                     (SPADCALL
                                      (SPADCALL |x| (SPADCALL (QREFELT $ 40))
                                                (QREFELT $ 45))
                                      (QREFELT $ 54))
                                     (QREFELT $ 61))
                           . #1#)
                     (EXIT (SPADCALL |p| (QREFELT $ 47))))))
              (COND
               ((SPADCALL |x| (CONS 3 -1) (QREFELT $ 42))
                (SEQ (SPADCALL |p| (QREFELT $ 43))
                     (LETT |x|
                           (SPADCALL (SPADCALL (QREFELT $ 40)) |x|
                                     (QREFELT $ 50))
                           . #1#)
                     (LETT |s| (- |s|) . #1#)
                     (EXIT (SPADCALL |p| (QREFELT $ 47))))))
              (COND
               ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 42))
                (SEQ (LETT |c| (SPADCALL |x| (QREFELT $ 72)) . #1#)
                     (EXIT
                      (LETT |t|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 38)
                                        (SPADCALL |c| |c| (QREFELT $ 61))
                                        (QREFELT $ 50))
                              (QREFELT $ 44))
                             |c| (QREFELT $ 45))
                            . #1#))))
               ('T
                (SEQ (LETT |c| (SPADCALL |x| (QREFELT $ 71)) . #1#)
                     (EXIT
                      (LETT |t|
                            (SPADCALL |c|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 38)
                                                 (SPADCALL |c| |c|
                                                           (QREFELT $ 61))
                                                 (QREFELT $ 50))
                                       (QREFELT $ 44))
                                      (QREFELT $ 45))
                            . #1#)))))
              (SPADCALL |p| (QREFELT $ 67))
              (EXIT (SPADCALL |s| |t| (QREFELT $ 70)))))) 

(SDEFUN |FLOAT;pi;$;18| (($ $))
        (COND
         ((SPADCALL (SPADCALL (QREFELT $ 55)) (QCAR (QREFELT $ 74))
                    (QREFELT $ 76))
          (SPADCALL (QCDR (QREFELT $ 74)) (QREFELT $ 48)))
         ('T
          (QCDR
           (SETELT $ 74
                   (CONS (SPADCALL (QREFELT $ 55)) (|FLOAT;piRamanujan| $))))))) 

(SDEFUN |FLOAT;piRamanujan| (($ $))
        (SPROG
         ((|t| (|Integer|)) (|m| (|Integer|)) (|s| (|Integer|)) (|i| NIL)
          (|j| NIL) (|d| (|Integer|)) (|n| (|PositiveInteger|)))
         (SEQ
          (LETT |n|
                (+
                 (+ (SPADCALL (QREFELT $ 55))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))))
                 11)
                . #1=(|FLOAT;piRamanujan|))
          (LETT |t| (QUOTIENT2 (ASH 1 |n|) 882) . #1#)
          (LETT |d| (* 4 (SPADCALL 882 2 (QREFELT $ 77))) . #1#)
          (LETT |s| 0 . #1#)
          (SEQ (LETT |j| 1123 . #1#) (LETT |i| 2 . #1#) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
               (SEQ (LETT |s| (+ |s| (SPADCALL |j| |t| (QREFELT $ 79))) . #1#)
                    (LETT |m|
                          (-
                           (*
                            (* (- |i| 1) (- (SPADCALL 2 |i| (QREFELT $ 80)) 1))
                            (- (SPADCALL 2 |i| (QREFELT $ 80)) 3)))
                          . #1#)
                    (EXIT
                     (LETT |t|
                           (QUOTIENT2 (* |m| |t|)
                                      (* |d| (SPADCALL |i| 3 (QREFELT $ 81))))
                           . #1#)))
               (LETT |i|
                     (PROG1 (|add_SI| |i| 2)
                       (LETT |j| (|add_SI| |j| 21460) . #1#))
                     . #1#)
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|spadConstant| $ 38) (CONS |s| (- (- |n|) 2))
                     (QREFELT $ 45)))))) 

(SDEFUN |FLOAT;sinh;2$;20| ((|x| $) ($ $))
        (SPROG ((|s| ($)) (|e| ($)) (|lost| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 33)) (|spadConstant| $ 34))
                      (#1='T
                       (SEQ
                        (LETT |lost| (MAX (- (SPADCALL |x| (QREFELT $ 59))) 0)
                              . #2=(|FLOAT;sinh;2$;20|))
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL 2 |lost| (QREFELT $ 60))
                                     (SPADCALL (QREFELT $ 55)) (QREFELT $ 68))
                           |x|)
                          (#1#
                           (SEQ (SPADCALL (+ 5 |lost|) (QREFELT $ 43))
                                (LETT |e| (SPADCALL |x| (QREFELT $ 82)) . #2#)
                                (LETT |s|
                                      (SPADCALL
                                       (SPADCALL |e|
                                                 (SPADCALL
                                                  (|spadConstant| $ 38) |e|
                                                  (QREFELT $ 45))
                                                 (QREFELT $ 50))
                                       2 (QREFELT $ 41))
                                      . #2#)
                                (SPADCALL (+ 5 |lost|) (QREFELT $ 47))
                                (EXIT (SPADCALL |s| (QREFELT $ 48))))))))))))) 

(SDEFUN |FLOAT;cosh;2$;21| ((|x| $) ($ $))
        (SPROG ((|c| ($)) (|e| ($)))
               (SEQ (SPADCALL 5 (QREFELT $ 43))
                    (LETT |e| (SPADCALL |x| (QREFELT $ 82))
                          . #1=(|FLOAT;cosh;2$;21|))
                    (LETT |c|
                          (SPADCALL
                           (SPADCALL |e|
                                     (SPADCALL (|spadConstant| $ 38) |e|
                                               (QREFELT $ 45))
                                     (QREFELT $ 62))
                           2 (QREFELT $ 41))
                          . #1#)
                    (SPADCALL 5 (QREFELT $ 47))
                    (EXIT (SPADCALL |c| (QREFELT $ 48)))))) 

(SDEFUN |FLOAT;tanh;2$;22| ((|x| $) ($ $))
        (SPROG ((|t| ($)) (|e| ($)) (|lost| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 33)) (|spadConstant| $ 34))
                      (#1='T
                       (SEQ
                        (LETT |lost| (MAX (- (SPADCALL |x| (QREFELT $ 59))) 0)
                              . #2=(|FLOAT;tanh;2$;22|))
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL 2 |lost| (QREFELT $ 60))
                                     (SPADCALL (QREFELT $ 55)) (QREFELT $ 68))
                           |x|)
                          (#1#
                           (SEQ (SPADCALL (+ 6 |lost|) (QREFELT $ 43))
                                (LETT |e| (SPADCALL |x| (QREFELT $ 82)) . #2#)
                                (LETT |e| (SPADCALL |e| |e| (QREFELT $ 61))
                                      . #2#)
                                (LETT |t|
                                      (SPADCALL
                                       (SPADCALL |e| (|spadConstant| $ 38)
                                                 (QREFELT $ 50))
                                       (SPADCALL |e| (|spadConstant| $ 38)
                                                 (QREFELT $ 62))
                                       (QREFELT $ 45))
                                      . #2#)
                                (SPADCALL (+ 6 |lost|) (QREFELT $ 47))
                                (EXIT (SPADCALL |t| (QREFELT $ 48))))))))))))) 

(SDEFUN |FLOAT;asinh;2$;23| ((|x| $) ($ $))
        (SPROG ((|r| ($)) (#1=#:G318 NIL) (|p| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |p| (MIN 0 (SPADCALL |x| (QREFELT $ 59)))
                        . #2=(|FLOAT;asinh;2$;23|))
                  (COND
                   ((OR (SPADCALL |x| (QREFELT $ 33))
                        (< (SPADCALL 2 |p| (QREFELT $ 60))
                           (- (SPADCALL (QREFELT $ 55)))))
                    (PROGN (LETT #1# |x| . #2#) (GO #1#))))
                  (SPADCALL (- 5 |p|) (QREFELT $ 43))
                  (LETT |r|
                        (SPADCALL
                         (SPADCALL |x|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 38)
                                              (SPADCALL |x| |x| (QREFELT $ 61))
                                              (QREFELT $ 62))
                                    (QREFELT $ 44))
                                   (QREFELT $ 62))
                         (QREFELT $ 86))
                        . #2#)
                  (SPADCALL (- 5 |p|) (QREFELT $ 47))
                  (EXIT (SPADCALL |r| (QREFELT $ 48)))))
                #1# (EXIT #1#)))) 

(SDEFUN |FLOAT;acosh;2$;24| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 51))
                  (|error| "invalid argument to acosh")))
                (SPADCALL 5 (QREFELT $ 43))
                (LETT |r|
                      (SPADCALL
                       (SPADCALL |x|
                                 (SPADCALL
                                  (|FLOAT;sub| (|FLOAT;times| |x| |x| $)
                                   (|spadConstant| $ 38) $)
                                  (QREFELT $ 44))
                                 (QREFELT $ 62))
                       (QREFELT $ 86))
                      |FLOAT;acosh;2$;24|)
                (SPADCALL 5 (QREFELT $ 47))
                (EXIT (SPADCALL |r| (QREFELT $ 48)))))) 

(SDEFUN |FLOAT;atanh;2$;25| ((|x| $) ($ $))
        (SPROG ((|r| ($)) (#1=#:G326 NIL) (|p| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((OR (SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 42))
                        (SPADCALL |x|
                                  (SPADCALL (|spadConstant| $ 38)
                                            (QREFELT $ 36))
                                  (QREFELT $ 51)))
                    (|error| "invalid argument to atanh")))
                  (LETT |p| (MIN 0 (SPADCALL |x| (QREFELT $ 59)))
                        . #2=(|FLOAT;atanh;2$;25|))
                  (COND
                   ((OR (SPADCALL |x| (QREFELT $ 33))
                        (< (SPADCALL 2 |p| (QREFELT $ 60))
                           (- (SPADCALL (QREFELT $ 55)))))
                    (PROGN (LETT #1# |x| . #2#) (GO #1#))))
                  (SPADCALL (- 5 |p|) (QREFELT $ 43))
                  (LETT |r|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 62))
                           (SPADCALL (|spadConstant| $ 38) |x| (QREFELT $ 50))
                           (QREFELT $ 45))
                          (QREFELT $ 86))
                         2 (QREFELT $ 41))
                        . #2#)
                  (SPADCALL (- 5 |p|) (QREFELT $ 47))
                  (EXIT (SPADCALL |r| (QREFELT $ 48)))))
                #1# (EXIT #1#)))) 

(SDEFUN |FLOAT;log;2$;26| ((|x| $) ($ $))
        (SPROG
         ((|l| ($)) (|m| #1=(|Integer|)) (|ek| ($)) (#2=#:G331 NIL)
          (|k| (|Integer|)) (|n| #1#) (|p| (|PositiveInteger|)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 35)) (|error| "negative log"))
                ((SPADCALL |x| (QREFELT $ 33)) (|error| "log 0 generated"))
                (#3='T
                 (SEQ
                  (LETT |p| (SPADCALL (QREFELT $ 55)) . #4=(|FLOAT;log;2$;26|))
                  (SPADCALL 5 (QREFELT $ 43))
                  (SEQ (LETT |n| (SPADCALL |x| (QREFELT $ 59)) . #4#)
                       (EXIT (COND ((< |n| 0) (LETT |n| (+ |n| 1) . #4#)))))
                  (LETT |l|
                        (COND ((EQL |n| 0) (|spadConstant| $ 34))
                              (#3#
                               (SEQ
                                (LETT |x| (SPADCALL |x| (- |n|) (QREFELT $ 63))
                                      . #4#)
                                (EXIT
                                 (SPADCALL |n| (SPADCALL (QREFELT $ 90))
                                           (QREFELT $ 70))))))
                        . #4#)
                  (LETT |k| (QUOTIENT2 (SPADCALL (- |p| 100) (QREFELT $ 58)) 3)
                        . #4#)
                  (COND
                   ((SPADCALL |k| 1 (QREFELT $ 68))
                    (SEQ
                     (LETT |k|
                           (MAX 1
                                (+ |k|
                                   (SPADCALL
                                    (SPADCALL |x| (|spadConstant| $ 38)
                                              (QREFELT $ 50))
                                    (QREFELT $ 59))))
                           . #4#)
                     (SPADCALL |k| (QREFELT $ 43))
                     (LETT |ek|
                           (|FLOAT;expInverse|
                            (EXPT 2
                                  (PROG1 (LETT #2# |k| . #4#)
                                    (|check_subtype| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     #2#)))
                            $)
                           . #4#)
                     (SPADCALL (QUOTIENT2 |p| 2) (QREFELT $ 47))
                     (LETT |m|
                           (SPADCALL (|FLOAT;square| |x| |k| $) (QREFELT $ 59))
                           . #4#)
                     (SPADCALL (QUOTIENT2 |p| 2) (QREFELT $ 43))
                     (LETT |m|
                           (QUOTIENT2 (SPADCALL 6847196937 |m| (QREFELT $ 60))
                                      9878417065)
                           . #4#)
                     (LETT |x|
                           (SPADCALL |x| (SPADCALL |ek| (- |m|) (QREFELT $ 91))
                                     (QREFELT $ 61))
                           . #4#)
                     (EXIT
                      (LETT |l|
                            (SPADCALL |l| (CONS |m| (- |k|)) (QREFELT $ 62))
                            . #4#)))))
                  (LETT |l|
                        (SPADCALL |l| (|FLOAT;logSeries| |x| $) (QREFELT $ 62))
                        . #4#)
                  (SPADCALL |p| (QREFELT $ 67))
                  (EXIT (SPADCALL |l| (QREFELT $ 48))))))))) 

(SDEFUN |FLOAT;logSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|i| NIL) (|m| #1#)
          (|z| ($)) (|d| #2#) (|y| ($)) (|p| #3=(|PositiveInteger|)) (|g| #3#))
         (SEQ
          (LETT |p|
                (+ (SPADCALL (QREFELT $ 55))
                   (LETT |g| (+ (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))) 3)
                         . #4=(|FLOAT;logSeries|)))
                . #4#)
          (SPADCALL |g| (QREFELT $ 43))
          (LETT |y|
                (SPADCALL (SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 50))
                          (SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 62))
                          (QREFELT $ 45))
                . #4#)
          (SPADCALL |g| (QREFELT $ 47))
          (LETT |s| (LETT |d| (ASH 1 |p|) . #4#) . #4#)
          (LETT |z| (|FLOAT;times| |y| |y| $) . #4#)
          (LETT |t|
                (LETT |m| (|FLOAT;shift2| (QCAR |z|) (+ (QCDR |z|) |p|) $)
                      . #4#)
                . #4#)
          (SEQ (LETT |i| 3 . #4#) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
               (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |i|)) . #4#)
                    (EXIT (LETT |t| (QUOTIENT2 (* |m| |t|) |d|) . #4#)))
               (LETT |i| (|add_SI| |i| 2) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |y| (CONS |s| (- 1 |p|)) (QREFELT $ 61)))))) 

(SDEFUN |FLOAT;log2;$;28| (($ $))
        (SPROG
         ((|t| (|Integer|)) (|s| (|Integer|)) (|k| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 55)) . #1=(|FLOAT;log2;$;28|))
              (EXIT
               (COND
                ((SPADCALL |n| (QCAR (QREFELT $ 92)) (QREFELT $ 93))
                 (SPADCALL (QCDR (QREFELT $ 92)) (QREFELT $ 48)))
                ('T
                 (SEQ (LETT |n| (+ (+ |n| (INTEGER-LENGTH |n|)) 3) . #1#)
                      (LETT |s| (QUOTIENT2 (ASH 1 (+ |n| 1)) 3) . #1#)
                      (LETT |t| (QUOTIENT2 |s| 9) . #1#)
                      (SEQ (LETT |k| 3 . #1#) G190
                           (COND
                            ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
                           (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |k|)) . #1#)
                                (EXIT (LETT |t| (QUOTIENT2 |t| 9) . #1#)))
                           (LETT |k| (|add_SI| |k| 2) . #1#) (GO G190) G191
                           (EXIT NIL))
                      (SETELT $ 92
                              (CONS (SPADCALL (QREFELT $ 55))
                                    (CONS |s| (- |n|))))
                      (EXIT
                       (SPADCALL (QCDR (QREFELT $ 92)) (QREFELT $ 48)))))))))) 

(SDEFUN |FLOAT;log10;$;29| (($ $))
        (SPROG
         ((|t| (|Integer|)) (|s| (|Integer|)) (|k| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 55)) . #1=(|FLOAT;log10;$;29|))
              (EXIT
               (COND
                ((SPADCALL |n| (QCAR (QREFELT $ 94)) (QREFELT $ 93))
                 (SPADCALL (QCDR (QREFELT $ 94)) (QREFELT $ 48)))
                ('T
                 (SEQ (LETT |n| (+ (+ |n| (INTEGER-LENGTH |n|)) 5) . #1#)
                      (LETT |s| (QUOTIENT2 (ASH 1 (+ |n| 1)) 9) . #1#)
                      (LETT |t| (QUOTIENT2 |s| 81) . #1#)
                      (SEQ (LETT |k| 3 . #1#) G190
                           (COND
                            ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
                           (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |k|)) . #1#)
                                (EXIT (LETT |t| (QUOTIENT2 |t| 81) . #1#)))
                           (LETT |k| (|add_SI| |k| 2) . #1#) (GO G190) G191
                           (EXIT NIL))
                      (SPADCALL 2 (QREFELT $ 43))
                      (SETELT $ 94
                              (CONS (SPADCALL (QREFELT $ 55))
                                    (SPADCALL (CONS |s| (- |n|))
                                              (SPADCALL 3
                                                        (SPADCALL
                                                         (QREFELT $ 90))
                                                        (QREFELT $ 66))
                                              (QREFELT $ 62))))
                      (SPADCALL 2 (QREFELT $ 47))
                      (EXIT
                       (SPADCALL (QCDR (QREFELT $ 94)) (QREFELT $ 48)))))))))) 

(SDEFUN |FLOAT;log2;2$;30| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ (SPADCALL 2 (QREFELT $ 43))
                    (LETT |r|
                          (SPADCALL (SPADCALL |x| (QREFELT $ 86))
                                    (SPADCALL (QREFELT $ 90)) (QREFELT $ 45))
                          |FLOAT;log2;2$;30|)
                    (SPADCALL 2 (QREFELT $ 47))
                    (EXIT (SPADCALL |r| (QREFELT $ 48)))))) 

(SDEFUN |FLOAT;log10;2$;31| ((|x| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ (SPADCALL 2 (QREFELT $ 43))
                    (LETT |r|
                          (SPADCALL (SPADCALL |x| (QREFELT $ 86))
                                    (SPADCALL (QREFELT $ 95)) (QREFELT $ 45))
                          |FLOAT;log10;2$;31|)
                    (SPADCALL 2 (QREFELT $ 47))
                    (EXIT (SPADCALL |r| (QREFELT $ 48)))))) 

(SDEFUN |FLOAT;exp;2$;32| ((|x| $) ($ $))
        (SPROG
         ((|e| ($)) (|k| (|Integer|)) (#1=#:G363 NIL) (|e1| ($))
          (|n| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |p| (SPADCALL (QREFELT $ 55)) . #2=(|FLOAT;exp;2$;32|))
                (SPADCALL 5 (QREFELT $ 43))
                (LETT |e1| (|spadConstant| $ 38) . #2#)
                (COND
                 ((SPADCALL (LETT |n| (SPADCALL |x| (QREFELT $ 56)) . #2#) 0
                            (QREFELT $ 64))
                  (SEQ (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 43))
                       (LETT |e1|
                             (SPADCALL (SPADCALL (QREFELT $ 98)) |n|
                                       (QREFELT $ 91))
                             . #2#)
                       (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 47))
                       (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 54)) . #2#)))))
                (COND
                 ((SPADCALL |x| (QREFELT $ 33))
                  (SEQ (SPADCALL |p| (QREFELT $ 67))
                       (EXIT
                        (PROGN
                         (LETT #1# (SPADCALL |e1| (QREFELT $ 48)) . #2#)
                         (GO #1#))))))
                (LETT |k| (QUOTIENT2 (SPADCALL (- |p| 100) (QREFELT $ 58)) 3)
                      . #2#)
                (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 59))))
                      . #2#)
                (COND
                 ((SPADCALL |k| 0 (QREFELT $ 68))
                  (SEQ (SPADCALL |k| (QREFELT $ 43))
                       (EXIT
                        (LETT |x| (SPADCALL |x| (- |k|) (QREFELT $ 63))
                              . #2#)))))
                (LETT |e| (|FLOAT;expSeries| |x| $) . #2#)
                (COND
                 ((SPADCALL |k| 0 (QREFELT $ 68))
                  (LETT |e| (|FLOAT;square| |e| |k| $) . #2#)))
                (SPADCALL |p| (QREFELT $ 67))
                (EXIT (SPADCALL |e| |e1| (QREFELT $ 61)))))
          #1# (EXIT #1#)))) 

(SDEFUN |FLOAT;expSeries| ((|x| $) ($ $))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|i| NIL) (|n| #1#)
          (|d| #2#) (|p| (|PositiveInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT $ 55))
                    (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))))
                 1)
                . #3=(|FLOAT;expSeries|))
          (LETT |s| (LETT |d| (ASH 1 |p|) . #3#) . #3#)
          (LETT |t|
                (LETT |n| (|FLOAT;shift2| (QCAR |x|) (+ (QCDR |x|) |p|) $)
                      . #3#)
                . #3#)
          (SEQ (LETT |i| 2 . #3#) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
               (SEQ (LETT |s| (+ |s| |t|) . #3#)
                    (LETT |t| (QUOTIENT2 (* |n| |t|) |i|) . #3#)
                    (EXIT (LETT |t| (QUOTIENT2 |t| |d|) . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (CONS |s| (- |p|)) (QREFELT $ 48)))))) 

(SDEFUN |FLOAT;mat0|
        ((|n0| . #1=(|Integer|)) (|bl| |Integer|) (|ki| |Integer|)
         ($ |Record| (|:| |highn| (|Integer|))
          (|:| |matr| (|Matrix| (|Integer|)))))
        (SPROG
         ((|i| #1#) (|m22| #2=(|Integer|)) (|m21| #3=(|Integer|))
          (|m12| (|Integer|)) (|m11| (|Integer|)) (|#G65| #4=(|Integer|))
          (|#G64| #4#) (|#G63| #2#) (|#G62| #3#))
         (SEQ (LETT |m11| 1 . #5=(|FLOAT;mat0|)) (LETT |m12| 0 . #5#)
              (LETT |m21| 0 . #5#) (LETT |m22| 1 . #5#) (LETT |i| |n0| . #5#)
              (SEQ G190
                   (COND ((NULL (< (INTEGER-LENGTH |m11|) |bl|)) (GO G191)))
                   (SEQ
                    (PROGN
                     (LETT |#G62| |m21| . #5#)
                     (LETT |#G63| |m22| . #5#)
                     (LETT |#G64| (+ |m11| (* |i| |m21|)) . #5#)
                     (LETT |#G65| (+ |m12| (* |i| |m22|)) . #5#)
                     (LETT |m11| |#G62| . #5#)
                     (LETT |m12| |#G63| . #5#)
                     (LETT |m21| |#G64| . #5#)
                     (LETT |m22| |#G65| . #5#))
                    (EXIT (LETT |i| (+ |i| |ki|) . #5#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS |i|
                     (SPADCALL (LIST (LIST |m11| |m12|) (LIST |m21| |m22|))
                               (QREFELT $ 101))))))) 

(SDEFUN |FLOAT;mat1|
        ((|n0| |Integer|) (|bl| |Integer|) (|ki| |Integer|)
         ($
          . #1=(|Record| (|:| |highn| (|Integer|))
                         (|:| |matr| (|Matrix| (|Integer|))))))
        (SPROG
         ((|r2| #1#) (|bl1| (|Integer|)) (|m1| (|Matrix| (|Integer|)))
          (|r1| #1#))
         (SEQ
          (COND
           ((SPADCALL |bl| 300 (QREFELT $ 102))
            (|FLOAT;mat0| |n0| |bl| |ki| $))
           ('T
            (SEQ (LETT |bl1| (QUOTIENT2 |bl| 2) . #2=(|FLOAT;mat1|))
                 (LETT |r1| (|FLOAT;mat1| |n0| |bl1| |ki| $) . #2#)
                 (LETT |m1| (QCDR |r1|) . #2#)
                 (LETT |bl1|
                       (- |bl|
                          (INTEGER-LENGTH (SPADCALL |m1| 1 1 (QREFELT $ 103))))
                       . #2#)
                 (LETT |r2| (|FLOAT;mat1| (QCAR |r1|) |bl1| |ki| $) . #2#)
                 (EXIT
                  (CONS (QCAR |r2|)
                        (SPADCALL (QCDR |r2|) |m1| (QREFELT $ 104)))))))))) 

(SDEFUN |FLOAT;expInverse| ((|k| |Integer|) ($ $))
        (SPROG
         ((|q1| (|Integer|)) (|p1| (|Integer|)) (|mm0| (|Matrix| (|Integer|)))
          (|l| (|NonNegativeInteger|)) (|ki| #1=(|Integer|)) (|k0| #1#)
          (|q0| (|Integer|)) (|p0| (|Integer|)))
         (SEQ
          (LETT |p1| (+ (SPADCALL 2 |k| (QREFELT $ 60)) 1)
                . #2=(|FLOAT;expInverse|))
          (LETT |p0| 1 . #2#)
          (LETT |q1| (- (SPADCALL 2 |k| (QREFELT $ 60)) 1) . #2#)
          (LETT |q0| 1 . #2#) (LETT |k0| (SPADCALL 6 |k| (QREFELT $ 60)) . #2#)
          (LETT |ki| (SPADCALL 4 |k| (QREFELT $ 60)) . #2#)
          (LETT |l| (QUOTIENT2 (+ (SPADCALL (QREFELT $ 55)) 1) 2) . #2#)
          (LETT |mm0|
                (SPADCALL (LIST (LIST |p0| |q0|) (LIST |p1| |q1|))
                          (QREFELT $ 101))
                . #2#)
          (LETT |mm0|
                (SPADCALL (QCDR (|FLOAT;mat1| |k0| |l| |ki| $)) |mm0|
                          (QREFELT $ 104))
                . #2#)
          (LETT |p1| (SPADCALL |mm0| 2 1 (QREFELT $ 103)) . #2#)
          (LETT |q1| (SPADCALL |mm0| 2 2 (QREFELT $ 103)) . #2#)
          (EXIT (|FLOAT;dvide| (CONS |p1| 0) (CONS |q1| 0) $))))) 

(SDEFUN |FLOAT;exp1;$;37| (($ $))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL (QREFELT $ 55)) (QCAR (QREFELT $ 105))
                     (QREFELT $ 106))
           (SETELT $ 105
                   (CONS (SPADCALL (QREFELT $ 55)) (|FLOAT;expInverse| 1 $)))))
         (EXIT (SPADCALL (QCDR (QREFELT $ 105)) (QREFELT $ 48))))) 

(SDEFUN |FLOAT;sqrt;2$;38| ((|x| $) ($ $))
        (SPROG
         ((|i| (|Integer|)) (|p| (|Integer|)) (|l| NIL) (|e| (|Integer|))
          (|m| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 35)) (|error| "negative sqrt"))
                ('T
                 (SEQ (LETT |m| (QCAR |x|) . #1=(|FLOAT;sqrt;2$;38|))
                      (LETT |e| (QCDR |x|) . #1#)
                      (LETT |l| (INTEGER-LENGTH |m|) . #1#)
                      (LETT |p| (+ (- (* 2 (SPADCALL (QREFELT $ 55))) |l|) 2)
                            . #1#)
                      (COND ((ODDP (- |e| |l|)) (LETT |p| (- |p| 1) . #1#)))
                      (LETT |i| (|FLOAT;shift2| (QCAR |x|) |p| $) . #1#)
                      (LETT |i| (SPADCALL |i| (QREFELT $ 58)) . #1#)
                      (EXIT
                       (SPADCALL (CONS |i| (QUOTIENT2 (- |e| |p|) 2))
                                 (QREFELT $ 48))))))))) 

(SDEFUN |FLOAT;bits;Pi;39| (($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 9) (QREFELT $ 107))) 

(SDEFUN |FLOAT;bits;2Pi;40| ((|n| . #1=(|PositiveInteger|)) ($ . #1#))
        (SPROG ((|t| (|PositiveInteger|)))
               (SEQ (LETT |t| (SPADCALL (QREFELT $ 55)) |FLOAT;bits;2Pi;40|)
                    (SPADCALL (QREFELT $ 9) |n| (QREFELT $ 108)) (EXIT |t|)))) 

(SDEFUN |FLOAT;precision;Pi;41| (($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 55))) 

(SDEFUN |FLOAT;precision;2Pi;42| ((|n| . #1=(|PositiveInteger|)) ($ . #1#))
        (SPADCALL |n| (QREFELT $ 67))) 

(SDEFUN |FLOAT;increasePrecision;IPi;43|
        ((|n| |Integer|) ($ |PositiveInteger|))
        (SPROG ((#1=#:G396 NIL) (|b| (|PositiveInteger|)))
               (SEQ
                (LETT |b| (SPADCALL (QREFELT $ 55))
                      . #2=(|FLOAT;increasePrecision;IPi;43|))
                (SPADCALL
                 (PROG1 (LETT #1# (+ |b| |n|) . #2#)
                   (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                 (QREFELT $ 67))
                (EXIT |b|)))) 

(SDEFUN |FLOAT;decreasePrecision;IPi;44|
        ((|n| |Integer|) ($ |PositiveInteger|))
        (SPROG ((#1=#:G400 NIL) (|b| (|PositiveInteger|)))
               (SEQ
                (LETT |b| (SPADCALL (QREFELT $ 55))
                      . #2=(|FLOAT;decreasePrecision;IPi;44|))
                (SPADCALL
                 (PROG1 (LETT #1# (- |b| |n|) . #2#)
                   (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                 (QREFELT $ 67))
                (EXIT |b|)))) 

(SDEFUN |FLOAT;ceillog10base2| ((|n| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG ((#1=#:G404 NIL))
               (PROG1
                   (LETT #1# (QUOTIENT2 (+ (* 13301 |n|) 4003) 4004)
                         |FLOAT;ceillog10base2|)
                 (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#)))) 

(SDEFUN |FLOAT;digits;Pi;46| (($ |PositiveInteger|))
        (SPROG ((#1=#:G407 NIL))
               (PROG1
                   (LETT #1#
                         (MAX 1
                              (QUOTIENT2
                               (SPADCALL 4004 (- (SPADCALL (QREFELT $ 55)) 1)
                                         (QREFELT $ 60))
                               13301))
                         |FLOAT;digits;Pi;46|)
                 (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#)))) 

(SDEFUN |FLOAT;digits;2Pi;47| ((|n| . #1=(|PositiveInteger|)) ($ . #1#))
        (SPROG ((|t| (|PositiveInteger|)))
               (SEQ (LETT |t| (SPADCALL (QREFELT $ 111)) |FLOAT;digits;2Pi;47|)
                    (SPADCALL (+ 1 (|FLOAT;ceillog10base2| |n| $))
                              (QREFELT $ 67))
                    (EXIT |t|)))) 

(SDEFUN |FLOAT;order;$I;48| ((|a| $) ($ |Integer|))
        (- (+ (INTEGER-LENGTH (QCAR |a|)) (QCDR |a|)) 1)) 

(SDEFUN |FLOAT;relerror;2$I;49| ((|a| $) (|b| $) ($ |Integer|))
        (SPADCALL
         (SPADCALL (SPADCALL |a| |b| (QREFELT $ 50)) |b| (QREFELT $ 45))
         (QREFELT $ 59))) 

(PUT '|FLOAT;Zero;$;50| '|SPADreplace| '(XLAM NIL (CONS 0 0))) 

(SDEFUN |FLOAT;Zero;$;50| (($ $)) (CONS 0 0)) 

(PUT '|FLOAT;One;$;51| '|SPADreplace| '(XLAM NIL (CONS 1 0))) 

(SDEFUN |FLOAT;One;$;51| (($ $)) (CONS 1 0)) 

(PUT '|FLOAT;base;Pi;52| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |FLOAT;base;Pi;52| (($ |PositiveInteger|)) 2) 

(PUT '|FLOAT;mantissa;$I;53| '|SPADreplace| 'QCAR) 

(SDEFUN |FLOAT;mantissa;$I;53| ((|x| $) ($ |Integer|)) (QCAR |x|)) 

(PUT '|FLOAT;exponent;$I;54| '|SPADreplace| 'QCDR) 

(SDEFUN |FLOAT;exponent;$I;54| ((|x| $) ($ |Integer|)) (QCDR |x|)) 

(SDEFUN |FLOAT;one?;$B;55| ((|a| $) ($ |Boolean|))
        (SPADCALL |a| (|spadConstant| $ 38) (QREFELT $ 39))) 

(SDEFUN |FLOAT;zero?;$B;56| ((|a| $) ($ |Boolean|)) (ZEROP (QCAR |a|))) 

(SDEFUN |FLOAT;negative?;$B;57| ((|a| $) ($ |Boolean|)) (MINUSP (QCAR |a|))) 

(SDEFUN |FLOAT;positive?;$B;58| ((|a| $) ($ |Boolean|))
        (SPADCALL (QCAR |a|) (QREFELT $ 116))) 

(SDEFUN |FLOAT;chop| ((|x| $) (|p| |PositiveInteger|) ($ $))
        (SPROG ((|e| (|Integer|)))
               (SEQ
                (LETT |e| (- (INTEGER-LENGTH (QCAR |x|)) |p|)
                      . #1=(|FLOAT;chop|))
                (COND
                 ((SPADCALL |e| 0 (QREFELT $ 68))
                  (LETT |x|
                        (CONS (|FLOAT;shift2| (QCAR |x|) (- |e|) $)
                              (+ (QCDR |x|) |e|))
                        . #1#)))
                (EXIT |x|)))) 

(SDEFUN |FLOAT;float;2I$;60| ((|m| . #1=(|Integer|)) (|e| . #1#) ($ $))
        (SPADCALL (CONS |m| |e|) (QREFELT $ 48))) 

(SDEFUN |FLOAT;float;2IPi$;61|
        ((|m| . #1=(|Integer|)) (|e| . #1#) (|b| |PositiveInteger|) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (COND ((EQL |m| 0) (|spadConstant| $ 34))
                      ('T
                       (SEQ (SPADCALL 4 (QREFELT $ 43))
                            (LETT |r|
                                  (SPADCALL |m|
                                            (SPADCALL (CONS |b| 0) |e|
                                                      (QREFELT $ 91))
                                            (QREFELT $ 70))
                                  |FLOAT;float;2IPi$;61|)
                            (SPADCALL 4 (QREFELT $ 47))
                            (EXIT (SPADCALL |r| (QREFELT $ 48))))))))) 

(SDEFUN |FLOAT;normalize;2$;62| ((|x| $) ($ $))
        (SPROG ((|y| (|Integer|)) (|e| (|Integer|)) (|m| (|Integer|)))
               (SEQ (LETT |m| (QCAR |x|) . #1=(|FLOAT;normalize;2$;62|))
                    (EXIT
                     (COND ((EQL |m| 0) (|spadConstant| $ 34))
                           (#2='T
                            (SEQ
                             (LETT |e|
                                   (- (INTEGER-LENGTH |m|)
                                      (SPADCALL (QREFELT $ 55)))
                                   . #1#)
                             (COND
                              ((SPADCALL |e| 0 (QREFELT $ 68))
                               (SEQ
                                (LETT |y| (|FLOAT;shift2| |m| (- 1 |e|) $)
                                      . #1#)
                                (COND
                                 ((ODDP |y|)
                                  (SEQ
                                   (LETT |y|
                                         (QUOTIENT2
                                          (COND
                                           ((SPADCALL |y| 0 (QREFELT $ 68))
                                            (+ |y| 1))
                                           (#2# (- |y| 1)))
                                          2)
                                         . #1#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL (INTEGER-LENGTH |y|)
                                                (SPADCALL (QREFELT $ 55))
                                                (QREFELT $ 106))
                                      (SEQ (LETT |y| (QUOTIENT2 |y| 2) . #1#)
                                           (EXIT
                                            (LETT |e| (+ |e| 1) . #1#))))))))
                                 (#2# (LETT |y| (QUOTIENT2 |y| 2) . #1#)))
                                (EXIT
                                 (LETT |x| (CONS |y| (+ (QCDR |x|) |e|))
                                       . #1#)))))
                             (EXIT |x|)))))))) 

(SDEFUN |FLOAT;shift;$I$;63| ((|x| $) (|n| |Integer|) ($ $))
        (CONS (QCAR |x|) (+ (QCDR |x|) |n|))) 

(SDEFUN |FLOAT;=;2$B;64| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((EQL (QCDR |x|) (QCDR |y|)) (EQL (QCAR |x|) (QCAR |y|)))
              ((EQL (SPADCALL |x| (QREFELT $ 59))
                    (SPADCALL |y| (QREFELT $ 59)))
               (COND
                ((EQL (SPADCALL |x| (QREFELT $ 65))
                      (SPADCALL |y| (QREFELT $ 65)))
                 (SPADCALL (SPADCALL |x| |y| (QREFELT $ 50)) (QREFELT $ 33)))
                (#1='T 'NIL)))
              (#1# 'NIL))) 

(SDEFUN |FLOAT;<;2$B;65| ((|x| $) (|y| $) ($ |Boolean|))
        (SEQ
         (COND ((EQL (QCAR |y|) 0) (< (QCAR |x|) 0))
               ((EQL (QCAR |x|) 0) (SPADCALL (QCAR |y|) 0 (QREFELT $ 68)))
               (#1='T
                (SEQ
                 (COND
                  ((SPADCALL |x| (QREFELT $ 35))
                   (COND ((SPADCALL |y| (QREFELT $ 117)) (EXIT 'T)))))
                 (COND
                  ((SPADCALL |y| (QREFELT $ 35))
                   (COND ((SPADCALL |x| (QREFELT $ 117)) (EXIT 'NIL)))))
                 (EXIT
                  (COND
                   ((< (SPADCALL |x| (QREFELT $ 59))
                       (SPADCALL |y| (QREFELT $ 59)))
                    (SPADCALL |x| (QREFELT $ 117)))
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 59))
                              (SPADCALL |y| (QREFELT $ 59)) (QREFELT $ 68))
                    (SPADCALL |x| (QREFELT $ 35)))
                   (#1#
                    (SPADCALL (SPADCALL |x| |y| (QREFELT $ 50))
                              (QREFELT $ 35)))))))))) 

(SDEFUN |FLOAT;abs;2$;66| ((|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 35)) (SPADCALL |x| (QREFELT $ 36)))
              ('T (SPADCALL |x| (QREFELT $ 48))))) 

(SDEFUN |FLOAT;ceiling;2$;67| ((|x| $) ($ $))
        (SPROG ((#1=#:G458 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |x| (QREFELT $ 35))
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL (SPADCALL |x| (QREFELT $ 36))
                                      (QREFELT $ 120))
                            (QREFELT $ 36))
                           |FLOAT;ceiling;2$;67|)
                     (GO #1#))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |x| (QREFELT $ 54)) (QREFELT $ 33))
                     |x|)
                    ('T
                     (SPADCALL (SPADCALL |x| (QREFELT $ 121))
                               (|spadConstant| $ 38) (QREFELT $ 62)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |FLOAT;wholePart;$I;68| ((|x| $) ($ |Integer|))
        (|FLOAT;shift2| (QCAR |x|) (QCDR |x|) $)) 

(SDEFUN |FLOAT;floor;2$;69| ((|x| $) ($ $))
        (COND
         ((SPADCALL |x| (QREFELT $ 35))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (QREFELT $ 122))
                    (QREFELT $ 36)))
         ('T (SPADCALL |x| (QREFELT $ 121))))) 

(SDEFUN |FLOAT;round;2$;70| ((|x| $) ($ $))
        (SPROG ((|half| ($)))
               (SEQ
                (LETT |half| (CONS (SPADCALL |x| (QREFELT $ 65)) -1)
                      |FLOAT;round;2$;70|)
                (EXIT
                 (SPADCALL (SPADCALL |x| |half| (QREFELT $ 62))
                           (QREFELT $ 121)))))) 

(SDEFUN |FLOAT;sign;$I;71| ((|x| $) ($ |Integer|))
        (COND ((< (QCAR |x|) 0) -1) ('T 1))) 

(SDEFUN |FLOAT;truncate;2$;72| ((|x| $) ($ $))
        (SPROG ((#1=#:G470 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((>= (QCDR |x|) 0)
                    (PROGN (LETT #1# |x| |FLOAT;truncate;2$;72|) (GO #1#))))
                  (EXIT
                   (SPADCALL (CONS (|FLOAT;shift2| (QCAR |x|) (QCDR |x|) $) 0)
                             (QREFELT $ 48)))))
                #1# (EXIT #1#)))) 

(SDEFUN |FLOAT;recip;$U;73| ((|x| $) ($ |Union| $ "failed"))
        (COND
         ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 39))
          (CONS 1 "failed"))
         ('T (CONS 0 (SPADCALL (|spadConstant| $ 38) |x| (QREFELT $ 45)))))) 

(SDEFUN |FLOAT;differentiate;2$;74| ((|x| $) ($ $)) (|spadConstant| $ 34)) 

(SDEFUN |FLOAT;-;2$;75| ((|x| $) ($ $))
        (SPADCALL (|FLOAT;negate| |x| $) (QREFELT $ 48))) 

(SDEFUN |FLOAT;negate| ((|x| $) ($ $)) (CONS (- (QCAR |x|)) (QCDR |x|))) 

(SDEFUN |FLOAT;+;3$;77| ((|x| $) (|y| $) ($ $))
        (SPADCALL (|FLOAT;plus| |x| |y| $) (QREFELT $ 48))) 

(SDEFUN |FLOAT;-;3$;78| ((|x| $) (|y| $) ($ $))
        (SPADCALL (|FLOAT;plus| |x| (|FLOAT;negate| |y| $) $) (QREFELT $ 48))) 

(SDEFUN |FLOAT;sub| ((|x| $) (|y| $) ($ $))
        (|FLOAT;plus| |x| (|FLOAT;negate| |y| $) $)) 

(SDEFUN |FLOAT;plus| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|mw| (|Integer|)) (|ey| #1=(|Integer|)) (|ex| #1#)
          (|my| #2=(|Integer|)) (|mx| #2#) (|#G124| #1#) (|#G123| #1#)
          (|#G122| #2#) (|#G121| #2#) (|de| (|Integer|)))
         (SEQ (LETT |mx| (QCAR |x|) . #3=(|FLOAT;plus|))
              (LETT |my| (QCAR |y|) . #3#)
              (EXIT
               (COND ((EQL |mx| 0) |y|) ((EQL |my| 0) |x|)
                     (#4='T
                      (SEQ (LETT |ex| (QCDR |x|) . #3#)
                           (LETT |ey| (QCDR |y|) . #3#)
                           (EXIT
                            (COND ((EQL |ex| |ey|) (CONS (+ |mx| |my|) |ex|))
                                  (#4#
                                   (SEQ
                                    (LETT |de|
                                          (-
                                           (- (+ |ex| (INTEGER-LENGTH |mx|))
                                              |ey|)
                                           (INTEGER-LENGTH |my|))
                                          . #3#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |de|
                                                 (+ (SPADCALL (QREFELT $ 55))
                                                    1)
                                                 (QREFELT $ 68))
                                       |x|)
                                      ((< |de|
                                          (- (+ (SPADCALL (QREFELT $ 55)) 1)))
                                       |y|)
                                      (#4#
                                       (SEQ
                                        (COND
                                         ((< |ex| |ey|)
                                          (PROGN
                                           (LETT |#G121| |my| . #3#)
                                           (LETT |#G122| |mx| . #3#)
                                           (LETT |#G123| |ey| . #3#)
                                           (LETT |#G124| |ex| . #3#)
                                           (LETT |mx| |#G121| . #3#)
                                           (LETT |my| |#G122| . #3#)
                                           (LETT |ex| |#G123| . #3#)
                                           (LETT |ey| |#G124| . #3#))))
                                        (LETT |mw|
                                              (+ |my|
                                                 (|FLOAT;shift2| |mx|
                                                  (- |ex| |ey|) $))
                                              . #3#)
                                        (EXIT (CONS |mw| |ey|))))))))))))))))) 

(SDEFUN |FLOAT;*;3$;81| ((|x| $) (|y| $) ($ $))
        (SPADCALL (|FLOAT;times| |x| |y| $) (QREFELT $ 48))) 

(SDEFUN |FLOAT;*;I2$;82| ((|x| |Integer|) (|y| $) ($ $))
        (COND
         ((SPADCALL (INTEGER-LENGTH |x|) (SPADCALL (QREFELT $ 55))
                    (QREFELT $ 106))
          (SPADCALL (SPADCALL (CONS |x| 0) (QREFELT $ 48)) |y| (QREFELT $ 61)))
         ('T (SPADCALL (CONS (* |x| (QCAR |y|)) (QCDR |y|)) (QREFELT $ 48))))) 

(SDEFUN |FLOAT;/;3$;83| ((|x| $) (|y| $) ($ $))
        (SPADCALL (|FLOAT;dvide| |x| |y| $) (QREFELT $ 48))) 

(SDEFUN |FLOAT;/;$I$;84| ((|x| $) (|y| |Integer|) ($ $))
        (COND
         ((SPADCALL (INTEGER-LENGTH |y|) (SPADCALL (QREFELT $ 55))
                    (QREFELT $ 106))
          (SPADCALL |x| (SPADCALL (CONS |y| 0) (QREFELT $ 48)) (QREFELT $ 45)))
         ('T (SPADCALL |x| (CONS |y| 0) (QREFELT $ 45))))) 

(SDEFUN |FLOAT;inv;2$;85| ((|x| $) ($ $))
        (SPADCALL (|spadConstant| $ 38) |x| (QREFELT $ 45))) 

(SDEFUN |FLOAT;times| ((|x| $) (|y| $) ($ $))
        (CONS (* (QCAR |x|) (QCAR |y|)) (+ (QCDR |x|) (QCDR |y|)))) 

(SDEFUN |FLOAT;itimes| ((|n| |Integer|) (|y| $) ($ $))
        (CONS (* |n| (QCAR |y|)) (QCDR |y|))) 

(SDEFUN |FLOAT;dvide| ((|x| $) (|y| $) ($ $))
        (SPROG ((|ew| (|Integer|)) (|mw| (|Integer|)))
               (SEQ
                (LETT |ew|
                      (+
                       (+
                        (- (INTEGER-LENGTH (QCAR |y|))
                           (INTEGER-LENGTH (QCAR |x|)))
                        (SPADCALL (QREFELT $ 55)))
                       1)
                      . #1=(|FLOAT;dvide|))
                (LETT |mw|
                      (QUOTIENT2 (|FLOAT;shift2| (QCAR |x|) |ew| $) (QCAR |y|))
                      . #1#)
                (LETT |ew| (- (- (QCDR |x|) (QCDR |y|)) |ew|) . #1#)
                (EXIT (CONS |mw| |ew|))))) 

(SDEFUN |FLOAT;square| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG
         ((|ex| (|Integer|)) (|ma| (|Integer|)) (|l| (|Integer|)) (|k| NIL))
         (SEQ (LETT |ma| (QCAR |x|) . #1=(|FLOAT;square|))
              (LETT |ex| (QCDR |x|) . #1#)
              (SEQ (LETT |k| 1 . #1#) G190
                   (COND ((|greater_SI| |k| |n|) (GO G191)))
                   (SEQ (LETT |ma| (* |ma| |ma|) . #1#)
                        (LETT |ex| (+ |ex| |ex|) . #1#)
                        (LETT |l|
                              (- (SPADCALL (QREFELT $ 55))
                                 (INTEGER-LENGTH |ma|))
                              . #1#)
                        (LETT |ma| (|FLOAT;shift2| |ma| |l| $) . #1#)
                        (EXIT (LETT |ex| (- |ex| |l|) . #1#)))
                   (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |ma| |ex|))))) 

(SDEFUN |FLOAT;power| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((|z| ($)) (#1=#:G514 NIL) (|y| ($)))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| (|spadConstant| $ 38) . #2=(|FLOAT;power|))
                      (LETT |z| |x| . #2#)
                      (EXIT
                       (SEQ G190 NIL
                            (SEQ
                             (COND
                              ((ODDP |n|)
                               (LETT |y|
                                     (|FLOAT;chop| (|FLOAT;times| |y| |z| $)
                                      (SPADCALL (QREFELT $ 55)) $)
                                     . #2#)))
                             (SEQ (LETT |n| (QUOTIENT2 |n| 2) . #2#)
                                  (EXIT
                                   (COND
                                    ((EQL |n| 0)
                                     (PROGN (LETT #1# |y| . #2#) (GO #1#))))))
                             (EXIT
                              (LETT |z|
                                    (|FLOAT;chop| (|FLOAT;times| |z| |z| $)
                                     (SPADCALL (QREFELT $ 55)) $)
                                    . #2#)))
                            NIL (GO G190) G191 (EXIT NIL)))))
                #1# (EXIT #1#)))) 

(SDEFUN |FLOAT;^;3$;91| ((|x| $) (|y| $) ($ $))
        (SPROG ((|r| ($)) (|p| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 39))
                  (COND
                   ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 39))
                    (|error| "0^0 is undefined"))
                   ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 51))
                    (|error| "division by 0"))
                   ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 42))
                    (|spadConstant| $ 34))))
                 ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 39))
                  (|spadConstant| $ 38))
                 ((SPADCALL |y| (|spadConstant| $ 38) (QREFELT $ 39)) |x|)
                 ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 39))
                  (|spadConstant| $ 38))
                 ('T
                  (SEQ
                   (LETT |p| (+ (ABS (SPADCALL |y| (QREFELT $ 59))) 5)
                         . #1=(|FLOAT;^;3$;91|))
                   (SPADCALL |p| (QREFELT $ 43))
                   (LETT |r|
                         (SPADCALL
                          (SPADCALL |y| (SPADCALL |x| (QREFELT $ 86))
                                    (QREFELT $ 61))
                          (QREFELT $ 82))
                         . #1#)
                   (SPADCALL |p| (QREFELT $ 47))
                   (EXIT (SPADCALL |r| (QREFELT $ 48))))))))) 

(SDEFUN |FLOAT;^;$F$;92| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG ((|y| ($)) (#1=#:G524 NIL) (|d| (|Integer|)) (|n| (|Integer|)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 39))
                   (COND
                    ((SPADCALL |r| (|spadConstant| $ 130) (QREFELT $ 131))
                     (|error| "0^0 is undefined"))
                    ((SPADCALL |r| (|spadConstant| $ 130) (QREFELT $ 132))
                     (|error| "division by 0"))
                    ((SPADCALL |r| (|spadConstant| $ 130) (QREFELT $ 133))
                     (|spadConstant| $ 34))))
                  ((SPADCALL |r| (|spadConstant| $ 130) (QREFELT $ 131))
                   (|spadConstant| $ 38))
                  ((SPADCALL |r| (|spadConstant| $ 134) (QREFELT $ 131)) |x|)
                  ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 39))
                   (|spadConstant| $ 38))
                  (#2='T
                   (SEQ
                    (LETT |n| (SPADCALL |r| (QREFELT $ 135))
                          . #3=(|FLOAT;^;$F$;92|))
                    (LETT |d| (SPADCALL |r| (QREFELT $ 136)) . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL |x| (QREFELT $ 35))
                       (COND
                        ((ODDP |d|)
                         (COND
                          ((ODDP |n|)
                           (PROGN
                            (LETT #1#
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |x| (QREFELT $ 36)) |r|
                                             (QREFELT $ 137))
                                   (QREFELT $ 36))
                                  . #3#)
                            (GO #1#)))
                          (#2#
                           (PROGN
                            (LETT #1#
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 36)) |r|
                                            (QREFELT $ 137))
                                  . #3#)
                            (GO #1#)))))
                        (#2# (|error| "negative root"))))
                      (#2#
                       (SEQ
                        (COND
                         ((EQL |d| 2)
                          (SEQ (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 43))
                               (LETT |y| (SPADCALL |x| (QREFELT $ 44)) . #3#)
                               (LETT |y| (SPADCALL |y| |n| (QREFELT $ 91))
                                     . #3#)
                               (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 47))
                               (EXIT
                                (PROGN
                                 (LETT #1# (SPADCALL |y| (QREFELT $ 48)) . #3#)
                                 (GO #1#))))))
                        (LETT |y|
                              (SPADCALL (CONS |n| 0) (CONS |d| 0)
                                        (QREFELT $ 45))
                              . #3#)
                        (EXIT (SPADCALL |x| |y| (QREFELT $ 128)))))))))))
                #1# (EXIT #1#)))) 

(SDEFUN |FLOAT;^;$I$;93| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((|y| ($)) (|p| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 39))
                  (COND ((EQL |n| 0) (|error| "0^0 is undefined"))
                        ((< |n| 0) (|error| "division by 0"))
                        ((SPADCALL |n| 0 (QREFELT $ 68))
                         (|spadConstant| $ 34))))
                 ((EQL |n| 0) (|spadConstant| $ 38)) ((EQL |n| 1) |x|)
                 ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 39))
                  (|spadConstant| $ 38))
                 ('T
                  (SEQ
                   (LETT |p| (SPADCALL (QREFELT $ 55)) . #1=(|FLOAT;^;$I$;93|))
                   (SPADCALL (+ (+ |p| (INTEGER-LENGTH |n|)) 2) (QREFELT $ 67))
                   (LETT |y| (|FLOAT;power| |x| (ABS |n|) $) . #1#)
                   (COND
                    ((< |n| 0)
                     (LETT |y| (|FLOAT;dvide| (|spadConstant| $ 38) |y| $)
                           . #1#)))
                   (SPADCALL |p| (QREFELT $ 67))
                   (EXIT (SPADCALL |y| (QREFELT $ 48))))))))) 

(SDEFUN |FLOAT;convert10| ((|x| $) (|d| |Integer|) ($ $))
        (SPROG
         ((|h| ($)) (|r| #1=(|Integer|)) (#2=#:G530 NIL)
          (|b| (|PositiveInteger|)) (|q| #3=(|Integer|))
          (|#G154| (|Record| (|:| |quotient| #3#) (|:| |remainder| #1#)))
          (|e| (|Integer|)) (|m| (|Integer|)))
         (SEQ (LETT |m| (QCAR |x|) . #4=(|FLOAT;convert10|))
              (LETT |e| (QCDR |x|) . #4#)
              (LETT |b| (SPADCALL (QREFELT $ 55)) . #4#)
              (PROGN
               (LETT |#G154| (DIVIDE2 (ABS |e|) |b|) . #4#)
               (LETT |q| (QCAR |#G154|) . #4#)
               (LETT |r| (QCDR |#G154|) . #4#)
               |#G154|)
              (LETT |b| (EXPT 2 |b|) . #4#)
              (LETT |r|
                    (EXPT 2
                          (PROG1 (LETT #2# |r| . #4#)
                            (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                             #2#)))
                    . #4#)
              (LETT |h| (|FLOAT;power10| (CONS |b| 0) |q| (+ |d| 5) $) . #4#)
              (LETT |h|
                    (|FLOAT;chop10| (CONS (* |r| (QCAR |h|)) (QCDR |h|))
                     (+ |d| 5) $)
                    . #4#)
              (EXIT
               (COND
                ((< |e| 0)
                 (LETT |h| (|FLOAT;quotient10| (CONS |m| 0) |h| |d| $) . #4#))
                ('T (|FLOAT;times10| (CONS |m| 0) |h| |d| $))))))) 

(SDEFUN |FLOAT;ceilLength10| ((|n| |Integer|) ($ |Integer|))
        (+ (QUOTIENT2 (* 146 (INTEGER-LENGTH |n|)) 485) 1)) 

(SDEFUN |FLOAT;floorLength10| ((|n| |Integer|) ($ |Integer|))
        (QUOTIENT2 (* 643 (INTEGER-LENGTH |n|)) 2136)) 

(SDEFUN |FLOAT;length10| ((|n| |Integer|) ($ |Integer|))
        (SPROG
         ((|lower| (|Integer|)) (#1=#:G537 NIL)
          (|upper| (|NonNegativeInteger|)) (|ln| NIL))
         (SEQ
          (LETT |ln|
                (INTEGER-LENGTH (LETT |n| (ABS |n|) . #2=(|FLOAT;length10|)))
                . #2#)
          (LETT |upper| (QUOTIENT2 (* 76573 |ln|) 254370) . #2#)
          (LETT |lower|
                (QUOTIENT2 (SPADCALL 21306 (- |ln| 1) (QREFELT $ 60)) 70777)
                . #2#)
          (EXIT
           (COND ((EQL |upper| |lower|) (+ |upper| 1))
                 ('T
                  (SEQ
                   (LETT |n|
                         (QUOTIENT2 |n|
                                    (EXPT 10
                                          (PROG1 (LETT #1# |lower| . #2#)
                                            (|check_subtype| (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             #1#))))
                         . #2#)
                   (SEQ G190 (COND ((NULL (>= |n| 10)) (GO G191)))
                        (SEQ (LETT |n| (QUOTIENT2 |n| 10) . #2#)
                             (EXIT (LETT |lower| (+ |lower| 1) . #2#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT (+ |lower| 1))))))))) 

(SDEFUN |FLOAT;chop10| ((|x| $) (|p| |Integer|) ($ $))
        (SPROG ((#1=#:G544 NIL) (|e| (|Integer|)))
               (SEQ
                (LETT |e| (- (|FLOAT;floorLength10| (QCAR |x|) $) |p|)
                      . #2=(|FLOAT;chop10|))
                (COND
                 ((SPADCALL |e| 0 (QREFELT $ 68))
                  (LETT |x|
                        (CONS
                         (QUOTIENT2 (QCAR |x|)
                                    (EXPT 10
                                          (PROG1 (LETT #1# |e| . #2#)
                                            (|check_subtype| (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             #1#))))
                         (+ (QCDR |x|) |e|))
                        . #2#)))
                (EXIT |x|)))) 

(SDEFUN |FLOAT;normalize10| ((|x| $) (|p| |Integer|) ($ $))
        (SPROG
         ((|ex| (|Integer|)) (|ma| (|Integer|)) (#1=#:G552 NIL)
          (|r| #2=(|Integer|))
          (|#G164|
           (|Record| (|:| |quotient| (|Integer|)) (|:| |remainder| #2#)))
          (#3=#:G548 NIL) (|e| (|Integer|)))
         (SEQ (LETT |ma| (QCAR |x|) . #4=(|FLOAT;normalize10|))
              (LETT |ex| (QCDR |x|) . #4#)
              (LETT |e| (- (|FLOAT;length10| |ma| $) |p|) . #4#)
              (COND
               ((SPADCALL |e| 0 (QREFELT $ 68))
                (SEQ
                 (LETT |ma|
                       (QUOTIENT2 |ma|
                                  (EXPT 10
                                        (PROG1 (LETT #3# (- |e| 1) . #4#)
                                          (|check_subtype| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           #3#))))
                       . #4#)
                 (LETT |ex| (+ |ex| |e|) . #4#)
                 (PROGN
                  (LETT |#G164| (DIVIDE2 |ma| 10) . #4#)
                  (LETT |ma| (QCAR |#G164|) . #4#)
                  (LETT |r| (QCDR |#G164|) . #4#)
                  |#G164|)
                 (EXIT
                  (COND
                   ((SPADCALL |r| 4 (QREFELT $ 68))
                    (SEQ (LETT |ma| (+ |ma| 1) . #4#)
                         (EXIT
                          (COND
                           ((EQL |ma|
                                 (EXPT 10
                                       (PROG1 (LETT #1# |p| . #4#)
                                         (|check_subtype| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          #1#))))
                            (SEQ (LETT |ma| 1 . #4#)
                                 (EXIT
                                  (LETT |ex| (+ |ex| |p|) . #4#)))))))))))))
              (EXIT (CONS |ma| |ex|))))) 

(SDEFUN |FLOAT;times10| ((|x| $) (|y| $) (|p| |Integer|) ($ $))
        (|FLOAT;normalize10| (|FLOAT;times| |x| |y| $) |p| $)) 

(SDEFUN |FLOAT;quotient10| ((|x| $) (|y| $) (|p| |Integer|) ($ $))
        (SPROG ((|ew| (|Integer|)) (|mw| (|Integer|)) (#1=#:G579 NIL))
               (SEQ
                (LETT |ew|
                      (+
                       (+
                        (- (|FLOAT;floorLength10| (QCAR |y|) $)
                           (|FLOAT;ceilLength10| (QCAR |x|) $))
                        |p|)
                       2)
                      . #2=(|FLOAT;quotient10|))
                (COND ((< |ew| 0) (LETT |ew| 0 . #2#)))
                (LETT |mw|
                      (QUOTIENT2
                       (* (QCAR |x|)
                          (EXPT 10
                                (PROG1 (LETT #1# |ew| . #2#)
                                  (|check_subtype| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   #1#))))
                       (QCAR |y|))
                      . #2#)
                (LETT |ew| (- (- (QCDR |x|) (QCDR |y|)) |ew|) . #2#)
                (EXIT (|FLOAT;normalize10| (CONS |mw| |ew|) |p| $))))) 

(SDEFUN |FLOAT;power10| ((|x| $) (|n| . #1=(|Integer|)) (|d| |Integer|) ($ $))
        (SPROG
         ((|z| ($)) (#2=#:G587 NIL) (|e| #1#) (|y| ($)) (|p| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 39))
             (|spadConstant| $ 34))
            ((EQL |n| 0) (|spadConstant| $ 38)) ((EQL |n| 1) |x|)
            ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 39))
             (|spadConstant| $ 38))
            ('T
             (SEQ
              (LETT |p| (+ (+ |d| (INTEGER-LENGTH |n|)) 1)
                    . #3=(|FLOAT;power10|))
              (LETT |e| |n| . #3#) (LETT |y| (|spadConstant| $ 38) . #3#)
              (LETT |z| |x| . #3#)
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (COND
                      ((ODDP |e|)
                       (LETT |y|
                             (|FLOAT;chop10| (|FLOAT;times| |y| |z| $) |p| $)
                             . #3#)))
                     (SEQ (LETT |e| (QUOTIENT2 |e| 2) . #3#)
                          (EXIT
                           (COND
                            ((EQL |e| 0)
                             (PROGN (LETT #2# |y| . #3#) (GO #2#))))))
                     (EXIT
                      (LETT |z|
                            (|FLOAT;chop10| (|FLOAT;times| |z| |z| $) |p| $)
                            . #3#)))
                    NIL (GO G190) G191 (EXIT NIL)))))))
          #2# (EXIT #2#)))) 

(SDEFUN |FLOAT;padFromLeft| ((|s| |String|) ($ |String|))
        (SPROG
         ((|j| (|Integer|)) (|i| NIL) (|t| (|String|)) (#1=#:G589 NIL)
          (|n| (|Integer|)))
         (SEQ
          (COND ((ZEROP (SPADCALL (QREFELT $ 140) (QREFELT $ 147))) |s|)
                ('T
                 (SEQ (LETT |n| (- (QCSIZE |s|) 1) . #2=(|FLOAT;padFromLeft|))
                      (LETT |t|
                            (|make_full_CVEC|
                             (PROG1
                                 (LETT #1#
                                       (+ (+ |n| 1)
                                          (QUOTIENT2 |n|
                                                     (SPADCALL (QREFELT $ 140)
                                                               (QREFELT $
                                                                        147))))
                                       . #2#)
                               (|check_subtype| (>= #1# 0)
                                                '(|NonNegativeInteger|) #1#))
                             (STR_ELT "_ " 0))
                            . #2#)
                      (SEQ (LETT |j| (SPADCALL |t| (QREFELT $ 148)) . #2#)
                           (LETT |i| 0 . #2#) G190
                           (COND ((|greater_SI| |i| |n|) (GO G191)))
                           (SEQ
                            (SPADCALL |t| |j|
                                      (SPADCALL |s|
                                                (+ |i|
                                                   (SPADCALL |s|
                                                             (QREFELT $ 148)))
                                                (QREFELT $ 150))
                                      (QREFELT $ 151))
                            (EXIT
                             (COND
                              ((EQL
                                (REM (+ |i| 1)
                                     (SPADCALL (QREFELT $ 140)
                                               (QREFELT $ 147)))
                                0)
                               (LETT |j| (+ |j| 1) . #2#)))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|)
                                   (LETT |j| (+ |j| 1) . #2#))
                                 . #2#)
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |t|))))))) 

(SDEFUN |FLOAT;padFromRight| ((|s| |String|) ($ |String|))
        (SPROG
         ((|j| #1=(|Integer|)) (|i| NIL) (|t| (|String|)) (#2=#:G596 NIL)
          (|n| #1#))
         (SEQ
          (COND ((EQL (SPADCALL (QREFELT $ 140) (QREFELT $ 147)) 0) |s|)
                ('T
                 (SEQ (LETT |n| (- (QCSIZE |s|) 1) . #3=(|FLOAT;padFromRight|))
                      (LETT |t|
                            (|make_full_CVEC|
                             (PROG1
                                 (LETT #2#
                                       (+ (+ |n| 1)
                                          (QUOTIENT2 |n|
                                                     (SPADCALL (QREFELT $ 140)
                                                               (QREFELT $
                                                                        147))))
                                       . #3#)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             (STR_ELT "_ " 0))
                            . #3#)
                      (SEQ (LETT |j| (SPADCALL |t| (QREFELT $ 152)) . #3#)
                           (LETT |i| |n| . #3#) G190
                           (COND ((< |i| 0) (GO G191)))
                           (SEQ
                            (SPADCALL |t| |j|
                                      (SPADCALL |s|
                                                (+ |i|
                                                   (SPADCALL |s|
                                                             (QREFELT $ 148)))
                                                (QREFELT $ 150))
                                      (QREFELT $ 151))
                            (EXIT
                             (COND
                              ((EQL
                                (REM (+ (- |n| |i|) 1)
                                     (SPADCALL (QREFELT $ 140)
                                               (QREFELT $ 147)))
                                0)
                               (LETT |j| (- |j| 1) . #3#)))))
                           (LETT |i|
                                 (PROG1 (+ |i| -1) (LETT |j| (+ |j| -1) . #3#))
                                 . #3#)
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |t|))))))) 

(SDEFUN |FLOAT;fixed| ((|f| $) ($ |String|))
        (SPROG
         ((|t| (|String|)) (#1=#:G621 NIL) (|n| (|NonNegativeInteger|))
          (|s| (|String|)) (#2=#:G617 NIL) (#3=#:G615 NIL) (|p| #4=(|Integer|))
          (|o| #5=(|Integer|)) (|e| (|Integer|)) (|m| (|Integer|)) (|g| ($))
          (|l| (|Integer|)) (|dd| #4#) (|bl| #5#) (#6=#:G607 NIL)
          (#7=#:G604 NIL) (|d| #4#))
         (SEQ
          (LETT |d|
                (COND
                 ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1)
                  (SPADCALL (QREFELT $ 111)))
                 (#8='T (SPADCALL (QREFELT $ 146) (QREFELT $ 153))))
                . #9=(|FLOAT;fixed|))
          (EXIT
           (COND
            ((SPADCALL |f| (QREFELT $ 33))
             (COND ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1) "0.0")
                   (#8#
                    (STRCONC "0"
                             (STRCONC "."
                                      (|FLOAT;padFromLeft|
                                       (|make_full_CVEC|
                                        (PROG1 (LETT #7# |d| . #9#)
                                          (|check_subtype| (>= #7# 0)
                                                           '(|NonNegativeInteger|)
                                                           #7#))
                                        (|STR_to_CHAR| #10="0"))
                                       $))))))
            ((ZEROP (SPADCALL |f| (QREFELT $ 19)))
             (STRCONC
              (|FLOAT;padFromRight| (STRINGIMAGE (SPADCALL |f| (QREFELT $ 17)))
               $)
              (STRCONC "."
                       (|FLOAT;padFromLeft|
                        (|make_full_CVEC|
                         (PROG1 (LETT #6# |d| . #9#)
                           (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|)
                                            #6#))
                         (|STR_to_CHAR| #10#))
                        $))))
            ((SPADCALL |f| (QREFELT $ 35))
             (STRCONC "-" (|FLOAT;fixed| (SPADCALL |f| (QREFELT $ 52)) $)))
            (#8#
             (SEQ (LETT |bl| (+ (INTEGER-LENGTH (QCAR |f|)) (QCDR |f|)) . #9#)
                  (LETT |dd|
                        (COND
                         ((OR
                           (EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1)
                           (NULL (SPADCALL |bl| 0 (QREFELT $ 68))))
                          |d|)
                         ('T
                          (+
                           (+
                            (QUOTIENT2 (SPADCALL 146 |bl| (QREFELT $ 60)) 485)
                            1)
                           |d|)))
                        . #9#)
                  (LETT |g|
                        (|FLOAT;convert10| (SPADCALL |f| (QREFELT $ 52)) |dd|
                         $)
                        . #9#)
                  (LETT |m| (QCAR |g|) . #9#) (LETT |e| (QCDR |g|) . #9#)
                  (COND
                   ((SPADCALL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1
                              (QREFELT $ 64))
                    (SEQ (LETT |l| (|FLOAT;length10| |m| $) . #9#)
                         (EXIT
                          (COND
                           ((SPADCALL (- |e|)
                                      (SPADCALL (QREFELT $ 146)
                                                (QREFELT $ 153))
                                      (QREFELT $ 68))
                            (COND
                             ((< (- |e|)
                                 (SPADCALL 2 (SPADCALL (QREFELT $ 111))
                                           (QREFELT $ 60)))
                              (SEQ
                               (LETT |g|
                                     (|FLOAT;normalize10| |g|
                                      (+ (+ |l| |e|)
                                         (SPADCALL (QREFELT $ 146)
                                                   (QREFELT $ 153)))
                                      $)
                                     . #9#)
                               (LETT |m| (QCAR |g|) . #9#)
                               (EXIT (LETT |e| (QCDR |g|) . #9#)))))))))))
                  (LETT |s| (STRINGIMAGE |m|) . #9#)
                  (LETT |n| (QCSIZE |s|) . #9#) (LETT |o| (+ |e| |n|) . #9#)
                  (LETT |p|
                        (COND
                         ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1)
                          |n|)
                         (#8# (SPADCALL (QREFELT $ 146) (QREFELT $ 153))))
                        . #9#)
                  (COND
                   ((>= |e| 0)
                    (SEQ
                     (LETT |s|
                           (STRCONC |s|
                                    (|make_full_CVEC|
                                     (PROG1 (LETT #3# |e| . #9#)
                                       (|check_subtype| (>= #3# 0)
                                                        '(|NonNegativeInteger|)
                                                        #3#))
                                     (|STR_to_CHAR| #10#)))
                           . #9#)
                     (EXIT (LETT |t| "" . #9#))))
                   ((SPADCALL |o| 0 (QREFELT $ 102))
                    (SEQ
                     (LETT |t|
                           (STRCONC
                            (|make_full_CVEC|
                             (PROG1 (LETT #2# (- |o|) . #9#)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             (|STR_to_CHAR| #10#))
                            |s|)
                           . #9#)
                     (EXIT (LETT |s| "0" . #9#))))
                   (#8#
                    (SEQ
                     (LETT |t|
                           (SPADCALL |s|
                                     (SPADCALL
                                      (+ |o| (SPADCALL |s| (QREFELT $ 148)))
                                      (- (+ |n| (SPADCALL |s| (QREFELT $ 148)))
                                         1)
                                      (QREFELT $ 155))
                                     (QREFELT $ 156))
                           . #9#)
                     (EXIT
                      (LETT |s|
                            (SPADCALL |s|
                                      (SPADCALL (SPADCALL |s| (QREFELT $ 148))
                                                (-
                                                 (+ |o|
                                                    (SPADCALL |s|
                                                              (QREFELT $ 148)))
                                                 1)
                                                (QREFELT $ 155))
                                      (QREFELT $ 156))
                            . #9#)))))
                  (LETT |n| (QCSIZE |t|) . #9#)
                  (COND
                   ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1)
                    (SEQ
                     (LETT |t|
                           (SPADCALL |t| (|STR_to_CHAR| #10#) (QREFELT $ 157))
                           . #9#)
                     (EXIT (COND ((EQUAL |t| "") (LETT |t| "0" . #9#))))))
                   ((SPADCALL |n| |p| (QREFELT $ 68))
                    (LETT |t|
                          (SPADCALL |t|
                                    (SPADCALL (SPADCALL |t| (QREFELT $ 148))
                                              (-
                                               (+ |p|
                                                  (SPADCALL |t|
                                                            (QREFELT $ 148)))
                                               1)
                                              (QREFELT $ 155))
                                    (QREFELT $ 156))
                          . #9#))
                   (#8#
                    (LETT |t|
                          (STRCONC |t|
                                   (|make_full_CVEC|
                                    (PROG1 (LETT #1# (- |p| |n|) . #9#)
                                      (|check_subtype| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                    (|STR_to_CHAR| #10#)))
                          . #9#)))
                  (EXIT
                   (STRCONC (|FLOAT;padFromRight| |s| $)
                            (STRCONC "." (|FLOAT;padFromLeft| |t| $))))))))))) 

(SDEFUN |FLOAT;floating| ((|f| $) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|o| (|Integer|)) (|n| (|NonNegativeInteger|))
          (|e| (|Integer|)) (|m| (|Integer|)) (|g| ($)) (|d| (|Integer|))
          (|t| (|String|)))
         (SEQ
          (COND ((SPADCALL |f| (QREFELT $ 33)) "0.0")
                ((SPADCALL |f| (QREFELT $ 35))
                 (STRCONC "-"
                          (|FLOAT;floating| (SPADCALL |f| (QREFELT $ 52)) $)))
                (#1='T
                 (SEQ
                  (LETT |t|
                        (COND
                         ((ZEROP (SPADCALL (QREFELT $ 140) (QREFELT $ 147)))
                          "E")
                         (#1# " E "))
                        . #2=(|FLOAT;floating|))
                  (EXIT
                   (COND
                    ((ZEROP (SPADCALL |f| (QREFELT $ 19)))
                     (SEQ
                      (LETT |s| (STRINGIMAGE (SPADCALL |f| (QREFELT $ 17)))
                            . #2#)
                      (EXIT
                       (SPADCALL
                        (LIST "0." (|FLOAT;padFromLeft| |s| $) |t|
                              (STRINGIMAGE (QCSIZE |s|)))
                        (QREFELT $ 159)))))
                    (#1#
                     (SEQ
                      (LETT |d|
                            (COND
                             ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153))
                                   -1)
                              (SPADCALL (QREFELT $ 111)))
                             (#1# (SPADCALL (QREFELT $ 146) (QREFELT $ 153))))
                            . #2#)
                      (LETT |g| (|FLOAT;convert10| |f| |d| $) . #2#)
                      (LETT |m| (QCAR |g|) . #2#) (LETT |e| (QCDR |g|) . #2#)
                      (LETT |s| (STRINGIMAGE |m|) . #2#)
                      (LETT |n| (QCSIZE |s|) . #2#)
                      (LETT |o| (+ |e| |n|) . #2#)
                      (LETT |s| (|FLOAT;padFromLeft| |s| $) . #2#)
                      (EXIT
                       (SPADCALL (LIST "0." |s| |t| (STRINGIMAGE |o|))
                                 (QREFELT $ 159))))))))))))) 

(SDEFUN |FLOAT;general| ((|f| $) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|t| (|String|)) (#1=#:G653 NIL) (#2=#:G646 NIL)
          (#3=#:G644 NIL) (|o| (|Integer|)) (|n| (|NonNegativeInteger|))
          (|e| (|Integer|)) (|m| (|Integer|)) (|g| ($)) (#4=#:G643 NIL)
          (|d| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |f| (QREFELT $ 33)) "0.0")
                ((SPADCALL |f| (QREFELT $ 35))
                 (STRCONC "-"
                          (|FLOAT;general| (SPADCALL |f| (QREFELT $ 52)) $)))
                (#5='T
                 (SEQ
                  (LETT |d|
                        (COND
                         ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1)
                          (SPADCALL (QREFELT $ 111)))
                         (#5# (SPADCALL (QREFELT $ 146) (QREFELT $ 153))))
                        . #6=(|FLOAT;general|))
                  (EXIT
                   (COND
                    ((ZEROP (SPADCALL |f| (QREFELT $ 19)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |d| (+ |d| 1) . #6#)
                            (LETT |s|
                                  (STRINGIMAGE (SPADCALL |f| (QREFELT $ 17)))
                                  . #6#)
                            (COND
                             ((SPADCALL
                               (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1
                               (QREFELT $ 64))
                              (SEQ (LETT |e| (QCSIZE |s|) . #6#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |e| |d| (QREFELT $ 68))
                                      (PROGN
                                       (LETT #4#
                                             (SEQ
                                              (LETT |t|
                                                    (COND
                                                     ((ZEROP
                                                       (SPADCALL
                                                        (QREFELT $ 140)
                                                        (QREFELT $ 147)))
                                                      "E")
                                                     (#5# " E "))
                                                    . #6#)
                                              (EXIT
                                               (SPADCALL
                                                (LIST "0."
                                                      (|FLOAT;padFromLeft| |s|
                                                       $)
                                                      |t| (STRINGIMAGE |e|))
                                                (QREFELT $ 159))))
                                             . #6#)
                                       (GO #4#))))))))
                            (EXIT
                             (|FLOAT;padFromRight| (STRCONC |s| ".0") $))))
                      #4# (EXIT #4#)))
                    (#5#
                     (SEQ (LETT |g| (|FLOAT;convert10| |f| |d| $) . #6#)
                          (LETT |m| (QCAR |g|) . #6#)
                          (LETT |e| (QCDR |g|) . #6#)
                          (LETT |s| (STRINGIMAGE |m|) . #6#)
                          (LETT |n| (QCSIZE |s|) . #6#)
                          (LETT |o| (+ |n| |e|) . #6#)
                          (EXIT
                           (COND
                            ((SPADCALL |o| 0 (QREFELT $ 68))
                             (COND
                              ((SPADCALL |o| (MAX |n| |d|) (QREFELT $ 102))
                               (SEQ
                                (COND
                                 ((SPADCALL |o| |n| (QREFELT $ 68))
                                  (LETT |s|
                                        (STRCONC |s|
                                                 (|make_full_CVEC|
                                                  (PROG1
                                                      (LETT #3# (- |o| |n|)
                                                            . #6#)
                                                    (|check_subtype| (>= #3# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #3#))
                                                  (|STR_to_CHAR| #7="0")))
                                        . #6#)))
                                (LETT |t|
                                      (SPADCALL
                                       (SPADCALL |s|
                                                 (SPADCALL
                                                  (+ |o|
                                                     (SPADCALL |s|
                                                               (QREFELT $
                                                                        148)))
                                                  (-
                                                   (+ |n|
                                                      (SPADCALL |s|
                                                                (QREFELT $
                                                                         148)))
                                                   1)
                                                  (QREFELT $ 155))
                                                 (QREFELT $ 156))
                                       (|STR_to_CHAR| #7#) (QREFELT $ 157))
                                      . #6#)
                                (COND ((EQUAL |t| "") (LETT |t| "0" . #6#))
                                      (#5#
                                       (LETT |t| (|FLOAT;padFromLeft| |t| $)
                                             . #6#)))
                                (LETT |s|
                                      (|FLOAT;padFromRight|
                                       (SPADCALL |s|
                                                 (SPADCALL
                                                  (SPADCALL |s|
                                                            (QREFELT $ 148))
                                                  (-
                                                   (+ |o|
                                                      (SPADCALL |s|
                                                                (QREFELT $
                                                                         148)))
                                                   1)
                                                  (QREFELT $ 155))
                                                 (QREFELT $ 156))
                                       $)
                                      . #6#)
                                (EXIT (STRCONC |s| (STRCONC "." |t|)))))
                              ((SPADCALL |o| 0 (QREFELT $ 102))
                               (COND
                                ((>= |o| -5)
                                 (STRCONC #8="0."
                                          (|FLOAT;padFromLeft|
                                           (STRCONC
                                            (|make_full_CVEC|
                                             (PROG1 (LETT #2# (- |o|) . #6#)
                                               (|check_subtype| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                #2#))
                                             (|STR_to_CHAR| #7#))
                                            (SPADCALL |s| (|STR_to_CHAR| #7#)
                                                      (QREFELT $ 157)))
                                           $)))
                                (#5#
                                 (SEQ
                                  (LETT |t|
                                        (|FLOAT;padFromLeft|
                                         (SPADCALL |s| (|STR_to_CHAR| #7#)
                                                   (QREFELT $ 157))
                                         $)
                                        . #6#)
                                  (LETT |s|
                                        (COND
                                         ((ZEROP
                                           (SPADCALL (QREFELT $ 140)
                                                     (QREFELT $ 147)))
                                          #9="E")
                                         (#5# #10=" E "))
                                        . #6#)
                                  (EXIT
                                   (SPADCALL
                                    (LIST #11="0." |t| |s|
                                          (STRINGIMAGE (+ |e| |n|)))
                                    (QREFELT $ 159)))))))
                              (#5#
                               (SEQ
                                (LETT |t|
                                      (|FLOAT;padFromLeft|
                                       (SPADCALL |s| (|STR_to_CHAR| #7#)
                                                 (QREFELT $ 157))
                                       $)
                                      . #6#)
                                (LETT |s|
                                      (COND
                                       ((ZEROP
                                         (SPADCALL (QREFELT $ 140)
                                                   (QREFELT $ 147)))
                                        #9#)
                                       (#5# #10#))
                                      . #6#)
                                (EXIT
                                 (SPADCALL
                                  (LIST #11# |t| |s| (STRINGIMAGE (+ |e| |n|)))
                                  (QREFELT $ 159)))))))
                            ((SPADCALL |o| 0 (QREFELT $ 102))
                             (COND
                              ((>= |o| -5)
                               (STRCONC #8#
                                        (|FLOAT;padFromLeft|
                                         (STRCONC
                                          (|make_full_CVEC|
                                           (PROG1 (LETT #1# (- |o|) . #6#)
                                             (|check_subtype| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              #1#))
                                           (|STR_to_CHAR| #7#))
                                          (SPADCALL |s| (|STR_to_CHAR| #7#)
                                                    (QREFELT $ 157)))
                                         $)))
                              (#5#
                               (SEQ
                                (LETT |t|
                                      (|FLOAT;padFromLeft|
                                       (SPADCALL |s| (|STR_to_CHAR| #7#)
                                                 (QREFELT $ 157))
                                       $)
                                      . #6#)
                                (LETT |s|
                                      (COND
                                       ((ZEROP
                                         (SPADCALL (QREFELT $ 140)
                                                   (QREFELT $ 147)))
                                        #9#)
                                       (#5# #10#))
                                      . #6#)
                                (EXIT
                                 (SPADCALL
                                  (LIST #11# |t| |s| (STRINGIMAGE (+ |e| |n|)))
                                  (QREFELT $ 159)))))))
                            (#5#
                             (SEQ
                              (LETT |t|
                                    (|FLOAT;padFromLeft|
                                     (SPADCALL |s| (|STR_to_CHAR| #7#)
                                               (QREFELT $ 157))
                                     $)
                                    . #6#)
                              (LETT |s|
                                    (COND
                                     ((ZEROP
                                       (SPADCALL (QREFELT $ 140)
                                                 (QREFELT $ 147)))
                                      #9#)
                                     (#5# #10#))
                                    . #6#)
                              (EXIT
                               (SPADCALL
                                (LIST #11# |t| |s| (STRINGIMAGE (+ |e| |n|)))
                                (QREFELT $ 159))))))))))))))))) 

(SDEFUN |FLOAT;outputSpacing;NniV;108| ((|n| |NonNegativeInteger|) ($ |Void|))
        (SPADCALL (QREFELT $ 140) |n| (QREFELT $ 160))) 

(SDEFUN |FLOAT;outputFixed;V;109| (($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 143) "fixed" (QREFELT $ 162))
             (EXIT (SPADCALL (QREFELT $ 146) -1 (QREFELT $ 163))))) 

(SDEFUN |FLOAT;outputFixed;NniV;110| ((|n| |NonNegativeInteger|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 143) "fixed" (QREFELT $ 162))
             (EXIT (SPADCALL (QREFELT $ 146) |n| (QREFELT $ 163))))) 

(SDEFUN |FLOAT;outputGeneral;V;111| (($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 143) "general" (QREFELT $ 162))
             (EXIT (SPADCALL (QREFELT $ 146) -1 (QREFELT $ 163))))) 

(SDEFUN |FLOAT;outputGeneral;NniV;112| ((|n| |NonNegativeInteger|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 143) "general" (QREFELT $ 162))
             (EXIT (SPADCALL (QREFELT $ 146) |n| (QREFELT $ 163))))) 

(SDEFUN |FLOAT;outputFloating;V;113| (($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 143) "floating" (QREFELT $ 162))
             (EXIT (SPADCALL (QREFELT $ 146) -1 (QREFELT $ 163))))) 

(SDEFUN |FLOAT;outputFloating;NniV;114| ((|n| |NonNegativeInteger|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 143) "floating" (QREFELT $ 162))
             (EXIT (SPADCALL (QREFELT $ 146) |n| (QREFELT $ 163))))) 

(SDEFUN |FLOAT;convert;$S;115| ((|f| $) ($ |String|))
        (SPROG
         ((#1=#:G683 NIL) (|s| (|String|)) (|b| (|Integer|)) (#2=#:G678 NIL))
         (SEQ
          (LETT |b|
                (SEQ
                 (COND
                  ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1)
                   (COND
                    ((NULL (SPADCALL |f| (QREFELT $ 33)))
                     (EXIT
                      (SPADCALL
                       (PROG1
                           (LETT #2#
                                 (INTEGER-LENGTH
                                  (ABS (SPADCALL |f| (QREFELT $ 17))))
                                 . #3=(|FLOAT;convert;$S;115|))
                         (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
                       (QREFELT $ 67)))))))
                 (EXIT 0))
                . #3#)
          (LETT |s|
                (COND
                 ((EQUAL (SPADCALL (QREFELT $ 143) (QREFELT $ 170)) "fixed")
                  (|FLOAT;fixed| |f| $))
                 ((EQUAL (SPADCALL (QREFELT $ 143) (QREFELT $ 170)) "floating")
                  (|FLOAT;floating| |f| $))
                 ((EQUAL (SPADCALL (QREFELT $ 143) (QREFELT $ 170)) "general")
                  (|FLOAT;general| |f| $))
                 (#4='T (|make_full_CVEC| 0)))
                . #3#)
          (COND
           ((SPADCALL |b| 0 (QREFELT $ 68))
            (SPADCALL
             (PROG1 (LETT #1# |b| . #3#)
               (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
             (QREFELT $ 67))))
          (EXIT
           (COND ((EQUAL |s| (|make_full_CVEC| 0)) (|error| "bad output mode"))
                 (#4# |s|)))))) 

(SDEFUN |FLOAT;coerce;$Of;116| ((|f| $) ($ |OutputForm|))
        (COND
         ((SPADCALL |f| (|spadConstant| $ 34) (QREFELT $ 172))
          (SPADCALL (SPADCALL |f| (QREFELT $ 171)) (QREFELT $ 174)))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 36)) (QREFELT $ 175))
                    (QREFELT $ 176))))) 

(SDEFUN |FLOAT;convert;$If;117| ((|f| $) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|float| (QREFELT $ 179))
               (SPADCALL (SPADCALL |f| (QREFELT $ 17)) (QREFELT $ 180))
               (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 180))
               (SPADCALL (SPADCALL (QREFELT $ 114)) (QREFELT $ 180)))
         (QREFELT $ 181))) 

(PUT '|FLOAT;convert;2$;118| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |FLOAT;convert;2$;118| ((|x| $) ($ |Float|)) |x|) 

(SDEFUN |FLOAT;convert;$Df;119| ((|x| $) ($ |DoubleFloat|))
        (|makeSF| (QCAR |x|) (QCDR |x|))) 

(SDEFUN |FLOAT;coerce;$Df;120| ((|x| $) ($ |DoubleFloat|))
        (SPADCALL |x| (QREFELT $ 186))) 

(SDEFUN |FLOAT;convert;Df$;121| ((|sf| |DoubleFloat|) ($ $))
        (SPADCALL (SPADCALL |sf| (QREFELT $ 188))
                  (SPADCALL |sf| (QREFELT $ 189)) (FLOAT-RADIX 0.0)
                  (QREFELT $ 119))) 

(SDEFUN |FLOAT;retract;$F;122| ((|f| $) ($ |Fraction| (|Integer|)))
        (SPROG ((#1=#:G694 NIL))
               (SPADCALL |f|
                         (PROG1
                             (LETT #1# (- (SPADCALL (QREFELT $ 55)) 1)
                                   |FLOAT;retract;$F;122|)
                           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                            #1#))
                         2 (QREFELT $ 191)))) 

(SDEFUN |FLOAT;retractIfCan;$U;123|
        ((|f| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((#1=#:G700 NIL))
               (CONS 0
                     (SPADCALL |f|
                               (PROG1
                                   (LETT #1# (- (SPADCALL (QREFELT $ 55)) 1)
                                         |FLOAT;retractIfCan;$U;123|)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               2 (QREFELT $ 191))))) 

(SDEFUN |FLOAT;retract;$I;124| ((|f| $) ($ |Integer|))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |f| (QREFELT $ 56)) |FLOAT;retract;$I;124|)
                (EXIT
                 (COND
                  ((SPADCALL |f| (SPADCALL |n| (QREFELT $ 195)) (QREFELT $ 39))
                   |n|)
                  ('T (|error| "Not an integer"))))))) 

(SDEFUN |FLOAT;retractIfCan;$U;125| ((|f| $) ($ |Union| (|Integer|) "failed"))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |f| (QREFELT $ 56))
                      |FLOAT;retractIfCan;$U;125|)
                (EXIT
                 (COND
                  ((SPADCALL |f| (SPADCALL |n| (QREFELT $ 195)) (QREFELT $ 39))
                   (CONS 0 |n|))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |FLOAT;rationalApproximation;$NniF;126|
        ((|f| $) (|d| |NonNegativeInteger|) ($ |Fraction| (|Integer|)))
        (SPADCALL |f| |d| 10 (QREFELT $ 191))) 

(SDEFUN |FLOAT;rationalApproximation;$2NniF;127|
        ((|f| $) (|d| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Fraction| (|Integer|)))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|#G227| #3=(|Integer|))
          (|#G226| #1#) (|q1| #4=(|Integer|)) (|q0| #4#)
          (|#G225| #5=(|Integer|)) (|#G224| #4#) (|p1| #4#) (|p0| #4#)
          (|#G223| #5#) (|#G222| #4#) (#6=#:G728 NIL) (|q2| #5#) (|p2| #5#)
          (|r| #3#) (|q| #7=(|Integer|))
          (|#G221| (|Record| (|:| |quotient| #7#) (|:| |remainder| #3#)))
          (|tol| (|NonNegativeInteger|)) (|de| (|PositiveInteger|))
          (#8=#:G721 NIL) (#9=#:G719 NIL) (|ex| (|Integer|)) (|nu| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |nu| (QCAR |f|)
                  . #10=(|FLOAT;rationalApproximation;$2NniF;127|))
            (LETT |ex| (QCDR |f|) . #10#)
            (COND
             ((>= |ex| 0)
              (PROGN
               (LETT #6#
                     (SPADCALL
                      (* |nu|
                         (EXPT 2
                               (PROG1 (LETT #9# |ex| . #10#)
                                 (|check_subtype| (>= #9# 0)
                                                  '(|NonNegativeInteger|)
                                                  #9#))))
                      1 (QREFELT $ 200))
                     . #10#)
               (GO #6#))))
            (LETT |de|
                  (EXPT 2
                        (PROG1 (LETT #8# (- |ex|) . #10#)
                          (|check_subtype| (>= #8# 0) '(|NonNegativeInteger|)
                                           #8#)))
                  . #10#)
            (COND ((< |b| 2) (|error| "base must be > 1")))
            (LETT |tol| (EXPT |b| |d|) . #10#) (LETT |s| |nu| . #10#)
            (LETT |t| |de| . #10#) (LETT |p0| 0 . #10#) (LETT |p1| 1 . #10#)
            (LETT |q0| 1 . #10#) (LETT |q1| 0 . #10#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (PROGN
                    (LETT |#G221| (DIVIDE2 |s| |t|) . #10#)
                    (LETT |q| (QCAR |#G221|) . #10#)
                    (LETT |r| (QCDR |#G221|) . #10#)
                    |#G221|)
                   (LETT |p2| (+ (* |q| |p1|) |p0|) . #10#)
                   (LETT |q2| (+ (* |q| |q1|) |q0|) . #10#)
                   (COND
                    ((OR (EQL |r| 0)
                         (<
                          (SPADCALL |tol|
                                    (ABS
                                     (- (* |nu| |q2|)
                                        (SPADCALL |de| |p2| (QREFELT $ 60))))
                                    (QREFELT $ 79))
                          (SPADCALL |de| (ABS |p2|) (QREFELT $ 60))))
                     (PROGN
                      (LETT #6# (SPADCALL |p2| |q2| (QREFELT $ 200)) . #10#)
                      (GO #6#))))
                   (PROGN
                    (LETT |#G222| |p1| . #10#)
                    (LETT |#G223| |p2| . #10#)
                    (LETT |p0| |#G222| . #10#)
                    (LETT |p1| |#G223| . #10#))
                   (PROGN
                    (LETT |#G224| |q1| . #10#)
                    (LETT |#G225| |q2| . #10#)
                    (LETT |q0| |#G224| . #10#)
                    (LETT |q1| |#G225| . #10#))
                   (EXIT
                    (PROGN
                     (LETT |#G226| |t| . #10#)
                     (LETT |#G227| |r| . #10#)
                     (LETT |s| |#G226| . #10#)
                     (LETT |t| |#G227| . #10#))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #6#)))) 

(DECLAIM (NOTINLINE |Float;|)) 

(DEFUN |Float| ()
  (SPROG NIL
         (PROG (#1=#:G742)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Float|) . #2=(|Float|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Float|
                             (LIST (CONS NIL (CONS 1 (|Float;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Float|)))))))))) 

(DEFUN |Float;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Float|) . #1=(|Float|))
          (LETT $ (GETREFV 215) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Float| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|arbitraryPrecision|))
               (|augmentPredVector| $ 1))
          (AND (|not| (|HasCategory| $ '(|arbitraryExponent|)))
               (|not| (|HasCategory| $ '(|arbitraryPrecision|)))
               (|augmentPredVector| $ 2))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (SPADCALL 68 (QREFELT $ 8)))
          (QSETREFV $ 10
                    (|Record| (|:| |mantissa| (|Integer|))
                              (|:| |exponent| (|Integer|))))
          (QSETREFV $ 74 (CONS 1 (CONS 1 2)))
          (QSETREFV $ 92 (CONS 1 (|spadConstant| $ 38)))
          (QSETREFV $ 94 (CONS 1 (CONS 1 1)))
          (QSETREFV $ 105 (CONS 1 (CONS 1 1)))
          (QSETREFV $ 140 (SPADCALL 10 (QREFELT $ 139)))
          (QSETREFV $ 143 (SPADCALL "general" (QREFELT $ 142)))
          (QSETREFV $ 146 (SPADCALL -1 (QREFELT $ 145)))
          $))) 

(MAKEPROP '|Float| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|PositiveInteger|) (|Reference| 6)
              (0 . |ref|) 'BITS '|Rep| (|Void|) (|OpenMathDevice|)
              (5 . |OMputApp|) (|String|) (10 . |OMputSymbol|) (|Integer|)
              |FLOAT;mantissa;$I;53| (17 . |OMputInteger|)
              |FLOAT;exponent;$I;54| (23 . |OMputEndApp|) (|OpenMathEncoding|)
              (28 . |OMencodingXML|) (32 . |OMopenString|) (38 . |OMputObject|)
              (43 . |OMputEndObject|) (48 . |OMclose|) |FLOAT;OMwrite;$S;2|
              (|Boolean|) |FLOAT;OMwrite;$BS;3| |FLOAT;OMwrite;Omd$V;4|
              |FLOAT;OMwrite;Omd$BV;5| (53 . |sign|) |FLOAT;zero?;$B;56|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FLOAT;Zero;$;50|) $))
              |FLOAT;negative?;$B;57| |FLOAT;-;2$;75| |FLOAT;asin;2$;7|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FLOAT;One;$;51|) $))
              |FLOAT;=;2$B;64| |FLOAT;pi;$;18| |FLOAT;/;$I$;84| (58 . >)
              |FLOAT;increasePrecision;IPi;43| |FLOAT;sqrt;2$;38|
              |FLOAT;/;3$;83| |FLOAT;atan;2$;10|
              |FLOAT;decreasePrecision;IPi;44| |FLOAT;normalize;2$;62|
              |FLOAT;acos;2$;8| |FLOAT;-;3$;78| |FLOAT;<;2$B;65|
              |FLOAT;abs;2$;66| |FLOAT;atan;3$;9| (64 . |fractionPart|)
              |FLOAT;bits;Pi;39| |FLOAT;wholePart;$I;68| (|IntegerRoots| 16)
              (69 . |approxSqrt|) |FLOAT;order;$I;48| (74 . *) |FLOAT;*;3$;81|
              |FLOAT;+;3$;77| |FLOAT;shift;$I$;63| (80 . ~=) |FLOAT;sign;$I;71|
              (86 . *) |FLOAT;bits;2Pi;40| (92 . >) (98 . ^) |FLOAT;*;I2$;82|
              |FLOAT;sin;2$;13| |FLOAT;cos;2$;15| |FLOAT;tan;2$;17| 'P
              |FLOAT;precision;Pi;41| (104 . <=) (110 . ^)
              (|NonNegativeInteger|) (116 . *) (122 . *) (128 . ^)
              |FLOAT;exp;2$;32| |FLOAT;sinh;2$;20| |FLOAT;cosh;2$;21|
              |FLOAT;tanh;2$;22| |FLOAT;log;2$;26| |FLOAT;asinh;2$;23|
              |FLOAT;acosh;2$;24| |FLOAT;atanh;2$;25| |FLOAT;log2;$;28|
              |FLOAT;^;$I$;93| 'L2 (134 . <=) 'L10 |FLOAT;log10;$;29|
              |FLOAT;log2;2$;30| |FLOAT;log10;2$;31| |FLOAT;exp1;$;37|
              (|List| (|List| 16)) (|Matrix| 16) (140 . |matrix|) (145 . <=)
              (151 . |elt|) (158 . *) 'E (164 . >) (170 . |elt|)
              (175 . |setelt|) |FLOAT;precision;2Pi;42| (181 . |max|)
              |FLOAT;digits;Pi;46| |FLOAT;digits;2Pi;47|
              |FLOAT;relerror;2$I;49| |FLOAT;base;Pi;52| |FLOAT;one?;$B;55|
              (185 . |positive?|) |FLOAT;positive?;$B;58| |FLOAT;float;2I$;60|
              |FLOAT;float;2IPi$;61| |FLOAT;floor;2$;69| |FLOAT;truncate;2$;72|
              |FLOAT;ceiling;2$;67| |FLOAT;round;2$;70| (|Union| $ '"failed")
              |FLOAT;recip;$U;73| |FLOAT;differentiate;2$;74| |FLOAT;inv;2$;85|
              |FLOAT;^;3$;91| (|Fraction| 16) (190 . |Zero|) (194 . =)
              (200 . <) (206 . >) (212 . |One|) (216 . |numer|) (221 . |denom|)
              |FLOAT;^;$F$;92| (|Reference| 78) (226 . |ref|) 'SPACING
              (|Reference| 14) (231 . |ref|) 'OUTMODE (|Reference| 16)
              (236 . |ref|) 'OUTPREC (241 . |elt|) (246 . |minIndex|)
              (|Character|) (251 . |elt|) (257 . |setelt|) (264 . |maxIndex|)
              (269 . |elt|) (|UniversalSegment| 16) (274 . SEGMENT)
              (280 . |elt|) (286 . |rightTrim|) (|List| $) (292 . |concat|)
              (297 . |setelt|) |FLOAT;outputSpacing;NniV;108| (303 . |setelt|)
              (309 . |setelt|) |FLOAT;outputFixed;V;109|
              |FLOAT;outputFixed;NniV;110| |FLOAT;outputGeneral;V;111|
              |FLOAT;outputGeneral;NniV;112| |FLOAT;outputFloating;V;113|
              |FLOAT;outputFloating;NniV;114| (315 . |elt|)
              |FLOAT;convert;$S;115| (320 . >=) (|OutputForm|)
              (326 . |message|) |FLOAT;coerce;$Of;116| (331 . -) (|Symbol|)
              (|InputForm|) (336 . |convert|) (341 . |convert|)
              (346 . |convert|) |FLOAT;convert;$If;117| (|Float|)
              |FLOAT;convert;2$;118| (|DoubleFloat|) |FLOAT;convert;$Df;119|
              |FLOAT;coerce;$Df;120| (351 . |mantissa|) (356 . |exponent|)
              |FLOAT;convert;Df$;121| |FLOAT;rationalApproximation;$2NniF;127|
              |FLOAT;retract;$F;122| (|Union| 129 '"failed")
              |FLOAT;retractIfCan;$U;123| (361 . |coerce|)
              |FLOAT;retract;$I;124| (|Union| 16 '"failed")
              |FLOAT;retractIfCan;$U;125|
              |FLOAT;rationalApproximation;$NniF;126| (366 . /)
              (|PatternMatchResult| 183 $) (|Pattern| 183) (|Factored| $)
              (|Union| 158 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 206 '#1#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |coef| 158) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|SingleInteger|) (|HashState|))
           '#(~= 372 |zero?| 378 |wholePart| 383 |unitNormal| 388
              |unitCanonical| 393 |unit?| 398 |truncate| 403 |toString| 408
              |tanh| 414 |tan| 419 |subtractIfCan| 424 |squareFreePart| 430
              |squareFree| 435 |sqrt| 440 |smaller?| 445 |sizeLess?| 451 |sinh|
              457 |sin| 462 |sign| 467 |shift| 472 |sech| 478 |sec| 483
              |sample| 488 |round| 492 |retractIfCan| 497 |retract| 507 |rem|
              517 |relerror| 523 |recip| 529 |rationalApproximation| 534 |quo|
              547 |principalIdeal| 553 |prime?| 558 |precision| 563 |positive?|
              572 |pi| 577 |patternMatch| 581 |outputSpacing| 588
              |outputGeneral| 593 |outputFloating| 602 |outputFixed| 611
              |order| 620 |opposite?| 625 |one?| 631 |nthRoot| 636 |normalize|
              642 |norm| 647 |negative?| 652 |multiEuclidean| 657 |min| 663
              |max| 673 |mantissa| 683 |log2| 688 |log10| 697 |log| 706
              |lcmCoef| 711 |lcm| 717 |latex| 728 |inv| 733 |increasePrecision|
              738 |hashUpdate!| 743 |hash| 749 |gcdPolynomial| 754 |gcd| 760
              |fractionPart| 771 |floor| 776 |float| 781 |factor| 794
              |extendedEuclidean| 799 |exquo| 812 |expressIdealMember| 818
              |exponent| 824 |exp1| 829 |exp| 833 |euclideanSize| 838 |divide|
              843 |digits| 849 |differentiate| 858 |decreasePrecision| 869
              |csch| 874 |csc| 879 |coth| 884 |cot| 889 |cosh| 894 |cos| 899
              |convert| 904 |coerce| 934 |characteristic| 969 |ceiling| 973
              |bits| 978 |base| 987 |atanh| 991 |atan| 996 |associates?| 1007
              |asinh| 1013 |asin| 1018 |asech| 1023 |asec| 1028 |annihilate?|
              1033 |acsch| 1039 |acsc| 1044 |acoth| 1049 |acot| 1054 |acosh|
              1059 |acos| 1064 |abs| 1069 ^ 1074 |Zero| 1104 |One| 1108
              |OMwrite| 1112 D 1136 >= 1147 > 1153 = 1159 <= 1165 < 1171 / 1177
              - 1189 + 1200 * 1206)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0))
            (CONS
             '#(|FloatingPointSystem&| |RealNumberSystem&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL |OrderedRing&| |Algebra&| NIL
                |Algebra&| |DifferentialRing&| NIL |Module&| NIL |EntireRing&|
                |Module&| NIL NIL NIL |Ring&| NIL NIL NIL NIL |Rng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&|
                |TranscendentalFunctionCategory&| NIL |SetCategory&| NIL NIL
                NIL |ElementaryFunctionCategory&| NIL
                |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL NIL NIL NIL
                |RadicalCategory&| |RetractableTo&| |RetractableTo&| NIL NIL
                |PartialOrder&| NIL NIL NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FloatingPointSystem|) (|RealNumberSystem|) (|Field|)
                 (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|OrderedRing|) (|Algebra| 129)
                 (|LeftOreRing|) (|Algebra| $$) (|DifferentialRing|)
                 (|CharacteristicZero|) (|Module| 129) (|CommutativeRing|)
                 (|EntireRing|) (|Module| $$) (|OrderedAbelianGroup|)
                 (|BiModule| 129 129) (|BiModule| $$ $$) (|Ring|)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 129)
                 (|LeftModule| 129) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|PatternMatchable| 183) (|Comparable|)
                 (|SemiGroup|) (|AbelianSemiGroup|)
                 (|TranscendentalFunctionCategory|) (|RealConstant|)
                 (|SetCategory|) (|arbitraryExponent|) (|arbitraryPrecision|)
                 (|ConvertibleTo| 178) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|CoercibleTo| 185)
                 (|OpenMath|) (|ConvertibleTo| 14) (|Approximate|)
                 (|ConvertibleTo| 202) (|RadicalCategory|)
                 (|RetractableTo| 129) (|RetractableTo| 16)
                 (|ConvertibleTo| 183) (|ConvertibleTo| 185) (|PartialOrder|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 173))
              (|makeByteWordVec2| 214
                                  '(1 7 0 6 8 1 12 11 0 13 3 12 11 0 14 14 15 2
                                    12 11 0 16 18 1 12 11 0 20 0 21 0 22 2 12 0
                                    14 21 23 1 12 11 0 24 1 12 11 0 25 1 12 11
                                    0 26 1 16 16 0 32 2 0 28 0 0 42 1 0 0 0 54
                                    1 57 16 16 58 2 16 0 6 0 60 2 16 28 0 0 64
                                    2 0 0 6 0 66 2 16 28 0 0 68 2 0 0 0 6 69 2
                                    6 28 0 0 76 2 6 0 0 6 77 2 16 0 78 0 79 2
                                    78 0 6 0 80 2 78 0 0 6 81 2 78 28 0 0 93 1
                                    100 0 99 101 2 16 28 0 0 102 3 100 16 0 16
                                    16 103 2 100 0 0 0 104 2 6 28 0 0 106 1 7 6
                                    0 107 2 7 6 0 6 108 0 0 0 110 1 16 28 0 116
                                    0 129 0 130 2 129 28 0 0 131 2 129 28 0 0
                                    132 2 129 28 0 0 133 0 129 0 134 1 129 16 0
                                    135 1 129 16 0 136 1 138 0 78 139 1 141 0
                                    14 142 1 144 0 16 145 1 138 78 0 147 1 14
                                    16 0 148 2 14 149 0 16 150 3 14 149 0 16
                                    149 151 1 14 16 0 152 1 144 16 0 153 2 154
                                    0 16 16 155 2 14 0 0 154 156 2 14 0 0 149
                                    157 1 14 0 158 159 2 138 78 0 78 160 2 141
                                    14 0 14 162 2 144 16 0 16 163 1 141 14 0
                                    170 2 0 28 0 0 172 1 173 0 14 174 1 173 0 0
                                    176 1 178 0 177 179 1 16 178 0 180 1 178 0
                                    158 181 1 185 16 0 188 1 185 16 0 189 1 0 0
                                    16 195 2 129 0 16 16 200 2 0 28 0 0 1 1 0
                                    28 0 33 1 0 16 0 56 1 0 212 0 1 1 0 0 0 1 1
                                    0 28 0 1 1 0 0 0 121 2 0 14 0 78 1 1 0 0 0
                                    85 1 0 0 0 73 2 0 124 0 0 1 1 0 0 0 1 1 0
                                    203 0 1 1 0 0 0 44 2 0 28 0 0 1 2 0 28 0 0
                                    1 1 0 0 0 83 1 0 0 0 71 1 0 16 0 65 2 0 0 0
                                    16 63 1 0 0 0 1 1 0 0 0 1 0 0 0 1 1 0 0 0
                                    123 1 0 193 0 194 1 0 197 0 198 1 0 129 0
                                    192 1 0 16 0 196 2 0 0 0 0 1 2 0 16 0 0 113
                                    1 0 124 0 125 3 0 129 0 78 78 191 2 0 129 0
                                    78 199 2 0 0 0 0 1 1 0 210 158 1 1 0 28 0 1
                                    1 1 6 6 109 0 0 6 75 1 0 28 0 117 0 0 0 40
                                    3 0 201 0 202 201 1 1 0 11 78 161 1 0 11 78
                                    167 0 0 11 166 0 0 11 168 1 0 11 78 169 0 0
                                    11 164 1 0 11 78 165 1 0 16 0 59 2 0 28 0 0
                                    1 1 0 28 0 115 2 0 0 0 16 1 1 0 0 0 48 1 0
                                    0 0 1 1 0 28 0 35 2 0 204 158 0 1 0 2 0 1 2
                                    0 0 0 0 1 0 2 0 110 2 0 0 0 0 1 1 0 16 0 17
                                    1 0 0 0 96 0 0 0 90 1 0 0 0 97 0 0 0 95 1 0
                                    0 0 86 2 0 211 0 0 1 2 0 0 0 0 1 1 0 0 158
                                    1 1 0 14 0 1 1 0 0 0 127 1 1 6 16 43 2 0
                                    214 214 0 1 1 0 213 0 1 2 0 209 209 209 1 1
                                    0 0 158 1 2 0 0 0 0 1 1 0 0 0 54 1 0 0 0
                                    120 2 0 0 16 16 118 3 0 0 16 16 6 119 1 0
                                    203 0 1 2 0 205 0 0 1 3 0 207 0 0 0 1 2 0
                                    124 0 0 1 2 0 204 158 0 1 1 0 16 0 19 0 0 0
                                    98 1 0 0 0 82 1 0 78 0 1 2 0 208 0 0 1 1 1
                                    6 6 112 0 0 6 111 1 0 0 0 126 2 0 0 0 78 1
                                    1 1 6 16 47 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 84 1 0 0 0 72 1 0 0 185 190
                                    1 0 178 0 182 1 0 14 0 171 1 0 202 0 1 1 0
                                    185 0 186 1 0 183 0 184 1 0 185 0 187 1 0 0
                                    129 1 1 0 0 16 195 1 0 0 129 1 1 0 0 0 1 1
                                    0 0 16 195 1 0 173 0 175 0 0 78 1 1 0 0 0
                                    122 1 1 6 6 67 0 0 6 55 0 0 6 114 1 0 0 0
                                    89 2 0 0 0 0 53 1 0 0 0 46 2 0 28 0 0 1 1 0
                                    0 0 87 1 0 0 0 37 1 0 0 0 1 1 0 0 0 1 2 0
                                    28 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 88 1 0 0 0 49 1 0 0 0 52 2 0
                                    0 0 0 128 2 0 0 0 129 137 2 0 0 0 16 91 2 0
                                    0 0 78 1 2 0 0 0 6 69 0 0 0 34 0 0 0 38 3 0
                                    11 12 0 28 31 2 0 14 0 28 29 2 0 11 12 0 30
                                    1 0 14 0 27 1 0 0 0 1 2 0 0 0 78 1 2 0 28 0
                                    0 172 2 0 28 0 0 42 2 0 28 0 0 39 2 0 28 0
                                    0 1 2 0 28 0 0 51 2 0 0 0 16 41 2 0 0 0 0
                                    45 1 0 0 0 36 2 0 0 0 0 50 2 0 0 0 0 62 2 0
                                    0 129 0 1 2 0 0 0 129 1 2 0 0 16 0 70 2 0 0
                                    0 0 61 2 0 0 78 0 1 2 0 0 6 0 66)))))
           '|lookupComplete|)) 

(MAKEPROP '|Float| 'NILADIC T) 
