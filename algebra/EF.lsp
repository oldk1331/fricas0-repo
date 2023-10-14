
(/VERSIONCHECK 2) 

(DEFUN |EF;pi;F;1| ($) (SPADCALL (SPADCALL (QREFELT $ 40)) (QREFELT $ 41))) 

(DEFUN |EF;pi;F;2| ($) (QREFELT $ 42)) 

(DEFUN |EF;pi;F;3| ($) (QREFELT $ 42)) 

(DEFUN |EF;iisqrt1| ($) (QREFELT $ 47)) 

(DEFUN |EF;iisqrt2;F;5| ($)
  (SPADCALL (SPADCALL (SPADCALL 2 (QREFELT $ 52)) (QREFELT $ 53))
            (QREFELT $ 41))) 

(DEFUN |EF;iisqrt3;F;6| ($)
  (SPADCALL (SPADCALL (SPADCALL 3 (QREFELT $ 52)) (QREFELT $ 53))
            (QREFELT $ 41))) 

(DEFUN |EF;iisqrt2;F;7| ($) (QREFELT $ 54)) 

(DEFUN |EF;iisqrt3;F;8| ($) (QREFELT $ 55)) 

(DEFUN |EF;iisqrt2;F;9| ($) (QREFELT $ 54)) 

(DEFUN |EF;iisqrt3;F;10| ($) (QREFELT $ 55)) 

(DEFUN |EF;ipi| (|l| $) (SPADCALL (QREFELT $ 45))) 

(DEFUN |EF;log;2F;12| (|x| $) (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 59))) 

(DEFUN |EF;exp;2F;13| (|x| $) (SPADCALL (QREFELT $ 15) |x| (QREFELT $ 59))) 

(DEFUN |EF;sin;2F;14| (|x| $) (SPADCALL (QREFELT $ 16) |x| (QREFELT $ 59))) 

(DEFUN |EF;cos;2F;15| (|x| $) (SPADCALL (QREFELT $ 17) |x| (QREFELT $ 59))) 

(DEFUN |EF;tan;2F;16| (|x| $) (SPADCALL (QREFELT $ 18) |x| (QREFELT $ 59))) 

(DEFUN |EF;cot;2F;17| (|x| $) (SPADCALL (QREFELT $ 19) |x| (QREFELT $ 59))) 

(DEFUN |EF;sec;2F;18| (|x| $) (SPADCALL (QREFELT $ 20) |x| (QREFELT $ 59))) 

(DEFUN |EF;csc;2F;19| (|x| $) (SPADCALL (QREFELT $ 21) |x| (QREFELT $ 59))) 

(DEFUN |EF;asin;2F;20| (|x| $) (SPADCALL (QREFELT $ 22) |x| (QREFELT $ 59))) 

(DEFUN |EF;acos;2F;21| (|x| $) (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 59))) 

(DEFUN |EF;atan;2F;22| (|x| $) (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 59))) 

(DEFUN |EF;acot;2F;23| (|x| $) (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 59))) 

(DEFUN |EF;asec;2F;24| (|x| $) (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 59))) 

(DEFUN |EF;acsc;2F;25| (|x| $) (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 59))) 

(DEFUN |EF;sinh;2F;26| (|x| $) (SPADCALL (QREFELT $ 28) |x| (QREFELT $ 59))) 

(DEFUN |EF;cosh;2F;27| (|x| $) (SPADCALL (QREFELT $ 29) |x| (QREFELT $ 59))) 

(DEFUN |EF;tanh;2F;28| (|x| $) (SPADCALL (QREFELT $ 30) |x| (QREFELT $ 59))) 

(DEFUN |EF;coth;2F;29| (|x| $) (SPADCALL (QREFELT $ 31) |x| (QREFELT $ 59))) 

(DEFUN |EF;sech;2F;30| (|x| $) (SPADCALL (QREFELT $ 32) |x| (QREFELT $ 59))) 

(DEFUN |EF;csch;2F;31| (|x| $) (SPADCALL (QREFELT $ 33) |x| (QREFELT $ 59))) 

(DEFUN |EF;asinh;2F;32| (|x| $) (SPADCALL (QREFELT $ 34) |x| (QREFELT $ 59))) 

(DEFUN |EF;acosh;2F;33| (|x| $) (SPADCALL (QREFELT $ 35) |x| (QREFELT $ 59))) 

(DEFUN |EF;atanh;2F;34| (|x| $) (SPADCALL (QREFELT $ 36) |x| (QREFELT $ 59))) 

(DEFUN |EF;acoth;2F;35| (|x| $) (SPADCALL (QREFELT $ 37) |x| (QREFELT $ 59))) 

(DEFUN |EF;asech;2F;36| (|x| $) (SPADCALL (QREFELT $ 38) |x| (QREFELT $ 59))) 

(DEFUN |EF;acsch;2F;37| (|x| $) (SPADCALL (QREFELT $ 39) |x| (QREFELT $ 59))) 

(DEFUN |EF;kernel| (|x| $) (SPADCALL |x| (QREFELT $ 87))) 

(DEFUN |EF;posrem| (|n| |m| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (REM |n| |m|) |EF;posrem|)
          (EXIT (COND ((< |r| 0) (+ |r| |m|)) ('T |r|))))))) 

(DEFUN |EF;valueOrPole| (|rec| $)
  (COND ((QCDR |rec|) (|error| "Invalid argument")) ('T (QCAR |rec|)))) 

(DEFUN |EF;belong?;BoB;41| (|op| $)
  (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 91))) 

(DEFUN |EF;operator;2Bo;42| (|op| $)
  (COND ((SPADCALL |op| '|pi| (QREFELT $ 93)) (QREFELT $ 13))
        ((SPADCALL |op| '|log| (QREFELT $ 93)) (QREFELT $ 14))
        ((SPADCALL |op| '|exp| (QREFELT $ 93)) (QREFELT $ 15))
        ((SPADCALL |op| '|sin| (QREFELT $ 93)) (QREFELT $ 16))
        ((SPADCALL |op| '|cos| (QREFELT $ 93)) (QREFELT $ 17))
        ((SPADCALL |op| '|tan| (QREFELT $ 93)) (QREFELT $ 18))
        ((SPADCALL |op| '|cot| (QREFELT $ 93)) (QREFELT $ 19))
        ((SPADCALL |op| '|sec| (QREFELT $ 93)) (QREFELT $ 20))
        ((SPADCALL |op| '|csc| (QREFELT $ 93)) (QREFELT $ 21))
        ((SPADCALL |op| '|asin| (QREFELT $ 93)) (QREFELT $ 22))
        ((SPADCALL |op| '|acos| (QREFELT $ 93)) (QREFELT $ 23))
        ((SPADCALL |op| '|atan| (QREFELT $ 93)) (QREFELT $ 24))
        ((SPADCALL |op| '|acot| (QREFELT $ 93)) (QREFELT $ 25))
        ((SPADCALL |op| '|asec| (QREFELT $ 93)) (QREFELT $ 26))
        ((SPADCALL |op| '|acsc| (QREFELT $ 93)) (QREFELT $ 27))
        ((SPADCALL |op| '|sinh| (QREFELT $ 93)) (QREFELT $ 28))
        ((SPADCALL |op| '|cosh| (QREFELT $ 93)) (QREFELT $ 29))
        ((SPADCALL |op| '|tanh| (QREFELT $ 93)) (QREFELT $ 30))
        ((SPADCALL |op| '|coth| (QREFELT $ 93)) (QREFELT $ 31))
        ((SPADCALL |op| '|sech| (QREFELT $ 93)) (QREFELT $ 32))
        ((SPADCALL |op| '|csch| (QREFELT $ 93)) (QREFELT $ 33))
        ((SPADCALL |op| '|asinh| (QREFELT $ 93)) (QREFELT $ 34))
        ((SPADCALL |op| '|acosh| (QREFELT $ 93)) (QREFELT $ 35))
        ((SPADCALL |op| '|atanh| (QREFELT $ 93)) (QREFELT $ 36))
        ((SPADCALL |op| '|acoth| (QREFELT $ 93)) (QREFELT $ 37))
        ((SPADCALL |op| '|asech| (QREFELT $ 93)) (QREFELT $ 38))
        ((SPADCALL |op| '|acsch| (QREFELT $ 93)) (QREFELT $ 39))
        ('T (|error| "Not an elementary operator")))) 

(DEFUN |EF;dropfun| (|x| $)
  (PROG (#1=#:G348 |k|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |k| (SPADCALL |x| (QREFELT $ 96)) . #2=(|EF;dropfun|))
             (EXIT
              (COND
               ((OR (QEQCAR |k| 1) (NULL (SPADCALL (QCDR |k|) (QREFELT $ 99))))
                (PROGN (LETT #1# (|spadConstant| $ 89) . #2#) (GO #1#))))))
        (EXIT (|SPADfirst| (SPADCALL (QCDR |k|) (QREFELT $ 99))))))
      #1# (EXIT #1#))))) 

(DEFUN |EF;specialTrigs;FLU;44| (|x| |values| $)
  (PROG (|s| |n| |m| |q| |r| |y|)
    (RETURN
     (SEQ
      (LETT |r|
            (SPADCALL
             (LETT |y| (SPADCALL |x| (SPADCALL (QREFELT $ 45)) (QREFELT $ 100))
                   . #1=(|EF;specialTrigs;FLU;44|))
             (QREFELT $ 102))
            . #1#)
      (EXIT
       (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ (LETT |q| (QCDR |r|) . #1#)
                   (LETT |m| (SPADCALL |values| (QREFELT $ 105)) . #1#)
                   (LETT |n| (SPADCALL |q| (QREFELT $ 108)) . #1#)
                   (EXIT
                    (COND
                     ((QEQCAR |n| 0)
                      (COND
                       ((SPADCALL (QCDR |n|) (QREFELT $ 109))
                        (CONS 0
                              (|EF;valueOrPole|
                               (SPADCALL |values| |m| (QREFELT $ 110)) $)))
                       (#2#
                        (CONS 0
                              (|EF;valueOrPole|
                               (SPADCALL |values| (+ |m| 1) (QREFELT $ 110))
                               $)))))
                     (#2#
                      (SEQ
                       (LETT |n|
                             (SPADCALL (SPADCALL 2 |q| (QREFELT $ 113))
                                       (QREFELT $ 108))
                             . #1#)
                       (EXIT
                        (COND
                         ((QEQCAR |n| 0)
                          (SEQ (LETT |s| (|EF;posrem| (QCDR |n|) 4 $) . #1#)
                               (EXIT
                                (COND
                                 ((EQL |s| 1)
                                  (CONS 0
                                        (|EF;valueOrPole|
                                         (SPADCALL |values| (+ |m| 2)
                                                   (QREFELT $ 110))
                                         $)))
                                 (#2#
                                  (CONS 0
                                        (|EF;valueOrPole|
                                         (SPADCALL |values| (+ |m| 3)
                                                   (QREFELT $ 110))
                                         $)))))))
                         (#2#
                          (SEQ
                           (LETT |n|
                                 (SPADCALL (SPADCALL 3 |q| (QREFELT $ 113))
                                           (QREFELT $ 108))
                                 . #1#)
                           (EXIT
                            (COND
                             ((QEQCAR |n| 0)
                              (SEQ
                               (LETT |s| (|EF;posrem| (QCDR |n|) 6 $) . #1#)
                               (EXIT
                                (COND
                                 ((EQL |s| 1)
                                  (CONS 0
                                        (|EF;valueOrPole|
                                         (SPADCALL |values| (+ |m| 4)
                                                   (QREFELT $ 110))
                                         $)))
                                 ((EQL |s| 2)
                                  (CONS 0
                                        (|EF;valueOrPole|
                                         (SPADCALL |values| (+ |m| 5)
                                                   (QREFELT $ 110))
                                         $)))
                                 ((EQL |s| 4)
                                  (CONS 0
                                        (|EF;valueOrPole|
                                         (SPADCALL |values| (+ |m| 6)
                                                   (QREFELT $ 110))
                                         $)))
                                 (#2#
                                  (CONS 0
                                        (|EF;valueOrPole|
                                         (SPADCALL |values| (+ |m| 7)
                                                   (QREFELT $ 110))
                                         $)))))))
                             (#2#
                              (SEQ
                               (LETT |n|
                                     (SPADCALL (SPADCALL 4 |q| (QREFELT $ 113))
                                               (QREFELT $ 108))
                                     . #1#)
                               (EXIT
                                (COND
                                 ((QEQCAR |n| 0)
                                  (SEQ
                                   (LETT |s| (|EF;posrem| (QCDR |n|) 8 $)
                                         . #1#)
                                   (EXIT
                                    (COND
                                     ((EQL |s| 1)
                                      (CONS 0
                                            (|EF;valueOrPole|
                                             (SPADCALL |values| (+ |m| 8)
                                                       (QREFELT $ 110))
                                             $)))
                                     ((EQL |s| 3)
                                      (CONS 0
                                            (|EF;valueOrPole|
                                             (SPADCALL |values| (+ |m| 9)
                                                       (QREFELT $ 110))
                                             $)))
                                     ((EQL |s| 5)
                                      (CONS 0
                                            (|EF;valueOrPole|
                                             (SPADCALL |values| (+ |m| 10)
                                                       (QREFELT $ 110))
                                             $)))
                                     (#2#
                                      (CONS 0
                                            (|EF;valueOrPole|
                                             (SPADCALL |values| (+ |m| 11)
                                                       (QREFELT $ 110))
                                             $)))))))
                                 (#2#
                                  (SEQ
                                   (LETT |n|
                                         (SPADCALL
                                          (SPADCALL 6 |q| (QREFELT $ 113))
                                          (QREFELT $ 108))
                                         . #1#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |n| 0)
                                      (SEQ
                                       (LETT |s| (|EF;posrem| (QCDR |n|) 12 $)
                                             . #1#)
                                       (EXIT
                                        (COND
                                         ((EQL |s| 1)
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 12)
                                                           (QREFELT $ 110))
                                                 $)))
                                         ((EQL |s| 5)
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 13)
                                                           (QREFELT $ 110))
                                                 $)))
                                         ((EQL |s| 7)
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 14)
                                                           (QREFELT $ 110))
                                                 $)))
                                         (#2#
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 15)
                                                           (QREFELT $ 110))
                                                 $)))))))
                                     (#2#
                                      (CONS 1
                                            "failed")))))))))))))))))))))))))))) 

(PUT '|EF;specialTrigs;FLU;45| '|SPADreplace|
     '(XLAM (|x| |values|) (CONS 1 "failed"))) 

(DEFUN |EF;specialTrigs;FLU;45| (|x| |values| $) (CONS 1 "failed")) 

(DEFUN |EF;isin| (|x| $)
  (PROG (|u| |s3| |s2| |h| |y|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 89))
            (#1='T
             (SEQ (LETT |y| (|EF;dropfun| |x| $) . #2=(|EF;isin|))
                  (EXIT
                   (COND ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 117)) |y|)
                         ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 48)
                                     (SPADCALL |y| 2 (QREFELT $ 118))
                                     (QREFELT $ 119))
                           (QREFELT $ 50)))
                         ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 117))
                          (SPADCALL |y|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 48)
                                               (SPADCALL |y| 2 (QREFELT $ 118))
                                               (QREFELT $ 120))
                                     (QREFELT $ 50))
                                    (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 48)
                                      (SPADCALL |y| 2 (QREFELT $ 118))
                                      (QREFELT $ 120))
                            (QREFELT $ 50))
                           (QREFELT $ 121)))
                         ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                      (|spadConstant| $ 48) (QREFELT $ 119))
                            (QREFELT $ 50))
                           |y| (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 117))
                          (SPADCALL |y| (QREFELT $ 121)))
                         (#1#
                          (SEQ
                           (LETT |h|
                                 (SPADCALL (SPADCALL 2 (QREFELT $ 56))
                                           (QREFELT $ 121))
                                 . #2#)
                           (LETT |s2|
                                 (SPADCALL |h| (SPADCALL (QREFELT $ 57))
                                           (QREFELT $ 122))
                                 . #2#)
                           (LETT |s3|
                                 (SPADCALL |h| (SPADCALL (QREFELT $ 58))
                                           (QREFELT $ 122))
                                 . #2#)
                           (LETT |u|
                                 (SPADCALL |x|
                                           (LIST
                                            (CONS (|spadConstant| $ 89) 'NIL)
                                            (CONS (|spadConstant| $ 89) 'NIL)
                                            (CONS (|spadConstant| $ 48) 'NIL)
                                            (CONS
                                             (SPADCALL (|spadConstant| $ 48)
                                                       (QREFELT $ 49))
                                             'NIL)
                                            (CONS |s3| 'NIL) (CONS |s3| 'NIL)
                                            (CONS
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             'NIL)
                                            (CONS
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             'NIL)
                                            (CONS |s2| 'NIL) (CONS |s2| 'NIL)
                                            (CONS
                                             (SPADCALL |s2| (QREFELT $ 49))
                                             'NIL)
                                            (CONS
                                             (SPADCALL |s2| (QREFELT $ 49))
                                             'NIL)
                                            (CONS |h| 'NIL) (CONS |h| 'NIL)
                                            (CONS (SPADCALL |h| (QREFELT $ 49))
                                                  'NIL)
                                            (CONS (SPADCALL |h| (QREFELT $ 49))
                                                  'NIL))
                                           (QREFELT $ 115))
                                 . #2#)
                           (EXIT
                            (COND ((QEQCAR |u| 0) (QCDR |u|))
                                  (#1#
                                   (SPADCALL (QREFELT $ 16) |x|
                                             (QREFELT $ 123)))))))))))))))) 

(DEFUN |EF;icos| (|x| $)
  (PROG (|u| |s3| |s2| |h| |y|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 48))
            (#1='T
             (SEQ (LETT |y| (|EF;dropfun| |x| $) . #2=(|EF;icos|))
                  (EXIT
                   (COND
                    ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 48)
                                (SPADCALL |y| 2 (QREFELT $ 118))
                                (QREFELT $ 119))
                      (QREFELT $ 50)))
                    ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 117)) |y|)
                    ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 48)
                                 (SPADCALL |y| 2 (QREFELT $ 118))
                                 (QREFELT $ 120))
                       (QREFELT $ 50))
                      (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 117))
                     (SPADCALL |y|
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 48)
                                          (SPADCALL |y| 2 (QREFELT $ 118))
                                          (QREFELT $ 120))
                                (QREFELT $ 50))
                               (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 117))
                     (SPADCALL |y| (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                 (|spadConstant| $ 48) (QREFELT $ 119))
                       (QREFELT $ 50))
                      |y| (QREFELT $ 100)))
                    (#1#
                     (SEQ
                      (LETT |h|
                            (SPADCALL (SPADCALL 2 (QREFELT $ 56))
                                      (QREFELT $ 121))
                            . #2#)
                      (LETT |s2|
                            (SPADCALL |h| (SPADCALL (QREFELT $ 57))
                                      (QREFELT $ 122))
                            . #2#)
                      (LETT |s3|
                            (SPADCALL |h| (SPADCALL (QREFELT $ 58))
                                      (QREFELT $ 122))
                            . #2#)
                      (LETT |u|
                            (SPADCALL |x|
                                      (LIST (CONS (|spadConstant| $ 48) 'NIL)
                                            (CONS
                                             (SPADCALL (|spadConstant| $ 48)
                                                       (QREFELT $ 49))
                                             'NIL)
                                            (CONS (|spadConstant| $ 89) 'NIL)
                                            (CONS (|spadConstant| $ 89) 'NIL)
                                            (CONS |h| 'NIL)
                                            (CONS (SPADCALL |h| (QREFELT $ 49))
                                                  'NIL)
                                            (CONS (SPADCALL |h| (QREFELT $ 49))
                                                  'NIL)
                                            (CONS |h| 'NIL) (CONS |s2| 'NIL)
                                            (CONS
                                             (SPADCALL |s2| (QREFELT $ 49))
                                             'NIL)
                                            (CONS
                                             (SPADCALL |s2| (QREFELT $ 49))
                                             'NIL)
                                            (CONS |s2| 'NIL) (CONS |s3| 'NIL)
                                            (CONS
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             'NIL)
                                            (CONS
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             'NIL)
                                            (CONS |s3| 'NIL))
                                      (QREFELT $ 115))
                            . #2#)
                      (EXIT
                       (COND ((QEQCAR |u| 0) (QCDR |u|))
                             (#1#
                              (SPADCALL (QREFELT $ 17) |x|
                                        (QREFELT $ 123)))))))))))))))) 

(DEFUN |EF;itan| (|x| $)
  (PROG (|u| |s33| |s3| |y|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 89))
            (#1='T
             (SEQ (LETT |y| (|EF;dropfun| |x| $) . #2=(|EF;itan|))
                  (EXIT
                   (COND
                    ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 117))
                     (SPADCALL |y|
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 48)
                                          (SPADCALL |y| 2 (QREFELT $ 118))
                                          (QREFELT $ 119))
                                (QREFELT $ 50))
                               (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 48)
                                 (SPADCALL |y| 2 (QREFELT $ 118))
                                 (QREFELT $ 119))
                       (QREFELT $ 50))
                      |y| (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 117)) |y|)
                    ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 117))
                     (SPADCALL |y| (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                (|spadConstant| $ 48) (QREFELT $ 119))
                      (QREFELT $ 50)))
                    ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                 (|spadConstant| $ 48) (QREFELT $ 119))
                       (QREFELT $ 50))
                      (QREFELT $ 121)))
                    (#1#
                     (SEQ
                      (LETT |s33|
                            (SPADCALL
                             (LETT |s3| (SPADCALL (QREFELT $ 58)) . #2#)
                             (SPADCALL 3 (QREFELT $ 56)) (QREFELT $ 100))
                            . #2#)
                      (LETT |u|
                            (SPADCALL |x|
                                      (LIST (CONS (|spadConstant| $ 89) 'NIL)
                                            (CONS (|spadConstant| $ 89) 'NIL)
                                            (CONS (|spadConstant| $ 89) 'T)
                                            (CONS (|spadConstant| $ 89) 'T)
                                            (CONS |s3| 'NIL)
                                            (CONS
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             'NIL)
                                            (CONS |s3| 'NIL)
                                            (CONS
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             'NIL)
                                            (CONS (|spadConstant| $ 48) 'NIL)
                                            (CONS
                                             (SPADCALL (|spadConstant| $ 48)
                                                       (QREFELT $ 49))
                                             'NIL)
                                            (CONS (|spadConstant| $ 48) 'NIL)
                                            (CONS
                                             (SPADCALL (|spadConstant| $ 48)
                                                       (QREFELT $ 49))
                                             'NIL)
                                            (CONS |s33| 'NIL)
                                            (CONS
                                             (SPADCALL |s33| (QREFELT $ 49))
                                             'NIL)
                                            (CONS |s33| 'NIL)
                                            (CONS
                                             (SPADCALL |s33| (QREFELT $ 49))
                                             'NIL))
                                      (QREFELT $ 115))
                            . #2#)
                      (EXIT
                       (COND ((QEQCAR |u| 0) (QCDR |u|))
                             (#1#
                              (SPADCALL (QREFELT $ 18) |x|
                                        (QREFELT $ 123)))))))))))))))) 

(DEFUN |EF;icot| (|x| $)
  (PROG (|u| |s33| |s3| |y|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
            (#1='T
             (SEQ (LETT |y| (|EF;dropfun| |x| $) . #2=(|EF;icot|))
                  (EXIT
                   (COND
                    ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 48)
                                 (SPADCALL |y| 2 (QREFELT $ 118))
                                 (QREFELT $ 119))
                       (QREFELT $ 50))
                      |y| (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 117))
                     (SPADCALL |y|
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 48)
                                          (SPADCALL |y| 2 (QREFELT $ 118))
                                          (QREFELT $ 119))
                                (QREFELT $ 50))
                               (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 117))
                     (SPADCALL |y| (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 117)) |y|)
                    ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                 (|spadConstant| $ 48) (QREFELT $ 119))
                       (QREFELT $ 50))
                      (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                (|spadConstant| $ 48) (QREFELT $ 119))
                      (QREFELT $ 50)))
                    (#1#
                     (SEQ
                      (LETT |s33|
                            (SPADCALL
                             (LETT |s3| (SPADCALL (QREFELT $ 58)) . #2#)
                             (SPADCALL 3 (QREFELT $ 56)) (QREFELT $ 100))
                            . #2#)
                      (LETT |u|
                            (SPADCALL |x|
                                      (LIST (CONS (|spadConstant| $ 89) 'T)
                                            (CONS (|spadConstant| $ 89) 'T)
                                            (CONS (|spadConstant| $ 89) 'NIL)
                                            (CONS (|spadConstant| $ 89) 'NIL)
                                            (CONS |s33| 'NIL)
                                            (CONS
                                             (SPADCALL |s33| (QREFELT $ 49))
                                             'NIL)
                                            (CONS |s33| 'NIL)
                                            (CONS
                                             (SPADCALL |s33| (QREFELT $ 49))
                                             'NIL)
                                            (CONS (|spadConstant| $ 48) 'NIL)
                                            (CONS
                                             (SPADCALL (|spadConstant| $ 48)
                                                       (QREFELT $ 49))
                                             'NIL)
                                            (CONS (|spadConstant| $ 48) 'NIL)
                                            (CONS
                                             (SPADCALL (|spadConstant| $ 48)
                                                       (QREFELT $ 49))
                                             'NIL)
                                            (CONS |s3| 'NIL)
                                            (CONS
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             'NIL)
                                            (CONS |s3| 'NIL)
                                            (CONS
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             'NIL))
                                      (QREFELT $ 115))
                            . #2#)
                      (EXIT
                       (COND ((QEQCAR |u| 0) (QCDR |u|))
                             (#1#
                              (SPADCALL (QREFELT $ 19) |x|
                                        (QREFELT $ 123)))))))))))))))) 

(DEFUN |EF;isec| (|x| $)
  (PROG (|u| |h| |s3| |s2| |y|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 48))
            (#1='T
             (SEQ (LETT |y| (|EF;dropfun| |x| $) . #2=(|EF;isec|))
                  (EXIT
                   (COND
                    ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 48)
                                 (SPADCALL |y| 2 (QREFELT $ 118))
                                 (QREFELT $ 119))
                       (QREFELT $ 50))
                      (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 117))
                     (SPADCALL |y| (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 48)
                                (SPADCALL |y| 2 (QREFELT $ 118))
                                (QREFELT $ 120))
                      (QREFELT $ 50)))
                    ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 48)
                                 (SPADCALL |y| 2 (QREFELT $ 118))
                                 (QREFELT $ 120))
                       (QREFELT $ 50))
                      |y| (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 117)) |y|)
                    ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 117))
                     (SPADCALL |y|
                               (SPADCALL
                                (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                          (|spadConstant| $ 48)
                                          (QREFELT $ 119))
                                (QREFELT $ 50))
                               (QREFELT $ 100)))
                    (#1#
                     (SEQ (LETT |s2| (SPADCALL (QREFELT $ 57)) . #2#)
                          (LETT |s3|
                                (SPADCALL
                                 (SPADCALL 2 (SPADCALL (QREFELT $ 58))
                                           (QREFELT $ 124))
                                 (SPADCALL 3 (QREFELT $ 56)) (QREFELT $ 100))
                                . #2#)
                          (LETT |h| (SPADCALL 2 (QREFELT $ 56)) . #2#)
                          (LETT |u|
                                (SPADCALL |x|
                                          (LIST
                                           (CONS (|spadConstant| $ 48) 'NIL)
                                           (CONS
                                            (SPADCALL (|spadConstant| $ 48)
                                                      (QREFELT $ 49))
                                            'NIL)
                                           (CONS (|spadConstant| $ 89) 'T)
                                           (CONS (|spadConstant| $ 89) 'T)
                                           (CONS |h| 'NIL)
                                           (CONS (SPADCALL |h| (QREFELT $ 49))
                                                 'NIL)
                                           (CONS (SPADCALL |h| (QREFELT $ 49))
                                                 'NIL)
                                           (CONS |h| 'NIL) (CONS |s2| 'NIL)
                                           (CONS (SPADCALL |s2| (QREFELT $ 49))
                                                 'NIL)
                                           (CONS (SPADCALL |s2| (QREFELT $ 49))
                                                 'NIL)
                                           (CONS |s2| 'NIL) (CONS |s3| 'NIL)
                                           (CONS (SPADCALL |s3| (QREFELT $ 49))
                                                 'NIL)
                                           (CONS (SPADCALL |s3| (QREFELT $ 49))
                                                 'NIL)
                                           (CONS |s3| 'NIL))
                                          (QREFELT $ 115))
                                . #2#)
                          (EXIT
                           (COND ((QEQCAR |u| 0) (QCDR |u|))
                                 (#1#
                                  (SPADCALL (QREFELT $ 20) |x|
                                            (QREFELT $ 123)))))))))))))))) 

(DEFUN |EF;icsc| (|x| $)
  (PROG (|u| |h| |s3| |s2| |y|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
            (#1='T
             (SEQ (LETT |y| (|EF;dropfun| |x| $) . #2=(|EF;icsc|))
                  (EXIT
                   (COND
                    ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 117))
                     (SPADCALL |y| (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 48)
                                 (SPADCALL |y| 2 (QREFELT $ 118))
                                 (QREFELT $ 119))
                       (QREFELT $ 50))
                      (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 48)
                                 (SPADCALL |y| 2 (QREFELT $ 118))
                                 (QREFELT $ 120))
                       (QREFELT $ 50))
                      |y| (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 48)
                                (SPADCALL |y| 2 (QREFELT $ 118))
                                (QREFELT $ 120))
                      (QREFELT $ 50)))
                    ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 117))
                     (SPADCALL |y|
                               (SPADCALL
                                (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                          (|spadConstant| $ 48)
                                          (QREFELT $ 119))
                                (QREFELT $ 50))
                               (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 117)) |y|)
                    (#1#
                     (SEQ (LETT |s2| (SPADCALL (QREFELT $ 57)) . #2#)
                          (LETT |s3|
                                (SPADCALL
                                 (SPADCALL 2 (SPADCALL (QREFELT $ 58))
                                           (QREFELT $ 124))
                                 (SPADCALL 3 (QREFELT $ 56)) (QREFELT $ 100))
                                . #2#)
                          (LETT |h| (SPADCALL 2 (QREFELT $ 56)) . #2#)
                          (LETT |u|
                                (SPADCALL |x|
                                          (LIST (CONS (|spadConstant| $ 89) 'T)
                                                (CONS (|spadConstant| $ 89) 'T)
                                                (CONS (|spadConstant| $ 48)
                                                      'NIL)
                                                (CONS
                                                 (SPADCALL
                                                  (|spadConstant| $ 48)
                                                  (QREFELT $ 49))
                                                 'NIL)
                                                (CONS |s3| 'NIL)
                                                (CONS |s3| 'NIL)
                                                (CONS
                                                 (SPADCALL |s3| (QREFELT $ 49))
                                                 'NIL)
                                                (CONS
                                                 (SPADCALL |s3| (QREFELT $ 49))
                                                 'NIL)
                                                (CONS |s2| 'NIL)
                                                (CONS |s2| 'NIL)
                                                (CONS
                                                 (SPADCALL |s2| (QREFELT $ 49))
                                                 'NIL)
                                                (CONS
                                                 (SPADCALL |s2| (QREFELT $ 49))
                                                 'NIL)
                                                (CONS |h| 'NIL) (CONS |h| 'NIL)
                                                (CONS
                                                 (SPADCALL |h| (QREFELT $ 49))
                                                 'NIL)
                                                (CONS
                                                 (SPADCALL |h| (QREFELT $ 49))
                                                 'NIL))
                                          (QREFELT $ 115))
                                . #2#)
                          (EXIT
                           (COND ((QEQCAR |u| 0) (QCDR |u|))
                                 (#1#
                                  (SPADCALL (QREFELT $ 21) |x|
                                            (QREFELT $ 123)))))))))))))))) 

(DEFUN |EF;iasin| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 89))
        ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125))
         (SPADCALL (SPADCALL (QREFELT $ 45)) (SPADCALL 2 (QREFELT $ 56))
                   (QREFELT $ 100)))
        (#1='T
         (COND
          ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                     (QREFELT $ 125))
           (SPADCALL
            (SPADCALL (SPADCALL (QREFELT $ 45)) (SPADCALL 2 (QREFELT $ 56))
                      (QREFELT $ 100))
            (QREFELT $ 49)))
          (#1# (SPADCALL (QREFELT $ 22) |x| (QREFELT $ 123))))))) 

(DEFUN |EF;iacos| (|x| $)
  (COND
   ((SPADCALL |x| (QREFELT $ 116))
    (SPADCALL (SPADCALL (QREFELT $ 45)) (SPADCALL 2 (QREFELT $ 56))
              (QREFELT $ 100)))
   ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125)) (|spadConstant| $ 89))
   (#1='T
    (COND
     ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                (QREFELT $ 125))
      (SPADCALL (QREFELT $ 45)))
     (#1# (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 123))))))) 

(DEFUN |EF;iatan| (|x| $)
  (PROG (|r3|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 89))
            ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125))
             (SPADCALL (SPADCALL (QREFELT $ 45)) (SPADCALL 4 (QREFELT $ 56))
                       (QREFELT $ 100)))
            (#1='T
             (COND
              ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                         (QREFELT $ 125))
               (SPADCALL
                (SPADCALL (SPADCALL (QREFELT $ 45)) (SPADCALL 4 (QREFELT $ 56))
                          (QREFELT $ 100))
                (QREFELT $ 49)))
              (#1#
               (SEQ (LETT |r3| (SPADCALL (QREFELT $ 58)) |EF;iatan|)
                    (EXIT
                     (COND
                      ((SPADCALL |x| |r3| (QREFELT $ 125))
                       (SPADCALL (SPADCALL (QREFELT $ 45))
                                 (SPADCALL 3 (QREFELT $ 56)) (QREFELT $ 100)))
                      ((SPADCALL (SPADCALL |x| |r3| (QREFELT $ 122))
                                 (|spadConstant| $ 48) (QREFELT $ 125))
                       (SPADCALL (SPADCALL (QREFELT $ 45))
                                 (SPADCALL 6 (QREFELT $ 56)) (QREFELT $ 100)))
                      (#1#
                       (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 123)))))))))))))) 

(DEFUN |EF;iacot| (|x| $)
  (PROG (|xx| |r3|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (QREFELT $ 116))
        (SPADCALL (SPADCALL (QREFELT $ 45)) (SPADCALL 2 (QREFELT $ 56))
                  (QREFELT $ 100)))
       ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125))
        (SPADCALL (SPADCALL (QREFELT $ 45)) (SPADCALL 4 (QREFELT $ 56))
                  (QREFELT $ 100)))
       (#1='T
        (COND
         ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                    (QREFELT $ 125))
          (SPADCALL (SPADCALL 3 (SPADCALL (QREFELT $ 45)) (QREFELT $ 124))
                    (SPADCALL 4 (QREFELT $ 56)) (QREFELT $ 100)))
         (#1#
          (SEQ (LETT |r3| (SPADCALL (QREFELT $ 58)) . #2=(|EF;iacot|))
               (EXIT
                (COND
                 ((SPADCALL |x| |r3| (QREFELT $ 125))
                  (SPADCALL (SPADCALL (QREFELT $ 45))
                            (SPADCALL 6 (QREFELT $ 56)) (QREFELT $ 100)))
                 ((SPADCALL |x| (SPADCALL |r3| (QREFELT $ 49)) (QREFELT $ 125))
                  (SPADCALL
                   (SPADCALL 5 (SPADCALL (QREFELT $ 45)) (QREFELT $ 124))
                   (SPADCALL 6 (QREFELT $ 56)) (QREFELT $ 100)))
                 (#1#
                  (SEQ (LETT |xx| (SPADCALL |x| |r3| (QREFELT $ 122)) . #2#)
                       (EXIT
                        (COND
                         ((SPADCALL |xx| (|spadConstant| $ 48) (QREFELT $ 125))
                          (SPADCALL (SPADCALL (QREFELT $ 45))
                                    (SPADCALL 3 (QREFELT $ 56))
                                    (QREFELT $ 100)))
                         ((SPADCALL |xx|
                                    (SPADCALL (|spadConstant| $ 48)
                                              (QREFELT $ 49))
                                    (QREFELT $ 125))
                          (SPADCALL
                           (SPADCALL 2 (SPADCALL (QREFELT $ 45))
                                     (QREFELT $ 124))
                           (SPADCALL 3 (QREFELT $ 56)) (QREFELT $ 100)))
                         (#1#
                          (SPADCALL (QREFELT $ 25) |x|
                                    (QREFELT $ 123)))))))))))))))))) 

(DEFUN |EF;iasec| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
        ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125))
         (|spadConstant| $ 89))
        (#1='T
         (COND
          ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                     (QREFELT $ 125))
           (SPADCALL (QREFELT $ 45)))
          (#1# (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 123))))))) 

(DEFUN |EF;iacsc| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
        ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125))
         (SPADCALL (SPADCALL (QREFELT $ 45)) (SPADCALL 2 (QREFELT $ 56))
                   (QREFELT $ 100)))
        (#1='T
         (COND
          ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                     (QREFELT $ 125))
           (SPADCALL
            (SPADCALL (SPADCALL (QREFELT $ 45)) (SPADCALL 2 (QREFELT $ 56))
                      (QREFELT $ 100))
            (QREFELT $ 49)))
          (#1# (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 123))))))) 

(DEFUN |EF;isinh| (|x| $)
  (PROG (|y|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 89))
            (#1='T
             (SEQ (LETT |y| (|EF;dropfun| |x| $) |EF;isinh|)
                  (EXIT
                   (COND ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 117)) |y|)
                         ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                     (|spadConstant| $ 48) (QREFELT $ 119))
                           (QREFELT $ 50)))
                         ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 117))
                          (SPADCALL |y|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 48)
                                               (SPADCALL |y| 2 (QREFELT $ 118))
                                               (QREFELT $ 119))
                                     (QREFELT $ 50))
                                    (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                       (|spadConstant| $ 48) (QREFELT $ 119))
                             (QREFELT $ 50))
                            (QREFELT $ 121))
                           (QREFELT $ 49)))
                         ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 48)
                                      (SPADCALL |y| 2 (QREFELT $ 118))
                                      (QREFELT $ 119))
                            (QREFELT $ 50))
                           |y| (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 117))
                          (SPADCALL |y| (QREFELT $ 121)))
                         (#1#
                          (SPADCALL (QREFELT $ 28) |x|
                                    (QREFELT $ 123)))))))))))) 

(DEFUN |EF;icosh| (|x| $)
  (PROG (|y|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 48))
            (#1='T
             (SEQ (LETT |y| (|EF;dropfun| |x| $) |EF;icosh|)
                  (EXIT
                   (COND
                    ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                (|spadConstant| $ 48) (QREFELT $ 120))
                      (QREFELT $ 50)))
                    ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 117)) |y|)
                    ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 48)
                                 (SPADCALL |y| 2 (QREFELT $ 118))
                                 (QREFELT $ 119))
                       (QREFELT $ 50))
                      (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 117))
                     (SPADCALL |y|
                               (SPADCALL
                                (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                          (|spadConstant| $ 48)
                                          (QREFELT $ 119))
                                (QREFELT $ 50))
                               (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 117))
                     (SPADCALL |y| (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                 (|spadConstant| $ 48) (QREFELT $ 120))
                       (QREFELT $ 50))
                      |y| (QREFELT $ 100)))
                    (#1# (SPADCALL (QREFELT $ 29) |x| (QREFELT $ 123)))))))))))) 

(DEFUN |EF;itanh| (|x| $)
  (PROG (|y|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 89))
            (#1='T
             (SEQ (LETT |y| (|EF;dropfun| |x| $) |EF;itanh|)
                  (EXIT
                   (COND
                    ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 117))
                     (SPADCALL |y|
                               (SPADCALL
                                (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                          (|spadConstant| $ 48)
                                          (QREFELT $ 120))
                                (QREFELT $ 50))
                               (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                 (|spadConstant| $ 48) (QREFELT $ 119))
                       (QREFELT $ 50))
                      |y| (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 117)) |y|)
                    ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 117))
                     (SPADCALL |y| (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 48)
                                (SPADCALL |y| 2 (QREFELT $ 118))
                                (QREFELT $ 119))
                      (QREFELT $ 50)))
                    ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                 (|spadConstant| $ 48) (QREFELT $ 120))
                       (QREFELT $ 50))
                      (QREFELT $ 121)))
                    (#1# (SPADCALL (QREFELT $ 30) |x| (QREFELT $ 123)))))))))))) 

(DEFUN |EF;icoth| (|x| $)
  (PROG (|y|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
            (#1='T
             (SEQ (LETT |y| (|EF;dropfun| |x| $) |EF;icoth|)
                  (EXIT
                   (COND
                    ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                 (|spadConstant| $ 48) (QREFELT $ 120))
                       (QREFELT $ 50))
                      |y| (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 117))
                     (SPADCALL |y|
                               (SPADCALL
                                (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                          (|spadConstant| $ 48)
                                          (QREFELT $ 119))
                                (QREFELT $ 50))
                               (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 117))
                     (SPADCALL |y| (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 117)) |y|)
                    ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 48)
                                 (SPADCALL |y| 2 (QREFELT $ 118))
                                 (QREFELT $ 119))
                       (QREFELT $ 50))
                      (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                (|spadConstant| $ 48) (QREFELT $ 120))
                      (QREFELT $ 50)))
                    (#1# (SPADCALL (QREFELT $ 31) |x| (QREFELT $ 123)))))))))))) 

(DEFUN |EF;isech| (|x| $)
  (PROG (|y|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 48))
            (#1='T
             (SEQ (LETT |y| (|EF;dropfun| |x| $) |EF;isech|)
                  (EXIT
                   (COND
                    ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                 (|spadConstant| $ 48) (QREFELT $ 120))
                       (QREFELT $ 50))
                      (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 117))
                     (SPADCALL |y| (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 48)
                                (SPADCALL |y| 2 (QREFELT $ 118))
                                (QREFELT $ 119))
                      (QREFELT $ 50)))
                    ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                 (|spadConstant| $ 48) (QREFELT $ 119))
                       (QREFELT $ 50))
                      |y| (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 117)) |y|)
                    ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 117))
                     (SPADCALL |y|
                               (SPADCALL
                                (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                          (|spadConstant| $ 48)
                                          (QREFELT $ 120))
                                (QREFELT $ 50))
                               (QREFELT $ 100)))
                    (#1# (SPADCALL (QREFELT $ 32) |x| (QREFELT $ 123)))))))))))) 

(DEFUN |EF;icsch| (|x| $)
  (PROG (|y|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
            (#1='T
             (SEQ (LETT |y| (|EF;dropfun| |x| $) |EF;icsch|)
                  (EXIT
                   (COND
                    ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 117))
                     (SPADCALL |y| (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                 (|spadConstant| $ 48) (QREFELT $ 119))
                       (QREFELT $ 50))
                      (QREFELT $ 121)))
                    ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 48)
                                 (SPADCALL |y| 2 (QREFELT $ 118))
                                 (QREFELT $ 119))
                       (QREFELT $ 50))
                      |y| (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 117))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                 (|spadConstant| $ 48) (QREFELT $ 119))
                       (QREFELT $ 50))
                      (QREFELT $ 49)))
                    ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 117))
                     (SPADCALL |y|
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 48)
                                          (SPADCALL |y| 2 (QREFELT $ 118))
                                          (QREFELT $ 119))
                                (QREFELT $ 50))
                               (QREFELT $ 100)))
                    ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 117)) |y|)
                    (#1# (SPADCALL (QREFELT $ 33) |x| (QREFELT $ 123)))))))))))) 

(DEFUN |EF;iasinh| (|x| $) (SPADCALL (QREFELT $ 34) |x| (QREFELT $ 123))) 

(DEFUN |EF;iacosh| (|x| $) (SPADCALL (QREFELT $ 35) |x| (QREFELT $ 123))) 

(DEFUN |EF;iatanh| (|x| $) (SPADCALL (QREFELT $ 36) |x| (QREFELT $ 123))) 

(DEFUN |EF;iacoth| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
        ('T (SPADCALL (QREFELT $ 37) |x| (QREFELT $ 123))))) 

(DEFUN |EF;iasech| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
        ('T (SPADCALL (QREFELT $ 38) |x| (QREFELT $ 123))))) 

(DEFUN |EF;iacsch| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
        ('T (SPADCALL (QREFELT $ 39) |x| (QREFELT $ 123))))) 

(DEFUN |EF;iexp| (|x| $)
  (PROG (|u| |s3| |s2| |h| |y| |xi| |i|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 48))
            ((SPADCALL |x| (QREFELT $ 14) (QREFELT $ 117))
             (|SPADfirst| (SPADCALL (|EF;kernel| |x| $) (QREFELT $ 99))))
            (#1='T
             (SEQ
              (COND
               ((SPADCALL |x| (|spadConstant| $ 89) (QREFELT $ 126))
                (COND
                 ((NULL (SPADCALL |x| (QREFELT $ 128)))
                  (EXIT
                   (SPADCALL (|EF;iexp| (SPADCALL |x| (QREFELT $ 49)) $)
                             (QREFELT $ 121)))))))
              (EXIT
               (COND
                ((|HasCategory| (QREFELT $ 6)
                                (LIST '|RetractableTo| '(|Integer|)))
                 (SEQ (LETT |i| (|EF;iisqrt1| $) . #2=(|EF;iexp|))
                      (LETT |xi| (SPADCALL |x| |i| (QREFELT $ 100)) . #2#)
                      (LETT |y|
                            (SPADCALL |xi| (SPADCALL (QREFELT $ 45))
                                      (QREFELT $ 100))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR (SPADCALL |y| (QREFELT $ 102)) 1)
                         (SPADCALL (QREFELT $ 15) |x| (QREFELT $ 123)))
                        (#1#
                         (SEQ
                          (LETT |h|
                                (SPADCALL (SPADCALL 2 (QREFELT $ 56))
                                          (QREFELT $ 121))
                                . #2#)
                          (LETT |s2|
                                (SPADCALL |h| (SPADCALL (QREFELT $ 57))
                                          (QREFELT $ 122))
                                . #2#)
                          (LETT |s3|
                                (SPADCALL |h| (SPADCALL (QREFELT $ 58))
                                          (QREFELT $ 122))
                                . #2#)
                          (LETT |u|
                                (SPADCALL |xi|
                                          (LIST
                                           (CONS (|spadConstant| $ 48) 'NIL)
                                           (CONS
                                            (SPADCALL (|spadConstant| $ 48)
                                                      (QREFELT $ 49))
                                            'NIL)
                                           (CONS |i| 'NIL)
                                           (CONS (SPADCALL |i| (QREFELT $ 49))
                                                 'NIL)
                                           (CONS
                                            (SPADCALL |h|
                                                      (SPADCALL |i| |s3|
                                                                (QREFELT $
                                                                         122))
                                                      (QREFELT $ 120))
                                            'NIL)
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |h| (QREFELT $ 49))
                                             (SPADCALL |i| |s3|
                                                       (QREFELT $ 122))
                                             (QREFELT $ 120))
                                            'NIL)
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |h| (QREFELT $ 49))
                                             (SPADCALL |i| |s3|
                                                       (QREFELT $ 122))
                                             (QREFELT $ 119))
                                            'NIL)
                                           (CONS
                                            (SPADCALL |h|
                                                      (SPADCALL |i| |s3|
                                                                (QREFELT $
                                                                         122))
                                                      (QREFELT $ 119))
                                            'NIL)
                                           (CONS
                                            (SPADCALL |s2|
                                                      (SPADCALL |i| |s2|
                                                                (QREFELT $
                                                                         122))
                                                      (QREFELT $ 120))
                                            'NIL)
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |s2| (QREFELT $ 49))
                                             (SPADCALL |i| |s2|
                                                       (QREFELT $ 122))
                                             (QREFELT $ 120))
                                            'NIL)
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |s2| (QREFELT $ 49))
                                             (SPADCALL |i| |s2|
                                                       (QREFELT $ 122))
                                             (QREFELT $ 119))
                                            'NIL)
                                           (CONS
                                            (SPADCALL |s2|
                                                      (SPADCALL |i| |s2|
                                                                (QREFELT $
                                                                         122))
                                                      (QREFELT $ 119))
                                            'NIL)
                                           (CONS
                                            (SPADCALL |s3|
                                                      (SPADCALL |i| |h|
                                                                (QREFELT $
                                                                         122))
                                                      (QREFELT $ 120))
                                            'NIL)
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             (SPADCALL |i| |h| (QREFELT $ 122))
                                             (QREFELT $ 120))
                                            'NIL)
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             (SPADCALL |i| |h| (QREFELT $ 122))
                                             (QREFELT $ 119))
                                            'NIL)
                                           (CONS
                                            (SPADCALL |s3|
                                                      (SPADCALL |i| |h|
                                                                (QREFELT $
                                                                         122))
                                                      (QREFELT $ 119))
                                            'NIL))
                                          (QREFELT $ 115))
                                . #2#)
                          (EXIT
                           (COND ((QEQCAR |u| 0) (QCDR |u|))
                                 (#1#
                                  (SPADCALL (QREFELT $ 15) |x|
                                            (QREFELT $ 123)))))))))))
                (#1# (SPADCALL (QREFELT $ 15) |x| (QREFELT $ 123)))))))))))) 

(DEFUN |EF;localReal?;FB;71| (|x| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 130)) |EF;localReal?;FB;71|)
          (EXIT
           (COND
            ((QEQCAR |u| 0)
             (SPADCALL (QCDR |u|) (SPADCALL (QCDR |u|) (QREFELT $ 131))
                       (QREFELT $ 132)))
            ('T 'NIL))))))) 

(PUT '|EF;localReal?;FB;72| '|SPADreplace| '(XLAM (|x|) 'T)) 

(DEFUN |EF;localReal?;FB;72| (|x| $) 'T) 

(PUT '|EF;localReal?;FB;73| '|SPADreplace| '(XLAM (|x|) 'T)) 

(DEFUN |EF;localReal?;FB;73| (|x| $) 'T) 

(DEFUN |EF;iiilog| (|x| $)
  (PROG (|arg| |rec| |u|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
            ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125))
             (|spadConstant| $ 89))
            (#1='T
             (SEQ
              (LETT |u| (SPADCALL |x| (QREFELT $ 15) (QREFELT $ 136))
                    . #2=(|EF;iiilog|))
              (EXIT
               (COND
                ((QEQCAR |u| 0)
                 (SEQ (LETT |rec| (QCDR |u|) . #2#)
                      (LETT |arg|
                            (|SPADfirst|
                             (SPADCALL (QCAR |rec|) (QREFELT $ 99)))
                            . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL |arg| (QREFELT $ 133))
                         (SPADCALL (QCDR |rec|)
                                   (|SPADfirst|
                                    (SPADCALL (QCAR |rec|) (QREFELT $ 99)))
                                   (QREFELT $ 137)))
                        (#1# (|EF;ilog| |x| $))))))
                (#1# (|EF;ilog| |x| $))))))))))) 

(DEFUN |EF;ilog| (|x| $)
  (PROG (#1=#:G576 |den| |num1| |num|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |num1|
               (SPADCALL
                (LETT |num| (SPADCALL |x| (QREFELT $ 139)) . #2=(|EF;ilog|))
                (|spadConstant| $ 141) (QREFELT $ 142))
               . #2#)
         (EXIT
          (COND
           ((OR |num1|
                (SPADCALL |num|
                          (SPADCALL (|spadConstant| $ 141) (QREFELT $ 145))
                          (QREFELT $ 142)))
            (COND
             ((SPADCALL (LETT |den| (SPADCALL |x| (QREFELT $ 143)) . #2#)
                        (|spadConstant| $ 141) (QREFELT $ 144))
              (COND
               ((NULL (SPADCALL |x| (QREFELT $ 128)))
                (PROGN
                 (LETT #1#
                       (SPADCALL
                        (SPADCALL (QREFELT $ 14)
                                  (SPADCALL
                                   (COND (|num1| |den|)
                                         ('T (SPADCALL |den| (QREFELT $ 145))))
                                   (QREFELT $ 146))
                                  (QREFELT $ 123))
                        (QREFELT $ 49))
                       . #2#)
                 (GO #1#))))))))))
        (EXIT (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 123)))))
      #1# (EXIT #1#))))) 

(DEFUN |EF;iilog;2F;76| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iilog;2F;76|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iiilog| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 147))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iiexp;2F;77| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iiexp;2F;77|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iexp| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 149))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iilog;2F;78| (|x| $) (|EF;iiilog| |x| $)) 

(DEFUN |EF;iiexp;2F;79| (|x| $) (|EF;iexp| |x| $)) 

(DEFUN |EF;iisin;2F;80| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iisin;2F;80|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;isin| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 151))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iicos;2F;81| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iicos;2F;81|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;icos| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 153))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iitan;2F;82| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iitan;2F;82|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;itan| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 155))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iicot;2F;83| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iicot;2F;83|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;icot| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 157))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iisec;2F;84| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iisec;2F;84|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;isec| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 159))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iicsc;2F;85| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iicsc;2F;85|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;icsc| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 161))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iisin;2F;86| (|x| $) (|EF;isin| |x| $)) 

(DEFUN |EF;iicos;2F;87| (|x| $) (|EF;icos| |x| $)) 

(DEFUN |EF;iitan;2F;88| (|x| $) (|EF;itan| |x| $)) 

(DEFUN |EF;iicot;2F;89| (|x| $) (|EF;icot| |x| $)) 

(DEFUN |EF;iisec;2F;90| (|x| $) (|EF;isec| |x| $)) 

(DEFUN |EF;iicsc;2F;91| (|x| $) (|EF;icsc| |x| $)) 

(DEFUN |EF;iiasin;2F;92| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iiasin;2F;92|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iasin| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 163))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iiacos;2F;93| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iiacos;2F;93|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iacos| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 165))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iiatan;2F;94| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iiatan;2F;94|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iatan| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 167))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iiacot;2F;95| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iiacot;2F;95|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iacot| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 169))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iiasec;2F;96| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iiasec;2F;96|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iasec| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 171))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iiacsc;2F;97| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iiacsc;2F;97|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iacsc| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 173))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iiasin;2F;98| (|x| $) (|EF;iasin| |x| $)) 

(DEFUN |EF;iiacos;2F;99| (|x| $) (|EF;iacos| |x| $)) 

(DEFUN |EF;iiatan;2F;100| (|x| $) (|EF;iatan| |x| $)) 

(DEFUN |EF;iiacot;2F;101| (|x| $) (|EF;iacot| |x| $)) 

(DEFUN |EF;iiasec;2F;102| (|x| $) (|EF;iasec| |x| $)) 

(DEFUN |EF;iiacsc;2F;103| (|x| $) (|EF;iacsc| |x| $)) 

(DEFUN |EF;iisinh;2F;104| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iisinh;2F;104|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;isinh| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 175))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iicosh;2F;105| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iicosh;2F;105|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;icosh| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 177))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iitanh;2F;106| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iitanh;2F;106|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;itanh| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 179))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iicoth;2F;107| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iicoth;2F;107|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;icoth| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 181))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iisech;2F;108| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iisech;2F;108|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;isech| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 183))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iicsch;2F;109| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iicsch;2F;109|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;icsch| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 185))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iisinh;2F;110| (|x| $) (|EF;isinh| |x| $)) 

(DEFUN |EF;iicosh;2F;111| (|x| $) (|EF;icosh| |x| $)) 

(DEFUN |EF;iitanh;2F;112| (|x| $) (|EF;itanh| |x| $)) 

(DEFUN |EF;iicoth;2F;113| (|x| $) (|EF;icoth| |x| $)) 

(DEFUN |EF;iisech;2F;114| (|x| $) (|EF;isech| |x| $)) 

(DEFUN |EF;iicsch;2F;115| (|x| $) (|EF;icsch| |x| $)) 

(DEFUN |EF;iiasinh;2F;116| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iiasinh;2F;116|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iasinh| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 187))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iiacosh;2F;117| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iiacosh;2F;117|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iacosh| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 189))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iiatanh;2F;118| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iiatanh;2F;118|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iatanh| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 191))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iiacoth;2F;119| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iiacoth;2F;119|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iacoth| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 193))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iiasech;2F;120| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iiasech;2F;120|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iasech| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 195))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iiacsch;2F;121| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)) |EF;iiacsch;2F;121|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|EF;iacsch| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 197))
                            (QREFELT $ 41))))))))) 

(DEFUN |EF;iiasinh;2F;122| (|x| $) (|EF;iasinh| |x| $)) 

(DEFUN |EF;iiacosh;2F;123| (|x| $) (|EF;iacosh| |x| $)) 

(DEFUN |EF;iiatanh;2F;124| (|x| $) (|EF;iatanh| |x| $)) 

(DEFUN |EF;iiacoth;2F;125| (|x| $) (|EF;iacoth| |x| $)) 

(DEFUN |EF;iiasech;2F;126| (|x| $) (|EF;iasech| |x| $)) 

(DEFUN |EF;iiacsch;2F;127| (|x| $) (|EF;iacsch| |x| $)) 

(DECLAIM (NOTINLINE |ElementaryFunction;|)) 

(DEFUN |ElementaryFunction| (&REST #1=#:G834)
  (PROG ()
    (RETURN
     (PROG (#2=#:G835)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ElementaryFunction|)
                                           '|domainEqualList|)
                . #3=(|ElementaryFunction|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ElementaryFunction;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ElementaryFunction|))))))))))) 

(DEFUN |ElementaryFunction;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryFunction|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ElementaryFunction| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 206) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ElementaryFunction| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 '|elem|)
      (QSETREFV $ 13 (SPADCALL '|pi| (QREFELT $ 12)))
      (QSETREFV $ 14 (SPADCALL '|log| (QREFELT $ 12)))
      (QSETREFV $ 15 (SPADCALL '|exp| (QREFELT $ 12)))
      (QSETREFV $ 16 (SPADCALL '|sin| (QREFELT $ 12)))
      (QSETREFV $ 17 (SPADCALL '|cos| (QREFELT $ 12)))
      (QSETREFV $ 18 (SPADCALL '|tan| (QREFELT $ 12)))
      (QSETREFV $ 19 (SPADCALL '|cot| (QREFELT $ 12)))
      (QSETREFV $ 20 (SPADCALL '|sec| (QREFELT $ 12)))
      (QSETREFV $ 21 (SPADCALL '|csc| (QREFELT $ 12)))
      (QSETREFV $ 22 (SPADCALL '|asin| (QREFELT $ 12)))
      (QSETREFV $ 23 (SPADCALL '|acos| (QREFELT $ 12)))
      (QSETREFV $ 24 (SPADCALL '|atan| (QREFELT $ 12)))
      (QSETREFV $ 25 (SPADCALL '|acot| (QREFELT $ 12)))
      (QSETREFV $ 26 (SPADCALL '|asec| (QREFELT $ 12)))
      (QSETREFV $ 27 (SPADCALL '|acsc| (QREFELT $ 12)))
      (QSETREFV $ 28 (SPADCALL '|sinh| (QREFELT $ 12)))
      (QSETREFV $ 29 (SPADCALL '|cosh| (QREFELT $ 12)))
      (QSETREFV $ 30 (SPADCALL '|tanh| (QREFELT $ 12)))
      (QSETREFV $ 31 (SPADCALL '|coth| (QREFELT $ 12)))
      (QSETREFV $ 32 (SPADCALL '|sech| (QREFELT $ 12)))
      (QSETREFV $ 33 (SPADCALL '|csch| (QREFELT $ 12)))
      (QSETREFV $ 34 (SPADCALL '|asinh| (QREFELT $ 12)))
      (QSETREFV $ 35 (SPADCALL '|acosh| (QREFELT $ 12)))
      (QSETREFV $ 36 (SPADCALL '|atanh| (QREFELT $ 12)))
      (QSETREFV $ 37 (SPADCALL '|acoth| (QREFELT $ 12)))
      (QSETREFV $ 38 (SPADCALL '|asech| (QREFELT $ 12)))
      (QSETREFV $ 39 (SPADCALL '|acsch| (QREFELT $ 12)))
      (COND
       ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
        (QSETREFV $ 42 (SPADCALL (SPADCALL (QREFELT $ 40)) (QREFELT $ 41))))
       ('T (SETELT $ 42 (SPADCALL (QREFELT $ 13) NIL (QREFELT $ 44)))))
      (COND
       ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
        (COND
         ((|HasCategory| |#1| '(|arbitraryPrecision|))
          (QSETREFV $ 45 (CONS (|dispatchFunction| |EF;pi;F;1|) $)))
         ('T (QSETREFV $ 45 (CONS (|dispatchFunction| |EF;pi;F;2|) $)))))
       ('T (QSETREFV $ 45 (CONS (|dispatchFunction| |EF;pi;F;3|) $))))
      (COND
       ((|HasSignature| |#1| (LIST '|imaginary| (LIST (|devaluate| |#1|))))
        (QSETREFV $ 47 (SPADCALL (SPADCALL (QREFELT $ 46)) (QREFELT $ 41))))
       ('T
        (SETELT $ 47
                (SPADCALL (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                          (QREFELT $ 50)))))
      (COND
       ((|HasCategory| |#1| '(|RadicalCategory|))
        (PROGN
         (QSETREFV $ 54
                   (SPADCALL
                    (SPADCALL (SPADCALL 2 (QREFELT $ 52)) (QREFELT $ 53))
                    (QREFELT $ 41)))
         (QSETREFV $ 55
                   (SPADCALL
                    (SPADCALL (SPADCALL 3 (QREFELT $ 52)) (QREFELT $ 53))
                    (QREFELT $ 41)))))
       ('T
        (PROGN
         (SETELT $ 54 (SPADCALL (SPADCALL 2 (QREFELT $ 56)) (QREFELT $ 50)))
         (SETELT $ 55 (SPADCALL (SPADCALL 3 (QREFELT $ 56)) (QREFELT $ 50))))))
      (COND
       ((|HasCategory| |#1| '(|RadicalCategory|))
        (COND
         ((|HasCategory| |#1| '(|arbitraryPrecision|))
          (PROGN
           (QSETREFV $ 57 (CONS (|dispatchFunction| |EF;iisqrt2;F;5|) $))
           (QSETREFV $ 58 (CONS (|dispatchFunction| |EF;iisqrt3;F;6|) $))))
         ('T
          (PROGN
           (QSETREFV $ 57 (CONS (|dispatchFunction| |EF;iisqrt2;F;7|) $))
           (QSETREFV $ 58 (CONS (|dispatchFunction| |EF;iisqrt3;F;8|) $))))))
       ('T
        (PROGN
         (QSETREFV $ 57 (CONS (|dispatchFunction| |EF;iisqrt2;F;9|) $))
         (QSETREFV $ 58 (CONS (|dispatchFunction| |EF;iisqrt3;F;10|) $)))))
      (COND
       ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
        (QSETREFV $ 115
                  (CONS (|dispatchFunction| |EF;specialTrigs;FLU;44|) $)))
       ('T
        (QSETREFV $ 115
                  (CONS (|dispatchFunction| |EF;specialTrigs;FLU;45|) $))))
      (COND
       ((|HasSignature| |#1| (LIST '|imaginary| (LIST (|devaluate| |#1|))))
        (COND
         ((|HasSignature| |#1|
                          (LIST '|conjugate|
                                (LIST (|devaluate| |#1|) (|devaluate| |#1|))))
          (QSETREFV $ 133 (CONS (|dispatchFunction| |EF;localReal?;FB;71|) $)))
         ('T
          (QSETREFV $ 133
                    (CONS (|dispatchFunction| |EF;localReal?;FB;72|) $)))))
       ('T
        (QSETREFV $ 133 (CONS (|dispatchFunction| |EF;localReal?;FB;73|) $))))
      (COND
       ((|HasCategory| |#1| '(|ElementaryFunctionCategory|))
        (PROGN
         (QSETREFV $ 148 (CONS (|dispatchFunction| |EF;iilog;2F;76|) $))
         (QSETREFV $ 150 (CONS (|dispatchFunction| |EF;iiexp;2F;77|) $))))
       ('T
        (PROGN
         (QSETREFV $ 148 (CONS (|dispatchFunction| |EF;iilog;2F;78|) $))
         (QSETREFV $ 150 (CONS (|dispatchFunction| |EF;iiexp;2F;79|) $)))))
      (COND
       ((|HasCategory| |#1| '(|TrigonometricFunctionCategory|))
        (PROGN
         (QSETREFV $ 152 (CONS (|dispatchFunction| |EF;iisin;2F;80|) $))
         (QSETREFV $ 154 (CONS (|dispatchFunction| |EF;iicos;2F;81|) $))
         (QSETREFV $ 156 (CONS (|dispatchFunction| |EF;iitan;2F;82|) $))
         (QSETREFV $ 158 (CONS (|dispatchFunction| |EF;iicot;2F;83|) $))
         (QSETREFV $ 160 (CONS (|dispatchFunction| |EF;iisec;2F;84|) $))
         (QSETREFV $ 162 (CONS (|dispatchFunction| |EF;iicsc;2F;85|) $))))
       ('T
        (PROGN
         (QSETREFV $ 152 (CONS (|dispatchFunction| |EF;iisin;2F;86|) $))
         (QSETREFV $ 154 (CONS (|dispatchFunction| |EF;iicos;2F;87|) $))
         (QSETREFV $ 156 (CONS (|dispatchFunction| |EF;iitan;2F;88|) $))
         (QSETREFV $ 158 (CONS (|dispatchFunction| |EF;iicot;2F;89|) $))
         (QSETREFV $ 160 (CONS (|dispatchFunction| |EF;iisec;2F;90|) $))
         (QSETREFV $ 162 (CONS (|dispatchFunction| |EF;iicsc;2F;91|) $)))))
      (COND
       ((|HasCategory| |#1| '(|ArcTrigonometricFunctionCategory|))
        (PROGN
         (QSETREFV $ 164 (CONS (|dispatchFunction| |EF;iiasin;2F;92|) $))
         (QSETREFV $ 166 (CONS (|dispatchFunction| |EF;iiacos;2F;93|) $))
         (QSETREFV $ 168 (CONS (|dispatchFunction| |EF;iiatan;2F;94|) $))
         (QSETREFV $ 170 (CONS (|dispatchFunction| |EF;iiacot;2F;95|) $))
         (QSETREFV $ 172 (CONS (|dispatchFunction| |EF;iiasec;2F;96|) $))
         (QSETREFV $ 174 (CONS (|dispatchFunction| |EF;iiacsc;2F;97|) $))))
       ('T
        (PROGN
         (QSETREFV $ 164 (CONS (|dispatchFunction| |EF;iiasin;2F;98|) $))
         (QSETREFV $ 166 (CONS (|dispatchFunction| |EF;iiacos;2F;99|) $))
         (QSETREFV $ 168 (CONS (|dispatchFunction| |EF;iiatan;2F;100|) $))
         (QSETREFV $ 170 (CONS (|dispatchFunction| |EF;iiacot;2F;101|) $))
         (QSETREFV $ 172 (CONS (|dispatchFunction| |EF;iiasec;2F;102|) $))
         (QSETREFV $ 174 (CONS (|dispatchFunction| |EF;iiacsc;2F;103|) $)))))
      (COND
       ((|HasCategory| |#1| '(|HyperbolicFunctionCategory|))
        (PROGN
         (QSETREFV $ 176 (CONS (|dispatchFunction| |EF;iisinh;2F;104|) $))
         (QSETREFV $ 178 (CONS (|dispatchFunction| |EF;iicosh;2F;105|) $))
         (QSETREFV $ 180 (CONS (|dispatchFunction| |EF;iitanh;2F;106|) $))
         (QSETREFV $ 182 (CONS (|dispatchFunction| |EF;iicoth;2F;107|) $))
         (QSETREFV $ 184 (CONS (|dispatchFunction| |EF;iisech;2F;108|) $))
         (QSETREFV $ 186 (CONS (|dispatchFunction| |EF;iicsch;2F;109|) $))))
       ('T
        (PROGN
         (QSETREFV $ 176 (CONS (|dispatchFunction| |EF;iisinh;2F;110|) $))
         (QSETREFV $ 178 (CONS (|dispatchFunction| |EF;iicosh;2F;111|) $))
         (QSETREFV $ 180 (CONS (|dispatchFunction| |EF;iitanh;2F;112|) $))
         (QSETREFV $ 182 (CONS (|dispatchFunction| |EF;iicoth;2F;113|) $))
         (QSETREFV $ 184 (CONS (|dispatchFunction| |EF;iisech;2F;114|) $))
         (QSETREFV $ 186 (CONS (|dispatchFunction| |EF;iicsch;2F;115|) $)))))
      (COND
       ((|HasCategory| |#1| '(|ArcHyperbolicFunctionCategory|))
        (PROGN
         (QSETREFV $ 188 (CONS (|dispatchFunction| |EF;iiasinh;2F;116|) $))
         (QSETREFV $ 190 (CONS (|dispatchFunction| |EF;iiacosh;2F;117|) $))
         (QSETREFV $ 192 (CONS (|dispatchFunction| |EF;iiatanh;2F;118|) $))
         (QSETREFV $ 194 (CONS (|dispatchFunction| |EF;iiacoth;2F;119|) $))
         (QSETREFV $ 196 (CONS (|dispatchFunction| |EF;iiasech;2F;120|) $))
         (QSETREFV $ 198 (CONS (|dispatchFunction| |EF;iiacsch;2F;121|) $))))
       ('T
        (PROGN
         (QSETREFV $ 188 (CONS (|dispatchFunction| |EF;iiasinh;2F;122|) $))
         (QSETREFV $ 190 (CONS (|dispatchFunction| |EF;iiacosh;2F;123|) $))
         (QSETREFV $ 192 (CONS (|dispatchFunction| |EF;iiatanh;2F;124|) $))
         (QSETREFV $ 194 (CONS (|dispatchFunction| |EF;iiacoth;2F;125|) $))
         (QSETREFV $ 196 (CONS (|dispatchFunction| |EF;iiasech;2F;126|) $))
         (QSETREFV $ 198 (CONS (|dispatchFunction| |EF;iiacsch;2F;127|) $)))))
      (SPADCALL (QREFELT $ 13) (CONS (|function| |EF;ipi|) $) (QREFELT $ 201))
      (SPADCALL (QREFELT $ 14) (ELT $ 148) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 15) (ELT $ 150) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 16) (ELT $ 152) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 17) (ELT $ 154) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 18) (ELT $ 156) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 19) (ELT $ 158) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 20) (ELT $ 160) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 21) (ELT $ 162) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 22) (ELT $ 164) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 23) (ELT $ 166) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 24) (ELT $ 168) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 25) (ELT $ 170) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 26) (ELT $ 172) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 27) (ELT $ 174) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 28) (ELT $ 176) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 29) (ELT $ 178) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 30) (ELT $ 180) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 31) (ELT $ 182) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 32) (ELT $ 184) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 33) (ELT $ 186) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 34) (ELT $ 188) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 35) (ELT $ 190) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 36) (ELT $ 192) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 37) (ELT $ 194) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 38) (ELT $ 196) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 39) (ELT $ 198) (QREFELT $ 203))
      (SPADCALL (QREFELT $ 15) (ELT $ 61) (QREFELT $ 204))
      (SPADCALL (QREFELT $ 14) (ELT $ 121) (QREFELT $ 204))
      (SPADCALL (QREFELT $ 16) (ELT $ 63) (QREFELT $ 204))
      (SPADCALL (QREFELT $ 17) (CONS #'|ElementaryFunction!0| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 18) (CONS #'|ElementaryFunction!1| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 19) (CONS #'|ElementaryFunction!2| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 20) (CONS #'|ElementaryFunction!3| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 21) (CONS #'|ElementaryFunction!4| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 22) (CONS #'|ElementaryFunction!5| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 23) (CONS #'|ElementaryFunction!6| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 24) (CONS #'|ElementaryFunction!7| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 25) (CONS #'|ElementaryFunction!8| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 26) (CONS #'|ElementaryFunction!9| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 27) (CONS #'|ElementaryFunction!10| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 28) (ELT $ 75) (QREFELT $ 204))
      (SPADCALL (QREFELT $ 29) (ELT $ 74) (QREFELT $ 204))
      (SPADCALL (QREFELT $ 30) (CONS #'|ElementaryFunction!11| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 31) (CONS #'|ElementaryFunction!12| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 32) (CONS #'|ElementaryFunction!13| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 33) (CONS #'|ElementaryFunction!14| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 34) (CONS #'|ElementaryFunction!15| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 35) (CONS #'|ElementaryFunction!16| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 36) (CONS #'|ElementaryFunction!17| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 37) (CONS #'|ElementaryFunction!18| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 38) (CONS #'|ElementaryFunction!19| $)
                (QREFELT $ 204))
      (SPADCALL (QREFELT $ 39) (CONS #'|ElementaryFunction!20| $)
                (QREFELT $ 204))
      $)))) 

(DEFUN |ElementaryFunction!20| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL |x|
              (SPADCALL
               (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
                         (QREFELT $ 120))
               (QREFELT $ 50))
              (QREFELT $ 122))
    (QREFELT $ 121))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!19| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL |x|
              (SPADCALL
               (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
                         (QREFELT $ 119))
               (QREFELT $ 50))
              (QREFELT $ 122))
    (QREFELT $ 121))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!18| (|x| $)
  (SPADCALL
   (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
             (QREFELT $ 119))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!17| (|x| $)
  (SPADCALL
   (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
             (QREFELT $ 119))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!16| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |x| 2 (QREFELT $ 118)) (|spadConstant| $ 48)
              (QREFELT $ 119))
    (QREFELT $ 50))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!15| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
              (QREFELT $ 120))
    (QREFELT $ 50))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!14| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 77)) (SPADCALL |x| (QREFELT $ 79))
             (QREFELT $ 122))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!13| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 76)) (SPADCALL |x| (QREFELT $ 78))
             (QREFELT $ 122))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!12| (|x| $)
  (SPADCALL (|spadConstant| $ 48)
            (SPADCALL (SPADCALL |x| (QREFELT $ 77)) 2 (QREFELT $ 205))
            (QREFELT $ 119))) 

(DEFUN |ElementaryFunction!11| (|x| $)
  (SPADCALL (|spadConstant| $ 48)
            (SPADCALL (SPADCALL |x| (QREFELT $ 76)) 2 (QREFELT $ 205))
            (QREFELT $ 119))) 

(DEFUN |ElementaryFunction!10| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL |x|
              (SPADCALL
               (SPADCALL (SPADCALL |x| 2 (QREFELT $ 118)) (|spadConstant| $ 48)
                         (QREFELT $ 119))
               (QREFELT $ 50))
              (QREFELT $ 122))
    (QREFELT $ 121))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!9| (|x| $)
  (SPADCALL
   (SPADCALL |x|
             (SPADCALL
              (SPADCALL (SPADCALL |x| 2 (QREFELT $ 118)) (|spadConstant| $ 48)
                        (QREFELT $ 119))
              (QREFELT $ 50))
             (QREFELT $ 122))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!8| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
              (QREFELT $ 120))
    (QREFELT $ 121))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!7| (|x| $)
  (SPADCALL
   (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
             (QREFELT $ 120))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!6| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL
     (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
               (QREFELT $ 119))
     (QREFELT $ 50))
    (QREFELT $ 121))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!5| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
              (QREFELT $ 119))
    (QREFELT $ 50))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!4| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 65)) (SPADCALL |x| (QREFELT $ 67))
             (QREFELT $ 122))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!3| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 64)) (SPADCALL |x| (QREFELT $ 66))
            (QREFELT $ 122))) 

(DEFUN |ElementaryFunction!2| (|x| $)
  (SPADCALL (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
            (SPADCALL (SPADCALL |x| (QREFELT $ 65)) 2 (QREFELT $ 205))
            (QREFELT $ 119))) 

(DEFUN |ElementaryFunction!1| (|x| $)
  (SPADCALL (|spadConstant| $ 48)
            (SPADCALL (SPADCALL |x| (QREFELT $ 64)) 2 (QREFELT $ 205))
            (QREFELT $ 120))) 

(DEFUN |ElementaryFunction!0| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 62)) (QREFELT $ 49))) 

(MAKEPROP '|ElementaryFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ELEM
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|oppi| '|oplog| '|opexp| '|opsin| '|opcos| '|optan| '|opcot|
              '|opsec| '|opcsc| '|opasin| '|opacos| '|opatan| '|opacot|
              '|opasec| '|opacsc| '|opsinh| '|opcosh| '|optanh| '|opcoth|
              '|opsech| '|opcsch| '|opasinh| '|opacosh| '|opatanh| '|opacoth|
              '|opasech| '|opacsch| (5 . |pi|) (9 . |coerce|) '|Pie| (|List| $)
              (14 . |kernel|) (20 . |pi|) (24 . |imaginary|) '|isqrt1|
              (28 . |One|) (32 . -) (37 . |sqrt|) (|Integer|) (42 . |coerce|)
              (47 . |sqrt|) '|isqrt2| '|isqrt3| (52 . |coerce|)
              (57 . |iisqrt2|) (61 . |iisqrt3|) (65 . |elt|) |EF;log;2F;12|
              |EF;exp;2F;13| |EF;sin;2F;14| |EF;cos;2F;15| |EF;tan;2F;16|
              |EF;cot;2F;17| |EF;sec;2F;18| |EF;csc;2F;19| |EF;asin;2F;20|
              |EF;acos;2F;21| |EF;atan;2F;22| |EF;acot;2F;23| |EF;asec;2F;24|
              |EF;acsc;2F;25| |EF;sinh;2F;26| |EF;cosh;2F;27| |EF;tanh;2F;28|
              |EF;coth;2F;29| |EF;sech;2F;30| |EF;csch;2F;31| |EF;asinh;2F;32|
              |EF;acosh;2F;33| |EF;atanh;2F;34| |EF;acoth;2F;35|
              |EF;asech;2F;36| |EF;acsch;2F;37| (|Kernel| $) (71 . |retract|)
              (76 . |Zero|) (80 . |Zero|) (|Boolean|) (84 . |has?|)
              |EF;belong?;BoB;41| (90 . |is?|) |EF;operator;2Bo;42|
              (|Union| 86 '#1="failed") (96 . |retractIfCan|) (|List| 7)
              (|Kernel| 7) (101 . |argument|) (106 . /) (|Union| 107 '#1#)
              (112 . |retractIfCan|) (|Record| (|:| |func| 7) (|:| |pole| 90))
              (|List| 103) (117 . |minIndex|) (|Union| 51 '"failed")
              (|Fraction| 51) (122 . |retractIfCan|) (127 . |even?|)
              (132 . |elt|) (138 . |One|) (|PositiveInteger|) (142 . *)
              (|Union| 7 '"failed") (148 . |specialTrigs|) (154 . |zero?|)
              (159 . |is?|) (165 . ^) (171 . -) (177 . +) (183 . |inv|)
              (188 . *) (194 . |kernel|) (200 . *) (206 . =) (212 . |smaller?|)
              (|List| 10) (218 . |variables|) (|Union| 6 '#1#)
              (223 . |retractIfCan|) (228 . |conjugate|) (233 . =)
              (239 . |localReal?|)
              (|Record| (|:| |var| 86) (|:| |exponent| 51))
              (|Union| 134 '"failed") (244 . |isExpt|) (250 . *)
              (|SparseMultivariatePolynomial| 6 86) (256 . |numer|)
              (|SparseMultivariatePolynomial| 6 98) (261 . |One|) (265 . =)
              (271 . |denom|) (276 . ~=) (282 . -) (287 . |coerce|)
              (292 . |log|) (297 . |iilog|) (302 . |exp|) (307 . |iiexp|)
              (312 . |sin|) (317 . |iisin|) (322 . |cos|) (327 . |iicos|)
              (332 . |tan|) (337 . |iitan|) (342 . |cot|) (347 . |iicot|)
              (352 . |sec|) (357 . |iisec|) (362 . |csc|) (367 . |iicsc|)
              (372 . |asin|) (377 . |iiasin|) (382 . |acos|) (387 . |iiacos|)
              (392 . |atan|) (397 . |iiatan|) (402 . |acot|) (407 . |iiacot|)
              (412 . |asec|) (417 . |iiasec|) (422 . |acsc|) (427 . |iiacsc|)
              (432 . |sinh|) (437 . |iisinh|) (442 . |cosh|) (447 . |iicosh|)
              (452 . |tanh|) (457 . |iitanh|) (462 . |coth|) (467 . |iicoth|)
              (472 . |sech|) (477 . |iisech|) (482 . |csch|) (487 . |iicsch|)
              (492 . |asinh|) (497 . |iiasinh|) (502 . |acosh|)
              (507 . |iiacosh|) (512 . |atanh|) (517 . |iiatanh|)
              (522 . |acoth|) (527 . |iiacoth|) (532 . |asech|)
              (537 . |iiasech|) (542 . |acsch|) (547 . |iiacsch|)
              (|Mapping| 7 97) (|BasicOperatorFunctions1| 7) (552 . |evaluate|)
              (|Mapping| 7 7) (558 . |evaluate|) (564 . |derivative|)
              (570 . ^))
           '#(|tanh| 576 |tan| 581 |specialTrigs| 586 |sinh| 592 |sin| 597
              |sech| 602 |sec| 607 |pi| 612 |operator| 616 |log| 621
              |localReal?| 626 |iitanh| 631 |iitan| 636 |iisqrt3| 641 |iisqrt2|
              645 |iisinh| 649 |iisin| 654 |iisech| 659 |iisec| 664 |iilog| 669
              |iiexp| 674 |iicsch| 679 |iicsc| 684 |iicoth| 689 |iicot| 694
              |iicosh| 699 |iicos| 704 |iiatanh| 709 |iiatan| 714 |iiasinh| 719
              |iiasin| 724 |iiasech| 729 |iiasec| 734 |iiacsch| 739 |iiacsc|
              744 |iiacoth| 749 |iiacot| 754 |iiacosh| 759 |iiacos| 764 |exp|
              769 |csch| 774 |csc| 779 |coth| 784 |cot| 789 |cosh| 794 |cos|
              799 |belong?| 804 |atanh| 809 |atan| 814 |asinh| 819 |asin| 824
              |asech| 829 |asec| 834 |acsch| 839 |acsc| 844 |acoth| 849 |acot|
              854 |acosh| 859 |acos| 864)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 205
                                                 '(1 11 9 10 12 0 6 0 40 1 7 0
                                                   6 41 2 7 0 9 43 44 0 0 7 45
                                                   0 6 0 46 0 7 0 48 1 7 0 0 49
                                                   1 7 0 0 50 1 6 0 51 52 1 6 0
                                                   0 53 1 7 0 51 56 0 0 7 57 0
                                                   0 7 58 2 7 0 9 0 59 1 7 86 0
                                                   87 0 6 0 88 0 7 0 89 2 9 90
                                                   0 10 91 2 9 90 0 10 93 1 7
                                                   95 0 96 1 98 97 0 99 2 7 0 0
                                                   0 100 1 7 101 0 102 1 104 51
                                                   0 105 1 107 106 0 108 1 51
                                                   90 0 109 2 104 103 0 51 110
                                                   0 6 0 111 2 107 0 112 0 113
                                                   2 0 114 7 104 115 1 7 90 0
                                                   116 2 7 90 0 9 117 2 7 0 0
                                                   112 118 2 7 0 0 0 119 2 7 0
                                                   0 0 120 1 7 0 0 121 2 7 0 0
                                                   0 122 2 7 0 9 0 123 2 7 0
                                                   112 0 124 2 7 90 0 0 125 2 7
                                                   90 0 0 126 1 7 127 0 128 1 7
                                                   129 0 130 1 6 0 0 131 2 6 90
                                                   0 0 132 1 0 90 7 133 2 7 135
                                                   0 9 136 2 7 0 51 0 137 1 7
                                                   138 0 139 0 140 0 141 2 140
                                                   90 0 0 142 1 7 138 0 143 2
                                                   140 90 0 0 144 1 140 0 0 145
                                                   1 7 0 138 146 1 6 0 0 147 1
                                                   0 7 7 148 1 6 0 0 149 1 0 7
                                                   7 150 1 6 0 0 151 1 0 7 7
                                                   152 1 6 0 0 153 1 0 7 7 154
                                                   1 6 0 0 155 1 0 7 7 156 1 6
                                                   0 0 157 1 0 7 7 158 1 6 0 0
                                                   159 1 0 7 7 160 1 6 0 0 161
                                                   1 0 7 7 162 1 6 0 0 163 1 0
                                                   7 7 164 1 6 0 0 165 1 0 7 7
                                                   166 1 6 0 0 167 1 0 7 7 168
                                                   1 6 0 0 169 1 0 7 7 170 1 6
                                                   0 0 171 1 0 7 7 172 1 6 0 0
                                                   173 1 0 7 7 174 1 6 0 0 175
                                                   1 0 7 7 176 1 6 0 0 177 1 0
                                                   7 7 178 1 6 0 0 179 1 0 7 7
                                                   180 1 6 0 0 181 1 0 7 7 182
                                                   1 6 0 0 183 1 0 7 7 184 1 6
                                                   0 0 185 1 0 7 7 186 1 6 0 0
                                                   187 1 0 7 7 188 1 6 0 0 189
                                                   1 0 7 7 190 1 6 0 0 191 1 0
                                                   7 7 192 1 6 0 0 193 1 0 7 7
                                                   194 1 6 0 0 195 1 0 7 7 196
                                                   1 6 0 0 197 1 0 7 7 198 2
                                                   200 9 9 199 201 2 200 9 9
                                                   202 203 2 200 9 9 202 204 2
                                                   7 0 0 51 205 1 0 7 7 76 1 0
                                                   7 7 64 2 0 114 7 104 115 1 0
                                                   7 7 74 1 0 7 7 62 1 0 7 7 78
                                                   1 0 7 7 66 0 0 7 45 1 0 9 9
                                                   94 1 0 7 7 60 1 0 90 7 133 1
                                                   0 7 7 180 1 0 7 7 156 0 0 7
                                                   58 0 0 7 57 1 0 7 7 176 1 0
                                                   7 7 152 1 0 7 7 184 1 0 7 7
                                                   160 1 0 7 7 148 1 0 7 7 150
                                                   1 0 7 7 186 1 0 7 7 162 1 0
                                                   7 7 182 1 0 7 7 158 1 0 7 7
                                                   178 1 0 7 7 154 1 0 7 7 192
                                                   1 0 7 7 168 1 0 7 7 188 1 0
                                                   7 7 164 1 0 7 7 196 1 0 7 7
                                                   172 1 0 7 7 198 1 0 7 7 174
                                                   1 0 7 7 194 1 0 7 7 170 1 0
                                                   7 7 190 1 0 7 7 166 1 0 7 7
                                                   61 1 0 7 7 79 1 0 7 7 67 1 0
                                                   7 7 77 1 0 7 7 65 1 0 7 7 75
                                                   1 0 7 7 63 1 0 90 9 92 1 0 7
                                                   7 82 1 0 7 7 70 1 0 7 7 80 1
                                                   0 7 7 68 1 0 7 7 84 1 0 7 7
                                                   72 1 0 7 7 85 1 0 7 7 73 1 0
                                                   7 7 83 1 0 7 7 71 1 0 7 7 81
                                                   1 0 7 7 69)))))
           '|lookupComplete|)) 
