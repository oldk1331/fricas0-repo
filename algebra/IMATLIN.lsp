
(/VERSIONCHECK 2) 

(DEFUN |IMATLIN;rowAllZeroes?| (|x| |i| $)
  (PROG (#1=#:G143 #2=#:G145 #3=#:G146 |j|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ
           (LETT |j| (SPADCALL |x| (QREFELT $ 11))
                 . #4=(|IMATLIN;rowAllZeroes?|))
           (LETT #3# (SPADCALL |x| (QREFELT $ 12)) . #4#) G190
           (COND ((> |j| #3#) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                         (|spadConstant| $ 14) (QREFELT $ 16))
               (PROGN
                (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                (GO #1#))))))
           (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |IMATLIN;colAllZeroes?| (|x| |j| $)
  (PROG (#1=#:G148 #2=#:G150 #3=#:G151 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ
           (LETT |i| (SPADCALL |x| (QREFELT $ 17))
                 . #4=(|IMATLIN;colAllZeroes?|))
           (LETT #3# (SPADCALL |x| (QREFELT $ 18)) . #4#) G190
           (COND ((> |i| #3#) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                         (|spadConstant| $ 14) (QREFELT $ 16))
               (PROGN
                (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                (GO #1#))))))
           (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |IMATLIN;row_operation_base;M4IRV;3| (|x| |i| |j| |k| |maxC| |pp| $)
  (PROG (|k1|)
    (RETURN
     (SEQ (LETT |k1| |j| . #1=(|IMATLIN;row_operation_base;M4IRV;3|)) G190
          (COND ((> |k1| |maxC|) (GO G191)))
          (SEQ
           (EXIT
            (QSETAREF2O |x| |k| |k1|
                        (SPADCALL (QAREF2O |x| |k| |k1| 1 1)
                                  (SPADCALL |pp| (QAREF2O |x| |i| |k1| 1 1)
                                            (QREFELT $ 19))
                                  (QREFELT $ 20))
                        1 1)))
          (LETT |k1| (+ |k1| 1) . #1#) (GO G190) G191 (EXIT NIL))))) 

(DEFUN |IMATLIN;row_operation_modular;M4IRIV;4|
       (|x| |i| |j| |k| |maxC| |pp| |p| $)
  (PROG (|k1| |ms| |js| |pp1|)
    (RETURN
     (SEQ
      (LETT |pp1| (- |p| |pp|) . #1=(|IMATLIN;row_operation_modular;M4IRIV;4|))
      (LETT |js| |j| . #1#) (LETT |ms| |maxC| . #1#)
      (EXIT
       (SEQ (LETT |k1| |js| . #1#) G190
            (COND ((|greater_SI| |k1| |ms|) (GO G191)))
            (SEQ
             (EXIT
              (QSETAREF2O |x| |k| |k1|
                          (QSMULADDMOD64-32 |pp1| (QAREF2O |x| |i| |k1| 1 1)
                                            (QAREF2O |x| |k| |k1| 1 1) |p|)
                          1 1)))
            (LETT |k1| (|inc_SI| |k1|) . #1#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |IMATLIN;rowEchelon;2M;5| (|y| $)
  (PROG (|i| |pp| |k| |b| #1=#:G177 |n| #2=#:G188 |j| |maxC| |minC| |maxR|
         |minR| |x| |row_op| #3=#:G165 |cc|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |row_op|
              (SEQ
               (LETT |cc| (SPADCALL (QREFELT $ 25))
                     . #4=(|IMATLIN;rowEchelon;2M;5|))
               (COND
                ((SPADCALL |cc| (|spadConstant| $ 26) (QREFELT $ 27))
                 (COND
                  ((SPADCALL |cc| 1000000000 (QREFELT $ 28))
                   (COND
                    ((|domainEqual| (QREFELT $ 6)
                                    (|PrimeField|
                                     (PROG1 (LETT #3# |cc| . #4#)
                                       (|check_subtype| (> #3# 0)
                                                        '(|PositiveInteger|)
                                                        #3#))))
                     (EXIT
                      (CONS #'|IMATLIN;rowEchelon;2M;5!0|
                            (VECTOR $ |cc|)))))))))
               (EXIT (ELT $ 22)))
              . #4#)
        (LETT |x| (SPADCALL |y| (QREFELT $ 29)) . #4#) (LETT |minR| 1 . #4#)
        (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #4#) (LETT |minC| 1 . #4#)
        (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #4#)
        (LETT |i| |minR| . #4#) (LETT |n| (- |minR| 1) . #4#)
        (SEQ (LETT |j| |minC| . #4#) G190 (COND ((> |j| |maxC|) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |i| |maxR| (QREFELT $ 31))
                 (PROGN (LETT #2# |x| . #4#) (GO #2#)))
                ('T
                 (SEQ (LETT |n| (- |minR| 1) . #4#)
                      (SEQ
                       (EXIT
                        (SEQ (LETT |k| |i| . #4#) G190
                             (COND ((> |k| |maxR|) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                           (|spadConstant| $ 14)
                                           (QREFELT $ 16))
                                 (SEQ (LETT |n| |k| . #4#)
                                      (EXIT
                                       (PROGN
                                        (LETT #1# |$NoValue| . #4#)
                                        (GO #1#))))))))
                             (LETT |k| (+ |k| 1) . #4#) (GO G190) G191
                             (EXIT NIL)))
                       #1# (EXIT #1#))
                      (EXIT
                       (COND ((EQL |n| (- |minR| 1)) "no non-zeroes")
                             ('T
                              (SEQ
                               (COND
                                ((SPADCALL |i| |n| (QREFELT $ 32))
                                 (SPADCALL |x| |i| |n| (QREFELT $ 33))))
                               (LETT |b|
                                     (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                               (QREFELT $ 34))
                                     . #4#)
                               (QSETAREF2O |x| |i| |j| (|spadConstant| $ 30) 1
                                           1)
                               (SEQ (LETT |k| (+ |j| 1) . #4#) G190
                                    (COND ((> |k| |maxC|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (QSETAREF2O |x| |i| |k|
                                                  (SPADCALL |b|
                                                            (QAREF2O |x| |i|
                                                                     |k| 1 1)
                                                            (QREFELT $ 19))
                                                  1 1)))
                                    (LETT |k| (+ |k| 1) . #4#) (GO G190) G191
                                    (EXIT NIL))
                               (SEQ (LETT |k| |minR| . #4#) G190
                                    (COND ((> |k| |maxR|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |k| |i| (QREFELT $ 32))
                                        (SEQ
                                         (LETT |pp| (QAREF2O |x| |k| |j| 1 1)
                                               . #4#)
                                         (EXIT
                                          (COND
                                           ((NULL
                                             (SPADCALL |pp|
                                                       (|spadConstant| $ 14)
                                                       (QREFELT $ 35)))
                                            (SEQ
                                             (SPADCALL |x| |i| (+ |j| 1) |k|
                                                       |maxC| |pp| |row_op|)
                                             (EXIT
                                              (QSETAREF2O |x| |k| |j|
                                                          (|spadConstant| $ 14)
                                                          1 1)))))))))))
                                    (LETT |k| (+ |k| 1) . #4#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1) . #4#)))))))))))
             (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT |x|)))
      #2# (EXIT #2#))))) 

(DEFUN |IMATLIN;rowEchelon;2M;5!0| (|x| |i| |j| |k| |maxC| |pp| $$)
  (PROG (|cc| $)
    (LETT |cc| (QREFELT $$ 1) . #1=(|IMATLIN;rowEchelon;2M;5|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL |x| |i| |j| |k| |maxC| |pp| |cc| (QREFELT $ 23)))))) 

(DEFUN |IMATLIN;nullSpace;ML;6| (|y| $)
  (PROG (|l| |j| |basis| #1=#:G211 |k| #2=#:G212 |ll| |w| #3=#:G210 |i| |v|
         |row| #4=#:G190 |rk| #5=#:G189 |ncol| |nrow| |maxC| |minC| |maxR|
         |minR| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL |y| (QREFELT $ 36)) . #6=(|IMATLIN;nullSpace;ML;6|))
      (LETT |minR| 1 . #6#) (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #6#)
      (LETT |minC| 1 . #6#) (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #6#)
      (LETT |nrow| (ANROWS |x|) . #6#) (LETT |ncol| (ANCOLS |x|) . #6#)
      (LETT |basis| NIL . #6#) (LETT |rk| |nrow| . #6#)
      (LETT |row| |maxR| . #6#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((SPADCALL |rk| 0 (QREFELT $ 27))
                (|IMATLIN;rowAllZeroes?| |x| |row| $))
               ('T 'NIL)))
             (GO G191)))
           (SEQ
            (LETT |rk|
                  (PROG1 (LETT #5# (- |rk| 1) . #6#)
                    (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                  . #6#)
            (EXIT
             (LETT |row|
                   (PROG1 (LETT #4# (- |row| 1) . #6#)
                     (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|) #4#))
                   . #6#)))
           NIL (GO G190) G191 (EXIT NIL))
      (COND
       ((SPADCALL |ncol| |nrow| (QREFELT $ 37))
        (COND ((EQL |rk| |ncol|) (EXIT NIL)))))
      (EXIT
       (COND
        ((EQL |rk| 0)
         (SEQ
          (SEQ (LETT |j| |minC| . #6#) G190 (COND ((> |j| |maxC|) (GO G191)))
               (SEQ
                (LETT |w|
                      (SPADCALL |ncol| (|spadConstant| $ 14) (QREFELT $ 38))
                      . #6#)
                (SPADCALL |w| |j| (|spadConstant| $ 30) (QREFELT $ 39))
                (EXIT (LETT |basis| (CONS |w| |basis|) . #6#)))
               (LETT |j| (+ |j| 1) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT |basis|)))
        ('T
         (SEQ
          (LETT |v|
                (SPADCALL |ncol| (- |minR| 1)
                          (|compiledLookupCheck| '|new|
                                                 (LIST '$
                                                       (LIST
                                                        '|NonNegativeInteger|)
                                                       (LIST '|Integer|))
                                                 (|IndexedOneDimensionalArray|
                                                  (|Integer|) |minC|)))
                . #6#)
          (SEQ (LETT |i| |minR| . #6#) (LETT #3# (- (+ |minR| |rk|) 1) . #6#)
               G190 (COND ((> |i| #3#) (GO G191)))
               (SEQ
                (SEQ (LETT |j| |minC| . #6#) G190
                     (COND
                      ((NULL
                        (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                  (|spadConstant| $ 14) (QREFELT $ 35)))
                       (GO G191)))
                     (SEQ (EXIT |j|)) (LETT |j| (+ |j| 1) . #6#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |v| |j| |i|
                           (|compiledLookupCheck| '|qsetelt!|
                                                  (LIST (LIST '|Integer|) '$
                                                        (LIST '|Integer|)
                                                        (LIST '|Integer|))
                                                  (|IndexedOneDimensionalArray|
                                                   (|Integer|) |minC|)))))
               (LETT |i| (+ |i| 1) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |j| |maxC| . #6#) (LETT |l| (- (+ |minR| |ncol|) 1) . #6#)
          (SEQ G190 (COND ((NULL (>= |j| |minC|)) (GO G191)))
               (SEQ
                (LETT |w|
                      (SPADCALL |ncol| (|spadConstant| $ 14) (QREFELT $ 38))
                      . #6#)
                (COND
                 ((EQL
                   (SPADCALL |v| |j|
                             (|compiledLookupCheck| '|qelt|
                                                    (LIST (LIST '|Integer|) '$
                                                          (LIST '|Integer|))
                                                    (|IndexedOneDimensionalArray|
                                                     (|Integer|) |minC|)))
                   (- |minR| 1))
                  (COND
                   ((|IMATLIN;colAllZeroes?| |x| |j| $)
                    (SEQ
                     (SPADCALL |w| |l| (|spadConstant| $ 30) (QREFELT $ 39))
                     (EXIT (LETT |basis| (CONS |w| |basis|) . #6#))))
                   ('T
                    (SEQ
                     (SEQ (LETT |ll| |minR| . #6#) (LETT #2# (- |l| 1) . #6#)
                          (LETT |k| |minC| . #6#) (LETT #1# (- |j| 1) . #6#)
                          G190 (COND ((OR (> |k| #1#) (> |ll| #2#)) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL |v| |k|
                                         (|compiledLookupCheck| '|qelt|
                                                                (LIST
                                                                 (LIST
                                                                  '|Integer|)
                                                                 '$
                                                                 (LIST
                                                                  '|Integer|))
                                                                (|IndexedOneDimensionalArray|
                                                                 (|Integer|)
                                                                 |minC|)))
                               (- |minR| 1) (QREFELT $ 32))
                              (SPADCALL |w| |ll|
                                        (SPADCALL
                                         (QAREF2O |x|
                                                  (SPADCALL |v| |k|
                                                            (|compiledLookupCheck|
                                                             '|qelt|
                                                             (LIST
                                                              (LIST '|Integer|)
                                                              '$
                                                              (LIST
                                                               '|Integer|))
                                                             (|IndexedOneDimensionalArray|
                                                              (|Integer|)
                                                              |minC|)))
                                                  |j| 1 1)
                                         (QREFELT $ 40))
                                        (QREFELT $ 39))))))
                          (LETT |k|
                                (PROG1 (+ |k| 1) (LETT |ll| (+ |ll| 1) . #6#))
                                . #6#)
                          (GO G190) G191 (EXIT NIL))
                     (SPADCALL |w| |l| (|spadConstant| $ 30) (QREFELT $ 39))
                     (EXIT (LETT |basis| (CONS |w| |basis|) . #6#)))))))
                (LETT |j| (- |j| 1) . #6#) (EXIT (LETT |l| (- |l| 1) . #6#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |basis|))))))))) 

(DEFUN |IMATLIN;determinant;MR;7| (|y| $)
  (PROG (|l| |b| |k| |ans| #1=#:G227 #2=#:G215 |rown| #3=#:G228 |i| #4=#:G229
         |j| |maxC| |minC| |maxR| |minR| |x| |ndim|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL (LETT |ndim| (ANROWS |y|) . #5=(|IMATLIN;determinant;MR;7|))
                   (ANCOLS |y|) (QREFELT $ 43))
         (|error| "determinant: matrix must be square"))
        ((EQL |ndim| 1) (QAREF2O |y| 1 1 1 1))
        ('T
         (SEQ (LETT |x| (SPADCALL |y| (QREFELT $ 29)) . #5#)
              (LETT |minR| 1 . #5#)
              (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #5#)
              (LETT |minC| 1 . #5#)
              (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #5#)
              (LETT |ans| (|spadConstant| $ 30) . #5#)
              (SEQ (LETT |j| |minC| . #5#) (LETT #4# (- |maxC| 1) . #5#)
                   (LETT |i| |minR| . #5#) (LETT #3# (- |maxR| 1) . #5#) G190
                   (COND ((OR (> |i| #3#) (> |j| #4#)) (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL (QAREF2O |x| |i| |j| 1 1) (|spadConstant| $ 14)
                                (QREFELT $ 35))
                      (SEQ (LETT |rown| (- |minR| 1) . #5#)
                           (SEQ
                            (EXIT
                             (SEQ (LETT |k| (+ |i| 1) . #5#) G190
                                  (COND ((> |k| |maxR|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                                (|spadConstant| $ 14)
                                                (QREFELT $ 16))
                                      (PROGN
                                       (LETT #2#
                                             (SEQ (LETT |rown| |k| . #5#)
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #2# |$NoValue| . #5#)
                                                    (GO #2#))))
                                             . #5#)
                                       (GO #2#))))))
                                  (LETT |k| (+ |k| 1) . #5#) (GO G190) G191
                                  (EXIT NIL)))
                            #2# (EXIT #2#))
                           (COND
                            ((EQL |rown| (- |minR| 1))
                             (PROGN
                              (LETT #1# (|spadConstant| $ 14) . #5#)
                              (GO #1#))))
                           (SPADCALL |x| |i| |rown| (QREFELT $ 33))
                           (EXIT
                            (LETT |ans| (SPADCALL |ans| (QREFELT $ 40))
                                  . #5#)))))
                    (LETT |ans|
                          (SPADCALL (QAREF2O |x| |i| |j| 1 1) |ans|
                                    (QREFELT $ 19))
                          . #5#)
                    (LETT |b|
                          (SPADCALL
                           (SPADCALL (QAREF2O |x| |i| |j| 1 1) (QREFELT $ 34))
                           (QREFELT $ 40))
                          . #5#)
                    (SEQ (LETT |l| (+ |j| 1) . #5#) G190
                         (COND ((> |l| |maxC|) (GO G191)))
                         (SEQ
                          (EXIT
                           (QSETAREF2O |x| |i| |l|
                                       (SPADCALL |b| (QAREF2O |x| |i| |l| 1 1)
                                                 (QREFELT $ 19))
                                       1 1)))
                         (LETT |l| (+ |l| 1) . #5#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SEQ (LETT |k| (+ |i| 1) . #5#) G190
                          (COND ((> |k| |maxR|) (GO G191)))
                          (SEQ (LETT |b| (QAREF2O |x| |k| |j| 1 1) . #5#)
                               (EXIT
                                (COND
                                 ((NULL
                                   (SPADCALL |b| (|spadConstant| $ 14)
                                             (QREFELT $ 35)))
                                  (SEQ (LETT |l| (+ |j| 1) . #5#) G190
                                       (COND ((> |l| |maxC|) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (QSETAREF2O |x| |k| |l|
                                                     (SPADCALL
                                                      (QAREF2O |x| |k| |l| 1 1)
                                                      (SPADCALL |b|
                                                                (QAREF2O |x|
                                                                         |i|
                                                                         |l| 1
                                                                         1)
                                                                (QREFELT $ 19))
                                                      (QREFELT $ 44))
                                                     1 1)))
                                       (LETT |l| (+ |l| 1) . #5#) (GO G190)
                                       G191 (EXIT NIL))))))
                          (LETT |k| (+ |k| 1) . #5#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (QAREF2O |x| |maxR| |maxC| 1 1) |ans|
                         (QREFELT $ 19)))))))
      #1# (EXIT #1#))))) 

(DEFUN |IMATLIN;row_operation_base;M4IRV;8| (|x| |i| |j| |k| |maxC| |pp| $)
  (PROG (|k1|)
    (RETURN
     (SEQ (LETT |k1| |j| . #1=(|IMATLIN;row_operation_base;M4IRV;8|)) G190
          (COND ((> |k1| |maxC|) (GO G191)))
          (SEQ
           (EXIT
            (SPADCALL |x| |k| |k1|
                      (SPADCALL (SPADCALL |x| |k| |k1| (QREFELT $ 13))
                                (SPADCALL |pp|
                                          (SPADCALL |x| |i| |k1|
                                                    (QREFELT $ 13))
                                          (QREFELT $ 19))
                                (QREFELT $ 20))
                      (QREFELT $ 46))))
          (LETT |k1| (+ |k1| 1) . #1#) (GO G190) G191 (EXIT NIL))))) 

(DEFUN |IMATLIN;row_operation_modular;M4IRIV;9|
       (|x| |i| |j| |k| |maxC| |pp| |p| $)
  (PROG (|k1| |ms| |js| |pp1|)
    (RETURN
     (SEQ
      (LETT |pp1| (- |p| |pp|) . #1=(|IMATLIN;row_operation_modular;M4IRIV;9|))
      (LETT |js| |j| . #1#) (LETT |ms| |maxC| . #1#)
      (EXIT
       (SEQ (LETT |k1| |js| . #1#) G190
            (COND ((|greater_SI| |k1| |ms|) (GO G191)))
            (SEQ
             (EXIT
              (SPADCALL |x| |k| |k1|
                        (QSMULADDMOD64-32 |pp1|
                                          (SPADCALL |x| |i| |k1|
                                                    (QREFELT $ 13))
                                          (SPADCALL |x| |k| |k1|
                                                    (QREFELT $ 13))
                                          |p|)
                        (QREFELT $ 46))))
            (LETT |k1| (|inc_SI| |k1|) . #1#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |IMATLIN;rowEchelon;2M;10| (|y| $)
  (PROG (|i| |pp| |k| |b| #1=#:G253 |n| #2=#:G264 |j| |maxC| |minC| |maxR|
         |minR| |x| |row_op| #3=#:G241 |cc|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |row_op|
              (SEQ
               (LETT |cc| (SPADCALL (QREFELT $ 25))
                     . #4=(|IMATLIN;rowEchelon;2M;10|))
               (COND
                ((SPADCALL |cc| (|spadConstant| $ 26) (QREFELT $ 27))
                 (COND
                  ((SPADCALL |cc| 1000000000 (QREFELT $ 28))
                   (COND
                    ((|domainEqual| (QREFELT $ 6)
                                    (|PrimeField|
                                     (PROG1 (LETT #3# |cc| . #4#)
                                       (|check_subtype| (> #3# 0)
                                                        '(|PositiveInteger|)
                                                        #3#))))
                     (EXIT
                      (CONS #'|IMATLIN;rowEchelon;2M;10!0|
                            (VECTOR $ |cc|)))))))))
               (EXIT (ELT $ 22)))
              . #4#)
        (LETT |x| (SPADCALL |y| (QREFELT $ 29)) . #4#)
        (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #4#)
        (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #4#)
        (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #4#)
        (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #4#)
        (LETT |i| |minR| . #4#) (LETT |n| (- |minR| 1) . #4#)
        (SEQ (LETT |j| |minC| . #4#) G190 (COND ((> |j| |maxC|) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |i| |maxR| (QREFELT $ 31))
                 (PROGN (LETT #2# |x| . #4#) (GO #2#)))
                ('T
                 (SEQ (LETT |n| (- |minR| 1) . #4#)
                      (SEQ
                       (EXIT
                        (SEQ (LETT |k| |i| . #4#) G190
                             (COND ((> |k| |maxR|) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (SPADCALL |x| |k| |j| (QREFELT $ 13))
                                  (|spadConstant| $ 14) (QREFELT $ 16))
                                 (SEQ (LETT |n| |k| . #4#)
                                      (EXIT
                                       (PROGN
                                        (LETT #1# |$NoValue| . #4#)
                                        (GO #1#))))))))
                             (LETT |k| (+ |k| 1) . #4#) (GO G190) G191
                             (EXIT NIL)))
                       #1# (EXIT #1#))
                      (EXIT
                       (COND ((EQL |n| (- |minR| 1)) "no non-zeroes")
                             ('T
                              (SEQ
                               (COND
                                ((SPADCALL |i| |n| (QREFELT $ 32))
                                 (SPADCALL |x| |i| |n| (QREFELT $ 33))))
                               (LETT |b|
                                     (SPADCALL
                                      (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                      (QREFELT $ 34))
                                     . #4#)
                               (SPADCALL |x| |i| |j| (|spadConstant| $ 30)
                                         (QREFELT $ 46))
                               (SEQ (LETT |k| (+ |j| 1) . #4#) G190
                                    (COND ((> |k| |maxC|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |x| |i| |k|
                                                (SPADCALL |b|
                                                          (SPADCALL |x| |i| |k|
                                                                    (QREFELT $
                                                                             13))
                                                          (QREFELT $ 19))
                                                (QREFELT $ 46))))
                                    (LETT |k| (+ |k| 1) . #4#) (GO G190) G191
                                    (EXIT NIL))
                               (SEQ (LETT |k| |minR| . #4#) G190
                                    (COND ((> |k| |maxR|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |k| |i| (QREFELT $ 32))
                                        (SEQ
                                         (LETT |pp|
                                               (SPADCALL |x| |k| |j|
                                                         (QREFELT $ 13))
                                               . #4#)
                                         (EXIT
                                          (COND
                                           ((NULL
                                             (SPADCALL |pp|
                                                       (|spadConstant| $ 14)
                                                       (QREFELT $ 35)))
                                            (SEQ
                                             (SPADCALL |x| |i| (+ |j| 1) |k|
                                                       |maxC| |pp| |row_op|)
                                             (EXIT
                                              (SPADCALL |x| |k| |j|
                                                        (|spadConstant| $ 14)
                                                        (QREFELT $
                                                                 46))))))))))))
                                    (LETT |k| (+ |k| 1) . #4#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1) . #4#)))))))))))
             (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT |x|)))
      #2# (EXIT #2#))))) 

(DEFUN |IMATLIN;rowEchelon;2M;10!0| (|x| |i| |j| |k| |maxC| |pp| $$)
  (PROG (|cc| $)
    (LETT |cc| (QREFELT $$ 1) . #1=(|IMATLIN;rowEchelon;2M;10|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL |x| |i| |j| |k| |maxC| |pp| |cc| (QREFELT $ 23)))))) 

(DEFUN |IMATLIN;nullSpace;ML;11| (|y| $)
  (PROG (|l| |j| |basis| #1=#:G287 |k| #2=#:G288 |ll| |w| #3=#:G286 |i| |v|
         |row| #4=#:G266 |rk| #5=#:G265 |ncol| |nrow| |maxC| |minC| |maxR|
         |minR| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL |y| (QREFELT $ 36)) . #6=(|IMATLIN;nullSpace;ML;11|))
      (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #6#)
      (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #6#)
      (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #6#)
      (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #6#)
      (LETT |nrow| (SPADCALL |x| (QREFELT $ 47)) . #6#)
      (LETT |ncol| (SPADCALL |x| (QREFELT $ 48)) . #6#)
      (LETT |basis| NIL . #6#) (LETT |rk| |nrow| . #6#)
      (LETT |row| |maxR| . #6#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((SPADCALL |rk| 0 (QREFELT $ 27))
                (|IMATLIN;rowAllZeroes?| |x| |row| $))
               ('T 'NIL)))
             (GO G191)))
           (SEQ
            (LETT |rk|
                  (PROG1 (LETT #5# (- |rk| 1) . #6#)
                    (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                  . #6#)
            (EXIT
             (LETT |row|
                   (PROG1 (LETT #4# (- |row| 1) . #6#)
                     (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|) #4#))
                   . #6#)))
           NIL (GO G190) G191 (EXIT NIL))
      (COND
       ((SPADCALL |ncol| |nrow| (QREFELT $ 37))
        (COND ((EQL |rk| |ncol|) (EXIT NIL)))))
      (EXIT
       (COND
        ((EQL |rk| 0)
         (SEQ
          (SEQ (LETT |j| |minC| . #6#) G190 (COND ((> |j| |maxC|) (GO G191)))
               (SEQ
                (LETT |w|
                      (SPADCALL |ncol| (|spadConstant| $ 14) (QREFELT $ 38))
                      . #6#)
                (SPADCALL |w| |j| (|spadConstant| $ 30) (QREFELT $ 39))
                (EXIT (LETT |basis| (CONS |w| |basis|) . #6#)))
               (LETT |j| (+ |j| 1) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT |basis|)))
        ('T
         (SEQ
          (LETT |v|
                (SPADCALL |ncol| (- |minR| 1)
                          (|compiledLookupCheck| '|new|
                                                 (LIST '$
                                                       (LIST
                                                        '|NonNegativeInteger|)
                                                       (LIST '|Integer|))
                                                 (|IndexedOneDimensionalArray|
                                                  (|Integer|) |minC|)))
                . #6#)
          (SEQ (LETT |i| |minR| . #6#) (LETT #3# (- (+ |minR| |rk|) 1) . #6#)
               G190 (COND ((> |i| #3#) (GO G191)))
               (SEQ
                (SEQ (LETT |j| |minC| . #6#) G190
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                  (|spadConstant| $ 14) (QREFELT $ 35)))
                       (GO G191)))
                     (SEQ (EXIT |j|)) (LETT |j| (+ |j| 1) . #6#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |v| |j| |i|
                           (|compiledLookupCheck| '|qsetelt!|
                                                  (LIST (LIST '|Integer|) '$
                                                        (LIST '|Integer|)
                                                        (LIST '|Integer|))
                                                  (|IndexedOneDimensionalArray|
                                                   (|Integer|) |minC|)))))
               (LETT |i| (+ |i| 1) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |j| |maxC| . #6#) (LETT |l| (- (+ |minR| |ncol|) 1) . #6#)
          (SEQ G190 (COND ((NULL (>= |j| |minC|)) (GO G191)))
               (SEQ
                (LETT |w|
                      (SPADCALL |ncol| (|spadConstant| $ 14) (QREFELT $ 38))
                      . #6#)
                (COND
                 ((EQL
                   (SPADCALL |v| |j|
                             (|compiledLookupCheck| '|qelt|
                                                    (LIST (LIST '|Integer|) '$
                                                          (LIST '|Integer|))
                                                    (|IndexedOneDimensionalArray|
                                                     (|Integer|) |minC|)))
                   (- |minR| 1))
                  (COND
                   ((|IMATLIN;colAllZeroes?| |x| |j| $)
                    (SEQ
                     (SPADCALL |w| |l| (|spadConstant| $ 30) (QREFELT $ 39))
                     (EXIT (LETT |basis| (CONS |w| |basis|) . #6#))))
                   ('T
                    (SEQ
                     (SEQ (LETT |ll| |minR| . #6#) (LETT #2# (- |l| 1) . #6#)
                          (LETT |k| |minC| . #6#) (LETT #1# (- |j| 1) . #6#)
                          G190 (COND ((OR (> |k| #1#) (> |ll| #2#)) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL |v| |k|
                                         (|compiledLookupCheck| '|qelt|
                                                                (LIST
                                                                 (LIST
                                                                  '|Integer|)
                                                                 '$
                                                                 (LIST
                                                                  '|Integer|))
                                                                (|IndexedOneDimensionalArray|
                                                                 (|Integer|)
                                                                 |minC|)))
                               (- |minR| 1) (QREFELT $ 32))
                              (SPADCALL |w| |ll|
                                        (SPADCALL
                                         (SPADCALL |x|
                                                   (SPADCALL |v| |k|
                                                             (|compiledLookupCheck|
                                                              '|qelt|
                                                              (LIST
                                                               (LIST
                                                                '|Integer|)
                                                               '$
                                                               (LIST
                                                                '|Integer|))
                                                              (|IndexedOneDimensionalArray|
                                                               (|Integer|)
                                                               |minC|)))
                                                   |j| (QREFELT $ 13))
                                         (QREFELT $ 40))
                                        (QREFELT $ 39))))))
                          (LETT |k|
                                (PROG1 (+ |k| 1) (LETT |ll| (+ |ll| 1) . #6#))
                                . #6#)
                          (GO G190) G191 (EXIT NIL))
                     (SPADCALL |w| |l| (|spadConstant| $ 30) (QREFELT $ 39))
                     (EXIT (LETT |basis| (CONS |w| |basis|) . #6#)))))))
                (LETT |j| (- |j| 1) . #6#) (EXIT (LETT |l| (- |l| 1) . #6#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |basis|))))))))) 

(DEFUN |IMATLIN;determinant;MR;12| (|y| $)
  (PROG (|l| |b| |k| |ans| #1=#:G303 #2=#:G291 |rown| #3=#:G304 |i| #4=#:G305
         |j| |maxC| |minC| |maxR| |minR| |x| |ndim|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL
          (LETT |ndim| (SPADCALL |y| (QREFELT $ 47))
                . #5=(|IMATLIN;determinant;MR;12|))
          (SPADCALL |y| (QREFELT $ 48)) (QREFELT $ 43))
         (|error| "determinant: matrix must be square"))
        ((EQL |ndim| 1)
         (SPADCALL |y| (SPADCALL |y| (QREFELT $ 17))
                   (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 13)))
        ('T
         (SEQ (LETT |x| (SPADCALL |y| (QREFELT $ 29)) . #5#)
              (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #5#)
              (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #5#)
              (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #5#)
              (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #5#)
              (LETT |ans| (|spadConstant| $ 30) . #5#)
              (SEQ (LETT |j| |minC| . #5#) (LETT #4# (- |maxC| 1) . #5#)
                   (LETT |i| |minR| . #5#) (LETT #3# (- |maxR| 1) . #5#) G190
                   (COND ((OR (> |i| #3#) (> |j| #4#)) (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                (|spadConstant| $ 14) (QREFELT $ 35))
                      (SEQ (LETT |rown| (- |minR| 1) . #5#)
                           (SEQ
                            (EXIT
                             (SEQ (LETT |k| (+ |i| 1) . #5#) G190
                                  (COND ((> |k| |maxR|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |x| |k| |j| (QREFELT $ 13))
                                       (|spadConstant| $ 14) (QREFELT $ 16))
                                      (PROGN
                                       (LETT #2#
                                             (SEQ (LETT |rown| |k| . #5#)
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #2# |$NoValue| . #5#)
                                                    (GO #2#))))
                                             . #5#)
                                       (GO #2#))))))
                                  (LETT |k| (+ |k| 1) . #5#) (GO G190) G191
                                  (EXIT NIL)))
                            #2# (EXIT #2#))
                           (COND
                            ((EQL |rown| (- |minR| 1))
                             (PROGN
                              (LETT #1# (|spadConstant| $ 14) . #5#)
                              (GO #1#))))
                           (SPADCALL |x| |i| |rown| (QREFELT $ 33))
                           (EXIT
                            (LETT |ans| (SPADCALL |ans| (QREFELT $ 40))
                                  . #5#)))))
                    (LETT |ans|
                          (SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13)) |ans|
                                    (QREFELT $ 19))
                          . #5#)
                    (LETT |b|
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                     (QREFELT $ 34))
                           (QREFELT $ 40))
                          . #5#)
                    (SEQ (LETT |l| (+ |j| 1) . #5#) G190
                         (COND ((> |l| |maxC|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |x| |i| |l|
                                     (SPADCALL |b|
                                               (SPADCALL |x| |i| |l|
                                                         (QREFELT $ 13))
                                               (QREFELT $ 19))
                                     (QREFELT $ 46))))
                         (LETT |l| (+ |l| 1) . #5#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SEQ (LETT |k| (+ |i| 1) . #5#) G190
                          (COND ((> |k| |maxR|) (GO G191)))
                          (SEQ
                           (LETT |b| (SPADCALL |x| |k| |j| (QREFELT $ 13))
                                 . #5#)
                           (EXIT
                            (COND
                             ((NULL
                               (SPADCALL |b| (|spadConstant| $ 14)
                                         (QREFELT $ 35)))
                              (SEQ (LETT |l| (+ |j| 1) . #5#) G190
                                   (COND ((> |l| |maxC|) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |x| |k| |l|
                                               (SPADCALL
                                                (SPADCALL |x| |k| |l|
                                                          (QREFELT $ 13))
                                                (SPADCALL |b|
                                                          (SPADCALL |x| |i| |l|
                                                                    (QREFELT $
                                                                             13))
                                                          (QREFELT $ 19))
                                                (QREFELT $ 44))
                                               (QREFELT $ 46))))
                                   (LETT |l| (+ |l| 1) . #5#) (GO G190) G191
                                   (EXIT NIL))))))
                          (LETT |k| (+ |k| 1) . #5#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |x| |maxR| |maxC| (QREFELT $ 13)) |ans|
                         (QREFELT $ 19)))))))
      #1# (EXIT #1#))))) 

(DEFUN |IMATLIN;rank;MNni;13| (|x| $)
  (PROG (|rk| #1=#:G308 |i| |y| |rh|)
    (RETURN
     (SEQ
      (LETT |y|
            (SEQ
             (LETT |rk| (SPADCALL |x| (QREFELT $ 47))
                   . #2=(|IMATLIN;rank;MNni;13|))
             (LETT |rh| (SPADCALL |x| (QREFELT $ 48)) . #2#)
             (EXIT
              (COND
               ((SPADCALL |rk| |rh| (QREFELT $ 27))
                (SEQ (LETT |rk| |rh| . #2#)
                     (EXIT (SPADCALL |x| (QREFELT $ 49)))))
               ('T (SPADCALL |x| (QREFELT $ 29))))))
            . #2#)
      (LETT |y| (SPADCALL |y| (QREFELT $ 36)) . #2#)
      (LETT |i| (SPADCALL |y| (QREFELT $ 18)) . #2#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((SPADCALL |rk| 0 (QREFELT $ 27))
                (|IMATLIN;rowAllZeroes?| |y| |i| $))
               ('T 'NIL)))
             (GO G191)))
           (SEQ (LETT |i| (- |i| 1) . #2#)
                (EXIT
                 (LETT |rk|
                       (PROG1 (LETT #1# (- |rk| 1) . #2#)
                         (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                          #1#))
                       . #2#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |rk|))))) 

(DEFUN |IMATLIN;nullity;MNni;14| (|x| $)
  (PROG (#1=#:G313)
    (RETURN
     (PROG1
         (LETT #1#
               (- (SPADCALL |x| (QREFELT $ 48)) (SPADCALL |x| (QREFELT $ 50)))
               |IMATLIN;nullity;MNni;14|)
       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))) 

(DEFUN |IMATLIN;generalizedInverse;2M;15| (|x| $)
  (PROG (|yy| #1=#:G317 |var| |nc| |ty| |y| MATCAT22 MATCAT2 VFSUP FSUP SUP)
    (RETURN
     (SEQ
      (LETT SUP (|SparseUnivariatePolynomial| (QREFELT $ 6))
            . #2=(|IMATLIN;generalizedInverse;2M;15|))
      (LETT FSUP (|Fraction| SUP) . #2#) (LETT VFSUP (|Vector| FSUP) . #2#)
      (LETT MATCAT2
            (|MatrixCategoryFunctions2| (QREFELT $ 6) (QREFELT $ 7)
                                        (QREFELT $ 8) (QREFELT $ 9) FSUP VFSUP
                                        VFSUP (|Matrix| FSUP))
            . #2#)
      (LETT MATCAT22
            (|MatrixCategoryFunctions2| FSUP VFSUP VFSUP (|Matrix| FSUP)
                                        (QREFELT $ 6) (QREFELT $ 7)
                                        (QREFELT $ 8) (QREFELT $ 9))
            . #2#)
      (LETT |y|
            (SPADCALL
             (CONS #'|IMATLIN;generalizedInverse;2M;15!0| (VECTOR FSUP SUP $))
             |x|
             (|compiledLookupCheck| '|map|
                                    (LIST (LIST '|Matrix| (|devaluate| FSUP))
                                          (LIST '|Mapping| (|devaluate| FSUP)
                                                (|devaluate| (ELT $ 6)))
                                          (|devaluate| (ELT $ 9)))
                                    MATCAT2))
            . #2#)
      (LETT |ty|
            (SPADCALL |y|
                      (|compiledLookupCheck| '|transpose| (LIST '$ '$)
                                             (|Matrix| FSUP)))
            . #2#)
      (LETT |yy|
            (SPADCALL |ty| |y|
                      (|compiledLookupCheck| '* (LIST '$ '$ '$)
                                             (|Matrix| FSUP)))
            . #2#)
      (LETT |nc| (ANCOLS |yy|) . #2#)
      (LETT |var|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 30) 1
                       (|compiledLookupCheck| '|monomial|
                                              (LIST '$ (|devaluate| (ELT $ 6))
                                                    (LIST
                                                     '|NonNegativeInteger|))
                                              SUP))
             (|compiledLookupCheck| '|coerce| (LIST '$ (|devaluate| SUP))
                                    (|Fraction| SUP)))
            . #2#)
      (LETT |yy|
            (SPADCALL
             (PROG2
                 (LETT #1#
                       (SPADCALL
                        (SPADCALL |yy|
                                  (SPADCALL (ANCOLS |yy|) |var|
                                            (|compiledLookupCheck|
                                             '|scalarMatrix|
                                             (LIST '$
                                                   (LIST '|NonNegativeInteger|)
                                                   (|devaluate| FSUP))
                                             (|Matrix| FSUP)))
                                  (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                                         (|Matrix| FSUP)))
                        (|compiledLookupCheck| '|inverse|
                                               (LIST
                                                (LIST '|Union| '$ '"failed")
                                                '$)
                                               (|Matrix| FSUP)))
                       . #2#)
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 0) (|Matrix| FSUP) #1#))
             |ty| (|compiledLookupCheck| '* (LIST '$ '$ '$) (|Matrix| FSUP)))
            . #2#)
      (EXIT
       (SPADCALL (CONS #'|IMATLIN;generalizedInverse;2M;15!1| (VECTOR SUP $))
                 |yy|
                 (|compiledLookupCheck| '|map|
                                        (LIST (|devaluate| (ELT $ 9))
                                              (LIST '|Mapping|
                                                    (|devaluate| (ELT $ 6))
                                                    (|devaluate| FSUP))
                                              (LIST '|Matrix|
                                                    (|devaluate| FSUP)))
                                        MATCAT22))))))) 

(DEFUN |IMATLIN;generalizedInverse;2M;15!1| (|z1| $$)
  (PROG ($ SUP)
    (LETT $ (QREFELT $$ 1) . #1=(|IMATLIN;generalizedInverse;2M;15|))
    (LETT SUP (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (|spadConstant| $ 14)
                (|compiledLookupCheck| '|elt|
                                       (LIST (|devaluate| (ELT $ 6))
                                             (LIST '|Fraction| '$)
                                             (|devaluate| (ELT $ 6)))
                                       SUP)))))) 

(DEFUN |IMATLIN;generalizedInverse;2M;15!0| (|r1| $$)
  (PROG ($ SUP FSUP)
    (LETT $ (QREFELT $$ 2) . #1=(|IMATLIN;generalizedInverse;2M;15|))
    (LETT SUP (QREFELT $$ 1) . #1#)
    (LETT FSUP (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL |r1|
                 (|compiledLookupCheck| '|coerce|
                                        (LIST '$ (|devaluate| (ELT $ 6))) SUP))
       (|compiledLookupCheck| '|coerce| (LIST '$ (|devaluate| SUP)) FSUP)))))) 

(DEFUN |IMATLIN;inverse;MU;16| (|x| $)
  (PROG (AB |j| |l| |i| |k| |lmax| |lmin| |kmax| |kmin| |maxC| |minC| |maxR|
         |minR| |detinv| |det| |ans2| |ndim|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |ndim| (SPADCALL |x| (QREFELT $ 47))
               . #1=(|IMATLIN;inverse;MU;16|))
         (SPADCALL |x| (QREFELT $ 48)) (QREFELT $ 43))
        (|error| "inverse: matrix must be square"))
       ((EQL |ndim| 2)
        (SEQ (LETT |ans2| (SPADCALL |ndim| |ndim| (QREFELT $ 53)) . #1#)
             (EXIT
              (COND
               ((SPADCALL
                 (LETT |det|
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| 1 1 (QREFELT $ 54))
                                  (SPADCALL |x| 2 2 (QREFELT $ 54))
                                  (QREFELT $ 19))
                        (SPADCALL (SPADCALL |x| 1 2 (QREFELT $ 54))
                                  (SPADCALL |x| 2 1 (QREFELT $ 54))
                                  (QREFELT $ 19))
                        (QREFELT $ 20))
                       . #1#)
                 (QREFELT $ 55))
                (CONS 1 "failed"))
               (#2='T
                (SEQ (LETT |detinv| (SPADCALL |det| (QREFELT $ 34)) . #1#)
                     (SPADCALL |ans2| 1 1
                               (SPADCALL (SPADCALL |x| 2 2 (QREFELT $ 54))
                                         |detinv| (QREFELT $ 19))
                               (QREFELT $ 56))
                     (SPADCALL |ans2| 1 2
                               (SPADCALL
                                (SPADCALL (SPADCALL |x| 1 2 (QREFELT $ 54))
                                          |detinv| (QREFELT $ 19))
                                (QREFELT $ 40))
                               (QREFELT $ 56))
                     (SPADCALL |ans2| 2 1
                               (SPADCALL
                                (SPADCALL (SPADCALL |x| 2 1 (QREFELT $ 54))
                                          |detinv| (QREFELT $ 19))
                                (QREFELT $ 40))
                               (QREFELT $ 56))
                     (SPADCALL |ans2| 2 2
                               (SPADCALL (SPADCALL |x| 1 1 (QREFELT $ 54))
                                         |detinv| (QREFELT $ 19))
                               (QREFELT $ 56))
                     (EXIT (CONS 0 |ans2|))))))))
       (#2#
        (SEQ (LETT AB (SPADCALL |ndim| (+ |ndim| |ndim|) (QREFELT $ 53)) . #1#)
             (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #1#)
             (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #1#)
             (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #1#)
             (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #1#)
             (LETT |kmin| (SPADCALL AB (QREFELT $ 17)) . #1#)
             (LETT |kmax| (- (+ |kmin| |ndim|) 1) . #1#)
             (LETT |lmin| (SPADCALL AB (QREFELT $ 11)) . #1#)
             (LETT |lmax| (- (+ |lmin| |ndim|) 1) . #1#)
             (SEQ (LETT |k| |kmin| . #1#) (LETT |i| |minR| . #1#) G190
                  (COND ((OR (> |i| |maxR|) (> |k| |kmax|)) (GO G191)))
                  (SEQ
                   (SEQ (LETT |l| |lmin| . #1#) (LETT |j| |minC| . #1#) G190
                        (COND ((OR (> |j| |maxC|) (> |l| |lmax|)) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL AB |k| |l|
                                    (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                    (QREFELT $ 46))))
                        (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #1#))
                              . #1#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (SPADCALL AB |k| (- (+ (+ |lmin| |ndim|) |k|) |kmin|)
                              (|spadConstant| $ 30) (QREFELT $ 46))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #1#)) . #1#)
                  (GO G190) G191 (EXIT NIL))
             (LETT AB (SPADCALL AB (QREFELT $ 36)) . #1#)
             (EXIT
              (COND
               ((SPADCALL (SPADCALL AB |kmax| |lmax| (QREFELT $ 54))
                          (|spadConstant| $ 14) (QREFELT $ 35))
                (CONS 1 "failed"))
               (#2#
                (CONS 0
                      (SPADCALL AB |kmin| |kmax| (+ |lmin| |ndim|)
                                (+ |lmax| |ndim|) (QREFELT $ 57))))))))))))) 

(DECLAIM (NOTINLINE |InnerMatrixLinearAlgebraFunctions;|)) 

(DEFUN |InnerMatrixLinearAlgebraFunctions| (&REST #1=#:G336)
  (PROG ()
    (RETURN
     (PROG (#2=#:G337)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|InnerMatrixLinearAlgebraFunctions|)
                                           '|domainEqualList|)
                . #3=(|InnerMatrixLinearAlgebraFunctions|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |InnerMatrixLinearAlgebraFunctions;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|InnerMatrixLinearAlgebraFunctions|))))))))))) 

(DEFUN |InnerMatrixLinearAlgebraFunctions;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerMatrixLinearAlgebraFunctions|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$|
            (LIST '|InnerMatrixLinearAlgebraFunctions| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 60) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#3|
                                                         '(|shallowlyMutable|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|InnerMatrixLinearAlgebraFunctions|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|domainEqual| |#4| (|Matrix| |#1|))
        (PROGN
         (QSETREFV $ 22
                   (CONS
                    (|dispatchFunction| |IMATLIN;row_operation_base;M4IRV;3|)
                    $))
         (QSETREFV $ 23
                   (CONS
                    (|dispatchFunction|
                     |IMATLIN;row_operation_modular;M4IRIV;4|)
                    $))
         (QSETREFV $ 36
                   (CONS (|dispatchFunction| |IMATLIN;rowEchelon;2M;5|) $))
         (COND
          ((|testBitVector| |pv$| 1)
           (QSETREFV $ 42
                     (CONS (|dispatchFunction| |IMATLIN;nullSpace;ML;6|) $))))
         (QSETREFV $ 45
                   (CONS (|dispatchFunction| |IMATLIN;determinant;MR;7|) $))))
       ('T
        (PROGN
         (QSETREFV $ 22
                   (CONS
                    (|dispatchFunction| |IMATLIN;row_operation_base;M4IRV;8|)
                    $))
         (QSETREFV $ 23
                   (CONS
                    (|dispatchFunction|
                     |IMATLIN;row_operation_modular;M4IRIV;9|)
                    $))
         (QSETREFV $ 36
                   (CONS (|dispatchFunction| |IMATLIN;rowEchelon;2M;10|) $))
         (COND
          ((|testBitVector| |pv$| 1)
           (QSETREFV $ 42
                     (CONS (|dispatchFunction| |IMATLIN;nullSpace;ML;11|) $))))
         (QSETREFV $ 45
                   (CONS (|dispatchFunction| |IMATLIN;determinant;MR;12|)
                         $)))))
      $)))) 

(MAKEPROP '|InnerMatrixLinearAlgebraFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |minColIndex|)
              (5 . |maxColIndex|) (10 . |qelt|) (17 . |Zero|) (|Boolean|)
              (21 . ~=) (27 . |minRowIndex|) (32 . |maxRowIndex|) (37 . *)
              (43 . -) (|Void|) (49 . |row_operation_base|)
              (59 . |row_operation_modular|) (|NonNegativeInteger|)
              (70 . |characteristic|) (74 . |Zero|) (78 . >) (84 . <)
              (90 . |copy|) (95 . |One|) (99 . >) (105 . ~=)
              (111 . |swapRows!|) (118 . |inv|) (123 . =) (129 . |rowEchelon|)
              (134 . <=) (140 . |new|) (146 . |qsetelt!|) (153 . -) (|List| 8)
              (158 . |nullSpace|) (163 . ~=) (169 . +) (175 . |determinant|)
              (180 . |qsetelt!|) (188 . |nrows|) (193 . |ncols|)
              (198 . |transpose|) |IMATLIN;rank;MNni;13|
              |IMATLIN;nullity;MNni;14| |IMATLIN;generalizedInverse;2M;15|
              (203 . |zero|) (209 . |elt|) (216 . |zero?|) (221 . |setelt|)
              (229 . |subMatrix|) (|Union| 9 '"failed")
              |IMATLIN;inverse;MU;16|)
           '#(|row_operation_modular| 238 |row_operation_base| 249 |rowEchelon|
              259 |rank| 264 |nullity| 269 |nullSpace| 274 |inverse| 279
              |generalizedInverse| 284 |determinant| 289)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 59
                                                 '(1 9 10 0 11 1 9 10 0 12 3 9
                                                   6 0 10 10 13 0 6 0 14 2 6 15
                                                   0 0 16 1 9 10 0 17 1 9 10 0
                                                   18 2 6 0 0 0 19 2 6 0 0 0 20
                                                   6 0 21 9 10 10 10 10 6 22 7
                                                   0 21 9 10 10 10 10 6 10 23 0
                                                   6 24 25 0 24 0 26 2 24 15 0
                                                   0 27 2 24 15 0 0 28 1 9 0 0
                                                   29 0 6 0 30 2 10 15 0 0 31 2
                                                   10 15 0 0 32 3 9 0 0 10 10
                                                   33 1 6 0 0 34 2 6 15 0 0 35
                                                   1 0 9 9 36 2 24 15 0 0 37 2
                                                   8 0 24 6 38 3 8 6 0 10 6 39
                                                   1 6 0 0 40 1 0 41 9 42 2 24
                                                   15 0 0 43 2 6 0 0 0 44 1 0 6
                                                   9 45 4 9 6 0 10 10 6 46 1 9
                                                   24 0 47 1 9 24 0 48 1 9 0 0
                                                   49 2 9 0 24 24 53 3 9 6 0 10
                                                   10 54 1 6 15 0 55 4 9 6 0 10
                                                   10 6 56 5 9 0 0 10 10 10 10
                                                   57 7 0 21 9 10 10 10 10 6 10
                                                   23 6 0 21 9 10 10 10 10 6 22
                                                   1 0 9 9 36 1 0 24 9 50 1 0
                                                   24 9 51 1 1 41 9 42 1 0 58 9
                                                   59 1 0 9 9 52 1 0 6 9
                                                   45)))))
           '|lookupComplete|)) 
