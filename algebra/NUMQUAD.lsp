
(/VERSIONCHECK 2) 

(DEFUN |NUMQUAD;aromberg;M4F3IR;1|
       (|func| |a| |b| |epsrel| |epsabs| |nmin| |nmax| |nint| $)
  (PROG (#1=#:G149 |x2| |x1| |done| |pts| |err| |sum| |ans| |i| |io| |hh|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |sum| (SPADCALL 0 0 10 (QREFELT $ 10))
              . #2=(|NUMQUAD;aromberg;M4F3IR;1|))
        (LETT |err| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (LETT |pts| 1 . #2#) (LETT |done| 'T . #2#)
        (LETT |hh|
              (SPADCALL (SPADCALL |b| |a| (QREFELT $ 11)) |nint|
                        (QREFELT $ 12))
              . #2#)
        (LETT |x1| |a| . #2#)
        (LETT |x2| (SPADCALL |a| |hh| (QREFELT $ 13)) . #2#)
        (LETT |io|
              (LIST (SPADCALL |x1| (QREFELT $ 15))
                    (SPADCALL |x2| (QREFELT $ 15)))
              . #2#)
        (SEQ (LETT |i| 1 . #2#) G190
             (COND ((|greater_SI| |i| |nint|) (GO G191)))
             (SEQ
              (LETT |ans|
                    (SPADCALL |func| |x1| |x2| |epsrel| |epsabs| |nmin| |nmax|
                              (QREFELT $ 18))
                    . #2#)
              (COND
               ((NULL (QVELT |ans| 3))
                (SEQ
                 (SPADCALL |io| 1 (SPADCALL |x1| (QREFELT $ 15))
                           (QREFELT $ 21))
                 (SPADCALL |io| 2 (SPADCALL |x2| (QREFELT $ 15))
                           (QREFELT $ 21))
                 (EXIT
                  (SPADCALL
                   (SPADCALL (CONS "accuracy not reached in interval" |io|)
                             (QREFELT $ 23))
                   (QREFELT $ 25))))))
              (LETT |sum| (SPADCALL |sum| (QVELT |ans| 0) (QREFELT $ 13))
                    . #2#)
              (LETT |err|
                    (SPADCALL |err| (SPADCALL (QVELT |ans| 1) (QREFELT $ 26))
                              (QREFELT $ 13))
                    . #2#)
              (LETT |pts| (- (+ |pts| (QVELT |ans| 2)) 1) . #2#)
              (LETT |done| (COND (|done| (QVELT |ans| 3)) ('T 'NIL)) . #2#)
              (LETT |x1| |x2| . #2#)
              (EXIT (LETT |x2| (SPADCALL |x2| |hh| (QREFELT $ 13)) . #2#)))
             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (PROGN (LETT #1# (VECTOR |sum| |err| |pts| |done|) . #2#) (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |NUMQUAD;asimpson;M4F3IR;2|
       (|func| |a| |b| |epsrel| |epsabs| |nmin| |nmax| |nint| $)
  (PROG (#1=#:G157 |x2| |x1| |done| |pts| |err| |sum| |ans| |i| |io| |hh|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |sum| (SPADCALL 0 0 10 (QREFELT $ 10))
              . #2=(|NUMQUAD;asimpson;M4F3IR;2|))
        (LETT |err| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (LETT |pts| 1 . #2#) (LETT |done| 'T . #2#)
        (LETT |hh|
              (SPADCALL (SPADCALL |b| |a| (QREFELT $ 11)) |nint|
                        (QREFELT $ 12))
              . #2#)
        (LETT |x1| |a| . #2#)
        (LETT |x2| (SPADCALL |a| |hh| (QREFELT $ 13)) . #2#)
        (LETT |io|
              (LIST (SPADCALL |x1| (QREFELT $ 15))
                    (SPADCALL |x2| (QREFELT $ 15)))
              . #2#)
        (SEQ (LETT |i| 1 . #2#) G190
             (COND ((|greater_SI| |i| |nint|) (GO G191)))
             (SEQ
              (LETT |ans|
                    (SPADCALL |func| |x1| |x2| |epsrel| |epsabs| |nmin| |nmax|
                              (QREFELT $ 28))
                    . #2#)
              (COND
               ((NULL (QVELT |ans| 3))
                (SEQ
                 (SPADCALL |io| 1 (SPADCALL |x1| (QREFELT $ 15))
                           (QREFELT $ 21))
                 (SPADCALL |io| 2 (SPADCALL |x2| (QREFELT $ 15))
                           (QREFELT $ 21))
                 (EXIT
                  (SPADCALL
                   (SPADCALL (CONS "accuracy not reached in interval" |io|)
                             (QREFELT $ 23))
                   (QREFELT $ 25))))))
              (LETT |sum| (SPADCALL |sum| (QVELT |ans| 0) (QREFELT $ 13))
                    . #2#)
              (LETT |err|
                    (SPADCALL |err| (SPADCALL (QVELT |ans| 1) (QREFELT $ 26))
                              (QREFELT $ 13))
                    . #2#)
              (LETT |pts| (- (+ |pts| (QVELT |ans| 2)) 1) . #2#)
              (LETT |done| (COND (|done| (QVELT |ans| 3)) ('T 'NIL)) . #2#)
              (LETT |x1| |x2| . #2#)
              (EXIT (LETT |x2| (SPADCALL |x2| |hh| (QREFELT $ 13)) . #2#)))
             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (PROGN (LETT #1# (VECTOR |sum| |err| |pts| |done|) . #2#) (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |NUMQUAD;atrapezoidal;M4F3IR;3|
       (|func| |a| |b| |epsrel| |epsabs| |nmin| |nmax| |nint| $)
  (PROG (#1=#:G165 |x2| |x1| |done| |pts| |err| |sum| |ans| |i| |io| |hh|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |sum| (SPADCALL 0 0 10 (QREFELT $ 10))
              . #2=(|NUMQUAD;atrapezoidal;M4F3IR;3|))
        (LETT |err| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (LETT |pts| 1 . #2#) (LETT |done| 'T . #2#)
        (LETT |hh|
              (SPADCALL (SPADCALL |b| |a| (QREFELT $ 11)) |nint|
                        (QREFELT $ 12))
              . #2#)
        (LETT |x1| |a| . #2#)
        (LETT |x2| (SPADCALL |a| |hh| (QREFELT $ 13)) . #2#)
        (LETT |io|
              (LIST (SPADCALL |x1| (QREFELT $ 15))
                    (SPADCALL |x2| (QREFELT $ 15)))
              . #2#)
        (SEQ (LETT |i| 1 . #2#) G190
             (COND ((|greater_SI| |i| |nint|) (GO G191)))
             (SEQ
              (LETT |ans|
                    (SPADCALL |func| |x1| |x2| |epsrel| |epsabs| |nmin| |nmax|
                              (QREFELT $ 30))
                    . #2#)
              (COND
               ((NULL (QVELT |ans| 3))
                (SEQ
                 (SPADCALL |io| 1 (SPADCALL |x1| (QREFELT $ 15))
                           (QREFELT $ 21))
                 (SPADCALL |io| 2 (SPADCALL |x2| (QREFELT $ 15))
                           (QREFELT $ 21))
                 (EXIT
                  (SPADCALL
                   (SPADCALL (CONS "accuracy not reached in interval" |io|)
                             (QREFELT $ 23))
                   (QREFELT $ 25))))))
              (LETT |sum| (SPADCALL |sum| (QVELT |ans| 0) (QREFELT $ 13))
                    . #2#)
              (LETT |err|
                    (SPADCALL |err| (SPADCALL (QVELT |ans| 1) (QREFELT $ 26))
                              (QREFELT $ 13))
                    . #2#)
              (LETT |pts| (- (+ |pts| (QVELT |ans| 2)) 1) . #2#)
              (LETT |done| (COND (|done| (QVELT |ans| 3)) ('T 'NIL)) . #2#)
              (LETT |x1| |x2| . #2#)
              (EXIT (LETT |x2| (SPADCALL |x2| |hh| (QREFELT $ 13)) . #2#)))
             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (PROGN (LETT #1# (VECTOR |sum| |err| |pts| |done|) . #2#) (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |NUMQUAD;romberg;M4F2IR;4|
       (|func| |a| |b| |epsrel| |epsabs| |nmin| |nmax| $)
  (PROG (#1=#:G183 |qx1| |pts| |delta| |oldest| |oldsum| |change| |four| |i|
         |j| |newest| |newsum| |n| |table| #2=#:G167 |length|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |length| (SPADCALL |b| |a| (QREFELT $ 11))
              . #3=(|NUMQUAD;romberg;M4F2IR;4|))
        (LETT |delta| |length| . #3#)
        (LETT |newsum|
              (SPADCALL
               (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |length|
                         (QREFELT $ 32))
               (SPADCALL (SPADCALL |a| |func|) (SPADCALL |b| |func|)
                         (QREFELT $ 13))
               (QREFELT $ 32))
              . #3#)
        (LETT |newest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #3#)
        (LETT |oldsum| (SPADCALL 0 0 10 (QREFELT $ 10)) . #3#)
        (LETT |oldest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #3#)
        (LETT |change| (SPADCALL 0 0 10 (QREFELT $ 10)) . #3#)
        (LETT |qx1| |newsum| . #3#)
        (LETT |table|
              (MAKEARR1
               (PROG1 (LETT #2# (+ |nmax| 1) . #3#)
                 (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
               (SPADCALL 0 0 10 (QREFELT $ 10)))
              . #3#)
        (LETT |n| 1 . #3#) (LETT |pts| 1 . #3#)
        (COND
         ((< |nmin| 2)
          (SEQ
           (SPADCALL "romberg: nmin to small (nmin > 1) nmin = "
                     (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 0 'NIL)
                   . #3#)
             (GO #1#))))))
        (COND
         ((< |nmax| |nmin|)
          (SEQ
           (SPADCALL "romberg: nmax < nmin : nmax = "
                     (SPADCALL |nmax| (QREFELT $ 33)) (QREFELT $ 36))
           (SPADCALL "                       nmin = "
                     (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 0 'NIL)
                   . #3#)
             (GO #1#))))))
        (COND
         ((SPADCALL |a| |b| (QREFELT $ 38))
          (SEQ
           (SPADCALL "romberg: integration limits are equal  = "
                     (SPADCALL |a| (QREFELT $ 15)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 1 'T)
                   . #3#)
             (GO #1#))))))
        (COND
         ((SPADCALL |epsrel| (SPADCALL 0 0 10 (QREFELT $ 10)) (QREFELT $ 39))
          (SEQ
           (SPADCALL "romberg: eps_r < 0.0            eps_r  = "
                     (SPADCALL |epsrel| (QREFELT $ 15)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 0 'NIL)
                   . #3#)
             (GO #1#))))))
        (COND
         ((SPADCALL |epsabs| (SPADCALL 0 0 10 (QREFELT $ 10)) (QREFELT $ 39))
          (SEQ
           (SPADCALL "romberg: eps_a < 0.0            eps_a  = "
                     (SPADCALL |epsabs| (QREFELT $ 15)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 0 'NIL)
                   . #3#)
             (GO #1#))))))
        (SEQ (LETT |n| 1 . #3#) G190
             (COND ((|greater_SI| |n| |nmax|) (GO G191)))
             (SEQ (LETT |oldsum| |newsum| . #3#)
                  (LETT |newsum|
                        (|NUMQUAD;trapclosed| |func| |a| |delta| |oldsum| |pts|
                         $)
                        . #3#)
                  (LETT |newest|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL 4 0 10 (QREFELT $ 10)) |newsum|
                                    (QREFELT $ 32))
                          |oldsum| (QREFELT $ 11))
                         (SPADCALL 3 0 10 (QREFELT $ 10)) (QREFELT $ 40))
                        . #3#)
                  (LETT |four| 4 . #3#)
                  (SPADCALL |table| |n| |newest| (QREFELT $ 42))
                  (SEQ (LETT |j| 2 . #3#) G190
                       (COND ((|greater_SI| |j| |n|) (GO G191)))
                       (SEQ (LETT |i| (- (+ |n| 1) |j|) . #3#)
                            (LETT |four| (SPADCALL |four| 4 (QREFELT $ 44))
                                  . #3#)
                            (EXIT
                             (SPADCALL |table| |i|
                                       (SPADCALL
                                        (SPADCALL |table| (+ |i| 1)
                                                  (QREFELT $ 45))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |table| (+ |i| 1)
                                                    (QREFELT $ 45))
                                          (SPADCALL |table| |i| (QREFELT $ 45))
                                          (QREFELT $ 11))
                                         (- |four| 1) (QREFELT $ 12))
                                        (QREFELT $ 13))
                                       (QREFELT $ 42))))
                       (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (COND
                   ((SPADCALL |n| |nmin| (QREFELT $ 46))
                    (SEQ
                     (LETT |change|
                           (SPADCALL
                            (SPADCALL (SPADCALL |table| 1 (QREFELT $ 45)) |qx1|
                                      (QREFELT $ 11))
                            (QREFELT $ 26))
                           . #3#)
                     (COND
                      ((SPADCALL |change|
                                 (SPADCALL
                                  (SPADCALL |epsrel| |qx1| (QREFELT $ 32))
                                  (QREFELT $ 26))
                                 (QREFELT $ 39))
                       (PROGN
                        (LETT #1#
                              (VECTOR (SPADCALL |table| 1 (QREFELT $ 45))
                                      |change|
                                      (+ (SPADCALL 2 |pts| (QREFELT $ 47)) 1)
                                      'T)
                              . #3#)
                        (GO #1#))))
                     (EXIT
                      (COND
                       ((SPADCALL |change| |epsabs| (QREFELT $ 39))
                        (PROGN
                         (LETT #1#
                               (VECTOR (SPADCALL |table| 1 (QREFELT $ 45))
                                       |change|
                                       (+ (SPADCALL 2 |pts| (QREFELT $ 47)) 1)
                                       'T)
                               . #3#)
                         (GO #1#))))))))
                  (LETT |oldsum| |newsum| . #3#) (LETT |oldest| |newest| . #3#)
                  (LETT |delta|
                        (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |delta|
                                  (QREFELT $ 32))
                        . #3#)
                  (LETT |pts| (SPADCALL 2 |pts| (QREFELT $ 47)) . #3#)
                  (EXIT
                   (LETT |qx1| (SPADCALL |table| 1 (QREFELT $ 45)) . #3#)))
             (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (PROGN
          (LETT #1#
                (VECTOR (SPADCALL |table| 1 (QREFELT $ 45))
                        (SPADCALL (SPADCALL 125 -2 10 (QREFELT $ 10)) |change|
                                  (QREFELT $ 32))
                        (+ |pts| 1) 'NIL)
                . #3#)
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |NUMQUAD;simpson;M4F2IR;5|
       (|func| |a| |b| |epsrel| |epsabs| |nmin| |nmax| $)
  (PROG (#1=#:G198 |pts| |delta| |oldest| |oldsum| |change| |newest| |newsum|
         |n| |length|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |length| (SPADCALL |b| |a| (QREFELT $ 11))
              . #2=(|NUMQUAD;simpson;M4F2IR;5|))
        (LETT |delta| |length| . #2#)
        (LETT |newsum|
              (SPADCALL
               (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10))
                         (SPADCALL |b| |a| (QREFELT $ 11)) (QREFELT $ 32))
               (SPADCALL (SPADCALL |a| |func|) (SPADCALL |b| |func|)
                         (QREFELT $ 13))
               (QREFELT $ 32))
              . #2#)
        (LETT |newest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (LETT |oldsum| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (LETT |oldest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (LETT |change| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (LETT |n| 1 . #2#) (LETT |pts| 1 . #2#)
        (COND
         ((< |nmin| 2)
          (SEQ
           (SPADCALL "simpson: nmin to small (nmin > 1) nmin = "
                     (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 0 'NIL)
                   . #2#)
             (GO #1#))))))
        (COND
         ((< |nmax| |nmin|)
          (SEQ
           (SPADCALL "simpson: nmax < nmin : nmax = "
                     (SPADCALL |nmax| (QREFELT $ 33)) (QREFELT $ 36))
           (SPADCALL "                       nmin = "
                     (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 0 'NIL)
                   . #2#)
             (GO #1#))))))
        (COND
         ((SPADCALL |a| |b| (QREFELT $ 38))
          (SEQ
           (SPADCALL "simpson: integration limits are equal  = "
                     (SPADCALL |a| (QREFELT $ 15)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 1 'T)
                   . #2#)
             (GO #1#))))))
        (COND
         ((SPADCALL |epsrel| (SPADCALL 0 0 10 (QREFELT $ 10)) (QREFELT $ 39))
          (SEQ
           (SPADCALL "simpson: eps_r < 0.0 : eps_r = "
                     (SPADCALL |epsrel| (QREFELT $ 15)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 0 'NIL)
                   . #2#)
             (GO #1#))))))
        (COND
         ((SPADCALL |epsabs| (SPADCALL 0 0 10 (QREFELT $ 10)) (QREFELT $ 39))
          (SEQ
           (SPADCALL "simpson: eps_a < 0.0 : eps_a = "
                     (SPADCALL |epsabs| (QREFELT $ 15)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 0 'NIL)
                   . #2#)
             (GO #1#))))))
        (SEQ (LETT |n| 1 . #2#) G190
             (COND ((|greater_SI| |n| |nmax|) (GO G191)))
             (SEQ (LETT |oldsum| |newsum| . #2#)
                  (LETT |newsum|
                        (|NUMQUAD;trapclosed| |func| |a| |delta| |oldsum| |pts|
                         $)
                        . #2#)
                  (LETT |newest|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL 4 0 10 (QREFELT $ 10)) |newsum|
                                    (QREFELT $ 32))
                          |oldsum| (QREFELT $ 11))
                         (SPADCALL 3 0 10 (QREFELT $ 10)) (QREFELT $ 40))
                        . #2#)
                  (COND
                   ((SPADCALL |n| |nmin| (QREFELT $ 46))
                    (SEQ
                     (LETT |change|
                           (SPADCALL
                            (SPADCALL |newest| |oldest| (QREFELT $ 11))
                            (QREFELT $ 26))
                           . #2#)
                     (COND
                      ((SPADCALL |change|
                                 (SPADCALL
                                  (SPADCALL |epsrel| |oldest| (QREFELT $ 32))
                                  (QREFELT $ 26))
                                 (QREFELT $ 39))
                       (PROGN
                        (LETT #1#
                              (VECTOR |newest|
                                      (SPADCALL
                                       (SPADCALL 125 -2 10 (QREFELT $ 10))
                                       |change| (QREFELT $ 32))
                                      (+ (SPADCALL 2 |pts| (QREFELT $ 47)) 1)
                                      'T)
                              . #2#)
                        (GO #1#))))
                     (EXIT
                      (COND
                       ((SPADCALL |change| |epsabs| (QREFELT $ 39))
                        (PROGN
                         (LETT #1#
                               (VECTOR |newest|
                                       (SPADCALL
                                        (SPADCALL 125 -2 10 (QREFELT $ 10))
                                        |change| (QREFELT $ 32))
                                       (+ (SPADCALL 2 |pts| (QREFELT $ 47)) 1)
                                       'T)
                               . #2#)
                         (GO #1#))))))))
                  (LETT |oldsum| |newsum| . #2#) (LETT |oldest| |newest| . #2#)
                  (LETT |delta|
                        (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |delta|
                                  (QREFELT $ 32))
                        . #2#)
                  (EXIT (LETT |pts| (SPADCALL 2 |pts| (QREFELT $ 47)) . #2#)))
             (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (PROGN
          (LETT #1#
                (VECTOR |newest|
                        (SPADCALL (SPADCALL 125 -2 10 (QREFELT $ 10)) |change|
                                  (QREFELT $ 32))
                        (+ |pts| 1) 'NIL)
                . #2#)
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |NUMQUAD;trapezoidal;M4F2IR;6|
       (|func| |a| |b| |epsrel| |epsabs| |nmin| |nmax| $)
  (PROG (#1=#:G213 |pts| |delta| |change| |newsum| |oldsum| |n| |length|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |length| (SPADCALL |b| |a| (QREFELT $ 11))
              . #2=(|NUMQUAD;trapezoidal;M4F2IR;6|))
        (LETT |delta| |length| . #2#)
        (LETT |newsum|
              (SPADCALL
               (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10))
                         (SPADCALL |b| |a| (QREFELT $ 11)) (QREFELT $ 32))
               (SPADCALL (SPADCALL |a| |func|) (SPADCALL |b| |func|)
                         (QREFELT $ 13))
               (QREFELT $ 32))
              . #2#)
        (LETT |change| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (LETT |n| 1 . #2#) (LETT |pts| 1 . #2#)
        (COND
         ((< |nmin| 2)
          (SEQ
           (SPADCALL "trapezoidal: nmin to small (nmin > 1) nmin = "
                     (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 0 'NIL)
                   . #2#)
             (GO #1#))))))
        (COND
         ((< |nmax| |nmin|)
          (SEQ
           (SPADCALL "trapezoidal: nmax < nmin : nmax = "
                     (SPADCALL |nmax| (QREFELT $ 33)) (QREFELT $ 36))
           (SPADCALL "                           nmin = "
                     (SPADCALL |nmin| (QREFELT $ 33)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 0 'NIL)
                   . #2#)
             (GO #1#))))))
        (COND
         ((SPADCALL |a| |b| (QREFELT $ 38))
          (SEQ
           (SPADCALL "trapezoidal: integration limits are equal  = "
                     (SPADCALL |a| (QREFELT $ 15)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 1 'T)
                   . #2#)
             (GO #1#))))))
        (COND
         ((SPADCALL |epsrel| (SPADCALL 0 0 10 (QREFELT $ 10)) (QREFELT $ 39))
          (SEQ
           (SPADCALL "trapezoidal: eps_r < 0.0 : eps_r = "
                     (SPADCALL |epsrel| (QREFELT $ 15)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 0 'NIL)
                   . #2#)
             (GO #1#))))))
        (COND
         ((SPADCALL |epsabs| (SPADCALL 0 0 10 (QREFELT $ 10)) (QREFELT $ 39))
          (SEQ
           (SPADCALL "trapezoidal: eps_a < 0.0 : eps_a = "
                     (SPADCALL |epsabs| (QREFELT $ 15)) (QREFELT $ 36))
           (EXIT
            (PROGN
             (LETT #1#
                   (VECTOR (SPADCALL 0 0 10 (QREFELT $ 10))
                           (SPADCALL 0 0 10 (QREFELT $ 10)) 0 'NIL)
                   . #2#)
             (GO #1#))))))
        (SEQ (LETT |n| 1 . #2#) G190
             (COND ((|greater_SI| |n| |nmax|) (GO G191)))
             (SEQ (LETT |oldsum| |newsum| . #2#)
                  (LETT |newsum|
                        (|NUMQUAD;trapclosed| |func| |a| |delta| |oldsum| |pts|
                         $)
                        . #2#)
                  (COND
                   ((SPADCALL |n| |nmin| (QREFELT $ 46))
                    (SEQ
                     (LETT |change|
                           (SPADCALL
                            (SPADCALL |newsum| |oldsum| (QREFELT $ 11))
                            (QREFELT $ 26))
                           . #2#)
                     (COND
                      ((SPADCALL |change|
                                 (SPADCALL
                                  (SPADCALL |epsrel| |oldsum| (QREFELT $ 32))
                                  (QREFELT $ 26))
                                 (QREFELT $ 39))
                       (PROGN
                        (LETT #1#
                              (VECTOR |newsum|
                                      (SPADCALL
                                       (SPADCALL 125 -2 10 (QREFELT $ 10))
                                       |change| (QREFELT $ 32))
                                      (+ (SPADCALL 2 |pts| (QREFELT $ 47)) 1)
                                      'T)
                              . #2#)
                        (GO #1#))))
                     (EXIT
                      (COND
                       ((SPADCALL |change| |epsabs| (QREFELT $ 39))
                        (PROGN
                         (LETT #1#
                               (VECTOR |newsum|
                                       (SPADCALL
                                        (SPADCALL 125 -2 10 (QREFELT $ 10))
                                        |change| (QREFELT $ 32))
                                       (+ (SPADCALL 2 |pts| (QREFELT $ 47)) 1)
                                       'T)
                               . #2#)
                         (GO #1#))))))))
                  (LETT |delta|
                        (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |delta|
                                  (QREFELT $ 32))
                        . #2#)
                  (EXIT (LETT |pts| (SPADCALL 2 |pts| (QREFELT $ 47)) . #2#)))
             (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (PROGN
          (LETT #1#
                (VECTOR |newsum|
                        (SPADCALL (SPADCALL 125 -2 10 (QREFELT $ 10)) |change|
                                  (QREFELT $ 32))
                        (+ |pts| 1) 'NIL)
                . #2#)
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |NUMQUAD;rombergo;M4F2IR;7|
       (|func| |a| |b| |epsrel| |epsabs| |nmin| |nmax| $)
  (PROG (#1=#:G224 |qx1| |pts| |delta| |oldest| |oldsum| |change| |nine| |i|
         |j| |newest| |newsum| |n| |table| #2=#:G215 |length|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |length| (SPADCALL |b| |a| (QREFELT $ 11))
              . #3=(|NUMQUAD;rombergo;M4F2IR;7|))
        (LETT |delta|
              (SPADCALL |length| (SPADCALL 3 0 10 (QREFELT $ 10))
                        (QREFELT $ 40))
              . #3#)
        (LETT |newsum|
              (SPADCALL |length|
                        (SPADCALL
                         (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10))
                                   (SPADCALL |a| |b| (QREFELT $ 13))
                                   (QREFELT $ 32))
                         |func|)
                        (QREFELT $ 32))
              . #3#)
        (LETT |newest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #3#)
        (LETT |oldsum| (SPADCALL 0 0 10 (QREFELT $ 10)) . #3#)
        (LETT |oldest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #3#)
        (LETT |change| (SPADCALL 0 0 10 (QREFELT $ 10)) . #3#)
        (LETT |qx1| |newsum| . #3#)
        (LETT |table|
              (MAKEARR1
               (PROG1 (LETT #2# (+ |nmax| 1) . #3#)
                 (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
               (SPADCALL 0 0 10 (QREFELT $ 10)))
              . #3#)
        (LETT |n| 1 . #3#) (LETT |pts| 1 . #3#)
        (SEQ (LETT |n| 1 . #3#) G190
             (COND ((|greater_SI| |n| |nmax|) (GO G191)))
             (SEQ (LETT |oldsum| |newsum| . #3#)
                  (LETT |newsum|
                        (|NUMQUAD;trapopen| |func| |a| |delta| |oldsum| |pts|
                         $)
                        . #3#)
                  (LETT |newest|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL 9 0 10 (QREFELT $ 10)) |newsum|
                                    (QREFELT $ 32))
                          |oldsum| (QREFELT $ 11))
                         (SPADCALL 8 0 10 (QREFELT $ 10)) (QREFELT $ 40))
                        . #3#)
                  (SPADCALL |table| |n| |newest| (QREFELT $ 42))
                  (LETT |nine| 9 . #3#)
                  (SPADCALL (SPADCALL |newest| (QREFELT $ 15)) (QREFELT $ 48))
                  (SEQ (LETT |j| 2 . #3#) G190
                       (COND ((|greater_SI| |j| |n|) (GO G191)))
                       (SEQ (LETT |i| (- (+ |n| 1) |j|) . #3#)
                            (LETT |nine| (* |nine| 9) . #3#)
                            (EXIT
                             (SPADCALL |table| |i|
                                       (SPADCALL
                                        (SPADCALL |table| (+ |i| 1)
                                                  (QREFELT $ 45))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |table| (+ |i| 1)
                                                    (QREFELT $ 45))
                                          (SPADCALL |table| |i| (QREFELT $ 45))
                                          (QREFELT $ 11))
                                         (- |nine| 1) (QREFELT $ 12))
                                        (QREFELT $ 13))
                                       (QREFELT $ 42))))
                       (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (COND
                   ((SPADCALL |n| |nmin| (QREFELT $ 46))
                    (SEQ
                     (LETT |change|
                           (SPADCALL
                            (SPADCALL (SPADCALL |table| 1 (QREFELT $ 45)) |qx1|
                                      (QREFELT $ 11))
                            (QREFELT $ 26))
                           . #3#)
                     (COND
                      ((SPADCALL |change|
                                 (SPADCALL
                                  (SPADCALL |epsrel| |qx1| (QREFELT $ 32))
                                  (QREFELT $ 26))
                                 (QREFELT $ 39))
                       (PROGN
                        (LETT #1#
                              (VECTOR (SPADCALL |table| 1 (QREFELT $ 45))
                                      (SPADCALL
                                       (SPADCALL 15 -1 10 (QREFELT $ 10))
                                       |change| (QREFELT $ 32))
                                      (SPADCALL 3 |pts| (QREFELT $ 47)) 'T)
                              . #3#)
                        (GO #1#))))
                     (EXIT
                      (COND
                       ((SPADCALL |change| |epsabs| (QREFELT $ 39))
                        (PROGN
                         (LETT #1#
                               (VECTOR (SPADCALL |table| 1 (QREFELT $ 45))
                                       (SPADCALL
                                        (SPADCALL 15 -1 10 (QREFELT $ 10))
                                        |change| (QREFELT $ 32))
                                       (SPADCALL 3 |pts| (QREFELT $ 47)) 'T)
                               . #3#)
                         (GO #1#))))))))
                  (SPADCALL (SPADCALL |table| (QREFELT $ 49)) (QREFELT $ 48))
                  (LETT |oldsum| |newsum| . #3#) (LETT |oldest| |newest| . #3#)
                  (LETT |delta|
                        (SPADCALL |delta| (SPADCALL 3 0 10 (QREFELT $ 10))
                                  (QREFELT $ 40))
                        . #3#)
                  (LETT |pts| (SPADCALL 3 |pts| (QREFELT $ 47)) . #3#)
                  (EXIT
                   (LETT |qx1| (SPADCALL |table| 1 (QREFELT $ 45)) . #3#)))
             (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (PROGN
          (LETT #1#
                (VECTOR (SPADCALL |table| 1 (QREFELT $ 45))
                        (SPADCALL (SPADCALL 15 -1 10 (QREFELT $ 10)) |change|
                                  (QREFELT $ 32))
                        |pts| 'NIL)
                . #3#)
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |NUMQUAD;simpsono;M4F2IR;8|
       (|func| |a| |b| |epsrel| |epsabs| |nmin| |nmax| $)
  (PROG (#1=#:G232 |pts| |delta| |oldest| |oldsum| |change| |newest| |newsum|
         |n| |length|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |length| (SPADCALL |b| |a| (QREFELT $ 11))
              . #2=(|NUMQUAD;simpsono;M4F2IR;8|))
        (LETT |delta|
              (SPADCALL |length| (SPADCALL 3 0 10 (QREFELT $ 10))
                        (QREFELT $ 40))
              . #2#)
        (LETT |newsum|
              (SPADCALL |length|
                        (SPADCALL
                         (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10))
                                   (SPADCALL |a| |b| (QREFELT $ 13))
                                   (QREFELT $ 32))
                         |func|)
                        (QREFELT $ 32))
              . #2#)
        (LETT |newest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (LETT |oldsum| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (LETT |oldest| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (LETT |change| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (LETT |n| 1 . #2#) (LETT |pts| 1 . #2#)
        (SEQ (LETT |n| 1 . #2#) G190
             (COND ((|greater_SI| |n| |nmax|) (GO G191)))
             (SEQ (LETT |oldsum| |newsum| . #2#)
                  (LETT |newsum|
                        (|NUMQUAD;trapopen| |func| |a| |delta| |oldsum| |pts|
                         $)
                        . #2#)
                  (LETT |newest|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL 9 0 10 (QREFELT $ 10)) |newsum|
                                    (QREFELT $ 32))
                          |oldsum| (QREFELT $ 11))
                         (SPADCALL 8 0 10 (QREFELT $ 10)) (QREFELT $ 40))
                        . #2#)
                  (SPADCALL (SPADCALL |newest| (QREFELT $ 15)) (QREFELT $ 48))
                  (COND
                   ((SPADCALL |n| |nmin| (QREFELT $ 46))
                    (SEQ
                     (LETT |change|
                           (SPADCALL
                            (SPADCALL |newest| |oldest| (QREFELT $ 11))
                            (QREFELT $ 26))
                           . #2#)
                     (COND
                      ((SPADCALL |change|
                                 (SPADCALL
                                  (SPADCALL |epsrel| |oldest| (QREFELT $ 32))
                                  (QREFELT $ 26))
                                 (QREFELT $ 39))
                       (PROGN
                        (LETT #1#
                              (VECTOR |newest|
                                      (SPADCALL
                                       (SPADCALL 15 -1 10 (QREFELT $ 10))
                                       |change| (QREFELT $ 32))
                                      (SPADCALL 3 |pts| (QREFELT $ 47)) 'T)
                              . #2#)
                        (GO #1#))))
                     (EXIT
                      (COND
                       ((SPADCALL |change| |epsabs| (QREFELT $ 39))
                        (PROGN
                         (LETT #1#
                               (VECTOR |newest|
                                       (SPADCALL
                                        (SPADCALL 15 -1 10 (QREFELT $ 10))
                                        |change| (QREFELT $ 32))
                                       (SPADCALL 3 |pts| (QREFELT $ 47)) 'T)
                               . #2#)
                         (GO #1#))))))))
                  (LETT |oldsum| |newsum| . #2#) (LETT |oldest| |newest| . #2#)
                  (LETT |delta|
                        (SPADCALL |delta| (SPADCALL 3 0 10 (QREFELT $ 10))
                                  (QREFELT $ 40))
                        . #2#)
                  (EXIT (LETT |pts| (SPADCALL 3 |pts| (QREFELT $ 47)) . #2#)))
             (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (PROGN
          (LETT #1#
                (VECTOR |newest|
                        (SPADCALL (SPADCALL 15 -1 10 (QREFELT $ 10)) |change|
                                  (QREFELT $ 32))
                        |pts| 'NIL)
                . #2#)
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |NUMQUAD;trapezoidalo;M4F2IR;9|
       (|func| |a| |b| |epsrel| |epsabs| |nmin| |nmax| $)
  (PROG (#1=#:G240 |pts| |delta| |change| |newsum| |oldsum| |n| |length|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |length| (SPADCALL |b| |a| (QREFELT $ 11))
              . #2=(|NUMQUAD;trapezoidalo;M4F2IR;9|))
        (LETT |delta|
              (SPADCALL |length| (SPADCALL 3 0 10 (QREFELT $ 10))
                        (QREFELT $ 40))
              . #2#)
        (LETT |newsum|
              (SPADCALL |length|
                        (SPADCALL
                         (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10))
                                   (SPADCALL |a| |b| (QREFELT $ 13))
                                   (QREFELT $ 32))
                         |func|)
                        (QREFELT $ 32))
              . #2#)
        (LETT |change| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (LETT |pts| 1 . #2#)
        (SEQ (LETT |n| 1 . #2#) G190
             (COND ((|greater_SI| |n| |nmax|) (GO G191)))
             (SEQ (LETT |oldsum| |newsum| . #2#)
                  (LETT |newsum|
                        (|NUMQUAD;trapopen| |func| |a| |delta| |oldsum| |pts|
                         $)
                        . #2#)
                  (SPADCALL (SPADCALL |newsum| (QREFELT $ 15)) (QREFELT $ 48))
                  (COND
                   ((SPADCALL |n| |nmin| (QREFELT $ 46))
                    (SEQ
                     (LETT |change|
                           (SPADCALL
                            (SPADCALL |newsum| |oldsum| (QREFELT $ 11))
                            (QREFELT $ 26))
                           . #2#)
                     (COND
                      ((SPADCALL |change|
                                 (SPADCALL
                                  (SPADCALL |epsrel| |oldsum| (QREFELT $ 32))
                                  (QREFELT $ 26))
                                 (QREFELT $ 39))
                       (PROGN
                        (LETT #1#
                              (VECTOR |newsum|
                                      (SPADCALL
                                       (SPADCALL 15 -1 10 (QREFELT $ 10))
                                       |change| (QREFELT $ 32))
                                      (SPADCALL 3 |pts| (QREFELT $ 47)) 'T)
                              . #2#)
                        (GO #1#))))
                     (EXIT
                      (COND
                       ((SPADCALL |change| |epsabs| (QREFELT $ 39))
                        (PROGN
                         (LETT #1#
                               (VECTOR |newsum|
                                       (SPADCALL
                                        (SPADCALL 15 -1 10 (QREFELT $ 10))
                                        |change| (QREFELT $ 32))
                                       (SPADCALL 3 |pts| (QREFELT $ 47)) 'T)
                               . #2#)
                         (GO #1#))))))))
                  (LETT |delta|
                        (SPADCALL |delta| (SPADCALL 3 0 10 (QREFELT $ 10))
                                  (QREFELT $ 40))
                        . #2#)
                  (EXIT (LETT |pts| (SPADCALL 3 |pts| (QREFELT $ 47)) . #2#)))
             (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (PROGN
          (LETT #1#
                (VECTOR |newsum|
                        (SPADCALL (SPADCALL 15 -1 10 (QREFELT $ 10)) |change|
                                  (QREFELT $ 32))
                        |pts| 'NIL)
                . #2#)
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |NUMQUAD;trapclosed| (|func| |start| |h| |oldsum| |numpoints| $)
  (PROG (#1=#:G244 |x| |sum| |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |x|
              (SPADCALL |start|
                        (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |h|
                                  (QREFELT $ 32))
                        (QREFELT $ 13))
              . #2=(|NUMQUAD;trapclosed|))
        (LETT |sum| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (SEQ (LETT |i| 1 . #2#) G190
             (COND ((|greater_SI| |i| |numpoints|) (GO G191)))
             (SEQ
              (LETT |sum| (SPADCALL |sum| (SPADCALL |x| |func|) (QREFELT $ 13))
                    . #2#)
              (EXIT (LETT |x| (SPADCALL |x| |h| (QREFELT $ 13)) . #2#)))
             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (PROGN
          (LETT #1#
                (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10))
                          (SPADCALL |oldsum|
                                    (SPADCALL |sum| |h| (QREFELT $ 32))
                                    (QREFELT $ 13))
                          (QREFELT $ 32))
                . #2#)
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |NUMQUAD;trapopen| (|func| |start| |del| |oldsum| |numpoints| $)
  (PROG (#1=#:G248 |x| |sum| |i| |ddel|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ddel|
              (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 10)) |del| (QREFELT $ 32))
              . #2=(|NUMQUAD;trapopen|))
        (LETT |x|
              (SPADCALL |start|
                        (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |del|
                                  (QREFELT $ 32))
                        (QREFELT $ 13))
              . #2#)
        (LETT |sum| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
        (SEQ (LETT |i| 1 . #2#) G190
             (COND ((|greater_SI| |i| |numpoints|) (GO G191)))
             (SEQ
              (LETT |sum| (SPADCALL |sum| (SPADCALL |x| |func|) (QREFELT $ 13))
                    . #2#)
              (LETT |x| (SPADCALL |x| |ddel| (QREFELT $ 13)) . #2#)
              (LETT |sum| (SPADCALL |sum| (SPADCALL |x| |func|) (QREFELT $ 13))
                    . #2#)
              (EXIT (LETT |x| (SPADCALL |x| |del| (QREFELT $ 13)) . #2#)))
             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (PROGN
          (LETT #1#
                (SPADCALL
                 (SPADCALL |oldsum| (SPADCALL 3 0 10 (QREFELT $ 10))
                           (QREFELT $ 40))
                 (SPADCALL |sum| |del| (QREFELT $ 32)) (QREFELT $ 13))
                . #2#)
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |NumericalQuadrature| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G250)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|NumericalQuadrature|)
                . #2=(|NumericalQuadrature|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|NumericalQuadrature|
                         (LIST (CONS NIL (CONS 1 (|NumericalQuadrature;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|NumericalQuadrature|))))))))))) 

(DEFUN |NumericalQuadrature;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|NumericalQuadrature|) . #1=(|NumericalQuadrature|))
      (LETT $ (GETREFV 53) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|NumericalQuadrature| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|NumericalQuadrature| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Float|) (0 . |Zero|) (|Integer|)
              (|PositiveInteger|) (4 . |float|) (11 . -) (17 . /) (23 . +)
              (|OutputForm|) (29 . |coerce|)
              (|Record| (|:| |value| 6) (|:| |error| 6) (|:| |totalpts| 8)
                        (|:| |success| 37))
              (|Mapping| 6 6) |NUMQUAD;romberg;M4F2IR;4| (34 . |One|)
              (|List| 14) (38 . |setelt|) (|List| $) (45 . |blankSeparate|)
              (|Void|) (50 . |print|) (55 . |abs|) |NUMQUAD;aromberg;M4F3IR;1|
              |NUMQUAD;simpson;M4F2IR;5| |NUMQUAD;asimpson;M4F3IR;2|
              |NUMQUAD;trapezoidal;M4F2IR;6| |NUMQUAD;atrapezoidal;M4F3IR;3|
              (60 . *) (66 . |coerce|) (|String|) (|OutputPackage|)
              (71 . |output|) (|Boolean|) (77 . =) (83 . <) (89 . /)
              (|Vector| 6) (95 . |setelt|) (|SingleInteger|) (102 . *)
              (108 . |elt|) (114 . >) (120 . *) (126 . |output|)
              (131 . |coerce|) |NUMQUAD;rombergo;M4F2IR;7|
              |NUMQUAD;simpsono;M4F2IR;8| |NUMQUAD;trapezoidalo;M4F2IR;9|)
           '#(|trapezoidalo| 136 |trapezoidal| 147 |simpsono| 158 |simpson| 169
              |rombergo| 180 |romberg| 191 |atrapezoidal| 202 |asimpson| 214
              |aromberg| 226)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 52
                                                 '(0 6 0 7 3 6 0 8 8 9 10 2 6 0
                                                   0 0 11 2 6 0 0 8 12 2 6 0 0
                                                   0 13 1 6 14 0 15 0 6 0 19 3
                                                   20 14 0 8 14 21 1 14 0 22 23
                                                   1 14 24 0 25 1 6 0 0 26 2 6
                                                   0 0 0 32 1 8 14 0 33 2 35 24
                                                   34 14 36 2 6 37 0 0 38 2 6
                                                   37 0 0 39 2 6 0 0 0 40 3 41
                                                   6 0 8 6 42 2 43 0 8 0 44 2
                                                   41 6 0 8 45 2 8 37 0 0 46 2
                                                   8 0 9 0 47 1 35 24 14 48 1
                                                   41 14 0 49 7 0 16 17 6 6 6 6
                                                   8 8 52 7 0 16 17 6 6 6 6 8 8
                                                   30 7 0 16 17 6 6 6 6 8 8 51
                                                   7 0 16 17 6 6 6 6 8 8 28 7 0
                                                   16 17 6 6 6 6 8 8 50 7 0 16
                                                   17 6 6 6 6 8 8 18 8 0 16 17
                                                   6 6 6 6 8 8 8 31 8 0 16 17 6
                                                   6 6 6 8 8 8 29 8 0 16 17 6 6
                                                   6 6 8 8 8 27)))))
           '|lookupComplete|)) 

(MAKEPROP '|NumericalQuadrature| 'NILADIC T) 
