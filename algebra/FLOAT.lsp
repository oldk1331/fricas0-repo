
(SDEFUN |FLOAT;writeOMFloat|
        ((|dev| (|OpenMathDevice|)) (|x| (%)) (% (|Void|)))
        (SEQ (SPADCALL |dev| (QREFELT % 10))
             (SPADCALL |dev| "bigfloat1" "bigfloat" (QREFELT % 12))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT % 14)) (QREFELT % 15))
             (SPADCALL |dev| 2 (QREFELT % 15))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT % 16)) (QREFELT % 15))
             (EXIT (SPADCALL |dev| (QREFELT % 17))))) 

(SDEFUN |FLOAT;OMwrite;Omd%BV;2|
        ((|dev| (|OpenMathDevice|)) (|x| (%)) (|wholeObj| (|Boolean|))
         (% (|Void|)))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 18))))
             (|FLOAT;writeOMFloat| |dev| |x| %)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 19))))))) 

(SDEFUN |FLOAT;shift2| ((|x| (|Integer|)) (|y| (|Integer|)) (% (|Integer|)))
        (* (SPADCALL |x| (QREFELT % 22))
           (ASH (* (SPADCALL |x| (QREFELT % 22)) |x|) |y|))) 

(SDEFUN |FLOAT;asin;2%;4| ((|x| (%)) (% (%)))
        (SPROG ((|r| (%)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 23)) (|spadConstant| % 24))
                      ((SPADCALL |x| (QREFELT % 25))
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 27))
                        (QREFELT % 26)))
                      ((SPADCALL |x| (|spadConstant| % 28) (QREFELT % 29))
                       (SPADCALL (SPADCALL (QREFELT % 30)) 2 (QREFELT % 31)))
                      ((SPADCALL |x| (|spadConstant| % 28) (QREFELT % 32))
                       (|error|
                        (SPADCALL
                         (LIST "asin: argument > 1 in magnitude" ": "
                               (SPADCALL |x| (QREFELT % 33)))
                         (QREFELT % 35))))
                      ('T
                       (SEQ (SPADCALL 5 (QREFELT % 37))
                            (LETT |r|
                                  (SPADCALL
                                   (SPADCALL |x|
                                             (SPADCALL
                                              (|FLOAT;sub|
                                               (|spadConstant| % 28)
                                               (|FLOAT;times| |x| |x| %) %)
                                              (QREFELT % 38))
                                             (QREFELT % 39))
                                   (QREFELT % 40)))
                            (SPADCALL 5 (QREFELT % 41))
                            (EXIT (SPADCALL |r| (QREFELT % 42))))))))) 

(SDEFUN |FLOAT;acos;2%;5| ((|x| (%)) (% (%)))
        (SPROG ((|r| (%)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT % 23))
                  (SPADCALL (SPADCALL (QREFELT % 30)) 2 (QREFELT % 31)))
                 ((SPADCALL |x| (QREFELT % 25))
                  (SEQ (SPADCALL 3 (QREFELT % 37))
                       (LETT |r|
                             (SPADCALL (SPADCALL (QREFELT % 30))
                                       (SPADCALL (SPADCALL |x| (QREFELT % 26))
                                                 (QREFELT % 43))
                                       (QREFELT % 44)))
                       (SPADCALL 3 (QREFELT % 41))
                       (EXIT (SPADCALL |r| (QREFELT % 42)))))
                 ((SPADCALL |x| (|spadConstant| % 28) (QREFELT % 29))
                  (|spadConstant| % 24))
                 ((SPADCALL |x| (|spadConstant| % 28) (QREFELT % 32))
                  (|error|
                   (SPADCALL
                    (LIST "acos: argument > 1 in magnitude" ": "
                          (SPADCALL |x| (QREFELT % 33)))
                    (QREFELT % 35))))
                 ('T
                  (SEQ (SPADCALL 5 (QREFELT % 37))
                       (LETT |r|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (|FLOAT;sub| (|spadConstant| % 28)
                                 (|FLOAT;times| |x| |x| %) %)
                                (QREFELT % 38))
                               |x| (QREFELT % 39))
                              (QREFELT % 40)))
                       (SPADCALL 5 (QREFELT % 41))
                       (EXIT (SPADCALL |r| (QREFELT % 42))))))))) 

(SDEFUN |FLOAT;atan;3%;6| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|theta| (%)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| % 24) (QREFELT % 29))
                  (COND
                   ((SPADCALL |y| (|spadConstant| % 24) (QREFELT % 32))
                    (SPADCALL (SPADCALL (QREFELT % 30)) 2 (QREFELT % 31)))
                   ((SPADCALL |y| (|spadConstant| % 24) (QREFELT % 45))
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT % 30)) 2 (QREFELT % 31))
                     (QREFELT % 26)))
                   (#1='T (|spadConstant| % 24))))
                 (#1#
                  (SEQ
                   (LETT |theta|
                         (SPADCALL
                          (SPADCALL (SPADCALL |y| |x| (QREFELT % 39))
                                    (QREFELT % 46))
                          (QREFELT % 40)))
                   (COND
                    ((SPADCALL |x| (|spadConstant| % 24) (QREFELT % 45))
                     (LETT |theta|
                           (SPADCALL (SPADCALL (QREFELT % 30)) |theta|
                                     (QREFELT % 44)))))
                   (COND
                    ((SPADCALL |y| (|spadConstant| % 24) (QREFELT % 45))
                     (LETT |theta| (SPADCALL |theta| (QREFELT % 26)))))
                   (EXIT |theta|))))))) 

(SDEFUN |FLOAT;atan;2%;7| ((|x| (%)) (% (%)))
        (SPROG
         ((|t| (%)) (#1=#:G93 NIL) (|i| NIL) (|k| (|Integer|)) (#2=#:G92 NIL)
          (|r| (%)))
         (SEQ
          (EXIT
           (COND ((SPADCALL |x| (QREFELT % 23)) (|spadConstant| % 24))
                 ((SPADCALL |x| (QREFELT % 25))
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 40))
                   (QREFELT % 26)))
                 (#3='T
                  (SEQ
                   (COND
                    ((SPADCALL |x| (|spadConstant| % 28) (QREFELT % 32))
                     (SEQ (SPADCALL 4 (QREFELT % 37))
                          (LETT |r|
                                (COND
                                 ((SPADCALL (SPADCALL |x| (QREFELT % 48))
                                            (QREFELT % 23))
                                  (COND
                                   ((SPADCALL |x|
                                              (CONS (SPADCALL (QREFELT % 49))
                                                    0)
                                              (QREFELT % 45))
                                    (|FLOAT;atanInverse|
                                     (SPADCALL |x| (QREFELT % 50)) %))
                                   (#3#
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| % 28) |x|
                                               (QREFELT % 39))
                                     (QREFELT % 40)))))
                                 (#3#
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 28) |x|
                                             (QREFELT % 39))
                                   (QREFELT % 40)))))
                          (LETT |r|
                                (SPADCALL
                                 (SPADCALL (SPADCALL (QREFELT % 30)) 2
                                           (QREFELT % 31))
                                 |r| (QREFELT % 44)))
                          (SPADCALL 4 (QREFELT % 41))
                          (EXIT
                           (PROGN
                            (LETT #2# (SPADCALL |r| (QREFELT % 42)))
                            (GO #4=#:G91))))))
                   (LETT |k|
                         (|quotient_INT|
                          (SPADCALL (- (SPADCALL (QREFELT % 49)) 100)
                                    (QREFELT % 52))
                          5))
                   (LETT |k|
                         (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT % 53)))))
                   (SPADCALL (* 2 |k|) (QREFELT % 37))
                   (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |x|
                                (SPADCALL |x|
                                          (SPADCALL (|spadConstant| % 28)
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (|spadConstant| % 28)
                                                      (SPADCALL |x| |x|
                                                                (QREFELT % 54))
                                                      (QREFELT % 55))
                                                     (QREFELT % 38))
                                                    (QREFELT % 55))
                                          (QREFELT % 39)))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                   (LETT |t| (|FLOAT;atanSeries| |x| %))
                   (SPADCALL (* 2 |k|) (QREFELT % 41))
                   (LETT |t| (SPADCALL |t| |k| (QREFELT % 56)))
                   (EXIT (SPADCALL |t| (QREFELT % 42)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |FLOAT;atanSeries| ((|x| (%)) (% (%)))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|i| NIL) (|m| #1#)
          (|y| (%)) (|d| #2#) (|p| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT % 49))
                    (INTEGER-LENGTH (SPADCALL (QREFELT % 49))))
                 2))
          (LETT |s| (LETT |d| (ASH 1 |p|)))
          (LETT |y| (|FLOAT;times| |x| |x| %))
          (LETT |t|
                (LETT |m|
                      (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) %))))
          (SEQ (LETT |i| 3) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT % 57))) (GO G191)))
               (SEQ (LETT |s| (+ |s| (|quotient_INT| |t| |i|)))
                    (EXIT (LETT |t| (|quotient_INT| (* |m| |t|) |d|))))
               (LETT |i| (|add_SI| |i| 2)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| (CONS |s| (- |p|)) (QREFELT % 54)))))) 

(SDEFUN |FLOAT;atanInverse| ((|n| (|Integer|)) (% (%)))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #1#) (|k| NIL) (|e| (|Integer|))
          (|n2| (|Integer|)))
         (SEQ (LETT |n2| (- (* |n| |n|)))
              (LETT |e|
                    (+
                     (+
                      (+ (SPADCALL (QREFELT % 49))
                         (INTEGER-LENGTH (SPADCALL (QREFELT % 49))))
                      (INTEGER-LENGTH |n|))
                     1))
              (LETT |s| (|quotient_INT| (ASH 1 |e|) |n|))
              (LETT |t| (|quotient_INT| |s| |n2|))
              (SEQ (LETT |k| 3) G190
                   (COND ((NULL (SPADCALL |t| 0 (QREFELT % 57))) (GO G191)))
                   (SEQ (LETT |s| (+ |s| (|quotient_INT| |t| |k|)))
                        (EXIT (LETT |t| (|quotient_INT| |t| |n2|))))
                   (LETT |k| (|add_SI| |k| 2)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (CONS |s| (- |e|)) (QREFELT % 42)))))) 

(SDEFUN |FLOAT;sin;2%;10| ((|x| (%)) (% (%)))
        (SPROG
         ((|r| (%)) (#1=#:G126 NIL) (|i| NIL) (#2=#:G120 NIL) (|k| (|Integer|))
          (|s| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ (LETT |s| (SPADCALL |x| (QREFELT % 58)))
              (LETT |x| (SPADCALL |x| (QREFELT % 46)))
              (LETT |p| (SPADCALL (QREFELT % 49))) (SPADCALL 4 (QREFELT % 37))
              (COND
               ((SPADCALL |x| (CONS 6 0) (QREFELT % 32))
                (SEQ (SPADCALL |p| (QREFELT % 37))
                     (LETT |x|
                           (SPADCALL
                            (SPADCALL 2 (SPADCALL (QREFELT % 30))
                                      (QREFELT % 59))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL |x| (SPADCALL (QREFELT % 30))
                                        (QREFELT % 39))
                              2 (QREFELT % 31))
                             (QREFELT % 48))
                            (QREFELT % 54)))
                     (EXIT (SPADCALL |p| (QREFELT % 60))))))
              (COND
               ((SPADCALL |x| (CONS 3 0) (QREFELT % 32))
                (SEQ (SPADCALL |p| (QREFELT % 37)) (LETT |s| (- |s|))
                     (LETT |x|
                           (SPADCALL |x| (SPADCALL (QREFELT % 30))
                                     (QREFELT % 44)))
                     (EXIT (SPADCALL |p| (QREFELT % 60))))))
              (COND
               ((SPADCALL |x| (CONS 3 -1) (QREFELT % 32))
                (SEQ (SPADCALL |p| (QREFELT % 37))
                     (LETT |x|
                           (SPADCALL (SPADCALL (QREFELT % 30)) |x|
                                     (QREFELT % 44)))
                     (EXIT (SPADCALL |p| (QREFELT % 41))))))
              (LETT |k|
                    (|quotient_INT|
                     (SPADCALL (- (SPADCALL (QREFELT % 49)) 100)
                               (QREFELT % 52))
                     4))
              (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT % 53)))))
              (COND
               ((> |k| 0)
                (SEQ (SPADCALL |k| (QREFELT % 37))
                     (EXIT
                      (LETT |x|
                            (SPADCALL |x|
                                      (EXPT 3
                                            (PROG1 (LETT #2# |k|)
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#)))
                                      (QREFELT % 31)))))))
              (LETT |r| (|FLOAT;sinSeries| |x| %))
              (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |r|
                           (SPADCALL (|FLOAT;itimes| 3 |r| %)
                                     (SPADCALL (SPADCALL |r| 3 (QREFELT % 61))
                                               2 (QREFELT % 56))
                                     (QREFELT % 44)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SPADCALL |p| (QREFELT % 60))
              (EXIT (SPADCALL |s| |r| (QREFELT % 62)))))) 

(SDEFUN |FLOAT;sinSeries| ((|x| (%)) (% (%)))
        (SPROG
         ((|t| (|Integer|)) (|s| #1=(|Integer|)) (|i| NIL) (|m| (|Integer|))
          (|d| #1#) (|y| (%)) (|p| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT % 49))
                    (INTEGER-LENGTH (SPADCALL (QREFELT % 49))))
                 2))
          (LETT |y| (|FLOAT;times| |x| |x| %))
          (LETT |s| (LETT |d| (ASH 1 |p|)))
          (LETT |m| (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) %)))
          (LETT |t| (|quotient_INT| |m| 6))
          (SEQ (LETT |i| 4) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT % 57))) (GO G191)))
               (SEQ (LETT |s| (+ |s| |t|))
                    (LETT |t| (|quotient_INT| (* |m| |t|) (* |i| (+ |i| 1))))
                    (EXIT (LETT |t| (|quotient_INT| |t| |d|))))
               (LETT |i| (|add_SI| |i| 2)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| (CONS |s| (- |p|)) (QREFELT % 54)))))) 

(SDEFUN |FLOAT;cos;2%;12| ((|x| (%)) (% (%)))
        (SPROG
         ((|r| (%)) (#1=#:G146 NIL) (|i| NIL) (|k| (|Integer|)) (#2=#:G145 NIL)
          (|s| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |s| 1) (LETT |x| (SPADCALL |x| (QREFELT % 46)))
                (LETT |p| (SPADCALL (QREFELT % 49)))
                (SPADCALL 4 (QREFELT % 37))
                (COND
                 ((SPADCALL |x| (CONS 6 0) (QREFELT % 32))
                  (SEQ (SPADCALL |p| (QREFELT % 37))
                       (LETT |x|
                             (SPADCALL
                              (SPADCALL 2 (SPADCALL (QREFELT % 30))
                                        (QREFELT % 59))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |x| (SPADCALL (QREFELT % 30))
                                          (QREFELT % 39))
                                2 (QREFELT % 31))
                               (QREFELT % 48))
                              (QREFELT % 54)))
                       (EXIT (SPADCALL |p| (QREFELT % 41))))))
                (COND
                 ((SPADCALL |x| (CONS 3 0) (QREFELT % 32))
                  (SEQ (SPADCALL |p| (QREFELT % 37)) (LETT |s| (- |s|))
                       (LETT |x|
                             (SPADCALL |x| (SPADCALL (QREFELT % 30))
                                       (QREFELT % 44)))
                       (EXIT (SPADCALL |p| (QREFELT % 41))))))
                (COND
                 ((SPADCALL |x| (CONS 1 0) (QREFELT % 32))
                  (SEQ (SPADCALL |p| (QREFELT % 37))
                       (LETT |x|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QREFELT % 30)) 2
                                        (QREFELT % 31))
                              |x| (QREFELT % 44)))
                       (SPADCALL |p| (QREFELT % 60))
                       (LETT |x| (SPADCALL |x| (QREFELT % 42)))
                       (EXIT
                        (PROGN
                         (LETT #2#
                               (SPADCALL |s| (SPADCALL |x| (QREFELT % 63))
                                         (QREFELT % 62)))
                         (GO #3=#:G144))))))
                (LETT |k|
                      (|quotient_INT|
                       (SPADCALL (- (SPADCALL (QREFELT % 49)) 100)
                                 (QREFELT % 52))
                       3))
                (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT % 53)))))
                (COND
                 ((> |k| 0)
                  (SEQ
                   (SPADCALL (+ |k| (EXPT (INTEGER-LENGTH |k|) 2))
                             (QREFELT % 37))
                   (EXIT (LETT |x| (SPADCALL |x| (- |k|) (QREFELT % 56)))))))
                (LETT |r| (|FLOAT;cosSeries| |x| %))
                (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |r|
                             (SPADCALL
                              (SPADCALL (SPADCALL |r| |r| (QREFELT % 54)) 1
                                        (QREFELT % 56))
                              (|spadConstant| % 28) (QREFELT % 44)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL |p| (QREFELT % 60))
                (EXIT (SPADCALL |s| |r| (QREFELT % 62)))))
          #3# (EXIT #2#)))) 

(SDEFUN |FLOAT;cosSeries| ((|x| (%)) (% (%)))
        (SPROG
         ((|t| (|Integer|)) (|s| #1=(|Integer|)) (|i| NIL) (|m| (|Integer|))
          (|d| #1#) (|y| (%)) (|p| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p|
                (+
                 (+ (SPADCALL (QREFELT % 49))
                    (INTEGER-LENGTH (SPADCALL (QREFELT % 49))))
                 1))
          (LETT |y| (|FLOAT;times| |x| |x| %))
          (LETT |s| (LETT |d| (ASH 1 |p|)))
          (LETT |m| (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) %)))
          (LETT |t| (|quotient_INT| |m| 2))
          (SEQ (LETT |i| 3) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT % 57))) (GO G191)))
               (SEQ (LETT |s| (+ |s| |t|))
                    (LETT |t| (|quotient_INT| (* |m| |t|) (* |i| (+ |i| 1))))
                    (EXIT (LETT |t| (|quotient_INT| |t| |d|))))
               (LETT |i| (|add_SI| |i| 2)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (CONS |s| (- |p|)) (QREFELT % 42)))))) 

(SDEFUN |FLOAT;tan;2%;14| ((|x| (%)) (% (%)))
        (SPROG
         ((|t| (%)) (|c| (%)) (|s| (|Integer|)) (|p| (|PositiveInteger|)))
         (SEQ (LETT |s| (SPADCALL |x| (QREFELT % 58)))
              (LETT |x| (SPADCALL |x| (QREFELT % 46)))
              (LETT |p| (SPADCALL (QREFELT % 49))) (SPADCALL 6 (QREFELT % 37))
              (COND
               ((SPADCALL |x| (CONS 3 0) (QREFELT % 32))
                (SEQ (SPADCALL |p| (QREFELT % 37))
                     (LETT |x|
                           (SPADCALL (SPADCALL (QREFELT % 30))
                                     (SPADCALL
                                      (SPADCALL |x| (SPADCALL (QREFELT % 30))
                                                (QREFELT % 39))
                                      (QREFELT % 48))
                                     (QREFELT % 54)))
                     (EXIT (SPADCALL |p| (QREFELT % 41))))))
              (COND
               ((SPADCALL |x| (CONS 3 -1) (QREFELT % 32))
                (SEQ (SPADCALL |p| (QREFELT % 37))
                     (LETT |x|
                           (SPADCALL (SPADCALL (QREFELT % 30)) |x|
                                     (QREFELT % 44)))
                     (LETT |s| (- |s|)) (EXIT (SPADCALL |p| (QREFELT % 41))))))
              (COND
               ((SPADCALL |x| (|spadConstant| % 28) (QREFELT % 32))
                (SEQ (LETT |c| (SPADCALL |x| (QREFELT % 64)))
                     (EXIT
                      (LETT |t|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 28)
                                        (SPADCALL |c| |c| (QREFELT % 54))
                                        (QREFELT % 44))
                              (QREFELT % 38))
                             |c| (QREFELT % 39))))))
               ('T
                (SEQ (LETT |c| (SPADCALL |x| (QREFELT % 63)))
                     (EXIT
                      (LETT |t|
                            (SPADCALL |c|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 28)
                                                 (SPADCALL |c| |c|
                                                           (QREFELT % 54))
                                                 (QREFELT % 44))
                                       (QREFELT % 38))
                                      (QREFELT % 39)))))))
              (SPADCALL |p| (QREFELT % 60))
              (EXIT (SPADCALL |s| |t| (QREFELT % 62)))))) 

(SDEFUN |FLOAT;pi;%;15| ((% (%)))
        (COND
         ((<= (SPADCALL (QREFELT % 49)) (QCAR (QREFELT % 66)))
          (SPADCALL (QCDR (QREFELT % 66)) (QREFELT % 42)))
         ('T
          (QCDR
           (SETELT % 66
                   (CONS (SPADCALL (QREFELT % 49)) (|FLOAT;piRamanujan| %))))))) 

(SDEFUN |FLOAT;piRamanujan| ((% (%)))
        (SPROG
         ((|t| (|Integer|)) (|m| (|Integer|)) (|s| (|Integer|)) (|i| NIL)
          (|j| NIL) (|d| (|Integer|)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n|
                (+
                 (+ (SPADCALL (QREFELT % 49))
                    (INTEGER-LENGTH (SPADCALL (QREFELT % 49))))
                 11))
          (LETT |t| (|quotient_INT| (ASH 1 |n|) 882))
          (LETT |d| (* 4 (EXPT 882 2))) (LETT |s| 0)
          (SEQ (LETT |j| 1123) (LETT |i| 2) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT % 57))) (GO G191)))
               (SEQ (LETT |s| (+ |s| (* |j| |t|)))
                    (LETT |m|
                          (-
                           (* (* (- |i| 1) (- (* 2 |i|) 1)) (- (* 2 |i|) 3))))
                    (EXIT
                     (LETT |t|
                           (|quotient_INT| (* |m| |t|) (* |d| (EXPT |i| 3))))))
               (LETT |i|
                     (PROG1 (|add_SI| |i| 2) (LETT |j| (|add_SI| |j| 21460))))
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|spadConstant| % 28) (CONS |s| (- (- |n|) 2))
                     (QREFELT % 39)))))) 

(SDEFUN |FLOAT;sinh;2%;17| ((|x| (%)) (% (%)))
        (SPROG ((|s| (%)) (|e| (%)) (|lost| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 23)) (|spadConstant| % 24))
                      (#1='T
                       (SEQ
                        (LETT |lost| (MAX (- (SPADCALL |x| (QREFELT % 53))) 0))
                        (EXIT
                         (COND ((> (* 2 |lost|) (SPADCALL (QREFELT % 49))) |x|)
                               (#1#
                                (SEQ (SPADCALL (+ 5 |lost|) (QREFELT % 37))
                                     (LETT |e| (SPADCALL |x| (QREFELT % 68)))
                                     (LETT |s|
                                           (SPADCALL
                                            (SPADCALL |e|
                                                      (SPADCALL
                                                       (|spadConstant| % 28)
                                                       |e| (QREFELT % 39))
                                                      (QREFELT % 44))
                                            2 (QREFELT % 31)))
                                     (SPADCALL (+ 5 |lost|) (QREFELT % 41))
                                     (EXIT
                                      (SPADCALL |s| (QREFELT % 42))))))))))))) 

(SDEFUN |FLOAT;cosh;2%;18| ((|x| (%)) (% (%)))
        (SPROG ((|c| (%)) (|e| (%)))
               (SEQ (SPADCALL 5 (QREFELT % 37))
                    (LETT |e| (SPADCALL |x| (QREFELT % 68)))
                    (LETT |c|
                          (SPADCALL
                           (SPADCALL |e|
                                     (SPADCALL (|spadConstant| % 28) |e|
                                               (QREFELT % 39))
                                     (QREFELT % 55))
                           2 (QREFELT % 31)))
                    (SPADCALL 5 (QREFELT % 41))
                    (EXIT (SPADCALL |c| (QREFELT % 42)))))) 

(SDEFUN |FLOAT;tanh;2%;19| ((|x| (%)) (% (%)))
        (SPROG ((|t| (%)) (|e| (%)) (|lost| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 23)) (|spadConstant| % 24))
                      (#1='T
                       (SEQ
                        (LETT |lost| (MAX (- (SPADCALL |x| (QREFELT % 53))) 0))
                        (EXIT
                         (COND ((> (* 2 |lost|) (SPADCALL (QREFELT % 49))) |x|)
                               (#1#
                                (SEQ (SPADCALL (+ 6 |lost|) (QREFELT % 37))
                                     (LETT |e| (SPADCALL |x| (QREFELT % 68)))
                                     (LETT |e|
                                           (SPADCALL |e| |e| (QREFELT % 54)))
                                     (LETT |t|
                                           (SPADCALL
                                            (SPADCALL |e| (|spadConstant| % 28)
                                                      (QREFELT % 44))
                                            (SPADCALL |e| (|spadConstant| % 28)
                                                      (QREFELT % 55))
                                            (QREFELT % 39)))
                                     (SPADCALL (+ 6 |lost|) (QREFELT % 41))
                                     (EXIT
                                      (SPADCALL |t| (QREFELT % 42))))))))))))) 

(SDEFUN |FLOAT;asinh;2%;20| ((|x| (%)) (% (%)))
        (SPROG ((|r| (%)) (#1=#:G189 NIL) (|p| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ (LETT |p| (MIN 0 (SPADCALL |x| (QREFELT % 53))))
                      (COND
                       ((OR (SPADCALL |x| (QREFELT % 23))
                            (< (* 2 |p|) (- (SPADCALL (QREFELT % 49)))))
                        (PROGN (LETT #1# |x|) (GO #2=#:G188))))
                      (SPADCALL (- 5 |p|) (QREFELT % 37))
                      (LETT |r|
                            (SPADCALL
                             (SPADCALL |x|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 28)
                                                  (SPADCALL |x| |x|
                                                            (QREFELT % 54))
                                                  (QREFELT % 55))
                                        (QREFELT % 38))
                                       (QREFELT % 55))
                             (QREFELT % 72)))
                      (SPADCALL (- 5 |p|) (QREFELT % 41))
                      (EXIT (SPADCALL |r| (QREFELT % 42)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FLOAT;acosh;2%;21| ((|x| (%)) (% (%)))
        (SPROG ((|r| (%)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| % 28) (QREFELT % 45))
                  (|error|
                   (SPADCALL
                    (LIST "acosh: invalid argument" ": "
                          (SPADCALL |x| (QREFELT % 33)))
                    (QREFELT % 35)))))
                (SPADCALL 5 (QREFELT % 37))
                (LETT |r|
                      (SPADCALL
                       (SPADCALL |x|
                                 (SPADCALL
                                  (|FLOAT;sub| (|FLOAT;times| |x| |x| %)
                                   (|spadConstant| % 28) %)
                                  (QREFELT % 38))
                                 (QREFELT % 55))
                       (QREFELT % 72)))
                (SPADCALL 5 (QREFELT % 41))
                (EXIT (SPADCALL |r| (QREFELT % 42)))))) 

(SDEFUN |FLOAT;atanh;2%;22| ((|x| (%)) (% (%)))
        (SPROG ((|r| (%)) (#1=#:G198 NIL) (|p| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((OR (SPADCALL |x| (|spadConstant| % 28) (QREFELT % 32))
                        (SPADCALL |x|
                                  (SPADCALL (|spadConstant| % 28)
                                            (QREFELT % 26))
                                  (QREFELT % 45)))
                    (|error|
                     (SPADCALL
                      (LIST "atanh: invalid argument" ": "
                            (SPADCALL |x| (QREFELT % 33)))
                      (QREFELT % 35)))))
                  (LETT |p| (MIN 0 (SPADCALL |x| (QREFELT % 53))))
                  (COND
                   ((OR (SPADCALL |x| (QREFELT % 23))
                        (< (* 2 |p|) (- (SPADCALL (QREFELT % 49)))))
                    (PROGN (LETT #1# |x|) (GO #2=#:G197))))
                  (SPADCALL (- 5 |p|) (QREFELT % 37))
                  (LETT |r|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL |x| (|spadConstant| % 28) (QREFELT % 55))
                           (SPADCALL (|spadConstant| % 28) |x| (QREFELT % 44))
                           (QREFELT % 39))
                          (QREFELT % 72))
                         2 (QREFELT % 31)))
                  (SPADCALL (- 5 |p|) (QREFELT % 41))
                  (EXIT (SPADCALL |r| (QREFELT % 42)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FLOAT;log;2%;23| ((|x| (%)) (% (%)))
        (SPADCALL (SPADCALL |x| (SPADCALL (QREFELT % 49)) (QREFELT % 78))
                  (QREFELT % 42))) 

(SDEFUN |FLOAT;log2;%;24| ((% (%)))
        (SPADCALL (SPADCALL (SPADCALL (QREFELT % 49)) (QREFELT % 79))
                  (QREFELT % 42))) 

(SDEFUN |FLOAT;log10;%;25| ((% (%)))
        (SPADCALL (SPADCALL (SPADCALL (QREFELT % 49)) (QREFELT % 81))
                  (QREFELT % 42))) 

(SDEFUN |FLOAT;log2;2%;26| ((|x| (%)) (% (%)))
        (SPROG ((|r| (%)) (|b| (|PositiveInteger|)))
               (SEQ (LETT |b| (+ (SPADCALL (QREFELT % 49)) 3))
                    (LETT |r|
                          (SPADCALL (SPADCALL |x| |b| (QREFELT % 78))
                                    (SPADCALL |b| (QREFELT % 79)) |b|
                                    (QREFELT % 83)))
                    (EXIT (SPADCALL |r| (QREFELT % 42)))))) 

(SDEFUN |FLOAT;log10;2%;27| ((|x| (%)) (% (%)))
        (SPROG ((|r| (%)) (|b| (|PositiveInteger|)))
               (SEQ (LETT |b| (+ (SPADCALL (QREFELT % 49)) 3))
                    (LETT |r|
                          (SPADCALL (SPADCALL |x| |b| (QREFELT % 78))
                                    (SPADCALL |b| (QREFELT % 81)) |b|
                                    (QREFELT % 83)))
                    (EXIT (SPADCALL |r| (QREFELT % 42)))))) 

(SDEFUN |FLOAT;exp;2%;28| ((|x| (%)) (% (%)))
        (SPADCALL (SPADCALL |x| (SPADCALL (QREFELT % 49)) (QREFELT % 86))
                  (QREFELT % 42))) 

(SDEFUN |FLOAT;exp1;%;29| ((% (%)))
        (SPADCALL (SPADCALL (SPADCALL (QREFELT % 49)) (QREFELT % 87))
                  (QREFELT % 42))) 

(SDEFUN |FLOAT;sqrt;2%;30| ((|x| (%)) (% (%)))
        (SPROG
         ((|i| (|Integer|)) (|p| (|Integer|)) (|l| (|Integer|))
          (|e| (|Integer|)) (|m| (|Integer|)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 25))
            (|error|
             (SPADCALL
              (LIST "sqrt: negative argument" ": "
                    (SPADCALL |x| (QREFELT % 33)))
              (QREFELT % 35))))
           ('T
            (SEQ (LETT |m| (QCAR |x|)) (LETT |e| (QCDR |x|))
                 (LETT |l| (INTEGER-LENGTH |m|))
                 (LETT |p| (+ (- (* 2 (SPADCALL (QREFELT % 49))) |l|) 2))
                 (COND ((ODDP (- |e| |l|)) (LETT |p| (- |p| 1))))
                 (LETT |i| (|FLOAT;shift2| (QCAR |x|) |p| %))
                 (LETT |i| (SPADCALL |i| (QREFELT % 52)))
                 (EXIT
                  (SPADCALL (CONS |i| (|quotient_INT| (- |e| |p|) 2))
                            (QREFELT % 42))))))))) 

(SDEFUN |FLOAT;bits;Pi;31| ((% (|PositiveInteger|))) (QREFELT % 6)) 

(SDEFUN |FLOAT;bits;2Pi;32| ((|n| #1=(|PositiveInteger|)) (% #1#))
        (SPROG ((|t| (|PositiveInteger|)))
               (SEQ (LETT |t| (QREFELT % 6)) (SETELT % 6 |n|) (EXIT |t|)))) 

(SDEFUN |FLOAT;precision;Pi;33| ((% (|PositiveInteger|)))
        (SPADCALL (QREFELT % 49))) 

(SDEFUN |FLOAT;precision;2Pi;34| ((|n| #1=(|PositiveInteger|)) (% #1#))
        (SPADCALL |n| (QREFELT % 60))) 

(SDEFUN |FLOAT;increasePrecision;IPi;35|
        ((|n| (|Integer|)) (% (|PositiveInteger|)))
        (SPROG ((#1=#:G226 NIL) (|b| (|PositiveInteger|)))
               (SEQ (LETT |b| (SPADCALL (QREFELT % 49)))
                    (SPADCALL
                     (PROG1 (LETT #1# (+ |b| |n|))
                       (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT % 60))
                    (EXIT |b|)))) 

(SDEFUN |FLOAT;decreasePrecision;IPi;36|
        ((|n| (|Integer|)) (% (|PositiveInteger|)))
        (SPROG ((#1=#:G230 NIL) (|b| (|PositiveInteger|)))
               (SEQ (LETT |b| (SPADCALL (QREFELT % 49)))
                    (SPADCALL
                     (PROG1 (LETT #1# (- |b| |n|))
                       (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT % 60))
                    (EXIT |b|)))) 

(SDEFUN |FLOAT;ceillog10base2|
        ((|n| (|PositiveInteger|)) (% (|PositiveInteger|)))
        (SPROG ((#1=#:G234 NIL))
               (PROG1 (LETT #1# (|quotient_INT| (+ (* 13301 |n|) 4003) 4004))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |FLOAT;digits;Pi;38| ((% (|PositiveInteger|)))
        (SPROG ((#1=#:G237 NIL))
               (PROG1
                   (LETT #1#
                         (MAX 1
                              (|quotient_INT|
                               (* 4004 (- (SPADCALL (QREFELT % 49)) 1))
                               13301)))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))) 

(SDEFUN |FLOAT;digits;2Pi;39| ((|n| #1=(|PositiveInteger|)) (% #1#))
        (SPROG ((|t| (|PositiveInteger|)))
               (SEQ (LETT |t| (SPADCALL (QREFELT % 90)))
                    (SPADCALL (+ 1 (|FLOAT;ceillog10base2| |n| %))
                              (QREFELT % 60))
                    (EXIT |t|)))) 

(SDEFUN |FLOAT;order;%I;40| ((|a| (%)) (% (|Integer|)))
        (- (+ (INTEGER-LENGTH (QCAR |a|)) (QCDR |a|)) 1)) 

(SDEFUN |FLOAT;relerror;3%;41| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |a| |b| (QREFELT % 44)) |b| (QREFELT % 39))
         (QREFELT % 46))) 

(MAKEPROP '|FLOAT;Zero;%;42| '|SPADreplace| '(XLAM NIL (CONS 0 0))) 

(SDEFUN |FLOAT;Zero;%;42| ((% (%))) (CONS 0 0)) 

(MAKEPROP '|FLOAT;One;%;43| '|SPADreplace| '(XLAM NIL (CONS 1 0))) 

(SDEFUN |FLOAT;One;%;43| ((% (%))) (CONS 1 0)) 

(MAKEPROP '|FLOAT;base;Pi;44| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |FLOAT;base;Pi;44| ((% (|PositiveInteger|))) 2) 

(MAKEPROP '|FLOAT;mantissa;%I;45| '|SPADreplace| 'QCAR) 

(SDEFUN |FLOAT;mantissa;%I;45| ((|x| (%)) (% (|Integer|))) (QCAR |x|)) 

(MAKEPROP '|FLOAT;exponent;%I;46| '|SPADreplace| 'QCDR) 

(SDEFUN |FLOAT;exponent;%I;46| ((|x| (%)) (% (|Integer|))) (QCDR |x|)) 

(SDEFUN |FLOAT;one?;%B;47| ((|a| (%)) (% (|Boolean|)))
        (SPADCALL |a| (|spadConstant| % 28) (QREFELT % 29))) 

(SDEFUN |FLOAT;zero?;%B;48| ((|a| (%)) (% (|Boolean|))) (ZEROP (QCAR |a|))) 

(SDEFUN |FLOAT;negative?;%B;49| ((|a| (%)) (% (|Boolean|))) (MINUSP (QCAR |a|))) 

(SDEFUN |FLOAT;positive?;%B;50| ((|a| (%)) (% (|Boolean|))) (PLUSP (QCAR |a|))) 

(SDEFUN |FLOAT;chop| ((|x| (%)) (|p| (|PositiveInteger|)) (% (%)))
        (SPROG ((|e| (|Integer|)))
               (SEQ (LETT |e| (- (INTEGER-LENGTH (QCAR |x|)) |p|))
                    (COND
                     ((> |e| 0)
                      (LETT |x|
                            (CONS (|FLOAT;shift2| (QCAR |x|) (- |e|) %)
                                  (+ (QCDR |x|) |e|)))))
                    (EXIT |x|)))) 

(SDEFUN |FLOAT;float;2I%;52| ((|m| #1=(|Integer|)) (|e| #1#) (% (%)))
        (SPADCALL (CONS |m| |e|) (QREFELT % 42))) 

(SDEFUN |FLOAT;float;2IPi%;53|
        ((|m| #1=(|Integer|)) (|e| #1#) (|b| (|PositiveInteger|)) (% (%)))
        (SPROG ((|r| (%)))
               (SEQ
                (COND ((EQL |m| 0) (|spadConstant| % 24))
                      ('T
                       (SEQ (SPADCALL 4 (QREFELT % 37))
                            (LETT |r|
                                  (SPADCALL |m|
                                            (SPADCALL (CONS |b| 0) |e|
                                                      (QREFELT % 97))
                                            (QREFELT % 62)))
                            (SPADCALL 4 (QREFELT % 41))
                            (EXIT (SPADCALL |r| (QREFELT % 42))))))))) 

(SDEFUN |FLOAT;normalize;2%;54| ((|x| (%)) (% (%)))
        (SPROG ((|y| (|Integer|)) (|e| (|Integer|)) (|m| (|Integer|)))
               (SEQ (LETT |m| (QCAR |x|))
                    (EXIT
                     (COND ((EQL |m| 0) (|spadConstant| % 24))
                           (#1='T
                            (SEQ
                             (LETT |e|
                                   (- (INTEGER-LENGTH |m|)
                                      (SPADCALL (QREFELT % 49))))
                             (COND
                              ((> |e| 0)
                               (SEQ (LETT |y| (|FLOAT;shift2| |m| (- 1 |e|) %))
                                    (COND
                                     ((ODDP |y|)
                                      (SEQ
                                       (LETT |y|
                                             (|quotient_INT|
                                              (COND ((> |y| 0) (+ |y| 1))
                                                    (#1# (- |y| 1)))
                                              2))
                                       (EXIT
                                        (COND
                                         ((> (INTEGER-LENGTH |y|)
                                             (SPADCALL (QREFELT % 49)))
                                          (SEQ
                                           (LETT |y| (|quotient_INT| |y| 2))
                                           (EXIT (LETT |e| (+ |e| 1)))))))))
                                     (#1# (LETT |y| (|quotient_INT| |y| 2))))
                                    (EXIT
                                     (LETT |x|
                                           (CONS |y| (+ (QCDR |x|) |e|)))))))
                             (EXIT |x|)))))))) 

(SDEFUN |FLOAT;shift;%I%;55| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (CONS (QCAR |x|) (+ (QCDR |x|) |n|))) 

(SDEFUN |FLOAT;=;2%B;56| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND ((EQL (QCDR |x|) (QCDR |y|)) (EQL (QCAR |x|) (QCAR |y|)))
              ((EQL (SPADCALL |x| (QREFELT % 53))
                    (SPADCALL |y| (QREFELT % 53)))
               (COND
                ((EQL (SPADCALL |x| (QREFELT % 58))
                      (SPADCALL |y| (QREFELT % 58)))
                 (SPADCALL (SPADCALL |x| |y| (QREFELT % 44)) (QREFELT % 23)))
                (#1='T NIL)))
              (#1# NIL))) 

(SDEFUN |FLOAT;<;2%B;57| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SEQ
         (COND ((EQL (QCAR |y|) 0) (< (QCAR |x|) 0))
               ((EQL (QCAR |x|) 0) (> (QCAR |y|) 0))
               (#1='T
                (SEQ
                 (COND
                  ((SPADCALL |x| (QREFELT % 25))
                   (COND ((SPADCALL |y| (QREFELT % 95)) (EXIT 'T)))))
                 (COND
                  ((SPADCALL |y| (QREFELT % 25))
                   (COND ((SPADCALL |x| (QREFELT % 95)) (EXIT NIL)))))
                 (EXIT
                  (COND
                   ((< (SPADCALL |x| (QREFELT % 53))
                       (SPADCALL |y| (QREFELT % 53)))
                    (SPADCALL |x| (QREFELT % 95)))
                   ((> (SPADCALL |x| (QREFELT % 53))
                       (SPADCALL |y| (QREFELT % 53)))
                    (SPADCALL |x| (QREFELT % 25)))
                   (#1#
                    (SPADCALL (SPADCALL |x| |y| (QREFELT % 44))
                              (QREFELT % 25)))))))))) 

(SDEFUN |FLOAT;abs;2%;58| ((|x| (%)) (% (%)))
        (COND ((SPADCALL |x| (QREFELT % 25)) (SPADCALL |x| (QREFELT % 26)))
              ('T (SPADCALL |x| (QREFELT % 42))))) 

(SDEFUN |FLOAT;ceiling;2%;59| ((|x| (%)) (% (%)))
        (SPROG ((#1=#:G289 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |x| (QREFELT % 25))
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL (SPADCALL |x| (QREFELT % 26))
                                      (QREFELT % 99))
                            (QREFELT % 26)))
                     (GO #2=#:G288))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |x| (QREFELT % 48)) (QREFELT % 23))
                     |x|)
                    ('T
                     (SPADCALL (SPADCALL |x| (QREFELT % 100))
                               (|spadConstant| % 28) (QREFELT % 55)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |FLOAT;wholePart;%I;60| ((|x| (%)) (% (|Integer|)))
        (|FLOAT;shift2| (QCAR |x|) (QCDR |x|) %)) 

(SDEFUN |FLOAT;floor;2%;61| ((|x| (%)) (% (%)))
        (COND
         ((SPADCALL |x| (QREFELT % 25))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 101))
                    (QREFELT % 26)))
         ('T (SPADCALL |x| (QREFELT % 100))))) 

(SDEFUN |FLOAT;round;2%;62| ((|x| (%)) (% (%)))
        (SPROG ((|half| (%)))
               (SEQ (LETT |half| (CONS (SPADCALL |x| (QREFELT % 58)) -1))
                    (EXIT
                     (SPADCALL (SPADCALL |x| |half| (QREFELT % 55))
                               (QREFELT % 100)))))) 

(SDEFUN |FLOAT;sign;%I;63| ((|x| (%)) (% (|Integer|)))
        (COND ((< (QCAR |x|) 0) -1) ('T 1))) 

(SDEFUN |FLOAT;truncate;2%;64| ((|x| (%)) (% (%)))
        (SPROG ((#1=#:G302 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((>= (QCDR |x|) 0) (PROGN (LETT #1# |x|) (GO #2=#:G301))))
                  (EXIT
                   (SPADCALL (CONS (|FLOAT;shift2| (QCAR |x|) (QCDR |x|) %) 0)
                             (QREFELT % 42)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FLOAT;recip;%U;65| ((|x| (%)) (% (|Union| % "failed")))
        (COND
         ((SPADCALL |x| (|spadConstant| % 24) (QREFELT % 29))
          (CONS 1 "failed"))
         ('T (CONS 0 (SPADCALL (|spadConstant| % 28) |x| (QREFELT % 39)))))) 

(SDEFUN |FLOAT;differentiate;2%;66| ((|x| (%)) (% (%))) (|spadConstant| % 24)) 

(SDEFUN |FLOAT;-;2%;67| ((|x| (%)) (% (%)))
        (SPADCALL (|FLOAT;negate| |x| %) (QREFELT % 42))) 

(SDEFUN |FLOAT;negate| ((|x| (%)) (% (%))) (CONS (- (QCAR |x|)) (QCDR |x|))) 

(SDEFUN |FLOAT;+;3%;69| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL (|FLOAT;plus| |x| |y| %) (QREFELT % 42))) 

(SDEFUN |FLOAT;-;3%;70| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL (|FLOAT;plus| |x| (|FLOAT;negate| |y| %) %) (QREFELT % 42))) 

(SDEFUN |FLOAT;sub| ((|x| (%)) (|y| (%)) (% (%)))
        (|FLOAT;plus| |x| (|FLOAT;negate| |y| %) %)) 

(SDEFUN |FLOAT;plus| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|mw| (|Integer|)) (|ey| #1=(|Integer|)) (|ex| #1#)
          (|my| #2=(|Integer|)) (|mx| #2#) (|#G99| #1#) (|#G98| #1#)
          (|#G97| #2#) (|#G96| #2#) (|de| (|Integer|)))
         (SEQ (LETT |mx| (QCAR |x|)) (LETT |my| (QCAR |y|))
              (EXIT
               (COND ((EQL |mx| 0) |y|) ((EQL |my| 0) |x|)
                     (#3='T
                      (SEQ (LETT |ex| (QCDR |x|)) (LETT |ey| (QCDR |y|))
                           (EXIT
                            (COND ((EQL |ex| |ey|) (CONS (+ |mx| |my|) |ex|))
                                  (#3#
                                   (SEQ
                                    (LETT |de|
                                          (-
                                           (- (+ |ex| (INTEGER-LENGTH |mx|))
                                              |ey|)
                                           (INTEGER-LENGTH |my|)))
                                    (EXIT
                                     (COND
                                      ((> |de| (+ (SPADCALL (QREFELT % 49)) 1))
                                       |x|)
                                      ((< |de|
                                          (- (+ (SPADCALL (QREFELT % 49)) 1)))
                                       |y|)
                                      (#3#
                                       (SEQ
                                        (COND
                                         ((< |ex| |ey|)
                                          (PROGN
                                           (LETT |#G96| |my|)
                                           (LETT |#G97| |mx|)
                                           (LETT |#G98| |ey|)
                                           (LETT |#G99| |ex|)
                                           (LETT |mx| |#G96|)
                                           (LETT |my| |#G97|)
                                           (LETT |ex| |#G98|)
                                           (LETT |ey| |#G99|))))
                                        (LETT |mw|
                                              (+ |my|
                                                 (|FLOAT;shift2| |mx|
                                                  (- |ex| |ey|) %)))
                                        (EXIT (CONS |mw| |ey|))))))))))))))))) 

(SDEFUN |FLOAT;*;3%;73| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL (|FLOAT;times| |x| |y| %) (QREFELT % 42))) 

(SDEFUN |FLOAT;*;I2%;74| ((|x| (|Integer|)) (|y| (%)) (% (%)))
        (COND
         ((> (INTEGER-LENGTH |x|) (SPADCALL (QREFELT % 49)))
          (SPADCALL (SPADCALL (CONS |x| 0) (QREFELT % 42)) |y| (QREFELT % 54)))
         ('T (SPADCALL (CONS (* |x| (QCAR |y|)) (QCDR |y|)) (QREFELT % 42))))) 

(SDEFUN |FLOAT;/;3%;75| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL (|FLOAT;dvide| |x| |y| %) (QREFELT % 42))) 

(SDEFUN |FLOAT;/;%I%;76| ((|x| (%)) (|y| (|Integer|)) (% (%)))
        (COND
         ((> (INTEGER-LENGTH |y|) (SPADCALL (QREFELT % 49)))
          (SPADCALL |x| (SPADCALL (CONS |y| 0) (QREFELT % 42)) (QREFELT % 39)))
         ('T (SPADCALL |x| (CONS |y| 0) (QREFELT % 39))))) 

(SDEFUN |FLOAT;inv;2%;77| ((|x| (%)) (% (%)))
        (SPADCALL (|spadConstant| % 28) |x| (QREFELT % 39))) 

(SDEFUN |FLOAT;times| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS (* (QCAR |x|) (QCAR |y|)) (+ (QCDR |x|) (QCDR |y|)))) 

(SDEFUN |FLOAT;itimes| ((|n| (|Integer|)) (|y| (%)) (% (%)))
        (CONS (* |n| (QCAR |y|)) (QCDR |y|))) 

(SDEFUN |FLOAT;dvide| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|ew| (|Integer|)) (|mw| (|Integer|)))
               (SEQ
                (LETT |ew|
                      (+
                       (+
                        (- (INTEGER-LENGTH (QCAR |y|))
                           (INTEGER-LENGTH (QCAR |x|)))
                        (SPADCALL (QREFELT % 49)))
                       1))
                (LETT |mw|
                      (|quotient_INT| (|FLOAT;shift2| (QCAR |x|) |ew| %)
                                      (QCAR |y|)))
                (LETT |ew| (- (- (QCDR |x|) (QCDR |y|)) |ew|))
                (EXIT (CONS |mw| |ew|))))) 

(SDEFUN |FLOAT;square| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (SPROG
         ((|ex| (|Integer|)) (|ma| (|Integer|)) (|l| (|Integer|))
          (#1=#:G342 NIL) (|k| NIL))
         (SEQ (LETT |ma| (QCAR |x|)) (LETT |ex| (QCDR |x|))
              (SEQ (LETT |k| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ (LETT |ma| (* |ma| |ma|)) (LETT |ex| (+ |ex| |ex|))
                        (LETT |l|
                              (- (SPADCALL (QREFELT % 49))
                                 (INTEGER-LENGTH |ma|)))
                        (LETT |ma| (|FLOAT;shift2| |ma| |l| %))
                        (EXIT (LETT |ex| (- |ex| |l|))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |ma| |ex|))))) 

(SDEFUN |FLOAT;power| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (SPROG ((|z| (%)) (#1=#:G350 NIL) (|y| (%)))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| (|spadConstant| % 28)) (LETT |z| |x|)
                      (EXIT
                       (SEQ G190 NIL
                            (SEQ
                             (COND
                              ((ODDP |n|)
                               (LETT |y|
                                     (|FLOAT;chop| (|FLOAT;times| |y| |z| %)
                                      (SPADCALL (QREFELT % 49)) %))))
                             (SEQ (LETT |n| (|quotient_INT| |n| 2))
                                  (EXIT
                                   (COND
                                    ((EQL |n| 0)
                                     (PROGN (LETT #1# |y|) (GO #2=#:G349))))))
                             (EXIT
                              (LETT |z|
                                    (|FLOAT;chop| (|FLOAT;times| |z| |z| %)
                                     (SPADCALL (QREFELT % 49)) %))))
                            NIL (GO G190) G191 (EXIT NIL)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FLOAT;^;3%;83| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|r| (%)) (|p| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| % 24) (QREFELT % 29))
                  (COND
                   ((SPADCALL |y| (|spadConstant| % 24) (QREFELT % 29))
                    (|error| "0^0 is undefined"))
                   ((SPADCALL |y| (|spadConstant| % 24) (QREFELT % 45))
                    (|error| "division by 0"))
                   (#1='T (|spadConstant| % 24))))
                 ((SPADCALL |y| (|spadConstant| % 24) (QREFELT % 29))
                  (|spadConstant| % 28))
                 ((SPADCALL |y| (|spadConstant| % 28) (QREFELT % 29)) |x|)
                 ((SPADCALL |x| (|spadConstant| % 28) (QREFELT % 29))
                  (|spadConstant| % 28))
                 (#1#
                  (SEQ (LETT |p| (+ (ABS (SPADCALL |y| (QREFELT % 53))) 5))
                       (SPADCALL |p| (QREFELT % 37))
                       (LETT |r|
                             (SPADCALL
                              (SPADCALL |y| (SPADCALL |x| (QREFELT % 72))
                                        (QREFELT % 54))
                              (QREFELT % 68)))
                       (SPADCALL |p| (QREFELT % 41))
                       (EXIT (SPADCALL |r| (QREFELT % 42))))))))) 

(SDEFUN |FLOAT;^;%F%;84| ((|x| (%)) (|r| (|Fraction| (|Integer|))) (% (%)))
        (SPROG ((|y| (%)) (#1=#:G361 NIL) (|d| (|Integer|)) (|n| (|Integer|)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (|spadConstant| % 24) (QREFELT % 29))
                   (COND
                    ((SPADCALL |r| (|spadConstant| % 109) (QREFELT % 110))
                     (|spadConstant| % 28))
                    ((SPADCALL |r| (|spadConstant| % 109) (QREFELT % 111))
                     (|error| "division by 0"))
                    (#2='T (|spadConstant| % 24))))
                  ((SPADCALL |r| (|spadConstant| % 109) (QREFELT % 110))
                   (|spadConstant| % 28))
                  ((SPADCALL |r| (|spadConstant| % 112) (QREFELT % 110)) |x|)
                  ((SPADCALL |x| (|spadConstant| % 28) (QREFELT % 29))
                   (|spadConstant| % 28))
                  (#2#
                   (SEQ (LETT |n| (SPADCALL |r| (QREFELT % 113)))
                        (LETT |d| (SPADCALL |r| (QREFELT % 114)))
                        (EXIT
                         (COND
                          ((SPADCALL |x| (QREFELT % 25))
                           (COND
                            ((ODDP |d|)
                             (COND
                              ((ODDP |n|)
                               (PROGN
                                (LETT #1#
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |x| (QREFELT % 26))
                                                 |r| (QREFELT % 115))
                                       (QREFELT % 26)))
                                (GO #3=#:G360)))
                              (#2#
                               (PROGN
                                (LETT #1#
                                      (SPADCALL (SPADCALL |x| (QREFELT % 26))
                                                |r| (QREFELT % 115)))
                                (GO #3#)))))
                            (#2# (|error| "negative root"))))
                          (#2#
                           (SEQ
                            (COND
                             ((EQL |d| 2)
                              (COND
                               ((EQL |n| 1)
                                (PROGN
                                 (LETT #1# (SPADCALL |x| (QREFELT % 38)))
                                 (GO #3#)))
                               (#2#
                                (SEQ
                                 (SPADCALL (INTEGER-LENGTH |n|) (QREFELT % 37))
                                 (LETT |y| (SPADCALL |x| (QREFELT % 38)))
                                 (LETT |y| (SPADCALL |y| |n| (QREFELT % 97)))
                                 (SPADCALL (INTEGER-LENGTH |n|) (QREFELT % 41))
                                 (EXIT
                                  (PROGN
                                   (LETT #1# (SPADCALL |y| (QREFELT % 42)))
                                   (GO #3#))))))))
                            (LETT |y|
                                  (SPADCALL (CONS |n| 0) (CONS |d| 0)
                                            (QREFELT % 39)))
                            (EXIT (SPADCALL |x| |y| (QREFELT % 107)))))))))))
                #3# (EXIT #1#)))) 

(SDEFUN |FLOAT;^;%I%;85| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (SPROG ((|y| (%)) (|p| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((SPADCALL |x| (|spadConstant| % 24) (QREFELT % 29))
                  (COND ((EQL |n| 0) (|spadConstant| % 28))
                        ((< |n| 0) (|error| "division by 0"))
                        (#1='T (|spadConstant| % 24))))
                 ((EQL |n| 0) (|spadConstant| % 28)) ((EQL |n| 1) |x|)
                 ((SPADCALL |x| (|spadConstant| % 28) (QREFELT % 29))
                  (|spadConstant| % 28))
                 (#1#
                  (SEQ (LETT |p| (SPADCALL (QREFELT % 49)))
                       (SPADCALL (+ (+ |p| (INTEGER-LENGTH |n|)) 2)
                                 (QREFELT % 60))
                       (LETT |y| (|FLOAT;power| |x| (ABS |n|) %))
                       (COND
                        ((< |n| 0)
                         (LETT |y|
                               (|FLOAT;dvide| (|spadConstant| % 28) |y| %))))
                       (SPADCALL |p| (QREFELT % 60))
                       (EXIT (SPADCALL |y| (QREFELT % 42))))))))) 

(SDEFUN |FLOAT;outputSpacing;2Nni;86|
        ((|n| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPROG ((|old_val| (|NonNegativeInteger|)))
               (SEQ (LETT |old_val| (QREFELT % 116)) (SETELT % 116 |n|)
                    (EXIT |old_val|)))) 

(SDEFUN |FLOAT;outputFixed;V;87| ((% (|Void|)))
        (SEQ (SETELT % 117 "fixed") (EXIT (SETELT % 118 -1)))) 

(SDEFUN |FLOAT;outputFixed;NniV;88| ((|n| (|NonNegativeInteger|)) (% (|Void|)))
        (SEQ (SETELT % 117 "fixed") (EXIT (SETELT % 118 |n|)))) 

(SDEFUN |FLOAT;outputGeneral;V;89| ((% (|Void|)))
        (SEQ (SETELT % 117 "general") (EXIT (SETELT % 118 -1)))) 

(SDEFUN |FLOAT;outputGeneral;NniV;90|
        ((|n| (|NonNegativeInteger|)) (% (|Void|)))
        (SEQ (SETELT % 117 "general") (EXIT (SETELT % 118 |n|)))) 

(SDEFUN |FLOAT;outputFloating;V;91| ((% (|Void|)))
        (SEQ (SETELT % 117 "floating") (EXIT (SETELT % 118 -1)))) 

(SDEFUN |FLOAT;outputFloating;NniV;92|
        ((|n| (|NonNegativeInteger|)) (% (|Void|)))
        (SEQ (SETELT % 117 "floating") (EXIT (SETELT % 118 |n|)))) 

(SDEFUN |FLOAT;get_output_mode;R;93|
        ((% (|Record| (|:| |mode| (|String|)) (|:| |prec| (|Integer|)))))
        (CONS (QREFELT % 117) (QREFELT % 118))) 

(SDEFUN |FLOAT;set_output_mode;SIV;94|
        ((|mode| (|String|)) (|prec| (|Integer|)) (% (|Void|)))
        (SEQ
         (COND
          ((< |prec| 0)
           (COND
            ((SPADCALL |prec| -1 (QREFELT % 57))
             (EXIT (|error| "set_output_mode: invalid precision"))))))
         (COND
          ((NULL (SPADCALL |mode| (QREFELT % 129) (QREFELT % 131)))
           (EXIT (|error| "set_output_mode: invalid mode"))))
         (SETELT % 117 |mode|) (EXIT (SETELT % 118 |prec|)))) 

(SDEFUN |FLOAT;convert;%S;95| ((|f| (%)) (% (|String|)))
        (SPROG
         ((|mr|
           (|Record| (|:| |default?| (|Boolean|))
                     (|:| |trim_trailing_zeros?| (|Boolean|))
                     (|:| |out_mode| (|String|)) (|:| |spacing| (|Integer|))
                     (|:| |separator| (|Character|))))
          (|d| (|Integer|)))
         (SEQ
          (LETT |d|
                (SEQ
                 (COND
                  ((EQL (QREFELT % 118) -1)
                   (COND
                    ((NULL (SPADCALL |f| (QREFELT % 23)))
                     (EXIT
                      (MAX 1
                           (|quotient_INT|
                            (* 4004
                               (-
                                (INTEGER-LENGTH
                                 (ABS (SPADCALL |f| (QREFELT % 14))))
                                1))
                            13301)))))))
                 (EXIT (QREFELT % 118))))
          (LETT |mr|
                (VECTOR (EQL (QREFELT % 118) -1) (EQL (QREFELT % 118) -1)
                        (QREFELT % 117) (QREFELT % 116)
                        (SPADCALL (QREFELT % 134))))
          (EXIT (SPADCALL |f| |d| |mr| (QREFELT % 137)))))) 

(SDEFUN |FLOAT;coerce;%Of;96| ((|f| (%)) (% (|OutputForm|)))
        (COND
         ((SPADCALL |f| (|spadConstant| % 24) (QREFELT % 139))
          (SPADCALL (SPADCALL |f| (QREFELT % 138)) (QREFELT % 141)))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT % 26)) (QREFELT % 142))
                    (QREFELT % 143))))) 

(SDEFUN |FLOAT;convert;%If;97| ((|f| (%)) (% (|InputForm|)))
        (SPADCALL
         (LIST (SPADCALL '|float| (QREFELT % 146))
               (SPADCALL (SPADCALL |f| (QREFELT % 14)) (QREFELT % 148))
               (SPADCALL (SPADCALL |f| (QREFELT % 16)) (QREFELT % 148))
               (SPADCALL (SPADCALL (QREFELT % 93)) (QREFELT % 147)))
         (QREFELT % 149))) 

(MAKEPROP '|FLOAT;convert;2%;98| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |FLOAT;convert;2%;98| ((|x| (%)) (% (|Float|))) |x|) 

(SDEFUN |FLOAT;convert;%Df;99| ((|x| (%)) (% (|DoubleFloat|)))
        (|makeSF| (QCAR |x|) (QCDR |x|))) 

(SDEFUN |FLOAT;coerce;%Df;100| ((|x| (%)) (% (|DoubleFloat|)))
        (SPADCALL |x| (QREFELT % 154))) 

(SDEFUN |FLOAT;convert;Df%;101| ((|sf| (|DoubleFloat|)) (% (%)))
        (SPADCALL (SPADCALL |sf| (QREFELT % 156))
                  (SPADCALL |sf| (QREFELT % 157)) (FLOAT-RADIX 0.0)
                  (QREFELT % 98))) 

(SDEFUN |FLOAT;retract;%F;102| ((|f| (%)) (% (|Fraction| (|Integer|))))
        (SPROG ((#1=#:G400 NIL))
               (SPADCALL |f|
                         (PROG1 (LETT #1# (- (SPADCALL (QREFELT % 49)) 1))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         2 (QREFELT % 159)))) 

(SDEFUN |FLOAT;retractIfCan;%U;103|
        ((|f| (%)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPROG ((#1=#:G406 NIL))
               (CONS 0
                     (SPADCALL |f|
                               (PROG1
                                   (LETT #1# (- (SPADCALL (QREFELT % 49)) 1))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               2 (QREFELT % 159))))) 

(SDEFUN |FLOAT;retract;%I;104| ((|f| (%)) (% (|Integer|)))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (SPADCALL |f| (QREFELT % 50)))
                    (EXIT
                     (COND
                      ((SPADCALL |f| (SPADCALL |n| (QREFELT % 163))
                                 (QREFELT % 29))
                       |n|)
                      ('T (|error| "Not an integer"))))))) 

(SDEFUN |FLOAT;retractIfCan;%U;105|
        ((|f| (%)) (% (|Union| (|Integer|) "failed")))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (SPADCALL |f| (QREFELT % 50)))
                    (EXIT
                     (COND
                      ((SPADCALL |f| (SPADCALL |n| (QREFELT % 163))
                                 (QREFELT % 29))
                       (CONS 0 |n|))
                      ('T (CONS 1 "failed"))))))) 

(SDEFUN |FLOAT;rationalApproximation;%NniF;106|
        ((|f| (%)) (|d| (|NonNegativeInteger|)) (% (|Fraction| (|Integer|))))
        (SPADCALL |f| |d| 10 (QREFELT % 159))) 

(SDEFUN |FLOAT;rationalApproximation;%2NniF;107|
        ((|f| (%)) (|d| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|Fraction| (|Integer|))))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|#G155| #3=(|Integer|))
          (|#G154| #1#) (|q1| #4=(|Integer|)) (|q0| #4#)
          (|#G153| #5=(|Integer|)) (|#G152| #4#) (|p1| #4#) (|p0| #4#)
          (|#G151| #5#) (|#G150| #4#) (#6=#:G438 NIL) (|q2| #5#) (|p2| #5#)
          (|r| #3#) (|q| #7=(|Integer|))
          (|#G149| (|Record| (|:| |quotient| #7#) (|:| |remainder| #3#)))
          (|tol| (|NonNegativeInteger|)) (|de| (|PositiveInteger|))
          (#8=#:G429 NIL) (#9=#:G427 NIL) (|ex| (|Integer|)) (|nu| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |nu| (QCAR |f|)) (LETT |ex| (QCDR |f|))
                (COND
                 ((>= |ex| 0)
                  (PROGN
                   (LETT #6#
                         (SPADCALL
                          (* |nu|
                             (EXPT 2
                                   (PROG1 (LETT #9# |ex|)
                                     (|check_subtype2| (>= #9# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #9#))))
                          1 (QREFELT % 168)))
                   (GO #10=#:G437))))
                (LETT |de|
                      (EXPT 2
                            (PROG1 (LETT #8# (- |ex|))
                              (|check_subtype2| (>= #8# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #8#))))
                (COND ((< |b| 2) (|error| "base must be > 1")))
                (LETT |tol| (EXPT |b| |d|)) (LETT |s| |nu|) (LETT |t| |de|)
                (LETT |p0| 0) (LETT |p1| 1) (LETT |q0| 1) (LETT |q1| 0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (PROGN
                        (LETT |#G149| (|divide_INT| |s| |t|))
                        (LETT |q| (QCAR |#G149|))
                        (LETT |r| (QCDR |#G149|))
                        |#G149|)
                       (LETT |p2| (+ (* |q| |p1|) |p0|))
                       (LETT |q2| (+ (* |q| |q1|) |q0|))
                       (COND
                        ((OR (EQL |r| 0)
                             (< (* |tol| (ABS (- (* |nu| |q2|) (* |de| |p2|))))
                                (* |de| (ABS |p2|))))
                         (PROGN
                          (LETT #6# (SPADCALL |p2| |q2| (QREFELT % 168)))
                          (GO #10#))))
                       (PROGN
                        (LETT |#G150| |p1|)
                        (LETT |#G151| |p2|)
                        (LETT |p0| |#G150|)
                        (LETT |p1| |#G151|))
                       (PROGN
                        (LETT |#G152| |q1|)
                        (LETT |#G153| |q2|)
                        (LETT |q0| |#G152|)
                        (LETT |q1| |#G153|))
                       (EXIT
                        (PROGN
                         (LETT |#G154| |t|)
                         (LETT |#G155| |r|)
                         (LETT |s| |#G154|)
                         (LETT |t| |#G155|))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #10# (EXIT #6#)))) 

(SDEFUN |FLOAT;hashUpdate!;Hs%Hs;108|
        ((|s| (|HashState|)) (|x| (%)) (% (|HashState|)))
        (SPROG
         ((|e| (|Integer|)) (|m| (|Integer|)) (#1=#:G442 NIL)
          (|tmp| (|Union| (|Integer|) #2="failed")))
         (SEQ (LETT |m| (QCAR |x|)) (LETT |e| (QCDR |x|))
              (SEQ G190
                   (COND
                    ((NULL (QEQCAR (LETT |tmp| (|exquo_INT| |m| 2)) 0))
                     (GO G191)))
                   (SEQ
                    (LETT |m|
                          (PROG2 (LETT #1# |tmp|)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                            (|Union| (|Integer|) #2#) #1#)))
                    (EXIT (LETT |e| (+ |e| 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |s| (SPADCALL |s| |m| (QREFELT % 170)))
              (EXIT (SPADCALL |s| |e| (QREFELT % 170)))))) 

(DECLAIM (NOTINLINE |Float;|)) 

(DEFUN |Float;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Float|))
          (LETT % (GETREFV 185))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Float| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|CharacteristicZero|))
               (|augmentPredVector| % 1))
          (AND (|HasCategory| % '(|arbitraryPrecision|))
               (|augmentPredVector| % 2))
          (AND (|not| (|HasCategory| % '(|arbitraryExponent|)))
               (|not| (|HasCategory| % '(|arbitraryPrecision|)))
               (|augmentPredVector| % 4))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 68)
          (QSETREFV % 7
                    (|Record| (|:| |mantissa| (|Integer|))
                              (|:| |exponent| (|Integer|))))
          (QSETREFV % 66 (CONS 1 (CONS 1 2)))
          (QSETREFV % 116 10)
          (QSETREFV % 117 #1="general")
          (QSETREFV % 118 -1)
          (QSETREFV % 129 (LIST "fixed" #1# "floating"))
          %))) 

(DEFUN |Float| ()
  (SPROG NIL
         (PROG (#1=#:G461)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Float|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Float|
                             (LIST (CONS NIL (CONS 1 (|Float;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Float|)))))))))) 

(MAKEPROP '|Float| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL 'BITS '|Rep| (|Void|) (|OpenMathDevice|)
              (0 . |OMputApp|) (|String|) (5 . |OMputSymbol|) (|Integer|)
              |FLOAT;mantissa;%I;45| (12 . |OMputInteger|)
              |FLOAT;exponent;%I;46| (18 . |OMputEndApp|) (23 . |OMputObject|)
              (28 . |OMputEndObject|) (|Boolean|) |FLOAT;OMwrite;Omd%BV;2|
              (33 . |sign|) |FLOAT;zero?;%B;48|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FLOAT;Zero;%;42|) %))
              |FLOAT;negative?;%B;49| |FLOAT;-;2%;67| |FLOAT;asin;2%;4|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FLOAT;One;%;43|) %))
              |FLOAT;=;2%B;56| |FLOAT;pi;%;15| |FLOAT;/;%I%;76| (38 . >)
              (44 . |toString|) (|List| %) (49 . |concat|) (|PositiveInteger|)
              |FLOAT;increasePrecision;IPi;35| |FLOAT;sqrt;2%;30|
              |FLOAT;/;3%;75| |FLOAT;atan;2%;7|
              |FLOAT;decreasePrecision;IPi;36| |FLOAT;normalize;2%;54|
              |FLOAT;acos;2%;5| |FLOAT;-;3%;70| |FLOAT;<;2%B;57|
              |FLOAT;abs;2%;58| |FLOAT;atan;3%;6| (54 . |fractionPart|)
              |FLOAT;bits;Pi;31| |FLOAT;wholePart;%I;60| (|IntegerRoots| 13)
              (59 . |approxSqrt|) |FLOAT;order;%I;40| |FLOAT;*;3%;73|
              |FLOAT;+;3%;69| |FLOAT;shift;%I%;55| (64 . ~=) |FLOAT;sign;%I;63|
              (70 . *) |FLOAT;bits;2Pi;32| (76 . ^) |FLOAT;*;I2%;74|
              |FLOAT;sin;2%;10| |FLOAT;cos;2%;12| |FLOAT;tan;2%;14| 'P
              |FLOAT;precision;Pi;33| |FLOAT;exp;2%;28| |FLOAT;sinh;2%;17|
              |FLOAT;cosh;2%;18| |FLOAT;tanh;2%;19| |FLOAT;log;2%;23|
              |FLOAT;asinh;2%;20| |FLOAT;acosh;2%;21| |FLOAT;atanh;2%;22|
              (|Record| (|:| |mantissa| 13) (|:| |exponent| 13))
              (|FloatElementaryFunctions|) (82 . |log|) (88 . |log2|)
              |FLOAT;log2;%;24| (93 . |log10|) |FLOAT;log10;%;25|
              (98 . |quotient|) |FLOAT;log2;2%;26| |FLOAT;log10;2%;27|
              (105 . |exp|) (111 . |exp1|) |FLOAT;exp1;%;29|
              |FLOAT;precision;2Pi;34| |FLOAT;digits;Pi;38|
              |FLOAT;digits;2Pi;39| |FLOAT;relerror;3%;41| |FLOAT;base;Pi;44|
              |FLOAT;one?;%B;47| |FLOAT;positive?;%B;50| |FLOAT;float;2I%;52|
              |FLOAT;^;%I%;85| |FLOAT;float;2IPi%;53| |FLOAT;floor;2%;61|
              |FLOAT;truncate;2%;64| |FLOAT;ceiling;2%;59| |FLOAT;round;2%;62|
              (|Union| % '"failed") |FLOAT;recip;%U;65|
              |FLOAT;differentiate;2%;66| |FLOAT;inv;2%;77| |FLOAT;^;3%;83|
              (|Fraction| 13) (116 . |Zero|) (120 . =) (126 . <) (132 . |One|)
              (136 . |numer|) (141 . |denom|) |FLOAT;^;%F%;84| 'SPACING
              'OUTMODE 'OUTPREC (|NonNegativeInteger|)
              |FLOAT;outputSpacing;2Nni;86| |FLOAT;outputFixed;V;87|
              |FLOAT;outputFixed;NniV;88| |FLOAT;outputGeneral;V;89|
              |FLOAT;outputGeneral;NniV;90| |FLOAT;outputFloating;V;91|
              |FLOAT;outputFloating;NniV;92|
              (|Record| (|:| |mode| 11) (|:| |prec| 13))
              |FLOAT;get_output_mode;R;93| '|valid_modes| (|List| 11)
              (146 . |member?|) |FLOAT;set_output_mode;SIV;94| (|Character|)
              (152 . |underscore|)
              (|Record| (|:| |default?| 20) (|:| |trim_trailing_zeros?| 20)
                        (|:| |out_mode| 11) (|:| |spacing| 13)
                        (|:| |separator| 133))
              (|FloatingPointConvertion|) (156 . |convert_mr|)
              |FLOAT;convert;%S;95| (163 . >=) (|OutputForm|) (169 . |message|)
              |FLOAT;coerce;%Of;96| (174 . -) (|Symbol|) (|InputForm|)
              (179 . |convert|) (184 . |convert|) (189 . |convert|)
              (194 . |convert|) |FLOAT;convert;%If;97| (|Float|)
              |FLOAT;convert;2%;98| (|DoubleFloat|) |FLOAT;convert;%Df;99|
              |FLOAT;coerce;%Df;100| (199 . |mantissa|) (204 . |exponent|)
              |FLOAT;convert;Df%;101| |FLOAT;rationalApproximation;%2NniF;107|
              |FLOAT;retract;%F;102| (|Union| 108 '"failed")
              |FLOAT;retractIfCan;%U;103| (209 . |coerce|)
              |FLOAT;retract;%I;104| (|Union| 13 '"failed")
              |FLOAT;retractIfCan;%U;105|
              |FLOAT;rationalApproximation;%NniF;106| (214 . /) (|HashState|)
              (220 . |hashUpdate!|) |FLOAT;hashUpdate!;Hs%Hs;108|
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |coef| 34) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %) (|Union| 34 '"failed")
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 179 '"failed") (|Factored| %) (|Pattern| 151)
              (|PatternMatchResult| 151 %) (|SingleInteger|))
           '#(~= 226 |zero?| 232 |wholePart| 237 |unitNormal| 242
              |unitCanonical| 247 |unit?| 252 |truncate| 257 |toString| 262
              |tanh| 273 |tan| 278 |subtractIfCan| 283 |squareFreePart| 289
              |squareFree| 294 |sqrt| 299 |smaller?| 304 |sizeLess?| 310 |sinh|
              316 |sin| 321 |sign| 326 |shift| 331 |set_output_mode| 337 |sech|
              343 |sec| 348 |sample| 353 |round| 357 |rightRecip| 362
              |rightPower| 367 |retractIfCan| 379 |retract| 389 |rem| 399
              |relerror| 405 |recip| 411 |rationalApproximation| 416 |quo| 429
              |principalIdeal| 435 |prime?| 440 |precision| 445 |positive?| 454
              |plenaryPower| 459 |pi| 465 |patternMatch| 469 |outputSpacing|
              476 |outputGeneral| 481 |outputFloating| 490 |outputFixed| 499
              |order| 508 |opposite?| 513 |one?| 519 |nthRoot| 524 |normalize|
              530 |norm| 535 |negative?| 540 |multiEuclidean| 545 |min| 551
              |max| 561 |mantissa| 571 |log2| 576 |log10| 585 |log| 594
              |leftRecip| 599 |leftPower| 604 |lcmCoef| 616 |lcm| 622 |latex|
              633 |inv| 638 |increasePrecision| 643 |hashUpdate!| 648 |hash|
              654 |get_output_mode| 659 |gcdPolynomial| 663 |gcd| 669
              |fractionPart| 680 |floor| 685 |float| 690 |factor| 703
              |extendedEuclidean| 708 |exquo| 721 |expressIdealMember| 727
              |exponent| 733 |exp1| 738 |exp| 742 |euclideanSize| 747 |divide|
              752 |digits| 758 |differentiate| 767 |decreasePrecision| 778
              |csch| 783 |csc| 788 |coth| 793 |cot| 798 |cosh| 803 |cos| 808
              |convert| 813 |commutator| 843 |coerce| 849 |characteristic| 879
              |ceiling| 883 |bits| 888 |base| 897 |atanh| 901 |atan| 906
              |associator| 917 |associates?| 924 |asinh| 930 |asin| 935 |asech|
              940 |asec| 945 |antiCommutator| 950 |annihilate?| 956 |acsch| 962
              |acsc| 967 |acoth| 972 |acot| 977 |acosh| 982 |acos| 987 |abs|
              992 ^ 997 |Zero| 1027 |One| 1031 |OMwrite| 1035 D 1059 >= 1070 >
              1076 = 1082 <= 1088 < 1094 / 1100 - 1112 + 1123 * 1129)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|FloatingPointSystem&| |RealNumberSystem&| |Field&|
                |EuclideanDomain&| |UniqueFactorizationDomain&| NIL
                |GcdDomain&| NIL NIL NIL |DivisionRing&| NIL |Algebra&|
                |EntireRing&| |Algebra&| NIL |DifferentialRing&| NIL NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| NIL |Module&|
                |Module&| |NonAssociativeRing&| NIL NIL |OrderedAbelianGroup&|
                NIL |NonAssociativeRng&| NIL NIL NIL NIL |AbelianGroup&| NIL
                NIL NIL NIL NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL |OrderedSet&|
                |AbelianSemiGroup&| |Magma&| NIL NIL |SetCategory&| NIL NIL
                |RetractableTo&| |RetractableTo&|
                |TranscendentalFunctionCategory&| |Hashable&| NIL |BasicType&|
                NIL NIL NIL NIL NIL |PartialOrder&| NIL NIL NIL NIL
                |RadicalCategory&| NIL NIL NIL |OpenMath&| NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL)
             (CONS
              '#((|FloatingPointSystem|) (|RealNumberSystem|) (|Field|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|OrderedRing|) (|Algebra| $$) (|EntireRing|) (|Algebra| 108)
                 (|CharacteristicZero|) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 108) (|SemiRng|) (|Module| $$)
                 (|Module| 108) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 108 108) (|OrderedAbelianGroup|)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|LeftModule| 108) (|RightModule| 108)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|OrderedMonoid|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|OrderedAbelianSemiGroup|) (|OrderedSemiGroup|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|OrderedSet|) (|AbelianSemiGroup|) (|Magma|)
                 (|Comparable|) (|PatternMatchable| 151) (|SetCategory|)
                 (|CommutativeStar|) (|RealConstant|) (|RetractableTo| 13)
                 (|RetractableTo| 108) (|TranscendentalFunctionCategory|)
                 (|Hashable|) (|CoercibleTo| 140) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|PartialOrder|) (|ConvertibleTo| 153)
                 (|ConvertibleTo| 151) (|CoercibleFrom| 13)
                 (|CoercibleFrom| 108) (|RadicalCategory|)
                 (|ConvertibleTo| 182) (|Approximate|) (|ConvertibleTo| 11)
                 (|OpenMath|) (|CoercibleTo| 153) (|ConvertibleTo| 145)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|arbitraryPrecision|)
                 (|arbitraryExponent|))
              (|makeByteWordVec2| 184
                                  '(1 9 8 0 10 3 9 8 0 11 11 12 2 9 8 0 13 15 1
                                    9 8 0 17 1 9 8 0 18 1 9 8 0 19 1 13 13 0 22
                                    2 0 20 0 0 32 1 0 11 0 33 1 11 0 34 35 1 0
                                    0 0 48 1 51 13 13 52 2 13 20 0 0 57 2 0 0
                                    36 0 59 2 0 0 0 36 61 2 77 76 76 36 78 1 77
                                    76 36 79 1 77 76 36 81 3 77 76 76 76 36 83
                                    2 77 76 76 36 86 1 77 76 36 87 0 108 0 109
                                    2 108 20 0 0 110 2 108 20 0 0 111 0 108 0
                                    112 1 108 13 0 113 1 108 13 0 114 2 130 20
                                    11 0 131 0 133 0 134 3 136 11 76 13 135 137
                                    2 0 20 0 0 139 1 140 0 11 141 1 140 0 0 143
                                    1 145 0 144 146 1 36 145 0 147 1 13 145 0
                                    148 1 145 0 34 149 1 153 13 0 156 1 153 13
                                    0 157 1 0 0 13 163 2 108 0 13 13 168 2 13
                                    169 169 0 170 2 0 20 0 0 1 1 0 20 0 23 1 0
                                    13 0 50 1 0 172 0 1 1 0 0 0 1 1 0 20 0 1 1
                                    0 0 0 100 1 0 11 0 33 2 0 11 0 119 1 1 0 0
                                    0 71 1 0 0 0 65 2 0 103 0 0 1 1 0 0 0 1 1 0
                                    181 0 1 1 0 0 0 38 2 0 20 0 0 1 2 0 20 0 0
                                    1 1 0 0 0 69 1 0 0 0 63 1 0 13 0 58 2 0 0 0
                                    13 56 2 0 8 11 13 132 1 0 0 0 1 1 0 0 0 1 0
                                    0 0 1 1 0 0 0 102 1 0 103 0 1 2 0 0 0 36 1
                                    2 0 0 0 119 1 1 0 165 0 166 1 0 161 0 162 1
                                    0 13 0 164 1 0 108 0 160 2 0 0 0 0 1 2 0 0
                                    0 0 92 1 0 103 0 104 2 0 108 0 119 167 3 0
                                    108 0 119 119 159 2 0 0 0 0 1 1 0 174 34 1
                                    1 0 20 0 1 0 0 36 67 1 2 36 36 89 1 0 20 0
                                    95 2 0 0 0 36 1 0 0 0 30 3 0 183 0 182 183
                                    1 1 0 119 119 120 1 0 8 119 124 0 0 8 123 0
                                    0 8 125 1 0 8 119 126 0 0 8 121 1 0 8 119
                                    122 1 0 13 0 53 2 0 20 0 0 1 1 0 20 0 94 2
                                    0 0 0 13 1 1 0 0 0 42 1 0 0 0 1 1 0 20 0 25
                                    2 0 176 34 0 1 2 0 0 0 0 1 0 3 0 1 2 0 0 0
                                    0 1 0 3 0 1 1 0 13 0 14 0 0 0 80 1 0 0 0 84
                                    0 0 0 82 1 0 0 0 85 1 0 0 0 72 1 0 103 0 1
                                    2 0 0 0 36 1 2 0 0 0 119 1 2 0 173 0 0 1 1
                                    0 0 34 1 2 0 0 0 0 1 1 0 11 0 1 1 0 0 0 106
                                    1 2 36 13 37 2 0 169 169 0 171 1 0 184 0 1
                                    0 0 127 128 2 0 175 175 175 1 2 0 0 0 0 1 1
                                    0 0 34 1 1 0 0 0 48 1 0 0 0 99 2 0 0 13 13
                                    96 3 0 0 13 13 36 98 1 0 181 0 1 2 0 178 0
                                    0 1 3 0 180 0 0 0 1 2 0 103 0 0 1 2 0 176
                                    34 0 1 1 0 13 0 16 0 0 0 88 1 0 0 0 68 1 0
                                    119 0 1 2 0 177 0 0 1 0 0 36 90 1 2 36 36
                                    91 2 0 0 0 119 1 1 0 0 0 105 1 2 36 13 41 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 70 1 0 0 0 64 1 0 151 0 152 1 0 153 0 154
                                    1 0 182 0 1 1 0 11 0 138 1 0 145 0 150 1 0
                                    0 153 158 2 0 0 0 0 1 1 0 140 0 142 1 0 0
                                    13 163 1 0 0 0 1 1 0 0 108 1 1 0 153 0 155
                                    1 1 0 108 1 0 0 119 1 1 0 0 0 101 0 0 36 49
                                    1 2 36 36 60 0 0 36 93 1 0 0 0 75 1 0 0 0
                                    40 2 0 0 0 0 47 3 0 0 0 0 0 1 2 0 20 0 0 1
                                    1 0 0 0 73 1 0 0 0 27 1 0 0 0 1 1 0 0 0 1 2
                                    0 0 0 0 1 2 0 20 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 74 1 0 0 0 43 1
                                    0 0 0 46 2 0 0 0 36 61 2 0 0 0 119 1 2 0 0
                                    0 13 97 2 0 0 0 108 115 2 0 0 0 0 107 0 0 0
                                    24 0 0 0 28 2 0 11 0 20 1 1 0 11 0 1 3 0 8
                                    9 0 20 21 2 0 8 9 0 1 2 0 0 0 119 1 1 0 0 0
                                    1 2 0 20 0 0 139 2 0 20 0 0 32 2 0 20 0 0
                                    29 2 0 20 0 0 1 2 0 20 0 0 45 2 0 0 0 0 39
                                    2 0 0 0 13 31 1 0 0 0 26 2 0 0 0 0 44 2 0 0
                                    0 0 55 2 0 0 36 0 59 2 0 0 0 0 54 2 0 0 13
                                    0 62 2 0 0 119 0 1 2 1 0 108 0 1 2 1 0 0
                                    108 1)))))
           '|lookupComplete|)) 
