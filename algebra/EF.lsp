
(SDEFUN |EF;pi;F;1| (($ F)) (SPADCALL (SPADCALL (QREFELT $ 40)) (QREFELT $ 41))) 

(SDEFUN |EF;pi;F;2| (($ F)) (QREFELT $ 43)) 

(SDEFUN |EF;pi;F;3| (($ F)) (QREFELT $ 43)) 

(SDEFUN |EF;iisqrt1| (($ F)) (QREFELT $ 47)) 

(SDEFUN |EF;iisqrt2;F;5| (($ F))
        (SPADCALL (SPADCALL (SPADCALL 2 (QREFELT $ 52)) (QREFELT $ 53))
                  (QREFELT $ 41))) 

(SDEFUN |EF;iisqrt3;F;6| (($ F))
        (SPADCALL (SPADCALL (SPADCALL 3 (QREFELT $ 52)) (QREFELT $ 53))
                  (QREFELT $ 41))) 

(SDEFUN |EF;iisqrt2;F;7| (($ F)) (QREFELT $ 56)) 

(SDEFUN |EF;iisqrt3;F;8| (($ F)) (QREFELT $ 57)) 

(SDEFUN |EF;iisqrt2;F;9| (($ F)) (QREFELT $ 56)) 

(SDEFUN |EF;iisqrt3;F;10| (($ F)) (QREFELT $ 57)) 

(SDEFUN |EF;ipi| ((|l| |List| F) ($ F)) (SPADCALL (QREFELT $ 42))) 

(SDEFUN |EF;log;2F;12| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 59))) 

(SDEFUN |EF;exp;2F;13| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 15) |x| (QREFELT $ 59))) 

(SDEFUN |EF;sin;2F;14| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 16) |x| (QREFELT $ 59))) 

(SDEFUN |EF;cos;2F;15| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 17) |x| (QREFELT $ 59))) 

(SDEFUN |EF;tan;2F;16| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 18) |x| (QREFELT $ 59))) 

(SDEFUN |EF;cot;2F;17| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 19) |x| (QREFELT $ 59))) 

(SDEFUN |EF;sec;2F;18| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 20) |x| (QREFELT $ 59))) 

(SDEFUN |EF;csc;2F;19| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 21) |x| (QREFELT $ 59))) 

(SDEFUN |EF;asin;2F;20| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 22) |x| (QREFELT $ 59))) 

(SDEFUN |EF;acos;2F;21| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 59))) 

(SDEFUN |EF;atan;2F;22| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 59))) 

(SDEFUN |EF;acot;2F;23| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 59))) 

(SDEFUN |EF;asec;2F;24| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 59))) 

(SDEFUN |EF;acsc;2F;25| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 59))) 

(SDEFUN |EF;sinh;2F;26| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 28) |x| (QREFELT $ 59))) 

(SDEFUN |EF;cosh;2F;27| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 29) |x| (QREFELT $ 59))) 

(SDEFUN |EF;tanh;2F;28| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 30) |x| (QREFELT $ 59))) 

(SDEFUN |EF;coth;2F;29| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 31) |x| (QREFELT $ 59))) 

(SDEFUN |EF;sech;2F;30| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 32) |x| (QREFELT $ 59))) 

(SDEFUN |EF;csch;2F;31| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 33) |x| (QREFELT $ 59))) 

(SDEFUN |EF;asinh;2F;32| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 34) |x| (QREFELT $ 59))) 

(SDEFUN |EF;acosh;2F;33| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 35) |x| (QREFELT $ 59))) 

(SDEFUN |EF;atanh;2F;34| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 36) |x| (QREFELT $ 59))) 

(SDEFUN |EF;acoth;2F;35| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 37) |x| (QREFELT $ 59))) 

(SDEFUN |EF;asech;2F;36| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 38) |x| (QREFELT $ 59))) 

(SDEFUN |EF;acsch;2F;37| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 39) |x| (QREFELT $ 59))) 

(SDEFUN |EF;kernel| ((|x| F) ($ |Kernel| F)) (SPADCALL |x| (QREFELT $ 87))) 

(SDEFUN |EF;posrem| ((|n| |Integer|) (|m| |Integer|) ($ |Integer|))
        (SPROG ((|r| (|Integer|)))
               (SEQ (LETT |r| (REM |n| |m|))
                    (EXIT (COND ((< |r| 0) (+ |r| |m|)) ('T |r|)))))) 

(SDEFUN |EF;valueOrPole|
        ((|rec| |Record| (|:| |func| F) (|:| |pole| (|Boolean|))) ($ F))
        (COND ((QCDR |rec|) (|error| "Invalid argument")) ('T (QCAR |rec|)))) 

(SDEFUN |EF;belong?;BoB;41| ((|op| |BasicOperator|) ($ |Boolean|))
        (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 91))) 

(SDEFUN |EF;operator;2Bo;42| ((|op| |BasicOperator|) ($ |BasicOperator|))
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

(SDEFUN |EF;dropfun| ((|x| F) ($ F))
        (SPROG ((#1=#:G328 NIL) (|k| (|Union| (|Kernel| F) "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |k| (SPADCALL |x| (QREFELT $ 96)))
                       (EXIT
                        (COND
                         ((OR (QEQCAR |k| 1)
                              (NULL (SPADCALL (QCDR |k|) (QREFELT $ 99))))
                          (PROGN
                           (LETT #1# (|spadConstant| $ 89))
                           (GO #2=#:G326))))))
                  (EXIT (|SPADfirst| (SPADCALL (QCDR |k|) (QREFELT $ 99))))))
                #2# (EXIT #1#)))) 

(SDEFUN |EF;specialTrigs;FLU;44|
        ((|x| F)
         (|values| |List| (|Record| (|:| |func| F) (|:| |pole| (|Boolean|))))
         ($ |Union| F "failed"))
        (SPROG
         ((|s| (|Integer|)) (|n| (|Union| (|Integer|) "failed"))
          (|m| (|Integer|)) (|q| (|Fraction| (|Integer|)))
          (|r| (|Union| (|Fraction| (|Integer|)) "failed")) (|y| (F)))
         (SEQ
          (LETT |r|
                (SPADCALL
                 (LETT |y|
                       (SPADCALL |x| (SPADCALL (QREFELT $ 42))
                                 (QREFELT $ 100)))
                 (QREFELT $ 102)))
          (EXIT
           (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                 (#1='T
                  (SEQ (LETT |q| (QCDR |r|))
                       (LETT |m| (SPADCALL |values| (QREFELT $ 105)))
                       (LETT |n| (SPADCALL |q| (QREFELT $ 108)))
                       (EXIT
                        (COND
                         ((QEQCAR |n| 0)
                          (COND
                           ((EVENP (QCDR |n|))
                            (CONS 0
                                  (|EF;valueOrPole|
                                   (SPADCALL |values| |m| (QREFELT $ 109)) $)))
                           (#1#
                            (CONS 0
                                  (|EF;valueOrPole|
                                   (SPADCALL |values| (+ |m| 1)
                                             (QREFELT $ 109))
                                   $)))))
                         (#1#
                          (SEQ
                           (LETT |n|
                                 (SPADCALL (SPADCALL 2 |q| (QREFELT $ 112))
                                           (QREFELT $ 108)))
                           (EXIT
                            (COND
                             ((QEQCAR |n| 0)
                              (SEQ (LETT |s| (|EF;posrem| (QCDR |n|) 4 $))
                                   (EXIT
                                    (COND
                                     ((EQL |s| 1)
                                      (CONS 0
                                            (|EF;valueOrPole|
                                             (SPADCALL |values| (+ |m| 2)
                                                       (QREFELT $ 109))
                                             $)))
                                     (#1#
                                      (CONS 0
                                            (|EF;valueOrPole|
                                             (SPADCALL |values| (+ |m| 3)
                                                       (QREFELT $ 109))
                                             $)))))))
                             (#1#
                              (SEQ
                               (LETT |n|
                                     (SPADCALL (SPADCALL 3 |q| (QREFELT $ 112))
                                               (QREFELT $ 108)))
                               (EXIT
                                (COND
                                 ((QEQCAR |n| 0)
                                  (SEQ (LETT |s| (|EF;posrem| (QCDR |n|) 6 $))
                                       (EXIT
                                        (COND
                                         ((EQL |s| 1)
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 4)
                                                           (QREFELT $ 109))
                                                 $)))
                                         ((EQL |s| 2)
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 5)
                                                           (QREFELT $ 109))
                                                 $)))
                                         ((EQL |s| 4)
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 6)
                                                           (QREFELT $ 109))
                                                 $)))
                                         (#1#
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 7)
                                                           (QREFELT $ 109))
                                                 $)))))))
                                 (#1#
                                  (SEQ
                                   (LETT |n|
                                         (SPADCALL
                                          (SPADCALL 4 |q| (QREFELT $ 112))
                                          (QREFELT $ 108)))
                                   (EXIT
                                    (COND
                                     ((QEQCAR |n| 0)
                                      (SEQ
                                       (LETT |s| (|EF;posrem| (QCDR |n|) 8 $))
                                       (EXIT
                                        (COND
                                         ((EQL |s| 1)
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 8)
                                                           (QREFELT $ 109))
                                                 $)))
                                         ((EQL |s| 3)
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 9)
                                                           (QREFELT $ 109))
                                                 $)))
                                         ((EQL |s| 5)
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 10)
                                                           (QREFELT $ 109))
                                                 $)))
                                         (#1#
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 11)
                                                           (QREFELT $ 109))
                                                 $)))))))
                                     (#1#
                                      (SEQ
                                       (LETT |n|
                                             (SPADCALL
                                              (SPADCALL 6 |q| (QREFELT $ 112))
                                              (QREFELT $ 108)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |n| 0)
                                          (SEQ
                                           (LETT |s|
                                                 (|EF;posrem| (QCDR |n|) 12 $))
                                           (EXIT
                                            (COND
                                             ((EQL |s| 1)
                                              (CONS 0
                                                    (|EF;valueOrPole|
                                                     (SPADCALL |values|
                                                               (+ |m| 12)
                                                               (QREFELT $ 109))
                                                     $)))
                                             ((EQL |s| 5)
                                              (CONS 0
                                                    (|EF;valueOrPole|
                                                     (SPADCALL |values|
                                                               (+ |m| 13)
                                                               (QREFELT $ 109))
                                                     $)))
                                             ((EQL |s| 7)
                                              (CONS 0
                                                    (|EF;valueOrPole|
                                                     (SPADCALL |values|
                                                               (+ |m| 14)
                                                               (QREFELT $ 109))
                                                     $)))
                                             (#1#
                                              (CONS 0
                                                    (|EF;valueOrPole|
                                                     (SPADCALL |values|
                                                               (+ |m| 15)
                                                               (QREFELT $ 109))
                                                     $)))))))
                                         (#1#
                                          (CONS 1
                                                "failed"))))))))))))))))))))))))))) 

(PUT '|EF;specialTrigs;FLU;45| '|SPADreplace|
     '(XLAM (|x| |values|) (CONS 1 "failed"))) 

(SDEFUN |EF;specialTrigs;FLU;45|
        ((|x| F)
         (|values| |List| (|Record| (|:| |func| F) (|:| |pole| (|Boolean|))))
         ($ |Union| F "failed"))
        (CONS 1 "failed")) 

(SDEFUN |EF;isin| ((|x| F) ($ F))
        (SPROG
         ((|u| (|Union| F "failed")) (|s3| (F)) (|s2| (F)) (|h| (F)) (|y| (F)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 115)) (|spadConstant| $ 89))
                (#1='T
                 (SEQ (LETT |y| (|EF;dropfun| |x| $))
                      (EXIT
                       (COND
                        ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 116)) |y|)
                        ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 116))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 48)
                                    (SPADCALL |y| 2 (QREFELT $ 117))
                                    (QREFELT $ 118))
                          (QREFELT $ 50)))
                        ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 116))
                         (SPADCALL |y|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 48)
                                              (SPADCALL |y| 2 (QREFELT $ 117))
                                              (QREFELT $ 119))
                                    (QREFELT $ 50))
                                   (QREFELT $ 100)))
                        ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 116))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 48)
                                     (SPADCALL |y| 2 (QREFELT $ 117))
                                     (QREFELT $ 119))
                           (QREFELT $ 50))
                          (QREFELT $ 120)))
                        ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 116))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                     (|spadConstant| $ 48) (QREFELT $ 118))
                           (QREFELT $ 50))
                          |y| (QREFELT $ 100)))
                        ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 116))
                         (SPADCALL |y| (QREFELT $ 120)))
                        (#1#
                         (SEQ
                          (LETT |h|
                                (SPADCALL (SPADCALL 2 (QREFELT $ 58))
                                          (QREFELT $ 120)))
                          (LETT |s2|
                                (SPADCALL |h| (SPADCALL (QREFELT $ 54))
                                          (QREFELT $ 121)))
                          (LETT |s3|
                                (SPADCALL |h| (SPADCALL (QREFELT $ 55))
                                          (QREFELT $ 121)))
                          (LETT |u|
                                (SPADCALL |x|
                                          (LIST
                                           (CONS (|spadConstant| $ 89) NIL)
                                           (CONS (|spadConstant| $ 89) NIL)
                                           (CONS (|spadConstant| $ 48) NIL)
                                           (CONS
                                            (SPADCALL (|spadConstant| $ 48)
                                                      (QREFELT $ 49))
                                            NIL)
                                           (CONS |s3| NIL) (CONS |s3| NIL)
                                           (CONS (SPADCALL |s3| (QREFELT $ 49))
                                                 NIL)
                                           (CONS (SPADCALL |s3| (QREFELT $ 49))
                                                 NIL)
                                           (CONS |s2| NIL) (CONS |s2| NIL)
                                           (CONS (SPADCALL |s2| (QREFELT $ 49))
                                                 NIL)
                                           (CONS (SPADCALL |s2| (QREFELT $ 49))
                                                 NIL)
                                           (CONS |h| NIL) (CONS |h| NIL)
                                           (CONS (SPADCALL |h| (QREFELT $ 49))
                                                 NIL)
                                           (CONS (SPADCALL |h| (QREFELT $ 49))
                                                 NIL))
                                          (QREFELT $ 114)))
                          (EXIT
                           (COND ((QEQCAR |u| 0) (QCDR |u|))
                                 (#1#
                                  (SPADCALL (QREFELT $ 16) |x|
                                            (QREFELT $ 122))))))))))))))) 

(SDEFUN |EF;icos| ((|x| F) ($ F))
        (SPROG
         ((|u| (|Union| F "failed")) (|s3| (F)) (|s2| (F)) (|h| (F)) (|y| (F)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 115)) (|spadConstant| $ 48))
                (#1='T
                 (SEQ (LETT |y| (|EF;dropfun| |x| $))
                      (EXIT
                       (COND
                        ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 116))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 48)
                                    (SPADCALL |y| 2 (QREFELT $ 117))
                                    (QREFELT $ 118))
                          (QREFELT $ 50)))
                        ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 116)) |y|)
                        ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 116))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 48)
                                     (SPADCALL |y| 2 (QREFELT $ 117))
                                     (QREFELT $ 119))
                           (QREFELT $ 50))
                          (QREFELT $ 120)))
                        ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 116))
                         (SPADCALL |y|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 48)
                                              (SPADCALL |y| 2 (QREFELT $ 117))
                                              (QREFELT $ 119))
                                    (QREFELT $ 50))
                                   (QREFELT $ 100)))
                        ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 116))
                         (SPADCALL |y| (QREFELT $ 120)))
                        ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 116))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                     (|spadConstant| $ 48) (QREFELT $ 118))
                           (QREFELT $ 50))
                          |y| (QREFELT $ 100)))
                        (#1#
                         (SEQ
                          (LETT |h|
                                (SPADCALL (SPADCALL 2 (QREFELT $ 58))
                                          (QREFELT $ 120)))
                          (LETT |s2|
                                (SPADCALL |h| (SPADCALL (QREFELT $ 54))
                                          (QREFELT $ 121)))
                          (LETT |s3|
                                (SPADCALL |h| (SPADCALL (QREFELT $ 55))
                                          (QREFELT $ 121)))
                          (LETT |u|
                                (SPADCALL |x|
                                          (LIST
                                           (CONS (|spadConstant| $ 48) NIL)
                                           (CONS
                                            (SPADCALL (|spadConstant| $ 48)
                                                      (QREFELT $ 49))
                                            NIL)
                                           (CONS (|spadConstant| $ 89) NIL)
                                           (CONS (|spadConstant| $ 89) NIL)
                                           (CONS |h| NIL)
                                           (CONS (SPADCALL |h| (QREFELT $ 49))
                                                 NIL)
                                           (CONS (SPADCALL |h| (QREFELT $ 49))
                                                 NIL)
                                           (CONS |h| NIL) (CONS |s2| NIL)
                                           (CONS (SPADCALL |s2| (QREFELT $ 49))
                                                 NIL)
                                           (CONS (SPADCALL |s2| (QREFELT $ 49))
                                                 NIL)
                                           (CONS |s2| NIL) (CONS |s3| NIL)
                                           (CONS (SPADCALL |s3| (QREFELT $ 49))
                                                 NIL)
                                           (CONS (SPADCALL |s3| (QREFELT $ 49))
                                                 NIL)
                                           (CONS |s3| NIL))
                                          (QREFELT $ 114)))
                          (EXIT
                           (COND ((QEQCAR |u| 0) (QCDR |u|))
                                 (#1#
                                  (SPADCALL (QREFELT $ 17) |x|
                                            (QREFELT $ 122))))))))))))))) 

(SDEFUN |EF;itan| ((|x| F) ($ F))
        (SPROG ((|u| (|Union| F "failed")) (|s33| (F)) (|s3| (F)) (|y| (F)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 115)) (|spadConstant| $ 89))
                      (#1='T
                       (SEQ (LETT |y| (|EF;dropfun| |x| $))
                            (EXIT
                             (COND
                              ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 116))
                               (SPADCALL |y|
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 48)
                                                    (SPADCALL |y| 2
                                                              (QREFELT $ 117))
                                                    (QREFELT $ 118))
                                          (QREFELT $ 50))
                                         (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 48)
                                           (SPADCALL |y| 2 (QREFELT $ 117))
                                           (QREFELT $ 118))
                                 (QREFELT $ 50))
                                |y| (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 116))
                               |y|)
                              ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 116))
                               (SPADCALL |y| (QREFELT $ 120)))
                              ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                          (|spadConstant| $ 48)
                                          (QREFELT $ 118))
                                (QREFELT $ 50)))
                              ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 118))
                                 (QREFELT $ 50))
                                (QREFELT $ 120)))
                              (#1#
                               (SEQ
                                (LETT |s33|
                                      (SPADCALL
                                       (LETT |s3| (SPADCALL (QREFELT $ 55)))
                                       (SPADCALL 3 (QREFELT $ 58))
                                       (QREFELT $ 100)))
                                (LETT |u|
                                      (SPADCALL |x|
                                                (LIST
                                                 (CONS (|spadConstant| $ 89)
                                                       NIL)
                                                 (CONS (|spadConstant| $ 89)
                                                       NIL)
                                                 (CONS (|spadConstant| $ 89)
                                                       'T)
                                                 (CONS (|spadConstant| $ 89)
                                                       'T)
                                                 (CONS |s3| NIL)
                                                 (CONS
                                                  (SPADCALL |s3|
                                                            (QREFELT $ 49))
                                                  NIL)
                                                 (CONS |s3| NIL)
                                                 (CONS
                                                  (SPADCALL |s3|
                                                            (QREFELT $ 49))
                                                  NIL)
                                                 (CONS (|spadConstant| $ 48)
                                                       NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (|spadConstant| $ 48)
                                                   (QREFELT $ 49))
                                                  NIL)
                                                 (CONS (|spadConstant| $ 48)
                                                       NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (|spadConstant| $ 48)
                                                   (QREFELT $ 49))
                                                  NIL)
                                                 (CONS |s33| NIL)
                                                 (CONS
                                                  (SPADCALL |s33|
                                                            (QREFELT $ 49))
                                                  NIL)
                                                 (CONS |s33| NIL)
                                                 (CONS
                                                  (SPADCALL |s33|
                                                            (QREFELT $ 49))
                                                  NIL))
                                                (QREFELT $ 114)))
                                (EXIT
                                 (COND ((QEQCAR |u| 0) (QCDR |u|))
                                       (#1#
                                        (SPADCALL (QREFELT $ 18) |x|
                                                  (QREFELT $ 122))))))))))))))) 

(SDEFUN |EF;icot| ((|x| F) ($ F))
        (SPROG ((|u| (|Union| F "failed")) (|s33| (F)) (|s3| (F)) (|y| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 115)) (|error| "Invalid argument"))
                 (#1='T
                  (SEQ (LETT |y| (|EF;dropfun| |x| $))
                       (EXIT
                        (COND
                         ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 116))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 48)
                                      (SPADCALL |y| 2 (QREFELT $ 117))
                                      (QREFELT $ 118))
                            (QREFELT $ 50))
                           |y| (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 116))
                          (SPADCALL |y|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 48)
                                               (SPADCALL |y| 2 (QREFELT $ 117))
                                               (QREFELT $ 118))
                                     (QREFELT $ 50))
                                    (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 116))
                          (SPADCALL |y| (QREFELT $ 120)))
                         ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 116)) |y|)
                         ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 116))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                      (|spadConstant| $ 48) (QREFELT $ 118))
                            (QREFELT $ 50))
                           (QREFELT $ 120)))
                         ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 116))
                          (SPADCALL
                           (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                     (|spadConstant| $ 48) (QREFELT $ 118))
                           (QREFELT $ 50)))
                         (#1#
                          (SEQ
                           (LETT |s33|
                                 (SPADCALL
                                  (LETT |s3| (SPADCALL (QREFELT $ 55)))
                                  (SPADCALL 3 (QREFELT $ 58)) (QREFELT $ 100)))
                           (LETT |u|
                                 (SPADCALL |x|
                                           (LIST
                                            (CONS (|spadConstant| $ 89) 'T)
                                            (CONS (|spadConstant| $ 89) 'T)
                                            (CONS (|spadConstant| $ 89) NIL)
                                            (CONS (|spadConstant| $ 89) NIL)
                                            (CONS |s33| NIL)
                                            (CONS
                                             (SPADCALL |s33| (QREFELT $ 49))
                                             NIL)
                                            (CONS |s33| NIL)
                                            (CONS
                                             (SPADCALL |s33| (QREFELT $ 49))
                                             NIL)
                                            (CONS (|spadConstant| $ 48) NIL)
                                            (CONS
                                             (SPADCALL (|spadConstant| $ 48)
                                                       (QREFELT $ 49))
                                             NIL)
                                            (CONS (|spadConstant| $ 48) NIL)
                                            (CONS
                                             (SPADCALL (|spadConstant| $ 48)
                                                       (QREFELT $ 49))
                                             NIL)
                                            (CONS |s3| NIL)
                                            (CONS
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             NIL)
                                            (CONS |s3| NIL)
                                            (CONS
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             NIL))
                                           (QREFELT $ 114)))
                           (EXIT
                            (COND ((QEQCAR |u| 0) (QCDR |u|))
                                  (#1#
                                   (SPADCALL (QREFELT $ 19) |x|
                                             (QREFELT $ 122))))))))))))))) 

(SDEFUN |EF;isec| ((|x| F) ($ F))
        (SPROG
         ((|u| (|Union| F "failed")) (|h| (F)) (|s3| (F)) (|s2| (F)) (|y| (F)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 115)) (|spadConstant| $ 48))
                (#1='T
                 (SEQ (LETT |y| (|EF;dropfun| |x| $))
                      (EXIT
                       (COND
                        ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 116))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 48)
                                     (SPADCALL |y| 2 (QREFELT $ 117))
                                     (QREFELT $ 118))
                           (QREFELT $ 50))
                          (QREFELT $ 120)))
                        ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 116))
                         (SPADCALL |y| (QREFELT $ 120)))
                        ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 116))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 48)
                                    (SPADCALL |y| 2 (QREFELT $ 117))
                                    (QREFELT $ 119))
                          (QREFELT $ 50)))
                        ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 116))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 48)
                                     (SPADCALL |y| 2 (QREFELT $ 117))
                                     (QREFELT $ 119))
                           (QREFELT $ 50))
                          |y| (QREFELT $ 100)))
                        ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 116)) |y|)
                        ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 116))
                         (SPADCALL |y|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                              (|spadConstant| $ 48)
                                              (QREFELT $ 118))
                                    (QREFELT $ 50))
                                   (QREFELT $ 100)))
                        (#1#
                         (SEQ (LETT |s2| (SPADCALL (QREFELT $ 54)))
                              (LETT |s3|
                                    (SPADCALL
                                     (SPADCALL 2 (SPADCALL (QREFELT $ 55))
                                               (QREFELT $ 123))
                                     (SPADCALL 3 (QREFELT $ 58))
                                     (QREFELT $ 100)))
                              (LETT |h| (SPADCALL 2 (QREFELT $ 58)))
                              (LETT |u|
                                    (SPADCALL |x|
                                              (LIST
                                               (CONS (|spadConstant| $ 48) NIL)
                                               (CONS
                                                (SPADCALL (|spadConstant| $ 48)
                                                          (QREFELT $ 49))
                                                NIL)
                                               (CONS (|spadConstant| $ 89) 'T)
                                               (CONS (|spadConstant| $ 89) 'T)
                                               (CONS |h| NIL)
                                               (CONS
                                                (SPADCALL |h| (QREFELT $ 49))
                                                NIL)
                                               (CONS
                                                (SPADCALL |h| (QREFELT $ 49))
                                                NIL)
                                               (CONS |h| NIL) (CONS |s2| NIL)
                                               (CONS
                                                (SPADCALL |s2| (QREFELT $ 49))
                                                NIL)
                                               (CONS
                                                (SPADCALL |s2| (QREFELT $ 49))
                                                NIL)
                                               (CONS |s2| NIL) (CONS |s3| NIL)
                                               (CONS
                                                (SPADCALL |s3| (QREFELT $ 49))
                                                NIL)
                                               (CONS
                                                (SPADCALL |s3| (QREFELT $ 49))
                                                NIL)
                                               (CONS |s3| NIL))
                                              (QREFELT $ 114)))
                              (EXIT
                               (COND ((QEQCAR |u| 0) (QCDR |u|))
                                     (#1#
                                      (SPADCALL (QREFELT $ 20) |x|
                                                (QREFELT $ 122))))))))))))))) 

(SDEFUN |EF;icsc| ((|x| F) ($ F))
        (SPROG
         ((|u| (|Union| F "failed")) (|h| (F)) (|s3| (F)) (|s2| (F)) (|y| (F)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 115)) (|error| "Invalid argument"))
                (#1='T
                 (SEQ (LETT |y| (|EF;dropfun| |x| $))
                      (EXIT
                       (COND
                        ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 116))
                         (SPADCALL |y| (QREFELT $ 120)))
                        ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 116))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 48)
                                     (SPADCALL |y| 2 (QREFELT $ 117))
                                     (QREFELT $ 118))
                           (QREFELT $ 50))
                          (QREFELT $ 120)))
                        ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 116))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 48)
                                     (SPADCALL |y| 2 (QREFELT $ 117))
                                     (QREFELT $ 119))
                           (QREFELT $ 50))
                          |y| (QREFELT $ 100)))
                        ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 116))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 48)
                                    (SPADCALL |y| 2 (QREFELT $ 117))
                                    (QREFELT $ 119))
                          (QREFELT $ 50)))
                        ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 116))
                         (SPADCALL |y|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                              (|spadConstant| $ 48)
                                              (QREFELT $ 118))
                                    (QREFELT $ 50))
                                   (QREFELT $ 100)))
                        ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 116)) |y|)
                        (#1#
                         (SEQ (LETT |s2| (SPADCALL (QREFELT $ 54)))
                              (LETT |s3|
                                    (SPADCALL
                                     (SPADCALL 2 (SPADCALL (QREFELT $ 55))
                                               (QREFELT $ 123))
                                     (SPADCALL 3 (QREFELT $ 58))
                                     (QREFELT $ 100)))
                              (LETT |h| (SPADCALL 2 (QREFELT $ 58)))
                              (LETT |u|
                                    (SPADCALL |x|
                                              (LIST
                                               (CONS (|spadConstant| $ 89) 'T)
                                               (CONS (|spadConstant| $ 89) 'T)
                                               (CONS (|spadConstant| $ 48) NIL)
                                               (CONS
                                                (SPADCALL (|spadConstant| $ 48)
                                                          (QREFELT $ 49))
                                                NIL)
                                               (CONS |s3| NIL) (CONS |s3| NIL)
                                               (CONS
                                                (SPADCALL |s3| (QREFELT $ 49))
                                                NIL)
                                               (CONS
                                                (SPADCALL |s3| (QREFELT $ 49))
                                                NIL)
                                               (CONS |s2| NIL) (CONS |s2| NIL)
                                               (CONS
                                                (SPADCALL |s2| (QREFELT $ 49))
                                                NIL)
                                               (CONS
                                                (SPADCALL |s2| (QREFELT $ 49))
                                                NIL)
                                               (CONS |h| NIL) (CONS |h| NIL)
                                               (CONS
                                                (SPADCALL |h| (QREFELT $ 49))
                                                NIL)
                                               (CONS
                                                (SPADCALL |h| (QREFELT $ 49))
                                                NIL))
                                              (QREFELT $ 114)))
                              (EXIT
                               (COND ((QEQCAR |u| 0) (QCDR |u|))
                                     (#1#
                                      (SPADCALL (QREFELT $ 21) |x|
                                                (QREFELT $ 122))))))))))))))) 

(SDEFUN |EF;iasin| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 115)) (|spadConstant| $ 89))
              ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 124))
               (SPADCALL (SPADCALL (QREFELT $ 42)) (SPADCALL 2 (QREFELT $ 58))
                         (QREFELT $ 100)))
              (#1='T
               (COND
                ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                           (QREFELT $ 124))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT $ 42))
                            (SPADCALL 2 (QREFELT $ 58)) (QREFELT $ 100))
                  (QREFELT $ 49)))
                (#1# (SPADCALL (QREFELT $ 22) |x| (QREFELT $ 122))))))) 

(SDEFUN |EF;iacos| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 115))
          (SPADCALL (SPADCALL (QREFELT $ 42)) (SPADCALL 2 (QREFELT $ 58))
                    (QREFELT $ 100)))
         ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 124))
          (|spadConstant| $ 89))
         (#1='T
          (COND
           ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                      (QREFELT $ 124))
            (SPADCALL (QREFELT $ 42)))
           (#1# (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 122))))))) 

(SDEFUN |EF;iatan| ((|x| F) ($ F))
        (SPROG ((|r3| (F)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 115)) (|spadConstant| $ 89))
                      ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 124))
                       (SPADCALL (SPADCALL (QREFELT $ 42))
                                 (SPADCALL 4 (QREFELT $ 58)) (QREFELT $ 100)))
                      (#1='T
                       (COND
                        ((SPADCALL |x|
                                   (SPADCALL (|spadConstant| $ 48)
                                             (QREFELT $ 49))
                                   (QREFELT $ 124))
                         (SPADCALL
                          (SPADCALL (SPADCALL (QREFELT $ 42))
                                    (SPADCALL 4 (QREFELT $ 58))
                                    (QREFELT $ 100))
                          (QREFELT $ 49)))
                        (#1#
                         (SEQ (LETT |r3| (SPADCALL (QREFELT $ 55)))
                              (EXIT
                               (COND
                                ((SPADCALL |x| |r3| (QREFELT $ 124))
                                 (SPADCALL (SPADCALL (QREFELT $ 42))
                                           (SPADCALL 3 (QREFELT $ 58))
                                           (QREFELT $ 100)))
                                ((SPADCALL (SPADCALL |x| |r3| (QREFELT $ 121))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 124))
                                 (SPADCALL (SPADCALL (QREFELT $ 42))
                                           (SPADCALL 6 (QREFELT $ 58))
                                           (QREFELT $ 100)))
                                (#1#
                                 (SPADCALL (QREFELT $ 24) |x|
                                           (QREFELT $ 122))))))))))))) 

(SDEFUN |EF;iacot| ((|x| F) ($ F))
        (SPROG ((|xx| (F)) (|r3| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 115))
                  (SPADCALL (SPADCALL (QREFELT $ 42))
                            (SPADCALL 2 (QREFELT $ 58)) (QREFELT $ 100)))
                 ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 124))
                  (SPADCALL (SPADCALL (QREFELT $ 42))
                            (SPADCALL 4 (QREFELT $ 58)) (QREFELT $ 100)))
                 (#1='T
                  (COND
                   ((SPADCALL |x|
                              (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                              (QREFELT $ 124))
                    (SPADCALL
                     (SPADCALL 3 (SPADCALL (QREFELT $ 42)) (QREFELT $ 123))
                     (SPADCALL 4 (QREFELT $ 58)) (QREFELT $ 100)))
                   (#1#
                    (SEQ (LETT |r3| (SPADCALL (QREFELT $ 55)))
                         (EXIT
                          (COND
                           ((SPADCALL |x| |r3| (QREFELT $ 124))
                            (SPADCALL (SPADCALL (QREFELT $ 42))
                                      (SPADCALL 6 (QREFELT $ 58))
                                      (QREFELT $ 100)))
                           ((SPADCALL |x| (SPADCALL |r3| (QREFELT $ 49))
                                      (QREFELT $ 124))
                            (SPADCALL
                             (SPADCALL 5 (SPADCALL (QREFELT $ 42))
                                       (QREFELT $ 123))
                             (SPADCALL 6 (QREFELT $ 58)) (QREFELT $ 100)))
                           (#1#
                            (SEQ
                             (LETT |xx| (SPADCALL |x| |r3| (QREFELT $ 121)))
                             (EXIT
                              (COND
                               ((SPADCALL |xx| (|spadConstant| $ 48)
                                          (QREFELT $ 124))
                                (SPADCALL (SPADCALL (QREFELT $ 42))
                                          (SPADCALL 3 (QREFELT $ 58))
                                          (QREFELT $ 100)))
                               ((SPADCALL |xx|
                                          (SPADCALL (|spadConstant| $ 48)
                                                    (QREFELT $ 49))
                                          (QREFELT $ 124))
                                (SPADCALL
                                 (SPADCALL 2 (SPADCALL (QREFELT $ 42))
                                           (QREFELT $ 123))
                                 (SPADCALL 3 (QREFELT $ 58)) (QREFELT $ 100)))
                               (#1#
                                (SPADCALL (QREFELT $ 25) |x|
                                          (QREFELT $ 122))))))))))))))))) 

(SDEFUN |EF;iasec| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 115)) (|error| "Invalid argument"))
              ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 124))
               (|spadConstant| $ 89))
              (#1='T
               (COND
                ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                           (QREFELT $ 124))
                 (SPADCALL (QREFELT $ 42)))
                (#1# (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 122))))))) 

(SDEFUN |EF;iacsc| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 115)) (|error| "Invalid argument"))
              ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 124))
               (SPADCALL (SPADCALL (QREFELT $ 42)) (SPADCALL 2 (QREFELT $ 58))
                         (QREFELT $ 100)))
              (#1='T
               (COND
                ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                           (QREFELT $ 124))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT $ 42))
                            (SPADCALL 2 (QREFELT $ 58)) (QREFELT $ 100))
                  (QREFELT $ 49)))
                (#1# (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 122))))))) 

(SDEFUN |EF;isinh| ((|x| F) ($ F))
        (SPROG ((|y| (F)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 115)) (|spadConstant| $ 89))
                      (#1='T
                       (SEQ (LETT |y| (|EF;dropfun| |x| $))
                            (EXIT
                             (COND
                              ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 116))
                               |y|)
                              ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                          (|spadConstant| $ 48)
                                          (QREFELT $ 118))
                                (QREFELT $ 50)))
                              ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 116))
                               (SPADCALL |y|
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 48)
                                                    (SPADCALL |y| 2
                                                              (QREFELT $ 117))
                                                    (QREFELT $ 118))
                                          (QREFELT $ 50))
                                         (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                            (|spadConstant| $ 48)
                                            (QREFELT $ 118))
                                  (QREFELT $ 50))
                                 (QREFELT $ 120))
                                (QREFELT $ 49)))
                              ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 48)
                                           (SPADCALL |y| 2 (QREFELT $ 117))
                                           (QREFELT $ 118))
                                 (QREFELT $ 50))
                                |y| (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 116))
                               (SPADCALL |y| (QREFELT $ 120)))
                              (#1#
                               (SPADCALL (QREFELT $ 28) |x|
                                         (QREFELT $ 122))))))))))) 

(SDEFUN |EF;icosh| ((|x| F) ($ F))
        (SPROG ((|y| (F)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 115)) (|spadConstant| $ 48))
                      (#1='T
                       (SEQ (LETT |y| (|EF;dropfun| |x| $))
                            (EXIT
                             (COND
                              ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                          (|spadConstant| $ 48)
                                          (QREFELT $ 119))
                                (QREFELT $ 50)))
                              ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 116))
                               |y|)
                              ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 48)
                                           (SPADCALL |y| 2 (QREFELT $ 117))
                                           (QREFELT $ 118))
                                 (QREFELT $ 50))
                                (QREFELT $ 120)))
                              ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 116))
                               (SPADCALL |y|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |y| 2 (QREFELT $ 117))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 118))
                                          (QREFELT $ 50))
                                         (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 116))
                               (SPADCALL |y| (QREFELT $ 120)))
                              ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 119))
                                 (QREFELT $ 50))
                                |y| (QREFELT $ 100)))
                              (#1#
                               (SPADCALL (QREFELT $ 29) |x|
                                         (QREFELT $ 122))))))))))) 

(SDEFUN |EF;itanh| ((|x| F) ($ F))
        (SPROG ((|y| (F)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 115)) (|spadConstant| $ 89))
                      (#1='T
                       (SEQ (LETT |y| (|EF;dropfun| |x| $))
                            (EXIT
                             (COND
                              ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 116))
                               (SPADCALL |y|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |y| 2 (QREFELT $ 117))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 119))
                                          (QREFELT $ 50))
                                         (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 118))
                                 (QREFELT $ 50))
                                |y| (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 116))
                               |y|)
                              ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 116))
                               (SPADCALL |y| (QREFELT $ 120)))
                              ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 48)
                                          (SPADCALL |y| 2 (QREFELT $ 117))
                                          (QREFELT $ 118))
                                (QREFELT $ 50)))
                              ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 119))
                                 (QREFELT $ 50))
                                (QREFELT $ 120)))
                              (#1#
                               (SPADCALL (QREFELT $ 30) |x|
                                         (QREFELT $ 122))))))))))) 

(SDEFUN |EF;icoth| ((|x| F) ($ F))
        (SPROG ((|y| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 115)) (|error| "Invalid argument"))
                 (#1='T
                  (SEQ (LETT |y| (|EF;dropfun| |x| $))
                       (EXIT
                        (COND
                         ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 116))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                      (|spadConstant| $ 48) (QREFELT $ 119))
                            (QREFELT $ 50))
                           |y| (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 116))
                          (SPADCALL |y|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                               (|spadConstant| $ 48)
                                               (QREFELT $ 118))
                                     (QREFELT $ 50))
                                    (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 116))
                          (SPADCALL |y| (QREFELT $ 120)))
                         ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 116)) |y|)
                         ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 116))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 48)
                                      (SPADCALL |y| 2 (QREFELT $ 117))
                                      (QREFELT $ 118))
                            (QREFELT $ 50))
                           (QREFELT $ 120)))
                         ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 116))
                          (SPADCALL
                           (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                     (|spadConstant| $ 48) (QREFELT $ 119))
                           (QREFELT $ 50)))
                         (#1#
                          (SPADCALL (QREFELT $ 31) |x| (QREFELT $ 122))))))))))) 

(SDEFUN |EF;isech| ((|x| F) ($ F))
        (SPROG ((|y| (F)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 115)) (|spadConstant| $ 48))
                      (#1='T
                       (SEQ (LETT |y| (|EF;dropfun| |x| $))
                            (EXIT
                             (COND
                              ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 119))
                                 (QREFELT $ 50))
                                (QREFELT $ 120)))
                              ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 116))
                               (SPADCALL |y| (QREFELT $ 120)))
                              ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 48)
                                          (SPADCALL |y| 2 (QREFELT $ 117))
                                          (QREFELT $ 118))
                                (QREFELT $ 50)))
                              ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 116))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 118))
                                 (QREFELT $ 50))
                                |y| (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 116))
                               |y|)
                              ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 116))
                               (SPADCALL |y|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |y| 2 (QREFELT $ 117))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 119))
                                          (QREFELT $ 50))
                                         (QREFELT $ 100)))
                              (#1#
                               (SPADCALL (QREFELT $ 32) |x|
                                         (QREFELT $ 122))))))))))) 

(SDEFUN |EF;icsch| ((|x| F) ($ F))
        (SPROG ((|y| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 115)) (|error| "Invalid argument"))
                 (#1='T
                  (SEQ (LETT |y| (|EF;dropfun| |x| $))
                       (EXIT
                        (COND
                         ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 116))
                          (SPADCALL |y| (QREFELT $ 120)))
                         ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 116))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                      (|spadConstant| $ 48) (QREFELT $ 118))
                            (QREFELT $ 50))
                           (QREFELT $ 120)))
                         ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 116))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 48)
                                      (SPADCALL |y| 2 (QREFELT $ 117))
                                      (QREFELT $ 118))
                            (QREFELT $ 50))
                           |y| (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 116))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |y| 2 (QREFELT $ 117))
                                      (|spadConstant| $ 48) (QREFELT $ 118))
                            (QREFELT $ 50))
                           (QREFELT $ 49)))
                         ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 116))
                          (SPADCALL |y|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 48)
                                               (SPADCALL |y| 2 (QREFELT $ 117))
                                               (QREFELT $ 118))
                                     (QREFELT $ 50))
                                    (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 116)) |y|)
                         (#1#
                          (SPADCALL (QREFELT $ 33) |x| (QREFELT $ 122))))))))))) 

(SDEFUN |EF;iasinh| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 34) |x| (QREFELT $ 122))) 

(SDEFUN |EF;iacosh| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 35) |x| (QREFELT $ 122))) 

(SDEFUN |EF;iatanh| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 36) |x| (QREFELT $ 122))) 

(SDEFUN |EF;iacoth| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 115)) (|error| "Invalid argument"))
              ('T (SPADCALL (QREFELT $ 37) |x| (QREFELT $ 122))))) 

(SDEFUN |EF;iasech| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 115)) (|error| "Invalid argument"))
              ('T (SPADCALL (QREFELT $ 38) |x| (QREFELT $ 122))))) 

(SDEFUN |EF;iacsch| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 115)) (|error| "Invalid argument"))
              ('T (SPADCALL (QREFELT $ 39) |x| (QREFELT $ 122))))) 

(SDEFUN |EF;iexp| ((|x| F) ($ F))
        (SPROG
         ((|u| (|Union| F "failed")) (|s3| (F)) (|s2| (F)) (|h| (F)) (|y| (F))
          (|xi| (F)) (|i| (F)) (#1=#:G539 NIL) (|kx| (|Kernel| F))
          (|kxu| (|Union| (|Kernel| F) "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 115)) (|spadConstant| $ 48))
                ((SPADCALL |x| (QREFELT $ 14) (QREFELT $ 116))
                 (|SPADfirst| (SPADCALL (|EF;kernel| |x| $) (QREFELT $ 99))))
                (#2='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ (LETT |kxu| (SPADCALL |x| (QREFELT $ 96)))
                         (EXIT
                          (COND
                           ((QEQCAR |kxu| 0)
                            (COND
                             ((SPADCALL (LETT |kx| (QCDR |kxu|)) '|lambertW|
                                        (QREFELT $ 125))
                              (PROGN
                               (LETT #1#
                                     (SPADCALL
                                      (|SPADfirst|
                                       (SPADCALL |kx| (QREFELT $ 99)))
                                      |x| (QREFELT $ 100)))
                               (GO #3=#:G535))))))))
                    (COND
                     ((SPADCALL |x| (|spadConstant| $ 89) (QREFELT $ 126))
                      (COND
                       ((NULL (SPADCALL |x| (QREFELT $ 128)))
                        (EXIT
                         (SPADCALL (|EF;iexp| (SPADCALL |x| (QREFELT $ 49)) $)
                                   (QREFELT $ 120)))))))
                    (EXIT
                     (COND
                      ((|HasCategory| (QREFELT $ 6)
                                      (LIST '|RetractableTo| '(|Integer|)))
                       (SEQ (LETT |i| (|EF;iisqrt1| $))
                            (LETT |xi| (SPADCALL |x| |i| (QREFELT $ 100)))
                            (LETT |y|
                                  (SPADCALL |xi| (SPADCALL (QREFELT $ 42))
                                            (QREFELT $ 100)))
                            (EXIT
                             (COND
                              ((QEQCAR (SPADCALL |y| (QREFELT $ 102)) 1)
                               (SPADCALL (QREFELT $ 15) |x| (QREFELT $ 122)))
                              (#2#
                               (SEQ
                                (LETT |h|
                                      (SPADCALL (SPADCALL 2 (QREFELT $ 58))
                                                (QREFELT $ 120)))
                                (LETT |s2|
                                      (SPADCALL |h| (SPADCALL (QREFELT $ 54))
                                                (QREFELT $ 121)))
                                (LETT |s3|
                                      (SPADCALL |h| (SPADCALL (QREFELT $ 55))
                                                (QREFELT $ 121)))
                                (LETT |u|
                                      (SPADCALL |xi|
                                                (LIST
                                                 (CONS (|spadConstant| $ 48)
                                                       NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (|spadConstant| $ 48)
                                                   (QREFELT $ 49))
                                                  NIL)
                                                 (CONS |i| NIL)
                                                 (CONS
                                                  (SPADCALL |i| (QREFELT $ 49))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL |h|
                                                            (SPADCALL |i| |s3|
                                                                      (QREFELT
                                                                       $ 121))
                                                            (QREFELT $ 119))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |h|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |i| |s3|
                                                             (QREFELT $ 121))
                                                   (QREFELT $ 119))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |h|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |i| |s3|
                                                             (QREFELT $ 121))
                                                   (QREFELT $ 118))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL |h|
                                                            (SPADCALL |i| |s3|
                                                                      (QREFELT
                                                                       $ 121))
                                                            (QREFELT $ 118))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL |s2|
                                                            (SPADCALL |i| |s2|
                                                                      (QREFELT
                                                                       $ 121))
                                                            (QREFELT $ 119))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |s2|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |i| |s2|
                                                             (QREFELT $ 121))
                                                   (QREFELT $ 119))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |s2|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |i| |s2|
                                                             (QREFELT $ 121))
                                                   (QREFELT $ 118))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL |s2|
                                                            (SPADCALL |i| |s2|
                                                                      (QREFELT
                                                                       $ 121))
                                                            (QREFELT $ 118))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL |s3|
                                                            (SPADCALL |i| |h|
                                                                      (QREFELT
                                                                       $ 121))
                                                            (QREFELT $ 119))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |s3|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |i| |h|
                                                             (QREFELT $ 121))
                                                   (QREFELT $ 119))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |s3|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |i| |h|
                                                             (QREFELT $ 121))
                                                   (QREFELT $ 118))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL |s3|
                                                            (SPADCALL |i| |h|
                                                                      (QREFELT
                                                                       $ 121))
                                                            (QREFELT $ 118))
                                                  NIL))
                                                (QREFELT $ 114)))
                                (EXIT
                                 (COND ((QEQCAR |u| 0) (QCDR |u|))
                                       (#2#
                                        (SPADCALL (QREFELT $ 15) |x|
                                                  (QREFELT $ 122)))))))))))
                      (#2# (SPADCALL (QREFELT $ 15) |x| (QREFELT $ 122)))))))
                  #3# (EXIT #1#))))))) 

(SDEFUN |EF;localReal?;FB;71| ((|x| F) ($ |Boolean|))
        (SPROG ((|u| (|Union| R "failed")))
               (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (SPADCALL (QCDR |u|)
                                 (SPADCALL (QCDR |u|) (QREFELT $ 131))
                                 (QREFELT $ 132)))
                      ('T NIL)))))) 

(PUT '|EF;localReal?;FB;72| '|SPADreplace| '(XLAM (|x|) 'T)) 

(SDEFUN |EF;localReal?;FB;72| ((|x| F) ($ |Boolean|)) 'T) 

(PUT '|EF;localReal?;FB;73| '|SPADreplace| '(XLAM (|x|) 'T)) 

(SDEFUN |EF;localReal?;FB;73| ((|x| F) ($ |Boolean|)) 'T) 

(SDEFUN |EF;iiilog| ((|x| F) ($ F))
        (SPROG
         ((|arg| (F))
          (|rec|
           (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|)))
            "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 115)) (|error| "Invalid argument"))
                ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 124))
                 (|spadConstant| $ 89))
                (#1='T
                 (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 15) (QREFELT $ 136)))
                      (EXIT
                       (COND
                        ((QEQCAR |u| 0)
                         (SEQ (LETT |rec| (QCDR |u|))
                              (LETT |arg|
                                    (|SPADfirst|
                                     (SPADCALL (QCAR |rec|) (QREFELT $ 99))))
                              (EXIT
                               (COND
                                ((SPADCALL |arg| (QREFELT $ 133))
                                 (SPADCALL (QCDR |rec|)
                                           (|SPADfirst|
                                            (SPADCALL (QCAR |rec|)
                                                      (QREFELT $ 99)))
                                           (QREFELT $ 137)))
                                (#1# (|EF;ilog| |x| $))))))
                        (#1# (|EF;ilog| |x| $)))))))))) 

(SDEFUN |EF;ilog| ((|x| F) ($ F))
        (SPROG
         ((#1=#:G563 NIL)
          (|den| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|num1| (|Boolean|))
          (|num| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |num1|
                   (SPADCALL (LETT |num| (SPADCALL |x| (QREFELT $ 139)))
                             (|spadConstant| $ 141) (QREFELT $ 142)))
             (EXIT
              (COND
               ((OR |num1|
                    (SPADCALL |num|
                              (SPADCALL (|spadConstant| $ 141) (QREFELT $ 145))
                              (QREFELT $ 142)))
                (COND
                 ((SPADCALL (LETT |den| (SPADCALL |x| (QREFELT $ 143)))
                            (|spadConstant| $ 141) (QREFELT $ 144))
                  (COND
                   ((NULL (SPADCALL |x| (QREFELT $ 128)))
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL (QREFELT $ 14)
                                      (SPADCALL
                                       (COND (|num1| |den|)
                                             ('T
                                              (SPADCALL |den|
                                                        (QREFELT $ 145))))
                                       (QREFELT $ 146))
                                      (QREFELT $ 122))
                            (QREFELT $ 49)))
                     (GO #2=#:G561))))))))))
            (EXIT (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 122)))))
          #2# (EXIT #1#)))) 

(SDEFUN |EF;iilog;2F;76| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iiilog| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 147))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiexp;2F;77| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iexp| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 149))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iilog;2F;78| ((|x| F) ($ F)) (|EF;iiilog| |x| $)) 

(SDEFUN |EF;iiexp;2F;79| ((|x| F) ($ F)) (|EF;iexp| |x| $)) 

(SDEFUN |EF;iisin;2F;80| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;isin| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 151))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iicos;2F;81| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;icos| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 153))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iitan;2F;82| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;itan| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 155))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iicot;2F;83| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;icot| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 157))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iisec;2F;84| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;isec| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 159))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iicsc;2F;85| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;icsc| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 161))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iisin;2F;86| ((|x| F) ($ F)) (|EF;isin| |x| $)) 

(SDEFUN |EF;iicos;2F;87| ((|x| F) ($ F)) (|EF;icos| |x| $)) 

(SDEFUN |EF;iitan;2F;88| ((|x| F) ($ F)) (|EF;itan| |x| $)) 

(SDEFUN |EF;iicot;2F;89| ((|x| F) ($ F)) (|EF;icot| |x| $)) 

(SDEFUN |EF;iisec;2F;90| ((|x| F) ($ F)) (|EF;isec| |x| $)) 

(SDEFUN |EF;iicsc;2F;91| ((|x| F) ($ F)) (|EF;icsc| |x| $)) 

(SDEFUN |EF;iiasin;2F;92| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iasin| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 163))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiacos;2F;93| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iacos| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 165))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiatan;2F;94| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iatan| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 167))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiacot;2F;95| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iacot| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 169))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiasec;2F;96| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iasec| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 171))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiacsc;2F;97| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iacsc| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 173))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiasin;2F;98| ((|x| F) ($ F)) (|EF;iasin| |x| $)) 

(SDEFUN |EF;iiacos;2F;99| ((|x| F) ($ F)) (|EF;iacos| |x| $)) 

(SDEFUN |EF;iiatan;2F;100| ((|x| F) ($ F)) (|EF;iatan| |x| $)) 

(SDEFUN |EF;iiacot;2F;101| ((|x| F) ($ F)) (|EF;iacot| |x| $)) 

(SDEFUN |EF;iiasec;2F;102| ((|x| F) ($ F)) (|EF;iasec| |x| $)) 

(SDEFUN |EF;iiacsc;2F;103| ((|x| F) ($ F)) (|EF;iacsc| |x| $)) 

(SDEFUN |EF;iisinh;2F;104| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;isinh| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 175))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iicosh;2F;105| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;icosh| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 177))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iitanh;2F;106| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;itanh| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 179))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iicoth;2F;107| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;icoth| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 181))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iisech;2F;108| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;isech| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 183))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iicsch;2F;109| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;icsch| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 185))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iisinh;2F;110| ((|x| F) ($ F)) (|EF;isinh| |x| $)) 

(SDEFUN |EF;iicosh;2F;111| ((|x| F) ($ F)) (|EF;icosh| |x| $)) 

(SDEFUN |EF;iitanh;2F;112| ((|x| F) ($ F)) (|EF;itanh| |x| $)) 

(SDEFUN |EF;iicoth;2F;113| ((|x| F) ($ F)) (|EF;icoth| |x| $)) 

(SDEFUN |EF;iisech;2F;114| ((|x| F) ($ F)) (|EF;isech| |x| $)) 

(SDEFUN |EF;iicsch;2F;115| ((|x| F) ($ F)) (|EF;icsch| |x| $)) 

(SDEFUN |EF;iiasinh;2F;116| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iasinh| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 187))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiacosh;2F;117| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iacosh| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 189))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiatanh;2F;118| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iatanh| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 191))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiacoth;2F;119| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iacoth| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 193))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiasech;2F;120| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iasech| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 195))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiacsch;2F;121| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 130)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iacsch| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 197))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiasinh;2F;122| ((|x| F) ($ F)) (|EF;iasinh| |x| $)) 

(SDEFUN |EF;iiacosh;2F;123| ((|x| F) ($ F)) (|EF;iacosh| |x| $)) 

(SDEFUN |EF;iiatanh;2F;124| ((|x| F) ($ F)) (|EF;iatanh| |x| $)) 

(SDEFUN |EF;iiacoth;2F;125| ((|x| F) ($ F)) (|EF;iacoth| |x| $)) 

(SDEFUN |EF;iiasech;2F;126| ((|x| F) ($ F)) (|EF;iasech| |x| $)) 

(SDEFUN |EF;iiacsch;2F;127| ((|x| F) ($ F)) (|EF;iacsch| |x| $)) 

(DECLAIM (NOTINLINE |ElementaryFunction;|)) 

(DEFUN |ElementaryFunction| (&REST #1=#:G820)
  (SPROG NIL
         (PROG (#2=#:G821)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ElementaryFunction;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ElementaryFunction|)))))))))) 

(DEFUN |ElementaryFunction;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ElementaryFunction| DV$1 DV$2))
          (LETT $ (GETREFV 206))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ElementaryFunction|
                      (LIST DV$1 DV$2) (CONS 1 $))
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
            (COND
             ((|HasCategory| |#1| '(|arbitraryPrecision|))
              (QSETREFV $ 42 (CONS (|dispatchFunction| |EF;pi;F;1|) $)))
             ('T
              (PROGN
               (QSETREFV $ 43
                         (SPADCALL (SPADCALL (QREFELT $ 40)) (QREFELT $ 41)))
               (QSETREFV $ 42 (CONS (|dispatchFunction| |EF;pi;F;2|) $))))))
           ('T
            (PROGN
             (SETELT $ 43 (SPADCALL (QREFELT $ 13) NIL (QREFELT $ 45)))
             (QSETREFV $ 42 (CONS (|dispatchFunction| |EF;pi;F;3|) $)))))
          (COND
           ((|HasSignature| |#1| (LIST '|imaginary| (LIST (|devaluate| |#1|))))
            (QSETREFV $ 47
                      (SPADCALL (SPADCALL (QREFELT $ 46)) (QREFELT $ 41))))
           ('T
            (SETELT $ 47
                    (SPADCALL (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                              (QREFELT $ 50)))))
          (COND
           ((|HasCategory| |#1| '(|RadicalCategory|))
            (COND
             ((|HasCategory| |#1| '(|arbitraryPrecision|))
              (PROGN
               (QSETREFV $ 54 (CONS (|dispatchFunction| |EF;iisqrt2;F;5|) $))
               (QSETREFV $ 55 (CONS (|dispatchFunction| |EF;iisqrt3;F;6|) $))))
             ('T
              (PROGN
               (QSETREFV $ 56
                         (SPADCALL
                          (SPADCALL (SPADCALL 2 (QREFELT $ 52)) (QREFELT $ 53))
                          (QREFELT $ 41)))
               (QSETREFV $ 57
                         (SPADCALL
                          (SPADCALL (SPADCALL 3 (QREFELT $ 52)) (QREFELT $ 53))
                          (QREFELT $ 41)))
               (QSETREFV $ 54 (CONS (|dispatchFunction| |EF;iisqrt2;F;7|) $))
               (QSETREFV $ 55
                         (CONS (|dispatchFunction| |EF;iisqrt3;F;8|) $))))))
           ('T
            (PROGN
             (SETELT $ 56
                     (SPADCALL (SPADCALL 2 (QREFELT $ 58)) (QREFELT $ 50)))
             (SETELT $ 57
                     (SPADCALL (SPADCALL 3 (QREFELT $ 58)) (QREFELT $ 50)))
             (QSETREFV $ 54 (CONS (|dispatchFunction| |EF;iisqrt2;F;9|) $))
             (QSETREFV $ 55 (CONS (|dispatchFunction| |EF;iisqrt3;F;10|) $)))))
          (COND
           ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
            (QSETREFV $ 114
                      (CONS (|dispatchFunction| |EF;specialTrigs;FLU;44|) $)))
           ('T
            (QSETREFV $ 114
                      (CONS (|dispatchFunction| |EF;specialTrigs;FLU;45|) $))))
          (COND
           ((|HasSignature| |#1| (LIST '|imaginary| (LIST (|devaluate| |#1|))))
            (COND
             ((|HasSignature| |#1|
                              (LIST '|conjugate|
                                    (LIST (|devaluate| |#1|)
                                          (|devaluate| |#1|))))
              (QSETREFV $ 133
                        (CONS (|dispatchFunction| |EF;localReal?;FB;71|) $)))
             ('T
              (QSETREFV $ 133
                        (CONS (|dispatchFunction| |EF;localReal?;FB;72|) $)))))
           ('T
            (QSETREFV $ 133
                      (CONS (|dispatchFunction| |EF;localReal?;FB;73|) $))))
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
             (QSETREFV $ 174
                       (CONS (|dispatchFunction| |EF;iiacsc;2F;103|) $)))))
          (COND
           ((|HasCategory| |#1| '(|HyperbolicFunctionCategory|))
            (PROGN
             (QSETREFV $ 176 (CONS (|dispatchFunction| |EF;iisinh;2F;104|) $))
             (QSETREFV $ 178 (CONS (|dispatchFunction| |EF;iicosh;2F;105|) $))
             (QSETREFV $ 180 (CONS (|dispatchFunction| |EF;iitanh;2F;106|) $))
             (QSETREFV $ 182 (CONS (|dispatchFunction| |EF;iicoth;2F;107|) $))
             (QSETREFV $ 184 (CONS (|dispatchFunction| |EF;iisech;2F;108|) $))
             (QSETREFV $ 186
                       (CONS (|dispatchFunction| |EF;iicsch;2F;109|) $))))
           ('T
            (PROGN
             (QSETREFV $ 176 (CONS (|dispatchFunction| |EF;iisinh;2F;110|) $))
             (QSETREFV $ 178 (CONS (|dispatchFunction| |EF;iicosh;2F;111|) $))
             (QSETREFV $ 180 (CONS (|dispatchFunction| |EF;iitanh;2F;112|) $))
             (QSETREFV $ 182 (CONS (|dispatchFunction| |EF;iicoth;2F;113|) $))
             (QSETREFV $ 184 (CONS (|dispatchFunction| |EF;iisech;2F;114|) $))
             (QSETREFV $ 186
                       (CONS (|dispatchFunction| |EF;iicsch;2F;115|) $)))))
          (COND
           ((|HasCategory| |#1| '(|ArcHyperbolicFunctionCategory|))
            (PROGN
             (QSETREFV $ 188 (CONS (|dispatchFunction| |EF;iiasinh;2F;116|) $))
             (QSETREFV $ 190 (CONS (|dispatchFunction| |EF;iiacosh;2F;117|) $))
             (QSETREFV $ 192 (CONS (|dispatchFunction| |EF;iiatanh;2F;118|) $))
             (QSETREFV $ 194 (CONS (|dispatchFunction| |EF;iiacoth;2F;119|) $))
             (QSETREFV $ 196 (CONS (|dispatchFunction| |EF;iiasech;2F;120|) $))
             (QSETREFV $ 198
                       (CONS (|dispatchFunction| |EF;iiacsch;2F;121|) $))))
           ('T
            (PROGN
             (QSETREFV $ 188 (CONS (|dispatchFunction| |EF;iiasinh;2F;122|) $))
             (QSETREFV $ 190 (CONS (|dispatchFunction| |EF;iiacosh;2F;123|) $))
             (QSETREFV $ 192 (CONS (|dispatchFunction| |EF;iiatanh;2F;124|) $))
             (QSETREFV $ 194 (CONS (|dispatchFunction| |EF;iiacoth;2F;125|) $))
             (QSETREFV $ 196 (CONS (|dispatchFunction| |EF;iiasech;2F;126|) $))
             (QSETREFV $ 198
                       (CONS (|dispatchFunction| |EF;iiacsch;2F;127|) $)))))
          (SPADCALL (QREFELT $ 13) (CONS (|function| |EF;ipi|) $)
                    (QREFELT $ 201))
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
          (SPADCALL (QREFELT $ 14) (ELT $ 120) (QREFELT $ 204))
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
          $))) 

(DEFUN |ElementaryFunction!20| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |x| 2 (QREFELT $ 117))
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |x| 2 (QREFELT $ 117)) (QREFELT $ 120))
                (|spadConstant| $ 48) (QREFELT $ 119))
               (QREFELT $ 50))
              (QREFELT $ 121))
    (QREFELT $ 120))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!19| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |x| 2 (QREFELT $ 117))
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |x| 2 (QREFELT $ 117)) (QREFELT $ 120))
                (|spadConstant| $ 48) (QREFELT $ 118))
               (QREFELT $ 50))
              (QREFELT $ 121))
    (QREFELT $ 120))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!18| (|x| $)
  (SPADCALL
   (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 117))
             (QREFELT $ 118))
   (QREFELT $ 120))) 

(DEFUN |ElementaryFunction!17| (|x| $)
  (SPADCALL
   (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 117))
             (QREFELT $ 118))
   (QREFELT $ 120))) 

(DEFUN |ElementaryFunction!16| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |x| 2 (QREFELT $ 117)) (|spadConstant| $ 48)
              (QREFELT $ 118))
    (QREFELT $ 50))
   (QREFELT $ 120))) 

(DEFUN |ElementaryFunction!15| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 117))
              (QREFELT $ 119))
    (QREFELT $ 50))
   (QREFELT $ 120))) 

(DEFUN |ElementaryFunction!14| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 77)) (SPADCALL |x| (QREFELT $ 79))
             (QREFELT $ 121))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!13| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 76)) (SPADCALL |x| (QREFELT $ 78))
             (QREFELT $ 121))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!12| (|x| $)
  (SPADCALL (|spadConstant| $ 48)
            (SPADCALL (SPADCALL |x| (QREFELT $ 77)) 2 (QREFELT $ 205))
            (QREFELT $ 118))) 

(DEFUN |ElementaryFunction!11| (|x| $)
  (SPADCALL (|spadConstant| $ 48)
            (SPADCALL (SPADCALL |x| (QREFELT $ 76)) 2 (QREFELT $ 205))
            (QREFELT $ 118))) 

(DEFUN |ElementaryFunction!10| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |x| 2 (QREFELT $ 117))
              (SPADCALL
               (SPADCALL (|spadConstant| $ 48)
                         (SPADCALL (SPADCALL |x| 2 (QREFELT $ 117))
                                   (QREFELT $ 120))
                         (QREFELT $ 118))
               (QREFELT $ 50))
              (QREFELT $ 121))
    (QREFELT $ 120))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!9| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| 2 (QREFELT $ 117))
             (SPADCALL
              (SPADCALL (|spadConstant| $ 48)
                        (SPADCALL (SPADCALL |x| 2 (QREFELT $ 117))
                                  (QREFELT $ 120))
                        (QREFELT $ 118))
              (QREFELT $ 50))
             (QREFELT $ 121))
   (QREFELT $ 120))) 

(DEFUN |ElementaryFunction!8| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 117))
              (QREFELT $ 119))
    (QREFELT $ 120))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!7| (|x| $)
  (SPADCALL
   (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 117))
             (QREFELT $ 119))
   (QREFELT $ 120))) 

(DEFUN |ElementaryFunction!6| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL
     (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 117))
               (QREFELT $ 118))
     (QREFELT $ 50))
    (QREFELT $ 120))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!5| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 117))
              (QREFELT $ 118))
    (QREFELT $ 50))
   (QREFELT $ 120))) 

(DEFUN |ElementaryFunction!4| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 65)) (SPADCALL |x| (QREFELT $ 67))
             (QREFELT $ 121))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!3| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 64)) (SPADCALL |x| (QREFELT $ 66))
            (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!2| (|x| $)
  (SPADCALL (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
            (SPADCALL (SPADCALL |x| (QREFELT $ 65)) 2 (QREFELT $ 205))
            (QREFELT $ 118))) 

(DEFUN |ElementaryFunction!1| (|x| $)
  (SPADCALL (|spadConstant| $ 48)
            (SPADCALL (SPADCALL |x| (QREFELT $ 64)) 2 (QREFELT $ 205))
            (QREFELT $ 119))) 

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
              '|opasech| '|opacsch| (5 . |pi|) (9 . |coerce|) (14 . |pi|)
              '|Pie| (|List| $) (18 . |kernel|) (24 . |imaginary|) '|isqrt1|
              (28 . |One|) (32 . -) (37 . |sqrt|) (|Integer|) (42 . |coerce|)
              (47 . |sqrt|) (52 . |iisqrt2|) (56 . |iisqrt3|) '|isqrt2|
              '|isqrt3| (60 . |coerce|) (65 . |elt|) |EF;log;2F;12|
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
              (|Fraction| 51) (122 . |retractIfCan|) (127 . |elt|)
              (133 . |One|) (|PositiveInteger|) (137 . *)
              (|Union| 7 '#2="failed") (143 . |specialTrigs|) (149 . |zero?|)
              (154 . |is?|) (160 . ^) (166 . -) (172 . +) (178 . |inv|)
              (183 . *) (189 . |kernel|) (195 . *) (201 . =) (207 . |is?|)
              (213 . |smaller?|) (|List| 10) (219 . |variables|)
              (|Union| 6 '#1#) (224 . |retractIfCan|) (229 . |conjugate|)
              (234 . =) (240 . |localReal?|)
              (|Record| (|:| |var| 86) (|:| |exponent| 51))
              (|Union| 134 '"failed") (245 . |isExpt|) (251 . *)
              (|SparseMultivariatePolynomial| 6 86) (257 . |numer|)
              (|SparseMultivariatePolynomial| 6 98) (262 . |One|) (266 . =)
              (272 . |denom|) (277 . ~=) (283 . -) (288 . |coerce|)
              (293 . |log|) (298 . |iilog|) (303 . |exp|) (308 . |iiexp|)
              (313 . |sin|) (318 . |iisin|) (323 . |cos|) (328 . |iicos|)
              (333 . |tan|) (338 . |iitan|) (343 . |cot|) (348 . |iicot|)
              (353 . |sec|) (358 . |iisec|) (363 . |csc|) (368 . |iicsc|)
              (373 . |asin|) (378 . |iiasin|) (383 . |acos|) (388 . |iiacos|)
              (393 . |atan|) (398 . |iiatan|) (403 . |acot|) (408 . |iiacot|)
              (413 . |asec|) (418 . |iiasec|) (423 . |acsc|) (428 . |iiacsc|)
              (433 . |sinh|) (438 . |iisinh|) (443 . |cosh|) (448 . |iicosh|)
              (453 . |tanh|) (458 . |iitanh|) (463 . |coth|) (468 . |iicoth|)
              (473 . |sech|) (478 . |iisech|) (483 . |csch|) (488 . |iicsch|)
              (493 . |asinh|) (498 . |iiasinh|) (503 . |acosh|)
              (508 . |iiacosh|) (513 . |atanh|) (518 . |iiatanh|)
              (523 . |acoth|) (528 . |iiacoth|) (533 . |asech|)
              (538 . |iiasech|) (543 . |acsch|) (548 . |iiacsch|)
              (|Mapping| 7 97) (|BasicOperatorFunctions1| 7) (553 . |evaluate|)
              (|Mapping| 7 7) (559 . |evaluate|) (565 . |derivative|)
              (571 . ^))
           '#(|tanh| 577 |tan| 582 |specialTrigs| 587 |sinh| 593 |sin| 598
              |sech| 603 |sec| 608 |pi| 613 |operator| 617 |log| 622
              |localReal?| 627 |iitanh| 632 |iitan| 637 |iisqrt3| 642 |iisqrt2|
              646 |iisinh| 650 |iisin| 655 |iisech| 660 |iisec| 665 |iilog| 670
              |iiexp| 675 |iicsch| 680 |iicsc| 685 |iicoth| 690 |iicot| 695
              |iicosh| 700 |iicos| 705 |iiatanh| 710 |iiatan| 715 |iiasinh| 720
              |iiasin| 725 |iiasech| 730 |iiasec| 735 |iiacsch| 740 |iiacsc|
              745 |iiacoth| 750 |iiacot| 755 |iiacosh| 760 |iiacos| 765 |exp|
              770 |csch| 775 |csc| 780 |coth| 785 |cot| 790 |cosh| 795 |cos|
              800 |belong?| 805 |atanh| 810 |atan| 815 |asinh| 820 |asin| 825
              |asech| 830 |asec| 835 |acsch| 840 |acsc| 845 |acoth| 850 |acot|
              855 |acosh| 860 |acos| 865)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|exp| (|#2| |#2|)) T)
                                   '((|log| (|#2| |#2|)) T)
                                   '((|sin| (|#2| |#2|)) T)
                                   '((|cos| (|#2| |#2|)) T)
                                   '((|tan| (|#2| |#2|)) T)
                                   '((|cot| (|#2| |#2|)) T)
                                   '((|sec| (|#2| |#2|)) T)
                                   '((|csc| (|#2| |#2|)) T)
                                   '((|asin| (|#2| |#2|)) T)
                                   '((|acos| (|#2| |#2|)) T)
                                   '((|atan| (|#2| |#2|)) T)
                                   '((|acot| (|#2| |#2|)) T)
                                   '((|asec| (|#2| |#2|)) T)
                                   '((|acsc| (|#2| |#2|)) T)
                                   '((|sinh| (|#2| |#2|)) T)
                                   '((|cosh| (|#2| |#2|)) T)
                                   '((|tanh| (|#2| |#2|)) T)
                                   '((|coth| (|#2| |#2|)) T)
                                   '((|sech| (|#2| |#2|)) T)
                                   '((|csch| (|#2| |#2|)) T)
                                   '((|asinh| (|#2| |#2|)) T)
                                   '((|acosh| (|#2| |#2|)) T)
                                   '((|atanh| (|#2| |#2|)) T)
                                   '((|acoth| (|#2| |#2|)) T)
                                   '((|asech| (|#2| |#2|)) T)
                                   '((|acsch| (|#2| |#2|)) T)
                                   '((|pi| (|#2|)) T)
                                   '((|belong?|
                                      ((|Boolean|) (|BasicOperator|)))
                                     T)
                                   '((|operator|
                                      ((|BasicOperator|) (|BasicOperator|)))
                                     T)
                                   '((|iisqrt2| (|#2|)) T)
                                   '((|iisqrt3| (|#2|)) T)
                                   '((|iiexp| (|#2| |#2|)) T)
                                   '((|iilog| (|#2| |#2|)) T)
                                   '((|iisin| (|#2| |#2|)) T)
                                   '((|iicos| (|#2| |#2|)) T)
                                   '((|iitan| (|#2| |#2|)) T)
                                   '((|iicot| (|#2| |#2|)) T)
                                   '((|iisec| (|#2| |#2|)) T)
                                   '((|iicsc| (|#2| |#2|)) T)
                                   '((|iiasin| (|#2| |#2|)) T)
                                   '((|iiacos| (|#2| |#2|)) T)
                                   '((|iiatan| (|#2| |#2|)) T)
                                   '((|iiacot| (|#2| |#2|)) T)
                                   '((|iiasec| (|#2| |#2|)) T)
                                   '((|iiacsc| (|#2| |#2|)) T)
                                   '((|iisinh| (|#2| |#2|)) T)
                                   '((|iicosh| (|#2| |#2|)) T)
                                   '((|iitanh| (|#2| |#2|)) T)
                                   '((|iicoth| (|#2| |#2|)) T)
                                   '((|iisech| (|#2| |#2|)) T)
                                   '((|iicsch| (|#2| |#2|)) T)
                                   '((|iiasinh| (|#2| |#2|)) T)
                                   '((|iiacosh| (|#2| |#2|)) T)
                                   '((|iiatanh| (|#2| |#2|)) T)
                                   '((|iiacoth| (|#2| |#2|)) T)
                                   '((|iiasech| (|#2| |#2|)) T)
                                   '((|iiacsch| (|#2| |#2|)) T)
                                   '((|specialTrigs|
                                      ((|Union| |#2| #2#) |#2|
                                       (|List|
                                        (|Record| (|:| |func| |#2|)
                                                  (|:| |pole| (|Boolean|))))))
                                     T)
                                   '((|localReal?| ((|Boolean|) |#2|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 205
                                            '(1 11 9 10 12 0 6 0 40 1 7 0 6 41
                                              0 0 7 42 2 7 0 9 44 45 0 6 0 46 0
                                              7 0 48 1 7 0 0 49 1 7 0 0 50 1 6
                                              0 51 52 1 6 0 0 53 0 0 7 54 0 0 7
                                              55 1 7 0 51 58 2 7 0 9 0 59 1 7
                                              86 0 87 0 6 0 88 0 7 0 89 2 9 90
                                              0 10 91 2 9 90 0 10 93 1 7 95 0
                                              96 1 98 97 0 99 2 7 0 0 0 100 1 7
                                              101 0 102 1 104 51 0 105 1 107
                                              106 0 108 2 104 103 0 51 109 0 6
                                              0 110 2 107 0 111 0 112 2 0 113 7
                                              104 114 1 7 90 0 115 2 7 90 0 9
                                              116 2 7 0 0 111 117 2 7 0 0 0 118
                                              2 7 0 0 0 119 1 7 0 0 120 2 7 0 0
                                              0 121 2 7 0 9 0 122 2 7 0 111 0
                                              123 2 7 90 0 0 124 2 98 90 0 10
                                              125 2 7 90 0 0 126 1 7 127 0 128
                                              1 7 129 0 130 1 6 0 0 131 2 6 90
                                              0 0 132 1 0 90 7 133 2 7 135 0 9
                                              136 2 7 0 51 0 137 1 7 138 0 139
                                              0 140 0 141 2 140 90 0 0 142 1 7
                                              138 0 143 2 140 90 0 0 144 1 140
                                              0 0 145 1 7 0 138 146 1 6 0 0 147
                                              1 0 7 7 148 1 6 0 0 149 1 0 7 7
                                              150 1 6 0 0 151 1 0 7 7 152 1 6 0
                                              0 153 1 0 7 7 154 1 6 0 0 155 1 0
                                              7 7 156 1 6 0 0 157 1 0 7 7 158 1
                                              6 0 0 159 1 0 7 7 160 1 6 0 0 161
                                              1 0 7 7 162 1 6 0 0 163 1 0 7 7
                                              164 1 6 0 0 165 1 0 7 7 166 1 6 0
                                              0 167 1 0 7 7 168 1 6 0 0 169 1 0
                                              7 7 170 1 6 0 0 171 1 0 7 7 172 1
                                              6 0 0 173 1 0 7 7 174 1 6 0 0 175
                                              1 0 7 7 176 1 6 0 0 177 1 0 7 7
                                              178 1 6 0 0 179 1 0 7 7 180 1 6 0
                                              0 181 1 0 7 7 182 1 6 0 0 183 1 0
                                              7 7 184 1 6 0 0 185 1 0 7 7 186 1
                                              6 0 0 187 1 0 7 7 188 1 6 0 0 189
                                              1 0 7 7 190 1 6 0 0 191 1 0 7 7
                                              192 1 6 0 0 193 1 0 7 7 194 1 6 0
                                              0 195 1 0 7 7 196 1 6 0 0 197 1 0
                                              7 7 198 2 200 9 9 199 201 2 200 9
                                              9 202 203 2 200 9 9 202 204 2 7 0
                                              0 51 205 1 0 7 7 76 1 0 7 7 64 2
                                              0 113 7 104 114 1 0 7 7 74 1 0 7
                                              7 62 1 0 7 7 78 1 0 7 7 66 0 0 7
                                              42 1 0 9 9 94 1 0 7 7 60 1 0 90 7
                                              133 1 0 7 7 180 1 0 7 7 156 0 0 7
                                              55 0 0 7 54 1 0 7 7 176 1 0 7 7
                                              152 1 0 7 7 184 1 0 7 7 160 1 0 7
                                              7 148 1 0 7 7 150 1 0 7 7 186 1 0
                                              7 7 162 1 0 7 7 182 1 0 7 7 158 1
                                              0 7 7 178 1 0 7 7 154 1 0 7 7 192
                                              1 0 7 7 168 1 0 7 7 188 1 0 7 7
                                              164 1 0 7 7 196 1 0 7 7 172 1 0 7
                                              7 198 1 0 7 7 174 1 0 7 7 194 1 0
                                              7 7 170 1 0 7 7 190 1 0 7 7 166 1
                                              0 7 7 61 1 0 7 7 79 1 0 7 7 67 1
                                              0 7 7 77 1 0 7 7 65 1 0 7 7 75 1
                                              0 7 7 63 1 0 90 9 92 1 0 7 7 82 1
                                              0 7 7 70 1 0 7 7 80 1 0 7 7 68 1
                                              0 7 7 84 1 0 7 7 72 1 0 7 7 85 1
                                              0 7 7 73 1 0 7 7 83 1 0 7 7 71 1
                                              0 7 7 81 1 0 7 7 69)))))
           '|lookupComplete|)) 
