
(DEFUN |NUMERIC;complexNumericIfCan;PU;1| (|p| $)
  (PROG (|p'|)
    (RETURN
     (SEQ
      (LETT |p'| (SPADCALL |p| (QREFELT $ 9))
            |NUMERIC;complexNumericIfCan;PU;1|)
      (EXIT
       (COND ((QEQCAR |p'| 1) (CONS 1 "failed"))
             ('T (CONS 0 (SPADCALL (QCDR |p'|) (QREFELT $ 12)))))))))) 

(DEFUN |NUMERIC;complexNumericIfCan;PPiU;2| (|p| |n| $)
  (PROG (|p'|)
    (RETURN
     (SEQ
      (LETT |p'| (SPADCALL |p| (QREFELT $ 9))
            |NUMERIC;complexNumericIfCan;PPiU;2|)
      (EXIT
       (COND ((QEQCAR |p'| 1) (CONS 1 "failed"))
             ('T (CONS 0 (SPADCALL (QCDR |p'|) |n| (QREFELT $ 16)))))))))) 

(DEFUN |NUMERIC;numericIfCan;PU;3| (|p| $)
  (PROG (|p'|)
    (RETURN
     (SEQ (LETT |p'| (SPADCALL |p| (QREFELT $ 20)) |NUMERIC;numericIfCan;PU;3|)
          (EXIT
           (COND ((QEQCAR |p'| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (SPADCALL (QCDR |p'|) (QREFELT $ 22)))))))))) 

(DEFUN |NUMERIC;complexNumericIfCan;PU;4| (|p| $)
  (PROG (|p'|)
    (RETURN
     (SEQ
      (LETT |p'| (SPADCALL |p| (QREFELT $ 20))
            |NUMERIC;complexNumericIfCan;PU;4|)
      (EXIT
       (COND ((QEQCAR |p'| 1) (CONS 1 "failed"))
             ('T (CONS 0 (SPADCALL (QCDR |p'|) (QREFELT $ 25)))))))))) 

(DEFUN |NUMERIC;complexNumericIfCan;PPiU;5| (|p| |n| $)
  (PROG (|p'|)
    (RETURN
     (SEQ
      (LETT |p'| (SPADCALL |p| (QREFELT $ 20))
            |NUMERIC;complexNumericIfCan;PPiU;5|)
      (EXIT
       (COND ((QEQCAR |p'| 1) (CONS 1 "failed"))
             ('T (CONS 0 (SPADCALL (QCDR |p'|) |n| (QREFELT $ 27)))))))))) 

(DEFUN |NUMERIC;numericIfCan;PPiU;6| (|p| |n| $)
  (PROG (|ans| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;numericIfCan;PPiU;6|))
      (LETT |ans| (SPADCALL |p| (QREFELT $ 24)) . #1#)
      (SPADCALL |old| (QREFELT $ 29)) (EXIT |ans|))))) 

(DEFUN |NUMERIC;numericIfCan;FU;7| (|f| $)
  (PROG (|den| |num|)
    (RETURN
     (SEQ
      (LETT |num| (SPADCALL (SPADCALL |f| (QREFELT $ 32)) (QREFELT $ 24))
            . #1=(|NUMERIC;numericIfCan;FU;7|))
      (EXIT
       (COND ((QEQCAR |num| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |den|
                     (SPADCALL (SPADCALL |f| (QREFELT $ 33)) (QREFELT $ 24))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |den| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL (QCDR |num|) (QCDR |den|)
                                       (QREFELT $ 34)))))))))))))) 

(DEFUN |NUMERIC;complexNumericIfCan;FU;8| (|f| $)
  (PROG (|den| |num|)
    (RETURN
     (SEQ
      (LETT |num| (SPADCALL (SPADCALL |f| (QREFELT $ 32)) (QREFELT $ 26))
            . #1=(|NUMERIC;complexNumericIfCan;FU;8|))
      (EXIT
       (COND ((QEQCAR |num| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |den|
                     (SPADCALL (SPADCALL |f| (QREFELT $ 33)) (QREFELT $ 26))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |den| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL (QCDR |num|) (QCDR |den|)
                                       (QREFELT $ 36)))))))))))))) 

(DEFUN |NUMERIC;complexNumericIfCan;FPiU;9| (|f| |n| $)
  (PROG (|den| |num|)
    (RETURN
     (SEQ
      (LETT |num| (SPADCALL (SPADCALL |f| (QREFELT $ 32)) |n| (QREFELT $ 28))
            . #1=(|NUMERIC;complexNumericIfCan;FPiU;9|))
      (EXIT
       (COND ((QEQCAR |num| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |den|
                     (SPADCALL (SPADCALL |f| (QREFELT $ 33)) |n|
                               (QREFELT $ 28))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |den| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL (QCDR |num|) (QCDR |den|)
                                       (QREFELT $ 36)))))))))))))) 

(DEFUN |NUMERIC;numericIfCan;FPiU;10| (|f| |n| $)
  (PROG (|ans| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;numericIfCan;FPiU;10|))
      (LETT |ans| (SPADCALL |f| (QREFELT $ 35)) . #1#)
      (SPADCALL |old| (QREFELT $ 29)) (EXIT |ans|))))) 

(DEFUN |NUMERIC;complexNumericIfCan;FU;11| (|f| $)
  (PROG (|den| |num|)
    (RETURN
     (SEQ
      (LETT |num| (SPADCALL (SPADCALL |f| (QREFELT $ 41)) (QREFELT $ 14))
            . #1=(|NUMERIC;complexNumericIfCan;FU;11|))
      (EXIT
       (COND ((QEQCAR |num| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |den|
                     (SPADCALL (SPADCALL |f| (QREFELT $ 42)) (QREFELT $ 14))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |den| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL (QCDR |num|) (QCDR |den|)
                                       (QREFELT $ 36)))))))))))))) 

(DEFUN |NUMERIC;complexNumericIfCan;FPiU;12| (|f| |n| $)
  (PROG (|den| |num|)
    (RETURN
     (SEQ
      (LETT |num| (SPADCALL (SPADCALL |f| (QREFELT $ 41)) |n| (QREFELT $ 17))
            . #1=(|NUMERIC;complexNumericIfCan;FPiU;12|))
      (EXIT
       (COND ((QEQCAR |num| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |den|
                     (SPADCALL (SPADCALL |f| (QREFELT $ 42)) |n|
                               (QREFELT $ 17))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |den| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL (QCDR |num|) (QCDR |den|)
                                       (QREFELT $ 36)))))))))))))) 

(DEFUN |NUMERIC;numericIfCan;EU;13| (|x| $)
  (|trappedSpadEvalUnion|
   (SPADCALL (SPADCALL (ELT $ 45) |x| (QREFELT $ 50)) (QREFELT $ 51)))) 

(DEFUN |NUMERIC;complexNumericIfCan;EU;14| (|x| $)
  (SPADCALL (SPADCALL (ELT $ 53) |x| (QREFELT $ 57)) (QREFELT $ 58))) 

(DEFUN |NUMERIC;numericIfCan;EPiU;15| (|x| |n| $)
  (PROG (|old|)
    (RETURN
     (SEQ (LETT |old| (SPADCALL (QREFELT $ 60)) |NUMERIC;numericIfCan;EPiU;15|)
          (EXIT
           (|finally|
            (SEQ (SPADCALL |n| (QREFELT $ 29))
                 (EXIT (SPADCALL |x| (QREFELT $ 52))))
            (SPADCALL |old| (QREFELT $ 61)))))))) 

(DEFUN |NUMERIC;complexNumericIfCan;EPiU;16| (|x| |n| $)
  (PROG (|ans| |x'| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;complexNumericIfCan;EPiU;16|))
      (LETT |x'| (SPADCALL (ELT $ 53) |x| (QREFELT $ 57)) . #1#)
      (LETT |ans| (SPADCALL |x'| (QREFELT $ 58)) . #1#)
      (SPADCALL |old| (QREFELT $ 29)) (EXIT |ans|))))) 

(DEFUN |NUMERIC;complexNumericIfCan;EU;17| (|x| $)
  (SPADCALL (SPADCALL (ELT $ 64) |x| (QREFELT $ 68)) (QREFELT $ 69))) 

(DEFUN |NUMERIC;complexNumericIfCan;EPiU;18| (|x| |n| $)
  (PROG (|ans| |x'| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;complexNumericIfCan;EPiU;18|))
      (LETT |x'| (SPADCALL (ELT $ 64) |x| (QREFELT $ 68)) . #1#)
      (LETT |ans| (SPADCALL |x'| (QREFELT $ 69)) . #1#)
      (SPADCALL |old| (QREFELT $ 29)) (EXIT |ans|))))) 

(DEFUN |NUMERIC;convert| (|x| $) (SPADCALL (ELT $ 45) |x| (QREFELT $ 72))) 

(DEFUN |NUMERIC;complexNumericIfCan;EU;20| (|x| $)
  (SPADCALL
   (SPADCALL (CONS (|function| |NUMERIC;convert|) $) |x| (QREFELT $ 68))
   (QREFELT $ 69))) 

(DEFUN |NUMERIC;complexNumericIfCan;EPiU;21| (|x| |n| $)
  (PROG (|ans| |x'| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;complexNumericIfCan;EPiU;21|))
      (LETT |x'|
            (SPADCALL (CONS (|function| |NUMERIC;convert|) $) |x|
                      (QREFELT $ 68))
            . #1#)
      (LETT |ans| (SPADCALL |x'| (QREFELT $ 69)) . #1#)
      (SPADCALL |old| (QREFELT $ 29)) (EXIT |ans|))))) 

(DEFUN |NUMERIC;numeric;SF;22| (|s| $) (SPADCALL |s| (QREFELT $ 45))) 

(DEFUN |NUMERIC;complexNumeric;SC;23| (|s| $) (SPADCALL |s| (QREFELT $ 73))) 

(DEFUN |NUMERIC;complexNumeric;SPiC;24| (|s| |n| $)
  (PROG (|ans| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;complexNumeric;SPiC;24|))
      (LETT |ans| (SPADCALL |s| (QREFELT $ 25)) . #1#)
      (SPADCALL |old| (QREFELT $ 29)) (EXIT |ans|))))) 

(DEFUN |NUMERIC;complexNumeric;SC;25| (|s| $)
  (SPADCALL (SPADCALL |s| (QREFELT $ 45)) (QREFELT $ 74))) 

(DEFUN |NUMERIC;complexNumeric;SPiC;26| (|s| |n| $)
  (SPADCALL (SPADCALL |s| |n| (QREFELT $ 75)) (QREFELT $ 74))) 

(DEFUN |NUMERIC;complexNumeric;PC;27| (|p| $)
  (PROG (|p'|)
    (RETURN
     (SEQ
      (LETT |p'| (SPADCALL |p| (QREFELT $ 9)) |NUMERIC;complexNumeric;PC;27|)
      (EXIT
       (COND
        ((QEQCAR |p'| 1)
         (|error|
          "Cannot compute the numerical value of a non-constant polynomial"))
        ('T (SPADCALL (QCDR |p'|) (QREFELT $ 12))))))))) 

(DEFUN |NUMERIC;complexNumeric;PPiC;28| (|p| |n| $)
  (PROG (|p'|)
    (RETURN
     (SEQ
      (LETT |p'| (SPADCALL |p| (QREFELT $ 9)) |NUMERIC;complexNumeric;PPiC;28|)
      (EXIT
       (COND
        ((QEQCAR |p'| 1)
         (|error|
          "Cannot compute the numerical value of a non-constant polynomial"))
        ('T (SPADCALL (QCDR |p'|) |n| (QREFELT $ 16))))))))) 

(DEFUN |NUMERIC;complexNumeric;CC;29| (|s| $) (SPADCALL |s| (QREFELT $ 64))) 

(DEFUN |NUMERIC;complexNumeric;CPiC;30| (|s| |n| $)
  (PROG (|ans| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;complexNumeric;CPiC;30|))
      (LETT |ans| (SPADCALL |s| (QREFELT $ 12)) . #1#)
      (SPADCALL |old| (QREFELT $ 29)) (EXIT |ans|))))) 

(DEFUN |NUMERIC;complexNumeric;CC;31| (|s| $) (SPADCALL |s| (QREFELT $ 64))) 

(DEFUN |NUMERIC;complexNumeric;CPiC;32| (|s| |n| $)
  (PROG (|ans| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;complexNumeric;CPiC;32|))
      (LETT |ans| (SPADCALL |s| (QREFELT $ 12)) . #1#)
      (SPADCALL |old| (QREFELT $ 29)) (EXIT |ans|))))) 

(DEFUN |NUMERIC;complexNumeric;CC;33| (|s| $)
  (PROG (|s'|)
    (RETURN
     (SEQ
      (LETT |s'| (SPADCALL |s| (QREFELT $ 78)) |NUMERIC;complexNumeric;CC;33|)
      (EXIT
       (COND
        ((QEQCAR |s'| 1)
         (|error|
          "Cannot compute the numerical value of a non-constant object"))
        ('T (SPADCALL (QCDR |s'|) (QREFELT $ 25))))))))) 

(DEFUN |NUMERIC;complexNumeric;CPiC;34| (|s| |n| $)
  (PROG (|ans| |old| |s'|)
    (RETURN
     (SEQ
      (LETT |s'| (SPADCALL |s| (QREFELT $ 78))
            . #1=(|NUMERIC;complexNumeric;CPiC;34|))
      (EXIT
       (COND
        ((QEQCAR |s'| 1)
         (|error|
          "Cannot compute the numerical value of a non-constant object"))
        ('T
         (SEQ (LETT |old| (SPADCALL |n| (QREFELT $ 29)) . #1#)
              (LETT |ans| (SPADCALL (QCDR |s'|) (QREFELT $ 25)) . #1#)
              (SPADCALL |old| (QREFELT $ 29)) (EXIT |ans|))))))))) 

(DEFUN |NUMERIC;numeric;SPiF;35| (|s| |n| $)
  (PROG (|ans| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;numeric;SPiF;35|))
      (LETT |ans| (SPADCALL |s| (QREFELT $ 22)) . #1#)
      (SPADCALL |old| (QREFELT $ 29)) (EXIT |ans|))))) 

(DEFUN |NUMERIC;numeric;PF;36| (|p| $)
  (PROG (|p'|)
    (RETURN
     (SEQ (LETT |p'| (SPADCALL |p| (QREFELT $ 20)) |NUMERIC;numeric;PF;36|)
          (EXIT
           (COND
            ((QEQCAR |p'| 1)
             (|error|
              "Can only compute the numerical value of a constant, real-valued polynomial"))
            ('T (SPADCALL (QCDR |p'|) (QREFELT $ 22))))))))) 

(DEFUN |NUMERIC;complexNumeric;PC;37| (|p| $)
  (PROG (|p'|)
    (RETURN
     (SEQ
      (LETT |p'| (SPADCALL |p| (QREFELT $ 20)) |NUMERIC;complexNumeric;PC;37|)
      (EXIT
       (COND
        ((QEQCAR |p'| 1)
         (|error|
          "Cannot compute the numerical value of a non-constant polynomial"))
        ('T (SPADCALL (QCDR |p'|) (QREFELT $ 25))))))))) 

(DEFUN |NUMERIC;complexNumeric;PPiC;38| (|p| |n| $)
  (PROG (|p'|)
    (RETURN
     (SEQ
      (LETT |p'| (SPADCALL |p| (QREFELT $ 20))
            |NUMERIC;complexNumeric;PPiC;38|)
      (EXIT
       (COND
        ((QEQCAR |p'| 1)
         (|error|
          "Cannot compute the numerical value of a non-constant polynomial"))
        ('T (SPADCALL (QCDR |p'|) |n| (QREFELT $ 27))))))))) 

(DEFUN |NUMERIC;numeric;PPiF;39| (|p| |n| $)
  (PROG (|ans| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;numeric;PPiF;39|))
      (LETT |ans| (SPADCALL |p| (QREFELT $ 79)) . #1#)
      (SPADCALL |old| (QREFELT $ 29)) (EXIT |ans|))))) 

(DEFUN |NUMERIC;numeric;FF;40| (|f| $)
  (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 32)) (QREFELT $ 79))
            (SPADCALL (SPADCALL |f| (QREFELT $ 33)) (QREFELT $ 79))
            (QREFELT $ 34))) 

(DEFUN |NUMERIC;complexNumeric;FC;41| (|f| $)
  (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 32)) (QREFELT $ 80))
            (SPADCALL (SPADCALL |f| (QREFELT $ 33)) (QREFELT $ 80))
            (QREFELT $ 36))) 

(DEFUN |NUMERIC;complexNumeric;FPiC;42| (|f| |n| $)
  (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 32)) |n| (QREFELT $ 81))
            (SPADCALL (SPADCALL |f| (QREFELT $ 33)) |n| (QREFELT $ 81))
            (QREFELT $ 36))) 

(DEFUN |NUMERIC;numeric;FPiF;43| (|f| |n| $)
  (PROG (|ans| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;numeric;FPiF;43|))
      (LETT |ans| (SPADCALL |f| (QREFELT $ 83)) . #1#)
      (SPADCALL |old| (QREFELT $ 29)) (EXIT |ans|))))) 

(DEFUN |NUMERIC;complexNumeric;FC;44| (|f| $)
  (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 41)) (QREFELT $ 76))
            (SPADCALL (SPADCALL |f| (QREFELT $ 42)) (QREFELT $ 76))
            (QREFELT $ 36))) 

(DEFUN |NUMERIC;complexNumeric;FPiC;45| (|f| |n| $)
  (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 41)) |n| (QREFELT $ 77))
            (SPADCALL (SPADCALL |f| (QREFELT $ 42)) |n| (QREFELT $ 77))
            (QREFELT $ 36))) 

(DEFUN |NUMERIC;numeric;EF;46| (|x| $)
  (PROG (|x'|)
    (RETURN
     (SEQ
      (LETT |x'|
            (SPADCALL (SPADCALL (ELT $ 45) |x| (QREFELT $ 50)) (QREFELT $ 51))
            |NUMERIC;numeric;EF;46|)
      (EXIT
       (COND
        ((QEQCAR |x'| 1)
         (|error|
          "Can only compute the numerical value of a constant, real-valued Expression"))
        ('T (QCDR |x'|)))))))) 

(DEFUN |NUMERIC;complexNumeric;EC;47| (|x| $)
  (PROG (|x'|)
    (RETURN
     (SEQ
      (LETT |x'|
            (SPADCALL (SPADCALL (ELT $ 25) |x| (QREFELT $ 92)) (QREFELT $ 69))
            |NUMERIC;complexNumeric;EC;47|)
      (EXIT
       (COND
        ((QEQCAR |x'| 1)
         (|error|
          "Cannot compute the numerical value of a non-constant expression"))
        ('T (QCDR |x'|)))))))) 

(DEFUN |NUMERIC;numeric;EPiF;48| (|x| |n| $)
  (PROG (|ans| |x'| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;numeric;EPiF;48|))
      (LETT |x'| (SPADCALL (ELT $ 45) |x| (QREFELT $ 50)) . #1#)
      (LETT |ans| (SPADCALL |x'| (QREFELT $ 51)) . #1#)
      (SPADCALL |old| (QREFELT $ 29))
      (EXIT
       (COND
        ((QEQCAR |ans| 1)
         (|error|
          "Can only compute the numerical value of a constant, real-valued Expression"))
        ('T (QCDR |ans|)))))))) 

(DEFUN |NUMERIC;complexNumeric;EPiC;49| (|x| |n| $)
  (PROG (|ans| |x'| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;complexNumeric;EPiC;49|))
      (LETT |x'| (SPADCALL (ELT $ 25) |x| (QREFELT $ 92)) . #1#)
      (LETT |ans| (SPADCALL |x'| (QREFELT $ 69)) . #1#)
      (SPADCALL |old| (QREFELT $ 29))
      (EXIT
       (COND
        ((QEQCAR |ans| 1)
         (|error|
          "Cannot compute the numerical value of a non-constant expression"))
        ('T (QCDR |ans|)))))))) 

(DEFUN |NUMERIC;complexNumeric;EC;50| (|x| $)
  (PROG (|x'|)
    (RETURN
     (SEQ
      (LETT |x'|
            (SPADCALL (SPADCALL (ELT $ 12) |x| (QREFELT $ 68)) (QREFELT $ 69))
            |NUMERIC;complexNumeric;EC;50|)
      (EXIT
       (COND
        ((QEQCAR |x'| 1)
         (|error|
          "Cannot compute the numerical value of a non-constant expression"))
        ('T (QCDR |x'|)))))))) 

(DEFUN |NUMERIC;complexNumeric;EPiC;51| (|x| |n| $)
  (PROG (|ans| |x'| |old|)
    (RETURN
     (SEQ
      (LETT |old| (SPADCALL |n| (QREFELT $ 29))
            . #1=(|NUMERIC;complexNumeric;EPiC;51|))
      (LETT |x'| (SPADCALL (ELT $ 12) |x| (QREFELT $ 68)) . #1#)
      (LETT |ans| (SPADCALL |x'| (QREFELT $ 69)) . #1#)
      (SPADCALL |old| (QREFELT $ 29))
      (EXIT
       (COND
        ((QEQCAR |ans| 1)
         (|error|
          "Cannot compute the numerical value of a non-constant expression"))
        ('T (QCDR |ans|)))))))) 

(DECLAIM (NOTINLINE |Numeric;|)) 

(DEFUN |Numeric| (#1=#:G337)
  (PROG ()
    (RETURN
     (PROG (#2=#:G338)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|Numeric|)
                                           '|domainEqualList|)
                . #3=(|Numeric|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Numeric;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Numeric|))))))))))) 

(DEFUN |Numeric;| (|#1|)
  (PROG (|pv$| #1=#:G336 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|Numeric|))
      (LETT |dv$| (LIST '|Numeric| DV$1) . #2#)
      (LETT $ (GETREFV 98) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                . #2#)
                                          (AND #1#
                                               (|HasCategory| |#1|
                                                              '(|OrderedSet|)))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|Numeric| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 4)
        (PROGN
         (QSETREFV $ 14
                   (CONS
                    (|dispatchFunction| |NUMERIC;complexNumericIfCan;PU;1|) $))
         (QSETREFV $ 17
                   (CONS
                    (|dispatchFunction| |NUMERIC;complexNumericIfCan;PPiU;2|)
                    $)))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 24
                   (CONS (|dispatchFunction| |NUMERIC;numericIfCan;PU;3|) $))
         (QSETREFV $ 26
                   (CONS
                    (|dispatchFunction| |NUMERIC;complexNumericIfCan;PU;4|) $))
         (QSETREFV $ 28
                   (CONS
                    (|dispatchFunction| |NUMERIC;complexNumericIfCan;PPiU;5|)
                    $))
         (QSETREFV $ 30
                   (CONS (|dispatchFunction| |NUMERIC;numericIfCan;PPiU;6|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 35
                   (CONS (|dispatchFunction| |NUMERIC;numericIfCan;FU;7|) $))
         (QSETREFV $ 37
                   (CONS
                    (|dispatchFunction| |NUMERIC;complexNumericIfCan;FU;8|) $))
         (QSETREFV $ 38
                   (CONS
                    (|dispatchFunction| |NUMERIC;complexNumericIfCan;FPiU;9|)
                    $))
         (QSETREFV $ 39
                   (CONS (|dispatchFunction| |NUMERIC;numericIfCan;FPiU;10|)
                         $))
         (QSETREFV $ 43
                   (CONS
                    (|dispatchFunction| |NUMERIC;complexNumericIfCan;FU;11|)
                    $))
         (QSETREFV $ 44
                   (CONS
                    (|dispatchFunction| |NUMERIC;complexNumericIfCan;FPiU;12|)
                    $))
         (COND
          ((|HasCategory| |#1| '(|OrderedSet|))
           (PROGN
            (QSETREFV $ 52
                      (CONS (|dispatchFunction| |NUMERIC;numericIfCan;EU;13|)
                            $))
            (QSETREFV $ 59
                      (CONS
                       (|dispatchFunction| |NUMERIC;complexNumericIfCan;EU;14|)
                       $))
            (QSETREFV $ 62
                      (CONS (|dispatchFunction| |NUMERIC;numericIfCan;EPiU;15|)
                            $))
            (QSETREFV $ 63
                      (CONS
                       (|dispatchFunction|
                        |NUMERIC;complexNumericIfCan;EPiU;16|)
                       $))
            (COND
             ((|HasCategory| |#1| '(|RealConstant|))
              (PROGN
               (QSETREFV $ 58
                         (CONS
                          (|dispatchFunction|
                           |NUMERIC;complexNumericIfCan;EU;17|)
                          $))
               (QSETREFV $ 70
                         (CONS
                          (|dispatchFunction|
                           |NUMERIC;complexNumericIfCan;EPiU;18|)
                          $))))
             ('T
              (PROGN
               (QSETREFV $ 58
                         (CONS
                          (|dispatchFunction|
                           |NUMERIC;complexNumericIfCan;EU;20|)
                          $))
               (QSETREFV $ 70
                         (CONS
                          (|dispatchFunction|
                           |NUMERIC;complexNumericIfCan;EPiU;21|)
                          $)))))))))))
      (COND
       ((|HasCategory| |#1| '(|ConvertibleTo| (|Complex| (|Float|))))
        (PROGN
         (QSETREFV $ 25
                   (CONS (|dispatchFunction| |NUMERIC;complexNumeric;SC;23|)
                         $))
         (QSETREFV $ 27
                   (CONS (|dispatchFunction| |NUMERIC;complexNumeric;SPiC;24|)
                         $))))
       ('T
        (PROGN
         (QSETREFV $ 25
                   (CONS (|dispatchFunction| |NUMERIC;complexNumeric;SC;25|)
                         $))
         (QSETREFV $ 27
                   (CONS (|dispatchFunction| |NUMERIC;complexNumeric;SPiC;26|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 4)
        (PROGN
         (QSETREFV $ 76
                   (CONS (|dispatchFunction| |NUMERIC;complexNumeric;PC;27|)
                         $))
         (QSETREFV $ 77
                   (CONS (|dispatchFunction| |NUMERIC;complexNumeric;PPiC;28|)
                         $))
         (COND
          ((|HasCategory| |#1| '(|RealConstant|))
           (PROGN
            (QSETREFV $ 12
                      (CONS (|dispatchFunction| |NUMERIC;complexNumeric;CC;29|)
                            $))
            (QSETREFV $ 16
                      (CONS
                       (|dispatchFunction| |NUMERIC;complexNumeric;CPiC;30|)
                       $))))
          ((|HasCategory| (|Complex| |#1|)
                          '(|ConvertibleTo| (|Complex| (|Float|))))
           (PROGN
            (QSETREFV $ 12
                      (CONS (|dispatchFunction| |NUMERIC;complexNumeric;CC;31|)
                            $))
            (QSETREFV $ 16
                      (CONS
                       (|dispatchFunction| |NUMERIC;complexNumeric;CPiC;32|)
                       $))))
          ('T
           (PROGN
            (QSETREFV $ 12
                      (CONS (|dispatchFunction| |NUMERIC;complexNumeric;CC;33|)
                            $))
            (QSETREFV $ 16
                      (CONS
                       (|dispatchFunction| |NUMERIC;complexNumeric;CPiC;34|)
                       $))))))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 79 (CONS (|dispatchFunction| |NUMERIC;numeric;PF;36|) $))
         (QSETREFV $ 80
                   (CONS (|dispatchFunction| |NUMERIC;complexNumeric;PC;37|)
                         $))
         (QSETREFV $ 81
                   (CONS (|dispatchFunction| |NUMERIC;complexNumeric;PPiC;38|)
                         $))
         (QSETREFV $ 82
                   (CONS (|dispatchFunction| |NUMERIC;numeric;PPiF;39|) $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 83 (CONS (|dispatchFunction| |NUMERIC;numeric;FF;40|) $))
         (QSETREFV $ 84
                   (CONS (|dispatchFunction| |NUMERIC;complexNumeric;FC;41|)
                         $))
         (QSETREFV $ 85
                   (CONS (|dispatchFunction| |NUMERIC;complexNumeric;FPiC;42|)
                         $))
         (QSETREFV $ 86
                   (CONS (|dispatchFunction| |NUMERIC;numeric;FPiF;43|) $))
         (QSETREFV $ 87
                   (CONS (|dispatchFunction| |NUMERIC;complexNumeric;FC;44|)
                         $))
         (QSETREFV $ 88
                   (CONS (|dispatchFunction| |NUMERIC;complexNumeric;FPiC;45|)
                         $))
         (COND
          ((|HasCategory| |#1| '(|OrderedSet|))
           (PROGN
            (QSETREFV $ 89
                      (CONS (|dispatchFunction| |NUMERIC;numeric;EF;46|) $))
            (QSETREFV $ 93
                      (CONS (|dispatchFunction| |NUMERIC;complexNumeric;EC;47|)
                            $))
            (QSETREFV $ 94
                      (CONS (|dispatchFunction| |NUMERIC;numeric;EPiF;48|) $))
            (QSETREFV $ 95
                      (CONS
                       (|dispatchFunction| |NUMERIC;complexNumeric;EPiC;49|)
                       $))
            (QSETREFV $ 96
                      (CONS (|dispatchFunction| |NUMERIC;complexNumeric;EC;50|)
                            $))
            (QSETREFV $ 97
                      (CONS
                       (|dispatchFunction| |NUMERIC;complexNumeric;EPiC;51|)
                       $))))))))
      $)))) 

(MAKEPROP '|Numeric| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Union| 11 '#1="failed")
              (|Polynomial| 11) (0 . |retractIfCan|) (|Complex| 21)
              (|Complex| 6) (5 . |complexNumeric|) (|Union| 10 '"failed")
              (10 . |complexNumericIfCan|) (|PositiveInteger|)
              (15 . |complexNumeric|) (21 . |complexNumericIfCan|)
              (|Union| 6 '#1#) (|Polynomial| 6) (27 . |retractIfCan|) (|Float|)
              |NUMERIC;numeric;SF;22| (|Union| 21 '"failed")
              (32 . |numericIfCan|) (37 . |complexNumeric|)
              (42 . |complexNumericIfCan|) (47 . |complexNumeric|)
              (53 . |complexNumericIfCan|) (59 . |digits|)
              (64 . |numericIfCan|) (|Fraction| 19) (70 . |numer|)
              (75 . |denom|) (80 . /) (86 . |numericIfCan|) (91 . /)
              (97 . |complexNumericIfCan|) (102 . |complexNumericIfCan|)
              (108 . |numericIfCan|) (|Fraction| 8) (114 . |numer|)
              (119 . |denom|) (124 . |complexNumericIfCan|)
              (129 . |complexNumericIfCan|) (135 . |convert|) (|Expression| 21)
              (|Mapping| 21 6) (|Expression| 6) (|ExpressionFunctions2| 6 21)
              (140 . |map|) (146 . |retractIfCan|) (151 . |numericIfCan|)
              (156 . |coerce|) (|Expression| 11) (|Mapping| 11 6)
              (|ExpressionFunctions2| 6 11) (161 . |map|)
              (167 . |complexNumericIfCan|) (172 . |complexNumericIfCan|)
              (177 . |bits|) (181 . |bits|) (186 . |numericIfCan|)
              (192 . |complexNumericIfCan|) (198 . |convert|) (|Expression| 10)
              (|Mapping| 10 11) (|ExpressionFunctions2| 11 10) (203 . |map|)
              (209 . |retractIfCan|) (214 . |complexNumericIfCan|)
              (|ComplexFunctions2| 6 21) (220 . |map|) (226 . |convert|)
              (231 . |coerce|) |NUMERIC;numeric;SPiF;35|
              (236 . |complexNumeric|) (241 . |complexNumeric|)
              (247 . |retractIfCan|) (252 . |numeric|) (257 . |complexNumeric|)
              (262 . |complexNumeric|) (268 . |numeric|) (274 . |numeric|)
              (279 . |complexNumeric|) (284 . |complexNumeric|)
              (290 . |numeric|) (296 . |complexNumeric|)
              (301 . |complexNumeric|) (307 . |numeric|) (|Mapping| 10 6)
              (|ExpressionFunctions2| 6 10) (312 . |map|)
              (318 . |complexNumeric|) (323 . |numeric|)
              (329 . |complexNumeric|) (335 . |complexNumeric|)
              (340 . |complexNumeric|))
           '#(|numericIfCan| 346 |numeric| 379 |complexNumericIfCan| 423
              |complexNumeric| 489)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 97
                                                 '(1 8 7 0 9 1 0 10 11 12 1 0
                                                   13 8 14 2 0 10 11 15 16 2 0
                                                   13 8 15 17 1 19 18 0 20 1 0
                                                   23 19 24 1 0 10 6 25 1 0 13
                                                   19 26 2 0 10 6 15 27 2 0 13
                                                   19 15 28 1 21 15 15 29 2 0
                                                   23 19 15 30 1 31 19 0 32 1
                                                   31 19 0 33 2 21 0 0 0 34 1 0
                                                   23 31 35 2 10 0 0 0 36 1 0
                                                   13 31 37 2 0 13 31 15 38 2 0
                                                   23 31 15 39 1 40 8 0 41 1 40
                                                   8 0 42 1 0 13 40 43 2 0 13
                                                   40 15 44 1 6 21 0 45 2 49 46
                                                   47 48 50 1 46 23 0 51 1 0 23
                                                   48 52 1 11 0 6 53 2 56 54 55
                                                   48 57 1 0 13 54 58 1 0 13 48
                                                   59 0 21 15 60 1 21 15 15 61
                                                   2 0 23 48 15 62 2 0 13 48 15
                                                   63 1 11 10 0 64 2 67 65 66
                                                   54 68 1 65 13 0 69 2 0 13 54
                                                   15 70 2 71 10 47 11 72 1 6
                                                   10 0 73 1 10 0 21 74 1 0 10
                                                   8 76 2 0 10 8 15 77 1 11 18
                                                   0 78 1 0 21 19 79 1 0 10 19
                                                   80 2 0 10 19 15 81 2 0 21 19
                                                   15 82 1 0 21 31 83 1 0 10 31
                                                   84 2 0 10 31 15 85 2 0 21 31
                                                   15 86 1 0 10 40 87 2 0 10 40
                                                   15 88 1 0 21 48 89 2 91 65
                                                   90 48 92 1 0 10 48 93 2 0 21
                                                   48 15 94 2 0 10 48 15 95 1 0
                                                   10 54 96 2 0 10 54 15 97 1 2
                                                   23 48 52 2 2 23 48 15 62 1 1
                                                   23 31 35 2 1 23 31 15 39 2 3
                                                   23 19 15 30 1 3 23 19 24 1 2
                                                   21 48 89 2 2 21 48 15 94 1 1
                                                   21 31 83 2 1 21 31 15 86 2 3
                                                   21 19 15 82 1 3 21 19 79 2 0
                                                   21 6 15 75 1 0 21 6 22 1 2
                                                   13 48 59 2 2 13 48 15 63 2 2
                                                   13 54 15 70 1 2 13 54 58 2 4
                                                   13 8 15 17 1 4 13 8 14 1 1
                                                   13 31 37 2 1 13 31 15 38 2 1
                                                   13 40 15 44 1 1 13 40 43 1 3
                                                   13 19 26 2 3 13 19 15 28 1 2
                                                   10 48 93 1 2 10 54 96 2 2 10
                                                   48 15 95 2 2 10 54 15 97 1 4
                                                   10 11 12 1 4 10 8 76 2 4 10
                                                   11 15 16 2 4 10 8 15 77 1 1
                                                   10 31 84 2 1 10 31 15 85 2 1
                                                   10 40 15 88 1 1 10 40 87 2 3
                                                   10 19 15 81 1 3 10 19 80 1 0
                                                   10 6 25 2 0 10 6 15 27)))))
           '|lookupComplete|)) 
