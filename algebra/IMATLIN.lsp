
(/VERSIONCHECK 2) 

(DEFUN |IMATLIN;rowAllZeroes?| (|x| |i| $)
  (PROG (#1=#:G145 #2=#:G147 #3=#:G148 |j|)
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
  (PROG (#1=#:G150 #2=#:G152 #3=#:G153 |i|)
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

(DEFUN |IMATLIN;rowEchelon;2M;3| (|y| $)
  (PROG (|i| |k1| |k| |b| #1=#:G156 |n| #2=#:G168 |j| |maxC| |minC| |maxR|
         |minR| |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |x| (SPADCALL |y| (QREFELT $ 19))
              . #3=(|IMATLIN;rowEchelon;2M;3|))
        (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #3#)
        (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #3#)
        (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #3#)
        (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #3#)
        (LETT |i| |minR| . #3#) (LETT |n| (- |minR| 1) . #3#)
        (SEQ (LETT |j| |minC| . #3#) G190 (COND ((> |j| |maxC|) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |i| |maxR| (QREFELT $ 21))
                 (PROGN (LETT #2# |x| . #3#) (GO #2#)))
                ('T
                 (SEQ (LETT |n| (- |minR| 1) . #3#)
                      (SEQ
                       (EXIT
                        (SEQ (LETT |k| |i| . #3#) G190
                             (COND ((> |k| |maxR|) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (SPADCALL |x| |k| |j| (QREFELT $ 13))
                                  (|spadConstant| $ 14) (QREFELT $ 16))
                                 (SEQ (LETT |n| |k| . #3#)
                                      (EXIT
                                       (PROGN
                                        (LETT #1# |$NoValue| . #3#)
                                        (GO #1#))))))))
                             (LETT |k| (+ |k| 1) . #3#) (GO G190) G191
                             (EXIT NIL)))
                       #1# (EXIT #1#))
                      (EXIT
                       (COND ((EQL |n| (- |minR| 1)) "no non-zeroes")
                             ('T
                              (SEQ
                               (COND
                                ((SPADCALL |i| |n| (QREFELT $ 22))
                                 (SPADCALL |x| |i| |n| (QREFELT $ 23))))
                               (LETT |b|
                                     (SPADCALL
                                      (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                      (QREFELT $ 24))
                                     . #3#)
                               (SPADCALL |x| |i| |j| (|spadConstant| $ 20)
                                         (QREFELT $ 25))
                               (SEQ (LETT |k| (+ |j| 1) . #3#) G190
                                    (COND ((> |k| |maxC|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |x| |i| |k|
                                                (SPADCALL |b|
                                                          (SPADCALL |x| |i| |k|
                                                                    (QREFELT $
                                                                             13))
                                                          (QREFELT $ 26))
                                                (QREFELT $ 25))))
                                    (LETT |k| (+ |k| 1) . #3#) (GO G190) G191
                                    (EXIT NIL))
                               (SEQ (LETT |k| |minR| . #3#) G190
                                    (COND ((> |k| |maxR|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |k| |i| (QREFELT $ 22))
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |x| |k| |j|
                                                     (QREFELT $ 13))
                                           (|spadConstant| $ 14)
                                           (QREFELT $ 16))
                                          (SEQ
                                           (SEQ (LETT |k1| (+ |j| 1) . #3#)
                                                G190
                                                (COND
                                                 ((> |k1| |maxC|) (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (SPADCALL |x| |k| |k1|
                                                            (SPADCALL
                                                             (SPADCALL |x| |k|
                                                                       |k1|
                                                                       (QREFELT
                                                                        $ 13))
                                                             (SPADCALL
                                                              (SPADCALL |x| |k|
                                                                        |j|
                                                                        (QREFELT
                                                                         $ 13))
                                                              (SPADCALL |x| |i|
                                                                        |k1|
                                                                        (QREFELT
                                                                         $ 13))
                                                              (QREFELT $ 26))
                                                             (QREFELT $ 27))
                                                            (QREFELT $ 25))))
                                                (LETT |k1| (+ |k1| 1) . #3#)
                                                (GO G190) G191 (EXIT NIL))
                                           (EXIT
                                            (SPADCALL |x| |k| |j|
                                                      (|spadConstant| $ 14)
                                                      (QREFELT $ 25))))))))))
                                    (LETT |k| (+ |k| 1) . #3#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1) . #3#)))))))))))
             (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT |x|)))
      #2# (EXIT #2#))))) 

(DEFUN |IMATLIN;rank;MNni;4| (|x| $)
  (PROG (|rk| #1=#:G171 |i| |y| |rh|)
    (RETURN
     (SEQ
      (LETT |y|
            (SEQ
             (LETT |rk| (SPADCALL |x| (QREFELT $ 30))
                   . #2=(|IMATLIN;rank;MNni;4|))
             (LETT |rh| (SPADCALL |x| (QREFELT $ 31)) . #2#)
             (EXIT
              (COND
               ((SPADCALL |rk| |rh| (QREFELT $ 32))
                (SEQ (LETT |rk| |rh| . #2#)
                     (EXIT (SPADCALL |x| (QREFELT $ 33)))))
               ('T (SPADCALL |x| (QREFELT $ 19))))))
            . #2#)
      (LETT |y| (SPADCALL |y| (QREFELT $ 28)) . #2#)
      (LETT |i| (SPADCALL |y| (QREFELT $ 18)) . #2#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((SPADCALL |rk| 0 (QREFELT $ 32))
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

(DEFUN |IMATLIN;nullity;MNni;5| (|x| $)
  (PROG (#1=#:G176)
    (RETURN
     (PROG1
         (LETT #1#
               (- (SPADCALL |x| (QREFELT $ 31)) (SPADCALL |x| (QREFELT $ 34)))
               |IMATLIN;nullity;MNni;5|)
       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))) 

(DEFUN |IMATLIN;nullSpace;ML;6| (|y| $)
  (PROG (|l| |j| |basis| #1=#:G200 |k| #2=#:G201 |ll| |w| #3=#:G199 |i| |v|
         |row| #4=#:G179 |rk| #5=#:G178 |ncol| |nrow| |maxC| |minC| |maxR|
         |minR| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL |y| (QREFELT $ 28)) . #6=(|IMATLIN;nullSpace;ML;6|))
      (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #6#)
      (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #6#)
      (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #6#)
      (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #6#)
      (LETT |nrow| (SPADCALL |x| (QREFELT $ 30)) . #6#)
      (LETT |ncol| (SPADCALL |x| (QREFELT $ 31)) . #6#)
      (LETT |basis| NIL . #6#) (LETT |rk| |nrow| . #6#)
      (LETT |row| |maxR| . #6#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((SPADCALL |rk| 0 (QREFELT $ 32))
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
       ((SPADCALL |ncol| |nrow| (QREFELT $ 36))
        (COND ((EQL |rk| |ncol|) (EXIT NIL)))))
      (EXIT
       (COND
        ((EQL |rk| 0)
         (SEQ
          (SEQ (LETT |j| |minC| . #6#) G190 (COND ((> |j| |maxC|) (GO G191)))
               (SEQ
                (LETT |w|
                      (SPADCALL |ncol| (|spadConstant| $ 14) (QREFELT $ 37))
                      . #6#)
                (SPADCALL |w| |j| (|spadConstant| $ 20) (QREFELT $ 38))
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
                                  (|spadConstant| $ 14) (QREFELT $ 39)))
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
                      (SPADCALL |ncol| (|spadConstant| $ 14) (QREFELT $ 37))
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
                     (SPADCALL |w| |l| (|spadConstant| $ 20) (QREFELT $ 38))
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
                               (- |minR| 1) (QREFELT $ 22))
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
                                        (QREFELT $ 38))))))
                          (LETT |k|
                                (PROG1 (+ |k| 1) (LETT |ll| (+ |ll| 1) . #6#))
                                . #6#)
                          (GO G190) G191 (EXIT NIL))
                     (SPADCALL |w| |l| (|spadConstant| $ 20) (QREFELT $ 38))
                     (EXIT (LETT |basis| (CONS |w| |basis|) . #6#)))))))
                (LETT |j| (- |j| 1) . #6#) (EXIT (LETT |l| (- |l| 1) . #6#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |basis|))))))))) 

(DEFUN |IMATLIN;determinant;MR;7| (|y| $)
  (PROG (|l| |b| |k| |ans| #1=#:G216 #2=#:G204 |rown| #3=#:G217 |i| #4=#:G218
         |j| |maxC| |minC| |maxR| |minR| |x| |ndim|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL
          (LETT |ndim| (SPADCALL |y| (QREFELT $ 30))
                . #5=(|IMATLIN;determinant;MR;7|))
          (SPADCALL |y| (QREFELT $ 31)) (QREFELT $ 43))
         (|error| "determinant: matrix must be square"))
        ((EQL |ndim| 1)
         (SPADCALL |y| (SPADCALL |y| (QREFELT $ 17))
                   (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 13)))
        ('T
         (SEQ (LETT |x| (SPADCALL |y| (QREFELT $ 19)) . #5#)
              (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #5#)
              (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #5#)
              (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #5#)
              (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #5#)
              (LETT |ans| (|spadConstant| $ 20) . #5#)
              (SEQ (LETT |j| |minC| . #5#) (LETT #4# (- |maxC| 1) . #5#)
                   (LETT |i| |minR| . #5#) (LETT #3# (- |maxR| 1) . #5#) G190
                   (COND ((OR (> |i| #3#) (> |j| #4#)) (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                (|spadConstant| $ 14) (QREFELT $ 39))
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
                           (SPADCALL |x| |i| |rown| (QREFELT $ 23))
                           (EXIT
                            (LETT |ans| (SPADCALL |ans| (QREFELT $ 40))
                                  . #5#)))))
                    (LETT |ans|
                          (SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13)) |ans|
                                    (QREFELT $ 26))
                          . #5#)
                    (LETT |b|
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                     (QREFELT $ 24))
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
                                               (QREFELT $ 26))
                                     (QREFELT $ 25))))
                         (LETT |l| (+ |l| 1) . #5#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SEQ (LETT |k| (+ |i| 1) . #5#) G190
                          (COND ((> |k| |maxR|) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (LETT |b| (SPADCALL |x| |k| |j| (QREFELT $ 13))
                                     . #5#)
                               (|spadConstant| $ 14) (QREFELT $ 16))
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
                                                          (QREFELT $ 26))
                                                (QREFELT $ 44))
                                               (QREFELT $ 25))))
                                   (LETT |l| (+ |l| 1) . #5#) (GO G190) G191
                                   (EXIT NIL))))))
                          (LETT |k| (+ |k| 1) . #5#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |x| |maxR| |maxC| (QREFELT $ 13)) |ans|
                         (QREFELT $ 26)))))))
      #1# (EXIT #1#))))) 

(DEFUN |IMATLIN;generalizedInverse;2M;8| (|x| $)
  (PROG (|yy| #1=#:G221 |var| |nc| |ty| |y| MATCAT22 MATCAT2 VFSUP FSUP SUP)
    (RETURN
     (SEQ
      (LETT SUP (|SparseUnivariatePolynomial| (QREFELT $ 6))
            . #2=(|IMATLIN;generalizedInverse;2M;8|))
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
             (CONS #'|IMATLIN;generalizedInverse;2M;8!0| (VECTOR FSUP SUP $))
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
      (LETT |nc|
            (SPADCALL |yy|
                      (|compiledLookupCheck| '|ncols|
                                             (LIST (LIST '|NonNegativeInteger|)
                                                   '$)
                                             (|Matrix| FSUP)))
            . #2#)
      (LETT |var|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 20) 1
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
                                  (SPADCALL
                                   (SPADCALL |yy|
                                             (|compiledLookupCheck| '|ncols|
                                                                    (LIST
                                                                     (LIST
                                                                      '|NonNegativeInteger|)
                                                                     '$)
                                                                    (|Matrix|
                                                                     FSUP)))
                                   |var|
                                   (|compiledLookupCheck| '|scalarMatrix|
                                                          (LIST '$
                                                                (LIST
                                                                 '|NonNegativeInteger|)
                                                                (|devaluate|
                                                                 FSUP))
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
       (SPADCALL (CONS #'|IMATLIN;generalizedInverse;2M;8!1| (VECTOR SUP $))
                 |yy|
                 (|compiledLookupCheck| '|map|
                                        (LIST (|devaluate| (ELT $ 9))
                                              (LIST '|Mapping|
                                                    (|devaluate| (ELT $ 6))
                                                    (|devaluate| FSUP))
                                              (LIST '|Matrix|
                                                    (|devaluate| FSUP)))
                                        MATCAT22))))))) 

(DEFUN |IMATLIN;generalizedInverse;2M;8!1| (|z1| $$)
  (PROG ($ SUP)
    (LETT $ (QREFELT $$ 1) . #1=(|IMATLIN;generalizedInverse;2M;8|))
    (LETT SUP (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (|spadConstant| $ 14)
                (|compiledLookupCheck| '|elt|
                                       (LIST (|devaluate| (ELT $ 6))
                                             (LIST '|Fraction| '$)
                                             (|devaluate| (ELT $ 6)))
                                       SUP)))))) 

(DEFUN |IMATLIN;generalizedInverse;2M;8!0| (|r1| $$)
  (PROG ($ SUP FSUP)
    (LETT $ (QREFELT $$ 2) . #1=(|IMATLIN;generalizedInverse;2M;8|))
    (LETT SUP (QREFELT $$ 1) . #1#)
    (LETT FSUP (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL |r1|
                 (|compiledLookupCheck| '|coerce|
                                        (LIST '$ (|devaluate| (ELT $ 6))) SUP))
       (|compiledLookupCheck| '|coerce| (LIST '$ (|devaluate| SUP)) FSUP)))))) 

(DEFUN |IMATLIN;inverse;MU;9| (|x| $)
  (PROG (AB |j| |l| |i| |k| |lmax| |lmin| |kmax| |kmin| |maxC| |minC| |maxR|
         |minR| |detinv| |det| |ans2| |ndim|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |ndim| (SPADCALL |x| (QREFELT $ 30))
               . #1=(|IMATLIN;inverse;MU;9|))
         (SPADCALL |x| (QREFELT $ 31)) (QREFELT $ 43))
        (|error| "inverse: matrix must be square"))
       ((EQL |ndim| 2)
        (SEQ (LETT |ans2| (SPADCALL |ndim| |ndim| (QREFELT $ 47)) . #1#)
             (EXIT
              (COND
               ((SPADCALL
                 (LETT |det|
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| 1 1 (QREFELT $ 48))
                                  (SPADCALL |x| 2 2 (QREFELT $ 48))
                                  (QREFELT $ 26))
                        (SPADCALL (SPADCALL |x| 1 2 (QREFELT $ 48))
                                  (SPADCALL |x| 2 1 (QREFELT $ 48))
                                  (QREFELT $ 26))
                        (QREFELT $ 27))
                       . #1#)
                 (QREFELT $ 49))
                (CONS 1 "failed"))
               (#2='T
                (SEQ (LETT |detinv| (SPADCALL |det| (QREFELT $ 24)) . #1#)
                     (SPADCALL |ans2| 1 1
                               (SPADCALL (SPADCALL |x| 2 2 (QREFELT $ 48))
                                         |detinv| (QREFELT $ 26))
                               (QREFELT $ 50))
                     (SPADCALL |ans2| 1 2
                               (SPADCALL
                                (SPADCALL (SPADCALL |x| 1 2 (QREFELT $ 48))
                                          |detinv| (QREFELT $ 26))
                                (QREFELT $ 40))
                               (QREFELT $ 50))
                     (SPADCALL |ans2| 2 1
                               (SPADCALL
                                (SPADCALL (SPADCALL |x| 2 1 (QREFELT $ 48))
                                          |detinv| (QREFELT $ 26))
                                (QREFELT $ 40))
                               (QREFELT $ 50))
                     (SPADCALL |ans2| 2 2
                               (SPADCALL (SPADCALL |x| 1 1 (QREFELT $ 48))
                                         |detinv| (QREFELT $ 26))
                               (QREFELT $ 50))
                     (EXIT (CONS 0 |ans2|))))))))
       (#2#
        (SEQ (LETT AB (SPADCALL |ndim| (+ |ndim| |ndim|) (QREFELT $ 47)) . #1#)
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
                                    (QREFELT $ 25))))
                        (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #1#))
                              . #1#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (SPADCALL AB |k| (- (+ (+ |lmin| |ndim|) |k|) |kmin|)
                              (|spadConstant| $ 20) (QREFELT $ 25))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #1#)) . #1#)
                  (GO G190) G191 (EXIT NIL))
             (LETT AB (SPADCALL AB (QREFELT $ 28)) . #1#)
             (EXIT
              (COND
               ((SPADCALL (SPADCALL AB |kmax| |lmax| (QREFELT $ 48))
                          (|spadConstant| $ 14) (QREFELT $ 39))
                (CONS 1 "failed"))
               (#2#
                (CONS 0
                      (SPADCALL AB |kmin| |kmax| (+ |lmin| |ndim|)
                                (+ |lmax| |ndim|) (QREFELT $ 51))))))))))))) 

(DECLAIM (NOTINLINE |InnerMatrixLinearAlgebraFunctions;|)) 

(DEFUN |InnerMatrixLinearAlgebraFunctions| (&REST #1=#:G240)
  (PROG ()
    (RETURN
     (PROG (#2=#:G241)
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
      (LETT $ (GETREFV 54) . #1#)
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
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 42
                  (CONS (|dispatchFunction| |IMATLIN;nullSpace;ML;6|) $))))
      $)))) 

(MAKEPROP '|InnerMatrixLinearAlgebraFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |minColIndex|)
              (5 . |maxColIndex|) (10 . |qelt|) (17 . |Zero|) (|Boolean|)
              (21 . ~=) (27 . |minRowIndex|) (32 . |maxRowIndex|) (37 . |copy|)
              (42 . |One|) (46 . >) (52 . ~=) (58 . |swapRows!|) (65 . |inv|)
              (70 . |qsetelt!|) (78 . *) (84 . -) |IMATLIN;rowEchelon;2M;3|
              (|NonNegativeInteger|) (90 . |nrows|) (95 . |ncols|) (100 . >)
              (106 . |transpose|) |IMATLIN;rank;MNni;4|
              |IMATLIN;nullity;MNni;5| (111 . <=) (117 . |new|)
              (123 . |qsetelt!|) (130 . =) (136 . -) (|List| 8)
              (141 . |nullSpace|) (146 . ~=) (152 . +)
              |IMATLIN;determinant;MR;7| |IMATLIN;generalizedInverse;2M;8|
              (158 . |zero|) (164 . |elt|) (171 . |zero?|) (176 . |setelt|)
              (184 . |subMatrix|) (|Union| 9 '"failed") |IMATLIN;inverse;MU;9|)
           '#(|rowEchelon| 193 |rank| 198 |nullity| 203 |nullSpace| 208
              |inverse| 213 |generalizedInverse| 218 |determinant| 223)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 53
                                                 '(1 9 10 0 11 1 9 10 0 12 3 9
                                                   6 0 10 10 13 0 6 0 14 2 6 15
                                                   0 0 16 1 9 10 0 17 1 9 10 0
                                                   18 1 9 0 0 19 0 6 0 20 2 10
                                                   15 0 0 21 2 10 15 0 0 22 3 9
                                                   0 0 10 10 23 1 6 0 0 24 4 9
                                                   6 0 10 10 6 25 2 6 0 0 0 26
                                                   2 6 0 0 0 27 1 9 29 0 30 1 9
                                                   29 0 31 2 29 15 0 0 32 1 9 0
                                                   0 33 2 29 15 0 0 36 2 8 0 29
                                                   6 37 3 8 6 0 10 6 38 2 6 15
                                                   0 0 39 1 6 0 0 40 1 0 41 9
                                                   42 2 29 15 0 0 43 2 6 0 0 0
                                                   44 2 9 0 29 29 47 3 9 6 0 10
                                                   10 48 1 6 15 0 49 4 9 6 0 10
                                                   10 6 50 5 9 0 0 10 10 10 10
                                                   51 1 0 9 9 28 1 0 29 9 34 1
                                                   0 29 9 35 1 1 41 9 42 1 0 52
                                                   9 53 1 0 9 9 46 1 0 6 9
                                                   45)))))
           '|lookupComplete|)) 
