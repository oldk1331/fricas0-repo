
(DEFUN |ALGSC;recip;$U;1| (|x| $) (SPADCALL |x| (QREFELT $ 13))) 

(DEFUN |ALGSC;*;Sm2$;2| (|m| |x| $)
  (SPADCALL (SPADCALL |m| (QREFELT $ 17)) |x| (QREFELT $ 18))) 

(DEFUN |ALGSC;coerce;V$;3| (|v| $) (SPADCALL |v| (QREFELT $ 21))) 

(DEFUN |ALGSC;structuralConstants;V;4| ($) (QREFELT $ 9)) 

(DEFUN |ALGSC;coordinates;$V;5| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 26)) (QREFELT $ 27))) 

(DEFUN |ALGSC;coordinates;$VV;6| (|x| |b| $)
  (PROG (#1=#:G137 |res| |i| |transitionMatrix| |m| #2=#:G132)
    (RETURN
     (SEQ
      (LETT |m|
            (PROG1
                (LETT #2# (SPADCALL |b| (QREFELT $ 31))
                      . #3=(|ALGSC;coordinates;$VV;6|))
              (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
            . #3#)
      (LETT |transitionMatrix|
            (MAKE_MATRIX1 (QREFELT $ 7) |m| (|spadConstant| $ 32)) . #3#)
      (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |m|) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |transitionMatrix| |i|
                       (SPADCALL (SPADCALL |b| |i| (QREFELT $ 33))
                                 (QREFELT $ 28))
                       (QREFELT $ 34))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (LETT |res|
            (SPADCALL |transitionMatrix| (SPADCALL |x| (QREFELT $ 28))
                      (QREFELT $ 38))
            . #3#)
      (COND
       ((NULL (NULL (QCDR |res|)))
        (|error| "coordinates: warning your 'basis' is linearly dependent")))
      (EXIT
       (COND
        ((QEQCAR (QCAR |res|) 1)
         (|error|
          "coordinates: first argument is not in linear span of second argument"))
        ('T
         (PROG2 (LETT #1# (QCAR |res|) . #3#)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 0) (|Vector| (QREFELT $ 6)) #1#))))))))) 

(DEFUN |ALGSC;basis;V;7| ($)
  (PROG (#1=#:G142 #2=#:G145 #3=#:G147 |i| #4=#:G146)
    (RETURN
     (SEQ
      (PROGN
       (LETT #4# (GETREFV #5=(QREFELT $ 7)) . #6=(|ALGSC;basis;V;7|))
       (SEQ (LETT |i| 1 . #6#) (LETT #3# #5# . #6#) (LETT #2# 0 . #6#) G190
            (COND ((|greater_SI| |i| #3#) (GO G191)))
            (SEQ
             (EXIT
              (SETELT #4# #2#
                      (SPADCALL
                       (PROG1 (LETT #1# |i| . #6#)
                         (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                       (QREFELT $ 43)))))
            (LETT #2# (PROG1 (|inc_SI| #2#) (LETT |i| (|inc_SI| |i|) . #6#))
                  . #6#)
            (GO G190) G191 (EXIT NIL))
       #4#))))) 

(DEFUN |ALGSC;someBasis;V;8| ($) (SPADCALL (QREFELT $ 40))) 

(DEFUN |ALGSC;rank;Pi;9| ($) (QREFELT $ 7)) 

(DEFUN |ALGSC;elt;$IR;10| (|x| |i| $) (SPADCALL |x| |i| (QREFELT $ 46))) 

(DEFUN |ALGSC;coerce;$Of;11| (|x| $)
  (PROG (#1=#:G151 |le| |coef| #2=#:G158 |i|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (QREFELT $ 49))
        (SPADCALL (|spadConstant| $ 32) (QREFELT $ 51)))
       ('T
        (SEQ (LETT |le| NIL . #3=(|ALGSC;coerce;$Of;11|))
             (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 7) . #3#) G190
                  (COND ((|greater_SI| |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |coef| (SPADCALL |x| |i| (QREFELT $ 47)) . #3#)
                         (EXIT
                          (COND
                           ((NULL (SPADCALL |coef| (QREFELT $ 52)))
                            (PROGN
                             (LETT #1#
                                   (COND
                                    ((SPADCALL |coef| (|spadConstant| $ 53)
                                               (QREFELT $ 54))
                                     (LETT |le|
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 8) |i|
                                                       (QREFELT $ 57))
                                             (QREFELT $ 58))
                                            |le|)
                                           . #3#))
                                    ('T
                                     (LETT |le|
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |coef| (QREFELT $ 51))
                                             (SPADCALL
                                              (SPADCALL (QREFELT $ 8) |i|
                                                        (QREFELT $ 57))
                                              (QREFELT $ 58))
                                             (QREFELT $ 59))
                                            |le|)
                                           . #3#)))
                                   . #3#)
                             (GO #1#)))))))
                   #1# (EXIT #1#))
                  (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL (ELT $ 60) |le| (QREFELT $ 63)))))))))) 

(DEFUN |ALGSC;*;3$;12| (|x| |y| $)
  (PROG (|h| #1=#:G167 |j| #2=#:G166 |i| #3=#:G165 |k| |v|)
    (RETURN
     (SEQ
      (LETT |v| (MAKEARR1 (QREFELT $ 7) (|spadConstant| $ 32))
            . #4=(|ALGSC;*;3$;12|))
      (SEQ (LETT |k| 1 . #4#) (LETT #3# (QREFELT $ 7) . #4#) G190
           (COND ((|greater_SI| |k| #3#) (GO G191)))
           (SEQ (LETT |h| (|spadConstant| $ 32) . #4#)
                (SEQ (LETT |i| 1 . #4#) (LETT #2# (QREFELT $ 7) . #4#) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1 . #4#) (LETT #1# (QREFELT $ 7) . #4#)
                            G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |h|
                                    (SPADCALL |h|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |x| |i|
                                                          (QREFELT $ 47))
                                                (SPADCALL |y| |j|
                                                          (QREFELT $ 47))
                                                (QREFELT $ 65))
                                               (SPADCALL
                                                (SPADCALL (QREFELT $ 9) |k|
                                                          (QREFELT $ 66))
                                                |i| |j| (QREFELT $ 67))
                                               (QREFELT $ 65))
                                              (QREFELT $ 68))
                                    . #4#)))
                            (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |v| |k| |h| (QREFELT $ 69))))
           (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |v| (QREFELT $ 21))))))) 

(DEFUN |ALGSC;alternative?;B;13| ($)
  (PROG (#1=#:G185 #2=#:G194 |res| #3=#:G208 |l| #4=#:G207 |r| #5=#:G181
         #6=#:G206 #7=#:G205 #8=#:G204 |k| #9=#:G176 #10=#:G203 #11=#:G202
         #12=#:G201 #13=#:G200 |j| #14=#:G170 #15=#:G199 #16=#:G198 #17=#:G197
         #18=#:G196 #19=#:G195 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 1 . #20=(|ALGSC;alternative?;B;13|))
             (LETT #19# (QREFELT $ 7) . #20#) G190
             (COND ((|greater_SI| |i| #19#) (GO G191)))
             (SEQ
              (SEQ (LETT |j| 1 . #20#) (LETT #18# (- |i| 1) . #20#) G190
                   (COND ((|greater_SI| |j| #18#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| |j| . #20#)
                          (LETT #17# (QREFELT $ 7) . #20#) G190
                          (COND ((> |k| #17#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |r| 1 . #20#)
                                 (LETT #16# (QREFELT $ 7) . #20#) G190
                                 (COND ((|greater_SI| |r| #16#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (LETT |res| (|spadConstant| $ 32) . #20#)
                                    (SEQ (LETT |l| 1 . #20#)
                                         (LETT #15# (QREFELT $ 7) . #20#) G190
                                         (COND
                                          ((|greater_SI| |l| #15#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |res|
                                                 (SPADCALL
                                                  (SPADCALL |res|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                               |j| |k|
                                                               (QREFELT $ 67))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                               |k| |j|
                                                               (QREFELT $ 67))
                                                              (QREFELT $ 68))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 66))
                                                              |i| |l|
                                                              (QREFELT $ 67))
                                                             (QREFELT $ 65))
                                                            (QREFELT $ 71))
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 66))
                                                     |i| |j| (QREFELT $ 67))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 66))
                                                     |l| |k| (QREFELT $ 67))
                                                    (QREFELT $ 65))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 66))
                                                     |i| |k| (QREFELT $ 67))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 66))
                                                     |l| |j| (QREFELT $ 67))
                                                    (QREFELT $ 65))
                                                   (QREFELT $ 68))
                                                  (QREFELT $ 68))
                                                 . #20#)))
                                         (LETT |l| (|inc_SI| |l|) . #20#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((NULL (SPADCALL |res| (QREFELT $ 52)))
                                       (PROGN
                                        (LETT #14#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not right alternative"
                                                (QREFELT $ 74))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# 'NIL . #20#)
                                                 (GO #2#))))
                                              . #20#)
                                        (GO #14#)))))))
                                  #14# (EXIT #14#))
                                 (LETT |r| (|inc_SI| |r|) . #20#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |k| (+ |k| 1) . #20#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |j| (|inc_SI| |j|) . #20#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SEQ (LETT |j| |i| . #20#) (LETT #13# (QREFELT $ 7) . #20#) G190
                    (COND ((> |j| #13#) (GO G191)))
                    (SEQ
                     (SEQ (LETT |k| 1 . #20#) (LETT #12# (- |j| 1) . #20#) G190
                          (COND ((|greater_SI| |k| #12#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |r| 1 . #20#)
                                 (LETT #11# (QREFELT $ 7) . #20#) G190
                                 (COND ((|greater_SI| |r| #11#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (LETT |res| (|spadConstant| $ 32) . #20#)
                                    (SEQ (LETT |l| 1 . #20#)
                                         (LETT #10# (QREFELT $ 7) . #20#) G190
                                         (COND
                                          ((|greater_SI| |l| #10#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |res|
                                                 (SPADCALL
                                                  (SPADCALL |res|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                               |i| |j|
                                                               (QREFELT $ 67))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                               |j| |i|
                                                               (QREFELT $ 67))
                                                              (QREFELT $ 68))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 66))
                                                              |l| |k|
                                                              (QREFELT $ 67))
                                                             (QREFELT $ 65))
                                                            (QREFELT $ 68))
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 66))
                                                     |j| |k| (QREFELT $ 67))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 66))
                                                     |i| |l| (QREFELT $ 67))
                                                    (QREFELT $ 65))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 66))
                                                     |i| |k| (QREFELT $ 67))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 66))
                                                     |j| |l| (QREFELT $ 67))
                                                    (QREFELT $ 65))
                                                   (QREFELT $ 68))
                                                  (QREFELT $ 71))
                                                 . #20#)))
                                         (LETT |l| (|inc_SI| |l|) . #20#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((NULL (SPADCALL |res| (QREFELT $ 52)))
                                       (PROGN
                                        (LETT #9#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not left alternative"
                                                (QREFELT $ 74))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# 'NIL . #20#)
                                                 (GO #2#))))
                                              . #20#)
                                        (GO #9#)))))))
                                  #9# (EXIT #9#))
                                 (LETT |r| (|inc_SI| |r|) . #20#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |k| (|inc_SI| |k|) . #20#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT
                      (SEQ (LETT |k| |j| . #20#)
                           (LETT #8# (QREFELT $ 7) . #20#) G190
                           (COND ((> |k| #8#) (GO G191)))
                           (SEQ
                            (SEQ (LETT |r| 1 . #20#)
                                 (LETT #7# (QREFELT $ 7) . #20#) G190
                                 (COND ((|greater_SI| |r| #7#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (LETT |res| (|spadConstant| $ 32) . #20#)
                                    (SEQ (LETT |l| 1 . #20#)
                                         (LETT #6# (QREFELT $ 7) . #20#) G190
                                         (COND
                                          ((|greater_SI| |l| #6#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |res|
                                                 (SPADCALL
                                                  (SPADCALL |res|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                               |i| |j|
                                                               (QREFELT $ 67))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                               |j| |i|
                                                               (QREFELT $ 67))
                                                              (QREFELT $ 68))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 66))
                                                              |l| |k|
                                                              (QREFELT $ 67))
                                                             (QREFELT $ 65))
                                                            (QREFELT $ 68))
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 66))
                                                     |j| |k| (QREFELT $ 67))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 66))
                                                     |i| |l| (QREFELT $ 67))
                                                    (QREFELT $ 65))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 66))
                                                     |i| |k| (QREFELT $ 67))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 66))
                                                     |j| |l| (QREFELT $ 67))
                                                    (QREFELT $ 65))
                                                   (QREFELT $ 68))
                                                  (QREFELT $ 71))
                                                 . #20#)))
                                         (LETT |l| (|inc_SI| |l|) . #20#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((NULL (SPADCALL |res| (QREFELT $ 52)))
                                       (PROGN
                                        (LETT #5#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not left alternative"
                                                (QREFELT $ 74))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# 'NIL . #20#)
                                                 (GO #2#))))
                                              . #20#)
                                        (GO #5#)))))))
                                  #5# (EXIT #5#))
                                 (LETT |r| (|inc_SI| |r|) . #20#) (GO G190)
                                 G191 (EXIT NIL))
                            (EXIT
                             (SEQ (LETT |r| 1 . #20#)
                                  (LETT #4# (QREFELT $ 7) . #20#) G190
                                  (COND ((|greater_SI| |r| #4#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (LETT |res| (|spadConstant| $ 32) . #20#)
                                     (SEQ (LETT |l| 1 . #20#)
                                          (LETT #3# (QREFELT $ 7) . #20#) G190
                                          (COND
                                           ((|greater_SI| |l| #3#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |res|
                                                  (SPADCALL
                                                   (SPADCALL |res|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          66))
                                                                |j| |k|
                                                                (QREFELT $ 67))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          66))
                                                                |k| |j|
                                                                (QREFELT $ 67))
                                                               (QREFELT $ 68))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                               |i| |l|
                                                               (QREFELT $ 67))
                                                              (QREFELT $ 65))
                                                             (QREFELT $ 71))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                      |i| |j| (QREFELT $ 67))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                      |l| |k| (QREFELT $ 67))
                                                     (QREFELT $ 65))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                      |i| |k| (QREFELT $ 67))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                      |l| |j| (QREFELT $ 67))
                                                     (QREFELT $ 65))
                                                    (QREFELT $ 68))
                                                   (QREFELT $ 68))
                                                  . #20#)))
                                          (LETT |l| (|inc_SI| |l|) . #20#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 52)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not right alternative"
                                                 (QREFELT $ 74))
                                                (EXIT
                                                 (PROGN
                                                  (LETT #2# 'NIL . #20#)
                                                  (GO #2#))))
                                               . #20#)
                                         (GO #1#)))))))
                                   #1# (EXIT #1#))
                                  (LETT |r| (|inc_SI| |r|) . #20#) (GO G190)
                                  G191 (EXIT NIL))))
                           (LETT |k| (+ |k| 1) . #20#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |j| (+ |j| 1) . #20#) (GO G190) G191 (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191 (EXIT NIL))
        (SPADCALL
         "algebra satisfies 2*associator(a,b,b) = 0 = 2*associator(a,a,b) = 0"
         (QREFELT $ 74))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;associative?;B;14| ($)
  (PROG (#1=#:G211 #2=#:G217 |res| #3=#:G222 |l| #4=#:G221 |r| #5=#:G220 |k|
         #6=#:G219 |j| #7=#:G218 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 1 . #8=(|ALGSC;associative?;B;14|))
             (LETT #7# (QREFELT $ 7) . #8#) G190
             (COND ((|greater_SI| |i| #7#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #8#) (LETT #6# (QREFELT $ 7) . #8#) G190
                    (COND ((|greater_SI| |j| #6#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #8#) (LETT #5# (QREFELT $ 7) . #8#)
                           G190 (COND ((|greater_SI| |k| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |r| 1 . #8#)
                                  (LETT #4# (QREFELT $ 7) . #8#) G190
                                  (COND ((|greater_SI| |r| #4#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (LETT |res| (|spadConstant| $ 32) . #8#)
                                     (SEQ (LETT |l| 1 . #8#)
                                          (LETT #3# (QREFELT $ 7) . #8#) G190
                                          (COND
                                           ((|greater_SI| |l| #3#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |res|
                                                  (SPADCALL
                                                   (SPADCALL |res|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                               |i| |j|
                                                               (QREFELT $ 67))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                               |l| |k|
                                                               (QREFELT $ 67))
                                                              (QREFELT $ 65))
                                                             (QREFELT $ 68))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 66))
                                                     |j| |k| (QREFELT $ 67))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 66))
                                                     |i| |l| (QREFELT $ 67))
                                                    (QREFELT $ 65))
                                                   (QREFELT $ 71))
                                                  . #8#)))
                                          (LETT |l| (|inc_SI| |l|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 52)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not associative"
                                                 (QREFELT $ 74))
                                                (EXIT
                                                 (PROGN
                                                  (LETT #2# 'NIL . #8#)
                                                  (GO #2#))))
                                               . #8#)
                                         (GO #1#)))))))
                                   #1# (EXIT #1#))
                                  (LETT |r| (|inc_SI| |r|) . #8#) (GO G190)
                                  G191 (EXIT NIL))))
                           (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is associative" (QREFELT $ 74)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;antiAssociative?;B;15| ($)
  (PROG (#1=#:G225 #2=#:G231 |res| #3=#:G236 |l| #4=#:G235 |r| #5=#:G234 |k|
         #6=#:G233 |j| #7=#:G232 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 1 . #8=(|ALGSC;antiAssociative?;B;15|))
             (LETT #7# (QREFELT $ 7) . #8#) G190
             (COND ((|greater_SI| |i| #7#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #8#) (LETT #6# (QREFELT $ 7) . #8#) G190
                    (COND ((|greater_SI| |j| #6#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #8#) (LETT #5# (QREFELT $ 7) . #8#)
                           G190 (COND ((|greater_SI| |k| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |r| 1 . #8#)
                                  (LETT #4# (QREFELT $ 7) . #8#) G190
                                  (COND ((|greater_SI| |r| #4#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (LETT |res| (|spadConstant| $ 32) . #8#)
                                     (SEQ (LETT |l| 1 . #8#)
                                          (LETT #3# (QREFELT $ 7) . #8#) G190
                                          (COND
                                           ((|greater_SI| |l| #3#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |res|
                                                  (SPADCALL
                                                   (SPADCALL |res|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                               |i| |j|
                                                               (QREFELT $ 67))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                               |l| |k|
                                                               (QREFELT $ 67))
                                                              (QREFELT $ 65))
                                                             (QREFELT $ 68))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 66))
                                                     |j| |k| (QREFELT $ 67))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 66))
                                                     |i| |l| (QREFELT $ 67))
                                                    (QREFELT $ 65))
                                                   (QREFELT $ 68))
                                                  . #8#)))
                                          (LETT |l| (|inc_SI| |l|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 52)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not anti-associative"
                                                 (QREFELT $ 74))
                                                (EXIT
                                                 (PROGN
                                                  (LETT #2# 'NIL . #8#)
                                                  (GO #2#))))
                                               . #8#)
                                         (GO #1#)))))))
                                   #1# (EXIT #1#))
                                  (LETT |r| (|inc_SI| |r|) . #8#) (GO G190)
                                  G191 (EXIT NIL))))
                           (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is anti-associative" (QREFELT $ 74)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;commutative?;B;16| ($)
  (PROG (#1=#:G239 #2=#:G243 #3=#:G246 |k| #4=#:G245 |j| #5=#:G244 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 1 . #6=(|ALGSC;commutative?;B;16|))
             (LETT #5# (QREFELT $ 7) . #6#) G190
             (COND ((|greater_SI| |i| #5#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| (+ |i| 1) . #6#) (LETT #4# (QREFELT $ 7) . #6#)
                    G190 (COND ((> |j| #4#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #6#) (LETT #3# (QREFELT $ 7) . #6#)
                           G190 (COND ((|greater_SI| |k| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (QREFELT $ 9) |k| (QREFELT $ 66))
                                  |i| |j| (QREFELT $ 67))
                                 (SPADCALL
                                  (SPADCALL (QREFELT $ 9) |k| (QREFELT $ 66))
                                  |j| |i| (QREFELT $ 67))
                                 (QREFELT $ 54)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL "algebra is not commutative"
                                                 (QREFELT $ 74))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# 'NIL . #6#)
                                         (GO #2#))))
                                      . #6#)
                                (GO #1#))))))
                           (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                           (EXIT NIL)))
                     #1# (EXIT #1#))
                    (LETT |j| (+ |j| 1) . #6#) (GO G190) G191 (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is commutative" (QREFELT $ 74)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;antiCommutative?;B;17| ($)
  (PROG (#1=#:G249 #2=#:G253 #3=#:G256 |k| #4=#:G255 |j| #5=#:G254 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 1 . #6=(|ALGSC;antiCommutative?;B;17|))
             (LETT #5# (QREFELT $ 7) . #6#) G190
             (COND ((|greater_SI| |i| #5#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| |i| . #6#) (LETT #4# (QREFELT $ 7) . #6#) G190
                    (COND ((> |j| #4#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #6#) (LETT #3# (QREFELT $ 7) . #6#)
                           G190 (COND ((|greater_SI| |k| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL
                                 (COND
                                  ((EQL |i| |j|)
                                   (SPADCALL
                                    (SPADCALL (QREFELT $ 9) |k| (QREFELT $ 66))
                                    |i| |i| (QREFELT $ 67)))
                                  ('T
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QREFELT $ 9) |k|
                                               (QREFELT $ 66))
                                     |i| |j| (QREFELT $ 67))
                                    (SPADCALL
                                     (SPADCALL (QREFELT $ 9) |k|
                                               (QREFELT $ 66))
                                     |j| |i| (QREFELT $ 67))
                                    (QREFELT $ 68))))
                                 (QREFELT $ 52)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL
                                        "algebra is not anti-commutative"
                                        (QREFELT $ 74))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# 'NIL . #6#)
                                         (GO #2#))))
                                      . #6#)
                                (GO #1#))))))
                           (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                           (EXIT NIL)))
                     #1# (EXIT #1#))
                    (LETT |j| (+ |j| 1) . #6#) (GO G190) G191 (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is anti-commutative" (QREFELT $ 74)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;leftAlternative?;B;18| ($)
  (PROG (#1=#:G259 #2=#:G265 |res| #3=#:G270 |l| #4=#:G269 |r| #5=#:G268 |k|
         #6=#:G267 |j| #7=#:G266 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 1 . #8=(|ALGSC;leftAlternative?;B;18|))
             (LETT #7# (QREFELT $ 7) . #8#) G190
             (COND ((|greater_SI| |i| #7#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| |i| . #8#) (LETT #6# (QREFELT $ 7) . #8#) G190
                    (COND ((> |j| #6#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #8#) (LETT #5# (QREFELT $ 7) . #8#)
                           G190 (COND ((|greater_SI| |k| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |r| 1 . #8#)
                                  (LETT #4# (QREFELT $ 7) . #8#) G190
                                  (COND ((|greater_SI| |r| #4#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (LETT |res| (|spadConstant| $ 32) . #8#)
                                     (SEQ (LETT |l| 1 . #8#)
                                          (LETT #3# (QREFELT $ 7) . #8#) G190
                                          (COND
                                           ((|greater_SI| |l| #3#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |res|
                                                  (SPADCALL
                                                   (SPADCALL |res|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          66))
                                                                |i| |j|
                                                                (QREFELT $ 67))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          66))
                                                                |j| |i|
                                                                (QREFELT $ 67))
                                                               (QREFELT $ 68))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                               |l| |k|
                                                               (QREFELT $ 67))
                                                              (QREFELT $ 65))
                                                             (QREFELT $ 68))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                      |j| |k| (QREFELT $ 67))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                      |i| |l| (QREFELT $ 67))
                                                     (QREFELT $ 65))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                      |i| |k| (QREFELT $ 67))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                      |j| |l| (QREFELT $ 67))
                                                     (QREFELT $ 65))
                                                    (QREFELT $ 68))
                                                   (QREFELT $ 71))
                                                  . #8#)))
                                          (LETT |l| (|inc_SI| |l|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 52)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not left alternative"
                                                 (QREFELT $ 74))
                                                (EXIT
                                                 (PROGN
                                                  (LETT #2# 'NIL . #8#)
                                                  (GO #2#))))
                                               . #8#)
                                         (GO #1#)))))))
                                   #1# (EXIT #1#))
                                  (LETT |r| (|inc_SI| |r|) . #8#) (GO G190)
                                  G191 (EXIT NIL))))
                           (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |j| (+ |j| 1) . #8#) (GO G190) G191 (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is left alternative" (QREFELT $ 74)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;rightAlternative?;B;19| ($)
  (PROG (#1=#:G273 #2=#:G279 |res| #3=#:G284 |l| #4=#:G283 |r| #5=#:G282 |k|
         #6=#:G281 |j| #7=#:G280 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 1 . #8=(|ALGSC;rightAlternative?;B;19|))
             (LETT #7# (QREFELT $ 7) . #8#) G190
             (COND ((|greater_SI| |i| #7#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #8#) (LETT #6# (QREFELT $ 7) . #8#) G190
                    (COND ((|greater_SI| |j| #6#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| |j| . #8#) (LETT #5# (QREFELT $ 7) . #8#)
                           G190 (COND ((> |k| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |r| 1 . #8#)
                                  (LETT #4# (QREFELT $ 7) . #8#) G190
                                  (COND ((|greater_SI| |r| #4#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (LETT |res| (|spadConstant| $ 32) . #8#)
                                     (SEQ (LETT |l| 1 . #8#)
                                          (LETT #3# (QREFELT $ 7) . #8#) G190
                                          (COND
                                           ((|greater_SI| |l| #3#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |res|
                                                  (SPADCALL
                                                   (SPADCALL |res|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          66))
                                                                |j| |k|
                                                                (QREFELT $ 67))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          66))
                                                                |k| |j|
                                                                (QREFELT $ 67))
                                                               (QREFELT $ 68))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                               |i| |l|
                                                               (QREFELT $ 67))
                                                              (QREFELT $ 65))
                                                             (QREFELT $ 71))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                      |i| |j| (QREFELT $ 67))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                      |l| |k| (QREFELT $ 67))
                                                     (QREFELT $ 65))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                      |i| |k| (QREFELT $ 67))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                      |l| |j| (QREFELT $ 67))
                                                     (QREFELT $ 65))
                                                    (QREFELT $ 68))
                                                   (QREFELT $ 68))
                                                  . #8#)))
                                          (LETT |l| (|inc_SI| |l|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 52)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not right alternative"
                                                 (QREFELT $ 74))
                                                (EXIT
                                                 (PROGN
                                                  (LETT #2# 'NIL . #8#)
                                                  (GO #2#))))
                                               . #8#)
                                         (GO #1#)))))))
                                   #1# (EXIT #1#))
                                  (LETT |r| (|inc_SI| |r|) . #8#) (GO G190)
                                  G191 (EXIT NIL))))
                           (LETT |k| (+ |k| 1) . #8#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is right alternative" (QREFELT $ 74)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;flexible?;B;20| ($)
  (PROG (#1=#:G287 #2=#:G293 |res| #3=#:G298 |l| #4=#:G297 |r| #5=#:G296 |k|
         #6=#:G295 |j| #7=#:G294 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 1 . #8=(|ALGSC;flexible?;B;20|))
             (LETT #7# (QREFELT $ 7) . #8#) G190
             (COND ((|greater_SI| |i| #7#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #8#) (LETT #6# (QREFELT $ 7) . #8#) G190
                    (COND ((|greater_SI| |j| #6#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| |i| . #8#) (LETT #5# (QREFELT $ 7) . #8#)
                           G190 (COND ((> |k| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |r| 1 . #8#)
                                  (LETT #4# (QREFELT $ 7) . #8#) G190
                                  (COND ((|greater_SI| |r| #4#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (LETT |res| (|spadConstant| $ 32) . #8#)
                                     (SEQ (LETT |l| 1 . #8#)
                                          (LETT #3# (QREFELT $ 7) . #8#) G190
                                          (COND
                                           ((|greater_SI| |l| #3#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |res|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |res|
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QREFELT $ 9)
                                                                  |l|
                                                                  (QREFELT $
                                                                           66))
                                                                 |i| |j|
                                                                 (QREFELT $
                                                                          67))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QREFELT $ 9)
                                                                  |r|
                                                                  (QREFELT $
                                                                           66))
                                                                 |l| |k|
                                                                 (QREFELT $
                                                                          67))
                                                                (QREFELT $ 65))
                                                               (QREFELT $ 68))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          66))
                                                       |j| |k| (QREFELT $ 67))
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 9)
                                                                 |r|
                                                                 (QREFELT $
                                                                          66))
                                                       |i| |l| (QREFELT $ 67))
                                                      (QREFELT $ 65))
                                                     (QREFELT $ 71))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                      |k| |j| (QREFELT $ 67))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                      |l| |i| (QREFELT $ 67))
                                                     (QREFELT $ 65))
                                                    (QREFELT $ 68))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 66))
                                                     |j| |i| (QREFELT $ 67))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 66))
                                                     |k| |l| (QREFELT $ 67))
                                                    (QREFELT $ 65))
                                                   (QREFELT $ 71))
                                                  . #8#)))
                                          (LETT |l| (|inc_SI| |l|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 52)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not flexible"
                                                 (QREFELT $ 74))
                                                (EXIT
                                                 (PROGN
                                                  (LETT #2# 'NIL . #8#)
                                                  (GO #2#))))
                                               . #8#)
                                         (GO #1#)))))))
                                   #1# (EXIT #1#))
                                  (LETT |r| (|inc_SI| |r|) . #8#) (GO G190)
                                  G191 (EXIT NIL))))
                           (LETT |k| (+ |k| 1) . #8#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is flexible" (QREFELT $ 74)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;lieAdmissible?;B;21| ($)
  (PROG (#1=#:G301 #2=#:G307 |res| #3=#:G312 |l| #4=#:G311 |r| #5=#:G310 |k|
         #6=#:G309 |j| #7=#:G308 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 1 . #8=(|ALGSC;lieAdmissible?;B;21|))
             (LETT #7# (QREFELT $ 7) . #8#) G190
             (COND ((|greater_SI| |i| #7#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #8#) (LETT #6# (QREFELT $ 7) . #8#) G190
                    (COND ((|greater_SI| |j| #6#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #8#) (LETT #5# (QREFELT $ 7) . #8#)
                           G190 (COND ((|greater_SI| |k| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |r| 1 . #8#)
                                  (LETT #4# (QREFELT $ 7) . #8#) G190
                                  (COND ((|greater_SI| |r| #4#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (LETT |res| (|spadConstant| $ 32) . #8#)
                                     (SEQ (LETT |l| 1 . #8#)
                                          (LETT #3# (QREFELT $ 7) . #8#) G190
                                          (COND
                                           ((|greater_SI| |l| #3#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |res|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |res|
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QREFELT $ 9)
                                                                  |l|
                                                                  (QREFELT $
                                                                           66))
                                                                 |i| |j|
                                                                 (QREFELT $
                                                                          67))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QREFELT $ 9)
                                                                  |l|
                                                                  (QREFELT $
                                                                           66))
                                                                 |j| |i|
                                                                 (QREFELT $
                                                                          67))
                                                                (QREFELT $ 71))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QREFELT $ 9)
                                                                  |r|
                                                                  (QREFELT $
                                                                           66))
                                                                 |l| |k|
                                                                 (QREFELT $
                                                                          67))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QREFELT $ 9)
                                                                  |r|
                                                                  (QREFELT $
                                                                           66))
                                                                 |k| |l|
                                                                 (QREFELT $
                                                                          67))
                                                                (QREFELT $ 71))
                                                               (QREFELT $ 65))
                                                              (QREFELT $ 68))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          66))
                                                       |j| |k| (QREFELT $ 67))
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          66))
                                                       |k| |j| (QREFELT $ 67))
                                                      (QREFELT $ 71))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 9)
                                                                 |r|
                                                                 (QREFELT $
                                                                          66))
                                                       |l| |i| (QREFELT $ 67))
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 9)
                                                                 |r|
                                                                 (QREFELT $
                                                                          66))
                                                       |i| |l| (QREFELT $ 67))
                                                      (QREFELT $ 71))
                                                     (QREFELT $ 65))
                                                    (QREFELT $ 68))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                      |k| |i| (QREFELT $ 67))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 66))
                                                      |i| |k| (QREFELT $ 67))
                                                     (QREFELT $ 71))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                      |l| |j| (QREFELT $ 67))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                      |j| |l| (QREFELT $ 67))
                                                     (QREFELT $ 71))
                                                    (QREFELT $ 65))
                                                   (QREFELT $ 68))
                                                  . #8#)))
                                          (LETT |l| (|inc_SI| |l|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 52)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not Lie admissible"
                                                 (QREFELT $ 74))
                                                (EXIT
                                                 (PROGN
                                                  (LETT #2# 'NIL . #8#)
                                                  (GO #2#))))
                                               . #8#)
                                         (GO #1#)))))))
                                   #1# (EXIT #1#))
                                  (LETT |r| (|inc_SI| |r|) . #8#) (GO G190)
                                  G191 (EXIT NIL))))
                           (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is Lie admissible" (QREFELT $ 74)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;jordanAdmissible?;B;22| ($)
  (PROG (#1=#:G320 #2=#:G328 |res| #3=#:G335 |r| #4=#:G334 |l| #5=#:G333 |t|
         #6=#:G332 |w| #7=#:G331 |k| #8=#:G330 |j| #9=#:G329 |i|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((QEQCAR
          (SPADCALL (SPADCALL 2 (|spadConstant| $ 53) (QREFELT $ 84))
                    (QREFELT $ 85))
          1)
         (SEQ
          (SPADCALL
           "this algebra is not Jordan admissible, as 2 is not invertible in the ground ring"
           (QREFELT $ 74))
          (EXIT 'NIL)))
        ('T
         (SEQ
          (SEQ (LETT |i| 1 . #10=(|ALGSC;jordanAdmissible?;B;22|))
               (LETT #9# (QREFELT $ 7) . #10#) G190
               (COND ((|greater_SI| |i| #9#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #10#) (LETT #8# (QREFELT $ 7) . #10#) G190
                      (COND ((|greater_SI| |j| #8#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |k| 1 . #10#)
                             (LETT #7# (QREFELT $ 7) . #10#) G190
                             (COND ((|greater_SI| |k| #7#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |w| 1 . #10#)
                                    (LETT #6# (QREFELT $ 7) . #10#) G190
                                    (COND ((|greater_SI| |w| #6#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ (LETT |t| 1 . #10#)
                                           (LETT #5# (QREFELT $ 7) . #10#) G190
                                           (COND
                                            ((|greater_SI| |t| #5#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SEQ
                                              (LETT |res| (|spadConstant| $ 32)
                                                    . #10#)
                                              (SEQ (LETT |l| 1 . #10#)
                                                   (LETT #4# (QREFELT $ 7)
                                                         . #10#)
                                                   G190
                                                   (COND
                                                    ((|greater_SI| |l| #4#)
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (SEQ (LETT |r| 1 . #10#)
                                                          (LETT #3#
                                                                (QREFELT $ 7)
                                                                . #10#)
                                                          G190
                                                          (COND
                                                           ((|greater_SI| |r|
                                                                          #3#)
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT |res|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |res|
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              $
                                                                              9)
                                                                             |l|
                                                                             (QREFELT
                                                                              $
                                                                              66))
                                                                            |i|
                                                                            |j|
                                                                            (QREFELT
                                                                             $
                                                                             67))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              $
                                                                              9)
                                                                             |l|
                                                                             (QREFELT
                                                                              $
                                                                              66))
                                                                            |j|
                                                                            |i|
                                                                            (QREFELT
                                                                             $
                                                                             67))
                                                                           (QREFELT
                                                                            $
                                                                            68))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              $
                                                                              9)
                                                                             |r|
                                                                             (QREFELT
                                                                              $
                                                                              66))
                                                                            |w|
                                                                            |k|
                                                                            (QREFELT
                                                                             $
                                                                             67))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              $
                                                                              9)
                                                                             |r|
                                                                             (QREFELT
                                                                              $
                                                                              66))
                                                                            |k|
                                                                            |w|
                                                                            (QREFELT
                                                                             $
                                                                             67))
                                                                           (QREFELT
                                                                            $
                                                                            68))
                                                                          (QREFELT
                                                                           $
                                                                           65))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |t|
                                                                            (QREFELT
                                                                             $
                                                                             66))
                                                                           |l|
                                                                           |r|
                                                                           (QREFELT
                                                                            $
                                                                            67))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |t|
                                                                            (QREFELT
                                                                             $
                                                                             66))
                                                                           |r|
                                                                           |l|
                                                                           (QREFELT
                                                                            $
                                                                            67))
                                                                          (QREFELT
                                                                           $
                                                                           68))
                                                                         (QREFELT
                                                                          $
                                                                          65))
                                                                        (QREFELT
                                                                         $ 68))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |r|
                                                                            (QREFELT
                                                                             $
                                                                             66))
                                                                           |w|
                                                                           |k|
                                                                           (QREFELT
                                                                            $
                                                                            67))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |r|
                                                                            (QREFELT
                                                                             $
                                                                             66))
                                                                           |k|
                                                                           |w|
                                                                           (QREFELT
                                                                            $
                                                                            67))
                                                                          (QREFELT
                                                                           $
                                                                           68))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |l|
                                                                            (QREFELT
                                                                             $
                                                                             66))
                                                                           |j|
                                                                           |r|
                                                                           (QREFELT
                                                                            $
                                                                            67))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |l|
                                                                            (QREFELT
                                                                             $
                                                                             66))
                                                                           |r|
                                                                           |j|
                                                                           (QREFELT
                                                                            $
                                                                            67))
                                                                          (QREFELT
                                                                           $
                                                                           68))
                                                                         (QREFELT
                                                                          $
                                                                          65))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            $
                                                                            66))
                                                                          |i|
                                                                          |l|
                                                                          (QREFELT
                                                                           $
                                                                           67))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            $
                                                                            66))
                                                                          |l|
                                                                          |i|
                                                                          (QREFELT
                                                                           $
                                                                           67))
                                                                         (QREFELT
                                                                          $
                                                                          68))
                                                                        (QREFELT
                                                                         $ 65))
                                                                       (QREFELT
                                                                        $ 71))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |l|
                                                                           (QREFELT
                                                                            $
                                                                            66))
                                                                          |w|
                                                                          |j|
                                                                          (QREFELT
                                                                           $
                                                                           67))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |l|
                                                                           (QREFELT
                                                                            $
                                                                            66))
                                                                          |j|
                                                                          |w|
                                                                          (QREFELT
                                                                           $
                                                                           67))
                                                                         (QREFELT
                                                                          $
                                                                          68))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |r|
                                                                           (QREFELT
                                                                            $
                                                                            66))
                                                                          |k|
                                                                          |i|
                                                                          (QREFELT
                                                                           $
                                                                           67))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |r|
                                                                           (QREFELT
                                                                            $
                                                                            66))
                                                                          |i|
                                                                          |k|
                                                                          (QREFELT
                                                                           $
                                                                           67))
                                                                         (QREFELT
                                                                          $
                                                                          68))
                                                                        (QREFELT
                                                                         $ 65))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |t|
                                                                          (QREFELT
                                                                           $
                                                                           66))
                                                                         |l|
                                                                         |r|
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |t|
                                                                          (QREFELT
                                                                           $
                                                                           66))
                                                                         |r|
                                                                         |l|
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (QREFELT
                                                                         $ 68))
                                                                       (QREFELT
                                                                        $ 65))
                                                                      (QREFELT
                                                                       $ 68))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           $
                                                                           66))
                                                                         |k|
                                                                         |i|
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           $
                                                                           66))
                                                                         |k|
                                                                         |i|
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (QREFELT
                                                                         $ 68))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |l|
                                                                          (QREFELT
                                                                           $
                                                                           66))
                                                                         |j|
                                                                         |r|
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |l|
                                                                          (QREFELT
                                                                           $
                                                                           66))
                                                                         |r|
                                                                         |j|
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (QREFELT
                                                                         $ 68))
                                                                       (QREFELT
                                                                        $ 65))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |t|
                                                                         (QREFELT
                                                                          $
                                                                          66))
                                                                        |w| |l|
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |t|
                                                                         (QREFELT
                                                                          $
                                                                          66))
                                                                        |l| |w|
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (QREFELT
                                                                        $ 68))
                                                                      (QREFELT
                                                                       $ 65))
                                                                     (QREFELT $
                                                                              71))
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          $
                                                                          66))
                                                                        |k| |j|
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          $
                                                                          66))
                                                                        |j| |k|
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (QREFELT
                                                                        $ 68))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |r|
                                                                         (QREFELT
                                                                          $
                                                                          66))
                                                                        |i| |w|
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |r|
                                                                         (QREFELT
                                                                          $
                                                                          66))
                                                                        |w| |i|
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (QREFELT
                                                                        $ 68))
                                                                      (QREFELT
                                                                       $ 65))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |t|
                                                                        (QREFELT
                                                                         $ 66))
                                                                       |l| |r|
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |t|
                                                                        (QREFELT
                                                                         $ 66))
                                                                       |r| |l|
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (QREFELT
                                                                       $ 68))
                                                                     (QREFELT $
                                                                              65))
                                                                    (QREFELT $
                                                                             68))
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         $ 66))
                                                                       |i| |w|
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         $ 66))
                                                                       |w| |i|
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (QREFELT
                                                                       $ 68))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         $ 66))
                                                                       |j| |r|
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         $ 66))
                                                                       |r| |j|
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (QREFELT
                                                                       $ 68))
                                                                     (QREFELT $
                                                                              65))
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        $ 9)
                                                                       |t|
                                                                       (QREFELT
                                                                        $ 66))
                                                                      |k| |l|
                                                                      (QREFELT
                                                                       $ 67))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        $ 9)
                                                                       |t|
                                                                       (QREFELT
                                                                        $ 66))
                                                                      |l| |k|
                                                                      (QREFELT
                                                                       $ 67))
                                                                     (QREFELT $
                                                                              68))
                                                                    (QREFELT $
                                                                             65))
                                                                   (QREFELT $
                                                                            71))
                                                                  . #10#)))
                                                          (LETT |r|
                                                                (|inc_SI| |r|)
                                                                . #10#)
                                                          (GO G190) G191
                                                          (EXIT NIL))))
                                                   (LETT |l| (|inc_SI| |l|)
                                                         . #10#)
                                                   (GO G190) G191 (EXIT NIL))
                                              (EXIT
                                               (COND
                                                ((NULL
                                                  (SPADCALL |res|
                                                            (QREFELT $ 52)))
                                                 (PROGN
                                                  (LETT #1#
                                                        (SEQ
                                                         (SPADCALL
                                                          "algebra is not Jordan admissible"
                                                          (QREFELT $ 74))
                                                         (EXIT
                                                          (PROGN
                                                           (LETT #2# 'NIL
                                                                 . #10#)
                                                           (GO #2#))))
                                                        . #10#)
                                                  (GO #1#)))))))
                                            #1# (EXIT #1#))
                                           (LETT |t| (|inc_SI| |t|) . #10#)
                                           (GO G190) G191 (EXIT NIL))))
                                    (LETT |w| (|inc_SI| |w|) . #10#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |k| (|inc_SI| |k|) . #10#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
          (SPADCALL "algebra is Jordan admissible" (QREFELT $ 74))
          (EXIT 'T)))))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;jordanAlgebra?;B;23| ($)
  (PROG (#1=#:G341 #2=#:G353 |res| #3=#:G360 |s| #4=#:G359 |r| #5=#:G358 |t|
         #6=#:G357 |l| #7=#:G356 |k| #8=#:G355 |j| #9=#:G354 |i|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((QEQCAR
          (SPADCALL (SPADCALL 2 (|spadConstant| $ 53) (QREFELT $ 84))
                    (QREFELT $ 85))
          1)
         (SEQ
          (SPADCALL
           "this is not a Jordan algebra, as 2 is not invertible in the ground ring"
           (QREFELT $ 74))
          (EXIT 'NIL)))
        ((SPADCALL (QREFELT $ 78))
         (SEQ
          (SEQ (LETT |i| 1 . #10=(|ALGSC;jordanAlgebra?;B;23|))
               (LETT #9# (QREFELT $ 7) . #10#) G190
               (COND ((|greater_SI| |i| #9#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #10#) (LETT #8# (QREFELT $ 7) . #10#) G190
                      (COND ((|greater_SI| |j| #8#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |k| 1 . #10#)
                             (LETT #7# (QREFELT $ 7) . #10#) G190
                             (COND ((|greater_SI| |k| #7#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| 1 . #10#)
                                    (LETT #6# (QREFELT $ 7) . #10#) G190
                                    (COND ((|greater_SI| |l| #6#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ (LETT |t| 1 . #10#)
                                           (LETT #5# (QREFELT $ 7) . #10#) G190
                                           (COND
                                            ((|greater_SI| |t| #5#) (GO G191)))
                                           (SEQ
                                            (LETT |res| (|spadConstant| $ 32)
                                                  . #10#)
                                            (EXIT
                                             (SEQ (LETT |r| 1 . #10#)
                                                  (LETT #4# (QREFELT $ 7)
                                                        . #10#)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |r| #4#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (SEQ (LETT |s| 1 . #10#)
                                                         (LETT #3#
                                                               (QREFELT $ 7)
                                                               . #10#)
                                                         G190
                                                         (COND
                                                          ((|greater_SI| |s|
                                                                         #3#)
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (SEQ
                                                            (LETT |res|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |res|
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |r|
                                                                            (QREFELT
                                                                             $
                                                                             66))
                                                                           |i|
                                                                           |j|
                                                                           (QREFELT
                                                                            $
                                                                            67))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |s|
                                                                            (QREFELT
                                                                             $
                                                                             66))
                                                                           |l|
                                                                           |k|
                                                                           (QREFELT
                                                                            $
                                                                            67))
                                                                          (QREFELT
                                                                           $
                                                                           65))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            $
                                                                            66))
                                                                          |r|
                                                                          |s|
                                                                          (QREFELT
                                                                           $
                                                                           67))
                                                                         (QREFELT
                                                                          $
                                                                          65))
                                                                        (QREFELT
                                                                         $ 68))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |r|
                                                                           (QREFELT
                                                                            $
                                                                            66))
                                                                          |l|
                                                                          |k|
                                                                          (QREFELT
                                                                           $
                                                                           67))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |s|
                                                                           (QREFELT
                                                                            $
                                                                            66))
                                                                          |j|
                                                                          |r|
                                                                          (QREFELT
                                                                           $
                                                                           67))
                                                                         (QREFELT
                                                                          $
                                                                          65))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |t|
                                                                          (QREFELT
                                                                           $
                                                                           66))
                                                                         |i|
                                                                         |s|
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (QREFELT
                                                                         $ 65))
                                                                       (QREFELT
                                                                        $ 71))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           $
                                                                           66))
                                                                         |l|
                                                                         |j|
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |s|
                                                                          (QREFELT
                                                                           $
                                                                           66))
                                                                         |k|
                                                                         |k|
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (QREFELT
                                                                         $ 65))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |t|
                                                                         (QREFELT
                                                                          $
                                                                          66))
                                                                        |r| |s|
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (QREFELT
                                                                        $ 65))
                                                                      (QREFELT
                                                                       $ 68))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |r|
                                                                         (QREFELT
                                                                          $
                                                                          66))
                                                                        |k| |i|
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |s|
                                                                         (QREFELT
                                                                          $
                                                                          66))
                                                                        |j| |r|
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (QREFELT
                                                                        $ 65))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |t|
                                                                        (QREFELT
                                                                         $ 66))
                                                                       |l| |s|
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (QREFELT
                                                                       $ 65))
                                                                     (QREFELT $
                                                                              71))
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         $ 66))
                                                                       |k| |j|
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |s|
                                                                        (QREFELT
                                                                         $ 66))
                                                                       |i| |k|
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (QREFELT
                                                                       $ 65))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        $ 9)
                                                                       |t|
                                                                       (QREFELT
                                                                        $ 66))
                                                                      |r| |s|
                                                                      (QREFELT
                                                                       $ 67))
                                                                     (QREFELT $
                                                                              65))
                                                                    (QREFELT $
                                                                             68))
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        $ 9)
                                                                       |r|
                                                                       (QREFELT
                                                                        $ 66))
                                                                      |i| |l|
                                                                      (QREFELT
                                                                       $ 67))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        $ 9)
                                                                       |s|
                                                                       (QREFELT
                                                                        $ 66))
                                                                      |j| |r|
                                                                      (QREFELT
                                                                       $ 67))
                                                                     (QREFELT $
                                                                              65))
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (QREFELT
                                                                       $ 9)
                                                                      |t|
                                                                      (QREFELT
                                                                       $ 66))
                                                                     |k| |s|
                                                                     (QREFELT $
                                                                              67))
                                                                    (QREFELT $
                                                                             65))
                                                                   (QREFELT $
                                                                            71))
                                                                  . #10#)
                                                            (EXIT
                                                             (COND
                                                              ((NULL
                                                                (SPADCALL |res|
                                                                          (QREFELT
                                                                           $
                                                                           52)))
                                                               (PROGN
                                                                (LETT #1#
                                                                      (SEQ
                                                                       (SPADCALL
                                                                        "this is not a Jordan algebra"
                                                                        (QREFELT
                                                                         $ 74))
                                                                       (EXIT
                                                                        (PROGN
                                                                         (LETT
                                                                          #2#
                                                                          'NIL
                                                                          . #10#)
                                                                         (GO
                                                                          #2#))))
                                                                      . #10#)
                                                                (GO #1#)))))))
                                                          #1# (EXIT #1#))
                                                         (LETT |s|
                                                               (|inc_SI| |s|)
                                                               . #10#)
                                                         (GO G190) G191
                                                         (EXIT NIL))))
                                                  (LETT |r| (|inc_SI| |r|)
                                                        . #10#)
                                                  (GO G190) G191 (EXIT NIL))))
                                           (LETT |t| (|inc_SI| |t|) . #10#)
                                           (GO G190) G191 (EXIT NIL))))
                                    (LETT |l| (|inc_SI| |l|) . #10#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |k| (|inc_SI| |k|) . #10#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
          (SPADCALL "this is a Jordan algebra" (QREFELT $ 74)) (EXIT 'T)))
        ('T
         (SEQ (SPADCALL "this is not a Jordan algebra" (QREFELT $ 74))
              (EXIT 'NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;jacobiIdentity?;B;24| ($)
  (PROG (#1=#:G363 #2=#:G369 |res| #3=#:G374 |s| #4=#:G373 |r| #5=#:G372 |k|
         #6=#:G371 |j| #7=#:G370 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 1 . #8=(|ALGSC;jacobiIdentity?;B;24|))
             (LETT #7# (QREFELT $ 7) . #8#) G190
             (COND ((|greater_SI| |i| #7#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #8#) (LETT #6# (QREFELT $ 7) . #8#) G190
                    (COND ((|greater_SI| |j| #6#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #8#) (LETT #5# (QREFELT $ 7) . #8#)
                           G190 (COND ((|greater_SI| |k| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |r| 1 . #8#)
                                  (LETT #4# (QREFELT $ 7) . #8#) G190
                                  (COND ((|greater_SI| |r| #4#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (LETT |res| (|spadConstant| $ 32) . #8#)
                                     (SEQ (LETT |s| 1 . #8#)
                                          (LETT #3# (QREFELT $ 7) . #8#) G190
                                          (COND
                                           ((|greater_SI| |s| #3#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |res|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |res|
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $ 9)
                                                                 |r|
                                                                 (QREFELT $
                                                                          66))
                                                                |i| |j|
                                                                (QREFELT $ 67))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $ 9)
                                                                 |s|
                                                                 (QREFELT $
                                                                          66))
                                                                |j| |k|
                                                                (QREFELT $ 67))
                                                               (QREFELT $ 65))
                                                              (QREFELT $ 68))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 66))
                                                      |j| |k| (QREFELT $ 67))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |s|
                                                                (QREFELT $ 66))
                                                      |k| |i| (QREFELT $ 67))
                                                     (QREFELT $ 65))
                                                    (QREFELT $ 68))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 66))
                                                     |k| |i| (QREFELT $ 67))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |s|
                                                               (QREFELT $ 66))
                                                     |i| |j| (QREFELT $ 67))
                                                    (QREFELT $ 65))
                                                   (QREFELT $ 68))
                                                  . #8#)))
                                          (LETT |s| (|inc_SI| |s|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 52)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "Jacobi identity does not hold"
                                                 (QREFELT $ 74))
                                                (EXIT
                                                 (PROGN
                                                  (LETT #2# 'NIL . #8#)
                                                  (GO #2#))))
                                               . #8#)
                                         (GO #1#)))))))
                                   #1# (EXIT #1#))
                                  (LETT |r| (|inc_SI| |r|) . #8#) (GO G190)
                                  G191 (EXIT NIL))))
                           (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "Jacobi identity holds" (QREFELT $ 74)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DECLAIM (NOTINLINE |AlgebraGivenByStructuralConstants;|)) 

(DEFUN |AlgebraGivenByStructuralConstants| (&REST #1=#:G379)
  (PROG ()
    (RETURN
     (PROG (#2=#:G380)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|AlgebraGivenByStructuralConstants|)
                                           '|domainEqualList|)
                . #3=(|AlgebraGivenByStructuralConstants|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |AlgebraGivenByStructuralConstants;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|AlgebraGivenByStructuralConstants|))))))))))) 

(DEFUN |AlgebraGivenByStructuralConstants;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraGivenByStructuralConstants|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$|
            (LIST '|AlgebraGivenByStructuralConstants| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 98) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#1| '(|Field|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|AlgebraGivenByStructuralConstants|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (|DirectProduct| |#2| |#1|))
      $)))) 

(MAKEPROP '|AlgebraGivenByStructuralConstants| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| 7 6) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|) '|Rep|
              (|Union| $ '"failed") (|FiniteRankNonAssociativeAlgebra&| $$ 6)
              (0 . |recip|) |ALGSC;recip;$U;1| (|Matrix| 6)
              (|SquareMatrix| 7 6) (5 . |coerce|) (10 . |apply|)
              |ALGSC;*;Sm2$;2| (|Vector| 6) (16 . |directProduct|)
              |ALGSC;coerce;V$;3| (|Vector| 15) |ALGSC;structuralConstants;V;4|
              (|List| 6) (21 . |entries|) (26 . |vector|)
              |ALGSC;coordinates;$V;5| (|Integer|) (|Vector| $$)
              (31 . |maxIndex|) (36 . |Zero|) (40 . |elt|) (46 . |setColumn!|)
              (|Union| 20 '"failed")
              (|Record| (|:| |particular| 35) (|:| |basis| 93))
              (|LinearSystemMatrixPackage| 6 20 20 15) (53 . |solve|)
              (|Vector| $) |ALGSC;basis;V;7| |ALGSC;coordinates;$VV;6|
              (|PositiveInteger|) (59 . |unitVector|) |ALGSC;someBasis;V;8|
              |ALGSC;rank;Pi;9| (64 . |elt|) |ALGSC;elt;$IR;10| (|Boolean|)
              (70 . |zero?|) (|OutputForm|) (75 . |coerce|) (80 . |zero?|)
              (85 . |One|) (89 . =) (|Symbol|) (|List| 55) (95 . |elt|)
              (101 . |coerce|) (106 . *) (112 . +) (|Mapping| 50 50 50)
              (|List| 50) (118 . |reduce|) |ALGSC;coerce;$Of;11| (124 . *)
              (130 . |elt|) (136 . |elt|) (143 . +) (149 . |setelt|)
              |ALGSC;*;3$;12| (156 . -) (|Void|) (|String|)
              (162 . |messagePrint|) |ALGSC;alternative?;B;13|
              |ALGSC;associative?;B;14| |ALGSC;antiAssociative?;B;15|
              |ALGSC;commutative?;B;16| |ALGSC;antiCommutative?;B;17|
              |ALGSC;leftAlternative?;B;18| |ALGSC;rightAlternative?;B;19|
              |ALGSC;flexible?;B;20| |ALGSC;lieAdmissible?;B;21| (167 . *)
              (173 . |recip|) |ALGSC;jordanAdmissible?;B;22|
              |ALGSC;jordanAlgebra?;B;23| |ALGSC;jacobiIdentity?;B;24|
              (|SparseUnivariatePolynomial| (|Polynomial| 6))
              (|Record| (|:| |particular| $) (|:| |basis| (|List| $)))
              (|Union| 90 '"failed") (|SparseUnivariatePolynomial| 6)
              (|List| 20) (|List| (|Polynomial| 6)) (|NonNegativeInteger|)
              (|SingleInteger|) (|HashState|))
           '#(~= 178 |zero?| 184 |unit| 189 |subtractIfCan| 193
              |structuralConstants| 199 |someBasis| 208 |sample| 212
              |rightUnits| 216 |rightUnit| 220 |rightTraceMatrix| 224
              |rightTrace| 233 |rightRegularRepresentation| 238 |rightRecip|
              249 |rightRankPolynomial| 254 |rightPower| 258 |rightNorm| 264
              |rightMinimalPolynomial| 269 |rightDiscriminant| 274
              |rightCharacteristicPolynomial| 283 |rightAlternative?| 288
              |represents| 292 |recip| 303 |rank| 308 |powerAssociative?| 312
              |plenaryPower| 316 |opposite?| 322 |noncommutativeJordanAlgebra?|
              328 |lieAlgebra?| 332 |lieAdmissible?| 336 |leftUnits| 340
              |leftUnit| 344 |leftTraceMatrix| 348 |leftTrace| 357
              |leftRegularRepresentation| 362 |leftRecip| 373
              |leftRankPolynomial| 378 |leftPower| 382 |leftNorm| 388
              |leftMinimalPolynomial| 393 |leftDiscriminant| 398
              |leftCharacteristicPolynomial| 407 |leftAlternative?| 412 |latex|
              416 |jordanAlgebra?| 421 |jordanAdmissible?| 425
              |jacobiIdentity?| 429 |hashUpdate!| 433 |hash| 439 |flexible?|
              444 |elt| 448 |coordinates| 454 |convert| 476
              |conditionsForIdempotents| 486 |commutator| 495 |commutative?|
              501 |coerce| 505 |basis| 515 |associatorDependence| 519
              |associator| 523 |associative?| 530 |apply| 534 |antiCommutator|
              540 |antiCommutative?| 546 |antiAssociative?| 550 |alternative?|
              554 ^ 558 |Zero| 564 = 568 - 574 + 585 * 591)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1))
                 (CONS
                  '#(|FramedNonAssociativeAlgebra&|
                     |FiniteRankNonAssociativeAlgebra&|
                     |NonAssociativeAlgebra&| |Module&| NIL
                     |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&| NIL
                     |AbelianMonoid&| |AbelianSemiGroup&| |Monad&|
                     |SetCategory&| |BasicType&| NIL NIL)
                  (CONS
                   '#((|FramedNonAssociativeAlgebra| 6)
                      (|FiniteRankNonAssociativeAlgebra| 6)
                      (|NonAssociativeAlgebra| 6) (|Module| 6) (|BiModule| 6 6)
                      (|NonAssociativeRng|) (|LeftModule| (|SquareMatrix| 7 6))
                      (|RightModule| 6) (|LeftModule| 6) (|AbelianGroup|)
                      (|CancellationAbelianMonoid|) (|AbelianMonoid|)
                      (|AbelianSemiGroup|) (|Monad|) (|SetCategory|)
                      (|BasicType|) (|CoercibleTo| 50) (|unitsKnown|))
                   (|makeByteWordVec2| 97
                                       '(1 12 11 0 13 1 16 15 0 17 2 0 0 15 0
                                         18 1 10 0 20 21 1 10 25 0 26 1 20 0 25
                                         27 1 30 29 0 31 0 6 0 32 2 30 2 0 29
                                         33 3 15 0 0 29 20 34 2 37 36 15 20 38
                                         1 10 0 42 43 2 10 6 0 29 46 1 10 48 0
                                         49 1 6 50 0 51 1 6 48 0 52 0 6 0 53 2
                                         6 48 0 0 54 2 56 55 0 29 57 1 55 50 0
                                         58 2 50 0 0 0 59 2 50 0 0 0 60 2 62 50
                                         61 0 63 2 6 0 0 0 65 2 23 15 0 29 66 3
                                         15 6 0 29 29 67 2 6 0 0 0 68 3 20 6 0
                                         29 6 69 2 6 0 0 0 71 1 50 72 73 74 2 6
                                         0 42 0 84 1 6 11 0 85 2 0 48 0 0 1 1 0
                                         48 0 1 0 1 11 1 2 0 11 0 0 1 0 0 23 24
                                         1 0 23 39 1 0 0 39 44 0 0 0 1 0 1 91 1
                                         0 1 11 1 0 0 15 1 1 0 15 39 1 1 0 6 0
                                         1 1 0 15 0 1 2 0 15 0 39 1 1 1 11 0 1
                                         0 2 89 1 2 0 0 0 42 1 1 0 6 0 1 1 1 92
                                         0 1 0 0 6 1 1 0 6 39 1 1 0 92 0 1 0 0
                                         48 81 1 0 0 20 1 2 0 0 20 39 1 1 1 11
                                         0 14 0 0 42 45 0 0 48 1 2 0 0 0 42 1 2
                                         0 48 0 0 1 0 0 48 1 0 0 48 1 0 0 48 83
                                         0 1 91 1 0 1 11 1 0 0 15 1 1 0 15 39 1
                                         1 0 6 0 1 1 0 15 0 1 2 0 15 0 39 1 1 1
                                         11 0 1 0 2 89 1 2 0 0 0 42 1 1 0 6 0 1
                                         1 1 92 0 1 0 0 6 1 1 0 6 39 1 1 0 92 0
                                         1 0 0 48 80 1 0 73 0 1 0 0 48 87 0 0
                                         48 86 0 0 48 88 2 0 97 97 0 1 1 0 96 0
                                         1 0 0 48 82 2 0 6 0 29 47 1 0 15 39 1
                                         1 0 20 0 28 2 0 15 39 39 1 2 0 20 0 39
                                         41 1 0 0 20 1 1 0 20 0 1 0 0 94 1 1 0
                                         94 39 1 2 0 0 0 0 1 0 0 48 78 1 0 0 20
                                         22 1 0 50 0 64 0 0 39 40 0 1 93 1 3 0
                                         0 0 0 0 1 0 0 48 76 2 0 0 15 0 18 2 0
                                         0 0 0 1 0 0 48 79 0 0 48 77 0 0 48 75
                                         2 0 0 0 42 1 0 0 0 1 2 0 48 0 0 1 2 0
                                         0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 16
                                         0 19 2 0 0 6 0 1 2 0 0 0 6 1 2 0 0 0 0
                                         70 2 0 0 29 0 1 2 0 0 95 0 1 2 0 0 42
                                         0 1)))))
           '|lookupComplete|)) 
